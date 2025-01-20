@interface BCSQRCodeParser
+ (id)sharedParser;
- (BCSNotificationServiceConnection)notificationServiceConnection;
- (id)_payloadForMRCObject:(id)a3;
- (id)_qrCodeFeatureFromImage:(CGImage *)a3;
- (void)_parseMetadataObject:(id)a3 reply:(id)a4 completionHandler:(id)a5;
- (void)parseCodeFromImage:(CGImage *)a3 completionHandler:(id)a4;
- (void)parseCodeFromMetadataMachineReadableCodeObject:(id)a3 completionHandler:(id)a4;
- (void)parseCodeFromString:(id)a3 completionHandler:(id)a4;
- (void)postNotificationAfterParsingCodeFromImage:(CGImage *)a3 completion:(id)a4;
- (void)setPreferredBundleIdentifier:(id)a3 forURL:(id)a4;
- (void)startQRCodeParsingSessionWithMetadataObject:(id)a3 completionHandler:(id)a4;
- (void)stopQRCodeParsingSession;
@end

@implementation BCSQRCodeParser

+ (id)sharedParser
{
  if (sharedParser_onceToken != -1) {
    dispatch_once(&sharedParser_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)sharedParser_sharedParser;
  return v2;
}

uint64_t __31__BCSQRCodeParser_sharedParser__block_invoke()
{
  sharedParser_sharedParser = objc_alloc_init(BCSQRCodeParser);
  return MEMORY[0x270F9A758]();
}

- (void)parseCodeFromMetadataMachineReadableCodeObject:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __uint64_t v8 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __84__BCSQRCodeParser_parseCodeFromMetadataMachineReadableCodeObject_completionHandler___block_invoke;
  v11[3] = &unk_26468B880;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  __uint64_t v14 = v8;
  id v9 = v7;
  id v10 = v6;
  [(BCSQRCodeParser *)self _parseMetadataObject:v10 reply:v11 completionHandler:v9];
}

void __84__BCSQRCodeParser_parseCodeFromMetadataMachineReadableCodeObject_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  id v6 = [v3 _payloadForMRCObject:v4];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __84__BCSQRCodeParser_parseCodeFromMetadataMachineReadableCodeObject_completionHandler___block_invoke_2;
  v9[3] = &unk_26468B858;
  id v10 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  id v11 = v7;
  uint64_t v12 = v8;
  +[BCSAction getActionWithData:v5 codePayload:v6 completionHandler:v9];
}

void __84__BCSQRCodeParser_parseCodeFromMetadataMachineReadableCodeObject_completionHandler___block_invoke_2(void *a1, void *a2)
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
      _os_log_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_INFO, "BCSQRCodeParser: AVMetadataMachineReadableCodeObject %p QR code has resolved to action of class %@", (uint8_t *)&v8, 0x16u);
    }
    id v5 = +[BCSAWDLogger sharedLogger];
    [v5 logBarcodeDetectedEventForAction:v3 startTime:a1[6]];

    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __84__BCSQRCodeParser_parseCodeFromMetadataMachineReadableCodeObject_completionHandler___block_invoke_2_cold_1();
    }
    uint64_t v6 = a1[5];
    id v7 = [MEMORY[0x263F087E8] errorWithDomain:@"BCSErrorDomain" code:4 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
  }
}

- (id)_qrCodeFeatureFromImage:(CGImage *)a3
{
  v28[2] = *MEMORY[0x263EF8340];
  id v3 = (void *)[objc_alloc(MEMORY[0x263F00650]) initWithCGImage:a3 options:0];
  uint64_t v4 = (void *)MEMORY[0x263F00630];
  uint64_t v5 = *MEMORY[0x263F005E8];
  uint64_t v6 = *MEMORY[0x263F005B8];
  uint64_t v7 = *MEMORY[0x263F005C8];
  v27[0] = *MEMORY[0x263F005B0];
  v27[1] = v7;
  v28[0] = v6;
  v28[1] = &unk_26D6118E8;
  int v8 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
  uint64_t v9 = [v4 detectorOfType:v5 context:0 options:v8];

  __int16 v10 = [v9 featuresInImage:v3];
  if (![v10 count])
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO)) {
      goto LABEL_20;
    }
    *(_WORD *)buf = 0;
    v17 = &_os_log_internal;
    v18 = "BCSQRCodeParser: no feature detected in the image.";
