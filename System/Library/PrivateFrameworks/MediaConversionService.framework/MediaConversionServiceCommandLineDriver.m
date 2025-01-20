@interface MediaConversionServiceCommandLineDriver
+ (BOOL)outputJSONDataForConversionOutputInformation:(id)a3;
+ (const)optstring;
+ (id)replacementObjectForObject:(id)a3 valueConversionHandler:(id)a4;
+ (id)usage;
+ (id)usagesummary;
+ (option)longopts;
+ (void)_output:(uint64_t)a3 arguments:(FILE *)a4 file:;
+ (void)output:(id)a3;
+ (void)outputConversionError:(id)a3 status:(int64_t)a4;
+ (void)outputError:(id)a3;
- (BOOL)hasConversionOfType:(id)a3;
- (BOOL)launchServiceAtStart;
- (BOOL)pauseAfterLaunchingService;
- (BOOL)pauseAtStart;
- (BOOL)processOption:(int)a3 arg:(id)a4;
- (BOOL)replaceExistingOutput;
- (BOOL)showProgress;
- (BOOL)verbose;
- (BOOL)waitForSignalAfterCompletion;
- (MediaConversionServiceCommandLineDriver)init;
- (NSMutableArray)conversionOptionSets;
- (NSProgress)conversionProgress;
- (PAImageConversionServiceClient)imageConversionServiceClient;
- (PAVideoConversionServiceClient)videoConversionServiceClient;
- (int)run;
- (int)runImageConversionWithConversionOptionSet:(id)a3;
- (int)runVideoConversionWithConversionOptionSet:(id)a3;
- (int)runVideoStillExtractionConversionWithConversionOptionSet:(id)a3;
- (int)validateAndProcessArgumentValues;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)sendMessageToLaunchService;
- (void)setConversionOptionSets:(id)a3;
- (void)setConversionProgress:(id)a3;
- (void)setImageConversionServiceClient:(id)a3;
- (void)setLaunchServiceAtStart:(BOOL)a3;
- (void)setPauseAfterLaunchingService:(BOOL)a3;
- (void)setPauseAtStart:(BOOL)a3;
- (void)setReplaceExistingOutput:(BOOL)a3;
- (void)setShowProgress:(BOOL)a3;
- (void)setVerbose:(BOOL)a3;
- (void)setVideoConversionServiceClient:(id)a3;
- (void)setWaitForSignalAfterCompletion:(BOOL)a3;
- (void)waitForSigInt;
@end

@implementation MediaConversionServiceCommandLineDriver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoConversionServiceClient, 0);
  objc_storeStrong((id *)&self->_imageConversionServiceClient, 0);
  objc_storeStrong((id *)&self->_conversionProgress, 0);
  objc_storeStrong((id *)&self->_conversionOptionSets, 0);
}

- (void)setVideoConversionServiceClient:(id)a3
{
}

- (PAVideoConversionServiceClient)videoConversionServiceClient
{
  return (PAVideoConversionServiceClient *)objc_getProperty(self, a2, 40, 1);
}

- (void)setImageConversionServiceClient:(id)a3
{
}

