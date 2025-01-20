@interface CoreCECBus
+ (BOOL)supportsSecureCoding;
- (BOOL)hasLink;
- (BOOL)setOSDName:(id)a3 error:(id *)a4;
- (BOOL)setTvLanguageCode:(id)a3 error:(id *)a4;
- (CECLanguage)tvLanguageCodeASCII;
- (CECOSDName)osdNameASCII;
- (CoreCECBus)init;
- (CoreCECBus)initWithBus:(id)a3;
- (CoreCECBus)initWithCoder:(id)a3;
- (CoreCECBus)initWithLinkState:(BOOL)a3 physicalAddress:(unint64_t)a4;
- (CoreCECDevice)activeSource;
- (CoreCECPhysicalDevice)rootPhysicalDevice;
- (NSDictionary)analyticsContext;
- (NSString)osdName;
- (NSString)tvLanguageCode;
- (id)addDeviceWithAttributes:(id)a3 error:(id *)a4;
- (id)delegate;
- (id)description;
- (id)deviceOnBusWithLogicalAddress:(unsigned __int8)a3;
- (id)mergeProperties;
- (unint64_t)lastStreamPath;
- (unint64_t)physicalAddress;
- (unint64_t)streamPath;
- (unint64_t)systemAudioModeStatus;
- (void)didChangeActiveSourceFrom:(id)a3 to:(id)a4;
- (void)didChangeLinkState:(BOOL)a3 physicalAddress:(unint64_t)a4;
- (void)didUpdateProperties:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)notifyDelegateLinkStateUpdated;
- (void)removeDeviceWithType:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setHasLink:(BOOL)a3;
- (void)setLinkState:(BOOL)a3 physicalAddress:(unint64_t)a4;
- (void)setOsdNameASCII:(CECOSDName)a3;
- (void)setPhysicalAddress:(unint64_t)a3;
- (void)setStreamPath:(unint64_t)a3;
- (void)setSystemAudioModeStatus:(unint64_t)a3;
- (void)setTvLanguageCodeASCII:(CECLanguage)a3;
@end

@implementation CoreCECBus

- (NSDictionary)analyticsContext
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v3 = (NSDictionary *)[MEMORY[0x263EFF9A0] dictionary];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = [(CoreRCBus *)self devices];
  uint64_t v5 = [(NSSet *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        -[NSDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", [*(id *)(*((void *)&v10 + 1) + 8 * v8) analyticsDescription], objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8), "analyticsKey"));
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSSet *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CoreCECBus)initWithBus:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11.receiver = self;
    v11.super_class = (Class)CoreCECBus;
    uint64_t v5 = [(CoreRCBus *)&v11 initWithBus:a3];
    if (v5)
    {
      v5[48] = [a3 hasLink];
      *((void *)v5 + 11) = [a3 osdNameASCII];
      *((_DWORD *)v5 + 24) = v6;
      v5[102] = v7;
      *((_WORD *)v5 + 50) = v8;
      *((void *)v5 + 7) = [a3 physicalAddress];
      *((void *)v5 + 8) = [a3 streamPath];
      *((void *)v5 + 10) = [a3 lastStreamPath];
      uint64_t v9 = [a3 tvLanguageCodeASCII];
      *(_WORD *)(v5 + 49) = v9;
      v5[51] = BYTE2(v9);
      *((void *)v5 + 9) = [a3 systemAudioModeStatus];
    }
  }
  else
  {

    return 0;
  }
  return (CoreCECBus *)v5;
}

- (CoreCECBus)initWithLinkState:(BOOL)a3 physicalAddress:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CoreCECBus;
  result = [(CoreRCBus *)&v7 init];
  if (result)
  {
    result->_hasLink = a3;
    result->_physicalAddress = a4;
    result->_streamPath = 252645135;
    result->_lastStreamPath = 252645135;
    *(void *)&result->_osdNameASCII.characters[6] = 0;
    *(void *)&result->_osdNameASCII.length = 0;
    *(_WORD *)result->_tvLanguageCodeASCII.characters = 28277;
    result->_tvLanguageCodeASCII.characters[2] = 100;
    result->_systemAudioModeStatus = 0;
  }
  return result;
}

- (CoreCECBus)init
{
  return [(CoreCECBus *)self initWithLinkState:0 physicalAddress:252645135];
}

