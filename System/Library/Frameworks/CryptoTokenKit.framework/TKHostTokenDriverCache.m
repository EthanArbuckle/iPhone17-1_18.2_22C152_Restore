@interface TKHostTokenDriverCache
- (BOOL)allowTestOnlyExtensions;
- (BOOL)avoidInitialKeepAlive;
- (NSArray)allowedExtensionClassIDs;
- (NSMutableDictionary)drivers;
- (TKHostTokenDriverCache)init;
- (TKHostTokenRegistry)registry;
- (double)idleTimeout;
- (id)hostTokenDriverFromExtension:(id)a3;
- (id)hostTokenDriverWithClassID:(id)a3 error:(id *)a4;
- (id)tokenExtensionsWithAttributes:(id)a3;
- (void)invalidate;
- (void)removeDriverWithClassID:(id)a3;
- (void)setAllowTestOnlyExtensions:(BOOL)a3;
- (void)setAllowedExtensionClassIDs:(id)a3;
- (void)setAvoidInitialKeepAlive:(BOOL)a3;
- (void)setIdleTimeout:(double)a3;
- (void)setRegistry:(id)a3;
@end

@implementation TKHostTokenDriverCache

- (TKHostTokenDriverCache)init
{
  v10.receiver = self;
  v10.super_class = (Class)TKHostTokenDriverCache;
  v2 = [(TKHostTokenDriverCache *)&v10 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    drivers = v2->_drivers;
    v2->_drivers = (NSMutableDictionary *)v3;

    v2->_idleTimeout = 5.0;
    v5 = (void *)CFPreferencesCopyValue(TKSmartCardPreferencesDisabledTokensKey, TKSmartCardPreferencesDomain, kCFPreferencesAnyUser, kCFPreferencesCurrentHost);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = &__NSArray0__struct;
    }
    objc_storeStrong((id *)&v2->_disabledExtensionIDs, v6);
    if ([(NSArray *)v2->_disabledExtensionIDs count])
    {
      v7 = sub_100011330();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        disabledExtensionIDs = v2->_disabledExtensionIDs;
        *(_DWORD *)buf = 138543362;
        v12 = disabledExtensionIDs;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Following token extensions disabled by configuration: %{public}@", buf, 0xCu);
      }
    }
  }
  return v2;
}

- (void)removeDriverWithClassID:(id)a3
{
  id v4 = a3;
  v5 = sub_100011330();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100015790();
  }

  v6 = self;
  objc_sync_enter(v6);
  v7 = [(NSMutableDictionary *)v6->_drivers objectForKey:v4];
  [(NSMutableDictionary *)v6->_drivers removeObjectForKey:v4];
  objc_sync_exit(v6);

  [v7 invalidate];
}

- (id)tokenExtensionsWithAttributes:(id)a3
{
  id v3 = a3;
  id v4 = [v3 mutableCopy];
  [v4 setObject:@"com.apple.ctk-tokens" forKeyedSubscript:NSExtensionPointName];
  id v50 = 0;
  v5 = +[NSExtension extensionsWithMatchingAttributes:v4 error:&v50];
  id v6 = v50;
  v7 = v6;
  if (v5)
  {
    id v32 = v6;
    id v34 = v4;
    v35 = v3;
    id v36 = [&__NSDictionary0__struct mutableCopy];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    v33 = v5;
    id v8 = v5;
    id v41 = [v8 countByEnumeratingWithState:&v46 objects:v58 count:16];
    if (v41)
    {
      uint64_t v39 = TKTokenClassDriverClassIDKey;
      uint64_t v40 = *(void *)v47;
      id obj = v8;
      do
      {
        for (i = 0; i != v41; i = (char *)i + 1)
        {
          if (*(void *)v47 != v40) {
            objc_enumerationMutation(obj);
          }
          objc_super v10 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          v11 = [v10 attributes];
          v12 = [v11 objectForKeyedSubscript:v39];

          long long v44 = 0u;
          long long v45 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          v13 = +[TKClientToken builtinTokenIDs];
          id v14 = [v13 countByEnumeratingWithState:&v42 objects:v57 count:16];
          if (v14)
          {
            id v15 = v14;
            uint64_t v16 = *(void *)v43;
            while (2)
            {
              for (j = 0; j != v15; j = (char *)j + 1)
              {
                if (*(void *)v43 != v16) {
                  objc_enumerationMutation(v13);
                }
                id v18 = [objc_alloc((Class)TKTokenID) initWithTokenID:*(void *)(*((void *)&v42 + 1) + 8 * (void)j)];
                v19 = [v18 classID];

                LOBYTE(v18) = [v19 isEqualToString:v12];
                if (v18)
                {

                  goto LABEL_20;
                }
              }
              id v15 = [v13 countByEnumeratingWithState:&v42 objects:v57 count:16];
              if (v15) {
                continue;
              }
              break;
            }
          }

          disabledExtensionIDs = self->_disabledExtensionIDs;
          v21 = [v10 identifier];
          LOBYTE(disabledExtensionIDs) = [(NSArray *)disabledExtensionIDs containsObject:v21];

          if ((disabledExtensionIDs & 1) == 0)
          {
            if ([(TKHostTokenDriverCache *)self allowTestOnlyExtensions]
              || ([v10 attributes],
                  v22 = objc_claimAutoreleasedReturnValue(),
                  [v22 objectForKeyedSubscript:@"com.apple.ctk.testonly"],
                  v23 = objc_claimAutoreleasedReturnValue(),
                  unsigned __int8 v24 = [v23 BOOLValue],
                  v23,
                  v22,
                  (v24 & 1) == 0))
            {
              [v36 setObject:v10 forKeyedSubscript:v12];
            }
          }
LABEL_20:
        }
        id v8 = obj;
        id v41 = [obj countByEnumeratingWithState:&v46 objects:v58 count:16];
      }
      while (v41);
    }

    v25 = sub_100011330();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v27 = [v36 count];
      unsigned int v28 = [v8 count];
      id v3 = v35;
      uint64_t v29 = [v35 objectForKeyedSubscript:TKTokenClassDriverClassIDKey];
      v30 = (void *)v29;
      CFStringRef v31 = @"<none>";
      *(_DWORD *)buf = 67109634;
      unsigned int v52 = v27;
      if (v29) {
        CFStringRef v31 = (const __CFString *)v29;
      }
      __int16 v53 = 1024;
      unsigned int v54 = v28;
      __int16 v55 = 2114;
      CFStringRef v56 = v31;
      _os_log_debug_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "returning %d extensions (%d enumerated) (filter classid=%{public}@)", buf, 0x18u);
    }
    else
    {
      id v3 = v35;
    }
    v5 = v33;
    id v4 = v34;
    v7 = v32;
  }
  else
  {
    v25 = sub_100011330();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_1000157F8();
    }
    id v36 = &__NSDictionary0__struct;
  }

  return v36;
}

