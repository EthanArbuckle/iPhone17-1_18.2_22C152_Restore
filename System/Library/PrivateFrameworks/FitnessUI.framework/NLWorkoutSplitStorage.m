@interface NLWorkoutSplitStorage
+ (BOOL)isTesting;
+ (NSUserDefaults)userDefaults;
+ (double)_defaultSplitDistanceForActivityType:(id)a3 userDistanceUnit:(id)a4;
+ (id)_defaultSplit:(id)a3 activityType:(id)a4 userDistanceUnit:(id)a5;
+ (id)distanceSplitForActivityType:(id)a3 userDistanceUnit:(id)a4;
+ (id)mapSplitTypeEnumToString:(int64_t)a3;
+ (id)restoreFromDictionary:(id)a3;
+ (id)restoreFromDictionary:(id)a3 activityType:(id)a4;
+ (id)serializeSplitStorage:(id)a3;
+ (id)splitForActivityType:(id)a3 splitsActivityTypeKey:(id)a4 userDistanceUnit:(id)a5;
+ (id)timeSplitForActivityType:(id)a3;
+ (int64_t)mapSplitTypeStringToEnum:(id)a3;
+ (void)saveSplitStorage:(id)a3 forActivityType:(id)a4;
+ (void)saveSplitStorage:(id)a3 forActivityType:(id)a4 useLegacyUniqueIdentifier:(BOOL)a5;
+ (void)setUserDefaults:(id)a3;
- (BOOL)enabled;
- (BOOL)isEqual:(id)a3;
- (NLWorkoutSplitStorage)initWithType:(int64_t)a3 value:(double)a4;
- (double)value;
- (id)description;
- (int64_t)type;
- (unint64_t)hash;
- (void)setEnabled:(BOOL)a3;
@end

@implementation NLWorkoutSplitStorage

- (NLWorkoutSplitStorage)initWithType:(int64_t)a3 value:(double)a4
{
  v9.receiver = self;
  v9.super_class = (Class)NLWorkoutSplitStorage;
  result = [(NLWorkoutSplitStorage *)&v9 init];
  if (result)
  {
    result->_type = a3;
    result->_value = a4;
    BOOL v8 = a4 > 0.0 && a3 != 0;
    result->_enabled = v8;
  }
  return result;
}

+ (NSUserDefaults)userDefaults
{
  v2 = (void *)_userDefaults;
  if (!_userDefaults)
  {
    uint64_t v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v4 = (void *)_userDefaults;
    _userDefaults = v3;

    v2 = (void *)_userDefaults;
  }
  return (NSUserDefaults *)v2;
}

+ (void)setUserDefaults:(id)a3
{
}

+ (BOOL)isTesting
{
  v2 = (void *)_userDefaults;
  uint64_t v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  LOBYTE(v2) = [v2 isEqual:v3] ^ 1;

  return (char)v2;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (NLWorkoutSplitStorage *)a3;
  if (self == v4)
  {
    char v15 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int64_t v6 = [(NLWorkoutSplitStorage *)self type];
      uint64_t v7 = [(NLWorkoutSplitStorage *)v5 type];
      [(NLWorkoutSplitStorage *)self value];
      double v9 = v8;
      [(NLWorkoutSplitStorage *)v5 value];
      double v11 = v10;
      BOOL v12 = [(NLWorkoutSplitStorage *)self enabled];
      BOOL v13 = [(NLWorkoutSplitStorage *)v5 enabled];

      if (v9 == v11 && v6 == v7) {
        char v15 = v12 ^ v13 ^ 1;
      }
      else {
        char v15 = 0;
      }
    }
    else
    {
      char v15 = 0;
    }
  }

  return v15;
}

- (unint64_t)hash
{
  double v3 = (double)(unint64_t)(31 * [(NLWorkoutSplitStorage *)self type] + 961);
  [(NLWorkoutSplitStorage *)self value];
  return 31 * (unint64_t)(v4 + v3) + [(NLWorkoutSplitStorage *)self enabled];
}

- (id)description
{
  double v3 = NSString;
  int64_t v4 = [(NLWorkoutSplitStorage *)self type];
  v5 = @"NLWorkoutSplitsTypeNone";
  if (v4 == 1) {
    v5 = @"NLWorkoutSplitsTypeDistance";
  }
  if (v4 == 2) {
    v5 = @"NLWorkoutSplitsTypeTime";
  }
  int64_t v6 = v5;
  if ([(NLWorkoutSplitStorage *)self enabled]) {
    uint64_t v7 = @"YES";
  }
  else {
    uint64_t v7 = @"NO";
  }
  [(NLWorkoutSplitStorage *)self value];
  double v9 = [v3 stringWithFormat:@"NLWorkoutSplitStorage(type:%@ enabled:%@ value:%f)", v6, v7, v8];

  return v9;
}

