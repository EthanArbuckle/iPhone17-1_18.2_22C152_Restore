@interface CDRecentInfo
+ (BOOL)supportsSecureCoding;
+ (id)fetchAllowedClassesSet;
+ (id)recentInfoForVolumes:(id)a3;
- (BOOL)hasInvalids;
- (BOOL)hasSnapshotForVolume:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isInvalidForVolume:(id)a3;
- (BOOL)isStale;
- (BOOL)isStaleForVolume:(id)a3;
- (BOOL)updateRecentState:(int64_t)a3 forVolume:(id)a4;
- (BOOL)updateServiceInfoAmount:(id)a3 forService:(id)a4 onVolume:(id)a5 atUrgency:(int)a6 withTimestamp:(double)a7 nonPurgeableAmount:(id)a8 deductFromCurrentAmount:(BOOL)a9 info:(id)a10;
- (BOOL)validateForVolume:(id)a3 andService:(id)a4 atUrgency:(int)a5;
- (CDRecentInfo)initWithCoder:(id)a3;
- (CDRecentInfo)initWithRecentInfo:(id)a3;
- (CDRecentInfo)initWithVolumes:(id)a3;
- (NSMutableDictionary)volumes;
- (NSMutableSet)invalidVolumes;
- (NSMutableSet)pushingServices;
- (NSNumber)version;
- (id)_createNewRecentVolumeInfo;
- (id)_createNewRecentVolumeInfoWithName:(id)a3;
- (id)_recentInfoForVolume:(id)a3 atUrgency:(int)a4 validateResults:(BOOL)a5;
- (id)bsdDiskForVolume:(id)a3;
- (id)copyInvalidsForVolume:(id)a3 atUrgency:(int)a4;
- (id)copyPushingServices;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)recentInfoForVolume:(id)a3 atUrgency:(int)a4;
- (id)servicesForVolume:(id)a3;
- (id)thresholdsForVolume:(id)a3;
- (int64_t)recentStateForVolume:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)invalidateForVolume:(id)a3;
- (void)log;
- (void)removeServiceInfo:(id)a3;
- (void)removeServiceInfo:(id)a3 forVolume:(id)a4;
- (void)setInvalidVolumes:(id)a3;
- (void)setPushingServices:(id)a3;
- (void)setVersion:(id)a3;
- (void)setVolumes:(id)a3;
@end

@implementation CDRecentInfo

- (id)copyPushingServices
{
  v2 = [(CDRecentInfo *)self pushingServices];
  v3 = (void *)[v2 copy];

  return v3;
}

- (BOOL)isInvalidForVolume:(id)a3
{
  v4 = +[CacheDeleteVolume volumeWithMountpoint:a3];
  v5 = v4;
  if (v4 && [v4 validate])
  {
    v6 = [(CDRecentInfo *)self invalidVolumes];
    v7 = [v5 mountPoint];
    char v8 = [v6 containsObject:v7];
  }
  else
  {
    char v8 = 1;
  }

  return v8;
}

- (NSMutableSet)invalidVolumes
{
  return self->_invalidVolumes;
}

- (id)_recentInfoForVolume:(id)a3 atUrgency:(int)a4 validateResults:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if ([v8 validate])
  {
    v9 = [(CDRecentInfo *)self volumes];
    v10 = [v8 mountPoint];
    v11 = [v9 objectForKeyedSubscript:v10];

    id v12 = [v11 _recentInfoAtUrgency:v6 validateResults:v5];

    v13 = v12;
  }
  else
  {
    v13 = [v8 mountPoint];

    if (!v13) {
      goto LABEL_8;
    }
    v14 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v17 = [v8 mountPoint];
      int v18 = 138412290;
      v19 = v17;
      _os_log_error_impl(&dword_1A63D1000, v14, OS_LOG_TYPE_ERROR, "Unable to validate volume: %@. Discarding its purgeable cache", (uint8_t *)&v18, 0xCu);
    }
    id v12 = [(CDRecentInfo *)self volumes];
    v15 = [v8 mountPoint];
    [v12 removeObjectForKey:v15];

    v13 = 0;
  }

