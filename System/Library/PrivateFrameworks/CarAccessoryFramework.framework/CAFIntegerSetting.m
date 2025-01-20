@interface CAFIntegerSetting
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (void)load;
- (BOOL)hasMaximumSymbolName;
- (BOOL)hasMinimumSymbolName;
- (BOOL)hasStepperBarHidden;
- (BOOL)hasUserVisibleValue;
- (BOOL)registeredForInt32Value;
- (BOOL)registeredForMaximumSymbolName;
- (BOOL)registeredForMinimumSymbolName;
- (BOOL)registeredForStepperBarHidden;
- (BOOL)registeredForUserVisibleValue;
- (BOOL)stepperBarHidden;
- (CAFBoolCharacteristic)stepperBarHiddenCharacteristic;
- (CAFInt32Characteristic)valueCharacteristic;
- (CAFInt32Range)valueRange;
- (CAFStringCharacteristic)maximumSymbolNameCharacteristic;
- (CAFStringCharacteristic)minimumSymbolNameCharacteristic;
- (CAFStringCharacteristic)userVisibleValueCharacteristic;
- (NSString)maximumSymbolName;
- (NSString)minimumSymbolName;
- (NSString)userVisibleValue;
- (id)name;
- (int)value;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)setValue:(int)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFIntegerSetting

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFIntegerSetting;
  objc_msgSendSuper2(&v2, sel_load);
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_26FDA93F8]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  v6.receiver = self;
  v6.super_class = (Class)CAFIntegerSetting;
  [(CAFAutomakerSetting *)&v6 registerObserver:v5];
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_26FDA93F8]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  v6.receiver = self;
  v6.super_class = (Class)CAFIntegerSetting;
  [(CAFAutomakerSetting *)&v6 unregisterObserver:v5];
}

- (id)name
{
  v3 = [(CAFService *)self typeName];
  id v4 = [(CAFAutomakerSetting *)self categoryCharacteristic];
  id v5 = [v4 formattedValue];

  if ([v5 length])
  {
    uint64_t v6 = [v3 stringByAppendingFormat:@"-%@", v5];

    v3 = (void *)v6;
  }
  v7 = [(CAFAutomakerSetting *)self userVisibleLabelCharacteristic];
  v8 = [v7 formattedValue];

  if ([v8 length])
  {
    uint64_t v9 = [v3 stringByAppendingFormat:@"-%@", v8];

    v3 = (void *)v9;
  }

  return v3;
}

- (CAFInt32Characteristic)valueCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000030000010"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000030000010"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFInt32Characteristic *)v11;
}

- (int)value
{
  objc_super v2 = [(CAFIntegerSetting *)self valueCharacteristic];
  int v3 = [v2 int32Value];

  return v3;
}

- (void)setValue:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(CAFIntegerSetting *)self valueCharacteristic];
  [v4 setInt32Value:v3];
}

- (CAFInt32Range)valueRange
{
  objc_super v2 = [(CAFIntegerSetting *)self valueCharacteristic];
  uint64_t v3 = [v2 range];

  return (CAFInt32Range *)v3;
}

- (CAFStringCharacteristic)userVisibleValueCharacteristic
{
  uint64_t v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000030000017"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000030000017"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFStringCharacteristic *)v11;
}

- (NSString)userVisibleValue
{
  objc_super v2 = [(CAFIntegerSetting *)self userVisibleValueCharacteristic];
  uint64_t v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (BOOL)hasUserVisibleValue
{
  objc_super v2 = [(CAFIntegerSetting *)self userVisibleValueCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFStringCharacteristic)maximumSymbolNameCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000036000026"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000036000026"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFStringCharacteristic *)v11;
}

- (NSString)maximumSymbolName
{
  objc_super v2 = [(CAFIntegerSetting *)self maximumSymbolNameCharacteristic];
  BOOL v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (BOOL)hasMaximumSymbolName
{
  objc_super v2 = [(CAFIntegerSetting *)self maximumSymbolNameCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFStringCharacteristic)minimumSymbolNameCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000036000025"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000036000025"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFStringCharacteristic *)v11;
}

- (NSString)minimumSymbolName
{
  objc_super v2 = [(CAFIntegerSetting *)self minimumSymbolNameCharacteristic];
  BOOL v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (BOOL)hasMinimumSymbolName
{
  objc_super v2 = [(CAFIntegerSetting *)self minimumSymbolNameCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFBoolCharacteristic)stepperBarHiddenCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000036000027"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000036000027"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFBoolCharacteristic *)v11;
}

