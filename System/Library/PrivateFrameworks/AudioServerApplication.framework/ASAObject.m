@interface ASAObject
- (ASAObject)init;
- (ASAObject)initWithAudioObjectID:(unsigned int)a3;
- (BOOL)getGlobalProperty:(unsigned int)a3 ofElement:(unsigned int)a4 withData:(void *)a5 ofSize:(unsigned int *)a6 withQualifier:(void *)a7 ofSize:(unsigned int)a8;
- (BOOL)getInputProperty:(unsigned int)a3 ofElement:(unsigned int)a4 withData:(void *)a5 ofSize:(unsigned int *)a6 withQualifier:(void *)a7 ofSize:(unsigned int)a8;
- (BOOL)getMainGlobalProperty:(unsigned int)a3 withData:(void *)a4 ofSize:(unsigned int *)a5 withQualifier:(void *)a6 ofSize:(unsigned int)a7;
- (BOOL)getMainInputProperty:(unsigned int)a3 withData:(void *)a4 ofSize:(unsigned int *)a5 withQualifier:(void *)a6 ofSize:(unsigned int)a7;
- (BOOL)getMainOutputProperty:(unsigned int)a3 withData:(void *)a4 ofSize:(unsigned int *)a5 withQualifier:(void *)a6 ofSize:(unsigned int)a7;
- (BOOL)getOutputProperty:(unsigned int)a3 ofElement:(unsigned int)a4 withData:(void *)a5 ofSize:(unsigned int *)a6 withQualifier:(void *)a7 ofSize:(unsigned int)a8;
- (BOOL)getProperty:(unsigned int)a3 scope:(unsigned int)a4 ofElement:(unsigned int)a5 withData:(void *)a6 ofSize:(unsigned int *)a7 withQualifier:(void *)a8 ofSize:(unsigned int)inQualifierDataSize;
- (BOOL)hasGlobalProperty:(unsigned int)a3 ofElement:(unsigned int)a4;
- (BOOL)hasInputProperty:(unsigned int)a3 ofElement:(unsigned int)a4;
- (BOOL)hasMainGlobalProperty:(unsigned int)a3;
- (BOOL)hasMainInputProperty:(unsigned int)a3;
- (BOOL)hasMainOutputProperty:(unsigned int)a3;
- (BOOL)hasOutputProperty:(unsigned int)a3 ofElement:(unsigned int)a4;
- (BOOL)hasProperty:(unsigned int)a3 scope:(unsigned int)a4 ofElement:(unsigned int)a5;
- (BOOL)isGlobalPropertySettable:(unsigned int)a3 ofElement:(unsigned int)a4;
- (BOOL)isInputPropertySettable:(unsigned int)a3 ofElement:(unsigned int)a4;
- (BOOL)isMainGlobalPropertySettable:(unsigned int)a3;
- (BOOL)isMainInputPropertySettable:(unsigned int)a3;
- (BOOL)isMainOutputPropertySettable:(unsigned int)a3;
- (BOOL)isOutputPropertySettable:(unsigned int)a3 ofElement:(unsigned int)a4;
- (BOOL)isPropertySettable:(unsigned int)a3 scope:(unsigned int)a4 ofElement:(unsigned int)a5;
- (BOOL)onQueue:(id)a3 forGlobalProperty:(unsigned int)a4 ofElement:(unsigned int)a5 addListener:(id)a6;
- (BOOL)onQueue:(id)a3 forGlobalProperty:(unsigned int)a4 ofElement:(unsigned int)a5 removeListener:(id)a6;
- (BOOL)onQueue:(id)a3 forInputProperty:(unsigned int)a4 ofElement:(unsigned int)a5 addListener:(id)a6;
- (BOOL)onQueue:(id)a3 forInputProperty:(unsigned int)a4 ofElement:(unsigned int)a5 removeListener:(id)a6;
- (BOOL)onQueue:(id)a3 forMainGlobalProperty:(unsigned int)a4 addListener:(id)a5;
- (BOOL)onQueue:(id)a3 forMainGlobalProperty:(unsigned int)a4 removeListener:(id)a5;
- (BOOL)onQueue:(id)a3 forMainInputProperty:(unsigned int)a4 addListener:(id)a5;
- (BOOL)onQueue:(id)a3 forMainInputProperty:(unsigned int)a4 removeListener:(id)a5;
- (BOOL)onQueue:(id)a3 forMainOutputProperty:(unsigned int)a4 addListener:(id)a5;
- (BOOL)onQueue:(id)a3 forMainOutputProperty:(unsigned int)a4 removeListener:(id)a5;
- (BOOL)onQueue:(id)a3 forOutputProperty:(unsigned int)a4 ofElement:(unsigned int)a5 addListener:(id)a6;
- (BOOL)onQueue:(id)a3 forOutputProperty:(unsigned int)a4 ofElement:(unsigned int)a5 removeListener:(id)a6;
- (BOOL)onQueue:(id)a3 forProperty:(unsigned int)a4 scope:(unsigned int)a5 ofElement:(unsigned int)a6 addListener:(id)a7;
- (BOOL)onQueue:(id)a3 forProperty:(unsigned int)a4 scope:(unsigned int)a5 ofElement:(unsigned int)a6 removeListener:(id)a7;
- (BOOL)setGlobalProperty:(unsigned int)a3 ofElement:(unsigned int)a4 withData:(void *)a5 ofSize:(unsigned int)a6 withQualifier:(void *)a7 ofSize:(unsigned int)a8;
- (BOOL)setInputProperty:(unsigned int)a3 ofElement:(unsigned int)a4 withData:(void *)a5 ofSize:(unsigned int)a6 withQualifier:(void *)a7 ofSize:(unsigned int)a8;
- (BOOL)setMainGlobalProperty:(unsigned int)a3 withData:(void *)a4 ofSize:(unsigned int)a5 withQualifier:(void *)a6 ofSize:(unsigned int)a7;
- (BOOL)setMainInputProperty:(unsigned int)a3 withData:(void *)a4 ofSize:(unsigned int)a5 withQualifier:(void *)a6 ofSize:(unsigned int)a7;
- (BOOL)setMainOutputProperty:(unsigned int)a3 withData:(void *)a4 ofSize:(unsigned int)a5 withQualifier:(void *)a6 ofSize:(unsigned int)a7;
- (BOOL)setOutputProperty:(unsigned int)a3 ofElement:(unsigned int)a4 withData:(void *)a5 ofSize:(unsigned int)a6 withQualifier:(void *)a7 ofSize:(unsigned int)a8;
- (BOOL)setProperty:(unsigned int)a3 scope:(unsigned int)a4 ofElement:(unsigned int)a5 withData:(void *)a6 ofSize:(unsigned int)a7 withQualifier:(void *)a8 ofSize:(unsigned int)a9;
- (NSArray)ownedObjectIDs;
- (id)coreAudioClassName;
- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4;
- (unsigned)baseClass;
- (unsigned)objectClass;
- (unsigned)objectID;
- (unsigned)ownerID;
- (unsigned)sizeOfGlobalProperty:(unsigned int)a3 ofElement:(unsigned int)a4 withQualifier:(void *)a5 ofSize:(unsigned int)a6;
- (unsigned)sizeOfInputProperty:(unsigned int)a3 ofElement:(unsigned int)a4 withQualifier:(void *)a5 ofSize:(unsigned int)a6;
- (unsigned)sizeOfMainGlobalProperty:(unsigned int)a3 withQualifier:(void *)a4 ofSize:(unsigned int)a5;
- (unsigned)sizeOfMainInputProperty:(unsigned int)a3 withQualifier:(void *)a4 ofSize:(unsigned int)a5;
- (unsigned)sizeOfMainOutputProperty:(unsigned int)a3 withQualifier:(void *)a4 ofSize:(unsigned int)a5;
- (unsigned)sizeOfOutputProperty:(unsigned int)a3 ofElement:(unsigned int)a4 withQualifier:(void *)a5 ofSize:(unsigned int)a6;
- (unsigned)sizeOfProperty:(unsigned int)a3 scope:(unsigned int)a4 ofElement:(unsigned int)a5 withQualifier:(void *)a6 ofSize:(unsigned int)a7;
@end

