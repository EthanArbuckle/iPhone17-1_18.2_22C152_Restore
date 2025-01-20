@interface OrderManagementViewControllerProvider
+ (id)makeViewController;
- (_TtC12FinanceKitUI37OrderManagementViewControllerProvider)init;
@end

@implementation OrderManagementViewControllerProvider

+ (id)makeViewController
{
  id v2 = objc_allocWithZone((Class)type metadata accessor for OrderManagementViewController());
  id v3 = sub_243D24FE8();

  return v3;
}

- (_TtC12FinanceKitUI37OrderManagementViewControllerProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for OrderManagementViewControllerProvider();
  return [(OrderManagementViewControllerProvider *)&v3 init];
}

@end