@interface UARPAccessoryHardwareHID
- (BOOL)isEqual:(id)a3;
- (UARPAccessoryHardwareHID)init;
- (UARPAccessoryHardwareHID)initWithVendorID:(unsigned __int16)a3 productID:(unsigned __int16)a4;
- (id)description;
- (id)personalities;
- (unsigned)productID;
- (unsigned)vendorID;
- (void)addPersonality:(id)a3;
@end

@implementation UARPAccessoryHardwareHID

- (UARPAccessoryHardwareHID)init
{
  return 0;
}

- (UARPAccessoryHardwareHID)initWithVendorID:(unsigned __int16)a3 productID:(unsigned __int16)a4
{
  v12.receiver = self;
  v12.super_class = (Class)UARPAccessoryHardwareHID;
  v6 = [(UARPAccessoryHardwareID *)&v12 initWithTransport:1];
  v7 = v6;
  if (v6)
  {
    v6->_vendorID = a3;
    v6->_productID = a4;
    uint64_t v8 = objc_opt_new();
    personalities = v7->_personalities;
    v7->_personalities = (NSMutableSet *)v8;

    v10 = [[UARPAccessoryHIDPersonality alloc] initWithVendorID:v7->_vendorID productID:v7->_productID];
    [(NSMutableSet *)v7->_personalities addObject:v10];
  }
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (UARPAccessoryHardwareHID *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (self == v4)
    {
      char v7 = 1;
    }
    else
    {
      personalities = self->_personalities;
      v6 = [(UARPAccessoryHardwareHID *)v4 personalities];
      char v7 = [(NSMutableSet *)personalities isEqualToSet:v6];
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)description
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  [v3 appendFormat:@"HID, "];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = self->_personalities;
  uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        unsigned int v10 = [v9 vendorID];
        unsigned int v11 = [v9 productID];
        objc_msgSend(v3, "appendFormat:", @"<VID/PID = 0x%04x/0x%04x> ", v10, v11, (void)v14);
      }
      uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  objc_super v12 = [NSString stringWithString:v3];

  return v12;
}

- (id)personalities
{
  return (id)[MEMORY[0x263EFFA08] setWithSet:self->_personalities];
}

- (void)addPersonality:(id)a3
{
}

- (unsigned)vendorID
{
  return self->_vendorID;
}

- (unsigned)productID
{
  return self->_productID;
}

- (void).cxx_destruct
{
}

@end