@implementation ASAObject

- (ASAObject)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = [NSString stringWithUTF8String:"-[ASAObject init]"];
  [v3 raise:v4, @"Do not call %@", v5 format];

  return 0;
}

- (ASAObject)initWithAudioObjectID:(unsigned int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ASAObject;
  result = [(ASAObject *)&v5 init];
  if (result)
  {
    if (a3)
    {
      result->_objectID = a3;
    }
    else
    {

      return 0;
    }
  }
  return result;
}

- (BOOL)hasProperty:(unsigned int)a3 scope:(unsigned int)a4 ofElement:(unsigned int)a5
{
  inAddress.mSelector = a3;
  inAddress.mScope = a4;
  inAddress.mElement = a5;
  return AudioObjectHasProperty(self->_objectID, &inAddress) != 0;
}

- (BOOL)hasInputProperty:(unsigned int)a3 ofElement:(unsigned int)a4
{
  return [(ASAObject *)self hasProperty:*(void *)&a3 scope:1768845428 ofElement:*(void *)&a4];
}

- (BOOL)hasMainInputProperty:(unsigned int)a3
{
  return [(ASAObject *)self hasProperty:*(void *)&a3 scope:1768845428 ofElement:0];
}

- (BOOL)hasOutputProperty:(unsigned int)a3 ofElement:(unsigned int)a4
{
  return [(ASAObject *)self hasProperty:*(void *)&a3 scope:1869968496 ofElement:*(void *)&a4];
}

