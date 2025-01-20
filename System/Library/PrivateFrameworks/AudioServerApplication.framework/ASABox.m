@interface ASABox
- (BOOL)hasAudio;
- (BOOL)hasMIDI;
- (BOOL)hasVideo;
- (BOOL)identify;
- (BOOL)isAcquireSettable;
- (BOOL)isAcquired;
- (BOOL)isIdentifySettable;
- (BOOL)isNameSettable;
- (BOOL)isProtected;
- (NSArray)audioDeviceObjectIDs;
- (NSArray)audioDevices;
- (NSArray)clockDeviceObjectIDs;
- (NSArray)clockDevices;
- (NSString)boxUID;
- (NSString)firmwareVersion;
- (NSString)manufacturer;
- (NSString)modelName;
- (NSString)modelUID;
- (NSString)name;
- (NSString)serialNumber;
- (id)coreAudioClassName;
- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4;
- (int)acquisitionFailure;
- (unsigned)transportType;
- (void)setAcquired:(BOOL)a3;
- (void)setIdentify:(BOOL)a3;
- (void)setName:(id)a3;
@end

@implementation ASABox

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

- (NSString)manufacturer
{
  int v6 = 8;
  CFTypeRef cf = 0;
  if ([(ASAObject *)self getMainGlobalProperty:1819107691 withData:&cf ofSize:&v6 withQualifier:0 ofSize:0])
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
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read manufacturer property\n", v4, 2u);
  }
  v2 = 0;
LABEL_7:
  return (NSString *)v2;
}

- (NSString)modelName
{
  int v6 = 8;
  CFTypeRef cf = 0;
  if ([(ASAObject *)self getMainGlobalProperty:1819111268 withData:&cf ofSize:&v6 withQualifier:0 ofSize:0])
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
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read model name property\n", v4, 2u);
  }
  v2 = 0;
LABEL_7:
  return (NSString *)v2;
}

- (NSString)serialNumber
{
  int v6 = 8;
  CFTypeRef cf = 0;
  if ([(ASAObject *)self getMainGlobalProperty:1936618861 withData:&cf ofSize:&v6 withQualifier:0 ofSize:0])
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
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read serial number property\n", v4, 2u);
  }
  v2 = 0;
LABEL_7:
  return (NSString *)v2;
}

- (NSString)firmwareVersion
{
  int v6 = 8;
  CFTypeRef cf = 0;
  if ([(ASAObject *)self getMainGlobalProperty:1719105134 withData:&cf ofSize:&v6 withQualifier:0 ofSize:0])
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
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read firmware version property\n", v4, 2u);
  }
  v2 = 0;
LABEL_7:
  return (NSString *)v2;
}

- (NSString)boxUID
{
  int v6 = 8;
  CFTypeRef cf = 0;
  if ([(ASAObject *)self getMainGlobalProperty:1651861860 withData:&cf ofSize:&v6 withQualifier:0 ofSize:0])
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
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read box UID property\n", v4, 2u);
  }
  v2 = 0;
LABEL_7:
  return (NSString *)v2;
}

- (NSString)modelUID
{
  int v6 = 8;
  CFTypeRef cf = 0;
  if ([(ASAObject *)self getMainGlobalProperty:1836411236 withData:&cf ofSize:&v6 withQualifier:0 ofSize:0])
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
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read model UID property\n", v4, 2u);
  }
  v2 = 0;
LABEL_7:
  return (NSString *)v2;
}

