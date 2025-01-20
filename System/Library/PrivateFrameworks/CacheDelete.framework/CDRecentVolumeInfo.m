@interface CDRecentVolumeInfo
+ (BOOL)supportsSecureCoding;
+ (id)CDRecentVolumeInfo:(id)a3;
- (BOOL)_validateWithSharedCacheDeleteForService:(id)a3;
- (BOOL)hasSnapshot;
- (BOOL)isEmpty;
- (BOOL)isStale;
- (BOOL)updateServiceInfoAmount:(id)a3 forService:(id)a4 atUrgency:(int)a5 withTimestamp:(double)a6 nonPurgeableAmount:(id)a7 deductFromCurrentAmount:(BOOL)a8 info:(id)a9;
- (BOOL)validateServiceInfo:(id)a3 atUrgency:(int)a4;
- (CDRecentVolumeInfo)initWithCoder:(id)a3;
- (CDRecentVolumeInfo)initWithServices:(id)a3 volumeName:(id)a4;
- (CDRecentVolumeInfo)initWithVolumeInfo:(id)a3;
- (CacheDeleteVolume)cdVolume;
- (NSDate)timestamp;
- (NSDictionary)thresholds;
- (NSMutableDictionary)diagnostics;
- (NSMutableDictionary)services;
- (NSNumber)freespace;
- (NSString)bsdDisk;
- (NSString)volume;
- (id)_recentInfoAtUrgency:(int)a3 validateResults:(BOOL)a4;
- (id)copyInvalidsAtUrgency:(int)a3 currentlyPushing:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createVolumeWithMountPoint:(id)a3;
- (id)createVolumeWithPath:(id)a3;
- (id)description;
- (id)recentInfoAtUrgency:(int)a3;
- (id)volumeServices;
- (int64_t)volumeState;
- (unint64_t)reserve;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)log;
- (void)removeServiceInfo:(id)a3;
- (void)setBsdDisk:(id)a3;
- (void)setCdVolume:(id)a3;
- (void)setDiagnostics:(id)a3;
- (void)setFreespace:(id)a3;
- (void)setHasSnapshot:(BOOL)a3;
- (void)setReserve:(unint64_t)a3;
- (void)setServices:(id)a3;
- (void)setThresholds:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)setVolume:(id)a3;
- (void)setVolumeState:(int64_t)a3;
@end

@implementation CDRecentVolumeInfo

- (CacheDeleteVolume)cdVolume
{
  return self->_cdVolume;
}

- (CDRecentVolumeInfo)initWithVolumeInfo:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)CDRecentVolumeInfo;
  v5 = [(CDRecentVolumeInfo *)&v51 init];
  if (!v5)
  {
LABEL_23:
    v31 = v5;
    goto LABEL_24;
  }
  uint64_t v6 = [v4 volume];
  volume = v5->_volume;
  v5->_volume = (NSString *)v6;

  v8 = [v4 volume];
  uint64_t v9 = [(CDRecentVolumeInfo *)v5 createVolumeWithPath:v8];
  cdVolume = v5->_cdVolume;
  v5->_cdVolume = (CacheDeleteVolume *)v9;

  if (v5->_volume && v5->_cdVolume)
  {
    v11 = [v4 services];

    uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
    v13 = (void *)v12;
    if (v11)
    {
      v44 = v5;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      v14 = [v4 services];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v47 objects:v62 count:16];
      if (!v15) {
        goto LABEL_17;
      }
      uint64_t v16 = v15;
      v17 = "client";
      uint64_t v46 = *(void *)v48;
      while (1)
      {
        uint64_t v18 = 0;
        uint64_t v45 = v16;
        do
        {
          if (*(void *)v48 != v46) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v47 + 1) + 8 * v18);
          if ([v4 _validateWithSharedCacheDeleteForService:v19])
          {
            v20 = [v4 services];
            v21 = [v20 objectForKeyedSubscript:v19];
            v22 = (void *)[v21 copy];
            [v13 setObject:v22 forKeyedSubscript:v19];
          }
          else
          {
            v20 = CDGetLogHandle((uint64_t)v17);
            if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_15;
            }
            v21 = [v4 volume];
            v22 = [v4 services];
            [v22 objectForKeyedSubscript:v19];
            v23 = v17;
            id v24 = v4;
            v25 = v14;
            v27 = v26 = v13;
            *(_DWORD *)buf = 67110146;
            int v53 = 72;
            __int16 v54 = 2080;
            v55 = "-[CDRecentVolumeInfo initWithVolumeInfo:]";
            __int16 v56 = 2112;
            v57 = v21;
            __int16 v58 = 2112;
            uint64_t v59 = v19;
            __int16 v60 = 2112;
            v61 = v27;
            _os_log_impl(&dword_1A63D1000, v20, OS_LOG_TYPE_DEFAULT, "%d : %s excluding: volume: %@, service: %@, value: %@", buf, 0x30u);

            v13 = v26;
            v14 = v25;
            id v4 = v24;
            v17 = v23;
            uint64_t v16 = v45;
          }

LABEL_15:
          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v47 objects:v62 count:16];
        if (!v16)
        {
LABEL_17:

          uint64_t v28 = [v13 mutableCopy];
          v5 = v44;
          services = v44->_services;
          v44->_services = (NSMutableDictionary *)v28;

          goto LABEL_22;
        }
      }
    }
    v32 = v5->_services;
    v5->_services = (NSMutableDictionary *)v12;
    v13 = v32;
