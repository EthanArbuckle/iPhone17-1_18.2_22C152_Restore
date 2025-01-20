@interface CRKDownloadResourcesOperation
- (BOOL)isAsynchronous;
- (CRKDownloadResourcesOperation)initWithResources:(id)a3 clientIdentity:(id)a4 trustedAnchorCertificates:(id)a5;
- (CRKDownloadResourcesOperation)initWithResources:(id)a3 clientIdentity:(id)a4 trustedCertificates:(id)a5;
- (CRKIdentity)clientIdentity;
- (NSArray)resources;
- (NSArray)trustedCertificates;
- (NSURLCredential)credential;
- (id)moveURLToNonEphemeralLocation:(id)a3 withFileName:(id)a4 error:(id *)a5;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)cancel;
- (void)cancelIfNeeded;
- (void)finalizeDownloadedItem:(id)a3 forRequestURL:(id)a4;
- (void)main;
- (void)operationWillFinish;
- (void)run;
- (void)unzipOperationDidFinish:(id)a3 forRequestURL:(id)a4;
@end

@implementation CRKDownloadResourcesOperation

- (CRKDownloadResourcesOperation)initWithResources:(id)a3 clientIdentity:(id)a4 trustedCertificates:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v26.receiver = self;
  v26.super_class = (Class)CRKDownloadResourcesOperation;
  v11 = [(CRKDownloadResourcesOperation *)&v26 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    resources = v11->_resources;
    v11->_resources = (NSArray *)v12;

    uint64_t v14 = [v10 copy];
    trustedCertificates = v11->_trustedCertificates;
    v11->_trustedCertificates = (NSArray *)v14;

    objc_storeStrong((id *)&v11->_clientIdentity, a4);
    uint64_t v16 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    mFileURLs = v11->mFileURLs;
    v11->mFileURLs = (NSMutableArray *)v16;

    uint64_t v18 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    mCompletedUnitCounts = v11->mCompletedUnitCounts;
    v11->mCompletedUnitCounts = (NSMutableArray *)v18;

    v20 = [MEMORY[0x263EFC648] ephemeralSessionConfiguration];
    [v20 setDiscretionary:1];
    [v20 setHTTPMaximumConnectionsPerHost:1];
    [v20 setTimeoutIntervalForRequest:60.0];
    v21 = (void *)MEMORY[0x263EFC640];
    v22 = [MEMORY[0x263F08A48] mainQueue];
    uint64_t v23 = [v21 sessionWithConfiguration:v20 delegate:v11 delegateQueue:v22];
    mSession = v11->mSession;
    v11->mSession = (NSURLSession *)v23;
  }
  return v11;
}

- (CRKDownloadResourcesOperation)initWithResources:(id)a3 clientIdentity:(id)a4 trustedAnchorCertificates:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [[CRKConcreteIdentity alloc] initWithIdentity:v9];

  uint64_t v12 = objc_msgSend(v8, "crk_mapUsingBlock:", &__block_literal_global_70);

  v13 = [(CRKDownloadResourcesOperation *)self initWithResources:v10 clientIdentity:v11 trustedCertificates:v12];
  return v13;
}

CRKConcreteCertificate *__92__CRKDownloadResourcesOperation_initWithResources_clientIdentity_trustedAnchorCertificates___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[CRKConcreteCertificate alloc] initWithCertificate:v2];

  return v3;
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
  uint64_t v32 = *MEMORY[0x263EF8340];
  v3 = [(CRKDownloadResourcesOperation *)self resources];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v5 = (NSArray *)objc_opt_new();
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id obj = [(CRKDownloadResourcesOperation *)self resources];
    uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v6)
    {
      uint64_t v8 = v6;
      uint64_t v9 = *(void *)v24;
      *(void *)&long long v7 = 138543618;
      long long v21 = v7;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(obj);
          }
          v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          mSession = self->mSession;
          v13 = objc_msgSend(v11, "hostedURL", v21);
          uint64_t v14 = [(NSURLSession *)mSession downloadTaskWithURL:v13];

          v15 = [v11 hostedURL];
          uint64_t v16 = [v15 absoluteString];
          [v14 setTaskDescription:v16];

          [v14 resume];
          [(NSMutableArray *)self->mCompletedUnitCounts addObject:&unk_26D81A288];
          [(NSArray *)v5 addObject:v14];
          v17 = _CRKLogOperation_0();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v21;
            v28 = self;
            __int16 v29 = 2114;
            v30 = v11;
            _os_log_impl(&dword_224C00000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: Downloading %{public}@", buf, 0x16u);
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v8);
    }

    mDownloadTasks = self->mDownloadTasks;
    self->mDownloadTasks = v5;

    v19 = [(CRKDownloadResourcesOperation *)self resources];
    -[CRKDownloadResourcesOperation setTotalUnitCount:](self, "setTotalUnitCount:", 1000 * [v19 count]);
  }
  else
  {
    uint64_t v20 = MEMORY[0x263EFFA68];
    [(CRKDownloadResourcesOperation *)self endOperationWithResultObject:v20];
  }
}

