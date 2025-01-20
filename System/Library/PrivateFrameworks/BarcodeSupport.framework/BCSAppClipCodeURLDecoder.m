@interface BCSAppClipCodeURLDecoder
+ (id)sharedDecoder;
- (BCSAppClipCodeURLDecoder)init;
- (void)decodeURLWithEncodedData:(id)a3 codingVersion:(unint64_t)a4 requiresAuthorization:(BOOL)a5 completionHandler:(id)a6;
- (void)parseEncodedURLData:(id)a3 version:(unint64_t)a4 completion:(id)a5;
@end

@implementation BCSAppClipCodeURLDecoder

+ (id)sharedDecoder
{
  if (sharedDecoder_onceToken != -1) {
    dispatch_once(&sharedDecoder_onceToken, &__block_literal_global_14);
  }
  v2 = (void *)sharedDecoder_sharedDecoder;
  return v2;
}

uint64_t __41__BCSAppClipCodeURLDecoder_sharedDecoder__block_invoke()
{
  sharedDecoder_sharedDecoder = objc_alloc_init(BCSAppClipCodeURLDecoder);
  return MEMORY[0x270F9A758]();
}

- (BCSAppClipCodeURLDecoder)init
{
  v7.receiver = self;
  v7.super_class = (Class)BCSAppClipCodeURLDecoder;
  v2 = [(BCSAppClipCodeURLDecoder *)&v7 init];
  if (v2)
  {
    v3 = objc_alloc_init(BCSParsingServiceConnection);
    serviceConnection = v2->_serviceConnection;
    v2->_serviceConnection = v3;

    v5 = v2;
  }

  return v2;
}

- (void)decodeURLWithEncodedData:(id)a3 codingVersion:(unint64_t)a4 requiresAuthorization:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  v11 = v10;
  if (v10)
  {
    serviceConnection = self->_serviceConnection;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __107__BCSAppClipCodeURLDecoder_decodeURLWithEncodedData_codingVersion_requiresAuthorization_completionHandler___block_invoke;
    v13[3] = &unk_26468B810;
    id v14 = v10;
    [(BCSParsingServiceConnection *)serviceConnection decodeAppClipCodeURLWithEncodedData:a3 codingVersion:a4 requiresAuthorization:v6 withReply:v13];
  }
}

uint64_t __107__BCSAppClipCodeURLDecoder_decodeURLWithEncodedData_codingVersion_requiresAuthorization_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)parseEncodedURLData:(id)a3 version:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  __uint64_t v10 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  serviceConnection = self->_serviceConnection;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __67__BCSAppClipCodeURLDecoder_parseEncodedURLData_version_completion___block_invoke;
  v14[3] = &unk_26468BCB0;
  id v15 = v8;
  id v16 = v9;
  unint64_t v17 = a4;
  __uint64_t v18 = v10;
  id v12 = v9;
  id v13 = v8;
  [(BCSParsingServiceConnection *)serviceConnection decodeAppClipCodeURLWithEncodedData:v13 codingVersion:a4 requiresAuthorization:0 withReply:v14];
}

void __67__BCSAppClipCodeURLDecoder_parseEncodedURLData_version_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  BOOL v6 = v5;
  if (!v5 || a3)
  {
    objc_super v7 = [[BCSInvalidParsedData alloc] initWithInvalidDataType:1 invalidContents:0];
  }
  else if (objc_msgSend(v5, "_bcs_isWalletRemoteRequestURL") && _os_feature_enabled_impl())
  {
    objc_super v7 = [[BCSParsedURLData alloc] initWithURL:v6 type:16];
  }
  else
  {
    objc_super v7 = [[BCSParsedURLData alloc] initWithURL:v6];
  }
  id v8 = v7;
  id v9 = [[BCSAppclipCodePayload alloc] initWithData:*(void *)(a1 + 32) version:*(void *)(a1 + 48)];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __67__BCSAppClipCodeURLDecoder_parseEncodedURLData_version_completion___block_invoke_2;
  v12[3] = &unk_26468B858;
  id v13 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 56);
  id v14 = v10;
  uint64_t v15 = v11;
  +[BCSAction getActionWithData:v8 codePayload:v9 completionHandler:v12];
}

void __67__BCSAppClipCodeURLDecoder_parseEncodedURLData_version_completion___block_invoke_2(void *a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = a1[4];
      int v8 = 134218242;
      uint64_t v9 = v4;
      __int16 v10 = 2112;
      uint64_t v11 = objc_opt_class();
      _os_log_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_INFO, "BCSAppClipCodeURLDecoder: App clip code [%p] has resolved to action of class %@", (uint8_t *)&v8, 0x16u);
    }
    id v5 = +[BCSAWDLogger sharedLogger];
    [v5 logBarcodeDetectedEventForAction:v3 startTime:a1[6]];

    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __67__BCSAppClipCodeURLDecoder_parseEncodedURLData_version_completion___block_invoke_2_cold_1((uint64_t)a1);
    }
    uint64_t v6 = a1[5];
    objc_super v7 = [MEMORY[0x263F087E8] errorWithDomain:@"BCSErrorDomain" code:4 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
  }
}

- (void).cxx_destruct
{
}

void __67__BCSAppClipCodeURLDecoder_parseEncodedURLData_version_completion___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = 134217984;
  uint64_t v3 = v1;
  _os_log_error_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_ERROR, "BCSAppClipCodeURLDecoder: App clip code payload [%p] is not actionable", (uint8_t *)&v2, 0xCu);
}

@end