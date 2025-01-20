@interface _EXConnectionHandlerExtension
- (BOOL)shouldAcceptConnection:(id)a3;
- (Class)delegateClass;
- (_EXConnectionHandler)connectionHandler;
- (id)principalObject;
- (void)setConnectionHandler:(id)a3;
- (void)setPrincipalObject:(id)a3;
- (void)willFinishLaunching;
@end

@implementation _EXConnectionHandlerExtension

- (Class)delegateClass
{
  return 0;
}

- (void)willFinishLaunching
{
  v0 = NSStringFromClass(0);
  v7 = NSStringFromClass(0);
}

- (BOOL)shouldAcceptConnection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_EXConnectionHandlerExtension *)self connectionHandler];

  if (v5)
  {
    uint64_t v6 = [(_EXConnectionHandlerExtension *)self connectionHandler];
    char v7 = [v6 shouldAcceptXPCConnection:v4];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)principalObject
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setPrincipalObject:(id)a3
{
}

- (_EXConnectionHandler)connectionHandler
{
  return (_EXConnectionHandler *)objc_getProperty(self, a2, 48, 1);
}

- (void)setConnectionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionHandler, 0);

  objc_storeStrong(&self->_principalObject, 0);
}

@end