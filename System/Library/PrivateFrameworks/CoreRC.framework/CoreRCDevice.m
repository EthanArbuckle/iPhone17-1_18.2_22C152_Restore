@interface CoreRCDevice
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocalDevice;
- (BOOL)sendCommand:(unint64_t)a3 target:(id)a4 withDuration:(unint64_t)a5 error:(id *)a6;
- (BOOL)sendHIDEvent:(id)a3 error:(id *)a4;
- (BOOL)sendHIDEvent:(id)a3 target:(id)a4 error:(id *)a5;
- (BOOL)setExtendedProperty:(id)a3 forKey:(id)a4 error:(id *)a5;
- (CoreRCDevice)init;
- (CoreRCDevice)initWithBus:(id)a3 local:(BOOL)a4;
- (CoreRCDevice)initWithCoder:(id)a3;
- (CoreRCDevice)initWithDevice:(id)a3;
- (NSUUID)busUniqueID;
- (NSUUID)uniqueID;
- (id)bus;
- (id)copyWithZone:(_NSZone *)a3;
- (id)delegate;
- (id)description;
- (id)extendedPropertyForKey:(id)a3 error:(id *)a4;
- (id)manager;
- (id)mergeProperties;
- (unint64_t)addOwningClient:(id)a3;
- (unint64_t)hash;
- (unint64_t)removeAllOwningClients;
- (unint64_t)removeOwningClient:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)mergePropertiesFromDevice:(id)a3;
- (void)receivedHIDEvent:(id)a3 fromDevice:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setManager:(id)a3;
- (void)setUniqueID:(id)a3;
@end

@implementation CoreRCDevice

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CoreRCDevice)init
{
  [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"use -initWithBus:"];
  return 0;
}

- (CoreRCDevice)initWithDevice:(id)a3
{
  if (a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)CoreRCDevice;
    v4 = [(CoreRCDevice *)&v8 init];
    v5 = v4;
    if (v4)
    {
      uint64_t v6 = [(CoreRCDevice *)v4 zone];
      v5->_busUniqueID = (NSUUID *)objc_msgSend((id)objc_msgSend(a3, "busUniqueID"), "copyWithZone:", v6);
      v5->_uniqueID = (NSUUID *)objc_msgSend((id)objc_msgSend(a3, "uniqueID"), "copyWithZone:", v6);
      v5->_isLocalDevice = [a3 isLocalDevice];
      v5->_owningClients = 0;
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (CoreRCDevice)initWithBus:(id)a3 local:(BOOL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CoreRCDevice;
  uint64_t v6 = [(CoreRCDevice *)&v8 init];
  if (v6)
  {
    v6->_busUniqueID = (NSUUID *)objc_msgSend((id)objc_msgSend(a3, "uniqueID"), "copy");
    v6->_uniqueID = (NSUUID *)objc_opt_new();
    v6->_isLocalDevice = a4;
    v6->_owningClients = (NSMutableSet *)objc_opt_new();
  }
  return v6;
}

- (CoreRCDevice)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CoreRCDevice;
  v4 = [(CoreRCDevice *)&v6 init];
  if (v4)
  {
    v4->_uniqueID = (NSUUID *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueID"];
    v4->_busUniqueID = (NSUUID *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"busUniqueID"];
    v4->_isLocalDevice = [a3 decodeBoolForKey:@"isLocalDevice"];
    v4->_owningClients = 0;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_uniqueID forKey:@"uniqueID"];
  [a3 encodeObject:self->_busUniqueID forKey:@"busUniqueID"];
  BOOL isLocalDevice = self->_isLocalDevice;
  [a3 encodeBool:isLocalDevice forKey:@"isLocalDevice"];
}

- (void)dealloc
{
  owningClients = self->_owningClients;
  if (owningClients) {

  }
  v4.receiver = self;
  v4.super_class = (Class)CoreRCDevice;
  [(CoreRCDevice *)&v4 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v4 initWithDevice:self];
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)CoreRCDevice;
  v3 = objc_msgSend(objc_alloc(MEMORY[0x263F089D8]), "initWithString:", -[CoreRCDevice description](&v8, sel_description));
  objc_msgSend(v3, "appendFormat:", @" ID: %@;",
    [(NSUUID *)[(CoreRCDevice *)self uniqueID] UUIDString]);
  objc_msgSend(v3, "appendFormat:", @" Bus: %@;",
    [(NSUUID *)[(CoreRCDevice *)self busUniqueID] UUIDString]);
  BOOL v4 = [(CoreRCDevice *)self isLocalDevice];
  v5 = "N";
  if (v4) {
    v5 = "Y";
  }
  objc_msgSend(v3, "appendFormat:", @" Local: %s;", v5);
  owningClients = self->_owningClients;
  if (owningClients) {
    owningClients = (NSMutableSet *)[(NSMutableSet *)owningClients count];
  }
  objc_msgSend(v3, "appendFormat:", @" Owners: %lu;", owningClients);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uniqueID = self->_uniqueID;
  uint64_t v6 = [a3 uniqueID];
  return [(NSUUID *)uniqueID isEqual:v6];
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_uniqueID hash];
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CoreRCDeviceDelegate *)a3;
}

