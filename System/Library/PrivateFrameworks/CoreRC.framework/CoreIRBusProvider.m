@interface CoreIRBusProvider
+ (BOOL)supportsSecureCoding;
+ (NSSet)deviceDictClasses;
- (BOOL)addMappingsFromRemote:(id)a3 toLearningSession:(id)a4;
- (BOOL)deleteDevicePrefsWithUUID:(id)a3 UUIDKey:(id)a4;
- (BOOL)mergePersistentMappingsFromSession:(id)a3 ofDevice:(id)a4;
- (BOOL)recreateDevices;
- (BOOL)saveDevicePrefsWithDict:(id)a3 error:(id *)a4;
- (BOOL)setPairedAppleRemote:(id)a3 error:(id *)a4;
- (BOOL)setPrefsPropertyForUUID:(id)a3 UUIDKey:(id)a4 object:(id)a5 key:(id)a6;
- (BOOL)setProperty:(id)a3 forKey:(id)a4 error:(id *)a5;
- (BOOL)updatePersistentValue:(id)a3 forProperty:(id)a4 ofDevice:(id)a5;
- (Class)classForCoder;
- (CoreIRBusProvider)initWithInterface:(id)a3;
- (IRInterface)interface;
- (id)_addAppleRemoteWithDeviceUID:(unsigned __int8)a3;
- (id)_addDeviceWithType:(unint64_t)a3 matching:(id)a4 transportProperties:(id)a5 error:(id *)a6;
- (id)_findAppleRemoteWithUID:(unsigned __int8)a3;
- (id)addDeviceWithType:(unint64_t)a3 matching:(id)a4 error:(id *)a5;
- (id)addDeviceWithType:(unint64_t)a3 matching:(id)a4 learningSession:(id)a5 error:(id *)a6;
- (id)appleIRDeviceWithUID:(unsigned __int8)a3 create:(BOOL)a4;
- (id)copyDevicePrefs:(id *)a3;
- (id)copyPrefsPropertyForUUID:(id)a3 UUIDKey:(id)a4 key:(id)a5;
- (id)getExistingDeviceWithType:(unint64_t)a3 matching:(id)a4;
- (id)localDevice;
- (id)propertyForKey:(id)a3 error:(id *)a4;
- (id)thirdPartyRemotes;
- (void)_recreatePairedDeviceFromDefaults:(id)a3 key:(id)a4;
- (void)_removeMappingForCommand:(unint64_t)a3 from:(id)a4;
- (void)dealloc;
- (void)didAddDevice:(id)a3;
- (void)didRemoveDevice:(id)a3;
- (void)interface:(id)a3 receivedCommand:(id)a4;
- (void)migrateOldRemotes;
- (void)setManager:(id)a3;
- (void)updateAllowHibernation;
- (void)updateLearnedProtocols;
- (void)willAddToManager:(id)a3;
- (void)willRemoveDevice:(id)a3;
@end

@implementation CoreIRBusProvider

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Class)classForCoder
{
  return NSClassFromString(&cfstr_Coreirbusclien_4.isa);
}

- (CoreIRBusProvider)initWithInterface:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CoreIRBusProvider;
  v4 = [(CoreIRBus *)&v8 init];
  if (v4)
  {
    v5 = (IRInterface *)a3;
    v4->_interface = v5;
    if (v5
      && ([(IRInterface *)v5 setDelegate:v4],
          v6 = [[CoreIRDeviceProvider alloc] initWithBus:v4 local:1], (v4->_localDevice = v6) != 0))
    {
      [(CoreIRDevice *)v4->_localDevice setIsTransmitter:[(IRInterface *)v4->_interface isTxInterface]];
      [(CoreIRDevice *)v4->_localDevice setIsReceiver:[(IRInterface *)v4->_interface isRxInterface]];
      if ([(IRInterface *)v4->_interface buttons]) {
        -[CoreIRDevice setButtons:](v4->_localDevice, "setButtons:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithArray:", -[IRInterface buttons](v4->_interface, "buttons")));
      }
      v4->_stateHandler = os_state_add_handler();
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

_DWORD *__39__CoreIRBusProvider_initWithInterface___block_invoke(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(a2 + 16) & 0xFFFFFFFE) != 2) {
    return 0;
  }
  uint64_t v10 = 0;
  uint64_t v2 = [*(id *)(a1 + 32) copyDevicePrefs:&v10];
  v3 = 0;
  if (v2) {
    BOOL v4 = v10 == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4)
  {
    v5 = (void *)[(id)objc_msgSend(NSString stringWithFormat:@"%@", v2), "dataUsingEncoding:", 4];
    uint64_t v6 = v10;
    if (!v10 || gLogCategory_CoreRCBus > 90) {
      goto LABEL_13;
    }
    if (gLogCategory_CoreRCBus == -1)
    {
      if (!_LogCategory_Initialize()) {
        goto LABEL_13;
      }
      uint64_t v6 = v10;
    }
    uint64_t v9 = v6;
    LogPrintF();
LABEL_13:
    uint64_t v7 = objc_msgSend(v5, "length", v9);
    v3 = malloc_type_calloc(1uLL, v7 + 200, 0x164F583uLL);
    __strlcpy_chk();
    _DWORD *v3 = 1;
    v3[1] = v7;
    [v5 getBytes:v3 + 50 length:v7];
  }
  return v3;
}

