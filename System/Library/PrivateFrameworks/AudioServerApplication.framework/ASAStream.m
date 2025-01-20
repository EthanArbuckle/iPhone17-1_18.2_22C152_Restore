@interface ASAStream
- (ASAAudioFormat)physicalFormat;
- (ASAAudioFormat)virtualFormat;
- (BOOL)isActive;
- (BOOL)isInput;
- (BOOL)isOutput;
- (BOOL)isPhysicalFormatSettable;
- (BOOL)isTapStream;
- (BOOL)isVirtualFormatSettable;
- (NSArray)availablePhysicalFormats;
- (NSArray)availableVirtualFormats;
- (NSArray)controlObjectIDs;
- (NSArray)controls;
- (NSString)name;
- (id)coreAudioClassName;
- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4;
- (unsigned)latency;
- (unsigned)startingChannel;
- (unsigned)terminalType;
- (void)setName:(id)a3;
- (void)setPhysicalFormat:(id)a3;
- (void)setVirtualFormat:(id)a3;
@end

@implementation ASAStream

- (NSString)name
{
  int v6 = 8;
  CFTypeRef cf = 0;
  if ([(ASAObject *)self getMainGlobalProperty:1819173229 withData:&cf ofSize:&v6 withQualifier:0 ofSize:0])
  {
    if (cf)
    {
      v2 = objc_msgSend(NSString, "stringWithString:");
      CFRelease(cf);
      goto LABEL_7;
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read name property\n", v4, 2u);
  }
  v2 = 0;
LABEL_7:
  return (NSString *)v2;
}

- (void)setName:(id)a3
{
  id v4 = a3;
  [(ASAObject *)self setMainGlobalProperty:1819173229 withData:&v4 ofSize:8 withQualifier:0 ofSize:0];
}

- (BOOL)isActive
{
  int v5 = 4;
  int v4 = 0;
  if (![(ASAObject *)self getMainGlobalProperty:1935762292 withData:&v4 ofSize:&v5 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read is active property\n", v3, 2u);
  }
  return v4 != 0;
}

- (BOOL)isInput
{
  int v5 = 4;
  int v4 = 0;
  if (![(ASAObject *)self getMainGlobalProperty:1935960434 withData:&v4 ofSize:&v5 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read direction property\n", v3, 2u);
  }
  return v4 == 1;
}

- (BOOL)isOutput
{
  int v5 = 4;
  int v4 = 0;
  if (![(ASAObject *)self getMainGlobalProperty:1935960434 withData:&v4 ofSize:&v5 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read direction property\n", v3, 2u);
  }
  return v4 == 0;
}

- (unsigned)terminalType
{
  int v5 = 4;
  unsigned int v4 = 0;
  if (![(ASAObject *)self getMainGlobalProperty:1952805485 withData:&v4 ofSize:&v5 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read terminal type property\n", v3, 2u);
  }
  return v4;
}

- (unsigned)startingChannel
{
  int v5 = 4;
  unsigned int v4 = 0;
  if (![(ASAObject *)self getMainGlobalProperty:1935894638 withData:&v4 ofSize:&v5 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read starting channel property\n", v3, 2u);
  }
  return v4;
}

- (unsigned)latency
{
  int v5 = 4;
  unsigned int v4 = 0;
  if (![(ASAObject *)self getMainGlobalProperty:1819569763 withData:&v4 ofSize:&v5 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read latency property\n", v3, 2u);
  }
  return v4;
}

- (ASAAudioFormat)virtualFormat
{
  uint64_t v7 = 0;
  memset(v6, 0, sizeof(v6));
  int v5 = 40;
  if ([(ASAObject *)self getMainGlobalProperty:1936092532 withData:v6 ofSize:&v5 withQualifier:0 ofSize:0])
  {
    v2 = [[ASAAudioFormat alloc] initWithAudioStreamBasicDescription:v6];
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v4 = 0;
      _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read virtual format property\n", v4, 2u);
    }
    v2 = 0;
  }
  return v2;
}

- (void)setVirtualFormat:(id)a3
{
  id v4 = a3;
  if ([(ASAStream *)self isVirtualFormatSettable])
  {
    uint64_t v7 = 0;
    memset(v6, 0, sizeof(v6));
    if (v4) {
      [v4 audioStreamBasicDescription];
    }
    if (![(ASAObject *)self setMainGlobalProperty:1936092532 withData:v6 ofSize:40 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v5 = 0;
      _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not write virtual format property\n", v5, 2u);
    }
  }
}

- (BOOL)isVirtualFormatSettable
{
  return [(ASAObject *)self isMainGlobalPropertySettable:1936092532];
}

- (ASAAudioFormat)physicalFormat
{
  uint64_t v7 = 0;
  memset(v6, 0, sizeof(v6));
  int v5 = 40;
  if ([(ASAObject *)self getMainGlobalProperty:1885762592 withData:v6 ofSize:&v5 withQualifier:0 ofSize:0])
  {
    v2 = [[ASAAudioFormat alloc] initWithAudioStreamBasicDescription:v6];
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read physical format property\n", v4, 2u);
    }
    v2 = 0;
  }
  return v2;
}

- (void)setPhysicalFormat:(id)a3
{
  id v4 = a3;
  if ([(ASAStream *)self isPhysicalFormatSettable])
  {
    uint64_t v7 = 0;
    memset(v6, 0, sizeof(v6));
    if (v4) {
      [v4 audioStreamBasicDescription];
    }
    if (![(ASAObject *)self setMainGlobalProperty:1885762592 withData:v6 ofSize:40 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v5 = 0;
      _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not write physical format property\n", v5, 2u);
    }
  }
}

- (BOOL)isPhysicalFormatSettable
{
  return [(ASAObject *)self isMainGlobalPropertySettable:1885762592];
}

- (NSArray)availableVirtualFormats
{
  unsigned int v3 = [(ASAObject *)self sizeOfMainGlobalProperty:1936092513 withQualifier:0 ofSize:0];
  unsigned int v14 = v3;
  if (v3 && (size_t v4 = v3, (v5 = (char *)malloc_type_malloc(v3, 0x4257E859uLL)) != 0))
  {
    int v6 = v5;
    bzero(v5, v4);
    BOOL v7 = [(ASAObject *)self getMainGlobalProperty:1936092513 withData:v6 ofSize:&v14 withQualifier:0 ofSize:0];
    v8 = 0;
    if (v7)
    {
      unsigned int v9 = v14;
      v8 = [MEMORY[0x263EFF980] array];
      if (v9 >= 0x38)
      {
        unint64_t v10 = v9 / 0x38uLL;
        v11 = v6;
        do
        {
          v12 = [[ASAAudioFormat alloc] initWithAudioStreamRangedDescription:v11];
          [v8 addObject:v12];

          v11 += 56;
          --v10;
        }
        while (v10);
      }
    }
    free(v6);
  }
  else
  {
    v8 = 0;
  }
  return (NSArray *)v8;
}

- (NSArray)availablePhysicalFormats
{
  unsigned int v3 = [(ASAObject *)self sizeOfMainGlobalProperty:1885762657 withQualifier:0 ofSize:0];
  unsigned int v14 = v3;
  if (v3 && (size_t v4 = v3, (v5 = (char *)malloc_type_malloc(v3, 0x1F09D0DuLL)) != 0))
  {
    int v6 = v5;
    bzero(v5, v4);
    BOOL v7 = [(ASAObject *)self getMainGlobalProperty:1885762657 withData:v6 ofSize:&v14 withQualifier:0 ofSize:0];
    v8 = 0;
    if (v7)
    {
      unsigned int v9 = v14;
      v8 = [MEMORY[0x263EFF980] array];
      if (v9 >= 0x38)
      {
        unint64_t v10 = v9 / 0x38uLL;
        v11 = v6;
        do
        {
          v12 = [[ASAAudioFormat alloc] initWithAudioStreamRangedDescription:v11];
          [v8 addObject:v12];

          v11 += 56;
          --v10;
        }
        while (v10);
      }
    }
    free(v6);
  }
  else
  {
    v8 = 0;
  }
  return (NSArray *)v8;
}

- (NSArray)controlObjectIDs
{
  unsigned int v3 = [MEMORY[0x263EFF980] array];
  unsigned int v4 = [(ASAObject *)self sizeOfMainGlobalProperty:1668575852 withQualifier:0 ofSize:0];
  unsigned int v15 = v4;
  if (v4)
  {
    size_t v5 = v4;
    int v6 = (unsigned int *)malloc_type_malloc(v4, 0x9039FFEAuLL);
    if (v6)
    {
      BOOL v7 = v6;
      bzero(v6, v5);
      if ([(ASAObject *)self getMainGlobalProperty:1668575852 withData:v7 ofSize:&v15 withQualifier:0 ofSize:0])
      {
        unint64_t v8 = v15;
        unsigned int v9 = [MEMORY[0x263EFF980] array];

        if (v8 >= 4)
        {
          unint64_t v10 = v8 >> 2;
          v11 = v7;
          do
          {
            unsigned int v12 = *v11++;
            v13 = [NSNumber numberWithUnsignedLong:v12];
            [v9 addObject:v13];

            --v10;
          }
          while (v10);
        }
        unsigned int v3 = v9;
      }
      free(v7);
    }
  }
  return (NSArray *)v3;
}

- (NSArray)controls
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2 = [(ASAStream *)self controlObjectIDs];
  unsigned int v3 = [MEMORY[0x263EFF980] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        unsigned int v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        unint64_t v10 = [ASAObject alloc];
        v11 = -[ASAObject initWithAudioObjectID:](v10, "initWithAudioObjectID:", objc_msgSend(v9, "unsignedIntValue", (void)v16));
        int v12 = [(ASAObject *)v11 baseClass];
        if (v12 > 1936483441)
        {
          if (v12 != 1936483442)
          {
            v13 = off_26484CF88;
            if (v12 == 1953458028) {
              goto LABEL_15;
            }
            goto LABEL_12;
          }
          v13 = off_26484CFD0;
        }
        else
        {
          if (v12 != 1818588780)
          {
            if (v12 == 1936483188)
            {
              v13 = off_26484CFC8;
              goto LABEL_15;
            }
LABEL_12:
            v13 = off_26484CFA0;
            goto LABEL_15;
          }
          v13 = off_26484CFB0;
        }
LABEL_15:
        unsigned int v14 = objc_msgSend(objc_alloc(*v13), "initWithAudioObjectID:", -[ASAObject objectID](v11, "objectID"));
        if (v14) {
          [v3 addObject:v14];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (BOOL)isTapStream
{
  int v5 = 4;
  int v4 = 0;
  if (![(ASAObject *)self getMainGlobalProperty:1952542835 withData:&v4 ofSize:&v5 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v3 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read tap stream property\n", v3, 2u);
  }
  return v4 != 0;
}

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v108 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v104.receiver = self;
  v104.super_class = (Class)ASAStream;
  BOOL v84 = v4;
  uint64_t v7 = [(ASAObject *)&v104 diagnosticDescriptionWithIndent:v6 walkTree:v4];
  unint64_t v8 = [v6 stringByAppendingString:@"|        "];
  id v9 = [(ASAStream *)self name];
  [v7 appendFormat:@"%@|    Name: %s\n", v6, objc_msgSend(v9, "UTF8String")];

  if ([(ASAStream *)self isActive]) {
    unint64_t v10 = @"YES";
  }
  else {
    unint64_t v10 = @"NO";
  }
  [v7 appendFormat:@"%@|    Is Active: %@\n", v6, v10];
  BOOL v11 = [(ASAStream *)self isInput];
  int v12 = @"Output";
  if (v11) {
    int v12 = @"Input";
  }
  [v7 appendFormat:@"%@|    Direction: %@\n", v6, v12];
  if ([(ASAStream *)self isTapStream]) {
    v13 = @"YES";
  }
  else {
    v13 = @"NO";
  }
  [v7 appendFormat:@"%@|    Is Tap Stream: %@\n", v6, v13];
  uint64_t v14 = [(ASAStream *)self terminalType];
  LODWORD(v15) = BYTE3(v14);
  uint64_t v16 = 32;
  if ((v14 - 0x20000000) >> 24 >= 0x5F) {
    uint64_t v15 = 32;
  }
  else {
    uint64_t v15 = v15;
  }
  if (((v14 << 8) - 0x20000000) >> 24 >= 0x5F) {
    uint64_t v17 = 32;
  }
  else {
    uint64_t v17 = BYTE2(v14);
  }
  if (((v14 << 16) - 0x20000000) >> 24 >= 0x5F) {
    uint64_t v18 = 32;
  }
  else {
    uint64_t v18 = BYTE1(v14);
  }
  if (v14 << 24 == 2130706432 || v14 << 24 < 520093697) {
    uint64_t v20 = 32;
  }
  else {
    uint64_t v20 = v14;
  }
  [v7 appendFormat:@"%@|    Terminal Type: %c%c%c%c (0x%08x)\n", v6, v15, v17, v18, v20, v14];
  [v7 appendFormat:@"%@|    Starting Channel: %u\n", v6, -[ASAStream startingChannel](self, "startingChannel")];
  [v7 appendFormat:@"%@|    Latency: %u\n", v6, -[ASAStream latency](self, "latency")];
  uint64_t v21 = [(ASAStream *)self virtualFormat];
  [v7 appendFormat:@"%@|    Virtual Format\n", v6];
  [v21 sampleRate];
  v85 = v6;
  [v7 appendFormat:@"%@|        Sample Rate: %f\n", v6, v22];
  if ((int)[v21 formatID] >= 0x20000000)
  {
    if ((int)[v21 formatID] > 2130706431) {
      uint64_t v16 = 32;
    }
    else {
      uint64_t v16 = ((int)[v21 formatID] >> 24);
    }
  }
  if ((int)([v21 formatID] << 8) < 0x20000000
    || (int)([v21 formatID] << 8) > 2130706431)
  {
    uint64_t v23 = 32;
  }
  else
  {
    uint64_t v23 = ((int)([v21 formatID] << 8) >> 24);
  }
  if ((int)([v21 formatID] << 16) < 0x20000000
    || (int)([v21 formatID] << 16) > 2130706431)
  {
    uint64_t v24 = 32;
  }
  else
  {
    uint64_t v24 = ((__int16)[v21 formatID] >> 8);
  }
  if ((int)([v21 formatID] << 24) < 520093697
    || [v21 formatID] == 127)
  {
    uint64_t v25 = 32;
  }
  else
  {
    uint64_t v25 = (char)[v21 formatID];
  }
  [v7 appendFormat:@"%@|        Format ID: %c%c%c%c\n", v85, v16, v23, v24, v25];
  [v7 appendFormat:@"%@|        Format Flags: 0x%08x\n", v85, objc_msgSend(v21, "formatFlags")];
  [v7 appendFormat:@"%@|        Bytes Per Packet: %u\n", v85, objc_msgSend(v21, "bytesPerFrame")];
  [v7 appendFormat:@"%@|        Frames Per Packet: %u\n", v85, objc_msgSend(v21, "framesPerPacket")];
  [v7 appendFormat:@"%@|        Bytes Per Frame: %u\n", v85, objc_msgSend(v21, "bytesPerFrame")];
  [v7 appendFormat:@"%@|        Channels Per Frame: %u\n", v85, objc_msgSend(v21, "channelsPerFrame")];
  v81 = v21;
  [v7 appendFormat:@"%@|        Bits Per Channel: %u\n", v85, objc_msgSend(v21, "bitsPerChannel")];
  [v7 appendFormat:@"%@|    Available Virtual Format\n", v85];
  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  v83 = self;
  obuint64_t j = [(ASAStream *)self availableVirtualFormats];
  uint64_t v26 = [obj countByEnumeratingWithState:&v100 objects:v107 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = 0;
    id v89 = *(id *)v101;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(id *)v101 != v89) {
          objc_enumerationMutation(obj);
        }
        v30 = *(void **)(*((void *)&v100 + 1) + 8 * i);
        [v7 appendFormat:@"%@%u: Virtual Format\n", v8, v28 + i];
        [v30 sampleRate];
        [v7 appendFormat:@"%@    Sample Rate: %f\n", v8, v31];
        if ((int)[v30 formatID] < 0x20000000 || (int)objc_msgSend(v30, "formatID") > 2130706431) {
          uint64_t v32 = 32;
        }
        else {
          uint64_t v32 = ((int)[v30 formatID] >> 24);
        }
        if ((int)([v30 formatID] << 8) < 0x20000000
          || (int)([v30 formatID] << 8) > 2130706431)
        {
          uint64_t v33 = 32;
        }
        else
        {
          uint64_t v33 = ((int)([v30 formatID] << 8) >> 24);
        }
        if ((int)([v30 formatID] << 16) < 0x20000000
          || (int)([v30 formatID] << 16) > 2130706431)
        {
          uint64_t v34 = 32;
        }
        else
        {
          uint64_t v34 = ((__int16)[v30 formatID] >> 8);
        }
        if ((int)([v30 formatID] << 24) < 520093697
          || [v30 formatID] == 127)
        {
          uint64_t v35 = 32;
        }
        else
        {
          uint64_t v35 = (char)[v30 formatID];
        }
        [v7 appendFormat:@"%@    Format ID: %c%c%c%c\n", v8, v32, v33, v34, v35];
        [v7 appendFormat:@"%@    Format Flags: 0x%08x\n", v8, objc_msgSend(v30, "formatFlags")];
        [v7 appendFormat:@"%@    Bytes Per Packet: %u\n", v8, objc_msgSend(v30, "bytesPerFrame")];
        [v7 appendFormat:@"%@    Frames Per Packet: %u\n", v8, objc_msgSend(v30, "framesPerPacket")];
        [v7 appendFormat:@"%@    Bytes Per Frame: %u\n", v8, objc_msgSend(v30, "bytesPerFrame")];
        [v7 appendFormat:@"%@    Channels Per Frame: %u\n", v8, objc_msgSend(v30, "channelsPerFrame")];
        [v7 appendFormat:@"%@    Bits Per Channel: %u\n", v8, objc_msgSend(v30, "bitsPerChannel")];
        [v30 minimumSampleRate];
        [v7 appendFormat:@"%@    Minimum Sample Rate: %f\n", v8, v36];
        [v30 maximumSampleRate];
        [v7 appendFormat:@"%@    Maximum Sample Rate: %f\n", v8, v37];
      }
      uint64_t v27 = [obj countByEnumeratingWithState:&v100 objects:v107 count:16];
      uint64_t v28 = (v28 + i);
    }
    while (v27);
  }

  v38 = [(ASAStream *)v83 physicalFormat];

  [v7 appendFormat:@"%@|    Physical Format\n", v85];
  [v38 sampleRate];
  [v7 appendFormat:@"%@|        Sample Rate: %f\n", v85, v39];
  if ((int)[v38 formatID] < 0x20000000 || (int)objc_msgSend(v38, "formatID") > 2130706431) {
    uint64_t v40 = 32;
  }
  else {
    uint64_t v40 = ((int)[v38 formatID] >> 24);
  }
  if ((int)([v38 formatID] << 8) < 0x20000000
    || (int)([v38 formatID] << 8) > 2130706431)
  {
    uint64_t v41 = 32;
  }
  else
  {
    uint64_t v41 = ((int)([v38 formatID] << 8) >> 24);
  }
  if ((int)([v38 formatID] << 16) < 0x20000000
    || (int)([v38 formatID] << 16) > 2130706431)
  {
    uint64_t v42 = 32;
  }
  else
  {
    uint64_t v42 = ((__int16)[v38 formatID] >> 8);
  }
  if ((int)([v38 formatID] << 24) < 520093697
    || [v38 formatID] == 127)
  {
    uint64_t v43 = 32;
  }
  else
  {
    uint64_t v43 = (char)[v38 formatID];
  }
  [v7 appendFormat:@"%@|        Format ID: %c%c%c%c\n", v85, v40, v41, v42, v43];
  [v7 appendFormat:@"%@|        Format Flags: 0x%08x\n", v85, objc_msgSend(v38, "formatFlags")];
  [v7 appendFormat:@"%@|        Bytes Per Packet: %u\n", v85, objc_msgSend(v38, "bytesPerFrame")];
  [v7 appendFormat:@"%@|        Frames Per Packet: %u\n", v85, objc_msgSend(v38, "framesPerPacket")];
  [v7 appendFormat:@"%@|        Bytes Per Frame: %u\n", v85, objc_msgSend(v38, "bytesPerFrame")];
  [v7 appendFormat:@"%@|        Channels Per Frame: %u\n", v85, objc_msgSend(v38, "channelsPerFrame")];
  v82 = v38;
  [v7 appendFormat:@"%@|        Bits Per Channel: %u\n", v85, objc_msgSend(v38, "bitsPerChannel")];
  [v7 appendFormat:@"%@|    Available Physical Format\n", v85];
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  id obja = [(ASAStream *)v83 availablePhysicalFormats];
  uint64_t v44 = [obja countByEnumeratingWithState:&v96 objects:v106 count:16];
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = 0;
    id v90 = *(id *)v97;
    do
    {
      for (uint64_t j = 0; j != v45; ++j)
      {
        if (*(id *)v97 != v90) {
          objc_enumerationMutation(obja);
        }
        v48 = *(void **)(*((void *)&v96 + 1) + 8 * j);
        [v7 appendFormat:@"%@%u: Physical Format\n", v8, v46 + j];
        [v48 sampleRate];
        [v7 appendFormat:@"%@    Sample Rate: %f\n", v8, v49];
        if ((int)[v48 formatID] < 0x20000000 || (int)objc_msgSend(v48, "formatID") > 2130706431) {
          uint64_t v50 = 32;
        }
        else {
          uint64_t v50 = ((int)[v48 formatID] >> 24);
        }
        if ((int)([v48 formatID] << 8) < 0x20000000
          || (int)([v48 formatID] << 8) > 2130706431)
        {
          uint64_t v51 = 32;
        }
        else
        {
          uint64_t v51 = ((int)([v48 formatID] << 8) >> 24);
        }
        if ((int)([v48 formatID] << 16) < 0x20000000
          || (int)([v48 formatID] << 16) > 2130706431)
        {
          uint64_t v52 = 32;
        }
        else
        {
          uint64_t v52 = ((__int16)[v48 formatID] >> 8);
        }
        if ((int)([v48 formatID] << 24) < 520093697
          || [v48 formatID] == 127)
        {
          uint64_t v53 = 32;
        }
        else
        {
          uint64_t v53 = (char)[v48 formatID];
        }
        [v7 appendFormat:@"%@    Format ID: %c%c%c%c\n", v8, v50, v51, v52, v53];
        [v7 appendFormat:@"%@    Format Flags: 0x%08x\n", v8, objc_msgSend(v48, "formatFlags")];
        [v7 appendFormat:@"%@    Bytes Per Packet: %u\n", v8, objc_msgSend(v48, "bytesPerFrame")];
        [v7 appendFormat:@"%@    Frames Per Packet: %u\n", v8, objc_msgSend(v48, "framesPerPacket")];
        [v7 appendFormat:@"%@    Bytes Per Frame: %u\n", v8, objc_msgSend(v48, "bytesPerFrame")];
        [v7 appendFormat:@"%@    Channels Per Frame: %u\n", v8, objc_msgSend(v48, "channelsPerFrame")];
        [v7 appendFormat:@"%@    Bits Per Channel: %u\n", v8, objc_msgSend(v48, "bitsPerChannel")];
        [v48 minimumSampleRate];
        [v7 appendFormat:@"%@    Minimum Sample Rate: %f\n", v8, v54];
        [v48 maximumSampleRate];
        [v7 appendFormat:@"%@    Maximum Sample Rate: %f\n", v8, v55];
      }
      uint64_t v45 = [obja countByEnumeratingWithState:&v96 objects:v106 count:16];
      uint64_t v46 = (v46 + j);
    }
    while (v45);
  }

  [v7 appendFormat:@"%@|    Controls:\n", v85];
  v56 = [(ASAStream *)v83 controlObjectIDs];
  if ([v56 count])
  {
    long long v94 = 0u;
    long long v95 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    id v91 = v56;
    uint64_t v57 = [v91 countByEnumeratingWithState:&v92 objects:v105 count:16];
    BOOL v58 = v84;
    if (!v57) {
      goto LABEL_151;
    }
    uint64_t v59 = v57;
    unint64_t objb = 0;
    uint64_t v60 = *(void *)v93;
    while (1)
    {
      for (uint64_t k = 0; k != v59; ++k)
      {
        if (*(void *)v93 != v60) {
          objc_enumerationMutation(v91);
        }
        v62 = -[ASAObject initWithAudioObjectID:]([ASAObject alloc], "initWithAudioObjectID:", [*(id *)(*((void *)&v92 + 1) + 8 * k) unsignedIntValue]);
        uint64_t v63 = [(ASAObject *)v62 baseClass];
        uint64_t v64 = v63;
        if ((int)v63 > 1936483441)
        {
          if (v63 == 1936483442)
          {
            v65 = ASASliderControl;
            goto LABEL_148;
          }
          if (v63 == 1953458028)
          {
            v65 = ASABooleanControl;
            goto LABEL_148;
          }
        }
        else
        {
          if (v63 == 1818588780)
          {
            v65 = ASALevelControl;
            goto LABEL_148;
          }
          if (v63 == 1936483188)
          {
            v65 = ASASelectorControl;
LABEL_148:
            v78 = objc_msgSend([v65 alloc], "initWithAudioObjectID:", -[ASAObject objectID](v62, "objectID"));
            v79 = [v78 diagnosticDescriptionWithIndent:v8 walkTree:v58];
            [v7 appendString:v79];

            goto LABEL_149;
          }
        }
        uint64_t v66 = [(ASAObject *)v62 objectClass];
        uint64_t v67 = [(ASAObject *)v62 objectID];
        LODWORD(v68) = BYTE3(v64);
        if ((v64 - 0x20000000) >> 24 >= 0x5F) {
          uint64_t v68 = 32;
        }
        else {
          uint64_t v68 = v68;
        }
        if (((v64 << 8) - 0x20000000) >> 24 >= 0x5F) {
          uint64_t v69 = 32;
        }
        else {
          uint64_t v69 = BYTE2(v64);
        }
        if (((v64 << 16) - 0x20000000) >> 24 >= 0x5F) {
          uint64_t v70 = 32;
        }
        else {
          uint64_t v70 = BYTE1(v64);
        }
        if (v64 << 24 == 2130706432 || v64 << 24 < 520093697) {
          uint64_t v72 = 32;
        }
        else {
          uint64_t v72 = v64;
        }
        LODWORD(v73) = (int)v66 >> 24;
        if ((v66 - 0x20000000) >> 24 >= 0x5F) {
          uint64_t v73 = 32;
        }
        else {
          uint64_t v73 = v73;
        }
        LODWORD(v74) = (int)(v66 << 8) >> 24;
        if (((v66 << 8) - 0x20000000) >> 24 >= 0x5F) {
          uint64_t v74 = 32;
        }
        else {
          uint64_t v74 = v74;
        }
        LODWORD(v75) = (__int16)v66 >> 8;
        if (((v66 << 16) - 0x20000000) >> 24 >= 0x5F) {
          uint64_t v75 = 32;
        }
        else {
          uint64_t v75 = v75;
        }
        if (v66 << 24 == 2130706432 || v66 << 24 < 520093697) {
          uint64_t v77 = 32;
        }
        else {
          uint64_t v77 = (char)v66;
        }
        BOOL v58 = v84;
        [v7 appendFormat:@"%@|        %u: Object %u has unknown control class  %c%c%c%c (0x%08x) %c%c%c%c (0x%08x)\n", v85, objb + k, v67, v68, v69, v70, v72, v64, v73, v74, v75, v77, v66];
LABEL_149:
      }
      uint64_t v59 = [v91 countByEnumeratingWithState:&v92 objects:v105 count:16];
      unint64_t objb = (objb + k);
      if (!v59)
      {
LABEL_151:

        break;
      }
    }
  }

  return v7;
}

- (id)coreAudioClassName
{
  return @"AudioStream";
}

@end