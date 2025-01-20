@interface CRKShowOpenDialogOperation
+ (id)fakeBundleID;
- (BOOL)isAsynchronous;
- (CRKFileSystemPrimitives)fileSystemPrimitives;
- (CRKSharingAirDropTransfer)transfer;
- (CRKSharingPrimitives)sharingPrimitives;
- (CRKShowOpenDialogOperation)initWithFileURLs:(id)a3 keepOriginalFiles:(BOOL)a4 previewImageData:(id)a5 senderName:(id)a6 autoAccept:(BOOL)a7;
- (CRKShowOpenDialogOperation)initWithFileURLs:(id)a3 keepOriginalFiles:(BOOL)a4 previewImageData:(id)a5 senderName:(id)a6 autoAccept:(BOOL)a7 sourceBundleIdentifier:(id)a8;
- (CRKShowOpenDialogOperation)initWithFileURLs:(id)a3 keepOriginalFiles:(BOOL)a4 previewImageData:(id)a5 senderName:(id)a6 autoAccept:(BOOL)a7 sourceBundleIdentifier:(id)a8 filesDescription:(id)a9;
- (CRKShowOpenDialogOperation)initWithFileURLs:(id)a3 keepOriginalFiles:(BOOL)a4 previewImageData:(id)a5 senderName:(id)a6 autoAccept:(BOOL)a7 sourceBundleIdentifier:(id)a8 filesDescription:(id)a9 cleanupDelay:(double)a10 sharingPrimitives:(id)a11 fileSystemPrimitives:(id)a12;
- (double)cleanupDelay;
- (void)cancel;
- (void)cleanupHiddenTransferItemsIfNeeded;
- (void)failWithError:(id)a3;
- (void)main;
- (void)setTransfer:(id)a3;
- (void)startTransfer;
- (void)succeedIfNeeded;
- (void)transferDidFinishWithSuccess:(BOOL)a3 destinationPath:(id)a4 error:(id)a5;
- (void)transferDidProgressWithSuccess:(BOOL)a3 destinationPath:(id)a4 error:(id)a5;
- (void)transferDidStartWithSuccess:(BOOL)a3 destinationPath:(id)a4 error:(id)a5;
- (void)transferWithIdentifierWasAccepted:(id)a3;
- (void)transferWithIdentifierWasDeclined:(id)a3 error:(id)a4;
@end

@implementation CRKShowOpenDialogOperation

- (CRKShowOpenDialogOperation)initWithFileURLs:(id)a3 keepOriginalFiles:(BOOL)a4 previewImageData:(id)a5 senderName:(id)a6 autoAccept:(BOOL)a7
{
  return [(CRKShowOpenDialogOperation *)self initWithFileURLs:a3 keepOriginalFiles:a4 previewImageData:a5 senderName:a6 autoAccept:a7 sourceBundleIdentifier:0];
}

- (CRKShowOpenDialogOperation)initWithFileURLs:(id)a3 keepOriginalFiles:(BOOL)a4 previewImageData:(id)a5 senderName:(id)a6 autoAccept:(BOOL)a7 sourceBundleIdentifier:(id)a8
{
  return [(CRKShowOpenDialogOperation *)self initWithFileURLs:a3 keepOriginalFiles:a4 previewImageData:a5 senderName:a6 autoAccept:a7 sourceBundleIdentifier:a8 filesDescription:0];
}

- (CRKShowOpenDialogOperation)initWithFileURLs:(id)a3 keepOriginalFiles:(BOOL)a4 previewImageData:(id)a5 senderName:(id)a6 autoAccept:(BOOL)a7 sourceBundleIdentifier:(id)a8 filesDescription:(id)a9
{
  BOOL v10 = a7;
  BOOL v13 = a4;
  id v16 = a9;
  id v17 = a8;
  id v18 = a6;
  id v19 = a5;
  id v20 = a3;
  v21 = objc_opt_new();
  v22 = objc_opt_new();
  v23 = [(CRKShowOpenDialogOperation *)self initWithFileURLs:v20 keepOriginalFiles:v13 previewImageData:v19 senderName:v18 autoAccept:v10 sourceBundleIdentifier:v17 filesDescription:10.0 cleanupDelay:v16 sharingPrimitives:v21 fileSystemPrimitives:v22];

  return v23;
}