- (void)cancel
{
  v3.receiver = self;
  v3.super_class = (Class)CRKDownloadResourcesOperation;
  [(CRKDownloadResourcesOperation *)&v3 cancel];
  [(CRKDownloadResourcesOperation *)self performSelectorOnMainThread:sel_cancelIfNeeded withObject:0 waitUntilDone:0];
}

- (void)cancelIfNeeded
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    uint64_t v4 = [MEMORY[0x263F08690] currentHandler];
    v5 = NSStringFromSelector(a2);
    [v4 handleFailureInMethod:a2, self, @"CRKDownloadResourcesOperation.m", 110, @"%@ must be called from the main thread", v5 object file lineNumber description];
  }
  if ([(CRKDownloadResourcesOperation *)self isExecuting])
  {
    CATErrorWithCodeAndUserInfo();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [(CRKDownloadResourcesOperation *)self endOperationWithError:v6];
  }
}

- (void)operationWillFinish
{
  v3.receiver = self;
  v3.super_class = (Class)CRKDownloadResourcesOperation;
  [(CRKDownloadResourcesOperation *)&v3 operationWillFinish];
  [(NSURLSession *)self->mSession invalidateAndCancel];
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v8 = (void (**)(id, void, void *))a6;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
    v13 = NSStringFromSelector(a2);
    [v12 handleFailureInMethod:a2, self, @"CRKDownloadResourcesOperation.m", 124, @"%@ must be called from the main thread", v13 object file lineNumber description];
  }
  uint64_t v9 = _CRKLogOperation_0();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v15 = self;
    _os_log_impl(&dword_224C00000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Did receive authentication challenge", buf, 0xCu);
  }

  if ([(CRKDownloadResourcesOperation *)self isExecuting]
    && ([(CRKDownloadResourcesOperation *)self credential],
        id v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v10))
  {
    v11 = [(CRKDownloadResourcesOperation *)self credential];
    v8[2](v8, 0, v11);
  }
  else
  {
    v8[2](v8, 2, 0);
  }
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v10 = a4;
  v11 = _CRKLogOperation_0();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [v10 taskDescription];
    v13 = [NSNumber numberWithDouble:(double)a6 / (double)a7];
    *(_DWORD *)buf = 138543874;
    __int16 v29 = self;
    __int16 v30 = 2114;
    v31 = v12;
    __int16 v32 = 2114;
    v33 = v13;
    _os_log_impl(&dword_224C00000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Download of %{public}@ did progress %{public}@", buf, 0x20u);
  }
  NSUInteger v14 = [(NSArray *)self->mDownloadTasks indexOfObject:v10];
  if (v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v15 = v14;
    uint64_t v16 = [NSNumber numberWithLongLong:1000 * a6 / a7];
    [(NSMutableArray *)self->mCompletedUnitCounts setObject:v16 atIndexedSubscript:v15];
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v17 = self->mCompletedUnitCounts;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = 0;
    uint64_t v21 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(v17);
        }
        v20 += objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "unsignedIntegerValue", (void)v23);
      }
      uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v19);
  }
  else
  {
    uint64_t v20 = 0;
  }

  [(CRKDownloadResourcesOperation *)self setCompletedUnitCount:v20];
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v7 = a5;
  uint64_t v8 = NSURL;
  id v9 = a4;
  id v10 = [v9 taskDescription];
  v11 = [v8 URLWithString:v10];

  uint64_t v12 = [MEMORY[0x263F08850] defaultManager];
  v13 = [v7 path];
  NSUInteger v14 = [v12 attributesOfItemAtPath:v13 error:0];
  uint64_t v15 = [v14 fileSize];

  uint64_t v16 = _CRKLogOperation_0();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v27 = self;
    __int16 v28 = 2114;
    __int16 v29 = v11;
    __int16 v30 = 2048;
    uint64_t v31 = v15;
    _os_log_impl(&dword_224C00000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: Download task did finish downloading url %{public}@. File size: %lu bytes", buf, 0x20u);
  }

  v17 = [(CRKDownloadResourcesOperation *)self resources];
  NSUInteger v18 = [(NSArray *)self->mDownloadTasks indexOfObject:v9];

  uint64_t v19 = [v17 objectAtIndexedSubscript:v18];

  if ([v19 isZippedBundle])
  {
    id v25 = 0;
    uint64_t v20 = [(CRKDownloadResourcesOperation *)self moveURLToNonEphemeralLocation:v7 withFileName:0 error:&v25];
    id v21 = v25;
    if (v20)
    {
      v22 = _CRKLogGeneral_8();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v27 = v11;
        _os_log_impl(&dword_224C00000, v22, OS_LOG_TYPE_DEFAULT, "Unzipping %{public}@", buf, 0xCu);
      }

      long long v23 = [[CRKUnzipOperation alloc] initWithZipFileURL:v20];
      [(CRKUnzipOperation *)v23 addTarget:self selector:sel_unzipOperationDidFinish_forRequestURL_ forOperationEvents:6 userInfo:v11];
      long long v24 = objc_msgSend(MEMORY[0x263F39C90], "crk_backgroundQueue");
      [v24 addOperation:v23];
    }
    else
    {
      [(CRKDownloadResourcesOperation *)self endOperationWithError:v21];
    }
  }
  else
  {
    [(CRKDownloadResourcesOperation *)self finalizeDownloadedItem:v7 forRequestURL:v11];
  }
}

