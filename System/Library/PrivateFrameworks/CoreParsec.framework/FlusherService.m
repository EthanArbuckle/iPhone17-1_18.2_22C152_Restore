@interface FlusherService
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC11FlusherUtil14FlusherService)init;
@end

@implementation FlusherService

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  BOOL v9 = sub_10000BBB4((uint64_t)v8, v7);

  return v9;
}

- (_TtC11FlusherUtil14FlusherService)init
{
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
}

@end