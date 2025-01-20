@interface ENExposureDetectionClientSession
- (BOOL)_runActivateStart;
- (BOOL)_runAddFile;
- (BOOL)_runFinishStart;
- (ENExposureConfiguration)configuration;
- (ENExposureDetectionClientSession)init;
- (ENExposureDetectionClientSession)initWithXPCObject:(id)a3 error:(id *)a4;
- (ENManager)manager;
- (NSArray)diagnosisKeyURLs;
- (NSProgress)progress;
- (OS_dispatch_queue)dispatchQueue;
- (id)completionHandler;
- (void)_reportError:(id)a3 where:(const char *)a4;
- (void)_run;
- (void)_runDetectionDone;
- (void)activate;
- (void)encodeWithXPCObject:(id)a3;
- (void)invalidate;
- (void)setCompletionHandler:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDiagnosisKeyURLs:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setManager:(id)a3;
- (void)setProgress:(id)a3;
@end

@implementation ENExposureDetectionClientSession

- (ENExposureDetectionClientSession)init
{
  v6.receiver = self;
  v6.super_class = (Class)ENExposureDetectionClientSession;
  v2 = [(ENExposureDetectionClientSession *)&v6 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x263EF83A0]);
    v4 = v3;
  }

  return v3;
}

- (ENExposureDetectionClientSession)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(ENExposureDetectionClientSession *)self init];
  if (!v7)
  {
    if (a4) {
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  if (MEMORY[0x2166BCD00](v6) != MEMORY[0x263EF8708])
  {
    if (a4)
    {
LABEL_12:
      ENErrorF(2);
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_13:
    v11 = 0;
    goto LABEL_8;
  }
  v8 = xpc_dictionary_get_value(v6, "expC");
  if (v8)
  {
    v9 = [[ENExposureConfiguration alloc] initWithXPCObject:v8 error:a4];
    if (!v9)
    {
      v11 = 0;
      goto LABEL_7;
    }
    configuration = v7->_configuration;
    v7->_configuration = v9;
  }
  v11 = v7;
LABEL_7:

LABEL_8:
  return v11;
}

- (void)encodeWithXPCObject:(id)a3
{
  configuration = self->_configuration;
  if (configuration)
  {
    v5 = configuration;
    id v6 = a3;
    xpc_object_t value = xpc_dictionary_create(0, 0, 0);
    [(ENExposureConfiguration *)v5 encodeWithXPCObject:value];

    xpc_dictionary_set_value(v6, "expC", value);
  }
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__ENExposureDetectionClientSession_activate__block_invoke;
  block[3] = &unk_2642446B0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __44__ENExposureDetectionClientSession_activate__block_invoke(uint64_t a1)
{
  if (gLogCategory_ENExposureDetection <= 30
    && (gLogCategory_ENExposureDetection != -1 || _LogCategory_Initialize()))
  {
    [*(id *)(*(void *)(a1 + 32) + 88) count];
    LogPrintF_safe();
  }
  v2 = *(void **)(a1 + 32);

  return [v2 _run];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__ENExposureDetectionClientSession_invalidate__block_invoke;
  block[3] = &unk_2642446B0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __46__ENExposureDetectionClientSession_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  if (gLogCategory_ENExposureDetection <= 30)
  {
    if (gLogCategory_ENExposureDetection != -1 || (result = _LogCategory_Initialize(), result)) {
      result = LogPrintF_safe();
    }
  }
  uint64_t v2 = *(void *)(v1 + 32);
  if (!*(unsigned char *)(v2 + 8)) {
    *(unsigned char *)(v2 + 8) = 1;
  }
  return result;
}

- (void)_reportError:(id)a3 where:(const char *)a4
{
  id v8 = a3;
  if (gLogCategory__ENExposureDetection <= 90
    && (gLogCategory__ENExposureDetection != -1 || _LogCategory_Initialize()))
  {
    v7 = CUPrintNSError();
    LogPrintF_safe();
  }
  self->_runState = 3;
  v5 = (void (**)(void, void, void))MEMORY[0x2166BC8A0](self->_completionHandler);
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;

  if (v5) {
    ((void (**)(void, void, id))v5)[2](v5, 0, v8);
  }
}

- (void)_run
{
  if (!self->_invalidateCalled)
  {
    while (1)
    {
      int runState = self->_runState;
      int v4 = 10;
      switch(runState)
      {
        case 0:
          goto LABEL_18;
        case 10:
          BOOL v5 = [(ENExposureDetectionClientSession *)self _runActivateStart];
          goto LABEL_12;
        case 11:
          if (self->_guardActivateDone)
          {
            int v4 = 12;
            goto LABEL_18;
          }
          int v4 = 11;
          break;
        case 12:
          goto LABEL_9;
        case 13:
          if (self->_mainFileIndex >= self->_mainFileCount)
          {
            int v4 = 15;
            goto LABEL_18;
          }
          BOOL v5 = [(ENExposureDetectionClientSession *)self _runAddFile];
LABEL_12:
          int v4 = self->_runState;
          if (v5)
          {
            ++v4;
            goto LABEL_18;
          }
          break;
        case 14:
          if (self->_guardAddFileDone)
          {
LABEL_9:
            int v4 = 13;
            goto LABEL_18;
          }
          int v4 = 14;
          break;
        case 15:
          int v4 = 16;
          goto LABEL_18;
        case 16:
          BOOL v5 = [(ENExposureDetectionClientSession *)self _runFinishStart];
          goto LABEL_12;
        case 17:
          if (self->_guardFinishDone)
          {
            int v4 = 18;
LABEL_18:
            self->_int runState = v4;
          }
          else
          {
            int v4 = 17;
          }
          break;
        case 18:
          [(ENExposureDetectionClientSession *)self _runDetectionDone];
          int v4 = 4;
          goto LABEL_18;
        default:
          return;
      }
      if (v4 == runState) {
        break;
      }
      if (gLogCategory_ENExposureDetection <= 30
        && (gLogCategory_ENExposureDetection != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
    }
  }
}

- (BOOL)_runActivateStart
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  mainFileURLs = self->_mainFileURLs;
  self->_mainFileURLs = v3;

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  BOOL v5 = self->_diagnosisKeyURLs;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v51 objects:v57 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v52 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        v11 = [v10 pathExtension];
        uint64_t v12 = [v11 caseInsensitiveCompare:@"sig"];

        if (v12) {
          [(NSMutableArray *)self->_mainFileURLs addObject:v10];
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v51 objects:v57 count:16];
    }
    while (v7);
  }

  v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  signatureURLMap = self->_signatureURLMap;
  self->_signatureURLMap = v13;

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  obuint64_t j = self->_diagnosisKeyURLs;
  uint64_t v15 = [(NSArray *)obj countByEnumeratingWithState:&v47 objects:v56 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v48;
    v41 = self;
    uint64_t v38 = *(void *)v48;
    do
    {
      uint64_t v18 = 0;
      uint64_t v39 = v16;
      do
      {
        if (*(void *)v48 != v17) {
          objc_enumerationMutation(obj);
        }
        v19 = *(void **)(*((void *)&v47 + 1) + 8 * v18);
        v20 = [v19 pathExtension];
        uint64_t v21 = [v20 caseInsensitiveCompare:@"sig"];

        if (!v21)
        {
          v22 = [v19 URLByDeletingPathExtension];
          v23 = [v22 absoluteString];

          long long v45 = 0u;
          long long v46 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          v24 = self->_mainFileURLs;
          uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v43 objects:v55 count:16];
          if (v25)
          {
            uint64_t v26 = v25;
            uint64_t v27 = *(void *)v44;
            while (2)
            {
              for (uint64_t j = 0; j != v26; ++j)
              {
                if (*(void *)v44 != v27) {
                  objc_enumerationMutation(v24);
                }
                v29 = *(void **)(*((void *)&v43 + 1) + 8 * j);
                v30 = [v29 URLByDeletingPathExtension];
                v31 = [v30 absoluteString];

                if (![v31 caseInsensitiveCompare:v23])
                {
                  [(NSMutableDictionary *)v41->_signatureURLMap setObject:v19 forKeyedSubscript:v29];

                  goto LABEL_26;
                }
              }
              uint64_t v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v43 objects:v55 count:16];
              if (v26) {
                continue;
              }
              break;
            }
          }
LABEL_26:

          self = v41;
          uint64_t v17 = v38;
          uint64_t v16 = v39;
        }
        ++v18;
      }
      while (v18 != v16);
      uint64_t v16 = [(NSArray *)obj countByEnumeratingWithState:&v47 objects:v56 count:16];
    }
    while (v16);
  }

  self->_mainFileIndex = 0;
  unint64_t v32 = [(NSMutableArray *)self->_mainFileURLs count];
  self->_unint64_t mainFileCount = v32;
  if (gLogCategory_ENExposureDetection <= 30)
  {
    unint64_t mainFileCount = v32;
    if (gLogCategory_ENExposureDetection == -1)
    {
      if (!_LogCategory_Initialize()) {
        goto LABEL_33;
      }
      unint64_t mainFileCount = self->_mainFileCount;
    }
    unint64_t v36 = mainFileCount;
    uint64_t v37 = [(NSMutableDictionary *)self->_signatureURLMap count];
    LogPrintF_safe();
  }
LABEL_33:
  self->_guardActivateDone = 0;
  manager = self->_manager;
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __53__ENExposureDetectionClientSession__runActivateStart__block_invoke;
  v42[3] = &unk_264244868;
  v42[4] = self;
  -[ENManager exposureDetectionFileActivate:completion:](manager, "exposureDetectionFileActivate:completion:", self, v42, v36, v37);
  return 1;
}