+ (NSSet)deviceDictClasses
{
  result = (NSSet *)deviceDictClasses__deviceDictClasses;
  if (!deviceDictClasses__deviceDictClasses)
  {
    id v3 = objc_alloc(MEMORY[0x263EFFA08]);
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    result = (NSSet *)objc_msgSend(v3, "initWithObjects:", v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
    deviceDictClasses__deviceDictClasses = (uint64_t)result;
  }
  return result;
}

- (void)dealloc
{
  [(IRInterface *)self->_interface setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)CoreIRBusProvider;
  [(CoreIRBus *)&v3 dealloc];
}

- (void)setManager:(id)a3
{
  if (a3)
  {
    v4.receiver = self;
    v4.super_class = (Class)CoreIRBusProvider;
    -[CoreRCBus setManager:](&v4, sel_setManager_);
    [(CoreRCBus *)self addDevice:self->_localDevice];
  }
  else
  {
    [(CoreRCBus *)self removeDevice:self->_localDevice];
    v4.receiver = self;
    v4.super_class = (Class)CoreIRBusProvider;
    [(CoreRCBus *)&v4 setManager:0];
  }
}

- (void)willAddToManager:(id)a3
{
  if (gLogCategory_CoreRCBus <= 10 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
  {
    uint64_t v6 = [(IRInterface *)[(CoreIRBusProvider *)self interface] isTxInterface];
    uint64_t v7 = [(IRInterface *)[(CoreIRBusProvider *)self interface] isRxInterface];
    uint64_t v5 = self;
    LogPrintF();
  }
  [(CoreIRBusProvider *)self recreateDevices];
  if ([(IRInterface *)[(CoreIRBusProvider *)self interface] isRxInterface]) {
    [(CoreIRBusProvider *)self migrateOldRemotes];
  }
  v8.receiver = self;
  v8.super_class = (Class)CoreIRBusProvider;
  [(CoreRCBus *)&v8 willAddToManager:a3];
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4 error:(id *)a5
{
  if (gLogCategory_CoreRCBus <= 10 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
  {
    v11 = self;
    id v12 = a4;
    LogPrintF();
  }
  uint64_t v9 = [(CoreIRBusProvider *)self interface];
  return [(CoreRCInterface *)v9 setProperty:a3 forKey:a4 error:a5];
}

- (id)propertyForKey:(id)a3 error:(id *)a4
{
  uint64_t v10 = 0;
  if (gLogCategory_CoreRCBus <= 10 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
  {
    objc_super v8 = self;
    id v9 = a3;
    LogPrintF();
  }
  id result = [(CoreRCInterface *)[(CoreIRBusProvider *)self interface] propertyForKey:a3 error:&v10];
  if (a4)
  {
    if (!result) {
      *a4 = v10;
    }
  }
  return result;
}

- (id)localDevice
{
  return self->_localDevice;
}

- (void)didAddDevice:(id)a3
{
  uint64_t v6 = 0;
  v5.receiver = self;
  v5.super_class = (Class)CoreIRBusProvider;
  -[CoreRCBus didAddDevice:](&v5, sel_didAddDevice_);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([a3 is3rdPartyRemote])
    {
      [(CoreIRBusProvider *)self updateLearnedProtocols];
      if (![(IRInterface *)[(CoreIRBusProvider *)self interface] canWakeFor3rdPartyIR]&& ![(CoreRCBus *)self setAllowHibernation:0 error:&v6]&& gLogCategory_CoreRCBus <= 90&& (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
  }
}

- (void)didRemoveDevice:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CoreIRBusProvider;
  -[CoreRCBus didRemoveDevice:](&v5, sel_didRemoveDevice_);
  if ([a3 is3rdPartyRemote]) {
    [(CoreIRBusProvider *)self updateLearnedProtocols];
  }
  [(CoreIRBusProvider *)self updateAllowHibernation];
}

- (void)updateAllowHibernation
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v15 = 0;
  if ([(IRInterface *)[(CoreIRBusProvider *)self interface] canWakeFor3rdPartyIR]
    || (long long v13 = 0u,
        long long v14 = 0u,
        long long v11 = 0u,
        long long v12 = 0u,
        objc_super v3 = [(CoreRCBus *)self devices],
        (uint64_t v4 = [(NSSet *)v3 countByEnumeratingWithState:&v11 objects:v16 count:16]) == 0))
  {
    uint64_t v7 = 1;
  }
  else
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    LODWORD(v7) = 1;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = ([*(id *)(*((void *)&v11 + 1) + 8 * i) is3rdPartyRemote] ^ 1) & v7;
      }
      uint64_t v5 = [(NSSet *)v3 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v5);
  }
  if (gLogCategory_CoreRCBus <= 10 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
  {
    id v9 = self;
    uint64_t v10 = v7;
    LogPrintF();
  }
  if (!-[CoreRCBus setAllowHibernation:error:](self, "setAllowHibernation:error:", v7, &v15, v9, v10)
    && gLogCategory_CoreRCBus <= 90
    && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)updateLearnedProtocols
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v14 = 0;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  objc_super v3 = [(CoreRCBus *)self devices];
  uint64_t v4 = [(NSSet *)v3 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v9 is3rdPartyRemote]) {
          uint64_t v6 = [v9 protocolMask] | v6;
        }
      }
      uint64_t v5 = [(NSSet *)v3 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
  }
  if ([(IRInterface *)[(CoreIRBusProvider *)self interface] setLearnedProtocolMask:v6 error:&v14])
  {
    if (gLogCategory_CoreRCBus > 10 || gLogCategory_CoreRCBus == -1 && !_LogCategory_Initialize()) {
      return;
    }
LABEL_15:
    [(CoreIRBusProvider *)self interface];
    LogPrintF();
    return;
  }
  if (gLogCategory_CoreRCBus <= 90 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize())) {
    goto LABEL_15;
  }
}

- (id)thirdPartyRemotes
{
  uint64_t v2 = [(CoreRCBus *)self devices];
  return [(NSSet *)v2 objectsPassingTest:&__block_literal_global];
}

uint64_t __38__CoreIRBusProvider_thirdPartyRemotes__block_invoke(uint64_t a1, void *a2)
{
  if ([a2 isAppleRemote]) {
    return 0;
  }
  uint64_t result = [a2 isTransmitter];
  if (result) {
    return [a2 isLocalDevice] ^ 1;
  }
  return result;
}

- (id)addDeviceWithType:(unint64_t)a3 matching:(id)a4 error:(id *)a5
{
  v24[1] = *MEMORY[0x263EF8340];
  v20 = 0;
  v23 = @"CoreIRTransportPropertyMatching";
  v24[0] = a4;
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];
  if (gLogCategory_CoreRCBus <= 10 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
  {
    v18 = self;
    id v19 = a4;
    LogPrintF();
  }
  id v10 = -[CoreIRBusProvider getExistingDeviceWithType:matching:](self, "getExistingDeviceWithType:matching:", a3, a4, v18, v19);
  if (v10) {
    return v10;
  }
  id v11 = [(CoreIRBusProvider *)self _addDeviceWithType:a3 matching:a4 transportProperties:v9 error:&v20];
  if (v11)
  {
    long long v12 = v11;
    if ([(IRInterface *)[(CoreIRBusProvider *)self interface] isTxInterface]
      && [(IRInterface *)[(CoreIRBusProvider *)self interface] isRxInterface])
    {
      uint64_t v13 = 17;
    }
    else if ([(IRInterface *)[(CoreIRBusProvider *)self interface] isTxInterface])
    {
      uint64_t v13 = 1;
    }
    else if ([(IRInterface *)[(CoreIRBusProvider *)self interface] isRxInterface])
    {
      uint64_t v13 = 16;
    }
    else
    {
      uint64_t v13 = 0;
    }
    uint64_t v14 = (void *)MEMORY[0x263EFF9A0];
    v22[0] = [v12 uniqueID];
    v22[1] = [NSNumber numberWithUnsignedInteger:v13];
    v22[2] = [NSNumber numberWithUnsignedInteger:a3];
    uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:3];
    v21[0] = @"CoreIRDevicePrefDictUUID";
    v21[1] = @"CoreIRDevicePrefDictInterfaceType";
    v21[2] = @"CoreIRDevicePrefDictType";
    uint64_t v16 = objc_msgSend(v14, "dictionaryWithObjects:forKeys:", v15, objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v21, 3));
    [v16 addEntriesFromDictionary:v9];
    objc_msgSend(v16, "addEntriesFromDictionary:", objc_msgSend(v12, "persistentProperties"));
    [(CoreIRBusProvider *)self saveDevicePrefsWithDict:v16 error:a5];
    [(CoreRCBus *)self addDevice:v12];
  }
  else
  {
    long long v12 = 0;
    if (a5) {
      *a5 = v20;
    }
  }
  return v12;
}

