@interface IdentityProofingDisplayInfo
+ (BOOL)supportsSecureCoding;
- (_TtC13CoreIDVShared27IdentityProofingDisplayInfo)init;
- (_TtC13CoreIDVShared27IdentityProofingDisplayInfo)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IdentityProofingDisplayInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC13CoreIDVShared27IdentityProofingDisplayInfo)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = (_TtC13CoreIDVShared27IdentityProofingDisplayInfo *)sub_1D7A7E32C(v3);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  IdentityProofingDisplayInfo.encode(with:)((NSCoder)v4);
}

- (_TtC13CoreIDVShared27IdentityProofingDisplayInfo)init
{
  result = (_TtC13CoreIDVShared27IdentityProofingDisplayInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  sub_1D7871BDC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_attributeConfig), *(void *)&self->proofingUI[OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_attributeConfig]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_featureEnablementConfig));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_livenessStepUpConfig));
  id v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_livenessStepUpIQSettings);
}

@end