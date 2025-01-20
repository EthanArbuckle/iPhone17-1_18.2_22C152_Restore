@interface LAExtractablePassword
- (BOOL)stashPassword:(id)a3 error:(id *)a4;
- (LAExtractablePassword)init;
- (id)extractPassword:(id *)a3;
- (void)extractPasswordWithCompletion:(id)a3;
- (void)stashPassword:(id)a3 completion:(id)a4;
@end

@implementation LAExtractablePassword

- (LAExtractablePassword)init
{
  v8.receiver = self;
  v8.super_class = (Class)LAExtractablePassword;
  v2 = [(LAExtractablePassword *)&v8 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E4F72F80];
    v4 = __29__LAExtractablePassword_init__block_invoke();
    uint64_t v5 = [v3 passwordPersistenceWithOptions:v4];
    persistence = v2->_persistence;
    v2->_persistence = (LACExtractablePasswordPersistence *)v5;
  }
  return v2;
}

id __29__LAExtractablePassword_init__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F72F88]);
  v1 = objc_alloc_init(LAContextProvider);
  v2 = (void *)[v0 initWithContextProvider:v1];

  return v2;
}

- (void)extractPasswordWithCompletion:(id)a3
{
}

- (id)extractPassword:(id *)a3
{
  return (id)[(LACExtractablePasswordPersistence *)self->_persistence extractPassword:a3];
}

- (BOOL)stashPassword:(id)a3 error:(id *)a4
{
  return [(LACExtractablePasswordPersistence *)self->_persistence stashPassword:a3 error:a4];
}

- (void)stashPassword:(id)a3 completion:(id)a4
{
}

- (void).cxx_destruct
{
}

@end