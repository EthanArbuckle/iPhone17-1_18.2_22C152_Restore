@interface CAFVolume
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (id)typeComparator;
+ (void)load;
- (BOOL)hasUserVisibleLabel;
- (BOOL)registeredForUserVisibleLabel;
- (BOOL)registeredForVolume;
- (BOOL)registeredForVolumeType;
- (BOOL)volumeDisabled;
- (CAFStringCharacteristic)userVisibleLabelCharacteristic;
- (CAFUInt8Characteristic)volumeCharacteristic;
- (CAFUInt8Range)volumeRange;
- (CAFVolumeTypeCharacteristic)volumeTypeCharacteristic;
- (NSString)userVisibleLabel;
- (id)name;
- (int64_t)typeCompare:(id)a3;
- (unsigned)volume;
- (unsigned)volumeType;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)setVolume:(unsigned __int8)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFVolume

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFVolume;
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
  v6.super_class = (Class)CAFVolume;
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
  v6.super_class = (Class)CAFVolume;
  [(CAFService *)&v6 unregisterObserver:v5];
}

- (id)name
{
  v3 = [(CAFService *)self typeName];
  id v4 = [(CAFVolume *)self volumeTypeCharacteristic];
  id v5 = [v4 formattedValue];

  if ([v5 length])
  {
    uint64_t v6 = [v3 stringByAppendingFormat:@"-%@", v5];

    v3 = (void *)v6;
  }
  v7 = [(CAFVolume *)self userVisibleLabelCharacteristic];
  v8 = [v7 formattedValue];

  if ([v8 length])
  {
    uint64_t v9 = [v3 stringByAppendingFormat:@"-%@", v8];

    v3 = (void *)v9;
  }

  return v3;
}

- (CAFVolumeTypeCharacteristic)volumeTypeCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000033000005"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000033000005"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFVolumeTypeCharacteristic *)v11;
}

- (unsigned)volumeType
{
  objc_super v2 = [(CAFVolume *)self volumeTypeCharacteristic];
  unsigned __int8 v3 = [v2 volumeTypeValue];

  return v3;
}

- (CAFUInt8Characteristic)volumeCharacteristic
{
  unsigned __int8 v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000033000006"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000033000006"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFUInt8Characteristic *)v11;
}

- (unsigned)volume
{
  objc_super v2 = [(CAFVolume *)self volumeCharacteristic];
  unsigned __int8 v3 = [v2 uint8Value];

  return v3;
}

- (void)setVolume:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  id v4 = [(CAFVolume *)self volumeCharacteristic];
  [v4 setUint8Value:v3];
}

- (CAFUInt8Range)volumeRange
{
  objc_super v2 = [(CAFVolume *)self volumeCharacteristic];
  uint64_t v3 = [v2 range];

  return (CAFUInt8Range *)v3;
}

- (BOOL)volumeDisabled
{
  objc_super v2 = [(CAFVolume *)self volumeCharacteristic];
  char v3 = [v2 isDisabled];

  return v3;
}

- (CAFStringCharacteristic)userVisibleLabelCharacteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000030000001"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000030000001"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFStringCharacteristic *)v11;
}

- (NSString)userVisibleLabel
{
  objc_super v2 = [(CAFVolume *)self userVisibleLabelCharacteristic];
  char v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (BOOL)hasUserVisibleLabel
{
  objc_super v2 = [(CAFVolume *)self userVisibleLabelCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (id)serviceIdentifier
{
  return @"0x0000000013000002";
}

+ (id)observerProtocol
{
  return &unk_26FDB0068;
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 characteristicType];
  if ([v7 isEqual:@"0x0000000033000005"])
  {
    v8 = [v6 uniqueIdentifier];
    uint64_t v9 = [(CAFVolume *)self volumeTypeCharacteristic];
    id v10 = [v9 uniqueIdentifier];
    int v11 = [v8 isEqual:v10];

    if (v11)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "volumeService:didUpdateVolumeType:", self, -[CAFVolume volumeType](self, "volumeType"));
LABEL_12:

      v18 = [(CAFService *)self observers];
      v24 = [(CAFVolume *)self name];
      [v18 volumeService:self didUpdateName:v24];

      goto LABEL_13;
    }
  }
  else
  {
  }
  v13 = [v6 characteristicType];
  if ([v13 isEqual:@"0x0000000033000006"])
  {
    v14 = [v6 uniqueIdentifier];
    v15 = [(CAFVolume *)self volumeCharacteristic];
    v16 = [v15 uniqueIdentifier];
    int v17 = [v14 isEqual:v16];

    if (v17)
    {
      v18 = [(CAFService *)self observers];
      objc_msgSend(v18, "volumeService:didUpdateVolume:", self, -[CAFVolume volume](self, "volume"));
LABEL_13:

      goto LABEL_14;
    }
  }
  else
  {
  }
  v18 = [v6 characteristicType];
  if (![v18 isEqual:@"0x0000000030000001"]) {
    goto LABEL_13;
  }
  v19 = [v6 uniqueIdentifier];
  v20 = [(CAFVolume *)self userVisibleLabelCharacteristic];
  v21 = [v20 uniqueIdentifier];
  int v22 = [v19 isEqual:v21];

  if (v22)
  {
    v12 = [(CAFService *)self observers];
    v23 = [(CAFVolume *)self userVisibleLabel];
    [v12 volumeService:self didUpdateUserVisibleLabel:v23];

    goto LABEL_12;
  }
LABEL_14:
  v25.receiver = self;
  v25.super_class = (Class)CAFVolume;
  [(CAFService *)&v25 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
}

- (BOOL)registeredForVolumeType
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000033000005"];

  return v10;
}

- (BOOL)registeredForVolume
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000033000006"];

  return v10;
}

- (BOOL)registeredForUserVisibleLabel
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000001"];

  return v10;
}

- (int64_t)typeCompare:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(v4, "volumeType"));
  uint64_t v6 = [&unk_26FD90948 indexOfObject:v5];

  v7 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[CAFVolume volumeType](self, "volumeType"));
  uint64_t v8 = [&unk_26FD90948 indexOfObject:v7];

  if (v6 == v8)
  {
    if (v6 == 6)
    {
      uint64_t v9 = [v4 userVisibleLabel];
      char v10 = [(CAFVolume *)self userVisibleLabel];
      int64_t v11 = [v9 compare:v10 options:1];
    }
    else
    {
      int64_t v11 = 0;
    }
  }
  else if (v6 > v8)
  {
    int64_t v11 = -1;
  }
  else
  {
    int64_t v11 = 1;
  }

  return v11;
}

+ (id)typeComparator
{
  return &__block_literal_global_2;
}

uint64_t __36__CAFVolume_Compare__typeComparator__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "typeCompare:");
}

@end