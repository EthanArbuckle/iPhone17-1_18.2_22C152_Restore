@interface BMDistributedContextSubscriptionManager
+ (id)loadAndMigrateStorageFromLegacyToV1:(id)a3 withLocalDeviceID:(id)a4;
+ (id)loadFromStorage:(id)a3 withLocalDeviceID:(id)a4;
+ (unint64_t)storageVersion:(id)a3;
- (BMDistributedContextSubscriptionManager)initWithStorage:(id)a3;
- (BMDistributedContextSubscriptionStorage)storage;
- (BOOL)addSubscriptions:(id)a3;
- (BOOL)removeAllSubscriptionsMadeBySubscribingDevice:(id)a3;
- (BOOL)removeSubscription:(id)a3;
- (BOOL)removeSubscriptionWithIdentifier:(id)a3 fromSubscribingDevice:(id)a4 onSubscribedDevice:(id)a5;
- (NSMutableArray)subscriptions;
- (id)allSubscriptionIdentifiers;
- (id)allSubscriptions;
- (id)deviceIdentifiersWithActiveSubscriptions;
- (id)subscribingDevicesForIdentifier:(id)a3 subscribedToDevice:(id)a4;
- (id)subscriptionForIdentifier:(id)a3 fromSubscribingDevice:(id)a4 onSubscribedDevice:(id)a5;
- (id)subscriptionsWithIdentifier:(id)a3 subscribedToDevice:(id)a4;
- (id)subscriptionsWithSubscribedDevice:(id)a3;
- (id)subscriptionsWithSubscribingDevice:(id)a3;
- (void)saveToStorage;
- (void)setStorage:(id)a3;
- (void)setSubscriptions:(id)a3;
@end

@implementation BMDistributedContextSubscriptionManager

- (BMDistributedContextSubscriptionManager)initWithStorage:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BMDistributedContextSubscriptionManager;
  v6 = [(BMDistributedContextSubscriptionManager *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_storage, a3);
    uint64_t v8 = objc_opt_new();
    subscriptions = v7->_subscriptions;
    v7->_subscriptions = (NSMutableArray *)v8;
  }
  return v7;
}

- (void)saveToStorage
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = self->_subscriptions;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v8), "dictionaryRepresentation", (void)v12);
        [v3 addObject:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v10 = [v3 count];
  storage = self->_storage;
  if (v10) {
    [(BMDistributedContextSubscriptionStorage *)storage setObject:v3 forKey:@"subscriptions"];
  }
  else {
    [(BMDistributedContextSubscriptionStorage *)storage removeObjectForKey:@"subscriptions"];
  }
  [(BMDistributedContextSubscriptionStorage *)self->_storage setObject:&unk_26D209BF0, @"storageVersion", (void)v12 forKey];
}

+ (id)loadFromStorage:(id)a3 withLocalDeviceID:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([(id)objc_opt_class() storageVersion:v6])
  {
    uint64_t v8 = [v6 objectForKey:@"subscriptions"];
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v9 = __biome_log_for_category();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        +[BMDistributedContextSubscriptionManager loadFromStorage:withLocalDeviceID:](v9);
      }
      v19 = 0;
    }
    else
    {
      v9 = objc_opt_new();
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v10 = v8;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v27 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v22 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * i);
            v16 = [BMDistributedContextSubscription alloc];
            id v17 = -[BMDistributedContextSubscription initFromDictionary:](v16, "initFromDictionary:", v15, (void)v21);
            [v9 addObject:v17];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v27 count:16];
        }
        while (v12);
      }

      v18 = __biome_log_for_category();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v9;
        _os_log_impl(&dword_2201A2000, v18, OS_LOG_TYPE_DEFAULT, "Loaded subscriptions from default %@", buf, 0xCu);
      }

      v19 = [[BMDistributedContextSubscriptionManager alloc] initWithStorage:v6];
      [(BMDistributedContextSubscriptionManager *)v19 addSubscriptions:v9];
    }
  }
  else
  {
    v19 = [a1 loadAndMigrateStorageFromLegacyToV1:v6 withLocalDeviceID:v7];
  }

  return v19;
}

+ (unint64_t)storageVersion:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKey:@"storageVersion"];

  if (v4)
  {
    uint64_t v5 = [v3 objectForKey:@"storageVersion"];
    v4 = (void *)[v5 integerValue];
  }
  return (unint64_t)v4;
}

