@interface CADStatCollectionContext
- (ACAccountStore)accountStore;
- (CADStatCollectionContext)initWithDatabase:(CalDatabase *)a3 accountStore:(id)a4;
- (CalDatabase)database;
- (void)dealloc;
- (void)setDatabase:(CalDatabase *)a3;
@end

@implementation CADStatCollectionContext

- (CADStatCollectionContext)initWithDatabase:(CalDatabase *)a3 accountStore:(id)a4
{
  id v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)CADStatCollectionContext;
  v8 = [(CADStatCollectionContext *)&v10 init];
  if (v8)
  {
    v8->_database = (CalDatabase *)CFRetain(a3);
    objc_storeStrong((id *)&v8->_accountStore, a4);
  }

  return v8;
}

- (void)dealloc
{
  CFRelease(self->_database);
  v3.receiver = self;
  v3.super_class = (Class)CADStatCollectionContext;
  [(CADStatCollectionContext *)&v3 dealloc];
}

- (CalDatabase)database
{
  result = self->_database;
  if (!result)
  {
    v4 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1BBC88000, v4, OS_LOG_TYPE_DEBUG, "Creating database for stats collection", v5, 2u);
    }
    result = (CalDatabase *)CalDatabaseCreateWithOptions();
    self->_database = result;
  }
  return result;
}

- (ACAccountStore)accountStore
{
  accountStore = self->_accountStore;
  if (!accountStore)
  {
    v4 = (ACAccountStore *)objc_alloc_init(MEMORY[0x1E4F179C8]);
    v5 = self->_accountStore;
    self->_accountStore = v4;

    accountStore = self->_accountStore;
  }
  return accountStore;
}

- (void)setDatabase:(CalDatabase *)a3
{
  self->_database = a3;
}

- (void).cxx_destruct
{
}

@end