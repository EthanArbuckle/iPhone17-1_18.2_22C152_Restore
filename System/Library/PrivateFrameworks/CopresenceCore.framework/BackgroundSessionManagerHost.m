@interface BackgroundSessionManagerHost
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC14CopresenceCore28BackgroundSessionManagerHost)init;
- (void)dealloc;
@end

@implementation BackgroundSessionManagerHost

- (void)dealloc
{
  v2 = self;
  BackgroundSessionManagerHost.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (_TtC14CopresenceCore28BackgroundSessionManagerHost)init
{
  result = (_TtC14CopresenceCore28BackgroundSessionManagerHost *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = specialized BackgroundSessionManagerHost.listener(_:shouldAcceptNewConnection:)(v7);

  return v9 & 1;
}

@end