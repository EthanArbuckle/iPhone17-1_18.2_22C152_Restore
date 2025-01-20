@interface BCBatteryDevice
+ (BOOL)supportsSecureCoding;
+ (id)batteryDeviceWithIdentifier:(id)a3 vendor:(int64_t)a4 productIdentifier:(int64_t)a5 parts:(unint64_t)a6 matchIdentifier:(id)a7;
- (BCBatteryDevice)initWithCoder:(id)a3;
- (BCBatteryDevice)initWithIdentifier:(id)a3 vendor:(int64_t)a4 productIdentifier:(int64_t)a5 parts:(unint64_t)a6 matchIdentifier:(id)a7;
- (BOOL)approximatesPercentCharge;
- (BOOL)isCharging;
- (BOOL)isConnected;
- (BOOL)isFake;
- (BOOL)isInternal;
- (BOOL)isLowBattery;
- (BOOL)isLowPowerModeActive;
- (BOOL)isPowerSource;
- (BOOL)isWirelesslyCharging;
- (NSString)accessoryIdentifier;
- (NSString)groupName;
- (NSString)identifier;
- (NSString)matchIdentifier;
- (NSString)modelNumber;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)synthesizedRepresentativeDevice;
- (int64_t)percentCharge;
- (int64_t)powerSourceState;
- (int64_t)productIdentifier;
- (int64_t)transportType;
- (int64_t)vendor;
- (unint64_t)accessoryCategory;
- (unint64_t)parts;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessoryCategory:(unint64_t)a3;
- (void)setAccessoryIdentifier:(id)a3;
- (void)setApproximatesPercentCharge:(BOOL)a3;
- (void)setCharging:(BOOL)a3;
- (void)setConnected:(BOOL)a3;
- (void)setFake:(BOOL)a3;
- (void)setGroupName:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInternal:(BOOL)a3;
- (void)setLowBattery:(BOOL)a3;
- (void)setLowPowerModeActive:(BOOL)a3;
- (void)setModelNumber:(id)a3;
- (void)setName:(id)a3;
- (void)setParts:(unint64_t)a3;
- (void)setPercentCharge:(int64_t)a3;
- (void)setPowerSource:(BOOL)a3;
- (void)setPowerSourceState:(int64_t)a3;
- (void)setTransportType:(int64_t)a3;
- (void)setWirelesslyCharging:(BOOL)a3;
@end

@implementation BCBatteryDevice

- (int64_t)productIdentifier
{
  return self->_productIdentifier;
}

- (int64_t)percentCharge
{
  return self->_percentCharge;
}

- (BOOL)isCharging
{
  return self->_charging;
}

- (BOOL)isInternal
{
  return self->_internal;
}

- (void)setWirelesslyCharging:(BOOL)a3
{
  self->_wirelesslyCharging = a3;
}

- (void)setTransportType:(int64_t)a3
{
  self->_transportType = a3;
}

- (void)setPowerSourceState:(int64_t)a3
{
  self->_powerSourceState = a3;
}

- (void)setPowerSource:(BOOL)a3
{
  self->_powerSource = a3;
}

- (void)setPercentCharge:(int64_t)a3
{
  self->_percentCharge = a3;
}

- (void)setName:(id)a3
{
}

- (void)setModelNumber:(id)a3
{
}

- (void)setLowPowerModeActive:(BOOL)a3
{
  self->_lowPowerModeActive = a3;
}

- (void)setLowBattery:(BOOL)a3
{
  self->_lowBattery = a3;
}

- (void)setInternal:(BOOL)a3
{
  self->_internal = a3;
}

