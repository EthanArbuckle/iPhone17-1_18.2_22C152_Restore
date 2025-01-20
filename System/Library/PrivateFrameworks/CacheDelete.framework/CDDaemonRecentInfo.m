@interface CDDaemonRecentInfo
+ (id)fetchAllowedClassesSet;
+ (id)recentInfoForVolumes:(id)a3;
- (BOOL)isInvalidForVolume:(id)a3;
- (BOOL)isStale;
- (id)_createNewRecentVolumeInfo;
- (id)_createNewRecentVolumeInfoWithName:(id)a3;
- (void)addInvalidVolume:(id)a3;
- (void)invalidateForVolume:(id)a3;
- (void)prune;
- (void)prunePreserving:(id)a3;
- (void)updateInvalidVolumes;
@end

@implementation CDDaemonRecentInfo

- (void)updateInvalidVolumes
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = [(CDDaemonRecentInfo *)self invalidVolumes];
  v4 = [v3 allObjects];

  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        v10 = +[CacheDeleteDaemonVolume volumeWithMountpoint:v9];
        if ([v10 validate])
        {
          v11 = [(CDDaemonRecentInfo *)self invalidVolumes];
          [v11 removeObject:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

+ (id)recentInfoForVolumes:(id)a3
{
  id v3 = a3;
  v4 = [[CDDaemonRecentInfo alloc] initWithVolumes:v3];

  return v4;
}

+ (id)fetchAllowedClassesSet
{
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", v2, v3, v4, objc_opt_class(), 0);
}

- (id)_createNewRecentVolumeInfoWithName:(id)a3
{
  return +[CDDaemonRecentVolumeInfo CDRecentVolumeInfo:a3];
}

- (id)_createNewRecentVolumeInfo
{
  uint64_t v2 = [CDDaemonRecentVolumeInfo alloc];
  return v2;
}

- (void)prunePreserving:(id)a3
{
  id v4 = a3;
  id v5 = [(CDDaemonRecentInfo *)self volumes];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __38__CDDaemonRecentInfo_prunePreserving___block_invoke;
  v7[3] = &unk_10005DBE0;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

id __38__CDDaemonRecentInfo_prunePreserving___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 prunePreserving:*(void *)(a1 + 32)];
}

- (void)prune
{
}

- (BOOL)isStale
{
  return 0;
}

- (void)invalidateForVolume:(id)a3
{
  id v4 = a3;
  id v5 = [(CDDaemonRecentInfo *)self volumes];
  id v6 = [v5 objectForKeyedSubscript:v4];

  [v6 invalidate];
}

- (BOOL)isInvalidForVolume:(id)a3
{
  uint64_t v3 = +[CacheDeleteDaemonVolume volumeWithMountpoint:a3];
  id v4 = v3;
  if (v3) {
    unsigned int v5 = [v3 validate] ^ 1;
  }
  else {
    LOBYTE(v5) = 1;
  }

  return v5;
}

- (void)addInvalidVolume:(id)a3
{
  id v4 = a3;
  id v5 = [(CDDaemonRecentInfo *)self invalidVolumes];
  [v5 addObject:v4];
}

@end