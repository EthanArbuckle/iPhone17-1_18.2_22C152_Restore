@interface _RPCCVideoEffect
- (BOOL)_updateEffect:(id)a3;
- (BOOL)isDrivingActivity;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPlaceholder;
- (BOOL)isSleepActivity;
- (BOOL)supportsDiscreteLifetimes;
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
- (NSString)intensityName;
- (NSURL)activitySettingsURL;
- (NSURL)activitySetupURL;
- (NSUUID)activityUniqueIdentifier;
- (RPCCVideoEffect)_effect;
- (_RPCCVideoEffect)initWithMode:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)_setEffect:(id)a3;
@end

@implementation _RPCCVideoEffect

- (_RPCCVideoEffect)initWithMode:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_RPCCVideoEffect;
  v5 = [(_RPCCVideoEffect *)&v8 init];
  v6 = v5;
  if (v5) {
    [(_RPCCVideoEffect *)v5 _setEffect:v4];
  }

  return v6;
}

- (BOOL)supportsDiscreteLifetimes
{
  return 0;
}

- (BOOL)isDrivingActivity
{
  return 0;
}

- (BOOL)isSleepActivity
{
  return 0;
}

- (BOOL)_updateEffect:(id)a3
{
  id v4 = a3;
  v5 = [(_RPCCVideoEffect *)self _effect];
  char v6 = BSEqualObjects();
  if ((v6 & 1) == 0) {
    [(_RPCCVideoEffect *)self _setEffect:v4];
  }

  return v6 ^ 1;
}

- (NSString)activityIdentifier
{
  v2 = [(_RPCCVideoEffect *)self _effect];
  v3 = [v2 effectIdentifier];

  return (NSString *)v3;
}

- (NSUUID)activityUniqueIdentifier
{
  v2 = [(_RPCCVideoEffect *)self _effect];
  v3 = [v2 identifier];

  return (NSUUID *)v3;
}

- (NSString)activityDisplayName
{
  v2 = [(_RPCCVideoEffect *)self _effect];
  v3 = [v2 name];

  return (NSString *)v3;
}

- (NSString)activitySymbolImageName
{
  v2 = [(_RPCCVideoEffect *)self _effect];
  v3 = [v2 symbolImageName];

  return (NSString *)v3;
}

- (NSString)activityColorName
{
  v2 = [(_RPCCVideoEffect *)self _effect];
  v3 = [v2 tintColorName];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = +[RPCCVideoEffect defaultTintColorName];
  }
  char v6 = v5;

  return (NSString *)v6;
}

- (NSString)intensityName
{
  v2 = [(_RPCCVideoEffect *)self _effect];
  v3 = [v2 intensityName];

  return (NSString *)v3;
}

- (NSDate)activityCreationDate
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_activityCreationDate;
  objc_sync_exit(v2);

  return v3;
}

- (NSString)activityDetailText
{
  return (NSString *)@"detail text";
}

- (NSURL)activitySettingsURL
{
  return 0;
}

- (NSURL)activitySetupURL
{
  return 0;
}

- (BOOL)isPlaceholder
{
  return 0;
}

- (NSArray)activityLifetimeDescriptions
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_activityLifetimeDescriptions;
  objc_sync_exit(v2);

  return v3;
}

- (unint64_t)hash
{
  v2 = [(_RPCCVideoEffect *)self _effect];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_RPCCVideoEffect *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      char v6 = [(_RPCCVideoEffect *)self _effect];
      v7 = [(_RPCCVideoEffect *)v5 _effect];

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
  uint64_t v3 = objc_opt_class();
  id v4 = [(_RPCCVideoEffect *)self activityIdentifier];
  id v5 = [(_RPCCVideoEffect *)self activityUniqueIdentifier];
  char v6 = [(_RPCCVideoEffect *)self activityDisplayName];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p; activityIdentifier: %@; activityUniqueIdentifier: %@; activityDisplayName: %@>",
    v3,
    self,
    v4,
    v5,
  v7 = v6);

  return (NSString *)v7;
}

- (NSString)debugDescription
{
  uint64_t v3 = [(_RPCCVideoEffect *)self description];
  id v4 = [v3 mutableCopy];

  id v5 = [v4 rangeOfString:@">" options:4];
  char v6 = [(_RPCCVideoEffect *)self activitySymbolImageName];
  v7 = [(_RPCCVideoEffect *)self activityColorName];
  [(_RPCCVideoEffect *)self isPlaceholder];
  char v8 = NSStringFromBOOL();
  v9 = [(_RPCCVideoEffect *)self activityLifetimeDescriptions];
  if ([v9 count])
  {
    v10 = [(_RPCCVideoEffect *)self activityLifetimeDescriptions];
    +[NSString stringWithFormat:@"activityLifetimeDescriptions: %@", v10];
  }
  else
  {
    v10 = [(_RPCCVideoEffect *)self activityLifetimesAlternativeDescription];
    +[NSString stringWithFormat:@"activityLifetimesAlternativeDescription: %@", v10];
  v11 = };
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"; activitySymbolImageName: %@; activityColorName: %@; isPlaceholder: %@; %@",
    v6,
    v7,
    v8,
  v12 = v11);
  [v4 insertString:v12 atIndex:v5];

  return (NSString *)v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(_RPCCVideoEffect *)self _effect];
  id v6 = [v4 initWithMode:v5];

  v7 = [(_RPCCVideoEffect *)self activityLifetimeDescriptions];
  [v6 _setActivityLifetimeDescriptions:v7];

  char v8 = [(_RPCCVideoEffect *)self activityLifetimesAlternativeDescription];
  [v6 _setActivityLifetimesAlternativeDescription:v8];

  return v6;
}

- (RPCCVideoEffect)_effect
{
  return (RPCCVideoEffect *)objc_getProperty(self, a2, 24, 1);
}

- (void)_setEffect:(id)a3
{
}

- (NSString)activityLifetimesAlternativeDescription
{
  return self->_activityLifetimesAlternativeDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityLifetimesAlternativeDescription, 0);
  objc_storeStrong((id *)&self->_effect, 0);
  objc_storeStrong((id *)&self->_activityLifetimeDescriptions, 0);

  objc_storeStrong((id *)&self->_activityCreationDate, 0);
}

@end