@interface AssetPAAccessInterval
- (AssetPAAccessInterval)initWithClientPid:(int)a3 auditToken:(id *)a4;
- (void)dealloc;
@end

@implementation AssetPAAccessInterval

- (AssetPAAccessInterval)initWithClientPid:(int)a3 auditToken:(id *)a4
{
  v15.receiver = self;
  v15.super_class = (Class)AssetPAAccessInterval;
  v5 = [(AssetPAAccessInterval *)&v15 init];
  if (v5)
  {
    *(void *)&long long v21 = 0;
    *((void *)&v21 + 1) = &v21;
    *(void *)&long long v22 = 0x3052000000;
    *((void *)&v22 + 1) = __Block_byref_object_copy__7;
    v23 = __Block_byref_object_dispose__7;
    v6 = (void *)getPAAccessLoggerClass_softClass;
    uint64_t v24 = getPAAccessLoggerClass_softClass;
    if (!getPAAccessLoggerClass_softClass)
    {
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      v18 = __getPAAccessLoggerClass_block_invoke;
      v19 = &unk_1E57982D0;
      v20 = &v21;
      __getPAAccessLoggerClass_block_invoke((uint64_t)&v16);
      v6 = *(void **)(*((void *)&v21 + 1) + 40);
    }
    _Block_object_dispose(&v21, 8);
    v5->_logger = (PAAccessLogger *)(id)[v6 sharedInstance];
    id v7 = objc_alloc((Class)getPATCCAccessClass());
    v8 = (void *)MEMORY[0x1E4FA9AA0];
    uint64_t v9 = *MEMORY[0x1E4FA9AA0];
    long long v10 = *(_OWORD *)&a4->var0[4];
    long long v21 = *(_OWORD *)a4->var0;
    long long v22 = v10;
    uint64_t v11 = [v7 initWithAuditToken:&v21 forService:v9];
    v5->_access = (PATCCAccess *)v11;
    if (!s_shouldUseStubPAApplication)
    {
      if (!v11) {
        return v5;
      }
      goto LABEL_8;
    }
    *(void *)&long long v21 = 0;
    *((void *)&v21 + 1) = &v21;
    *(void *)&long long v22 = 0x3052000000;
    *((void *)&v22 + 1) = __Block_byref_object_copy__7;
    v23 = __Block_byref_object_dispose__7;
    v12 = (objc_class *)getPAApplicationClass_softClass;
    uint64_t v24 = getPAApplicationClass_softClass;
    if (!getPAApplicationClass_softClass)
    {
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      v18 = __getPAApplicationClass_block_invoke;
      v19 = &unk_1E57982D0;
      v20 = &v21;
      __getPAApplicationClass_block_invoke((uint64_t)&v16);
      v12 = *(objc_class **)(*((void *)&v21 + 1) + 40);
    }
    _Block_object_dispose(&v21, 8);
    v5->_application = (PAApplication *)[[v12 alloc] initWithType:0 identifier:@"com.apple.music"];
    uint64_t v13 = [objc_alloc((Class)getPATCCAccessClass()) initWithAccessor:v5->_application forService:*v8];
    v5->_access = (PATCCAccess *)v13;
    if (v13) {
LABEL_8:
    }
      v5->_accessInterval = (PAAccessInterval *)(id)-[PAAccessLogger beginIntervalForAccess:](v5->_logger, "beginIntervalForAccess:");
  }
  return v5;
}

- (void)dealloc
{
  [(PAAccessInterval *)self->_accessInterval end];

  v3.receiver = self;
  v3.super_class = (Class)AssetPAAccessInterval;
  [(AssetPAAccessInterval *)&v3 dealloc];
}

@end