@interface IDSDataMigrationTracker
+ (id)sharedInstance;
- (BOOL)completedMigration;
- (BOOL)hasPerformedMigration;
- (CUTPromise)currentPromise;
- (IDSDataMigrationTracker)init;
- (id)performMigrationIfNeeded;
- (os_unfair_lock_s)lock;
- (void)setCompletedMigration:(BOOL)a3;
- (void)setCurrentPromise:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
@end

@implementation IDSDataMigrationTracker

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001FF02C;
  block[3] = &unk_10097EA18;
  block[4] = a1;
  if (qword_100A4AAF8 != -1) {
    dispatch_once(&qword_100A4AAF8, block);
  }
  v2 = (void *)qword_100A4AAF0;

  return v2;
}

- (IDSDataMigrationTracker)init
{
  v3.receiver = self;
  v3.super_class = (Class)IDSDataMigrationTracker;
  result = [(IDSDataMigrationTracker *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (BOOL)hasPerformedMigration
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_completedMigration;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)performMigrationIfNeeded
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_completedMigration)
  {
    os_unfair_lock_unlock(p_lock);
    v4 = +[NSNull null];
    v5 = +[CUTPromise fulfilledPromiseWithValue:v4];
  }
  else
  {
    currentPromise = self->_currentPromise;
    if (!currentPromise)
    {
      v7 = dispatch_get_global_queue(0, 0);
      uint64_t v12 = 0;
      v13 = &v12;
      uint64_t v14 = 0x3032000000;
      v15 = sub_1001FF2A0;
      v16 = sub_1001FF2B0;
      id v17 = (id)0xAAAAAAAAAAAAAAAALL;
      id v17 = [objc_alloc((Class)CUTPromiseSeal) initWithQueue:v7];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1001FF2B8;
      v11[3] = &unk_100980368;
      v11[4] = self;
      v11[5] = &v12;
      dispatch_async(v7, v11);
      v8 = [(id)v13[5] promise];
      v9 = self->_currentPromise;
      self->_currentPromise = v8;

      _Block_object_dispose(&v12, 8);
      currentPromise = self->_currentPromise;
    }
    v5 = currentPromise;
    os_unfair_lock_unlock(p_lock);
  }

  return v5;
}

- (BOOL)completedMigration
{
  return self->_completedMigration;
}

- (void)setCompletedMigration:(BOOL)a3
{
  self->_completedMigration = a3;
}

- (CUTPromise)currentPromise
{
  return self->_currentPromise;
}

- (void)setCurrentPromise:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void).cxx_destruct
{
}

@end