+ (id)loadAndMigrateStorageFromLegacyToV1:(id)a3 withLocalDeviceID:(id)a4
{
  uint64_t v101 = *MEMORY[0x263EF8340];
  id v53 = a3;
  id v5 = a4;
  id v6 = __biome_log_for_category();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2201A2000, v6, OS_LOG_TYPE_DEFAULT, "Subscription storage needs migration from legacy format, migrating", buf, 2u);
  }

  v64 = objc_opt_new();
  id v7 = [v53 objectForKey:@"localDSLIdentifiers"];
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v88 objects:v100 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v89;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v89 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v88 + 1) + 8 * i);
        uint64_t v13 = [v7 objectForKeyedSubscript:v12];
        long long v14 = -[NSData bmdsl_deserialize](v13);
        [v64 setObject:v14 forKeyedSubscript:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v88 objects:v100 count:16];
    }
    while (v9);
  }
  uint64_t v15 = objc_opt_new();
  [v53 objectForKey:@"remoteDSLIdentifiers"];
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = [obj countByEnumeratingWithState:&v84 objects:v99 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v85;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v85 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void *)(*((void *)&v84 + 1) + 8 * j);
        long long v21 = [obj objectForKeyedSubscript:v20];
        long long v22 = -[NSData bmdsl_deserialize](v21);
        [v15 setObject:v22 forKeyedSubscript:v20];
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v84 objects:v99 count:16];
    }
    while (v17);
  }
  v65 = objc_opt_new();
  [v53 objectForKey:@"subscriptions"];
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v57 = [v23 countByEnumeratingWithState:&v80 objects:v98 count:16];
  if (v57)
  {
    uint64_t v56 = *(void *)v81;
    long long v24 = @"wake";
    v54 = v23;
    v55 = v7;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v81 != v56) {
          objc_enumerationMutation(v23);
        }
        v26 = *(void **)(*((void *)&v80 + 1) + 8 * v25);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v49 = __biome_log_for_category();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
            +[BMDistributedContextSubscriptionManager loadAndMigrateStorageFromLegacyToV1:withLocalDeviceID:](v49);
          }

          goto LABEL_57;
        }
        uint64_t v58 = v25;
        v67 = v26;
        v27 = [v23 objectForKeyedSubscript:v26];
        long long v76 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        id v62 = v27;
        uint64_t v61 = [v27 countByEnumeratingWithState:&v76 objects:v97 count:16];
        if (!v61) {
          goto LABEL_51;
        }
        uint64_t v60 = *(void *)v77;
        do
        {
          uint64_t v28 = 0;
          do
          {
            if (*(void *)v77 != v60) {
              objc_enumerationMutation(v62);
            }
            uint64_t v63 = v28;
            v68 = *(void **)(*((void *)&v76 + 1) + 8 * v28);
            v29 = objc_msgSend(v62, "objectForKeyedSubscript:");
            long long v72 = 0u;
            long long v73 = 0u;
            long long v74 = 0u;
            long long v75 = 0u;
            id v71 = v29;
            uint64_t v70 = [v29 countByEnumeratingWithState:&v72 objects:v96 count:16];
            if (v70)
            {
              uint64_t v69 = *(void *)v73;
              do
              {
                for (uint64_t k = 0; k != v70; ++k)
                {
                  if (*(void *)v73 != v69) {
                    objc_enumerationMutation(v71);
                  }
                  uint64_t v31 = *(void *)(*((void *)&v72 + 1) + 8 * k);
                  v32 = [v71 objectForKeyedSubscript:v31];
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0
                    && ([v32 objectForKeyedSubscript:v24],
                        v33 = objc_claimAutoreleasedReturnValue(),
                        v33,
                        v33))
                  {
                    id v34 = [v32 objectForKeyedSubscript:v24];
                  }
                  else
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0) {
                      goto LABEL_43;
                    }
                    id v34 = v32;
                  }
                  v35 = v34;
                  if (!v34)
                  {
LABEL_43:
                    v40 = __biome_log_for_category();
                    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412546;
                      v93 = v65;
                      __int16 v94 = 2112;
                      uint64_t v95 = v31;
                      _os_log_error_impl(&dword_2201A2000, v40, OS_LOG_TYPE_ERROR, "Load from default error! Defaults: %@, Identifier: %@", buf, 0x16u);
                    }
                    v35 = 0;
                    goto LABEL_46;
                  }
                  char v36 = [v68 isEqual:v5];
                  v37 = v15;
                  if ((v36 & 1) != 0 || (int v38 = [v67 isEqual:v5], v37 = v64, v38))
                  {
                    uint64_t v39 = [v37 objectForKeyedSubscript:v31];
                    if (v39)
                    {
                      v40 = v39;
                      uint64_t v66 = [v35 BOOLValue];
                      v41 = v15;
                      v42 = [BMDistributedContextSubscriptionConfiguration alloc];
                      [MEMORY[0x263EFF910] now];
                      v43 = v24;
                      v45 = id v44 = v5;
                      v46 = v42;
                      uint64_t v15 = v41;
                      v47 = [(BMDistributedContextSubscriptionConfiguration *)v46 initWithOptions:v66 lastChangedDate:v45];

                      id v5 = v44;
                      long long v24 = v43;
                      v48 = [[BMDistributedContextSubscription alloc] initWithIdentifier:v31 dsl:v40 subscribingDevice:v67 subscribedDevice:v68 configuration:v47];
                      [v65 addObject:v48];

LABEL_46:
                    }
                  }
                }
                uint64_t v70 = [v71 countByEnumeratingWithState:&v72 objects:v96 count:16];
              }
              while (v70);
            }

            uint64_t v28 = v63 + 1;
          }
          while (v63 + 1 != v61);
          uint64_t v61 = [v62 countByEnumeratingWithState:&v76 objects:v97 count:16];
        }
        while (v61);