+ (id)_defaultSplit:(id)a3 activityType:(id)a4 userDistanceUnit:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (([v7 isEqualToString:@"DistanceSplitsByActivityType"] & 1) == 0) {
    [v7 isEqualToString:@"TimeSplitsByActivityType"];
  }
  if ([v7 isEqualToString:@"DistanceSplitsByActivityType"])
  {
    +[NLWorkoutSplitStorage _defaultSplitDistanceForActivityType:v8 userDistanceUnit:v9];
    double v11 = v10;
    BOOL v12 = [NLWorkoutSplitStorage alloc];
    uint64_t v13 = 1;
    double v14 = v11;
  }
  else
  {
    BOOL v12 = [NLWorkoutSplitStorage alloc];
    double v14 = 0.0;
    uint64_t v13 = 2;
  }
  char v15 = [(NLWorkoutSplitStorage *)v12 initWithType:v13 value:v14];

  return v15;
}

+ (double)_defaultSplitDistanceForActivityType:(id)a3 userDistanceUnit:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 effectiveTypeIdentifier];
  if ((unint64_t)(v7 - 13) <= 0x3A
    && ((1 << (v7 - 13)) & 0x600808001000800) == 0
    && v7 == 13)
  {
    objc_msgSend(v5, "isIndoor", 1.0);
  }
  id v8 = objc_msgSend(MEMORY[0x263F0A630], "quantityWithUnit:doubleValue:", v6);
  id v9 = [MEMORY[0x263F0A830] meterUnit];
  [v8 doubleValueForUnit:v9];
  double v11 = v10;

  if ([v5 effectiveTypeIdentifier] == 35)
  {
    BOOL v12 = (void *)MEMORY[0x263F0A630];
    uint64_t v13 = [MEMORY[0x263F0A830] meterUnit];
    double v14 = [v12 quantityWithUnit:v13 doubleValue:500.0];
    char v15 = [MEMORY[0x263F0A830] meterUnit];
    [v14 doubleValueForUnit:v15];
    double v11 = v16;
  }
  return v11;
}

+ (id)distanceSplitForActivityType:(id)a3 userDistanceUnit:(id)a4
{
  return +[NLWorkoutSplitStorage splitForActivityType:a3 splitsActivityTypeKey:@"DistanceSplitsByActivityType" userDistanceUnit:a4];
}

+ (id)timeSplitForActivityType:(id)a3
{
  return +[NLWorkoutSplitStorage splitForActivityType:a3 splitsActivityTypeKey:@"TimeSplitsByActivityType" userDistanceUnit:0];
}

+ (id)splitForActivityType:(id)a3 splitsActivityTypeKey:(id)a4 userDistanceUnit:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = +[NLWorkoutSplitStorage userDefaults];
  BOOL v12 = [v11 objectForKey:v9];

  if (v12)
  {
    uint64_t v13 = [a1 restoreFromDictionary:v12 activityType:v8];
    double v14 = v13;
    if (v13)
    {
      if ([v13 enabled])
      {
        _HKInitializeLogging();
        char v15 = *MEMORY[0x263F09970];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09970], OS_LOG_TYPE_DEFAULT))
        {
          int v19 = 138412290;
          v20 = v14;
          _os_log_impl(&dword_21E433000, v15, OS_LOG_TYPE_DEFAULT, "[SplitStorage] Splits supported. Split span: %@", (uint8_t *)&v19, 0xCu);
        }
      }
      id v16 = v14;
    }
    else
    {
      id v16 = +[NLWorkoutSplitStorage _defaultSplit:v9 activityType:v8 userDistanceUnit:v10];
    }
    v17 = v16;
  }
  else
  {
    v17 = +[NLWorkoutSplitStorage _defaultSplit:v9 activityType:v8 userDistanceUnit:v10];
  }

  return v17;
}

+ (id)restoreFromDictionary:(id)a3 activityType:(id)a4
{
  id v5 = a3;
  id v6 = [a4 uniqueIdentifier];
  uint64_t v7 = [v5 objectForKey:v6];

  id v8 = +[NLWorkoutSplitStorage restoreFromDictionary:v7];

  return v8;
}