- (PAImageConversionServiceClient)imageConversionServiceClient
{
  return (PAImageConversionServiceClient *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPauseAfterLaunchingService:(BOOL)a3
{
  self->_pauseAfterLaunchingService = a3;
}

- (BOOL)pauseAfterLaunchingService
{
  return self->_pauseAfterLaunchingService;
}

- (void)setLaunchServiceAtStart:(BOOL)a3
{
  self->_launchServiceAtStart = a3;
}

- (BOOL)launchServiceAtStart
{
  return self->_launchServiceAtStart;
}

- (void)setPauseAtStart:(BOOL)a3
{
  self->_pauseAtStart = a3;
}

- (BOOL)pauseAtStart
{
  return self->_pauseAtStart;
}

- (void)setWaitForSignalAfterCompletion:(BOOL)a3
{
  self->_waitForSignalAfterCompletion = a3;
}

- (BOOL)waitForSignalAfterCompletion
{
  return self->_waitForSignalAfterCompletion;
}

- (void)setReplaceExistingOutput:(BOOL)a3
{
  self->_replaceExistingOutput = a3;
}

- (BOOL)replaceExistingOutput
{
  return self->_replaceExistingOutput;
}

- (void)setShowProgress:(BOOL)a3
{
  self->_showProgress = a3;
}

- (BOOL)showProgress
{
  return self->_showProgress;
}

- (void)setVerbose:(BOOL)a3
{
  self->_verbose = a3;
}

- (BOOL)verbose
{
  return self->_verbose;
}

- (void)setConversionProgress:(id)a3
{
}

- (NSProgress)conversionProgress
{
  return (NSProgress *)objc_getProperty(self, a2, 24, 1);
}

- (void)setConversionOptionSets:(id)a3
{
}

- (NSMutableArray)conversionOptionSets
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)waitForSigInt
{
  v4 = signal(2, (void (__cdecl *)(int))1);
  if (v4 == (void (__cdecl *)(int))-1)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v10 = __error();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MediaConversionServiceCommandLineDriver.m", 987, @"Unable to wait for SIGINT: %s\n", strerror(*v10));
  }
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v6 = dispatch_get_global_queue(0, 0);
  v7 = dispatch_source_create(MEMORY[0x1E4F14480], 2uLL, 0, v6);

  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __56__MediaConversionServiceCommandLineDriver_waitForSigInt__block_invoke;
  handler[3] = &unk_1E6CFEE00;
  dispatch_semaphore_t v12 = v5;
  v8 = v5;
  dispatch_source_set_event_handler(v7, handler);
  dispatch_activate(v7);
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_source_cancel(v7);
  signal(2, v4);
}

intptr_t __56__MediaConversionServiceCommandLineDriver_waitForSigInt__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (int)validateAndProcessArgumentValues
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = self->_conversionOptionSets;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_msgSend(v8, "setReplaceExistingOutput:", self->_replaceExistingOutput, (void)v12);
        [v8 setVerbose:self->_verbose];
        int v9 = [v8 validateAndProcess];
        if (v9)
        {
          int v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  int v10 = 0;
LABEL_11:

  return v10;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v13 = a3;
  int v9 = (NSProgress *)a4;
  id v10 = a5;
  if (self->_showProgress && self->_conversionProgress == v9)
  {
    v11 = objc_opt_class();
    [(NSProgress *)self->_conversionProgress fractionCompleted];
    objc_msgSend(v11, "outputError:", @"Progress: %f\n", v12);
  }
}

- (int)runVideoStillExtractionConversionWithConversionOptionSet:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = (void *)MEMORY[0x1E4F1CB10];
  v7 = [v4 sourcePath];
  v8 = [v6 fileURLWithPath:v7];

  int v9 = (void *)MEMORY[0x1E4F1CB10];
  id v10 = [v4 destinationPath];
  v11 = [v9 fileURLWithPath:v10];

  uint64_t v12 = [MEMORY[0x1E4F1C9B8] data];
  id v29 = 0;
  char v13 = [v12 writeToURL:v11 options:1 error:&v29];
  id v14 = v29;

  if (v13)
  {
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x2020000000;
    int v28 = 70;
    dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
    v16 = [v4 conversionOptions];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __100__MediaConversionServiceCommandLineDriver_runVideoStillExtractionConversionWithConversionOptionSet___block_invoke;
    v22[3] = &unk_1E6CFEDD8;
    v22[4] = self;
    v24 = &v25;
    uint64_t v17 = v15;
    v23 = v17;
    [v5 extractStillImageFromVideoAtSourceURL:v8 toDestinationURL:v11 options:v16 completionHandler:v22];

    dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
    int v18 = *((_DWORD *)v26 + 6);

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    v19 = objc_opt_class();
    v20 = [v4 destinationPath];
    [v19 outputError:@"Unable to create output file '%@': %@\n", v20, v14];

    int v18 = 73;
  }

  return v18;
}