- (void)setGroupName:(id)a3
{
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (void)setCharging:(BOOL)a3
{
  self->_charging = a3;
}

- (void)setApproximatesPercentCharge:(BOOL)a3
{
  self->_approximatesPercentCharge = a3;
}

- (void)setAccessoryIdentifier:(id)a3
{
}

- (void)setAccessoryCategory:(unint64_t)a3
{
  self->_accessoryCategory = a3;
}

- (NSString)matchIdentifier
{
  return self->_matchIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_modelNumber, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
  objc_storeStrong((id *)&self->_matchIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)batteryDeviceWithIdentifier:(id)a3 vendor:(int64_t)a4 productIdentifier:(int64_t)a5 parts:(unint64_t)a6 matchIdentifier:(id)a7
{
  id v12 = a7;
  id v13 = a3;
  v14 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v13 vendor:a4 productIdentifier:a5 parts:a6 matchIdentifier:v12];

  return v14;
}

- (BCBatteryDevice)initWithIdentifier:(id)a3 vendor:(int64_t)a4 productIdentifier:(int64_t)a5 parts:(unint64_t)a6 matchIdentifier:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  v20.receiver = self;
  v20.super_class = (Class)BCBatteryDevice;
  v14 = [(BCBatteryDevice *)&v20 init];
  if (v14)
  {
    uint64_t v15 = [v12 copy];
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v15;

    v14->_vendor = a4;
    v14->_productIdentifier = a5;
    v14->_parts = a6;
    uint64_t v17 = [v13 copy];
    matchIdentifier = v14->_matchIdentifier;
    v14->_matchIdentifier = (NSString *)v17;
  }
  return v14;
}

