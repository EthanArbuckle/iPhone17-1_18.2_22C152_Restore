@interface FTRegConnectionHandler
- (BOOL)_isServiceSupported;
- (BOOL)connectToDaemon;
- (BOOL)connectToDaemon:(BOOL)a3;
- (BOOL)isConnectedToDaemon;
- (FTRegConnectionHandler)initWithServiceType:(int64_t)a3 name:(id)a4;
- (FTRegConnectionHandler)initWithServiceType:(int64_t)a3 name:(id)a4 capabilities:(unsigned int)a5;
- (NSString)_listenerID;
- (NSString)_logName;
- (NSString)_serviceName;
- (NSString)name;
- (int64_t)serviceType;
- (unsigned)caps;
- (void)_disconnectFromDaemon;
- (void)_handleDaemonConnected:(id)a3;
- (void)_handleDaemonDisconnected:(id)a3;
- (void)_setListenerID:(id)a3;
- (void)_startListeningForNotifications;
- (void)_stopListeningForNotifications;
- (void)dealloc;
- (void)setCaps:(unsigned int)a3;
- (void)setName:(id)a3;
- (void)setServiceType:(int64_t)a3;
- (void)set_logName:(id)a3;
@end

@implementation FTRegConnectionHandler

- (FTRegConnectionHandler)initWithServiceType:(int64_t)a3 name:(id)a4 capabilities:(unsigned int)a5
{
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)FTRegConnectionHandler;
  v9 = [(FTRegConnectionHandler *)&v19 init];
  v10 = v9;
  if (v9)
  {
    v9->_serviceType = a3;
    uint64_t v11 = [v8 copy];
    name = v10->_name;
    v10->_name = (NSString *)v11;

    v10->_caps = a5;
    v13 = FTCServiceNameForServiceType();
    if (!v13)
    {
      v13 = objc_msgSend(NSString, "stringWithFormat:", @"%d", a3);
    }
    uint64_t v14 = [NSString stringWithFormat:@"com.apple.ft.reg.connection.%@.%@", v13, v10->_name];
    listenerID = v10->_listenerID;
    v10->_listenerID = (NSString *)v14;

    uint64_t v16 = [NSString stringWithFormat:@"ConnectionHandler(%@|%@)", v13, v10->_name];
    logName = v10->_logName;
    v10->_logName = (NSString *)v16;

    [(FTRegConnectionHandler *)v10 _startListeningForNotifications];
    [(FTRegConnectionHandler *)v10 connectToDaemon];
  }
  return v10;
}

- (FTRegConnectionHandler)initWithServiceType:(int64_t)a3 name:(id)a4
{
  return [(FTRegConnectionHandler *)self initWithServiceType:a3 name:a4 capabilities:*MEMORY[0x263F4A8A8]];
}

- (void)dealloc
{
  [(FTRegConnectionHandler *)self _stopListeningForNotifications];
  [(FTRegConnectionHandler *)self _disconnectFromDaemon];
  v3.receiver = self;
  v3.super_class = (Class)FTRegConnectionHandler;
  [(FTRegConnectionHandler *)&v3 dealloc];
}

- (NSString)_serviceName
{
  [(FTRegConnectionHandler *)self serviceType];
  return (NSString *)FTCServiceNameForServiceType();
}

- (void)_startListeningForNotifications
{
  if ((*(unsigned char *)&self->_handlerFlags & 1) == 0)
  {
    id v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:self selector:sel__handleDaemonConnected_ name:*MEMORY[0x263F4A498] object:0];
    [v3 addObserver:self selector:sel__handleDaemonDisconnected_ name:*MEMORY[0x263F4A4A0] object:0];
    *(unsigned char *)&self->_handlerFlags |= 1u;
  }
}

- (void)_stopListeningForNotifications
{
  if (*(unsigned char *)&self->_handlerFlags)
  {
    id v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 removeObserver:self name:*MEMORY[0x263F4A498] object:0];
    [v3 removeObserver:self name:*MEMORY[0x263F4A4A0] object:0];
    *(unsigned char *)&self->_handlerFlags &= ~1u;
  }
}

- (void)setCaps:(unsigned int)a3
{
  if (self->_caps != a3)
  {
    self->_caps = a3;
    [(FTRegConnectionHandler *)self connectToDaemon];
  }
}

