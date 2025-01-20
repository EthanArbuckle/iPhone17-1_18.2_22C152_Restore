@interface CUTFileCopier
- (BOOL)didErrorOccur;
- (BOOL)inProgress;
- (BOOL)wasCancelled;
- (CUTFileCopier)initWithInputURL:(id)a3 outputURL:(id)a4 identifier:(id)a5 operation:(unsigned int)a6 delegate:(id)a7;
- (CUTFileCopierDelegate)delegate;
- (NSURL)inputURL;
- (NSURL)outputURL;
- (id)_temporaryCopierPath;
- (id)identifier;
- (unsigned)operation;
- (void)_BOMCopier;
- (void)_fillOutputURLFromInputURL;
- (void)_main_copierFinishedWithResult:(id)a3;
- (void)_worker_doCopy;
- (void)cancel;
- (void)cleanup;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setInProgress:(BOOL)a3;
- (void)setOperation:(unsigned int)a3;
- (void)set_BOMCopier:(void *)a3;
- (void)start;
@end

@implementation CUTFileCopier

- (CUTFileCopier)initWithInputURL:(id)a3 outputURL:(id)a4 identifier:(id)a5 operation:(unsigned int)a6 delegate:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)CUTFileCopier;
  v16 = [(CUTFileCopier *)&v22 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    inputURL = v16->_inputURL;
    v16->_inputURL = (NSURL *)v17;

    uint64_t v19 = [v13 copy];
    outputURL = v16->_outputURL;
    v16->_outputURL = (NSURL *)v19;

    objc_storeStrong(&v16->_identifier, a5);
    if (!v16->_outputURL) {
      [(CUTFileCopier *)v16 _fillOutputURLFromInputURL];
    }
    v16->_operation = a6;
    objc_storeWeak((id *)&v16->_delegate, v15);
  }

  return v16;
}

- (void)dealloc
{
  if (self->_BOMCopier)
  {
    if (self->_inProgress) {
      BOMCopierCancelCopy();
    }
    BOMCopierFree();
  }
  v3.receiver = self;
  v3.super_class = (Class)CUTFileCopier;
  [(CUTFileCopier *)&v3 dealloc];
}

- (id)_temporaryCopierPath
{
  v2 = CUTTemporaryPath();
  objc_super v3 = [v2 stringByAppendingPathComponent:@"CUTFileCopier"];

  return v3;
}

- (void)_fillOutputURLFromInputURL
{
  objc_super v3 = [(CUTFileCopier *)self inputURL];
  v4 = [v3 path];
  id v15 = [v4 lastPathComponent];

  if ([(__CFString *)v15 length])
  {
    v5 = v15;
  }
  else
  {

    v5 = @"Archive";
  }
  v16 = v5;
  v6 = [(__CFString *)v5 stringByAppendingPathExtension:@"zip"];
  v7 = [(CUTFileCopier *)self _temporaryCopierPath];
  uint64_t v8 = [NSString cutStringGUID];
  v9 = [v7 stringByAppendingPathComponent:v8];

  v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  LOBYTE(v8) = [v10 fileExistsAtPath:v9];

  if ((v8 & 1) == 0)
  {
    v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v11 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:0 error:0];
  }
  id v12 = [v9 stringByAppendingPathComponent:v6];

  id v13 = (NSURL *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v12];
  outputURL = self->_outputURL;
  self->_outputURL = v13;
}

- (void)start
{
  if (!self->_inProgress)
  {
    objc_super v3 = [(CUTFileCopier *)self delegate];
    [v3 fileCopierDidStart:self];

    self->_inProgress = 1;
    uint64_t v4 = MEMORY[0x1E4F29060];
    MEMORY[0x1F4181798](v4, sel_detachNewThreadSelector_toTarget_withObject_);
  }
}

- (void)cancel
{
  if (!self->_shouldCancel)
  {
    self->_shouldCancel = 1;
    if (self->_BOMCopier)
    {
      if (self->_inProgress) {
        BOMCopierCancelCopy();
      }
    }
  }
}

- (void)cleanup
{
  if (self->_inProgress)
  {
    [(CUTFileCopier *)self cancel];
  }
  else
  {
    id v6 = [(NSURL *)self->_outputURL path];
    objc_super v3 = [(CUTFileCopier *)self _temporaryCopierPath];
    int v4 = [v6 hasPrefix:v3];

    if (v4)
    {
      v5 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v5 removeItemAtPath:v6 error:0];
    }
  }
}

