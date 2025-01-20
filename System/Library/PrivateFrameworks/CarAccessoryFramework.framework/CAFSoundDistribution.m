@interface CAFSoundDistribution
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (void)load;
- (BOOL)hasFade;
- (BOOL)registeredForBalance;
- (BOOL)registeredForFade;
- (CAFInt8Characteristic)balanceCharacteristic;
- (CAFInt8Characteristic)fadeCharacteristic;
- (CAFInt8Range)balanceRange;
- (CAFInt8Range)fadeRange;
- (char)balance;
- (char)fade;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)setBalance:(char)a3;
- (void)setFade:(char)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFSoundDistribution

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFSoundDistribution;
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
  v6.super_class = (Class)CAFSoundDistribution;
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
  v6.super_class = (Class)CAFSoundDistribution;
  [(CAFService *)&v6 unregisterObserver:v5];
}

- (CAFInt8Characteristic)balanceCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000033000002"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000033000002"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFInt8Characteristic *)v11;
}

- (char)balance
{
  objc_super v2 = [(CAFSoundDistribution *)self balanceCharacteristic];
  char v3 = [v2 int8Value];

  return v3;
}

- (void)setBalance:(char)a3
{
  uint64_t v3 = a3;
  id v4 = [(CAFSoundDistribution *)self balanceCharacteristic];
  [v4 setInt8Value:v3];
}

- (CAFInt8Range)balanceRange
{
  objc_super v2 = [(CAFSoundDistribution *)self balanceCharacteristic];
  uint64_t v3 = [v2 range];

  return (CAFInt8Range *)v3;
}

- (CAFInt8Characteristic)fadeCharacteristic
{
  uint64_t v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000033000003"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000033000003"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFInt8Characteristic *)v11;
}

- (char)fade
{
  objc_super v2 = [(CAFSoundDistribution *)self fadeCharacteristic];
  char v3 = [v2 int8Value];

  return v3;
}

- (void)setFade:(char)a3
{
  uint64_t v3 = a3;
  id v4 = [(CAFSoundDistribution *)self fadeCharacteristic];
  [v4 setInt8Value:v3];
}

- (CAFInt8Range)fadeRange
{
  objc_super v2 = [(CAFSoundDistribution *)self fadeCharacteristic];
  uint64_t v3 = [v2 range];

  return (CAFInt8Range *)v3;
}

- (BOOL)hasFade
{
  objc_super v2 = [(CAFSoundDistribution *)self fadeCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (id)serviceIdentifier
{
  return @"0x0000000013000005";
}

+ (id)observerProtocol
{
  return &unk_26FDB2C18;
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 characteristicType];
  if ([v7 isEqual:@"0x0000000033000002"])
  {
    v8 = [v6 uniqueIdentifier];
    v9 = [(CAFSoundDistribution *)self balanceCharacteristic];
    id v10 = [v9 uniqueIdentifier];
    int v11 = [v8 isEqual:v10];

    if (v11)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "soundDistributionService:didUpdateBalance:", self, -[CAFSoundDistribution balance](self, "balance"));
LABEL_8:

      goto LABEL_9;
    }
  }
  else
  {
  }
  v12 = [v6 characteristicType];
  if (![v12 isEqual:@"0x0000000033000003"]) {
    goto LABEL_8;
  }
  v13 = [v6 uniqueIdentifier];
  v14 = [(CAFSoundDistribution *)self fadeCharacteristic];
  v15 = [v14 uniqueIdentifier];
  int v16 = [v13 isEqual:v15];

  if (v16)
  {
    v12 = [(CAFService *)self observers];
    objc_msgSend(v12, "soundDistributionService:didUpdateFade:", self, -[CAFSoundDistribution fade](self, "fade"));
    goto LABEL_8;
  }
LABEL_9:
  v17.receiver = self;
  v17.super_class = (Class)CAFSoundDistribution;
  [(CAFService *)&v17 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
}

- (BOOL)registeredForBalance
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000033000002"];

  return v10;
}

- (BOOL)registeredForFade
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000033000003"];

  return v10;
}

@end