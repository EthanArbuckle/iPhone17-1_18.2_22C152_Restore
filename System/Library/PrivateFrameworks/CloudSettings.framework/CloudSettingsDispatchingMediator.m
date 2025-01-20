@interface CloudSettingsDispatchingMediator
- (BOOL)dispatchSettersOnMain;
- (CloudSettingsDispatchingMediator)init;
- (NSMutableDictionary)keysMap;
- (id)deviceSettingsForKeys:(id)a3;
- (id)mergeSettings:(id)a3;
- (void)registerKey:(id)a3 getter:(SEL)a4 setter:(SEL)a5;
- (void)registerKey:(id)a3 getter:(SEL)a4 setter:(SEL)a5 merger:(SEL)a6 type:(id)a7;
- (void)registerKeys;
- (void)setDispatchSettersOnMain:(BOOL)a3;
- (void)setKeysMap:(id)a3;
@end

@implementation CloudSettingsDispatchingMediator

- (CloudSettingsDispatchingMediator)init
{
  v5.receiver = self;
  v5.super_class = (Class)CloudSettingsDispatchingMediator;
  v2 = [(CloudSettingsDispatchingMediator *)&v5 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(CloudSettingsDispatchingMediator *)v2 setKeysMap:v3];

    [(CloudSettingsDispatchingMediator *)v2 setDispatchSettersOnMain:1];
    [(CloudSettingsDispatchingMediator *)v2 registerKeys];
  }
  return v2;
}

- (void)registerKeys
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "NO OVERRIDE FOUND FOR registerKeys, YOU MUST OVERIDE registerKeys in your subclass of CloudSettingsDispatchingMediator", v2, 2u);
  }
}

- (void)registerKey:(id)a3 getter:(SEL)a4 setter:(SEL)a5
{
}

- (void)registerKey:(id)a3 getter:(SEL)a4 setter:(SEL)a5 merger:(SEL)a6 type:(id)a7
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a7;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v12;
    _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "registerKey: %@", buf, 0xCu);
  }
  v14 = NSStringFromSelector(a4);
  v15 = NSStringFromSelector(a5);
  if (a6)
  {
    NSStringFromSelector(a6);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = &stru_26CA04C68;
  }
  v19[0] = v14;
  v19[1] = v15;
  v19[2] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:3];
  v18 = [(CloudSettingsDispatchingMediator *)self keysMap];
  [v18 setObject:v17 forKeyedSubscript:v12];
}

- (id)deviceSettingsForKeys:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = objc_opt_new();
  if (!v4)
  {
    v6 = [(CloudSettingsDispatchingMediator *)self keysMap];
    id v4 = [v6 allKeys];
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v22;
    *(void *)&long long v9 = 138412290;
    long long v20 = v9;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        v14 = [(CloudSettingsDispatchingMediator *)self keysMap];
        v15 = [v14 objectForKeyedSubscript:v13];

        if (v15)
        {
          v16 = [v15 objectAtIndexedSubscript:0];
          SEL v17 = NSSelectorFromString(v16);

          v18 = ((void (*)(CloudSettingsDispatchingMediator *, SEL))[(CloudSettingsDispatchingMediator *)self methodForSelector:v17])(self, v17);
          if (v18) {
            [v5 setObject:v18 forKeyedSubscript:v13];
          }
        }
        else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v20;
          uint64_t v26 = v13;
          _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ERROR | deviceSettingsForKeys - unknown key: %@", buf, 0xCu);
        }
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v10);
  }

  return v5;
}

