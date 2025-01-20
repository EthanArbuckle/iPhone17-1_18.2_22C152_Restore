@interface CAFTestControlEvent
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (void)load;
- (BOOL)hasTestAccEventNoParams;
- (BOOL)hasTestAccEventWithParams;
- (BOOL)hasTestDevEventNoParams;
- (BOOL)hasTestDevEventWithParams;
- (BOOL)registeredForTestAccEventNoParams;
- (BOOL)registeredForTestAccEventWithParams;
- (BOOL)registeredForTestDevEventNoParams;
- (BOOL)registeredForTestDevEventWithParams;
- (BOOL)testDevEventNoParamsDisabled;
- (BOOL)testDevEventNoParamsError;
- (BOOL)testDevEventWithParamsDisabled;
- (BOOL)testDevEventWithParamsError;
- (CAFTestAccEventNoParamsControl)testAccEventNoParamsControl;
- (CAFTestAccEventWithParamsControl)testAccEventWithParamsControl;
- (CAFTestDevEventNoParamsControl)testDevEventNoParamsControl;
- (CAFTestDevEventWithParamsControl)testDevEventWithParamsControl;
- (id)testAccEventNoParamsHandler;
- (id)testAccEventWithParamsHandler;
- (void)_controlDidUpdate:(id)a3;
- (void)registerObserver:(id)a3;
- (void)setTestAccEventNoParamsHandler:(id)a3;
- (void)setTestAccEventWithParamsHandler:(id)a3;
- (void)testDevEventNoParams;
- (void)testDevEventWithParamsWithTestInput9:(unsigned __int8)a3 testInput10:(id)a4;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFTestControlEvent

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFTestControlEvent;
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
  v6.super_class = (Class)CAFTestControlEvent;
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
  v6.super_class = (Class)CAFTestControlEvent;
  [(CAFService *)&v6 unregisterObserver:v5];
}

- (CAFTestDevEventNoParamsControl)testDevEventNoParamsControl
{
  objc_opt_class();
  id v3 = [(CAFService *)self controlForType:@"0x00000000FF00002C"];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (CAFTestDevEventNoParamsControl *)v4;
}

- (void)testDevEventNoParams
{
  objc_super v2 = [(CAFTestControlEvent *)self testDevEventNoParamsControl];
  if (v2)
  {
    id v3 = v2;
    [v2 testDevEventNoParams];
    objc_super v2 = v3;
  }
}

- (BOOL)hasTestDevEventNoParams
{
  objc_super v2 = [(CAFTestControlEvent *)self testDevEventNoParamsControl];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)testDevEventNoParamsError
{
  objc_super v2 = [(CAFTestControlEvent *)self testDevEventNoParamsControl];
  char v3 = [v2 hasErrorState];

  return v3;
}

- (BOOL)testDevEventNoParamsDisabled
{
  objc_super v2 = [(CAFTestControlEvent *)self testDevEventNoParamsControl];
  char v3 = [v2 isDisabled];

  return v3;
}

- (CAFTestDevEventWithParamsControl)testDevEventWithParamsControl
{
  objc_opt_class();
  id v3 = [(CAFService *)self controlForType:@"0x00000000FF00002D"];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (CAFTestDevEventWithParamsControl *)v4;
}

- (void)testDevEventWithParamsWithTestInput9:(unsigned __int8)a3 testInput10:(id)a4
{
  uint64_t v4 = a3;
  id v8 = a4;
  objc_super v6 = [(CAFTestControlEvent *)self testDevEventWithParamsControl];
  v7 = v6;
  if (v6) {
    [v6 testDevEventWithParamsWithTestInput9:v4 testInput10:v8];
  }
}

- (BOOL)hasTestDevEventWithParams
{
  objc_super v2 = [(CAFTestControlEvent *)self testDevEventWithParamsControl];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)testDevEventWithParamsError
{
  objc_super v2 = [(CAFTestControlEvent *)self testDevEventWithParamsControl];
  char v3 = [v2 hasErrorState];

  return v3;
}