- (BOOL)hasMainOutputProperty:(unsigned int)a3
{
  return [(ASAObject *)self hasProperty:*(void *)&a3 scope:1869968496 ofElement:0];
}

- (BOOL)hasGlobalProperty:(unsigned int)a3 ofElement:(unsigned int)a4
{
  return [(ASAObject *)self hasProperty:*(void *)&a3 scope:1735159650 ofElement:*(void *)&a4];
}

- (BOOL)hasMainGlobalProperty:(unsigned int)a3
{
  return [(ASAObject *)self hasProperty:*(void *)&a3 scope:1735159650 ofElement:0];
}

- (unsigned)sizeOfProperty:(unsigned int)a3 scope:(unsigned int)a4 ofElement:(unsigned int)a5 withQualifier:(void *)a6 ofSize:(unsigned int)a7
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v16.mElement = a5;
  UInt32 outDataSize = 0;
  v16.mSelector = a3;
  v16.mScope = a4;
  unsigned int result = AudioObjectHasProperty(self->_objectID, &v16);
  if (result)
  {
    OSStatus PropertyDataSize = AudioObjectGetPropertyDataSize(self->_objectID, &v16, a7, a6, &outDataSize);
    if (PropertyDataSize) {
      UInt32 outDataSize = 0;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      unsigned int objectID = self->_objectID;
      *(_DWORD *)buf = 67110144;
      unsigned int v19 = objectID;
      __int16 v20 = 1024;
      unsigned int v21 = a3;
      __int16 v22 = 1024;
      unsigned int v23 = a4;
      __int16 v24 = 1024;
      unsigned int v25 = a5;
      __int16 v26 = 1024;
      OSStatus v27 = PropertyDataSize;
      _os_log_debug_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "object %u sizeOfProperty {%u, %u, %u} returned status %u", buf, 0x20u);
    }
    return outDataSize;
  }
  return result;
}

- (unsigned)sizeOfInputProperty:(unsigned int)a3 ofElement:(unsigned int)a4 withQualifier:(void *)a5 ofSize:(unsigned int)a6
{
  return [(ASAObject *)self sizeOfProperty:*(void *)&a3 scope:1768845428 ofElement:*(void *)&a4 withQualifier:a5 ofSize:*(void *)&a6];
}

- (unsigned)sizeOfMainInputProperty:(unsigned int)a3 withQualifier:(void *)a4 ofSize:(unsigned int)a5
{
  return [(ASAObject *)self sizeOfProperty:*(void *)&a3 scope:1768845428 ofElement:0 withQualifier:a4 ofSize:*(void *)&a5];
}

- (unsigned)sizeOfOutputProperty:(unsigned int)a3 ofElement:(unsigned int)a4 withQualifier:(void *)a5 ofSize:(unsigned int)a6
{
  return [(ASAObject *)self sizeOfProperty:*(void *)&a3 scope:1869968496 ofElement:*(void *)&a4 withQualifier:a5 ofSize:*(void *)&a6];
}

- (unsigned)sizeOfMainOutputProperty:(unsigned int)a3 withQualifier:(void *)a4 ofSize:(unsigned int)a5
{
  return [(ASAObject *)self sizeOfProperty:*(void *)&a3 scope:1869968496 ofElement:0 withQualifier:a4 ofSize:*(void *)&a5];
}

- (unsigned)sizeOfGlobalProperty:(unsigned int)a3 ofElement:(unsigned int)a4 withQualifier:(void *)a5 ofSize:(unsigned int)a6
{
  return [(ASAObject *)self sizeOfProperty:*(void *)&a3 scope:1735159650 ofElement:*(void *)&a4 withQualifier:a5 ofSize:*(void *)&a6];
}

