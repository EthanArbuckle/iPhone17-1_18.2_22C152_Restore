@interface CDFDonationFeedbackStore
+ (id)log_t;
- (BOOL)canHashDonation:(id)a3;
- (BOOL)donatedValueHasBeenConfirmedOrRejected:(id)a3 contactIdentifier:(id)a4;
- (CDFDonationFeedbackStore)init;
- (CDFDonationFeedbackStore)initWithKeyValueStore:(id)a3;
- (id)_hashableStringsForDonation:(id)a3;
- (id)_hashableStringsForDonation:(id)a3 contactIdentifier:(id)a4;
- (id)_hashesForDonation:(id)a3 contactIdentifier:(id)a4;
- (id)_loadHashesForKey:(id)a3;
- (id)_loadResetInfo;
- (id)_loadSalt;
- (id)_randomDataOfLength:(unint64_t)a3;
- (id)_sha256BytesForStrings:(id)a3 salt:(id)a4;
- (id)description;
- (void)_confirmOrRejectDonatedValues:(id)a3 contactIdentifier:(id)a4 completionHandler:(id)a5;
- (void)_handleHashesChangedNotification:(id)a3;
- (void)_hashStrings:(id)a3 salt:(id)a4 digest:(char *)a5;
- (void)_saveHashes:(id)a3 key:(id)a4;
- (void)_saveResetInfo;
- (void)reset;
- (void)synchronize;
@end

@implementation CDFDonationFeedbackStore

+ (id)log_t
{
  if (log_t_cn_once_token_1 != -1) {
    dispatch_once(&log_t_cn_once_token_1, &__block_literal_global);
  }
  v2 = (void *)log_t_cn_once_object_1;
  return v2;
}

uint64_t __33__CDFDonationFeedbackStore_log_t__block_invoke()
{
  log_t_cn_once_object_1 = (uint64_t)os_log_create("com.apple.contacts.donation", "feedback");
  return MEMORY[0x270F9A758]();
}

- (CDFDonationFeedbackStore)init
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F08C40]) initWithBundleIdentifier:@"com.apple.CoreSuggestions"];
  v4 = [(CDFDonationFeedbackStore *)self initWithKeyValueStore:v3];

  return v4;
}

- (CDFDonationFeedbackStore)initWithKeyValueStore:(id)a3
{
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CDFDonationFeedbackStore;
  v6 = [(CDFDonationFeedbackStore *)&v24 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_kvs, a3);
    v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:v7 selector:sel__handleHashesChangedNotification_ name:*MEMORY[0x263F085E8] object:v7->_kvs];

    if (![(NSUbiquitousKeyValueStore *)v7->_kvs synchronize])
    {
      v9 = objc_msgSend((id)objc_opt_class(), "log_t");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl(&dword_226C3C000, v9, OS_LOG_TYPE_DEFAULT, "Something went wrong with trying to synchronize KVS", v23, 2u);
      }
    }
    uint64_t v10 = [(CDFDonationFeedbackStore *)v7 _loadSalt];
    userSalt = v7->_userSalt;
    v7->_userSalt = (NSData *)v10;

    v12 = objc_msgSend((id)objc_opt_class(), "log_t");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[CDFDonationFeedbackStore initWithKeyValueStore:]((uint64_t *)&v7->_userSalt, v12);
    }

    if (v7->_userSalt)
    {
      v13 = [(CDFDonationFeedbackStore *)v7 _loadResetInfo];
      v14 = v13;
      if (v13)
      {
        uint64_t v15 = [v13 objectAtIndexedSubscript:0];
        resetGeneration = v7->_resetGeneration;
        v7->_resetGeneration = (NSNumber *)v15;

        uint64_t v17 = [v14 objectAtIndexedSubscript:1];
        resetTimestamp = v7->_resetTimestamp;
        v7->_resetTimestamp = (NSNumber *)v17;
      }
      uint64_t v19 = [(CDFDonationFeedbackStore *)v7 _loadHashesForKey:@"kCDFContactDonationHashesRecord"];
      hashes = v7->_hashes;
      v7->_hashes = (NSMutableSet *)v19;

      v21 = v7;
    }
    else
    {
      v14 = objc_msgSend((id)objc_opt_class(), "log_t");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl(&dword_226C3C000, v14, OS_LOG_TYPE_DEFAULT, "failed to get salt from KVS", v23, 2u);
      }
      v21 = 0;
    }
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)description
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = NSString;
  uint64_t v4 = [(NSMutableSet *)v2->_hashes count];
  id v5 = (void *)MEMORY[0x263EFF910];
  resetGeneration = v2->_resetGeneration;
  [(NSNumber *)v2->_resetTimestamp doubleValue];
  v7 = objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");
  v8 = [v3 stringWithFormat:@"<CDFDonationFeedbackStore %lu hashes reset:%@ at %@>", v4, resetGeneration, v7];

  objc_sync_exit(v2);
  return v8;
}

