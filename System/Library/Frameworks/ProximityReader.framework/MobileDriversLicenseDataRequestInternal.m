@interface MobileDriversLicenseDataRequestInternal
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (_TtC15ProximityReader39MobileDriversLicenseDataRequestInternal)init;
- (_TtC15ProximityReader39MobileDriversLicenseDataRequestInternal)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MobileDriversLicenseDataRequestInternal

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  v2 = self;
  MobileDriversLicenseDataRequestInternal.description.getter();

  v3 = (void *)sub_228915C40();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC15ProximityReader39MobileDriversLicenseDataRequestInternal)initWithCoder:(id)a3
{
  return (_TtC15ProximityReader39MobileDriversLicenseDataRequestInternal *)MobileDriversLicenseDataRequestInternal.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  MobileDriversLicenseDataRequestInternal.encode(with:)((NSCoder)v4);
}

- (_TtC15ProximityReader39MobileDriversLicenseDataRequestInternal)init
{
  result = (_TtC15ProximityReader39MobileDriversLicenseDataRequestInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_22890D89C((uint64_t)self + OBJC_IVAR____TtC15ProximityReader39MobileDriversLicenseDataRequestInternal_documentType, (uint64_t (*)(void))type metadata accessor for IdentityDocumentType);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end