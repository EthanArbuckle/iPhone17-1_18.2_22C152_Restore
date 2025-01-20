@interface SQLiteCursor
- (void)dealloc;
@end

@implementation SQLiteCursor

- (void)dealloc
{
  free(self->_columnDeclaredTypes);
  v3.receiver = self;
  v3.super_class = (Class)SQLiteCursor;
  [(SQLiteCursor *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statementWrapper, 0);
  objc_storeStrong((id *)&self->_columnNames, 0);
  objc_storeStrong(&self->_columnKeySet, 0);

  objc_storeStrong((id *)&self->_columnIndexByName, 0);
}

@end