void __100__MediaConversionServiceCommandLineDriver_runVideoStillExtractionConversionWithConversionOptionSet___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v10 = a3;
  id v7 = a4;
  if (a2 == 1)
  {
    if (*(unsigned char *)(*(void *)(a1 + 32) + 8)) {
      [(id)objc_opt_class() output:@"Raw output information: %@\n", v10];
    }
    if ([(id)objc_opt_class() outputJSONDataForConversionOutputInformation:v10]) {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    }
  }
  else
  {
    [(id)objc_opt_class() outputConversionError:v7 status:a2];
  }
  [*(id *)(*(void *)(a1 + 32) + 24) removeObserver:*(void *)(a1 + 32) forKeyPath:@"fractionCompleted"];
  uint64_t v8 = *(void *)(a1 + 32);
  int v9 = *(void **)(v8 + 24);
  *(void *)(v8 + 24) = 0;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (int)runVideoConversionWithConversionOptionSet:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v6 = [v4 sourcePath];
  id v7 = [v5 fileURLWithPath:v6];

  uint64_t v8 = (void *)MEMORY[0x1E4F1CB10];
  int v9 = [v4 destinationPath];
  id v10 = [v8 fileURLWithPath:v9];

  v11 = [MEMORY[0x1E4F1C9B8] data];
  id v35 = 0;
  char v12 = [v11 writeToURL:v10 options:1 error:&v35];
  id v13 = v35;

  if (v12)
  {
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2020000000;
    int v34 = 70;
    dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
    videoConversionServiceClient = self->_videoConversionServiceClient;
    v16 = [v4 conversionOptions];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __85__MediaConversionServiceCommandLineDriver_runVideoConversionWithConversionOptionSet___block_invoke;
    v28[3] = &unk_1E6CFEDD8;
    v28[4] = self;
    v30 = &v31;
    uint64_t v17 = v14;
    id v29 = v17;
    int v18 = [(PAVideoConversionServiceClient *)videoConversionServiceClient convertVideoAtSourceURL:v7 toDestinationURL:v10 options:v16 completionHandler:v28];
    conversionProgress = self->_conversionProgress;
    self->_conversionProgress = v18;

    v20 = signal(2, (void (__cdecl *)(int))1);
    if (v20 == (void (__cdecl *)(int))-1)
    {
      v22 = 0;
    }
    else
    {
      v21 = dispatch_get_global_queue(0, 0);
      v22 = dispatch_source_create(MEMORY[0x1E4F14480], 2uLL, 0, v21);

      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __85__MediaConversionServiceCommandLineDriver_runVideoConversionWithConversionOptionSet___block_invoke_2;
      handler[3] = &unk_1E6CFEE00;
      void handler[4] = self;
      dispatch_source_set_event_handler(v22, handler);
      dispatch_activate(v22);
    }
    [(NSProgress *)self->_conversionProgress addObserver:self forKeyPath:@"fractionCompleted" options:0 context:0];
    dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
    if (v20 != (void (__cdecl *)(int))-1)
    {
      dispatch_source_cancel(v22);
      signal(2, v20);
    }
    int v25 = *((_DWORD *)v32 + 6);

    _Block_object_dispose(&v31, 8);
  }
  else
  {
    v23 = objc_opt_class();
    v24 = [v4 destinationPath];
    [v23 outputError:@"Unable to create output file '%@': %@\n", v24, v13];

    int v25 = 73;
  }

  return v25;
}

