@interface AVTAvatarsDaemonServer
- (AVTAvatarsDaemonServer)initWithListener:(id)a3 logger:(id)a4;
- (AVTAvatarsDaemonServer)initWithLogger:(id)a3;
- (AVTAvatarsDaemonServerDelegate)delegate;
- (AVTUILogger)logger;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCListener)listener;
- (void)checkIn;
- (void)setDelegate:(id)a3;
- (void)startListening;
@end

@implementation AVTAvatarsDaemonServer

- (AVTAvatarsDaemonServer)initWithLogger:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F08D88];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithMachServiceName:@"com.apple.avatar.support"];
  v7 = [(AVTAvatarsDaemonServer *)self initWithListener:v6 logger:v5];

  return v7;
}

- (AVTAvatarsDaemonServer)initWithListener:(id)a3 logger:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AVTAvatarsDaemonServer;
  v9 = [(AVTAvatarsDaemonServer *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_logger, a4);
    objc_storeStrong((id *)&v10->_listener, a3);
    [(NSXPCListener *)v10->_listener setDelegate:v10];
  }

  return v10;
}

- (void)startListening
{
  id v2 = [(AVTAvatarsDaemonServer *)self listener];
  [v2 resume];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = [(AVTAvatarsDaemonServer *)self logger];
  [v6 logAvatarsDaemonReceivesIncomingConnection];

  id v7 = +[AVTAvatarsDaemon xpcInterface];
  [v5 setExportedInterface:v7];

  [v5 setExportedObject:self];
  [v5 resume];

  return 1;
}

- (void)checkIn
{
  v3 = [MEMORY[0x263F08D68] currentConnection];
  uint64_t v4 = [v3 processIdentifier];

  id v5 = [(AVTAvatarsDaemonServer *)self logger];
  [v5 logAvatarsDaemonClientChecksIn:v4];

  id v6 = [(AVTAvatarsDaemonServer *)self delegate];
  [v6 clientDidCheckInForServer:self];
}

- (AVTAvatarsDaemonServerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (AVTAvatarsDaemonServerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_listener, 0);

  objc_destroyWeak((id *)&self->delegate);
}

@end