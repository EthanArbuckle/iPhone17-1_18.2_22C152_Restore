@interface FMDEmergencyCallInfoPublisher
- (FMDEmergencyCallInfoPublisher)initWithConfiguration:(id)a3;
- (FMDEmergencyCallInfoPublisherConfiguration)publisherConfig;
- (void)publishInfo:(id)a3 completion:(id)a4;
- (void)setPublisherConfig:(id)a3;
@end

@implementation FMDEmergencyCallInfoPublisher

- (FMDEmergencyCallInfoPublisher)initWithConfiguration:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v5 = (char *)a3;
  v10.receiver = self;
  v10.super_class = (Class)FMDEmergencyCallInfoPublisher;
  v6 = [(FMDEmergencyCallInfoPublisher *)&v10 init];
  if (v6)
  {
    v7 = LogCategory_Unspecified();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[FMDEmergencyCallInfoPublisher initWithConfiguration:]";
      _os_log_impl(&dword_1D0E93000, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }

    v8 = LogCategory_Unspecified();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v5;
      _os_log_impl(&dword_1D0E93000, v8, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    objc_storeStrong((id *)&v6->_publisherConfig, a3);
  }

  return v6;
}

- (void)publishInfo:(id)a3 completion:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  v8 = LogCategory_Unspecified();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[FMDEmergencyCallInfoPublisher publishInfo:completion:]";
    _os_log_impl(&dword_1D0E93000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v23[0] = @"kFMDEmergencyCallInfoPublisherConfigKey";
  v9 = [(FMDEmergencyCallInfoPublisher *)self publisherConfig];
  v23[1] = @"kFMDEmergencyCallInfoPublisherInfoKey";
  v24[0] = v9;
  v24[1] = v7;
  objc_super v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];

  v11 = +[FMNSXPCConnectionCache sharedCache];
  v12 = +[FMNSXPCConnectionConfiguration emergencyCallInfoPublisherConfiguration];
  uint64_t v13 = [v11 resumeConnectionWithConfiguration:v12];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __56__FMDEmergencyCallInfoPublisher_publishInfo_completion___block_invoke;
  v21[3] = &unk_1E689BE48;
  id v14 = v6;
  id v22 = v14;
  [v13 addFailureBlock:v21];
  v15 = [v13 remoteObjectProxy];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __56__FMDEmergencyCallInfoPublisher_publishInfo_completion___block_invoke_4;
  v18[3] = &unk_1E689C088;
  id v19 = v13;
  id v20 = v14;
  id v16 = v13;
  id v17 = v14;
  [v15 publishInfo:v10 completion:v18];
}

void __56__FMDEmergencyCallInfoPublisher_publishInfo_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = LogCategory_Unspecified();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __56__FMDEmergencyCallInfoPublisher_publishInfo_completion___block_invoke_cold_1(a2, v4);
  }

  v5 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v5);
  }
}

uint64_t __56__FMDEmergencyCallInfoPublisher_publishInfo_completion___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);

  return [v2 invalidate];
}

- (FMDEmergencyCallInfoPublisherConfiguration)publisherConfig
{
  return self->_publisherConfig;
}

- (void)setPublisherConfig:(id)a3
{
}

- (void).cxx_destruct
{
}

void __56__FMDEmergencyCallInfoPublisher_publishInfo_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0E93000, a2, OS_LOG_TYPE_ERROR, "XPC error for publishInfo:completion: %li", (uint8_t *)&v2, 0xCu);
}

@end