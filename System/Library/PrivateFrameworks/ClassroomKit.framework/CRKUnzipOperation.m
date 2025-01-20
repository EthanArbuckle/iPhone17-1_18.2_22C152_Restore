@interface CRKUnzipOperation
+ (id)errorFromBOMCopierStatus:(int)a3 message:(id)a4;
- (CRKUnzipOperation)initWithZipFileURL:(id)a3;
- (CRKUnzipOperation)initWithZipFileURL:(id)a3 destinationDirectoryURL:(id)a4;
- (NSError)stashedError;
- (NSURL)destinationDirectoryURL;
- (NSURL)zipFileURL;
- (_BOMCopier)copier;
- (void)cancel;
- (void)main;
- (void)operationWillFinish;
- (void)setCopier:(_BOMCopier *)a3;
- (void)setStashedError:(id)a3;
@end

@implementation CRKUnzipOperation

- (CRKUnzipOperation)initWithZipFileURL:(id)a3
{
  v4 = NSURL;
  id v5 = a3;
  v6 = objc_msgSend(v4, "crk_uniqueTemporaryDirectoryURL");
  v7 = [(CRKUnzipOperation *)self initWithZipFileURL:v5 destinationDirectoryURL:v6];

  return v7;
}

- (CRKUnzipOperation)initWithZipFileURL:(id)a3 destinationDirectoryURL:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"CRKUnzipOperation.m", 35, @"Invalid parameter not satisfying: %@", @"zipFileURL" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x263F08690] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"CRKUnzipOperation.m", 36, @"Invalid parameter not satisfying: %@", @"destinationDirectoryURL" object file lineNumber description];

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)CRKUnzipOperation;
  v11 = [(CRKUnzipOperation *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_zipFileURL, a3);
    objc_storeStrong((id *)&v12->_destinationDirectoryURL, a4);
  }

  return v12;
}

- (void)cancel
{
  v3.receiver = self;
  v3.super_class = (Class)CRKUnzipOperation;
  [(CRKUnzipOperation *)&v3 cancel];
  [(CRKUnzipOperation *)self copier];
  BOMCopierCancelCopy();
}

- (void)operationWillFinish
{
  v3.receiver = self;
  v3.super_class = (Class)CRKUnzipOperation;
  [(CRKUnzipOperation *)&v3 operationWillFinish];
  [(CRKUnzipOperation *)self copier];
  BOMCopierFree();
  [(CRKUnzipOperation *)self setCopier:0];
}

- (void)main
{
  v17[1] = *MEMORY[0x263EF8340];
  objc_super v3 = [MEMORY[0x263F08850] defaultManager];
  v4 = [(CRKUnzipOperation *)self destinationDirectoryURL];
  id v15 = 0;
  char v5 = [v3 createDirectoryAtURL:v4 withIntermediateDirectories:1 attributes:0 error:&v15];
  id v6 = v15;

  if (v5)
  {
    [(CRKUnzipOperation *)self setCopier:BOMCopierNew()];
    if ([(CRKUnzipOperation *)self isCanceled])
    {
      v7 = CATErrorWithCodeAndUserInfo();
      [(CRKUnzipOperation *)self endOperationWithError:v7];
LABEL_9:

      goto LABEL_12;
    }
    [(CRKUnzipOperation *)self copier];
    BOMCopierSetUserData();
    [(CRKUnzipOperation *)self copier];
    BOMCopierSetFatalErrorHandler();
    [(CRKUnzipOperation *)self copier];
    BOMCopierSetFatalFileErrorHandler();
    [(CRKUnzipOperation *)self copier];
    BOMCopierSetFileErrorHandler();
    [(CRKUnzipOperation *)self copier];
    BOMCopierSetFileConflictErrorHandler();
    [(CRKUnzipOperation *)self copier];
    id v8 = [(CRKUnzipOperation *)self zipFileURL];
    [v8 fileSystemRepresentation];
    id v9 = [(CRKUnzipOperation *)self destinationDirectoryURL];
    [v9 fileSystemRepresentation];
    objc_super v16 = @"extractPKZip";
    v17[0] = MEMORY[0x263EFFA88];
    [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
    uint64_t v10 = BOMCopierCopyWithOptions();

    if (!v10)
    {
      v7 = [(CRKUnzipOperation *)self destinationDirectoryURL];
      [(CRKUnzipOperation *)self endOperationWithResultObject:v7];
      goto LABEL_9;
    }
    v11 = [(CRKUnzipOperation *)self stashedError];
    v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      id v13 = [(id)objc_opt_class() errorFromBOMCopierStatus:v10 message:0];
    }
    v14 = v13;

    [(CRKUnzipOperation *)self endOperationWithError:v14];
  }
  else
  {
    [(CRKUnzipOperation *)self endOperationWithError:v6];
  }
LABEL_12:
}