LABEL_8:
  return v13;
}

- (BOOL)hasSnapshotForVolume:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CDRecentInfo *)self volumes];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  LOBYTE(v5) = [v6 hasSnapshot];
  return (char)v5;
}

- (id)servicesForVolume:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CDRecentInfo *)self volumes];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  v7 = [v6 volumeServices];

  return v7;
}

- (BOOL)isStaleForVolume:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CDRecentInfo *)self volumes];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  LOBYTE(v5) = [v6 isStale];
  return (char)v5;
}

- (CDRecentInfo)initWithRecentInfo:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)CDRecentInfo;
  BOOL v5 = [(CDRecentInfo *)&v30 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    volumes = v5->_volumes;
    v5->_volumes = (NSMutableDictionary *)v6;

    id v8 = [v4 volumes];

    if (v8)
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      v9 = objc_msgSend(v4, "volumes", 0);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v27;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v27 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v26 + 1) + 8 * v13);
            v15 = [(CDRecentInfo *)v5 _createNewRecentVolumeInfo];
            v16 = [v4 volumes];
            v17 = [v16 objectForKeyedSubscript:v14];
            int v18 = (void *)[v15 initWithVolumeInfo:v17];
            [(NSMutableDictionary *)v5->_volumes setObject:v18 forKeyedSubscript:v14];

            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
        }
        while (v11);
      }
    }
    version = v5->_version;
    v5->_version = (NSNumber *)&unk_1EFB2EF78;

    uint64_t v20 = [MEMORY[0x1E4F1CA80] set];
    pushingServices = v5->_pushingServices;
    v5->_pushingServices = (NSMutableSet *)v20;

    v22 = [v4 invalidVolumes];
    uint64_t v23 = [v22 mutableCopy];
    invalidVolumes = v5->_invalidVolumes;
    v5->_invalidVolumes = (NSMutableSet *)v23;
  }
  return v5;
}

- (NSMutableDictionary)volumes
{
  return self->_volumes;
}

- (id)_createNewRecentVolumeInfo
{
  v2 = [CDRecentVolumeInfo alloc];
  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CDRecentInfo *)self version];
  [v4 encodeObject:v5 forKey:@"CACHE_DELETE_CACHED_RESULTS_VERSION"];

  uint64_t v6 = [(CDRecentInfo *)self volumes];
  [v4 encodeObject:v6 forKey:@"CACHE_DELETE_RECENT_PURGEABLE_STATS"];

  v7 = [(CDRecentInfo *)self pushingServices];
  [v4 encodeObject:v7 forKey:@"CACHE_DELETE_CACHED_PUSHING_SERVICES"];

  id v8 = [(CDRecentInfo *)self invalidVolumes];
  [v4 encodeObject:v8 forKey:@"CACHE_DELETE_CACHED_INVALID_VOLUMES"];
}

- (NSMutableSet)pushingServices
{
  return self->_pushingServices;
}

- (NSNumber)version
{
  return self->_version;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidVolumes, 0);
  objc_storeStrong((id *)&self->_pushingServices, 0);
  objc_storeStrong((id *)&self->_volumes, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

+ (id)recentInfoForVolumes:(id)a3
{
  id v3 = a3;
  id v4 = [[CDRecentInfo alloc] initWithVolumes:v3];

  return v4;
}

- (CDRecentInfo)initWithVolumes:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CDRecentInfo;
  BOOL v5 = [(CDRecentInfo *)&v14 init];
  if (v5)
  {
    if (v4)
    {
      uint64_t v6 = [v4 mutableCopy];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    volumes = v5->_volumes;
    v5->_volumes = (NSMutableDictionary *)v6;

    version = v5->_version;
    v5->_version = (NSNumber *)&unk_1EFB2EF78;

    uint64_t v9 = [MEMORY[0x1E4F1CA80] set];
    pushingServices = v5->_pushingServices;
    v5->_pushingServices = (NSMutableSet *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA80] set];
    invalidVolumes = v5->_invalidVolumes;
    v5->_invalidVolumes = (NSMutableSet *)v11;
  }
  return v5;
}

