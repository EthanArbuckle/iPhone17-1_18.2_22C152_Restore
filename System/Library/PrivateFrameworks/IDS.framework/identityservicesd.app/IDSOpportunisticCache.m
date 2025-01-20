@interface IDSOpportunisticCache
- (BOOL)addData:(id)a3 withError:(id *)a4;
- (BOOL)clearKeychainWithError:(id *)a3;
- (BOOL)removeDataWithIdentifier:(id)a3 serviceName:(id)a4 withError:(id *)a5;
- (BOOL)saveOpportunisticCache:(id)a3 withError:(id *)a4;
- (IDSFrequentURISuggester)uriSuggester;
- (IDSKeychainWrapper)keychainWrapper;
- (IDSOpportunisticCache)init;
- (IDSOpportunisticCache)initWithKeychainWrapper:(id)a3 uriSuggester:(id)a4;
- (NSMutableDictionary)keychainCache;
- (id)dataForService:(id)a3 identifier:(id)a4;
- (id)description;
- (id)fetchOpportunisticCacheWithError:(id *)a3;
- (id)selectDataForDestination:(id)a3;
- (int64_t)accessCount;
- (void)copyCacheWithBlock:(id)a3;
- (void)limitDataInDictionary:(id)a3 forService:(id)a4;
- (void)mergeKeychainCacheDataIntoDictionary:(id)a3 forService:(id)a4;
- (void)mergeKeychainCacheIntoDictionary:(id)a3;
- (void)selectServicesForKeychainCacheFromDictionary:(id)a3;
- (void)setAccessCount:(int64_t)a3;
- (void)setKeychainCache:(id)a3;
- (void)setKeychainWrapper:(id)a3;
- (void)setUriSuggester:(id)a3;
- (void)syncCacheWithKeychain;
@end

@implementation IDSOpportunisticCache

- (IDSOpportunisticCache)init
{
  v3 = objc_alloc_init(IDSKeychainWrapper);
  v4 = objc_alloc_init(IDSFrequentURISuggester);
  v5 = [(IDSOpportunisticCache *)self initWithKeychainWrapper:v3 uriSuggester:v4];

  return v5;
}

- (IDSOpportunisticCache)initWithKeychainWrapper:(id)a3 uriSuggester:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IDSOpportunisticCache;
  v9 = [(IDSOpportunisticCache *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_keychainWrapper, a3);
    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    keychainCache = v10->_keychainCache;
    v10->_keychainCache = v11;

    objc_storeStrong((id *)&v10->_uriSuggester, a4);
    v10->_accessCount = 20;
  }

  return v10;
}

- (id)fetchOpportunisticCacheWithError:(id *)a3
{
  keychainWrapper = self->_keychainWrapper;
  id v16 = 0;
  v5 = [(IDSKeychainWrapper *)keychainWrapper dataForIdentifier:@"OpportunisticCache" error:&v16];
  id v6 = v16;
  if (v6 && !+[IDSKeychainWrapper isItemNotFoundError:v6])
  {
    v13 = +[IDSFoundationLog opportunistic];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Failed to load keychain. Can't sync cache with keychain. {error: %@}", buf, 0xCu);
    }

    id v10 = 0;
  }
  else
  {
    if (!v5) {
      goto LABEL_8;
    }
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    id v15 = 0;
    id v10 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v9 fromData:v5 error:&v15];
    id v11 = v15;

    if (v11)
    {
      v12 = +[IDSFoundationLog opportunistic];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Error unarchiving -- dropping {unarchiveError: %@}", buf, 0xCu);
      }

      goto LABEL_8;
    }
    if (!v10) {
LABEL_8:
    }
      id v10 = objc_alloc_init((Class)NSMutableDictionary);
  }
  if (a3) {
    *a3 = v6;
  }

  return v10;
}

