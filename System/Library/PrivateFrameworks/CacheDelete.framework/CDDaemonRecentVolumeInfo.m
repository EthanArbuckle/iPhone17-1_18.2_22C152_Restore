@interface CDDaemonRecentVolumeInfo
+ (BOOL)supportsSecureCoding;
+ (id)CDRecentVolumeInfo:(id)a3;
- (BOOL)_validateWithSharedCacheDeleteForService:(id)a3;
- (BOOL)hasSnapshot;
- (BOOL)isStale;
- (BOOL)prune;
- (BOOL)prunePreserving:(id)a3;
- (id)bsdDisk;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createVolumeWithMountPoint:(id)a3;
- (id)createVolumeWithPath:(id)a3;
- (id)thresholds;
- (unint64_t)_reserveForVolume;
- (unint64_t)reserve;
@end

@implementation CDDaemonRecentVolumeInfo

- (BOOL)_validateWithSharedCacheDeleteForService:(id)a3
{
  id v3 = a3;
  v4 = +[CacheDelete sharedCacheDelete];
  v5 = v4;
  BOOL v6 = !v4 || [v4 validateService:v3];

  return v6;
}

- (id)createVolumeWithMountPoint:(id)a3
{
  return +[CacheDeleteDaemonVolume volumeWithMountpoint:a3];
}

- (unint64_t)reserve
{
  id v3 = [(CDDaemonRecentVolumeInfo *)self cdVolume];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v5 = CDGetLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "reserve: cdVolume of CDDaemonRecentVolumeInfo is not of class CacheDeleteDaemonVolume", v11, 2u);
    }

    BOOL v6 = [(CDDaemonRecentVolumeInfo *)self volume];
    v7 = [(CDDaemonRecentVolumeInfo *)self createVolumeWithPath:v6];
    [(CDDaemonRecentVolumeInfo *)self setCdVolume:v7];
  }
  v8 = [(CDDaemonRecentVolumeInfo *)self cdVolume];
  id v9 = [v8 reserve];

  return (unint64_t)v9;
}

- (BOOL)hasSnapshot
{
  v2 = [(CDDaemonRecentVolumeInfo *)self volume];
  id v3 = +[CacheDeleteDaemonVolume volumeWithMountpoint:v2];
  unsigned __int8 v4 = [v3 hasSnapshotsExcludingTimeMachine];

  return v4;
}

- (id)thresholds
{
  id v3 = [(CDDaemonRecentVolumeInfo *)self cdVolume];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v5 = CDGetLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "thresholds: cdVolume of CDDaemonRecentVolumeInfo is not of class CacheDeleteDaemonVolume", v11, 2u);
    }

    BOOL v6 = [(CDDaemonRecentVolumeInfo *)self volume];
    v7 = [(CDDaemonRecentVolumeInfo *)self createVolumeWithPath:v6];
    [(CDDaemonRecentVolumeInfo *)self setCdVolume:v7];
  }
  v8 = [(CDDaemonRecentVolumeInfo *)self cdVolume];
  id v9 = [v8 thresholds];

  return v9;
}

- (id)bsdDisk
{
  id v3 = [(CDDaemonRecentVolumeInfo *)self cdVolume];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v5 = CDGetLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "bsdDisk: cdVolume of CDDaemonRecentVolumeInfo is not of class CacheDeleteDaemonVolume", v11, 2u);
    }

    BOOL v6 = [(CDDaemonRecentVolumeInfo *)self volume];
    v7 = [(CDDaemonRecentVolumeInfo *)self createVolumeWithPath:v6];
    [(CDDaemonRecentVolumeInfo *)self setCdVolume:v7];
  }
  v8 = [(CDDaemonRecentVolumeInfo *)self cdVolume];
  id v9 = [v8 bsdDisk];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)createVolumeWithPath:(id)a3
{
  return +[CacheDeleteDaemonVolume volumeWithPath:a3];
}