- (id)description
{
  v34 = NSString;
  uint64_t v3 = objc_opt_class();
  BOOL fake = self->_fake;
  int64_t vendor = self->_vendor;
  v5 = @"Unknown";
  v6 = @"Beats";
  if (vendor != 2) {
    v6 = @"Unknown";
  }
  if (vendor == 1) {
    v7 = @"Apple";
  }
  else {
    v7 = v6;
  }
  int64_t productIdentifier = self->_productIdentifier;
  uint64_t v33 = v3;
  parts = (void *)self->_parts;
  v9 = v7;
  v10 = BCStringFromParts(parts);
  identifier = self->_identifier;
  name = self->_name;
  matchIdentifier = self->_matchIdentifier;
  int64_t percentCharge = self->_percentCharge;
  groupName = self->_groupName;
  v11 = NSStringFromBOOL();
  id v12 = NSStringFromBOOL();
  id v13 = NSStringFromBOOL();
  v14 = NSStringFromBOOL();
  uint64_t v15 = NSStringFromBOOL();
  uint64_t v16 = NSStringFromBOOL();
  uint64_t v17 = (void *)v16;
  unint64_t v18 = self->_powerSourceState - 1;
  if (v18 <= 2) {
    v5 = off_264413C80[v18];
  }
  unint64_t v19 = self->_transportType - 1;
  if (v19 > 3) {
    objc_super v20 = @"Unknown";
  }
  else {
    objc_super v20 = off_264413C98[v19];
  }
  unint64_t v21 = self->_accessoryCategory - 1;
  if (v21 > 8) {
    v22 = @"Unknown";
  }
  else {
    v22 = off_264413CB8[v21];
  }
  v23 = @"**FAKE DEVICE**";
  if (!fake) {
    v23 = &stru_26CCDE918;
  }
  objc_msgSend(v34, "stringWithFormat:", @"<%@: %p;%@ int64_t vendor = %@; productIdentifier = %ld; parts = %@; identifier = %@; matchIdentifier = %@; name = %@; groupName =%@; percentCharge = %ld; lowBattery = %@; lowPowerModeActive = %@; connected = %@; charging = %@; internal = %@; powerSource = %@; poweredSoureState = %@; transportType = %@; accessoryIdentifier = %@; accessoryCategory = %@; modelNumber = %@; %@%@>",
    v33,
    self,
    v23,
    v9,
    productIdentifier,
    v10,
    identifier,
    matchIdentifier,
    name,
    groupName,
    percentCharge,
    v11,
    v12,
    v13,
    v14,
    v15,
    v16,
    v5,
    v20,
    self->_accessoryIdentifier,
    v22,
    self->_modelNumber,
    &stru_26CCDE918,
  v24 = &stru_26CCDE918);

  return v24;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BCBatteryDevice)initWithCoder:(id)a3
{
  v23.receiver = self;
  v23.super_class = (Class)BCBatteryDevice;
  id v3 = a3;
  v4 = [(BCBatteryDevice *)&v23 init];
  v5 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"identifier", v23.receiver, v23.super_class);
  uint64_t v6 = [v5 copy];
  identifier = v4->_identifier;
  v4->_identifier = (NSString *)v6;

  v4->_int64_t vendor = [v3 decodeIntegerForKey:@"vendor"];
  v4->_int64_t productIdentifier = [v3 decodeIntegerForKey:@"productIdentifier"];
  v4->_parts = [v3 decodeIntegerForKey:@"parts"];
  v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"matchIdentifier"];
  uint64_t v9 = [v8 copy];
  matchIdentifier = v4->_matchIdentifier;
  v4->_matchIdentifier = (NSString *)v9;

  v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  uint64_t v12 = [v11 copy];
  name = v4->_name;
  v4->_name = (NSString *)v12;

  v14 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"groupName"];
  uint64_t v15 = [v14 copy];
  groupName = v4->_groupName;
  v4->_groupName = (NSString *)v15;

  v4->_int64_t percentCharge = [v3 decodeIntegerForKey:@"percentCharge"];
  v4->_connected = [v3 decodeBoolForKey:@"connected"];
  v4->_charging = [v3 decodeBoolForKey:@"charging"];
  v4->_internal = [v3 decodeBoolForKey:@"internal"];
  v4->_powerSource = [v3 decodeBoolForKey:@"powerSource"];
  v4->_powerSourceState = [v3 decodeIntegerForKey:@"powerSourceState"];
  v4->_approximatesPercentCharge = [v3 decodeBoolForKey:@"approximatesPercentCharge"];
  v4->_transportType = [v3 decodeIntegerForKey:@"transportType"];
  v4->_BOOL fake = [v3 decodeBoolForKey:@"fake"];
  uint64_t v17 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"accessoryIdentifier"];
  uint64_t v18 = [v17 copy];
  accessoryIdentifier = v4->_accessoryIdentifier;
  v4->_accessoryIdentifier = (NSString *)v18;

  v4->_accessoryCategory = [v3 decodeIntegerForKey:@"accessoryCategory"];
  v4->_wirelesslyCharging = [v3 decodeBoolForKey:@"wirelesslyCharging"];
  uint64_t v20 = [v3 decodeObjectForKey:@"modelNumber"];

  modelNumber = v4->_modelNumber;
  v4->_modelNumber = (NSString *)v20;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  if ([(NSString *)self->_identifier length]) {
    [v11 encodeObject:self->_identifier forKey:@"identifier"];
  }
  int64_t vendor = self->_vendor;
  if (vendor) {
    [v11 encodeInteger:vendor forKey:@"vendor"];
  }
  int64_t productIdentifier = self->_productIdentifier;
  if (productIdentifier) {
    [v11 encodeInteger:productIdentifier forKey:@"productIdentifier"];
  }
  unint64_t parts = self->_parts;
  if (parts) {
    [v11 encodeInteger:parts forKey:@"parts"];
  }
  if ([(NSString *)self->_matchIdentifier length]) {
    [v11 encodeObject:self->_matchIdentifier forKey:@"matchIdentifier"];
  }
  if ([(NSString *)self->_name length]) {
    [v11 encodeObject:self->_name forKey:@"name"];
  }
  if ([(NSString *)self->_groupName length]) {
    [v11 encodeObject:self->_groupName forKey:@"groupName"];
  }
  int64_t percentCharge = self->_percentCharge;
  if (percentCharge) {
    [v11 encodeInteger:percentCharge forKey:@"percentCharge"];
  }
  if (self->_connected) {
    [v11 encodeBool:1 forKey:@"connected"];
  }
  if (self->_charging) {
    [v11 encodeBool:1 forKey:@"charging"];
  }
  if (self->_internal) {
    [v11 encodeBool:1 forKey:@"internal"];
  }
  if (self->_powerSource) {
    [v11 encodeBool:1 forKey:@"powerSource"];
  }
  int64_t powerSourceState = self->_powerSourceState;
  if (powerSourceState) {
    [v11 encodeInteger:powerSourceState forKey:@"powerSourceState"];
  }
  if (self->_approximatesPercentCharge) {
    [v11 encodeBool:1 forKey:@"approximatesPercentCharge"];
  }
  int64_t transportType = self->_transportType;
  if (transportType) {
    [v11 encodeInteger:transportType forKey:@"transportType"];
  }
  if (self->_fake) {
    [v11 encodeBool:1 forKey:@"fake"];
  }
  if ([(NSString *)self->_accessoryIdentifier length]) {
    [v11 encodeObject:self->_accessoryIdentifier forKey:@"accessoryIdentifier"];
  }
  unint64_t accessoryCategory = self->_accessoryCategory;
  if (accessoryCategory) {
    [v11 encodeInteger:accessoryCategory forKey:@"accessoryCategory"];
  }
  if (self->_wirelesslyCharging) {
    [v11 encodeBool:1 forKey:@"wirelesslyCharging"];
  }
  if ([(NSString *)self->_modelNumber length]) {
    [v11 encodeObject:self->_modelNumber forKey:@"modelNumber"];
  }
  MEMORY[0x270F9A758]();
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[BCBatteryDevice allocWithZone:a3] initWithIdentifier:self->_identifier vendor:self->_vendor productIdentifier:self->_productIdentifier parts:self->_parts matchIdentifier:self->_matchIdentifier];
  [(BCBatteryDevice *)v4 setIdentifier:self->_identifier];
  [(BCBatteryDevice *)v4 setName:self->_name];
  [(BCBatteryDevice *)v4 setGroupName:self->_groupName];
  [(BCBatteryDevice *)v4 setPercentCharge:self->_percentCharge];
  [(BCBatteryDevice *)v4 setConnected:self->_connected];
  [(BCBatteryDevice *)v4 setCharging:self->_charging];
  [(BCBatteryDevice *)v4 setLowBattery:self->_lowBattery];
  [(BCBatteryDevice *)v4 setLowPowerModeActive:self->_lowPowerModeActive];
  [(BCBatteryDevice *)v4 setInternal:self->_internal];
  [(BCBatteryDevice *)v4 setPowerSource:self->_powerSource];
  [(BCBatteryDevice *)v4 setPowerSourceState:self->_powerSourceState];
  [(BCBatteryDevice *)v4 setApproximatesPercentCharge:self->_approximatesPercentCharge];
  [(BCBatteryDevice *)v4 setTransportType:self->_transportType];
  [(BCBatteryDevice *)v4 setFake:self->_fake];
  [(BCBatteryDevice *)v4 setAccessoryIdentifier:self->_accessoryIdentifier];
  [(BCBatteryDevice *)v4 setAccessoryCategory:self->_accessoryCategory];
  [(BCBatteryDevice *)v4 setWirelesslyCharging:self->_wirelesslyCharging];
  [(BCBatteryDevice *)v4 setModelNumber:self->_modelNumber];
  return v4;
}

