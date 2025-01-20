@interface AXMMADSService
+ (id)sharedInstance;
- (AXMMADSService)init;
- (MADService)service;
- (void)setService:(id)a3;
@end

@implementation AXMMADSService

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1) {
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_31);
  }
  v2 = (void *)sharedInstance__Shared_1;

  return v2;
}

void __32__AXMMADSService_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(AXMMADSService);
  v1 = (void *)sharedInstance__Shared_1;
  sharedInstance__Shared_1 = (uint64_t)v0;
}

- (AXMMADSService)init
{
  v8.receiver = self;
  v8.super_class = (Class)AXMMADSService;
  v2 = [(AXMMADSService *)&v8 init];
  if (v2)
  {
    v3 = AXMediaLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B57D5000, v3, OS_LOG_TYPE_DEFAULT, "AXM Media Analysis: Initializing MediaAnalysisService", buf, 2u);
    }

    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x2050000000;
    v4 = (void *)getMADServiceClass_softClass;
    uint64_t v17 = getMADServiceClass_softClass;
    if (!getMADServiceClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      uint64_t v10 = 3221225472;
      v11 = __getMADServiceClass_block_invoke;
      v12 = &unk_1E6116AD8;
      v13 = &v14;
      __getMADServiceClass_block_invoke((uint64_t)buf);
      v4 = (void *)v15[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v14, 8);
    v6 = [v5 service];
    [(AXMMADSService *)v2 setService:v6];
  }
  return v2;
}

- (MADService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (void).cxx_destruct
{
}

@end