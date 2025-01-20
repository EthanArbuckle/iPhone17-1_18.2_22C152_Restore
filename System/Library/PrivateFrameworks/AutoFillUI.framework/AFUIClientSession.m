@interface AFUIClientSession
- (AFUIClientSession)init;
- (NSXPCConnection)connection;
- (id)_presenter;
- (void)_configureNSXPCConnection:(id)a3 withMachName:(id)a4;
- (void)_initializeBSServiceConnection;
- (void)dealloc;
- (void)displayForDocumentTraits:(id)a3 documentState:(id)a4 textOperationsHandler:(id)a5;
- (void)documentStateChanged:(id)a3;
- (void)hide;
- (void)setConnection:(id)a3;
@end

@implementation AFUIClientSession

- (AFUIClientSession)init
{
  v5.receiver = self;
  v5.super_class = (Class)AFUIClientSession;
  v2 = [(AFUIClientSession *)&v5 init];
  v3 = v2;
  if (v2) {
    [(AFUIClientSession *)v2 _initializeBSServiceConnection];
  }
  return v3;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;

  v4.receiver = self;
  v4.super_class = (Class)AFUIClientSession;
  [(AFUIClientSession *)&v4 dealloc];
}

- (void)displayForDocumentTraits:(id)a3 documentState:(id)a4 textOperationsHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(AFUIClientSession *)self _presenter];
  [v11 displayForDocumentTraits:v10 documentState:v9 textOperationsHandler:v8];
}

- (void)documentStateChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(AFUIClientSession *)self _presenter];
  [v5 documentStateChanged:v4];
}

- (void)hide
{
  id v2 = [(AFUIClientSession *)self _presenter];
  [v2 hide];
}

- (void)_initializeBSServiceConnection
{
  id v6 = [MEMORY[0x263F2B9C0] endpointForMachName:@"com.apple.inputservice.input-ui-host" service:@"com.apple.inputservice.AutoFillUI" instance:0];
  v3 = [MEMORY[0x263F2B9B8] NSXPCConnectionWithEndpoint:v6 configurator:&__block_literal_global_0];
  [(AFUIClientSession *)self _configureNSXPCConnection:v3 withMachName:@"com.apple.inputservice.input-ui-host"];
  connection = self->_connection;
  self->_connection = v3;
  id v5 = v3;

  [(NSXPCConnection *)self->_connection activate];
}

void __51__AFUIClientSession__initializeBSServiceConnection__block_invoke(uint64_t a1, void *a2)
{
  v6[1] = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x263F64480];
  id v3 = a2;
  id v4 = [v2 attributeWithDomain:@"com.apple.common" name:@"BasicAngelIPC"];
  v6[0] = v4;
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  [v3 setPerMessageAssertionAttributes:v5];
}

- (void)_configureNSXPCConnection:(id)a3 withMachName:(id)a4
{
  id v4 = (void *)MEMORY[0x263F08D80];
  id v5 = a3;
  id v6 = [v4 interfaceWithProtocol:&unk_26FCCE8A0];
  [v5 setRemoteObjectInterface:v6];
}

- (id)_presenter
{
  id v2 = [(AFUIClientSession *)self connection];
  id v3 = [v2 remoteObjectProxy];

  return v3;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end