- (unsigned)sizeOfMainGlobalProperty:(unsigned int)a3 withQualifier:(void *)a4 ofSize:(unsigned int)a5
{
  return [(ASAObject *)self sizeOfProperty:*(void *)&a3 scope:1735159650 ofElement:0 withQualifier:a4 ofSize:*(void *)&a5];
}

- (BOOL)getProperty:(unsigned int)a3 scope:(unsigned int)a4 ofElement:(unsigned int)a5 withData:(void *)a6 ofSize:(unsigned int *)a7 withQualifier:(void *)a8 ofSize:(unsigned int)inQualifierDataSize
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  inAddress.mSelector = a3;
  inAddress.mScope = a4;
  inAddress.mElement = a5;
  if (AudioObjectHasProperty(self->_objectID, &inAddress))
  {
    OSStatus PropertyData = AudioObjectGetPropertyData(self->_objectID, &inAddress, inQualifierDataSize, a8, a7, a6);
    BOOL v17 = PropertyData == 0;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      unsigned int objectID = self->_objectID;
      *(_DWORD *)buf = 67110144;
      unsigned int v22 = objectID;
      __int16 v23 = 1024;
      unsigned int v24 = a3;
      __int16 v25 = 1024;
      unsigned int v26 = a4;
      __int16 v27 = 1024;
      unsigned int v28 = a5;
      __int16 v29 = 1024;
      OSStatus v30 = PropertyData;
      _os_log_debug_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "object %u getProperty {%u, %u, %u} returned status %u", buf, 0x20u);
    }
  }
  else
  {
    BOOL v17 = 0;
    if (a6 && a7)
    {
      bzero(a6, *a7);
      return 0;
    }
  }
  return v17;
}

- (BOOL)getInputProperty:(unsigned int)a3 ofElement:(unsigned int)a4 withData:(void *)a5 ofSize:(unsigned int *)a6 withQualifier:(void *)a7 ofSize:(unsigned int)a8
{
  LODWORD(v9) = a8;
  return [(ASAObject *)self getProperty:*(void *)&a3 scope:1768845428 ofElement:*(void *)&a4 withData:a5 ofSize:a6 withQualifier:a7 ofSize:v9];
}

- (BOOL)getMainInputProperty:(unsigned int)a3 withData:(void *)a4 ofSize:(unsigned int *)a5 withQualifier:(void *)a6 ofSize:(unsigned int)a7
{
  LODWORD(v8) = a7;
  return [(ASAObject *)self getProperty:*(void *)&a3 scope:1768845428 ofElement:0 withData:a4 ofSize:a5 withQualifier:a6 ofSize:v8];
}

- (BOOL)getOutputProperty:(unsigned int)a3 ofElement:(unsigned int)a4 withData:(void *)a5 ofSize:(unsigned int *)a6 withQualifier:(void *)a7 ofSize:(unsigned int)a8
{
  LODWORD(v9) = a8;
  return [(ASAObject *)self getProperty:*(void *)&a3 scope:1869968496 ofElement:*(void *)&a4 withData:a5 ofSize:a6 withQualifier:a7 ofSize:v9];
}

- (BOOL)getMainOutputProperty:(unsigned int)a3 withData:(void *)a4 ofSize:(unsigned int *)a5 withQualifier:(void *)a6 ofSize:(unsigned int)a7
{
  LODWORD(v8) = a7;
  return [(ASAObject *)self getProperty:*(void *)&a3 scope:1869968496 ofElement:0 withData:a4 ofSize:a5 withQualifier:a6 ofSize:v8];
}

- (BOOL)getGlobalProperty:(unsigned int)a3 ofElement:(unsigned int)a4 withData:(void *)a5 ofSize:(unsigned int *)a6 withQualifier:(void *)a7 ofSize:(unsigned int)a8
{
  LODWORD(v9) = a8;
  return [(ASAObject *)self getProperty:*(void *)&a3 scope:1735159650 ofElement:*(void *)&a4 withData:a5 ofSize:a6 withQualifier:a7 ofSize:v9];
}

- (BOOL)getMainGlobalProperty:(unsigned int)a3 withData:(void *)a4 ofSize:(unsigned int *)a5 withQualifier:(void *)a6 ofSize:(unsigned int)a7
{
  LODWORD(v8) = a7;
  return [(ASAObject *)self getProperty:*(void *)&a3 scope:1735159650 ofElement:0 withData:a4 ofSize:a5 withQualifier:a6 ofSize:v8];
}

