@interface DAAccountChangeUpdaterAccountStoreWrapper
- (DAAccountChangeUpdaterAccountStoreWrapper)initWithAccountStore:(id)a3;
- (void)addAccount:(id)a3 withCompletionHandler:(id)a4;
- (void)removeAccount:(id)a3 completion:(id)a4;
- (void)updateAccount:(id)a3 withCompletionHandler:(id)a4;
@end

@implementation DAAccountChangeUpdaterAccountStoreWrapper

- (DAAccountChangeUpdaterAccountStoreWrapper)initWithAccountStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DAAccountChangeUpdaterAccountStoreWrapper;
  v6 = [(DAAccountChangeUpdaterAccountStoreWrapper *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_store, a3);
  }

  return v7;
}

- (void)addAccount:(id)a3 withCompletionHandler:(id)a4
{
}

- (void)updateAccount:(id)a3 withCompletionHandler:(id)a4
{
}

- (void)removeAccount:(id)a3 completion:(id)a4
{
}

- (void).cxx_destruct
{
}

@end