- (BOOL)saveOpportunisticCache:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  if (!v6)
  {
    keychainWrapper = self->_keychainWrapper;
    id v13 = 0;
    [(IDSKeychainWrapper *)keychainWrapper removeDataForIdentifier:@"OpportunisticCache" dataProtectionClass:2 error:&v13];
    uint64_t v8 = v13;
    if (!a4) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  id v15 = 0;
  uint64_t v7 = +[NSKeyedArchiver archivedDataWithRootObject:v6 requiringSecureCoding:0 error:&v15];
  uint64_t v8 = v15;
  if (v7)
  {
    v9 = self->_keychainWrapper;
    objc_super v14 = v8;
    [(IDSKeychainWrapper *)v9 saveData:v7 forIdentifier:@"OpportunisticCache" allowSync:0 dataProtectionClass:2 error:&v14];
    id v10 = v8;
    uint64_t v8 = v14;
  }
  else
  {
    id v10 = +[IDSFoundationLog opportunistic];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_100708CA4((uint64_t)v8, (uint64_t)v6, v10);
    }
  }

  if (a4) {
LABEL_9:
  }
    *a4 = v8;
LABEL_10:

  return v8 != 0;
}

- (void)copyCacheWithBlock:(id)a3
{
  id v16 = (void (**)(id, id))a3;
  id v18 = objc_alloc_init((Class)NSMutableDictionary);
  [(IDSOpportunisticCache *)self fetchOpportunisticCacheWithError:0];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v19 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v19)
  {
    uint64_t v17 = *(void *)v26;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        id v6 = [obj objectForKeyedSubscript:v5];
        id v7 = objc_alloc_init((Class)NSMutableDictionary);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v8 = v6;
        id v9 = [v8 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v22;
          do
          {
            for (j = 0; j != v10; j = (char *)j + 1)
            {
              if (*(void *)v22 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * (void)j);
              objc_super v14 = [v8 objectForKeyedSubscript:v13];
              id v15 = [v14 copy];
              [v7 setObject:v15 forKeyedSubscript:v13];
            }
            id v10 = [v8 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v10);
        }

        [v18 setObject:v7 forKeyedSubscript:v5];
      }
      id v19 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v19);
  }
  v16[2](v16, v18);
}

- (BOOL)clearKeychainWithError:(id *)a3
{
  [(NSMutableDictionary *)self->_keychainCache removeAllObjects];
  BOOL v5 = [(IDSOpportunisticCache *)self saveOpportunisticCache:0 withError:a3];
  id v6 = +[IDSFoundationLog opportunistic];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (a3) {
      id v7 = *a3;
    }
    else {
      id v7 = 0;
    }
    int v9 = 138412290;
    id v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Dropped opportunistic cache {err: %@}", (uint8_t *)&v9, 0xCu);
  }

  return v5;
}

- (BOOL)addData:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  id v7 = [(IDSOpportunisticCache *)self fetchOpportunisticCacheWithError:a4];
  if (v7)
  {
    [(IDSOpportunisticCache *)self mergeKeychainCacheIntoDictionary:v7];
    id v8 = [v6 serviceName];
    int v9 = [v7 objectForKeyedSubscript:v8];

    if (!v9)
    {
      id v18 = [v6 data];

      if (v18)
      {
        id v19 = objc_alloc((Class)NSMutableDictionary);
        v20 = [v6 identifier];
        v36 = v20;
        id v37 = v6;
        long long v21 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
        id v22 = [v19 initWithDictionary:v21];
        long long v23 = [v6 serviceName];
        [v7 setObject:v22 forKeyedSubscript:v23];
      }
LABEL_15:
      long long v24 = [v6 serviceName];
      long long v25 = [v7 objectForKeyedSubscript:v24];

      if (v25)
      {
        long long v26 = [v6 serviceName];
        [(IDSOpportunisticCache *)self limitDataInDictionary:v7 forService:v26];

        keychainCache = self->_keychainCache;
        long long v28 = [v6 serviceName];
        v29 = [(NSMutableDictionary *)keychainCache objectForKeyedSubscript:v28];
        if (v29)
        {

LABEL_19:
          v31 = [v6 serviceName];
          v32 = [v7 objectForKeyedSubscript:v31];
          v33 = self->_keychainCache;
          v34 = [v6 serviceName];
          [(NSMutableDictionary *)v33 setObject:v32 forKeyedSubscript:v34];

          goto LABEL_20;
        }
        id v30 = [(NSMutableDictionary *)self->_keychainCache count];

        if ((unint64_t)v30 < 3) {
          goto LABEL_19;
        }
      }
LABEL_20:
      BOOL v16 = [(IDSOpportunisticCache *)self saveOpportunisticCache:v7 withError:a4];

      goto LABEL_21;
    }
    id v10 = [v6 identifier];
    uint64_t v11 = [v9 objectForKeyedSubscript:v10];

    if (v11
      && ([v11 data],
          v12 = objc_claimAutoreleasedReturnValue(),
          [v6 data],
          uint64_t v13 = objc_claimAutoreleasedReturnValue(),
          unsigned int v14 = [v12 isEqual:v13],
          v13,
          v12,
          v14))
    {
      id v15 = [v6 options];
      [v11 setOptions:v15];
    }
    else
    {
      uint64_t v17 = [v6 data];

      if (v17)
      {
        id v15 = [v6 identifier];
        [v9 setObject:v6 forKeyedSubscript:v15];
      }
      else
      {
        if (!v11)
        {
LABEL_14:

          goto LABEL_15;
        }
        id v15 = [v6 identifier];
        [v9 removeObjectForKey:v15];
      }
    }

    goto LABEL_14;
  }
  BOOL v16 = 0;