LABEL_22:

    v5->_reserve = [v4 reserve];
    uint64_t v33 = [v4 bsdDisk];
    bsdDisk = v5->_bsdDisk;
    v5->_bsdDisk = (NSString *)v33;

    v35 = [v4 thresholds];
    uint64_t v36 = [v35 copy];
    thresholds = v5->_thresholds;
    v5->_thresholds = (NSDictionary *)v36;

    v5->_hasSnapshot = [v4 hasSnapshot];
    uint64_t v38 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[CacheDeleteVolume freespace](v5->_cdVolume, "freespace"));
    freespace = v5->_freespace;
    v5->_freespace = (NSNumber *)v38;

    v5->_volumeState = [(CacheDeleteVolume *)v5->_cdVolume state];
    uint64_t v40 = [MEMORY[0x1E4F1C9C8] date];
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v40;

    goto LABEL_23;
  }
  v30 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    v43 = [v4 volume];
    *(_DWORD *)buf = 67109378;
    int v53 = 63;
    __int16 v54 = 2112;
    v55 = v43;
    _os_log_error_impl(&dword_1A63D1000, v30, OS_LOG_TYPE_ERROR, "%d CDRecentVolumeInfo unable to validate mount point: %@", buf, 0x12u);
  }
  v31 = 0;
LABEL_24:

  return v31;
}

- (NSMutableDictionary)services
{
  return self->_services;
}

- (NSString)volume
{
  return self->_volume;
}

- (id)createVolumeWithPath:(id)a3
{
  return +[CacheDeleteVolume volumeWithPath:a3];
}

- (id)volumeServices
{
  v2 = [(CDRecentVolumeInfo *)self services];
  v3 = [v2 allKeys];

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  id v4 = [(CDRecentVolumeInfo *)self timestamp];
  [v11 encodeObject:v4 forKey:@"CACHE_DELETE_TIMESTAMP"];

  v5 = [(CDRecentVolumeInfo *)self freespace];
  [v11 encodeObject:v5 forKey:@"CACHE_DELETE_FREESPACE"];

  uint64_t v6 = [(CDRecentVolumeInfo *)self services];
  [v11 encodeObject:v6 forKey:@"CACHE_DELETE_SERVICES"];

  v7 = [(CDRecentVolumeInfo *)self volume];
  [v11 encodeObject:v7 forKey:@"CACHE_DELETE_VOLUME"];

  objc_msgSend(v11, "encodeInteger:forKey:", -[CDRecentVolumeInfo volumeState](self, "volumeState"), @"CACHE_DELETE_VOLUME_STATE");
  v8 = [(CDRecentVolumeInfo *)self thresholds];
  [v11 encodeObject:v8 forKey:@"CACHE_DELETE_THRESHOLDS"];

  uint64_t v9 = [(CDRecentVolumeInfo *)self bsdDisk];
  [v11 encodeObject:v9 forKey:@"CACHE_DELETE_BSD_DISK"];

  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CDRecentVolumeInfo reserve](self, "reserve"));
  [v11 encodeObject:v10 forKey:@"CACHE_DELETE_RESERVE"];

  objc_msgSend(v11, "encodeBool:forKey:", -[CDRecentVolumeInfo hasSnapshot](self, "hasSnapshot"), @"CACHE_DELETE_HAS_SNAPSHOT");
}

- (BOOL)hasSnapshot
{
  return self->_hasSnapshot;
}

- (NSDictionary)thresholds
{
  return self->_thresholds;
}

- (NSDate)timestamp
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (NSNumber)freespace
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (int64_t)volumeState
{
  return self->_volumeState;
}

- (unint64_t)reserve
{
  return self->_reserve;
}

- (NSString)bsdDisk
{
  return self->_bsdDisk;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnostics, 0);
  objc_storeStrong((id *)&self->_thresholds, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_bsdDisk, 0);
  objc_storeStrong((id *)&self->_freespace, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_cdVolume, 0);
  objc_storeStrong((id *)&self->_volume, 0);
}

- (BOOL)updateServiceInfoAmount:(id)a3 forService:(id)a4 atUrgency:(int)a5 withTimestamp:(double)a6 nonPurgeableAmount:(id)a7 deductFromCurrentAmount:(BOOL)a8 info:(id)a9
{
  BOOL v10 = a8;
  uint64_t v13 = *(void *)&a5;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a7;
  id v19 = a9;
  v20 = [(CDRecentVolumeInfo *)self services];
  v21 = [v20 objectForKeyedSubscript:v17];

  if (v21)
  {
    v22 = [v21 amountAtUrgency:v13 checkTimestamp:0];
    int v23 = [v21 updateAmount:v16 atUrgency:v13 withTimestamp:v18 nonPurgeableAmount:v10 deductFromCurrentAmount:v19 info:a6];
    id v24 = CDGetLogHandle((uint64_t)"client");
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
    if (v23)
    {
      if (v25)
      {
        int v32 = 67110146;
        int v33 = 218;
        __int16 v34 = 2114;
        id v35 = v17;
        __int16 v36 = 2114;
        *(void *)v37 = v22;
        *(_WORD *)&v37[8] = 2114;
        *(void *)&v37[10] = v16;
        __int16 v38 = 2114;
        id v39 = v19;
        _os_log_impl(&dword_1A63D1000, v24, OS_LOG_TYPE_DEFAULT, "%d updateServiceInfoAmount UPDATED %{public}@, old: %{public}@, new: %{public}@, info: %{public}@", (uint8_t *)&v32, 0x30u);
      }
    }
    else if (v25)
    {
      [(CDRecentVolumeInfo *)self volume];
      int v32 = 67109890;
      int v33 = 220;
      __int16 v34 = 2114;
      id v35 = v17;
      __int16 v36 = 1024;
      *(_DWORD *)v37 = v13;
      *(void *)&v37[6] = *(_WORD *)&v37[4] = 2114;
      v27 = *(void **)&v37[6];
      _os_log_impl(&dword_1A63D1000, v24, OS_LOG_TYPE_DEFAULT, "%d updateServiceInfoAmount NO CHANGE for %{public}@ at %d on %{public}@", (uint8_t *)&v32, 0x22u);
    }
  }
  else
  {
    v21 = +[CDRecentServiceInfo CDRecentServiceInfo:v16 atUrgency:v13 withTimestamp:v18 nonPurgeableAmount:v19 info:a6];
    v26 = [(CDRecentVolumeInfo *)self services];
    [v26 setObject:v21 forKeyedSubscript:v17];

    v22 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int v32 = 67109634;
      int v33 = 212;
      __int16 v34 = 2114;
      id v35 = v17;
      __int16 v36 = 2114;
      *(void *)v37 = v19;
      _os_log_impl(&dword_1A63D1000, v22, OS_LOG_TYPE_DEFAULT, "%d NEW updateServiceInfoAmount for %{public}@, info: %{public}@", (uint8_t *)&v32, 0x1Cu);
    }
    LOBYTE(v23) = 1;
  }

  uint64_t v28 = [(CDRecentVolumeInfo *)self createVolumeWithMountPoint:self->_volume];
  v29 = v28;
  if (v28 && [v28 validate])
  {
    v30 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v29, "freespace"));
    [(CDRecentVolumeInfo *)self setFreespace:v30];
  }
  return v23;
}

