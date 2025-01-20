@interface CRSUIInstrumentClusterSceneSpecification
- (Class)settingsClass;
@end

@implementation CRSUIInstrumentClusterSceneSpecification

- (Class)settingsClass
{
  return (Class)objc_opt_class();
}

@end