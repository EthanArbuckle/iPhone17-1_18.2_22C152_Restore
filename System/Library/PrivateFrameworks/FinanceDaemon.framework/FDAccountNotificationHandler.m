@interface FDAccountNotificationHandler
- (FDAccountNotificationHandler)init;
- (void)primaryAppleAccountWasAdded;
- (void)primaryAppleAccountWasDeleted;
@end

@implementation FDAccountNotificationHandler

- (FDAccountNotificationHandler)init
{
  v6.receiver = self;
  v6.super_class = (Class)FDAccountNotificationHandler;
  v2 = [(FDAccountNotificationHandler *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[AccountNotificationHandler makeHandler];
    wrappedHandler = v2->_wrappedHandler;
    v2->_wrappedHandler = (_TtC13FinanceDaemon26AccountNotificationHandler *)v3;
  }
  return v2;
}

- (void)primaryAppleAccountWasAdded
{
}

- (void)primaryAppleAccountWasDeleted
{
}

- (void).cxx_destruct
{
}

@end