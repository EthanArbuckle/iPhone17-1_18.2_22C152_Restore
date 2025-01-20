@interface ASACoreAudio
+ (id)coreAudio;
+ (id)sharedCoreAudioObject;
- (ASAAudioDevice)defaultInputAudioDevice;
- (ASAAudioDevice)defaultOutputAudioDevice;
- (ASAAudioDevice)defaultSystemOutputAudioDevice;
- (ASACoreAudio)initWithAudioObjectID:(unsigned int)a3;
- (NSArray)audioDeviceObjectIDs;
- (NSArray)audioDevices;
- (NSArray)boxObjectIDs;
- (NSArray)boxes;
- (NSArray)clockDeviceObjectIDs;
- (NSArray)clockDevices;
- (NSArray)pluginObjectIDs;
- (NSArray)plugins;
- (id)audioDeviceWithUID:(id)a3;
- (id)boxWithUID:(id)a3;
- (id)clockDeviceWithUID:(id)a3;
- (id)coreAudioClassName;
- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4;
- (id)pluginWithBundleID:(id)a3;
- (id)transportManagerWithBundleID:(id)a3;
- (unsigned)audioDeviceObjectIDWithUID:(id)a3;
- (unsigned)boxObjectIDWithUID:(id)a3;
- (unsigned)clockDeviceObjectIDWithUID:(id)a3;
- (unsigned)defaultInputAudioDeviceObjectID;
- (unsigned)defaultOutputAudioDeviceObjectID;
- (unsigned)defaultSystemOutputAudioDeviceObjectID;
- (unsigned)pluginObjectIDWithBundleID:(id)a3;
- (unsigned)transportManagerObjectIDWithBundleID:(id)a3;
- (void)_setDefaultInputAudioDeviceObjectID:(unsigned int)a3 transient:(BOOL)a4;
- (void)_setDefaultOutputAudioDeviceObjectID:(unsigned int)a3 transient:(BOOL)a4;
- (void)_setDefaultSystemOutputAudioDeviceObjectID:(unsigned int)a3 transient:(BOOL)a4;
- (void)addClient:(id)a3;
- (void)addPlugin:(id)a3;
- (void)dealloc;
- (void)removeClient:(id)a3;
- (void)removePlugin:(id)a3;
- (void)setDefaultInputAudioDevice:(id)a3;
- (void)setDefaultInputAudioDeviceObjectID:(unsigned int)a3;
- (void)setDefaultOutputAudioDevice:(id)a3;
- (void)setDefaultOutputAudioDeviceObjectID:(unsigned int)a3;
- (void)setDefaultSystemOutputAudioDevice:(id)a3;
- (void)setDefaultSystemOutputAudioDeviceObjectID:(unsigned int)a3;
- (void)setTransientDefaultInputAudioDevice:(id)a3;
- (void)setTransientDefaultInputAudioDeviceObjectID:(unsigned int)a3;
- (void)setTransientDefaultOutputAudioDevice:(id)a3;
- (void)setTransientDefaultOutputAudioDeviceObjectID:(unsigned int)a3;
- (void)setTransientDefaultSystemOutputAudioDevice:(id)a3;
- (void)setTransientDefaultSystemOutputAudioDeviceObjectID:(unsigned int)a3;
@end

@implementation ASACoreAudio

+ (id)sharedCoreAudioObject
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__ASACoreAudio_sharedCoreAudioObject__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedCoreAudioObject_onceToken != -1) {
    dispatch_once(&sharedCoreAudioObject_onceToken, block);
  }
  v2 = (void *)_sharedCoreAudioObject;
  return v2;
}

uint64_t __37__ASACoreAudio_sharedCoreAudioObject__block_invoke(uint64_t a1)
{
  _sharedCoreAudioObject = [*(id *)(a1 + 32) coreAudio];
  return MEMORY[0x270F9A758]();
}

+ (id)coreAudio
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAudioObjectID:1];
  return v2;
}

