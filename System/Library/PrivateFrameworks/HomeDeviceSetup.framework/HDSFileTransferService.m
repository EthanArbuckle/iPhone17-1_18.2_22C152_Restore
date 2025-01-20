@interface HDSFileTransferService
+ (id)appGroupIdentifier;
+ (id)productionCacheDirectory;
- (HDSFileTransferService)init;
- (OS_dispatch_queue)dispatchQueue;
- (id)fileTransferCompletionHandler;
- (id)fileTransferProgressHandler;
- (void)cleanupDiagnostics;
- (void)handleSysDropEnablementProfileRequest:(id)a3 responseHandler:(id)a4;
- (void)handleSysDropStartFileTransferRequest:(id)a3 responseHandler:(id)a4;
- (void)invalidate;
- (void)markCacheDeletable:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setFileTransferCompletionHandler:(id)a3;
- (void)setFileTransferProgressHandler:(id)a3;
- (void)writeFileToCache:(id)a3;
@end

@implementation HDSFileTransferService

+ (id)appGroupIdentifier
{
  return @"group.homedevicesetup.diagnostics";
}

+ (id)productionCacheDirectory
{
  v2 = [MEMORY[0x263F08850] defaultManager];
  v3 = +[HDSFileTransferService appGroupIdentifier];
  v4 = [v2 containerURLForSecurityApplicationGroupIdentifier:v3];
  v5 = [v4 path];

  v6 = [NSString stringWithFormat:@"%@%@", v5, @"/Library/Caches"];

  return v6;
}

- (HDSFileTransferService)init
{
  v8.receiver = self;
  v8.super_class = (Class)HDSFileTransferService;
  v2 = [(HDSFileTransferService *)&v8 init];
  if (v2)
  {
    _invalidateCalled = 0;
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.soundboard.hdsfiletransfer", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    v6 = v2;
  }

  return v2;
}

