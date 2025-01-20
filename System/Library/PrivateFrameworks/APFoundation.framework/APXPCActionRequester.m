@interface APXPCActionRequester
+ (APUnfairLock)unfairLock;
+ (BOOL)canShareConnection;
+ (id)machService;
- (APXPCActionRequester)init;
- (APXPCRemoteConnection)connection;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSUUID)delegateID;
- (Protocol)exportedInterface;
- (id)exportedObject;
- (id)remoteObjectInterface;
- (id)remoteObjectProxy;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (id)xpcConnection;
- (void)connectionInterrupted;
- (void)connectionInvalidated;
- (void)dealloc;
- (void)finished;
- (void)setConnection:(id)a3;
- (void)setDelegateID:(id)a3;
- (void)setRemoteObjectProxy:(id)a3;
@end

@implementation APXPCActionRequester

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (v5 = objc_opt_class(), [v5 isEqual:objc_opt_class()]))
  {
    delegateID = self->_delegateID;
    v7 = [v4 delegateID];
    char v8 = [(NSUUID *)delegateID isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)dealloc
{
  [(APXPCActionRequester *)self finished];
  v3.receiver = self;
  v3.super_class = (Class)APXPCActionRequester;
  [(APXPCActionRequester *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateID, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_remoteObjectProxy, 0);
  objc_storeStrong(&self->_exportedObject, 0);
  objc_storeStrong((id *)&self->_exportedInterface, 0);
}

- (APXPCActionRequester)init
{
  v6.receiver = self;
  v6.super_class = (Class)APXPCActionRequester;
  v2 = [(APXPCActionRequester *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F29128] UUID];
    delegateID = v2->_delegateID;
    v2->_delegateID = (NSUUID *)v3;
  }
  return v2;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(APXPCActionRequester *)self xpcConnection];
  objc_super v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (id)remoteObjectProxy
{
  v2 = [(APXPCActionRequester *)self xpcConnection];
  uint64_t v3 = [v2 remoteObjectProxy];

  return v3;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(APXPCActionRequester *)self delegateID];
  objc_super v6 = [v3 stringWithFormat:@"%@.%@", v4, v5];

  return (NSString *)v6;
}

- (NSUUID)delegateID
{
  return self->_delegateID;
}

- (id)xpcConnection
{
  uint64_t v3 = +[APXPCActionRequester unfairLock];
  [v3 lock];
  if (!self->_connection)
  {
    if ([(id)objc_opt_class() canShareConnection]) {
      +[APXPCRemoteConnection sharedConnectionFor:self];
    }
    else {
    uint64_t v4 = +[APXPCRemoteConnection connectionFor:self];
    }
    connection = self->_connection;
    self->_connection = v4;
  }
  objc_super v6 = [(APXPCRemoteConnection *)self->_connection xpcConnection];
  [v3 unlock];

  return v6;
}

- (void)finished
{
  id v5 = +[APXPCActionRequester unfairLock];
  [v5 lock];
  connection = self->_connection;
  if (connection)
  {
    [(APXPCRemoteConnection *)connection invalidateForDelegate:self];
    uint64_t v4 = self->_connection;
    self->_connection = 0;
  }
  [v5 unlock];
}

+ (APUnfairLock)unfairLock
{
  if (qword_1EB789B50 != -1) {
    dispatch_once(&qword_1EB789B50, &unk_1F2E9CD30);
  }
  v2 = (void *)qword_1EB789B40;
  return (APUnfairLock *)v2;
}

- (Protocol)exportedInterface
{
  return self->_exportedInterface;
}

- (id)remoteObjectInterface
{
  uint64_t v3 = NSString;
  uint64_t v4 = NSStringFromSelector(a2);
  id v5 = [v3 stringWithFormat:@"You must override %@ in a subclass", v4];
  APSimulateCrash(5, v5, 1u);

  objc_super v6 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v7 = *MEMORY[0x1E4F1C3B8];
  char v8 = NSString;
  v9 = NSStringFromSelector(a2);
  v10 = [v8 stringWithFormat:@"You must override %@ in a subclass", v9];
  id v11 = [v6 exceptionWithName:v7 reason:v10 userInfo:0];

  objc_exception_throw(v11);
}

- (void)connectionInterrupted
{
  uint64_t v3 = NSString;
  uint64_t v4 = NSStringFromSelector(a2);
  id v5 = [v3 stringWithFormat:@"You must override %@ in a subclass", v4];
  APSimulateCrash(5, v5, 1u);

  objc_super v6 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v7 = *MEMORY[0x1E4F1C3B8];
  char v8 = NSString;
  v9 = NSStringFromSelector(a2);
  v10 = [v8 stringWithFormat:@"You must override %@ in a subclass", v9];
  id v11 = [v6 exceptionWithName:v7 reason:v10 userInfo:0];

  objc_exception_throw(v11);
}

- (void)connectionInvalidated
{
  uint64_t v3 = NSString;
  uint64_t v4 = NSStringFromSelector(a2);
  id v5 = [v3 stringWithFormat:@"You must override %@ in a subclass", v4];
  APSimulateCrash(5, v5, 1u);

  objc_super v6 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v7 = *MEMORY[0x1E4F1C3B8];
  char v8 = NSString;
  v9 = NSStringFromSelector(a2);
  v10 = [v8 stringWithFormat:@"You must override %@ in a subclass", v9];
  id v11 = [v6 exceptionWithName:v7 reason:v10 userInfo:0];

  objc_exception_throw(v11);
}

+ (BOOL)canShareConnection
{
  uint64_t v3 = NSString;
  uint64_t v4 = NSStringFromSelector(a2);
  id v5 = [v3 stringWithFormat:@"You must override %@ in a subclass", v4];
  APSimulateCrash(5, v5, 1u);

  objc_super v6 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v7 = *MEMORY[0x1E4F1C3B8];
  char v8 = NSString;
  v9 = NSStringFromSelector(a2);
  v10 = [v8 stringWithFormat:@"You must override %@ in a subclass", v9];
  id v11 = [v6 exceptionWithName:v7 reason:v10 userInfo:0];

  objc_exception_throw(v11);
}

+ (id)machService
{
  uint64_t v3 = NSString;
  uint64_t v4 = NSStringFromSelector(a2);
  id v5 = [v3 stringWithFormat:@"You must override %@ in a subclass", v4];
  APSimulateCrash(5, v5, 1u);

  objc_super v6 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v7 = *MEMORY[0x1E4F1C3B8];
  char v8 = NSString;
  v9 = NSStringFromSelector(a2);
  v10 = [v8 stringWithFormat:@"You must override %@ in a subclass", v9];
  id v11 = [v6 exceptionWithName:v7 reason:v10 userInfo:0];

  objc_exception_throw(v11);
}

- (id)exportedObject
{
  return self->_exportedObject;
}

- (void)setRemoteObjectProxy:(id)a3
{
}

- (APXPCRemoteConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void)setDelegateID:(id)a3
{
}

@end