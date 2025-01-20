@interface CMLUseCaseStatus
+ (BOOL)supportsSecureCoding;
+ (id)statusForClientConfig:(id)a3 options:(unint64_t)a4 error:(id *)a5;
+ (void)requestStatusForClientConfig:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
+ (void)requestStatusForClientConfig:(id)a3 options:(unint64_t)a4 dispatchQueue:(id)a5 completionHandler:(id)a6;
- (CMLUseCaseStatus)initWithCoder:(id)a3;
- (CMLUseCaseStatus)initWithUseCase:(id)a3 serializedDynamicConfig:(id)a4 lastUsed:(id)a5 keyGenerationTime:(id)a6 keyExpirationTime:(id)a7 status:(unint64_t)a8;
- (NSData)serializedDynamicConfig;
- (NSDate)keyExpirationTime;
- (NSDate)keyGenerationTime;
- (NSDate)lastUsed;
- (NSString)useCase;
- (unint64_t)status;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMLUseCaseStatus

- (CMLUseCaseStatus)initWithUseCase:(id)a3 serializedDynamicConfig:(id)a4 lastUsed:(id)a5 keyGenerationTime:(id)a6 keyExpirationTime:(id)a7 status:(unint64_t)a8
{
  id v22 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)CMLUseCaseStatus;
  v18 = [(CMLUseCaseStatus *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_useCase, a3);
    objc_storeStrong((id *)&v19->_serializedDynamicConfig, a4);
    objc_storeStrong((id *)&v19->_lastUsed, a5);
    objc_storeStrong((id *)&v19->_keyGenerationTime, a6);
    objc_storeStrong((id *)&v19->_keyExpirationTime, a7);
    v19->_status = a8;
  }

  return v19;
}

+ (void)requestStatusForClientConfig:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  dispatch_queue_t v9 = dispatch_queue_create("com.apple.CipherML.CMLUseCaseStatus", 0);
  [(id)objc_opt_class() requestStatusForClientConfig:v8 options:a4 dispatchQueue:v9 completionHandler:v7];
}

+ (void)requestStatusForClientConfig:(id)a3 options:(unint64_t)a4 dispatchQueue:(id)a5 completionHandler:(id)a6
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v13 = +[CMLXPC createConnection];
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__CMLUseCaseStatus_requestStatusForClientConfig_options_dispatchQueue_completionHandler___block_invoke;
  aBlock[3] = &unk_26527E208;
  id v14 = v12;
  id v31 = v14;
  id v15 = v13;
  id v30 = v15;
  id v16 = _Block_copy(aBlock);
  id v17 = +[CMLXPC asyncProxyToConnection:v15 dispatchQueue:v11 callbackWasCalled:v33 + 3 errorHandler:v16];
  v18 = +[CMLLog client];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    v37 = v19;
    _os_log_impl(&dword_249C3F000, v18, OS_LOG_TYPE_DEFAULT, "%@ Sending XPC request", buf, 0xCu);
  }
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __89__CMLUseCaseStatus_requestStatusForClientConfig_options_dispatchQueue_completionHandler___block_invoke_3;
  v23[3] = &unk_26527E258;
  v27 = &v32;
  SEL v28 = a2;
  id v20 = v11;
  id v24 = v20;
  id v21 = v14;
  id v26 = v21;
  id v22 = v15;
  id v25 = v22;
  [v17 queryStatusForClientConfig:v10 options:a4 reply:v23];

  _Block_object_dispose(&v32, 8);
}

uint64_t __89__CMLUseCaseStatus_requestStatusForClientConfig_options_dispatchQueue_completionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);
  return [v2 invalidate];
}

void __89__CMLUseCaseStatus_requestStatusForClientConfig_options_dispatchQueue_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = +[CMLLog client];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSStringFromSelector(*(SEL *)(a1 + 64));
    *(_DWORD *)buf = 138412802;
    v19 = v8;
    __int16 v20 = 1024;
    BOOL v21 = v5 != 0;
    __int16 v22 = 2114;
    id v23 = v6;
    _os_log_impl(&dword_249C3F000, v7, OS_LOG_TYPE_DEFAULT, "%@ XPC request complete, status(%d) error:%{public}@", buf, 0x1Cu);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  if (v6)
  {
    dispatch_queue_t v9 = +[CMLError errorWithCode:1100 underlyingError:v6 description:@"Unable to query status due to errors"];
  }
  else
  {
    dispatch_queue_t v9 = 0;
  }
  id v10 = *(NSObject **)(a1 + 32);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __89__CMLUseCaseStatus_requestStatusForClientConfig_options_dispatchQueue_completionHandler___block_invoke_6;
  v13[3] = &unk_26527E230;
  id v17 = *(id *)(a1 + 48);
  id v14 = v5;
  id v15 = v9;
  id v16 = *(id *)(a1 + 40);
  id v11 = v9;
  id v12 = v5;
  dispatch_async(v10, v13);
}

