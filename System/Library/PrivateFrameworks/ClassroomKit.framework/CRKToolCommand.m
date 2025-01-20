@interface CRKToolCommand
+ (BOOL)handlesProgress;
+ (BOOL)instructorCommand;
+ (BOOL)supportsDMFRequest;
+ (BOOL)supportsJSON;
+ (BOOL)supportsVerboseOutput;
+ (id)aliases;
+ (id)description;
+ (id)help;
+ (id)subcommandPath;
+ (void)printHelp;
- (BOOL)didCommandSucceed;
- (BOOL)didOperationSucceed:(id)a3;
- (BOOL)isCommandFinished;
- (BOOL)shouldPrintJSON;
- (BOOL)shouldPrintVerbose;
- (BOOL)shouldUseDMFRequest;
- (CRKClassroomInstallation)targetClassroomInstallation;
- (CRKToolCommand)init;
- (CRKToolCommandDelegate)delegate;
- (NSString)sessionIdentifier;
- (id)DMFRequestWithArguments:(id)a3;
- (id)arrayByParsingAndRemovingArgumentFlags:(id)a3;
- (id)operationWithClient:(id)a3 arguments:(id)a4;
- (id)requestWithArguments:(id)a3;
- (id)transportProvider;
- (void)_remoteTaskDidFinish:(id)a3;
- (void)cleanupAndExitIfNeeded;
- (void)client:(id)a3 didInterruptWithError:(id)a4;
- (void)client:(id)a3 didReceiveNotificationWithName:(id)a4 userInfo:(id)a5;
- (void)connectToTaskClientWithCompletionBlock:(id)a3;
- (void)executeOperation:(id)a3;
- (void)remoteTaskDidFinish:(id)a3;
- (void)runWithArguments:(id)a3;
- (void)runWithClient:(id)a3 arguments:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setPrintJSON:(BOOL)a3;
- (void)setPrintVerbose:(BOOL)a3;
- (void)setSessionIdentifier:(id)a3;
- (void)setTargetClassroomInstallation:(id)a3;
- (void)setUseDMFRequest:(BOOL)a3;
@end

@implementation CRKToolCommand

+ (BOOL)supportsJSON
{
  return 0;
}

+ (BOOL)supportsVerboseOutput
{
  return 0;
}

+ (BOOL)supportsDMFRequest
{
  return 0;
}

+ (id)subcommandPath
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)aliases
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, a1, @"CRKToolCommand.m", 52, @"%@: -aliases must be implemented", a1 object file lineNumber description];

  return 0;
}

+ (id)description
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, a1, @"CRKToolCommand.m", 57, @"%@: -description must be implemented", a1 object file lineNumber description];

  return 0;
}

+ (id)help
{
  v3 = objc_opt_new();
  if ([a1 supportsJSON]) {
    [v3 appendFormat:@"     [%@] - outputs in JSON format\n", @"-json"];
  }
  if ([a1 supportsVerboseOutput]) {
    [v3 appendFormat:@"     [%@] - displays verbose output\n", @"-v"];
  }
  if ([a1 supportsDMFRequest]) {
    [v3 appendFormat:@"     [%@] - uses a deprecated DMF request instead of a CRK request\n", @"-dmf"];
  }
  objc_msgSend(v3, "crk_deleteSuffix:", @"\n");
  v4 = (void *)[v3 copy];

  return v4;
}

+ (void)printHelp
{
  v3 = NSString;
  v4 = [MEMORY[0x263F08AB0] processInfo];
  v5 = [v4 processName];
  v6 = [a1 aliases];
  v7 = [v6 firstObject];
  id v25 = [v3 stringWithFormat:@"%@ %@", v5, v7];

  v24 = [a1 description];
  CRTLog(@"%@ -- %@", v8, v9, v10, v11, v12, v13, v14, (uint64_t)v25);

  v15 = [a1 help];
  if ([v15 length]) {
    CRTLog(@"Usage: %@ %@", v16, v17, v18, v19, v20, v21, v22, (uint64_t)v25);
  }
  else {
    CRTLog(@"No usage help available.", v16, v17, v18, v19, v20, v21, v22, v23);
  }
}

