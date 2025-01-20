@interface WFiCloudFileDownloadOperation
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (BOOL)retrieveFolderContents;
- (NSArray)downloadedFiles;
- (NSError)downloadError;
- (NSFileCoordinator)fileCoordinator;
- (NSProgress)progress;
- (NSURL)fileURL;
- (WFiCloudFileDownloadOperation)initWithFileURL:(id)a3 retrieveFolderContents:(BOOL)a4 progress:(id)a5;
- (void)downloadDirectoryAtURL:(id)a3 completionHandler:(id)a4;
- (void)downloadItemAtFileURL:(id)a3 ofSize:(id)a4 fileIsUbiquitous:(BOOL)a5 completionHandler:(id)a6;
- (void)finishRunningWithFiles:(id)a3 error:(id)a4;
- (void)getFileInfoForURL:(id)a3 fileIsUbiquitous:(BOOL *)a4 fileIsDirectory:(BOOL *)a5 fileSize:(id *)a6 error:(id *)a7;
- (void)setExecuting:(BOOL)a3;
- (void)setFinished:(BOOL)a3;
- (void)start;
@end

@implementation WFiCloudFileDownloadOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_fileCoordinator, 0);
  objc_storeStrong((id *)&self->_downloadError, 0);
  objc_storeStrong((id *)&self->_downloadedFiles, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

- (NSProgress)progress
{
  return self->_progress;
}

- (NSFileCoordinator)fileCoordinator
{
  return self->_fileCoordinator;
}

- (BOOL)retrieveFolderContents
{
  return self->_retrieveFolderContents;
}

- (NSError)downloadError
{
  return self->_downloadError;
}

- (NSArray)downloadedFiles
{
  return self->_downloadedFiles;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (BOOL)isExecuting
{
  return self->_executing;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)setFinished:(BOOL)a3
{
  [(WFiCloudFileDownloadOperation *)self willChangeValueForKey:@"isFinished"];
  self->_finished = a3;
  [(WFiCloudFileDownloadOperation *)self didChangeValueForKey:@"isFinished"];
}

- (void)setExecuting:(BOOL)a3
{
  [(WFiCloudFileDownloadOperation *)self willChangeValueForKey:@"isExecuting"];
  self->_executing = a3;
  [(WFiCloudFileDownloadOperation *)self didChangeValueForKey:@"isExecuting"];
}

- (void)finishRunningWithFiles:(id)a3 error:(id)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  v6 = (NSArray *)a3;
  uint64_t v7 = (uint64_t)a4;
  if (!((unint64_t)v6 | v7))
  {
    v8 = [(WFiCloudFileDownloadOperation *)self fileURL];
    v15[0] = *MEMORY[0x263EFF798];
    uint64_t v9 = v15[0];
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
    v11 = [v8 resourceValuesForKeys:v10 error:0];
    uint64_t v7 = [v11 objectForKey:v9];
  }
  downloadError = self->_downloadError;
  self->_downloadError = (NSError *)v7;
  id v13 = (id)v7;

  downloadedFiles = self->_downloadedFiles;
  self->_downloadedFiles = v6;

  [(WFiCloudFileDownloadOperation *)self setExecuting:0];
  [(WFiCloudFileDownloadOperation *)self setFinished:1];
}

- (void)downloadDirectoryAtURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_msgSend(v7, "wf_fileSize");
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __74__WFiCloudFileDownloadOperation_downloadDirectoryAtURL_completionHandler___block_invoke;
  v10[3] = &unk_264289E40;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [(WFiCloudFileDownloadOperation *)self downloadItemAtFileURL:v7 ofSize:v8 fileIsUbiquitous:1 completionHandler:v10];
}

