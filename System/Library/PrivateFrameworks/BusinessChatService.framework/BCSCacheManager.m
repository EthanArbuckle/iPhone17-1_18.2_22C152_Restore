@interface BCSCacheManager
- (BCSCacheManager)initWithBloomFilterShardCache:(id)a3 domainItemCache:(id)a4 itemCache:(id)a5;
- (BOOL)shouldSkipCacheForConfigItemOfType:(int64_t)a3;
- (BOOL)shouldSkipCacheForItemOfType:(int64_t)a3;
- (BOOL)shouldSkipCacheForShardItemOfType:(int64_t)a3;
- (id)configItemForType:(int64_t)a3;
- (id)domainItemMatching:(id)a3;
- (id)itemMatching:(id)a3;
- (id)shardItemMatching:(id)a3;
- (int64_t)countOfExpiredShardsOfType:(int64_t)a3;
- (int64_t)countOfShardsOfType:(int64_t)a3;
- (void)_clearExpiredCacheItemsForType:(void *)a3 completion:;
- (void)beginBatch;
- (void)clearCachesForLinkItemsAssociatedWithBundleID:(id)a3 completion:(id)a4;
- (void)clearCachesForType:(int64_t)a3 completion:(id)a4;
- (void)clearExpiredCachesForType:(int64_t)a3 completion:(id)a4;
- (void)deleteAllDomainItems;
- (void)deleteAllExpiredDomainItems;
- (void)deleteConfigItemForType:(int64_t)a3;
- (void)deleteDomainItemMatching:(id)a3;
- (void)deleteExpiredItemsOfType:(int64_t)a3;
- (void)deleteExpiredShardItemsOfType:(int64_t)a3;
- (void)deleteItemMatching:(id)a3;
- (void)deleteItemsOfType:(int64_t)a3;
- (void)deleteShardItemMatching:(id)a3;
- (void)deleteShardItemsOfType:(int64_t)a3;
- (void)endBatch;
- (void)updateConfigItem:(id)a3 withType:(int64_t)a4;
- (void)updateDomainItem:(id)a3 withDomainItemIdentifier:(id)a4;
- (void)updateDomainItemsForDomainShard:(id)a3;
- (void)updateItem:(id)a3 withItemIdentifier:(id)a4;
- (void)updateShardItem:(id)a3 withShardIdentifier:(id)a4;
@end

@implementation BCSCacheManager

- (BCSCacheManager)initWithBloomFilterShardCache:(id)a3 domainItemCache:(id)a4 itemCache:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)BCSCacheManager;
  v12 = [(BCSCacheManager *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_filterShardCache, a3);
    objc_storeStrong((id *)&v13->_domainItemCache, a4);
    objc_storeStrong((id *)&v13->_itemCache, a5);
    v14 = dispatch_get_global_queue(9, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __75__BCSCacheManager_initWithBloomFilterShardCache_domainItemCache_itemCache___block_invoke;
    block[3] = &unk_264248CD8;
    v17 = v13;
    dispatch_async(v14, block);
  }
  return v13;
}

void __75__BCSCacheManager_initWithBloomFilterShardCache_domainItemCache_itemCache___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) clearExpiredCachesForType:1 completion:&__block_literal_global_13];
  -[BCSCacheManager _clearExpiredCacheItemsForType:completion:](*(void **)(a1 + 32), 2, &__block_literal_global_16);
  -[BCSCacheManager _clearExpiredCacheItemsForType:completion:](*(void **)(a1 + 32), 3, &__block_literal_global_19);
  v2 = *(void **)(a1 + 32);

  -[BCSCacheManager _clearExpiredCacheItemsForType:completion:](v2, 4, &__block_literal_global_22);
}

void __75__BCSCacheManager_initWithBloomFilterShardCache_domainItemCache_itemCache___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    v4 = ABSLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [v3 description];
      int v6 = 136315138;
      uint64_t v7 = [v5 UTF8String];
      _os_log_impl(&dword_2154F4000, v4, OS_LOG_TYPE_DEFAULT, "clearExpiredCacheItemsForType error: %s", (uint8_t *)&v6, 0xCu);
    }
  }
}

