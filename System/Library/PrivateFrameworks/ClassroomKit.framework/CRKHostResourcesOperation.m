@interface CRKHostResourcesOperation
- (BOOL)allDownloadsFinished;
- (BOOL)downloadAllowedForFileURL:(id)a3;
- (BOOL)isAsynchronous;
- (BOOL)isObservingIPAddress;
- (CRKHostResourcesOperation)initWithConfiguration:(id)a3;
- (CRKHostResourcesOperation)initWithResourceURLs:(id)a3 serverIdentity:(id)a4 trustedAnchorCertificates:(id)a5;
- (CRKHostResourcesOperation)initWithResourceURLs:(id)a3 serverIdentity:(id)a4 trustedAnchorCertificates:(id)a5 maximumAllowedDownloads:(unint64_t)a6;
- (CRKHostResourcesOperation)initWithResourceURLs:(id)a3 serverIdentity:(id)a4 trustedAnchorCertificates:(id)a5 maximumAllowedDownloads:(unint64_t)a6 port:(unsigned __int16)a7;
- (CRKHostResourcesOperationDelegate)delegate;
- (id)hostingSocketOptions;
- (void)IPAddressDidChange;
- (void)cancel;
- (void)connection:(id)a3 didFailToSendDataWithStream:(id)a4 userInfo:(id)a5 error:(id)a6;
- (void)connection:(id)a3 didInterruptWithError:(id)a4;
- (void)connection:(id)a3 didReceiveDataRequestWithURL:(id)a4;
- (void)connection:(id)a3 didSendDataWithStream:(id)a4 userInfo:(id)a5;
- (void)connectionCloseDidTimeout:(id)a3;
- (void)connectionDidClose:(id)a3;
- (void)delegateDownloadFinished:(id)a3 fileURL:(id)a4 error:(id)a5;
- (void)delegateDownloadStarted:(id)a3 fileURL:(id)a4;
- (void)delegateResourcesDidPublish;
- (void)incrementFinishedDownloadCountForFileURL:(id)a3;
- (void)incrementStartedDownloadCountForFileURL:(id)a3;
- (void)main;
- (void)netService:(id)a3 didAcceptConnectionWithInputStream:(id)a4 outputStream:(id)a5;
- (void)netService:(id)a3 didNotPublish:(id)a4;
- (void)netServiceDidPublish:(id)a3;
- (void)netServiceDidStop:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)operationDidFinish;
- (void)run;
- (void)serveItemAtURL:(id)a3 toConnection:(id)a4 forRequestURL:(id)a5 originalItemURL:(id)a6;
- (void)setDelegate:(id)a3;
- (void)setObservingIPAddress:(BOOL)a3;
- (void)zipDirectoryAtURL:(id)a3 completion:(id)a4;
- (void)zipOperationDidFail:(id)a3 directoryURL:(id)a4;
@end

@implementation CRKHostResourcesOperation

- (CRKHostResourcesOperation)initWithResourceURLs:(id)a3 serverIdentity:(id)a4 trustedAnchorCertificates:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [[CRKHostResourcesConfiguration alloc] initWithResourceURLs:v10 serverIdentity:v9 trustedAnchorCertificates:v8];

  v12 = [(CRKHostResourcesOperation *)self initWithConfiguration:v11];
  return v12;
}

- (CRKHostResourcesOperation)initWithResourceURLs:(id)a3 serverIdentity:(id)a4 trustedAnchorCertificates:(id)a5 maximumAllowedDownloads:(unint64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [[CRKHostResourcesConfiguration alloc] initWithResourceURLs:v12 serverIdentity:v11 trustedAnchorCertificates:v10];

  [(CRKHostResourcesConfiguration *)v13 setMaximumAllowedDownloads:a6];
  v14 = [(CRKHostResourcesOperation *)self initWithConfiguration:v13];

  return v14;
}

- (CRKHostResourcesOperation)initWithResourceURLs:(id)a3 serverIdentity:(id)a4 trustedAnchorCertificates:(id)a5 maximumAllowedDownloads:(unint64_t)a6 port:(unsigned __int16)a7
{
  uint64_t v7 = a7;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = [[CRKHostResourcesConfiguration alloc] initWithResourceURLs:v14 serverIdentity:v13 trustedAnchorCertificates:v12];

  [(CRKHostResourcesConfiguration *)v15 setMaximumAllowedDownloads:a6];
  [(CRKHostResourcesConfiguration *)v15 setPort:v7];
  v16 = [(CRKHostResourcesOperation *)self initWithConfiguration:v15];

  return v16;
}

