@interface CLKWatchFaceLibrary
+ (BOOL)_unzipFile:(id)a3 toPath:(id)a4;
+ (CLKWatchFaceLibrary)sharedInstance;
+ (id)errorWithCode:(int64_t)a3;
- (CLKWatchFaceLibrary)init;
- (void)_addWatchFaceAtURL:(id)a3 shouldValidate:(BOOL)a4 completionHandler:(id)a5;
- (void)_importWatchFaceAtURL:(id)a3 completionHandler:(id)a4;
- (void)_validateWatchFaceAtURL:(id)a3 completionHandler:(id)a4;
- (void)addWatchFaceAtURL:(NSURL *)fileURL completionHandler:(void *)handler;
@end

@implementation CLKWatchFaceLibrary

+ (CLKWatchFaceLibrary)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__CLKWatchFaceLibrary_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_3 != -1) {
    dispatch_once(&sharedInstance_onceToken_3, block);
  }
  v2 = (void *)sharedInstance___shared;

  return (CLKWatchFaceLibrary *)v2;
}

uint64_t __37__CLKWatchFaceLibrary_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = sharedInstance___shared;
  sharedInstance___shared = (uint64_t)v1;

  return MEMORY[0x270F9A758](v1, v2);
}

- (CLKWatchFaceLibrary)init
{
  v7.receiver = self;
  v7.super_class = (Class)CLKWatchFaceLibrary;
  uint64_t v2 = [(CLKWatchFaceLibrary *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.ClockKit.CLKWatchFaceLibrary", v3);
    helperQueue = v2->_helperQueue;
    v2->_helperQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)addWatchFaceAtURL:(NSURL *)fileURL completionHandler:(void *)handler
{
  v6 = (void *)MEMORY[0x263F08AB0];
  objc_super v7 = handler;
  v8 = fileURL;
  v9 = [v6 processInfo];
  v10 = [v9 processName];
  id v11 = [v10 lowercaseString];

  -[CLKWatchFaceLibrary _addWatchFaceAtURL:shouldValidate:completionHandler:](self, "_addWatchFaceAtURL:shouldValidate:completionHandler:", v8, [v11 isEqualToString:@"mobilesms"] ^ 1, v7);
}

- (void)_addWatchFaceAtURL:(id)a3 shouldValidate:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  v10 = CLKLoggingObjectForDomain(9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v8;
    _os_log_impl(&dword_21C599000, v10, OS_LOG_TYPE_DEFAULT, "importWatchFaceAtURL: %@", buf, 0xCu);
  }

  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __75__CLKWatchFaceLibrary__addWatchFaceAtURL_shouldValidate_completionHandler___block_invoke;
  v24[3] = &unk_26440DAF0;
  id v11 = v9;
  id v25 = v11;
  v12 = (void (**)(void, void))MEMORY[0x21D4AACC0](v24);
  if ([v8 isFileURL])
  {
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __75__CLKWatchFaceLibrary__addWatchFaceAtURL_shouldValidate_completionHandler___block_invoke_3;
    v21[3] = &unk_26440EE00;
    v21[4] = self;
    id v13 = v8;
    id v22 = v13;
    v14 = v12;
    id v23 = v14;
    uint64_t v15 = MEMORY[0x21D4AACC0](v21);
    v16 = (void *)v15;
    if (v6)
    {
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __75__CLKWatchFaceLibrary__addWatchFaceAtURL_shouldValidate_completionHandler___block_invoke_4;
      v18[3] = &unk_26440F138;
      v19 = v14;
      id v20 = v16;
      [(CLKWatchFaceLibrary *)self _validateWatchFaceAtURL:v13 completionHandler:v18];
    }
    else
    {
      (*(void (**)(uint64_t))(v15 + 16))(v15);
    }
  }
  else
  {
    v17 = +[CLKWatchFaceLibrary errorWithCode:1];
    ((void (**)(void, void *))v12)[2](v12, v17);
  }
}

void __75__CLKWatchFaceLibrary__addWatchFaceAtURL_shouldValidate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __75__CLKWatchFaceLibrary__addWatchFaceAtURL_shouldValidate_completionHandler___block_invoke_2;
  v6[3] = &unk_26440EE78;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __75__CLKWatchFaceLibrary__addWatchFaceAtURL_shouldValidate_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __75__CLKWatchFaceLibrary__addWatchFaceAtURL_shouldValidate_completionHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _importWatchFaceAtURL:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

uint64_t __75__CLKWatchFaceLibrary__addWatchFaceAtURL_shouldValidate_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

+ (id)errorWithCode:(int64_t)a3
{
  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  if ((unint64_t)(a3 - 1) > 3) {
    id v5 = @"IMPORT_FACE_ERROR_UNKNOWN";
  }
  else {
    id v5 = off_26440F158[a3 - 1];
  }
  uint64_t v6 = CLKGreenfieldLocalizedString(v5);
  if (v6) {
    id v5 = (__CFString *)v6;
  }
  [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x263F08320]];
  id v7 = [MEMORY[0x263F087E8] errorWithDomain:@"CLKWatchFaceLibraryErrorDomain" code:a3 userInfo:v4];

  return v7;
}

