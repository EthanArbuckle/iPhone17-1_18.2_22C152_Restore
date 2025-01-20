@interface BLDownloadPolicy
+ (id)policyInfoWithCellularResult:(int64_t)a3;
- (BOOL)cacheLoaded;
- (BOOL)hasCellularResult;
- (NSData)policyData;
- (NSDictionary)cachedInfo;
- (NSDictionary)info;
- (NSNumber)storePlaylistIdentifier;
- (NSString)policyID;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)cellularResult;
- (void)_loadCachedPropertiesIfNeeded;
- (void)setCacheLoaded:(BOOL)a3;
- (void)setCachedInfo:(id)a3;
- (void)setPolicyData:(id)a3;
- (void)setPolicyID:(id)a3;
- (void)setStorePlaylistIdentifier:(id)a3;
@end

@implementation BLDownloadPolicy

+ (id)policyInfoWithCellularResult:(int64_t)a3
{
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = +[NSNumber numberWithInteger:a3];
  [v4 setObject:v5 forKeyedSubscript:@"CellularResult"];

  id v6 = [v4 copy];

  return v6;
}

- (void)_loadCachedPropertiesIfNeeded
{
  if (![(BLDownloadPolicy *)self cacheLoaded])
  {
    v3 = [(BLDownloadPolicy *)self policyData];
    [(BLDownloadPolicy *)self setCachedInfo:0];
    id v12 = 0;
    id v4 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v3 error:&v12];
    id v5 = v12;
    if (v5)
    {
      id v6 = BLDaemonLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = [v5 description];
        *(_DWORD *)buf = 138543362;
        v14 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Error decoding policy: %{public}@", buf, 0xCu);
      }
      v8 = 0;
    }
    else
    {
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = objc_opt_class();
      id v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v9, v10, objc_opt_class(), 0);
      v8 = [v4 decodeObjectOfClasses:v6 forKey:@"Info"];
    }

    v11 = BLServiceLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Finished with decoding policy", buf, 2u);
    }

    [(BLDownloadPolicy *)self setCachedInfo:v8];
    [(BLDownloadPolicy *)self setCacheLoaded:1];
  }
}

- (BOOL)hasCellularResult
{
  v2 = [(BLDownloadPolicy *)self info];
  v3 = [v2 objectForKey:@"CellularResult"];
  BOOL v4 = v3 != 0;

  return v4;
}

- (int64_t)cellularResult
{
  v2 = [(BLDownloadPolicy *)self info];
  v3 = [v2 objectForKeyedSubscript:@"CellularResult"];
  id v4 = [v3 integerValue];

  return (int64_t)v4;
}

- (NSDictionary)info
{
  [(BLDownloadPolicy *)self _loadCachedPropertiesIfNeeded];

  return [(BLDownloadPolicy *)self cachedInfo];
}

- (void)setPolicyData:(id)a3
{
  id v4 = (NSData *)[a3 copy];
  policyData = self->_policyData;
  self->_policyData = v4;

  [(BLDownloadPolicy *)self setCacheLoaded:0];

  [(BLDownloadPolicy *)self setCachedInfo:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_opt_new();
  if (v4)
  {
    id v5 = [(BLDownloadPolicy *)self policyID];
    [v4 setPolicyID:v5];

    id v6 = [(BLDownloadPolicy *)self policyData];
    [v4 setPolicyData:v6];
  }
  return v4;
}

- (NSString)policyID
{
  return self->_policyID;
}

- (void)setPolicyID:(id)a3
{
}

- (NSNumber)storePlaylistIdentifier
{
  return self->_storePlaylistIdentifier;
}

- (void)setStorePlaylistIdentifier:(id)a3
{
}

- (NSData)policyData
{
  return self->_policyData;
}

- (BOOL)cacheLoaded
{
  return self->_cacheLoaded;
}

- (void)setCacheLoaded:(BOOL)a3
{
  self->_cacheLoaded = a3;
}

- (NSDictionary)cachedInfo
{
  return self->_cachedInfo;
}

- (void)setCachedInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedInfo, 0);
  objc_storeStrong((id *)&self->_policyData, 0);
  objc_storeStrong((id *)&self->_storePlaylistIdentifier, 0);

  objc_storeStrong((id *)&self->_policyID, 0);
}

@end