- (CoreCECBus)initWithCoder:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CoreCECBus;
  v4 = -[CoreRCBus initWithCoder:](&v12, sel_initWithCoder_);
  if (v4)
  {
    uint64_t v11 = 0;
    v4[48] = [a3 decodeBoolForKey:@"hasLink"];
    *((void *)v4 + 7) = [a3 decodeIntegerForKey:@"physicalAddress"];
    *((void *)v4 + 8) = [a3 decodeIntegerForKey:@"streamPath"];
    *((void *)v4 + 10) = [a3 decodeIntegerForKey:@"lastStreamPath"];
    uint64_t v5 = (uint64_t *)[a3 decodeBytesForKey:@"osdNameASCII" returnedLength:&v11];
    int v6 = v4 + 88;
    if (v5 && v11 == 15)
    {
      uint64_t v7 = *v5;
      *(void *)(v4 + 95) = *(uint64_t *)((char *)v5 + 7);
      *int v6 = v7;
    }
    else
    {
      *(void *)(v4 + 95) = 0;
      *int v6 = 0;
    }
    uint64_t v8 = [a3 decodeBytesForKey:@"tvLanguageCodeASCII" returnedLength:&v11];
    if (v8 && v11 == 3)
    {
      __int16 v9 = *(_WORD *)v8;
      v4[51] = *(unsigned char *)(v8 + 2);
    }
    else
    {
      v4[51] = 100;
      __int16 v9 = 28277;
    }
    *(_WORD *)(v4 + 49) = v9;
    *((void *)v4 + 9) = [a3 decodeIntegerForKey:@"systemAudioModeStatus"];
  }
  return (CoreCECBus *)v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CoreCECBus;
  -[CoreRCBus encodeWithCoder:](&v5, sel_encodeWithCoder_);
  [a3 encodeBool:self->_hasLink forKey:@"hasLink"];
  [a3 encodeInteger:self->_physicalAddress forKey:@"physicalAddress"];
  [a3 encodeInteger:self->_streamPath forKey:@"streamPath"];
  [a3 encodeInteger:self->_lastStreamPath forKey:@"lastStreamPath"];
  [a3 encodeBytes:&self->_osdNameASCII length:15 forKey:@"osdNameASCII"];
  [a3 encodeBytes:&self->_tvLanguageCodeASCII length:3 forKey:@"tvLanguageCodeASCII"];
  [a3 encodeInteger:self->_systemAudioModeStatus forKey:@"systemAudioModeStatus"];
}

- (id)mergeProperties
{
  return &unk_26FEDA810;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)CoreCECBus;
  v3 = objc_msgSend(objc_alloc(MEMORY[0x263F089D8]), "initWithString:", -[CoreRCBus description](&v8, sel_description));
  BOOL v4 = [(CoreCECBus *)self hasLink];
  objc_super v5 = "N";
  if (v4) {
    objc_super v5 = "Y";
  }
  objc_msgSend(v3, "appendFormat:", @" Link: %s;", v5);
  objc_msgSend(v3, "appendFormat:", @" PA: %@;",
    CoreCECPhysicalAddressString([(CoreCECBus *)self physicalAddress]));
  [v3 appendFormat:@" Name: %@;", -[CoreCECBus osdName](self, "osdName")];
  objc_msgSend(v3, "appendFormat:", @" System Audio Mode: %@;",
    CoreCECSystemAudioModeStatusString([(CoreCECBus *)self systemAudioModeStatus]));
  [v3 appendFormat:@" TV-Language: %@;", -[CoreCECBus tvLanguageCode](self, "tvLanguageCode")];
  if ([(CoreCECBus *)self streamPath] == 252645135) {
    int v6 = @"None";
  }
  else {
    int v6 = (__CFString *)CoreCECPhysicalAddressString([(CoreCECBus *)self streamPath]);
  }
  [v3 appendFormat:@" Route: %@;", v6];
  if ([(CoreCECBus *)self activeSource]) {
    objc_msgSend(v3, "appendFormat:", @" Active Source: %@;",
  }
      [(NSUUID *)[(CoreRCDevice *)[(CoreCECBus *)self activeSource] uniqueID] UUIDString]);
  return v3;
}

- (id)delegate
{
  v3.receiver = self;
  v3.super_class = (Class)CoreCECBus;
  return [(CoreRCBus *)&v3 delegate];
}

- (void)setDelegate:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CoreCECBus;
  [(CoreRCBus *)&v3 setDelegate:a3];
}

- (CoreCECDevice)activeSource
{
  objc_super v3 = [(NSSet *)[(CoreRCBus *)self devices] objectsPassingTest:&__block_literal_global_0];
  if ([(NSSet *)v3 count] >= 2
    && gLogCategory_CoreRCBus <= 90
    && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
  {
    [(CoreRCBus *)self devices];
    LogPrintF();
  }
  return (CoreCECDevice *)[(NSSet *)v3 anyObject];
}

uint64_t __26__CoreCECBus_activeSource__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isActiveSource];
}

