@interface FPDDetachKnownFolderOperation
- (FPDDetachKnownFolderOperation)initWithKnownFolder:(id)a3 server:(id)a4 request:(id)a5;
- (void)main;
@end

@implementation FPDDetachKnownFolderOperation

- (FPDDetachKnownFolderOperation)initWithKnownFolder:(id)a3 server:(id)a4 request:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)FPDDetachKnownFolderOperation;
  v12 = [(FPOperation *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_knownFolders, a3);
    objc_storeStrong((id *)&v13->_server, a4);
    objc_storeStrong((id *)&v13->_request, a5);
  }

  return v13;
}

- (void)main
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v19 = 304;
  obj = self->_knownFolders;
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    v5 = 0;
    uint64_t v6 = *(void *)v24;
    while (2)
    {
      uint64_t v7 = 0;
      v8 = v5;
      do
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v23 + 1) + 8 * v7);
        uint64_t v22 = 0;
        id v10 = [(FPDServer *)self->_server extensionManager];
        id v11 = [v9 logicalLocation];
        v5 = [v10 domainForURL:v11 reason:&v22];

        if (v8 && v5 != v8)
        {
          v12 = [v9 logicalLocation];
          v13 = FPProviderNotFoundErrorForURL();
          [(FPOperation *)self finishWithResult:0 error:v13];

          goto LABEL_17;
        }

        ++v7;
        v8 = v5;
      }
      while (v4 != v7);
      uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    v5 = 0;
  }

  v14 = [v5 defaultBackend];
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    v16 = [v5 defaultBackend];
    uint64_t v17 = *(uint64_t *)((char *)&self->super.super.super.isa + v19);
    request = self->_request;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __37__FPDDetachKnownFolderOperation_main__block_invoke;
    v21[3] = &unk_1E6A73580;
    v21[4] = self;
    [v16 detachKnownFolders:v17 request:request completionHandler:v21];
  }
  else
  {
    v16 = FPNotSupportedError();
    [(FPOperation *)self finishWithResult:0 error:v16];
  }

  v8 = v5;
LABEL_17:
}

uint64_t __37__FPDDetachKnownFolderOperation_main__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) completedWithResult:0 error:a2];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_knownFolders, 0);
}

@end