- (CRKShowOpenDialogOperation)initWithFileURLs:(id)a3 keepOriginalFiles:(BOOL)a4 previewImageData:(id)a5 senderName:(id)a6 autoAccept:(BOOL)a7 sourceBundleIdentifier:(id)a8 filesDescription:(id)a9 cleanupDelay:(double)a10 sharingPrimitives:(id)a11 fileSystemPrimitives:(id)a12
{
  id v19 = a3;
  id v20 = a5;
  id v21 = a6;
  id v22 = a8;
  id v23 = a9;
  id v39 = a11;
  id v38 = a12;
  if (![v19 count])
  {
    v35 = [MEMORY[0x263F08690] currentHandler];
    [v35 handleFailureInMethod:a2 object:self file:@"CRKShowOpenDialogOperation.m" lineNumber:107 description:@"empty set of URLs"];
  }
  v40.receiver = self;
  v40.super_class = (Class)CRKShowOpenDialogOperation;
  v24 = [(CRKShowOpenDialogOperation *)&v40 init];
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->mURLs, a3);
    v25->mKeepOriginalFiles = a4;
    uint64_t v26 = [v20 copy];
    mPreviewImageData = v25->mPreviewImageData;
    v25->mPreviewImageData = (NSData *)v26;

    uint64_t v28 = [v21 copy];
    mSenderName = v25->mSenderName;
    v25->mSenderName = (NSString *)v28;

    v25->mAutoAccept = a7;
    uint64_t v30 = [v22 copy];
    mSourceBundleIdentifier = v25->mSourceBundleIdentifier;
    v25->mSourceBundleIdentifier = (NSString *)v30;

    uint64_t v32 = [v23 copy];
    mFilesDescription = v25->mFilesDescription;
    v25->mFilesDescription = (NSString *)v32;

    v25->_cleanupDelay = a10;
    objc_storeStrong((id *)&v25->_sharingPrimitives, a11);
    objc_storeStrong((id *)&v25->_fileSystemPrimitives, a12);
  }

  return v25;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)CRKShowOpenDialogOperation;
  [(CRKShowOpenDialogOperation *)&v4 cancel];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __36__CRKShowOpenDialogOperation_cancel__block_invoke;
  v3[3] = &unk_2646F35C0;
  v3[4] = self;
  objc_msgSend(MEMORY[0x263EFF9F0], "cat_performBlockOnMainRunLoop:", v3);
}

void __36__CRKShowOpenDialogOperation_cancel__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isExecuting])
  {
    v2 = *(void **)(a1 + 32);
    CATErrorWithCodeAndUserInfo();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [v2 failWithError:v3];
  }
}

- (void)main
{
}

- (void)startTransfer
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_224C00000, a2, OS_LOG_TYPE_ERROR, "%{public}@: Invalid item", (uint8_t *)&v2, 0xCu);
}

void __43__CRKShowOpenDialogOperation_startTransfer__block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  id v10 = a4;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (a3) {
    [WeakRetained transferWithIdentifierWasAccepted:v7];
  }
  else {
    [WeakRetained transferWithIdentifierWasDeclined:v7 error:v10];
  }
}

uint64_t __43__CRKShowOpenDialogOperation_startTransfer__block_invoke_27(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) transferDidStartWithSuccess:a2 destinationPath:a3 error:a4];
}