- (NSString)osdName
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v6 = [(CoreCECBus *)self osdNameASCII];
  int v7 = v2;
  char v9 = v3;
  __int16 v8 = v4;
  return (NSString *)(id)[[NSString alloc] initWithBytes:(char *)&v6 + 1 length:v6 encoding:1];
}

- (NSString)tvLanguageCode
{
  uint64_t v2 = (uint64_t)[(CoreCECBus *)self tvLanguageCodeASCII];
  __int16 v4 = v2;
  char v5 = BYTE2(v2);
  return (NSString *)(id)[[NSString alloc] initWithBytes:&v4 length:3 encoding:1];
}

- (id)addDeviceWithAttributes:(id)a3 error:(id *)a4
{
  __int16 v4 = [[CoreCECDevice alloc] initWithBus:self local:1 logicalAddress:15 physicalAddress:[(CoreCECBus *)self physicalAddress] attributes:a3];
  return v4;
}

- (void)removeDeviceWithType:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (gLogCategory_CoreRCBus <= 40 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
  {
    unint64_t v11 = a3;
    LogPrintF();
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  char v5 = [(CoreRCBus *)self devices];
  uint64_t v6 = [(NSSet *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v10, "deviceType", v12) == a3)
        {
          v13.receiver = self;
          v13.super_class = (Class)CoreCECBus;
          [(CoreRCBus *)&v13 removeDevice:v10];
          if (gLogCategory_CoreRCBus <= 40 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
          {
            objc_super v12 = v10;
            LogPrintF();
          }
        }
      }
      uint64_t v7 = [(NSSet *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (CoreCECPhysicalDevice)rootPhysicalDevice
{
  uint64_t v2 = [(CoreRCBus *)self devices];
  return (CoreCECPhysicalDevice *)+[CoreCECPhysicalDevice physicalDeviceTreeWithLogicalDevices:v2];
}

- (void)setLinkState:(BOOL)a3 physicalAddress:(unint64_t)a4
{
  self->_hasLink = a3;
  self->_physicalAddress = a4;
  -[CoreCECBus didChangeLinkState:physicalAddress:](self, "didChangeLinkState:physicalAddress:");
}

- (BOOL)setOSDName:(id)a3 error:(id *)a4
{
  v14[2] = *MEMORY[0x263EF8340];
  memset(v14, 0, 15);
  if (gLogCategory_CoreRCBus <= 10 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
  {
    id v13 = a3;
    LogPrintF();
  }
  uint64_t v7 = objc_msgSend(a3, "dataUsingEncoding:allowLossyConversion:", 1, 0, v13, v14[0]);
  if (!v7)
  {
    uint64_t v10 = -6705;
    goto LABEL_15;
  }
  uint64_t v8 = v7;
  if ((unint64_t)[v7 length] > 0xE)
  {
    uint64_t v10 = -6743;
LABEL_15:
    uint64_t v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:v10 userInfo:0];
    if (!a4) {
      return 0;
    }
    objc_super v12 = (void *)v11;
    BOOL result = 0;
    *a4 = v12;
    return result;
  }
  LOBYTE(v14[0]) = [v8 length];
  [v8 getBytes:(char *)v14 + 1 length:14];
  -[CoreCECBus setOsdNameASCII:](self, "setOsdNameASCII:", v14[0], LODWORD(v14[1]) | ((unint64_t)(WORD2(v14[1]) | (BYTE6(v14[1]) << 16)) << 32));
  if (gLogCategory_CoreRCBus <= 10 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
  {
    [(CoreCECBus *)self osdName];
    LogPrintF();
  }
  return 1;
}

- (BOOL)setTvLanguageCode:(id)a3 error:(id *)a4
{
  if (gLogCategory_CoreRCBus <= 10 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
  {
    id v13 = a3;
    LogPrintF();
  }
  uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "lowercaseString", v13), "dataUsingEncoding:allowLossyConversion:", 1, 0);
  if (!v7)
  {
    uint64_t v10 = -6705;
    goto LABEL_15;
  }
  uint64_t v8 = v7;
  if ([v7 length] != 3)
  {
    uint64_t v10 = -6743;
LABEL_15:
    uint64_t v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:v10 userInfo:0];
    if (!a4) {
      return 0;
    }
    objc_super v12 = (void *)v11;
    BOOL result = 0;
    *a4 = v12;
    return result;
  }
  unsigned __int8 v15 = 0;
  unsigned __int16 v14 = 0;
  [v8 getBytes:&v14 length:3];
  [(CoreCECBus *)self setTvLanguageCodeASCII:v14 | ((unint64_t)v15 << 16)];
  if (gLogCategory_CoreRCBus <= 10 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
  {
    [(CoreCECBus *)self tvLanguageCode];
    LogPrintF();
  }
  return 1;
}

- (void)setStreamPath:(unint64_t)a3
{
  self->_lastStreamPath = self->_streamPath;
  self->_streamPath = a3;
}

- (id)deviceOnBusWithLogicalAddress:(unsigned __int8)a3
{
  int v3 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  __int16 v4 = [(CoreRCBus *)self devices];
  uint64_t v5 = [(NSSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(v4);
    }
    char v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if ([v9 logicalAddress] == v3
      && (![v9 isLocalDevice] || !objc_msgSend(v9, "isUnregistered")))
    {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [(NSSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (void)didChangeActiveSourceFrom:(id)a3 to:(id)a4
{
  id v7 = [(CoreCECBus *)self delegate];
  if (gLogCategory_CoreRCBus <= 10 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
  {
    objc_opt_class();
    LogPrintF();
  }
  if (objc_opt_respondsToSelector())
  {
    [v7 cecBus:self activeSourceHasChangedTo:a4 fromDevice:a3];
  }
}

- (void)didChangeLinkState:(BOOL)a3 physicalAddress:(unint64_t)a4
{
  if (gLogCategory_CoreRCBus <= 40 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(CoreCECBus *)self didUpdateProperties:&unk_26FEDA828];
}

- (void)didUpdateProperties:(id)a3
{
  if ([a3 containsObject:@"hasLink"])
  {
    if (!self->_hasLink) {
      [(CoreCECBus *)self notifyDelegateLinkStateUpdated];
    }
    v5.receiver = self;
    v5.super_class = (Class)CoreCECBus;
    [(CoreRCBus *)&v5 didUpdateProperties:a3];
    if (self->_hasLink) {
      [(CoreCECBus *)self notifyDelegateLinkStateUpdated];
    }
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CoreCECBus;
    [(CoreRCBus *)&v5 didUpdateProperties:a3];
  }
}

- (void)notifyDelegateLinkStateUpdated
{
  id v3 = [(CoreCECBus *)self delegate];
  if (gLogCategory_CoreRCBus <= 10 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
  {
    objc_opt_class();
    LogPrintF();
  }
  if (objc_opt_respondsToSelector())
  {
    BOOL v4 = [(CoreCECBus *)self hasLink];
    [v3 cecBus:self linkStateHasBeenUpdated:v4];
  }
}

- (unint64_t)physicalAddress
{
  return self->_physicalAddress;
}

- (void)setPhysicalAddress:(unint64_t)a3
{
  self->_physicalAddress = a3;
}

- (BOOL)hasLink
{
  return self->_hasLink;
}

- (void)setHasLink:(BOOL)a3
{
  self->_hasLink = a3;
}

- (unint64_t)streamPath
{
  return self->_streamPath;
}

- (unint64_t)systemAudioModeStatus
{
  return self->_systemAudioModeStatus;
}

- (void)setSystemAudioModeStatus:(unint64_t)a3
{
  self->_systemAudioModeStatus = a3;
}

- (CECOSDName)osdNameASCII
{
  p_osdNameASCII = &self->_osdNameASCII;
  uint64_t v3 = *(void *)&self->_osdNameASCII.length;
  unint64_t v4 = *(unsigned int *)&p_osdNameASCII->characters[7] | ((unint64_t)(*(unsigned __int16 *)&p_osdNameASCII->characters[11] | (p_osdNameASCII->characters[13] << 16)) << 32);
  *(_DWORD *)&result.characters[7] = v4;
  *(_WORD *)&result.characters[11] = WORD2(v4);
  result.characters[13] = BYTE6(v4);
  result.length = v3;
  *(_DWORD *)result.characters = *(_DWORD *)((char *)&v3 + 1);
  *(_WORD *)&result.characters[4] = *(_WORD *)((char *)&v3 + 5);
  result.characters[6] = HIBYTE(v3);
  return result;
}

- (void)setOsdNameASCII:(CECOSDName)a3
{
  self->_osdNameASCII = a3;
}

- (CECLanguage)tvLanguageCodeASCII
{
  return (CECLanguage)(*(unsigned __int16 *)self->_tvLanguageCodeASCII.characters | (self->_tvLanguageCodeASCII.characters[2] << 16));
}

- (void)setTvLanguageCodeASCII:(CECLanguage)a3
{
  self->_tvLanguageCodeASCII = a3;
}

- (unint64_t)lastStreamPath
{
  return self->_lastStreamPath;
}

@end