+ (BOOL)instructorCommand
{
  return 0;
}

+ (BOOL)handlesProgress
{
  return 0;
}

- (CRKToolCommand)init
{
  v6.receiver = self;
  v6.super_class = (Class)CRKToolCommand;
  v2 = [(CRKToolCommand *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    mOperationQueue = v2->mOperationQueue;
    v2->mOperationQueue = (CATOperationQueue *)v3;
  }
  return v2;
}

- (void)runWithArguments:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__CRKToolCommand_runWithArguments___block_invoke;
  v7[3] = &unk_2646F58A8;
  objc_copyWeak(&v9, &location);
  id v5 = v4;
  id v8 = v5;
  [(CRKToolCommand *)self connectToTaskClientWithCompletionBlock:v7];
  objc_super v6 = [MEMORY[0x263EFF9F0] mainRunLoop];
  [v6 run];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __35__CRKToolCommand_runWithArguments___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  if (!v15 || v5)
  {
    v7 = [v5 verboseDescription];
    CRTLogError(@"Could not connect: %@", v8, v9, v10, v11, v12, v13, v14, (uint64_t)v7);

    exit(1);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained runWithClient:v15 arguments:*(void *)(a1 + 32)];
}

- (void)runWithClient:(id)a3 arguments:(id)a4
{
  id v5 = [(CRKToolCommand *)self operationWithClient:a3 arguments:a4];
  [(CRKToolCommand *)self executeOperation:v5];
}

- (id)arrayByParsingAndRemovingArgumentFlags:(id)a3
{
  id v4 = (void *)[a3 mutableCopy];
  if ([(id)objc_opt_class() supportsJSON]) {
    uint64_t v5 = objc_msgSend(v4, "crk_pluckFlag:", @"-json");
  }
  else {
    uint64_t v5 = 0;
  }
  [(CRKToolCommand *)self setPrintJSON:v5];
  if ([(id)objc_opt_class() supportsVerboseOutput]) {
    uint64_t v6 = objc_msgSend(v4, "crk_pluckFlag:", @"-v");
  }
  else {
    uint64_t v6 = 0;
  }
  [(CRKToolCommand *)self setPrintVerbose:v6];
  if ([(id)objc_opt_class() supportsDMFRequest]) {
    uint64_t v7 = objc_msgSend(v4, "crk_pluckFlag:", @"-dmf");
  }
  else {
    uint64_t v7 = 0;
  }
  [(CRKToolCommand *)self setUseDMFRequest:v7];
  uint64_t v8 = (void *)[v4 copy];

  return v8;
}

- (id)operationWithClient:(id)a3 arguments:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(CRKToolCommand *)self arrayByParsingAndRemovingArgumentFlags:a4];
  if ([(CRKToolCommand *)self shouldUseDMFRequest]) {
    [(CRKToolCommand *)self DMFRequestWithArguments:v7];
  }
  else {
  uint64_t v8 = [(CRKToolCommand *)self requestWithArguments:v7];
  }
  if (v8)
  {
    uint64_t v9 = [v6 prepareTaskOperationForRequest:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)requestWithArguments:(id)a3
{
  uint64_t v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  [v5 handleFailureInMethod:a2, self, @"CRKToolCommand.m", 146, @"%@: -requestWithArguments: must be implemented", self object file lineNumber description];

  return 0;
}

- (id)DMFRequestWithArguments:(id)a3
{
  uint64_t v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  [v5 handleFailureInMethod:a2, self, @"CRKToolCommand.m", 151, @"%@: -DMFRequestWithArguments: must be implemented", self object file lineNumber description];

  return 0;
}

- (void)remoteTaskDidFinish:(id)a3
{
  id v22 = a3;
  uint64_t v3 = [v22 error];

  if (v3)
  {
    id v4 = [v22 error];
    uint64_t v5 = [v4 verboseDescription];
    CRTLogError(@"Error: %@", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);
  }
  else
  {
    uint64_t v13 = [v22 resultObject];

    uint64_t v14 = v22;
    if (!v13) {
      goto LABEL_6;
    }
    id v4 = [v22 resultObject];
    CRTLog(@"%@", v15, v16, v17, v18, v19, v20, v21, (uint64_t)v4);
  }

  uint64_t v14 = v22;
LABEL_6:
}

- (id)transportProvider
{
  if ([(id)objc_opt_class() instructorCommand])
  {
    uint64_t v3 = [(CRKToolCommand *)self targetClassroomInstallation];
    id v4 = [CRKCurrentPlatformInstructordTransportProvider alloc];
    uint64_t v5 = [v3 classroomURL];
    uint64_t v6 = [v3 instructordBundleIdentifier];
    uint64_t v7 = [(CRKCurrentPlatformInstructordTransportProvider *)v4 initWithStudentDaemonProxy:0 classroomAppBundleURL:v5 instructordBundleIdentifier:v6];
  }
  else
  {
    uint64_t v7 = (CRKCurrentPlatformInstructordTransportProvider *)objc_opt_new();
  }

  return v7;
}

- (void)connectToTaskClientWithCompletionBlock:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"CRKToolCommand.m", 185, @"Invalid parameter not satisfying: %@", @"completionBlock" object file lineNumber description];
  }
  uint64_t v6 = [(CRKToolCommand *)self transportProvider];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__CRKToolCommand_connectToTaskClientWithCompletionBlock___block_invoke;
  v9[3] = &unk_2646F58D0;
  v9[4] = self;
  id v10 = v5;
  id v7 = v5;
  [v6 fetchTransportWithCompletion:v9];
}