void __74__WFiCloudFileDownloadOperation_downloadDirectoryAtURL_completionHandler___block_invoke(uint64_t a1)
{
  v14[3] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08850] defaultManager];
  v3 = [*(id *)(a1 + 32) fileURL];
  uint64_t v4 = *MEMORY[0x263EFF688];
  v14[0] = *MEMORY[0x263EFF7B0];
  v14[1] = v4;
  v14[2] = *MEMORY[0x263EFF6A8];
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:3];
  id v13 = 0;
  id v6 = [v2 contentsOfDirectoryAtURL:v3 includingPropertiesForKeys:v5 options:0 error:&v13];
  id v7 = v13;
  v8 = objc_msgSend(v6, "if_objectsPassingTest:", &__block_literal_global_20);

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __74__WFiCloudFileDownloadOperation_downloadDirectoryAtURL_completionHandler___block_invoke_21;
  v11[3] = &unk_264286710;
  uint64_t v12 = *(void *)(a1 + 32);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __74__WFiCloudFileDownloadOperation_downloadDirectoryAtURL_completionHandler___block_invoke_3;
  v9[3] = &unk_264289E90;
  v9[4] = v12;
  id v10 = *(id *)(a1 + 40);
  objc_msgSend(v8, "if_enumerateAsynchronously:completionHandler:", v11, v9);
}

void __74__WFiCloudFileDownloadOperation_downloadDirectoryAtURL_completionHandler___block_invoke_21(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v17[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  v17[0] = *MEMORY[0x263EFF688];
  uint64_t v7 = v17[0];
  v8 = (void *)MEMORY[0x263EFF8C0];
  id v9 = a2;
  id v10 = [v8 arrayWithObjects:v17 count:1];
  id v11 = [v9 resourceValuesForKeys:v10 error:0];
  uint64_t v12 = [v11 objectForKey:v7];

  id v13 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  void v15[2] = __74__WFiCloudFileDownloadOperation_downloadDirectoryAtURL_completionHandler___block_invoke_2_22;
  v15[3] = &unk_26428AA60;
  id v16 = v6;
  id v14 = v6;
  [v13 downloadItemAtFileURL:v9 ofSize:v12 fileIsUbiquitous:1 completionHandler:v15];
}

void __74__WFiCloudFileDownloadOperation_downloadDirectoryAtURL_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = (void *)MEMORY[0x263F08850];
  id v5 = a3;
  id v6 = [v4 defaultManager];
  uint64_t v7 = [*(id *)(a1 + 32) fileURL];
  v8 = [v6 contentsOfDirectoryAtURL:v7 includingPropertiesForKeys:MEMORY[0x263EFFA68] options:0 error:0];
  objc_msgSend(v8, "if_compactMap:", &__block_literal_global_25_4358);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id __74__WFiCloudFileDownloadOperation_downloadDirectoryAtURL_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return +[WFFileRepresentation fileWithURL:a2 options:0];
}

uint64_t __74__WFiCloudFileDownloadOperation_downloadDirectoryAtURL_completionHandler___block_invoke_2_22(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __74__WFiCloudFileDownloadOperation_downloadDirectoryAtURL_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v23[1] = *MEMORY[0x263EF8340];
  id v2 = a2;
  v23[0] = *MEMORY[0x263EFF7B0];
  uint64_t v3 = v23[0];
  uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
  id v17 = 0;
  id v5 = [v2 resourceValuesForKeys:v4 error:&v17];
  id v6 = v17;
  uint64_t v7 = [v5 objectForKey:v3];

  if (v7)
  {
    uint64_t v18 = *MEMORY[0x263EFF6A8];
    uint64_t v8 = v18;
    id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
    id v16 = v6;
    id v10 = [v2 resourceValuesForKeys:v9 error:&v16];
    id v11 = v16;

    uint64_t v12 = [v10 objectForKey:v8];
    LODWORD(v8) = [v12 BOOLValue];

    uint64_t v13 = (v8 | [v7 isEqualToString:*MEMORY[0x263EFF7A0]]) ^ 1;
    id v6 = v11;
  }
  else
  {
    id v14 = getWFFilesLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[WFiCloudFileDownloadOperation downloadDirectoryAtURL:completionHandler:]_block_invoke_2";
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl(&dword_216505000, v14, OS_LOG_TYPE_ERROR, "%s Could not get download status with error: %@", buf, 0x16u);
    }

    uint64_t v13 = 1;
  }

  return v13;
}

