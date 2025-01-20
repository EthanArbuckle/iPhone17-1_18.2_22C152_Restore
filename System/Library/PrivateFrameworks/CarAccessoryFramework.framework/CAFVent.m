@interface CAFVent
+ (double)autoGroupTimer;
+ (id)indexBy;
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (id)typeComparator;
+ (void)load;
- (BOOL)autoMode;
- (BOOL)currentIndexDisabled;
- (BOOL)currentIndexInvalid;
- (BOOL)currentIndexRestricted;
- (BOOL)hasAutoMode;
- (BOOL)hasOn;
- (BOOL)on;
- (BOOL)onDisabled;
- (BOOL)onInvalid;
- (BOOL)onRestricted;
- (BOOL)registeredForAutoMode;
- (BOOL)registeredForCurrentIndex;
- (BOOL)registeredForOn;
- (BOOL)registeredForVehicleLayoutKey;
- (BOOL)registeredForVentCombinations;
- (CAFArrayCharacteristic)combinationsCharacteristic;
- (CAFBoolCharacteristic)autoModeCharacteristic;
- (CAFBoolCharacteristic)onCharacteristic;
- (CAFStringCharacteristic)vehicleLayoutKeyCharacteristic;
- (CAFUInt32Characteristic)currentIndexCharacteristic;
- (CAFUInt32Range)currentIndexRange;
- (NSArray)combinations;
- (NSString)vehicleLayoutKey;
- (id)name;
- (int64_t)typeCompare:(id)a3;
- (unsigned)currentIndex;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)setCurrentIndex:(unsigned int)a3;
- (void)setOn:(BOOL)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFVent

- (int64_t)typeCompare:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v5 = [(CAFVent *)self combinations];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v5);
        }
        v8 |= [*(id *)(*((void *)&v23 + 1) + 8 * i) unsignedIntValue];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v11 = objc_msgSend(v4, "combinations", 0);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = 0;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v11);
        }
        v14 |= [*(id *)(*((void *)&v19 + 1) + 8 * j) unsignedIntValue];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v13);
  }
  else
  {
    uint64_t v14 = 0;
  }

  int64_t v17 = +[CAFBitMaskUtilities compareBitmask1:v8 bitmask2:v14 optionsSort:&unk_26FD90978];
  return v17;
}

+ (id)typeComparator
{
  return &__block_literal_global_7;
}

uint64_t __34__CAFVent_Compare__typeComparator__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "typeCompare:");
}

+ (double)autoGroupTimer
{
  return CAFPreferencesGetDouble(@"ClimateAutoModeGroupedVentsTimer", 1.0);
}

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFVent;
  objc_msgSendSuper2(&v2, sel_load);
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_26FD96388]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  v6.receiver = self;
  v6.super_class = (Class)CAFVent;
  [(CAFService *)&v6 registerObserver:v5];
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_26FD96388]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  v6.receiver = self;
  v6.super_class = (Class)CAFVent;
  [(CAFService *)&v6 unregisterObserver:v5];
}

- (id)name
{
  v3 = [(CAFService *)self typeName];
  id v4 = [(CAFVent *)self vehicleLayoutKeyCharacteristic];
  id v5 = [v4 formattedValue];

  if ([v5 length])
  {
    uint64_t v6 = [v3 stringByAppendingFormat:@"-%@", v5];

    v3 = (void *)v6;
  }

  return v3;
}

- (CAFArrayCharacteristic)combinationsCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  uint64_t v7 = [(CAFService *)self accessory];
  uint64_t v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000031000025"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000031000025"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFArrayCharacteristic *)v11;
}

- (NSArray)combinations
{
  objc_super v2 = [(CAFVent *)self combinationsCharacteristic];
  v3 = [v2 arrayValue];

  return (NSArray *)v3;
}

- (CAFUInt32Characteristic)currentIndexCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  uint64_t v7 = [(CAFService *)self accessory];
  uint64_t v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000030000038"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000030000038"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFUInt32Characteristic *)v11;
}

- (unsigned)currentIndex
{
  objc_super v2 = [(CAFVent *)self currentIndexCharacteristic];
  unsigned int v3 = [v2 uint32Value];

  return v3;
}

- (void)setCurrentIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(CAFVent *)self currentIndexCharacteristic];
  [v4 setUint32Value:v3];
}

- (CAFUInt32Range)currentIndexRange
{
  objc_super v2 = [(CAFVent *)self currentIndexCharacteristic];
  uint64_t v3 = [v2 range];

  return (CAFUInt32Range *)v3;
}

- (BOOL)currentIndexDisabled
{
  objc_super v2 = [(CAFVent *)self currentIndexCharacteristic];
  char v3 = [v2 isDisabled];

  return v3;
}

- (BOOL)currentIndexInvalid
{
  objc_super v2 = [(CAFVent *)self currentIndexCharacteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (BOOL)currentIndexRestricted
{
  objc_super v2 = [(CAFVent *)self currentIndexCharacteristic];
  char v3 = [v2 isRestricted];

  return v3;
}

- (CAFBoolCharacteristic)autoModeCharacteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  uint64_t v7 = [(CAFService *)self accessory];
  uint64_t v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x000000003000005F"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x000000003000005F"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFBoolCharacteristic *)v11;
}

- (BOOL)autoMode
{
  objc_super v2 = [(CAFVent *)self autoModeCharacteristic];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)hasAutoMode
{
  objc_super v2 = [(CAFVent *)self autoModeCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFBoolCharacteristic)onCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  uint64_t v7 = [(CAFService *)self accessory];
  uint64_t v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000030000002"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000030000002"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFBoolCharacteristic *)v11;
}

