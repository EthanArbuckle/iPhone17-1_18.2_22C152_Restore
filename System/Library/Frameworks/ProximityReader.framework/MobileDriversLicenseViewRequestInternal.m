@interface MobileDriversLicenseViewRequestInternal
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSString)description;
- (_TtC15ProximityReader39MobileDriversLicenseViewRequestInternal)init;
- (_TtC15ProximityReader39MobileDriversLicenseViewRequestInternal)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MobileDriversLicenseViewRequestInternal

+ (BOOL)supportsSecureCoding
{
  return byte_268269C10;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_268269C10 = a3;
}

- (NSString)description
{
  v2 = self;
  MobileDriversLicenseViewRequestInternal.description.getter();

  v3 = (void *)sub_228915C40();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  MobileDriversLicenseViewRequestInternal.encode(with:)((NSCoder)v4);
}

- (_TtC15ProximityReader39MobileDriversLicenseViewRequestInternal)initWithCoder:(id)a3
{
  return (_TtC15ProximityReader39MobileDriversLicenseViewRequestInternal *)MobileDriversLicenseViewRequestInternal.init(coder:)(a3);
}

- (_TtC15ProximityReader39MobileDriversLicenseViewRequestInternal)init
{
  result = (_TtC15ProximityReader39MobileDriversLicenseViewRequestInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ProximityReader39MobileDriversLicenseViewRequestInternal_options));
  swift_bridgeObjectRelease();
  sub_2288863DC((uint64_t)self + OBJC_IVAR____TtC15ProximityReader39MobileDriversLicenseViewRequestInternal_documentType, (uint64_t (*)(void))type metadata accessor for IdentityDocumentType);

  swift_bridgeObjectRelease();
}

@end