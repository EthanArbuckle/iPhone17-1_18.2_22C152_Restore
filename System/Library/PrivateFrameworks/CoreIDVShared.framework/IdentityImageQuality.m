@interface IdentityImageQuality
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC13CoreIDVShared20IdentityImageQuality)init;
- (_TtC13CoreIDVShared20IdentityImageQuality)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IdentityImageQuality

+ (BOOL)supportsSecureCoding
{
  return byte_1EA847770;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_1EA847770 = a3;
}

- (_TtC13CoreIDVShared20IdentityImageQuality)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = (_TtC13CoreIDVShared20IdentityImageQuality *)sub_1D7A69E40(v3);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  IdentityImageQuality.encode(with:)((NSCoder)v4);
}

- (_TtC13CoreIDVShared20IdentityImageQuality)init
{
  result = (_TtC13CoreIDVShared20IdentityImageQuality *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1D7871BDC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_frontScanSettings), *(void *)&self->frontScanSettings[OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_frontScanSettings]);
  sub_1D7871BDC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_backScanSettings), *(void *)&self->frontScanSettings[OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_backScanSettings]);
  sub_1D7871BDC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_frontIDSettings), *(void *)&self->frontScanSettings[OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_frontIDSettings]);
  sub_1D7871BDC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_backIDSettings), *(void *)&self->frontScanSettings[OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_backIDSettings]);
  sub_1D7871BDC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_selfieSettings), *(void *)&self->frontScanSettings[OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_selfieSettings]);
  sub_1D7871BDC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_livenessSettings), *(void *)&self->frontScanSettings[OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_livenessSettings]);
  sub_1D7871BDC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_passiveSettings), *(void *)&self->frontScanSettings[OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_passiveSettings]);
  sub_1D7871BDC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_livenessBlockingCodes), *(void *)&self->frontScanSettings[OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_livenessBlockingCodes]);
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_resizeDimensions);
}

@end