- (void)setFreespace:(id)a3
{
}

- (CDRecentVolumeInfo)initWithCoder:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)CDRecentVolumeInfo;
  v5 = [(CDRecentVolumeInfo *)&v42 init];
  if (!v5)
  {
LABEL_20:
    id v17 = v5;
    goto LABEL_21;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CACHE_DELETE_VOLUME"];
  volume = v5->_volume;
  v5->_volume = (NSString *)v6;

  if (v5->_volume)
  {
    uint64_t v8 = -[CDRecentVolumeInfo createVolumeWithMountPoint:](v5, "createVolumeWithMountPoint:");
    cdVolume = v5->_cdVolume;
    v5->_cdVolume = (CacheDeleteVolume *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CACHE_DELETE_TIMESTAMP"];
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CACHE_DELETE_FREESPACE"];
    freespace = v5->_freespace;
    v5->_freespace = (NSNumber *)v12;

    if ([v4 containsValueForKey:@"CACHE_DELETE_VOLUME_STATE"])
    {
      uint64_t v14 = [v4 decodeIntegerForKey:@"CACHE_DELETE_VOLUME_STATE"];
LABEL_15:
      v5->_volumeState = v14;
      id v18 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v19 = objc_opt_class();
      uint64_t v20 = objc_opt_class();
      v21 = objc_msgSend(v18, "setWithObjects:", v19, v20, objc_opt_class(), 0);
      v22 = [v4 decodeObjectOfClasses:v21 forKey:@"CACHE_DELETE_SERVICES"];
      uint64_t v23 = [v22 mutableCopy];
      services = v5->_services;
      v5->_services = (NSMutableDictionary *)v23;

      if (!v5->_services)
      {
        uint64_t v25 = objc_opt_new();
        v26 = v5->_services;
        v5->_services = (NSMutableDictionary *)v25;
      }
      v27 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v28 = objc_opt_class();
      uint64_t v29 = objc_opt_class();
      v30 = objc_msgSend(v27, "setWithObjects:", v28, v29, objc_opt_class(), 0);
      v31 = [v4 decodeObjectOfClasses:v30 forKey:@"CACHE_DELETE_THRESHOLDS"];
      uint64_t v32 = [v31 mutableCopy];
      thresholds = v5->_thresholds;
      v5->_thresholds = (NSDictionary *)v32;

      if (!v5->_thresholds)
      {
        uint64_t v34 = objc_opt_new();
        id v35 = v5->_thresholds;
        v5->_thresholds = (NSDictionary *)v34;
      }
      uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CACHE_DELETE_BSD_DISK"];
      bsdDisk = v5->_bsdDisk;
      v5->_bsdDisk = (NSString *)v36;

      __int16 v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CACHE_DELETE_RESERVE"];
      v5->_reserve = [v38 unsignedIntegerValue];
      v5->_hasSnapshot = [v4 decodeBoolForKey:@"CACHE_DELETE_HAS_SNAPSHOT"];

      goto LABEL_20;
    }
    id v16 = v5->_cdVolume;
    if (v16)
    {
      if ([(CacheDeleteVolume *)v16 validate]) {
        uint64_t v14 = [(CacheDeleteVolume *)v5->_cdVolume state];
      }
      else {
        uint64_t v14 = 0;
      }
      goto LABEL_15;
    }
    uint64_t v15 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v41 = v5->_volume;
      *(_DWORD *)buf = 67109378;
      int v44 = 131;
      __int16 v45 = 2112;
      uint64_t v46 = v41;
      _os_log_error_impl(&dword_1A63D1000, v15, OS_LOG_TYPE_ERROR, "%d CDRecentVolumeInfo unable to validate mount point: %@", buf, 0x12u);
    }
  }
  else
  {
    uint64_t v15 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v40 = v5->_volume;
      *(_DWORD *)buf = 67109378;
      int v44 = 119;
      __int16 v45 = 2112;
      uint64_t v46 = v40;
      _os_log_error_impl(&dword_1A63D1000, v15, OS_LOG_TYPE_ERROR, "%d CDRecentVolumeInfo unable to validate mount point: %@", buf, 0x12u);
    }
  }

  id v17 = 0;
