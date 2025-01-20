@interface HDCloudSyncObserverTaskServerStoredProgress
- (HDCloudSyncObserverTaskServerStoredProgress)init;
- (HDCloudSyncObserverTaskServerStoredProgress)initWithProgress:(id)a3;
- (NSProgress)progress;
- (id)invalidationBlock;
- (void)invalidate;
- (void)setInvalidationBlock:(id)a3;
- (void)setProgress:(id)a3;
@end

@implementation HDCloudSyncObserverTaskServerStoredProgress

- (HDCloudSyncObserverTaskServerStoredProgress)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDCloudSyncObserverTaskServerStoredProgress)initWithProgress:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDCloudSyncObserverTaskServerStoredProgress;
  v6 = [(HDCloudSyncObserverTaskServerStoredProgress *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_progress, a3);
    id invalidationBlock = v7->_invalidationBlock;
    v7->_id invalidationBlock = 0;
  }
  return v7;
}

- (void)invalidate
{
  v3 = [(HDCloudSyncObserverTaskServerStoredProgress *)self invalidationBlock];

  if (v3)
  {
    uint64_t v4 = [(HDCloudSyncObserverTaskServerStoredProgress *)self invalidationBlock];
    v4[2]();
  }
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
}

- (id)invalidationBlock
{
  return self->_invalidationBlock;
}

- (void)setInvalidationBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationBlock, 0);

  objc_storeStrong((id *)&self->_progress, 0);
}

@end