- (CRKHostResourcesOperation)initWithConfiguration:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    v34 = [MEMORY[0x263F08690] currentHandler];
    [v34 handleFailureInMethod:a2, self, @"CRKHostResourcesOperation.m", 71, @"Invalid parameter not satisfying: %@", @"configuration" object file lineNumber description];
  }
  v43.receiver = self;
  v43.super_class = (Class)CRKHostResourcesOperation;
  v6 = [(CRKHostResourcesOperation *)&v43 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    mConfiguration = v6->mConfiguration;
    v6->mConfiguration = (CRKHostResourcesConfiguration *)v7;

    uint64_t v9 = objc_opt_new();
    mStartedDownloadCountByFileURL = v6->mStartedDownloadCountByFileURL;
    v6->mStartedDownloadCountByFileURL = (NSMutableDictionary *)v9;

    uint64_t v11 = objc_opt_new();
    mFinishedDownloadCountByFileURL = v6->mFinishedDownloadCountByFileURL;
    v6->mFinishedDownloadCountByFileURL = (NSMutableDictionary *)v11;

    uint64_t v13 = objc_opt_new();
    mConnections = v6->mConnections;
    v35 = v6;
    v6->mConnections = (NSMutableSet *)v13;

    v38 = (NSDictionary *)objc_opt_new();
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v36 = v5;
    id obj = [v5 resourceURLs];
    uint64_t v15 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v40 != v17) {
            objc_enumerationMutation(obj);
          }
          v19 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          v20 = NSURL;
          v44[0] = @"/";
          v21 = [MEMORY[0x263F08C38] UUID];
          v22 = [v21 UUIDString];
          v44[1] = v22;
          v23 = [v19 lastPathComponent];
          v44[2] = v23;
          v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:3];
          v25 = [v20 fileURLWithPathComponents:v24];
          v26 = objc_msgSend(v25, "crk_escapedPath");

          [(NSDictionary *)v38 setObject:v19 forKeyedSubscript:v26];
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
      }
      while (v16);
    }

    v6 = v35;
    mFileURLsByFilePath = v35->mFileURLsByFilePath;
    v35->mFileURLsByFilePath = v38;
    v28 = v38;

    uint64_t v29 = objc_opt_new();
    mConnectionCloseTimers = v35->mConnectionCloseTimers;
    v35->mConnectionCloseTimers = (NSMutableSet *)v29;

    uint64_t v31 = objc_opt_new();
    mZipOperationsByDirectoryURL = v35->mZipOperationsByDirectoryURL;
    v35->mZipOperationsByDirectoryURL = (NSMutableDictionary *)v31;

    id v5 = v36;
  }

  return v6;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
}

- (void)run
{
  if ([(CRKHostResourcesOperation *)self isExecuting])
  {
    if ([(CRKHostResourcesOperation *)self isCanceled])
    {
      CATErrorWithCodeAndUserInfo();
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      [(CRKHostResourcesOperation *)self endOperationWithError:v7];
    }
    else if ([(NSDictionary *)self->mFileURLsByFilePath count])
    {
      v3 = [(CRKHostResourcesConfiguration *)self->mConfiguration IPAddressProvider];
      [v3 addObserver:self forKeyPath:@"IPAddress" options:0 context:@"CRKHostResourcesOperationObservationContext"];

      [(CRKHostResourcesOperation *)self setObservingIPAddress:1];
      v4 = (NSNetService *)objc_msgSend(objc_alloc(MEMORY[0x263EFC5F0]), "initWithDomain:type:name:port:", &stru_26D7E7B00, @"_classroomshare._tcp.", &stru_26D7E7B00, -[CRKHostResourcesConfiguration port](self->mConfiguration, "port"));
      mNetService = self->mNetService;
      self->mNetService = v4;

      [(NSNetService *)self->mNetService setDelegate:self];
      v6 = self->mNetService;
      [(NSNetService *)v6 publishWithOptions:2];
    }
    else
    {
      [(CRKHostResourcesOperation *)self endOperationWithResultObject:0];
    }
  }
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)CRKHostResourcesOperation;
  [(CRKHostResourcesOperation *)&v4 cancel];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __35__CRKHostResourcesOperation_cancel__block_invoke;
  v3[3] = &unk_2646F35C0;
  v3[4] = self;
  objc_msgSend(MEMORY[0x263EFF9F0], "cat_performBlockOnMainRunLoop:", v3);
}

uint64_t __35__CRKHostResourcesOperation_cancel__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 408) stop];
}