void __75__BCSCacheManager_initWithBloomFilterShardCache_domainItemCache_itemCache___block_invoke_14(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    v4 = ABSLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [v3 description];
      int v6 = 136315138;
      uint64_t v7 = [v5 UTF8String];
      _os_log_impl(&dword_2154F4000, v4, OS_LOG_TYPE_DEFAULT, "clearExpiredCacheItemsForType error: %s", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)_clearExpiredCacheItemsForType:(void *)a3 completion:
{
  if (a1)
  {
    id v5 = a3;
    [a1 deleteExpiredItemsOfType:a2];
    v5[2](v5, 1, 0);
  }
}

void __75__BCSCacheManager_initWithBloomFilterShardCache_domainItemCache_itemCache___block_invoke_17(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    v4 = ABSLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [v3 description];
      int v6 = 136315138;
      uint64_t v7 = [v5 UTF8String];
      _os_log_impl(&dword_2154F4000, v4, OS_LOG_TYPE_DEFAULT, "clearExpiredCacheItemsForType error: %s", (uint8_t *)&v6, 0xCu);
    }
  }
}

void __75__BCSCacheManager_initWithBloomFilterShardCache_domainItemCache_itemCache___block_invoke_20(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    v4 = ABSLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [v3 description];
      int v6 = 136315138;
      uint64_t v7 = [v5 UTF8String];
      _os_log_impl(&dword_2154F4000, v4, OS_LOG_TYPE_DEFAULT, "clearExpiredCacheItemsForType error: %s", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)clearCachesForType:(int64_t)a3 completion:(id)a4
{
  uint64_t v8 = (void (**)(id, uint64_t, void))a4;
  [(BCSCacheManager *)self deleteConfigItemForType:a3];
  [(BCSCacheManager *)self deleteItemsOfType:a3];
  switch(a3)
  {
    case 1:
      int v6 = self;
      uint64_t v7 = 1;
      goto LABEL_6;
    case 2:
      [(BCSCacheManager *)self deleteShardItemsOfType:2];
      [(BCSCacheManager *)self deleteShardItemsOfType:3];
      [(BCSCacheManager *)self deleteAllDomainItems];
      break;
    case 3:
      int v6 = self;
      uint64_t v7 = 4;
      goto LABEL_6;
    case 4:
      int v6 = self;
      uint64_t v7 = 5;
LABEL_6:
      [(BCSCacheManager *)v6 deleteShardItemsOfType:v7];
      break;
    default:
      break;
  }
  v8[2](v8, 1, 0);
}

- (void)clearExpiredCachesForType:(int64_t)a3 completion:(id)a4
{
  id v10 = (void (**)(id, uint64_t, void))a4;
  if (self)
  {
    int v6 = [(BCSCacheManager *)self configItemForType:a3];
    uint64_t v7 = v6;
    if (v6 && [v6 isExpired]) {
      [(BCSCacheManager *)self deleteConfigItemForType:a3];
    }
  }
  [(BCSCacheManager *)self deleteExpiredItemsOfType:a3];
  switch(a3)
  {
    case 1:
      uint64_t v8 = self;
      uint64_t v9 = 1;
      goto LABEL_11;
    case 2:
      [(BCSCacheManager *)self deleteExpiredShardItemsOfType:2];
      [(BCSCacheManager *)self deleteExpiredShardItemsOfType:3];
      [(BCSCacheManager *)self deleteAllExpiredDomainItems];
      break;
    case 3:
      uint64_t v8 = self;
      uint64_t v9 = 4;
      goto LABEL_11;
    case 4:
      uint64_t v8 = self;
      uint64_t v9 = 5;
LABEL_11:
      [(BCSCacheManager *)v8 deleteExpiredShardItemsOfType:v9];
      break;
    default:
      break;
  }
  v10[2](v10, 1, 0);
}

- (void)clearCachesForLinkItemsAssociatedWithBundleID:(id)a3 completion:(id)a4
{
  if (self) {
    itemCache = self->_itemCache;
  }
  else {
    itemCache = 0;
  }
  int v6 = (void (**)(id, uint64_t, void))a4;
  [(BCSItemCaching *)itemCache deleteLinkItemsWithBundleID:a3];
  v6[2](v6, 1, 0);
}

- (BOOL)shouldSkipCacheForItemOfType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3) {
    return 0;
  }
  id v3 = off_26424A2B0[a3 - 1];
  v4 = +[BCSUserDefaults sharedDefaults];
  LOBYTE(v3) = [v4 BOOLForKey:*v3];

  return (char)v3;
}

- (id)itemMatching:(id)a3
{
  if (self) {
    self = (BCSCacheManager *)self->_itemCache;
  }
  return [(BCSCacheManager *)self itemMatching:a3];
}

- (void)updateItem:(id)a3 withItemIdentifier:(id)a4
{
  if (self) {
    self = (BCSCacheManager *)self->_itemCache;
  }
  [(BCSCacheManager *)self updateItem:a3 withItemIdentifier:a4];
}

