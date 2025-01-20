@interface CKDeviceCapabilityCheckOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)excludeDevicesWithoutCapabilityCheckingSupport;
- (BOOL)isEqual:(id)a3;
- (CKDeviceCapabilityCheckOptions)init;
- (CKDeviceCapabilityCheckOptions)initWithCoder:(id)a3;
- (CKDeviceCapabilityCheckOptions)initWithExcludeDevicesWithoutCapabilityCheckingSupport:(BOOL)a3 excludeZoneAccessBefore:(id)a4;
- (NSDate)excludeZoneAccessBefore;
- (NSString)description;
- (id)copyWithZone:(void *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKDeviceCapabilityCheckOptions

- (CKDeviceCapabilityCheckOptions)init
{
  return (CKDeviceCapabilityCheckOptions *)sub_18AF58B54();
}

- (CKDeviceCapabilityCheckOptions)initWithExcludeDevicesWithoutCapabilityCheckingSupport:(BOOL)a3 excludeZoneAccessBefore:(id)a4
{
  uint64_t v6 = sub_18AF161EC(&qword_1E9125470);
  MEMORY[0x1F4188790](v6 - 8);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v9 = type metadata accessor for Date();
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v9 = type metadata accessor for Date();
    uint64_t v10 = 1;
  }
  sub_18AF43708((uint64_t)v8, v10, 1, v9);
  return (CKDeviceCapabilityCheckOptions *)CKDeviceCapabilityCheckOptions.init(excludeDevicesWithoutCapabilityCheckingSupport:excludeZoneAccessBefore:)(a3, (uint64_t)v8);
}

- (BOOL)excludeDevicesWithoutCapabilityCheckingSupport
{
  return CKDeviceCapabilityCheckOptions.excludeDevicesWithoutCapabilityCheckingSupport.getter() & 1;
}

- (NSDate)excludeZoneAccessBefore
{
  uint64_t v2 = sub_18AF161EC(&qword_1E9125470);
  MEMORY[0x1F4188790](v2 - 8);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  CKDeviceCapabilityCheckOptions.excludeZoneAccessBefore.getter((uint64_t)v4);
  uint64_t v5 = type metadata accessor for Date();
  Class isa = 0;
  if (sub_18AF436E0((uint64_t)v4, 1, v5) != 1)
  {
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }

  return (NSDate *)isa;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  CKDeviceCapabilityCheckOptions.encode(with:)((NSCoder)v4);
}

- (CKDeviceCapabilityCheckOptions)initWithCoder:(id)a3
{
  return (CKDeviceCapabilityCheckOptions *)CKDeviceCapabilityCheckOptions.init(coder:)(a3);
}

- (id)copyWithZone:(void *)a3
{
  uint64_t v3 = self;
  CKDeviceCapabilityCheckOptions.copy(with:)((uint64_t)v3, v6);

  sub_18AF25FCC(v6, (uint64_t)v6[3]);
  id v4 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  sub_18AF40A30((uint64_t)v6);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  return sub_18AF59CC4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))CKDeviceCapabilityCheckOptions.isEqual(_:));
}

- (NSString)description
{
  return (NSString *)sub_18AF5A360(self, (uint64_t)a2, CKDeviceCapabilityCheckOptions.description.getter);
}

- (void).cxx_destruct
{
}

@end