- (void)operationDidFinish
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v22.receiver = self;
  v22.super_class = (Class)CRKHostResourcesOperation;
  [(CRKHostResourcesOperation *)&v22 operationDidFinish];
  if ([(CRKHostResourcesOperation *)self isObservingIPAddress])
  {
    v3 = [(CRKHostResourcesConfiguration *)self->mConfiguration IPAddressProvider];
    [v3 removeObserver:self forKeyPath:@"IPAddress" context:@"CRKHostResourcesOperationObservationContext"];

    [(CRKHostResourcesOperation *)self setObservingIPAddress:0];
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  objc_super v4 = (void *)[(NSMutableSet *)self->mConnections copy];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * v8++) close];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v6);
  }

  [(NSMutableSet *)self->mConnections removeAllObjects];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v9 = (void *)[(NSMutableSet *)self->mConnectionCloseTimers copy];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * v13++) invalidate];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v23 count:16];
    }
    while (v11);
  }

  [(NSMutableSet *)self->mConnectionCloseTimers removeAllObjects];
}

- (id)hostingSocketOptions
{
  v2 = objc_opt_new();
  [v2 setAdaptiveWriteTimeout:&unk_26D81A2A0];
  [v2 setKeepAliveEnabled:MEMORY[0x263EFFA88]];
  [v2 setKeepAliveDelay:&unk_26D81A2B8];
  [v2 setKeepAliveInterval:&unk_26D81A2D0];
  [v2 setKeepAliveCount:&unk_26D81A2D0];
  [v2 setNetServiceType:&unk_26D81A2E8];

  return v2;
}

- (BOOL)downloadAllowedForFileURL:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if ([(CRKHostResourcesConfiguration *)self->mConfiguration maximumAllowedDownloads])
    {
      uint64_t v5 = [(NSMutableDictionary *)self->mStartedDownloadCountByFileURL objectForKeyedSubscript:v4];
      unint64_t v6 = [v5 integerValue];
      BOOL v7 = v6 >= [(CRKHostResourcesConfiguration *)self->mConfiguration maximumAllowedDownloads];

      char v8 = !v7;
    }
    else
    {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8 & 1;
}

- (void)incrementStartedDownloadCountForFileURL:(id)a3
{
  mStartedDownloadCountByFileURL = self->mStartedDownloadCountByFileURL;
  id v5 = a3;
  uint64_t v6 = [(NSMutableDictionary *)mStartedDownloadCountByFileURL objectForKeyedSubscript:v5];
  BOOL v7 = (void *)v6;
  char v8 = &unk_26D81A300;
  if (v6) {
    char v8 = (void *)v6;
  }
  id v9 = v8;

  uint64_t v10 = NSNumber;
  uint64_t v11 = [v9 unsignedIntegerValue];

  id v12 = [v10 numberWithUnsignedInteger:v11 + 1];
  [(NSMutableDictionary *)self->mStartedDownloadCountByFileURL setObject:v12 forKeyedSubscript:v5];
}

- (void)incrementFinishedDownloadCountForFileURL:(id)a3
{
  mFinishedDownloadCountByFileURL = self->mFinishedDownloadCountByFileURL;
  id v5 = a3;
  uint64_t v6 = [(NSMutableDictionary *)mFinishedDownloadCountByFileURL objectForKeyedSubscript:v5];
  BOOL v7 = (void *)v6;
  char v8 = &unk_26D81A300;
  if (v6) {
    char v8 = (void *)v6;
  }
  id v9 = v8;

  uint64_t v10 = NSNumber;
  uint64_t v11 = [v9 unsignedIntegerValue];

  id v12 = [v10 numberWithUnsignedInteger:v11 + 1];
  [(NSMutableDictionary *)self->mFinishedDownloadCountByFileURL setObject:v12 forKeyedSubscript:v5];
}

- (BOOL)allDownloadsFinished
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (self->mStashedError) {
    return 1;
  }
  if (![(CRKHostResourcesConfiguration *)self->mConfiguration maximumAllowedDownloads]) {
    return 0;
  }
  uint64_t v4 = [(NSMutableDictionary *)self->mFinishedDownloadCountByFileURL count];
  if (v4 != [(NSDictionary *)self->mFileURLsByFilePath count]) {
    return 0;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(NSMutableDictionary *)self->mFinishedDownloadCountByFileURL allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        unint64_t v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) unsignedIntegerValue];
        if (v10 < [(CRKHostResourcesConfiguration *)self->mConfiguration maximumAllowedDownloads])
        {
          BOOL v2 = 0;
          goto LABEL_16;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v2 = 1;
LABEL_16:

  return v2;
}

