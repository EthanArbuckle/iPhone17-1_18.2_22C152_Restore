@interface AMSSyncAccountFlagsTask
- (ACAccount)account;
- (AMSBagProtocol)bag;
- (AMSSyncAccountFlagsTask)initWithAccount:(id)a3 bag:(id)a4;
- (id)performSync;
- (void)setAccount:(id)a3;
- (void)setBag:(id)a3;
@end

@implementation AMSSyncAccountFlagsTask

- (AMSSyncAccountFlagsTask)initWithAccount:(id)a3 bag:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSSyncAccountFlagsTask;
  v9 = [(AMSTask *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeStrong((id *)&v10->_bag, a4);
  }

  return v10;
}

- (id)performSync
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_240559B38;
  v5[3] = &unk_2650C0A28;
  v5[4] = self;
  v4.receiver = self;
  v4.super_class = (Class)AMSSyncAccountFlagsTask;
  v2 = [(AMSTask *)&v4 performTaskWithBlock:v5];
  return v2;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end