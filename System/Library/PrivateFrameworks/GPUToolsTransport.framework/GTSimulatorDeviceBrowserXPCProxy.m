@interface GTSimulatorDeviceBrowserXPCProxy
- (BOOL)isSimulatorDevice:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (GTSimulatorDeviceBrowserXPCProxy)initWithConnection:(id)a3 remoteProperties:(id)a4;
- (id)deviceProperties:(id)a3 error:(id *)a4;
@end

@implementation GTSimulatorDeviceBrowserXPCProxy

- (GTSimulatorDeviceBrowserXPCProxy)initWithConnection:(id)a3 remoteProperties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)GTSimulatorDeviceBrowserXPCProxy;
  v8 = [(GTSimulatorDeviceBrowserXPCProxy *)&v23 init];
  if (v8)
  {
    v9 = &unk_26EFB9690;
    v10 = [v7 protocolName];
    v11 = NSStringFromProtocol((Protocol *)v9);
    int v12 = [v10 isEqualToString:v11];

    if (!v12)
    {

      v21 = 0;
      goto LABEL_6;
    }
    v13 = [GTServiceConnection alloc];
    v14 = [v7 deviceUDID];
    uint64_t v15 = -[GTServiceConnection initWithConnection:device:port:](v13, "initWithConnection:device:port:", v6, v14, [v7 servicePort]);
    connection = v8->_connection;
    v8->_connection = (GTServiceConnection *)v15;

    v17 = +[GTServiceProperties protocolMethods:v9];
    v18 = [v7 protocolMethods];
    uint64_t v19 = newSetWithArrayMinusArray(v17, v18);
    ignoreMethods = v8->_ignoreMethods;
    v8->_ignoreMethods = (NSSet *)v19;
  }
  v21 = v8;
LABEL_6:

  return v21;
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
    v9.super_class = (Class)GTSimulatorDeviceBrowserXPCProxy;
    BOOL v7 = [(GTSimulatorDeviceBrowserXPCProxy *)&v9 respondsToSelector:a3];
  }

  return v7;
}

- (BOOL)isSimulatorDevice:(id)a3
{
  id v5 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  id v8 = v5;
  objc_super v9 = (const char *)[v8 UTF8String];

  xpc_dictionary_set_string(empty, "deviceUDID", v9);
  v10 = [(GTServiceConnection *)self->_connection sendMessageWithReplySync:empty error:0];
  v11 = v10;
  if (v10) {
    BOOL v12 = xpc_dictionary_get_BOOL(v10, "returnValue");
  }
  else {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)deviceProperties:(id)a3 error:(id *)a4
{
  id v7 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  id v10 = v7;
  v11 = (const char *)[v10 UTF8String];

  xpc_dictionary_set_string(empty, "deviceUDID", v11);
  BOOL v12 = [(GTServiceConnection *)self->_connection sendMessageWithReplySync:empty error:a4];
  if (v12)
  {
    uint64_t v13 = objc_opt_class();
    nsobject = xpc_dictionary_get_nsobject(v12, "returnValue", v13);
    if (a4) {
      *a4 = (id)xpc_dictionary_get_nserror(v12, "error");
    }
  }
  else
  {
    nsobject = 0;
  }

  return nsobject;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoreMethods, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end