- (void)delegateResourcesDidPublish
{
  v3 = NSURL;
  uint64_t v4 = NSString;
  id v5 = [(CRKHostResourcesConfiguration *)self->mConfiguration IPAddressProvider];
  uint64_t v6 = [v5 IPAddress];
  uint64_t v7 = [v4 stringWithFormat:@"https://%@:%ld", v6, -[NSNetService port](self->mNetService, "port")];
  uint64_t v8 = [v3 URLWithString:v7];

  mFileURLsByFilePath = self->mFileURLsByFilePath;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __56__CRKHostResourcesOperation_delegateResourcesDidPublish__block_invoke;
  v14[3] = &unk_2646F4E40;
  id v10 = v8;
  id v15 = v10;
  uint64_t v11 = [(NSDictionary *)mFileURLsByFilePath crk_mapUsingBlock:v14];
  long long v12 = [(CRKHostResourcesOperation *)self delegate];
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if (v6)
  {
    long long v13 = [(CRKHostResourcesOperation *)self delegate];
    [v13 hostResourcesOperation:self didPublishResources:v11];
  }
}

CRKResource *__56__CRKHostResourcesOperation_delegateResourcesDidPublish__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = [CRKResource alloc];
  uint64_t v8 = [NSURL URLWithString:v6 relativeToURL:*(void *)(a1 + 32)];

  uint64_t v9 = objc_msgSend(v5, "crk_isBundle");
  id v10 = [(CRKResource *)v7 initWithHostedURL:v8 isZippedBundle:v9];

  return v10;
}

- (void)delegateDownloadStarted:(id)a3 fileURL:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  uint64_t v7 = [(CRKHostResourcesOperation *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    uint64_t v9 = [(CRKHostResourcesOperation *)self delegate];
    [v9 hostResourcesOperation:self downloadDidStart:v10 fileURL:v6];
  }
}

- (void)delegateDownloadFinished:(id)a3 fileURL:(id)a4 error:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(CRKHostResourcesOperation *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    long long v12 = [(CRKHostResourcesOperation *)self delegate];
    [v12 hostResourcesOperation:self downloadDidFinish:v13 fileURL:v8 error:v9];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == @"CRKHostResourcesOperationObservationContext")
  {
    mConfiguration = self->mConfiguration;
    id v12 = a4;
    id v13 = [(CRKHostResourcesConfiguration *)mConfiguration IPAddressProvider];

    if (v13 == v12)
    {
      [(CRKHostResourcesOperation *)self IPAddressDidChange];
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)CRKHostResourcesOperation;
    id v10 = a4;
    [(CRKHostResourcesOperation *)&v14 observeValueForKeyPath:a3 ofObject:v10 change:a5 context:a6];
  }
}

- (void)IPAddressDidChange
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = _CRKLogOperation_1();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(CRKHostResourcesConfiguration *)self->mConfiguration IPAddressProvider];
    id v5 = [v4 IPAddress];
    int v6 = 138543618;
    uint64_t v7 = self;
    __int16 v8 = 2114;
    id v9 = v5;
    _os_log_impl(&dword_224C00000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: IP address did change to %{public}@", (uint8_t *)&v6, 0x16u);
  }
  if (self->mPublished) {
    [(CRKHostResourcesOperation *)self delegateResourcesDidPublish];
  }
}

- (void)netService:(id)a3 didAcceptConnectionWithInputStream:(id)a4 outputStream:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)MEMORY[0x263EFF9F0];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __88__CRKHostResourcesOperation_netService_didAcceptConnectionWithInputStream_outputStream___block_invoke;
  v12[3] = &unk_2646F42C0;
  v12[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  objc_msgSend(v9, "cat_performBlockOnMainRunLoop:", v12);
}

void __88__CRKHostResourcesOperation_netService_didAcceptConnectionWithInputStream_outputStream___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) isExecuting])
  {
    BOOL v2 = _CRKLogOperation_1();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      int v9 = 138543362;
      uint64_t v10 = v3;
      _os_log_impl(&dword_224C00000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Net service did accept connection", (uint8_t *)&v9, 0xCu);
    }

    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F39C98]) initWithInputStream:*(void *)(a1 + 40) outputStream:*(void *)(a1 + 48)];
    [v4 setDelegate:*(void *)(a1 + 32)];
    id v5 = [*(id *)(a1 + 32) hostingSocketOptions];
    [v4 setSocketOptions:v5];

    [*(id *)(*(void *)(a1 + 32) + 416) addObject:v4];
    int v6 = [*(id *)(*(void *)(a1 + 32) + 376) trustedCertificates];
    id v7 = objc_msgSend(v6, "crk_mapUsingBlock:", &__block_literal_global_72);

    id v8 = [*(id *)(*(void *)(a1 + 32) + 376) serverIdentity];
    objc_msgSend(v4, "secureUsingServerIdentity:trustedCertificates:", objc_msgSend(v8, "underlyingIdentity"), v7);

    [v4 scheduleStreams];
    [v4 open];
  }
}

uint64_t __88__CRKHostResourcesOperation_netService_didAcceptConnectionWithInputStream_outputStream___block_invoke_63(int a1, id a2)
{
  id v2 = a2;

  return [v2 underlyingCertificate];
}