uint64_t __53__ENExposureDetectionClientSession__runActivateStart__block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = *(unsigned char **)(a1 + 32);
  if (a2) {
    return [v3 _reportError:a2 where:"Activate"];
  }
  v3[10] = 1;
  return [*(id *)(a1 + 32) _run];
}

- (BOOL)_runAddFile
{
  mainFileURLs = self->_mainFileURLs;
  ++self->_mainFileIndex;
  int v4 = -[NSMutableArray objectAtIndexedSubscript:](mainFileURLs, "objectAtIndexedSubscript:");
  BOOL v5 = [(NSMutableDictionary *)self->_signatureURLMap objectForKeyedSubscript:v4];
  if (gLogCategory_ENExposureDetection <= 30
    && (gLogCategory_ENExposureDetection != -1 || _LogCategory_Initialize()))
  {
    unint64_t mainFileIndex = self->_mainFileIndex;
    unint64_t mainFileCount = self->_mainFileCount;
    uint64_t v8 = [v4 lastPathComponent];
    [v5 lastPathComponent];
    v14 = v13 = v8;
    unint64_t v11 = mainFileIndex;
    unint64_t v12 = mainFileCount;
    LogPrintF_safe();
  }
  self->_guardAddFileDone = 0;
  manager = self->_manager;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __47__ENExposureDetectionClientSession__runAddFile__block_invoke;
  v15[3] = &unk_264244868;
  v15[4] = self;
  -[ENManager exposureDetectionFileAdd:signatureURL:completion:](manager, "exposureDetectionFileAdd:signatureURL:completion:", v4, v5, v15, v11, v12, v13, v14);

  return 1;
}