+ (id)restoreFromDictionary:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [v4 objectForKey:@"type"];
    uint64_t v6 = [a1 mapSplitTypeStringToEnum:v5];
    uint64_t v7 = [v4 objectForKey:@"value"];
    [v7 doubleValue];
    double v9 = v8;

    id v10 = [v4 objectForKey:@"enabled"];

    uint64_t v11 = [v10 isEqualToString:@"true"];
    BOOL v12 = [[NLWorkoutSplitStorage alloc] initWithType:v6 value:v9];
    [(NLWorkoutSplitStorage *)v12 setEnabled:v11];
  }
  else
  {
    BOOL v12 = 0;
  }
  return v12;
}

+ (id)serializeSplitStorage:(id)a3
{
  if (a3)
  {
    double v3 = (void *)MEMORY[0x263EFF9A0];
    id v4 = a3;
    id v5 = [v3 dictionary];
    uint64_t v6 = +[NLWorkoutSplitStorage mapSplitTypeEnumToString:](NLWorkoutSplitStorage, "mapSplitTypeEnumToString:", [v4 type]);
    int v7 = [v4 enabled];
    double v8 = @"false";
    if (v7) {
      double v8 = @"true";
    }
    double v9 = v8;
    [v5 setObject:v6 forKey:@"type"];
    id v10 = NSNumber;
    [v4 value];
    double v12 = v11;

    uint64_t v13 = [v10 numberWithDouble:v12];
    [v5 setObject:v13 forKey:@"value"];

    [v5 setObject:v9 forKey:@"enabled"];
  }
  else
  {
    id v5 = 0;
  }
  double v14 = (void *)[v5 copy];

  return v14;
}

+ (void)saveSplitStorage:(id)a3 forActivityType:(id)a4
{
}

+ (void)saveSplitStorage:(id)a3 forActivityType:(id)a4 useLegacyUniqueIdentifier:(BOOL)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  _HKInitializeLogging();
  double v9 = *MEMORY[0x263F09970];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09970], OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138412290;
    id v24 = v7;
    _os_log_impl(&dword_21E433000, v9, OS_LOG_TYPE_DEFAULT, "[SplitStorage] Saving split values to defaults. split:%@", (uint8_t *)&v23, 0xCu);
  }
  uint64_t v10 = [v7 type];
  if (v10 == 1)
  {
    double v11 = kNLSessionTrackerAppKeyDistanceSplitsByActivityType;
  }
  else
  {
    if (v10 != 2) {
      goto LABEL_16;
    }
    double v11 = &kNLSessionTrackerAppKeyTimeSplitsByActivityType;
  }
  double v12 = *v11;
  if (v12)
  {
    uint64_t v13 = v12;
    double v14 = +[NLWorkoutSplitStorage userDefaults];
    char v15 = [v14 objectForKey:v13];
    id v16 = (void *)[v15 mutableCopy];

    if (!v16)
    {
      id v16 = [MEMORY[0x263EFF9A0] dictionary];
    }
    v17 = +[NLWorkoutSplitStorage serializeSplitStorage:v7];
    if (a5)
    {
      v18 = [v8 workoutActivityType];
      int v19 = [v18 legacyUniqueIdentifier];
    }
    else
    {
      int v19 = [v8 uniqueIdentifier];
    }
    [v16 setObject:v17 forKey:v19];
    v20 = +[NLWorkoutSplitStorage userDefaults];
    [v20 setObject:v16 forKey:v13];

    if (!+[NLWorkoutSplitStorage isTesting]) {
      objc_msgSend(MEMORY[0x263EFFA40], "fu_backupStandardUserDefaultsKey:", v13);
    }
    uint64_t v21 = [MEMORY[0x263F08A00] defaultCenter];
    v22 = [v8 uniqueIdentifier];
    [v21 postNotificationName:@"NLWorkoutSplitStorageSaved" object:v22];
  }
LABEL_16:
}

+ (int64_t)mapSplitTypeStringToEnum:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"distance"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"time"])
  {
    int64_t v4 = 2;
  }
  else
  {
    [v3 isEqualToString:@"none"];
    int64_t v4 = 0;
  }

  return v4;
}

+ (id)mapSplitTypeEnumToString:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return &stru_26CF5F1B8;
  }
  else {
    return off_2644A8768[a3];
  }
}

- (int64_t)type
{
  return self->_type;
}

- (double)value
{
  return self->_value;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

@end