@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC13IngestService15ServiceDelegate)init;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v7 = self;
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = [v7 interfaceWithProtocol:&OBJC_PROTOCOL____TtP14DendriteIngest21IngestServiceProtocol_];
  [v9 setExportedInterface:v11];

  id v12 = [objc_allocWithZone((Class)type metadata accessor for IngestService()) init];
  [v9 setExportedObject:v12];
  [v9 resume];

  return 1;
}

- (_TtC13IngestService15ServiceDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ServiceDelegate();
  return [(ServiceDelegate *)&v3 init];
}

@end