LABEL_21:

  return v17;
}

- (id)createVolumeWithMountPoint:(id)a3
{
  return +[CacheDeleteVolume volumeWithMountpoint:a3];
}

- (BOOL)isStale
{
  v3 = [(CDRecentVolumeInfo *)self timestamp];
  BOOL v4 = validateTimestamp(v3, 3600.0);

  v5 = [(CDRecentVolumeInfo *)self volume];
  uint64_t v6 = [(CDRecentVolumeInfo *)self freespace];
  BOOL v7 = validateFreespace(v5, v6, &unk_1EFB2ED38, 0);

  uint64_t v8 = [(CDRecentVolumeInfo *)self thresholds];

  char v9 = !v7;
  if (!v8) {
    char v9 = 1;
  }
  if (v4) {
    return v9;
  }
  else {
    return 1;
  }
}

- (CDRecentVolumeInfo)initWithServices:(id)a3 volumeName:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)CDRecentVolumeInfo;
  uint64_t v8 = [(CDRecentVolumeInfo *)&v21 init];
  char v9 = v8;
  if (!v8)
  {
LABEL_11:
    uint64_t v14 = v9;
    goto LABEL_12;
  }
  objc_storeStrong((id *)&v8->_volume, a4);
  uint64_t v10 = [(CDRecentVolumeInfo *)v9 createVolumeWithPath:v7];
  cdVolume = v9->_cdVolume;
  v9->_cdVolume = (CacheDeleteVolume *)v10;

  if (v9->_volume && v9->_cdVolume)
  {
    if (v6)
    {
      uint64_t v12 = [v6 mutableCopy];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    services = v9->_services;
    v9->_services = (NSMutableDictionary *)v12;

    uint64_t v16 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[CacheDeleteVolume freespace](v9->_cdVolume, "freespace"));
    freespace = v9->_freespace;
    v9->_freespace = (NSNumber *)v16;

    v9->_volumeState = [(CacheDeleteVolume *)v9->_cdVolume state];
    uint64_t v18 = [MEMORY[0x1E4F1C9C8] date];
    timestamp = v9->_timestamp;
    v9->_timestamp = (NSDate *)v18;

    v9->_hasSnapshot = 0;
    goto LABEL_11;
  }
  uint64_t v13 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109378;
    int v23 = 40;
    __int16 v24 = 2112;
    id v25 = v7;
    _os_log_error_impl(&dword_1A63D1000, v13, OS_LOG_TYPE_ERROR, "%d CDRecentVolumeInfo unable to validate mount point: %@", buf, 0x12u);
  }

  uint64_t v14 = 0;
LABEL_12:

  return v14;
}

+ (id)CDRecentVolumeInfo:(id)a3
{
  id v3 = a3;
  BOOL v4 = [[CDRecentVolumeInfo alloc] initWithServices:0 volumeName:v3];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init(CDRecentVolumeInfo);
  id v6 = [(CDRecentVolumeInfo *)self services];
  id v7 = (void *)[v6 copyWithZone:a3];
  [(CDRecentVolumeInfo *)v5 setServices:v7];

  uint64_t v8 = [(CDRecentVolumeInfo *)self timestamp];
  char v9 = (void *)[v8 copyWithZone:a3];
  [(CDRecentVolumeInfo *)v5 setTimestamp:v9];

  uint64_t v10 = [(CDRecentVolumeInfo *)self freespace];
  id v11 = (void *)[v10 copyWithZone:a3];
  [(CDRecentVolumeInfo *)v5 setFreespace:v11];

  uint64_t v12 = [(CDRecentVolumeInfo *)self volume];
  uint64_t v13 = (void *)[v12 copyWithZone:a3];
  [(CDRecentVolumeInfo *)v5 setVolume:v13];

  [(CDRecentVolumeInfo *)v5 setVolumeState:[(CDRecentVolumeInfo *)self volumeState]];
  uint64_t v14 = [(CDRecentVolumeInfo *)self thresholds];
  uint64_t v15 = (void *)[v14 copyWithZone:a3];
  [(CDRecentVolumeInfo *)v5 setThresholds:v15];

  uint64_t v16 = [(CDRecentVolumeInfo *)self bsdDisk];
  id v17 = (void *)[v16 copyWithZone:a3];
  [(CDRecentVolumeInfo *)v5 setBsdDisk:v17];

  [(CDRecentVolumeInfo *)v5 setReserve:[(CDRecentVolumeInfo *)self reserve]];
  [(CDRecentVolumeInfo *)v5 setHasSnapshot:[(CDRecentVolumeInfo *)self hasSnapshot]];
  uint64_t v18 = [(CDRecentVolumeInfo *)self volume];
  uint64_t v19 = [(CDRecentVolumeInfo *)self createVolumeWithPath:v18];
  [(CDRecentVolumeInfo *)v5 setCdVolume:v19];

  return v5;
}

- (BOOL)_validateWithSharedCacheDeleteForService:(id)a3
{
  return 1;
}

