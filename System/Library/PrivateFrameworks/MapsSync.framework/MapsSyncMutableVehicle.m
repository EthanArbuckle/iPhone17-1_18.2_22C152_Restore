@interface MapsSyncMutableVehicle
- (NSData)currentVehicleState;
- (NSData)powerByConnector;
- (NSData)preferredChargingNetworks;
- (NSDate)dateOfVehicleIngestion;
- (NSDate)lastStateUpdateDate;
- (NSNumber)supportedConnectors;
- (NSNumber)vehicleType;
- (NSNumber)year;
- (NSString)colorHex;
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
- (_TtC8MapsSync22MapsSyncMutableVehicle)initWithProxyObject:(id)a3;
- (void)setColorHex:(id)a3;
- (void)setCurrentVehicleState:(id)a3;
- (void)setDateOfVehicleIngestion:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setHeadUnitBluetoothIdentifier:(id)a3;
- (void)setHeadUnitMacAddress:(id)a3;
- (void)setIapIdentifier:(id)a3;
- (void)setLastStateUpdateDate:(id)a3;
- (void)setLicensePlate:(id)a3;
- (void)setLprPowerType:(id)a3;
- (void)setLprVehicleType:(id)a3;
- (void)setManufacturer:(id)a3;
- (void)setModel:(id)a3;
- (void)setPairedAppIdentifier:(id)a3;
- (void)setPowerByConnector:(id)a3;
- (void)setPreferredChargingNetworks:(id)a3;
- (void)setSiriIntentsIdentifier:(id)a3;
- (void)setSupportedConnectors:(id)a3;
- (void)setVehicleIdentifier:(id)a3;
- (void)setVehicleType:(id)a3;
- (void)setYear:(id)a3;
@end

@implementation MapsSyncMutableVehicle

- (_TtC8MapsSync22MapsSyncMutableVehicle)initWithProxyObject:(id)a3
{
  type metadata accessor for MapsSyncManagedVehicle();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync22MapsSyncMutableVehicle__proxy) = (Class)swift_dynamicCastClassUnconditional();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MapsSyncMutableBaseItem();
  id v5 = a3;
  return [(MapsSyncMutableBaseItem *)&v7 init];
}

- (NSString)colorHex
{
  return (NSString *)sub_1A7048734((char *)self, (uint64_t)a2, (SEL *)&selRef_colorHex);
}

- (void)setColorHex:(id)a3
{
}

- (NSData)currentVehicleState
{
  return (NSData *)sub_1A7048EA8((char *)self, (uint64_t)a2, (SEL *)&selRef_currentVehicleState);
}

- (void)setCurrentVehicleState:(id)a3
{
}

- (NSDate)dateOfVehicleIngestion
{
  return (NSDate *)sub_1A704774C((char *)self, (uint64_t)a2, (SEL *)&selRef_dateOfVehicleIngestion);
}

- (void)setDateOfVehicleIngestion:(id)a3
{
}

- (NSString)displayName
{
  return (NSString *)sub_1A7048734((char *)self, (uint64_t)a2, (SEL *)&selRef_displayName);
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)headUnitBluetoothIdentifier
{
  return (NSString *)sub_1A7048734((char *)self, (uint64_t)a2, (SEL *)&selRef_headUnitBluetoothIdentifier);
}

- (void)setHeadUnitBluetoothIdentifier:(id)a3
{
}

- (NSString)headUnitMacAddress
{
  return (NSString *)sub_1A7048734((char *)self, (uint64_t)a2, (SEL *)&selRef_headUnitMacAddress);
}

- (void)setHeadUnitMacAddress:(id)a3
{
}

- (NSString)iapIdentifier
{
  return (NSString *)sub_1A7048734((char *)self, (uint64_t)a2, (SEL *)&selRef_iapIdentifier);
}

- (void)setIapIdentifier:(id)a3
{
}

- (NSDate)lastStateUpdateDate
{
  return (NSDate *)sub_1A704774C((char *)self, (uint64_t)a2, (SEL *)&selRef_lastStateUpdateDate);
}

- (void)setLastStateUpdateDate:(id)a3
{
}

- (NSString)licensePlate
{
  return (NSString *)sub_1A7048734((char *)self, (uint64_t)a2, (SEL *)&selRef_licensePlate);
}

- (void)setLicensePlate:(id)a3
{
}

- (NSString)lprPowerType
{
  return (NSString *)sub_1A7048734((char *)self, (uint64_t)a2, (SEL *)&selRef_lprPowerType);
}

- (void)setLprPowerType:(id)a3
{
}

- (NSString)lprVehicleType
{
  return (NSString *)sub_1A7048734((char *)self, (uint64_t)a2, (SEL *)&selRef_lprVehicleType);
}

- (void)setLprVehicleType:(id)a3
{
}

- (NSString)manufacturer
{
  return (NSString *)sub_1A7048734((char *)self, (uint64_t)a2, (SEL *)&selRef_manufacturer);
}

- (void)setManufacturer:(id)a3
{
}

- (NSString)model
{
  return (NSString *)sub_1A7048734((char *)self, (uint64_t)a2, (SEL *)&selRef_model);
}

- (void)setModel:(id)a3
{
}

- (NSString)pairedAppIdentifier
{
  return (NSString *)sub_1A7048734((char *)self, (uint64_t)a2, (SEL *)&selRef_pairedAppIdentifier);
}

- (void)setPairedAppIdentifier:(id)a3
{
}

- (NSData)powerByConnector
{
  return (NSData *)sub_1A7048EA8((char *)self, (uint64_t)a2, (SEL *)&selRef_powerByConnector);
}

- (void)setPowerByConnector:(id)a3
{
}

- (NSString)siriIntentsIdentifier
{
  return (NSString *)sub_1A7048734((char *)self, (uint64_t)a2, (SEL *)&selRef_siriIntentsIdentifier);
}

- (void)setSiriIntentsIdentifier:(id)a3
{
}

- (NSNumber)supportedConnectors
{
  id v2 = objc_msgSend(*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync22MapsSyncMutableVehicle__proxy), sel_supportedConnectors);
  return (NSNumber *)v2;
}

- (void)setSupportedConnectors:(id)a3
{
}

- (NSString)vehicleIdentifier
{
  return (NSString *)sub_1A7048734((char *)self, (uint64_t)a2, (SEL *)&selRef_vehicleIdentifier);
}

- (void)setVehicleIdentifier:(id)a3
{
}

- (NSNumber)vehicleType
{
  id v2 = objc_msgSend(*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync22MapsSyncMutableVehicle__proxy), sel_vehicleType);
  return (NSNumber *)v2;
}

- (void)setVehicleType:(id)a3
{
}

- (NSNumber)year
{
  id v2 = objc_msgSend(*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync22MapsSyncMutableVehicle__proxy), sel_year);
  return (NSNumber *)v2;
}

- (void)setYear:(id)a3
{
}

- (NSData)preferredChargingNetworks
{
  return (NSData *)sub_1A7048EA8((char *)self, (uint64_t)a2, (SEL *)&selRef_preferredChargingNetworks);
}

- (void)setPreferredChargingNetworks:(id)a3
{
}

- (void).cxx_destruct
{
}

@end