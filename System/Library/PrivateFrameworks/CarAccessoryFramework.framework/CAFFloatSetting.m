@interface CAFFloatSetting
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (void)load;
- (BOOL)hasMaximumSymbolName;
- (BOOL)hasMinimumSymbolName;
- (BOOL)registeredForFloatValue;
- (BOOL)registeredForMaximumSymbolName;
- (BOOL)registeredForMinimumSymbolName;
- (CAFFloatCharacteristic)valueCharacteristic;
- (CAFFloatRange)valueRange;
- (CAFStringCharacteristic)maximumSymbolNameCharacteristic;
- (CAFStringCharacteristic)minimumSymbolNameCharacteristic;
- (NSString)maximumSymbolName;
- (NSString)minimumSymbolName;
- (float)value;
- (id)name;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)setValue:(float)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFFloatSetting

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFFloatSetting;
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
  v6.super_class = (Class)CAFFloatSetting;
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
  v6.super_class = (Class)CAFFloatSetting;
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

- (CAFFloatCharacteristic)valueCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000030000006"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000030000006"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFFloatCharacteristic *)v11;
}

- (float)value
{
  objc_super v2 = [(CAFFloatSetting *)self valueCharacteristic];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (void)setValue:(float)a3
{
  id v5 = [(CAFFloatSetting *)self valueCharacteristic];
  *(float *)&double v4 = a3;
  [v5 setFloatValue:v4];
}

- (CAFFloatRange)valueRange
{
  objc_super v2 = [(CAFFloatSetting *)self valueCharacteristic];
  float v3 = [v2 range];

  return (CAFFloatRange *)v3;
}

- (CAFStringCharacteristic)maximumSymbolNameCharacteristic
{
  float v3 = [(CAFService *)self car];
  double v4 = [v3 carManager];
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
  objc_super v2 = [(CAFFloatSetting *)self maximumSymbolNameCharacteristic];
  float v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (BOOL)hasMaximumSymbolName
{
  objc_super v2 = [(CAFFloatSetting *)self maximumSymbolNameCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFStringCharacteristic)minimumSymbolNameCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  double v4 = [v3 carManager];
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
  objc_super v2 = [(CAFFloatSetting *)self minimumSymbolNameCharacteristic];
  BOOL v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (BOOL)hasMinimumSymbolName
{
  objc_super v2 = [(CAFFloatSetting *)self minimumSymbolNameCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (id)serviceIdentifier
{
  return @"0x0000000016000003";
}

+ (id)observerProtocol
{
  return &unk_26FDB10E0;
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 characteristicType];
  if ([v7 isEqual:@"0x0000000030000006"])
  {
    v8 = [v6 uniqueIdentifier];
    uint64_t v9 = [(CAFFloatSetting *)self valueCharacteristic];
    id v10 = [v9 uniqueIdentifier];
    int v11 = [v8 isEqual:v10];

    if (v11)
    {
      v12 = [(CAFService *)self observers];
      [(CAFFloatSetting *)self value];
      objc_msgSend(v12, "floatSettingService:didUpdateValue:", self);
LABEL_13:

      goto LABEL_14;
    }
  }
  else
  {
  }
  v13 = [v6 characteristicType];
  if ([v13 isEqual:@"0x0000000036000026"])
  {
    v14 = [v6 uniqueIdentifier];
    v15 = [(CAFFloatSetting *)self maximumSymbolNameCharacteristic];
    v16 = [v15 uniqueIdentifier];
    int v17 = [v14 isEqual:v16];

    if (v17)
    {
      v12 = [(CAFService *)self observers];
      v18 = [(CAFFloatSetting *)self maximumSymbolName];
      [v12 floatSettingService:self didUpdateMaximumSymbolName:v18];
LABEL_12:

      goto LABEL_13;
    }
  }
  else
  {
  }
  v12 = [v6 characteristicType];
  if (![v12 isEqual:@"0x0000000036000025"]) {
    goto LABEL_13;
  }
  v19 = [v6 uniqueIdentifier];
  v20 = [(CAFFloatSetting *)self minimumSymbolNameCharacteristic];
  v21 = [v20 uniqueIdentifier];
  int v22 = [v19 isEqual:v21];

  if (v22)
  {
    v12 = [(CAFService *)self observers];
    v18 = [(CAFFloatSetting *)self minimumSymbolName];
    [v12 floatSettingService:self didUpdateMinimumSymbolName:v18];
    goto LABEL_12;
  }
LABEL_14:
  v23.receiver = self;
  v23.super_class = (Class)CAFFloatSetting;
  [(CAFAutomakerSetting *)&v23 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
}

- (BOOL)registeredForFloatValue
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000006"];

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

@end