- (id)mergeSettings:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v26 = objc_opt_new();
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v28 = v4;
  id obj = [v4 allKeys];
  uint64_t v5 = [obj countByEnumeratingWithState:&v40 objects:v49 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v41 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v40 + 1) + 8 * i);
        long long v9 = [(CloudSettingsDispatchingMediator *)self keysMap];
        uint64_t v10 = [v9 objectForKeyedSubscript:v8];

        if (v10)
        {
          uint64_t v11 = [v10 objectAtIndexedSubscript:2];
          if ([(NSString *)v11 length])
          {
            SEL v12 = NSSelectorFromString(v11);
            uint64_t v13 = (void (*)(void, void, void))[(CloudSettingsDispatchingMediator *)self methodForSelector:v12];
            *(void *)&long long buf = 0;
            *((void *)&buf + 1) = &buf;
            uint64_t v45 = 0x3032000000;
            v46 = __Block_byref_object_copy_;
            v47 = __Block_byref_object_dispose_;
            id v48 = 0;
            if ([(CloudSettingsDispatchingMediator *)self dispatchSettersOnMain])
            {
              block[0] = MEMORY[0x263EF8330];
              block[1] = 3221225472;
              block[2] = __50__CloudSettingsDispatchingMediator_mergeSettings___block_invoke_3;
              block[3] = &unk_264341418;
              p_long long buf = &buf;
              v33 = v13;
              block[4] = self;
              SEL v34 = v12;
              id v30 = v28;
              uint64_t v31 = v8;
              dispatch_sync(MEMORY[0x263EF83A0], block);
            }
            else
            {
              SEL v17 = [v28 objectForKeyedSubscript:v8];
              uint64_t v18 = v13(self, v12, v17);
              v19 = *(void **)(*((void *)&buf + 1) + 40);
              *(void *)(*((void *)&buf + 1) + 40) = v18;
            }
            uint64_t v20 = *(void *)(*((void *)&buf + 1) + 40);
            if (v20) {
              [v26 setObject:v20 forKeyedSubscript:v8];
            }
            _Block_object_dispose(&buf, 8);
          }
          else
          {
            v14 = [v10 objectAtIndexedSubscript:1];
            SEL v15 = NSSelectorFromString(v14);

            v16 = (void (*)(void, void, void))[(CloudSettingsDispatchingMediator *)self methodForSelector:v15];
            if ([(CloudSettingsDispatchingMediator *)self dispatchSettersOnMain])
            {
              v35[0] = MEMORY[0x263EF8330];
              v35[1] = 3221225472;
              v35[2] = __50__CloudSettingsDispatchingMediator_mergeSettings___block_invoke;
              v35[3] = &unk_2643413F0;
              v38 = v16;
              SEL v39 = v15;
              v35[4] = self;
              id v36 = v28;
              uint64_t v37 = v8;
              dispatch_sync(MEMORY[0x263EF83A0], v35);
            }
            else
            {
              long long v21 = [v28 objectForKeyedSubscript:v8];
              v16(self, v15, v21);
            }
          }
        }
        else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v8;
          _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ERROR | applySettings - unknown key: %@", (uint8_t *)&buf, 0xCu);
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v40 objects:v49 count:16];
    }
    while (v5);
  }

  long long v22 = [v26 allKeys];
  BOOL v23 = [v22 count] == 0;

  if (v23)
  {
    long long v24 = 0;
  }
  else
  {
    long long v24 = [NSDictionary dictionaryWithDictionary:v26];
  }

  return v24;
}

void __50__CloudSettingsDispatchingMediator_mergeSettings___block_invoke(uint64_t a1)
{
  v2 = *(void (**)(uint64_t, uint64_t, id))(a1 + 56);
  uint64_t v1 = *(void *)(a1 + 64);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) objectForKeyedSubscript:*(void *)(a1 + 48)];
  v2(v3, v1, v4);
}

void __50__CloudSettingsDispatchingMediator_mergeSettings___block_invoke_3(uint64_t a1)
{
  uint64_t v3 = *(void (**)(uint64_t, uint64_t, id))(a1 + 64);
  uint64_t v2 = *(void *)(a1 + 72);
  uint64_t v4 = *(void *)(a1 + 32);
  id v8 = [*(id *)(a1 + 40) objectForKeyedSubscript:*(void *)(a1 + 48)];
  uint64_t v5 = v3(v4, v2, v8);
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (BOOL)dispatchSettersOnMain
{
  return self->_dispatchSettersOnMain;
}

- (void)setDispatchSettersOnMain:(BOOL)a3
{
  self->_dispatchSettersOnMain = a3;
}

- (NSMutableDictionary)keysMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setKeysMap:(id)a3
{
}

- (void).cxx_destruct
{
}

@end