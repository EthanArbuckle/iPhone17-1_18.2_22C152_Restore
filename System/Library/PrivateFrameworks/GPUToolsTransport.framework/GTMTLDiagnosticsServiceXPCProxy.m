@interface GTMTLDiagnosticsServiceXPCProxy
- (BOOL)respondsToSelector:(SEL)a3;
- (GTMTLDiagnosticsServiceXPCProxy)initWithConnection:(id)a3 remoteProperties:(id)a4;
- (unint64_t)registerObserver:(id)a3;
- (void)deregisterObserver:(unint64_t)a3;
- (void)raiseRuntimeIssue:(id)a3;
@end

@implementation GTMTLDiagnosticsServiceXPCProxy

- (GTMTLDiagnosticsServiceXPCProxy)initWithConnection:(id)a3 remoteProperties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)GTMTLDiagnosticsServiceXPCProxy;
  v8 = [(GTMTLDiagnosticsServiceXPCProxy *)&v21 init];
  if (v8)
  {
    v9 = &unk_26EFBD478;
    v10 = [GTServiceConnection alloc];
    v11 = [v7 deviceUDID];
    uint64_t v12 = -[GTServiceConnection initWithConnection:device:port:](v10, "initWithConnection:device:port:", v6, v11, [v7 servicePort]);
    connection = v8->_connection;
    v8->_connection = (GTServiceConnection *)v12;

    v14 = +[GTServiceProperties protocolMethods:v9];
    v15 = [v7 protocolMethods];
    uint64_t v16 = newSetWithArrayMinusArray(v14, v15);
    ignoreMethods = v8->_ignoreMethods;
    v8->_ignoreMethods = (NSSet *)v16;

    uint64_t v18 = [MEMORY[0x263EFFA78] mutableCopy];
    observerIdToPort = v8->_observerIdToPort;
    v8->_observerIdToPort = (NSMutableDictionary *)v18;
  }
  return v8;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  ignoreMethods = self->_ignoreMethods;
  id v6 = NSStringFromSelector(a3);
  if ([(NSSet *)ignoreMethods containsObject:v6])
  {
    BOOL v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)GTMTLDiagnosticsServiceXPCProxy;
    BOOL v7 = [(GTMTLDiagnosticsServiceXPCProxy *)&v9 respondsToSelector:a3];
  }

  return v7;
}

- (unint64_t)registerObserver:(id)a3
{
  id v5 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  v8 = [[GTMTLDiagnosticsServiceReplyStream alloc] initWithObserver:v5];

  unint64_t v9 = [(GTServiceConnection *)self->_connection registerDispatcher:v8];
  v10 = [(GTServiceConnection *)self->_connection sendMessageWithReplySync:empty replyStreamId:v9 error:0];
  v11 = v10;
  if (v10)
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v10, "observerId");
    v13 = [NSNumber numberWithUnsignedLongLong:v9];
    observerIdToPort = self->_observerIdToPort;
    v15 = [NSNumber numberWithUnsignedLongLong:uint64];
    [(NSMutableDictionary *)observerIdToPort setObject:v13 forKeyedSubscript:v15];
  }
  else
  {
    uint64_t uint64 = 0;
  }

  return uint64;
}

- (void)deregisterObserver:(unint64_t)a3
{
  observerIdToPort = self->_observerIdToPort;
  BOOL v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
  v8 = [(NSMutableDictionary *)observerIdToPort objectForKeyedSubscript:v7];
  uint64_t v9 = [v8 unsignedLongValue];

  v10 = self->_observerIdToPort;
  v11 = [NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)v10 removeObjectForKey:v11];

  xpc_object_t xdict = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(xdict, "_cmd", Name);
  xpc_dictionary_set_uint64(xdict, "observerId", a3);
  id v13 = [(GTServiceConnection *)self->_connection sendMessageWithReplySync:xdict error:0];
  [(GTServiceConnection *)self->_connection deregisterDispatcher:v9];
}

- (void)raiseRuntimeIssue:(id)a3
{
  id v7 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  if (v7) {
    xpc_dictionary_set_string(empty, "messagePrefix", (const char *)[v7 UTF8String]);
  }
  [(GTServiceConnection *)self->_connection sendMessage:empty];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerIdToPort, 0);
  objc_storeStrong((id *)&self->_ignoreMethods, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end