- (id)_recentInfoAtUrgency:(int)a3 validateResults:(BOOL)a4
{
  uint64_t v143 = *MEMORY[0x1E4F143B8];
  v108 = [MEMORY[0x1E4F1CA60] dictionary];
  v107 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = [(CDRecentVolumeInfo *)self cdVolume];

  if (!v5)
  {
    id v11 = [(CDRecentVolumeInfo *)self volume];

    if (v11)
    {
      uint64_t v12 = [(CDRecentVolumeInfo *)self volume];
      uint64_t v13 = [(CDRecentVolumeInfo *)self createVolumeWithPath:v12];
      [(CDRecentVolumeInfo *)self setCdVolume:v13];

      uint64_t v14 = [(CDRecentVolumeInfo *)self cdVolume];

      if (!v14)
      {
        uint64_t v15 = CDGetLogHandle((uint64_t)"client");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v102 = [(CDRecentVolumeInfo *)self volume];
          *(_DWORD *)buf = 138412290;
          *(void *)v137 = v102;
          _os_log_error_impl(&dword_1A63D1000, v15, OS_LOG_TYPE_ERROR, "CDRecentVolumeInfo _recentInfoAtUrgency: Unable to create cdVolume for %@", buf, 0xCu);
        }
        uint64_t v16 = 0;
        goto LABEL_98;
      }
    }
  }
  id v6 = [(CDRecentVolumeInfo *)self cdVolume];

  if (v6)
  {
    id v7 = [(CDRecentVolumeInfo *)self cdVolume];
    uint64_t v120 = [v7 freespace];

    uint64_t v8 = [(CDRecentVolumeInfo *)self cdVolume];
    uint64_t v119 = [v8 used];

    char v9 = [(CDRecentVolumeInfo *)self cdVolume];
    uint64_t v117 = [v9 size];

    uint64_t v10 = [(CDRecentVolumeInfo *)self cdVolume];
    uint64_t v115 = objc_msgSend(v10, "effective_size");
  }
  else
  {
    uint64_t v115 = 0;
    uint64_t v117 = 0;
    uint64_t v119 = 0;
    uint64_t v120 = 0;
  }
  long long v132 = 0u;
  long long v133 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  obuint64_t j = [(CDRecentVolumeInfo *)self services];
  uint64_t v110 = [obj countByEnumeratingWithState:&v130 objects:v142 count:16];
  if (!v110)
  {
    uint64_t v106 = 0;
    unint64_t v17 = 0;
    goto LABEL_56;
  }
  uint64_t v106 = 0;
  unint64_t v17 = 0;
  uint64_t v109 = *(void *)v131;
  do
  {
    for (uint64_t i = 0; i != v110; ++i)
    {
      unint64_t v111 = v17;
      if (*(void *)v131 != v109) {
        objc_enumerationMutation(obj);
      }
      uint64_t v19 = *(void **)(*((void *)&v130 + 1) + 8 * i);
      uint64_t v20 = [(CDRecentVolumeInfo *)self services];
      objc_super v21 = [v20 objectForKeyedSubscript:v19];

      v113 = [v21 nonPurgeableAmount];
      v22 = [v21 serviceInfo];
      v112 = [v22 objectForKeyedSubscript:@"CACHE_DELETE_ITEMIZED_NONPURGEABLE"];

      int v23 = [v21 serviceInfo];
      __int16 v24 = [v23 objectForKeyedSubscript:@"CACHE_DELETE_SIGNING_ID"];
      if (v24)
      {
      }
      else
      {
        id v25 = [v21 serviceInfo];
        uint64_t v26 = [v25 objectForKeyedSubscript:@"CACHE_DELETE_PROCNAME"];

        if (!v26) {
          goto LABEL_23;
        }
      }
      v27 = [MEMORY[0x1E4F1CA60] dictionary];
      uint64_t v28 = [v21 serviceInfo];
      uint64_t v29 = [v28 objectForKeyedSubscript:@"CACHE_DELETE_SIGNING_ID"];

      if (v29)
      {
        v30 = [v21 serviceInfo];
        v31 = [v30 objectForKeyedSubscript:@"CACHE_DELETE_SIGNING_ID"];
        [v27 setObject:v31 forKeyedSubscript:@"CACHE_DELETE_SIGNING_ID"];
      }
      uint64_t v32 = [v21 serviceInfo];
      int v33 = [v32 objectForKeyedSubscript:@"CACHE_DELETE_PROCNAME"];

      if (v33)
      {
        uint64_t v34 = [v21 serviceInfo];
        id v35 = [v34 objectForKeyedSubscript:@"CACHE_DELETE_PROCNAME"];
        [v27 setObject:v35 forKeyedSubscript:@"CACHE_DELETE_PROCNAME"];
      }
      uint64_t v36 = (void *)[v27 copy];
      [v107 setObject:v36 forKeyedSubscript:v19];

LABEL_23:
      v37 = v113;
      if (v113 && [v113 unsignedLongLongValue])
      {
        uint64_t v38 = [v113 unsignedLongLongValue];
        id v39 = [v108 objectForKeyedSubscript:@"CACHE_DELETE_ITEMIZED_NONPURGEABLE"];
        if (!v39)
        {
          id v39 = [MEMORY[0x1E4F1CA60] dictionary];
          [v108 setObject:v39 forKeyedSubscript:@"CACHE_DELETE_ITEMIZED_NONPURGEABLE"];
        }
        v106 += v38;
        if (v112) {
          uint64_t v40 = v112;
        }
        else {
          uint64_t v40 = v113;
        }
        [v39 setObject:v40 forKeyedSubscript:v19];
      }
      if ([v19 isEqualToString:@"CACHE_DELETE_TOTAL_FSPURGEABLE"])
      {
        unint64_t v17 = v111;
      }
      else
      {
        uint64_t v41 = a3;
        if (!a4
          || (uint64_t v41 = a3,
              [(CDRecentVolumeInfo *)self _validateWithSharedCacheDeleteForService:v19]))
        {
          while (1)
          {
            objc_super v42 = [v21 amountAtUrgency:v41 checkTimestamp:1];
            if (v42)
            {
              v43 = [(CDRecentVolumeInfo *)self cdVolume];
              int v44 = objc_msgSend(v43, "amountIsRational:freespace:effective_size:used:size:", v42, v120, v115, v119, v117);

              if (v44)
              {
                [v108 setObject:v42 forKeyedSubscript:v19];
                int v53 = fsPurgeableTypeToServiceMap();
                __int16 v54 = [v53 allValues];
                char v55 = [v54 containsObject:v19];

                if ((v55 & 1) == 0) {
                  v111 += [v42 unsignedLongLongValue];
                }

LABEL_46:
                __int16 v56 = CDGetLogHandle((uint64_t)"client");
                if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
                {
                  v57 = [v108 objectForKeyedSubscript:v19];
                  *(_DWORD *)buf = 67109890;
                  *(_DWORD *)v137 = 333;
                  *(_WORD *)&v137[4] = 2112;
                  *(void *)&v137[6] = v19;
                  *(_WORD *)&v137[14] = 2112;
                  *(void *)&v137[16] = v57;
                  __int16 v138 = 2112;
                  v139 = v21;
                  _os_log_impl(&dword_1A63D1000, v56, OS_LOG_TYPE_DEFAULT, "%d CDRecentVolumeInfo _recentInfoAtUrgency, service: %@, amount: %@ %@", buf, 0x26u);
                  goto LABEL_50;
                }
                goto LABEL_51;
              }
              __int16 v45 = NSString;
              uint64_t v46 = [v42 unsignedLongLongValue];
              uint64_t v47 = humanReadableNumber([v42 unsignedLongLongValue]);
              long long v48 = self;
              long long v49 = [(CDRecentVolumeInfo *)self cdVolume];
              long long v50 = [v45 stringWithFormat:@"implausible value %llu (%@) for service: %@ at urgency %d on volume: %@", v46, v47, v19, v41, v49];

              objc_super v51 = CDGetLogHandle((uint64_t)"client");
              if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v137 = 330;
                *(_WORD *)&v137[4] = 2112;
                *(void *)&v137[6] = v50;
                _os_log_error_impl(&dword_1A63D1000, v51, OS_LOG_TYPE_ERROR, "%d CDRecentVolumeInfo _recentInfoAtUrgency: Discarding %@", buf, 0x12u);
              }

              self = v48;
            }

            BOOL v52 = __OFSUB__(v41, 1);
            uint64_t v41 = (v41 - 1);
            if (((int)v41 < 0) ^ v52 | (v41 == 0)) {
              goto LABEL_46;
            }
          }
        }
        __int16 v56 = CDGetLogHandle((uint64_t)"client");
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          v57 = [(CDRecentVolumeInfo *)self volume];
          __int16 v58 = [(CDRecentVolumeInfo *)self services];
          uint64_t v59 = [v58 objectForKeyedSubscript:v19];
          *(_DWORD *)buf = 67110146;
          *(_DWORD *)v137 = 308;
          *(_WORD *)&v137[4] = 2080;
          *(void *)&v137[6] = "-[CDRecentVolumeInfo _recentInfoAtUrgency:validateResults:]";
          *(_WORD *)&v137[14] = 2112;
          *(void *)&v137[16] = v57;
          __int16 v138 = 2112;
          v139 = v19;
          __int16 v140 = 2112;
          v141 = v59;
          _os_log_impl(&dword_1A63D1000, v56, OS_LOG_TYPE_DEFAULT, "%d : %s excluding: volume: %@, service: %@, value: %@", buf, 0x30u);

LABEL_50:
        }
LABEL_51:
        unint64_t v17 = v111;

        v37 = v113;
      }
    }
    uint64_t v110 = [obj countByEnumeratingWithState:&v130 objects:v142 count:16];
  }
  while (v110);
