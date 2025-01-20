@interface HUTriggerItem
- (Class)mapsToViewClass;
@end

@implementation HUTriggerItem

- (Class)mapsToViewClass
{
  return (Class)objc_opt_class();
}

@end