- (unsigned)transportType
{
  int v5 = 4;
  unsigned int v4 = 0;
  if (![(ASAObject *)self getMainGlobalProperty:1953653102 withData:&v4 ofSize:&v5 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read transport type property\n", v3, 2u);
  }
  return v4;
}

- (BOOL)hasAudio
{
  int v5 = 4;
  int v4 = 0;
  if (![(ASAObject *)self getMainGlobalProperty:1651007861 withData:&v4 ofSize:&v5 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read has audio property\n", v3, 2u);
  }
  return v4 != 0;
}

- (BOOL)hasVideo
{
  int v5 = 4;
  int v4 = 0;
  if (![(ASAObject *)self getMainGlobalProperty:1651013225 withData:&v4 ofSize:&v5 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read has video property\n", v3, 2u);
  }
  return v4 != 0;
}

- (BOOL)hasMIDI
{
  int v5 = 4;
  int v4 = 0;
  if (![(ASAObject *)self getMainGlobalProperty:1651010921 withData:&v4 ofSize:&v5 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read has MIDI property\n", v3, 2u);
  }
  return v4 != 0;
}

- (BOOL)isProtected
{
  int v5 = 4;
  int v4 = 0;
  if (![(ASAObject *)self getMainGlobalProperty:1651536495 withData:&v4 ofSize:&v5 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read is protected property\n", v3, 2u);
  }
  return v4 != 0;
}

- (BOOL)isAcquired
{
  int v5 = 4;
  int v4 = 0;
  if (![(ASAObject *)self getMainGlobalProperty:1652060014 withData:&v4 ofSize:&v5 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read acquired property\n", v3, 2u);
  }
  return v4 != 0;
}

- (void)setAcquired:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(ASABox *)self isAcquireSettable])
  {
    BOOL v5 = v3;
    [(ASAObject *)self setMainGlobalProperty:1652060014 withData:&v5 ofSize:4 withQualifier:0 ofSize:0];
  }
}

- (int)acquisitionFailure
{
  int v5 = 4;
  int v4 = 0;
  if (![(ASAObject *)self getMainGlobalProperty:1652060006 withData:&v4 ofSize:&v5 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read acquisition failure property\n", v3, 2u);
  }
  return v4;
}

- (BOOL)identify
{
  int v5 = 4;
  int v4 = 0;
  if (![(ASAObject *)self getMainGlobalProperty:1768187246 withData:&v4 ofSize:&v5 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read identify property\n", v3, 2u);
  }
  return v4 != 0;
}

- (void)setIdentify:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(ASABox *)self isIdentifySettable])
  {
    BOOL v5 = v3;
    [(ASAObject *)self setMainGlobalProperty:1768187246 withData:&v5 ofSize:4 withQualifier:0 ofSize:0];
  }
}

- (NSArray)audioDeviceObjectIDs
{
  unsigned int v3 = [(ASAObject *)self sizeOfMainGlobalProperty:1650751011 withQualifier:0 ofSize:0];
  unsigned int v15 = v3;
  if (v3 && (size_t v4 = v3, (v5 = (unsigned int *)malloc_type_malloc(v3, 0xA63D3DEEuLL)) != 0))
  {
    int v6 = v5;
    bzero(v5, v4);
    BOOL v7 = [(ASAObject *)self getMainGlobalProperty:1650751011 withData:v6 ofSize:&v15 withQualifier:0 ofSize:0];
    v8 = 0;
    if (v7)
    {
      unint64_t v9 = v15;
      v8 = [MEMORY[0x263EFF980] array];
      if (v9 >= 4)
      {
        unint64_t v10 = v9 >> 2;
        v11 = v6;
        do
        {
          unsigned int v12 = *v11++;
          v13 = [NSNumber numberWithUnsignedLong:v12];
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
    v8 = 0;
  }
  return (NSArray *)v8;
}

- (NSArray)audioDevices
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = [(ASABox *)self audioDeviceObjectIDs];
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
        unint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        unint64_t v10 = [ASAAudioDevice alloc];
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
  unsigned int v3 = [(ASAObject *)self sizeOfMainGlobalProperty:1650682915 withQualifier:0 ofSize:0];
  unsigned int v15 = v3;
  if (v3 && (size_t v4 = v3, (v5 = (unsigned int *)malloc_type_malloc(v3, 0x3B495987uLL)) != 0))
  {
    uint64_t v6 = v5;
    bzero(v5, v4);
    BOOL v7 = [(ASAObject *)self getMainGlobalProperty:1650682915 withData:v6 ofSize:&v15 withQualifier:0 ofSize:0];
    v8 = 0;
    if (v7)
    {
      unint64_t v9 = v15;
      v8 = [MEMORY[0x263EFF980] array];
      if (v9 >= 4)
      {
        unint64_t v10 = v9 >> 2;
        v11 = v6;
        do
        {
          unsigned int v12 = *v11++;
          long long v13 = [NSNumber numberWithUnsignedLong:v12];
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
    v8 = 0;
  }
  return (NSArray *)v8;
}

- (NSArray)clockDevices
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = [(ASABox *)self clockDeviceObjectIDs];
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
        unint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        unint64_t v10 = [ASAClockDevice alloc];
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

- (BOOL)isAcquireSettable
{
  return [(ASAObject *)self isMainGlobalPropertySettable:1652060014];
}

- (BOOL)isIdentifySettable
{
  return [(ASAObject *)self isMainGlobalPropertySettable:1768187246];
}

- (BOOL)isNameSettable
{
  return [(ASAObject *)self isMainGlobalPropertySettable:1819173229];
}

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v67.receiver = self;
  v67.super_class = (Class)ASABox;
  uint64_t v7 = [(ASAObject *)&v67 diagnosticDescriptionWithIndent:v6 walkTree:v4];
  v58 = [v6 stringByAppendingString:@"|        "];
  id v8 = [(ASABox *)self name];
  [v7 appendFormat:@"%@|    Name: %s\n", v6, objc_msgSend(v8, "UTF8String")];

  id v9 = [(ASABox *)self manufacturer];
  [v7 appendFormat:@"%@|    Manufacturer: %s\n", v6, objc_msgSend(v9, "UTF8String")];

  id v10 = [(ASABox *)self modelName];
  [v7 appendFormat:@"%@|    Model Name: %s\n", v6, objc_msgSend(v10, "UTF8String")];

  id v11 = [(ASABox *)self serialNumber];
  [v7 appendFormat:@"%@|    Serial Number: %s\n", v6, objc_msgSend(v11, "UTF8String")];

  id v12 = [(ASABox *)self firmwareVersion];
  [v7 appendFormat:@"%@|    Firmware Version: %s\n", v6, objc_msgSend(v12, "UTF8String")];

  id v13 = [(ASABox *)self boxUID];
  [v7 appendFormat:@"%@|    Box UID: %s\n", v6, objc_msgSend(v13, "UTF8String")];

  id v14 = [(ASABox *)self modelUID];
  [v7 appendFormat:@"%@|    Model UID: %s\n", v6, objc_msgSend(v14, "UTF8String")];

  int v15 = [(ASABox *)self transportType];
  LODWORD(v16) = v15 >> 24;
  if ((v15 - 0x20000000) >> 24 >= 0x5F) {
    uint64_t v16 = 32;
  }
  else {
    uint64_t v16 = v16;
  }
  LODWORD(v17) = v15 << 8 >> 24;
  if (((v15 << 8) - 0x20000000) >> 24 >= 0x5F) {
    uint64_t v17 = 32;
  }
  else {
    uint64_t v17 = v17;
  }
  LODWORD(v18) = (__int16)v15 >> 8;
  if (((v15 << 16) - 0x20000000) >> 24 >= 0x5F) {
    uint64_t v18 = 32;
  }
  else {
    uint64_t v18 = v18;
  }
  if (v15 << 24 == 2130706432 || v15 << 24 < 520093697) {
    uint64_t v20 = 32;
  }
  else {
    uint64_t v20 = (char)v15;
  }
  [v7 appendFormat:@"%@|    Transport Type: %c%c%c%c\n", v6, v16, v17, v18, v20];
  if ([(ASABox *)self hasAudio]) {
    v21 = @"YES";
  }
  else {
    v21 = @"NO";
  }
  [v7 appendFormat:@"%@|    Has Audio: %@\n", v6, v21];
  if ([(ASABox *)self hasVideo]) {
    v22 = @"YES";
  }
  else {
    v22 = @"NO";
  }
  [v7 appendFormat:@"%@|    Has Video: %@\n", v6, v22];
  if ([(ASABox *)self hasMIDI]) {
    v23 = @"YES";
  }
  else {
    v23 = @"NO";
  }
  [v7 appendFormat:@"%@|    Has MIDI: %@\n", v6, v23];
  if ([(ASABox *)self isProtected]) {
    v24 = @"YES";
  }
  else {
    v24 = @"NO";
  }
  [v7 appendFormat:@"%@|    Is Protected: %@\n", v6, v24];
  if ([(ASABox *)self isAcquired]) {
    v25 = @"YES";
  }
  else {
    v25 = @"NO";
  }
  [v7 appendFormat:@"%@|    Acquired: %@\n", v6, v25];
  if ([(ASABox *)self isAcquireSettable]) {
    v26 = @"YES";
  }
  else {
    v26 = @"NO";
  }
  [v7 appendFormat:@"%@|    Is Acquire Settable: %@\n", v6, v26];
  if ([(ASABox *)self isIdentifySettable]) {
    v27 = @"YES";
  }
  else {
    v27 = @"NO";
  }
  [v7 appendFormat:@"%@|    Is Identify Settable: %@\n", v6, v27];
  if ([(ASABox *)self isNameSettable]) {
    v28 = @"YES";
  }
  else {
    v28 = @"NO";
  }
  [v7 appendFormat:@"%@|    Is Name Settable: %@\n", v6, v28];
  int v29 = [(ASABox *)self acquisitionFailure];
  LODWORD(v30) = v29 >> 24;
  if ((v29 - 0x20000000) >> 24 >= 0x5F) {
    uint64_t v30 = 32;
  }
  else {
    uint64_t v30 = v30;
  }
  LODWORD(v31) = v29 << 8 >> 24;
  if (((v29 << 8) - 0x20000000) >> 24 >= 0x5F) {
    uint64_t v31 = 32;
  }
  else {
    uint64_t v31 = v31;
  }
  LODWORD(v32) = (__int16)v29 >> 8;
  if (((v29 << 16) - 0x20000000) >> 24 >= 0x5F) {
    uint64_t v32 = 32;
  }
  else {
    uint64_t v32 = v32;
  }
  if (v29 << 24 == 2130706432 || v29 << 24 < 520093697) {
    uint64_t v34 = 32;
  }
  else {
    uint64_t v34 = (char)v29;
  }
  v35 = v6;
  [v7 appendFormat:@"%@|    Acquisition Failure: %c%c%c%c\n", v6, v30, v31, v32, v34];
  v55 = self;
  v36 = [(ASABox *)self audioDeviceObjectIDs];
  v57 = v36;
  if ([v36 count])
  {
    [v7 appendFormat:@"%@|    Device Objects:\n", v35];
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v37 = v36;
    uint64_t v38 = [v37 countByEnumeratingWithState:&v63 objects:v69 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = 0;
      uint64_t v41 = *(void *)v64;
      do
      {
        for (uint64_t i = 0; i != v39; ++i)
        {
          if (*(void *)v64 != v41) {
            objc_enumerationMutation(v37);
          }
          if (v4)
          {
            v43 = -[ASAObject initWithAudioObjectID:]([ASAAudioDevice alloc], "initWithAudioObjectID:", [*(id *)(*((void *)&v63 + 1) + 8 * i) unsignedIntValue]);
            v44 = [(ASAAudioDevice *)v43 diagnosticDescriptionWithIndent:v58 walkTree:1];
            [v7 appendString:v44];
          }
          else
          {
            [v7 appendFormat:@"%@|        %u: %u\n", v35, v40 + i, objc_msgSend(*(id *)(*((void *)&v63 + 1) + 8 * i), "unsignedIntValue")];
          }
        }
        uint64_t v39 = [v37 countByEnumeratingWithState:&v63 objects:v69 count:16];
        uint64_t v40 = (v40 + i);
      }
      while (v39);
    }

    v36 = v57;
  }
  v45 = [(ASABox *)v55 clockDeviceObjectIDs];
  if ([v45 count])
  {
    [v7 appendFormat:@"%@|    Clock Device Objects:\n", v35];
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    v56 = v45;
    id v46 = v45;
    uint64_t v47 = [v46 countByEnumeratingWithState:&v59 objects:v68 count:16];
    if (v47)
    {
      uint64_t v48 = v47;
      uint64_t v49 = 0;
      uint64_t v50 = *(void *)v60;
      do
      {
        for (uint64_t j = 0; j != v48; ++j)
        {
          if (*(void *)v60 != v50) {
            objc_enumerationMutation(v46);
          }
          if (v4)
          {
            v52 = -[ASAObject initWithAudioObjectID:]([ASAClockDevice alloc], "initWithAudioObjectID:", [*(id *)(*((void *)&v59 + 1) + 8 * j) unsignedIntValue]);
            v53 = [(ASAClockDevice *)v52 diagnosticDescriptionWithIndent:v58 walkTree:1];
            [v7 appendString:v53];
          }
          else
          {
            [v7 appendFormat:@"%@|        %u: %u\n", v35, v49 + j, objc_msgSend(*(id *)(*((void *)&v59 + 1) + 8 * j), "unsignedIntValue")];
          }
        }
        uint64_t v48 = [v46 countByEnumeratingWithState:&v59 objects:v68 count:16];
        uint64_t v49 = (v49 + j);
      }
      while (v48);
    }

    v45 = v56;
    v36 = v57;
  }

  return v7;
}

- (id)coreAudioClassName
{
  return @"AudioBox";
}

@end