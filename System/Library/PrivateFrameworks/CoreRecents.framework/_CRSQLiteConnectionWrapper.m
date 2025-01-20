@interface _CRSQLiteConnectionWrapper
- (BOOL)isWriter;
- (CRSQLiteConnection)connection;
- (_CRSQLiteConnectionWrapper)initWithConnection:(id)a3 generation:(unint64_t)a4;
- (unint64_t)generation;
- (void)dealloc;
- (void)setIsWriter:(BOOL)a3;
@end

@implementation _CRSQLiteConnectionWrapper

- (void)setIsWriter:(BOOL)a3
{
  self->_isWriter = a3;
}

- (BOOL)isWriter
{
  return self->_isWriter;
}

- (unint64_t)generation
{
  return self->_generation;
}

- (CRSQLiteConnection)connection
{
  return self->_connection;
}

- (_CRSQLiteConnectionWrapper)initWithConnection:(id)a3 generation:(unint64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_CRSQLiteConnectionWrapper;
  v6 = [(_CRSQLiteConnectionWrapper *)&v8 init];
  if (v6)
  {
    v6->_connection = (CRSQLiteConnection *)a3;
    v6->_generation = a4;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_CRSQLiteConnectionWrapper;
  [(_CRSQLiteConnectionWrapper *)&v3 dealloc];
}

@end