- (void)handleSysDropEnablementProfileRequest:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  if (gLogCategory_HDSFileTransfer <= 30
    && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  int v20 = 0;
  CFStringGetTypeID();
  objc_super v8 = CFDictionaryGetTypedValue();
  v9 = (void *)MEMORY[0x23ED0D3C0]();
  uint64_t v10 = objc_opt_new();
  v11 = (void *)_fileTransferSession;
  _fileTransferSession = v10;

  [(id)_fileTransferSession setTargetID:v8];
  v12 = objc_msgSend(MEMORY[0x263EFF8F8], "mb_dataFromHexadecimalString:", @"e905dc700dfc2c3f26692d20346463a2adf3c4c340d4ea661696a0ae736800ec");
  [(id)_fileTransferSession setPeerPublicKey:v12];

  objc_msgSend((id)_fileTransferSession, "setFlags:", objc_msgSend((id)_fileTransferSession, "flags") | 1);
  objc_msgSend((id)_fileTransferSession, "setFlags:", objc_msgSend((id)_fileTransferSession, "flags") | 0x40);
  objc_msgSend((id)_fileTransferSession, "setFlags:", objc_msgSend((id)_fileTransferSession, "flags") | 0x20);
  [(id)_fileTransferSession setProgressHandlerTimeInterval:1.0];
  if (gLogCategory_HDSFileTransfer <= 30
    && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
  {
    v16 = v8;
    LogPrintF();
  }
  id v19 = 0;
  char v13 = objc_msgSend((id)_fileTransferSession, "prepareTemplateAndReturnError:", &v19, v16);
  id v14 = v19;
  v15 = v14;
  if ((v13 & 1) != 0 || !v14)
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __80__HDSFileTransferService_handleSysDropEnablementProfileRequest_responseHandler___block_invoke;
    v18[3] = &unk_26503F858;
    v18[4] = self;
    [(id)_fileTransferSession setProgressHandler:v18];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __80__HDSFileTransferService_handleSysDropEnablementProfileRequest_responseHandler___block_invoke_2;
    v17[3] = &unk_26503F880;
    v17[4] = self;
    [(id)_fileTransferSession setReceivedItemHandler:v17];
    [(id)_fileTransferSession activate];
    v7[2](v7, 0);
  }
  else
  {
    if (gLogCategory_HDSFileTransfer <= 30
      && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    ((void (**)(id, void *))v7)[2](v7, v15);
  }
}

uint64_t __80__HDSFileTransferService_handleSysDropEnablementProfileRequest_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_queue_t v4 = v3;
  v15 = v3;
  if (gLogCategory_HDSFileTransfer <= 30)
  {
    if (gLogCategory_HDSFileTransfer != -1 || (v3 = (id)_LogCategory_Initialize(), dispatch_queue_t v4 = v15, v3))
    {
      uint64_t v13 = [v4 transferredByteCount];
      uint64_t v14 = [v15 totalByteCount];
      id v3 = (id)LogPrintF();
      dispatch_queue_t v4 = v15;
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (!*(void *)(v5 + 8))
  {
    id v3 = (id)[v4 type];
    if (v3 == 11)
    {
      uint64_t v6 = NSErrorF();
      uint64_t v7 = *(void *)(a1 + 32);
      objc_super v8 = *(void **)(v7 + 16);
      *(void *)(v7 + 16) = v6;

      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(v9 + 48);
      if (v10) {
        (*(void (**)(uint64_t, void, void))(v10 + 16))(v10, *(void *)(v9 + 16), 0);
      }
      objc_msgSend((id)_fileTransferSession, "invalidate", v13, v14);
      v11 = (void *)_fileTransferSession;
      _fileTransferSession = 0;

LABEL_19:
      dispatch_queue_t v4 = v15;
      goto LABEL_20;
    }
    uint64_t v5 = *(void *)(a1 + 32);
    dispatch_queue_t v4 = v15;
  }
  if (*(void *)(v5 + 40) && !*(unsigned char *)(v5 + 24) && !*(void *)(v5 + 16))
  {
    if (gLogCategory_HDSFileTransfer <= 30
      && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v3 = (id)(*(uint64_t (**)(void, void *))(*(void *)(*(void *)(a1 + 32) + 40) + 16))(*(void *)(*(void *)(a1 + 32) + 40), v15);
    goto LABEL_19;
  }
LABEL_20:
  return MEMORY[0x270F9A758](v3, v4);
}

void __80__HDSFileTransferService_handleSysDropEnablementProfileRequest_responseHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  uint64_t v6 = a3;
  if (gLogCategory_HDSFileTransfer <= 30
    && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
  {
    uint64_t v7 = [v13 itemURL];
    objc_super v8 = [v7 path];
    [v13 metadata];
    v12 = v11 = v8;
    LogPrintF();
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), a2);
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 1;
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 48);
  if (v9) {
    (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v13);
  }
  objc_msgSend((id)_fileTransferSession, "invalidate", v11, v12);
  uint64_t v10 = (void *)_fileTransferSession;
  _fileTransferSession = 0;

  v6[2](v6, 0);
}

- (void)handleSysDropStartFileTransferRequest:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  if (gLogCategory_HDSFileTransfer <= 30
    && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  int v20 = 0;
  CFStringGetTypeID();
  objc_super v8 = CFDictionaryGetTypedValue();
  uint64_t v9 = (void *)MEMORY[0x23ED0D3C0]();
  uint64_t v10 = objc_opt_new();
  v11 = (void *)_fileTransferSession;
  _fileTransferSession = v10;

  [(id)_fileTransferSession setTargetID:v8];
  v12 = objc_msgSend(MEMORY[0x263EFF8F8], "mb_dataFromHexadecimalString:", @"e905dc700dfc2c3f26692d20346463a2adf3c4c340d4ea661696a0ae736800ec");
  [(id)_fileTransferSession setPeerPublicKey:v12];

  objc_msgSend((id)_fileTransferSession, "setFlags:", objc_msgSend((id)_fileTransferSession, "flags") | 1);
  objc_msgSend((id)_fileTransferSession, "setFlags:", objc_msgSend((id)_fileTransferSession, "flags") | 0x40);
  objc_msgSend((id)_fileTransferSession, "setFlags:", objc_msgSend((id)_fileTransferSession, "flags") | 0x20);
  [(id)_fileTransferSession setProgressHandlerTimeInterval:1.0];
  if (gLogCategory_HDSFileTransfer <= 30
    && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
  {
    v16 = v8;
    LogPrintF();
  }
  id v19 = 0;
  char v13 = objc_msgSend((id)_fileTransferSession, "prepareTemplateAndReturnError:", &v19, v16);
  id v14 = v19;
  v15 = v14;
  if ((v13 & 1) != 0 || !v14)
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __80__HDSFileTransferService_handleSysDropStartFileTransferRequest_responseHandler___block_invoke;
    v18[3] = &unk_26503F858;
    v18[4] = self;
    [(id)_fileTransferSession setProgressHandler:v18];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __80__HDSFileTransferService_handleSysDropStartFileTransferRequest_responseHandler___block_invoke_2;
    v17[3] = &unk_26503F880;
    v17[4] = self;
    [(id)_fileTransferSession setReceivedItemHandler:v17];
    [(id)_fileTransferSession activate];
    v7[2](v7, 0);
  }
  else
  {
    if (gLogCategory_HDSFileTransfer <= 30
      && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    ((void (**)(id, void *))v7)[2](v7, v15);
  }
}

uint64_t __80__HDSFileTransferService_handleSysDropStartFileTransferRequest_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_queue_t v4 = v3;
  v17 = v3;
  if (gLogCategory_HDSFileTransfer > 30) {
    goto LABEL_28;
  }
  if (gLogCategory_HDSFileTransfer != -1 || (v3 = (id)_LogCategory_Initialize(), dispatch_queue_t v4 = v17, v3))
  {
    int v5 = [v4 type];
    if (v5 > 10)
    {
      switch(v5)
      {
        case 11:
          id v6 = "ControlDisconnected";
          goto LABEL_19;
        case 20:
          id v6 = "Completed";
          goto LABEL_19;
        case 30:
          id v6 = "DataTransferred";
          goto LABEL_19;
      }
    }
    else
    {
      switch(v5)
      {
        case 0:
          id v6 = "Unspecified";
          goto LABEL_19;
        case 1:
          id v6 = "SessionStart";
          goto LABEL_19;
        case 10:
          id v6 = "ControlConnected";
LABEL_19:
          uint64_t v15 = (uint64_t)v6;
          id v3 = (id)LogPrintF();
          dispatch_queue_t v4 = v17;
          goto LABEL_20;
      }
    }
    id v6 = "?";
    goto LABEL_19;
  }
LABEL_20:
  if (gLogCategory_HDSFileTransfer <= 30)
  {
    if (gLogCategory_HDSFileTransfer != -1 || (v3 = (id)_LogCategory_Initialize(), dispatch_queue_t v4 = v17, v3))
    {
      uint64_t v15 = (uint64_t)v4;
      id v3 = (id)LogPrintF();
      dispatch_queue_t v4 = v17;
    }
    if (gLogCategory_HDSFileTransfer <= 30)
    {
      if (gLogCategory_HDSFileTransfer != -1 || (v3 = (id)_LogCategory_Initialize(), dispatch_queue_t v4 = v17, v3))
      {
        uint64_t v15 = objc_msgSend(v4, "transferredByteCount", v15);
        uint64_t v16 = [v17 totalByteCount];
        id v3 = (id)LogPrintF();
        dispatch_queue_t v4 = v17;
      }
    }
  }
LABEL_28:
  uint64_t v7 = *(void *)(a1 + 32);
  if (!*(void *)(v7 + 8))
  {
    id v3 = (id)[v4 type];
    if (v3 == 11)
    {
      uint64_t v8 = NSErrorF();
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void **)(v9 + 16);
      *(void *)(v9 + 16) = v8;

      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = *(void *)(v11 + 48);
      if (v12) {
        (*(void (**)(uint64_t, void, void))(v12 + 16))(v12, *(void *)(v11 + 16), 0);
      }
      objc_msgSend((id)_fileTransferSession, "invalidate", v15, v16);
      char v13 = (void *)_fileTransferSession;
      _fileTransferSession = 0;

LABEL_42:
      dispatch_queue_t v4 = v17;
      goto LABEL_43;
    }
    uint64_t v7 = *(void *)(a1 + 32);
    dispatch_queue_t v4 = v17;
  }
  if (*(void *)(v7 + 40) && !*(unsigned char *)(v7 + 24) && !*(void *)(v7 + 16))
  {
    if (gLogCategory_HDSFileTransfer <= 30
      && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v3 = (id)(*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 40) + 16))();
    goto LABEL_42;
  }