void __85__MediaConversionServiceCommandLineDriver_runVideoConversionWithConversionOptionSet___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v10 = a3;
  id v7 = a4;
  if (a2 == 1)
  {
    if (*(unsigned char *)(*(void *)(a1 + 32) + 8)) {
      [(id)objc_opt_class() output:@"Raw output information: %@\n", v10];
    }
    if ([(id)objc_opt_class() outputJSONDataForConversionOutputInformation:v10]) {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    }
  }
  else
  {
    [(id)objc_opt_class() outputConversionError:v7 status:a2];
  }
  [*(id *)(*(void *)(a1 + 32) + 24) removeObserver:*(void *)(a1 + 32) forKeyPath:@"fractionCompleted"];
  uint64_t v8 = *(void *)(a1 + 32);
  int v9 = *(void **)(v8 + 24);
  *(void *)(v8 + 24) = 0;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t __85__MediaConversionServiceCommandLineDriver_runVideoConversionWithConversionOptionSet___block_invoke_2(uint64_t a1)
{
  [(id)objc_opt_class() outputError:@"Received SIGINT, cancelling conversion\n"];
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  return [v2 cancel];
}

- (int)runImageConversionWithConversionOptionSet:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v6 = [v4 sourcePath];
  id v7 = [v5 fileURLWithPath:v6];

  uint64_t v8 = +[PAMediaConversionServiceResourceURLCollection collectionWithMainResourceURL:v7];
  int v9 = [v4 sourcePathVideoComplement];

  if (v9)
  {
    id v10 = (void *)MEMORY[0x1E4F1CB10];
    v11 = [v4 sourcePathVideoComplement];
    char v12 = [v10 fileURLWithPath:v11];

    [v8 setResourceURL:v12 forRole:@"PAMediaConversionResourceRoleVideoComplement"];
  }
  id v13 = (void *)MEMORY[0x1E4F1CB10];
  dispatch_semaphore_t v14 = [v4 destinationPath];
  dispatch_semaphore_t v15 = [v13 fileURLWithPath:v14];

  v16 = +[PAMediaConversionServiceResourceURLCollection collectionWithMainResourceURL:v15];
  uint64_t v17 = [v4 destinationPathVideoComplement];

  if (v17)
  {
    int v18 = (void *)MEMORY[0x1E4F1CB10];
    v19 = [v4 destinationPathVideoComplement];
    v20 = [v18 fileURLWithPath:v19];

    [v16 setResourceURL:v20 forRole:@"PAMediaConversionResourceRoleVideoComplement"];
  }
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  int v32 = 0;
  dispatch_semaphore_t v21 = dispatch_semaphore_create(0);
  imageConversionServiceClient = self->_imageConversionServiceClient;
  v23 = [v4 conversionOptions];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __85__MediaConversionServiceCommandLineDriver_runImageConversionWithConversionOptionSet___block_invoke;
  v26[3] = &unk_1E6CFEDD8;
  v26[4] = self;
  int v28 = &v29;
  v24 = v21;
  uint64_t v27 = v24;
  [(PAImageConversionServiceClient *)imageConversionServiceClient convertImageAtSourceURLCollection:v8 toDestinationURLCollection:v16 options:v23 completionHandler:v26];

  dispatch_semaphore_wait(v24, 0xFFFFFFFFFFFFFFFFLL);
  LODWORD(v23) = *((_DWORD *)v30 + 6);

  _Block_object_dispose(&v29, 8);
  return (int)v23;
}

void __85__MediaConversionServiceCommandLineDriver_runImageConversionWithConversionOptionSet___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v12 = a3;
  id v7 = a4;
  if (a2 != 1)
  {
    [(id)objc_opt_class() outputConversionError:v7 status:a2];
    int v11 = 70;
LABEL_10:
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v11;
    goto LABEL_11;
  }
  uint64_t v8 = [v12 objectForKeyedSubscript:@"PAMediaConversionServiceResultDataKey"];

  if (v8)
  {
    int v9 = (void *)[v12 mutableCopy];
    [v9 setObject:@"(NSData removed)" forKeyedSubscript:@"PAMediaConversionServiceResultDataKey"];

    id v10 = v9;
  }
  else
  {
    id v10 = v12;
  }
  id v12 = v10;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 8)) {
    [(id)objc_opt_class() output:@"Raw output information: %@\n", v10];
  }
  if ([(id)objc_opt_class() outputJSONDataForConversionOutputInformation:v12])
  {
    int v11 = 0;
    goto LABEL_10;
  }
