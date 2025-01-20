@interface CoreRCBus
+ (BOOL)supportsSecureCoding;
- (BOOL)allowHibernation;
- (BOOL)isEqual:(id)a3;
- (BOOL)setAllowHibernation:(BOOL)a3 error:(id *)a4;
- (BOOL)setProperty:(id)a3 forKey:(id)a4 error:(id *)a5;
- (CoreRCBus)init;
- (CoreRCBus)initWithBus:(id)a3;
- (CoreRCBus)initWithCoder:(id)a3;
- (NSMutableSet)devicesInternal;
- (NSSet)devices;
- (NSUUID)uniqueID;
- (OS_dispatch_queue)serialQueue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)delegate;
- (id)description;
- (id)deviceOnBusEquivalentTo:(id)a3;
- (id)manager;
- (id)mergeDevice:(id)a3;
- (id)mergeProperties;
- (id)propertyForKey:(id)a3 error:(id *)a4;
- (int)_allowSleep;
- (int)_preventSleep;
- (unint64_t)hash;
- (void)addDevice:(id)a3;
- (void)dealloc;
- (void)didRemoveFromManager:(id)a3;
- (void)didUpdateProperties:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)mergePropertiesFromBus:(id)a3;
- (void)notifyDelegateAllDevicesRemoved:(id)a3;
- (void)notifyDelegateDeviceAdded:(id)a3;
- (void)notifyDelegateDeviceRemoved:(id)a3;
- (void)notifyDelegateDeviceUpdated:(id)a3;
- (void)removeAllExternalDevices;
- (void)removeDevice:(id)a3;
- (void)replaceDevice:(id)a3 withDevice:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setManager:(id)a3;
@end

@implementation CoreRCBus

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CoreRCBus)init
{
  v4.receiver = self;
  v4.super_class = (Class)CoreRCBus;
  v2 = [(CoreRCBus *)&v4 init];
  if (v2)
  {
    v2->_devicesInternal = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    v2->_uniqueID = (NSUUID *)objc_alloc_init(MEMORY[0x263F08C38]);
    v2->_assertionID = 0;
  }
  return v2;
}

- (CoreRCBus)initWithBus:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (a3)
  {
    v17.receiver = self;
    v17.super_class = (Class)CoreRCBus;
    objc_super v4 = [(CoreRCBus *)&v17 init];
    v5 = v4;
    if (v4)
    {
      uint64_t v6 = [(CoreRCBus *)v4 zone];
      v5->_devicesInternal = (NSMutableSet *)objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF9C0], "allocWithZone:", v6), "init");
      v5->_uniqueID = (NSUUID *)objc_msgSend((id)objc_msgSend(a3, "uniqueID"), "copyWithZone:", v6);
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      v7 = objc_msgSend(a3, "devices", 0);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v14;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v14 != v10) {
              objc_enumerationMutation(v7);
            }
            [(CoreRCBus *)v5 addDevice:*(void *)(*((void *)&v13 + 1) + 8 * v11++)];
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
        }
        while (v9);
      }
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (CoreRCBus)initWithCoder:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v18.receiver = self;
  v18.super_class = (Class)CoreRCBus;
  objc_super v4 = [(CoreRCBus *)&v18 init];
  if (v4)
  {
    v4->_devicesInternal = (NSMutableSet *)objc_opt_new();
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v5 = (void *)MEMORY[0x263EFFA08];
    uint64_t v6 = objc_opt_class();
    v7 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0, 0), @"devices");
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * v11);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [(NSMutableSet *)v4->_devicesInternal addObject:v12];
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v9);
    }
    v4->_uniqueID = (NSUUID *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueID"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_uniqueID forKey:@"uniqueID"];
  v5 = [(CoreRCBus *)self devicesInternal];
  [a3 encodeObject:v5 forKey:@"devices"];
}

- (void)dealloc
{
  [(CoreRCBus *)self _allowSleep];

  v3.receiver = self;
  v3.super_class = (Class)CoreRCBus;
  [(CoreRCBus *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v4 initWithBus:self];
}

- (id)description
{
  v5.receiver = self;
  v5.super_class = (Class)CoreRCBus;
  objc_super v3 = objc_msgSend(objc_alloc(MEMORY[0x263F089D8]), "initWithString:", -[CoreRCBus description](&v5, sel_description));
  objc_msgSend(v3, "appendFormat:", @" ID: %@;",
    [(NSUUID *)[(CoreRCBus *)self uniqueID] UUIDString]);
  objc_msgSend(v3, "appendFormat:", @" Devices: %lu;",
    [(NSSet *)[(CoreRCBus *)self devices] count]);
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

- (OS_dispatch_queue)serialQueue
{
  objc_super v4 = (OS_dispatch_queue *)objc_msgSend(-[CoreRCBus manager](self, "manager"), "serialQueue");
  if (!v4) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreRCBus.m", 173, @"manager queue must not be nil!");
  }
  return v4;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v9 = [(CoreRCBus *)self manager];
  return [v9 setProperty:a3 forKey:a4 ofBus:self error:a5];
}

- (id)propertyForKey:(id)a3 error:(id *)a4
{
  id v7 = [(CoreRCBus *)self manager];
  return (id)[v7 propertyForKey:a3 ofBus:self error:a4];
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CoreRCBusDelegate *)a3;
}