- (void)downloadItemAtFileURL:(id)a3 ofSize:(id)a4 fileIsUbiquitous:(BOOL)a5 completionHandler:(id)a6
{
  v25[1] = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a6;
  id v11 = a3;
  uint64_t v12 = [(WFiCloudFileDownloadOperation *)self progress];
  objc_msgSend(v12, "setTotalUnitCount:", objc_msgSend(v12, "totalUnitCount") + objc_msgSend(v9, "longLongValue"));

  uint64_t v13 = [MEMORY[0x263F08820] readingIntentWithURL:v11 options:0];

  id v14 = [(WFiCloudFileDownloadOperation *)self fileCoordinator];
  v25[0] = v13;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:1];
  id v16 = objc_opt_new();
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __97__WFiCloudFileDownloadOperation_downloadItemAtFileURL_ofSize_fileIsUbiquitous_completionHandler___block_invoke;
  v20[3] = &unk_2642866C8;
  id v21 = v13;
  id v22 = self;
  id v23 = v9;
  id v24 = v10;
  id v17 = v9;
  id v18 = v10;
  id v19 = v13;
  [v14 coordinateAccessWithIntents:v15 queue:v16 byAccessor:v20];
}

void __97__WFiCloudFileDownloadOperation_downloadItemAtFileURL_ofSize_fileIsUbiquitous_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) URL];
  uint64_t v4 = (void *)v3;
  if (v7 || !v3)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v5 = [*(id *)(a1 + 40) progress];
    objc_msgSend(v5, "setCompletedUnitCount:", objc_msgSend(v5, "completedUnitCount") + objc_msgSend(*(id *)(a1 + 48), "longLongValue"));

    id v6 = +[WFFileRepresentation fileWithURL:v4 options:0];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)getFileInfoForURL:(id)a3 fileIsUbiquitous:(BOOL *)a4 fileIsDirectory:(BOOL *)a5 fileSize:(id *)a6 error:(id *)a7
{
  id v12 = a3;
  uint64_t v13 = [(WFiCloudFileDownloadOperation *)self fileCoordinator];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __99__WFiCloudFileDownloadOperation_getFileInfoForURL_fileIsUbiquitous_fileIsDirectory_fileSize_error___block_invoke;
  v14[3] = &__block_descriptor_64_e15_v16__0__NSURL_8l;
  void v14[4] = a7;
  v14[5] = a4;
  v14[6] = a5;
  v14[7] = a6;
  [v13 coordinateReadingItemAtURL:v12 options:4 error:a7 byAccessor:v14];
}

void __99__WFiCloudFileDownloadOperation_getFileInfoForURL_fileIsUbiquitous_fileIsDirectory_fileSize_error___block_invoke(uint64_t a1, void *a2)
{
  v17[3] = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v5 = *MEMORY[0x263EFF6A8];
  v17[0] = *MEMORY[0x263EFF710];
  uint64_t v4 = v17[0];
  v17[1] = v5;
  uint64_t v6 = *MEMORY[0x263EFF6D0];
  void v17[2] = *MEMORY[0x263EFF6D0];
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:3];
  uint64_t v8 = [v3 promisedItemResourceValuesForKeys:v7 error:*(void *)(a1 + 32)];

  id v9 = [v8 objectForKey:v4];
  **(unsigned char **)(a1 + 40) = [v9 BOOLValue];

  id v10 = [v8 objectForKey:v5];
  if ([v10 BOOLValue])
  {
    id v11 = [v8 objectForKey:v6];
    char v12 = [v11 BOOLValue] ^ 1;
  }
  else
  {
    char v12 = 0;
  }

  **(unsigned char **)(a1 + 48) = v12;
  if (v8 && (v12 & 1) == 0)
  {
    uint64_t v16 = *MEMORY[0x263EFF688];
    uint64_t v13 = v16;
    id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];
    v15 = [v3 promisedItemResourceValuesForKeys:v14 error:0];
    **(void **)(a1 + 56) = [v15 objectForKey:v13];
  }
}

