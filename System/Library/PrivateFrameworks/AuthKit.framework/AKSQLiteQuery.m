@interface AKSQLiteQuery
+ (id)queryWithString:(id)a3;
- (BOOL)_bindStatement:(sqlite3_stmt *)a3 withParameter:(id)a4 atPosition:(int)a5;
- (BOOL)bindingFailure;
- (NSString)queryString;
- (id)bindHandler;
- (id)rowHandler;
- (void)bindParameter:(id)a3 error:(id *)a4;
- (void)bindParameters:(id)a3 error:(id *)a4;
- (void)setBindHandler:(id)a3;
- (void)setBindingFailure:(BOOL)a3;
- (void)setQueryString:(id)a3;
- (void)setRowHandler:(id)a3;
@end

@implementation AKSQLiteQuery

+ (id)queryWithString:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(AKSQLiteQuery);
  [(AKSQLiteQuery *)v4 setQueryString:v3];

  return v4;
}

- (void)bindParameter:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000BDF2C;
  v10[3] = &unk_10022B170;
  objc_copyWeak(v12, &location);
  id v11 = v6;
  v12[1] = a4;
  id v7 = v6;
  v8 = objc_retainBlock(v10);
  id bindHandler = self->_bindHandler;
  self->_id bindHandler = v8;

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

- (void)bindParameters:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000BE0F8;
  v10[3] = &unk_10022B170;
  objc_copyWeak(v12, &location);
  id v11 = v6;
  v12[1] = a4;
  id v7 = v6;
  v8 = objc_retainBlock(v10);
  id bindHandler = self->_bindHandler;
  self->_id bindHandler = v8;

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

- (BOOL)_bindStatement:(sqlite3_stmt *)a3 withParameter:(id)a4 atPosition:(int)a5
{
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v8 = sqlite3_bind_text(a3, a5, (const char *)[v7 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
LABEL_10:
    BOOL v13 = v8 == 0;
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v7 doubleValue];
LABEL_5:
    int v8 = sqlite3_bind_double(a3, a5, v9);
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v8 = sqlite3_bind_int(a3, a5, (int)[v7 intValue]);
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v7;
    id v11 = [v10 bytes];
    id v12 = [v10 length];

    int v8 = sqlite3_bind_blob64(a3, a5, v11, (sqlite3_uint64)v12, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v7 timeIntervalSince1970];
    goto LABEL_5;
  }
  v15 = _AKLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_100192FEC(v15, v16, v17, v18, v19, v20, v21, v22);
  }

  BOOL v13 = 0;
LABEL_11:

  return v13;
}

- (NSString)queryString
{
  return self->_queryString;
}

- (void)setQueryString:(id)a3
{
}

- (BOOL)bindingFailure
{
  return self->_bindingFailure;
}

- (void)setBindingFailure:(BOOL)a3
{
  self->_bindingFailure = a3;
}

- (id)bindHandler
{
  return self->_bindHandler;
}

- (void)setBindHandler:(id)a3
{
}

- (id)rowHandler
{
  return self->_rowHandler;
}

- (void)setRowHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_rowHandler, 0);
  objc_storeStrong(&self->_bindHandler, 0);

  objc_storeStrong((id *)&self->_queryString, 0);
}

@end