LABEL_21:

  return v16;
}

- (BOOL)removeDataWithIdentifier:(id)a3 serviceName:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(IDSOpportunisticCache *)self fetchOpportunisticCacheWithError:a5];
  if (v10)
  {
    [(IDSOpportunisticCache *)self mergeKeychainCacheIntoDictionary:v10];
    uint64_t v11 = [v10 objectForKeyedSubscript:v9];
    v12 = v11;
    if (v11)
    {
      uint64_t v13 = [v11 objectForKeyedSubscript:v8];
      if (v13)
      {
        [v12 removeObjectForKey:v8];
        [(NSMutableDictionary *)self->_keychainCache setObject:v12 forKeyedSubscript:v9];
      }
    }
    BOOL v14 = [(IDSOpportunisticCache *)self saveOpportunisticCache:v10 withError:a5];
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (void)syncCacheWithKeychain
{
  uint64_t v3 = [(IDSOpportunisticCache *)self fetchOpportunisticCacheWithError:0];
  if (v3)
  {
    uint64_t v4 = v3;
    [(IDSOpportunisticCache *)self mergeKeychainCacheIntoDictionary:v3];
    [(IDSOpportunisticCache *)self selectServicesForKeychainCacheFromDictionary:v4];
    self->_accessCount = 0;
    [(IDSOpportunisticCache *)self saveOpportunisticCache:v4 withError:0];
  }

  _objc_release_x1();
}

- (void)mergeKeychainCacheIntoDictionary:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v5 = [(NSMutableDictionary *)self->_keychainCache allKeys];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(IDSOpportunisticCache *)self mergeKeychainCacheDataIntoDictionary:v4 forService:*(void *)(*((void *)&v10 + 1) + 8 * (void)v9)];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)mergeKeychainCacheDataIntoDictionary:(id)a3 forService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NSMutableDictionary *)self->_keychainCache objectForKeyedSubscript:v7];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = [v8 allKeys];
  id v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        BOOL v14 = [v8 objectForKeyedSubscript:v13];
        id v15 = [v6 objectForKeyedSubscript:v7];

        if (!v15)
        {
          id v16 = objc_alloc_init((Class)NSMutableDictionary);
          [v6 setObject:v16 forKeyedSubscript:v7];
        }
        unsigned __int8 v17 = [v14 isInvalid];
        id v18 = [v6 objectForKeyedSubscript:v7];
        id v19 = v18;
        if (v17)
        {
          v20 = [v18 objectForKeyedSubscript:v13];

          if (!v20) {
            goto LABEL_13;
          }
          id v19 = [v6 objectForKeyedSubscript:v7];
          [v19 removeObjectForKey:v13];
        }
        else
        {
          [v18 setObject:v14 forKeyedSubscript:v13];
        }

