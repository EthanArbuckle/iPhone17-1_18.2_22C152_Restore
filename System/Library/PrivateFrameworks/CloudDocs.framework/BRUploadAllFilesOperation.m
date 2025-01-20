@interface BRUploadAllFilesOperation
- (BRUploadAllFilesOperation)init;
- (BRUploadAllFilesOperation)initWithContainer:(id)a3;
- (id)uploadAllFilesCompletion;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)main;
- (void)setUploadAllFilesCompletion:(id)a3;
@end

@implementation BRUploadAllFilesOperation

- (BRUploadAllFilesOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)BRUploadAllFilesOperation;
  return [(BROperation *)&v3 init];
}

- (BRUploadAllFilesOperation)initWithContainer:(id)a3
{
  id v5 = a3;
  v6 = [(BRUploadAllFilesOperation *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_container, a3);
  }

  return v7;
}

- (void)main
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_19ED3F000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] wait for uploading all files%@", (uint8_t *)&v2, 0xCu);
}

uint64_t __33__BRUploadAllFilesOperation_main__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) completedWithResult:0 error:a2];
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  v8 = [v6 userInfo];
  v9 = [v8 objectForKeyedSubscript:@"BRPartialErrorsByContainerIDKey"];

  if (v6 && !v9)
  {
    v9 = [MEMORY[0x1E4F1C9E8] dictionary];
  }
  v10 = +[BRContainer allContainersByContainerID];
  v11 = [v9 allKeys];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __52__BRUploadAllFilesOperation_finishWithResult_error___block_invoke;
  v21[3] = &unk_1E59AE860;
  id v12 = v10;
  id v22 = v12;
  v13 = objc_msgSend(v11, "br_copy_if:", v21);

  if ([v13 count])
  {
    v14 = (void *)MEMORY[0x1E4F28C58];
    v23 = @"BRErrorAffectedContainersKey";
    v24[0] = v13;
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    v16 = [v14 errorWithDomain:@"BRCloudDocsErrorDomain" code:1002 userInfo:v15];

    id v6 = (id)v15;
LABEL_8:

    goto LABEL_9;
  }
  if (v6)
  {
    v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"BRCloudDocsErrorDomain" code:1000 userInfo:0];
    goto LABEL_8;
  }
  v16 = 0;
LABEL_9:
  uint64_t v17 = MEMORY[0x19F3C48D0](self->_uploadAllFilesCompletion);
  v18 = (void *)v17;
  if (v17)
  {
    (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v16);
    id uploadAllFilesCompletion = self->_uploadAllFilesCompletion;
    self->_id uploadAllFilesCompletion = 0;
  }
  v20.receiver = self;
  v20.super_class = (Class)BRUploadAllFilesOperation;
  [(BROperation *)&v20 finishWithResult:v7 error:v16];
}

uint64_t __52__BRUploadAllFilesOperation_finishWithResult_error___block_invoke(uint64_t a1, uint64_t a2)
{
  int v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  uint64_t v3 = [v2 isDocumentScopePublic] ^ 1;

  return v3;
}

- (id)uploadAllFilesCompletion
{
  return objc_getProperty(self, a2, 296, 1);
}

- (void)setUploadAllFilesCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_container, 0);

  objc_storeStrong(&self->_uploadAllFilesCompletion, 0);
}

@end