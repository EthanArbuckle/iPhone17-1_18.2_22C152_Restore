@interface SAPhoneApplicationLauncher
- (SAPhoneApplicationLauncher)init;
- (void)addAssertion:(id)a3 forProcessId:(int)a4;
- (void)cleanupInvalidAssertions;
- (void)openApplicationInBackgroundWithBundleId:(id)a3 withReason:(int64_t)a4 completion:(id)a5;
@end

@implementation SAPhoneApplicationLauncher

- (SAPhoneApplicationLauncher)init
{
  v6.receiver = self;
  v6.super_class = (Class)SAPhoneApplicationLauncher;
  v2 = [(SAPhoneApplicationLauncher *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    assertionMap = v2->_assertionMap;
    v2->_assertionMap = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)openApplicationInBackgroundWithBundleId:(id)a3 withReason:(int64_t)a4 completion:(id)a5
{
  v34[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  v8 = (void (**)(id, uint64_t, void))a5;
  int64_t v20 = a4;
  v9 = +[SABundleManager reasonToAttributeName:a4];
  v10 = v7;
  v22 = [MEMORY[0x263F64598] identityForEmbeddedApplicationIdentifier:v7];
  v11 = objc_msgSend(MEMORY[0x263F644E0], "contextWithIdentity:");
  v12 = [MEMORY[0x263F64480] attributeWithDomain:@"com.apple.SafetyKit" name:v9];
  v34[0] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:1];
  [v11 setAttributes:v13];

  [v11 setExplanation:v9];
  v14 = (void *)[objc_alloc(MEMORY[0x263F644F0]) initWithContext:v11];
  id v24 = 0;
  id v25 = 0;
  id v23 = 0;
  LOBYTE(v7) = [v14 execute:&v25 assertion:&v24 error:&v23];
  id v15 = v25;
  id v16 = v24;
  id v17 = v23;
  v18 = sa_default_log();
  v19 = v18;
  if (v7)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v27 = "-[SAPhoneApplicationLauncher openApplicationInBackgroundWithBundleId:withReason:completion:]";
      __int16 v28 = 2112;
      v29 = v10;
      __int16 v30 = 2048;
      int64_t v31 = v20;
      __int16 v32 = 2112;
      id v33 = v15;
      _os_log_impl(&dword_245182000, v19, OS_LOG_TYPE_DEFAULT, "%s - Successfully launched bundle, bundleId: %@, reason: %lu, process: %@", buf, 0x2Au);
    }

    -[SAPhoneApplicationLauncher addAssertion:forProcessId:](self, "addAssertion:forProcessId:", v16, [v15 pid]);
    if (v8) {
      v8[2](v8, 1, 0);
    }
  }
  else
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v27 = "-[SAPhoneApplicationLauncher openApplicationInBackgroundWithBundleId:withReason:completion:]";
      __int16 v28 = 2112;
      v29 = v10;
      __int16 v30 = 2048;
      int64_t v31 = v20;
      __int16 v32 = 2112;
      id v33 = v17;
      _os_log_error_impl(&dword_245182000, v19, OS_LOG_TYPE_ERROR, "%s - Unable to launch bundle, bundleId: %@, reason: %lu, error: %@", buf, 0x2Au);
    }

    if (v8) {
      ((void (**)(id, uint64_t, id))v8)[2](v8, 0, v17);
    }
  }
}

- (void)cleanupInvalidAssertions
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = [(NSMutableDictionary *)self->_assertionMap allKeys];
  uint64_t v3 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        id v7 = [(NSMutableDictionary *)self->_assertionMap objectForKeyedSubscript:v6];
        v8 = objc_opt_new();
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v9 = v7;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v20;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v20 != v12) {
                objc_enumerationMutation(v9);
              }
              v14 = *(void **)(*((void *)&v19 + 1) + 8 * j);
              if ([v14 isValid]) {
                [v8 addObject:v14];
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v11);
        }

        uint64_t v15 = [v8 count];
        assertionMap = self->_assertionMap;
        if (v15) {
          [(NSMutableDictionary *)assertionMap setObject:v8 forKeyedSubscript:v6];
        }
        else {
          [(NSMutableDictionary *)assertionMap removeObjectForKey:v6];
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v4);
  }
}

- (void)addAssertion:(id)a3 forProcessId:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v12 = a3;
  [(SAPhoneApplicationLauncher *)self cleanupInvalidAssertions];
  uint64_t v6 = v12;
  if (v12)
  {
    assertionMap = self->_assertionMap;
    v8 = [NSNumber numberWithInt:v4];
    id v9 = [(NSMutableDictionary *)assertionMap objectForKeyedSubscript:v8];

    if (!v9)
    {
      id v9 = objc_opt_new();
      uint64_t v10 = self->_assertionMap;
      uint64_t v11 = [NSNumber numberWithInt:v4];
      [(NSMutableDictionary *)v10 setObject:v9 forKeyedSubscript:v11];
    }
    [v9 addObject:v12];

    uint64_t v6 = v12;
  }
}

- (void).cxx_destruct
{
}

@end