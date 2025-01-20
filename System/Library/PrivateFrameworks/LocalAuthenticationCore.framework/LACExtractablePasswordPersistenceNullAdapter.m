@interface LACExtractablePasswordPersistenceNullAdapter
- (BOOL)stashPassword:(id)a3 error:(id *)a4;
- (id)_serviceNotSupportedInCurrentPlatform;
- (id)extractPassword:(id *)a3;
- (void)extractPasswordWithCompletion:(id)a3;
- (void)stashPassword:(id)a3 completion:(id)a4;
@end

@implementation LACExtractablePasswordPersistenceNullAdapter

- (id)extractPassword:(id *)a3
{
  if (a3)
  {
    *a3 = [(LACExtractablePasswordPersistenceNullAdapter *)self _serviceNotSupportedInCurrentPlatform];
  }
  return 0;
}

- (void)extractPasswordWithCompletion:(id)a3
{
  id v5 = a3;
  id v6 = [(LACExtractablePasswordPersistenceNullAdapter *)self _serviceNotSupportedInCurrentPlatform];
  (*((void (**)(id, void, id))a3 + 2))(v5, 0, v6);
}

- (void)stashPassword:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(LACExtractablePasswordPersistenceNullAdapter *)self _serviceNotSupportedInCurrentPlatform];
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (BOOL)stashPassword:(id)a3 error:(id *)a4
{
  if (a4)
  {
    *a4 = [(LACExtractablePasswordPersistenceNullAdapter *)self _serviceNotSupportedInCurrentPlatform];
  }
  return 0;
}

- (id)_serviceNotSupportedInCurrentPlatform
{
  return +[LACError errorWithCode:-1020 debugDescription:@"Service not available in this platform"];
}

@end