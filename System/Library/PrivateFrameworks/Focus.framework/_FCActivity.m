@interface _FCActivity
- (BOOL)_updateMode:(id)a3;
- (BOOL)isDrivingActivity;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPlaceholder;
- (BOOL)isSleepActivity;
- (BOOL)supportsDiscreteLifetimes;
- (DNDMode)_dndMode;
- (NSArray)activityLifetimeDescriptions;
- (NSDate)activityCreationDate;
- (NSString)activityColorName;
- (NSString)activityDetailText;
- (NSString)activityDisplayName;
- (NSString)activityIdentifier;
- (NSString)activityLifetimesAlternativeDescription;
- (NSString)activitySymbolImageName;
- (NSString)debugDescription;
- (NSString)description;
- (NSURL)activitySettingsURL;
- (NSURL)activitySetupURL;
- (NSUUID)activityUniqueIdentifier;
- (_FCActivity)initWithMode:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)activitySemanticType;
- (unint64_t)hash;
- (void)_setActivityCreationDate:(id)a3;
- (void)_setActivityLifetimeDescriptions:(id)a3;
- (void)_setActivityLifetimesAlternativeDescription:(id)a3;
- (void)_setDndMode:(id)a3;
@end

@implementation _FCActivity

- (NSString)activitySymbolImageName
{
  v2 = [(_FCActivity *)self _dndMode];
  v3 = [v2 symbolImageName];

  return (NSString *)v3;
}

- (NSString)activityDisplayName
{
  v2 = [(_FCActivity *)self _dndMode];
  v3 = [v2 name];

  return (NSString *)v3;
}

- (NSString)activityColorName
{
  v2 = [(_FCActivity *)self _dndMode];
  v3 = [v2 tintColorName];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x263F3A6E0] defaultTintColorName];
  }
  v6 = v5;

  return (NSString *)v6;
}

- (NSString)activityIdentifier
{
  v2 = [(_FCActivity *)self _dndMode];
  v3 = [v2 modeIdentifier];

  return (NSString *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(_FCActivity *)self _dndMode];
  v6 = (void *)[v4 initWithMode:v5];

  v7 = [(_FCActivity *)self activityLifetimeDescriptions];
  [v6 _setActivityLifetimeDescriptions:v7];

  v8 = [(_FCActivity *)self activityLifetimesAlternativeDescription];
  [v6 _setActivityLifetimesAlternativeDescription:v8];

  return v6;
}

- (BOOL)isPlaceholder
{
  v2 = [(_FCActivity *)self _dndMode];
  char v3 = [v2 isPlaceholder];

  return v3;
}

- (DNDMode)_dndMode
{
  return (DNDMode *)objc_getProperty(self, a2, 24, 1);
}

- (_FCActivity)initWithMode:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_FCActivity;
  id v5 = [(_FCActivity *)&v8 init];
  v6 = v5;
  if (v5) {
    [(_FCActivity *)v5 _setDndMode:v4];
  }

  return v6;
}

- (NSString)activityLifetimesAlternativeDescription
{
  return self->_activityLifetimesAlternativeDescription;
}

- (NSArray)activityLifetimeDescriptions
{
  v2 = self;
  objc_sync_enter(v2);
  char v3 = v2->_activityLifetimeDescriptions;
  objc_sync_exit(v2);

  return v3;
}

- (void)_setDndMode:(id)a3
{
}

- (void)_setActivityLifetimesAlternativeDescription:(id)a3
{
  id v8 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if ((BSEqualStrings() & 1) == 0)
  {
    uint64_t v5 = [v8 copy];
    activityLifetimesAlternativeDescription = v4->_activityLifetimesAlternativeDescription;
    v4->_activityLifetimesAlternativeDescription = (NSString *)v5;

    if (v4->_activityLifetimesAlternativeDescription)
    {
      activityLifetimeDescriptions = v4->_activityLifetimeDescriptions;
      v4->_activityLifetimeDescriptions = 0;
    }
  }
  objc_sync_exit(v4);
}

- (void)_setActivityLifetimeDescriptions:(id)a3
{
  id v9 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  p_activityLifetimeDescriptions = (void **)&v4->_activityLifetimeDescriptions;
  if ((BSEqualArrays() & 1) == 0)
  {
    if (v9)
    {
      uint64_t v6 = [objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v9 copyItems:1];
      activityLifetimeDescriptions = v4->_activityLifetimeDescriptions;
      v4->_activityLifetimeDescriptions = (NSArray *)v6;

      p_activityLifetimeDescriptions = (void **)&v4->_activityLifetimesAlternativeDescription;
    }
    id v8 = *p_activityLifetimeDescriptions;
    *p_activityLifetimeDescriptions = 0;
  }
  objc_sync_exit(v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityLifetimesAlternativeDescription, 0);
  objc_storeStrong((id *)&self->_dndMode, 0);
  objc_storeStrong((id *)&self->_activityLifetimeDescriptions, 0);

  objc_storeStrong((id *)&self->_activityCreationDate, 0);
}