- (id)hostTokenDriverFromExtension:(id)a3
{
  id v5 = a3;
  id v6 = [v5 attributes];
  uint64_t v7 = TKTokenClassDriverClassIDKey;
  id v8 = [v6 objectForKeyedSubscript:TKTokenClassDriverClassIDKey];

  if (!v8)
  {
    v13 = +[NSAssertionHandler currentHandler];
    id v14 = [v5 identifier];
    [v13 handleFailureInMethod:a2, self, @"TKHostTokenDriver.m", 424, @"token extension %@ has no %@ attribute", v14, v7 object file lineNumber description];
  }
  v9 = self;
  objc_sync_enter(v9);
  objc_super v10 = [(NSMutableDictionary *)v9->_drivers objectForKeyedSubscript:v8];
  if (!v10)
  {
    objc_super v10 = [[TKHostTokenDriver alloc] initWithExtension:v5 cache:v9];
    [(NSMutableDictionary *)v9->_drivers setObject:v10 forKeyedSubscript:v8];
    v11 = sub_100011330();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_10001586C();
    }
  }
  objc_sync_exit(v9);

  return v10;
}

- (id)hostTokenDriverWithClassID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v21 = TKTokenClassDriverClassIDKey;
  id v22 = v6;
  uint64_t v7 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  id v8 = [(TKHostTokenDriverCache *)self tokenExtensionsWithAttributes:v7];

  v9 = [v8 allValues];
  objc_super v10 = [v9 firstObject];

  if (v10)
  {
    if ((unint64_t)[v8 count] >= 2)
    {
      v11 = sub_100011330();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        unsigned int v15 = [v8 count];
        uint64_t v16 = [v10 identifier];
        int v17 = 67109634;
        *(_DWORD *)id v18 = v15;
        *(_WORD *)&v18[4] = 2114;
        *(void *)&v18[6] = v6;
        __int16 v19 = 2114;
        v20 = v16;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "detected %d drivers implementing '%{public}@' token class, using '%{public}@' and ignoring the rest", (uint8_t *)&v17, 0x1Cu);
      }
    }
    v12 = [(TKHostTokenDriverCache *)self hostTokenDriverFromExtension:v10];
  }
  else
  {
    v13 = sub_100011330();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138543362;
      *(void *)id v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "requested driver for token class '%{public}@' not found in the system", (uint8_t *)&v17, 0xCu);
    }

    if (a4)
    {
      +[NSError errorWithDomain:TKErrorDomain code:-7 userInfo:0];
      v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (void)invalidate
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(NSMutableDictionary *)v2->_drivers allValues];
  [(NSMutableDictionary *)v2->_drivers removeAllObjects];
  objc_sync_exit(v2);

  id v4 = sub_100011330();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1000158D4(v3, v4);
  }

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)v8), "invalidate", (void)v9);
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (double)idleTimeout
{
  return self->_idleTimeout;
}

- (void)setIdleTimeout:(double)a3
{
  self->_idleTimeout = a3;
}

- (TKHostTokenRegistry)registry
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_registry);

  return (TKHostTokenRegistry *)WeakRetained;
}

- (void)setRegistry:(id)a3
{
}

- (NSArray)allowedExtensionClassIDs
{
  return self->_allowedExtensionClassIDs;
}

- (void)setAllowedExtensionClassIDs:(id)a3
{
}

- (BOOL)allowTestOnlyExtensions
{
  return self->_allowTestOnlyExtensions;
}

- (void)setAllowTestOnlyExtensions:(BOOL)a3
{
  self->_allowTestOnlyExtensions = a3;
}

- (BOOL)avoidInitialKeepAlive
{
  return self->_avoidInitialKeepAlive;
}

- (void)setAvoidInitialKeepAlive:(BOOL)a3
{
  self->_avoidInitialKeepAlive = a3;
}

- (NSMutableDictionary)drivers
{
  return self->_drivers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drivers, 0);
  objc_storeStrong((id *)&self->_allowedExtensionClassIDs, 0);
  objc_destroyWeak((id *)&self->_registry);

  objc_storeStrong((id *)&self->_disabledExtensionIDs, 0);
}

@end