- (void)deleteItemsOfType:(int64_t)a3
{
  if (self) {
    self = (BCSCacheManager *)self->_itemCache;
  }
  [(BCSCacheManager *)self deleteItemsOfType:a3];
}

- (void)deleteExpiredItemsOfType:(int64_t)a3
{
  if (self) {
    self = (BCSCacheManager *)self->_itemCache;
  }
  [(BCSCacheManager *)self deleteExpiredItemsOfType:a3];
}

- (void)deleteItemMatching:(id)a3
{
  if (self) {
    self = (BCSCacheManager *)self->_itemCache;
  }
  [(BCSCacheManager *)self deleteItemMatching:a3];
}

- (BOOL)shouldSkipCacheForConfigItemOfType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3) {
    return 0;
  }
  id v3 = off_26424A2D0[a3 - 1];
  v4 = +[BCSUserDefaults sharedDefaults];
  LOBYTE(v3) = [v4 BOOLForKey:*v3];

  return (char)v3;
}

- (id)configItemForType:(int64_t)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  int64_t v3 = a3 - 1;
  switch(a3)
  {
    case 1:
      id v5 = +[BCSUserDefaults sharedDefaults];
      int v6 = v5;
      uint64_t v7 = @"BCSCacheManagerChatSuggestConfigItemDefaultsKey";
      goto LABEL_7;
    case 2:
      id v5 = +[BCSUserDefaults sharedDefaults];
      int v6 = v5;
      uint64_t v7 = @"BCSCacheManagerBusinessLinkDomainConfigItemDefaultsKey";
      goto LABEL_7;
    case 3:
      id v5 = +[BCSUserDefaults sharedDefaults];
      int v6 = v5;
      uint64_t v7 = @"BCSCacheManagerBusinessCallerConfigItemDefaultsKey";
      goto LABEL_7;
    case 4:
      id v5 = +[BCSUserDefaults sharedDefaults];
      int v6 = v5;
      uint64_t v7 = @"BCSCacheManagerBusinessEmailConfigItemDefaultsKey";
LABEL_7:
      uint64_t v8 = [v5 dataForKey:v7];

      if (!v8) {
        goto LABEL_10;
      }
      switch(v3)
      {
        case 0:
          uint64_t v9 = (void *)MEMORY[0x263F08928];
          id v10 = (void *)MEMORY[0x263EFFA08];
          Class v11 = NSClassFromString(&cfstr_Bcsconfigitem.isa);
          v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
          uint64_t v30 = 0;
          v13 = (id *)&v30;
          v14 = &v30;
          goto LABEL_15;
        case 1:
          uint64_t v9 = (void *)MEMORY[0x263F08928];
          v16 = (void *)MEMORY[0x263EFFA08];
          Class v17 = NSClassFromString(&cfstr_Bcsdomainconfi_4.isa);
          v12 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
          uint64_t v29 = 0;
          v13 = (id *)&v29;
          v14 = &v29;
          goto LABEL_15;
        case 2:
          uint64_t v9 = (void *)MEMORY[0x263F08928];
          objc_super v18 = (void *)MEMORY[0x263EFFA08];
          Class v19 = NSClassFromString(&cfstr_Bcsconfigitem.isa);
          v12 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
          uint64_t v28 = 0;
          v13 = (id *)&v28;
          v14 = &v28;
          goto LABEL_15;
        case 3:
          uint64_t v9 = (void *)MEMORY[0x263F08928];
          v20 = (void *)MEMORY[0x263EFFA08];
          Class v21 = NSClassFromString(&cfstr_Bcsconfigitem.isa);
          v12 = objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
          uint64_t v27 = 0;
          v13 = (id *)&v27;
          v14 = &v27;
LABEL_15:
          v15 = [v9 unarchivedObjectOfClasses:v12 fromData:v8 error:v14];
          v22 = *v13;

          if (!v22) {
            goto LABEL_19;
          }
          v23 = ABSLogCommon();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            v26 = NSStringFromBCSType(a3);
            *(_DWORD *)buf = 136315650;
            v32 = "-[BCSCacheManager configItemForType:]";
            __int16 v33 = 2112;
            v34 = v26;
            __int16 v35 = 2112;
            v36 = v22;
            _os_log_error_impl(&dword_2154F4000, v23, OS_LOG_TYPE_ERROR, "%s unarchiving cached config item from NSUserDefaults failed - type: %@ (%@)", buf, 0x20u);
          }
          v15 = 0;
          break;
        default:
          v15 = 0;
LABEL_19:
          v22 = ABSLogCommon();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            v24 = NSStringFromBCSType(a3);
            *(_DWORD *)buf = 136315394;
            v32 = "-[BCSCacheManager configItemForType:]";
            __int16 v33 = 2112;
            v34 = v24;
            _os_log_impl(&dword_2154F4000, v22, OS_LOG_TYPE_DEFAULT, "%s cached config item successfully fetched from NSUserDefaults - type: %@", buf, 0x16u);
          }
          break;
      }

      break;
    default:
      uint64_t v8 = 0;
