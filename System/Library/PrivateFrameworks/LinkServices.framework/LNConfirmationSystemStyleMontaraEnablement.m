@interface LNConfirmationSystemStyleMontaraEnablement
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExplicitRequest;
- (LNConfirmationSystemStyleMontaraEnablement)init;
- (LNConfirmationSystemStyleMontaraEnablement)initWithBundleIdentifier:(id)a3 source:(int64_t)a4 isExplicitRequest:(BOOL)a5;
- (LNConfirmationSystemStyleMontaraEnablement)initWithCoder:(id)a3;
- (NSString)bundleIdentifier;
- (int64_t)source;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNConfirmationSystemStyleMontaraEnablement

- (NSString)bundleIdentifier
{
  LNConfirmationSystemStyleMontaraEnablement.bundleIdentifier.getter();
  v2 = (void *)sub_1A44F94B0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (int64_t)source
{
  return LNConfirmationSystemStyleMontaraEnablement.source.getter();
}

- (BOOL)isExplicitRequest
{
  return LNConfirmationSystemStyleMontaraEnablement.isExplicitRequest.getter() & 1;
}

- (LNConfirmationSystemStyleMontaraEnablement)initWithBundleIdentifier:(id)a3 source:(int64_t)a4 isExplicitRequest:(BOOL)a5
{
  uint64_t v7 = sub_1A44F94E0();
  return (LNConfirmationSystemStyleMontaraEnablement *)LNConfirmationSystemStyleMontaraEnablement.init(bundleIdentifier:source:isExplicitRequest:)(v7, v8, a4, a5);
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1A44F9960();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = LNConfirmationSystemStyleMontaraEnablement.isEqual(_:)((uint64_t)v8);

  sub_1A4444A9C((uint64_t)v8);
  return v6 & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LNConfirmationSystemStyleMontaraEnablement)initWithCoder:(id)a3
{
  return (LNConfirmationSystemStyleMontaraEnablement *)LNConfirmationSystemStyleMontaraEnablement.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  LNConfirmationSystemStyleMontaraEnablement.encode(with:)((NSCoder)v4);
}

- (LNConfirmationSystemStyleMontaraEnablement)init
{
}

- (void).cxx_destruct
{
}

@end