LABEL_19:
    _os_log_impl(&dword_223007000, v17, OS_LOG_TYPE_INFO, v18, buf, 2u);
    goto LABEL_20;
  }
  if ([v10 count] != 1)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO)) {
      goto LABEL_20;
    }
    *(_WORD *)buf = 0;
    v17 = &_os_log_internal;
    v18 = "BCSQRCodeParser: we don't support multiple codes in the same image.";
    goto LABEL_19;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
LABEL_5:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v22 != v14) {
        objc_enumerationMutation(v11);
      }
      v16 = *(void **)(*((void *)&v21 + 1) + 8 * v15);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      if (v13 == ++v15)
      {
        uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
        if (v13) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }
    id v19 = v16;

    if (v19) {
      goto LABEL_21;
    }
  }
  else
  {
LABEL_11:
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    v17 = &_os_log_internal;
    v18 = "BCSQRCodeParser: image has no QR code.";
    goto LABEL_19;
  }
LABEL_20:
  id v19 = 0;
LABEL_21:

  return v19;
}

- (void)parseCodeFromImage:(CGImage *)a3 completionHandler:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (!self->_parsingServiceConnection)
  {
    uint64_t v7 = objc_alloc_init(BCSParsingServiceConnection);
    parsingServiceConnection = self->_parsingServiceConnection;
    self->_parsingServiceConnection = v7;
  }
  uint64_t v9 = [(BCSQRCodeParser *)self _qrCodeFeatureFromImage:a3];
  if (v9)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v18 = v9;
      _os_log_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_INFO, "BCSQRCodeParser: Start parsing CIQRCodeFeature %p", buf, 0xCu);
    }
    __uint64_t v10 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    id v11 = self->_parsingServiceConnection;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __56__BCSQRCodeParser_parseCodeFromImage_completionHandler___block_invoke;
    v13[3] = &unk_26468B8A8;
    id v14 = v9;
    id v15 = v6;
    __uint64_t v16 = v10;
    [(BCSParsingServiceConnection *)v11 parseQRCodeFeature:v14 withReply:v13];
  }
  else
  {
    uint64_t v12 = [MEMORY[0x263F087E8] errorWithDomain:@"BCSErrorDomain" code:2 userInfo:0];
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v12);
  }
}

void __56__BCSQRCodeParser_parseCodeFromImage_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134218240;
      uint64_t v15 = v7;
      __int16 v16 = 2048;
      uint64_t v17 = [v5 type];
      _os_log_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_INFO, "BCSQRCodeParser: QR code from CIQRCodeFeature %p has type %ld", buf, 0x16u);
    }
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __56__BCSQRCodeParser_parseCodeFromImage_completionHandler___block_invoke_11;
    v10[3] = &unk_26468B858;
    id v11 = *(id *)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    id v12 = v8;
    uint64_t v13 = v9;
    +[BCSAction getActionWithData:v5 codePayload:0 completionHandler:v10];
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __56__BCSQRCodeParser_parseCodeFromImage_completionHandler___block_invoke_cold_1();
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __56__BCSQRCodeParser_parseCodeFromImage_completionHandler___block_invoke_11(void *a1, void *a2)
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
      _os_log_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_INFO, "BCSQRCodeParser: QR code from CIQRCodeFeature %p has resolved to action of class %@", (uint8_t *)&v8, 0x16u);
    }
    id v5 = +[BCSAWDLogger sharedLogger];
    [v5 logBarcodeDetectedEventForAction:v3 startTime:a1[6]];

    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __56__BCSQRCodeParser_parseCodeFromImage_completionHandler___block_invoke_11_cold_1();
    }
    uint64_t v6 = a1[5];
    uint64_t v7 = [MEMORY[0x263F087E8] errorWithDomain:@"BCSErrorDomain" code:4 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
  }
}