- (BOOL)updateServiceInfoAmount:(id)a3 forService:(id)a4 onVolume:(id)a5 atUrgency:(int)a6 withTimestamp:(double)a7 nonPurgeableAmount:(id)a8 deductFromCurrentAmount:(BOOL)a9 info:(id)a10
{
  BOOL v10 = a9;
  uint64_t v13 = *(void *)&a6;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a8;
  id v21 = a10;
  v22 = [(CDRecentInfo *)self volumes];
  uint64_t v23 = [v22 objectForKeyedSubscript:v19];

  v24 = [(CDRecentInfo *)self volumes];

  if (v24)
  {
    if (v23) {
      goto LABEL_3;
    }
LABEL_7:
    uint64_t v23 = [(CDRecentInfo *)self _createNewRecentVolumeInfoWithName:v19];
    long long v29 = [(CDRecentInfo *)self volumes];
    [v29 setObject:v23 forKeyedSubscript:v19];

    goto LABEL_3;
  }
  long long v27 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    v30[0] = 67109120;
    v30[1] = 238;
    _os_log_error_impl(&dword_1A63D1000, v27, OS_LOG_TYPE_ERROR, "%d Deleted cache's volume dictionary is nulled. Initializing a new, empty one.", (uint8_t *)v30, 8u);
  }

  long long v28 = [MEMORY[0x1E4F1CA60] dictionary];
  [(CDRecentInfo *)self setVolumes:v28];

  if (!v23) {
    goto LABEL_7;
  }
LABEL_3:
  char v25 = [v23 updateServiceInfoAmount:v17 forService:v18 atUrgency:v13 withTimestamp:v20 nonPurgeableAmount:v10 deductFromCurrentAmount:v21 info:a7];

  return v25;
}

- (CDRecentInfo)initWithCoder:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)CDRecentInfo;
  BOOL v5 = [(CDRecentInfo *)&v34 init];
  if (v5)
  {
    objc_opt_class();
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CACHE_DELETE_CACHED_RESULTS_VERSION"];
    evaluateNumberProperty(v6);
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();

    BOOL v8 = [(NSNumber *)v7 isEqualToNumber:&unk_1EFB2EF78];
    uint64_t v9 = CDGetLogHandle((uint64_t)"client");
    BOOL v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A63D1000, v10, OS_LOG_TYPE_DEFAULT, "got a compatible version", buf, 2u);
      }

      uint64_t v11 = [(id)objc_opt_class() fetchAllowedClassesSet];
      uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"CACHE_DELETE_RECENT_PURGEABLE_STATS"];
      uint64_t v13 = [v12 mutableCopy];
      volumes = v5->_volumes;
      v5->_volumes = (NSMutableDictionary *)v13;

      v15 = [(id)objc_opt_class() fetchAllowedClassesSet];
      v16 = [v4 decodeObjectOfClasses:v15 forKey:@"CACHE_DELETE_CACHED_PUSHING_SERVICES"];
      uint64_t v17 = [v16 mutableCopy];
      pushingServices = v5->_pushingServices;
      v5->_pushingServices = (NSMutableSet *)v17;

      id v19 = [(id)objc_opt_class() fetchAllowedClassesSet];
      id v20 = [v4 decodeObjectOfClasses:v19 forKey:@"CACHE_DELETE_CACHED_INVALID_VOLUMES"];
      uint64_t v21 = [v20 mutableCopy];
      invalidVolumes = v5->_invalidVolumes;
      v5->_invalidVolumes = (NSMutableSet *)v21;
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v7;
        _os_log_error_impl(&dword_1A63D1000, v10, OS_LOG_TYPE_ERROR, "incompatible version: %@", buf, 0xCu);
      }
    }
    uint64_t v23 = v5->_volumes;
    if (v23)
    {
      v24 = v23;
    }
    else
    {
      v24 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    char v25 = v5->_volumes;
    v5->_volumes = v24;

    long long v26 = v5->_pushingServices;
    if (v26)
    {
      long long v27 = v26;
    }
    else
    {
      long long v27 = [MEMORY[0x1E4F1CA80] set];
    }
    long long v28 = v5->_pushingServices;
    v5->_pushingServices = v27;

    long long v29 = v5->_invalidVolumes;
    if (v29)
    {
      objc_super v30 = v29;
    }
    else
    {
      objc_super v30 = [MEMORY[0x1E4F1CA80] set];
    }
    uint64_t v31 = v5->_invalidVolumes;
    v5->_invalidVolumes = v30;

    version = v5->_version;
    v5->_version = v7;
  }
  return v5;
}