LABEL_56:

  __int16 v60 = [(CDRecentVolumeInfo *)self cdVolume];

  if (v60)
  {
    unint64_t v61 = [(CDRecentVolumeInfo *)self _reserveForVolume];
    v62 = [(CDRecentVolumeInfo *)self cdVolume];
    uint64_t v63 = [v62 size];
    v64 = [(CDRecentVolumeInfo *)self cdVolume];
    unint64_t v65 = v63 - [v64 freespace];

    if (v17 >= v65 - v61) {
      unint64_t v66 = v65 - v61;
    }
    else {
      unint64_t v66 = v17;
    }
    if (v65 > v61 && v66)
    {
      v67 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
      [v108 setObject:v67 forKeyedSubscript:@"CACHE_DELETE_SHARED_PURGEABLE"];
      goto LABEL_65;
    }
  }
  else
  {
    v67 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
      v101 = [(CDRecentVolumeInfo *)self volume];
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v137 = 352;
      *(_WORD *)&v137[4] = 2112;
      *(void *)&v137[6] = v101;
      _os_log_error_impl(&dword_1A63D1000, v67, OS_LOG_TYPE_ERROR, "%d Unable to validate mount point: %@", buf, 0x12u);
    }
LABEL_65:
  }
  v68 = [(CDRecentVolumeInfo *)self cdVolume];
  v69 = [NSNumber numberWithUnsignedLongLong:v17];
  int v70 = [v68 mayContainPurgeableAmount:v69 forService:0];

  v71 = NSNumber;
  if (v70)
  {
    v72 = [NSNumber numberWithUnsignedLongLong:v17];
    v73 = v108;
    [v108 setObject:v72 forKeyedSubscript:@"CACHE_DELETE_TOTAL_AVAILABLE"];
  }
  else
  {
    v72 = [(CDRecentVolumeInfo *)self cdVolume];
    v74 = objc_msgSend(v71, "numberWithDouble:", (double)(unint64_t)objc_msgSend(v72, "size") * 0.8);
    v73 = v108;
    [v108 setObject:v74 forKeyedSubscript:@"CACHE_DELETE_TOTAL_AVAILABLE"];
  }
  if (v107)
  {
    v75 = (void *)[v107 copy];
    [v73 setObject:v75 forKeyedSubscript:@"CACHE_DELETE_NAME_MAP"];
  }
  v76 = [(CDRecentVolumeInfo *)self volume];
  [v73 setObject:v76 forKeyedSubscript:@"CACHE_DELETE_VOLUME"];

  v77 = [NSNumber numberWithUnsignedLongLong:v106];
  [v73 setObject:v77 forKeyedSubscript:@"CACHE_DELETE_NONPURGEABLE_AMOUNT"];

  v78 = (void *)[v73 copy];
  v79 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
  {
    v80 = [(CDRecentVolumeInfo *)self cdVolume];
    v81 = [v80 mountPoint];
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v137 = 376;
    *(_WORD *)&v137[4] = 2114;
    *(void *)&v137[6] = v81;
    *(_WORD *)&v137[14] = 1024;
    *(_DWORD *)&v137[16] = a3;
    _os_log_impl(&dword_1A63D1000, v79, OS_LOG_TYPE_DEFAULT, "%d CDRecentVolumeInfo _recentInfoAtUrgency, volume: %{public}@, urgency: %d, result:", buf, 0x18u);
  }
  long long v128 = 0u;
  long long v129 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  uint64_t v15 = v78;
  uint64_t v82 = [v15 countByEnumeratingWithState:&v126 objects:v135 count:16];
  if (v82)
  {
    uint64_t v83 = v82;
    uint64_t v84 = *(void *)v127;
    uint64_t v114 = *(void *)v127;
    do
    {
      uint64_t v85 = 0;
      uint64_t v116 = v83;
      do
      {
        if (*(void *)v127 != v84) {
          objc_enumerationMutation(v15);
        }
        v121 = *(void **)(*((void *)&v126 + 1) + 8 * v85);
        int v86 = [v121 isEqualToString:@"CACHE_DELETE_NAME_MAP"];
        v87 = CDGetLogHandle((uint64_t)"client");
        BOOL v88 = os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT);
        if (v86)
        {
          uint64_t v118 = v85;
          if (v88)
          {
            *(_DWORD *)buf = 138543362;
            *(void *)v137 = v121;
            _os_log_impl(&dword_1A63D1000, v87, OS_LOG_TYPE_DEFAULT, "%{public}@: {", buf, 0xCu);
          }

          long long v124 = 0u;
          long long v125 = 0u;
          long long v122 = 0u;
          long long v123 = 0u;
          v89 = [v15 objectForKeyedSubscript:v121];
          uint64_t v90 = [v89 countByEnumeratingWithState:&v122 objects:v134 count:16];
          if (v90)
          {
            uint64_t v91 = v90;
            uint64_t v92 = *(void *)v123;
            do
            {
              for (uint64_t j = 0; j != v91; ++j)
              {
                if (*(void *)v123 != v92) {
                  objc_enumerationMutation(v89);
                }
                uint64_t v94 = *(void *)(*((void *)&v122 + 1) + 8 * j);
                v95 = CDGetLogHandle((uint64_t)"client");
                if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
                {
                  [v15 objectForKeyedSubscript:v121];
                  v97 = v96 = v15;
                  v98 = [v97 objectForKeyedSubscript:v94];
                  *(_DWORD *)buf = 138543618;
                  *(void *)v137 = v94;
                  *(_WORD *)&v137[8] = 2114;
                  *(void *)&v137[10] = v98;
                  _os_log_impl(&dword_1A63D1000, v95, OS_LOG_TYPE_DEFAULT, "%{public}@ : %{public}@", buf, 0x16u);

                  uint64_t v15 = v96;
                }
              }
              uint64_t v91 = [v89 countByEnumeratingWithState:&v122 objects:v134 count:16];
            }
            while (v91);
          }

          v87 = CDGetLogHandle((uint64_t)"client");
          if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A63D1000, v87, OS_LOG_TYPE_DEFAULT, "}", buf, 2u);
          }
          uint64_t v84 = v114;
          uint64_t v83 = v116;
          uint64_t v85 = v118;
        }
        else if (v88)
        {
          v99 = [v15 objectForKeyedSubscript:v121];
          *(_DWORD *)buf = 138543618;
          *(void *)v137 = v121;
          *(_WORD *)&v137[8] = 2114;
          *(void *)&v137[10] = v99;
          _os_log_impl(&dword_1A63D1000, v87, OS_LOG_TYPE_DEFAULT, "%{public}@ : %{public}@", buf, 0x16u);
        }
        ++v85;
      }
      while (v85 != v83);
      uint64_t v83 = [v15 countByEnumeratingWithState:&v126 objects:v135 count:16];
    }
    while (v83);
  }
  uint64_t v16 = v15;
