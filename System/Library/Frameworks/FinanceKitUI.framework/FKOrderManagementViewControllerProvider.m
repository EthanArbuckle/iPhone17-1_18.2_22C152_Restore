@interface FKOrderManagementViewControllerProvider
+ (id)makeViewController;
@end

@implementation FKOrderManagementViewControllerProvider

+ (id)makeViewController
{
  return +[OrderManagementViewControllerProvider makeViewController];
}

@end