LABEL_13:
      }
      id v10 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }
}

- (void)limitDataInDictionary:(id)a3 forService:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 objectForKeyedSubscript:v6];
  id v8 = [v7 count];

  if ((unint64_t)v8 >= 6)
  {
    do
    {
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v9 = [v5 objectForKeyedSubscript:v6];
      id v10 = [v9 allKeys];

      id obj = v10;
      id v32 = [v10 countByEnumeratingWithState:&v33 objects:v37 count:16];
      id v11 = 0;
      if (v32)
      {
        uint64_t v31 = *(void *)v34;
        do
        {
          long long v12 = 0;
          do
          {
            if (*(void *)v34 != v31) {
              objc_enumerationMutation(obj);
            }
            uint64_t v13 = *(void **)(*((void *)&v33 + 1) + 8 * (void)v12);
            if (v11)
            {
              BOOL v14 = [v5 objectForKeyedSubscript:v6];
              id v15 = [v14 objectForKeyedSubscript:v13];

              id v16 = v5;
              id v17 = v6;
              id v18 = [v5 objectForKeyedSubscript:v6];
              id v19 = [v18 objectForKeyedSubscript:v11];

              v20 = [v15 options];
              long long v21 = [v20 expiryDate];

              long long v22 = [v19 options];
              long long v23 = [v22 expiryDate];

              if (v21 && (!v23 || [v21 compare:v23] == (id)-1))
              {
                id v24 = v13;

                id v11 = v24;
              }

              id v5 = v16;
              id v6 = v17;
            }
            else
            {
              id v11 = v13;
            }
            long long v12 = (char *)v12 + 1;
          }
          while (v32 != v12);
          id v32 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
        }
        while (v32);
      }

      long long v25 = [v5 objectForKeyedSubscript:v6];
      [v25 removeObjectForKey:v11];

      long long v26 = [v5 objectForKeyedSubscript:v6];
      id v27 = [v26 count];
    }
    while ((unint64_t)v27 > 5);
  }
  long long v28 = [v5 objectForKeyedSubscript:v6];
  id v29 = [v28 count];

  if (!v29) {
    [v5 removeObjectForKey:v6];
  }
}

- (void)selectServicesForKeychainCacheFromDictionary:(id)a3
{
  id v8 = a3;
  [(NSMutableDictionary *)self->_keychainCache removeAllObjects];
  id v4 = [v8 allKeys];
  if ([v4 count])
  {
    int v5 = 3;
    do
    {
      id v6 = objc_msgSend(v4, "objectAtIndexedSubscript:", arc4random_uniform((uint32_t)objc_msgSend(v4, "count")));
      id v7 = [v8 objectForKeyedSubscript:v6];
      [(NSMutableDictionary *)self->_keychainCache setObject:v7 forKeyedSubscript:v6];

      --v5;
    }
    while (v5);
  }
}