- (void)netServiceDidPublish:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __50__CRKHostResourcesOperation_netServiceDidPublish___block_invoke;
  v3[3] = &unk_2646F35C0;
  v3[4] = self;
  objc_msgSend(MEMORY[0x263EFF9F0], "cat_performBlockOnMainRunLoop:", v3);
}

uint64_t __50__CRKHostResourcesOperation_netServiceDidPublish___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t result = [*(id *)(a1 + 32) isExecuting];
  if (result)
  {
    uint64_t v3 = _CRKLogOperation_1();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = 138543362;
      uint64_t v6 = v4;
      _os_log_impl(&dword_224C00000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Net service did publish", (uint8_t *)&v5, 0xCu);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 424) = 1;
    return [*(id *)(a1 + 32) delegateResourcesDidPublish];
  }
  return result;
}

- (void)netService:(id)a3 didNotPublish:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (void *)MEMORY[0x263EFF9F0];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __54__CRKHostResourcesOperation_netService_didNotPublish___block_invoke;
  v8[3] = &unk_2646F37F0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  objc_msgSend(v6, "cat_performBlockOnMainRunLoop:", v8);
}

void __54__CRKHostResourcesOperation_netService_didNotPublish___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  if ([*(id *)(a1 + 32) isExecuting])
  {
    uint64_t v3 = (void *)MEMORY[0x263F087E8];
    uint64_t v4 = *MEMORY[0x263EFC560];
    id v5 = [*(id *)(a1 + 40) objectForKeyedSubscript:*MEMORY[0x263EFC558]];
    uint64_t v6 = objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, objc_msgSend(v5, "integerValue"), *(void *)(a1 + 40));

    id v7 = _CRKLogOperation_1();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __54__CRKHostResourcesOperation_netService_didNotPublish___block_invoke_cold_1((uint64_t)v2, v6);
    }

    [*v2 endOperationWithError:v6];
  }
}

- (void)netServiceDidStop:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __47__CRKHostResourcesOperation_netServiceDidStop___block_invoke;
  v3[3] = &unk_2646F35C0;
  v3[4] = self;
  objc_msgSend(MEMORY[0x263EFF9F0], "cat_performBlockOnMainRunLoop:", v3);
}

uint64_t __47__CRKHostResourcesOperation_netServiceDidStop___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t result = [*(id *)(a1 + 32) isExecuting];
  if (result)
  {
    uint64_t v3 = _CRKLogOperation_1();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v6 = 138543362;
      uint64_t v7 = v4;
      _os_log_impl(&dword_224C00000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Net service did stop. Ending operation.", (uint8_t *)&v6, 0xCu);
    }

    id v5 = *(void **)(a1 + 32);
    if (v5[55]) {
      return objc_msgSend(v5, "endOperationWithError:");
    }
    else {
      return objc_msgSend(v5, "endOperationWithResultObject:");
    }
  }
  return result;
}

- (void)connection:(id)a3 didReceiveDataRequestWithURL:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([(CRKHostResourcesOperation *)self isExecuting])
  {
    uint64_t v8 = _CRKLogOperation_1();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v7 absoluteString];
      *(_DWORD *)buf = 138543874;
      long long v21 = self;
      __int16 v22 = 2114;
      id v23 = v6;
      __int16 v24 = 2114;
      uint64_t v25 = v9;
      _os_log_impl(&dword_224C00000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ did receive request for URL %{public}@", buf, 0x20u);
    }
    mFileURLsByFilePath = self->mFileURLsByFilePath;
    uint64_t v11 = objc_msgSend(v7, "crk_escapedPath");
    id v12 = [(NSDictionary *)mFileURLsByFilePath objectForKeyedSubscript:v11];

    if ([(CRKHostResourcesOperation *)self downloadAllowedForFileURL:v12])
    {
      id v13 = [v6 description];
      [(CRKHostResourcesOperation *)self delegateDownloadStarted:v13 fileURL:v12];

      [(CRKHostResourcesOperation *)self incrementStartedDownloadCountForFileURL:v12];
      if (objc_msgSend(v12, "crk_isBundle"))
      {
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        v15[2] = __69__CRKHostResourcesOperation_connection_didReceiveDataRequestWithURL___block_invoke;
        v15[3] = &unk_2646F4E68;
        id v16 = v6;
        id v17 = v7;
        long long v18 = self;
        id v19 = v12;
        [(CRKHostResourcesOperation *)self zipDirectoryAtURL:v19 completion:v15];
      }
      else
      {
        [(CRKHostResourcesOperation *)self serveItemAtURL:v12 toConnection:v6 forRequestURL:v7 originalItemURL:v12];
      }
    }
    else
    {
      id v14 = _CRKLogOperation_1();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[CRKHostResourcesOperation connection:didReceiveDataRequestWithURL:]((uint64_t)self, (uint64_t)v6, v14);
      }

      [v6 close];
    }
  }
}

