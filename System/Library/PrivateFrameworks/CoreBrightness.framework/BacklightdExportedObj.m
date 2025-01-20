@interface BacklightdExportedObj
- (BrightnessSystemInternal)server;
- (NSXPCConnection)connection;
- (id)copyClientID;
- (void)clientCopyPropertyWithKey:(id)a3 reply:(id)a4;
- (void)clientSetPropertyWithKey:(id)a3 property:(id)a4;
- (void)clientSetSYNCPropertyWithKey:(id)a3 property:(id)a4 reply:(id)a5;
- (void)dealloc;
- (void)registerNotificationForProperties:(id)a3;
- (void)setConnection:(id)a3;
- (void)setServer:(id)a3;
@end

@implementation BacklightdExportedObj

- (void)setServer:(id)a3
{
  self->_server = (BrightnessSystemInternal *)a3;
}

- (void)setConnection:(id)a3
{
}

- (void)registerNotificationForProperties:(id)a3
{
  if ([(BacklightdExportedObj *)self server])
  {
    id v3 = [(BacklightdExportedObj *)self copyClientID];
    [(BrightnessSystemInternal *)self->_server setNotificationProperties:a3 forClient:v3];
  }
}

- (void)clientCopyPropertyWithKey:(id)a3 reply:(id)a4
{
  v13 = self;
  SEL v12 = a2;
  id v11 = a3;
  v10 = (void (**)(id, id, id))a4;
  id v9 = 0;
  int v8 = -1;
  id v7 = 0;
  id v6 = 0;
  if ([(BacklightdExportedObj *)self server])
  {
    id v5 = [(BacklightdExportedObj *)v13 copyClientID];
    id v9 = [(BrightnessSystemInternal *)[(BacklightdExportedObj *)v13 server] copyPropertyForKey:v11 client:v5];

    if (v9)
    {
      int v8 = 0;
      id v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v9, 0);
    }
  }
  id v4 = objc_alloc(MEMORY[0x1E4F28C58]);
  id v6 = (id)[v4 initWithDomain:*MEMORY[0x1E4F28760] code:v8 userInfo:0];
  v10[2](v10, v7, v6);
}

- (void)clientSetPropertyWithKey:(id)a3 property:(id)a4
{
  uint64_t v5 = 0;
  if (a4 && [a4 count]) {
    uint64_t v5 = [a4 objectAtIndex:0];
  }
  if ([(BacklightdExportedObj *)self server])
  {
    id v4 = [(BacklightdExportedObj *)self copyClientID];
    [(BrightnessSystemInternal *)[(BacklightdExportedObj *)self server] setProperty:v5 forKey:a3 client:v4];
  }
}

- (BrightnessSystemInternal)server
{
  return self->_server;
}

- (id)copyClientID
{
  if (!self->_clientIDSet)
  {
    self->_clientID = [(NSXPCConnection *)[(BacklightdExportedObj *)self connection] hash];
    self->_clientIDSet = 1;
  }
  return (id)[objc_alloc(NSNumber) initWithLongLong:self->_clientID];
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)dealloc
{
  id v4 = self;
  SEL v3 = a2;

  v2.receiver = v4;
  v2.super_class = (Class)BacklightdExportedObj;
  [(BacklightdExportedObj *)&v2 dealloc];
}

- (void)clientSetSYNCPropertyWithKey:(id)a3 property:(id)a4 reply:(id)a5
{
  v17 = self;
  SEL v16 = a2;
  id v15 = a3;
  id v14 = a4;
  v13 = (void (**)(id, id, id))a5;
  uint64_t v12 = 0;
  int v11 = -1;
  id v10 = 0;
  id v9 = 0;
  if (a4 && [v14 count]) {
    uint64_t v12 = [v14 objectAtIndex:0];
  }
  if ([(BacklightdExportedObj *)v17 server])
  {
    id v8 = [(BacklightdExportedObj *)v17 copyClientID];
    char v7 = [(BrightnessSystemInternal *)[(BacklightdExportedObj *)v17 server] setProperty:v12 forKey:v15 client:v8];

    id v6 = (id)[objc_alloc(NSNumber) initWithBool:v7 & 1];
    if (v6)
    {
      int v11 = 0;
      id v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v6, 0);
    }
  }
  id v5 = objc_alloc(MEMORY[0x1E4F28C58]);
  id v9 = (id)[v5 initWithDomain:*MEMORY[0x1E4F28760] code:v11 userInfo:0];
  v13[2](v13, v10, v9);
}

@end