- (id)synthesizedRepresentativeDevice
{
  id v3 = (void *)[(BCBatteryDevice *)self copy];
  if ([(BCBatteryDevice *)self parts] == 1 || [(BCBatteryDevice *)self parts] == 2)
  {
    v4 = [v3 groupName];
    [v3 setName:v4];

    [v3 setParts:3];
    v5 = NSString;
    uint64_t v6 = [(BCBatteryDevice *)self identifier];
    v7 = [v5 stringWithFormat:@"%@-synthesized", v6];
    [v3 setIdentifier:v7];
  }
  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (int64_t)vendor
{
  return self->_vendor;
}

- (int64_t)powerSourceState
{
  return self->_powerSourceState;
}

- (NSString)accessoryIdentifier
{
  return self->_accessoryIdentifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)modelNumber
{
  return self->_modelNumber;
}

- (BOOL)isConnected
{
  return self->_connected;
}

- (BOOL)isLowPowerModeActive
{
  return self->_lowPowerModeActive;
}

- (BOOL)isLowBattery
{
  return self->_lowBattery;
}

- (BOOL)isPowerSource
{
  return self->_powerSource;
}

- (BOOL)approximatesPercentCharge
{
  return self->_approximatesPercentCharge;
}

- (unint64_t)parts
{
  return self->_parts;
}

- (void)setParts:(unint64_t)a3
{
  self->_unint64_t parts = a3;
}

- (unint64_t)accessoryCategory
{
  return self->_accessoryCategory;
}

- (BOOL)isWirelesslyCharging
{
  return self->_wirelesslyCharging;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (int64_t)transportType
{
  return self->_transportType;
}

- (BOOL)isFake
{
  return self->_fake;
}

- (void)setFake:(BOOL)a3
{
  self->_BOOL fake = a3;
}

@end