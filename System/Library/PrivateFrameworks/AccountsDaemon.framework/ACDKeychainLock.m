@interface ACDKeychainLock
- (ACDKeychainLock)init;
- (void)lockPerformForService:(id)a3 username:(id)a4 block:(id)a5;
@end

@implementation ACDKeychainLock

- (ACDKeychainLock)init
{
  v7.receiver = self;
  v7.super_class = (Class)ACDKeychainLock;
  v2 = [(ACDKeychainLock *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_containerLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = objc_opt_new();
    locksByServiceUsername = v3->_locksByServiceUsername;
    v3->_locksByServiceUsername = (NSMutableDictionary *)v4;
  }
  return v3;
}

- (void)lockPerformForService:(id)a3 username:(id)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  p_containerLock = &self->_containerLock;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v18 = __56__ACDKeychainLock_lockPerformForService_username_block___block_invoke;
  v19 = &unk_264320EF0;
  id v12 = v8;
  id v20 = v12;
  id v13 = v9;
  id v21 = v13;
  v22 = self;
  v14 = v17;
  os_unfair_lock_lock(&self->_containerLock);
  v18(v14);
  v15 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_containerLock);

  v16 = (void (**)(void))v10;
  os_unfair_lock_lock(v15 + 2);
  v16[2](v16);
  os_unfair_lock_unlock(v15 + 2);
}

id __56__ACDKeychainLock_lockPerformForService_username_block___block_invoke(void *a1)
{
  v2 = [NSString stringWithFormat:@"%@.%@", a1[4], a1[5]];
  v3 = [*(id *)(a1[6] + 16) objectForKeyedSubscript:v2];
  if (!v3)
  {
    v3 = objc_opt_new();
    [*(id *)(a1[6] + 16) setObject:v3 forKeyedSubscript:v2];
  }

  return v3;
}

- (void).cxx_destruct
{
}

@end