@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC13SPIHelper_iOS15ServiceDelegate)init;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  [v7 processIdentifier];
  id v9 = objc_allocWithZone((Class)type metadata accessor for SPIHelper());
  id v10 = sub_100055B6C();
  id v11 = [self interfaceWithProtocol:&OBJC_PROTOCOL____TtP13SPIHelper_iOS17SPIHelperProtocol_];
  [v7 setExportedInterface:v11];

  [v7 setExportedObject:v10];
  [v7 resume];

  return 1;
}

- (_TtC13SPIHelper_iOS15ServiceDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ServiceDelegate();
  return [(ServiceDelegate *)&v3 init];
}

@end