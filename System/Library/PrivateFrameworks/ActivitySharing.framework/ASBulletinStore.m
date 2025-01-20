@interface ASBulletinStore
- (NSArray)bulletins;
- (void)_persistBulletins;
- (void)addBulletins:(id)a3;
- (void)loadBulletins;
- (void)removeAllBulletins;
- (void)removeBulletinsMatchingCriteria:(id)a3;
- (void)removeBulletinsOlderThanInterval:(double)a3;
@end

@implementation ASBulletinStore

- (void)loadBulletins
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v3 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.ActivitySharing"];
  v4 = [v3 valueForKey:@"bulletins"];
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "hk_map:", &__block_literal_global_9);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    bulletins = self->_bulletins;
    self->_bulletins = v6;
  }
  else
  {
    bulletins = self->_bulletins;
    self->_bulletins = (NSArray *)MEMORY[0x263EFFA68];
  }

  ASLoggingInitialize();
  v8 = (void *)ASLogNotifications;
  if (os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT))
  {
    v9 = self->_bulletins;
    v10 = v8;
    int v11 = 134217984;
    uint64_t v12 = [(NSArray *)v9 count];
    _os_log_impl(&dword_21EC60000, v10, OS_LOG_TYPE_DEFAULT, "Loaded %lu pending bulletins", (uint8_t *)&v11, 0xCu);
  }
}

ASCodableBulletin *__32__ASBulletinStore_loadBulletins__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[ASCodableBulletin alloc] initWithData:v2];

  return v3;
}

- (void)addBulletins:(id)a3
{
  id v6 = a3;
  if ([v6 count])
  {
    v4 = [(NSArray *)self->_bulletins arrayByAddingObjectsFromArray:v6];
    bulletins = self->_bulletins;
    self->_bulletins = v4;

    [(ASBulletinStore *)self _persistBulletins];
  }
}

- (void)removeAllBulletins
{
  ASLoggingInitialize();
  v3 = ASLogNotifications;
  if (os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21EC60000, v3, OS_LOG_TYPE_DEFAULT, "Removing all pending bulletins", v5, 2u);
  }
  bulletins = self->_bulletins;
  self->_bulletins = (NSArray *)MEMORY[0x263EFFA68];

  [(ASBulletinStore *)self _persistBulletins];
}

- (void)removeBulletinsMatchingCriteria:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v4 = (unsigned int (**)(id, void *))a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v18 = self;
  location = (id *)&self->_bulletins;
  v5 = self->_bulletins;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    char v8 = 0;
    uint64_t v9 = *(void *)v21;
    v10 = (void *)MEMORY[0x263EFFA68];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (v4[2](v4, v12))
        {
          ASLoggingInitialize();
          uint64_t v13 = (void *)ASLogNotifications;
          if (os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT))
          {
            v14 = v13;
            uint64_t v15 = [v12 type];
            v16 = [v12 title];
            *(_DWORD *)buf = 134218242;
            uint64_t v25 = v15;
            __int16 v26 = 2112;
            v27 = v16;
            _os_log_impl(&dword_21EC60000, v14, OS_LOG_TYPE_DEFAULT, "Removing matching pending bulletin: %lu/%@", buf, 0x16u);
          }
          char v8 = 1;
        }
        else
        {
          uint64_t v17 = [v10 arrayByAddingObject:v12];

          v10 = (void *)v17;
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v7);
  }
  else
  {
    char v8 = 0;
    v10 = (void *)MEMORY[0x263EFFA68];
  }

  objc_storeStrong(location, v10);
  if (v8) {
    [(ASBulletinStore *)v18 _persistBulletins];
  }
}

- (void)removeBulletinsOlderThanInterval:(double)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  ASLoggingInitialize();
  v5 = ASLogNotifications;
  if (os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v11 = (uint64_t)a3;
    _os_log_impl(&dword_21EC60000, v5, OS_LOG_TYPE_DEFAULT, "Removing pending bulletins older than %ld seconds", buf, 0xCu);
  }
  uint64_t v6 = [MEMORY[0x263EFF910] date];
  [v6 timeIntervalSinceReferenceDate];
  uint64_t v8 = v7;

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __52__ASBulletinStore_removeBulletinsOlderThanInterval___block_invoke;
  v9[3] = &__block_descriptor_48_e27_B16__0__ASCodableBulletin_8l;
  v9[4] = v8;
  *(double *)&v9[5] = a3;
  [(ASBulletinStore *)self removeBulletinsMatchingCriteria:v9];
}

BOOL __52__ASBulletinStore_removeBulletinsOlderThanInterval___block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(double *)(a1 + 32);
  [a2 timestamp];
  return v3 - v4 > *(double *)(a1 + 40);
}

- (void)_persistBulletins
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  double v3 = [(NSArray *)self->_bulletins hk_map:&__block_literal_global_13_0];
  double v4 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.ActivitySharing"];
  [v4 setObject:v3 forKey:@"bulletins"];
  [v4 synchronize];
  ASLoggingInitialize();
  v5 = (void *)ASLogNotifications;
  if (os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT))
  {
    bulletins = self->_bulletins;
    uint64_t v7 = v5;
    int v8 = 134217984;
    uint64_t v9 = [(NSArray *)bulletins count];
    _os_log_impl(&dword_21EC60000, v7, OS_LOG_TYPE_DEFAULT, "Persisted %lu pending bulletins", (uint8_t *)&v8, 0xCu);
  }
}

uint64_t __36__ASBulletinStore__persistBulletins__block_invoke(uint64_t a1, void *a2)
{
  return [a2 data];
}

- (NSArray)bulletins
{
  return self->_bulletins;
}

- (void).cxx_destruct
{
}

@end