@interface LNMeasurementValueType
+ (BOOL)supportsSecureCoding;
+ (LNMeasurementValueType)accelerationValueType;
+ (LNMeasurementValueType)angleValueType;
+ (LNMeasurementValueType)areaValueType;
+ (LNMeasurementValueType)concentrationMassValueType;
+ (LNMeasurementValueType)dispersionValueType;
+ (LNMeasurementValueType)durationValueType;
+ (LNMeasurementValueType)electricChargeValueType;
+ (LNMeasurementValueType)electricCurrentValueType;
+ (LNMeasurementValueType)electricPotentialDifferenceValueType;
+ (LNMeasurementValueType)electricResistanceValueType;
+ (LNMeasurementValueType)energyValueType;
+ (LNMeasurementValueType)frequencyValueType;
+ (LNMeasurementValueType)fuelEfficiencyValueType;
+ (LNMeasurementValueType)illuminanceValueType;
+ (LNMeasurementValueType)informationStorageValueType;
+ (LNMeasurementValueType)lengthValueType;
+ (LNMeasurementValueType)massValueType;
+ (LNMeasurementValueType)powerValueType;
+ (LNMeasurementValueType)pressureValueType;
+ (LNMeasurementValueType)speedValueType;
+ (LNMeasurementValueType)temperatureValueType;
+ (LNMeasurementValueType)unsupportedMeasurementValueType;
+ (LNMeasurementValueType)volumeValueType;
+ (id)objectClassesForCoding;
- (BOOL)isEqual:(id)a3;
- (Class)objectClass;
- (LNMeasurementValueType)initWithCoder:(id)a3;
- (LNMeasurementValueType)initWithUnitType:(int64_t)a3;
- (id)description;
- (id)typeIdentifierAsString;
- (int64_t)unitType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNMeasurementValueType

+ (id)objectClassesForCoding
{
  v2 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 arrayWithObject:v3];
}

- (int64_t)unitType
{
  return self->_unitType;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNMeasurementValueType *)a3;
  v5 = v4;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      int64_t v7 = [(LNMeasurementValueType *)self unitType];
      BOOL v8 = v7 == [(LNMeasurementValueType *)v6 unitType];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[LNMeasurementValueType unitType](self, "unitType"), @"unitType");
}

- (LNMeasurementValueType)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeIntegerForKey:@"unitType"];
  return [(LNMeasurementValueType *)self initWithUnitType:v4];
}

- (id)description
{
  int64_t v2 = [(LNMeasurementValueType *)self unitType];
  if ((unint64_t)(v2 - 1) > 0x15) {
    return @"Unsupported measurement type";
  }
  else {
    return off_1E590DD18[v2 - 1];
  }
}

- (id)typeIdentifierAsString
{
  int64_t v2 = [(LNMeasurementValueType *)self unitType];
  if ((unint64_t)(v2 - 1) > 0x15) {
    return @"Unsupported measurement type";
  }
  else {
    return off_1E590DD18[v2 - 1];
  }
}

- (Class)objectClass
{
  return (Class)objc_opt_class();
}