- (ASACoreAudio)initWithAudioObjectID:(unsigned int)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ASACoreAudio;
  v3 = [(ASAObject *)&v7 initWithAudioObjectID:*(void *)&a3];
  if (v3)
  {
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.AudioVideoBridging.ASACoreAudio.client", 0);
    clientQueue = v3->_clientQueue;
    v3->_clientQueue = (OS_dispatch_queue *)v4;

    if (v3->_clientQueue)
    {
      [(ASACoreAudio *)v3 _setupDeathSource];
    }
    else
    {

      return 0;
    }
  }
  return v3;
}

- (void)addClient:(id)a3
{
  id v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __26__ASACoreAudio_addClient___block_invoke;
  v7[3] = &unk_26484D058;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(clientQueue, v7);
}

void __26__ASACoreAudio_addClient___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x22A6A3430]();
  v3 = *(void **)(*(void *)(a1 + 32) + 40);
  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    v3 = *(void **)(*(void *)(a1 + 32) + 40);
  }
  if (([v3 containsObject:*(void *)(a1 + 40)] & 1) == 0) {
    [*(id *)(*(void *)(a1 + 32) + 40) addObject:*(void *)(a1 + 40)];
  }
}

- (void)removeClient:(id)a3
{
  id v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __29__ASACoreAudio_removeClient___block_invoke;
  v7[3] = &unk_26484D058;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(clientQueue, v7);
}

uint64_t __29__ASACoreAudio_removeClient___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 40) containsObject:*(void *)(a1 + 40)];
  if (result)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = *(void **)(*(void *)(a1 + 32) + 40);
    return [v4 removeObject:v3];
  }
  return result;
}

- (void)addPlugin:(id)a3
{
  id v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __26__ASACoreAudio_addPlugin___block_invoke;
  v7[3] = &unk_26484D058;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(clientQueue, v7);
}

void __26__ASACoreAudio_addPlugin___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x22A6A3430]();
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 48);
  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v4;

    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 48);
  }
  if (([v3 containsObject:*(void *)(a1 + 40)] & 1) == 0) {
    [*(id *)(*(void *)(a1 + 32) + 48) addObject:*(void *)(a1 + 40)];
  }
}

- (void)removePlugin:(id)a3
{
  id v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __29__ASACoreAudio_removePlugin___block_invoke;
  v7[3] = &unk_26484D058;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(clientQueue, v7);
}

uint64_t __29__ASACoreAudio_removePlugin___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 48) containsObject:*(void *)(a1 + 40)];
  if (result)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = *(void **)(*(void *)(a1 + 32) + 48);
    return [v4 removeObject:v3];
  }
  return result;
}

- (unsigned)boxObjectIDWithUID:(id)a3
{
  id v8 = a3;
  int v6 = 4;
  unsigned int v7 = 0;
  if (!v8) {
    return 0;
  }
  [(ASAObject *)self getMainGlobalProperty:1969841250 withData:&v7 ofSize:&v6 withQualifier:&v8 ofSize:8];
  unsigned int v4 = v7;

  return v4;
}

- (id)boxWithUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [ASABox alloc];
  uint64_t v6 = [(ASACoreAudio *)self boxObjectIDWithUID:v4];

  unsigned int v7 = [(ASAObject *)v5 initWithAudioObjectID:v6];
  return v7;
}

- (unsigned)audioDeviceObjectIDWithUID:(id)a3
{
  id v8 = a3;
  int v6 = 4;
  unsigned int v7 = 0;
  if (!v8) {
    return 0;
  }
  [(ASAObject *)self getMainGlobalProperty:1920297316 withData:&v7 ofSize:&v6 withQualifier:&v8 ofSize:8];
  unsigned int v4 = v7;

  return v4;
}

- (id)audioDeviceWithUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [ASAAudioDevice alloc];
  uint64_t v6 = [(ASACoreAudio *)self audioDeviceObjectIDWithUID:v4];

  unsigned int v7 = [(ASAObject *)v5 initWithAudioObjectID:v6];
  return v7;
}