- (void)_validateWatchFaceAtURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  helperQueue = self->_helperQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __65__CLKWatchFaceLibrary__validateWatchFaceAtURL_completionHandler___block_invoke;
  v11[3] = &unk_26440EF18;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(helperQueue, v11);
}

void __65__CLKWatchFaceLibrary__validateWatchFaceAtURL_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F08C38] UUID];
  id v3 = [v2 UUIDString];

  id v4 = NSTemporaryDirectory();
  id v5 = [v4 stringByAppendingPathComponent:v3];

  id v6 = [NSURL fileURLWithPath:v5];
  if (+[CLKWatchFaceLibrary _unzipFile:*(void *)(a1 + 32) toPath:v6])
  {
    id v7 = [v5 stringByAppendingPathComponent:@"face.json"];
    id v38 = 0;
    id v8 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v7 options:0 error:&v38];
    id v9 = v38;
    if (v9)
    {
      id v10 = v9;
      id v11 = CLKLoggingObjectForDomain(9);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __65__CLKWatchFaceLibrary__validateWatchFaceAtURL_completionHandler___block_invoke_cold_4();
      }

      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __65__CLKWatchFaceLibrary__validateWatchFaceAtURL_completionHandler___block_invoke_38;
      block[3] = &unk_26440ED60;
      id v37 = *(id *)(a1 + 40);
      dispatch_async(MEMORY[0x263EF83A0], block);
      id v12 = v37;
    }
    else
    {
      id v35 = 0;
      id v12 = [MEMORY[0x263F08900] JSONObjectWithData:v8 options:0 error:&v35];
      id v10 = v35;
      if (v10)
      {
        id v20 = CLKLoggingObjectForDomain(9);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          __65__CLKWatchFaceLibrary__validateWatchFaceAtURL_completionHandler___block_invoke_cold_3();
        }

        v33[0] = MEMORY[0x263EF8330];
        v33[1] = 3221225472;
        v33[2] = __65__CLKWatchFaceLibrary__validateWatchFaceAtURL_completionHandler___block_invoke_40;
        v33[3] = &unk_26440ED60;
        id v34 = *(id *)(a1 + 40);
        dispatch_async(MEMORY[0x263EF83A0], v33);
        v21 = v34;
      }
      else
      {
        v21 = [v12 objectForKeyedSubscript:@"face type"];
        if (v21 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v22 = [v12 objectForKeyedSubscript:@"bundle id"];
          if (v22 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            v26 = CLKLoggingObjectForDomain(9);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
              __65__CLKWatchFaceLibrary__validateWatchFaceAtURL_completionHandler___block_invoke_cold_1();
            }

            v29[0] = MEMORY[0x263EF8330];
            v29[1] = 3221225472;
            v29[2] = __65__CLKWatchFaceLibrary__validateWatchFaceAtURL_completionHandler___block_invoke_43;
            v29[3] = &unk_26440ED60;
            id v25 = &v30;
            id v30 = *(id *)(a1 + 40);
            dispatch_async(MEMORY[0x263EF83A0], v29);
          }
          else
          {
            v24 = +[CLKWatchFaceLibraryServer sharedInstance];
            v27[0] = MEMORY[0x263EF8330];
            v27[1] = 3221225472;
            v27[2] = __65__CLKWatchFaceLibrary__validateWatchFaceAtURL_completionHandler___block_invoke_2;
            v27[3] = &unk_26440DAF0;
            id v25 = &v28;
            id v28 = *(id *)(a1 + 40);
            [v24 validateFaceType:v21 faceBundleId:v22 completionHandler:v27];
          }
        }
        else
        {
          id v23 = CLKLoggingObjectForDomain(9);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            __65__CLKWatchFaceLibrary__validateWatchFaceAtURL_completionHandler___block_invoke_cold_1();
          }

          v31[0] = MEMORY[0x263EF8330];
          v31[1] = 3221225472;
          v31[2] = __65__CLKWatchFaceLibrary__validateWatchFaceAtURL_completionHandler___block_invoke_42;
          v31[3] = &unk_26440ED60;
          id v32 = *(id *)(a1 + 40);
          dispatch_async(MEMORY[0x263EF83A0], v31);
          id v22 = v32;
        }
      }
    }
  }
  else
  {
    id v13 = CLKLoggingObjectForDomain(9);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __65__CLKWatchFaceLibrary__validateWatchFaceAtURL_completionHandler___block_invoke_cold_5(a1 + 32, v13, v14, v15, v16, v17, v18, v19);
    }

    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __65__CLKWatchFaceLibrary__validateWatchFaceAtURL_completionHandler___block_invoke_36;
    v39[3] = &unk_26440ED60;
    id v40 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x263EF83A0], v39);
    id v10 = v40;
  }
}

