@interface CAFCriticalInputStream
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (void)load;
- (BOOL)on;
- (BOOL)registeredForInputStreamUID;
- (BOOL)registeredForOn;
- (CAFBoolCharacteristic)onCharacteristic;
- (CAFStringCharacteristic)inputStreamUIDCharacteristic;
- (NSString)inputStreamUID;
- (id)name;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFCriticalInputStream

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFCriticalInputStream;
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
  v6.super_class = (Class)CAFCriticalInputStream;
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
  v6.super_class = (Class)CAFCriticalInputStream;
  [(CAFService *)&v6 unregisterObserver:v5];
}

- (id)name
{
  v3 = [(CAFService *)self typeName];
  id v4 = [(CAFCriticalInputStream *)self inputStreamUIDCharacteristic];
  id v5 = [v4 formattedValue];

  if ([v5 length])
  {
    uint64_t v6 = [v3 stringByAppendingFormat:@"-%@", v5];

    v3 = (void *)v6;
  }

  return v3;
}

- (CAFStringCharacteristic)inputStreamUIDCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000044000000"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000044000000"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFStringCharacteristic *)v11;
}

- (NSString)inputStreamUID
{
  objc_super v2 = [(CAFCriticalInputStream *)self inputStreamUIDCharacteristic];
  v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (CAFBoolCharacteristic)onCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
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
  objc_super v2 = [(CAFCriticalInputStream *)self onCharacteristic];
  char v3 = [v2 BOOLValue];

  return v3;
}

+ (id)serviceIdentifier
{
  return @"0x000000001C000001";
}

+ (id)observerProtocol
{
  return &unk_26FDAF440;
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 characteristicType];
  if ([v7 isEqual:@"0x0000000044000000"])
  {
    v8 = [v6 uniqueIdentifier];
    v9 = [(CAFCriticalInputStream *)self inputStreamUIDCharacteristic];
    id v10 = [v9 uniqueIdentifier];
    int v11 = [v8 isEqual:v10];

    if (v11)
    {
      v12 = [(CAFService *)self observers];
      v13 = [(CAFCriticalInputStream *)self inputStreamUID];
      [v12 criticalInputStreamService:self didUpdateInputStreamUID:v13];

      v14 = [(CAFService *)self observers];
      v15 = [(CAFCriticalInputStream *)self name];
      [v14 criticalInputStreamService:self didUpdateName:v15];

LABEL_8:
      goto LABEL_9;
    }
  }
  else
  {
  }
  v14 = [v6 characteristicType];
  if (![v14 isEqual:@"0x0000000030000002"]) {
    goto LABEL_8;
  }
  v16 = [v6 uniqueIdentifier];
  v17 = [(CAFCriticalInputStream *)self onCharacteristic];
  v18 = [v17 uniqueIdentifier];
  int v19 = [v16 isEqual:v18];

  if (v19)
  {
    v14 = [(CAFService *)self observers];
    objc_msgSend(v14, "criticalInputStreamService:didUpdateOn:", self, -[CAFCriticalInputStream on](self, "on"));
    goto LABEL_8;
  }
LABEL_9:
  v20.receiver = self;
  v20.super_class = (Class)CAFCriticalInputStream;
  [(CAFService *)&v20 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
}

- (BOOL)registeredForInputStreamUID
{
  char v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000044000000"];

  return v10;
}

- (BOOL)registeredForOn
{
  char v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000002"];

  return v10;
}

@end