- (id)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  self->_manager = (CoreRCManager *)a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  objc_super v4 = [(CoreRCBus *)self devices];
  uint64_t v5 = [(NSSet *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setManager:a3];
      }
      while (v6 != v8);
      uint64_t v6 = [(NSSet *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)addDevice:(id)a3
{
  [a3 willAddToBus:self];
  [(CoreRCBus *)self willAddDevice:a3];
  objc_msgSend(a3, "setManager:", -[CoreRCBus manager](self, "manager"));
  [(NSMutableSet *)[(CoreRCBus *)self devicesInternal] addObject:a3];
  [(CoreRCBus *)self notifyDelegateDeviceAdded:a3];
  [(CoreRCBus *)self didAddDevice:a3];
  [a3 didAddToBus:self];
  [a3 readyToSend];
}

- (void)removeDevice:(id)a3
{
  id v4 = [(CoreRCBus *)self deviceOnBusEquivalentTo:a3];
  if (v4)
  {
    id v5 = v4;
    [v4 willRemoveFromBus:self];
    [(CoreRCBus *)self willRemoveDevice:v5];
    [(NSMutableSet *)[(CoreRCBus *)self devicesInternal] removeObject:v5];
    [(CoreRCBus *)self notifyDelegateDeviceRemoved:v5];
    [v5 setManager:0];
    [(CoreRCBus *)self didRemoveDevice:v5];
    [v5 didRemoveFromBus:self];
    id v4 = v5;
  }
}

- (void)replaceDevice:(id)a3 withDevice:(id)a4
{
  id v6 = [(CoreRCBus *)self deviceOnBusEquivalentTo:a3];
  if (v6)
  {
    objc_msgSend(a4, "setManager:", -[CoreRCBus manager](self, "manager"));
    [(NSMutableSet *)[(CoreRCBus *)self devicesInternal] removeObject:v6];
    [(NSMutableSet *)[(CoreRCBus *)self devicesInternal] addObject:a4];
    [(CoreRCBus *)self notifyDelegateDeviceUpdated:a4];
    [a4 readyToSend];
  }
  id v7 = v6;
}

- (void)removeAllExternalDevices
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  objc_super v3 = (NSMutableSet *)objc_opt_new();
  id v4 = (NSMutableSet *)objc_opt_new();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  devicesInternal = self->_devicesInternal;
  uint64_t v6 = [(NSMutableSet *)devicesInternal countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(devicesInternal);
        }
        long long v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if ([v10 isLocalDevice]) {
          long long v11 = v3;
        }
        else {
          long long v11 = v4;
        }
        [(NSMutableSet *)v11 addObject:v10];
      }
      uint64_t v7 = [(NSMutableSet *)devicesInternal countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v7);
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v12 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v4);
        }
        long long v16 = *(void **)(*((void *)&v26 + 1) + 8 * j);
        [v16 willRemoveFromBus:self];
        [(CoreRCBus *)self willRemoveDevice:v16];
      }
      uint64_t v13 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v26 objects:v35 count:16];
    }
    while (v13);
  }

  self->_devicesInternal = v3;
  [(CoreRCBus *)self notifyDelegateAllDevicesRemoved:v4];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v17 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v22 objects:v34 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v23;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(v4);
        }
        v21 = *(void **)(*((void *)&v22 + 1) + 8 * k);
        [v21 setManager:0];
        [(CoreRCBus *)self didRemoveDevice:v21];
        [v21 didRemoveFromBus:self];
      }
      uint64_t v18 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v22 objects:v34 count:16];
    }
    while (v18);
  }
}

- (void)didRemoveFromManager:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  objc_super v3 = [(CoreRCBus *)self devices];
  uint64_t v4 = [(NSSet *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) removeAllOwningClients];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSSet *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (id)mergeProperties
{
  return (id)MEMORY[0x263EFFA68];
}