- (BOOL)donatedValueHasBeenConfirmedOrRejected:(id)a3 contactIdentifier:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  [(CDFDonationFeedbackStore *)v8 _hashesForDonation:v6 contactIdentifier:v7];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v9);
        }
        if (-[NSMutableSet containsObject:](v8->_hashes, "containsObject:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14))
        {
          LOBYTE(v10) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v8);
  return v10;
}

- (void)reset
{
  obj = self;
  objc_sync_enter(obj);
  uint64_t v2 = objc_opt_new();
  hashes = obj->_hashes;
  obj->_hashes = (NSMutableSet *)v2;

  [(CDFDonationFeedbackStore *)obj _saveHashes:obj->_hashes key:@"kCDFContactDonationHashesRecord"];
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", -[NSNumber unsignedLongValue](obj->_resetGeneration, "unsignedLongValue") + 1);
  resetGeneration = obj->_resetGeneration;
  obj->_resetGeneration = (NSNumber *)v4;

  id v6 = NSNumber;
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
  resetTimestamp = obj->_resetTimestamp;
  obj->_resetTimestamp = (NSNumber *)v7;

  [(CDFDonationFeedbackStore *)obj _saveResetInfo];
  [(CDFDonationFeedbackStore *)obj synchronize];
  objc_sync_exit(obj);
}

- (void)_confirmOrRejectDonatedValues:(id)a3 contactIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = dispatch_get_global_queue(9, 0);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __94__CDFDonationFeedbackStore__confirmOrRejectDonatedValues_contactIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_2647D4288;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

uint64_t __94__CDFDonationFeedbackStore__confirmOrRejectDonatedValues_contactIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v18;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = [*(id *)(a1 + 32) _hashesForDonation:*(void *)(*((void *)&v17 + 1) + 8 * v6) contactIdentifier:*(void *)(a1 + 48)];
        long long v15 = 0u;
        long long v16 = 0u;
        long long v13 = 0u;
        long long v14 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
        if (v9)
        {
          uint64_t v10 = *(void *)v14;
          do
          {
            uint64_t v11 = 0;
            do
            {
              if (*(void *)v14 != v10) {
                objc_enumerationMutation(v8);
              }
              [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(*((void *)&v13 + 1) + 8 * v11++)];
            }
            while (v9 != v11);
            uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
          }
          while (v9);
        }

        ++v6;
      }
      while (v6 != v4);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v4);
  }

  [*(id *)(a1 + 32) _saveHashes:*(void *)(*(void *)(a1 + 32) + 16) key:@"kCDFContactDonationHashesRecord"];
  objc_sync_exit(v2);

  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (id)_hashesForDonation:(id)a3 contactIdentifier:(id)a4
{
  v17[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ((*(unsigned int (**)(void))(*MEMORY[0x263F334E0] + 16))())
  {
    id v12 = (void *)MEMORY[0x263EFF940];
    long long v16 = @"donation";
    v17[0] = v6;
    long long v13 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
    id v14 = [v12 exceptionWithName:@"CDFErrorDomain" reason:@"Missing identifier" userInfo:v13];

    objc_exception_throw(v14);
  }
  id v8 = [(CDFDonationFeedbackStore *)self _hashableStringsForDonation:v6 contactIdentifier:v7];
  uint64_t v9 = [(CDFDonationFeedbackStore *)self _sha256BytesForStrings:v8 salt:self->_userSalt];
  long long v15 = v9;
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v15 count:1];

  return v10;
}

- (id)_hashableStringsForDonation:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(CNDFDonationStringCollector);
  [(CNDFDonationStringCollector *)v4 collectStringsFromDonation:v3];

  uint64_t v5 = [(CNDFDonationStringCollector *)v4 strings];

  return v5;
}

- (BOOL)canHashDonation:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(CNDFDonationStringCollector);
  [(CNDFDonationStringCollector *)v4 collectStringsFromDonation:v3];

  uint64_t v5 = *MEMORY[0x263F334B0];
  id v6 = [(CNDFDonationStringCollector *)v4 strings];
  LOBYTE(v5) = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v6) ^ 1;

  return v5;
}