LABEL_10:
      v15 = 0;
      break;
  }

  return v15;
}

- (void)updateConfigItem:(id)a3 withType:(int64_t)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v11 = 0;
    id v5 = [MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v11];
    id v6 = v11;
    if (!v6)
    {
      switch(a4)
      {
        case 1:
          uint64_t v9 = +[BCSUserDefaults sharedDefaults];
          uint64_t v7 = v9;
          id v10 = @"BCSCacheManagerChatSuggestConfigItemDefaultsKey";
          goto LABEL_10;
        case 2:
          uint64_t v9 = +[BCSUserDefaults sharedDefaults];
          uint64_t v7 = v9;
          id v10 = @"BCSCacheManagerBusinessLinkDomainConfigItemDefaultsKey";
          goto LABEL_10;
        case 3:
          uint64_t v9 = +[BCSUserDefaults sharedDefaults];
          uint64_t v7 = v9;
          id v10 = @"BCSCacheManagerBusinessCallerConfigItemDefaultsKey";
          goto LABEL_10;
        case 4:
          uint64_t v9 = +[BCSUserDefaults sharedDefaults];
          uint64_t v7 = v9;
          id v10 = @"BCSCacheManagerBusinessEmailConfigItemDefaultsKey";
LABEL_10:
          [v9 setObject:v5 forKey:v10];
          goto LABEL_11;
        default:
          goto LABEL_12;
      }
    }
    uint64_t v7 = ABSLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = NSStringFromBCSType(a4);
      *(_DWORD *)buf = 136315394;
      v13 = "-[BCSCacheManager updateConfigItem:withType:]";
      __int16 v14 = 2112;
      v15 = v8;
      _os_log_error_impl(&dword_2154F4000, v7, OS_LOG_TYPE_ERROR, "%s archiving cached config item to NSUserDefaults failed - type: %@", buf, 0x16u);
    }
LABEL_11:

LABEL_12:
  }
}

- (void)deleteConfigItemForType:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
      id v5 = @"BCSCacheManagerChatSuggestConfigItemDefaultsKey";
      goto LABEL_6;
    case 2:
      v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
      id v5 = @"BCSCacheManagerBusinessLinkDomainConfigItemDefaultsKey";
      goto LABEL_6;
    case 3:
      v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
      id v5 = @"BCSCacheManagerBusinessCallerConfigItemDefaultsKey";
      goto LABEL_6;
    case 4:
      v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
      id v5 = @"BCSCacheManagerBusinessEmailConfigItemDefaultsKey";
LABEL_6:
      id v6 = v4;
      [v4 removeObjectForKey:v5];

      break;
    default:
      return;
  }
}

- (BOOL)shouldSkipCacheForShardItemOfType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3) {
    return 0;
  }
  uint64_t v3 = off_26424A2D0[a3 - 1];
  v4 = +[BCSUserDefaults sharedDefaults];
  LOBYTE(v3) = [v4 BOOLForKey:*v3];

  return (char)v3;
}

- (id)shardItemMatching:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self) {
    filterShardCache = self->_filterShardCache;
  }
  else {
    filterShardCache = 0;
  }
  id v6 = [(BCSShardCacheQueryable *)filterShardCache shardItemMatching:v4];
  uint64_t v7 = ABSLogCommon();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (!v8) {
      goto LABEL_9;
    }
    uint64_t v9 = NSStringFromBCSShardType([v4 type]);
    int v12 = 136315394;
    v13 = "-[BCSCacheManager shardItemMatching:]";
    __int16 v14 = 2112;
    v15 = v9;
    id v10 = "%s cached shard item found - type: %@";
  }
  else
  {
    if (!v8) {
      goto LABEL_9;
    }
    uint64_t v9 = NSStringFromBCSShardType([v4 type]);
    int v12 = 136315394;
    v13 = "-[BCSCacheManager shardItemMatching:]";
    __int16 v14 = 2112;
    v15 = v9;
    id v10 = "%s cached shard item not found - type: %@";
  }
  _os_log_impl(&dword_2154F4000, v7, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v12, 0x16u);

LABEL_9:

  return v6;
}

