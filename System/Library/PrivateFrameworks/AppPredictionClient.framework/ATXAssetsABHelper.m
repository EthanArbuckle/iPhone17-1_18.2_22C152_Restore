@interface ATXAssetsABHelper
+ (BOOL)isDefaultGroupIdentifier:(id)a3;
+ (id)decDeviceId;
+ (unint64_t)cachedSaltedIndex:(unint64_t)a3;
+ (unint64_t)saltedIndex:(unint64_t)a3;
+ (unsigned)indexForDevice;
+ (void)initialize;
+ (void)setDefaultDeviceIndexPolicy;
+ (void)setIndexProviderForDevice:(id)a3;
+ (void)setStaticIndexForDevice:(unsigned __int8)a3;
- (ATXAssetsABHelper)initWithAssetContents:(id)a3;
- (ATXAssetsABHelper)initWithAssetContents:(id)a3 indexForDevice:(unsigned __int8)a4;
- (ATXAssetsABHelper)initWithAssetContents:(id)a3 specifiedABGroup:(id)a4 indexForDevice:(unsigned __int8)a5;
- (ATXAssetsABHelper)initWithAssetsForResource:(id)a3 ofType:(id)a4;
- (ATXAssetsABHelper)initWithAssetsForResource:(id)a3 ofType:(id)a4 specifiedABGroup:(id)a5;
- (NSDictionary)abGroupContents;
- (NSString)groupIdentifier;
@end

@implementation ATXAssetsABHelper

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    +[ATXAssetsABHelper setDefaultDeviceIndexPolicy];
  }
}

+ (unsigned)indexForDevice
{
  pthread_mutex_lock(&getIndexForDeviceLock);
  if (getIndexForDevice) {
    unsigned __int8 v2 = (*(uint64_t (**)(void))(getIndexForDevice + 16))();
  }
  else {
    unsigned __int8 v2 = -1;
  }
  pthread_mutex_unlock(&getIndexForDeviceLock);
  return v2;
}

- (ATXAssetsABHelper)initWithAssetContents:(id)a3
{
  id v4 = a3;
  v5 = [(ATXAssetsABHelper *)self initWithAssetContents:v4 indexForDevice:+[ATXAssetsABHelper indexForDevice]];

  return v5;
}

- (ATXAssetsABHelper)initWithAssetContents:(id)a3 indexForDevice:(unsigned __int8)a4
{
  return [(ATXAssetsABHelper *)self initWithAssetContents:a3 specifiedABGroup:0 indexForDevice:a4];
}

