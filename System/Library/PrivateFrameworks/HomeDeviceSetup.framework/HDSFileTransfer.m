@interface HDSFileTransfer
+ (id)destDirectoryForTargetId:(id)a3;
+ (id)tmpRapportDir;
- (HDSFileTransfer)init;
- (OS_dispatch_queue)dispatchQueue;
- (void)_invalidate;
- (void)beginSysDropFileTransfer:(id)a3 pathToFile:(id)a4 withCompletion:(id)a5;
- (void)invalidate:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)sideloadFilesForTargetId:(id)a3 pathToDirectory:(id)a4 withCompletion:(id)a5;
- (void)waitForFilesWithTargetId:(id)a3 withCompletion:(id)a4;
@end

@implementation HDSFileTransfer

+ (id)tmpRapportDir
{
  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v3 = [v2 objectAtIndex:0];

  return v3;
}

+ (id)destDirectoryForTargetId:(id)a3
{
  v3 = NSString;
  id v4 = a3;
  v5 = +[HDSFileTransfer tmpRapportDir];
  v6 = [v3 stringWithFormat:@"%@/com.apple.rapport/FileTransfer/%@.rpftd", v5, v4];

  return v6;
}

- (HDSFileTransfer)init
{
  v8.receiver = self;
  v8.super_class = (Class)HDSFileTransfer;
  v2 = [(HDSFileTransfer *)&v8 init];
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

- (void)waitForFilesWithTargetId:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = (void *)MEMORY[0x23ED0D3C0]();
  uint64_t v9 = objc_opt_new();
  v10 = (void *)_fileTransferSession;
  _fileTransferSession = v9;

  [(id)_fileTransferSession setTargetID:v6];
  v11 = objc_msgSend(MEMORY[0x263EFF8F8], "mb_dataFromHexadecimalString:", @"e905dc700dfc2c3f26692d20346463a2adf3c4c340d4ea661696a0ae736800ec");
  [(id)_fileTransferSession setPeerPublicKey:v11];

  objc_msgSend((id)_fileTransferSession, "setFlags:", objc_msgSend((id)_fileTransferSession, "flags") | 1);
  objc_msgSend((id)_fileTransferSession, "setFlags:", objc_msgSend((id)_fileTransferSession, "flags") | 0x40);
  objc_msgSend((id)_fileTransferSession, "setFlags:", objc_msgSend((id)_fileTransferSession, "flags") | 0x20);
  if (gLogCategory_HDSFileTransfer <= 30
    && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
  {
    id v14 = v6;
    LogPrintF();
  }
  id v18 = 0;
  char v12 = objc_msgSend((id)_fileTransferSession, "prepareTemplateAndReturnError:", &v18, v14);
  id v13 = v18;
  if (v12)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __59__HDSFileTransfer_waitForFilesWithTargetId_withCompletion___block_invoke;
    v15[3] = &unk_26503F728;
    v15[4] = self;
    id v17 = v7;
    id v16 = v13;
    [(id)_fileTransferSession setProgressHandler:v15];
    [(id)_fileTransferSession setReceivedItemHandler:&__block_literal_global];
    [(id)_fileTransferSession activate];
  }
  else
  {
    (*((void (**)(id, id))v7 + 2))(v7, v13);
  }
}

void __59__HDSFileTransfer_waitForFilesWithTargetId_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (gLogCategory_HDSFileTransfer <= 30
    && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
  {
    int v4 = [v3 type];
    if (v4 > 10)
    {
      switch(v4)
      {
        case 11:
          v5 = "ControlDisconnected";
          goto LABEL_19;
        case 20:
          v5 = "Completed";
          goto LABEL_19;
        case 30:
          v5 = "DataTransferred";
          goto LABEL_19;
      }
    }
    else
    {
      switch(v4)
      {
        case 0:
          v5 = "Unspecified";
          goto LABEL_19;
        case 1:
          v5 = "SessionStart";
          goto LABEL_19;
        case 10:
          v5 = "ControlConnected";
LABEL_19:
          id v7 = v5;
          LogPrintF();
          goto LABEL_20;
      }
    }
    v5 = "?";
    goto LABEL_19;
  }
LABEL_20:
  if ((int)objc_msgSend(v3, "type", v7) >= 11)
  {
    id v6 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __59__HDSFileTransfer_waitForFilesWithTargetId_withCompletion___block_invoke_2;
    v8[3] = &unk_26503F700;
    id v10 = *(id *)(a1 + 48);
    id v9 = *(id *)(a1 + 40);
    [v6 invalidate:v8];
  }
}

