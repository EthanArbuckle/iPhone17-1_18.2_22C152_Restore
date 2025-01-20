@interface FPActionLocatorAccessToken
+ (id)tokenWithBlock:(id)a3;
- (void)dealloc;
- (void)stopAccessing;
@end

@implementation FPActionLocatorAccessToken

+ (id)tokenWithBlock:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  uint64_t v5 = MEMORY[0x1A6248B00](v3);

  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (void)dealloc
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A33AE000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] someone forgot to call -stopAccessing", v1, 2u);
}

- (void)stopAccessing
{
  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  stopBlock = (void (**)(void))obj->_stopBlock;
  if (stopBlock)
  {
    stopBlock[2]();
    id v4 = obj->_stopBlock;
    obj->_stopBlock = 0;

    v2 = obj;
  }
  objc_sync_exit(v2);
}

- (void).cxx_destruct
{
}

@end