uint64_t __89__CMLUseCaseStatus_requestStatusForClientConfig_options_dispatchQueue_completionHandler___block_invoke_6(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  v2 = *(void **)(a1 + 48);
  return [v2 invalidate];
}

+ (id)statusForClientConfig:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v8 = a3;
  dispatch_queue_t v9 = +[CMLXPC createConnection];
  id v33 = 0;
  id v10 = +[CMLXPC syncProxyToConnection:v9 error:&v33];
  uint64_t v27 = 0;
  SEL v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy_;
  id v31 = __Block_byref_object_dispose_;
  id v32 = 0;
  uint64_t v21 = 0;
  __int16 v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy_;
  id v25 = __Block_byref_object_dispose_;
  id v26 = 0;
  id v11 = +[CMLLog client];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    char v35 = v12;
    _os_log_impl(&dword_249C3F000, v11, OS_LOG_TYPE_DEFAULT, "%@ Sending XPC request", buf, 0xCu);
  }
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __56__CMLUseCaseStatus_statusForClientConfig_options_error___block_invoke;
  v20[3] = &unk_26527E280;
  v20[4] = &v21;
  v20[5] = &v27;
  v20[6] = a2;
  [v10 queryStatusForClientConfig:v8 options:a4 reply:v20];
  if (a5)
  {
    id v13 = v33;
    if (!v33) {
      id v13 = (id)v28[5];
    }
    *a5 = v13;
  }
  id v14 = +[CMLLog client];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = NSStringFromSelector(a2);
    BOOL v16 = v22[5] != 0;
    uint64_t v17 = v28[5];
    *(_DWORD *)buf = 138412802;
    char v35 = v15;
    __int16 v36 = 1024;
    BOOL v37 = v16;
    __int16 v38 = 2114;
    uint64_t v39 = v17;
    _os_log_impl(&dword_249C3F000, v14, OS_LOG_TYPE_DEFAULT, "%@ Request complete, status(%d) error:%{public}@", buf, 0x1Cu);
  }
  [v9 invalidate];
  id v18 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v18;
}

void __56__CMLUseCaseStatus_statusForClientConfig_options_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  id v8 = +[CMLLog client];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_queue_t v9 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v13 = 138412802;
    id v14 = v9;
    __int16 v15 = 1024;
    BOOL v16 = v6 != 0;
    __int16 v17 = 2114;
    id v18 = v7;
    _os_log_impl(&dword_249C3F000, v8, OS_LOG_TYPE_DEFAULT, "%@ XPC request complete, status(%d), error:%{public}@", (uint8_t *)&v13, 0x1Cu);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  if (v7)
  {
    uint64_t v10 = +[CMLError errorWithCode:1100 underlyingError:v7 description:@"Unable to query status due to errors"];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMLUseCaseStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"useCase"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serializedDynamicConfig"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastUsed"];
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyGenerationTime"];
  dispatch_queue_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyExpirationTime"];
  uint64_t v10 = [v4 decodeInt64ForKey:@"status"];

  uint64_t v11 = [(CMLUseCaseStatus *)self initWithUseCase:v5 serializedDynamicConfig:v6 lastUsed:v7 keyGenerationTime:v8 keyExpirationTime:v9 status:v10];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  id v4 = [(CMLUseCaseStatus *)self useCase];
  [v9 encodeObject:v4 forKey:@"useCase"];

  id v5 = [(CMLUseCaseStatus *)self serializedDynamicConfig];
  [v9 encodeObject:v5 forKey:@"serializedDynamicConfig"];

  id v6 = [(CMLUseCaseStatus *)self lastUsed];
  [v9 encodeObject:v6 forKey:@"lastUsed"];

  id v7 = [(CMLUseCaseStatus *)self keyGenerationTime];
  [v9 encodeObject:v7 forKey:@"keyGenerationTime"];

  id v8 = [(CMLUseCaseStatus *)self keyExpirationTime];
  [v9 encodeObject:v8 forKey:@"keyExpirationTime"];

  objc_msgSend(v9, "encodeInt64:forKey:", -[CMLUseCaseStatus status](self, "status"), @"status");
}

- (NSString)useCase
{
  return self->_useCase;
}

- (NSData)serializedDynamicConfig
{
  return self->_serializedDynamicConfig;
}

- (NSDate)lastUsed
{
  return self->_lastUsed;
}

- (NSDate)keyGenerationTime
{
  return self->_keyGenerationTime;
}

- (NSDate)keyExpirationTime
{
  return self->_keyExpirationTime;
}

- (unint64_t)status
{
  return self->_status;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyExpirationTime, 0);
  objc_storeStrong((id *)&self->_keyGenerationTime, 0);
  objc_storeStrong((id *)&self->_lastUsed, 0);
  objc_storeStrong((id *)&self->_serializedDynamicConfig, 0);
  objc_storeStrong((id *)&self->_useCase, 0);
}

@end