- (id)moveURLToNonEphemeralLocation:(id)a3 withFileName:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_msgSend(NSURL, "crk_uniqueTemporaryDirectoryURL");
  id v10 = [MEMORY[0x263F08850] defaultManager];
  int v11 = [v10 createDirectoryAtURL:v9 withIntermediateDirectories:1 attributes:0 error:a5];

  id v12 = 0;
  if (v11)
  {
    if (v8)
    {
      v13 = [v9 URLByAppendingPathComponent:v8];
    }
    else
    {
      NSUInteger v14 = [v7 lastPathComponent];
      v13 = [v9 URLByAppendingPathComponent:v14];
    }
    uint64_t v15 = [MEMORY[0x263F08850] defaultManager];
    int v16 = [v15 moveItemAtURL:v7 toURL:v13 error:a5];

    if (v16) {
      id v12 = v13;
    }
    else {
      id v12 = 0;
    }
  }

  return v12;
}

- (void)unzipOperationDidFinish:(id)a3 forRequestURL:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 error];

  if (v8)
  {
    id v9 = [v7 error];

    [(CRKDownloadResourcesOperation *)self endOperationWithError:v9];
  }
  else
  {
    id v9 = [v7 resultObject];

    id v10 = [MEMORY[0x263F08850] defaultManager];
    id v14 = 0;
    int v11 = [v10 contentsOfDirectoryAtURL:v9 includingPropertiesForKeys:0 options:4 error:&v14];
    id v12 = v14;

    if (v11)
    {
      if ([v11 count] == 1)
      {
        v13 = [v11 firstObject];
        [(CRKDownloadResourcesOperation *)self finalizeDownloadedItem:v13 forRequestURL:v6];
      }
      else
      {
        v13 = CRKErrorWithCodeAndUserInfo(22, 0);
        [(CRKDownloadResourcesOperation *)self endOperationWithError:v13];
      }
    }
    else
    {
      [(CRKDownloadResourcesOperation *)self endOperationWithError:v12];
    }
  }
}