LABEL_11:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)sendMessageToLaunchService
{
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  int v18 = 0;
  if ([(MediaConversionServiceCommandLineDriver *)self hasConversionOfType:@"image"])
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    imageConversionServiceClient = self->_imageConversionServiceClient;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __69__MediaConversionServiceCommandLineDriver_sendMessageToLaunchService__block_invoke;
    v12[3] = &unk_1E6CFEDA0;
    dispatch_semaphore_t v14 = &v15;
    v12[4] = self;
    uint64_t v5 = v3;
    id v13 = v5;
    [(PAImageConversionServiceClient *)imageConversionServiceClient requestStatusWithCompletionHandler:v12];
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  }
  if ([(MediaConversionServiceCommandLineDriver *)self hasConversionOfType:@"video"]
    || [(MediaConversionServiceCommandLineDriver *)self hasConversionOfType:@"still"])
  {
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    videoConversionServiceClient = self->_videoConversionServiceClient;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __69__MediaConversionServiceCommandLineDriver_sendMessageToLaunchService__block_invoke_2;
    v9[3] = &unk_1E6CFEDA0;
    int v11 = &v15;
    v9[4] = self;
    uint64_t v8 = v6;
    id v10 = v8;
    [(PAVideoConversionServiceClient *)videoConversionServiceClient requestStatusWithCompletionHandler:v9];
    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  }
  if (*((_DWORD *)v16 + 6) && self->_pauseAfterLaunchingService)
  {
    printf("Service process identifier %d - press return to continue\n", *((_DWORD *)v16 + 6));
    getchar();
  }
  _Block_object_dispose(&v15, 8);
}

void __69__MediaConversionServiceCommandLineDriver_sendMessageToLaunchService__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    uint64_t v5 = [a2 objectForKeyedSubscript:@"PAMediaConversionServiceProcessIdentifierKey"];
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v5 intValue];
  }
  else
  {
    [(id)objc_opt_class() outputError:@"Unable to get image conversion service status: %@\n", v6];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __69__MediaConversionServiceCommandLineDriver_sendMessageToLaunchService__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    uint64_t v5 = [a2 objectForKeyedSubscript:@"PAMediaConversionServiceProcessIdentifierKey"];
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v5 intValue];
  }
  else
  {
    [(id)objc_opt_class() outputError:@"Unable to get video conversion service status: %@\n", v6];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (int)run
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v3 = [(MediaConversionServiceCommandLineDriver *)self validateAndProcessArgumentValues];
  if (!v3)
  {
    if (self->_pauseAtStart)
    {
      pid_t v4 = getpid();
      printf("Client process identifier %d - press return to continue\n", v4);
      getchar();
    }
    if (self->_launchServiceAtStart) {
      [(MediaConversionServiceCommandLineDriver *)self sendMessageToLaunchService];
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    obuint64_t j = self->_conversionOptionSets;
    uint64_t v13 = [(NSMutableArray *)obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v16;
      int v3 = 70;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v16 != v14) {
            objc_enumerationMutation(obj);
          }
          id v6 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if ([v6 repeatCount] >= 1)
          {
            for (uint64_t j = 0; j < [v6 repeatCount]; ++j)
            {
              uint64_t v8 = (void *)MEMORY[0x1E01C1E00]();
              int v9 = [v6 conversionType];
              if ([v9 isEqualToString:@"image"])
              {
                int v10 = [(MediaConversionServiceCommandLineDriver *)self runImageConversionWithConversionOptionSet:v6];
              }
              else if ([v9 isEqualToString:@"video"])
              {
                int v10 = [(MediaConversionServiceCommandLineDriver *)self runVideoConversionWithConversionOptionSet:v6];
              }
              else
              {
                if (![v9 isEqualToString:@"still"])
                {
                  [(id)objc_opt_class() outputError:@"Conversion type %@ is unsupported\n", v9];

                  return 70;
                }
                int v10 = [(MediaConversionServiceCommandLineDriver *)self runVideoStillExtractionConversionWithConversionOptionSet:v6];
              }
              int v3 = v10;
            }
          }
        }
        uint64_t v13 = [(NSMutableArray *)obj countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v13);
    }
    else
    {
      int v3 = 70;
    }

    if (self->_waitForSignalAfterCompletion) {
      [(MediaConversionServiceCommandLineDriver *)self waitForSigInt];
    }
    [(PAVideoConversionServiceClient *)self->_videoConversionServiceClient invalidateAfterPendingRequestCompletion];
  }
  return v3;
}

