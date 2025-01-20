@interface _CPLPrequeliteHasSomethingTodoNow
- (NSData)sql;
- (_CPLPrequeliteHasSomethingTodoNow)initWithSQL:(id)a3 now:(id)a4;
- (id)bindValuesToKeepAlive;
- (int)bindWithStatement:(sqlite3_stmt *)a3 startingAtIndex:(int)a4;
@end

@implementation _CPLPrequeliteHasSomethingTodoNow

- (_CPLPrequeliteHasSomethingTodoNow)initWithSQL:(id)a3 now:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_CPLPrequeliteHasSomethingTodoNow;
  v9 = [(_CPLPrequeliteHasSomethingTodoNow *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_now, a4);
    objc_storeStrong((id *)&v10->_sql, a3);
  }

  return v10;
}

- (int)bindWithStatement:(sqlite3_stmt *)a3 startingAtIndex:(int)a4
{
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