@interface _ACCVoiceOverProviderInfo
- (ACCVoiceOverServerRemote)serverRemote;
- (ACCVoiceOverXPCClientProtocol)remoteObject;
- (NSString)providerUID;
- (NSXPCConnection)connection;
- (_ACCVoiceOverProviderInfo)init;
- (id)description;
- (void)dealloc;
- (void)setConnection:(id)a3;
- (void)setProviderUID:(id)a3;
- (void)setRemoteObject:(id)a3;
- (void)setServerRemote:(id)a3;
@end

@implementation _ACCVoiceOverProviderInfo

- (_ACCVoiceOverProviderInfo)init
{
  v9.receiver = self;
  v9.super_class = (Class)_ACCVoiceOverProviderInfo;
  v2 = [(_ACCVoiceOverProviderInfo *)&v9 init];
  v3 = v2;
  if (v2)
  {
    connection = v2->_connection;
    v2->_connection = 0;

    remoteObject = v3->_remoteObject;
    v3->_remoteObject = 0;

    serverRemote = v3->_serverRemote;
    v3->_serverRemote = 0;

    providerUID = v3->_providerUID;
    v3->_providerUID = 0;
  }
  return v3;
}

- (void)dealloc
{
  connection = self->_connection;
  self->_connection = 0;

  remoteObject = self->_remoteObject;
  self->_remoteObject = 0;

  serverRemote = self->_serverRemote;
  self->_serverRemote = 0;

  providerUID = self->_providerUID;
  self->_providerUID = 0;

  v7.receiver = self;
  v7.super_class = (Class)_ACCVoiceOverProviderInfo;
  [(_ACCVoiceOverProviderInfo *)&v7 dealloc];
}

- (id)description
{
  return +[NSString stringWithFormat:@"<_ACCVoiceOverProviderInfo>[\n    _connection=%@\n    _remoteObject=%@\n    _serverRemote=%@\n    _providerUID=%@]", self->_connection, self->_remoteObject, self->_serverRemote, self->_providerUID];
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (ACCVoiceOverXPCClientProtocol)remoteObject
{
  return self->_remoteObject;
}

- (void)setRemoteObject:(id)a3
{
}

- (ACCVoiceOverServerRemote)serverRemote
{
  return self->_serverRemote;
}

- (void)setServerRemote:(id)a3
{
}

- (NSString)providerUID
{
  return self->_providerUID;
}

- (void)setProviderUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerUID, 0);
  objc_storeStrong((id *)&self->_serverRemote, 0);
  objc_storeStrong((id *)&self->_remoteObject, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end