@interface AMSMetricsIdentifierStoreInfo
- (BOOL)crossDeviceSync;
- (BOOL)deleted;
- (NSDate)lastSync;
- (NSDate)modified;
- (NSDate)started;
- (NSString)account;
- (NSString)storeKey;
- (NSString)storeUUID;
- (double)resetInterval;
- (id)description;
- (void)setAccount:(id)a3;
- (void)setCrossDeviceSync:(BOOL)a3;
- (void)setDeleted:(BOOL)a3;
- (void)setLastSync:(id)a3;
- (void)setModified:(id)a3;
- (void)setResetInterval:(double)a3;
- (void)setStarted:(id)a3;
- (void)setStoreKey:(id)a3;
- (void)setStoreUUID:(id)a3;
@end

@implementation AMSMetricsIdentifierStoreInfo

- (BOOL)crossDeviceSync
{
  return self->_crossDeviceSync;
}

- (double)resetInterval
{
  return self->_resetInterval;
}

- (BOOL)deleted
{
  return self->_deleted;
}

- (NSDate)started
{
  return self->_started;
}

- (NSString)storeUUID
{
  return self->_storeUUID;
}

- (NSString)storeKey
{
  return self->_storeKey;
}

- (void)setModified:(id)a3
{
}

- (void)setCrossDeviceSync:(BOOL)a3
{
  self->_crossDeviceSync = a3;
}

- (void)setStoreUUID:(id)a3
{
}

- (void)setStoreKey:(id)a3
{
}

- (void)setStarted:(id)a3
{
}

- (void)setResetInterval:(double)a3
{
  self->_resetInterval = a3;
}

- (void)setLastSync:(id)a3
{
}

- (void)setDeleted:(BOOL)a3
{
  self->_deleted = a3;
}

- (void)setAccount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modified, 0);
  objc_storeStrong((id *)&self->_lastSync, 0);
  objc_storeStrong((id *)&self->_storeUUID, 0);
  objc_storeStrong((id *)&self->_storeKey, 0);
  objc_storeStrong((id *)&self->_started, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

- (NSDate)modified
{
  return self->_modified;
}

- (NSDate)lastSync
{
  return self->_lastSync;
}

- (NSString)account
{
  return self->_account;
}

- (id)description
{
  v13.receiver = self;
  v13.super_class = (Class)AMSMetricsIdentifierStoreInfo;
  v3 = [(AMSMetricsIdentifierStoreInfo *)&v13 description];
  long long v12 = *(_OWORD *)&self->_storeKey;
  started = self->_started;
  v5 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_resetInterval];
  lastSync = self->_lastSync;
  modified = self->_modified;
  v8 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_crossDeviceSync];
  v9 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_deleted];
  v10 = [v3 stringByAppendingFormat:@" (storeKey: %@, storeUUID: %@, started: %@, resetInterval: %@, modified: %@, lastSync: %@, crossDeviceSync: %@, deleted: %@, account: %@)", v12, started, v5, modified, lastSync, v8, v9, self->_account];

  return v10;
}

@end