- (id)addDeviceWithType:(unint64_t)a3 matching:(id)a4 learningSession:(id)a5 error:(id *)a6
{
  v28[1] = *MEMORY[0x263EF8340];
  v24 = 0;
  v27 = @"CoreIRDLearntDevicePropertyMatching";
  v28[0] = a4;
  uint64_t v11 = [NSDictionary dictionaryWithObjects:v28 forKeys:&v27 count:1];
  if (gLogCategory_CoreRCBus <= 50 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
  {
    id v22 = a4;
    id v23 = a5;
    v20 = self;
    unint64_t v21 = a3;
    LogPrintF();
  }
  if (a5 && [a5 mappings])
  {
    id v12 = [(CoreIRBusProvider *)self _addDeviceWithType:a3 matching:a4 transportProperties:v11 error:&v24];
    if (v12)
    {
      uint64_t v13 = v12;
      if (gLogCategory_CoreRCBus <= 50 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
      {
        v20 = (CoreIRBusProvider *)objc_msgSend(a5, "mappings", v20, v21, v22, v23);
        LogPrintF();
      }
      if (objc_msgSend(v13, "setMappingWithSession:error:", a5, &v24, v20))
      {
        if ([(IRInterface *)[(CoreIRBusProvider *)self interface] isTxInterface]
          && [(IRInterface *)[(CoreIRBusProvider *)self interface] isRxInterface])
        {
          uint64_t v14 = 17;
        }
        else if ([(IRInterface *)[(CoreIRBusProvider *)self interface] isTxInterface])
        {
          uint64_t v14 = 1;
        }
        else if ([(IRInterface *)[(CoreIRBusProvider *)self interface] isRxInterface])
        {
          uint64_t v14 = 16;
        }
        else
        {
          uint64_t v14 = 0;
        }
        uint64_t v15 = [a5 mappings];
        uint64_t v16 = (void *)MEMORY[0x263EFF9A0];
        v26[0] = [v13 uniqueID];
        v26[1] = [NSNumber numberWithUnsignedInteger:v14];
        v26[2] = [NSNumber numberWithUnsignedInteger:a3];
        v26[3] = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a5, "reason"));
        v26[4] = v15;
        uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:5];
        v25[0] = @"CoreIRDevicePrefDictUUID";
        v25[1] = @"CoreIRDevicePrefDictInterfaceType";
        v25[2] = @"CoreIRDevicePrefDictType";
        v25[3] = @"CoreIRDevicePrefDictReason";
        v25[4] = @"CoreIRDevicePrefDictMappings";
        v18 = objc_msgSend(v16, "dictionaryWithObjects:forKeys:", v17, objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v25, 5));
        [v18 addEntriesFromDictionary:v11];
        objc_msgSend(v18, "addEntriesFromDictionary:", objc_msgSend(v13, "persistentProperties"));
        [(CoreIRBusProvider *)self saveDevicePrefsWithDict:v18 error:a6];
        [(CoreRCBus *)self addDevice:v13];
        return v13;
      }
    }
  }
  else
  {
    v24 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", *MEMORY[0x263F08410], -6705, 0, v20, v21, v22, v23);
  }
  uint64_t v13 = 0;
  if (a6) {
    *a6 = v24;
  }
  return v13;
}

- (id)_addDeviceWithType:(unint64_t)a3 matching:(id)a4 transportProperties:(id)a5 error:(id *)a6
{
  uint64_t v14 = 0;
  uint64_t v9 = objc_msgSend(-[CoreRCBus manager](self, "manager"), "addDeviceWithBus:transportProperties:error:", self, a5, &v14);
  if (v9)
  {
    id v10 = (void *)v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && ([v10 isLocalDevice] & 1) == 0)
    {
      [v10 setMatchingDict:a4];
      [v10 setIsTransmitter:a3 & 1];
      [v10 setIsReceiver:(a3 >> 4) & 1];
      goto LABEL_5;
    }
    uint64_t v12 = -6734;
  }
  else
  {
    uint64_t v12 = -6728;
  }
  uint64_t v13 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:v12 userInfo:0];
  uint64_t v14 = v13;
  id v10 = 0;
  if (a6) {
    *a6 = v13;
  }
LABEL_5:
  if (gLogCategory_CoreRCBus <= 40 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  return v10;
}

- (id)_addAppleRemoteWithDeviceUID:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  if (gLogCategory_CoreRCBus <= 50 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v5 = [[AppleIRDeviceProvider alloc] initWithBus:self deviceUID:v3];
  if (v5)
  {
    [(CoreRCBus *)self addDevice:v5];
  }
  return v5;
}