- (id)_hashableStringsForDonation:(id)a3 contactIdentifier:(id)a4
{
  v17[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CDFDonationFeedbackStore *)self _hashableStringsForDonation:v6];
  if ((*(unsigned int (**)(void))(*MEMORY[0x263F334B0] + 16))())
  {
    id v12 = (void *)MEMORY[0x263EFF940];
    long long v16 = @"donation";
    v17[0] = v6;
    long long v13 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
    id v14 = [v12 exceptionWithName:@"CDFErrorDomain" reason:@"Insufficient values to hash error" userInfo:v13];

    objc_exception_throw(v14);
  }
  v15[0] = v7;
  v15[1] = v8;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
  uint64_t v10 = objc_msgSend(v9, "_cn_flatten");

  return v10;
}

- (void)_handleHashesChangedNotification:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v4 = [(CDFDonationFeedbackStore *)self _loadResetInfo];
  NSUInteger v5 = [(NSNumber *)self->_resetGeneration unsignedIntegerValue];
  id v6 = [v4 objectAtIndexedSubscript:0];
  unint64_t v7 = [v6 unsignedIntegerValue];

  if (v5 >= v7)
  {
    long long v15 = [(CDFDonationFeedbackStore *)self _loadHashesForKey:@"kCDFContactDonationHashesRecord"];
    if (([(NSMutableSet *)self->_hashes isEqualToSet:v15] & 1) == 0)
    {
      [(NSMutableSet *)self->_hashes unionSet:v15];
      [(CDFDonationFeedbackStore *)self _saveHashes:self->_hashes key:@"kCDFContactDonationHashesRecord"];
    }
  }
  else
  {
    id v8 = objc_msgSend((id)objc_opt_class(), "log_t");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      long long v17 = v4;
      _os_log_impl(&dword_226C3C000, v8, OS_LOG_TYPE_INFO, "got reset for CloudKit: %@", (uint8_t *)&v16, 0xCu);
    }

    uint64_t v9 = [(CDFDonationFeedbackStore *)self _loadHashesForKey:@"kCDFContactDonationHashesRecord"];
    hashes = self->_hashes;
    self->_hashes = v9;

    uint64_t v11 = [v4 objectAtIndexedSubscript:0];
    resetGeneration = self->_resetGeneration;
    self->_resetGeneration = v11;

    long long v13 = [v4 objectAtIndexedSubscript:1];
    resetTimestamp = self->_resetTimestamp;
    self->_resetTimestamp = v13;
  }
}

- (id)_loadSalt
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = [(NSUbiquitousKeyValueStore *)v2->_kvs dataForKey:@"kCDFSaltRecord"];
  if (!v3)
  {
    id v3 = [(CDFDonationFeedbackStore *)v2 _randomDataOfLength:32];
    [(NSUbiquitousKeyValueStore *)v2->_kvs setData:v3 forKey:@"kCDFSaltRecord"];
  }
  objc_sync_exit(v2);

  return v3;
}

- (id)_loadHashesForKey:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = self;
  objc_sync_enter(v5);
  id v6 = [(NSUbiquitousKeyValueStore *)v5->_kvs dataForKey:v4];
  if (v6)
  {
    unint64_t v7 = (void *)MEMORY[0x263F08928];
    id v8 = (void *)MEMORY[0x263EFFA08];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    id v23 = 0;
    uint64_t v11 = [v7 unarchivedObjectOfClasses:v10 fromData:v6 error:&v23];
    id v12 = v23;

    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      long long v15 = objc_msgSend((id)objc_opt_class(), "log_t");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[CDFDonationFeedbackStore _loadHashesForKey:]((uint64_t)v12, v15, v16, v17, v18, v19, v20, v21);
      }

      id v13 = (id)objc_opt_new();
    }
    id v14 = v13;
  }
  else
  {
    id v14 = objc_opt_new();
  }

  objc_sync_exit(v5);
  return v14;
}

- (void)_saveHashes:(id)a3 key:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  if ([v6 count])
  {
    uint64_t v9 = (void *)MEMORY[0x22A666040]();
    id v19 = 0;
    id v10 = [MEMORY[0x263F08910] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v19];
    id v11 = v19;
    if (!v10)
    {
      id v12 = objc_msgSend((id)objc_opt_class(), "log_t");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[CDFDonationFeedbackStore _saveHashes:key:]((uint64_t)v11, v12, v13, v14, v15, v16, v17, v18);
      }
    }
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __44__CDFDonationFeedbackStore__saveHashes_key___block_invoke;
    block[3] = &unk_2647D42B0;
    block[4] = v8;
    if (_saveHashes_key__onceToken != -1) {
      dispatch_once(&_saveHashes_key__onceToken, block);
    }
    id v10 = (id)_saveHashes_key__archivedEmptySet;
  }
  [(NSUbiquitousKeyValueStore *)v8->_kvs setData:v10 forKey:v7];

  objc_sync_exit(v8);
}

