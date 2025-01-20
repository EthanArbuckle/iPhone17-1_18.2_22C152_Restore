@interface CAFUIState
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (void)load;
- (BOOL)hasUiSceneOptions;
- (BOOL)registeredForUISceneOptions;
- (BOOL)registeredForUISceneState;
- (CAFArrayCharacteristic)uiSceneOptionsCharacteristic;
- (CAFUISceneStateCharacteristic)uiSceneStateCharacteristic;
- (NSArray)uiSceneOptions;
- (unsigned)uiSceneState;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFUIState

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFUIState;
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
  v6.super_class = (Class)CAFUIState;
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
  v6.super_class = (Class)CAFUIState;
  [(CAFService *)&v6 unregisterObserver:v5];
}

- (CAFUISceneStateCharacteristic)uiSceneStateCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000047000001"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000047000001"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFUISceneStateCharacteristic *)v11;
}

- (unsigned)uiSceneState
{
  objc_super v2 = [(CAFUIState *)self uiSceneStateCharacteristic];
  unsigned __int8 v3 = [v2 uiSceneStateValue];

  return v3;
}

- (CAFArrayCharacteristic)uiSceneOptionsCharacteristic
{
  unsigned __int8 v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000047000004"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000047000004"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFArrayCharacteristic *)v11;
}

- (NSArray)uiSceneOptions
{
  objc_super v2 = [(CAFUIState *)self uiSceneOptionsCharacteristic];
  unsigned __int8 v3 = [v2 arrayValue];

  return (NSArray *)v3;
}

- (BOOL)hasUiSceneOptions
{
  objc_super v2 = [(CAFUIState *)self uiSceneOptionsCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (id)serviceIdentifier
{
  return @"0x0000000011100001";
}

+ (id)observerProtocol
{
  return &unk_26FDB5108;
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 characteristicType];
  if ([v7 isEqual:@"0x0000000047000001"])
  {
    v8 = [v6 uniqueIdentifier];
    v9 = [(CAFUIState *)self uiSceneStateCharacteristic];
    id v10 = [v9 uniqueIdentifier];
    int v11 = [v8 isEqual:v10];

    if (v11)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "uiStateService:didUpdateUiSceneState:", self, -[CAFUIState uiSceneState](self, "uiSceneState"));
LABEL_8:

      goto LABEL_9;
    }
  }
  else
  {
  }
  v12 = [v6 characteristicType];
  if (![v12 isEqual:@"0x0000000047000004"]) {
    goto LABEL_8;
  }
  v13 = [v6 uniqueIdentifier];
  v14 = [(CAFUIState *)self uiSceneOptionsCharacteristic];
  v15 = [v14 uniqueIdentifier];
  int v16 = [v13 isEqual:v15];

  if (v16)
  {
    v12 = [(CAFService *)self observers];
    v17 = [(CAFUIState *)self uiSceneOptions];
    [v12 uiStateService:self didUpdateUiSceneOptions:v17];

    goto LABEL_8;
  }
LABEL_9:
  v18.receiver = self;
  v18.super_class = (Class)CAFUIState;
  [(CAFService *)&v18 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
}

- (BOOL)registeredForUISceneState
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000047000001"];

  return v10;
}

- (BOOL)registeredForUISceneOptions
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000047000004"];

  return v10;
}

@end