- (id)getExistingDeviceWithType:(unint64_t)a3 matching:(id)a4
{
  char v5 = a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [(CoreRCBus *)self devices];
  uint64_t v7 = [(NSSet *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (((v5 & 1) == 0) != [v11 isTransmitter]
          && ((v5 & 0x10) == 0) != [v11 isReceiver]
          && objc_msgSend((id)objc_msgSend(v11, "matchingDict"), "isEqual:", a4))
        {
          if (gLogCategory_CoreRCBus <= 50 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          return v11;
        }
      }
      uint64_t v8 = [(NSSet *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  return 0;
}

- (void)migrateOldRemotes
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v25 = 0;
  if (gLogCategory_CoreRCBus <= 10 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.AppleTVIR"];
  uint64_t v4 = v3;
  if (!v3) {
    goto LABEL_55;
  }
  if ([v3 BOOLForKey:@"HasMigrated"])
  {
    id v19 = 0;
    id v7 = 0;
    long long v13 = 0;
    goto LABEL_62;
  }
  [(CoreIRBusProvider *)self _recreatePairedDeviceFromDefaults:v4 key:@"pairedDeviceUID"];
  id obj = (id)[v4 arrayForKey:@"remotes"];
  if (obj)
  {
    if (gLogCategory_CoreRCBus <= 40 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
    {
      uint64_t v17 = (uint64_t)obj;
      LogPrintF();
    }
    id v19 = objc_alloc_init(NSDictionary);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v18 = v4;
      id v7 = 0;
      uint64_t v8 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if (gLogCategory_CoreRCBus <= 10 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
          {
            uint64_t v17 = (uint64_t)v10;
            LogPrintF();
          }
          uint64_t v11 = objc_msgSend(v10, "valueForKey:", @"name", v17);
          if (v11)
          {
            uint64_t v12 = v11;
            long long v13 = [[CoreIRLearningSessionProvider alloc] initWithReason:1];
            if (!v13)
            {
              uint64_t v16 = -6728;
              goto LABEL_51;
            }
            if ([(CoreIRBusProvider *)self addMappingsFromRemote:v10 toLearningSession:v13])
            {
              if (gLogCategory_CoreRCBus <= 10
                && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
              {
                uint64_t v17 = [(CoreIRLearningSessionProvider *)v13 mappings];
                LogPrintF();
              }
              id v14 = -[CoreIRBusProvider addDeviceWithType:matching:learningSession:error:](self, "addDeviceWithType:matching:learningSession:error:", 1, v19, v13, &v25, v17);
              if (!v14)
              {
                uint64_t v16 = -6700;
LABEL_51:
                uint64_t v25 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:v16 userInfo:0];
LABEL_52:
                uint64_t v4 = v18;
                goto LABEL_58;
              }
              long long v15 = v14;

              [v15 setOSDName:v12 error:0];
            }
            else
            {
              if (gLogCategory_CoreRCBus <= 90
                && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
              {
                LogPrintF();
              }
              if (!v7) {
                id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
              }
              [v7 addObject:v12];
            }
          }
          else if (gLogCategory_CoreRCBus <= 90 {
                 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
          }
          {
            LogPrintF();
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
        if (v6) {
          continue;
        }
        break;
      }
      if (!v7)
      {
        long long v13 = 0;
        goto LABEL_52;
      }
      uint64_t v4 = v18;
      [v18 setObject:v7 forKey:@"UnmigratableRemoteNames"];
      [v18 synchronize];
      if (gLogCategory_CoreRCBus <= 90 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
      {
        uint64_t v17 = (uint64_t)v7;
        LogPrintF();
      }
      goto LABEL_57;
    }
  }
  else
  {
LABEL_55:
    id v19 = 0;
  }
  id v7 = 0;
LABEL_57:
  long long v13 = 0;
LABEL_58:
  objc_msgSend(v4, "setBool:forKey:", 1, @"HasMigrated", v17);
  [v4 synchronize];
  if (gLogCategory_CoreRCBus <= 40 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_62:

  if (v25 && gLogCategory_CoreRCBus <= 90 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

- (BOOL)addMappingsFromRemote:(id)a3 toLearningSession:(id)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void *)[a3 objectForKey:@"buttons"];
  if (v4)
  {
    uint64_t v5 = v4;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (!v6)
    {
LABEL_27:
      LOBYTE(v31) = 1;
      return v31;
    }
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v40;
    uint64_t v9 = @"usageCode";
    uint64_t v35 = *(void *)v40;
LABEL_4:
    uint64_t v10 = 0;
    uint64_t v37 = v7;
    while (1)
    {
      if (*(void *)v40 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v11 = *(void **)(*((void *)&v39 + 1) + 8 * v10);
      unsigned __int8 v12 = objc_msgSend((id)objc_msgSend(v11, "objectForKey:", @"protocolID", v33, v34), "unsignedIntValue");
      if (v12 == 8) {
        break;
      }
      unsigned __int8 v13 = v12;
      uint64_t v14 = objc_msgSend((id)objc_msgSend(v11, "objectForKey:", @"usagePage"), "unsignedIntValue");
      uint64_t v15 = objc_msgSend((id)objc_msgSend(v11, "objectForKey:", v9), "unsignedIntValue");
      uint64_t v38 = 0;
      if (CoreRCCommandFromLegacyHIDUsage(&v38, v14, v15))
      {
        uint64_t v16 = (void *)[v11 objectForKey:@"commandPattern"];
        if (!v16) {
          break;
        }
        uint64_t v17 = v16;
        size_t v18 = [v16 count];
        if (!v18) {
          break;
        }
        size_t v19 = v18;
        v20 = v9;
        long long v21 = malloc_type_calloc(8uLL, v18, 0xBB4FC938uLL);
        if (!v21) {
          break;
        }
        long long v22 = v21;
        for (uint64_t i = 0; i != v19; ++i)
          v22[i] = objc_msgSend((id)objc_msgSend(v17, "objectAtIndex:", i), "unsignedLongLongValue");
        long long v24 = (void *)[v11 objectForKey:@"repeatPattern"];
        if (!v24
          || (uint64_t v25 = v24, (v26 = [v24 count]) == 0)
          || (size_t v27 = v26, (v28 = malloc_type_calloc(8uLL, v26, 0x8C3677A2uLL)) == 0))
        {
          free(v22);
          break;
        }
        v29 = v28;
        for (uint64_t j = 0; j != v27; ++j)
          v29[j] = objc_msgSend((id)objc_msgSend(v25, "objectAtIndex:", j), "unsignedLongLongValue");
        if (([a4 addMappingWithProtocolID:v13 options:0 commandToMap:v38 commands:v22 commandCount:v19 repeats:v29 repeatCount:v27] & 1) == 0)
        {
          free(v22);
          free(v29);
          break;
        }
        free(v22);
        free(v29);
        uint64_t v8 = v35;
        uint64_t v9 = v20;
        uint64_t v7 = v37;
      }
      else if (gLogCategory_CoreRCBus <= 90 {
             && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
      }
      {
        uint64_t v33 = v14;
        uint64_t v34 = v15;
        LogPrintF();
      }
      if (++v10 == v7)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v39 objects:v43 count:16];
        if (v7) {
          goto LABEL_4;
        }
        goto LABEL_27;
      }
    }
  }
  if (gLogCategory_CoreRCBus > 90)
  {
LABEL_34:
    LOBYTE(v31) = 0;
    return v31;
  }
  if (gLogCategory_CoreRCBus != -1 || (int v31 = _LogCategory_Initialize()) != 0)
  {
    LogPrintF();
    goto LABEL_34;
  }
  return v31;
}

- (BOOL)recreateDevices
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  uint64_t v41 = 0;
  -[CoreIRBusProvider _recreatePairedDeviceFromDefaults:key:](self, "_recreatePairedDeviceFromDefaults:key:", [MEMORY[0x263EFFA40] standardUserDefaults], @"CoreIRAppleRemotePrefPairedUID");
  if (gLogCategory_CoreRCBus <= 50 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
  {
    uint64_t v33 = [(IRInterface *)[(CoreIRBusProvider *)self interface] isRxInterface];
    uint64_t v35 = [(IRInterface *)[(CoreIRBusProvider *)self interface] isTxInterface];
    v30 = self;
    LogPrintF();
  }
  id v3 = -[CoreIRBusProvider copyDevicePrefs:](self, "copyDevicePrefs:", &v41, v30, v33, v35);
  uint64_t v4 = v3;
  if (v3)
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v5 = [v3 countByEnumeratingWithState:&v37 objects:v46 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v38;
      id obj = v4;
LABEL_8:
      uint64_t v8 = 0;
      while (1)
      {
        if (*(void *)v38 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(CoreIRBusProvider **)(*((void *)&v37 + 1) + 8 * v8);
        if (gLogCategory_CoreRCBus <= 50 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
        {
          int v31 = v9;
          LogPrintF();
        }
        uint64_t v10 = objc_msgSend((id)-[CoreIRBusProvider objectForKey:](v9, "objectForKey:", @"CoreIRDevicePrefDictInterfaceType", v31), "unsignedIntegerValue");
        if ([(IRInterface *)[(CoreIRBusProvider *)self interface] isTxInterface]
          && (v10 & 0xFFFFFFFFFFFFFFEFLL) == 1
          || [(IRInterface *)[(CoreIRBusProvider *)self interface] isRxInterface]
          && (v10 & 0xFFFFFFFFFFFFFFFELL) == 0x10)
        {
          uint64_t v11 = objc_msgSend((id)-[CoreIRBusProvider objectForKey:](v9, "objectForKey:", @"CoreIRDevicePrefDictType"), "unsignedIntegerValue");
          uint64_t v12 = [(CoreIRBusProvider *)v9 objectForKey:@"CoreIRTransportPropertyMatching"];
          if (!v12)
          {
            uint64_t v15 = [(CoreIRBusProvider *)v9 objectForKey:@"CoreIRDLearntDevicePropertyMatching"];
            if (!v15) {
              goto LABEL_45;
            }
            uint64_t v16 = v15;
            long long v42 = @"CoreIRDLearntDevicePropertyMatching";
            uint64_t v43 = v15;
            uint64_t v17 = [NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
            if (gLogCategory_CoreRCBus <= 10
              && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
            {
              int v31 = self;
              uint64_t v34 = v16;
              LogPrintF();
            }
            id v20 = -[CoreIRBusProvider _addDeviceWithType:matching:transportProperties:error:](self, "_addDeviceWithType:matching:transportProperties:error:", v11, v16, v17, &v41, v31);
            if (!v20)
            {
LABEL_47:
              BOOL v25 = 0;
              goto LABEL_48;
            }
            id v19 = v20;
            long long v21 = -[CoreIRLearningSession initWithReason:]([CoreIRLearningSessionProvider alloc], "initWithReason:", objc_msgSend((id)-[CoreIRBusProvider objectForKey:](v9, "objectForKey:", @"CoreIRDevicePrefDictReason"), "unsignedIntegerValue"));
            if (!v21)
            {
              size_t v26 = (void *)MEMORY[0x263F087E8];
              uint64_t v27 = *MEMORY[0x263F08410];
              uint64_t v28 = -6728;
              goto LABEL_46;
            }
            long long v22 = v21;
            [(CoreIRLearningSessionProvider *)v21 setMappings:[(CoreIRBusProvider *)v9 objectForKey:@"CoreIRDevicePrefDictMappings"]];
            if (gLogCategory_CoreRCBus <= 10
              && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
            {
              uint64_t v32 = [(CoreIRLearningSessionProvider *)v22 mappings];
              LogPrintF();
            }
            char v23 = objc_msgSend(v19, "setMappingWithSession:error:", v22, &v41, v32);

            if ((v23 & 1) == 0) {
              goto LABEL_47;
            }
            goto LABEL_40;
          }
          uint64_t v13 = v12;
          uint64_t v44 = @"CoreIRTransportPropertyMatching";
          uint64_t v45 = v12;
          uint64_t v14 = [NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
          if (gLogCategory_CoreRCBus <= 10 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
          {
            int v31 = self;
            uint64_t v34 = v13;
            LogPrintF();
          }
          id v18 = -[CoreIRBusProvider getExistingDeviceWithType:matching:](self, "getExistingDeviceWithType:matching:", v11, v13, v31, v34);
          if (!v18)
          {
            id v19 = [(CoreIRBusProvider *)self _addDeviceWithType:v11 matching:v13 transportProperties:v14 error:&v41];
            if (!v19) {
              goto LABEL_47;
            }
LABEL_40:
            [v19 setPersistentProperties:v9];
            uint64_t v24 = [(CoreIRBusProvider *)v9 objectForKeyedSubscript:@"CoreIRDevicePrefDictUUID"];
            if (!v24)
            {
LABEL_45:
              size_t v26 = (void *)MEMORY[0x263F087E8];
              uint64_t v27 = *MEMORY[0x263F08410];
              uint64_t v28 = -6700;
LABEL_46:
              BOOL v25 = 0;
              uint64_t v41 = [v26 errorWithDomain:v27 code:v28 userInfo:0];
LABEL_48:
              uint64_t v4 = obj;
              goto LABEL_49;
            }
            [v19 setUniqueID:v24];
            [(CoreRCBus *)self addDevice:v19];
            goto LABEL_42;
          }
          [(CoreIRBusProvider *)self willRemoveDevice:v18];
        }
LABEL_42:
        if (v6 == ++v8)
        {
          uint64_t v4 = obj;
          uint64_t v6 = [obj countByEnumeratingWithState:&v37 objects:v46 count:16];
          if (v6) {
            goto LABEL_8;
          }
          break;
        }
      }
    }
  }
  BOOL v25 = 1;
LABEL_49:
  [v4 removeAllObjects];

  if (v41 && gLogCategory_CoreRCBus <= 90 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  return v25;
}

- (void)_recreatePairedDeviceFromDefaults:(id)a3 key:(id)a4
{
  uint64_t v5 = [a3 objectForKey:a4];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    uint64_t v8 = 0;
    if (gLogCategory_CoreRCBus <= 10 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = -[CoreIRBusProvider _addAppleRemoteWithDeviceUID:](self, "_addAppleRemoteWithDeviceUID:", [v6 unsignedCharValue]);
      if (v7)
      {
        if (![(CoreIRBusProvider *)self setPairedAppleRemote:v7 error:&v8]
          && gLogCategory_CoreRCBus <= 90
          && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
      }
    }
  }
}

- (void)willRemoveDevice:(id)a3
{
  -[CoreIRBusProvider deleteDevicePrefsWithUUID:UUIDKey:](self, "deleteDevicePrefsWithUUID:UUIDKey:", [a3 uniqueID], @"CoreIRDevicePrefDictUUID");
  v5.receiver = self;
  v5.super_class = (Class)CoreIRBusProvider;
  [(CoreIRBus *)&v5 willRemoveDevice:a3];
}

- (BOOL)saveDevicePrefsWithDict:(id)a3 error:(id *)a4
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v58 = 0;
  if (!a3)
  {
    long long v38 = (void *)MEMORY[0x263F087E8];
    uint64_t v39 = *MEMORY[0x263F08410];
    uint64_t v40 = -6705;
LABEL_61:
    id v23 = (id)[v38 errorWithDomain:v39 code:v40 userInfo:0];
    uint64_t v9 = 0;
    goto LABEL_62;
  }
  uint64_t v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "objectForKey:", @"CoreIRDevicePref");
  if (!v6)
  {
    uint64_t v8 = objc_opt_new();
    goto LABEL_6;
  }
  id v7 = (void *)v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v38 = (void *)MEMORY[0x263F087E8];
    uint64_t v39 = *MEMORY[0x263F08410];
    uint64_t v40 = -6756;
    goto LABEL_61;
  }
  uint64_t v8 = [v7 mutableCopy];
LABEL_6:
  uint64_t v9 = (void *)v8;
  if (!v8
    || (uint64_t v10 = [MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v58]) == 0)
  {
    id v23 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6728 userInfo:0];
LABEL_62:
    v46 = 0;
    LODWORD(v13) = 0;
    LODWORD(v14) = 0;
LABEL_63:
    BOOL v22 = 0;
    id v58 = v23;
    if (!v23) {
      goto LABEL_49;
    }
    goto LABEL_32;
  }
  v46 = (void *)v10;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  uint64_t v11 = [v9 countByEnumeratingWithState:&v54 objects:v78 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    unint64_t v13 = 0;
    unint64_t v14 = 0;
    uint64_t v15 = *(void *)v55;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v55 != v15) {
          objc_enumerationMutation(v9);
        }
        uint64_t v17 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_28;
        }
        if ([v17 length] > v14) {
          unint64_t v14 = [v17 length];
        }
        uint64_t v18 = [v17 length];
        BOOL v19 = __CFADD__(v13, v18);
        v13 += v18;
        if (v19)
        {
LABEL_28:
          BOOL v22 = 0;
          id v58 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6717 userInfo:0];
          goto LABEL_31;
        }
      }
      uint64_t v12 = [v9 countByEnumeratingWithState:&v54 objects:v78 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  else
  {
    unint64_t v13 = 0;
    unint64_t v14 = 0;
  }
  if ([v46 length] > v14) {
    LODWORD(v14) = [v46 length];
  }
  uint64_t v20 = [v46 length];
  BOOL v19 = __CFADD__(v13, v20);
  v13 += v20;
  if (v19 || v13 > 0xE1000)
  {
    id v23 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6751 userInfo:0];
    goto LABEL_63;
  }
  [v9 addObject:v46];
  objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "setObject:forKey:", v9, @"CoreIRDevicePref");
  objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "synchronize");
  if (gLogCategory_CoreRCBus <= 50 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
  {
    uint64_t v21 = [v46 length];
    unint64_t v42 = v13;
    uint64_t v43 = [v9 count];
    uint64_t v41 = v21;
    LogPrintF();
  }
  BOOL v22 = 1;
LABEL_31:
  id v23 = v58;
  if (v58)
  {
LABEL_32:
    if (objc_msgSend(v23, "code", v41, v42, v43) == -6751 || objc_msgSend(v58, "code") == -6717)
    {
      BOOL v45 = v22;
      uint64_t v44 = v9;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      uint64_t v24 = [(CoreRCBus *)self devices];
      uint64_t v25 = [(NSSet *)v24 countByEnumeratingWithState:&v50 objects:v77 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        int v27 = 0;
        int v28 = 0;
        int v47 = 0;
        int v49 = 0;
        uint64_t v29 = *(void *)v51;
        do
        {
          for (uint64_t j = 0; j != v26; ++j)
          {
            if (*(void *)v51 != v29) {
              objc_enumerationMutation(v24);
            }
            int v31 = *(void **)(*((void *)&v50 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v27 += [v31 isReceiver];
              v28 += [v31 isTransmitter];
              if ([v31 is3rdPartyRemote]) {
                ++v47;
              }
              else {
                v49 += [v31 isAppleRemote];
              }
            }
          }
          uint64_t v26 = [(NSSet *)v24 countByEnumeratingWithState:&v50 objects:v77 count:16];
        }
        while (v26);
      }
      else
      {
        int v27 = 0;
        int v28 = 0;
        int v47 = 0;
        int v49 = 0;
      }
      uint64_t v9 = v44;
      BOOL v22 = v45;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
      {
        int v35 = [v58 code];
        int v36 = [v46 length];
        int v37 = [v44 count];
        *(_DWORD *)buf = 67111168;
        int v60 = v35;
        __int16 v61 = 1024;
        int v62 = v36;
        __int16 v63 = 1024;
        int v64 = v14;
        __int16 v65 = 1024;
        int v66 = v37;
        __int16 v67 = 1024;
        int v68 = v13;
        __int16 v69 = 1024;
        int v70 = v27;
        __int16 v71 = 1024;
        int v72 = v28;
        __int16 v73 = 1024;
        int v74 = v47;
        BOOL v22 = v45;
        __int16 v75 = 1024;
        int v76 = v49;
        _os_log_fault_impl(&dword_24C4AB000, &_os_log_internal, OS_LOG_TYPE_FAULT, "CoreRC saveDevicePrefsWithDict failed:0x%x newEntrySize:%u maxEntrySize:%u numEntries:%u totalSize:%u numRx:%u numTx:%u num3rdParty:%u numApple:%u", buf, 0x38u);
      }
    }
  }
LABEL_49:

  if (a4) {
    char v32 = v22;
  }
  else {
    char v32 = 1;
  }
  if ((v32 & 1) == 0)
  {
    id v33 = v58;
    if (!v58) {
      id v33 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6700 userInfo:0];
    }
    *a4 = v33;
  }
  return v22;
}

- (BOOL)deleteDevicePrefsWithUUID:(id)a3 UUIDKey:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (!a4) {
    goto LABEL_42;
  }
  if (gLogCategory_CoreRCBus <= 50 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
  {
    uint64_t v17 = [a3 UUIDString];
    LogPrintF();
  }
  uint64_t v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults", v17), "objectForKey:", @"CoreIRDevicePref");
  if (!v6) {
    goto LABEL_35;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_42:
    uint64_t v6 = 0;
    goto LABEL_35;
  }
  uint64_t v6 = (void *)[v6 mutableCopy];
  if (v6 && +[CoreIRBusProvider deviceDictClasses])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v20;
      while (2)
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * v10);
          id v18 = 0;
          uint64_t v12 = objc_msgSend(MEMORY[0x263F08928], "unarchivedObjectOfClasses:fromData:error:", +[CoreIRBusProvider deviceDictClasses](CoreIRBusProvider, "deviceDictClasses", v17), v11, &v18);
          if (v12)
          {
            uint64_t v13 = [v12 objectForKeyedSubscript:a4];
            if (v13 && [a3 isEqual:v13])
            {
              [v6 removeObject:v11];
              objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "setObject:forKey:", v6, @"CoreIRDevicePref");
              objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "synchronize");
              if (gLogCategory_CoreRCBus <= 50
                && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
              {
                LogPrintF();
              }

              LOBYTE(v15) = 1;
              return v15;
            }
          }
          else if (gLogCategory_CoreRCBus <= 90 {
                 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
          }
          {
            uint64_t v17 = [v18 localizedDescription];
            LogPrintF();
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v14 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
        uint64_t v8 = v14;
        if (v14) {
          continue;
        }
        break;
      }
    }
    if (gLogCategory_CoreRCBus <= 60 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
    {
      uint64_t v17 = objc_msgSend(a3, "UUIDString", v17);
      LogPrintF();
    }
  }
LABEL_35:

  if (gLogCategory_CoreRCBus > 60)
  {
LABEL_38:
    LOBYTE(v15) = 0;
    return v15;
  }
  if (gLogCategory_CoreRCBus != -1 || (int v15 = _LogCategory_Initialize()) != 0)
  {
    objc_msgSend(a3, "UUIDString", v17);
    LogPrintF();
    goto LABEL_38;
  }
  return v15;
}

- (BOOL)setPrefsPropertyForUUID:(id)a3 UUIDKey:(id)a4 object:(id)a5 key:(id)a6
{
  uint64_t v7 = 0;
  uint64_t v34 = *MEMORY[0x263EF8340];
  if (a3 && a4 && a5 && a6)
  {
    if (gLogCategory_CoreRCBus <= 10 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
    {
      id v24 = a5;
      id v25 = a6;
      uint64_t v23 = [a3 UUIDString];
      LogPrintF();
    }
    uint64_t v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults", v23, v24, v25), "objectForKey:", @"CoreIRDevicePref");
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v7 = 0;
        goto LABEL_40;
      }
      uint64_t v7 = (void *)[v7 mutableCopy];
      if (v7)
      {
        if (+[CoreIRBusProvider deviceDictClasses])
        {
          id v26 = a5;
          id v27 = a6;
          long long v31 = 0u;
          long long v32 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          uint64_t v11 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
          if (!v11)
          {
LABEL_29:
            if (gLogCategory_CoreRCBus <= 60
              && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
            {
              uint64_t v23 = objc_msgSend(a3, "UUIDString", v23);
LABEL_32:
              LogPrintF();
            }
            goto LABEL_40;
          }
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v30;
LABEL_15:
          uint64_t v14 = 0;
          while (1)
          {
            if (*(void *)v30 != v13) {
              objc_enumerationMutation(v7);
            }
            uint64_t v15 = *(void *)(*((void *)&v29 + 1) + 8 * v14);
            id v28 = 0;
            uint64_t v16 = objc_msgSend(MEMORY[0x263F08928], "unarchivedObjectOfClasses:fromData:error:", +[CoreIRBusProvider deviceDictClasses](CoreIRBusProvider, "deviceDictClasses", v23), v15, &v28);
            if (v16)
            {
              uint64_t v17 = v16;
              uint64_t v18 = [v16 objectForKeyedSubscript:a4];
              if (v18 && [a3 isEqual:v18])
              {
                [v7 removeObject:v15];
                [v17 setObject:v26 forKey:v27];
                uint64_t v20 = [MEMORY[0x263F08910] archivedDataWithRootObject:v17 requiringSecureCoding:1 error:&v28];
                if (v20)
                {
                  [v7 addObject:v20];
                  objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "setObject:forKey:", v7, @"CoreIRDevicePref");
                  objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "synchronize");
                  if (gLogCategory_CoreRCBus <= 10
                    && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
                  {
                    LogPrintF();
                  }

                  LOBYTE(v21) = 1;
                  return v21;
                }
                if (gLogCategory_CoreRCBus <= 90
                  && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
                {
                  uint64_t v23 = [v28 localizedDescription];
                  goto LABEL_32;
                }
                break;
              }
            }
            else if (gLogCategory_CoreRCBus <= 90 {
                   && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
            }
            {
              uint64_t v23 = [v28 localizedDescription];
              LogPrintF();
            }
            if (v12 == ++v14)
            {
              uint64_t v19 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
              uint64_t v12 = v19;
              if (v19) {
                goto LABEL_15;
              }
              goto LABEL_29;
            }
          }
        }
      }
    }
  }
LABEL_40:

  if (gLogCategory_CoreRCBus > 60) {
    goto LABEL_43;
  }
  if (gLogCategory_CoreRCBus != -1 || (int v21 = _LogCategory_Initialize()) != 0)
  {
    objc_msgSend(a3, "UUIDString", v23);
    LogPrintF();
LABEL_43:
    LOBYTE(v21) = 0;
  }
  return v21;
}

- (id)copyDevicePrefs:(id *)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v25 = 0;
  uint64_t v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "objectForKey:", @"CoreIRDevicePref");
  if (!v4)
  {
    uint64_t v6 = 0;
LABEL_19:
    int v13 = 50;
    goto LABEL_20;
  }
  objc_super v5 = (void *)v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (+[CoreIRBusProvider deviceDictClasses])
    {
      uint64_t v6 = objc_opt_new();
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v22;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v22 != v9) {
              objc_enumerationMutation(v5);
            }
            uint64_t v11 = objc_msgSend(MEMORY[0x263F08928], "unarchivedObjectOfClasses:fromData:error:", +[CoreIRBusProvider deviceDictClasses](CoreIRBusProvider, "deviceDictClasses", v20), *(void *)(*((void *)&v21 + 1) + 8 * v10), &v25);
            if (v11)
            {
              [v6 addObject:v11];
            }
            else if (gLogCategory_CoreRCBus <= 90 {
                   && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
            }
            {
              uint64_t v20 = [v25 localizedDescription];
              LogPrintF();
            }
            ++v10;
          }
          while (v8 != v10);
          uint64_t v12 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
          uint64_t v8 = v12;
        }
        while (v12);
      }
      goto LABEL_19;
    }
    uint64_t v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v16 = *MEMORY[0x263F08410];
    uint64_t v17 = *MEMORY[0x263F08410];
    uint64_t v18 = -6728;
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v16 = *MEMORY[0x263F08410];
    uint64_t v17 = *MEMORY[0x263F08410];
    uint64_t v18 = -6756;
  }
  uint64_t v19 = (void *)[v15 errorWithDomain:v17 code:v18 userInfo:0];
  id v25 = v19;
  if (a3)
  {
    if (!v19) {
      uint64_t v19 = (void *)[MEMORY[0x263F087E8] errorWithDomain:v16 code:-6700 userInfo:0];
    }
    uint64_t v6 = 0;
    *a3 = v19;
  }
  else
  {
    uint64_t v6 = 0;
  }
  int v13 = 90;
LABEL_20:
  if (v13 >= gLogCategory_CoreRCBus && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v6, "count", v20);
    [v25 code];
    LogPrintF();
  }
  return v6;
}

