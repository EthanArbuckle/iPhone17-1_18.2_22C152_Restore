@interface APSNoOpClientIdentityProvider
- (APSNoOpClientIdentityProvider)init;
- (BOOL)hasUnderlyingIdentityChanged;
- (BOOL)isIdentityAvailable;
- (id)fetchHostVMCertAndSignNonce:(id)a3 error:(id *)a4;
- (id)identityAvailabilityDidChangeBlock;
- (void)fetchClientIdentityForcingNewCert:(BOOL)a3 withCompletion:(id)a4;
- (void)setIdentityAvailabilityDidChangeBlock:(id)a3;
@end

@implementation APSNoOpClientIdentityProvider

- (APSNoOpClientIdentityProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NoOpClientIdentityProvider();
  return [(APSNoOpClientIdentityProvider *)&v3 init];
}

- (id)fetchHostVMCertAndSignNonce:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = self;
  uint64_t v7 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v9 = v8;

  sub_1000B6160();
  v10 = (void *)static OS_os_log.default.getter();
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();

  id result = [objc_allocWithZone((Class)APSDProtoHostCertificateInfo) init];
  if (result)
  {
    id v12 = result;

    sub_1000BABA4(v7, v9);
    return v12;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)fetchClientIdentityForcingNewCert:(BOOL)a3 withCompletion:(id)a4
{
  id v5 = _Block_copy(a4);
  if (v5)
  {
    v6 = (void (**)(void, void, void))v5;
    unint64_t v8 = self;
    _Block_copy(v6);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    ((void (**)(void, void, Class))v6)[2](v6, 0, isa);

    _Block_release(v6);
    _Block_release(v6);
  }
}

- (id)identityAvailabilityDidChangeBlock
{
  return 0;
}

- (void)setIdentityAvailabilityDidChangeBlock:(id)a3
{
  objc_super v3 = _Block_copy(a3);
  if (v3)
  {
    _Block_release(v3);
  }
}

- (BOOL)isIdentityAvailable
{
  return 1;
}

- (BOOL)hasUnderlyingIdentityChanged
{
  return 0;
}

@end