void __69__CRKHostResourcesOperation_connection_didReceiveDataRequestWithURL___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = _CRKLogGeneral_9();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __69__CRKHostResourcesOperation_connection_didReceiveDataRequestWithURL___block_invoke_cold_1(a1, (uint64_t)v5, v6);
    }

    id v7 = (id *)(*(void *)(a1 + 48) + 440);
    if (*v7) {
      id v8 = *v7;
    }
    else {
      id v8 = v5;
    }
    objc_storeStrong(v7, v8);
    [*(id *)(a1 + 32) close];
  }
  else
  {
    [*(id *)(a1 + 48) serveItemAtURL:a2 toConnection:*(void *)(a1 + 32) forRequestURL:*(void *)(a1 + 40) originalItemURL:*(void *)(a1 + 56)];
  }
}

- (void)zipDirectoryAtURL:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"CRKHostResourcesOperation.m", 361, @"Invalid parameter not satisfying: %@", @"directoryURL" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  long long v20 = [MEMORY[0x263F08690] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"CRKHostResourcesOperation.m", 362, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  uint64_t v10 = [(NSMutableDictionary *)self->mZipOperationsByDirectoryURL objectForKeyedSubscript:v7];
  if (!v10)
  {
    uint64_t v11 = _CRKLogGeneral_9();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [v7 path];
      *(_DWORD *)buf = 138543362;
      uint64_t v25 = v12;
      _os_log_impl(&dword_224C00000, v11, OS_LOG_TYPE_DEFAULT, "Enqueueing zip operation for %{public}@", buf, 0xCu);
    }
    uint64_t v10 = [[CRKZipOperation alloc] initWithDirectoryURL:v7];
    [(CRKZipOperation *)v10 addTarget:self selector:sel_zipOperationDidFail_directoryURL_ forOperationEvents:4 userInfo:v7];
    id v13 = objc_msgSend(MEMORY[0x263F39C90], "crk_backgroundQueue");
    [v13 addOperation:v10];

    [(NSMutableDictionary *)self->mZipOperationsByDirectoryURL setObject:v10 forKeyedSubscript:v7];
  }
  id v14 = (void *)MEMORY[0x263F086D0];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __58__CRKHostResourcesOperation_zipDirectoryAtURL_completion___block_invoke;
  v21[3] = &unk_2646F3488;
  __int16 v22 = v10;
  id v23 = v9;
  id v15 = v10;
  id v16 = v9;
  id v17 = [v14 blockOperationWithBlock:v21];
  [v17 addDependency:v15];
  long long v18 = [MEMORY[0x263F08A48] mainQueue];
  [v18 addOperation:v17];
}

void __58__CRKHostResourcesOperation_zipDirectoryAtURL_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) resultObject];
  uint64_t v3 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);
}

- (void)zipOperationDidFail:(id)a3 directoryURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NSMutableDictionary *)self->mZipOperationsByDirectoryURL objectForKeyedSubscript:v7];

  if (v8 == v6)
  {
    id v9 = _CRKLogGeneral_9();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CRKHostResourcesOperation zipOperationDidFail:directoryURL:](v7, v6);
    }

    [(NSMutableDictionary *)self->mZipOperationsByDirectoryURL removeObjectForKey:v7];
  }
}

- (void)serveItemAtURL:(id)a3 toConnection:(id)a4 forRequestURL:(id)a5 originalItemURL:(id)a6
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = (objc_class *)MEMORY[0x263F08830];
  id v14 = a3;
  id v15 = (void *)[[v13 alloc] initWithFilePresenter:0];
  id v26 = 0;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __87__CRKHostResourcesOperation_serveItemAtURL_toConnection_forRequestURL_originalItemURL___block_invoke;
  v22[3] = &unk_2646F4E90;
  v22[4] = self;
  id v16 = v10;
  id v23 = v16;
  id v17 = v11;
  id v24 = v17;
  id v18 = v12;
  id v25 = v18;
  [v15 coordinateReadingItemAtURL:v14 options:8 error:&v26 byAccessor:v22];

  id v19 = (NSError *)v26;
  if (v19)
  {
    long long v20 = _CRKLogOperation_1();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      v28 = self;
      __int16 v29 = 2114;
      id v30 = v16;
      __int16 v31 = 2114;
      v32 = v19;
      __int16 v33 = 2114;
      id v34 = v17;
      _os_log_error_impl(&dword_224C00000, v20, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@: File coordinator error: %{public}@. Request URL: %{public}@", buf, 0x2Au);
    }

    if (self->mStashedError) {
      mStashedError = self->mStashedError;
    }
    else {
      mStashedError = v19;
    }
    objc_storeStrong((id *)&self->mStashedError, mStashedError);
    [v16 close];
  }
}