- (id)selectDataForDestination:(id)a3
{
  id v4 = a3;
  int64_t accessCount = self->_accessCount;
  self->_int64_t accessCount = accessCount + 1;
  if (accessCount >= 19)
  {
    [(IDSOpportunisticCache *)self syncCacheWithKeychain];
    self->_int64_t accessCount = 0;
  }
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_100011D98;
  v47[3] = &unk_10097E468;
  id v27 = objc_alloc_init((Class)NSMutableDictionary);
  id v48 = v27;
  long long v34 = objc_retainBlock(v47);
  id v33 = objc_alloc_init((Class)NSMutableArray);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = [(NSMutableDictionary *)self->_keychainCache allKeys];
  id v31 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v31)
  {
    uint64_t v29 = *(void *)v44;
    id v30 = self;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v44 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v32 = v6;
        id v7 = -[NSMutableDictionary objectForKeyedSubscript:](self->_keychainCache, "objectForKeyedSubscript:", *(void *)(*((void *)&v43 + 1) + 8 * v6), v27);
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v8 = [v7 allKeys];
        id v9 = [v8 countByEnumeratingWithState:&v39 objects:v50 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v40;
          do
          {
            for (i = 0; i != v10; i = (char *)i + 1)
            {
              if (*(void *)v40 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = [v7 objectForKeyedSubscript:*(void *)(*((void *)&v39 + 1) + 8 * i)];
              if ([v13 shouldSendToDestination:v4])
              {
                BOOL v14 = [v13 options];
                unsigned int v15 = [v14 destinationsMustBeInContacts];

                if (v15) {
                  [v33 addObject:v13];
                }
                else {
                  ((void (*)(void *, void *))v34[2])(v34, v13);
                }
              }
            }
            id v10 = [v8 countByEnumeratingWithState:&v39 objects:v50 count:16];
          }
          while (v10);
        }

        uint64_t v6 = v32 + 1;
        self = v30;
      }
      while ((id)(v32 + 1) != v31);
      id v31 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
    }
    while (v31);
  }

  if ([v33 count]
    && [(IDSFrequentURISuggester *)self->_uriSuggester checkContactsForDestination:v4])
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v16 = v33;
    id v17 = [v16 countByEnumeratingWithState:&v35 objects:v49 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v36;
      do
      {
        for (j = 0; j != v18; j = (char *)j + 1)
        {
          if (*(void *)v36 != v19) {
            objc_enumerationMutation(v16);
          }
          ((void (*)(void *, void))v34[2])(v34, *(void *)(*((void *)&v35 + 1) + 8 * (void)j));
        }
        id v18 = [v16 countByEnumeratingWithState:&v35 objects:v49 count:16];
      }
      while (v18);
    }
  }
  long long v21 = v27;
  if (objc_msgSend(v27, "count", v27))
  {
    long long v22 = [v21 allKeys];
    long long v23 = objc_msgSend(v22, "objectAtIndexedSubscript:", arc4random_uniform((uint32_t)objc_msgSend(v22, "count")));
    id v24 = [v21 objectForKeyedSubscript:v23];
    long long v25 = objc_msgSend(v24, "objectAtIndexedSubscript:", arc4random_uniform((uint32_t)objc_msgSend(v24, "count")));
  }
  else
  {
    long long v25 = 0;
  }

  return v25;
}

- (id)dataForService:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NSMutableDictionary *)self->_keychainCache objectForKeyedSubscript:v6];

  if (v8)
  {
    id v9 = [(NSMutableDictionary *)self->_keychainCache objectForKeyedSubscript:v6];
    id v10 = [v9 objectForKeyedSubscript:v7];
  }
  else
  {
    uint64_t v14 = 0;
    long long v12 = [(IDSOpportunisticCache *)self fetchOpportunisticCacheWithError:&v14];
    id v9 = v12;
    if (v12)
    {
      id v10 = [v12 objectForKeyedSubscript:v6];

      if (v10)
      {
        uint64_t v13 = [v9 objectForKeyedSubscript:v6];
        id v10 = [v13 objectForKeyedSubscript:v7];
      }
    }
    else
    {
      id v10 = 0;
    }
  }

  return v10;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  int64_t v4 = [(IDSOpportunisticCache *)self accessCount];
  int v5 = [(IDSOpportunisticCache *)self keychainCache];
  id v6 = +[NSString stringWithFormat:@"<%@:%p accessCount: %lld, cache: %@>", v3, self, v4, v5];

  return v6;
}

- (NSMutableDictionary)keychainCache
{
  return self->_keychainCache;
}

- (void)setKeychainCache:(id)a3
{
}

- (int64_t)accessCount
{
  return self->_accessCount;
}

- (void)setAccessCount:(int64_t)a3
{
  self->_int64_t accessCount = a3;
}

- (IDSKeychainWrapper)keychainWrapper
{
  return self->_keychainWrapper;
}

- (void)setKeychainWrapper:(id)a3
{
}

- (IDSFrequentURISuggester)uriSuggester
{
  return self->_uriSuggester;
}

- (void)setUriSuggester:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uriSuggester, 0);
  objc_storeStrong((id *)&self->_keychainWrapper, 0);

  objc_storeStrong((id *)&self->_keychainCache, 0);
}

@end