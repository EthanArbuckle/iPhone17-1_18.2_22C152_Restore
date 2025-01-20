@interface NTKSnowglobeMotionToken
- (BOOL)invalidated;
- (NTKSnowglobeMotionToken)initWithMotionManager:(id)a3;
- (void)dealloc;
- (void)invalidate;
@end

@implementation NTKSnowglobeMotionToken

- (NTKSnowglobeMotionToken)initWithMotionManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKSnowglobeMotionToken;
  v6 = [(NTKSnowglobeMotionToken *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_manager, a3);
  }

  return v7;
}

- (void)invalidate
{
  obj = self;
  objc_sync_enter(obj);
  if (!obj->_invalidated)
  {
    obj->_invalidated = 1;
    [(NTKSnowglobeMotionManager *)obj->_manager _invalidateToken];
  }
  objc_sync_exit(obj);
}

- (void)dealloc
{
  v2 = self;
  objc_sync_enter(v2);
  objc_sync_exit(v2);

  [(NTKSnowglobeMotionToken *)v2 invalidate];
  v3.receiver = v2;
  v3.super_class = (Class)NTKSnowglobeMotionToken;
  [(NTKSnowglobeMotionToken *)&v3 dealloc];
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void).cxx_destruct
{
}

@end