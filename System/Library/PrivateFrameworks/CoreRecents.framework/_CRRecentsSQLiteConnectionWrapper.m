@interface _CRRecentsSQLiteConnectionWrapper
+ (id)wrapperWithConnection:(id)a3 forWriting:(BOOL)a4;
- (BOOL)writer;
- (CRSQLiteConnection)connection;
- (_CRRecentsSQLiteConnectionWrapper)initWithConnection:(id)a3 forWriting:(BOOL)a4;
- (unint64_t)decrementRefcount;
- (unint64_t)incrementRefcount;
- (void)dealloc;
- (void)setConnection:(id)a3;
- (void)setWriter:(BOOL)a3;
@end

@implementation _CRRecentsSQLiteConnectionWrapper

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_CRRecentsSQLiteConnectionWrapper;
  [(_CRRecentsSQLiteConnectionWrapper *)&v3 dealloc];
}

- (_CRRecentsSQLiteConnectionWrapper)initWithConnection:(id)a3 forWriting:(BOOL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_CRRecentsSQLiteConnectionWrapper;
  v6 = [(_CRRecentsSQLiteConnectionWrapper *)&v8 init];
  if (v6)
  {
    v6->_connection = (CRSQLiteConnection *)a3;
    v6->_writer = a4;
  }
  return v6;
}

- (unint64_t)incrementRefcount
{
  unint64_t v2 = self->_refcount + 1;
  self->_refcount = v2;
  return v2;
}

- (unint64_t)decrementRefcount
{
  unint64_t refcount = self->_refcount;
  if (!refcount) {
    sub_10001A834();
  }
  unint64_t v3 = refcount - 1;
  self->_unint64_t refcount = v3;
  return v3;
}

- (CRSQLiteConnection)connection
{
  return self->_connection;
}

+ (id)wrapperWithConnection:(id)a3 forWriting:(BOOL)a4
{
  v4 = [[_CRRecentsSQLiteConnectionWrapper alloc] initWithConnection:a3 forWriting:a4];
  return v4;
}

- (BOOL)writer
{
  return self->_writer;
}

- (void)setWriter:(BOOL)a3
{
  self->_writer = a3;
}

- (void)setConnection:(id)a3
{
}

@end