- (BOOL)_isServiceSupported
{
  id v3 = [MEMORY[0x263F3BB18] sharedInstance];
  int64_t v4 = [(FTRegConnectionHandler *)self serviceType];
  if (v4)
  {
    if (v4 == 2)
    {
      char v5 = [v3 callingAvailable];
    }
    else
    {
      if (v4 != 1)
      {
        BOOL v6 = 0;
        goto LABEL_9;
      }
      char v5 = [v3 iMessageAvailable];
    }
  }
  else
  {
    char v5 = [v3 faceTimeAvailable];
  }
  BOOL v6 = v5;
LABEL_9:

  return v6;
}

- (BOOL)isConnectedToDaemon
{
  id v3 = [MEMORY[0x263F4A568] sharedInstance];
  if ([v3 isConnected])
  {
    int64_t v4 = [MEMORY[0x263F4A568] sharedInstance];
    char v5 = [(FTRegConnectionHandler *)self _listenerID];
    char v6 = [v4 hasListenerForID:v5];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)connectToDaemon:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x263EF8340];
  BOOL v5 = [(FTRegConnectionHandler *)self _isServiceSupported];
  char v6 = csui_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = @"NO";
    if (v3) {
      v7 = @"YES";
    }
    int v17 = 138412290;
    v18 = v7;
    _os_log_impl(&dword_21ED18000, v6, OS_LOG_TYPE_DEFAULT, "Connecting to daemon if necessary - blocking:%@", (uint8_t *)&v17, 0xCu);
  }

  if (!v5)
  {
    v15 = csui_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_21ED18000, v15, OS_LOG_TYPE_DEFAULT, "  => Not supported on this device, not connecting", (uint8_t *)&v17, 2u);
    }
    goto LABEL_14;
  }
  id v8 = [MEMORY[0x263F4A568] sharedInstance];
  v9 = [(FTRegConnectionHandler *)self _listenerID];
  char v10 = [v8 hasListenerForID:v9];

  if ((v10 & 1) == 0)
  {
    uint64_t v11 = csui_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [(FTRegConnectionHandler *)self _listenerID];
      int v17 = 138412290;
      v18 = v12;
      _os_log_impl(&dword_21ED18000, v11, OS_LOG_TYPE_DEFAULT, "  => Adding listener for the first time: %@", (uint8_t *)&v17, 0xCu);
    }
  }
  v13 = [MEMORY[0x263F4A568] sharedInstance];
  uint64_t v14 = [(FTRegConnectionHandler *)self _listenerID];
  objc_msgSend(v13, "addListenerID:capabilities:", v14, -[FTRegConnectionHandler caps](self, "caps"));

  if (v3)
  {
    v15 = [MEMORY[0x263F4A568] sharedInstance];
    [v15 blockUntilConnected];
LABEL_14:
  }
  return v5;
}

- (BOOL)connectToDaemon
{
  return [(FTRegConnectionHandler *)self connectToDaemon:0];
}

- (void)_disconnectFromDaemon
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  BOOL v3 = csui_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v4 = [(FTRegConnectionHandler *)self _listenerID];
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_21ED18000, v3, OS_LOG_TYPE_DEFAULT, "Removing listener: %@", (uint8_t *)&v7, 0xCu);
  }
  BOOL v5 = [MEMORY[0x263F4A568] sharedInstance];
  char v6 = [(FTRegConnectionHandler *)self _listenerID];
  [v5 removeListenerID:v6];
}

- (void)_handleDaemonConnected:(id)a3
{
  BOOL v3 = csui_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int64_t v4 = 0;
    _os_log_impl(&dword_21ED18000, v3, OS_LOG_TYPE_DEFAULT, "Connected to daemon", v4, 2u);
  }
}

- (void)_handleDaemonDisconnected:(id)a3
{
  BOOL v3 = csui_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int64_t v4 = 0;
    _os_log_impl(&dword_21ED18000, v3, OS_LOG_TYPE_DEFAULT, "Disconnected from daemon", v4, 2u);
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(int64_t)a3
{
  self->_serviceType = a3;
}

- (unsigned)caps
{
  return self->_caps;
}

- (NSString)_listenerID
{
  return self->_listenerID;
}

- (void)_setListenerID:(id)a3
{
}

- (NSString)_logName
{
  return self->_logName;
}

- (void)set_logName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logName, 0);
  objc_storeStrong((id *)&self->_listenerID, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end