void __87__CRKHostResourcesOperation_serveItemAtURL_toConnection_forRequestURL_originalItemURL___block_invoke(uint64_t a1, void *a2)
{
  v31[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [MEMORY[0x263EFF950] inputStreamWithURL:v3];
  id v5 = [MEMORY[0x263F08850] defaultManager];
  id v6 = [v3 path];
  id v7 = [v5 attributesOfItemAtPath:v6 error:0];
  uint64_t v8 = [v7 fileSize];

  id v9 = _CRKLogOperation_1();
  id v10 = v9;
  if (v4 && v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = *(void *)(a1 + 40);
      id v13 = [*(id *)(a1 + 48) absoluteString];
      int v22 = 138544130;
      uint64_t v23 = v11;
      __int16 v24 = 2114;
      uint64_t v25 = v12;
      __int16 v26 = 2048;
      uint64_t v27 = v8;
      __int16 v28 = 2114;
      __int16 v29 = v13;
      _os_log_impl(&dword_224C00000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: Serving file with size %lu bytes for request URL %{public}@", (uint8_t *)&v22, 0x2Au);
    }
    [*(id *)(a1 + 40) sendDataWithStream:v4 length:v8 userInfo:*(void *)(a1 + 56)];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __87__CRKHostResourcesOperation_serveItemAtURL_toConnection_forRequestURL_originalItemURL___block_invoke_cold_1(a1, v3, v10);
    }

    uint64_t v14 = *(void *)(a1 + 32);
    id v15 = *(void **)(v14 + 440);
    if (v15)
    {
      id v16 = v15;
      id v17 = *(void **)(v14 + 440);
      *(void *)(v14 + 440) = v16;
    }
    else
    {
      id v30 = @"kCRKItemNameErrorKey";
      id v17 = [v3 path];
      v31[0] = v17;
      id v18 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];
      uint64_t v19 = CRKErrorWithCodeAndUserInfo(12, v18);
      uint64_t v20 = *(void *)(a1 + 32);
      long long v21 = *(void **)(v20 + 440);
      *(void *)(v20 + 440) = v19;
    }
    [*(id *)(a1 + 40) close];
  }
}

- (void)connection:(id)a3 didSendDataWithStream:(id)a4 userInfo:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  if ([(CRKHostResourcesOperation *)self isExecuting])
  {
    id v9 = _CRKLogOperation_1();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543874;
      id v13 = self;
      __int16 v14 = 2114;
      id v15 = v7;
      __int16 v16 = 2114;
      id v17 = v8;
      _os_log_impl(&dword_224C00000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ did send data with stream. File URL: %{public}@", (uint8_t *)&v12, 0x20u);
    }

    id v10 = [v7 description];
    [(CRKHostResourcesOperation *)self delegateDownloadFinished:v10 fileURL:v8 error:0];

    [(CRKHostResourcesOperation *)self incrementFinishedDownloadCountForFileURL:v8];
    uint64_t v11 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel_connectionCloseDidTimeout_ selector:v7 userInfo:0 repeats:30.0];
    [(NSMutableSet *)self->mConnectionCloseTimers addObject:v11];
  }
}

- (void)connectionCloseDidTimeout:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(CRKHostResourcesOperation *)self isExecuting])
  {
    [(NSMutableSet *)self->mConnectionCloseTimers removeObject:v4];
    id v5 = [v4 userInfo];
    if ([(NSMutableSet *)self->mConnections containsObject:v5])
    {
      id v6 = _CRKLogOperation_1();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 138543618;
        id v8 = self;
        __int16 v9 = 2114;
        id v10 = v5;
        _os_log_impl(&dword_224C00000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Connection close timer fired. Closing %{public}@", (uint8_t *)&v7, 0x16u);
      }

      [v5 close];
    }
  }
}

- (void)connection:(id)a3 didFailToSendDataWithStream:(id)a4 userInfo:(id)a5 error:(id)a6
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  if ([(CRKHostResourcesOperation *)self isExecuting])
  {
    int v12 = _CRKLogOperation_1();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      __int16 v14 = [v11 verboseDescription];
      int v15 = 138544130;
      __int16 v16 = self;
      __int16 v17 = 2114;
      id v18 = v9;
      __int16 v19 = 2114;
      id v20 = v10;
      __int16 v21 = 2114;
      int v22 = v14;
      _os_log_error_impl(&dword_224C00000, v12, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@ failed to send data with stream. File URL: %{public}@. Error: %{public}@", (uint8_t *)&v15, 0x2Au);
    }
    id v13 = [v9 description];
    [(CRKHostResourcesOperation *)self delegateDownloadFinished:v13 fileURL:v10 error:v11];

    [(CRKHostResourcesOperation *)self incrementFinishedDownloadCountForFileURL:v10];
    [v9 close];
  }
}

