@interface ParsecService
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC7parsecd13ParsecService)init;
@end

@implementation ParsecService

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_100018694((uint64_t)v8, v7);

  return v9 & 1;
}

- (_TtC7parsecd13ParsecService)init
{
  return (_TtC7parsecd13ParsecService *)sub_1001148E4();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_release();
}

@end