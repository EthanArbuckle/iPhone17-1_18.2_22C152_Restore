@interface _ACCMediaLibraryProviderInfo
- (ACCMediaLibraryServerRemote)serverRemote;
- (ACCMediaLibraryXPCClientProtocol)remoteObject;
- (NSMutableDictionary)mediaLibraryList;
- (NSString)providerUID;
- (NSXPCConnection)connection;
- (_ACCMediaLibraryProviderInfo)init;
- (id)description;
- (void)dealloc;
- (void)setConnection:(id)a3;
- (void)setMediaLibraryList:(id)a3;
- (void)setProviderUID:(id)a3;
- (void)setRemoteObject:(id)a3;
- (void)setServerRemote:(id)a3;
@end

@implementation _ACCMediaLibraryProviderInfo

- (_ACCMediaLibraryProviderInfo)init
{
  v10.receiver = self;
  v10.super_class = (Class)_ACCMediaLibraryProviderInfo;
  v2 = [(_ACCMediaLibraryProviderInfo *)&v10 init];
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

    mediaLibraryList = v3->_mediaLibraryList;
    v3->_mediaLibraryList = 0;
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

  mediaLibraryList = self->_mediaLibraryList;
  self->_mediaLibraryList = 0;

  v8.receiver = self;
  v8.super_class = (Class)_ACCMediaLibraryProviderInfo;
  [(_ACCMediaLibraryProviderInfo *)&v8 dealloc];
}

- (id)description
{
  return +[NSString stringWithFormat:@"<_ACCMediaLibraryProviderInfo>[\n    _connection=%@\n    _remoteObject=%@\n    _serverRemote=%@\n    _providerUID=%@\n    _mediaLibraryList=%@]", self->_connection, self->_remoteObject, self->_serverRemote, self->_providerUID, self->_mediaLibraryList];
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (ACCMediaLibraryXPCClientProtocol)remoteObject
{
  return self->_remoteObject;
}

- (void)setRemoteObject:(id)a3
{
}

- (ACCMediaLibraryServerRemote)serverRemote
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

- (NSMutableDictionary)mediaLibraryList
{
  return self->_mediaLibraryList;
}

- (void)setMediaLibraryList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaLibraryList, 0);
  objc_storeStrong((id *)&self->_providerUID, 0);
  objc_storeStrong((id *)&self->_serverRemote, 0);
  objc_storeStrong((id *)&self->_remoteObject, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end