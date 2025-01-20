@interface ABSAddressBookSettings
- (ABSAddressBookSettings)init;
- (ABSAddressBookSettings)initWithContactStoreFuture:(id)a3;
- (ABSAddressBookSettings)initWithOptions:(id)a3;
- (ABSAddressBookSettings)initWithOptions:(id)a3 policy:(int)a4;
- (ABSAddressBookSettings)initWithOptions:(id)a3 policy:(int)a4 contactStoreFuture:(id)a5 schedulerProvider:(id)a6;
- (CNFuture)contactStoreFuture;
- (CNSchedulerProvider)schedulerProvider;
- (NSDictionary)options;
- (id)newFaultHandlerWithStorage:(id)a3;
- (int)policy;
@end

@implementation ABSAddressBookSettings

- (ABSAddressBookSettings)init
{
  BOOL v3 = !CNLinkedOnOrAfter() && !ABAddressBookForceNullDatabaseForAccessDeniedIsEnabled();

  return [(ABSAddressBookSettings *)self initWithOptions:0 policy:v3];
}

- (ABSAddressBookSettings)initWithOptions:(id)a3
{
  return [(ABSAddressBookSettings *)self initWithOptions:a3 policy:0];
}

- (ABSAddressBookSettings)initWithContactStoreFuture:(id)a3
{
  v4 = (void *)MEMORY[0x263F33668];
  id v5 = a3;
  v6 = [v4 defaultProvider];
  v7 = [(ABSAddressBookSettings *)self initWithOptions:0 policy:0 contactStoreFuture:v5 schedulerProvider:v6];

  return v7;
}

- (ABSAddressBookSettings)initWithOptions:(id)a3 policy:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v6 = (void *)MEMORY[0x263F335E0];
  id v7 = a3;
  v8 = [v6 lazyFutureWithBlock:&__block_literal_global_1];
  v9 = [MEMORY[0x263F33668] defaultProvider];
  v10 = [(ABSAddressBookSettings *)self initWithOptions:v7 policy:v4 contactStoreFuture:v8 schedulerProvider:v9];

  return v10;
}

id __49__ABSAddressBookSettings_initWithOptions_policy___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFEA58]);

  return v0;
}

- (ABSAddressBookSettings)initWithOptions:(id)a3 policy:(int)a4 contactStoreFuture:(id)a5 schedulerProvider:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)ABSAddressBookSettings;
  v13 = [(ABSAddressBookSettings *)&v19 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_contactStoreFuture, a5);
    uint64_t v15 = [v10 copy];
    options = v14->_options;
    v14->_options = (NSDictionary *)v15;

    v14->_policy = a4;
    objc_storeStrong((id *)&v14->_schedulerProvider, a6);
    v17 = v14;
  }

  return v14;
}

- (id)newFaultHandlerWithStorage:(id)a3
{
  id v4 = a3;
  id v5 = [ABSBulkFaultHandler alloc];
  v6 = [(ABSAddressBookSettings *)self contactStoreFuture];
  id v7 = [(ABSAddressBookSettings *)self schedulerProvider];
  v8 = [(ABSBulkFaultHandler *)v5 initWithStorage:v4 contactStoreFuture:v6 schedulerProvider:v7];

  return v8;
}

- (CNFuture)contactStoreFuture
{
  return self->_contactStoreFuture;
}

- (NSDictionary)options
{
  return self->_options;
}

- (int)policy
{
  return self->_policy;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong((id *)&self->_contactStoreFuture, 0);
}

@end