@interface AMSBTLEAdvertisementManager
- (AMSBTLEAdvertisementManager)init;
- (BOOL)isAdvertising;
- (BOOL)isLECapableHardware;
- (void)advertiseMIDIService;
- (void)dealloc;
- (void)peripheralManager:(id)a3 didReceiveReadRequest:(id)a4;
- (void)peripheralManagerDidStartAdvertising:(id)a3 error:(id)a4;
- (void)stopAdvertisingMIDIService;
@end

@implementation AMSBTLEAdvertisementManager

- (AMSBTLEAdvertisementManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)AMSBTLEAdvertisementManager;
  v2 = [(AMSBTLEAdvertisementManager *)&v4 init];
  if (v2) {
    v2->peripheralManager = (CBPeripheralManager *)[objc_alloc(MEMORY[0x263EFEF60]) initWithDelegate:v2 queue:0];
  }
  return v2;
}

- (void)dealloc
{
  peripheralManager = self->peripheralManager;
  if (peripheralManager)
  {

    self->peripheralManager = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)AMSBTLEAdvertisementManager;
  [(AMSBTLEAdvertisementManager *)&v4 dealloc];
}

- (void)peripheralManagerDidStartAdvertising:(id)a3 error:(id)a4
{
  if (a4)
  {
    NSLog(&stru_26CF7B4A0.isa, a2, a3, a4);
  }
  else
  {
    objc_super v4 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", a3);
    [v4 postNotificationName:kAdvertisementNotification object:0 userInfo:&unk_26CF84D90];
    NSLog(&cfstr_AdvertisingSta.isa, v5);
  }
}

- (void)peripheralManager:(id)a3 didReceiveReadRequest:(id)a4
{
}

- (BOOL)isAdvertising
{
  return [(CBPeripheralManager *)self->peripheralManager isAdvertising];
}

- (BOOL)isLECapableHardware
{
  uint64_t v2 = [(CBPeripheralManager *)self->peripheralManager state];
  BOOL v3 = 1;
  objc_super v4 = @"Bluetooth is powered on and LE capable.";
  uint64_t v5 = @"The platform/hardware doesn't support Bluetooth Low Energy.";
  switch(v2)
  {
    case 2:
      goto LABEL_5;
    case 3:
      uint64_t v5 = @"The app is not authorized to use Bluetooth Low Energy.";
      goto LABEL_5;
    case 4:
      uint64_t v5 = @"Bluetooth is currently powered off.";
LABEL_5:
      BOOL v3 = 0;
      objc_super v4 = v5;
      goto LABEL_6;
    case 5:
LABEL_6:
      NSLog(&cfstr_PeripheralMana.isa, v4);
      break;
    default:
      BOOL v3 = 0;
      break;
  }
  return v3;
}

- (void)advertiseMIDIService
{
  v9[1] = *MEMORY[0x263EF8340];
  if ([(CBPeripheralManager *)self->peripheralManager isAdvertising])
  {
    NSLog(&cfstr_AlreadyAdverti.isa);
  }
  else if ([(AMSBTLEAdvertisementManager *)self isLECapableHardware])
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    MIDIObjectRef v4 = [MEMORY[0x263F00B68] nullDevice];
    CFStringRef str = 0;
    if (v4)
    {
      if (MIDIObjectGetStringProperty(v4, @"Bluetooth Advertising Name", &str))
      {
        uint64_t v5 = *MEMORY[0x263EFECB0];
        CFStringRef v6 = @"Bluetooth MIDI Device";
      }
      else
      {
        CFStringRef v6 = str;
        uint64_t v5 = *MEMORY[0x263EFECB0];
      }
      [v3 setValue:v6 forKey:v5];
      v9[0] = [MEMORY[0x263EFEF88] UUIDWithString:@"03B80E5A-EDE8-4B33-A751-6CE34EC4C700"];
      uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
      [v3 setValue:v7 forKey:*MEMORY[0x263EFECD8]];
      NSLog(&cfstr_StartingAdvert.isa);
      [(CBPeripheralManager *)self->peripheralManager startAdvertising:v3];
      if (str) {
        CFRelease(str);
      }
    }
    else
    {
      NSLog(&cfstr_CanTCommunicat.isa);
    }
  }
  else
  {
    NSLog(&cfstr_NotInABluetoot.isa);
  }
}

- (void)stopAdvertisingMIDIService
{
  NSLog(&cfstr_StoppedAdverti.isa, a2);
  [(CBPeripheralManager *)self->peripheralManager stopAdvertising];
  id v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  MIDIObjectRef v4 = kAdvertisementNotification;

  [v3 postNotificationName:v4 object:0 userInfo:&unk_26CF84DB8];
}

@end