@interface LACExtractablePasswordPersistenceStandardAdapter
- (BOOL)_verifyHasRequiredPasswordLength:(id)a3 error:(id *)a4;
- (BOOL)stashPassword:(id)a3 error:(id *)a4;
- (LACExtractablePasswordPersistenceStandardAdapter)initWithOptions:(id)a3;
- (id)extractPassword:(id *)a3;
- (void)extractPasswordWithCompletion:(id)a3;
- (void)stashPassword:(id)a3 completion:(id)a4;
@end

@implementation LACExtractablePasswordPersistenceStandardAdapter

- (LACExtractablePasswordPersistenceStandardAdapter)initWithOptions:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LACExtractablePasswordPersistenceStandardAdapter;
  v5 = [(LACExtractablePasswordPersistenceStandardAdapter *)&v10 init];
  if (v5)
  {
    v6 = [v4 contextProvider];
    uint64_t v7 = [v6 createContext];
    context = v5->_context;
    v5->_context = (LACContext *)v7;
  }
  return v5;
}

- (id)extractPassword:(id *)a3
{
  return (id)[(LACContext *)self->_context coreCredentialOfType:-9 error:a3];
}

- (void)extractPasswordWithCompletion:(id)a3
{
  context = self->_context;
  if (context) {
    [(LACContext *)context coreCredentialOfType:-9 reply:a3];
  }
  else {
    (*((void (**)(id, void, void))a3 + 2))(a3, 0, 0);
  }
}

- (BOOL)stashPassword:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(LACExtractablePasswordPersistenceStandardAdapter *)self _verifyHasRequiredPasswordLength:v6 error:a4])
  {
    context = self->_context;
    id v12 = 0;
    char v8 = [(LACContext *)context setCoreCredential:v6 type:-9 error:&v12];
    id v9 = v12;
    objc_super v10 = v9;
    if (a4 && (v8 & 1) == 0) {
      *a4 = v9;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)stashPassword:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v13 = 0;
  BOOL v8 = [(LACExtractablePasswordPersistenceStandardAdapter *)self _verifyHasRequiredPasswordLength:v6 error:&v13];
  id v9 = v13;
  if (v8)
  {
    context = self->_context;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __77__LACExtractablePasswordPersistenceStandardAdapter_stashPassword_completion___block_invoke;
    v11[3] = &unk_2653B56B0;
    id v12 = v7;
    [(LACContext *)context setCoreCredential:v6 type:-9 reply:v11];
  }
  else
  {
    (*((void (**)(id, id))v7 + 2))(v7, v9);
  }
}

uint64_t __77__LACExtractablePasswordPersistenceStandardAdapter_stashPassword_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_verifyHasRequiredPasswordLength:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if ([v5 length] && (unint64_t)objc_msgSend(v5, "length") <= 0x80)
  {
    LOBYTE(a4) = 1;
  }
  else if (a4)
  {
    id v6 = objc_msgSend(NSString, "stringWithFormat:", @"The provided data should have between %d and %d bytes", 1, 128);
    *a4 = +[LACError errorWithCode:-1001 debugDescription:v6];

    LOBYTE(a4) = 0;
  }

  return (char)a4;
}

- (void).cxx_destruct
{
}

@end