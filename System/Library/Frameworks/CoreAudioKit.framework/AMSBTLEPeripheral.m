@interface AMSBTLEPeripheral
- (AMSBTLEPeripheral)initWithID:(id)a3 name:(id)a4 manager:(id)a5;
- (BOOL)canConnect;
- (BOOL)connect;
- (BOOL)disconnect;
- (BOOL)hidden;
- (BOOL)inputAvailable;
- (BOOL)isAvailable;
- (BOOL)isChangingState;
- (BOOL)isOnline;
- (BOOL)outputAvailable;
- (BOOL)updateAvailableStateChanged;
- (CBPeripheral)peripheral;
- (NSString)name;
- (NSString)uuid;
- (double)lastSeen;
- (void)dealloc;
- (void)setAvailable:(BOOL)a3;
- (void)setChangingState:(BOOL)a3;
- (void)setInputAvailable:(BOOL)a3;
- (void)setLastSeen:(double)a3;
- (void)setName:(id)a3;
- (void)setOnline:(BOOL)a3;
- (void)setOutputAvailable:(BOOL)a3;
@end

@implementation AMSBTLEPeripheral

- (AMSBTLEPeripheral)initWithID:(id)a3 name:(id)a4 manager:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)AMSBTLEPeripheral;
  v8 = [(AMSBTLEPeripheral *)&v10 init];
  if (v8)
  {
    v8->uuid = (NSString *)[[NSString alloc] initWithString:a3];
    v8->centralManager = (CBCentralManager *)a5;
    v8->name = (NSString *)a4;
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AMSBTLEPeripheral;
  [(AMSBTLEPeripheral *)&v3 dealloc];
}

- (NSString)uuid
{
  return self->uuid;
}

- (void)setName:(id)a3
{
  id v5 = a3;

  self->name = (NSString *)a3;
}

- (NSString)name
{
  if (self->name) {
    return self->name;
  }
  else {
    return (NSString *)[NSString stringWithFormat:@"%@", self->uuid];
  }
}

- (double)lastSeen
{
  return self->lastSeen;
}

- (void)setLastSeen:(double)a3
{
  self->lastSeen = a3;
}

- (BOOL)inputAvailable
{
  return self->inputAvailable;
}

- (void)setInputAvailable:(BOOL)a3
{
  self->inputAvailable = a3;
}

- (BOOL)outputAvailable
{
  return self->outputAvailable;
}

- (void)setOutputAvailable:(BOOL)a3
{
  self->outputAvailable = a3;
}

- (BOOL)isOnline
{
  return self->online;
}

- (void)setOnline:(BOOL)a3
{
  self->online = a3;
}

- (BOOL)isAvailable
{
  return self->available;
}

- (void)setAvailable:(BOOL)a3
{
  self->available = a3;
}

- (CBPeripheral)peripheral
{
  v7[1] = *MEMORY[0x263EF8340];
  id v3 = (id)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:self->uuid];
  centralManager = self->centralManager;
  v7[0] = v3;
  id v5 = -[CBCentralManager retrievePeripheralsWithIdentifiers:](centralManager, "retrievePeripheralsWithIdentifiers:", [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1]);
  result = [(NSArray *)v5 count];
  if (result)
  {

    result = (CBPeripheral *)[(NSArray *)v5 objectAtIndexedSubscript:0];
  }
  self->peripheral = result;
  return result;
}

- (BOOL)connect
{
  if (self->online) {
    return 1;
  }
  id v3 = [(AMSBTLEPeripheral *)self peripheral];
  if (v3)
  {
    v4 = v3;
    NSLog(&cfstr_ConnectingToPe.isa, self->uuid);
    [(CBCentralManager *)self->centralManager connectPeripheral:v4 options:0];
    return 1;
  }
  NSLog(&cfstr_ErrorNoBluetoo.isa, self->uuid);
  return 0;
}

- (BOOL)disconnect
{
  if (!self->online) {
    return 1;
  }
  MIDIObjectRef v3 = [MEMORY[0x263F00B68] nullDevice];
  if (v3)
  {
    MIDIObjectRef v4 = v3;
    NSLog(&cfstr_InstructingThe_0.isa, self->uuid);
    return MIDIObjectSetStringProperty(v4, @"disconnect device", (CFStringRef)[(AMSBTLEPeripheral *)self uuid]) == 0;
  }
  else
  {
    NSLog(&cfstr_CouldNotCommun_0.isa);
    return 0;
  }
}

- (BOOL)hidden
{
  return !self->inputAvailable && !self->outputAvailable;
}

- (BOOL)updateAvailableStateChanged
{
  int available = self->available;
  objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF910], "date"), "timeIntervalSince1970");
  if (v4 - self->lastSeen <= 7.0 || (int online = self->online) != 0) {
    int online = 1;
  }
  self->int available = online;
  return online != available;
}

- (BOOL)canConnect
{
  return self->available || self->online;
}

- (BOOL)isChangingState
{
  return self->changingState;
}

- (void)setChangingState:(BOOL)a3
{
  self->changingState = a3;
}

@end