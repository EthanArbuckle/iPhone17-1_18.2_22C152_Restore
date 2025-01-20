@interface AAUIFinanceKitAdapter
- (AAUIFinanceKitAdapter)init;
- (BOOL)hasOrders;
@end

@implementation AAUIFinanceKitAdapter

- (BOOL)hasOrders
{
  v2 = self;
  sub_2098137AC();

  return sub_2098BE1D8() & 1;
}

- (AAUIFinanceKitAdapter)init
{
  return (AAUIFinanceKitAdapter *)FinanceKitAdapter.init()();
}

@end