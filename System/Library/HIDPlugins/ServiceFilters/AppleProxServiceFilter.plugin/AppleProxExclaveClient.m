@interface AppleProxExclaveClient
- (BOOL)loadCalibration:(id)a3;
- (_TtC22AppleProxServiceFilter22AppleProxExclaveClient)init;
- (_TtC22AppleProxServiceFilter22AppleProxExclaveClient)initWithConclave:(BOOL)a3;
@end

@implementation AppleProxExclaveClient

- (_TtC22AppleProxServiceFilter22AppleProxExclaveClient)initWithConclave:(BOOL)a3
{
  return (_TtC22AppleProxServiceFilter22AppleProxExclaveClient *)_s22AppleProxServiceFilter0aB13ExclaveClientC8conclaveACSgSb_tcfc_0();
}

- (BOOL)loadCalibration:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = AppleProxExclaveClient.loadCalibration(_:)((NSData)v4);

  return self & 1;
}

- (_TtC22AppleProxServiceFilter22AppleProxExclaveClient)init
{
  result = (_TtC22AppleProxServiceFilter22AppleProxExclaveClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC22AppleProxServiceFilter22AppleProxExclaveClient_log;
  uint64_t v3 = sub_DB30();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_release();

  swift_release();
}

@end