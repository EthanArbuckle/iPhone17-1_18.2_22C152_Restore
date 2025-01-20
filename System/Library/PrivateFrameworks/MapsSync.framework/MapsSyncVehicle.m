@interface MapsSyncVehicle
+ (void)fetch:(int64_t)a3 :(int64_t)a4 :(id)a5 sort:(int64_t)a6 ascending:(BOOL)a7 completion:(id)a8;
+ (void)fetchForIdentifier:(id)a3 completion:(id)a4;
- (BOOL)isEqual:(id)a3;
- (Class)managedObjectClass;
- (NSData)currentVehicleState;
- (NSData)powerByConnector;
- (NSData)preferredChargingNetworks;
- (NSDate)dateOfVehicleIngestion;
- (NSDate)lastStateUpdateDate;
- (NSNumber)supportedConnectors;
- (NSNumber)vehicleType;
- (NSNumber)year;
- (NSString)colorHex;
- (NSString)description;
- (NSString)displayName;
- (NSString)headUnitBluetoothIdentifier;
- (NSString)headUnitMacAddress;
- (NSString)iapIdentifier;
- (NSString)licensePlate;
- (NSString)lprPowerType;
- (NSString)lprVehicleType;
- (NSString)manufacturer;
- (NSString)model;
- (NSString)pairedAppIdentifier;
- (NSString)siriIntentsIdentifier;
- (NSString)vehicleIdentifier;
- (_TtC8MapsSync15MapsSyncVehicle)initWithObject:(id)a3;
- (void)addEditWithBlock:(id)a3;
- (void)setPropertiesWithObject:(id)a3;
@end

@implementation MapsSyncVehicle

+ (void)fetch:(int64_t)a3 :(int64_t)a4 :(id)a5 sort:(int64_t)a6 ascending:(BOOL)a7 completion:(id)a8
{
  v13 = _Block_copy(a8);
  if (a5)
  {
    swift_unknownObjectRetain();
    sub_1A709D888();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v14, 0, sizeof(v14));
  }
  sub_1A6F2B33C(a3, a4, (uint64_t)v14, a6, a7, v13);
  _Block_release(v13);
  sub_1A6F00364((uint64_t)v14);
}

+ (void)fetchForIdentifier:(id)a3 completion:(id)a4
{
  v4 = _Block_copy(a4);
  uint64_t v5 = sub_1A709D438();
  uint64_t v7 = v6;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v4;
  _s8MapsSync0aB7VehicleC18fetchForIdentifier_10completionySS_yACSgctFZ_0(v5, v7, (uint64_t)sub_1A6F022EC, v8);
  swift_bridgeObjectRelease();
  swift_release();
}

- (NSString)colorHex
{
  return (NSString *)sub_1A6F389D8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__colorHex);
}

- (NSData)currentVehicleState
{
  return (NSData *)sub_1A6F38C90((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__currentVehicleState);
}

- (NSDate)dateOfVehicleIngestion
{
  return (NSDate *)sub_1A70446E8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__dateOfVehicleIngestion);
}

- (NSString)displayName
{
  return (NSString *)sub_1A6F389D8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__displayName);
}

- (NSString)headUnitBluetoothIdentifier
{
  return (NSString *)sub_1A6F389D8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__headUnitBluetoothIdentifier);
}

- (NSString)headUnitMacAddress
{
  return (NSString *)sub_1A6F389D8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__headUnitMacAddress);
}

- (NSString)iapIdentifier
{
  return (NSString *)sub_1A6F389D8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__iapIdentifier);
}

- (NSDate)lastStateUpdateDate
{
  return (NSDate *)sub_1A70446E8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__lastStateUpdateDate);
}

- (NSString)licensePlate
{
  return (NSString *)sub_1A6F389D8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__licensePlate);
}

- (NSString)lprPowerType
{
  return (NSString *)sub_1A6F389D8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__lprPowerType);
}

- (NSString)lprVehicleType
{
  return (NSString *)sub_1A6F389D8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__lprVehicleType);
}

- (NSString)manufacturer
{
  return (NSString *)sub_1A6F389D8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__manufacturer);
}

- (NSString)model
{
  return (NSString *)sub_1A6F389D8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__model);
}

- (NSString)pairedAppIdentifier
{
  return (NSString *)sub_1A6F389D8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__pairedAppIdentifier);
}

- (NSData)powerByConnector
{
  return (NSData *)sub_1A6F38C90((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__powerByConnector);
}

- (NSString)siriIntentsIdentifier
{
  return (NSString *)sub_1A6F389D8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__siriIntentsIdentifier);
}

- (NSNumber)supportedConnectors
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__supportedConnectors));
}

- (NSString)vehicleIdentifier
{
  return (NSString *)sub_1A6F389D8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__vehicleIdentifier);
}

- (NSNumber)vehicleType
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__vehicleType));
}

- (NSNumber)year
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__year));
}

- (NSData)preferredChargingNetworks
{
  return (NSData *)sub_1A6F38C90((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__preferredChargingNetworks);
}

- (NSString)description
{
  v2 = self;
  sub_1A7044A50();

  v3 = (void *)sub_1A709D428();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1A709D888();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  char v6 = sub_1A7044E48((uint64_t)v8);

  sub_1A6F22460((uint64_t)v8, (uint64_t *)&unk_1EB671260);
  return v6 & 1;
}

- (void)setPropertiesWithObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1A7045EE4(v4);
}

- (Class)managedObjectClass
{
  type metadata accessor for MapsSyncManagedVehicle();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)addEditWithBlock:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_1A6F022EC;
  *(void *)(v6 + 24) = v5;
  uint64_t v7 = self;
  swift_retain();
  sub_1A7019234((uint64_t)sub_1A704951C, v6);

  swift_release();
  swift_release();
}

- (_TtC8MapsSync15MapsSyncVehicle)initWithObject:(id)a3
{
  id v4 = a3;
  return (_TtC8MapsSync15MapsSyncVehicle *)sub_1A7046954(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1A6EEF5F4(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__currentVehicleState), *(void *)&self->super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__currentVehicleState]);
  sub_1A6F22460((uint64_t)self + OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__dateOfVehicleIngestion, &qword_1EB670330);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A6F22460((uint64_t)self + OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__lastStateUpdateDate, &qword_1EB670330);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A6EEF5F4(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__powerByConnector), *(void *)&self->super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__powerByConnector]);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__supportedConnectors));
  swift_bridgeObjectRelease();

  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__preferredChargingNetworks);
  unint64_t v4 = *(void *)&self->super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__preferredChargingNetworks];
  sub_1A6EEF5F4(v3, v4);
}

@end