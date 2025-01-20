@interface CNUIImageRemoteBackgroundColorAnalyzer
- (NSXPCConnection)serviceConnection;
- (void)_closeConnection;
- (void)_openConnectionIfNeeded;
- (void)dealloc;
- (void)getBackgroundColorOnImageData:(id)a3 bitmapFormat:(id)a4 reply:(id)a5;
- (void)setServiceConnection:(id)a3;
@end

@implementation CNUIImageRemoteBackgroundColorAnalyzer

- (void)dealloc
{
  [(CNUIImageRemoteBackgroundColorAnalyzer *)self _closeConnection];
  v3.receiver = self;
  v3.super_class = (Class)CNUIImageRemoteBackgroundColorAnalyzer;
  [(CNUIImageRemoteBackgroundColorAnalyzer *)&v3 dealloc];
}

- (void)_openConnectionIfNeeded
{
  if (!self->_serviceConnection)
  {
    objc_super v3 = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithServiceName:@"com.apple.ContactsBackgroundColorService"];
    serviceConnection = self->_serviceConnection;
    self->_serviceConnection = v3;

    v5 = contactsBackgroundColorServiceInterface();
    [(NSXPCConnection *)self->_serviceConnection setRemoteObjectInterface:v5];

    v6 = self->_serviceConnection;
    [(NSXPCConnection *)v6 resume];
  }
}

- (void)_closeConnection
{
  [(NSXPCConnection *)self->_serviceConnection invalidate];
  serviceConnection = self->_serviceConnection;
  self->_serviceConnection = 0;
}

- (void)getBackgroundColorOnImageData:(id)a3 bitmapFormat:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(CNUIImageRemoteBackgroundColorAnalyzer *)self _openConnectionIfNeeded];
  if (v8)
  {
    v11 = [(CNUIImageRemoteBackgroundColorAnalyzer *)self serviceConnection];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000037A4;
    v16[3] = &unk_100008390;
    id v12 = v10;
    id v17 = v12;
    v13 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v16];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000037BC;
    v14[3] = &unk_1000083B8;
    id v15 = v12;
    [v13 getBackgroundColorOnImageData:v8 bitmapFormat:v9 withReply:v14];
  }
}

- (NSXPCConnection)serviceConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setServiceConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end