- (id)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
  self->_manager = (CoreRCManager *)a3;
}

- (id)bus
{
  id v3 = [(CoreRCDevice *)self manager];
  return (id)[v3 managedBusForDevice:self];
}

- (id)mergeProperties
{
  return (id)MEMORY[0x263EFFA68];
}

- (void)mergePropertiesFromDevice:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (-[CoreRCDevice isEqual:](self, "isEqual:"))
  {
    if (-[NSUUID isEqual:](-[CoreRCDevice busUniqueID](self, "busUniqueID"), "isEqual:", [a3 busUniqueID]))
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v5 = [(CoreRCDevice *)self mergeProperties];
      uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        char v8 = 0;
        uint64_t v9 = *(void *)v16;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v16 != v9) {
              objc_enumerationMutation(v5);
            }
            uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
            uint64_t v12 = objc_msgSend(a3, "valueForKey:", v11, v13, v14);
            if ((objc_msgSend((id)-[CoreRCDevice valueForKey:](self, "valueForKey:", v11), "isEqual:", v12) & 1) == 0)
            {
              [(CoreRCDevice *)self setValue:v12 forKey:v11];
              if (gLogCategory_CoreRCDevice <= 10
                && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
              {
                uint64_t v13 = v11;
                v14 = self;
                LogPrintF();
              }
              char v8 = 1;
            }
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v7);
        if (v8) {
          objc_msgSend(-[CoreRCDevice bus](self, "bus"), "notifyDelegateDeviceUpdated:", self);
        }
      }
    }
  }
}

- (BOOL)sendHIDEvent:(id)a3 error:(id *)a4
{
  return [(CoreRCDevice *)self sendHIDEvent:a3 target:0 error:a4];
}

- (BOOL)sendHIDEvent:(id)a3 target:(id)a4 error:(id *)a5
{
  id v9 = [(CoreRCDevice *)self manager];
  return [v9 sendHIDEvent:a3 fromDevice:self toDevice:a4 error:a5];
}

- (BOOL)sendCommand:(unint64_t)a3 target:(id)a4 withDuration:(unint64_t)a5 error:(id *)a6
{
  id v11 = [(CoreRCDevice *)self manager];
  return [v11 sendCommand:a3 fromDevice:self toDevice:a4 withDuration:a5 error:a6];
}

- (void)receivedHIDEvent:(id)a3 fromDevice:(id)a4
{
  id v7 = [(CoreRCDevice *)self delegate];
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    uint64_t v8 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    id v13 = a4;
    v10 = self;
    id v11 = a3;
    uint64_t v9 = v8;
    LogPrintF();
  }
  if (objc_msgSend(a3, "isRepeat", v9, v10, v11, v12, v13)
    && gLogCategory_CoreRCDevice <= 60
    && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (objc_opt_respondsToSelector())
  {
    [v7 device:self receivedHIDEvent:a3 fromDevice:a4];
  }
}

- (BOOL)setExtendedProperty:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v9 = [(CoreRCDevice *)self manager];
  return [v9 setExtendedProperty:a3 forKey:a4 ofDevice:self error:a5];
}

- (id)extendedPropertyForKey:(id)a3 error:(id *)a4
{
  id v7 = [(CoreRCDevice *)self manager];
  return (id)[v7 extendedPropertyForKey:a3 ofDevice:self error:a4];
}

- (unint64_t)removeAllOwningClients
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  owningClients = self->_owningClients;
  uint64_t v4 = [(NSMutableSet *)owningClients countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(owningClients);
        }
        [(CoreRCDevice *)self removeOwningClient:*(void *)(*((void *)&v9 + 1) + 8 * i)];
      }
      uint64_t v5 = [(NSMutableSet *)owningClients countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
  return [(NSMutableSet *)self->_owningClients count];
}

- (unint64_t)removeOwningClient:(id)a3
{
  if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    uint64_t v8 = self;
    owningClients = self->_owningClients;
    id v7 = a3;
    LogPrintF();
  }
  -[NSMutableSet removeObject:](self->_owningClients, "removeObject:", a3, v7, v8, owningClients);
  objc_msgSend((id)objc_msgSend(a3, "userInfo"), "removeObject:", self);
  uint64_t v5 = self->_owningClients;
  return [(NSMutableSet *)v5 count];
}

- (unint64_t)addOwningClient:(id)a3
{
  if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    uint64_t v8 = self;
    owningClients = self->_owningClients;
    id v7 = a3;
    LogPrintF();
  }
  -[NSMutableSet addObject:](self->_owningClients, "addObject:", a3, v7, v8, owningClients);
  objc_msgSend((id)objc_msgSend(a3, "userInfo"), "addObject:", self);
  uint64_t v5 = self->_owningClients;
  return [(NSMutableSet *)v5 count];
}

- (BOOL)isLocalDevice
{
  return self->_isLocalDevice;
}

- (NSUUID)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
}

- (NSUUID)busUniqueID
{
  return self->_busUniqueID;
}

@end