- (unsigned)clockDeviceObjectIDWithUID:(id)a3
{
  id v8 = a3;
  int v6 = 4;
  unsigned int v7 = 0;
  if (!v8) {
    return 0;
  }
  [(ASAObject *)self getMainGlobalProperty:1969841251 withData:&v7 ofSize:&v6 withQualifier:&v8 ofSize:8];
  unsigned int v4 = v7;

  return v4;
}

- (id)clockDeviceWithUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [ASAClockDevice alloc];
  uint64_t v6 = [(ASACoreAudio *)self clockDeviceObjectIDWithUID:v4];

  unsigned int v7 = [(ASAObject *)v5 initWithAudioObjectID:v6];
  return v7;
}

- (unsigned)defaultInputAudioDeviceObjectID
{
  int v4 = 4;
  unsigned int v3 = 0;
  [(ASAObject *)self getMainGlobalProperty:1682533920 withData:&v3 ofSize:&v4 withQualifier:0 ofSize:0];
  return v3;
}

- (void)_setDefaultInputAudioDeviceObjectID:(unsigned int)a3 transient:(BOOL)a4
{
  unsigned int v5 = a3;
  BOOL v4 = a4;
  [(ASAObject *)self setMainGlobalProperty:1682533920 withData:&v5 ofSize:4 withQualifier:&v4 ofSize:4];
}

- (void)setDefaultInputAudioDeviceObjectID:(unsigned int)a3
{
}

- (ASAAudioDevice)defaultInputAudioDevice
{
  v2 = [(ASAObject *)[ASAAudioDevice alloc] initWithAudioObjectID:[(ASACoreAudio *)self defaultInputAudioDeviceObjectID]];
  return v2;
}

- (void)setDefaultInputAudioDevice:(id)a3
{
  uint64_t v4 = [a3 objectID];
  [(ASACoreAudio *)self setDefaultInputAudioDeviceObjectID:v4];
}

- (unsigned)defaultOutputAudioDeviceObjectID
{
  int v4 = 4;
  unsigned int v3 = 0;
  [(ASAObject *)self getMainGlobalProperty:1682929012 withData:&v3 ofSize:&v4 withQualifier:0 ofSize:0];
  return v3;
}

- (void)setDefaultOutputAudioDeviceObjectID:(unsigned int)a3
{
}

- (void)_setDefaultOutputAudioDeviceObjectID:(unsigned int)a3 transient:(BOOL)a4
{
  unsigned int v5 = a3;
  BOOL v4 = a4;
  [(ASAObject *)self setMainGlobalProperty:1682929012 withData:&v5 ofSize:4 withQualifier:&v4 ofSize:4];
}

- (ASAAudioDevice)defaultOutputAudioDevice
{
  v2 = [(ASAObject *)[ASAAudioDevice alloc] initWithAudioObjectID:[(ASACoreAudio *)self defaultOutputAudioDeviceObjectID]];
  return v2;
}

- (void)setDefaultOutputAudioDevice:(id)a3
{
  uint64_t v4 = [a3 objectID];
  [(ASACoreAudio *)self setDefaultOutputAudioDeviceObjectID:v4];
}

- (unsigned)defaultSystemOutputAudioDeviceObjectID
{
  int v4 = 4;
  unsigned int v3 = 0;
  [(ASAObject *)self getMainGlobalProperty:1934587252 withData:&v3 ofSize:&v4 withQualifier:0 ofSize:0];
  return v3;
}

- (void)setDefaultSystemOutputAudioDeviceObjectID:(unsigned int)a3
{
}

- (void)_setDefaultSystemOutputAudioDeviceObjectID:(unsigned int)a3 transient:(BOOL)a4
{
  unsigned int v5 = a3;
  BOOL v4 = a4;
  [(ASAObject *)self setMainGlobalProperty:1934587252 withData:&v5 ofSize:4 withQualifier:&v4 ofSize:4];
}