- (id)copyPrefsPropertyForUUID:(id)a3 UUIDKey:(id)a4 key:(id)a5
{
  uint64_t v6 = 0;
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (!a3 || !a4 || !a5) {
    goto LABEL_18;
  }
  if (gLogCategory_CoreRCBus <= 50 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
  {
    uint64_t v19 = [a3 UUIDString];
    id v20 = a5;
    LogPrintF();
  }
  id v10 = -[CoreIRBusProvider copyDevicePrefs:](self, "copyDevicePrefs:", 0, v19, v20);
  uint64_t v6 = v10;
  if (v10
    && (long long v23 = 0u,
        long long v24 = 0u,
        long long v21 = 0u,
        long long v22 = 0u,
        (uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16]) != 0))
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
LABEL_11:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v22 != v13) {
        objc_enumerationMutation(v6);
      }
      uint64_t v15 = *(void **)(*((void *)&v21 + 1) + 8 * v14);
      uint64_t v16 = [v15 objectForKeyedSubscript:a4];
      if (v16)
      {
        if ([a3 isEqual:v16]) {
          break;
        }
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v12) {
          goto LABEL_11;
        }
        goto LABEL_18;
      }
    }
    id v17 = (id)[v15 objectForKeyedSubscript:a5];

    if (v17) {
      return v17;
    }
  }
  else
  {
LABEL_18:
  }
  if (gLogCategory_CoreRCBus <= 90 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
  {
    [a3 UUIDString];
    LogPrintF();
  }
  return 0;
}