LABEL_43:
  return MEMORY[0x270F9A758](v3, v4);
}

void __80__HDSFileTransferService_handleSysDropStartFileTransferRequest_responseHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v6 = a3;
  if (gLogCategory_HDSFileTransfer <= 30
    && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
  {
    uint64_t v7 = [v13 itemURL];
    uint64_t v8 = [v7 path];
    [v13 metadata];
    v12 = uint64_t v11 = v8;
    LogPrintF();
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), a2);
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 1;
  if (+[HDSDefaults sysDropBuildMode] == 3)
  {
    [*(id *)(a1 + 32) cleanupDiagnostics];
    [*(id *)(a1 + 32) writeFileToCache:*(void *)(*(void *)(a1 + 32) + 8)];
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 48);
  if (v9) {
    (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v13);
  }
  objc_msgSend((id)_fileTransferSession, "invalidate", v11, v12);
  uint64_t v10 = (void *)_fileTransferSession;
  _fileTransferSession = 0;

  v6[2](v6, 0);
}

- (void)cleanupDiagnostics
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v19 = [MEMORY[0x263F08850] defaultManager];
  v2 = NSURL;
  id v3 = +[HDSFileTransferService productionCacheDirectory];
  dispatch_queue_t v4 = [v2 fileURLWithPath:v3 isDirectory:1 relativeToURL:0];

  if (v4)
  {
    if (gLogCategory_HDSFileTransfer <= 30
      && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
    {
      id v14 = v4;
      LogPrintF();
    }
    id v25 = 0;
    int v5 = objc_msgSend(v19, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v4, MEMORY[0x263EFFA68], 0, &v25, v14);
    id v6 = v25;
    if (v5)
    {
      if ([v5 count])
      {
        id v16 = v6;
        v17 = v5;
        v18 = v4;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v7 = v5;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v22;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v22 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "path", v15);
              if ([v12 containsString:@"HomePod"]
                && [v12 containsString:@"sysdiagnose"]
                && [v12 containsString:@".tar.gz"])
              {
                if (gLogCategory_HDSFileTransfer <= 30
                  && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
                {
                  id v15 = v12;
                  LogPrintF();
                }
                id v20 = 0;
                objc_msgSend(v19, "removeItemAtPath:error:", v12, &v20, v15);
                id v13 = v20;
                if (v13
                  && gLogCategory_HDSFileTransfer <= 30
                  && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
                {
                  id v15 = v13;
                  LogPrintF();
                }
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
          }
          while (v9);
        }

        int v5 = v17;
        dispatch_queue_t v4 = v18;
        id v6 = v16;
      }
    }
    else if (gLogCategory_HDSFileTransfer <= 30 {
           && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
    }
    {
      LogPrintF();
    }
  }
  else if (gLogCategory_HDSFileTransfer <= 30 {
         && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (void)writeFileToCache:(id)a3
{
  dispatch_queue_t v4 = (objc_class *)MEMORY[0x263F08850];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = [v5 itemURL];

  uint64_t v8 = [v7 path];

  if (gLogCategory_HDSFileTransfer <= 30
    && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
  {
    +[HDSFileTransferService productionCacheDirectory];
    v28 = v26 = v8;
    LogPrintF();
  }
  char v31 = 0;
  uint64_t v9 = +[HDSFileTransferService productionCacheDirectory];
  int v10 = [v6 fileExistsAtPath:v9 isDirectory:&v31];

  if (v10 && v31) {
    goto LABEL_20;
  }
  if (gLogCategory_HDSFileTransfer <= 30
    && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
  {
    uint64_t v27 = +[HDSFileTransferService productionCacheDirectory];
    LogPrintF();
  }
  uint64_t v11 = +[HDSFileTransferService productionCacheDirectory];
  uint64_t v12 = [MEMORY[0x263F08850] defaultManager];
  id v30 = 0;
  char v13 = [v12 createDirectoryAtPath:v11 withIntermediateDirectories:1 attributes:0 error:&v30];
  id v14 = v30;

  if (v13)
  {
    if (gLogCategory_HDSFileTransfer <= 30
      && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
    {
      uint64_t v27 = +[HDSFileTransferService productionCacheDirectory];
      LogPrintF();
    }
LABEL_20:
    id v15 = objc_msgSend(MEMORY[0x263F08850], "defaultManager", v27);
    int v16 = [v15 isReadableFileAtPath:v8];

    if (v16)
    {
      v17 = (void *)[objc_alloc(NSURL) initFileURLWithPath:v8 isDirectory:0];
      v18 = +[HDSFileTransferService productionCacheDirectory];
      uint64_t v19 = [v8 lastPathComponent];
      id v20 = (void *)v19;
      long long v21 = &stru_26F254F18;
      if (v19) {
        long long v21 = (__CFString *)v19;
      }
      long long v22 = [v18 stringByAppendingFormat:@"/%@", v21];

      long long v23 = (void *)[objc_alloc(NSURL) initFileURLWithPath:v22 isDirectory:0];
      long long v24 = [MEMORY[0x263F08850] defaultManager];
      id v29 = 0;
      [v24 copyItemAtURL:v17 toURL:v23 error:&v29];
      id v25 = v29;

      if (v25)
      {
        if (gLogCategory_HDSFileTransfer <= 90
          && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
      }
      else
      {
        if (gLogCategory_HDSFileTransfer <= 30
          && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        [(HDSFileTransferService *)self markCacheDeletable:v22];
      }
    }
    else if (gLogCategory_HDSFileTransfer <= 90 {
           && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
    }
    {
      LogPrintF();
    }
    goto LABEL_42;
  }
  if (gLogCategory_HDSFileTransfer <= 90
    && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

LABEL_42:
}

- (void)markCacheDeletable:(id)a3
{
  uint64_t v6 = 65541;
  id v3 = a3;
  int v4 = open((const char *)[v3 UTF8String], 0);
  if (ffsctl(v4, 0xC0084A44uLL, &v6, 0))
  {
    if (gLogCategory_HDSFileTransfer <= 90
      && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      [v3 UTF8String];
      id v5 = __error();
      strerror(*v5);
      LogPrintF();
    }
  }
  else if (gLogCategory_HDSFileTransfer <= 30 {
         && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_7;
  }
  close(v4);
}

- (void)invalidate
{
  if (_fileTransferSession)
  {
    [(id)_fileTransferSession invalidate];
    v2 = (void *)_fileTransferSession;
    _fileTransferSession = 0;
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)fileTransferProgressHandler
{
  return self->_fileTransferProgressHandler;
}

- (void)setFileTransferProgressHandler:(id)a3
{
}

- (id)fileTransferCompletionHandler
{
  return self->_fileTransferCompletionHandler;
}

- (void)setFileTransferCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fileTransferCompletionHandler, 0);
  objc_storeStrong(&self->_fileTransferProgressHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_rpFileTransferError, 0);
  objc_storeStrong((id *)&self->_transferItem, 0);
}

@end