- (BOOL)setProperty:(unsigned int)a3 scope:(unsigned int)a4 ofElement:(unsigned int)a5 withData:(void *)a6 ofSize:(unsigned int)a7 withQualifier:(void *)a8 ofSize:(unsigned int)a9
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  inAddress.mSelector = a3;
  inAddress.mScope = a4;
  inAddress.mElement = a5;
  if (!AudioObjectHasProperty(self->_objectID, &inAddress)) {
    return 0;
  }
  Boolean outIsSettable = 0;
  BOOL v15 = 0;
  if (AudioObjectIsPropertySettable(self->_objectID, &inAddress, &outIsSettable)) {
    BOOL v16 = 1;
  }
  else {
    BOOL v16 = outIsSettable == 0;
  }
  if (!v16)
  {
    OSStatus v17 = AudioObjectSetPropertyData(self->_objectID, &inAddress, 0, 0, a7, a6);
    BOOL v15 = v17 == 0;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      unsigned int objectID = self->_objectID;
      *(_DWORD *)buf = 67110144;
      unsigned int v23 = objectID;
      __int16 v24 = 1024;
      unsigned int v25 = a3;
      __int16 v26 = 1024;
      unsigned int v27 = a4;
      __int16 v28 = 1024;
      unsigned int v29 = a5;
      __int16 v30 = 1024;
      OSStatus v31 = v17;
      _os_log_debug_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "object %u setProperty {%u, %u, %u} returned status %u", buf, 0x20u);
    }
  }
  return v15;
}

- (BOOL)setInputProperty:(unsigned int)a3 ofElement:(unsigned int)a4 withData:(void *)a5 ofSize:(unsigned int)a6 withQualifier:(void *)a7 ofSize:(unsigned int)a8
{
  LODWORD(v9) = a8;
  return [(ASAObject *)self setProperty:*(void *)&a3 scope:1768845428 ofElement:*(void *)&a4 withData:a5 ofSize:*(void *)&a6 withQualifier:a7 ofSize:v9];
}

- (BOOL)setMainInputProperty:(unsigned int)a3 withData:(void *)a4 ofSize:(unsigned int)a5 withQualifier:(void *)a6 ofSize:(unsigned int)a7
{
  LODWORD(v8) = a7;
  return [(ASAObject *)self setProperty:*(void *)&a3 scope:1768845428 ofElement:0 withData:a4 ofSize:*(void *)&a5 withQualifier:a6 ofSize:v8];
}

- (BOOL)setOutputProperty:(unsigned int)a3 ofElement:(unsigned int)a4 withData:(void *)a5 ofSize:(unsigned int)a6 withQualifier:(void *)a7 ofSize:(unsigned int)a8
{
  LODWORD(v9) = a8;
  return [(ASAObject *)self setProperty:*(void *)&a3 scope:1869968496 ofElement:*(void *)&a4 withData:a5 ofSize:*(void *)&a6 withQualifier:a7 ofSize:v9];
}

- (BOOL)setMainOutputProperty:(unsigned int)a3 withData:(void *)a4 ofSize:(unsigned int)a5 withQualifier:(void *)a6 ofSize:(unsigned int)a7
{
  LODWORD(v8) = a7;
  return [(ASAObject *)self setProperty:*(void *)&a3 scope:1869968496 ofElement:0 withData:a4 ofSize:*(void *)&a5 withQualifier:a6 ofSize:v8];
}

- (BOOL)setGlobalProperty:(unsigned int)a3 ofElement:(unsigned int)a4 withData:(void *)a5 ofSize:(unsigned int)a6 withQualifier:(void *)a7 ofSize:(unsigned int)a8
{
  LODWORD(v9) = a8;
  return [(ASAObject *)self setProperty:*(void *)&a3 scope:1735159650 ofElement:*(void *)&a4 withData:a5 ofSize:*(void *)&a6 withQualifier:a7 ofSize:v9];
}

- (BOOL)setMainGlobalProperty:(unsigned int)a3 withData:(void *)a4 ofSize:(unsigned int)a5 withQualifier:(void *)a6 ofSize:(unsigned int)a7
{
  LODWORD(v8) = a7;
  return [(ASAObject *)self setProperty:*(void *)&a3 scope:1735159650 ofElement:0 withData:a4 ofSize:*(void *)&a5 withQualifier:a6 ofSize:v8];
}

