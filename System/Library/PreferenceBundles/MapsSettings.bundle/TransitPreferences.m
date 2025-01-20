@interface TransitPreferences
+ (BOOL)isModeDisabled:(unint64_t)a3 inModes:(unint64_t)a4;
+ (BOOL)isModeDisabled:(unint64_t)a3 inUserDefaults:(id)a4;
+ (unint64_t)disabledModesByTogglingMode:(unint64_t)a3 inModes:(unint64_t)a4;
+ (unint64_t)enabledModesFromDisabled:(unint64_t)a3;
+ (void)toggleMode:(unint64_t)a3 inUserDefaults:(id)a4;
- (BOOL)hasAnyNonStandardPreferences;
- (BOOL)isModeDisabled:(unint64_t)a3;
- (BOOL)showICFares;
- (NSNumber)surchargeOption;
- (TransitPreferences)initWithCopy:(id)a3;
- (TransitPreferences)initWithTransitOptions:(id)a3 defaults:(id)a4;
- (id)_keys;
- (id)_values;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int)sortOption;
- (unint64_t)disabledModes;
- (void)_copyPropertiesTo:(id)a3;
- (void)loadValuesFromDefaults;
- (void)setDisabledModes:(unint64_t)a3;
- (void)setShowICFares:(BOOL)a3;
- (void)setSortOption:(int)a3;
- (void)setSurchargeOption:(id)a3;
@end

@implementation TransitPreferences

- (TransitPreferences)initWithTransitOptions:(id)a3 defaults:(id)a4
{
  id v6 = a3;
  v7 = [(WatchSyncedPreferences *)self initWithDefaults:a4];
  if (v7)
  {
    -[TransitPreferences setSortOption:](v7, "setSortOption:", [v6 prioritization]);
    v8 = [v6 fareOptions];
    v9 = v8;
    if (v8)
    {
      -[TransitPreferences setShowICFares:](v7, "setShowICFares:", [v8 paymentType] == 1);
      if ([v9 hasPreferredSurchargeType])
      {
        v10 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v9 preferredSurchargeType]);
        [(TransitPreferences *)v7 setSurchargeOption:v10];
      }
    }
    if ([v6 avoidedModesCount])
    {
      unint64_t v11 = 0;
      uint64_t v12 = 0;
      do
      {
        switch([v6 avoidedModeAtIndex:v11])
        {
          case 1u:
          case 3u:
            v12 |= 2uLL;
            break;
          case 2u:
            v12 |= 4uLL;
            break;
          case 4u:
            v12 |= 1uLL;
            break;
          case 5u:
            v12 |= 8uLL;
            break;
          default:
            break;
        }
        ++v11;
      }
      while (v11 < (unint64_t)[v6 avoidedModesCount]);
    }
    else
    {
      uint64_t v12 = 0;
    }
    [(TransitPreferences *)v7 setDisabledModes:v12];
  }
  return v7;
}

- (TransitPreferences)initWithCopy:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TransitPreferences;
  v5 = [(WatchSyncedPreferences *)&v8 initWithCopy:v4];
  if (v5)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (v4)
    {
      if (isKindOfClass) {
        [v4 _copyPropertiesTo:v5];
      }
    }
  }

  return v5;
}

- (BOOL)hasAnyNonStandardPreferences
{
  return [(TransitPreferences *)self disabledModes] != 0;
}

- (void)loadValuesFromDefaults
{
  v3 = [(WatchSyncedPreferences *)self defaults];
  -[TransitPreferences setDisabledModes:](self, "setDisabledModes:", (unint64_t)[v3 integerForKey:@"DefaultDisabledTransitModesKey"] & 0xF);

  id v4 = [(WatchSyncedPreferences *)self defaults];
  -[TransitPreferences setSortOption:](self, "setSortOption:", [v4 integerForKey:@"MapsTransitSortOption"]);

  v5 = [(WatchSyncedPreferences *)self defaults];
  id v6 = [v5 objectForKey:@"MapsTransitSurchargeOption"];
  [(TransitPreferences *)self setSurchargeOption:v6];

  v7 = [(WatchSyncedPreferences *)self defaults];
  id v9 = [v7 objectForKey:@"MapsTransitShowICFaresKey"];

  if (v9) {
    id v8 = [v9 BOOLValue];
  }
  else {
    id v8 = &dword_0 + 1;
  }
  [(TransitPreferences *)self setShowICFares:v8];
}

