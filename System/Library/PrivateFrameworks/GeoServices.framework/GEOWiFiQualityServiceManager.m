@interface GEOWiFiQualityServiceManager
+ (id)sharedManager;
+ (void)useProxyClass:(Class)a3;
- (GEOWiFiQualityServiceManager)init;
- (void)cancelRequestId:(id)a3;
- (void)submitWiFiQualityServiceRequest:(id)a3 requestId:(id)a4 auditToken:(id)a5 completionQueue:(id)a6 completion:(id)a7;
- (void)submitWiFiQualityTileLoadForKey:(id)a3 eTag:(id)a4 requestId:(id)a5 auditToken:(id)a6 completionQueue:(id)a7 completion:(id)a8;
@end

@implementation GEOWiFiQualityServiceManager

+ (void)useProxyClass:(Class)a3
{
  v4 = &unk_1ED76A548;
  if (_MergedGlobals_208)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      __int16 v10 = 0;
      v5 = MEMORY[0x1E4F14500];
      v6 = "Assertion failed: !_sharedManager";
      v7 = (uint8_t *)&v10;
LABEL_10:
      _os_log_fault_impl(&dword_188D96000, v5, OS_LOG_TYPE_FAULT, v6, v7, 2u);
    }
LABEL_11:
    __break(1u);
    return;
  }
  id v8 = v4;
  if (([(objc_class *)a3 conformsToProtocol:v4] & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v5 = MEMORY[0x1E4F14500];
      v6 = "Assertion failed: [proxyClass conformsToProtocol:protocol]";
      v7 = buf;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  qword_1EB29F7D8 = (uint64_t)a3;
}

+ (id)sharedManager
{
  if (qword_1EB29F7E0 != -1) {
    dispatch_once(&qword_1EB29F7E0, &__block_literal_global_43);
  }
  v2 = (void *)_MergedGlobals_208;

  return v2;
}

void __45__GEOWiFiQualityServiceManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(GEOWiFiQualityServiceManager);
  v1 = (void *)_MergedGlobals_208;
  _MergedGlobals_208 = (uint64_t)v0;
}

- (GEOWiFiQualityServiceManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)GEOWiFiQualityServiceManager;
  v2 = [(GEOWiFiQualityServiceManager *)&v8 init];
  if (v2)
  {
    v3 = (objc_class *)qword_1EB29F7D8;
    if (!qword_1EB29F7D8)
    {
      v4 = objc_opt_class();
      [v4 useProxyClass:objc_opt_class()];
      v3 = (objc_class *)qword_1EB29F7D8;
    }
    v5 = (GEOWiFiQualityServiceProxy *)objc_alloc_init(v3);
    proxy = v2->_proxy;
    v2->_proxy = v5;
  }
  return v2;
}

- (void)submitWiFiQualityServiceRequest:(id)a3 requestId:(id)a4 auditToken:(id)a5 completionQueue:(id)a6 completion:(id)a7
{
}

- (void)submitWiFiQualityTileLoadForKey:(id)a3 eTag:(id)a4 requestId:(id)a5 auditToken:(id)a6 completionQueue:(id)a7 completion:(id)a8
{
}

- (void)cancelRequestId:(id)a3
{
}

- (void).cxx_destruct
{
}

@end