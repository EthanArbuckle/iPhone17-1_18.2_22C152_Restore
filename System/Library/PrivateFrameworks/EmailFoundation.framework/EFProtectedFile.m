@interface EFProtectedFile
- (BOOL)backgroundProcessingIsAllowed;
- (EFProtectedFile)initWithFilePath:(id)a3 isSensitive:(BOOL)a4 protectionType:(id)a5;
- (EFProtectedFile)initWithFilePath:(id)a3 protectionType:(id)a4;
- (EFProtectedFile)initWithSensitiveFilePath:(id)a3 protectionType:(id)a4;
- (_EFBackgroundProcessingAssertion)assertion;
- (_EFProtectedFile)file;
- (id)requestBackgroundProcessingForDuration:(double)a3 error:(id *)a4;
@end

@implementation EFProtectedFile

void ___ef_log_EFProtectedFile_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.email", "EFProtectedFile");
  v1 = (void *)_ef_log_EFProtectedFile_log;
  _ef_log_EFProtectedFile_log = (uint64_t)v0;
}

- (EFProtectedFile)initWithFilePath:(id)a3 protectionType:(id)a4
{
  return [(EFProtectedFile *)self initWithFilePath:a3 isSensitive:0 protectionType:a4];
}

- (EFProtectedFile)initWithSensitiveFilePath:(id)a3 protectionType:(id)a4
{
  return [(EFProtectedFile *)self initWithFilePath:a3 isSensitive:1 protectionType:a4];
}

- (EFProtectedFile)initWithFilePath:(id)a3 isSensitive:(BOOL)a4 protectionType:(id)a5
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)EFProtectedFile;
  v10 = [(EFProtectedFile *)&v18 init];
  if (v10)
  {
    v11 = -[_EFProtectedFile initWithFilePath:isSensitive:protectionType:]((id *)[_EFProtectedFile alloc], v8, a4, v9);
    file = v10->_file;
    v10->_file = (_EFProtectedFile *)v11;

    v13 = [_EFBackgroundProcessingAssertion alloc];
    v19[0] = v10->_file;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    v15 = (_EFBackgroundProcessingAssertion *)-[_EFBackgroundProcessingAssertion initWithProtectedFiles:](v13, v14);
    assertion = v10->_assertion;
    v10->_assertion = v15;
  }
  return v10;
}

- (BOOL)backgroundProcessingIsAllowed
{
  v2 = [(EFProtectedFile *)self assertion];
  unsigned __int8 v3 = -[_EFBackgroundProcessingAssertion isActive](v2);

  return v3;
}

- (id)requestBackgroundProcessingForDuration:(double)a3 error:(id *)a4
{
  uint64_t v11 = 0;
  v7 = [(EFProtectedFile *)self assertion];
  LODWORD(a4) = -[_EFBackgroundProcessingAssertion incrementAssertionForDuration:outResetCount:error:]((uint64_t)v7, &v11, a4, a3);

  if (a4)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __64__EFProtectedFile_requestBackgroundProcessingForDuration_error___block_invoke;
    v10[3] = &unk_1E6122F50;
    v10[4] = self;
    v10[5] = v11;
    id v8 = +[EFCancelationToken tokenWithCancelationBlock:v10];
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

void __64__EFProtectedFile_requestBackgroundProcessingForDuration_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) assertion];
  -[_EFBackgroundProcessingAssertion decrementAssertionWithResetCount:]((uint64_t)v2, *(void *)(a1 + 40));
}

- (_EFProtectedFile)file
{
  return self->_file;
}

- (_EFBackgroundProcessingAssertion)assertion
{
  return self->_assertion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_file, 0);
}

@end