- (void)transferDidStartWithSuccess:(BOOL)a3 destinationPath:(id)a4 error:(id)a5
{
  BOOL v7 = a3;
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v42 = a4;
  id v10 = a5;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    v37 = [MEMORY[0x263F08690] currentHandler];
    id v38 = NSStringFromSelector(a2);
    [v37 handleFailureInMethod:a2, self, @"CRKShowOpenDialogOperation.m", 186, @"%@ must be called from the main thread", v38 object file lineNumber description];
  }
  if ([(CRKShowOpenDialogOperation *)self isExecuting])
  {
    v11 = _CRKLogOperation();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      v53 = self;
      __int16 v54 = 1024;
      BOOL v55 = v7;
      __int16 v56 = 2114;
      id v57 = v42;
      __int16 v58 = 2114;
      id v59 = v10;
      _os_log_impl(&dword_224C00000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Transfer did start. success: %d, destination: %{public}@, error: %{public}@", buf, 0x26u);
    }

    if (v7)
    {
      objc_storeStrong((id *)&self->mTransferDirectoryURL, a4);
      id v39 = objc_opt_new();
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      v12 = [(CRKShowOpenDialogOperation *)self transfer];
      BOOL v13 = [v12 fileURLs];

      id obj = v13;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v47 objects:v51 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v41 = *(void *)v48;
        while (2)
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v48 != v41) {
              objc_enumerationMutation(obj);
            }
            id v17 = *(void **)(*((void *)&v47 + 1) + 8 * v16);
            id v18 = v42;
            if (CRKIsiOS())
            {
              id v19 = [MEMORY[0x263F08C38] UUID];
              id v20 = [v19 UUIDString];
              uint64_t v21 = [v18 URLByAppendingPathComponent:v20];

              id v18 = (id)v21;
            }
            id v22 = [(CRKShowOpenDialogOperation *)self fileSystemPrimitives];
            id v46 = v10;
            int v23 = [v22 makeDirectoryAtURL:v18 error:&v46];
            id v24 = v46;

            if (!v23)
            {
              [(CRKShowOpenDialogOperation *)self failWithError:v24];

              id v10 = v24;
              v33 = v39;
              goto LABEL_26;
            }
            v25 = [MEMORY[0x263F08850] defaultManager];
            uint64_t v26 = [v17 lastPathComponent];
            v27 = [v18 URLByAppendingPathComponent:v26];
            uint64_t v28 = objc_msgSend(v25, "crk_collisionAvoidingURLForURL:", v27);

            LODWORD(v25) = self->mKeepOriginalFiles;
            v29 = [(CRKShowOpenDialogOperation *)self fileSystemPrimitives];
            uint64_t v30 = v29;
            if (v25)
            {
              id v45 = v24;
              char v31 = [v29 copyItemAtURL:v17 toURL:v28 error:&v45];
              uint64_t v32 = v45;
            }
            else
            {
              id v44 = v24;
              char v31 = [v29 moveItemAtURL:v17 toURL:v28 error:&v44];
              uint64_t v32 = v44;
            }
            id v10 = v32;

            if (v31) {
              [v39 addObject:v28];
            }
            else {
              [(CRKShowOpenDialogOperation *)self failWithError:v10];
            }

            ++v16;
          }
          while (v15 != v16);
          uint64_t v15 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }

      v33 = v39;
      v34 = (void *)[v39 copy];
      v35 = [(CRKShowOpenDialogOperation *)self transfer];
      [v35 setDestFileURLs:v34];

      v36 = [(CRKShowOpenDialogOperation *)self transfer];
      v43[0] = MEMORY[0x263EF8330];
      v43[1] = 3221225472;
      v43[2] = __80__CRKShowOpenDialogOperation_transferDidStartWithSuccess_destinationPath_error___block_invoke;
      v43[3] = &unk_2646F4AD0;
      v43[4] = self;
      [v36 updateWithState:2 completion:v43];

LABEL_26:
    }
    else
    {
      [(CRKShowOpenDialogOperation *)self failWithError:v10];
    }
  }
}

uint64_t __80__CRKShowOpenDialogOperation_transferDidStartWithSuccess_destinationPath_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) transferDidProgressWithSuccess:a2 destinationPath:a3 error:a4];
}