void __44__CDFDonationFeedbackStore__saveHashes_key___block_invoke()
{
  v0 = (void *)MEMORY[0x263F08910];
  v1 = objc_opt_new();
  id v12 = 0;
  uint64_t v2 = [v0 archivedDataWithRootObject:v1 requiringSecureCoding:1 error:&v12];
  id v3 = v12;
  id v4 = (void *)_saveHashes_key__archivedEmptySet;
  _saveHashes_key__archivedEmptySet = v2;

  if (!_saveHashes_key__archivedEmptySet)
  {
    NSUInteger v5 = objc_msgSend((id)objc_opt_class(), "log_t");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CDFDonationFeedbackStore _saveHashes:key:]((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
    }
  }
}

- (id)_loadResetInfo
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  id v3 = [(NSUbiquitousKeyValueStore *)v2->_kvs arrayForKey:@"kCDFResetInfoRecord"];
  id v4 = v3;
  if (v3 && [v3 count] == 2)
  {
    NSUInteger v5 = [v4 objectAtIndexedSubscript:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [v4 objectAtIndexedSubscript:1];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  uint64_t v8 = objc_msgSend((id)objc_opt_class(), "log_t");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_226C3C000, v8, OS_LOG_TYPE_INFO, "Empty or corrupt resetInfo", v10, 2u);
  }

  id v4 = &unk_26DAC7B28;
LABEL_10:
  objc_sync_exit(v2);

  return v4;
}

- (void)_saveResetInfo
{
  v6[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  kvs = v2->_kvs;
  resetTimestamp = v2->_resetTimestamp;
  v6[0] = v2->_resetGeneration;
  v6[1] = resetTimestamp;
  NSUInteger v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  [(NSUbiquitousKeyValueStore *)kvs setArray:v5 forKey:@"kCDFResetInfoRecord"];

  objc_sync_exit(v2);
}

- (void)synchronize
{
}

- (id)_randomDataOfLength:(unint64_t)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  id v4 = (char *)v7 - (((a3 & 0xFFFFFFFFFFFFFFFCLL) + 19) & 0xFFFFFFFFFFFFFFF0);
  arc4random_buf(v4, (a3 & 0xFFFFFFFFFFFFFFFCLL) + 4);
  NSUInteger v5 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:v4 length:a3];
  return v5;
}

- (id)_sha256BytesForStrings:(id)a3 salt:(id)a4
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  [(CDFDonationFeedbackStore *)self _hashStrings:a3 salt:a4 digest:v6];
  id v4 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:v6 length:32];
  return v4;
}

- (void)_hashStrings:(id)a3 salt:(id)a4 digest:(char *)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  memset(&c, 0, sizeof(c));
  CC_SHA256_Init(&c);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(__CFString **)(*((void *)&v20 + 1) + 8 * i);
        CStringPtr = CFStringGetCStringPtr(v14, 0x600u);
        if (CStringPtr)
        {
          CC_SHA256_Update(&c, CStringPtr, [(__CFString *)v14 length]);
        }
        else
        {
          *(void *)len = 0;
          CFIndex v16 = [(__CFString *)v14 length];
          v28.location = 0;
          v28.length = v16;
          if (CFStringGetBytes(v14, v28, 0x8000100u, 0, 0, buffer, 512, (CFIndex *)len))
          {
            CFIndex v17 = 0;
            do
            {
              CC_SHA256_Update(&c, buffer, len[0]);
              v17 += *(void *)len;
              v16 -= *(void *)len;
              v29.location = v17;
              v29.length = v16;
            }
            while (CFStringGetBytes(v14, v29, 0x8000100u, 0, 0, buffer, 512, (CFIndex *)len));
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v11);
  }

  if (v8)
  {
    id v18 = v8;
    CC_SHA256_Update(&c, (const void *)[v18 bytes], objc_msgSend(v18, "length"));
  }
  CC_SHA256_Final((unsigned __int8 *)a5, &c);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userSalt, 0);
  objc_storeStrong((id *)&self->_resetTimestamp, 0);
  objc_storeStrong((id *)&self->_resetGeneration, 0);
  objc_storeStrong((id *)&self->_hashes, 0);
  objc_storeStrong((id *)&self->_kvs, 0);
}

- (void)initWithKeyValueStore:(uint64_t *)a1 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_226C3C000, a2, OS_LOG_TYPE_DEBUG, "user salt: %@", (uint8_t *)&v3, 0xCu);
}

- (void)_loadHashesForKey:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_saveHashes:(uint64_t)a3 key:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end