- (LNMeasurementValueType)initWithUnitType:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)LNMeasurementValueType;
  uint64_t v4 = [(LNValueType *)&v8 _init];
  v5 = v4;
  if (v4)
  {
    v4->_unitType = a3;
    v6 = v4;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (LNMeasurementValueType)volumeValueType
{
  if (volumeValueType_onceToken != -1) {
    dispatch_once(&volumeValueType_onceToken, &__block_literal_global_44);
  }
  int64_t v2 = (void *)volumeValueType_value;
  return (LNMeasurementValueType *)v2;
}

uint64_t __41__LNMeasurementValueType_volumeValueType__block_invoke()
{
  volumeValueType_value = [[LNMeasurementValueType alloc] initWithUnitType:4];
  return MEMORY[0x1F41817F8]();
}

+ (LNMeasurementValueType)temperatureValueType
{
  if (temperatureValueType_onceToken != -1) {
    dispatch_once(&temperatureValueType_onceToken, &__block_literal_global_42);
  }
  int64_t v2 = (void *)temperatureValueType_value;
  return (LNMeasurementValueType *)v2;
}

uint64_t __46__LNMeasurementValueType_temperatureValueType__block_invoke()
{
  temperatureValueType_value = [[LNMeasurementValueType alloc] initWithUnitType:3];
  return MEMORY[0x1F41817F8]();
}

+ (LNMeasurementValueType)speedValueType
{
  if (speedValueType_onceToken != -1) {
    dispatch_once(&speedValueType_onceToken, &__block_literal_global_40);
  }
  int64_t v2 = (void *)speedValueType_value;
  return (LNMeasurementValueType *)v2;
}

uint64_t __40__LNMeasurementValueType_speedValueType__block_invoke()
{
  speedValueType_value = [[LNMeasurementValueType alloc] initWithUnitType:5];
  return MEMORY[0x1F41817F8]();
}

+ (LNMeasurementValueType)pressureValueType
{
  if (pressureValueType_onceToken != -1) {
    dispatch_once(&pressureValueType_onceToken, &__block_literal_global_38_5430);
  }
  int64_t v2 = (void *)pressureValueType_value;
  return (LNMeasurementValueType *)v2;
}

uint64_t __43__LNMeasurementValueType_pressureValueType__block_invoke()
{
  pressureValueType_value = [[LNMeasurementValueType alloc] initWithUnitType:22];
  return MEMORY[0x1F41817F8]();
}

+ (LNMeasurementValueType)powerValueType
{
  if (powerValueType_onceToken != -1) {
    dispatch_once(&powerValueType_onceToken, &__block_literal_global_36);
  }
  int64_t v2 = (void *)powerValueType_value;
  return (LNMeasurementValueType *)v2;
}

uint64_t __40__LNMeasurementValueType_powerValueType__block_invoke()
{
  powerValueType_value = [[LNMeasurementValueType alloc] initWithUnitType:21];
  return MEMORY[0x1F41817F8]();
}

+ (LNMeasurementValueType)massValueType
{
  if (massValueType_onceToken != -1) {
    dispatch_once(&massValueType_onceToken, &__block_literal_global_34);
  }
  int64_t v2 = (void *)massValueType_value;
  return (LNMeasurementValueType *)v2;
}

uint64_t __39__LNMeasurementValueType_massValueType__block_invoke()
{
  massValueType_value = [[LNMeasurementValueType alloc] initWithUnitType:2];
  return MEMORY[0x1F41817F8]();
}

+ (LNMeasurementValueType)lengthValueType
{
  if (lengthValueType_onceToken != -1) {
    dispatch_once(&lengthValueType_onceToken, &__block_literal_global_32_5432);
  }
  int64_t v2 = (void *)lengthValueType_value;
  return (LNMeasurementValueType *)v2;
}

uint64_t __41__LNMeasurementValueType_lengthValueType__block_invoke()
{
  lengthValueType_value = [[LNMeasurementValueType alloc] initWithUnitType:1];
  return MEMORY[0x1F41817F8]();
}

+ (LNMeasurementValueType)informationStorageValueType
{
  if (informationStorageValueType_onceToken != -1) {
    dispatch_once(&informationStorageValueType_onceToken, &__block_literal_global_30);
  }
  int64_t v2 = (void *)informationStorageValueType_value;
  return (LNMeasurementValueType *)v2;
}

uint64_t __53__LNMeasurementValueType_informationStorageValueType__block_invoke()
{
  informationStorageValueType_value = [[LNMeasurementValueType alloc] initWithUnitType:20];
  return MEMORY[0x1F41817F8]();
}

+ (LNMeasurementValueType)illuminanceValueType
{
  if (illuminanceValueType_onceToken != -1) {
    dispatch_once(&illuminanceValueType_onceToken, &__block_literal_global_28_5434);
  }
  int64_t v2 = (void *)illuminanceValueType_value;
  return (LNMeasurementValueType *)v2;
}

uint64_t __46__LNMeasurementValueType_illuminanceValueType__block_invoke()
{
  illuminanceValueType_value = [[LNMeasurementValueType alloc] initWithUnitType:19];
  return MEMORY[0x1F41817F8]();
}

+ (LNMeasurementValueType)fuelEfficiencyValueType
{
  if (fuelEfficiencyValueType_onceToken != -1) {
    dispatch_once(&fuelEfficiencyValueType_onceToken, &__block_literal_global_26_5436);
  }
  int64_t v2 = (void *)fuelEfficiencyValueType_value;
  return (LNMeasurementValueType *)v2;
}

uint64_t __49__LNMeasurementValueType_fuelEfficiencyValueType__block_invoke()
{
  fuelEfficiencyValueType_value = [[LNMeasurementValueType alloc] initWithUnitType:18];
  return MEMORY[0x1F41817F8]();
}

+ (LNMeasurementValueType)frequencyValueType
{
  if (frequencyValueType_onceToken != -1) {
    dispatch_once(&frequencyValueType_onceToken, &__block_literal_global_24_5438);
  }
  int64_t v2 = (void *)frequencyValueType_value;
  return (LNMeasurementValueType *)v2;
}

uint64_t __44__LNMeasurementValueType_frequencyValueType__block_invoke()
{
  frequencyValueType_value = [[LNMeasurementValueType alloc] initWithUnitType:17];
  return MEMORY[0x1F41817F8]();
}

+ (LNMeasurementValueType)energyValueType
{
  if (energyValueType_onceToken != -1) {
    dispatch_once(&energyValueType_onceToken, &__block_literal_global_22_5440);
  }
  int64_t v2 = (void *)energyValueType_value;
  return (LNMeasurementValueType *)v2;
}

uint64_t __41__LNMeasurementValueType_energyValueType__block_invoke()
{
  energyValueType_value = [[LNMeasurementValueType alloc] initWithUnitType:6];
  return MEMORY[0x1F41817F8]();
}

+ (LNMeasurementValueType)electricResistanceValueType
{
  if (electricResistanceValueType_onceToken != -1) {
    dispatch_once(&electricResistanceValueType_onceToken, &__block_literal_global_20_5442);
  }
  int64_t v2 = (void *)electricResistanceValueType_value;
  return (LNMeasurementValueType *)v2;
}

uint64_t __53__LNMeasurementValueType_electricResistanceValueType__block_invoke()
{
  electricResistanceValueType_value = [[LNMeasurementValueType alloc] initWithUnitType:16];
  return MEMORY[0x1F41817F8]();
}

+ (LNMeasurementValueType)electricPotentialDifferenceValueType
{
  if (electricPotentialDifferenceValueType_onceToken != -1) {
    dispatch_once(&electricPotentialDifferenceValueType_onceToken, &__block_literal_global_18_5444);
  }
  int64_t v2 = (void *)electricPotentialDifferenceValueType_value;
  return (LNMeasurementValueType *)v2;
}

uint64_t __62__LNMeasurementValueType_electricPotentialDifferenceValueType__block_invoke()
{
  electricPotentialDifferenceValueType_value = [[LNMeasurementValueType alloc] initWithUnitType:15];
  return MEMORY[0x1F41817F8]();
}

+ (LNMeasurementValueType)electricCurrentValueType
{
  if (electricCurrentValueType_onceToken != -1) {
    dispatch_once(&electricCurrentValueType_onceToken, &__block_literal_global_16_5446);
  }
  int64_t v2 = (void *)electricCurrentValueType_value;
  return (LNMeasurementValueType *)v2;
}

uint64_t __50__LNMeasurementValueType_electricCurrentValueType__block_invoke()
{
  electricCurrentValueType_value = [[LNMeasurementValueType alloc] initWithUnitType:14];
  return MEMORY[0x1F41817F8]();
}

+ (LNMeasurementValueType)electricChargeValueType
{
  if (electricChargeValueType_onceToken != -1) {
    dispatch_once(&electricChargeValueType_onceToken, &__block_literal_global_14_5448);
  }
  int64_t v2 = (void *)electricChargeValueType_value;
  return (LNMeasurementValueType *)v2;
}

uint64_t __49__LNMeasurementValueType_electricChargeValueType__block_invoke()
{
  electricChargeValueType_value = [[LNMeasurementValueType alloc] initWithUnitType:13];
  return MEMORY[0x1F41817F8]();
}

+ (LNMeasurementValueType)durationValueType
{
  if (durationValueType_onceToken != -1) {
    dispatch_once(&durationValueType_onceToken, &__block_literal_global_12_5450);
  }
  int64_t v2 = (void *)durationValueType_value;
  return (LNMeasurementValueType *)v2;
}

uint64_t __43__LNMeasurementValueType_durationValueType__block_invoke()
{
  durationValueType_value = [[LNMeasurementValueType alloc] initWithUnitType:7];
  return MEMORY[0x1F41817F8]();
}

+ (LNMeasurementValueType)dispersionValueType
{
  if (dispersionValueType_onceToken != -1) {
    dispatch_once(&dispersionValueType_onceToken, &__block_literal_global_10_5452);
  }
  int64_t v2 = (void *)dispersionValueType_value;
  return (LNMeasurementValueType *)v2;
}

uint64_t __45__LNMeasurementValueType_dispersionValueType__block_invoke()
{
  dispersionValueType_value = [[LNMeasurementValueType alloc] initWithUnitType:12];
  return MEMORY[0x1F41817F8]();
}

+ (LNMeasurementValueType)concentrationMassValueType
{
  if (concentrationMassValueType_onceToken != -1) {
    dispatch_once(&concentrationMassValueType_onceToken, &__block_literal_global_8_5454);
  }
  int64_t v2 = (void *)concentrationMassValueType_value;
  return (LNMeasurementValueType *)v2;
}

uint64_t __52__LNMeasurementValueType_concentrationMassValueType__block_invoke()
{
  concentrationMassValueType_value = [[LNMeasurementValueType alloc] initWithUnitType:11];
  return MEMORY[0x1F41817F8]();
}

+ (LNMeasurementValueType)areaValueType
{
  if (areaValueType_onceToken != -1) {
    dispatch_once(&areaValueType_onceToken, &__block_literal_global_6_5456);
  }
  int64_t v2 = (void *)areaValueType_value;
  return (LNMeasurementValueType *)v2;
}

uint64_t __39__LNMeasurementValueType_areaValueType__block_invoke()
{
  areaValueType_value = [[LNMeasurementValueType alloc] initWithUnitType:10];
  return MEMORY[0x1F41817F8]();
}

+ (LNMeasurementValueType)angleValueType
{
  if (angleValueType_onceToken != -1) {
    dispatch_once(&angleValueType_onceToken, &__block_literal_global_4_5458);
  }
  int64_t v2 = (void *)angleValueType_value;
  return (LNMeasurementValueType *)v2;
}

uint64_t __40__LNMeasurementValueType_angleValueType__block_invoke()
{
  angleValueType_value = [[LNMeasurementValueType alloc] initWithUnitType:9];
  return MEMORY[0x1F41817F8]();
}

+ (LNMeasurementValueType)accelerationValueType
{
  if (accelerationValueType_onceToken != -1) {
    dispatch_once(&accelerationValueType_onceToken, &__block_literal_global_2_5460);
  }
  int64_t v2 = (void *)accelerationValueType_value;
  return (LNMeasurementValueType *)v2;
}

uint64_t __47__LNMeasurementValueType_accelerationValueType__block_invoke()
{
  accelerationValueType_value = [[LNMeasurementValueType alloc] initWithUnitType:8];
  return MEMORY[0x1F41817F8]();
}

+ (LNMeasurementValueType)unsupportedMeasurementValueType
{
  if (unsupportedMeasurementValueType_onceToken != -1) {
    dispatch_once(&unsupportedMeasurementValueType_onceToken, &__block_literal_global_5462);
  }
  int64_t v2 = (void *)unsupportedMeasurementValueType_value;
  return (LNMeasurementValueType *)v2;
}

uint64_t __57__LNMeasurementValueType_unsupportedMeasurementValueType__block_invoke()
{
  unsupportedMeasurementValueType_value = [[LNMeasurementValueType alloc] initWithUnitType:0];
  return MEMORY[0x1F41817F8]();
}

@end