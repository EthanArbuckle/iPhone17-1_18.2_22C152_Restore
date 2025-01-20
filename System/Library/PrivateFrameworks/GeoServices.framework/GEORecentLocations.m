@interface GEORecentLocations
- (GEORecentLocations)init;
- (void)requestRecentLocationsWithResponse:(id)a3;
@end

@implementation GEORecentLocations

- (void)requestRecentLocationsWithResponse:(id)a3
{
  connection = self->_connection;
  id v4 = a3;
  id v5 = [(NSXPCConnection *)connection remoteObjectProxy];
  [v5 requestRecentLocationsWithResponse:v4];
}

- (GEORecentLocations)init
{
  v10.receiver = self;
  v10.super_class = (Class)GEORecentLocations;
  v2 = [(GEORecentLocations *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.navd.recentLocationsService" options:0];
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v3;

    id v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED836050];
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    [v5 setClasses:v8 forSelector:sel_requestRecentLocationsWithResponse_ argumentIndex:0 ofReply:1];
    [(NSXPCConnection *)v2->_connection setRemoteObjectInterface:v5];
    [(NSXPCConnection *)v2->_connection setExportedObject:v2];
    [(NSXPCConnection *)v2->_connection resume];
  }
  return v2;
}

- (void).cxx_destruct
{
}

@end