- (void)finalizeDownloadedItem:(id)a3 forRequestURL:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([(CRKDownloadResourcesOperation *)self isExecuting])
  {
    id v8 = [v7 lastPathComponent];
    id v20 = 0;
    id v9 = [(CRKDownloadResourcesOperation *)self moveURLToNonEphemeralLocation:v6 withFileName:v8 error:&v20];
    id v10 = v20;

    if (v9)
    {
      [(NSMutableArray *)self->mFileURLs addObject:v9];
      int v11 = _CRKLogGeneral_8();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v22 = v7;
        _os_log_impl(&dword_224C00000, v11, OS_LOG_TYPE_DEFAULT, "Finalized downloaded item for request URL %{public}@", buf, 0xCu);
      }

      uint64_t v12 = [(NSMutableArray *)self->mFileURLs count];
      v13 = [(CRKDownloadResourcesOperation *)self resources];
      uint64_t v14 = [v13 count];

      if (v12 == v14)
      {
        [(CRKDownloadResourcesOperation *)self endOperationWithResultObject:self->mFileURLs];
      }
      else
      {
        uint64_t v15 = [(CRKDownloadResourcesOperation *)self resources];
        uint64_t v16 = [v15 count];
        uint64_t v17 = [(NSMutableArray *)self->mFileURLs count];

        NSUInteger v18 = _CRKLogGeneral_8();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v19 = [NSNumber numberWithInteger:v16 - v17];
          *(_DWORD *)buf = 138543362;
          id v22 = v19;
          _os_log_impl(&dword_224C00000, v18, OS_LOG_TYPE_DEFAULT, "Not ending the operation because there are %{public}@ items yet to be finalized", buf, 0xCu);
        }
      }
    }
    else
    {
      [(CRKDownloadResourcesOperation *)self endOperationWithError:v10];
    }
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9 && [(CRKDownloadResourcesOperation *)self isExecuting]) {
    [(CRKDownloadResourcesOperation *)self endOperationWithError:v9];
  }
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v5 = a4;
  if ([(CRKDownloadResourcesOperation *)self isExecuting]) {
    [(CRKDownloadResourcesOperation *)self endOperationWithError:v5];
  }
}

- (NSURLCredential)credential
{
  credential = self->_credential;
  if (credential)
  {
    objc_super v3 = credential;
  }
  else
  {
    id v5 = [(CRKDownloadResourcesOperation *)self trustedCertificates];
    id v6 = objc_msgSend(v5, "crk_mapUsingBlock:", &__block_literal_global_30);

    if ([v6 count])
    {
      id v7 = (void *)MEMORY[0x263EFC610];
      id v8 = [(CRKDownloadResourcesOperation *)self clientIdentity];
      objc_msgSend(v7, "credentialWithIdentity:certificates:persistence:", objc_msgSend(v8, "underlyingIdentity"), v6, 0);
      id v9 = (NSURLCredential *)objc_claimAutoreleasedReturnValue();

      id v10 = self->_credential;
      self->_credential = v9;
      int v11 = v9;

      objc_super v3 = self->_credential;
    }
    else
    {
      objc_super v3 = 0;
    }
  }

  return v3;
}

uint64_t __43__CRKDownloadResourcesOperation_credential__block_invoke(int a1, id a2)
{
  id v2 = a2;

  return [v2 underlyingCertificate];
}

- (NSArray)resources
{
  return self->_resources;
}

- (CRKIdentity)clientIdentity
{
  return self->_clientIdentity;
}

- (NSArray)trustedCertificates
{
  return self->_trustedCertificates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trustedCertificates, 0);
  objc_storeStrong((id *)&self->_clientIdentity, 0);
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_credential, 0);
  objc_storeStrong((id *)&self->mCompletedUnitCounts, 0);
  objc_storeStrong((id *)&self->mFileURLs, 0);
  objc_storeStrong((id *)&self->mDownloadTasks, 0);

  objc_storeStrong((id *)&self->mSession, 0);
}

@end