- (void)_main_copierFinishedWithResult:(id)a3
{
  char v4 = [a3 BOOLValue];
  BOOL shouldCancel = self->_shouldCancel;
  char v6 = v4 ^ 1;
  if (self->_shouldCancel) {
    char v6 = 0;
  }
  self->_didErrorOccur = v6;
  self->_inProgress = 0;
  if (shouldCancel) {
    [(CUTFileCopier *)self cleanup];
  }
  id v7 = [(CUTFileCopier *)self delegate];
  [v7 fileCopierDidFinish:self];
}

- (void)_worker_doCopy
{
  objc_super v3 = (void *)MEMORY[0x1A6249B10](self, a2);
  char v4 = (void *)BOMCopierNew();
  self->_BOMCopier = v4;
  if (!v4)
  {
    BOOL v10 = 0;
    goto LABEL_12;
  }
  BOMCopierSetUserData();
  BOMCopierSetCopyFileStartedHandler();
  BOMCopierSetFileErrorHandler();
  BOMCopierSetFileConflictErrorHandler();
  BOMCopierSetFatalErrorHandler();
  BOMCopierSetFatalFileErrorHandler();
  v5 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  char v6 = v5;
  unsigned int operation = self->_operation;
  switch(operation)
  {
    case 0u:
      uint64_t v8 = (const void *)*MEMORY[0x1E4F1CFD0];
      CFDictionarySetValue(v5, @"createCPIO", (const void *)*MEMORY[0x1E4F1CFD0]);
      CFDictionarySetValue(v6, @"sequesterResources", v8);
      CFDictionarySetValue(v6, @"createPKZip", v8);
      CFDictionarySetValue(v6, @"keepParent", v8);
      v9 = @"copyResources";
      goto LABEL_8;
    case 1u:
      v11 = (const void *)*MEMORY[0x1E4F1CFD0];
      v9 = @"extractPKZip";
      goto LABEL_10;
    case 2u:
      uint64_t v8 = (const void *)*MEMORY[0x1E4F1CFD0];
      CFDictionarySetValue(v5, @"createCPIO", (const void *)*MEMORY[0x1E4F1CFD0]);
      CFDictionarySetValue(v6, @"sequesterResources", v8);
      v9 = @"createPKZip";
LABEL_8:
      v5 = v6;
      v11 = v8;
LABEL_10:
      CFDictionarySetValue(v5, v9, v11);
      break;
  }
  id v12 = [(CUTFileCopier *)self inputURL];
  id v13 = [v12 path];
  [v13 fileSystemRepresentation];

  id v14 = [(CUTFileCopier *)self outputURL];
  id v15 = [v14 path];
  [v15 fileSystemRepresentation];

  BOOL v10 = BOMCopierCopyWithOptions() == 0;
  BOMCopierSetUserData();

LABEL_12:
  v16 = (void *)[objc_alloc(NSNumber) initWithBool:v10];
  [(CUTFileCopier *)self performSelectorOnMainThread:sel__main_copierFinishedWithResult_ withObject:v16 waitUntilDone:0];
}

- (CUTFileCopierDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CUTFileCopierDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSURL)inputURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (NSURL)outputURL
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (id)identifier
{
  return objc_getProperty(self, a2, 40, 1);
}

- (BOOL)wasCancelled
{
  return self->_shouldCancel;
}

- (BOOL)didErrorOccur
{
  return self->_didErrorOccur;
}

- (BOOL)inProgress
{
  return self->_inProgress;
}

- (void)setInProgress:(BOOL)a3
{
  self->_inProgress = a3;
}

- (unsigned)operation
{
  return self->_operation;
}

- (void)setOperation:(unsigned int)a3
{
  self->_unsigned int operation = a3;
}

- (void)_BOMCopier
{
  return self->_BOMCopier;
}

- (void)set_BOMCopier:(void *)a3
{
  self->_BOMCopier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_identifier, 0);
  objc_storeStrong((id *)&self->_outputURL, 0);
  objc_storeStrong((id *)&self->_inputURL, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end