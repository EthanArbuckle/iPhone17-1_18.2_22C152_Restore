@interface FKBankConnectPushNotificationHandler
- (FKBankConnectPushNotificationHandler)init;
- (_TtC10FinanceKit34BankConnectPushNotificationHandler)wrappedClass;
- (void)handlePushNotificationWithPayload:(id)a3;
- (void)setWrappedClass:(id)a3;
@end

@implementation FKBankConnectPushNotificationHandler

- (FKBankConnectPushNotificationHandler)init
{
  v6.receiver = self;
  v6.super_class = (Class)FKBankConnectPushNotificationHandler;
  v2 = [(FKBankConnectPushNotificationHandler *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[BankConnectPushNotificationHandler makeHandler];
    wrappedClass = v2->_wrappedClass;
    v2->_wrappedClass = (_TtC10FinanceKit34BankConnectPushNotificationHandler *)v3;
  }
  return v2;
}

- (void)handlePushNotificationWithPayload:(id)a3
{
}

- (_TtC10FinanceKit34BankConnectPushNotificationHandler)wrappedClass
{
  return self->_wrappedClass;
}

- (void)setWrappedClass:(id)a3
{
}

- (void).cxx_destruct
{
}

@end