- (BOOL)testDevEventWithParamsDisabled
{
  objc_super v2 = [(CAFTestControlEvent *)self testDevEventWithParamsControl];
  char v3 = [v2 isDisabled];

  return v3;
}

- (CAFTestAccEventNoParamsControl)testAccEventNoParamsControl
{
  objc_opt_class();
  id v3 = [(CAFService *)self controlForType:@"0x00000000FF000032"];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (CAFTestAccEventNoParamsControl *)v4;
}

- (id)testAccEventNoParamsHandler
{
  objc_super v2 = [(CAFTestControlEvent *)self testAccEventNoParamsControl];
  id v3 = [v2 handler];

  return v3;
}

- (void)setTestAccEventNoParamsHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFTestControlEvent *)self testAccEventNoParamsControl];
  [v5 setHandler:v4];
}

- (BOOL)hasTestAccEventNoParams
{
  objc_super v2 = [(CAFTestControlEvent *)self testAccEventNoParamsControl];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFTestAccEventWithParamsControl)testAccEventWithParamsControl
{
  objc_opt_class();
  id v3 = [(CAFService *)self controlForType:@"0x00000000FF000033"];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (CAFTestAccEventWithParamsControl *)v4;
}

- (id)testAccEventWithParamsHandler
{
  objc_super v2 = [(CAFTestControlEvent *)self testAccEventWithParamsControl];
  id v3 = [v2 handler];

  return v3;
}

- (void)setTestAccEventWithParamsHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFTestControlEvent *)self testAccEventWithParamsControl];
  [v5 setHandler:v4];
}

- (BOOL)hasTestAccEventWithParams
{
  objc_super v2 = [(CAFTestControlEvent *)self testAccEventWithParamsControl];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (id)serviceIdentifier
{
  return @"0x00000000FE00000A";
}

+ (id)observerProtocol
{
  return &unk_26FDB2090;
}

- (void)_controlDidUpdate:(id)a3
{
  id v4 = a3;
  id v5 = [v4 controlType];
  if ([v5 isEqual:@"0x00000000FF00002C"])
  {
    objc_super v6 = [v4 uniqueIdentifier];
    v7 = [(CAFTestControlEvent *)self testDevEventNoParamsControl];
    id v8 = [v7 uniqueIdentifier];
    int v9 = [v6 isEqual:v8];

    if (v9)
    {
      v10 = [(CAFService *)self observers];
      [v10 testControlEventServiceDidUpdateTestDevEventNoParams:self];
LABEL_8:

      goto LABEL_9;
    }
  }
  else
  {
  }
  v10 = [v4 controlType];
  if (![v10 isEqual:@"0x00000000FF00002D"]) {
    goto LABEL_8;
  }
  v11 = [v4 uniqueIdentifier];
  v12 = [(CAFTestControlEvent *)self testDevEventWithParamsControl];
  v13 = [v12 uniqueIdentifier];
  int v14 = [v11 isEqual:v13];

  if (v14)
  {
    v10 = [(CAFService *)self observers];
    [v10 testControlEventServiceDidUpdateTestDevEventWithParams:self];
    goto LABEL_8;
  }
LABEL_9:
  v15.receiver = self;
  v15.super_class = (Class)CAFTestControlEvent;
  [(CAFService *)&v15 _controlDidUpdate:v4];
}

- (BOOL)registeredForTestDevEventNoParams
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  id v8 = [(id)objc_opt_class() accessoryIdentifier];
  int v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 control:@"0x00000000FF00002C"];

  return v10;
}

- (BOOL)registeredForTestDevEventWithParams
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  id v8 = [(id)objc_opt_class() accessoryIdentifier];
  int v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 control:@"0x00000000FF00002D"];

  return v10;
}

- (BOOL)registeredForTestAccEventNoParams
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  id v8 = [(id)objc_opt_class() accessoryIdentifier];
  int v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 control:@"0x00000000FF000032"];

  return v10;
}

- (BOOL)registeredForTestAccEventWithParams
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  id v8 = [(id)objc_opt_class() accessoryIdentifier];
  int v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 control:@"0x00000000FF000033"];

  return v10;
}

@end