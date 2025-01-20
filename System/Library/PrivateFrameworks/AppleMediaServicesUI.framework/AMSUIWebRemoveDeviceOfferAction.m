@interface AMSUIWebRemoveDeviceOfferAction
- (ACAccount)account;
- (AMSUIWebRemoveDeviceOfferAction)initWithJSObject:(id)a3 context:(id)a4;
- (NSString)identifier;
- (id)runAction;
- (void)setAccount:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation AMSUIWebRemoveDeviceOfferAction

- (AMSUIWebRemoveDeviceOfferAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)AMSUIWebRemoveDeviceOfferAction;
  v8 = [(AMSUIWebAction *)&v18 initWithJSObject:v6 context:v7];
  if (v8)
  {
    v9 = [v6 objectForKeyedSubscript:@"account"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }

    v11 = [v7 iTunesAccountFromJSAccount:v10];
    uint64_t v12 = [v11 copy];
    account = v8->_account;
    v8->_account = (ACAccount *)v12;

    v14 = [v6 objectForKeyedSubscript:@"identifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v15 = v14;
    }
    else {
      v15 = 0;
    }

    identifier = v8->_identifier;
    v8->_identifier = v15;
  }
  return v8;
}

- (id)runAction
{
  v18.receiver = self;
  v18.super_class = (Class)AMSUIWebRemoveDeviceOfferAction;
  id v3 = [(AMSUIWebAction *)&v18 runAction];
  uint64_t v4 = [(AMSUIWebRemoveDeviceOfferAction *)self identifier];
  if (v4
    && (v5 = (void *)v4,
        [(AMSUIWebRemoveDeviceOfferAction *)self identifier],
        id v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 length],
        v6,
        v5,
        v7))
  {
    v8 = (void *)MEMORY[0x263F27BF8];
    v9 = [(AMSUIWebRemoveDeviceOfferAction *)self identifier];
    id v10 = [(AMSUIWebRemoveDeviceOfferAction *)self account];
    v11 = [(AMSUIWebAction *)self context];
    uint64_t v12 = [v11 bag];
    [v8 removeDeviceOfferWithIdentifier:v9 account:v10 bag:v12 logKey:0];

    v13 = [MEMORY[0x263F27B58] promiseWithSuccess];
    uint64_t v14 = [v13 promiseAdapter];
  }
  else
  {
    v15 = (void *)MEMORY[0x263F27E10];
    v13 = AMSError();
    uint64_t v14 = [v15 promiseWithError:v13];
  }
  v16 = (void *)v14;

  return v16;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end