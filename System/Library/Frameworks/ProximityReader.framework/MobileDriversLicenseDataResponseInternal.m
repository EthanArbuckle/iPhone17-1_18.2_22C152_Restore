@interface MobileDriversLicenseDataResponseInternal
+ (BOOL)supportsSecureCoding;
- (_TtC15ProximityReader40MobileDriversLicenseDataResponseInternal)init;
- (_TtC15ProximityReader40MobileDriversLicenseDataResponseInternal)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MobileDriversLicenseDataResponseInternal

- (_TtC15ProximityReader40MobileDriversLicenseDataResponseInternal)init
{
  result = (_TtC15ProximityReader40MobileDriversLicenseDataResponseInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_22882D5E0((uint64_t)self + OBJC_IVAR____TtC15ProximityReader40MobileDriversLicenseDataResponseInternal_documentElements, type metadata accessor for MobileDriversLicenseDataResponseInternal.DocumentElements);

  swift_bridgeObjectRelease();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC15ProximityReader40MobileDriversLicenseDataResponseInternal)initWithCoder:(id)a3
{
  return (_TtC15ProximityReader40MobileDriversLicenseDataResponseInternal *)MobileDriversLicenseDataResponseInternal.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  MobileDriversLicenseDataResponseInternal.encode(with:)((NSCoder)v4);
}

@end