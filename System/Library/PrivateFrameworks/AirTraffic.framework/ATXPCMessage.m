@interface ATXPCMessage
- (ATXPCMessage)initWithName:(id)a3;
- (BOOL)needsReply;
- (NSDictionary)info;
- (NSString)name;
- (id)_createXPCMessage;
- (id)_initWithXPCMessage:(id)a3 onConnection:(id)a4;
- (void)dealloc;
- (void)sendReply:(id)a3;
- (void)setInfo:(id)a3;
@end

@implementation ATXPCMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_x_reply, 0);
  objc_storeStrong((id *)&self->_x_reply_connection, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_receivingConnection, 0);
}

- (void)setInfo:(id)a3
{
}

- (NSDictionary)info
{
  return self->_info;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)needsReply
{
  return self->_x_reply && self->_x_reply_connection != 0;
}

- (void)sendReply:(id)a3
{
  id v5 = a3;
  x_reply = self->_x_reply;
  id v10 = v5;
  if (x_reply && self->_x_reply_connection)
  {
    if (v5)
    {
      v7 = [MEMORY[0x263F08AC0] dataWithPropertyList:v5 format:200 options:0 error:0];
      x_reply = self->_x_reply;
      if (v7)
      {
        id v8 = v7;
        xpc_dictionary_set_data(x_reply, "kDKMessageInfoKey", (const void *)[v8 bytes], objc_msgSend(v8, "length"));

        x_reply = self->_x_reply;
      }
    }
    xpc_connection_send_message(self->_x_reply_connection, x_reply);
    [(ATXPCConnection *)self->_receivingConnection _removeMessage:self];
  }
  else
  {
    v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"ATXPCConnection.m" lineNumber:471 description:@"Trying to send reply where one isn't expected"];
  }
}

- (id)_createXPCMessage
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  xpc_object_t v3 = xpc_string_create([(NSString *)self->_name UTF8String]);
  info = self->_info;
  if (info
    && ([MEMORY[0x263F08AC0] dataWithPropertyList:info format:200 options:0 error:0],
        (id v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v6 = v5;
    xpc_object_t v7 = xpc_data_create((const void *)[v6 bytes], objc_msgSend(v6, "length"));
  }
  else
  {
    xpc_object_t v7 = 0;
    id v6 = 0;
  }
  *(_OWORD *)keys = xmmword_2642814B0;
  id v8 = v3;
  v13[0] = v8;
  id v9 = v7;
  v13[1] = v9;
  xpc_object_t v10 = xpc_dictionary_create((const char *const *)keys, v13, 2uLL);
  for (uint64_t i = 1; i != -1; --i)

  return v10;
}

- (id)_initWithXPCMessage:(id)a3 onConnection:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)ATXPCMessage;
  id v8 = [(ATXPCMessage *)&v25 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_receivingConnection, a4);
    string = xpc_dictionary_get_string(v6, "kDKMessageNameKey");
    if (string)
    {
      uint64_t v11 = [[NSString alloc] initWithUTF8String:string];
      name = v9->_name;
      v9->_name = (NSString *)v11;
    }
    else
    {
      name = v9->_name;
      v9->_name = 0;
    }

    size_t v24 = 0;
    data = xpc_dictionary_get_data(v6, "kDKMessageInfoKey", &v24);
    v14 = 0;
    if (data && v24)
    {
      uint64_t v15 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:data length:v24 freeWhenDone:0];
      if (v15)
      {
        id v26 = 0;
        v14 = [MEMORY[0x263F08AC0] propertyListWithData:v15 options:0 format:0 error:&v26];
        id v16 = v26;
        if (v16)
        {
          v17 = v16;
          v18 = os_log_create("com.apple.amp.AirTraffic", "XPC");
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v28 = v17;
            _os_log_impl(&dword_2164B1000, v18, OS_LOG_TYPE_ERROR, "Error deserializing plist %{public}@", buf, 0xCu);
          }
        }
      }
      else
      {
        v14 = 0;
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v9->_info, v14);
    }
    reply = (OS_xpc_object *)xpc_dictionary_create_reply(v6);
    x_reply = v9->_x_reply;
    v9->_x_reply = reply;

    if (v9->_x_reply)
    {
      [(ATXPCConnection *)v9->_receivingConnection _registerMessage:v9];
      uint64_t v21 = xpc_dictionary_get_remote_connection(v6);
      x_reply_connection = v9->_x_reply_connection;
      v9->_x_reply_connection = (OS_xpc_object *)v21;
    }
  }

  return v9;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)ATXPCMessage;
  [(ATXPCMessage *)&v2 dealloc];
}

- (ATXPCMessage)initWithName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXPCMessage;
  id v5 = [(ATXPCMessage *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    name = v5->_name;
    v5->_name = (NSString *)v6;
  }
  return v5;
}

@end