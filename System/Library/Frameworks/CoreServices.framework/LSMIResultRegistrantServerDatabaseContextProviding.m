@interface LSMIResultRegistrantServerDatabaseContextProviding
- (LSMIResultRegistrantServerDatabaseContextProviding)init;
- (id).cxx_construct;
- (id)databaseContextWithError:(id *)a3;
- (void)armSaveTimerIfNecessary:(id)a3;
@end

@implementation LSMIResultRegistrantServerDatabaseContextProviding

- (LSMIResultRegistrantServerDatabaseContextProviding)init
{
  _LSAssertRunningInServer((uint64_t)"-[LSMIResultRegistrantServerDatabaseContextProviding init]");
  v4.receiver = self;
  v4.super_class = (Class)LSMIResultRegistrantServerDatabaseContextProviding;
  return [(LSMIResultRegistrantServerDatabaseContextProviding *)&v4 init];
}

- (id)databaseContextWithError:(id *)a3
{
  p_ctx = &self->_ctx;
  +[_LSDServiceDomain defaultServiceDomain]();
  v6 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)p_ctx, v6, 0);

  if (v7)
  {
    v8 = [[LSMIResultRegistrantTrueDatabaseContext alloc] initWithDatabase:*v7];
    v9 = 0;
    if (!a3) {
      goto LABEL_10;
    }
  }
  else
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    v10 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)p_ctx, v10, 0);

    if (v11) {
      v9 = 0;
    }
    else {
      v9 = self->_ctx._error;
    }
    v8 = 0;
    if (!a3) {
      goto LABEL_10;
    }
  }
  if (!v8) {
    *a3 = v9;
  }
LABEL_10:

  return v8;
}

- (void)armSaveTimerIfNecessary:(id)a3
{
  id v3 = a3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __78__LSMIResultRegistrantServerDatabaseContextProviding_armSaveTimerIfNecessary___block_invoke;
  v5[3] = &unk_1E5230D38;
  id v6 = v3;
  id v4 = v3;
  _LSArmSaveTimerWithObserver(5, v5);
}

void __78__LSMIResultRegistrantServerDatabaseContextProviding_armSaveTimerIfNecessary___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v8 = a3;
  id v6 = a4;
  if (v8) {
    v7 = [[LSMIResultRegistrantTrueDatabaseContext alloc] initWithDatabase:v8];
  }
  else {
    v7 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  contextPointer = self->_ctx._contextPointer;
  if (contextPointer && self->_ctx._created) {
    _LSContextDestroy((void **)&contextPointer->db);
  }
  db = self->_ctx._contextStorage.db;
  self->_ctx._contextPointer = 0;
  self->_ctx._contextStorage.db = 0;

  self->_ctx._created = 0;
  error = self->_ctx._error;
  self->_ctx._error = 0;

  id v6 = self->_ctx._contextStorage.db;
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((unsigned char *)self + 24) = 0;
  return self;
}

@end