void __65__CLKWatchFaceLibrary__validateWatchFaceAtURL_completionHandler___block_invoke_36(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[CLKWatchFaceLibrary errorWithCode:2];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __65__CLKWatchFaceLibrary__validateWatchFaceAtURL_completionHandler___block_invoke_38(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[CLKWatchFaceLibrary errorWithCode:2];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __65__CLKWatchFaceLibrary__validateWatchFaceAtURL_completionHandler___block_invoke_40(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[CLKWatchFaceLibrary errorWithCode:2];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __65__CLKWatchFaceLibrary__validateWatchFaceAtURL_completionHandler___block_invoke_42(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[CLKWatchFaceLibrary errorWithCode:2];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __65__CLKWatchFaceLibrary__validateWatchFaceAtURL_completionHandler___block_invoke_43(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[CLKWatchFaceLibrary errorWithCode:2];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __65__CLKWatchFaceLibrary__validateWatchFaceAtURL_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __65__CLKWatchFaceLibrary__validateWatchFaceAtURL_completionHandler___block_invoke_3;
  v5[3] = &unk_26440EF18;
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

void __65__CLKWatchFaceLibrary__validateWatchFaceAtURL_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32))
  {
    id v4 = +[CLKWatchFaceLibrary errorWithCode:4];
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v4);
  }
  else
  {
    id v2 = *(void (**)(uint64_t, void))(v1 + 16);
    uint64_t v3 = *(void *)(a1 + 40);
    v2(v3, 0);
  }
}

+ (BOOL)_unzipFile:(id)a3 toPath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  archive_read_new();
  archive_read_support_format_zip();
  archive_read_support_filter_gzip();
  id v7 = v5;
  [v7 fileSystemRepresentation];
  if (archive_read_open_filename())
  {
    id v8 = CLKLoggingObjectForDomain(9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[CLKWatchFaceLibrary _unzipFile:toPath:](v7, v8);
    }

    BOOL v9 = 0;
  }
  else
  {
    while (1)
    {
      int next_header = archive_read_next_header();
      if (next_header) {
        break;
      }
      id v11 = [NSString stringWithUTF8String:archive_entry_pathname()];
      id v12 = [v6 path];
      id v13 = [v12 stringByAppendingPathComponent:v11];

      id v14 = v13;
      [v14 UTF8String];
      archive_entry_set_pathname();
      if (archive_read_extract())
      {
        uint64_t v15 = CLKLoggingObjectForDomain(9);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          +[CLKWatchFaceLibrary _unzipFile:toPath:]((uint64_t)v11, v15, v16, v17, v18, v19, v20, v21);
        }

        goto LABEL_15;
      }
    }
    if (next_header == 1)
    {
      BOOL v9 = 1;
      goto LABEL_16;
    }
    id v11 = CLKLoggingObjectForDomain(9);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[CLKWatchFaceLibrary _unzipFile:toPath:](v11);
    }
LABEL_15:

    BOOL v9 = 0;
LABEL_16:
    archive_read_free();
  }

  return v9;
}

- (void)_importWatchFaceAtURL:(id)a3 completionHandler:(id)a4
{
  id v18 = 0;
  id v5 = (void (**)(id, id))a4;
  id v6 = [a3 bookmarkDataWithOptions:0 includingResourceValuesForKeys:0 relativeToURL:0 error:&v18];
  id v7 = v18;
  if (v7)
  {
    id v8 = CLKLoggingObjectForDomain(9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CLKWatchFaceLibrary _importWatchFaceAtURL:completionHandler:]((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
    }

    v5[2](v5, v7);
  }
  else
  {
    uint64_t v15 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v16 = [v15 bundleIdentifier];

    uint64_t v17 = +[CLKWatchFaceLibraryServer sharedInstance];
    [v17 openWatchFaceURLWithBookmarkData:v6 sourceApplicationBundleIdentifier:v16 completionHandler:v5];

    id v5 = (void (**)(id, id))v16;
  }
}

- (void).cxx_destruct
{
}

void __65__CLKWatchFaceLibrary__validateWatchFaceAtURL_completionHandler___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_1(&dword_21C599000, v0, v1, "Failed to decode face.json: %@ %@", v2);
}

void __65__CLKWatchFaceLibrary__validateWatchFaceAtURL_completionHandler___block_invoke_cold_3()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_3_1(&dword_21C599000, v0, (uint64_t)v0, "Failed to decode face.json: %@ %@", v1);
}

void __65__CLKWatchFaceLibrary__validateWatchFaceAtURL_completionHandler___block_invoke_cold_4()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_3_1(&dword_21C599000, v0, (uint64_t)v0, "Failed to load face.json file: %@ %@", v1);
}

void __65__CLKWatchFaceLibrary__validateWatchFaceAtURL_completionHandler___block_invoke_cold_5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_unzipFile:(os_log_t)log toPath:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21C599000, log, OS_LOG_TYPE_ERROR, "Decompression failed. Bad header.", v1, 2u);
}

+ (void)_unzipFile:(uint64_t)a3 toPath:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_unzipFile:(void *)a1 toPath:(NSObject *)a2 .cold.3(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 136315138;
  uint64_t v4 = [a1 fileSystemRepresentation];
  _os_log_error_impl(&dword_21C599000, a2, OS_LOG_TYPE_ERROR, "Decompression failed. Could not open source: %s", (uint8_t *)&v3, 0xCu);
}

- (void)_importWatchFaceAtURL:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end