uint64_t __47__ENExposureDetectionClientSession__runAddFile__block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = *(unsigned char **)(a1 + 32);
  if (a2) {
    return [v3 _reportError:a2 where:"AddFile"];
  }
  v3[11] = 1;
  return [*(id *)(a1 + 32) _run];
}

- (BOOL)_runFinishStart
{
  self->_guardFinishDone = 0;
  manager = self->_manager;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__ENExposureDetectionClientSession__runFinishStart__block_invoke;
  v4[3] = &unk_264244890;
  v4[4] = self;
  [(ENManager *)manager exposureDetectionFileFinishWithCompletion:v4];
  return 1;
}

void __51__ENExposureDetectionClientSession__runFinishStart__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  uint64_t v6 = *(id **)(a1 + 32);
  if (a3)
  {
    [v6 _reportError:a3 where:"Finish"];
  }
  else
  {
    objc_storeStrong(v6 + 3, a2);
    *(unsigned char *)(*(void *)(a1 + 32) + 12) = 1;
    [*(id *)(a1 + 32) _run];
  }
}

- (void)_runDetectionDone
{
  uint64_t v5 = MEMORY[0x2166BC8A0](self->_completionHandler, a2);
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;

  int v4 = (void *)v5;
  if (v5)
  {
    (*(void (**)(uint64_t, ENExposureDetectionSummary *, void))(v5 + 16))(v5, self->_summary, 0);
    int v4 = (void *)v5;
  }
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (ENExposureConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (NSArray)diagnosisKeyURLs
{
  return self->_diagnosisKeyURLs;
}

- (void)setDiagnosisKeyURLs:(id)a3
{
}

- (ENManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_diagnosisKeyURLs, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_signatureURLMap, 0);
  objc_storeStrong((id *)&self->_mainFileURLs, 0);

  objc_storeStrong((id *)&self->_summary, 0);
}

@end