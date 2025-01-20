@interface HUButtonItem
- (Class)mapsToViewClass;
@end

@implementation HUButtonItem

- (Class)mapsToViewClass
{
  return (Class)objc_opt_class();
}

@end