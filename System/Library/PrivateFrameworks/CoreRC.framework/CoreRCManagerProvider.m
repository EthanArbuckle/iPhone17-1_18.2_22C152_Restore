@interface CoreRCManagerProvider
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)setExtendedProperty:(id)a3 forKey:(id)a4 ofDevice:(id)a5 error:(id *)a6;
- (BOOL)setProperty:(id)a3 forKey:(id)a4 ofBus:(id)a5 error:(id *)a6;
- (CoreCECOverride)standardOverride;
- (CoreRCInterfaceController)interfaceController;
- (CoreRCManagerProvider)initWithSerialQueue:(id)a3;
- (CoreRCManagerProvider)initWithSerialQueue:(id)a3 withoutPlugins:(BOOL)a4;
- (NSArray)pluginOverrides;
- (id)addDeviceWithBus:(id)a3 logicalAddress:(unsigned __int8)a4 physicalAddress:(unint64_t)a5 attributes:(id)a6 message:(id)a7 reason:(unint64_t)a8;
- (id)addDeviceWithBus:(id)a3 transportProperties:(id)a4 error:(id *)a5;
- (id)createRCOverrideFromPaths:(id)a3;
- (id)extendedPropertyForKey:(id)a3 ofDevice:(id)a4 error:(id *)a5;
- (id)propertyForKey:(id)a3 ofBus:(id)a4 error:(id *)a5;
- (void)dealloc;
- (void)initCECOverrides;
- (void)initOverrides;
- (void)interfaceController:(id)a3 didAddInterface:(id)a4;
- (void)interfaceController:(id)a3 didRemoveInterface:(id)a4;
- (void)setPluginOverrides:(id)a3;
- (void)setStandardOverride:(id)a3;
@end

@implementation CoreRCManagerProvider

- (void)initCECOverrides
{
  v3 = objc_alloc_init(CoreCECStandardOverride);
  [(CoreRCManagerProvider *)self setStandardOverride:v3];
}

- (id)addDeviceWithBus:(id)a3 logicalAddress:(unsigned __int8)a4 physicalAddress:(unint64_t)a5 attributes:(id)a6 message:(id)a7 reason:(unint64_t)a8
{
  uint64_t v10 = a4;
  uint64_t v27 = *MEMORY[0x263EF8340];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v12 = [(CoreRCManagerProvider *)self pluginOverrides];
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v13) {
    return [(CoreCECOverride *)[(CoreRCManagerProvider *)self standardOverride] addDeviceWithBus:a3 logicalAddress:v10 physicalAddress:a5 attributes:a6 message:a7 reason:a8];
  }
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)v23;
LABEL_3:
  uint64_t v16 = 0;
  while (1)
  {
    if (*(void *)v23 != v15) {
      objc_enumerationMutation(v12);
    }
    v17 = *(void **)(*((void *)&v22 + 1) + 8 * v16);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id result = (id)[v17 addDeviceWithBus:a3 logicalAddress:v10 physicalAddress:a5 attributes:a6 message:a7 reason:a8];
      if (result) {
        return result;
      }
    }
    if (v14 == ++v16)
    {
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v14) {
        goto LABEL_3;
      }
      return [(CoreCECOverride *)[(CoreRCManagerProvider *)self standardOverride] addDeviceWithBus:a3 logicalAddress:v10 physicalAddress:a5 attributes:a6 message:a7 reason:a8];
    }
  }
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return NSAllocateObject((Class)a1, 0, a3);
}

- (CoreRCManagerProvider)initWithSerialQueue:(id)a3
{
  return [(CoreRCManagerProvider *)self initWithSerialQueue:a3 withoutPlugins:0];
}