- (BOOL)updatePersistentValue:(id)a3 forProperty:(id)a4 ofDevice:(id)a5
{
  if (gLogCategory_CoreRCBus <= 10 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (a4
    && a3
    && a5
    && -[CoreIRBusProvider setPrefsPropertyForUUID:UUIDKey:object:key:](self, "setPrefsPropertyForUUID:UUIDKey:object:key:", [a5 uniqueID], @"CoreIRDevicePrefDictUUID", a3, a4))
  {
    LOBYTE(v9) = 1;
    return v9;
  }
  if (gLogCategory_CoreRCBus > 90)
  {
LABEL_13:
    LOBYTE(v9) = 0;
    return v9;
  }
  if (gLogCategory_CoreRCBus != -1 || (int v9 = _LogCategory_Initialize()) != 0)
  {
    LogPrintF();
    goto LABEL_13;
  }
  return v9;
}

- (BOOL)mergePersistentMappingsFromSession:(id)a3 ofDevice:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (gLogCategory_CoreRCBus <= 50 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
  {
    id v19 = a4;
    LogPrintF();
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [a3 mappings];
    if (a4)
    {
      uint64_t v8 = (void *)v7;
      if (v7)
      {
        id v9 = -[CoreIRBusProvider copyPrefsPropertyForUUID:UUIDKey:key:](self, "copyPrefsPropertyForUUID:UUIDKey:key:", [a4 uniqueID], @"CoreIRDevicePrefDictUUID", @"CoreIRDevicePrefDictMappings");
        if (v9)
        {
          long long v22 = 0u;
          long long v23 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            char v12 = 0;
            uint64_t v13 = *(void *)v21;
            do
            {
              for (uint64_t i = 0; i != v11; ++i)
              {
                if (*(void *)v21 != v13) {
                  objc_enumerationMutation(v8);
                }
                uint64_t v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
                -[CoreIRBusProvider _removeMappingForCommand:from:](self, "_removeMappingForCommand:from:", objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", @"CoreIRLearningSessionCommand", v19), "unsignedIntegerValue"), v9);
                if (objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", @"CoreIRLearningSessionCommand"), "unsignedIntegerValue") == 46)
                {
                  [(CoreIRBusProvider *)self _removeMappingForCommand:67 from:v9];
                  [(CoreIRBusProvider *)self _removeMappingForCommand:47 from:v9];
                  char v12 = 1;
                }
              }
              uint64_t v11 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
            }
            while (v11);
            if (v12)
            {
              [(CoreIRBusProvider *)self _removeMappingForCommand:67 from:v8];
              [(CoreIRBusProvider *)self _removeMappingForCommand:47 from:v8];
            }
          }
          objc_msgSend(v9, "addObjectsFromArray:", v8, v19);
          uint64_t v8 = v9;
        }
        BOOL v16 = -[CoreIRBusProvider setPrefsPropertyForUUID:UUIDKey:object:key:](self, "setPrefsPropertyForUUID:UUIDKey:object:key:", objc_msgSend(a4, "uniqueID", v19), @"CoreIRDevicePrefDictUUID", v8, @"CoreIRDevicePrefDictMappings");

        if (v16)
        {
          LOBYTE(v17) = 1;
          return v17;
        }
      }
    }
  }
  if (gLogCategory_CoreRCBus > 90)
  {
LABEL_26:
    LOBYTE(v17) = 0;
    return v17;
  }
  if (gLogCategory_CoreRCBus != -1 || (int v17 = _LogCategory_Initialize()) != 0)
  {
    LogPrintF();
    goto LABEL_26;
  }
  return v17;
}

- (void)_removeMappingForCommand:(unint64_t)a3 from:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a3)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v6 = [a4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(a4);
          }
          uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", @"CoreIRLearningSessionCommand"), "unsignedIntegerValue") == a3)
          {
            [a4 removeObject:v10];
            return;
          }
        }
        uint64_t v7 = [a4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
  }
}