- (void)start
{
  [(WFiCloudFileDownloadOperation *)self setExecuting:1];
  __int16 v17 = 0;
  id v3 = [(WFiCloudFileDownloadOperation *)self fileURL];
  id v16 = 0;
  id v15 = 0;
  [(WFiCloudFileDownloadOperation *)self getFileInfoForURL:v3 fileIsUbiquitous:(char *)&v17 + 1 fileIsDirectory:&v17 fileSize:&v16 error:&v15];
  id v4 = v16;
  id v5 = v15;

  if (!v5)
  {
    int v6 = v17;
    if (HIBYTE(v17) && (_BYTE)v17)
    {
      if ([(WFiCloudFileDownloadOperation *)self retrieveFolderContents])
      {
        id v7 = [(WFiCloudFileDownloadOperation *)self fileURL];
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __38__WFiCloudFileDownloadOperation_start__block_invoke;
        v14[3] = &unk_26428A1F8;
        void v14[4] = self;
        [(WFiCloudFileDownloadOperation *)self downloadDirectoryAtURL:v7 completionHandler:v14];
        goto LABEL_12;
      }
      int v6 = v17;
    }
    if (v6 && [(WFiCloudFileDownloadOperation *)self retrieveFolderContents])
    {
      uint64_t v8 = [MEMORY[0x263F08850] defaultManager];
      id v9 = [(WFiCloudFileDownloadOperation *)self fileURL];
      id v13 = 0;
      id v10 = [v8 contentsOfDirectoryAtURL:v9 includingPropertiesForKeys:MEMORY[0x263EFFA68] options:0 error:&v13];
      id v5 = v13;
      id v11 = objc_msgSend(v10, "if_compactMap:", &__block_literal_global_4370);

      [(WFiCloudFileDownloadOperation *)self finishRunningWithFiles:v11 error:v5];
      goto LABEL_13;
    }
    id v7 = [(WFiCloudFileDownloadOperation *)self fileURL];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __38__WFiCloudFileDownloadOperation_start__block_invoke_3;
    v12[3] = &unk_264286680;
    v12[4] = self;
    [(WFiCloudFileDownloadOperation *)self downloadItemAtFileURL:v7 ofSize:v4 fileIsUbiquitous:HIBYTE(v17) completionHandler:v12];
LABEL_12:

    id v5 = 0;
    goto LABEL_13;
  }
  [(WFiCloudFileDownloadOperation *)self finishRunningWithFiles:0 error:v5];
LABEL_13:
}

uint64_t __38__WFiCloudFileDownloadOperation_start__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishRunningWithFiles:a2 error:a3];
}

void __38__WFiCloudFileDownloadOperation_start__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = *(void **)(a1 + 32);
  if (a2)
  {
    id v9 = a2;
    id v5 = (void *)MEMORY[0x263EFF8C0];
    id v6 = a3;
    id v7 = a2;
    uint64_t v8 = [v5 arrayWithObjects:&v9 count:1];
    objc_msgSend(v3, "finishRunningWithFiles:error:", v8, v6, v9, v10);
  }
  else
  {
    id v7 = a3;
    [v3 finishRunningWithFiles:0 error:v7];
    uint64_t v8 = 0;
  }
}

id __38__WFiCloudFileDownloadOperation_start__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[WFFileRepresentation fileWithURL:a2 options:0];
}

- (WFiCloudFileDownloadOperation)initWithFileURL:(id)a3 retrieveFolderContents:(BOOL)a4 progress:(id)a5
{
  id v10 = a3;
  id v11 = a5;
  if (!v10)
  {
    id v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"WFiCloudFileDownloadOperation.m", 31, @"Invalid parameter not satisfying: %@", @"fileURL" object file lineNumber description];
  }
  v19.receiver = self;
  v19.super_class = (Class)WFiCloudFileDownloadOperation;
  char v12 = [(WFiCloudFileDownloadOperation *)&v19 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_fileURL, a3);
    uint64_t v14 = objc_opt_new();
    fileCoordinator = v13->_fileCoordinator;
    v13->_fileCoordinator = (NSFileCoordinator *)v14;

    objc_storeStrong((id *)&v13->_progress, a5);
    v13->_retrieveFolderContents = a4;
    id v16 = v13;
  }

  return v13;
}

@end