@interface FLSQLiteQuery
+ (id)queryWithString:(id)a3;
- (NSString)queryString;
- (id)bindHandler;
- (id)rowHandler;
- (void)setBindHandler:(id)a3;
- (void)setQueryString:(id)a3;
- (void)setRowHandler:(id)a3;
@end

@implementation FLSQLiteQuery

- (void).cxx_destruct
{
  objc_storeStrong(&self->_rowHandler, 0);
  objc_storeStrong(&self->_bindHandler, 0);

  objc_storeStrong((id *)&self->_queryString, 0);
}

- (void)setRowHandler:(id)a3
{
}

- (void)setBindHandler:(id)a3
{
}

- (id)bindHandler
{
  return self->_bindHandler;
}

- (NSString)queryString
{
  return self->_queryString;
}

+ (id)queryWithString:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(FLSQLiteQuery);
  [(FLSQLiteQuery *)v4 setQueryString:v3];

  return v4;
}

- (void)setQueryString:(id)a3
{
}

- (id)rowHandler
{
  return self->_rowHandler;
}

@end