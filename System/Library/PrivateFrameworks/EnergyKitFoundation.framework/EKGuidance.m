@interface EKGuidance
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC19EnergyKitFoundation10EKGuidance)init;
- (_TtC19EnergyKitFoundation10EKGuidance)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EKGuidance

+ (BOOL)supportsSecureCoding
{
  return sub_24D290858() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_getObjCClassMetadata();
  char v3 = sub_24D290868();
  swift_getObjCClassMetadata();
  static EKGuidance.supportsSecureCoding.setter(v3 & 1);
}

- (_TtC19EnergyKitFoundation10EKGuidance)initWithCoder:(id)a3
{
  id v3 = a3;
  return (_TtC19EnergyKitFoundation10EKGuidance *)EKGuidance.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24D267700(a3);
}

- (_TtC19EnergyKitFoundation10EKGuidance)init
{
  return (_TtC19EnergyKitFoundation10EKGuidance *)EKGuidance.init()();
}

- (void).cxx_destruct
{
  sub_24D22F624();
  uint64_t v3 = OBJC_IVAR____TtC19EnergyKitFoundation10EKGuidance_start;
  uint64_t v2 = sub_24D290638();
  (*(void (**)(char *))(*(void *)(v2 - 8) + 8))((char *)self + v3);
  sub_24D230030();
}

@end