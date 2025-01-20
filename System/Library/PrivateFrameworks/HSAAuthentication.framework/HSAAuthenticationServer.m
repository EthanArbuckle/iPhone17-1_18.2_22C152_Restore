@interface HSAAuthenticationServer
+ (id)sharedInstance;
- (HSAAuthenticationServer)init;
- (void)_cleanup;
- (void)_cleanupClient:(id)a3;
- (void)_clientConnected;
- (void)_configureWithClient:(id)a3;
- (void)dealloc;
- (void)parseIncomingMessageFromNumber:(id)a3 forService:(id)a4 messageBody:(id)a5;
@end

@implementation HSAAuthenticationServer

+ (id)sharedInstance
{
  if (qword_26AC13728 != -1) {
    dispatch_once(&qword_26AC13728, &unk_26C599290);
  }
  v2 = (void *)qword_26AC13730;
  return v2;
}

- (HSAAuthenticationServer)init
{
  v12.receiver = self;
  v12.super_class = (Class)HSAAuthenticationServer;
  v2 = [(HSAAuthenticationServer *)&v12 init];
  v3 = v2;
  if (v2)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = sub_214A785A8;
    v10[3] = &unk_264228818;
    v4 = v2;
    v11 = v4;
    v5 = (void *)MEMORY[0x2166AD880](v10);
    uint64_t v6 = IMXPCCreateServerConnection();
    connection = v4->_connection;
    v4->_connection = (OS_xpc_object *)v6;

    v8 = v4->_connection;
    if (v8) {
      xpc_connection_resume(v8);
    }
    else {
      _IMWarn();
    }
    if (_IMWillLog()) {
      _IMAlwaysLog();
    }
  }
  return v3;
}

- (void)parseIncomingMessageFromNumber:(id)a3 forService:(id)a4 messageBody:(id)a5
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v39 = a3;
  id v38 = a4;
  id v8 = a5;
  if (_IMWillLog())
  {
    id v30 = v38;
    id v31 = v8;
    id v28 = v39;
    _IMAlwaysLog();
  }
  if ([(NSMutableArray *)self->_clients count])
  {
    v37 = v8;
    sub_214A7903C(@"HSAOriginatingAddressList");
    v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = sub_214A7903C(@"HSAVerificationCodePattern");
    v10 = @"([0-9]+)";
    if (v9) {
      v10 = (__CFString *)v9;
    }
    v36 = v10;
    if (_IMWillLog())
    {
      v29 = v35;
      _IMAlwaysLog();
    }
    if (_IMWillLog())
    {
      v29 = v36;
      _IMAlwaysLog();
    }
    if ([(__CFString *)v36 length])
    {
      if (![(__CFString *)v35 count]
        || ([v39 lowercaseString],
            v11 = objc_claimAutoreleasedReturnValue(),
            char v12 = [(__CFString *)v35 containsObject:v11],
            v11,
            (v12 & 1) != 0))
      {
        id v44 = 0;
        v34 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:v36 options:1 error:&v44];
        id v13 = v44;
        v33 = v13;
        if (!v34 || v13)
        {
          _IMWarn();
        }
        else
        {
          v14 = objc_msgSend(v34, "firstMatchInString:options:range:", v37, 1, 0, objc_msgSend(v37, "length"));
          if (v14)
          {
            v32 = v14;
            uint64_t v15 = [v14 rangeAtIndex:0];
            v17 = objc_msgSend(v37, "substringWithRange:", v15, v16);
            if (v17)
            {
              if (_IMWillLog()) {
                _IMAlwaysLog();
              }
              long long v42 = 0u;
              long long v43 = 0u;
              long long v40 = 0u;
              long long v41 = 0u;
              v18 = self->_clients;
              uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v40 objects:v49 count:16];
              if (v19)
              {
                uint64_t v20 = *(void *)v41;
                do
                {
                  uint64_t v21 = 0;
                  do
                  {
                    if (*(void *)v41 != v20) {
                      objc_enumerationMutation(v18);
                    }
                    v22 = *(_xpc_connection_s **)(*((void *)&v40 + 1) + 8 * v21);
                    xpc_object_t v23 = xpc_dictionary_create(0, 0, 0);
                    if (v23)
                    {
                      IMInsertNSStringsToXPCDictionary();
                      IMInsertNSStringsToXPCDictionary();
                      v24 = objc_msgSend(v17, "trimmedString", v38, 0);
                      IMInsertNSStringsToXPCDictionary();

                      IMInsertNSStringsToXPCDictionary();
                      xpc_connection_send_message(v22, v23);
                      if (qword_26784C170 != -1) {
                        dispatch_once(&qword_26784C170, &unk_26C5992F0);
                      }
                      v25 = (void *)qword_26784C178;
                      if (os_log_type_enabled((os_log_t)qword_26784C178, OS_LOG_TYPE_DEFAULT))
                      {
                        v26 = v25;
                        v27 = [(_xpc_connection_s *)v22 debugDescription];
                        *(_DWORD *)buf = 138412546;
                        v46 = v27;
                        __int16 v47 = 2112;
                        xpc_object_t v48 = v23;
                        _os_log_impl(&dword_214A76000, v26, OS_LOG_TYPE_DEFAULT, "  => Notifying client: %@  (message: %@)", buf, 0x16u);
                      }
                    }

                    ++v21;
                  }
                  while (v19 != v21);
                  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v40 objects:v49 count:16];
                }
                while (v19);
              }

              if (_IMWillLog()) {
                _IMAlwaysLog();
              }
            }
          }
          else if (_IMWillLog())
          {
            _IMAlwaysLog();
          }
        }

        goto LABEL_42;
      }
      if (_IMWillLog()) {
        goto LABEL_41;
      }
    }
    else if (_IMWillLog())
    {
LABEL_41:
      _IMAlwaysLog();
    }
