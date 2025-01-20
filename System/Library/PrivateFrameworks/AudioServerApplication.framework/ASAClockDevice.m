@interface ASAClockDevice
- (BOOL)isAlive;
- (BOOL)isHidden;
- (BOOL)isRunning;
- (NSArray)controlObjectIDs;
- (NSArray)controls;
- (NSArray)nominalSampleRates;
- (NSString)deviceUID;
- (NSString)manufacturer;
- (NSString)name;
- (double)nominalSampleRate;
- (id)coreAudioClassName;
- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4;
- (unsigned)clockDomain;
- (unsigned)inputLatency;
- (unsigned)outputLatency;
- (unsigned)transportType;
- (unsigned)zeroTimestampPeriod;
- (void)setName:(id)a3;
- (void)setNominalSampleRate:(double)a3;
@end

@implementation ASAClockDevice

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

- (NSString)deviceUID
{
  int v6 = 8;
  CFTypeRef cf = 0;
  if ([(ASAObject *)self getMainGlobalProperty:1668639076 withData:&cf ofSize:&v6 withQualifier:0 ofSize:0])
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

- (unsigned)clockDomain
{
  int v5 = 4;
  unsigned int v4 = 0;
  if (![(ASAObject *)self getMainGlobalProperty:1668049764 withData:&v4 ofSize:&v5 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read clock domain property\n", v3, 2u);
  }
  return v4;
}

- (BOOL)isAlive
{
  int v5 = 4;
  int v4 = 0;
  if (![(ASAObject *)self getMainGlobalProperty:1818850926 withData:&v4 ofSize:&v5 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read is active property\n", v3, 2u);
  }
  return v4 != 0;
}

- (BOOL)isRunning
{
  int v5 = 4;
  int v4 = 0;
  if (![(ASAObject *)self getMainGlobalProperty:1735354734 withData:&v4 ofSize:&v5 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read is running property\n", v3, 2u);
  }
  return v4 != 0;
}

- (double)nominalSampleRate
{
  int v5 = 8;
  double v4 = 0.0;
  if (![(ASAObject *)self getMainGlobalProperty:1853059700 withData:&v4 ofSize:&v5 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read nominal sample rate property\n", v3, 2u);
  }
  return v4;
}

- (void)setNominalSampleRate:(double)a3
{
  double v4 = a3;
  if (![(ASAObject *)self setMainGlobalProperty:1853059700 withData:&v4 ofSize:8 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not write nominal sample rate property\n", v3, 2u);
  }
}

- (BOOL)isHidden
{
  int v5 = 4;
  int v4 = 0;
  if (![(ASAObject *)self getMainGlobalProperty:1751737454 withData:&v4 ofSize:&v5 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read is hidden property\n", v3, 2u);
  }
  return v4 != 0;
}

- (unsigned)inputLatency
{
  int v5 = 4;
  unsigned int v4 = 0;
  if (![(ASAObject *)self getMainInputProperty:1819569763 withData:&v4 ofSize:&v5 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read input latency property\n", v3, 2u);
  }
  return v4;
}

- (unsigned)outputLatency
{
  int v5 = 4;
  unsigned int v4 = 0;
  if (![(ASAObject *)self getMainOutputProperty:1819569763 withData:&v4 ofSize:&v5 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read output latency property\n", v3, 2u);
  }
  return v4;
}

- (unsigned)zeroTimestampPeriod
{
  int v5 = 4;
  unsigned int v4 = 0;
  if (![(ASAObject *)self getMainGlobalProperty:1919512167 withData:&v4 ofSize:&v5 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read zero timestamp period property\n", v3, 2u);
  }
  return v4;
}

- (NSArray)nominalSampleRates
{
  unsigned int v3 = [(ASAObject *)self sizeOfMainGlobalProperty:1853059619 withQualifier:0 ofSize:0];
  unsigned int v15 = v3;
  if (v3 && (size_t v4 = v3, (v5 = (double *)malloc_type_malloc(v3, 0x3576F32EuLL)) != 0))
  {
    int v6 = v5;
    bzero(v5, v4);
    BOOL v7 = [(ASAObject *)self getMainGlobalProperty:1853059619 withData:v6 ofSize:&v15 withQualifier:0 ofSize:0];
    v8 = 0;
    if (v7)
    {
      unint64_t v9 = v15;
      v8 = [MEMORY[0x263EFF980] array];
      if (v9 >= 8)
      {
        unint64_t v10 = v9 >> 3;
        v11 = v6;
        do
        {
          double v12 = *v11++;
          v13 = [NSNumber numberWithDouble:v12];
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

- (NSArray)controlObjectIDs
{
  unsigned int v3 = [MEMORY[0x263EFF980] array];
  unsigned int v4 = [(ASAObject *)self sizeOfMainGlobalProperty:1668575852 withQualifier:0 ofSize:0];
  unsigned int v13 = v4;
  if (v4)
  {
    size_t v5 = v4;
    int v6 = (unsigned int *)malloc_type_malloc(v4, 0xAAFE0C42uLL);
    if (v6)
    {
      BOOL v7 = v6;
      bzero(v6, v5);
      if ([(ASAObject *)self getMainGlobalProperty:1668575852 withData:v7 ofSize:&v13 withQualifier:0 ofSize:0]&& v13 >= 4)
      {
        unint64_t v8 = (unint64_t)v13 >> 2;
        unint64_t v9 = v7;
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

- (NSArray)controls
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2 = [(ASAClockDevice *)self controlObjectIDs];
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
        unint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        unsigned int v10 = [ASAObject alloc];
        v11 = -[ASAObject initWithAudioObjectID:](v10, "initWithAudioObjectID:", objc_msgSend(v9, "unsignedIntValue", (void)v16));
        int v12 = [(ASAObject *)v11 baseClass];
        if (v12 > 1936483441)
        {
          if (v12 != 1936483442)
          {
            unsigned int v13 = off_26484CF88;
            if (v12 == 1953458028) {
              goto LABEL_15;
            }
            goto LABEL_12;
          }
          unsigned int v13 = off_26484CFD0;
        }
        else
        {
          if (v12 != 1818588780)
          {
            if (v12 == 1936483188)
            {
              unsigned int v13 = off_26484CFC8;
              goto LABEL_15;
            }
LABEL_12:
            unsigned int v13 = off_26484CFA0;
            goto LABEL_15;
          }
          unsigned int v13 = off_26484CFB0;
        }
LABEL_15:
        v14 = objc_msgSend(objc_alloc(*v13), "initWithAudioObjectID:", -[ASAObject objectID](v11, "objectID"));
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

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v68.receiver = self;
  v68.super_class = (Class)ASAClockDevice;
  BOOL v59 = v4;
  uint64_t v7 = [(ASAObject *)&v68 diagnosticDescriptionWithIndent:v6 walkTree:v4];
  unint64_t v8 = [v6 stringByAppendingString:@"|        "];
  id v9 = [(ASAClockDevice *)self name];
  [v7 appendFormat:@"%@|    Name: %s\n", v6, objc_msgSend(v9, "UTF8String")];

  id v10 = [(ASAClockDevice *)self manufacturer];
  [v7 appendFormat:@"%@|    Manufacturer: %s\n", v6, objc_msgSend(v10, "UTF8String")];

  id v11 = [(ASAClockDevice *)self deviceUID];
  [v7 appendFormat:@"%@|    Device UID: %s\n", v6, objc_msgSend(v11, "UTF8String")];

  int v12 = [(ASAClockDevice *)self transportType];
  LODWORD(v13) = v12 >> 24;
  if ((v12 - 0x20000000) >> 24 >= 0x5F) {
    uint64_t v13 = 32;
  }
  else {
    uint64_t v13 = v13;
  }
  LODWORD(v14) = v12 << 8 >> 24;
  if (((v12 << 8) - 0x20000000) >> 24 >= 0x5F) {
    uint64_t v14 = 32;
  }
  else {
    uint64_t v14 = v14;
  }
  if (((v12 << 16) - 0x20000000) >> 24 >= 0x5F) {
    uint64_t v15 = 32;
  }
  else {
    uint64_t v15 = ((__int16)v12 >> 8);
  }
  if (v12 << 24 == 2130706432 || v12 << 24 < 520093697) {
    uint64_t v17 = 32;
  }
  else {
    uint64_t v17 = (char)v12;
  }
  [v7 appendFormat:@"%@|    Transport Type: %c%c%c%c\n", v6, v13, v14, v15, v17];
  [v7 appendFormat:@"%@|    Clock Domain: 0x%08x\n", v6, -[ASAClockDevice clockDomain](self, "clockDomain")];
  if ([(ASAClockDevice *)self isAlive]) {
    long long v18 = @"YES";
  }
  else {
    long long v18 = @"NO";
  }
  [v7 appendFormat:@"%@|    Is Active: %@\n", v6, v18];
  if ([(ASAClockDevice *)self isRunning]) {
    long long v19 = @"YES";
  }
  else {
    long long v19 = @"NO";
  }
  [v7 appendFormat:@"%@|    Is Running: %@\n", v6, v19];
  [(ASAClockDevice *)self nominalSampleRate];
  [v7 appendFormat:@"%@|    Nominal Sample Rate: %f\n", v6, v20];
  v58 = v6;
  [v7 appendFormat:@"%@|    Available Nominal Sample Rates:\n", v6];
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  uint64_t v21 = [(ASAClockDevice *)self nominalSampleRates];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v64 objects:v70 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = 0;
    uint64_t v25 = *(void *)v65;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v65 != v25) {
          objc_enumerationMutation(v21);
        }
        [*(id *)(*((void *)&v64 + 1) + 8 * i) doubleValue];
        [v7 appendFormat:@"%@Rate[%u]: %f\n", v8, v24 + i, v27];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v64 objects:v70 count:16];
      uint64_t v24 = (v24 + i);
    }
    while (v23);
  }

  BOOL v28 = [(ASAClockDevice *)self isHidden];
  v29 = @"NO";
  if (v28) {
    v29 = @"YES";
  }
  [v7 appendFormat:@"%@|    Is Hidden: %@\n", v58, v29];
  [v7 appendFormat:@"%@|    Zero Timestamp Period: %u\n", v58, -[ASAClockDevice zeroTimestampPeriod](self, "zeroTimestampPeriod")];
  [v7 appendFormat:@"%@|    Controls:\n", v58];
  v30 = [(ASAClockDevice *)self controlObjectIDs];
  if ([v30 count])
  {
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    v56 = v30;
    obuint64_t j = v30;
    uint64_t v31 = [obj countByEnumeratingWithState:&v60 objects:v69 count:16];
    if (!v31) {
      goto LABEL_83;
    }
    uint64_t v32 = v31;
    uint64_t v33 = 0;
    uint64_t v34 = *(void *)v61;
    while (1)
    {
      for (uint64_t j = 0; j != v32; ++j)
      {
        if (*(void *)v61 != v34) {
          objc_enumerationMutation(obj);
        }
        v36 = *(void **)(*((void *)&v60 + 1) + 8 * j);
        if (!v59)
        {
          [v7 appendFormat:@"%@|        %u: %u\n", v58, v33 + j, objc_msgSend(v36, "unsignedIntValue")];
          continue;
        }
        v37 = -[ASAObject initWithAudioObjectID:]([ASAObject alloc], "initWithAudioObjectID:", [v36 unsignedIntValue]);
        uint64_t v38 = [(ASAObject *)v37 baseClass];
        uint64_t v39 = v38;
        if ((int)v38 > 1936483441)
        {
          if (v38 == 1936483442)
          {
            v40 = ASASliderControl;
          }
          else
          {
            if (v38 != 1953458028)
            {
LABEL_46:
              uint64_t v41 = [(ASAObject *)v37 objectClass];
              uint64_t v42 = [(ASAObject *)v37 objectID];
              LODWORD(v43) = BYTE3(v39);
              if ((v39 - 0x20000000) >> 24 >= 0x5F) {
                uint64_t v43 = 32;
              }
              else {
                uint64_t v43 = v43;
              }
              if (((v39 << 8) - 0x20000000) >> 24 >= 0x5F) {
                uint64_t v44 = 32;
              }
              else {
                uint64_t v44 = BYTE2(v39);
              }
              if (((v39 << 16) - 0x20000000) >> 24 >= 0x5F) {
                uint64_t v45 = 32;
              }
              else {
                uint64_t v45 = BYTE1(v39);
              }
              if (v39 << 24 == 2130706432 || v39 << 24 < 520093697) {
                uint64_t v47 = 32;
              }
              else {
                uint64_t v47 = v39;
              }
              LODWORD(v48) = (int)v41 >> 24;
              if ((v41 - 0x20000000) >> 24 >= 0x5F) {
                uint64_t v48 = 32;
              }
              else {
                uint64_t v48 = v48;
              }
              LODWORD(v49) = (int)(v41 << 8) >> 24;
              if (((v41 << 8) - 0x20000000) >> 24 >= 0x5F) {
                uint64_t v49 = 32;
              }
              else {
                uint64_t v49 = v49;
              }
              LODWORD(v50) = (__int16)v41 >> 8;
              if (((v41 << 16) - 0x20000000) >> 24 >= 0x5F) {
                uint64_t v50 = 32;
              }
              else {
                uint64_t v50 = v50;
              }
              if (v41 << 24 == 2130706432 || v41 << 24 < 520093697) {
                uint64_t v52 = 32;
              }
              else {
                uint64_t v52 = (char)v41;
              }
              [v7 appendFormat:@"%@|        %u: Object %u has unknown control class  %c%c%c%c (0x%08x) %c%c%c%c (0x%08x)\n", v58, v33 + j, v42, v43, v44, v45, v47, v39, v48, v49, v50, v52, v41];
              goto LABEL_80;
            }
            v40 = ASABooleanControl;
          }
        }
        else if (v38 == 1818588780)
        {
          v40 = ASALevelControl;
        }
        else
        {
          if (v38 != 1936483188) {
            goto LABEL_46;
          }
          v40 = ASASelectorControl;
        }
        v53 = objc_msgSend([v40 alloc], "initWithAudioObjectID:", -[ASAObject objectID](v37, "objectID"));
        v54 = [v53 diagnosticDescriptionWithIndent:v8 walkTree:1];
        [v7 appendString:v54];

LABEL_80:
      }
      uint64_t v32 = [obj countByEnumeratingWithState:&v60 objects:v69 count:16];
      uint64_t v33 = (v33 + j);
      if (!v32)
      {
LABEL_83:

        v30 = v56;
        break;
      }
    }
  }

  return v7;
}

- (id)coreAudioClassName
{
  return @"AudioClockDevice";
}

@end