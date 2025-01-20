@interface GTServiceProviderXPCProxy
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)waitForService:(id)a3 error:(id *)a4;
- (GTServiceProviderXPCProxy)initWithConnection:(id)a3 remoteProperties:(id)a4;
- (id)allServices;
- (unint64_t)registerObserver:(id)a3;
- (void)deregisterObserver:(unint64_t)a3;
- (void)deregisterService:(unint64_t)a3;
- (void)registerService:(id)a3 forProcess:(id)a4;
- (void)waitForService:(id)a3 completionHandler:(id)a4;
@end

@implementation GTServiceProviderXPCProxy

- (GTServiceProviderXPCProxy)initWithConnection:(id)a3 remoteProperties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)GTServiceProviderXPCProxy;
  v8 = [(GTServiceProviderXPCProxy *)&v30 init];
  if (!v8) {
    goto LABEL_4;
  }
  os_log_t v9 = os_log_create("com.apple.gputools.transport", "ServiceProviderProxy");
  log = v8->_log;
  v8->_log = (OS_os_log *)v9;

  v11 = &unk_26EFBED88;
  v12 = [v7 protocolName];
  v13 = NSStringFromProtocol((Protocol *)v11);
  char v14 = [v12 isEqualToString:v13];

  if (v14)
  {
    uint64_t v15 = [v7 deviceUDID];
    deviceUDID = v8->_deviceUDID;
    v8->_deviceUDID = (NSString *)v15;

    v17 = [GTServiceConnection alloc];
    v18 = [v7 deviceUDID];
    uint64_t v19 = -[GTServiceConnection initWithConnection:device:port:](v17, "initWithConnection:device:port:", v6, v18, [v7 servicePort]);
    connection = v8->_connection;
    v8->_connection = (GTServiceConnection *)v19;

    v21 = +[GTServiceProperties protocolMethods:v11];
    v22 = [v7 protocolMethods];
    uint64_t v23 = newSetWithArrayMinusArray(v21, v22);
    ignoreMethods = v8->_ignoreMethods;
    v8->_ignoreMethods = (NSSet *)v23;

    uint64_t v25 = [MEMORY[0x263EFFA78] mutableCopy];
    observerIdToPort = v8->_observerIdToPort;
    v8->_observerIdToPort = (NSMutableDictionary *)v25;

LABEL_4:
    v27 = v8;
    goto LABEL_8;
  }
  v28 = v8->_log;
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
    -[GTServiceProviderXPCProxy initWithConnection:remoteProperties:](v28);
  }

  v27 = 0;
LABEL_8:

  return v27;
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
    v9.super_class = (Class)GTServiceProviderXPCProxy;
    BOOL v7 = [(GTServiceProviderXPCProxy *)&v9 respondsToSelector:a3];
  }

  return v7;
}

- (id)allServices
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  id v6 = [(GTServiceConnection *)self->_connection sendMessageWithReplySync:empty error:0];
  if (v6)
  {
    uint64_t v7 = objc_opt_class();
    nsarray = (void *)xpc_dictionary_get_nsarray(v6, "returnValue", v7);
  }
  else
  {
    nsarray = 0;
  }

  return nsarray;
}

- (void)registerService:(id)a3 forProcess:(id)a4
{
  id v16 = a3;
  id v7 = a4;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "serviceProperties", (uint64_t)v16);
  xpc_dictionary_set_nsobject(empty, "processInfo", (uint64_t)v7);

  v10 = [(GTServiceConnection *)self->_connection sendMessageWithReplySync:empty error:0];
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v16, "setServicePort:", xpc_dictionary_get_uint64(v10, "servicePort"));
    v12 = NSString;
    string = xpc_dictionary_get_string(v11, "deviceUDID");
    if (string) {
      char v14 = string;
    }
    else {
      char v14 = "";
    }
    uint64_t v15 = [v12 stringWithUTF8String:v14];
    [v16 setDeviceUDID:v15];
  }
  else
  {
    [v16 setServicePort:0];
    [v16 setDeviceUDID:0];
  }
}

- (void)waitForService:(id)a3 completionHandler:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  id v11 = v8;
  v12 = (const char *)[v11 UTF8String];

  xpc_dictionary_set_string(empty, "protocolName", v12);
  connection = self->_connection;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __62__GTServiceProviderXPCProxy_waitForService_completionHandler___block_invoke;
  v15[3] = &unk_264E28B60;
  id v16 = v7;
  id v14 = v7;
  [(GTServiceConnection *)connection sendMessage:empty replyHandler:v15];
}

void __62__GTServiceProviderXPCProxy_waitForService_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2)
  {
    id nserror = (id)xpc_dictionary_get_nserror(a2, "error");
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, nserror);
  }
  else
  {
    v4 = *(void (**)(uint64_t, uint64_t))(v3 + 16);
    uint64_t v5 = *(void *)(a1 + 32);
    v4(v5, a3);
  }
}

- (BOOL)waitForService:(id)a3 error:(id *)a4
{
  id v7 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  id v10 = v7;
  id v11 = (const char *)[v10 UTF8String];

  xpc_dictionary_set_string(empty, "protocolName", v11);
  uint64_t v12 = [(GTServiceConnection *)self->_connection sendMessageWithReplySync:empty error:a4];
  v13 = (void *)v12;
  if (v12)
  {
    id nserror = (void *)xpc_dictionary_get_nserror(v12, "error");
    uint64_t v15 = nserror;
    BOOL v16 = nserror == 0;
    if (a4 && nserror) {
      *a4 = nserror;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (void)deregisterService:(unint64_t)a3
{
  xpc_object_t xdict = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(xdict, "_cmd", Name);
  xpc_dictionary_set_uint64(xdict, "servicePort", a3);
  [(GTServiceConnection *)self->_connection sendMessage:xdict];
}

- (unint64_t)registerObserver:(id)a3
{
  id v5 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  id v8 = [[GTServiceProviderReplyStream alloc] initWithObserver:v5];

  unint64_t v9 = [(GTServiceConnection *)self->_connection registerDispatcher:v8];
  id v10 = [(GTServiceConnection *)self->_connection sendMessageWithReplySync:empty replyStreamId:v9 error:0];
  id v11 = v10;
  if (v10)
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v10, "observerId");
    v13 = [NSNumber numberWithUnsignedLongLong:v9];
    observerIdToPort = self->_observerIdToPort;
    uint64_t v15 = [NSNumber numberWithUnsignedLongLong:uint64];
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
  id v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
  id v8 = [(NSMutableDictionary *)observerIdToPort objectForKeyedSubscript:v7];
  uint64_t v9 = [v8 unsignedLongValue];

  id v10 = self->_observerIdToPort;
  id v11 = [NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)v10 removeObjectForKey:v11];

  xpc_object_t xdict = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(xdict, "_cmd", Name);
  xpc_dictionary_set_uint64(xdict, "observerId", a3);
  id v13 = [(GTServiceConnection *)self->_connection sendMessageWithReplySync:xdict error:0];
  [(GTServiceConnection *)self->_connection deregisterDispatcher:v9];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerIdToPort, 0);
  objc_storeStrong((id *)&self->_deviceUDID, 0);
  objc_storeStrong((id *)&self->_ignoreMethods, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)initWithConnection:(os_log_t)log remoteProperties:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23C048000, log, OS_LOG_TYPE_ERROR, "Invalid remote properties - unable to locate remote service", v1, 2u);
}

@end