LABEL_42:

    id v8 = v37;
    goto LABEL_43;
  }
  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
LABEL_43:
}

- (void)_clientConnected
{
  if (!self->_hasRegistered)
  {
    if (_IMWillLog()) {
      _IMAlwaysLog();
    }
    self->_hasRegistered = 1;
  }
}

- (void)_cleanup
{
  if (self->_hasRegistered)
  {
    self->_hasRegistered = 0;
    if (_IMWillLog())
    {
      _IMAlwaysLog();
    }
  }
}

- (void)_cleanupClient:(id)a3
{
  connection = (_xpc_connection_s *)a3;
  if (connection)
  {
    if (_IMWillLog())
    {
      uint64_t pid = xpc_connection_get_pid(connection);
      _IMAlwaysLog();
    }
    -[NSMutableArray removeObject:](self->_clients, "removeObject:", connection, pid);
    if (_IMWillLog())
    {
      uint64_t v6 = [(NSMutableArray *)self->_clients count];
      _IMAlwaysLog();
    }
    if (![(NSMutableArray *)self->_clients count])
    {
      [(HSAAuthenticationServer *)self _cleanup];
      clients = self->_clients;
      self->_clients = 0;
    }
  }
}

- (void)_configureWithClient:(id)a3
{
  connection = (_xpc_connection_s *)a3;
  uint64_t v4 = _IMWillLog();
  if (v4)
  {
    uint64_t pid = connection;
    uint64_t v4 = _IMAlwaysLog();
  }
  if (connection)
  {
    uint64_t v4 = [(NSMutableArray *)self->_clients containsObject:connection];
    if ((v4 & 1) == 0)
    {
      if (!self->_clients)
      {
        v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
        clients = self->_clients;
        self->_clients = v5;
      }
      if (_IMWillLog())
      {
        uint64_t pid = (_xpc_connection_s *)xpc_connection_get_pid(connection);
        _IMAlwaysLog();
      }
      -[NSMutableArray addObject:](self->_clients, "addObject:", connection, pid);
      uint64_t v4 = [(HSAAuthenticationServer *)self _clientConnected];
    }
  }
  MEMORY[0x270F9A758](v4);
}

- (void)dealloc
{
  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
  [(HSAAuthenticationServer *)self _cleanup];
  v3.receiver = self;
  v3.super_class = (Class)HSAAuthenticationServer;
  [(HSAAuthenticationServer *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end