- (BOOL)isPropertySettable:(unsigned int)a3 scope:(unsigned int)a4 ofElement:(unsigned int)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  Boolean outIsSettable = 0;
  v14.mSelector = a3;
  v14.mScope = a4;
  v14.mElement = a5;
  if (!AudioObjectHasProperty(self->_objectID, &v14)) {
    return 0;
  }
  OSStatus IsPropertySettable = AudioObjectIsPropertySettable(self->_objectID, &v14, &outIsSettable);
  if (IsPropertySettable) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = outIsSettable == 0;
  }
  BOOL v11 = !v10;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    unsigned int objectID = self->_objectID;
    *(_DWORD *)buf = 67110144;
    unsigned int v17 = objectID;
    __int16 v18 = 1024;
    unsigned int v19 = a3;
    __int16 v20 = 1024;
    unsigned int v21 = a4;
    __int16 v22 = 1024;
    unsigned int v23 = a5;
    __int16 v24 = 1024;
    OSStatus v25 = IsPropertySettable;
    _os_log_debug_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "object %u isPropertySettable {%u, %u, %u} returned status %u", buf, 0x20u);
  }
  return v11;
}

- (BOOL)isInputPropertySettable:(unsigned int)a3 ofElement:(unsigned int)a4
{
  return [(ASAObject *)self isPropertySettable:*(void *)&a3 scope:1768845428 ofElement:*(void *)&a4];
}

- (BOOL)isMainInputPropertySettable:(unsigned int)a3
{
  return [(ASAObject *)self isPropertySettable:*(void *)&a3 scope:1768845428 ofElement:0];
}

- (BOOL)isOutputPropertySettable:(unsigned int)a3 ofElement:(unsigned int)a4
{
  return [(ASAObject *)self isPropertySettable:*(void *)&a3 scope:1869968496 ofElement:*(void *)&a4];
}

- (BOOL)isMainOutputPropertySettable:(unsigned int)a3
{
  return [(ASAObject *)self isPropertySettable:*(void *)&a3 scope:1869968496 ofElement:0];
}

- (BOOL)isGlobalPropertySettable:(unsigned int)a3 ofElement:(unsigned int)a4
{
  return [(ASAObject *)self isPropertySettable:*(void *)&a3 scope:1735159650 ofElement:*(void *)&a4];
}

- (BOOL)isMainGlobalPropertySettable:(unsigned int)a3
{
  return [(ASAObject *)self isPropertySettable:*(void *)&a3 scope:1735159650 ofElement:0];
}

- (BOOL)onQueue:(id)a3 forProperty:(unsigned int)a4 scope:(unsigned int)a5 ofElement:(unsigned int)a6 addListener:(id)a7
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v12 = a3;
  id v13 = a7;
  inAddress.mSelector = a4;
  inAddress.mScope = a5;
  inAddress.mElement = a6;
  if (a4 == 707406378 || AudioObjectHasProperty(self->_objectID, &inAddress))
  {
    OSStatus v14 = AudioObjectAddPropertyListenerBlock(self->_objectID, &inAddress, v12, v13);
    BOOL v15 = v14 == 0;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      unsigned int objectID = self->_objectID;
      *(_DWORD *)buf = 67110144;
      unsigned int v20 = objectID;
      __int16 v21 = 1024;
      unsigned int v22 = a4;
      __int16 v23 = 1024;
      unsigned int v24 = a5;
      __int16 v25 = 1024;
      unsigned int v26 = a6;
      __int16 v27 = 1024;
      OSStatus v28 = v14;
      _os_log_debug_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "object %u addListener {%u, %u, %u} returned status %u", buf, 0x20u);
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)onQueue:(id)a3 forInputProperty:(unsigned int)a4 ofElement:(unsigned int)a5 addListener:(id)a6
{
  return [(ASAObject *)self onQueue:a3 forProperty:*(void *)&a4 scope:1768845428 ofElement:*(void *)&a5 addListener:a6];
}

- (BOOL)onQueue:(id)a3 forMainInputProperty:(unsigned int)a4 addListener:(id)a5
{
  return [(ASAObject *)self onQueue:a3 forProperty:*(void *)&a4 scope:1768845428 ofElement:0 addListener:a5];
}

- (BOOL)onQueue:(id)a3 forOutputProperty:(unsigned int)a4 ofElement:(unsigned int)a5 addListener:(id)a6
{
  return [(ASAObject *)self onQueue:a3 forProperty:*(void *)&a4 scope:1869968496 ofElement:*(void *)&a5 addListener:a6];
}

- (BOOL)onQueue:(id)a3 forMainOutputProperty:(unsigned int)a4 addListener:(id)a5
{
  return [(ASAObject *)self onQueue:a3 forProperty:*(void *)&a4 scope:1869968496 ofElement:0 addListener:a5];
}