void __57__CRKToolCommand_connectToTaskClientWithCompletionBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v12 = a2;
  if (!a3)
  {
    uint64_t v5 = objc_opt_new();
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 16);
    *(void *)(v6 + 16) = v5;

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "setDelegate:");
    uint64_t v8 = [CRKToolCommandUserInfo alloc];
    uint64_t v9 = [*(id *)(a1 + 32) sessionIdentifier];
    id v10 = [(CRKToolCommandUserInfo *)v8 initWithSessionIdentifier:v9];
    uint64_t v11 = [(CRKToolCommandUserInfo *)v10 dictionaryValue];
    [*(id *)(*(void *)(a1 + 32) + 16) setUserInfo:v11];

    [*(id *)(*(void *)(a1 + 32) + 16) connectWithTransport:v12];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)executeOperation:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    [(id)objc_opt_class() printHelp];
    exit(1);
  }
  uint64_t v6 = v5;
  objc_storeStrong((id *)&self->mOperation, a3);
  id v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF83F0], 2uLL, 0, MEMORY[0x263EF83A0]);
  mSIGINTSource = self->mSIGINTSource;
  self->mSIGINTSource = v7;

  uint64_t v9 = self->mSIGINTSource;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __35__CRKToolCommand_executeOperation___block_invoke;
  handler[3] = &unk_2646F35C0;
  id v10 = v6;
  id v24 = v10;
  dispatch_source_set_event_handler(v9, handler);
  dispatch_resume((dispatch_object_t)self->mSIGINTSource);
  v22.__sigaction_u.__sa_handler = (void (__cdecl *)(int))1;
  *(void *)&v22.sa_mask = 0;
  sigaction(2, &v22, 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([(id)objc_opt_class() handlesProgress]) {
      [v10 addTarget:self selector:sel__remoteTaskDidProgress_ forOperationEvents:8];
    }
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_16:
    [v10 addTarget:self selector:sel__remoteTaskDidFinish_ forOperationEvents:6];
    goto LABEL_17;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v17 = v10;
  uint64_t v11 = [v17 remoteTaskOperations];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([(id)objc_opt_class() handlesProgress]) {
          [v16 addTarget:self selector:sel__remoteTaskDidProgress_ forOperationEvents:8];
        }
        [v16 addTarget:self selector:sel__remoteTaskDidFinish_ forOperationEvents:6];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v25 count:16];
    }
    while (v13);
  }

LABEL_17:
  [(CATOperationQueue *)self->mOperationQueue addOperation:v10];
}

uint64_t __35__CRKToolCommand_executeOperation___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isCancelled]) {
    exit(1);
  }
  v2 = *(void **)(a1 + 32);

  return [v2 cancel];
}

