@interface CLBSceneExtension
+ (id)clientComponents;
+ (id)hostComponents;
+ (id)settingsExtensions;
@end

@implementation CLBSceneExtension

+ (id)settingsExtensions
{
  id v4 = +[FBSSettingsExtension extensionForProtocol:&OBJC_PROTOCOL___CLBSceneSettings];
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

+ (id)hostComponents
{
  return 0;
}

+ (id)clientComponents
{
  return 0;
}

@end