- (ATXAssetsABHelper)initWithAssetContents:(id)a3 specifiedABGroup:(id)a4 indexForDevice:(unsigned __int8)a5
{
  unsigned int v5 = a5;
  id v7 = a3;
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v69.receiver = self;
  v69.super_class = (Class)ATXAssetsABHelper;
  v11 = [(ATXAssetsABHelper *)&v69 init];
  if (v11)
  {
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v12 = v9;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v65 objects:v76 count:16];
    v61 = v12;
    if (v13)
    {
      uint64_t v14 = v13;
      id v57 = v7;
      id v58 = v9;
      v15 = 0;
      id v64 = 0;
      uint64_t v16 = *(void *)v66;
      NSUInteger v59 = v5;
      v17 = MEMORY[0x1E4F14500];
      v18 = v12;
      v60 = v11;
LABEL_4:
      uint64_t v19 = 0;
      while (1)
      {
        if (*(void *)v66 != v16) {
          objc_enumerationMutation(v18);
        }
        v20 = *(void **)(*((void *)&v65 + 1) + 8 * v19);
        if (v10 && [v10 isEqualToString:*(void *)(*((void *)&v65 + 1) + 8 * v19)])
        {
          v21 = v20;

          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v73 = v21;
            _os_log_impl(&dword_1A790D000, v17, OS_LOG_TYPE_INFO, "Found specifiedABGroup of %@", buf, 0xCu);
          }
          v15 = v21;
          goto LABEL_30;
        }
        if ([(id)objc_opt_class() isDefaultGroupIdentifier:v20])
        {
          if (v64)
          {
            v22 = [MEMORY[0x1E4F28B00] currentHandler];
            [v22 handleFailureInMethod:a2, v11, @"ATXAssetsABHelper.m", 99, @"Detected more than one Default* ABGroup. Second was %@", v20 object file lineNumber description];

            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v73 = (NSString *)v20;
              __int16 v74 = 2112;
              id v75 = v64;
              _os_log_error_impl(&dword_1A790D000, v17, OS_LOG_TYPE_ERROR, "Detected more than one Default* ABGroup, skipping %@ and keeping %@", buf, 0x16u);
            }
          }
          else
          {
            id v64 = v20;
          }
          goto LABEL_30;
        }
        v23 = [v18 objectForKeyedSubscript:v20];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          goto LABEL_30;
        }
        id v24 = v23;
        v25 = [v24 objectForKeyedSubscript:@"Activation"];
        if (!v25) {
          goto LABEL_28;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          [MEMORY[0x1E4F28B00] currentHandler];
          v38 = v37 = v15;
          [v38 handleFailureInMethod:a2, v11, @"ATXAssetsABHelper.m", 118, @"ABGroup %@ contains unsupported activation criterion: %@", v20, v24 object file lineNumber description];

          v15 = v37;
          v18 = v61;
LABEL_28:

LABEL_29:
          v17 = MEMORY[0x1E4F14500];
          goto LABEL_30;
        }
        v62 = v15;
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
          -[ATXAssetsABHelper initWithAssetContents:specifiedABGroup:indexForDevice:](v70, (uint64_t)v20, &v71);
        }
        id v26 = v25;
        v27 = [v26 objectForKeyedSubscript:@"SaltedIndexCriterion"];

        if (v27) {
          break;
        }
        v39 = [v26 objectForKeyedSubscript:@"UUIDLastByteRange"];

        if (v39)
        {
          v40 = [v26 objectForKeyedSubscript:@"UUIDLastByteRange"];
          NSRange v41 = NSRangeFromString(v40);

          v18 = v61;
          BOOL v36 = v59 < v41.location || v59 - v41.location >= v41.length;
LABEL_36:
          char v42 = !v36;
          v11 = v60;
          goto LABEL_40;
        }
        v43 = [MEMORY[0x1E4F28B00] currentHandler];
        v11 = v60;
        [v43 handleFailureInMethod:a2, v60, @"ATXAssetsABHelper.m", 138, @"ABGroup %@ contains no supported activation criteria: %@", v20, v24 object file lineNumber description];

        char v42 = 0;
LABEL_40:

        if (v10)
        {
          v15 = v62;
          goto LABEL_29;
        }
        v17 = MEMORY[0x1E4F14500];
        if (v42)
        {
          v45 = v64;
          id v48 = v20;

          id v7 = v57;
          id v9 = v58;
          v15 = v62;
          if (v48) {
            goto LABEL_57;
          }
          if (v64) {
            goto LABEL_56;
          }
          goto LABEL_63;
        }
        v15 = v62;
LABEL_30:
        if (v14 == ++v19)
        {
          uint64_t v44 = [v18 countByEnumeratingWithState:&v65 objects:v76 count:16];
          uint64_t v14 = v44;
          if (v44) {
            goto LABEL_4;
          }

          if (v10)
          {
            v45 = v64;
            if (v15)
            {
              objc_storeStrong((id *)&v11->_groupIdentifier, v15);
              uint64_t v46 = [v18 objectForKeyedSubscript:v11->_groupIdentifier];
              abGroupContents = v11->_abGroupContents;
              v11->_abGroupContents = (NSDictionary *)v46;

              id v48 = 0;
              id v9 = v58;
              goto LABEL_66;
            }
            id v7 = v57;
            id v9 = v58;
            goto LABEL_53;
          }
          v45 = v64;
          id v7 = v57;
          id v9 = v58;
          if (v64) {
            goto LABEL_56;
          }
          goto LABEL_63;
        }
      }
      v28 = [v26 objectForKeyedSubscript:@"SaltedIndexCriterion"];
      v29 = [v28 objectForKeyedSubscript:@"range"];
      NSRange v30 = NSRangeFromString(v29);

      v31 = [v26 objectForKeyedSubscript:@"SaltedIndexCriterion"];
      v32 = [v31 objectForKeyedSubscript:@"salt"];
      uint64_t v33 = [v32 unsignedIntegerValue];

      uint64_t v34 = v33;
      v18 = v61;
      NSUInteger v35 = +[ATXAssetsABHelper cachedSaltedIndex:v34];
      BOOL v36 = v35 < v30.location || v35 - v30.location >= v30.length;
      goto LABEL_36;
    }

    v45 = 0;
    v15 = 0;
    if (!v10) {
      goto LABEL_63;
    }