+ (id)fetchAllowedClassesSet
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, objc_opt_class(), 0);
}

- (id)thresholdsForVolume:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CDRecentInfo *)self volumes];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  v7 = [v6 thresholds];

  return v7;
}

- (id)_createNewRecentVolumeInfoWithName:(id)a3
{
  return +[CDRecentVolumeInfo CDRecentVolumeInfo:a3];
}

- (BOOL)validateForVolume:(id)a3 andService:(id)a4 atUrgency:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a4;
  id v9 = a3;
  BOOL v10 = [(CDRecentInfo *)self volumes];
  uint64_t v11 = [v10 objectForKeyedSubscript:v9];

  LOBYTE(v5) = [v11 validateServiceInfo:v8 atUrgency:v5];
  return v5;
}

- (id)copyInvalidsForVolume:(id)a3 atUrgency:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v7 = [(CDRecentInfo *)self volumes];
  id v8 = [v7 objectForKeyedSubscript:v6];

  id v9 = [(CDRecentInfo *)self pushingServices];
  BOOL v10 = (void *)[v8 copyInvalidsAtUrgency:v4 currentlyPushing:v9];

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [CDRecentInfo alloc];
  id v6 = [(CDRecentInfo *)self volumes];
  v7 = (void *)[v6 copyWithZone:a3];
  id v8 = [(CDRecentInfo *)v5 initWithVolumes:v7];

  return v8;
}

- (id)recentInfoForVolume:(id)a3 atUrgency:(int)a4
{
  return [(CDRecentInfo *)self _recentInfoForVolume:a3 atUrgency:*(void *)&a4 validateResults:1];
}

- (int64_t)recentStateForVolume:(id)a3
{
  id v4 = a3;
  if (v4
    && ([(CDRecentInfo *)self volumes],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        [v5 objectForKeyedSubscript:v4],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v5,
        v6))
  {
    int64_t v7 = [v6 volumeState];
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (BOOL)updateRecentState:(int64_t)a3 forVolume:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int64_t v7 = [(CDRecentInfo *)self volumes];
  id v8 = [v7 objectForKeyedSubscript:v6];

  id v9 = [(CDRecentInfo *)self volumes];

  if (v9)
  {
    if (v8) {
      goto LABEL_3;
    }
    goto LABEL_9;
  }
  uint64_t v12 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v15[0] = 67109120;
    v15[1] = 197;
    _os_log_error_impl(&dword_1A63D1000, v12, OS_LOG_TYPE_ERROR, "%d Deleted cache's volume dictionary is nulled. Initializing a new, empty one.", (uint8_t *)v15, 8u);
  }

  uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
  [(CDRecentInfo *)self setVolumes:v13];

  if (!v8)
  {
LABEL_9:
    id v8 = [(CDRecentInfo *)self _createNewRecentVolumeInfoWithName:v6];
    objc_super v14 = [(CDRecentInfo *)self volumes];
    [v14 setObject:v8 forKeyedSubscript:v6];
  }
LABEL_3:
  uint64_t v10 = [v8 volumeState];
  if (v10 != a3) {
    [v8 setVolumeState:a3];
  }

  return v10 != a3;
}

