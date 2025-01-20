@interface CLHarvester
- (id)currentStateDictionary;
- (void)connect;
- (void)dealloc;
- (void)submitSample:(id)a3;
@end

@implementation CLHarvester

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLHarvester;
  [(CLHarvester *)&v3 dealloc];
}

- (void)connect
{
  objc_super v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.locationd.harvester" options:4096];
  self->_connection = v3;
  if (v3)
  {
    v4 = (void *)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE041DC8];
    [v4 setClass:NSClassFromString(&cfstr_Clppoiharvest.isa) forSelector:sel_submitSample_ argumentIndex:0 ofReply:0];
    v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v5, "setWithObjects:", v6, v7, v8, objc_opt_class(), 0), sel_fetchStateWithReply_, 0, 1);
    [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v4];
    connection = self->_connection;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_19080F41C;
    v10[3] = &unk_1E5696BF0;
    v10[4] = self;
    [(NSXPCConnection *)connection setInvalidationHandler:v10];
    [(NSXPCConnection *)self->_connection setInterruptionHandler:&unk_1EE005E60];
    [(NSXPCConnection *)self->_connection resume];
  }
}

- (void)submitSample:(id)a3
{
  connection = self->_connection;
  if (!connection)
  {
    [(CLHarvester *)self connect];
    connection = self->_connection;
  }
  uint64_t v5 = [(NSXPCConnection *)connection remoteObjectProxy];

  MEMORY[0x1F4181798](v5, sel_submitSample_);
}

- (id)currentStateDictionary
{
  connection = self->_connection;
  if (!connection)
  {
    [(CLHarvester *)self connect];
    connection = self->_connection;
  }
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3052000000;
  v11 = sub_19080F8A8;
  v12 = sub_19080F8B8;
  uint64_t v13 = 0;
  id v4 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:&unk_1EE006260];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_19080FA4C;
  v7[3] = &unk_1E5698250;
  v7[4] = &v8;
  [v4 fetchStateWithReply:v7];
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

@end