- (id)_keys
{
  return &off_7C358;
}

- (id)_values
{
  v3 = +[NSNumber numberWithUnsignedInteger:[(TransitPreferences *)self disabledModes]];
  v10[0] = v3;
  id v4 = +[NSNumber numberWithInt:[(TransitPreferences *)self sortOption]];
  v10[1] = v4;
  v5 = [(TransitPreferences *)self surchargeOption];
  id v6 = v5;
  if (!v5)
  {
    id v6 = +[NSNull null];
  }
  v10[2] = v6;
  v7 = +[NSNumber numberWithBool:[(TransitPreferences *)self showICFares]];
  v10[3] = v7;
  id v8 = +[NSArray arrayWithObjects:v10 count:4];

  if (!v5) {

  }
  return v8;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[TransitMutablePreferences allocWithZone:a3];
  v5 = [(WatchSyncedPreferences *)self defaults];
  id v6 = [(WatchSyncedPreferences *)v4 initWithDefaults:v5];

  [(TransitPreferences *)self _copyPropertiesTo:v6];
  return v6;
}

- (void)_copyPropertiesTo:(id)a3
{
  id v5 = a3;
  objc_msgSend(v5, "setDisabledModes:", -[TransitPreferences disabledModes](self, "disabledModes"));
  objc_msgSend(v5, "setSortOption:", -[TransitPreferences sortOption](self, "sortOption"));
  id v4 = [(TransitPreferences *)self surchargeOption];
  [v5 setSurchargeOption:v4];

  objc_msgSend(v5, "setShowICFares:", -[TransitPreferences showICFares](self, "showICFares"));
}

- (BOOL)isModeDisabled:(unint64_t)a3
{
  id v5 = objc_opt_class();
  unint64_t v6 = [(TransitPreferences *)self disabledModes];

  return [v5 isModeDisabled:a3 inModes:v6];
}

+ (unint64_t)enabledModesFromDisabled:(unint64_t)a3
{
  return ~a3 & 0xFLL;
}

+ (BOOL)isModeDisabled:(unint64_t)a3 inModes:(unint64_t)a4
{
  return (a4 & a3) != 0;
}

+ (unint64_t)disabledModesByTogglingMode:(unint64_t)a3 inModes:(unint64_t)a4
{
  if ((a4 & a3) != 0) {
    return a4 & ~a3;
  }
  else {
    return a4 | a3;
  }
}

+ (BOOL)isModeDisabled:(unint64_t)a3 inUserDefaults:(id)a4
{
  unint64_t v6 = (unint64_t)[a4 integerForKey:@"DefaultDisabledTransitModesKey"] & 0xF;

  return [a1 isModeDisabled:a3 inModes:v6];
}

+ (void)toggleMode:(unint64_t)a3 inUserDefaults:(id)a4
{
  id v6 = a4;
  id v7 = objc_msgSend(a1, "disabledModesByTogglingMode:inModes:", a3, (unint64_t)objc_msgSend(v6, "integerForKey:", @"DefaultDisabledTransitModesKey") & 0xF);
  [v6 setInteger:v7 forKey:@"DefaultDisabledTransitModesKey"];

  id v8 = +[NSUserDefaults __maps_groupUserDefaults];
  [v8 setInteger:v7 forKey:@"DefaultDisabledTransitModesKey"];
}

- (unint64_t)disabledModes
{
  return self->_disabledModes;
}

- (void)setDisabledModes:(unint64_t)a3
{
  self->_disabledModes = a3;
}

- (int)sortOption
{
  return self->_sortOption;
}

- (void)setSortOption:(int)a3
{
  self->_sortOption = a3;
}

- (NSNumber)surchargeOption
{
  return self->_surchargeOption;
}

- (void)setSurchargeOption:(id)a3
{
}

- (BOOL)showICFares
{
  return self->_showICFares;
}

- (void)setShowICFares:(BOOL)a3
{
  self->_showICFares = a3;
}

- (void).cxx_destruct
{
}

@end