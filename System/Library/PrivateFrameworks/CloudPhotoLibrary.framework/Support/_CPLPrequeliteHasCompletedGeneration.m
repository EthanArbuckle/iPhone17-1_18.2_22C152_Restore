@interface _CPLPrequeliteHasCompletedGeneration
- (NSData)sql;
- (_CPLPrequeliteHasCompletedGeneration)initWithSQL:(id)a3 generation:(int64_t)a4 now:(id)a5;
- (id)bindValuesToKeepAlive;
- (int)bindWithStatement:(sqlite3_stmt *)a3 startingAtIndex:(int)a4;
@end

@implementation _CPLPrequeliteHasCompletedGeneration

- (_CPLPrequeliteHasCompletedGeneration)initWithSQL:(id)a3 generation:(int64_t)a4 now:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_CPLPrequeliteHasCompletedGeneration;
  v11 = [(_CPLPrequeliteHasCompletedGeneration *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_generation = a4;
    objc_storeStrong((id *)&v11->_sql, a3);
    objc_storeStrong((id *)&v12->_now, a5);
  }

  return v12;
}

- (int)bindWithStatement:(sqlite3_stmt *)a3 startingAtIndex:(int)a4
{
  sqlite3_bind_int64(a3, a4, self->_generation);
  now = self->_now;
  if (!now) {
    return 1;
  }
  [(PQLBindable *)now sqliteBind:a3 index:(a4 + 1)];
  return 2;
}

- (id)bindValuesToKeepAlive
{
  return self->_now;
}

- (NSData)sql
{
  return self->_sql;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sql, 0);
  objc_storeStrong((id *)&self->_now, 0);
}

@end