LABEL_98:

  return v16;
}

- (id)recentInfoAtUrgency:(int)a3
{
  return [(CDRecentVolumeInfo *)self _recentInfoAtUrgency:*(void *)&a3 validateResults:1];
}

- (void)removeServiceInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(CDRecentVolumeInfo *)self services];
  [v5 removeObjectForKey:v4];
}

- (BOOL)validateServiceInfo:(id)a3 atUrgency:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = [(CDRecentVolumeInfo *)self services];
  uint64_t v8 = [v7 objectForKeyedSubscript:v6];

  LOBYTE(v4) = [v8 validate:v4 atUrgency:120.0];
  return v4;
}

- (id)copyInvalidsAtUrgency:(int)a3 currentlyPushing:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v31 = a4;
  v30 = [MEMORY[0x1E4F1CA48] array];
  id v5 = [(CDRecentVolumeInfo *)self freespace];
  unint64_t v6 = [v5 unsignedLongLongValue] / 0xAuLL;

  if (v6 <= 0x9600000) {
    uint64_t v7 = 157286400;
  }
  else {
    uint64_t v7 = v6;
  }
  unint64_t v38 = 0;
  uint64_t v8 = [(CDRecentVolumeInfo *)self volume];
  char v9 = [(CDRecentVolumeInfo *)self freespace];
  uint64_t v10 = [NSNumber numberWithUnsignedLongLong:v7];
  BOOL v11 = validateFreespace(v8, v9, v10, &v38);

  if (v11)
  {
    int v12 = 0;
  }
  else
  {
    uint64_t v13 = [(CDRecentVolumeInfo *)self volume];
    uint64_t v14 = [(CDRecentVolumeInfo *)self freespace];
    uint64_t v15 = [NSNumber numberWithUnsignedLongLong:3 * v7];
    BOOL v16 = validateFreespace(v13, v14, v15, 0);

    if (!v16)
    {
      unint64_t v17 = CDGetLogHandle((uint64_t)"client");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A63D1000, v17, OS_LOG_TYPE_DEFAULT, "Drastic free space change. Querying all pushing services as well!", buf, 2u);
      }
    }
    [(CDRecentVolumeInfo *)self invalidate];
    uint64_t v18 = [NSNumber numberWithUnsignedLongLong:v38];
    [(CDRecentVolumeInfo *)self setFreespace:v18];

    int v12 = !v16;
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v19 = [(CDRecentVolumeInfo *)self services];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v34 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        id v25 = [(CDRecentVolumeInfo *)self services];
        uint64_t v26 = [v25 objectForKeyedSubscript:v24];

        if (([v26 validate:a3 atUrgency:120.0] & 1) == 0
          && ([v31 containsObject:v24] ^ 1 | v12) == 1)
        {
          [v30 addObject:v24];
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v21);
  }

  v27 = [MEMORY[0x1E4F1CAD0] setWithArray:v30];
  uint64_t v28 = (void *)[v27 copy];

  return v28;
}