- (BOOL)onQueue:(id)a3 forGlobalProperty:(unsigned int)a4 ofElement:(unsigned int)a5 addListener:(id)a6
{
  return [(ASAObject *)self onQueue:a3 forProperty:*(void *)&a4 scope:1735159650 ofElement:*(void *)&a5 addListener:a6];
}

- (BOOL)onQueue:(id)a3 forMainGlobalProperty:(unsigned int)a4 addListener:(id)a5
{
  return [(ASAObject *)self onQueue:a3 forProperty:*(void *)&a4 scope:1735159650 ofElement:0 addListener:a5];
}

- (BOOL)onQueue:(id)a3 forProperty:(unsigned int)a4 scope:(unsigned int)a5 ofElement:(unsigned int)a6 removeListener:(id)a7
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v12 = a3;
  id v13 = a7;
  inAddress.mSelector = a4;
  inAddress.mScope = a5;
  inAddress.mElement = a6;
  if (a4 == 707406378 || AudioObjectHasProperty(self->_objectID, &inAddress))
  {
    OSStatus v14 = AudioObjectRemovePropertyListenerBlock(self->_objectID, &inAddress, v12, v13);
    BOOL v15 = v14 == 0;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      unsigned int objectID = self->_objectID;
      *(_DWORD *)buf = 67110144;
      unsigned int v20 = objectID;
      __int16 v21 = 1024;
      unsigned int v22 = a4;
      __int16 v23 = 1024;
      unsigned int v24 = a5;
      __int16 v25 = 1024;
      unsigned int v26 = a6;
      __int16 v27 = 1024;
      OSStatus v28 = v14;
      _os_log_debug_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "object %u removeListener {%u, %u, %u} returned status %u", buf, 0x20u);
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)onQueue:(id)a3 forInputProperty:(unsigned int)a4 ofElement:(unsigned int)a5 removeListener:(id)a6
{
  return [(ASAObject *)self onQueue:a3 forProperty:*(void *)&a4 scope:1768845428 ofElement:*(void *)&a5 removeListener:a6];
}

- (BOOL)onQueue:(id)a3 forMainInputProperty:(unsigned int)a4 removeListener:(id)a5
{
  return [(ASAObject *)self onQueue:a3 forProperty:*(void *)&a4 scope:1768845428 ofElement:0 removeListener:a5];
}

- (BOOL)onQueue:(id)a3 forOutputProperty:(unsigned int)a4 ofElement:(unsigned int)a5 removeListener:(id)a6
{
  return [(ASAObject *)self onQueue:a3 forProperty:*(void *)&a4 scope:1869968496 ofElement:*(void *)&a5 removeListener:a6];
}

- (BOOL)onQueue:(id)a3 forMainOutputProperty:(unsigned int)a4 removeListener:(id)a5
{
  return [(ASAObject *)self onQueue:a3 forProperty:*(void *)&a4 scope:1869968496 ofElement:0 removeListener:a5];
}

- (BOOL)onQueue:(id)a3 forGlobalProperty:(unsigned int)a4 ofElement:(unsigned int)a5 removeListener:(id)a6
{
  return [(ASAObject *)self onQueue:a3 forProperty:*(void *)&a4 scope:1735159650 ofElement:*(void *)&a5 removeListener:a6];
}

- (BOOL)onQueue:(id)a3 forMainGlobalProperty:(unsigned int)a4 removeListener:(id)a5
{
  return [(ASAObject *)self onQueue:a3 forProperty:*(void *)&a4 scope:1735159650 ofElement:0 removeListener:a5];
}