- (BOOL)stepperBarHidden
{
  objc_super v2 = [(CAFIntegerSetting *)self stepperBarHiddenCharacteristic];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)hasStepperBarHidden
{
  objc_super v2 = [(CAFIntegerSetting *)self stepperBarHiddenCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (id)serviceIdentifier
{
  return @"0x0000000016000007";
}

+ (id)observerProtocol
{
  return &unk_26FDB4A80;
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 characteristicType];
  if ([v7 isEqual:@"0x0000000030000010"])
  {
    v8 = [v6 uniqueIdentifier];
    uint64_t v9 = [(CAFIntegerSetting *)self valueCharacteristic];
    id v10 = [v9 uniqueIdentifier];
    int v11 = [v8 isEqual:v10];

    if (v11)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "integerSettingService:didUpdateValue:", self, -[CAFIntegerSetting value](self, "value"));
LABEL_21:

      goto LABEL_22;
    }
  }
  else
  {
  }
  v13 = [v6 characteristicType];
  if ([v13 isEqual:@"0x0000000030000017"])
  {
    v14 = [v6 uniqueIdentifier];
    v15 = [(CAFIntegerSetting *)self userVisibleValueCharacteristic];
    v16 = [v15 uniqueIdentifier];
    int v17 = [v14 isEqual:v16];

    if (v17)
    {
      v12 = [(CAFService *)self observers];
      v18 = [(CAFIntegerSetting *)self userVisibleValue];
      [v12 integerSettingService:self didUpdateUserVisibleValue:v18];
LABEL_16:

      goto LABEL_21;
    }
  }
  else
  {
  }
  v19 = [v6 characteristicType];
  if ([v19 isEqual:@"0x0000000036000026"])
  {
    v20 = [v6 uniqueIdentifier];
    v21 = [(CAFIntegerSetting *)self maximumSymbolNameCharacteristic];
    v22 = [v21 uniqueIdentifier];
    int v23 = [v20 isEqual:v22];

    if (v23)
    {
      v12 = [(CAFService *)self observers];
      v18 = [(CAFIntegerSetting *)self maximumSymbolName];
      [v12 integerSettingService:self didUpdateMaximumSymbolName:v18];
      goto LABEL_16;
    }
  }
  else
  {
  }
  v24 = [v6 characteristicType];
  if ([v24 isEqual:@"0x0000000036000025"])
  {
    v25 = [v6 uniqueIdentifier];
    v26 = [(CAFIntegerSetting *)self minimumSymbolNameCharacteristic];
    v27 = [v26 uniqueIdentifier];
    int v28 = [v25 isEqual:v27];

    if (v28)
    {
      v12 = [(CAFService *)self observers];
      v18 = [(CAFIntegerSetting *)self minimumSymbolName];
      [v12 integerSettingService:self didUpdateMinimumSymbolName:v18];
      goto LABEL_16;
    }
  }
  else
  {
  }
  v12 = [v6 characteristicType];
  if (![v12 isEqual:@"0x0000000036000027"]) {
    goto LABEL_21;
  }
  v29 = [v6 uniqueIdentifier];
  v30 = [(CAFIntegerSetting *)self stepperBarHiddenCharacteristic];
  v31 = [v30 uniqueIdentifier];
  int v32 = [v29 isEqual:v31];

  if (v32)
  {
    v12 = [(CAFService *)self observers];
    objc_msgSend(v12, "integerSettingService:didUpdateStepperBarHidden:", self, -[CAFIntegerSetting stepperBarHidden](self, "stepperBarHidden"));
    goto LABEL_21;
  }
LABEL_22:
  v33.receiver = self;
  v33.super_class = (Class)CAFIntegerSetting;
  [(CAFAutomakerSetting *)&v33 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
}

- (BOOL)registeredForInt32Value
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000010"];

  return v10;
}

- (BOOL)registeredForUserVisibleValue
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000017"];

  return v10;
}

- (BOOL)registeredForMaximumSymbolName
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000036000026"];

  return v10;
}

- (BOOL)registeredForMinimumSymbolName
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000036000025"];

  return v10;
}

- (BOOL)registeredForStepperBarHidden
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000036000027"];

  return v10;
}

@end