- (void)parseCodeFromString:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __uint64_t v8 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  parsingServiceConnection = self->_parsingServiceConnection;
  if (!parsingServiceConnection)
  {
    __int16 v10 = objc_alloc_init(BCSParsingServiceConnection);
    uint64_t v11 = self->_parsingServiceConnection;
    self->_parsingServiceConnection = v10;

    parsingServiceConnection = self->_parsingServiceConnection;
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __57__BCSQRCodeParser_parseCodeFromString_completionHandler___block_invoke;
  v13[3] = &unk_26468B8F8;
  id v14 = v7;
  __uint64_t v15 = v8;
  id v12 = v7;
  [(BCSParsingServiceConnection *)parsingServiceConnection parseQRCodeString:v6 withReply:v13];
}

void __57__BCSQRCodeParser_parseCodeFromString_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      __57__BCSQRCodeParser_parseCodeFromString_completionHandler___block_invoke_cold_2(v5);
    }
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __57__BCSQRCodeParser_parseCodeFromString_completionHandler___block_invoke_13;
    v19[3] = &unk_26468B8D0;
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    id v20 = v7;
    uint64_t v21 = v8;
    +[BCSAction getActionWithData:v5 codePayload:0 completionHandler:v19];
    uint64_t v9 = v20;
  }
  else
  {
    BOOL v10 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v10) {
      __57__BCSQRCodeParser_parseCodeFromString_completionHandler___block_invoke_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
    uint64_t v18 = *(void *)(a1 + 32);
    uint64_t v9 = [MEMORY[0x263F087E8] errorWithDomain:@"BCSErrorDomain" code:3 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v18 + 16))(v18, 0, v9);
  }
}

void __57__BCSQRCodeParser_parseCodeFromString_completionHandler___block_invoke_13(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      __57__BCSQRCodeParser_parseCodeFromString_completionHandler___block_invoke_13_cold_2();
    }
    uint64_t v4 = +[BCSAWDLogger sharedLogger];
    [v4 logBarcodeDetectedEventForAction:v3 startTime:*(void *)(a1 + 40)];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    BOOL v5 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v5) {
      __57__BCSQRCodeParser_parseCodeFromString_completionHandler___block_invoke_13_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = [MEMORY[0x263F087E8] errorWithDomain:@"BCSErrorDomain" code:4 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v13 + 16))(v13, 0, v14);
  }
}

- (void)postNotificationAfterParsingCodeFromImage:(CGImage *)a3 completion:(id)a4
{
  id v6 = a4;
  if (!self->_parsingServiceConnection)
  {
    uint64_t v7 = objc_alloc_init(BCSParsingServiceConnection);
    parsingServiceConnection = self->_parsingServiceConnection;
    self->_parsingServiceConnection = v7;
  }
  uint64_t v9 = [(BCSQRCodeParser *)self _qrCodeFeatureFromImage:a3];
  if (v9)
  {
    uint64_t v10 = self->_parsingServiceConnection;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __72__BCSQRCodeParser_postNotificationAfterParsingCodeFromImage_completion___block_invoke;
    v12[3] = &unk_26468B940;
    v12[4] = self;
    id v13 = v6;
    [(BCSParsingServiceConnection *)v10 parseQRCodeFeature:v9 withReply:v12];
  }
  else
  {
    uint64_t v11 = [MEMORY[0x263F087E8] errorWithDomain:@"BCSErrorDomain" code:2 userInfo:0];
    (*((void (**)(id, void *))v6 + 2))(v6, v11);
  }
}

void __72__BCSQRCodeParser_postNotificationAfterParsingCodeFromImage_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      __72__BCSQRCodeParser_postNotificationAfterParsingCodeFromImage_completion___block_invoke_cold_2(v5);
    }
    uint64_t v7 = [*(id *)(a1 + 32) notificationServiceConnection];
    [v7 notifyParsedCodeWithData:v5 codePayload:0 shouldReplacePreviousNotifications:1 withReply:&__block_literal_global_17];
  }
  else
  {
    BOOL v8 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v8) {
      __72__BCSQRCodeParser_postNotificationAfterParsingCodeFromImage_completion___block_invoke_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __72__BCSQRCodeParser_postNotificationAfterParsingCodeFromImage_completion___block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (v4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __72__BCSQRCodeParser_postNotificationAfterParsingCodeFromImage_completion___block_invoke_14_cold_1(v4);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_INFO, "BCSQRCodeParser: Finished notification successfully", v6, 2u);
  }
}

