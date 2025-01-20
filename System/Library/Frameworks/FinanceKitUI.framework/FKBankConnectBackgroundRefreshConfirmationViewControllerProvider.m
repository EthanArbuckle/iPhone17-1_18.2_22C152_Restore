@interface FKBankConnectBackgroundRefreshConfirmationViewControllerProvider
+ (id)makeViewController;
- (FKBankConnectBackgroundRefreshConfirmationViewControllerProvider)init;
@end

@implementation FKBankConnectBackgroundRefreshConfirmationViewControllerProvider

+ (id)makeViewController
{
  v2 = (void *)sub_243ADEF2C();

  return v2;
}

- (FKBankConnectBackgroundRefreshConfirmationViewControllerProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)FKBankConnectBackgroundRefreshConfirmationViewControllerProvider;
  return [(FKBankConnectBackgroundRefreshConfirmationViewControllerProvider *)&v3 init];
}

@end