@interface MAGSettingsLoader
+ (Class)internalSettingsViewControllerClass;
- (MAGSettingsLoader)init;
@end

@implementation MAGSettingsLoader

+ (Class)internalSettingsViewControllerClass
{
  type metadata accessor for MAGInternalSettingsViewController();
  return (Class)swift_getObjCClassFromMetadata();
}

- (MAGSettingsLoader)init
{
  v3.receiver = self;
  v3.super_class = (Class)MAGSettingsLoader;
  return [(MAGSettingsLoader *)&v3 init];
}

@end