- (void)_parseMetadataObject:(id)a3 reply:(id)a4 completionHandler:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v29 = v8;
    _os_log_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_INFO, "BCSQRCodeParser: Start parsing AVMetadataMachineReadableCodeObject %p", buf, 0xCu);
  }
  uint64_t v11 = [v8 type];
  uint64_t v12 = [v8 basicDescriptor];
  if (v12)
  {
    if (!self->_parsingServiceConnection)
    {
      uint64_t v13 = objc_alloc_init(BCSParsingServiceConnection);
      parsingServiceConnection = self->_parsingServiceConnection;
      self->_parsingServiceConnection = v13;
    }
    if ([v11 isEqualToString:*MEMORY[0x263EF9F40]])
    {
      uint64_t v15 = self->_parsingServiceConnection;
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __64__BCSQRCodeParser__parseMetadataObject_reply_completionHandler___block_invoke;
      v24[3] = &unk_26468B968;
      id v25 = v8;
      id v26 = v10;
      id v27 = v9;
      [(BCSParsingServiceConnection *)v15 parseQRCodeMetadata:v12 withReply:v24];

      uint64_t v16 = v25;
LABEL_18:

      goto LABEL_19;
    }
    if ([v11 isEqualToString:@"com.apple.AppClipCode"])
    {
      uint64_t v16 = [v12 objectForKeyedSubscript:@"RawData"];
      uint64_t v17 = [v12 objectForKeyedSubscript:@"Version"];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = [v17 integerValue];
        *(_DWORD *)buf = 134218240;
        id v29 = v8;
        __int16 v30 = 2048;
        uint64_t v31 = v18;
        _os_log_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_INFO, "BCSQRCodeParser: AVMetadataMachineReadableCodeObject %p has app clip code version %ld", buf, 0x16u);
      }
      uint64_t v19 = self->_parsingServiceConnection;
      uint64_t v20 = [v17 integerValue];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __64__BCSQRCodeParser__parseMetadataObject_reply_completionHandler___block_invoke_18;
      v21[3] = &unk_26468B990;
      id v22 = v8;
      id v23 = v9;
      [(BCSParsingServiceConnection *)v19 decodeAppClipCodeURLWithEncodedData:v16 codingVersion:v20 requiresAuthorization:0 withReply:v21];

      goto LABEL_18;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[BCSQRCodeParser _parseMetadataObject:reply:completionHandler:](v8);
      if (!v10) {
        goto LABEL_19;
      }
      goto LABEL_17;
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[BCSQRCodeParser _parseMetadataObject:reply:completionHandler:]();
    if (!v10) {
      goto LABEL_19;
    }
    goto LABEL_17;
  }
  if (v10)
  {
LABEL_17:
    uint64_t v16 = [MEMORY[0x263F087E8] errorWithDomain:@"BCSErrorDomain" code:2 userInfo:0];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v16);
    goto LABEL_18;
  }
LABEL_19:
}

void __64__BCSQRCodeParser__parseMetadataObject_reply_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = a1[4];
      int v10 = 134218240;
      uint64_t v11 = v7;
      __int16 v12 = 2048;
      uint64_t v13 = [v5 type];
      _os_log_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_INFO, "BCSQRCodeParser: AVMetadataMachineReadableCodeObject %p QR code has type %ld", (uint8_t *)&v10, 0x16u);
    }
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __64__BCSQRCodeParser__parseMetadataObject_reply_completionHandler___block_invoke_cold_1();
    }
    uint64_t v8 = a1[5];
    if (v8)
    {
      id v9 = [MEMORY[0x263F087E8] errorWithDomain:@"BCSErrorDomain" code:3 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);
    }
  }
}

