@interface MSKeyValueStore
+ (id)valueForKey:(id)a3;
- (void)_simulateServicesMethod:(id)a3 arguments:(id)a4 callback:(id)a5;
- (void)_valueForKey:(id)a3 handler:(id)a4;
@end

@implementation MSKeyValueStore

+ (id)valueForKey:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(MSKeyValueStore);
  [(MSMailDefaultService *)v4 setShouldLaunchMobileMail:1];
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  id v19 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __31__MSKeyValueStore_valueForKey___block_invoke;
  v10[3] = &unk_2642430F8;
  id v6 = v3;
  dispatch_semaphore_t v12 = v5;
  v13 = &v14;
  id v11 = v6;
  v7 = v5;
  [(MSKeyValueStore *)v4 _valueForKey:v6 handler:v10];
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return v8;
}

void __31__MSKeyValueStore_valueForKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    id v8 = MFLogGeneral();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = 138412546;
      uint64_t v11 = v9;
      __int16 v12 = 2112;
      id v13 = v7;
      _os_log_impl(&dword_215471000, v8, OS_LOG_TYPE_DEFAULT, "#Warning failed to retrieve value for key '%@' error: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)_valueForKey:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = (void *)MEMORY[0x2166BBAE0]();
  id v8 = [NSDictionary dictionaryWithObject:a3 forKey:@"key"];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __40__MSKeyValueStore__valueForKey_handler___block_invoke;
  v10[3] = &unk_264242E08;
  id v9 = v6;
  id v11 = v9;
  [(MSService *)self _callServicesMethod:@"MailValueForKey" arguments:v8 callback:v10];
}

void __40__MSKeyValueStore__valueForKey_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  dispatch_semaphore_t v5 = [a2 objectForKey:@"value"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_simulateServicesMethod:(id)a3 arguments:(id)a4 callback:(id)a5
{
  v21[4] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  int v10 = (void (**)(id, void *, void))a5;
  if ([v8 isEqualToString:@"MailValueForKey"])
  {
    id v11 = [v9 objectForKey:@"key"];
    v20[0] = @"SignatureKey";
    v20[1] = @"UseAccountSignatures";
    v21[0] = @"Sent from my iPhone Simulator";
    v21[1] = MEMORY[0x263EFFA80];
    uint64_t v12 = *MEMORY[0x263F3B138];
    v20[2] = *MEMORY[0x263F3B128];
    v20[3] = v12;
    v21[2] = MEMORY[0x263EFFA80];
    v21[3] = &unk_26C603780;
    id v13 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:4];
    uint64_t v14 = [v13 objectForKeyedSubscript:v11];
    v15 = (void *)v14;
    if (v14)
    {
      v18 = @"value";
      uint64_t v19 = v14;
      uint64_t v16 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    }
    else
    {
      uint64_t v16 = 0;
    }
    v10[2](v10, v16, 0);
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)MSKeyValueStore;
    [(MSService *)&v17 _simulateServicesMethod:v8 arguments:v9 callback:v10];
  }
}

@end