@interface CAFGearRecommendation
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (void)load;
- (BOOL)registeredForGearShiftRecommendation;
- (CAFInt8Characteristic)gearShiftRecommendationCharacteristic;
- (CAFInt8Range)gearShiftRecommendationRange;
- (char)gearShiftRecommendation;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFGearRecommendation

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFGearRecommendation;
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
  v6.super_class = (Class)CAFGearRecommendation;
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
  v6.super_class = (Class)CAFGearRecommendation;
  [(CAFService *)&v6 unregisterObserver:v5];
}

- (CAFInt8Characteristic)gearShiftRecommendationCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000041000016"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000041000016"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFInt8Characteristic *)v11;
}

- (char)gearShiftRecommendation
{
  objc_super v2 = [(CAFGearRecommendation *)self gearShiftRecommendationCharacteristic];
  char v3 = [v2 int8Value];

  return v3;
}

- (CAFInt8Range)gearShiftRecommendationRange
{
  objc_super v2 = [(CAFGearRecommendation *)self gearShiftRecommendationCharacteristic];
  char v3 = [v2 range];

  return (CAFInt8Range *)v3;
}

+ (id)serviceIdentifier
{
  return @"0x000000001A000007";
}

+ (id)observerProtocol
{
  return &unk_26FDB0BB8;
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 characteristicType];
  if (![v7 isEqual:@"0x0000000041000016"]) {
    goto LABEL_4;
  }
  v8 = [v6 uniqueIdentifier];
  v9 = [(CAFGearRecommendation *)self gearShiftRecommendationCharacteristic];
  id v10 = [v9 uniqueIdentifier];
  int v11 = [v8 isEqual:v10];

  if (v11)
  {
    v7 = [(CAFService *)self observers];
    objc_msgSend(v7, "gearRecommendationService:didUpdateGearShiftRecommendation:", self, -[CAFGearRecommendation gearShiftRecommendation](self, "gearShiftRecommendation"));
LABEL_4:
  }
  v12.receiver = self;
  v12.super_class = (Class)CAFGearRecommendation;
  [(CAFService *)&v12 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
}

- (BOOL)registeredForGearShiftRecommendation
{
  char v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000041000016"];

  return v10;
}

@end