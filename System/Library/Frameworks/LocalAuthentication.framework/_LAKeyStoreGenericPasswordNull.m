@interface _LAKeyStoreGenericPasswordNull
- (NSString)identifier;
- (_LAKeyStoreGenericPasswordNull)init;
- (void)fetchDataWithContext:(id)a3 completion:(id)a4;
@end

@implementation _LAKeyStoreGenericPasswordNull

- (_LAKeyStoreGenericPasswordNull)init
{
  v7.receiver = self;
  v7.super_class = (Class)_LAKeyStoreGenericPasswordNull;
  v2 = [(_LAKeyStoreGenericPasswordNull *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v4 = [v3 UUIDString];
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v4;
  }
  return v2;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)fetchDataWithContext:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = +[LAAuthorizationError resourceNotFound];
  (*((void (**)(id, void, id))a4 + 2))(v5, 0, v6);
}

- (void).cxx_destruct
{
}

@end