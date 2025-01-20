@interface GDEntityTagConfigurationInner
- (GDEntityTagConfigurationInner)init;
@end

@implementation GDEntityTagConfigurationInner

- (GDEntityTagConfigurationInner)init
{
  return (GDEntityTagConfigurationInner *)PersonEntityTaggingService.EntityTagConfiguration.init()();
}

@end