@interface HUViewControllerTableViewItem
- (Class)mapsToViewClass;
@end

@implementation HUViewControllerTableViewItem

- (Class)mapsToViewClass
{
  return (Class)objc_opt_class();
}

@end