- (BOOL)hasConversionOfType:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = self->_conversionOptionSets;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        int v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "conversionType", (void)v12);
        char v10 = [v9 isEqualToString:v4];

        if (v10)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)processOption:(int)a3 arg:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(NSMutableArray *)self->_conversionOptionSets lastObject];
  uint64_t v8 = v7;
  BOOL v9 = 0;
  switch(a3)
  {
    case 'c':
      objc_msgSend(v7, "setRepeatCount:", objc_msgSend(v6, "integerValue"));
      if ([v8 repeatCount] > 1)
      {
LABEL_6:
        BOOL v9 = 1;
        self->_replaceExistingOutput = 1;
      }
      else
      {
        [(id)objc_opt_class() outputError:@"Repeat count '%@' is invalid, must be 2 or higher\n", v6];
        BOOL v9 = 0;
      }
      break;
    case 'd':
      [v7 setDestinationPath:v6];
      goto LABEL_22;
    case 'e':
    case 'f':
    case 'g':
    case 'h':
    case 'i':
    case 'j':
    case 'k':
    case 'l':
    case 'm':
    case 'n':
    case 'q':
    case 'u':
      break;
    case 'o':
      if (v6)
      {
        char v10 = [v7 conversionOptionInputKeyValuePairs];
        [v10 addObject:v6];
      }
      else
      {
        [(id)objc_opt_class() outputError:@"-o/--option requires a value\n"];
      }
      goto LABEL_22;
    case 'p':
      BOOL v9 = 1;
      self->_showProgress = 1;
      break;
    case 'r':
      [v7 setPresetName:v6];
      goto LABEL_22;
    case 's':
      [v7 setSourcePath:v6];
      goto LABEL_22;
    case 't':
      [v7 setConversionType:v6];
LABEL_22:
      BOOL v9 = 1;
      break;
    case 'v':
      BOOL v9 = 1;
      self->_verbose = 1;
      break;
    default:
      switch(a3)
      {
        case 1000:
          BOOL v9 = 1;
          self->_waitForSignalAfterCompletion = 1;
          break;
        case 1001:
          goto LABEL_6;
        case 1002:
          [v7 setSourcePathVideoComplement:v6];
          goto LABEL_22;
        case 1003:
          [v7 setDestinationPathVideoComplement:v6];
          goto LABEL_22;
        case 1004:
          BOOL v9 = 1;
          self->_pauseAtStart = 1;
          break;
        case 1005:
          BOOL v9 = 1;
          self->_launchServiceAtStart = 1;
          break;
        case 1006:
          *(_WORD *)&self->_launchServiceAtStart = 257;
          goto LABEL_22;
        case 1007:
          conversionOptionSets = self->_conversionOptionSets;
          long long v12 = objc_opt_new();
          [(NSMutableArray *)conversionOptionSets addObject:v12];

          goto LABEL_22;
        default:
          goto LABEL_23;
      }
      break;
  }
LABEL_23:

  return v9;
}

