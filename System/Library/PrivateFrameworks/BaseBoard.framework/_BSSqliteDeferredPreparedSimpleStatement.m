@interface _BSSqliteDeferredPreparedSimpleStatement
- (BOOL)executeWithBindings:(id)a3 resultRowHandler:(id)a4 error:(id *)a5;
@end

@implementation _BSSqliteDeferredPreparedSimpleStatement

- (BOOL)executeWithBindings:(id)a3 resultRowHandler:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if (self->_deferredSql)
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2020000000;
    int v21 = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._dbConnection);
    v12 = WeakRetained;
    if (!WeakRetained)
    {
      int v13 = 21;
      *((_DWORD *)v19 + 6) = 21;
      if (!a5)
      {
LABEL_8:

        _Block_object_dispose(&v18, 8);
LABEL_12:
        BOOL v14 = 0;
        goto LABEL_13;
      }
LABEL_7:
      -[_BSSqlitePreparedSimpleStatement _sqliteError:]((uint64_t)self, v13);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __87___BSSqliteDeferredPreparedSimpleStatement_executeWithBindings_resultRowHandler_error___block_invoke;
    v17[3] = &unk_1E5445750;
    v17[4] = self;
    v17[5] = &v18;
    v17[6] = a2;
    -[BSSqliteDatabaseConnection performSyncWithDatabase:]((uint64_t)WeakRetained, (uint64_t)v17);
    int v13 = *((_DWORD *)v19 + 6);
    if (v13)
    {
      if (!a5) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }

    _Block_object_dispose(&v18, 8);
  }
  if (!self->super._statement) {
    goto LABEL_12;
  }
  v16.receiver = self;
  v16.super_class = (Class)_BSSqliteDeferredPreparedSimpleStatement;
  BOOL v14 = [(_BSSqlitePreparedSimpleStatement *)&v16 executeWithBindings:v9 resultRowHandler:v10 error:a5];
LABEL_13:

  return v14;
}

- (void).cxx_destruct
{
}

@end