void __64__BCSQRCodeParser__parseMetadataObject_reply_completionHandler___block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    if (objc_msgSend(v5, "_bcs_isWalletRemoteRequestURL") && _os_feature_enabled_impl()) {
      uint64_t v7 = [[BCSParsedURLData alloc] initWithURL:v5 type:16];
    }
    else {
      uint64_t v7 = [[BCSParsedURLData alloc] initWithURL:v5];
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __64__BCSQRCodeParser__parseMetadataObject_reply_completionHandler___block_invoke_18_cold_1();
    }
    uint64_t v7 = [[BCSInvalidParsedData alloc] initWithInvalidDataType:1 invalidContents:0];
  }
  uint64_t v8 = v7;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 134218243;
    uint64_t v11 = v9;
    __int16 v12 = 2113;
    id v13 = v5;
    _os_log_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_INFO, "BCSQRCodeParser: AVMetadataMachineReadableCodeObject %p has app clip code with url %{private}@", (uint8_t *)&v10, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BCSNotificationServiceConnection)notificationServiceConnection
{
  notificationServiceConnection = self->_notificationServiceConnection;
  if (!notificationServiceConnection)
  {
    id v4 = objc_alloc_init(BCSNotificationServiceConnection);
    id v5 = self->_notificationServiceConnection;
    self->_notificationServiceConnection = v4;

    notificationServiceConnection = self->_notificationServiceConnection;
  }
  return notificationServiceConnection;
}

- (id)_payloadForMRCObject:(id)a3
{
  id v3 = a3;
  id v4 = [v3 type];
  int v5 = [v4 isEqualToString:*MEMORY[0x263EF9F40]];

  if (v5)
  {
    id v6 = [BCSQRCodePayload alloc];
    uint64_t v7 = [v3 descriptor];
    uint64_t v8 = [(BCSQRCodePayload *)v6 initWithBarcodeDescriptor:v7];
LABEL_5:

    goto LABEL_7;
  }
  uint64_t v9 = [v3 type];
  int v10 = [v9 isEqualToString:@"com.apple.AppClipCode"];

  if (v10)
  {
    uint64_t v7 = [v3 basicDescriptor];
    uint64_t v11 = [v7 objectForKeyedSubscript:@"RawData"];
    __int16 v12 = [v7 objectForKeyedSubscript:@"Version"];
    uint64_t v8 = -[BCSAppclipCodePayload initWithData:version:]([BCSAppclipCodePayload alloc], "initWithData:version:", v11, [v12 unsignedIntegerValue]);

    goto LABEL_5;
  }
  uint64_t v8 = 0;
LABEL_7:

  return v8;
}

- (void)startQRCodeParsingSessionWithMetadataObject:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __81__BCSQRCodeParser_startQRCodeParsingSessionWithMetadataObject_completionHandler___block_invoke;
  v10[3] = &unk_26468B9B8;
  void v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(BCSQRCodeParser *)self _parseMetadataObject:v9 reply:v10 completionHandler:v8];
}

void __81__BCSQRCodeParser_startQRCodeParsingSessionWithMetadataObject_completionHandler___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __81__BCSQRCodeParser_startQRCodeParsingSessionWithMetadataObject_completionHandler___block_invoke_2;
  block[3] = &unk_26468B5E0;
  id v4 = (void *)a1[5];
  block[4] = a1[4];
  id v8 = v4;
  id v5 = v3;
  id v9 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
  uint64_t v6 = a1[6];
  if (v6) {
    (*(void (**)(uint64_t, void, void))(v6 + 16))(v6, 0, 0);
  }
}

void __81__BCSQRCodeParser_startQRCodeParsingSessionWithMetadataObject_completionHandler___block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _payloadForMRCObject:*(void *)(a1 + 40)];
  v2 = [*(id *)(a1 + 32) notificationServiceConnection];
  [v2 notifyParsedCodeWithData:*(void *)(a1 + 48) codePayload:v3 shouldReplacePreviousNotifications:1 withReply:&__block_literal_global_28];
}

void __81__BCSQRCodeParser_startQRCodeParsingSessionWithMetadataObject_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (v4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __72__BCSQRCodeParser_postNotificationAfterParsingCodeFromImage_completion___block_invoke_14_cold_1(v4);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_INFO, "BCSQRCodeParser: Finished notification successfully", v6, 2u);
  }
}

- (void)stopQRCodeParsingSession
{
  id v2 = [(BCSQRCodeParser *)self notificationServiceConnection];
  [v2 cancelNotificationsForCodeType:1];
}

