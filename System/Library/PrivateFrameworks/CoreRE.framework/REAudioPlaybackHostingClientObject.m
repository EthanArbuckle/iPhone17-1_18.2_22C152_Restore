@interface REAudioPlaybackHostingClientObject
- (BOOL)shouldRedactSensitiveInfoFromLogs;
- (NSXPCConnection)connection;
- (REAudioPlaybackHostingClientObject)initWithConnection:(id)a3 connectionIdentifier:(unint64_t)a4;
- (unint64_t)connectionIdentifier;
- (void)setShouldRedactSensitiveInfoFromLogs:(BOOL)a3;
@end

@implementation REAudioPlaybackHostingClientObject

- (REAudioPlaybackHostingClientObject)initWithConnection:(id)a3 connectionIdentifier:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)REAudioPlaybackHostingClientObject;
  v8 = [(REAudioPlaybackHostingClientObject *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_connection, a3);
    v9->_connectionIdentifier = a4;
  }

  return v9;
}

- (unint64_t)connectionIdentifier
{
  return self->_connectionIdentifier;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)shouldRedactSensitiveInfoFromLogs
{
  return self->_shouldRedactSensitiveInfoFromLogs;
}

- (void)setShouldRedactSensitiveInfoFromLogs:(BOOL)a3
{
  self->_shouldRedactSensitiveInfoFromLogs = a3;
}

- (void).cxx_destruct
{
}

@end