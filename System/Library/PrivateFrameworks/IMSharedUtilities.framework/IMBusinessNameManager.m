@interface IMBusinessNameManager
+ (id)placeholderBusinessNameForBrandURI:(id)a3;
+ (id)sharedInstance;
- (IMBusinessNameManager)init;
- (NSLock)cacheLock;
- (NSMutableDictionary)cache;
- (NSMutableDictionary)pendingRequests;
- (id)businessNameForUID:(id)a3 blockFetch:(BOOL)a4 updateHandler:(id)a5;
- (id)businessNameForUID:(id)a3 updateHandler:(id)a4;
- (void)_fetchBusinessNameForUID:(id)a3;
- (void)_fetchedBrandName:(id)a3 forUID:(id)a4;
- (void)setCache:(id)a3;
- (void)setCacheLock:(id)a3;
- (void)setPendingRequests:(id)a3;
@end

@implementation IMBusinessNameManager

- (IMBusinessNameManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)IMBusinessNameManager;
  v2 = [(IMBusinessNameManager *)&v10 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    cacheLock = v2->_cacheLock;
    v2->_cacheLock = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    cache = v2->_cache;
    v2->_cache = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    pendingRequests = v2->_pendingRequests;
    v2->_pendingRequests = v7;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_1EB4A65E8 != -1) {
    dispatch_once(&qword_1EB4A65E8, &unk_1EF2BF900);
  }
  if (qword_1EB4A6728 != -1) {
    dispatch_once(&qword_1EB4A6728, &unk_1EF2BE4D8);
  }
  if (qword_1EB4A65F0 != -1) {
    dispatch_once(&qword_1EB4A65F0, &unk_1EF2BE4F8);
  }
  v2 = (void *)qword_1EB4A6690;

  return v2;
}

- (id)businessNameForUID:(id)a3 updateHandler:(id)a4
{
  return (id)MEMORY[0x1F4181798](self, sel_businessNameForUID_blockFetch_updateHandler_);
}

- (id)businessNameForUID:(id)a3 blockFetch:(BOOL)a4 updateHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (v8 && (IMIsRunningInMessagesComposeViewService() & 1) == 0)
  {
    [(NSLock *)self->_cacheLock lock];
    v11 = [(IMBusinessNameManager *)self cache];
    objc_super v10 = [v11 objectForKey:v8];

    [(NSLock *)self->_cacheLock unlock];
    if (v10 || v6)
    {
      id v15 = v10;
    }
    else
    {
      if (!v9) {
        id v9 = &unk_1EF2BE538;
      }
      [(NSLock *)self->_cacheLock lock];
      v12 = [(NSMutableDictionary *)self->_pendingRequests objectForKeyedSubscript:v8];

      if (v12)
      {
        v13 = [(NSMutableDictionary *)self->_pendingRequests objectForKeyedSubscript:v8];
        v14 = _Block_copy(v9);
        [v13 addObject:v14];

        [(NSLock *)self->_cacheLock unlock];
      }
      else
      {
        id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        [(NSMutableDictionary *)self->_pendingRequests setObject:v16 forKeyedSubscript:v8];

        v17 = [(NSMutableDictionary *)self->_pendingRequests objectForKeyedSubscript:v8];
        v18 = _Block_copy(v9);
        [v17 addObject:v18];

        [(NSLock *)self->_cacheLock unlock];
        [(IMBusinessNameManager *)self _fetchBusinessNameForUID:v8];
      }
    }
  }
  else
  {
    objc_super v10 = 0;
  }

  return v10;
}

+ (id)placeholderBusinessNameForBrandURI:(id)a3
{
  return (id)MEMORY[0x1F4181798](IMBrand, sel_placeholderNameForBrandURI_);
}

- (void)_fetchBusinessNameForUID:(id)a3
{
  id v4 = a3;
  id location = 0;
  objc_initWeak(&location, self);
  v5 = +[IMBrandManager sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1A0833CDC;
  v7[3] = &unk_1E5A13480;
  id v6 = v4;
  id v8 = v6;
  objc_copyWeak(&v9, &location);
  [v5 brandWithURI:v6 completion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_fetchedBrandName:(id)a3 forUID:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IMBusinessNameManager *)self cacheLock];
  [v8 lock];

  if ([v6 length])
  {
    id v9 = [(IMBusinessNameManager *)self cache];
    [v9 setObject:v6 forKey:v7];
  }
  objc_super v10 = [(IMBusinessNameManager *)self pendingRequests];
  v11 = [v10 objectForKeyedSubscript:v7];

  v12 = [(IMBusinessNameManager *)self pendingRequests];
  [v12 setObject:0 forKeyedSubscript:v7];

  v13 = [(IMBusinessNameManager *)self cacheLock];
  [v13 unlock];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v14 = v11;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v19 + 1) + 8 * v18) + 16))(*(void *)(*((void *)&v19 + 1) + 8 * v18));
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v16);
  }
}

- (NSLock)cacheLock
{
  return (NSLock *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCacheLock:(id)a3
{
}

- (NSMutableDictionary)cache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCache:(id)a3
{
}

- (NSMutableDictionary)pendingRequests
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPendingRequests:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_cache, 0);

  objc_storeStrong((id *)&self->_cacheLock, 0);
}

@end