- (ASAAudioDevice)defaultSystemOutputAudioDevice
{
  v2 = [(ASAObject *)[ASAAudioDevice alloc] initWithAudioObjectID:[(ASACoreAudio *)self defaultSystemOutputAudioDeviceObjectID]];
  return v2;
}

- (void)setDefaultSystemOutputAudioDevice:(id)a3
{
  uint64_t v4 = [a3 objectID];
  [(ASACoreAudio *)self setDefaultSystemOutputAudioDeviceObjectID:v4];
}

- (void)setTransientDefaultInputAudioDevice:(id)a3
{
  uint64_t v4 = [a3 objectID];
  [(ASACoreAudio *)self _setDefaultInputAudioDeviceObjectID:v4 transient:1];
}

- (void)setTransientDefaultOutputAudioDevice:(id)a3
{
  uint64_t v4 = [a3 objectID];
  [(ASACoreAudio *)self _setDefaultOutputAudioDeviceObjectID:v4 transient:1];
}

- (void)setTransientDefaultSystemOutputAudioDevice:(id)a3
{
  uint64_t v4 = [a3 objectID];
  [(ASACoreAudio *)self _setDefaultSystemOutputAudioDeviceObjectID:v4 transient:1];
}

- (void)setTransientDefaultInputAudioDeviceObjectID:(unsigned int)a3
{
}

- (void)setTransientDefaultOutputAudioDeviceObjectID:(unsigned int)a3
{
}

- (void)setTransientDefaultSystemOutputAudioDeviceObjectID:(unsigned int)a3
{
}

- (unsigned)transportManagerObjectIDWithBundleID:(id)a3
{
  id v7 = a3;
  int v5 = 0;
  int v6 = 4;
  [(ASAObject *)self getMainGlobalProperty:1953325673 withData:&v5 ofSize:&v6 withQualifier:&v7 ofSize:8];
  LODWORD(self) = v5;

  return self;
}

- (id)transportManagerWithBundleID:(id)a3
{
  id v4 = a3;
  int v5 = [ASAPlugin alloc];
  uint64_t v6 = [(ASACoreAudio *)self transportManagerObjectIDWithBundleID:v4];

  id v7 = [(ASAObject *)v5 initWithAudioObjectID:v6];
  return v7;
}

- (unsigned)pluginObjectIDWithBundleID:(id)a3
{
  id v7 = a3;
  int v5 = 0;
  int v6 = 4;
  [(ASAObject *)self getMainGlobalProperty:1651074160 withData:&v5 ofSize:&v6 withQualifier:&v7 ofSize:8];
  LODWORD(self) = v5;

  return self;
}

- (id)pluginWithBundleID:(id)a3
{
  id v4 = a3;
  int v5 = [ASAPlugin alloc];
  uint64_t v6 = [(ASACoreAudio *)self pluginObjectIDWithBundleID:v4];

  id v7 = [(ASAObject *)v5 initWithAudioObjectID:v6];
  return v7;
}

- (NSArray)pluginObjectIDs
{
  unsigned int v3 = [MEMORY[0x263EFF980] array];
  unsigned int v4 = [(ASAObject *)self sizeOfMainGlobalProperty:1886152483 withQualifier:0 ofSize:0];
  unsigned int v13 = v4;
  if (v4)
  {
    size_t v5 = v4;
    uint64_t v6 = (unsigned int *)malloc_type_malloc(v4, 0xD4304762uLL);
    if (v6)
    {
      id v7 = v6;
      bzero(v6, v5);
      if ([(ASAObject *)self getMainGlobalProperty:1886152483 withData:v7 ofSize:&v13 withQualifier:0 ofSize:0]&& v13 >= 4)
      {
        unint64_t v8 = (unint64_t)v13 >> 2;
        v9 = v7;
        do
        {
          unsigned int v10 = *v9++;
          v11 = [NSNumber numberWithUnsignedLong:v10];
          [v3 addObject:v11];

          --v8;
        }
        while (v8);
      }
      free(v7);
    }
  }
  return (NSArray *)v3;
}

