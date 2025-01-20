@interface CADPooledConnection
- (CADPooledConnection)initWithDatabase:(CalDatabase *)a3;
- (CalDatabase)database;
- (unint64_t)lastUsedTimestamp;
- (void)dealloc;
- (void)setDatabase:(CalDatabase *)a3;
- (void)setLastUsedTimestamp:(unint64_t)a3;
@end

@implementation CADPooledConnection

- (void)setLastUsedTimestamp:(unint64_t)a3
{
  self->_lastUsedTimestamp = a3;
}

- (CalDatabase)database
{
  return self->_database;
}

- (CADPooledConnection)initWithDatabase:(CalDatabase *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CADPooledConnection;
  v4 = [(CADPooledConnection *)&v6 init];
  if (v4)
  {
    CFRetain(a3);
    v4->_database = a3;
  }
  return v4;
}

- (void)dealloc
{
  CFRelease(self->_database);
  v3.receiver = self;
  v3.super_class = (Class)CADPooledConnection;
  [(CADPooledConnection *)&v3 dealloc];
}

- (void)setDatabase:(CalDatabase *)a3
{
  self->_database = a3;
}

- (unint64_t)lastUsedTimestamp
{
  return self->_lastUsedTimestamp;
}

@end