- (CoreRCManagerProvider)initWithSerialQueue:(id)a3 withoutPlugins:(BOOL)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CoreRCManagerProvider;
  v5 = [(CoreRCManager *)&v9 initWithSerialQueue:a3];
  v6 = v5;
  if (v5)
  {
    if (!a4) {
      [(CoreRCManagerProvider *)v5 initOverrides];
    }
    [(CoreRCManagerProvider *)v6 initCECOverrides];
    v7 = (CoreRCInterfaceController *)objc_opt_new();
    v6->_interfaceController = v7;
    [(CoreRCInterfaceController *)v7 setDelegate:v6];
    [(CoreRCInterfaceController *)v6->_interfaceController startOnQueue:[(CoreRCManager *)v6 serialQueue]];
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CoreRCManagerProvider;
  [(CoreRCManager *)&v3 dealloc];
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4 ofBus:(id)a5 error:(id *)a6
{
  v12 = 0;
  id v9 = [(CoreRCManager *)self managedBusEquivalentTo:a5];
  if (v9)
  {
    BOOL result = [v9 setProperty:a3 forKey:a4 error:&v12];
    if (!a6) {
      return result;
    }
  }
  else
  {
    uint64_t v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6727 userInfo:0];
    BOOL result = 0;
    v12 = (void *)v11;
    if (!a6) {
      return result;
    }
  }
  if (!result) {
    *a6 = v12;
  }
  return result;
}

- (id)propertyForKey:(id)a3 ofBus:(id)a4 error:(id *)a5
{
  uint64_t v10 = 0;
  id v7 = [(CoreRCManager *)self managedBusEquivalentTo:a4];
  if (v7)
  {
    id result = (id)[v7 propertyForKey:a3 error:&v10];
    if (!a5) {
      return result;
    }
  }
  else
  {
    uint64_t v9 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6727 userInfo:0];
    id result = 0;
    uint64_t v10 = (void *)v9;
    if (!a5) {
      return result;
    }
  }
  if (!result) {
    *a5 = v10;
  }
  return result;
}

- (BOOL)setExtendedProperty:(id)a3 forKey:(id)a4 ofDevice:(id)a5 error:(id *)a6
{
  v12 = 0;
  id v9 = [(CoreRCManager *)self managedDeviceEquivalentTo:a5];
  if (v9)
  {
    BOOL result = [v9 setExtendedProperty:a3 forKey:a4 error:&v12];
    if (!a6) {
      return result;
    }
  }
  else
  {
    uint64_t v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6727 userInfo:0];
    BOOL result = 0;
    v12 = (void *)v11;
    if (!a6) {
      return result;
    }
  }
  if (!result) {
    *a6 = v12;
  }
  return result;
}

- (id)extendedPropertyForKey:(id)a3 ofDevice:(id)a4 error:(id *)a5
{
  uint64_t v10 = 0;
  id v7 = [(CoreRCManager *)self managedDeviceEquivalentTo:a4];
  if (v7)
  {
    id result = (id)[v7 extendedPropertyForKey:a3 error:&v10];
    if (!a5) {
      return result;
    }
  }
  else
  {
    uint64_t v9 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6727 userInfo:0];
    id result = 0;
    uint64_t v10 = (void *)v9;
    if (!a5) {
      return result;
    }
  }
  if (!result) {
    *a5 = v10;
  }
  return result;
}