- (void)setStashedError:(id)a3
{
  a3;
  if (!self->_stashedError) {
    objc_storeStrong((id *)&self->_stashedError, a3);
  }

  MEMORY[0x270F9A758]();
}

+ (id)errorFromBOMCopierStatus:(int)a3 message:(id)a4
{
  v33[3] = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = v5;
  int v7 = a3 + 1;
  id v8 = 0;
  switch(v7)
  {
    case 0:
      id v9 = (void *)MEMORY[0x263F087E8];
      uint64_t v10 = *MEMORY[0x263F08438];
      if (!v5)
      {
        v21 = (void *)MEMORY[0x263F087E8];
        v20 = (__CFString *)*MEMORY[0x263F08438];
        uint64_t v22 = -1;
        goto LABEL_19;
      }
      uint64_t v32 = *MEMORY[0x263F08320];
      v33[0] = v5;
      v11 = [NSDictionary dictionaryWithObjects:v33 forKeys:&v32 count:1];
      id v8 = [v9 errorWithDomain:v10 code:-1 userInfo:v11];

      goto LABEL_21;
    case 1:
      goto LABEL_21;
    case 2:
      v12 = (void *)MEMORY[0x263F087E8];
      if (v5)
      {
        uint64_t v30 = *MEMORY[0x263F08320];
        id v31 = v5;
        id v13 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
        v14 = v12;
        uint64_t v15 = 1;
        goto LABEL_13;
      }
      v20 = @"BOMCopierErrorDomain";
      v21 = (void *)MEMORY[0x263F087E8];
      uint64_t v22 = 1;
      goto LABEL_19;
    case 3:
      v18 = (void *)MEMORY[0x263F087E8];
      if (v5)
      {
        uint64_t v28 = *MEMORY[0x263F08320];
        id v29 = v5;
        id v13 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
        v14 = v18;
        uint64_t v15 = 2;
        goto LABEL_13;
      }
      v20 = @"BOMCopierErrorDomain";
      v21 = (void *)MEMORY[0x263F087E8];
      uint64_t v22 = 2;
      goto LABEL_19;
    case 4:
      objc_super v16 = (void *)MEMORY[0x263F087E8];
      if (v5)
      {
        uint64_t v26 = *MEMORY[0x263F08320];
        id v27 = v5;
        id v13 = [NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
        v14 = v16;
        uint64_t v15 = 3;
        goto LABEL_13;
      }
      v20 = @"BOMCopierErrorDomain";
      v21 = (void *)MEMORY[0x263F087E8];
      uint64_t v22 = 3;
      goto LABEL_19;
    case 5:
      v19 = (void *)MEMORY[0x263F087E8];
      if (v5)
      {
        uint64_t v24 = *MEMORY[0x263F08320];
        id v25 = v5;
        id v13 = [NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
        v14 = v19;
        uint64_t v15 = 4;
LABEL_13:
        id v8 = [v14 errorWithDomain:@"BOMCopierErrorDomain" code:v15 userInfo:v13];
      }
      else
      {
        v20 = @"BOMCopierErrorDomain";
        v21 = (void *)MEMORY[0x263F087E8];
        uint64_t v22 = 4;
LABEL_19:
        uint64_t v17 = [v21 errorWithDomain:v20 code:v22 userInfo:0];
LABEL_20:
        id v8 = (void *)v17;
      }
LABEL_21:

      return v8;
    default:
      uint64_t v17 = CRKErrorWithCodeAndUserInfo(1, 0);
      goto LABEL_20;
  }
}

- (NSURL)zipFileURL
{
  return self->_zipFileURL;
}

- (NSURL)destinationDirectoryURL
{
  return self->_destinationDirectoryURL;
}

- (_BOMCopier)copier
{
  return self->_copier;
}

- (void)setCopier:(_BOMCopier *)a3
{
  self->_copier = a3;
}

- (NSError)stashedError
{
  return self->_stashedError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stashedError, 0);
  objc_storeStrong((id *)&self->_destinationDirectoryURL, 0);

  objc_storeStrong((id *)&self->_zipFileURL, 0);
}

@end