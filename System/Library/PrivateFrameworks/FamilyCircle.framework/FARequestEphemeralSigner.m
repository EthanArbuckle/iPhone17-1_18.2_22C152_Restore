@interface FARequestEphemeralSigner
- (ACAccount)account;
- (FARequestEphemeralSigner)init;
- (FARequestEphemeralSigner)initWithEphemeralAuthResults:(id)a3;
- (NSDictionary)ephemeralAuthResults;
- (id)accountInfoPayload;
- (void)setEphemeralAuthResults:(id)a3;
- (void)signURLRequest:(id)a3;
@end

@implementation FARequestEphemeralSigner

- (NSDictionary)ephemeralAuthResults
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1D25AA910();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (void)setEphemeralAuthResults:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___FARequestEphemeralSigner_ephemeralAuthResults) = (Class)sub_1D25AA920();
  swift_bridgeObjectRelease();
}

- (FARequestEphemeralSigner)initWithEphemeralAuthResults:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___FARequestEphemeralSigner_ephemeralAuthResults) = (Class)sub_1D25AA920();
  v5.receiver = self;
  v5.super_class = (Class)FARequestEphemeralSigner;
  return [(FARequestEphemeralSigner *)&v5 init];
}

- (void)signURLRequest:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_1D25A7E78(v4);
}

- (FARequestEphemeralSigner)init
{
  result = (FARequestEphemeralSigner *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (ACAccount)account
{
  v2 = self;
  v3 = [(FARequestEphemeralSigner *)v2 ephemeralAuthResults];
  uint64_t v4 = sub_1D25AA920();

  id v5 = _sSo9ACAccountC12FamilyCircleE10fa_account4withABSgSDySSypG_tFZ_0(v4);
  swift_bridgeObjectRelease();
  return (ACAccount *)v5;
}

- (id)accountInfoPayload
{
  v2 = self;
  FARequestEphemeralSigner.accountInfoPayload()();

  v3 = (void *)sub_1D25AA910();
  swift_bridgeObjectRelease();
  return v3;
}

@end