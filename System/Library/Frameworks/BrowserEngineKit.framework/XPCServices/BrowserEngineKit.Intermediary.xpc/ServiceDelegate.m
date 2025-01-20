@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC29BrowserEngineKit_Intermediary15ServiceDelegate)init;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v7 = self;
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = [v7 interfaceWithProtocol:&OBJC_PROTOCOL____TtP29BrowserEngineKit_Intermediary23BEKIntermediaryProtocol_];
  [v9 setExportedInterface:v11];

  type metadata accessor for BEKIntermediary();
  [v9 setExportedObject:swift_allocObject()];
  [v9 resume];

  swift_release();
  return 1;
}

- (_TtC29BrowserEngineKit_Intermediary15ServiceDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ServiceDelegate();
  return [(ServiceDelegate *)&v3 init];
}

@end