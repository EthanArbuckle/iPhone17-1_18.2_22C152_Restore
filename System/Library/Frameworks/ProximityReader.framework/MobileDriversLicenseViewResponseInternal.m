@interface MobileDriversLicenseViewResponseInternal
+ (BOOL)supportsSecureCoding;
- (_TtC15ProximityReader40MobileDriversLicenseViewResponseInternal)init;
- (_TtC15ProximityReader40MobileDriversLicenseViewResponseInternal)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MobileDriversLicenseViewResponseInternal

- (_TtC15ProximityReader40MobileDriversLicenseViewResponseInternal)init
{
  result = (_TtC15ProximityReader40MobileDriversLicenseViewResponseInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC15ProximityReader40MobileDriversLicenseViewResponseInternal)initWithCoder:(id)a3
{
  return (_TtC15ProximityReader40MobileDriversLicenseViewResponseInternal *)MobileDriversLicenseViewResponseInternal.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  MobileDriversLicenseViewResponseInternal.encode(with:)((NSCoder)v4);
}

@end