- (void)mergePropertiesFromBus:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_opt_new();
  if (v5 && [(CoreRCBus *)self isEqual:a3])
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v6 = [(CoreRCBus *)self mergeProperties];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v25 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v12 = objc_msgSend(a3, "valueForKey:", v11, v18, v19);
          if ((objc_msgSend((id)-[CoreRCBus valueForKey:](self, "valueForKey:", v11), "isEqual:", v12) & 1) == 0)
          {
            [(CoreRCBus *)self setValue:v12 forKey:v11];
            [v5 addObject:v11];
            if (gLogCategory_CoreRCBus <= 10
              && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
            {
              uint64_t v18 = v11;
              uint64_t v19 = self;
              LogPrintF();
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v8);
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v13 = objc_msgSend(a3, "devices", v18, v19, 0);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v21;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v13);
          }
          [(CoreRCBus *)self mergeDevice:*(void *)(*((void *)&v20 + 1) + 8 * j)];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v15);
    }
    if ([v5 count]) {
      [(CoreRCBus *)self didUpdateProperties:v5];
    }
  }
}

- (void)didUpdateProperties:(id)a3
{
  id v4 = [(CoreRCBus *)self manager];
  [v4 notifyDelegateUpdateBus:self];
}

- (id)mergeDevice:(id)a3
{
  id v5 = -[CoreRCBus deviceOnBusEquivalentTo:](self, "deviceOnBusEquivalentTo:");
  if (v5)
  {
    id v6 = v5;
    [v5 mergePropertiesFromDevice:a3];
    return v6;
  }
  else
  {
    [(CoreRCBus *)self addDevice:a3];
    return [(CoreRCBus *)self deviceOnBusEquivalentTo:a3];
  }
}

- (NSSet)devices
{
  v2 = (void *)MEMORY[0x263EFFA08];
  objc_super v3 = [(CoreRCBus *)self devicesInternal];
  return (NSSet *)[v2 setWithSet:v3];
}

- (id)deviceOnBusEquivalentTo:(id)a3
{
  id v4 = [(CoreRCBus *)self devicesInternal];
  return (id)[(NSMutableSet *)v4 member:a3];
}

- (void)notifyDelegateDeviceAdded:(id)a3
{
  id v5 = [(CoreRCBus *)self delegate];
  if (gLogCategory_CoreRCBus <= 10 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
  {
    objc_opt_class();
    objc_opt_class();
    LogPrintF();
  }
  if (objc_opt_respondsToSelector())
  {
    [v5 bus:self deviceHasBeenAdded:a3];
  }
}

- (void)notifyDelegateDeviceRemoved:(id)a3
{
  id v5 = [(CoreRCBus *)self delegate];
  if (gLogCategory_CoreRCBus <= 10 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
  {
    objc_opt_class();
    objc_opt_class();
    LogPrintF();
  }
  if (objc_opt_respondsToSelector())
  {
    [v5 bus:self deviceHasBeenRemoved:a3];
  }
}

- (void)notifyDelegateAllDevicesRemoved:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (gLogCategory_CoreRCBus <= 10 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
  {
    uint64_t v9 = objc_opt_class();
    long long v10 = self;
    LogPrintF();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16, v9, v10);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a3);
        }
        [(CoreRCBus *)self notifyDelegateDeviceRemoved:*(void *)(*((void *)&v11 + 1) + 8 * i)];
      }
      uint64_t v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)notifyDelegateDeviceUpdated:(id)a3
{
  id v5 = [(CoreRCBus *)self delegate];
  if (gLogCategory_CoreRCBus <= 10 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
  {
    objc_opt_class();
    objc_opt_class();
    LogPrintF();
  }
  if (objc_opt_respondsToSelector())
  {
    [v5 bus:self deviceHasBeenUpdated:a3];
  }
}

- (int)_preventSleep
{
  return 0;
}

- (int)_allowSleep
{
  return 0;
}

- (BOOL)allowHibernation
{
  return self->_assertionID == 0;
}

- (BOOL)setAllowHibernation:(BOOL)a3 error:(id *)a4
{
  if (a3) {
    int v5 = [(CoreRCBus *)self _allowSleep];
  }
  else {
    int v5 = [(CoreRCBus *)self _preventSleep];
  }
  int v6 = v5;
  if (a4 && v5) {
    *a4 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08350] code:v5 userInfo:0];
  }
  return v6 == 0;
}

- (NSMutableSet)devicesInternal
{
  return self->_devicesInternal;
}

- (NSUUID)uniqueID
{
  return self->_uniqueID;
}

@end