LABEL_51:

        uint64_t v25 = v58 + 1;
        id v23 = v54;
        id v7 = v55;
      }
      while (v58 + 1 != v57);
      uint64_t v57 = [v54 countByEnumeratingWithState:&v80 objects:v98 count:16];
    }
    while (v57);
  }
LABEL_57:

  v50 = __biome_log_for_category();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v93 = v65;
    _os_log_impl(&dword_2201A2000, v50, OS_LOG_TYPE_DEFAULT, "Migrated subscriptions from legacy storage, subscriptions are %@", buf, 0xCu);
  }

  v51 = [[BMDistributedContextSubscriptionManager alloc] initWithStorage:v53];
  [(BMDistributedContextSubscriptionManager *)v51 addSubscriptions:v65];
  [(BMDistributedContextSubscriptionManager *)v51 saveToStorage];
  [v53 removeObjectForKey:@"localDSLIdentifiers"];
  [v53 removeObjectForKey:@"remoteDSLIdentifiers"];

  return v51;
}

- (id)allSubscriptionIdentifiers
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = self->_subscriptions;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "identifier", (void)v12);
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v10 = [v3 allObjects];

  return v10;
}

- (id)allSubscriptions
{
  return self->_subscriptions;
}

- (id)deviceIdentifiersWithActiveSubscriptions
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = self->_subscriptions;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "subscribedDevice", (void)v14);
        [v3 addObject:v10];

        uint64_t v11 = [v9 subscribingDevice];
        [v3 addObject:v11];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  long long v12 = [v3 allObjects];

  return v12;
}

- (BOOL)addSubscriptions:(id)a3
{
  return 1;
}

- (id)subscriptionForIdentifier:(id)a3 fromSubscribingDevice:(id)a4 onSubscribedDevice:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v25 = a4;
  id v9 = a5;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v10 = self->_subscriptions;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (!v11) {
    goto LABEL_14;
  }
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)v28;
  do
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v28 != v13) {
        objc_enumerationMutation(v10);
      }
      long long v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
      long long v16 = objc_msgSend(v15, "identifier", v25);
      if (![v16 isEqualToString:v8]) {
        goto LABEL_11;
      }
      long long v17 = [v15 subscribedDevice];
      if (([v17 isEqualToString:v9] & 1) == 0)
      {

LABEL_11:
        continue;
      }
      [v15 subscribingDevice];
      uint64_t v18 = v13;
      id v19 = v8;
      uint64_t v20 = v10;
      v22 = id v21 = v9;
      char v26 = [v22 isEqualToString:v25];

      id v9 = v21;
      uint64_t v10 = v20;
      id v8 = v19;
      uint64_t v13 = v18;

      if (v26)
      {
        id v23 = v15;
        goto LABEL_15;
      }
    }
    uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
  }
  while (v12);