- (void)interfaceController:(id)a3 didAddInterface:(id)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = off_2652E3220;
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = off_2652E3268;
LABEL_5:
    uint64_t v7 = [objc_alloc(*v6) initWithInterface:a4];
    if (v7)
    {
      id v8 = (id)v7;
      [(CoreRCManager *)self addBus:v7];
    }
    return;
  }
  if (gLogCategory_CoreRCManager <= 60 && (gLogCategory_CoreRCManager != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

- (void)interfaceController:(id)a3 didRemoveInterface:(id)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    uint64_t v6 = [a4 delegate];
    if (v6)
    {
      [(CoreRCManager *)self removeBus:v6];
    }
  }
  else if (gLogCategory_CoreRCManager <= 60 {
         && (gLogCategory_CoreRCManager != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (id)createRCOverrideFromPaths:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = a3;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(MEMORY[0x263F086E0], "bundleWithPath:", v9, v14, v15, v16, v17);
        uint64_t v11 = (objc_class *)[v10 principalClass];
        id v12 = objc_alloc_init(v11);
        if (v12)
        {
          [v4 addObject:v12];
        }
        if (gLogCategory_CoreRCManager <= 10
          && (gLogCategory_CoreRCManager != -1 || _LogCategory_Initialize()))
        {
          uint64_t v16 = v11;
          id v17 = v12;
          uint64_t v14 = v9;
          uint64_t v15 = v10;
          LogPrintF();
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }
  return v4;
}

- (void)initOverrides
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 0xAuLL, 0);
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "stringByAppendingPathComponent:", @"CoreRC"), "stringByAppendingPathComponent:", @"CECOverridePlugins");
        objc_msgSend(v3, "addObjectsFromArray:", -[CoreRCManagerProvider createRCOverrideFromPaths:](self, "createRCOverrideFromPaths:", objc_msgSend(MEMORY[0x263F086E0], "pathsForResourcesOfType:inDirectory:", @"plugin", v9)));
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v6);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v10 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 0xAuLL, 0);
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * j), "stringByAppendingPathComponent:", @"CoreRC"), "stringByAppendingPathComponent:", @"IROverridePlugins");
        objc_msgSend(v3, "addObjectsFromArray:", -[CoreRCManagerProvider createRCOverrideFromPaths:](self, "createRCOverrideFromPaths:", objc_msgSend(MEMORY[0x263F086E0], "pathsForResourcesOfType:inDirectory:", @"plugin", v15)));
      }
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v12);
  }
  objc_msgSend(v3, "addObjectsFromArray:", -[CoreRCManagerProvider createRCOverrideFromPaths:](self, "createRCOverrideFromPaths:", objc_msgSend(MEMORY[0x263F086E0], "pathsForResourcesOfType:inDirectory:", @"plugin", objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "builtInPlugInsPath"), "stringByAppendingPathComponent:", @"CECOverridePlugins"))));
  objc_msgSend(v3, "addObjectsFromArray:", -[CoreRCManagerProvider createRCOverrideFromPaths:](self, "createRCOverrideFromPaths:", objc_msgSend(MEMORY[0x263F086E0], "pathsForResourcesOfType:inDirectory:", @"plugin", objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "builtInPlugInsPath"), "stringByAppendingPathComponent:", @"IROverridePlugins"))));
  [(CoreRCManagerProvider *)self setPluginOverrides:v3];
  if (gLogCategory_CoreRCManager <= 10 && (gLogCategory_CoreRCManager != -1 || _LogCategory_Initialize()))
  {
    [(CoreRCManagerProvider *)self pluginOverrides];
    LogPrintF();
  }
}

- (id)addDeviceWithBus:(id)a3 transportProperties:(id)a4 error:(id *)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = [(CoreRCManagerProvider *)self pluginOverrides];
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v20 != v10) {
        objc_enumerationMutation(v7);
      }
      uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * v11);
      id v18 = 0;
      id result = (id)objc_msgSend(v12, "addDeviceWithBus:transportProperties:error:", a3, a4, &v18, v15, v16);
      if (result) {
        break;
      }
      if (gLogCategory_CoreRCManager <= 90
        && (gLogCategory_CoreRCManager != -1 || _LogCategory_Initialize()))
      {
        uint64_t v15 = v12;
        uint64_t v16 = [v18 localizedDescription];
        LogPrintF();
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_13;
      }
    }
  }
  else
  {
LABEL_13:
    if (a5)
    {
      uint64_t v14 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6727 userInfo:0];
      id result = 0;
      *a5 = v14;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (CoreCECOverride)standardOverride
{
  return self->_standardOverride;
}

- (void)setStandardOverride:(id)a3
{
}

- (NSArray)pluginOverrides
{
  return self->_pluginOverrides;
}

- (void)setPluginOverrides:(id)a3
{
}

- (CoreRCInterfaceController)interfaceController
{
  return self->_interfaceController;
}

@end