- (void)transferDidProgressWithSuccess:(BOOL)a3 destinationPath:(id)a4 error:(id)a5
{
  BOOL v6 = a3;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    id v17 = [MEMORY[0x263F08690] currentHandler];
    id v18 = NSStringFromSelector(a2);
    [v17 handleFailureInMethod:a2, self, @"CRKShowOpenDialogOperation.m", 244, @"%@ must be called from the main thread", v18 object file lineNumber description];
  }
  if ([(CRKShowOpenDialogOperation *)self isExecuting])
  {
    v11 = _CRKLogOperation();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      id v22 = self;
      __int16 v23 = 1024;
      *(_DWORD *)id v24 = v6;
      *(_WORD *)&v24[4] = 2114;
      *(void *)&v24[6] = v9;
      *(_WORD *)&v24[14] = 2114;
      *(void *)&v24[16] = v10;
      _os_log_impl(&dword_224C00000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Transfer did progress: success: %d, destination: %{public}@, error: %{public}@", buf, 0x26u);
    }

    if (v6)
    {
      v12 = _CRKLogOperation();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v13 = [(CRKShowOpenDialogOperation *)self transfer];
        uint64_t v14 = [v13 identifier];
        uint64_t v15 = [(CRKShowOpenDialogOperation *)self transfer];
        *(_DWORD *)buf = 138543874;
        id v22 = self;
        __int16 v23 = 2114;
        *(void *)id v24 = v14;
        *(_WORD *)&v24[8] = 2114;
        *(void *)&v24[10] = v15;
        _os_log_impl(&dword_224C00000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Finishing transfer. Identifier: %{public}@. Info: %{public}@", buf, 0x20u);
      }
      uint64_t v16 = [(CRKShowOpenDialogOperation *)self transfer];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __83__CRKShowOpenDialogOperation_transferDidProgressWithSuccess_destinationPath_error___block_invoke;
      v19[3] = &unk_2646F4AF8;
      v19[4] = self;
      id v20 = v9;
      [v16 updateWithState:5 completion:v19];
    }
    else
    {
      [(CRKShowOpenDialogOperation *)self failWithError:v10];
    }
  }
}

uint64_t __83__CRKShowOpenDialogOperation_transferDidProgressWithSuccess_destinationPath_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) transferDidFinishWithSuccess:a2 destinationPath:*(void *)(a1 + 40) error:a4];
}

- (void)transferDidFinishWithSuccess:(BOOL)a3 destinationPath:(id)a4 error:(id)a5
{
  BOOL v6 = a3;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    BOOL v13 = NSStringFromSelector(a2);
    [v12 handleFailureInMethod:a2, self, @"CRKShowOpenDialogOperation.m", 266, @"%@ must be called from the main thread", v13 object file lineNumber description];
  }
  if ([(CRKShowOpenDialogOperation *)self isExecuting])
  {
    v11 = _CRKLogOperation();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      uint64_t v15 = self;
      __int16 v16 = 1024;
      BOOL v17 = v6;
      __int16 v18 = 2114;
      id v19 = v9;
      __int16 v20 = 2114;
      id v21 = v10;
      _os_log_impl(&dword_224C00000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Transfer did finish. success: %d, destination: %{public}@, error: %{public}@", buf, 0x26u);
    }

    if (v6)
    {
      self->mTransferFinished = 1;
      [(CRKShowOpenDialogOperation *)self succeedIfNeeded];
    }
    else
    {
      [(CRKShowOpenDialogOperation *)self failWithError:v10];
    }
  }
}