LABEL_14:
  id v23 = 0;
LABEL_15:

  return v23;
}

- (BOOL)removeSubscription:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 identifier];
  uint64_t v6 = [v4 subscribingDevice];
  uint64_t v7 = [v4 subscribedDevice];

  LOBYTE(self) = [(BMDistributedContextSubscriptionManager *)self removeSubscriptionWithIdentifier:v5 fromSubscribingDevice:v6 onSubscribedDevice:v7];
  return (char)self;
}

- (BOOL)removeSubscriptionWithIdentifier:(id)a3 fromSubscribingDevice:(id)a4 onSubscribedDevice:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v24 = a4;
  id v9 = a5;
  id v21 = self;
  long long v22 = objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v10 = self->_subscriptions;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v23 = 0;
    uint64_t v13 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v16 = objc_msgSend(v15, "identifier", v21);
        if (([v16 isEqualToString:v8] & 1) == 0) {
          goto LABEL_11;
        }
        long long v17 = [v15 subscribedDevice];
        if (([v17 isEqualToString:v9] & 1) == 0)
        {

LABEL_11:
          continue;
        }
        uint64_t v18 = [v15 subscribingDevice];
        int v19 = [v18 isEqualToString:v24];

        if (v19) {
          [v22 addIndex:v23 + i];
        }
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
      v23 += i;
    }
    while (v12);
  }

  [(NSMutableArray *)v21->_subscriptions removeObjectsAtIndexes:v22];
  [(BMDistributedContextSubscriptionManager *)v21 saveToStorage];

  return 1;
}

- (BOOL)removeAllSubscriptionsMadeBySubscribingDevice:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = self->_subscriptions;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v11), "subscribingDevice", (void)v15);
        int v13 = [v12 isEqualToString:v4];

        if (v13) {
          [v5 addIndex:v9 + v11];
        }
        ++v11;
      }
      while (v8 != v11);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      v9 += v11;
    }
    while (v8);
  }

  [(NSMutableArray *)self->_subscriptions removeObjectsAtIndexes:v5];
  [(BMDistributedContextSubscriptionManager *)self saveToStorage];

  return 1;
}

- (id)subscribingDevicesForIdentifier:(id)a3 subscribedToDevice:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v19 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v8 = self->_subscriptions;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        int v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        long long v14 = [v13 identifier];
        if ([v14 isEqualToString:v6])
        {
          long long v15 = [v13 subscribedDevice];
          int v16 = [v15 isEqual:v7];

          if (!v16) {
            continue;
          }
          long long v14 = [v13 subscribedDevice];
          [v19 addObject:v14];
        }
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  long long v17 = [v19 allObjects];

  return v17;
}

- (id)subscriptionsWithIdentifier:(id)a3 subscribedToDevice:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v18 = (id)objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v8 = self->_subscriptions;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        int v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        long long v14 = [v13 identifier];
        if ([v14 isEqualToString:v6])
        {
          long long v15 = [v13 subscribedDevice];
          int v16 = [v15 isEqual:v7];

          if (v16) {
            [v18 addObject:v13];
          }
        }
        else
        {
        }
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  return v18;
}

- (id)subscriptionsWithSubscribingDevice:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = self->_subscriptions;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "subscribingDevice", (void)v15);
        int v13 = [v12 isEqualToString:v4];

        if (v13) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)subscriptionsWithSubscribedDevice:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = self->_subscriptions;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "subscribedDevice", (void)v15);
        int v13 = [v12 isEqualToString:v4];

        if (v13) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (NSMutableArray)subscriptions
{
  return self->_subscriptions;
}

- (void)setSubscriptions:(id)a3
{
}

- (BMDistributedContextSubscriptionStorage)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_subscriptions, 0);
}

+ (void)loadFromStorage:(os_log_t)log withLocalDeviceID:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2201A2000, log, OS_LOG_TYPE_ERROR, "Attempting to load subscriptions but they are not stored in current format", v1, 2u);
}

+ (void)loadAndMigrateStorageFromLegacyToV1:(os_log_t)log withLocalDeviceID:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2201A2000, log, OS_LOG_TYPE_ERROR, "Attempting migration from legacy format but subscriptions are not in legacy format", v1, 2u);
}

@end