- (void)interface:(id)a3 receivedCommand:(id)a4
{
  if (gLogCategory_CoreRCBus <= 10 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  localDevice = self->_localDevice;
  [(CoreIRDeviceProvider *)localDevice handleIRCommand:a4];
}

- (id)appleIRDeviceWithUID:(unsigned __int8)a3 create:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = a3;
  id result = -[CoreIRBusProvider _findAppleRemoteWithUID:](self, "_findAppleRemoteWithUID:");
  if (!result && v4)
  {
    return [(CoreIRBusProvider *)self _addAppleRemoteWithDeviceUID:v5];
  }
  return result;
}

- (id)_findAppleRemoteWithUID:(unsigned __int8)a3
{
  unsigned int v3 = a3;
  uint64_t v5 = [(CoreRCBus *)self devices];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __45__CoreIRBusProvider__findAppleRemoteWithUID___block_invoke;
  v11[3] = &__block_descriptor_33_e12_B24__0_8_B16l;
  char v12 = v3;
  uint64_t v6 = [(NSSet *)v5 objectsPassingTest:v11];
  if ([(NSSet *)v6 count] < 2
    || gLogCategory_CoreRCBus > 90
    || gLogCategory_CoreRCBus == -1 && !_LogCategory_Initialize())
  {
    return [(NSSet *)v6 anyObject];
  }
  uint64_t v10 = [(CoreRCBus *)self devices];
  LogPrintF();
  return [(NSSet *)v6 anyObject];
}