- (void)transferWithIdentifierWasAccepted:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    v27 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v28 = NSStringFromSelector(a2);
    [v27 handleFailureInMethod:a2, self, @"CRKShowOpenDialogOperation.m", 287, @"%@ must be called from the main thread", v28 object file lineNumber description];
  }
  if ([(CRKShowOpenDialogOperation *)self isExecuting])
  {
    BOOL v6 = _CRKLogOperation();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v41 = self;
      __int16 v42 = 2114;
      id v43 = v5;
      _os_log_impl(&dword_224C00000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Transfer with identifier %{public}@ ACCEPTED", buf, 0x16u);
    }

    if (CRKIsOSX())
    {
      id v29 = v5;
      BOOL v7 = (void *)MEMORY[0x263EFF9C0];
      v8 = [(CRKShowOpenDialogOperation *)self transfer];
      id v9 = [v8 destFileURLs];
      char v31 = objc_msgSend(v7, "setWithCapacity:", objc_msgSend(v9, "count"));

      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      uint64_t v32 = self;
      id v10 = [(CRKShowOpenDialogOperation *)self transfer];
      v11 = [v10 destFileURLs];

      id obj = v11;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v36;
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v36 != v14) {
              objc_enumerationMutation(obj);
            }
            __int16 v16 = *(void **)(*((void *)&v35 + 1) + 8 * i);
            BOOL v17 = [v16 URLByDeletingLastPathComponent];
            [v31 addObject:v17];
            __int16 v18 = [v16 lastPathComponent];
            id v19 = [v17 URLByDeletingLastPathComponent];
            __int16 v20 = [MEMORY[0x263F08850] defaultManager];
            uint64_t v21 = [v19 URLByAppendingPathComponent:v18];
            uint64_t v22 = objc_msgSend(v20, "crk_collisionAvoidingURLForURL:", v21);

            __int16 v23 = [(CRKShowOpenDialogOperation *)v32 fileSystemPrimitives];
            id v34 = 0;
            LOBYTE(v21) = [v23 copyItemAtURL:v16 toURL:v22 error:&v34];
            id v24 = v34;

            if ((v21 & 1) == 0)
            {
              [(CRKShowOpenDialogOperation *)v32 failWithError:v24];

              id v5 = v29;
              goto LABEL_18;
            }
          }
          uint64_t v13 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }

      self = v32;
      [(CRKShowOpenDialogOperation *)v32 cleanupDelay];
      dispatch_time_t v26 = dispatch_time(0, (uint64_t)(v25 * 1000000000.0));
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __64__CRKShowOpenDialogOperation_transferWithIdentifierWasAccepted___block_invoke;
      block[3] = &unk_2646F35C0;
      block[4] = v32;
      dispatch_after(v26, MEMORY[0x263EF83A0], block);

      id v5 = v29;
    }
    self->mTransferAccepted = 1;
    [(CRKShowOpenDialogOperation *)self succeedIfNeeded];
  }
LABEL_18:
}

uint64_t __64__CRKShowOpenDialogOperation_transferWithIdentifierWasAccepted___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cleanupHiddenTransferItemsIfNeeded];
}

- (void)transferWithIdentifierWasDeclined:(id)a3 error:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    uint64_t v13 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v14 = NSStringFromSelector(a2);
    [v13 handleFailureInMethod:a2, self, @"CRKShowOpenDialogOperation.m", 330, @"%@ must be called from the main thread", v14 object file lineNumber description];
  }
  if ([(CRKShowOpenDialogOperation *)self isExecuting])
  {
    id v9 = [v8 domain];
    id v10 = @"UNABLE TO OPEN";
    if ([v9 isEqualToString:@"ClassroomKit.error"]
      && [v8 code] == 18)
    {
      id v10 = @"DECLINED";
    }
    v11 = v10;

    uint64_t v12 = _CRKLogOperation();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      __int16 v16 = self;
      __int16 v17 = 2114;
      id v18 = v7;
      __int16 v19 = 2114;
      __int16 v20 = v11;
      _os_log_impl(&dword_224C00000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Transfer with identifier %{public}@ %{public}@", buf, 0x20u);
    }

    [(CRKShowOpenDialogOperation *)self failWithError:v8];
  }
}

- (void)cleanupHiddenTransferItemsIfNeeded
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v4 = *a1;
  id v5 = a2;
  BOOL v6 = [a3 verboseDescription];
  int v7 = 138543618;
  uint64_t v8 = v4;
  __int16 v9 = 2114;
  id v10 = v6;
  _os_log_error_impl(&dword_224C00000, v5, OS_LOG_TYPE_ERROR, "Unable to cleanup directory: %{public}@: %{public}@", (uint8_t *)&v7, 0x16u);
}

