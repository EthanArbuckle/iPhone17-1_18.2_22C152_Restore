@interface _CPLProgress
- (BOOL)firstSyncForMainLibrary;
- (BOOL)isForeground;
- (CPLEngineSyncManager)syncManager;
- (NSString)identifier;
- (_CPLProgress)initWithIdentifier:(id)a3 firstSyncOfMainLibrary:(BOOL)a4;
- (int64_t)completedUnitCount;
- (int64_t)totalUnitCount;
- (void)_publishRealProgressIfNecessary;
- (void)publish;
- (void)setCompletedUnitCount:(int64_t)a3;
- (void)setForeground:(BOOL)a3;
- (void)setTotalUnitCount:(int64_t)a3;
- (void)setUserInfoObject:(id)a3 forKey:(id)a4;
- (void)unpublish;
@end

@implementation _CPLProgress

- (_CPLProgress)initWithIdentifier:(id)a3 firstSyncOfMainLibrary:(BOOL)a4
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_CPLProgress;
  v7 = [(_CPLProgress *)&v16 init];
  if (v7)
  {
    v8 = (NSString *)[v6 copy];
    identifier = v7->_identifier;
    v7->_identifier = v8;

    v7->_firstSyncForMainLibrary = a4;
    v17[0] = NSProgressCategoryKey;
    v10 = [@"com.apple.cpl." stringByAppendingString:v6];
    v17[1] = @"_CPLIsInitialSync";
    v18[0] = v10;
    v11 = +[NSNumber numberWithBool:v7->_firstSyncForMainLibrary];
    v18[1] = v11;
    v12 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
    v13 = (NSMutableDictionary *)[v12 mutableCopy];
    userInfo = v7->_userInfo;
    v7->_userInfo = v13;
  }
  return v7;
}

- (void)setTotalUnitCount:(int64_t)a3
{
  self->_totalUnitCount = a3;
  progress = self->_progress;
  if (progress) {
    -[NSProgress setTotalUnitCount:](progress, "setTotalUnitCount:");
  }
}

- (void)setCompletedUnitCount:(int64_t)a3
{
  self->_completedUnitCount = a3;
  progress = self->_progress;
  if (progress) {
    -[NSProgress setCompletedUnitCount:](progress, "setCompletedUnitCount:");
  }
}

- (void)setUserInfoObject:(id)a3 forKey:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  userInfo = self->_userInfo;
  if (v9) {
    [(NSMutableDictionary *)userInfo setObject:v9 forKeyedSubscript:v6];
  }
  else {
    [(NSMutableDictionary *)userInfo removeObjectForKey:v6];
  }
  progress = self->_progress;
  if (progress) {
    [(NSProgress *)progress setUserInfoObject:v9 forKey:v6];
  }
}

- (void)_publishRealProgressIfNecessary
{
  if (self->_progress) {
    sub_1001D157C((uint64_t)a2, (uint64_t)self);
  }
  if (self->_foreground)
  {
    v3 = (NSProgress *)[objc_alloc((Class)NSProgress) initWithParent:0 userInfo:self->_userInfo];
    progress = self->_progress;
    self->_progress = v3;

    [(NSProgress *)self->_progress setTotalUnitCount:self->_totalUnitCount];
    [(NSProgress *)self->_progress setCompletedUnitCount:self->_completedUnitCount];
    [(NSProgress *)self->_progress setCancellable:0];
    [(NSProgress *)self->_progress setPausable:0];
    v5 = self->_progress;
    [(NSProgress *)v5 _publish];
  }
}

- (void)setForeground:(BOOL)a3
{
  self->_foreground = a3;
  BOOL publishing = self->_publishing;
  progress = self->_progress;
  if (!publishing || progress != 0 || !a3)
  {
    if (progress && !a3)
    {
      [(NSProgress *)progress _unpublish];
      v8 = self->_progress;
      self->_progress = 0;
    }
  }
  else
  {
    [(_CPLProgress *)self _publishRealProgressIfNecessary];
  }
}

- (void)publish
{
  if (!self->_publishing)
  {
    [(_CPLProgress *)self _publishRealProgressIfNecessary];
    self->_BOOL publishing = 1;
  }
}

- (void)unpublish
{
  if (self->_publishing)
  {
    progress = self->_progress;
    if (progress)
    {
      [(NSProgress *)progress _unpublish];
      v4 = self->_progress;
      self->_progress = 0;
    }
    self->_BOOL publishing = 0;
  }
}

- (CPLEngineSyncManager)syncManager
{
  return self->_syncManager;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)firstSyncForMainLibrary
{
  return self->_firstSyncForMainLibrary;
}

- (BOOL)isForeground
{
  return self->_foreground;
}

- (int64_t)totalUnitCount
{
  return self->_totalUnitCount;
}

- (int64_t)completedUnitCount
{
  return self->_completedUnitCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_syncManager, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_progress, 0);
}

@end