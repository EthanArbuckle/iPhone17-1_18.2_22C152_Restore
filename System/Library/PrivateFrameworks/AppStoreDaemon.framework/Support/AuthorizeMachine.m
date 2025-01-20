@interface AuthorizeMachine
- (AuthorizeMachine)init;
@end

@implementation AuthorizeMachine

- (AuthorizeMachine)init
{
  v12.receiver = self;
  v12.super_class = (Class)AuthorizeMachine;
  v2 = [(AuthorizeMachine *)&v12 init];
  if (v2)
  {
    uint64_t v3 = sub_10030B11C();
    bag = v2->_bag;
    v2->_bag = (AMSBagProtocol *)v3;

    uint64_t v5 = sub_1003DA6D4();
    device = v2->_device;
    v2->_device = (Device *)v5;

    uint64_t v7 = sub_1000169A4();
    clientInfo = v2->_clientInfo;
    v2->_clientInfo = (AMSProcessInfo *)v7;

    v9 = [[_TtC9appstored6LogKey alloc] initWithCategory:@"AM"];
    logKey = v2->_logKey;
    v2->_logKey = v9;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_familyMemberAccountID, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end