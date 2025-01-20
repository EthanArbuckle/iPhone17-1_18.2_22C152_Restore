@interface CKSQLiteStatement
- (void)bindText:(id)a3 atIndex:(unint64_t)a4;
- (void)invalidate:(id)a3;
@end

@implementation CKSQLiteStatement

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporaryBoundObjects, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_SQL, 0);

  objc_destroyWeak((id *)&self->_SQLite);
}

- (void)bindText:(id)a3 atIndex:(unint64_t)a4
{
  v7 = (const char *)a3;
  v10 = (char *)v7;
  v22 = (char *)v7;
  if (!self->_reset)
  {
    v20 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v7, v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v20, v21, (uint64_t)a2, (uint64_t)self, @"CKSQLiteStatement.m", 240, @"Statement is not reset: \"%@\"", self->_SQL);

    v10 = v22;
    if (v22) {
      goto LABEL_3;
    }
LABEL_7:
    sub_18B140C14((uint64_t)self, a4);
    goto LABEL_8;
  }
  if (!v7) {
    goto LABEL_7;
  }
LABEL_3:
  id v11 = sub_18AF27A7C(self, v10);
  handle = self->_handle;
  if (handle)
  {
    v13 = v22;
    v17 = (const char *)objc_msgSend_UTF8String(v13, v14, v15, v16);
    if (sqlite3_bind_text(handle, a4 + 1, v17, -1, 0)) {
      objc_msgSend_invalidate_(self, v18, @"Error binding text at %ld: \"%@\"", v19, a4, self->_SQL);
    }
  }
LABEL_8:
}

- (void)invalidate:(id)a3
{
  if (!self->_error)
  {
    p_SQLite = &self->_SQLite;
    id v5 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_SQLite);
    objc_msgSend_handleDatabaseError_args_(WeakRetained, v7, (uint64_t)v5, (uint64_t)&v10);
    uint64_t v8 = (NSError *)objc_claimAutoreleasedReturnValue();

    error = self->_error;
    self->_error = v8;

    if (self->_error) {
      sub_18AF27574((uint64_t)self);
    }
  }
}

@end