- (MediaConversionServiceCommandLineDriver)init
{
  v12.receiver = self;
  v12.super_class = (Class)MediaConversionServiceCommandLineDriver;
  v2 = [(MediaConversionServiceCommandLineDriver *)&v12 init];
  if (v2)
  {
    int v3 = (void *)MEMORY[0x1E4F1CA48];
    id v4 = objc_opt_new();
    uint64_t v5 = [v3 arrayWithObject:v4];
    conversionOptionSets = v2->_conversionOptionSets;
    v2->_conversionOptionSets = (NSMutableArray *)v5;

    uint64_t v7 = objc_opt_new();
    imageConversionServiceClient = v2->_imageConversionServiceClient;
    v2->_imageConversionServiceClient = (PAImageConversionServiceClient *)v7;

    uint64_t v9 = objc_opt_new();
    videoConversionServiceClient = v2->_videoConversionServiceClient;
    v2->_videoConversionServiceClient = (PAVideoConversionServiceClient *)v9;
  }
  return v2;
}

+ (void)output:(id)a3
{
  +[MediaConversionServiceCommandLineDriver _output:arguments:file:]((uint64_t)a1, a3, (uint64_t)&v3, (FILE *)*MEMORY[0x1E4F143D8]);
}

+ (void)_output:(uint64_t)a3 arguments:(FILE *)a4 file:
{
  id v6 = a2;
  self;
  uint64_t v7 = (void *)[[NSString alloc] initWithFormat:v6 arguments:a3];

  id v8 = v7;
  fputs((const char *)[v8 UTF8String], a4);
}

+ (void)outputError:(id)a3
{
  +[MediaConversionServiceCommandLineDriver _output:arguments:file:]((uint64_t)a1, a3, (uint64_t)&v3, (FILE *)*MEMORY[0x1E4F143C8]);
}

+ (void)outputConversionError:(id)a3 status:(int64_t)a4
{
  id v15 = a3;
  id v6 = [v15 domain];
  int v7 = [v6 isEqualToString:@"PAMediaConversionServiceErrorDomain"];

  if (v7)
  {
    id v8 = NSString;
    unint64_t v9 = [v15 code];
    if (v9 > 0xC) {
      char v10 = 0;
    }
    else {
      char v10 = off_1E6CFE6A0[v9];
    }
    objc_super v12 = v10;
    int v11 = [v8 stringWithFormat:@" (%@)", v12];
  }
  else
  {
    int v11 = &stru_1F3947AF8;
  }
  if ((unint64_t)a4 > 6) {
    long long v13 = 0;
  }
  else {
    long long v13 = off_1E6CFE708[a4];
  }
  long long v14 = v13;
  [a1 outputError:@"Conversion unsuccessful (status %ld - %@): %@%@\n", a4, v14, v15, v11];
}

+ (id)replacementObjectForObject:(id)a3 valueConversionHandler:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  unint64_t v9 = (void (**)(void, void))v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, a1, @"MediaConversionServiceCommandLineDriver.m", 938, @"Invalid parameter not satisfying: %@", @"object" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  int v25 = [MEMORY[0x1E4F28B00] currentHandler];
  [v25 handleFailureInMethod:a2, a1, @"MediaConversionServiceCommandLineDriver.m", 939, @"Invalid parameter not satisfying: %@", @"valueConversionHandler" object file lineNumber description];

LABEL_3:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v7;
    id v11 = [MEMORY[0x1E4F1CA48] array];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v12 = v10;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v31 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = [a1 replacementObjectForObject:*(void *)(*((void *)&v30 + 1) + 8 * i) valueConversionHandler:v9];
          [v11 addObject:v17];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v14);
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v18 = (void *)MEMORY[0x1E4F1CA60];
      id v19 = v7;
      uint64_t v20 = [v18 dictionary];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __93__MediaConversionServiceCommandLineDriver_replacementObjectForObject_valueConversionHandler___block_invoke;
      v26[3] = &unk_1E6CFEE48;
      id v21 = v20;
      id v27 = v21;
      id v29 = a1;
      int v28 = v9;
      [v19 enumerateKeysAndObjectsUsingBlock:v26];

      v22 = v28;
      id v11 = v21;
    }
    else
    {
      ((void (**)(void, id))v9)[2](v9, v7);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v11;
}