- (void)setPreferredBundleIdentifier:(id)a3 forURL:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  parsingServiceConnection = self->_parsingServiceConnection;
  if (!parsingServiceConnection)
  {
    id v8 = objc_alloc_init(BCSParsingServiceConnection);
    id v9 = self->_parsingServiceConnection;
    self->_parsingServiceConnection = v8;

    parsingServiceConnection = self->_parsingServiceConnection;
  }
  [(BCSParsingServiceConnection *)parsingServiceConnection setPreferredBundleIdentifier:v10 forURL:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationServiceConnection, 0);
  objc_storeStrong((id *)&self->_parsingServiceConnection, 0);
}

void __84__BCSQRCodeParser_parseCodeFromMetadataMachineReadableCodeObject_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_223007000, &_os_log_internal, v0, "BCSQRCodeParser: AVMetadataMachineReadableCodeObject %p QR code is not actionable", v1, v2, v3, v4, v5);
}

void __56__BCSQRCodeParser_parseCodeFromImage_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_223007000, &_os_log_internal, v0, "BCSQRCodeParser: QR code from CIQRCodeFeature %p has unrecognized format", v1, v2, v3, v4, v5);
}

void __56__BCSQRCodeParser_parseCodeFromImage_completionHandler___block_invoke_11_cold_1()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_223007000, &_os_log_internal, v0, "BCSQRCodeParser: QR code from CIQRCodeFeature %p is not actionable", v1, v2, v3, v4, v5);
}

void __57__BCSQRCodeParser_parseCodeFromString_completionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __57__BCSQRCodeParser_parseCodeFromString_completionHandler___block_invoke_cold_2(void *a1)
{
  [a1 type];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_223007000, &_os_log_internal, v1, "BCSQRCodeParser: Detected QR code has type %ld", v2, v3, v4, v5, v6);
}

void __57__BCSQRCodeParser_parseCodeFromString_completionHandler___block_invoke_13_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __57__BCSQRCodeParser_parseCodeFromString_completionHandler___block_invoke_13_cold_2()
{
  objc_opt_class();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_223007000, &_os_log_internal, v0, "BCSQRCodeParser: Detected QR code has resolved to action of class %@", v1, v2, v3, v4, v5);
}

void __72__BCSQRCodeParser_postNotificationAfterParsingCodeFromImage_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __72__BCSQRCodeParser_postNotificationAfterParsingCodeFromImage_completion___block_invoke_cold_2(void *a1)
{
  [a1 type];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_223007000, &_os_log_internal, v1, "BCSQRCodeParser: QR code from image has type %ld", v2, v3, v4, v5, v6);
}

void __72__BCSQRCodeParser_postNotificationAfterParsingCodeFromImage_completion___block_invoke_14_cold_1(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "_bcs_privacyPreservingDescription");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_223007000, &_os_log_internal, v2, "BCSQRCodeParser: Finished notification with error %{public}@", v3, v4, v5, v6, v7);
}

- (void)_parseMetadataObject:reply:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_223007000, &_os_log_internal, v0, "BCSQRCodeParser: AVMetadataMachineReadableCodeObject %p has no basicDescriptor", v1, v2, v3, v4, v5);
}

- (void)_parseMetadataObject:(void *)a1 reply:completionHandler:.cold.2(void *a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = [a1 type];
  int v3 = 134218242;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_error_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_ERROR, "BCSQRCodeParser: AVMetadataMachineReadableCodeObject %p has non-QR-code type: %@", (uint8_t *)&v3, 0x16u);
}

void __64__BCSQRCodeParser__parseMetadataObject_reply_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_223007000, &_os_log_internal, v0, "BCSQRCodeParser: AVMetadataMachineReadableCodeObject %p QR code has payload with unrecognized format", v1, v2, v3, v4, v5);
}

void __64__BCSQRCodeParser__parseMetadataObject_reply_completionHandler___block_invoke_18_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_223007000, &_os_log_internal, v0, "BCSQRCodeParser: failed to decode app clip code payload with error: %{private}@", v1, v2, v3, v4, v5);
}

@end