- (void)connection:(id)a3 didInterruptWithError:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([(CRKHostResourcesOperation *)self isExecuting])
  {
    id v8 = _CRKLogOperation_1();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = [v7 verboseDescription];
      int v10 = 138543874;
      id v11 = self;
      __int16 v12 = 2114;
      id v13 = v6;
      __int16 v14 = 2114;
      int v15 = v9;
      _os_log_error_impl(&dword_224C00000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Connection %{public}@ did interrupt with error: %{public}@", (uint8_t *)&v10, 0x20u);
    }
    [v6 close];
  }
}

- (void)connectionDidClose:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(CRKHostResourcesOperation *)self isExecuting])
  {
    id v5 = _CRKLogOperation_1();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543618;
      id v8 = self;
      __int16 v9 = 2114;
      id v10 = v4;
      _os_log_impl(&dword_224C00000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Connection %{public}@ did close", (uint8_t *)&v7, 0x16u);
    }

    [(NSMutableSet *)self->mConnections removeObject:v4];
    if (![(NSMutableSet *)self->mConnections count]
      && [(CRKHostResourcesOperation *)self allDownloadsFinished])
    {
      id v6 = _CRKLogOperation_1();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 138543362;
        id v8 = self;
        _os_log_impl(&dword_224C00000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: All downloads finished and all connections closed. Stopping net service.", (uint8_t *)&v7, 0xCu);
      }

      [(NSNetService *)self->mNetService stop];
    }
  }
}

- (CRKHostResourcesOperationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CRKHostResourcesOperationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isObservingIPAddress
{
  return self->_observingIPAddress;
}

- (void)setObservingIPAddress:(BOOL)a3
{
  self->_observingIPAddress = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->mZipOperationsByDirectoryURL, 0);
  objc_storeStrong((id *)&self->mStashedError, 0);
  objc_storeStrong((id *)&self->mConnectionCloseTimers, 0);
  objc_storeStrong((id *)&self->mConnections, 0);
  objc_storeStrong((id *)&self->mNetService, 0);
  objc_storeStrong((id *)&self->mFinishedDownloadCountByFileURL, 0);
  objc_storeStrong((id *)&self->mStartedDownloadCountByFileURL, 0);
  objc_storeStrong((id *)&self->mFileURLsByFilePath, 0);

  objc_storeStrong((id *)&self->mConfiguration, 0);
}

void __54__CRKHostResourcesOperation_netService_didNotPublish___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 verboseDescription];
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_1(&dword_224C00000, v3, v4, "%{public}@: Net service FAILED to publish. Error: %{public}@", v5, v6, v7, v8, v9);
}

- (void)connection:(os_log_t)log didReceiveDataRequestWithURL:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_224C00000, log, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@: download not allowed. Closing connection.", (uint8_t *)&v3, 0x16u);
}

void __69__CRKHostResourcesOperation_connection_didReceiveDataRequestWithURL___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = 138543874;
  uint64_t v6 = v3;
  __int16 v7 = 2114;
  uint64_t v8 = a2;
  __int16 v9 = 2114;
  uint64_t v10 = v4;
  _os_log_error_impl(&dword_224C00000, log, OS_LOG_TYPE_ERROR, "%{public}@: Zip error: %{public}@. Request URL: %{public}@", (uint8_t *)&v5, 0x20u);
}

- (void)zipOperationDidFail:(void *)a1 directoryURL:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v3 = [a1 path];
  uint64_t v4 = [a2 error];
  int v5 = [v4 verboseDescription];
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_1(&dword_224C00000, v6, v7, "Throwing away zip operation for directory %{public}@ because it failed with error: %{public}@", v8, v9, v10, v11, v12);
}

void __87__CRKHostResourcesOperation_serveItemAtURL_toConnection_forRequestURL_originalItemURL___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = [a2 path];
  uint64_t v8 = [*(id *)(a1 + 48) absoluteString];
  int v9 = 138544130;
  uint64_t v10 = v5;
  __int16 v11 = 2114;
  uint64_t v12 = v6;
  __int16 v13 = 2114;
  __int16 v14 = v7;
  __int16 v15 = 2114;
  uint64_t v16 = v8;
  _os_log_error_impl(&dword_224C00000, a3, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@: Could not create stream for resolved URL %{public}@. Request URL: %{public}@", (uint8_t *)&v9, 0x2Au);
}

@end