BOOL __45__CoreIRBusProvider__findAppleRemoteWithUID___block_invoke(uint64_t a1, void *a2)
{
  return (objc_opt_isKindOfClass() & 1) != 0
      && [a2 deviceUID] == *(unsigned __int8 *)(a1 + 32);
}

- (BOOL)setPairedAppleRemote:(id)a3 error:(id *)a4
{
  if ([(CoreIRBus *)self pairedAppleRemote] == a3)
  {
    if (gLogCategory_CoreRCBus <= 40 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    LOBYTE(v9) = 1;
  }
  else
  {
    uint64_t v7 = [(CoreIRBusProvider *)self interface];
    if (a3) {
      uint64_t v8 = (CoreIRDevice *)a3;
    }
    else {
      uint64_t v8 = [(CoreIRBus *)self pairedAppleRemote];
    }
    BOOL v9 = [(IRInterface *)v7 setPairState:a3 != 0 forDeviceUID:[(CoreIRDevice *)v8 deviceUID] error:a4];
    if (v9)
    {
      uint64_t v10 = (void *)[MEMORY[0x263EFFA40] standardUserDefaults];
      long long v11 = (void *)[v10 objectForKey:@"CoreIRAppleRemotePrefPairedUID"];
      if (a3) {
        uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(a3, "deviceUID"));
      }
      else {
        uint64_t v12 = 0;
      }
      if (v11 != (void *)v12 && ([v11 isEqual:v12] & 1) == 0)
      {
        if (a3) {
          [v10 setObject:v12 forKey:@"CoreIRAppleRemotePrefPairedUID"];
        }
        else {
          [v10 removeObjectForKey:@"CoreIRAppleRemotePrefPairedUID"];
        }
      }
      [v10 synchronize];
      v14.receiver = self;
      v14.super_class = (Class)CoreIRBusProvider;
      LOBYTE(v9) = [(CoreIRBus *)&v14 setPairedAppleRemote:a3 error:a4];
    }
  }
  return v9;
}

- (IRInterface)interface
{
  return self->_interface;
}

@end