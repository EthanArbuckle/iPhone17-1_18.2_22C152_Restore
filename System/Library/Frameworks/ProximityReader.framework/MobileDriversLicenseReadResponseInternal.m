@interface MobileDriversLicenseReadResponseInternal
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC15ProximityReader40MobileDriversLicenseReadResponseInternal)init;
- (_TtC15ProximityReader40MobileDriversLicenseReadResponseInternal)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MobileDriversLicenseReadResponseInternal

- (_TtC15ProximityReader40MobileDriversLicenseReadResponseInternal)init
{
  result = (_TtC15ProximityReader40MobileDriversLicenseReadResponseInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_22880BB80(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC15ProximityReader40MobileDriversLicenseReadResponseInternal_responseData), *(void *)&self->responseData[OBJC_IVAR____TtC15ProximityReader40MobileDriversLicenseReadResponseInternal_responseData]);
  sub_22880BB80(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC15ProximityReader40MobileDriversLicenseReadResponseInternal_sessionTranscript), *(void *)&self->responseData[OBJC_IVAR____TtC15ProximityReader40MobileDriversLicenseReadResponseInternal_sessionTranscript]);

  swift_bridgeObjectRelease();
}

+ (BOOL)supportsSecureCoding
{
  return byte_268269D50;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_268269D50 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  MobileDriversLicenseReadResponseInternal.encode(with:)((NSCoder)v4);
}

- (_TtC15ProximityReader40MobileDriversLicenseReadResponseInternal)initWithCoder:(id)a3
{
  return (_TtC15ProximityReader40MobileDriversLicenseReadResponseInternal *)MobileDriversLicenseReadResponseInternal.init(coder:)(a3);
}

@end