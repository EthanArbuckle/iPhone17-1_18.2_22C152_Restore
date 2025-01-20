@interface AMSBagFailingDataSource
- (AMSBagFailingDataSource)initWithProfile:(id)a3 profileVersion:(id)a4 error:(id)a5 delay:(double)a6;
- (AMSProcessInfo)processInfo;
- (BOOL)isLoaded;
- (NSDate)expirationDate;
- (NSError)error;
- (NSString)bagLoadingPartialIdentifier;
- (NSString)profile;
- (NSString)profileVersion;
- (double)delay;
- (id)defaultValueForKey:(id)a3;
- (id)valueForURLVariable:(id)a3 account:(id)a4;
- (void)loadWithCompletion:(id)a3;
- (void)setDelay:(double)a3;
- (void)setError:(id)a3;
- (void)setProfile:(id)a3;
- (void)setProfileVersion:(id)a3;
- (void)valueForURLVariable:(id)a3 account:(id)a4 completion:(id)a5;
@end

@implementation AMSBagFailingDataSource

- (AMSBagFailingDataSource)initWithProfile:(id)a3 profileVersion:(id)a4 error:(id)a5 delay:(double)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)AMSBagFailingDataSource;
  v14 = [(AMSBagFailingDataSource *)&v18 init];
  v15 = v14;
  if (v14)
  {
    v14->_delay = a6;
    objc_storeStrong((id *)&v14->_error, a5);
    expirationDate = v15->_expirationDate;
    v15->_expirationDate = 0;

    objc_storeStrong((id *)&v15->_profile, a3);
    objc_storeStrong((id *)&v15->_profileVersion, a4);
  }

  return v15;
}

- (BOOL)isLoaded
{
  return 0;
}

- (NSString)bagLoadingPartialIdentifier
{
  return 0;
}

- (void)loadWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  [(AMSBagFailingDataSource *)self delay];
  dispatch_time_t v6 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
  v7 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__AMSBagFailingDataSource_loadWithCompletion___block_invoke;
  block[3] = &unk_1E55A4BA8;
  objc_copyWeak(&v11, &location);
  id v10 = v4;
  id v8 = v4;
  dispatch_after(v6, v7, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __46__AMSBagFailingDataSource_loadWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = WeakRetained;
  id v4 = [WeakRetained error];
  (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v4);
}

- (id)valueForURLVariable:(id)a3 account:(id)a4
{
  return 0;
}

- (void)valueForURLVariable:(id)a3 account:(id)a4 completion:(id)a5
{
}

- (id)defaultValueForKey:(id)a3
{
  return 0;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (NSString)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
}

- (NSString)profileVersion
{
  return self->_profileVersion;
}

- (void)setProfileVersion:(id)a3
{
}

- (AMSProcessInfo)processInfo
{
  return self->processInfo;
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->processInfo, 0);
  objc_storeStrong((id *)&self->_profileVersion, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
}

@end