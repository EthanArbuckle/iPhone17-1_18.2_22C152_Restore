@interface CAFVehicleVariant
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (void)load;
- (BOOL)hasAudioLogo;
- (BOOL)hasVehicleLayout;
- (BOOL)hasVehicleLogo;
- (BOOL)registeredForAudioLogo;
- (BOOL)registeredForExteriorStyle;
- (BOOL)registeredForInteriorStyle;
- (BOOL)registeredForVehicleLayout;
- (BOOL)registeredForVehicleLogo;
- (CAFStringCharacteristic)audioLogoCharacteristic;
- (CAFStringCharacteristic)exteriorStyleCharacteristic;
- (CAFStringCharacteristic)interiorStyleCharacteristic;
- (CAFStringCharacteristic)vehicleLayoutCharacteristic;
- (CAFStringCharacteristic)vehicleLogoCharacteristic;
- (NSString)audioLogo;
- (NSString)exteriorStyle;
- (NSString)interiorStyle;
- (NSString)vehicleLayout;
- (NSString)vehicleLogo;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFVehicleVariant

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFVehicleVariant;
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
  v6.super_class = (Class)CAFVehicleVariant;
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
  v6.super_class = (Class)CAFVehicleVariant;
  [(CAFService *)&v6 unregisterObserver:v5];
}

- (CAFStringCharacteristic)exteriorStyleCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000048000003"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000048000003"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFStringCharacteristic *)v11;
}

- (NSString)exteriorStyle
{
  objc_super v2 = [(CAFVehicleVariant *)self exteriorStyleCharacteristic];
  v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (CAFStringCharacteristic)interiorStyleCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000048000004"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000048000004"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFStringCharacteristic *)v11;
}

- (NSString)interiorStyle
{
  objc_super v2 = [(CAFVehicleVariant *)self interiorStyleCharacteristic];
  v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (CAFStringCharacteristic)vehicleLayoutCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000048000005"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000048000005"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFStringCharacteristic *)v11;
}

- (NSString)vehicleLayout
{
  objc_super v2 = [(CAFVehicleVariant *)self vehicleLayoutCharacteristic];
  v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (BOOL)hasVehicleLayout
{
  objc_super v2 = [(CAFVehicleVariant *)self vehicleLayoutCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFStringCharacteristic)audioLogoCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000048000006"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000048000006"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFStringCharacteristic *)v11;
}

- (NSString)audioLogo
{
  objc_super v2 = [(CAFVehicleVariant *)self audioLogoCharacteristic];
  BOOL v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (BOOL)hasAudioLogo
{
  objc_super v2 = [(CAFVehicleVariant *)self audioLogoCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFStringCharacteristic)vehicleLogoCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000048000007"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000048000007"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFStringCharacteristic *)v11;
}

- (NSString)vehicleLogo
{
  objc_super v2 = [(CAFVehicleVariant *)self vehicleLogoCharacteristic];
  BOOL v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (BOOL)hasVehicleLogo
{
  objc_super v2 = [(CAFVehicleVariant *)self vehicleLogoCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (id)serviceIdentifier
{
  return @"0x0000000020000001";
}

+ (id)observerProtocol
{
  return &unk_26FDB1518;
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 characteristicType];
  if ([v7 isEqual:@"0x0000000048000003"])
  {
    v8 = [v6 uniqueIdentifier];
    v9 = [(CAFVehicleVariant *)self exteriorStyleCharacteristic];
    id v10 = [v9 uniqueIdentifier];
    int v11 = [v8 isEqual:v10];

    if (v11)
    {
      v12 = [(CAFService *)self observers];
      v13 = [(CAFVehicleVariant *)self exteriorStyle];
      [v12 vehicleVariantService:self didUpdateExteriorStyle:v13];
LABEL_20:

      goto LABEL_21;
    }
  }
  else
  {
  }
  v14 = [v6 characteristicType];
  if ([v14 isEqual:@"0x0000000048000004"])
  {
    v15 = [v6 uniqueIdentifier];
    v16 = [(CAFVehicleVariant *)self interiorStyleCharacteristic];
    v17 = [v16 uniqueIdentifier];
    int v18 = [v15 isEqual:v17];

    if (v18)
    {
      v12 = [(CAFService *)self observers];
      v13 = [(CAFVehicleVariant *)self interiorStyle];
      [v12 vehicleVariantService:self didUpdateInteriorStyle:v13];
      goto LABEL_20;
    }
  }
  else
  {
  }
  v19 = [v6 characteristicType];
  if ([v19 isEqual:@"0x0000000048000005"])
  {
    v20 = [v6 uniqueIdentifier];
    v21 = [(CAFVehicleVariant *)self vehicleLayoutCharacteristic];
    v22 = [v21 uniqueIdentifier];
    int v23 = [v20 isEqual:v22];

    if (v23)
    {
      v12 = [(CAFService *)self observers];
      v13 = [(CAFVehicleVariant *)self vehicleLayout];
      [v12 vehicleVariantService:self didUpdateVehicleLayout:v13];
      goto LABEL_20;
    }
  }
  else
  {
  }
  v24 = [v6 characteristicType];
  if ([v24 isEqual:@"0x0000000048000006"])
  {
    v25 = [v6 uniqueIdentifier];
    v26 = [(CAFVehicleVariant *)self audioLogoCharacteristic];
    v27 = [v26 uniqueIdentifier];
    int v28 = [v25 isEqual:v27];

    if (v28)
    {
      v12 = [(CAFService *)self observers];
      v13 = [(CAFVehicleVariant *)self audioLogo];
      [v12 vehicleVariantService:self didUpdateAudioLogo:v13];
      goto LABEL_20;
    }
  }
  else
  {
  }
  v12 = [v6 characteristicType];
  if (![v12 isEqual:@"0x0000000048000007"])
  {
LABEL_21:

    goto LABEL_22;
  }
  v29 = [v6 uniqueIdentifier];
  v30 = [(CAFVehicleVariant *)self vehicleLogoCharacteristic];
  v31 = [v30 uniqueIdentifier];
  int v32 = [v29 isEqual:v31];

  if (v32)
  {
    v12 = [(CAFService *)self observers];
    v13 = [(CAFVehicleVariant *)self vehicleLogo];
    [v12 vehicleVariantService:self didUpdateVehicleLogo:v13];
    goto LABEL_20;
  }
LABEL_22:
  v33.receiver = self;
  v33.super_class = (Class)CAFVehicleVariant;
  [(CAFService *)&v33 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
}

- (BOOL)registeredForExteriorStyle
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000048000003"];

  return v10;
}

- (BOOL)registeredForInteriorStyle
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000048000004"];

  return v10;
}

- (BOOL)registeredForVehicleLayout
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000048000005"];

  return v10;
}

- (BOOL)registeredForAudioLogo
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000048000006"];

  return v10;
}

- (BOOL)registeredForVehicleLogo
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000048000007"];

  return v10;
}

@end