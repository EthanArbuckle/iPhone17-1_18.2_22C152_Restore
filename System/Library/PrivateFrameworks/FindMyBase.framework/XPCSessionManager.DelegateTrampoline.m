@interface XPCSessionManager.DelegateTrampoline
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtCC10FindMyBase17XPCSessionManagerP33_A03603F91824D587CF1B3EB0B5E03C5F18DelegateTrampoline)init;
@end

@implementation XPCSessionManager.DelegateTrampoline

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  swift_unownedRetainStrong();
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  LOBYTE(a3) = sub_24E101DAC((uint64_t)v7, v8);
  swift_release();

  return a3 & 1;
}

- (_TtCC10FindMyBase17XPCSessionManagerP33_A03603F91824D587CF1B3EB0B5E03C5F18DelegateTrampoline)init
{
  result = (_TtCC10FindMyBase17XPCSessionManagerP33_A03603F91824D587CF1B3EB0B5E03C5F18DelegateTrampoline *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end