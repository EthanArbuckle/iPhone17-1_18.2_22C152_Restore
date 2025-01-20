@interface UIViewController
- (ServiceBridgedNavigationItem)su_bridgedNavigationItem;
- (void)su_setBridgedNavigationItem:(id)a3;
@end

@implementation UIViewController

- (void)su_setBridgedNavigationItem:(id)a3
{
}

- (ServiceBridgedNavigationItem)su_bridgedNavigationItem
{
  return (ServiceBridgedNavigationItem *)objc_getAssociatedObject(self, "su_bridgedNavigationItem");
}

@end