- (void)succeedIfNeeded
{
  if (([(CRKShowOpenDialogOperation *)self isExecuting] & 1) == 0)
  {
    id v5 = [MEMORY[0x263F08690] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"CRKShowOpenDialogOperation.m" lineNumber:356 description:@"Not executing"];
  }
  if (self->mTransferAccepted && self->mTransferFinished)
  {
    uint64_t v4 = [(CRKShowOpenDialogOperation *)self transfer];
    [v4 invalidate];

    [(CRKShowOpenDialogOperation *)self endOperationWithResultObject:0];
  }
}

- (void)failWithError:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    __int16 v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"CRKShowOpenDialogOperation.m", 365, @"Invalid parameter not satisfying: %@", @"failureError" object file lineNumber description];
  }
  if (([(CRKShowOpenDialogOperation *)self isExecuting] & 1) == 0)
  {
    id v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"CRKShowOpenDialogOperation.m" lineNumber:366 description:@"Not executing"];
  }
  [(CRKShowOpenDialogOperation *)self cleanupHiddenTransferItemsIfNeeded];
  BOOL v6 = _CRKLogOperation();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    [(CRKShowOpenDialogOperation *)(uint64_t)self failWithError:v6];
  }

  int v7 = [(CRKShowOpenDialogOperation *)self transfer];

  if (v7)
  {
    uint64_t v8 = [(CRKShowOpenDialogOperation *)self transfer];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __44__CRKShowOpenDialogOperation_failWithError___block_invoke;
    v11[3] = &unk_2646F4B20;
    SEL v13 = a2;
    v11[4] = self;
    id v12 = v5;
    [v8 updateWithState:3 completion:v11];
  }
  else
  {
    [(CRKShowOpenDialogOperation *)self endOperationWithError:v5];
  }
}

void __44__CRKShowOpenDialogOperation_failWithError___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    id v12 = [MEMORY[0x263F08690] currentHandler];
    SEL v13 = *(const char **)(a1 + 48);
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v15 = NSStringFromSelector(v13);
    [v12 handleFailureInMethod:v13, v14, @"CRKShowOpenDialogOperation.m", 378, @"%@ must be called from the main thread", v15 object file lineNumber description];
  }
  if ([*(id *)(a1 + 32) isExecuting])
  {
    __int16 v9 = _CRKLogOperation();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138544130;
      uint64_t v17 = v10;
      __int16 v18 = 1024;
      int v19 = a2;
      __int16 v20 = 2114;
      id v21 = v7;
      __int16 v22 = 2114;
      id v23 = v8;
      _os_log_impl(&dword_224C00000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Transfer canceled: success: %d, destination: %{public}@, error: %{public}@", buf, 0x26u);
    }

    uint64_t v11 = [*(id *)(a1 + 32) transfer];
    [v11 invalidate];

    [*(id *)(a1 + 32) endOperationWithError:*(void *)(a1 + 40)];
  }
}

+ (id)fakeBundleID
{
  int v2 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v3 = [v2 bundleIdentifier];
  uint64_t v4 = [v3 stringByAppendingString:@".fake"];

  return v4;
}

- (double)cleanupDelay
{
  return self->_cleanupDelay;
}

- (CRKSharingPrimitives)sharingPrimitives
{
  return self->_sharingPrimitives;
}

- (CRKFileSystemPrimitives)fileSystemPrimitives
{
  return self->_fileSystemPrimitives;
}

- (CRKSharingAirDropTransfer)transfer
{
  return self->_transfer;
}

- (void)setTransfer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transfer, 0);
  objc_storeStrong((id *)&self->_fileSystemPrimitives, 0);
  objc_storeStrong((id *)&self->_sharingPrimitives, 0);
  objc_storeStrong((id *)&self->mTransferDirectoryURL, 0);
  objc_storeStrong((id *)&self->mFilesDescription, 0);
  objc_storeStrong((id *)&self->mSourceBundleIdentifier, 0);
  objc_storeStrong((id *)&self->mSenderName, 0);
  objc_storeStrong((id *)&self->mPreviewImageData, 0);

  objc_storeStrong((id *)&self->mURLs, 0);
}

- (void)failWithError:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_224C00000, log, OS_LOG_TYPE_ERROR, "%{public}@: Failed. Error: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end