- (BOOL)on
{
  objc_super v2 = [(CAFVent *)self onCharacteristic];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setOn:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CAFVent *)self onCharacteristic];
  [v4 setBoolValue:v3];
}

- (BOOL)hasOn
{
  objc_super v2 = [(CAFVent *)self onCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)onDisabled
{
  objc_super v2 = [(CAFVent *)self onCharacteristic];
  char v3 = [v2 isDisabled];

  return v3;
}

- (BOOL)onInvalid
{
  objc_super v2 = [(CAFVent *)self onCharacteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (BOOL)onRestricted
{
  objc_super v2 = [(CAFVent *)self onCharacteristic];
  char v3 = [v2 isRestricted];

  return v3;
}

- (CAFStringCharacteristic)vehicleLayoutKeyCharacteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  uint64_t v7 = [(CAFService *)self accessory];
  uint64_t v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000036000065"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000036000065"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFStringCharacteristic *)v11;
}

- (NSString)vehicleLayoutKey
{
  objc_super v2 = [(CAFVent *)self vehicleLayoutKeyCharacteristic];
  char v3 = [v2 stringValue];

  return (NSString *)v3;
}

+ (id)serviceIdentifier
{
  return @"0x0000000011000006";
}

+ (id)observerProtocol
{
  return &unk_26FDB3D18;
}

+ (id)indexBy
{
  return @"0x0000000036000065";
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 characteristicType];
  if ([v7 isEqual:@"0x0000000031000025"])
  {
    uint64_t v8 = [v6 uniqueIdentifier];
    uint64_t v9 = [(CAFVent *)self combinationsCharacteristic];
    id v10 = [v9 uniqueIdentifier];
    int v11 = [v8 isEqual:v10];

    if (v11)
    {
      uint64_t v12 = [(CAFService *)self observers];
      uint64_t v13 = [(CAFVent *)self combinations];
      [v12 ventService:self didUpdateCombinations:v13];
LABEL_20:

      goto LABEL_21;
    }
  }
  else
  {
  }
  uint64_t v14 = [v6 characteristicType];
  if ([v14 isEqual:@"0x0000000030000038"])
  {
    uint64_t v15 = [v6 uniqueIdentifier];
    v16 = [(CAFVent *)self currentIndexCharacteristic];
    int64_t v17 = [v16 uniqueIdentifier];
    int v18 = [v15 isEqual:v17];

    if (v18)
    {
      uint64_t v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "ventService:didUpdateCurrentIndex:", self, -[CAFVent currentIndex](self, "currentIndex"));
LABEL_21:

      goto LABEL_22;
    }
  }
  else
  {
  }
  long long v19 = [v6 characteristicType];
  if ([v19 isEqual:@"0x000000003000005F"])
  {
    long long v20 = [v6 uniqueIdentifier];
    long long v21 = [(CAFVent *)self autoModeCharacteristic];
    long long v22 = [v21 uniqueIdentifier];
    int v23 = [v20 isEqual:v22];

    if (v23)
    {
      uint64_t v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "ventService:didUpdateAutoMode:", self, -[CAFVent autoMode](self, "autoMode"));
      goto LABEL_21;
    }
  }
  else
  {
  }
  long long v24 = [v6 characteristicType];
  if ([v24 isEqual:@"0x0000000030000002"])
  {
    long long v25 = [v6 uniqueIdentifier];
    long long v26 = [(CAFVent *)self onCharacteristic];
    v27 = [v26 uniqueIdentifier];
    int v28 = [v25 isEqual:v27];

    if (v28)
    {
      uint64_t v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "ventService:didUpdateOn:", self, -[CAFVent on](self, "on"));
      goto LABEL_21;
    }
  }
  else
  {
  }
  uint64_t v12 = [v6 characteristicType];
  if (![v12 isEqual:@"0x0000000036000065"]) {
    goto LABEL_21;
  }
  uint64_t v29 = [v6 uniqueIdentifier];
  v30 = [(CAFVent *)self vehicleLayoutKeyCharacteristic];
  v31 = [v30 uniqueIdentifier];
  int v32 = [v29 isEqual:v31];

  if (v32)
  {
    v33 = [(CAFService *)self observers];
    v34 = [(CAFVent *)self vehicleLayoutKey];
    [v33 ventService:self didUpdateVehicleLayoutKey:v34];

    uint64_t v12 = [(CAFService *)self observers];
    uint64_t v13 = [(CAFVent *)self name];
    [v12 ventService:self didUpdateName:v13];
    goto LABEL_20;
  }
LABEL_22:
  v35.receiver = self;
  v35.super_class = (Class)CAFVent;
  [(CAFService *)&v35 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
}

- (BOOL)registeredForVentCombinations
{
  char v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  uint64_t v7 = [(CAFService *)self accessory];
  uint64_t v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000031000025"];

  return v10;
}

- (BOOL)registeredForCurrentIndex
{
  char v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  uint64_t v7 = [(CAFService *)self accessory];
  uint64_t v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000038"];

  return v10;
}

- (BOOL)registeredForAutoMode
{
  char v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  uint64_t v7 = [(CAFService *)self accessory];
  uint64_t v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x000000003000005F"];

  return v10;
}

- (BOOL)registeredForOn
{
  char v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  uint64_t v7 = [(CAFService *)self accessory];
  uint64_t v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000002"];

  return v10;
}

- (BOOL)registeredForVehicleLayoutKey
{
  char v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  uint64_t v7 = [(CAFService *)self accessory];
  uint64_t v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000036000065"];

  return v10;
}

@end