+ (id)CDRecentVolumeInfo:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = [[CDDaemonRecentVolumeInfo alloc] initWithServices:0 volumeName:v3];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init(CDDaemonRecentVolumeInfo);
  BOOL v6 = [(CDDaemonRecentVolumeInfo *)self services];
  id v7 = [v6 copyWithZone:a3];
  [(CDDaemonRecentVolumeInfo *)v5 setServices:v7];

  v8 = [(CDDaemonRecentVolumeInfo *)self timestamp];
  id v9 = [v8 copyWithZone:a3];
  [(CDDaemonRecentVolumeInfo *)v5 setTimestamp:v9];

  v10 = [(CDDaemonRecentVolumeInfo *)self freespace];
  id v11 = [v10 copyWithZone:a3];
  [(CDDaemonRecentVolumeInfo *)v5 setFreespace:v11];

  v12 = [(CDDaemonRecentVolumeInfo *)self volume];
  id v13 = [v12 copyWithZone:a3];
  [(CDDaemonRecentVolumeInfo *)v5 setVolume:v13];

  [(CDDaemonRecentVolumeInfo *)v5 setVolumeState:[(CDDaemonRecentVolumeInfo *)self volumeState]];
  v14 = [(CDDaemonRecentVolumeInfo *)self thresholds];
  id v15 = [v14 copyWithZone:a3];
  [(CDDaemonRecentVolumeInfo *)v5 setThresholds:v15];

  v16 = [(CDDaemonRecentVolumeInfo *)self bsdDisk];
  id v17 = [v16 copyWithZone:a3];
  [(CDDaemonRecentVolumeInfo *)v5 setBsdDisk:v17];

  [(CDDaemonRecentVolumeInfo *)v5 setReserve:[(CDDaemonRecentVolumeInfo *)self reserve]];
  v18 = [(CDDaemonRecentVolumeInfo *)self volume];
  v19 = [(CDDaemonRecentVolumeInfo *)self createVolumeWithPath:v18];
  [(CDDaemonRecentVolumeInfo *)v5 setCdVolume:v19];

  return v5;
}

- (unint64_t)_reserveForVolume
{
  v2 = [(CDDaemonRecentVolumeInfo *)self cdVolume];
  id v3 = [v2 reserve];

  return (unint64_t)v3;
}

- (BOOL)prunePreserving:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v26 = self;
  BOOL v6 = [(CDDaemonRecentVolumeInfo *)self services];
  id v7 = [v6 allKeys];
  v8 = +[NSMutableSet setWithArray:v7];

  id v9 = +[CacheDelete sharedCacheDelete];
  v24 = v4;
  [v8 minusSet:v4];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v27 objects:v41 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v28;
    id v25 = v10;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v10);
        }
        if (v9)
        {
          uint64_t v15 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          if (([v9 validateService:v15] & 1) == 0)
          {
            v16 = CDGetLogHandle();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              id v17 = [(CDDaemonRecentVolumeInfo *)v26 volume];
              v18 = [(CDDaemonRecentVolumeInfo *)v26 services];
              [v18 objectForKeyedSubscript:v15];
              v20 = v19 = v5;
              *(_DWORD *)buf = 67110146;
              int v32 = 78;
              __int16 v33 = 2080;
              v34 = "-[CDDaemonRecentVolumeInfo prunePreserving:]";
              __int16 v35 = 2112;
              v36 = v17;
              __int16 v37 = 2112;
              uint64_t v38 = v15;
              __int16 v39 = 2112;
              v40 = v20;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%d %s ***** pruning volume: %@, service: %@, value: %@", buf, 0x30u);

              v5 = v19;
              id v10 = v25;
            }
            [v5 addObject:v15];
          }
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v27 objects:v41 count:16];
    }
    while (v12);
  }

  v21 = [(CDDaemonRecentVolumeInfo *)v26 services];
  v22 = [v5 allObjects];
  [v21 removeObjectsForKeys:v22];

  return 0;
}

- (BOOL)prune
{
  return [(CDDaemonRecentVolumeInfo *)self prunePreserving:0];
}

- (BOOL)isStale
{
  return 0;
}

@end