LABEL_53:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      -[ATXAssetsABHelper initWithAssetContents:specifiedABGroup:indexForDevice:]((uint64_t)v10);
    }
    v15 = 0;
    if (v45)
    {
LABEL_56:
      id v48 = v45;
      v45 = v48;
LABEL_57:
      v49 = v15;
      objc_storeStrong((id *)&v11->_groupIdentifier, v48);
      uint64_t v50 = [v61 objectForKeyedSubscript:v11->_groupIdentifier];
      v51 = v11->_abGroupContents;
      v11->_abGroupContents = (NSDictionary *)v50;

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v56 = [MEMORY[0x1E4F28B00] currentHandler];
        [v56 handleFailureInMethod:a2, v11, @"ATXAssetsABHelper.m", 176, @"Content of ABGroup %@ in asset is not an NSDictionary: %@", v48, v11->_abGroupContents object file lineNumber description];
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        groupIdentifier = v11->_groupIdentifier;
        *(_DWORD *)buf = 138412290;
        v73 = groupIdentifier;
        _os_log_impl(&dword_1A790D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "ABGroup identifier: %@", buf, 0xCu);
      }
      v15 = v49;
    }
    else
    {
LABEL_63:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
        -[ATXAssetsABHelper initWithAssetContents:specifiedABGroup:indexForDevice:]();
      }
      v53 = v11->_groupIdentifier;
      v11->_groupIdentifier = 0;

      objc_storeStrong((id *)&v11->_abGroupContents, v7);
      v45 = 0;
      id v48 = 0;
    }
LABEL_66:
    v54 = v11;
  }
  return v11;
}

- (ATXAssetsABHelper)initWithAssetsForResource:(id)a3 ofType:(id)a4
{
  return [(ATXAssetsABHelper *)self initWithAssetsForResource:a3 ofType:a4 specifiedABGroup:0];
}

- (ATXAssetsABHelper)initWithAssetsForResource:(id)a3 ofType:(id)a4 specifiedABGroup:(id)a5
{
  id v8 = a5;
  id v9 = +[ATXAssets2 rawDictionaryForResource:a3 ofType:a4];
  if (v9)
  {
    self = [(ATXAssetsABHelper *)self initWithAssetContents:v9 specifiedABGroup:v8 indexForDevice:+[ATXAssetsABHelper indexForDevice]];
    id v10 = self;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (unint64_t)cachedSaltedIndex:(unint64_t)a3
{
  unint64_t result = cachedSaltedIndex__index;
  if ((unint64_t)cachedSaltedIndex__index >= 0x3E8)
  {
    cachedSaltedIndex__index = +[ATXAssetsABHelper saltedIndex:a3];
    id v4 = +[ATXAggregateKeys keyWithSubkey:@"ab.salted_index"];
    +[ATXAssetsAggregateLogger logKey:v4 replaceScalarValueWith:cachedSaltedIndex__index];

    return cachedSaltedIndex__index;
  }
  return result;
}

+ (unint64_t)saltedIndex:(unint64_t)a3
{
  id v4 = +[ATXAssetsABHelper decDeviceId];
  unsigned int v5 = v4;
  if (v4)
  {
    v13[0] = 0;
    v13[1] = 0;
    [v4 getUUIDBytes:v13];
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    char v8 = 1;
    do
    {
      char v9 = v8;
      unint64_t v10 = 0xFF51AFD7ED558CCDLL * (v13[v6] ^ a3 ^ ((v13[v6] ^ a3) >> 33));
      v7 += (0xC4CEB9FE1A85EC53 * (v10 ^ (v10 >> 33))) ^ ((0xC4CEB9FE1A85EC53 * (v10 ^ (v10 >> 33))) >> 33);
      uint64_t v6 = 1;
      char v8 = 0;
    }
    while ((v9 & 1) != 0);
    unint64_t v11 = v7 % 0x3E8;
  }
  else
  {
    unint64_t v11 = 1000;
  }

  return v11;
}

+ (void)setStaticIndexForDevice:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__ATXAssetsABHelper_setStaticIndexForDevice___block_invoke;
  v3[3] = &__block_descriptor_33_e5_C8__0l;
  unsigned __int8 v4 = a3;
  +[ATXAssetsABHelper setIndexProviderForDevice:v3];
}

uint64_t __45__ATXAssetsABHelper_setStaticIndexForDevice___block_invoke(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32);
}