uint64_t __59__HDSFileTransfer_waitForFilesWithTargetId_withCompletion___block_invoke_2(uint64_t a1)
{
  if (gLogCategory_HDSFileTransfer <= 30
    && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

void __59__HDSFileTransfer_waitForFilesWithTargetId_withCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  int v4 = a3;
  if (gLogCategory_HDSFileTransfer <= 30
    && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
  {
    v5 = [v8 itemURL];
    id v6 = [v5 path];
    id v7 = [v8 metadata];
    LogPrintF();
  }
  v4[2](v4, 0);
}

- (void)beginSysDropFileTransfer:(id)a3 pathToFile:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x23ED0D3C0]();
  uint64_t v12 = objc_opt_new();
  id v13 = (void *)_fileTransferSession;
  _fileTransferSession = v12;

  [(id)_fileTransferSession setTargetID:v8];
  id v14 = objc_msgSend(MEMORY[0x263EFF8F8], "mb_dataFromHexadecimalString:", @"4a631f38b46cc4c9a28685d7bbfab4ec1bf5611f43574dc73a3075251164ade8");
  [(id)_fileTransferSession setPeerPublicKey:v14];

  objc_msgSend((id)_fileTransferSession, "setFlags:", objc_msgSend((id)_fileTransferSession, "flags") | 0x40);
  objc_msgSend((id)_fileTransferSession, "setFlags:", objc_msgSend((id)_fileTransferSession, "flags") | 0x20);
  if (gLogCategory_HDSFileTransfer <= 30
    && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
  {
    id v27 = v9;
    LogPrintF();
  }
  id v36 = 0;
  char v15 = objc_msgSend((id)_fileTransferSession, "prepareTemplateAndReturnError:", &v36, v27);
  id v16 = v36;
  if (v15)
  {
    v29 = v11;
    [(id)_fileTransferSession setProgressHandler:&__block_literal_global_33];
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __70__HDSFileTransfer_beginSysDropFileTransfer_pathToFile_withCompletion___block_invoke_2;
    v33[3] = &unk_26503F790;
    v33[4] = self;
    id v17 = v10;
    id v35 = v17;
    id v34 = v16;
    [(id)_fileTransferSession setCompletionHandler:v33];
    id v30 = v9;
    id v18 = (void *)[objc_alloc(NSURL) initWithString:v9];
    if (gLogCategory_HDSFileTransfer <= 30
      && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
    {
      v28 = [v18 path];
      LogPrintF();
    }
    v19 = objc_msgSend(MEMORY[0x263F08850], "defaultManager", v28);
    v20 = [v18 path];
    char v21 = [v19 fileExistsAtPath:v20 isDirectory:0];

    if (v21)
    {
      v22 = objc_opt_new();
      id v23 = objc_alloc(NSURL);
      v24 = [v18 path];
      v25 = (void *)[v23 initFileURLWithPath:v24 isDirectory:0];
      [v22 setItemURL:v25];

      v26 = [v18 lastPathComponent];
      [v22 setFilename:v26];

      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __70__HDSFileTransfer_beginSysDropFileTransfer_pathToFile_withCompletion___block_invoke_4;
      v31[3] = &unk_26503F7B8;
      id v32 = v18;
      [v22 setCompletionHandler:v31];
      [(id)_fileTransferSession addItem:v22];
      [(id)_fileTransferSession activate];
    }
    else
    {
      if (gLogCategory_HDSFileTransfer <= 90
        && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v22 = NSErrorF();
      (*((void (**)(id, void *))v17 + 2))(v17, v22);
    }
    v11 = v29;
    id v9 = v30;
  }
  else
  {
    (*((void (**)(id, id))v10 + 2))(v10, v16);
  }
}

uint64_t __70__HDSFileTransfer_beginSysDropFileTransfer_pathToFile_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (gLogCategory_HDSFileTransfer <= 30)
  {
    id v5 = v2;
    if (gLogCategory_HDSFileTransfer != -1 || (v2 = (id)_LogCategory_Initialize(), id v3 = v5, v2))
    {
      [v3 type];
      id v2 = (id)LogPrintF();
      id v3 = v5;
    }
    if (gLogCategory_HDSFileTransfer <= 30)
    {
      if (gLogCategory_HDSFileTransfer != -1 || (v2 = (id)_LogCategory_Initialize(), id v3 = v5, v2))
      {
        id v2 = (id)LogPrintF();
        id v3 = v5;
      }
    }
  }
  return MEMORY[0x270F9A758](v2, v3);
}

void __70__HDSFileTransfer_beginSysDropFileTransfer_pathToFile_withCompletion___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __70__HDSFileTransfer_beginSysDropFileTransfer_pathToFile_withCompletion___block_invoke_3;
  v3[3] = &unk_26503F700;
  id v5 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  [v2 invalidate:v3];
}

uint64_t __70__HDSFileTransfer_beginSysDropFileTransfer_pathToFile_withCompletion___block_invoke_3(uint64_t a1)
{
  if (gLogCategory_HDSFileTransfer <= 30
    && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

void __70__HDSFileTransfer_beginSysDropFileTransfer_pathToFile_withCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6)
  {
    if (gLogCategory_HDSFileTransfer <= 90
      && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
    {
      id v3 = [*(id *)(a1 + 32) path];
      id v4 = v3;
      id v5 = v6;
LABEL_8:
      LogPrintF();
    }
  }
  else if (gLogCategory_HDSFileTransfer <= 30 {
         && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
  }
  {
    id v3 = [*(id *)(a1 + 32) path];
    id v4 = v3;
    goto LABEL_8;
  }
  objc_msgSend((id)_fileTransferSession, "finish", v4, v5);
}

- (void)sideloadFilesForTargetId:(id)a3 pathToDirectory:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x23ED0D3C0]();
  uint64_t v12 = objc_opt_new();
  id v13 = (void *)_fileTransferSession;
  _fileTransferSession = v12;

  [(id)_fileTransferSession setTargetID:v8];
  id v14 = objc_msgSend(MEMORY[0x263EFF8F8], "mb_dataFromHexadecimalString:", @"4a631f38b46cc4c9a28685d7bbfab4ec1bf5611f43574dc73a3075251164ade8");
  [(id)_fileTransferSession setPeerPublicKey:v14];

  objc_msgSend((id)_fileTransferSession, "setFlags:", objc_msgSend((id)_fileTransferSession, "flags") | 0x40);
  objc_msgSend((id)_fileTransferSession, "setFlags:", objc_msgSend((id)_fileTransferSession, "flags") | 0x20);
  if (gLogCategory_HDSFileTransfer <= 30
    && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
  {
    id v23 = v9;
    LogPrintF();
  }
  id v35 = 0;
  char v15 = objc_msgSend((id)_fileTransferSession, "prepareTemplateAndReturnError:", &v35, v23);
  id v16 = v35;
  if (v15)
  {
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __75__HDSFileTransfer_sideloadFilesForTargetId_pathToDirectory_withCompletion___block_invoke;
    v32[3] = &unk_26503F790;
    v32[4] = self;
    id v34 = v10;
    id v33 = v16;
    [(id)_fileTransferSession setCompletionHandler:v32];
    id v17 = [MEMORY[0x263F08850] defaultManager];
    id v18 = [v17 subpathsAtPath:v9];

    id v19 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v20 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v25 = MEMORY[0x263EF8330];
    uint64_t v26 = 3221225472;
    id v27 = __75__HDSFileTransfer_sideloadFilesForTargetId_pathToDirectory_withCompletion___block_invoke_3;
    v28 = &unk_26503F808;
    id v29 = v9;
    id v30 = v20;
    id v21 = v19;
    id v31 = v21;
    id v22 = v20;
    [v18 enumerateObjectsUsingBlock:&v25];
    if (gLogCategory_HDSFileTransfer <= 30
      && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
    {
      uint64_t v24 = [v21 count];
      LogPrintF();
    }
    objc_msgSend((id)_fileTransferSession, "addItems:", v21, v24, v25, v26, v27, v28);
    [(id)_fileTransferSession activate];
  }
  else
  {
    (*((void (**)(id, id))v10 + 2))(v10, v16);
  }
}

void __75__HDSFileTransfer_sideloadFilesForTargetId_pathToDirectory_withCompletion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __75__HDSFileTransfer_sideloadFilesForTargetId_pathToDirectory_withCompletion___block_invoke_2;
  v3[3] = &unk_26503F700;
  id v5 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  [v2 invalidate:v3];
}

uint64_t __75__HDSFileTransfer_sideloadFilesForTargetId_pathToDirectory_withCompletion___block_invoke_2(uint64_t a1)
{
  if (gLogCategory_HDSFileTransfer <= 30
    && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

void __75__HDSFileTransfer_sideloadFilesForTargetId_pathToDirectory_withCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [NSString stringWithFormat:@"%@/%@", *(void *)(a1 + 32), v3];
  unsigned __int8 v15 = 1;
  id v5 = [MEMORY[0x263F08850] defaultManager];
  int v6 = [v5 fileExistsAtPath:v4 isDirectory:&v15];
  int v7 = v15;

  if (v6) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    [*(id *)(a1 + 40) setObject:@"PENDING" forKey:v4];
    id v9 = objc_opt_new();
    id v10 = (void *)[objc_alloc(NSURL) initFileURLWithPath:v4 isDirectory:0];
    [v9 setItemURL:v10];

    [v9 setFilename:v3];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __75__HDSFileTransfer_sideloadFilesForTargetId_pathToDirectory_withCompletion___block_invoke_4;
    v12[3] = &unk_26503F7E0;
    id v13 = v4;
    id v14 = *(id *)(a1 + 40);
    [v9 setCompletionHandler:v12];
    if (gLogCategory_HDSFileTransfer <= 30
      && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
    {
      v11 = [v9 itemURL];
      LogPrintF();
    }
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v9, v11);
  }
}

void __75__HDSFileTransfer_sideloadFilesForTargetId_pathToDirectory_withCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    if (gLogCategory_HDSFileTransfer > 90) {
      goto LABEL_10;
    }
    if (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize())
    {
      uint64_t v11 = *(void *)(a1 + 32);
      id v12 = v3;
      LogPrintF();
    }
  }
  if (gLogCategory_HDSFileTransfer <= 30
    && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    LogPrintF();
  }
LABEL_10:
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", @"COMPLETED", *(void *)(a1 + 32), v11, v12);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(a1 + 40) valueForKey:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        char v10 = [v9 isEqualToString:@"PENDING"];

        if (v10)
        {

          goto LABEL_20;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  [(id)_fileTransferSession finish];
LABEL_20:
}

- (void)invalidate:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __30__HDSFileTransfer_invalidate___block_invoke;
  v7[3] = &unk_26503F830;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __30__HDSFileTransfer_invalidate___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidate];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)_invalidate
{
  if (_invalidateCalled)
  {
    if (gLogCategory_HDSFileTransfer <= 115
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
    _invalidateCalled = 1;
    [(id)_fileTransferSession invalidate];
    id v2 = (void *)_fileTransferSession;
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

- (void).cxx_destruct
{
}

@end