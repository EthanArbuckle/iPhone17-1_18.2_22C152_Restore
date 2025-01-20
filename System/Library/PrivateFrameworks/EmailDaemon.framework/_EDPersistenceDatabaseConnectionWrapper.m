@interface _EDPersistenceDatabaseConnectionWrapper
- (EDPersistenceDatabaseConnection)connection;
- (EFResource)resource;
- (_EDPersistenceDatabaseConnectionWrapper)initWithConnection:(id)a3 generation:(unint64_t)a4;
- (unint64_t)generation;
- (unint64_t)type;
- (void)setResource:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation _EDPersistenceDatabaseConnectionWrapper

- (unint64_t)type
{
  return self->_type;
}

- (EFResource)resource
{
  return self->_resource;
}

- (unint64_t)generation
{
  return self->_generation;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void)setResource:(id)a3
{
}

- (EDPersistenceDatabaseConnection)connection
{
  return self->_connection;
}

- (_EDPersistenceDatabaseConnectionWrapper)initWithConnection:(id)a3 generation:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_EDPersistenceDatabaseConnectionWrapper;
  v8 = [(_EDPersistenceDatabaseConnectionWrapper *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_connection, a3);
    v9->_generation = a4;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_resource, 0);
}

@end