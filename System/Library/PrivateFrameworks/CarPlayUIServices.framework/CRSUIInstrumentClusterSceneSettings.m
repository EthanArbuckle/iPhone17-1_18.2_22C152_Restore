@interface CRSUIInstrumentClusterSceneSettings
- (NSNumber)frameRateLimit;
- (NSString)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)mapStyle;
- (unint64_t)hostedAltScreenPresentationType;
- (unint64_t)itemType;
- (unint64_t)layoutJustification;
- (unint64_t)showsCompass;
- (unint64_t)showsETA;
- (unint64_t)showsSpeedLimit;
@end

@implementation CRSUIInstrumentClusterSceneSettings

- (unint64_t)itemType
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:4293273408];

  unint64_t v4 = [v3 unsignedIntegerValue];
  return v4;
}

- (unint64_t)showsCompass
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:4293273410];

  unint64_t v4 = [v3 unsignedIntegerValue];
  return v4;
}

- (unint64_t)showsSpeedLimit
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:4293273411];

  unint64_t v4 = [v3 unsignedIntegerValue];
  return v4;
}

- (unint64_t)showsETA
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:4293273412];

  unint64_t v4 = [v3 unsignedIntegerValue];
  return v4;
}

- (NSNumber)frameRateLimit
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:3152422722];

  return (NSNumber *)v3;
}

- (int64_t)mapStyle
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:3152422721];

  int64_t v4 = [v3 integerValue];
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  int64_t v4 = +[CRSUIMutableInstrumentClusterSceneSettings allocWithZone:a3];
  return [(FBSSettings *)v4 initWithSettings:self];
}

- (unint64_t)layoutJustification
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:4293273409];

  unint64_t v4 = [v3 unsignedIntegerValue];
  return v4;
}

- (unint64_t)hostedAltScreenPresentationType
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:4293273415];

  unint64_t v4 = [v3 unsignedIntegerValue];
  return v4;
}

- (NSString)description
{
  v3 = (void *)MEMORY[0x263F089D8];
  v15.receiver = self;
  v15.super_class = (Class)CRSUIInstrumentClusterSceneSettings;
  unint64_t v4 = [(FBSSettings *)&v15 description];
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CRSUIInstrumentClusterSceneSettings itemType](self, "itemType"));
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CRSUIInstrumentClusterSceneSettings showsCompass](self, "showsCompass"));
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CRSUIInstrumentClusterSceneSettings showsSpeedLimit](self, "showsSpeedLimit"));
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CRSUIInstrumentClusterSceneSettings showsETA](self, "showsETA"));
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CRSUIInstrumentClusterSceneSettings layoutJustification](self, "layoutJustification"));
  v10 = [v3 stringWithFormat:@"%@: itemType: %@, compass: %@, speedLimit: %@, eta: %@, layoutType: %@", v4, v5, v6, v7, v8, v9];

  v11 = NSString;
  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CRSUIInstrumentClusterSceneSettings hostedAltScreenPresentationType](self, "hostedAltScreenPresentationType"));
  v13 = [v11 stringWithFormat:@"presentationType: %@", v12];
  [v10 appendString:v13];

  return (NSString *)v10;
}

@end