- (BOOL)supportsDiscreteLifetimes
{
  return (unint64_t)([(DNDMode *)self->_dndMode semanticType] - 3) < 0xFFFFFFFFFFFFFFFELL;
}

- (BOOL)isDrivingActivity
{
  return [(DNDMode *)self->_dndMode semanticType] == 2;
}

- (BOOL)isSleepActivity
{
  return [(DNDMode *)self->_dndMode semanticType] == 1;
}

- (void)_setActivityCreationDate:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if ((BSEqualObjects() & 1) == 0)
  {
    uint64_t v5 = [v7 copy];
    activityCreationDate = v4->_activityCreationDate;
    v4->_activityCreationDate = (NSDate *)v5;
  }
  objc_sync_exit(v4);
}

- (BOOL)_updateMode:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_FCActivity *)self _dndMode];
  char v6 = BSEqualObjects();
  if ((v6 & 1) == 0) {
    [(_FCActivity *)self _setDndMode:v4];
  }

  return v6 ^ 1;
}

- (NSUUID)activityUniqueIdentifier
{
  v2 = [(_FCActivity *)self _dndMode];
  char v3 = [v2 identifier];

  return (NSUUID *)v3;
}

- (int64_t)activitySemanticType
{
  v2 = [(_FCActivity *)self _dndMode];
  int64_t v3 = [v2 semanticType];

  return v3;
}

- (NSDate)activityCreationDate
{
  v2 = self;
  objc_sync_enter(v2);
  int64_t v3 = v2->_activityCreationDate;
  objc_sync_exit(v2);

  return v3;
}

- (NSString)activityDetailText
{
  v2 = [(_FCActivity *)self _dndMode];
  uint64_t v3 = [v2 semanticType];

  id v4 = 0;
  switch(v3)
  {
    case 0:
      uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      char v6 = v5;
      id v7 = @"ACTIVITY_PERMANENT_DETAIL_TEXT_DEFAULT";
      goto LABEL_7;
    case 1:
      uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      char v6 = v5;
      id v7 = @"ACTIVITY_DETAIL_TEXT_SLEEP";
      goto LABEL_7;
    case 4:
      uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      char v6 = v5;
      id v7 = @"ACTIVITY_DETAIL_TEXT_WORK";
      goto LABEL_7;
    case 5:
      uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      char v6 = v5;
      id v7 = @"ACTIVITY_DETAIL_TEXT_PERSONAL";
      goto LABEL_7;
    case 9:
      uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      char v6 = v5;
      id v7 = @"ACTIVITY_PERMANENT_DETAIL_TEXT_REDUCEINTERRUPTIONS";
LABEL_7:
      id v4 = [v5 localizedStringForKey:v7 value:&stru_26D0B5698 table:@"Focus"];

      break;
    default:
      break;
  }

  return (NSString *)v4;
}

- (NSURL)activitySettingsURL
{
  v2 = [(_FCActivity *)self _dndMode];
  uint64_t v3 = [v2 settingsURL];

  return (NSURL *)v3;
}

- (NSURL)activitySetupURL
{
  v2 = [(_FCActivity *)self _dndMode];
  uint64_t v3 = [v2 setupURL];

  return (NSURL *)v3;
}

- (unint64_t)hash
{
  v2 = [(_FCActivity *)self _dndMode];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_FCActivity *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      char v6 = [(_FCActivity *)self _dndMode];
      id v7 = [(_FCActivity *)v5 _dndMode];

      char v8 = BSEqualObjects();
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (NSString)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(_FCActivity *)self activityIdentifier];
  char v6 = [(_FCActivity *)self activityUniqueIdentifier];
  id v7 = [(_FCActivity *)self activityDisplayName];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; activityIdentifier: %@; activityUniqueIdentifier: %@; activityDisplayName: %@>",
    v4,
    self,
    v5,
    v6,
  char v8 = v7);

  return (NSString *)v8;
}

- (NSString)debugDescription
{
  unint64_t v3 = [(_FCActivity *)self description];
  uint64_t v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = [v4 rangeOfString:@">" options:4];
  char v6 = NSString;
  id v7 = [(_FCActivity *)self activitySymbolImageName];
  char v8 = [(_FCActivity *)self activityColorName];
  [(_FCActivity *)self isPlaceholder];
  id v9 = NSStringFromBOOL();
  v10 = [(_FCActivity *)self activityLifetimeDescriptions];
  uint64_t v11 = [v10 count];
  v12 = NSString;
  if (v11)
  {
    v13 = [(_FCActivity *)self activityLifetimeDescriptions];
    [v12 stringWithFormat:@"activityLifetimeDescriptions: %@", v13];
  }
  else
  {
    v13 = [(_FCActivity *)self activityLifetimesAlternativeDescription];
    [v12 stringWithFormat:@"activityLifetimesAlternativeDescription: %@", v13];
  v14 = };
  objc_msgSend(v6, "stringWithFormat:", @"; activitySymbolImageName: %@; activityColorName: %@; isPlaceholder: %@; %@",
    v7,
    v8,
    v9,
  v15 = v14);
  [v4 insertString:v15 atIndex:v5];

  return (NSString *)v4;
}

@end