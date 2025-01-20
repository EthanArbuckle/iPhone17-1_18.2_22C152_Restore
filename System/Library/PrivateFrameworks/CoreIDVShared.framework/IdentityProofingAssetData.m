@interface IdentityProofingAssetData
+ (BOOL)supportsSecureCoding;
- (_TtC13CoreIDVShared25IdentityProofingAssetData)init;
- (_TtC13CoreIDVShared25IdentityProofingAssetData)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IdentityProofingAssetData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  IdentityProofingAssetData.encode(with:)((NSCoder)v4);
}

- (_TtC13CoreIDVShared25IdentityProofingAssetData)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC13CoreIDVShared25IdentityProofingAssetData *)sub_1D78F95BC();

  return v4;
}

- (_TtC13CoreIDVShared25IdentityProofingAssetData)init
{
  result = (_TtC13CoreIDVShared25IdentityProofingAssetData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1D7871BDC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13CoreIDVShared25IdentityProofingAssetData_twoX), *(void *)&self->twoX[OBJC_IVAR____TtC13CoreIDVShared25IdentityProofingAssetData_twoX]);
  sub_1D7871BDC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13CoreIDVShared25IdentityProofingAssetData_threeX), *(void *)&self->twoX[OBJC_IVAR____TtC13CoreIDVShared25IdentityProofingAssetData_threeX]);
  swift_bridgeObjectRelease();
}

@end