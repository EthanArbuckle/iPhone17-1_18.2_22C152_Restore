@interface HUTriggerHeaderItem
- (Class)mapsToViewClass;
@end

@implementation HUTriggerHeaderItem

- (Class)mapsToViewClass
{
  return (Class)objc_opt_class();
}

@end