+ (id)decDeviceId
{
  unsigned __int8 v2 = (void *)_deviceId;
  if (!_deviceId)
  {
    v3 = [MEMORY[0x1E4F28F80] processInfo];
    unsigned __int8 v4 = [v3 processName];

    if ([v4 isEqualToString:@"duetexpertd"])
    {
      unsigned int v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      uint64_t v6 = [v5 objectForKey:@"com.apple.proactive.abGroupDeviceId"];

      if (v6) {
        [v5 removeObjectForKey:@"com.apple.proactive.abGroupDeviceId"];
      }
    }
    id v7 = objc_alloc(MEMORY[0x1E4F93B00]);
    char v8 = +[ATXAssetsPaths decDirectoryFile:@"com.apple.proactive.abGroupDeviceId"];
    char v9 = (void *)[v7 initWithBasePath:v8];

    unint64_t v10 = [v9 UUID];
    unint64_t v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [MEMORY[0x1E4F29128] UUID];
    }
    uint64_t v13 = (void *)_deviceId;
    _deviceId = (uint64_t)v12;

    unsigned __int8 v2 = (void *)_deviceId;
  }

  return v2;
}

+ (BOOL)isDefaultGroupIdentifier:(id)a3
{
  if (!a3) {
    return 1;
  }
  v3 = [a3 lowercaseString];
  char v4 = [v3 hasPrefix:@"default"];

  return v4;
}

+ (void)setDefaultDeviceIndexPolicy
{
}

uint64_t __48__ATXAssetsABHelper_setDefaultDeviceIndexPolicy__block_invoke()
{
  v0 = +[ATXAssetsABHelper decDeviceId];
  v1 = v0;
  if (v0)
  {
    v9[0] = 0;
    v9[1] = 0;
    [v0 getUUIDBytes:v9];
    uint64_t v2 = 0;
    uint64_t v3 = 0;
    char v4 = 1;
    do
    {
      char v5 = v4;
      unint64_t v6 = 0xFF51AFD7ED558CCDLL * (v9[v2] ^ (v9[v2] >> 33));
      v3 += (0xC4CEB9FE1A85EC53 * (v6 ^ (v6 >> 33))) ^ ((0xC4CEB9FE1A85EC53 * (v6 ^ (v6 >> 33))) >> 33);
      uint64_t v2 = 1;
      char v4 = 0;
    }
    while ((v5 & 1) != 0);
  }
  else
  {
    LOBYTE(v3) = -1;
  }
  id v7 = +[ATXAggregateKeys keyWithSubkey:@"ab.index.vendor"];
  +[ATXAssetsAggregateLogger logKey:v7 replaceScalarValueWith:v3];

  return v3;
}

+ (void)setIndexProviderForDevice:(id)a3
{
  id v3 = a3;
  pthread_mutex_lock(&getIndexForDeviceLock);
  uint64_t v4 = MEMORY[0x1AD0D3E40](v3);

  char v5 = (void *)getIndexForDevice;
  getIndexForDevice = v4;

  pthread_mutex_unlock(&getIndexForDeviceLock);
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (NSDictionary)abGroupContents
{
  return self->_abGroupContents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_abGroupContents, 0);

  objc_storeStrong((id *)&self->_groupIdentifier, 0);
}

- (void)initWithAssetContents:specifiedABGroup:indexForDevice:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_1A790D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Asset does not contain ABGroup information", v0, 2u);
}

- (void)initWithAssetContents:(uint64_t)a1 specifiedABGroup:indexForDevice:.cold.2(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_debug_impl(&dword_1A790D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Asset does not contain the specifiedABGroup of %@", (uint8_t *)&v1, 0xCu);
}

- (void)initWithAssetContents:(uint8_t *)buf specifiedABGroup:(uint64_t)a2 indexForDevice:(void *)a3 .cold.3(uint8_t *buf, uint64_t a2, void *a3)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a2;
  _os_log_debug_impl(&dword_1A790D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "ABGroup key: %@", buf, 0xCu);
}

@end