- (unsigned)baseClass
{
  int v5 = 4;
  unsigned int v4 = 0;
  if (![(ASAObject *)self getMainGlobalProperty:1650682995 withData:&v4 ofSize:&v5 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read base class property\n", v3, 2u);
  }
  return v4;
}

- (unsigned)objectClass
{
  int v5 = 4;
  unsigned int v4 = 0;
  if (![(ASAObject *)self getMainGlobalProperty:1668047219 withData:&v4 ofSize:&v5 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read object class property\n", v3, 2u);
  }
  return v4;
}

- (unsigned)ownerID
{
  int v5 = 4;
  unsigned int v4 = 0;
  if (![(ASAObject *)self getMainGlobalProperty:1937007734 withData:&v4 ofSize:&v5 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read object owner property\n", v3, 2u);
  }
  return v4;
}

- (NSArray)ownedObjectIDs
{
  unsigned int v3 = [(ASAObject *)self sizeOfMainGlobalProperty:1870098020 withQualifier:0 ofSize:0];
  unsigned int v15 = v3;
  if (v3 && (size_t v4 = v3, (v5 = (unsigned int *)malloc_type_malloc(v3, 0xB45735F4uLL)) != 0))
  {
    v6 = v5;
    bzero(v5, v4);
    BOOL v7 = [(ASAObject *)self getMainGlobalProperty:1870098020 withData:v6 ofSize:&v15 withQualifier:0 ofSize:0];
    uint64_t v8 = 0;
    if (v7)
    {
      unint64_t v9 = v15;
      uint64_t v8 = [MEMORY[0x263EFF980] array];
      if (v9 >= 4)
      {
        unint64_t v10 = v9 >> 2;
        BOOL v11 = v6;
        do
        {
          unsigned int v12 = *v11++;
          id v13 = [NSNumber numberWithUnsignedLong:v12];
          [v8 addObject:v13];

          --v10;
        }
        while (v10);
      }
    }
    free(v6);
  }
  else
  {
    uint64_t v8 = 0;
  }
  return (NSArray *)v8;
}

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [MEMORY[0x263F089D8] string];
  id v7 = [(ASAObject *)self coreAudioClassName];
  [v6 appendFormat:@"%@+%s\n", v5, objc_msgSend(v7, "UTF8String")];

  [v6 appendFormat:@"%@|    Object ID: %u\n", v5, -[ASAObject objectID](self, "objectID")];
  int v8 = [(ASAObject *)self baseClass];
  LODWORD(v9) = v8 >> 24;
  if ((v8 - 0x20000000) >> 24 >= 0x5F) {
    uint64_t v9 = 32;
  }
  else {
    uint64_t v9 = v9;
  }
  LODWORD(v10) = v8 << 8 >> 24;
  if (((v8 << 8) - 0x20000000) >> 24 >= 0x5F) {
    uint64_t v10 = 32;
  }
  else {
    uint64_t v10 = v10;
  }
  LODWORD(v11) = (__int16)v8 >> 8;
  if (((v8 << 16) - 0x20000000) >> 24 >= 0x5F) {
    uint64_t v11 = 32;
  }
  else {
    uint64_t v11 = v11;
  }
  if (v8 << 24 == 2130706432 || v8 << 24 < 520093697) {
    uint64_t v13 = 32;
  }
  else {
    uint64_t v13 = (char)v8;
  }
  [v6 appendFormat:@"%@|    Base Class: %c%c%c%c\n", v5, v9, v10, v11, v13];
  int v14 = [(ASAObject *)self objectClass];
  LODWORD(v15) = v14 >> 24;
  if ((v14 - 0x20000000) >> 24 >= 0x5F) {
    uint64_t v15 = 32;
  }
  else {
    uint64_t v15 = v15;
  }
  LODWORD(v16) = v14 << 8 >> 24;
  if (((v14 << 8) - 0x20000000) >> 24 >= 0x5F) {
    uint64_t v16 = 32;
  }
  else {
    uint64_t v16 = v16;
  }
  LODWORD(v17) = (__int16)v14 >> 8;
  if (((v14 << 16) - 0x20000000) >> 24 >= 0x5F) {
    uint64_t v17 = 32;
  }
  else {
    uint64_t v17 = v17;
  }
  if (v14 << 24 == 2130706432 || v14 << 24 < 520093697) {
    uint64_t v19 = 32;
  }
  else {
    uint64_t v19 = (char)v14;
  }
  [v6 appendFormat:@"%@|    Object Class: %c%c%c%c\n", v5, v15, v16, v17, v19];
  [v6 appendFormat:@"%@|    Owner ID: %u\n", v5, -[ASAObject ownerID](self, "ownerID")];
  unsigned int v20 = [(ASAObject *)self ownedObjectIDs];
  if ([v20 count])
  {
    [v6 appendFormat:@"%@|    Owned Objects:\n", v5];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v21 = v20;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = 0;
      uint64_t v25 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v29 != v25) {
            objc_enumerationMutation(v21);
          }
          [v6 appendFormat:@"%@|        %u: %u\n", v5, v24 + i, objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "unsignedIntValue")];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v28 objects:v32 count:16];
        uint64_t v24 = (v24 + i);
      }
      while (v23);
    }
  }
  return v6;
}

- (id)coreAudioClassName
{
  return @"AudioObject";
}

- (unsigned)objectID
{
  return self->_objectID;
}

@end