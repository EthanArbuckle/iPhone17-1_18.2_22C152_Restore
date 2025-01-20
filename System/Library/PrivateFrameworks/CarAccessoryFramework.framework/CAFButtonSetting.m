@interface CAFButtonSetting
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (void)load;
- (BOOL)registeredForButtonAction;
- (CAFButtonActionCharacteristic)buttonActionCharacteristic;
- (id)name;
- (unsigned)buttonAction;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)setButtonAction:(unsigned __int8)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFButtonSetting

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFButtonSetting;
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
  v6.super_class = (Class)CAFButtonSetting;
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
  v6.super_class = (Class)CAFButtonSetting;
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

- (CAFButtonActionCharacteristic)buttonActionCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000036000010"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000036000010"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFButtonActionCharacteristic *)v11;
}

- (unsigned)buttonAction
{
  objc_super v2 = [(CAFButtonSetting *)self buttonActionCharacteristic];
  unsigned __int8 v3 = [v2 buttonActionValue];

  return v3;
}

- (void)setButtonAction:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  id v4 = [(CAFButtonSetting *)self buttonActionCharacteristic];
  [v4 setButtonActionValue:v3];
}

+ (id)serviceIdentifier
{
  return @"0x0000000016000002";
}

+ (id)observerProtocol
{
  return &unk_26FDB3918;
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 characteristicType];
  if (![v7 isEqual:@"0x0000000036000010"]) {
    goto LABEL_4;
  }
  v8 = [v6 uniqueIdentifier];
  uint64_t v9 = [(CAFButtonSetting *)self buttonActionCharacteristic];
  id v10 = [v9 uniqueIdentifier];
  int v11 = [v8 isEqual:v10];

  if (v11)
  {
    v7 = [(CAFService *)self observers];
    objc_msgSend(v7, "buttonSettingService:didUpdateButtonAction:", self, -[CAFButtonSetting buttonAction](self, "buttonAction"));
LABEL_4:
  }
  v12.receiver = self;
  v12.super_class = (Class)CAFButtonSetting;
  [(CAFAutomakerSetting *)&v12 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
}

- (BOOL)registeredForButtonAction
{
  uint64_t v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000036000010"];

  return v10;
}

@end