- (void)updateShardItem:(id)a3 withShardIdentifier:(id)a4
{
  id v10 = a3;
  if (self) {
    filterShardCache = self->_filterShardCache;
  }
  else {
    filterShardCache = 0;
  }
  id v7 = a4;
  [(BCSShardCacheQueryable *)filterShardCache updateShardItem:v10 withShardIdentifier:v7];
  uint64_t v8 = [v7 type];

  if (v8 == 3 && [v10 conformsToProtocol:&unk_26C634348])
  {
    if (self) {
      domainItemCache = self->_domainItemCache;
    }
    else {
      domainItemCache = 0;
    }
    [(BCSDomainItemCaching *)domainItemCache updateDomainItemsForDomainShard:v10];
  }
}

- (void)deleteShardItemMatching:(id)a3
{
  if (self) {
    self = (BCSCacheManager *)self->_filterShardCache;
  }
  [(BCSCacheManager *)self deleteShardItemMatching:a3];
}

- (void)deleteExpiredShardItemsOfType:(int64_t)a3
{
  if (a3 == 3)
  {
    if (self) {
      domainItemCache = self->_domainItemCache;
    }
    else {
      domainItemCache = 0;
    }
    [(BCSDomainItemCaching *)domainItemCache deleteAllExpiredDomainItems];
  }
  if (self) {
    filterShardCache = self->_filterShardCache;
  }
  else {
    filterShardCache = 0;
  }

  [(BCSShardCacheQueryable *)filterShardCache deleteExpiredShardItemsOfType:a3];
}

- (void)deleteShardItemsOfType:(int64_t)a3
{
  if (a3 == 3)
  {
    if (self) {
      domainItemCache = self->_domainItemCache;
    }
    else {
      domainItemCache = 0;
    }
    [(BCSDomainItemCaching *)domainItemCache deleteAllDomainItems];
  }
  if (self) {
    filterShardCache = self->_filterShardCache;
  }
  else {
    filterShardCache = 0;
  }

  [(BCSShardCacheQueryable *)filterShardCache deleteShardItemsOfType:a3];
}

- (int64_t)countOfShardsOfType:(int64_t)a3
{
  if (self) {
    self = (BCSCacheManager *)self->_filterShardCache;
  }
  return [(BCSCacheManager *)self countOfShardsOfType:a3];
}

- (int64_t)countOfExpiredShardsOfType:(int64_t)a3
{
  if (self) {
    self = (BCSCacheManager *)self->_filterShardCache;
  }
  return [(BCSCacheManager *)self countOfExpiredShardsOfType:a3];
}

- (void)beginBatch
{
  if (self)
  {
    [(BCSShardCacheQueryable *)self->_filterShardCache beginBatch];
    domainItemCache = self->_domainItemCache;
  }
  else
  {
    [0 beginBatch];
    domainItemCache = 0;
  }

  [(BCSDomainItemCaching *)domainItemCache beginBatch];
}

- (void)endBatch
{
  if (self)
  {
    [(BCSShardCacheQueryable *)self->_filterShardCache endBatch];
    domainItemCache = self->_domainItemCache;
  }
  else
  {
    [0 endBatch];
    domainItemCache = 0;
  }

  [(BCSDomainItemCaching *)domainItemCache endBatch];
}

- (void)updateDomainItem:(id)a3 withDomainItemIdentifier:(id)a4
{
  if (self) {
    self = (BCSCacheManager *)self->_domainItemCache;
  }
  [(BCSCacheManager *)self updateDomainItem:a3 withDomainItemIdentifier:a4];
}

- (id)domainItemMatching:(id)a3
{
  if (self) {
    self = (BCSCacheManager *)self->_domainItemCache;
  }
  return [(BCSCacheManager *)self domainItemMatching:a3];
}

- (void)deleteDomainItemMatching:(id)a3
{
  if (self) {
    self = (BCSCacheManager *)self->_domainItemCache;
  }
  [(BCSCacheManager *)self deleteDomainItemMatching:a3];
}

- (void)deleteAllDomainItems
{
  if (self) {
    self = (BCSCacheManager *)self->_domainItemCache;
  }
  [(BCSCacheManager *)self deleteAllDomainItems];
}

- (void)deleteAllExpiredDomainItems
{
  if (self) {
    self = (BCSCacheManager *)self->_domainItemCache;
  }
  [(BCSCacheManager *)self deleteAllExpiredDomainItems];
}

- (void)updateDomainItemsForDomainShard:(id)a3
{
  if (self) {
    self = (BCSCacheManager *)self->_domainItemCache;
  }
  [(BCSCacheManager *)self updateDomainItemsForDomainShard:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemCache, 0);
  objc_storeStrong((id *)&self->_domainItemCache, 0);

  objc_storeStrong((id *)&self->_filterShardCache, 0);
}

@end