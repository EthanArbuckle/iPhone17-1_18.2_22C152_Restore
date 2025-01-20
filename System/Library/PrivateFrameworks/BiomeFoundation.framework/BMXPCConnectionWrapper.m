@interface BMXPCConnectionWrapper
- (BOOL)isValid;
- (NSXPCConnection)connection;
- (id)_initWithConnection:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setIsValid:(BOOL)a3;
@end

@implementation BMXPCConnectionWrapper

- (id)_initWithConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BMXPCConnectionWrapper;
  v6 = [(BMXPCConnectionWrapper *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_isValid = v5 != 0;
    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v7;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void).cxx_destruct
{
}

- (void)dealloc
{
  [(BMXPCConnectionWrapper *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BMXPCConnectionWrapper;
  [(BMXPCConnectionWrapper *)&v3 dealloc];
}

- (void)invalidate
{
  [(BMXPCConnectionWrapper *)self setIsValid:0];
  connection = self->_connection;
  [(NSXPCConnection *)connection invalidate];
}

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

@end