- (BOOL)isEmpty
{
  uint64_t v5 = 0;
  unint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 1;
  v2 = [(CDRecentVolumeInfo *)self services];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __29__CDRecentVolumeInfo_isEmpty__block_invoke;
  v4[3] = &unk_1E5C51328;
  v4[4] = &v5;
  [v2 enumerateKeysAndObjectsUsingBlock:v4];

  LOBYTE(v2) = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

uint64_t __29__CDRecentVolumeInfo_isEmpty__block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = [a3 isEmpty];
  if ((result & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

- (id)description
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obuint64_t j = [(CDRecentVolumeInfo *)self services];
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
        char v9 = [NSString stringWithFormat:@"\t%@:", v8];
        [v3 addObject:v9];

        uint64_t v10 = NSString;
        BOOL v11 = [(CDRecentVolumeInfo *)self services];
        int v12 = [v11 objectForKeyedSubscript:v8];
        uint64_t v13 = [v10 stringWithFormat:@"%@", v12];
        [v3 addObject:v13];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }

  uint64_t v14 = [v3 componentsJoinedByString:@"\n"];

  return v14;
}

- (void)log
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(CDRecentVolumeInfo *)self timestamp];
    uint64_t v5 = [(CDRecentVolumeInfo *)self freespace];
    *(_DWORD *)buf = 138412546;
    int v23 = v4;
    __int16 v24 = 2112;
    id v25 = v5;
    _os_log_impl(&dword_1A63D1000, v3, OS_LOG_TYPE_DEFAULT, "  timestamp: %@, freespace: %@", buf, 0x16u);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [(CDRecentVolumeInfo *)self services];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v18;
    *(void *)&long long v8 = 138412290;
    long long v16 = v8;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        int v12 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
        uint64_t v13 = [(CDRecentVolumeInfo *)self services];
        uint64_t v14 = [v13 objectForKeyedSubscript:v12];

        uint64_t v15 = CDGetLogHandle((uint64_t)"client");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v16;
          int v23 = v12;
          _os_log_impl(&dword_1A63D1000, v15, OS_LOG_TYPE_DEFAULT, "   service: %@", buf, 0xCu);
        }

        [v14 log];
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
}

- (void)invalidate
{
  id v2 = [(CDRecentVolumeInfo *)self services];
  [v2 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_1];
}

uint64_t __32__CDRecentVolumeInfo_invalidate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 invalidate];
}

- (void)setVolume:(id)a3
{
}

- (void)setCdVolume:(id)a3
{
}

- (void)setTimestamp:(id)a3
{
}

- (void)setReserve:(unint64_t)a3
{
  self->_reserve = a3;
}

- (void)setBsdDisk:(id)a3
{
}

- (void)setHasSnapshot:(BOOL)a3
{
  self->_hasSnapshot = a3;
}

- (void)setServices:(id)a3
{
}

- (void)setVolumeState:(int64_t)a3
{
  self->_volumeState = a3;
}

- (void)setThresholds:(id)a3
{
}

- (NSMutableDictionary)diagnostics
{
  return self->_diagnostics;
}

- (void)setDiagnostics:(id)a3
{
}

@end