void __93__MediaConversionServiceCommandLineDriver_replacementObjectForObject_valueConversionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v5 = *(void **)(a1 + 48);
  id v7 = a2;
  id v8 = [v5 replacementObjectForObject:a3 valueConversionHandler:v6];
  [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v7];
}

+ (BOOL)outputJSONDataForConversionOutputInformation:(id)a3
{
  id v4 = [a1 replacementObjectForObject:a3 valueConversionHandler:&__block_literal_global_427];
  id v12 = 0;
  uint64_t v5 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v4 options:0 error:&v12];
  id v6 = v12;
  id v7 = v6;
  if (v5)
  {
    id v8 = [MEMORY[0x1E4F28CB0] fileHandleWithStandardOutput];
    [v8 writeData:v5];
    unint64_t v9 = [@"\n" dataUsingEncoding:4];
    [v8 writeData:v9];

    BOOL v10 = 1;
  }
  else
  {
    [a1 outputError:@"Conversion successful but unable to convert output information to JSON: %@\n", v6];
    BOOL v10 = 0;
  }

  return v10;
}

id __88__MediaConversionServiceCommandLineDriver_outputJSONDataForConversionOutputInformation___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F28D48];
    id v4 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
    uint64_t v5 = [v3 stringFromDate:v2 timeZone:v4 formatOptions:4083];

    id v2 = (id)v5;
  }
  return v2;
}

+ (option)longopts
{
  return (option *)&longopts__opts;
}

+ (const)optstring
{
  return "t:s:d:o:r:c:vp";
}

+ (id)usagesummary
{
  id v2 = +[ConversionOptionSet knownConversionTypes];
  uint64_t v3 = [v2 componentsJoinedByString:@"|"];

  id v4 = [NSString stringWithFormat:@"-t|--type [%@] -s|--source <input media path> -d|--destination <output media path> [--source-video-complement <input media path>] [--destination-video-complement <output media path>] [--replace] [[-o|--option <key>=<value>], ...] [-r|--preset <preset>] [-c|--count <count>] [-v|--verbose] [--wait] [-p|--progress] [--pause] [--launch] [--launch-and-pause] [--next]", v3];

  return v4;
}

+ (id)usage
{
  id v2 = NSString;
  uint64_t v3 = [(id)objc_opt_class() usagesummary];
  id v4 = [v2 stringWithFormat:@"%@\n%@", v3, @"\n\timage:       Convert an image\n\tvideo:       Convert a video\n\tstill:       Extract a still image from a video\n\n\t--replace:             Overwrite existing output file\n\t--wait:                On completion, suspend the process until a SIGINT signal is received instead of exiting right away. This lets you inspect the state of the client and service processes after completion, especially for memory investigations.\n\t--option:              Pass a conversion option key/value pair. Key and value are separated by a = character. The keys are as defined in PAMediaConversionServiceCommonDefinitions.h, with the 'PAMediaConversion' prefix and the 'Key' suffix omitted. You can pass this option multiple times.\n\t--preset:              Apply a pre-defined set of conversion options for common cases. Pass '?' to get a list of preset names.\n\t--count:               Repeat the conversion n times, for memory or other performance investigations. Implies --replace.\n\t--progress:            Print progress for video conversion to stderr\n\t--pause:               Print the client PID and wait for keyboard input before sending any requests to the service. On macOS this lets you manipulate the launch environment of the service process with 'launchctl debug pid/<client PID>/com.apple.photos.ImageConversionService' (or VideoConversionService).\n\t--launch:              Send an initial XPC message to the service to ensure it is launched when the main conversion request is sent. This lets you measure request performance without process launch time.\n\t--launch-and-pause:    Like --launch, but additionally waits for keyboard input before sending any requests to the service. This lets you attach to the service process with perf tools or the debugger before the main conversion request is processed.\n\t--next:                Capture all options given so far as a conversion request and start a new request. All following options apply to the next request. This lets you execute multiple independent requests back-to-back."];

  return v4;
}

@end