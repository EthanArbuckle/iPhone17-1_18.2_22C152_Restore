@interface EFProtectedFileGroup
- (BOOL)backgroundProcessingIsAllowed;
- (EFProtectedFileGroup)initWithFilePaths:(id)a3 isSensitive:(BOOL)a4 protectionType:(id)a5;
- (EFProtectedFileGroup)initWithFilePaths:(id)a3 protectionType:(id)a4;
- (EFProtectedFileGroup)initWithSensitiveFilePaths:(id)a3 protectionType:(id)a4;
- (NSArray)files;
- (_EFBackgroundProcessingAssertion)assertion;
- (id)requestBackgroundProcessingForDuration:(double)a3 error:(id *)a4;
@end

@implementation EFProtectedFileGroup

- (EFProtectedFileGroup)initWithFilePaths:(id)a3 protectionType:(id)a4
{
  return [(EFProtectedFileGroup *)self initWithFilePaths:a3 isSensitive:0 protectionType:a4];
}

- (EFProtectedFileGroup)initWithSensitiveFilePaths:(id)a3 protectionType:(id)a4
{
  return [(EFProtectedFileGroup *)self initWithFilePaths:a3 isSensitive:1 protectionType:a4];
}

- (EFProtectedFileGroup)initWithFilePaths:(id)a3 isSensitive:(BOOL)a4 protectionType:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v19.receiver = self;
  v19.super_class = (Class)EFProtectedFileGroup;
  v10 = [(EFProtectedFileGroup *)&v19 init];
  if (v10)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __69__EFProtectedFileGroup_initWithFilePaths_isSensitive_protectionType___block_invoke;
    v16[3] = &unk_1E6122F78;
    BOOL v18 = a4;
    id v17 = v9;
    uint64_t v11 = objc_msgSend(v8, "ef_map:", v16);
    files = v10->_files;
    v10->_files = (NSArray *)v11;

    v13 = (_EFBackgroundProcessingAssertion *)-[_EFBackgroundProcessingAssertion initWithProtectedFiles:]([_EFBackgroundProcessingAssertion alloc], v10->_files);
    assertion = v10->_assertion;
    v10->_assertion = v13;
  }
  return v10;
}

id *__69__EFProtectedFileGroup_initWithFilePaths_isSensitive_protectionType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = -[_EFProtectedFile initWithFilePath:isSensitive:protectionType:]((id *)[_EFProtectedFile alloc], v3, *(unsigned char *)(a1 + 40), *(void **)(a1 + 32));

  return v4;
}

- (BOOL)backgroundProcessingIsAllowed
{
  v2 = [(EFProtectedFileGroup *)self assertion];
  unsigned __int8 v3 = -[_EFBackgroundProcessingAssertion isActive](v2);

  return v3;
}

- (id)requestBackgroundProcessingForDuration:(double)a3 error:(id *)a4
{
  uint64_t v11 = 0;
  v7 = [(EFProtectedFileGroup *)self assertion];
  LODWORD(a4) = -[_EFBackgroundProcessingAssertion incrementAssertionForDuration:outResetCount:error:]((uint64_t)v7, &v11, a4, a3);

  if (a4)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __69__EFProtectedFileGroup_requestBackgroundProcessingForDuration_error___block_invoke;
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

void __69__EFProtectedFileGroup_requestBackgroundProcessingForDuration_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) assertion];
  -[_EFBackgroundProcessingAssertion decrementAssertionWithResetCount:]((uint64_t)v2, *(void *)(a1 + 40));
}

- (NSArray)files
{
  return self->_files;
}

- (_EFBackgroundProcessingAssertion)assertion
{
  return self->_assertion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_files, 0);
}

@end