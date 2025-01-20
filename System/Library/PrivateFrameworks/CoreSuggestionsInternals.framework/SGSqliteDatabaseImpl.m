@interface SGSqliteDatabaseImpl
- (BOOL)handleError:(int64_t)a3 sqliteError:(int)a4 forQuery:(id)a5 onError:(id)a6;
- (SGSqliteDatabaseImpl)initWithFilename:(id)a3 flags:(int)a4 error:(id *)a5 sgDb:(id)a6;
@end

@implementation SGSqliteDatabaseImpl

- (void).cxx_destruct
{
}

- (BOOL)handleError:(int64_t)a3 sqliteError:(int)a4 forQuery:(id)a5 onError:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  if ((unint64_t)a3 >= 6) {
    int64_t v8 = -1;
  }
  else {
    int64_t v8 = a3;
  }
  p_sgDb = &self->_sgDb;
  id v10 = a6;
  id v11 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)p_sgDb);
  char v13 = [WeakRetained handleError:v8 sqliteError:v7 forQuery:v11 onError:v10];

  return v13;
}

- (SGSqliteDatabaseImpl)initWithFilename:(id)a3 flags:(int)a4 error:(id *)a5 sgDb:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v10 = a6;
  v14.receiver = self;
  v14.super_class = (Class)SGSqliteDatabaseImpl;
  id v11 = [(SGSqliteDatabaseImpl *)&v14 initWithFilename:a3 flags:v7 error:a5 errorHandler:0];
  v12 = v11;
  if (v11) {
    objc_storeWeak((id *)&v11->_sgDb, v10);
  }

  return v12;
}

@end