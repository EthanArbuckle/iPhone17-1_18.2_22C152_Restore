@interface XRExpiredPidCacheServiceProtected
- (XRExpiredPidCacheServiceProtected)init;
- (void)_performOnCache:(id)a3;
@end

@implementation XRExpiredPidCacheServiceProtected

- (XRExpiredPidCacheServiceProtected)init
{
  v8.receiver = self;
  v8.super_class = (Class)XRExpiredPidCacheServiceProtected;
  v2 = [(XRExpiredPidCacheServiceProtected *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("Expired Pid Cache", 0);
    cacheQ = v2->_cacheQ;
    v2->_cacheQ = (OS_dispatch_queue *)v3;

    v5 = objc_alloc_init(_XRExpiredPidCache);
    cache = v2->_cache;
    v2->_cache = v5;
  }
  return v2;
}

- (void)_performOnCache:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = sub_230880D34;
  v15 = sub_230880D44;
  id v16 = 0;
  cacheQ = self->_cacheQ;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_230880D4C;
  block[3] = &unk_264B8D490;
  id v6 = v4;
  block[4] = self;
  id v9 = v6;
  v10 = &v11;
  dispatch_sync(cacheQ, block);
  v7 = (void *)v12[5];
  if (v7) {
    objc_exception_throw(v7);
  }

  _Block_object_dispose(&v11, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_cacheQ, 0);
}

@end