- (void)_remoteTaskDidFinish:(id)a3
{
  [(CRKToolCommand *)self remoteTaskDidFinish:a3];

  [(CRKToolCommand *)self cleanupAndExitIfNeeded];
}

- (void)cleanupAndExitIfNeeded
{
  if ([(CRKToolCommand *)self isCommandFinished])
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __40__CRKToolCommand_cleanupAndExitIfNeeded__block_invoke;
    v8[3] = &unk_2646F35C0;
    v8[4] = self;
    uint64_t v3 = [MEMORY[0x263F086D0] blockOperationWithBlock:v8];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __40__CRKToolCommand_cleanupAndExitIfNeeded__block_invoke_2;
    v7[3] = &unk_2646F35C0;
    void v7[4] = self;
    id v4 = [MEMORY[0x263F086D0] blockOperationWithBlock:v7];
    [v4 addDependency:v3];
    id v5 = [MEMORY[0x263F08A48] mainQueue];
    [v5 addOperation:v3];

    uint64_t v6 = [MEMORY[0x263F08A48] mainQueue];
    [v6 addOperation:v4];
  }
}

uint64_t __40__CRKToolCommand_cleanupAndExitIfNeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) disconnect];
}

void __40__CRKToolCommand_cleanupAndExitIfNeeded__block_invoke_2(uint64_t a1)
{
}

- (BOOL)isCommandFinished
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v3 = [(CATOperation *)self->mOperation remoteTaskOperations];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          if (![*(id *)(*((void *)&v11 + 1) + 8 * i) isFinished])
          {
            BOOL v8 = 0;
            goto LABEL_15;
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
    BOOL v8 = 1;
LABEL_15:

    return v8;
  }
  else
  {
    mOperation = self->mOperation;
    return [(CATOperation *)mOperation isFinished];
  }
}

- (BOOL)didCommandSucceed
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v3 = [(CATOperation *)self->mOperation remoteTaskOperations];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          if (![(CRKToolCommand *)self didOperationSucceed:*(void *)(*((void *)&v11 + 1) + 8 * i)])
          {
            BOOL v8 = 0;
            goto LABEL_15;
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
    BOOL v8 = 1;
LABEL_15:

    return v8;
  }
  else
  {
    mOperation = self->mOperation;
    return [(CRKToolCommand *)self didOperationSucceed:mOperation];
  }
}

- (BOOL)didOperationSucceed:(id)a3
{
  id v3 = a3;
  if ([v3 isFinished])
  {
    uint64_t v4 = [v3 error];
    BOOL v5 = v4 == 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)client:(id)a3 didReceiveNotificationWithName:(id)a4 userInfo:(id)a5
{
  id v7 = (void *)MEMORY[0x263F08A00];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v7 defaultCenter];
  [v11 postNotificationName:v9 object:v10 userInfo:v8];
}

- (void)client:(id)a3 didInterruptWithError:(id)a4
{
  id v13 = a3;
  long long v12 = [a4 verboseDescription];
  CRTLogError(@"Client failed with error: %@ %@", v5, v6, v7, v8, v9, v10, v11, (uint64_t)v13);

  [v13 invalidate];
}

- (BOOL)shouldPrintJSON
{
  return self->_printJSON;
}

- (void)setPrintJSON:(BOOL)a3
{
  self->_printJSON = a3;
}

- (BOOL)shouldPrintVerbose
{
  return self->_printVerbose;
}

- (void)setPrintVerbose:(BOOL)a3
{
  self->_printVerbose = a3;
}

- (BOOL)shouldUseDMFRequest
{
  return self->_useDMFRequest;
}

- (void)setUseDMFRequest:(BOOL)a3
{
  self->_useDMFRequest = a3;
}

- (CRKToolCommandDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CRKToolCommandDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
}

- (CRKClassroomInstallation)targetClassroomInstallation
{
  return self->_targetClassroomInstallation;
}

- (void)setTargetClassroomInstallation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetClassroomInstallation, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->mOperation, 0);
  objc_storeStrong((id *)&self->mOperationQueue, 0);
  objc_storeStrong((id *)&self->mTaskClient, 0);

  objc_storeStrong((id *)&self->mSIGINTSource, 0);
}

@end