- (void)removeServiceInfo:(id)a3 forVolume:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CDRecentInfo *)self volumes];
  id v9 = [v8 objectForKeyedSubscript:v6];

  [v9 removeServiceInfo:v7];
}

- (void)removeServiceInfo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(CDRecentInfo *)self volumes];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(CDRecentInfo *)self removeServiceInfo:v4 forVolume:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)bsdDiskForVolume:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CDRecentInfo *)self volumes];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  uint64_t v7 = [v6 bsdDisk];

  return v7;
}

- (BOOL)isStale
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([(CDRecentInfo *)self isEmpty]) {
    return 1;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(CDRecentInfo *)self volumes];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        long long v10 = [(CDRecentInfo *)self volumes];
        long long v11 = [v10 objectForKeyedSubscript:v9];
        char v12 = [v11 isStale];

        if (v12)
        {
          BOOL v3 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v3 = 0;
LABEL_13:

  return v3;
}

- (BOOL)isEmpty
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 1;
  v2 = [(CDRecentInfo *)self volumes];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __23__CDRecentInfo_isEmpty__block_invoke;
  v4[3] = &unk_1E5C51AE0;
  v4[4] = &v5;
  [v2 enumerateKeysAndObjectsUsingBlock:v4];

  LOBYTE(v2) = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

uint64_t __23__CDRecentInfo_isEmpty__block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = [a3 isEmpty];
  if ((result & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

- (BOOL)hasInvalids
{
  v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  BOOL v3 = [(CDRecentInfo *)self volumes];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__CDRecentInfo_hasInvalids__block_invoke;
  v5[3] = &unk_1E5C51B08;
  v5[4] = v2;
  v5[5] = &v6;
  [v3 enumerateKeysAndObjectsUsingBlock:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __27__CDRecentInfo_hasInvalids__block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v9 = a3;
  uint64_t v6 = 1;
  while (1)
  {
    uint64_t v7 = [*(id *)(a1 + 32) pushingServices];
    uint64_t v8 = (void *)[v9 copyInvalidsAtUrgency:v6 currentlyPushing:v7];

    if ([v8 count]) {
      break;
    }

    uint64_t v6 = (v6 + 1);
    if (v6 == 4) {
      goto LABEL_6;
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  *a4 = 1;

LABEL_6:
}

- (id)description
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = [(CDRecentInfo *)self volumes];
  uint64_t v4 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v9 = [NSString stringWithFormat:@"Volume: %@", v8];
        [v3 addObject:v9];

        long long v10 = NSString;
        long long v11 = [(CDRecentInfo *)self volumes];
        char v12 = [v11 objectForKeyedSubscript:v8];
        long long v13 = [v10 stringWithFormat:@"%@", v12];
        [v3 addObject:v13];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }

  long long v14 = [v3 componentsJoinedByString:@"\n"];

  return v14;
}

- (void)log
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v3 = [(CDRecentInfo *)self volumes];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v15;
    *(void *)&long long v5 = 138412290;
    long long v13 = v5;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * v8);
        long long v10 = [(CDRecentInfo *)self volumes];
        long long v11 = [v10 objectForKeyedSubscript:v9];

        char v12 = CDGetLogHandle((uint64_t)"client");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v13;
          uint64_t v19 = v9;
          _os_log_impl(&dword_1A63D1000, v12, OS_LOG_TYPE_DEFAULT, " Volume: %@", buf, 0xCu);
        }

        [v11 log];
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v6);
  }
}

- (void)invalidateForVolume:(id)a3
{
  id v4 = a3;
  id v5 = [(CDRecentInfo *)self volumes];
  [v5 removeObjectForKey:v4];
}

- (void)setVersion:(id)a3
{
}

- (void)setVolumes:(id)a3
{
}

- (void)setPushingServices:(id)a3
{
}

- (void)setInvalidVolumes:(id)a3
{
}

@end