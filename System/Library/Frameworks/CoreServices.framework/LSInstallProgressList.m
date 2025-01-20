@interface LSInstallProgressList
- (LSInstallProgressList)init;
- (id)description;
- (id)progressForBundleID:(id)a3;
- (id)subscriberForBundleID:(id)a3 andPublishingKey:(id)a4;
- (void)addSubscriber:(id)a3 forPublishingKey:(id)a4 andBundleID:(id)a5;
- (void)removeProgressForBundleID:(id)a3;
- (void)removeSubscriberForPublishingKey:(id)a3 andBundleID:(id)a4;
- (void)setProgress:(id)a3 forBundleID:(id)a4;
@end

@implementation LSInstallProgressList

- (LSInstallProgressList)init
{
  v8.receiver = self;
  v8.super_class = (Class)LSInstallProgressList;
  v2 = [(LSInstallProgressList *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:0];
    progresses = v2->_progresses;
    v2->_progresses = (NSMutableDictionary *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:0];
    subscriptions = v2->_subscriptions;
    v2->_subscriptions = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (id)progressForBundleID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  v6 = [(NSMutableDictionary *)v5->_progresses objectForKey:v4];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  objc_sync_exit(v5);

  return v7;
}

- (void)setProgress:(id)a3 forBundleID:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = self;
  objc_sync_enter(v7);
  if ([(id)__LSDefaultsGetSharedInstance() isServer])
  {
    objc_super v8 = [(NSMutableDictionary *)v7->_progresses allKeys];
    char v9 = [v8 containsObject:v6];

    if ((v9 & 1) == 0) {
      MEMORY[0x185310450]();
    }
  }
  [(NSMutableDictionary *)v7->_progresses setObject:v10 forKey:v6];
  objc_sync_exit(v7);
}

- (void)addSubscriber:(id)a3 forPublishingKey:(id)a4 andBundleID:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  objc_sync_enter(v11);
  v12 = _LSProgressLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v9;
    _os_log_impl(&dword_182959000, v12, OS_LOG_TYPE_DEFAULT, "#LSInstallProgressList add subscriber: %@ publishingString: %@", (uint8_t *)&v14, 0x16u);
  }

  v13 = [(NSMutableDictionary *)v11->_subscriptions objectForKey:v9];
  if (!v13)
  {
    v13 = [MEMORY[0x1E4F1CA48] array];
    [(NSMutableDictionary *)v11->_subscriptions setObject:v13 forKey:v9];
  }
  [v13 addObject:v8];

  objc_sync_exit(v11);
}

- (id)subscriberForBundleID:(id)a3 andPublishingKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  id v9 = [(NSMutableDictionary *)v8->_subscriptions objectForKeyedSubscript:v7];
  objc_sync_exit(v8);

  return v9;
}

- (void)removeSubscriberForPublishingKey:(id)a3 andBundleID:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v14 = a4;
  id v7 = self;
  objc_sync_enter(v7);
  [(NSMutableDictionary *)v7->_subscriptions objectForKeyedSubscript:v6];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v13 = _LSProgressLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v20 = v12;
          __int16 v21 = 2112;
          id v22 = v6;
          _os_log_impl(&dword_182959000, v13, OS_LOG_TYPE_DEFAULT, "#LSInstallProgressList remove subscriber: %@ publishingString: %@", buf, 0x16u);
        }

        objc_msgSend(MEMORY[0x1E4F28F90], "_removeSubscriber:", v12, v14);
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v9);
  }

  [(NSMutableDictionary *)v7->_subscriptions removeObjectForKey:v6];
  objc_sync_exit(v7);
}

- (void)removeProgressForBundleID:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if ([(id)__LSDefaultsGetSharedInstance() isServer])
  {
    uint64_t v5 = [(NSMutableDictionary *)v4->_progresses allKeys];
    int v6 = [v5 containsObject:v7];

    if (v6) {
      MEMORY[0x185310460]();
    }
  }
  [(NSMutableDictionary *)v4->_progresses removeObjectForKey:v7];
  objc_sync_exit(v4);
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"LSInstallProgressList: %@, %@", self->_progresses, self->_subscriptions];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptions, 0);

  objc_storeStrong((id *)&self->_progresses, 0);
}

@end