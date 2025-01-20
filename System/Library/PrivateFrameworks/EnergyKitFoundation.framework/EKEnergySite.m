@interface EKEnergySite
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC19EnergyKitFoundation12EKEnergySite)init;
- (_TtC19EnergyKitFoundation12EKEnergySite)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EKEnergySite

+ (BOOL)supportsSecureCoding
{
  return sub_24D290858() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_getObjCClassMetadata();
  char v3 = sub_24D290868();
  swift_getObjCClassMetadata();
  static EKEnergySite.supportsSecureCoding.setter(v3 & 1);
}

- (_TtC19EnergyKitFoundation12EKEnergySite)initWithCoder:(id)a3
{
  id v3 = a3;
  return (_TtC19EnergyKitFoundation12EKEnergySite *)EKEnergySite.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24D27A2BC(a3);
}

- (_TtC19EnergyKitFoundation12EKEnergySite)init
{
  return (_TtC19EnergyKitFoundation12EKEnergySite *)EKEnergySite.init()();
}

- (void).cxx_destruct
{
}

@end