- (NSArray)plugins
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = [(ASACoreAudio *)self pluginObjectIDs];
  unsigned int v3 = [MEMORY[0x263EFF980] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        unsigned int v10 = [ASAPlugin alloc];
        v11 = -[ASAObject initWithAudioObjectID:](v10, "initWithAudioObjectID:", objc_msgSend(v9, "unsignedIntValue", (void)v13));
        if (v11) {
          [v3 addObject:v11];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSArray)boxObjectIDs
{
  unsigned int v3 = [MEMORY[0x263EFF980] array];
  unsigned int v4 = [(ASAObject *)self sizeOfMainGlobalProperty:1651472419 withQualifier:0 ofSize:0];
  unsigned int v13 = v4;
  if (v4)
  {
    size_t v5 = v4;
    uint64_t v6 = (unsigned int *)malloc_type_malloc(v4, 0x5E7A0054uLL);
    if (v6)
    {
      uint64_t v7 = v6;
      bzero(v6, v5);
      if ([(ASAObject *)self getMainGlobalProperty:1651472419 withData:v7 ofSize:&v13 withQualifier:0 ofSize:0]&& v13 >= 4)
      {
        unint64_t v8 = (unint64_t)v13 >> 2;
        v9 = v7;
        do
        {
          unsigned int v10 = *v9++;
          v11 = [NSNumber numberWithUnsignedLong:v10];
          [v3 addObject:v11];

          --v8;
        }
        while (v8);
      }
      free(v7);
    }
  }
  return (NSArray *)v3;
}

- (NSArray)boxes
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = [(ASACoreAudio *)self boxObjectIDs];
  unsigned int v3 = [MEMORY[0x263EFF980] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        unsigned int v10 = [ASABox alloc];
        v11 = -[ASAObject initWithAudioObjectID:](v10, "initWithAudioObjectID:", objc_msgSend(v9, "unsignedIntValue", (void)v13));
        if (v11) {
          [v3 addObject:v11];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSArray)audioDeviceObjectIDs
{
  unsigned int v3 = [MEMORY[0x263EFF980] array];
  unsigned int v4 = [(ASAObject *)self sizeOfMainGlobalProperty:1919186467 withQualifier:0 ofSize:0];
  unsigned int v13 = v4;
  if (v4)
  {
    size_t v5 = v4;
    uint64_t v6 = (unsigned int *)malloc_type_malloc(v4, 0x8B038CC0uLL);
    if (v6)
    {
      uint64_t v7 = v6;
      bzero(v6, v5);
      if ([(ASAObject *)self getMainGlobalProperty:1919186467 withData:v7 ofSize:&v13 withQualifier:0 ofSize:0]&& v13 >= 4)
      {
        unint64_t v8 = (unint64_t)v13 >> 2;
        v9 = v7;
        do
        {
          unsigned int v10 = *v9++;
          v11 = [NSNumber numberWithUnsignedLong:v10];
          [v3 addObject:v11];

          --v8;
        }
        while (v8);
      }
      free(v7);
    }
  }
  return (NSArray *)v3;
}

- (NSArray)audioDevices
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = [(ASACoreAudio *)self audioDeviceObjectIDs];
  unsigned int v3 = [MEMORY[0x263EFF980] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        unsigned int v10 = [ASAAudioDevice alloc];
        v11 = -[ASAObject initWithAudioObjectID:](v10, "initWithAudioObjectID:", objc_msgSend(v9, "unsignedIntValue", (void)v13));
        if (v11) {
          [v3 addObject:v11];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSArray)clockDeviceObjectIDs
{
  unsigned int v3 = [MEMORY[0x263EFF980] array];
  unsigned int v4 = [(ASAObject *)self sizeOfMainGlobalProperty:1668049699 withQualifier:0 ofSize:0];
  unsigned int v13 = v4;
  if (v4)
  {
    size_t v5 = v4;
    uint64_t v6 = (unsigned int *)malloc_type_malloc(v4, 0xFBAA42E2uLL);
    if (v6)
    {
      uint64_t v7 = v6;
      bzero(v6, v5);
      if ([(ASAObject *)self getMainGlobalProperty:1668049699 withData:v7 ofSize:&v13 withQualifier:0 ofSize:0]&& v13 >= 4)
      {
        unint64_t v8 = (unint64_t)v13 >> 2;
        v9 = v7;
        do
        {
          unsigned int v10 = *v9++;
          v11 = [NSNumber numberWithUnsignedLong:v10];
          [v3 addObject:v11];

          --v8;
        }
        while (v8);
      }
      free(v7);
    }
  }
  return (NSArray *)v3;
}

- (NSArray)clockDevices
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = [(ASACoreAudio *)self clockDeviceObjectIDs];
  unsigned int v3 = [MEMORY[0x263EFF980] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        unsigned int v10 = [ASAClockDevice alloc];
        v11 = -[ASAObject initWithAudioObjectID:](v10, "initWithAudioObjectID:", objc_msgSend(v9, "unsignedIntValue", (void)v13));
        if (v11) {
          [v3 addObject:v11];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v72.receiver = self;
  v72.super_class = (Class)ASACoreAudio;
  uint64_t v7 = [(ASAObject *)&v72 diagnosticDescriptionWithIndent:v6 walkTree:v4];
  v55 = [v6 stringByAppendingString:@"|        "];
  unint64_t v8 = [(ASACoreAudio *)self defaultInputAudioDevice];
  v9 = [v8 deviceUID];
  [v7 appendFormat:@"%@|    Default Input UID: %@\n", v6, v9];

  unsigned int v10 = [(ASACoreAudio *)self defaultOutputAudioDevice];
  v11 = [v10 deviceUID];
  [v7 appendFormat:@"%@|    Default Output UID: %@\n", v6, v11];

  v12 = [(ASACoreAudio *)self defaultSystemOutputAudioDevice];
  long long v13 = [v12 deviceUID];
  long long v14 = v6;
  [v7 appendFormat:@"%@|    Default System Output UID: %@\n", v6, v13];

  v52 = [(ASACoreAudio *)self boxObjectIDs];
  v53 = self;
  if ([v52 count])
  {
    [v7 appendFormat:@"%@|    Box Objects:\n", v6];
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id v15 = v52;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v68 objects:v76 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = 0;
      uint64_t v19 = *(void *)v69;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v69 != v19) {
            objc_enumerationMutation(v15);
          }
          if (v4)
          {
            v21 = -[ASAObject initWithAudioObjectID:]([ASABox alloc], "initWithAudioObjectID:", [*(id *)(*((void *)&v68 + 1) + 8 * i) unsignedIntValue]);
            v22 = [(ASABox *)v21 diagnosticDescriptionWithIndent:v55 walkTree:1];
            [v7 appendString:v22];
          }
          else
          {
            [v7 appendFormat:@"%@|        %u: %u\n", v14, v18 + i, objc_msgSend(*(id *)(*((void *)&v68 + 1) + 8 * i), "unsignedIntValue")];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v68 objects:v76 count:16];
        uint64_t v18 = (v18 + i);
      }
      while (v17);
    }

    self = v53;
  }
  v51 = [(ASACoreAudio *)self audioDeviceObjectIDs];
  if ([v51 count])
  {
    [v7 appendFormat:@"%@|    Device Objects:\n", v14];
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v23 = v51;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v64 objects:v75 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = 0;
      uint64_t v27 = *(void *)v65;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v65 != v27) {
            objc_enumerationMutation(v23);
          }
          if (v4)
          {
            v29 = -[ASAObject initWithAudioObjectID:]([ASAAudioDevice alloc], "initWithAudioObjectID:", [*(id *)(*((void *)&v64 + 1) + 8 * j) unsignedIntValue]);
            v30 = [(ASAAudioDevice *)v29 diagnosticDescriptionWithIndent:v55 walkTree:1];
            [v7 appendString:v30];
          }
          else
          {
            [v7 appendFormat:@"%@|        %u: %u\n", v14, v26 + j, objc_msgSend(*(id *)(*((void *)&v64 + 1) + 8 * j), "unsignedIntValue")];
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v64 objects:v75 count:16];
        uint64_t v26 = (v26 + j);
      }
      while (v25);
    }

    self = v53;
  }
  v31 = [(ASACoreAudio *)self clockDeviceObjectIDs];
  v50 = v31;
  if ([v31 count])
  {
    [v7 appendFormat:@"%@|    Clock Device Objects:\n", v14];
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v32 = v31;
    uint64_t v33 = [v32 countByEnumeratingWithState:&v60 objects:v74 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = 0;
      uint64_t v36 = *(void *)v61;
      do
      {
        for (uint64_t k = 0; k != v34; ++k)
        {
          if (*(void *)v61 != v36) {
            objc_enumerationMutation(v32);
          }
          if (v4)
          {
            v38 = -[ASAObject initWithAudioObjectID:]([ASAClockDevice alloc], "initWithAudioObjectID:", [*(id *)(*((void *)&v60 + 1) + 8 * k) unsignedIntValue]);
            v39 = [(ASAClockDevice *)v38 diagnosticDescriptionWithIndent:v55 walkTree:1];
            [v7 appendString:v39];
          }
          else
          {
            [v7 appendFormat:@"%@|        %u: %u\n", v14, v35 + k, objc_msgSend(*(id *)(*((void *)&v60 + 1) + 8 * k), "unsignedIntValue")];
          }
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v60 objects:v74 count:16];
        uint64_t v35 = (v35 + k);
      }
      while (v34);
    }

    self = v53;
    v31 = v50;
  }
  v40 = [(ASACoreAudio *)self pluginObjectIDs];
  if ([v40 count])
  {
    [v7 appendFormat:@"%@|    Plugin Objects:\n", v14];
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    v54 = v40;
    id v41 = v40;
    uint64_t v42 = [v41 countByEnumeratingWithState:&v56 objects:v73 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = 0;
      uint64_t v45 = *(void *)v57;
      do
      {
        for (uint64_t m = 0; m != v43; ++m)
        {
          if (*(void *)v57 != v45) {
            objc_enumerationMutation(v41);
          }
          if (v4)
          {
            v47 = -[ASAObject initWithAudioObjectID:]([ASAPlugin alloc], "initWithAudioObjectID:", [*(id *)(*((void *)&v56 + 1) + 8 * m) unsignedIntValue]);
            v48 = [(ASAPlugin *)v47 diagnosticDescriptionWithIndent:v55 walkTree:1];
            [v7 appendString:v48];
          }
          else
          {
            [v7 appendFormat:@"%@|        %u: %u\n", v14, v44 + m, objc_msgSend(*(id *)(*((void *)&v56 + 1) + 8 * m), "unsignedIntValue")];
          }
        }
        uint64_t v43 = [v41 countByEnumeratingWithState:&v56 objects:v73 count:16];
        uint64_t v44 = (v44 + m);
      }
      while (v43);
    }

    v31 = v50;
    v40 = v54;
  }

  return v7;
}

- (id)coreAudioClassName
{
  return @"CoreAudio";
}

- (void)dealloc
{
  [(ASACoreAudio *)self _teardownDeathSource];
  v3.receiver = self;
  v3.super_class = (Class)ASACoreAudio;
  [(ASACoreAudio *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plugins, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_deathSource, 0);
}

@end