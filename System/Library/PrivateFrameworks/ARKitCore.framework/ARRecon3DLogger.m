@interface ARRecon3DLogger
- (ARRecon3DLogger)initWithInternalLogging:(BOOL)a3;
- (void)dealloc;
@end

@implementation ARRecon3DLogger

- (ARRecon3DLogger)initWithInternalLogging:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v38.receiver = self;
  v38.super_class = (Class)ARRecon3DLogger;
  v4 = [(ARRecon3DLogger *)&v38 init];
  if (!v4) {
    goto LABEL_23;
  }
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v37 = 0;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v31 = __43__ARRecon3DLogger_initWithInternalLogging___block_invoke;
  v32 = &unk_1E6185480;
  v33 = &v34;
  uint64_t v5 = CV3DReconLoggingHandleCreate();
  uint64_t v6 = v35[3];
  if (!v6)
  {
    v9 = (CV3DReconLoggingHandle *)v5;
    unsigned __int8 v10 = +[ARKitUserDefaults integerForKey:@"com.apple.arkit.sceneReconstruction.recon3DLoggingLevel.api"];
    char v11 = CV3DReconLoggingHandleEnable();
    v12 = _ARLogGeneral_25();
    v13 = v12;
    if (v11)
    {
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
        goto LABEL_12;
      }
      *(_DWORD *)buf = 67109120;
      LODWORD(v40) = v10;
      v14 = "Recon3D API logging level enabled: %i";
      v15 = v13;
      os_log_type_t v16 = OS_LOG_TYPE_INFO;
      uint32_t v17 = 8;
    }
    else
    {
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        goto LABEL_12;
      }
      uint64_t v18 = v35[3];
      *(_DWORD *)buf = 138412290;
      uint64_t v40 = v18;
      v14 = "Error enabling Recon3D API logging: %@";
      v15 = v13;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
      uint32_t v17 = 12;
    }
    _os_log_impl(&dword_1B88A2000, v15, v16, v14, buf, v17);
LABEL_12:

    if (!v3)
    {
LABEL_20:
      v4->_loggingHandle = v9;
      goto LABEL_21;
    }
    unsigned __int8 v19 = +[ARKitUserDefaults integerForKey:@"com.apple.arkit.sceneReconstruction.recon3DLoggingLevel.internal"];
    char v20 = CV3DReconLoggingHandleEnableInternal();
    v21 = _ARLogGeneral_25();
    v22 = v21;
    if (v20)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v40) = v19;
        v23 = "Recon3D internal logging level enabled: %i";
        v24 = v22;
        os_log_type_t v25 = OS_LOG_TYPE_INFO;
        uint32_t v26 = 8;
LABEL_18:
        _os_log_impl(&dword_1B88A2000, v24, v25, v23, buf, v26);
      }
    }
    else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = v35[3];
      *(_DWORD *)buf = 138412290;
      uint64_t v40 = v27;
      v23 = "Error enabling Recon3D internal logging: %@";
      v24 = v22;
      os_log_type_t v25 = OS_LOG_TYPE_ERROR;
      uint32_t v26 = 12;
      goto LABEL_18;
    }

    goto LABEL_20;
  }
  v7 = _ARLogGeneral_25();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = v35[3];
    *(_DWORD *)buf = 138412290;
    uint64_t v40 = v8;
    _os_log_impl(&dword_1B88A2000, v7, OS_LOG_TYPE_ERROR, "Error creating recon logging handle: %@", buf, 0xCu);
  }

LABEL_21:
  v31((uint64_t)v30);
  _Block_object_dispose(&v34, 8);
  if (!v6)
  {
LABEL_23:
    v28 = v4;
    goto LABEL_24;
  }
  v28 = 0;
LABEL_24:

  return v28;
}

void __43__ARRecon3DLogger_initWithInternalLogging___block_invoke(uint64_t a1)
{
  v1 = *(const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (v1) {
    CFRelease(v1);
  }
}

- (void)dealloc
{
  CV3DReconLoggingHandleRelease();
  v3.receiver = self;
  v3.super_class = (Class)ARRecon3DLogger;
  [(ARRecon3DLogger *)&v3 dealloc];
}

@end