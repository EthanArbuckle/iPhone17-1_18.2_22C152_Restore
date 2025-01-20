@interface ASAAudioDevice
- (BOOL)acquireHogMode;
- (BOOL)canBeDefaultDevice;
- (BOOL)canBeDefaultInputDevice;
- (BOOL)canBeDefaultOutputDevice;
- (BOOL)canBeDefaultSystemDevice;
- (BOOL)createAudioProcID:(void *)a3 forIOProc:(void *)a4 withClientData:(void *)a5 error:(id *)a6;
- (BOOL)destroyAudioProcID:(void *)a3 error:(id *)a4;
- (BOOL)hasInput;
- (BOOL)hasOutput;
- (BOOL)isAggregate;
- (BOOL)isAlive;
- (BOOL)isHidden;
- (BOOL)isRunning;
- (BOOL)releaseHogMode;
- (BOOL)setInputStreamUsage:(id)a3 forAudioProc:(void *)a4;
- (BOOL)setOutputStreamUsage:(id)a3 forAudioProc:(void *)a4;
- (BOOL)startAudioProc:(void *)a3 error:(id *)a4;
- (BOOL)stopAudioProc:(void *)a3 error:(id *)a4;
- (NSArray)controlObjectIDs;
- (NSArray)controls;
- (NSArray)inputStreamObjectIDs;
- (NSArray)inputStreams;
- (NSArray)nominalSampleRates;
- (NSArray)outputStreamObjectIDs;
- (NSArray)outputStreams;
- (NSArray)relatedDeviceObjectIDs;
- (NSDictionary)aggregateDescription;
- (NSDictionary)clientDescription;
- (NSDictionary)deviceDescription;
- (NSDictionary)headsetInfo;
- (NSString)clockDeviceUID;
- (NSString)deviceUID;
- (NSString)manufacturer;
- (NSString)modelUID;
- (NSString)name;
- (NSURL)iconURL;
- (OS_os_workgroup)ioThreadOSWorkgroup;
- (double)actualSampleRate;
- (double)nominalSampleRate;
- (float)ioCycleUsage;
- (id)coreAudioClassName;
- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4;
- (id)inputStreamUsageForAudioProc:(void *)a3;
- (id)outputStreamUsageForAudioProc:(void *)a3;
- (int)hogModeOwner;
- (unsigned)clockDomain;
- (unsigned)inputLatency;
- (unsigned)inputSafetyOffset;
- (unsigned)ioBufferFrameSize;
- (unsigned)maximumIOBufferFrameSize;
- (unsigned)minimumIOBufferFrameSize;
- (unsigned)outputLatency;
- (unsigned)outputSafetyOffset;
- (unsigned)transportType;
- (unsigned)zeroTimestampPeriod;
- (void)setClientDescription:(id)a3;
- (void)setClockDeviceUID:(id)a3;
- (void)setIoBufferFrameSize:(unsigned int)a3;
- (void)setIoCycleUsage:(float)a3;
- (void)setIoThreadOSWorkgroup:(id)a3;
- (void)setName:(id)a3;
- (void)setNominalSampleRate:(double)a3;
@end

@implementation ASAAudioDevice

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
  if ([(ASAObject *)self getMainGlobalProperty:1969841184 withData:&cf ofSize:&v6 withQualifier:0 ofSize:0])
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
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read device UID property\n", v4, 2u);
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

- (BOOL)canBeDefaultDevice
{
  int v5 = 4;
  int v4 = 0;
  if (![(ASAObject *)self getMainGlobalProperty:1684434036 withData:&v4 ofSize:&v5 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read can be default device property\n", v3, 2u);
  }
  return v4 != 0;
}

- (BOOL)canBeDefaultInputDevice
{
  int v5 = 4;
  int v4 = 0;
  if (![(ASAObject *)self getMainInputProperty:1684434036 withData:&v4 ofSize:&v5 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read can be default device property (input)\n", v3, 2u);
  }
  return v4 != 0;
}

- (BOOL)canBeDefaultOutputDevice
{
  int v5 = 4;
  int v4 = 0;
  if (![(ASAObject *)self getMainOutputProperty:1684434036 withData:&v4 ofSize:&v5 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read can be default device property (output)\n", v3, 2u);
  }
  return v4 != 0;
}

- (BOOL)canBeDefaultSystemDevice
{
  int v5 = 4;
  int v4 = 0;
  if (![(ASAObject *)self getMainGlobalProperty:1936092276 withData:&v4 ofSize:&v5 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read can be default system device property\n", v3, 2u);
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

- (unsigned)inputSafetyOffset
{
  int v5 = 4;
  unsigned int v4 = 0;
  if (![(ASAObject *)self getMainInputProperty:1935763060 withData:&v4 ofSize:&v5 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read input safety offset property\n", v3, 2u);
  }
  return v4;
}

- (unsigned)outputSafetyOffset
{
  int v5 = 4;
  unsigned int v4 = 0;
  if (![(ASAObject *)self getMainOutputProperty:1935763060 withData:&v4 ofSize:&v5 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read output safety offset property\n", v3, 2u);
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

- (unsigned)ioBufferFrameSize
{
  int v5 = 4;
  unsigned int v4 = 0;
  if (![(ASAObject *)self getMainOutputProperty:1718839674 withData:&v4 ofSize:&v5 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read IO buffer frame size property\n", v3, 2u);
  }
  return v4;
}

- (void)setIoBufferFrameSize:(unsigned int)a3
{
  unsigned int v3 = a3;
  [(ASAObject *)self setMainGlobalProperty:1718839674 withData:&v3 ofSize:4 withQualifier:0 ofSize:0];
}

- (unsigned)minimumIOBufferFrameSize
{
  v6[0] = 0.0;
  v6[1] = 0.0;
  int v5 = 16;
  if ([(ASAObject *)self getMainOutputProperty:1718843939 withData:v6 ofSize:&v5 withQualifier:0 ofSize:0])
  {
    return v6[0];
  }
  BOOL v3 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
  unsigned int result = 0;
  if (v3)
  {
    *(_WORD *)unsigned int v4 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read IO buffer frame size range property\n", v4, 2u);
    return 0;
  }
  return result;
}

- (unsigned)maximumIOBufferFrameSize
{
  uint64_t v5 = 0;
  double v6 = 0.0;
  int v4 = 16;
  if ([(ASAObject *)self getMainOutputProperty:1718843939 withData:&v5 ofSize:&v4 withQualifier:0 ofSize:0])
  {
    return v6;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read IO buffer frame size range property\n", v3, 2u);
  }
  return -1;
}

- (OS_os_workgroup)ioThreadOSWorkgroup
{
  int v6 = 8;
  id v5 = 0;
  if (![(ASAObject *)self getMainGlobalProperty:1869838183 withData:&v5 ofSize:&v6 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read IO thread OS workgroup property", v4, 2u);
  }
  id v2 = v5;

  return (OS_os_workgroup *)v2;
}

- (void)setIoThreadOSWorkgroup:(id)a3
{
  id v4 = a3;
  [(ASAObject *)self setMainGlobalProperty:1869838183 withData:&v4 ofSize:8 withQualifier:0 ofSize:0];
}

- (float)ioCycleUsage
{
  int v5 = 4;
  float v4 = 0.0;
  if (![(ASAObject *)self getMainGlobalProperty:1852012899 withData:&v4 ofSize:&v5 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read io cycle usage property\n", v3, 2u);
  }
  return v4;
}

- (void)setIoCycleUsage:(float)a3
{
  float v3 = a3;
  [(ASAObject *)self setMainGlobalProperty:1852012899 withData:&v3 ofSize:4 withQualifier:0 ofSize:0];
}

- (int)hogModeOwner
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v5 = 0;
  int v6 = 4;
  if (![(ASAObject *)self getMainGlobalProperty:1869180523 withData:&v5 ofSize:&v6 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    float v3 = [(ASAAudioDevice *)self deviceUID];
    *(_DWORD *)buf = 138412290;
    v8 = v3;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read hog mode property on %@", buf, 0xCu);
  }
  return v5;
}

- (BOOL)acquireHogMode
{
  pid_t v5 = getpid();
  int v3 = [(ASAAudioDevice *)self hogModeOwner];
  if (v3 == v5) {
    return 1;
  }
  if (v3 == -1) {
    return [(ASAObject *)self setMainGlobalProperty:1869180523 withData:&v5 ofSize:4 withQualifier:0 ofSize:0];
  }
  return 0;
}

- (BOOL)releaseHogMode
{
  pid_t v4 = getpid();
  return [(ASAAudioDevice *)self hogModeOwner] == v4
      && [(ASAObject *)self setMainGlobalProperty:1869180523 withData:&v4 ofSize:4 withQualifier:0 ofSize:0];
}

- (double)actualSampleRate
{
  int v5 = 8;
  double v4 = 0.0;
  if (![(ASAObject *)self getMainGlobalProperty:1634955892 withData:&v4 ofSize:&v5 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v3 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read actual sample rate property\n", v3, 2u);
  }
  return v4;
}

- (NSArray)relatedDeviceObjectIDs
{
  unsigned int v3 = [(ASAObject *)self sizeOfMainGlobalProperty:1634429294 withQualifier:0 ofSize:0];
  unsigned int v15 = v3;
  if (v3 && (size_t v4 = v3, (v5 = (unsigned int *)malloc_type_malloc(v3, 0x39A4275DuLL)) != 0))
  {
    int v6 = v5;
    bzero(v5, v4);
    BOOL v7 = [(ASAObject *)self getMainGlobalProperty:1634429294 withData:v6 ofSize:&v15 withQualifier:0 ofSize:0];
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

- (NSArray)nominalSampleRates
{
  unsigned int v3 = [(ASAObject *)self sizeOfMainGlobalProperty:1853059619 withQualifier:0 ofSize:0];
  unsigned int v15 = v3;
  if (v3 && (size_t v4 = v3, (v5 = (double *)malloc_type_malloc(v3, 0xD4A29D40uLL)) != 0))
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

- (NSArray)inputStreamObjectIDs
{
  unsigned int v3 = [MEMORY[0x263EFF980] array];
  unsigned int v4 = [(ASAObject *)self sizeOfMainInputProperty:1937009955 withQualifier:0 ofSize:0];
  unsigned int v13 = v4;
  if (v4)
  {
    size_t v5 = v4;
    int v6 = (unsigned int *)malloc_type_malloc(v4, 0x9F89C3D8uLL);
    if (v6)
    {
      BOOL v7 = v6;
      bzero(v6, v5);
      if ([(ASAObject *)self getMainInputProperty:1937009955 withData:v7 ofSize:&v13 withQualifier:0 ofSize:0]&& v13 >= 4)
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

- (NSArray)inputStreams
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v2 = [(ASAAudioDevice *)self inputStreamObjectIDs];
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
        unsigned int v10 = [ASAStream alloc];
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

- (NSArray)outputStreamObjectIDs
{
  unsigned int v3 = [MEMORY[0x263EFF980] array];
  unsigned int v4 = [(ASAObject *)self sizeOfMainOutputProperty:1937009955 withQualifier:0 ofSize:0];
  unsigned int v13 = v4;
  if (v4)
  {
    size_t v5 = v4;
    uint64_t v6 = (unsigned int *)malloc_type_malloc(v4, 0xEA2286A4uLL);
    if (v6)
    {
      uint64_t v7 = v6;
      bzero(v6, v5);
      if ([(ASAObject *)self getMainOutputProperty:1937009955 withData:v7 ofSize:&v13 withQualifier:0 ofSize:0]&& v13 >= 4)
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

- (NSArray)outputStreams
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v2 = [(ASAAudioDevice *)self outputStreamObjectIDs];
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
        unsigned int v10 = [ASAStream alloc];
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

- (NSArray)controlObjectIDs
{
  unsigned int v3 = [MEMORY[0x263EFF980] array];
  unsigned int v4 = [(ASAObject *)self sizeOfMainGlobalProperty:1668575852 withQualifier:0 ofSize:0];
  unsigned int v13 = v4;
  if (v4)
  {
    size_t v5 = v4;
    uint64_t v6 = (unsigned int *)malloc_type_malloc(v4, 0xFA451677uLL);
    if (v6)
    {
      uint64_t v7 = v6;
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
  id v2 = [(ASAAudioDevice *)self controlObjectIDs];
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
        long long v14 = objc_msgSend(objc_alloc(*v13), "initWithAudioObjectID:", -[ASAObject objectID](v11, "objectID"));
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

- (NSURL)iconURL
{
  if (![(ASAObject *)self hasMainGlobalProperty:1768124270]) {
    goto LABEL_7;
  }
  CFTypeRef cf = 0;
  int v6 = 8;
  if (![(ASAObject *)self getMainOutputProperty:1768124270 withData:&cf ofSize:&v6 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read output icon property\n", v5, 2u);
  }
  if (cf)
  {
    unsigned int v3 = [(id)cf absoluteURL];
    CFRelease(cf);
  }
  else
  {
LABEL_7:
    unsigned int v3 = 0;
  }
  return (NSURL *)v3;
}

- (BOOL)hasInput
{
  return [(ASAObject *)self sizeOfMainInputProperty:1937009955 withQualifier:0 ofSize:0] > 3;
}

- (BOOL)hasOutput
{
  return [(ASAObject *)self sizeOfMainOutputProperty:1937009955 withQualifier:0 ofSize:0] > 3;
}

- (BOOL)isAggregate
{
  return [(ASAAudioDevice *)self transportType] == 1735554416;
}

- (NSString)clockDeviceUID
{
  int v6 = 8;
  CFTypeRef cf = 0;
  if ([(ASAObject *)self getMainGlobalProperty:1634755428 withData:&cf ofSize:&v6 withQualifier:0 ofSize:0])
  {
    if (cf)
    {
      id v2 = objc_msgSend(NSString, "stringWithString:");
      CFRelease(cf);
      goto LABEL_7;
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read clock device UID property\n", v4, 2u);
  }
  id v2 = 0;
LABEL_7:
  return (NSString *)v2;
}

- (void)setClockDeviceUID:(id)a3
{
  id v4 = a3;
  if (![(ASAObject *)self setMainGlobalProperty:1634755428 withData:&v4 ofSize:8 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v3 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read clock device UID property\n", v3, 2u);
  }
}

- (NSDictionary)aggregateDescription
{
  if ([(ASAAudioDevice *)self isAggregate])
  {
    int v7 = 8;
    CFTypeRef cf = 0;
    if ([(ASAObject *)self getMainGlobalProperty:1633906541 withData:&cf ofSize:&v7 withQualifier:0 ofSize:0])
    {
      if (cf)
      {
        unsigned int v3 = objc_msgSend(NSDictionary, "dictionaryWithDictionary:");
        CFRelease(cf);
        goto LABEL_8;
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read aggregate description property\n", v5, 2u);
    }
  }
  unsigned int v3 = 0;
LABEL_8:
  return (NSDictionary *)v3;
}

- (NSDictionary)headsetInfo
{
  int v6 = 8;
  CFTypeRef cf = 0;
  if ([(ASAObject *)self getMainGlobalProperty:1751474532 withData:&cf ofSize:&v6 withQualifier:0 ofSize:0])
  {
    if (cf)
    {
      id v2 = objc_msgSend(NSDictionary, "dictionaryWithDictionary:");
      CFRelease(cf);
      goto LABEL_7;
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read headset info property\n", v4, 2u);
  }
  id v2 = 0;
LABEL_7:
  return (NSDictionary *)v2;
}

- (void)setClientDescription:(id)a3
{
  id v4 = a3;
  if (![(ASAObject *)self setMainGlobalProperty:1667523955 withData:&v4 ofSize:8 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v3 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not set client dictionary property\n", v3, 2u);
  }
}

- (NSDictionary)clientDescription
{
  int v6 = 8;
  CFTypeRef cf = 0;
  if ([(ASAObject *)self getMainGlobalProperty:1667523955 withData:&cf ofSize:&v6 withQualifier:0 ofSize:0])
  {
    if (cf)
    {
      id v2 = objc_msgSend(NSDictionary, "dictionaryWithDictionary:");
      CFRelease(cf);
      goto LABEL_7;
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read client description property\n", v4, 2u);
  }
  id v2 = 0;
LABEL_7:
  return (NSDictionary *)v2;
}

- (NSDictionary)deviceDescription
{
  int v6 = 8;
  CFTypeRef cf = 0;
  if ([(ASAObject *)self getMainGlobalProperty:1684301171 withData:&cf ofSize:&v6 withQualifier:0 ofSize:0])
  {
    if (cf)
    {
      id v2 = objc_msgSend(NSDictionary, "dictionaryWithDictionary:");
      CFRelease(cf);
      goto LABEL_7;
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read device description property\n", v4, 2u);
  }
  id v2 = 0;
LABEL_7:
  return (NSDictionary *)v2;
}

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v127 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v122.receiver = self;
  v122.super_class = (Class)ASAAudioDevice;
  BOOL v105 = v4;
  int v7 = [(ASAObject *)&v122 diagnosticDescriptionWithIndent:v6 walkTree:v4];
  unint64_t v8 = [v6 stringByAppendingString:@"|        "];
  id v9 = [(ASAAudioDevice *)self name];
  [v7 appendFormat:@"%@|    Name: %s\n", v6, objc_msgSend(v9, "UTF8String")];

  id v10 = [(ASAAudioDevice *)self manufacturer];
  [v7 appendFormat:@"%@|    Manufacturer: %s\n", v6, objc_msgSend(v10, "UTF8String")];

  id v11 = [(ASAAudioDevice *)self deviceUID];
  [v7 appendFormat:@"%@|    Device UID: %s\n", v6, objc_msgSend(v11, "UTF8String")];

  id v12 = [(ASAAudioDevice *)self modelUID];
  [v7 appendFormat:@"%@|    Model UID: %s\n", v6, objc_msgSend(v12, "UTF8String")];

  int v13 = [(ASAAudioDevice *)self transportType];
  LODWORD(v14) = v13 >> 24;
  if ((v13 - 0x20000000) >> 24 >= 0x5F) {
    uint64_t v14 = 32;
  }
  else {
    uint64_t v14 = v14;
  }
  LODWORD(v15) = v13 << 8 >> 24;
  if (((v13 << 8) - 0x20000000) >> 24 >= 0x5F) {
    uint64_t v15 = 32;
  }
  else {
    uint64_t v15 = v15;
  }
  if (((v13 << 16) - 0x20000000) >> 24 >= 0x5F) {
    uint64_t v16 = 32;
  }
  else {
    uint64_t v16 = ((__int16)v13 >> 8);
  }
  if (v13 << 24 == 2130706432 || v13 << 24 < 520093697) {
    uint64_t v18 = 32;
  }
  else {
    uint64_t v18 = (char)v13;
  }
  [v7 appendFormat:@"%@|    Transport Type: %c%c%c%c\n", v6, v14, v15, v16, v18];
  [v7 appendFormat:@"%@|    Clock Domain: 0x%08x\n", v6, -[ASAAudioDevice clockDomain](self, "clockDomain")];
  if ([(ASAAudioDevice *)self isAlive]) {
    long long v19 = @"YES";
  }
  else {
    long long v19 = @"NO";
  }
  [v7 appendFormat:@"%@|    Is Active: %@\n", v6, v19];
  if ([(ASAAudioDevice *)self isRunning]) {
    v20 = @"YES";
  }
  else {
    v20 = @"NO";
  }
  [v7 appendFormat:@"%@|    Is Running: %@\n", v6, v20];
  if ([(ASAAudioDevice *)self canBeDefaultDevice]) {
    uint64_t v21 = @"YES";
  }
  else {
    uint64_t v21 = @"NO";
  }
  [v7 appendFormat:@"%@|    Can Be Default Device: %@\n", v6, v21];
  if ([(ASAAudioDevice *)self canBeDefaultInputDevice]) {
    v22 = @"YES";
  }
  else {
    v22 = @"NO";
  }
  [v7 appendFormat:@"%@|    Can Be Default Input Device: %@\n", v6, v22];
  if ([(ASAAudioDevice *)self canBeDefaultOutputDevice]) {
    v23 = @"YES";
  }
  else {
    v23 = @"NO";
  }
  [v7 appendFormat:@"%@|    Can Be Default Output Device: %@\n", v6, v23];
  if ([(ASAAudioDevice *)self canBeDefaultSystemDevice]) {
    v24 = @"YES";
  }
  else {
    v24 = @"NO";
  }
  [v7 appendFormat:@"%@|    Can Be Default System Device: %@\n", v6, v24];
  [(ASAAudioDevice *)self nominalSampleRate];
  [v7 appendFormat:@"%@|    Nominal Sample Rate: %f\n", v6, v25];
  id v104 = v6;
  [v7 appendFormat:@"%@|    Available Nominal Sample Rates:\n", v6];
  v26 = [(ASAAudioDevice *)self nominalSampleRates];
  uint64_t v27 = [v26 count];

  if (v27)
  {
    unint64_t v28 = 0;
    uint64_t v29 = 0;
    do
    {
      v30 = [(ASAAudioDevice *)self nominalSampleRates];
      v31 = [v30 objectAtIndexedSubscript:v28];

      v32 = [(ASAAudioDevice *)self nominalSampleRates];
      v33 = [v32 objectAtIndexedSubscript:v28 + 1];

      [v31 doubleValue];
      uint64_t v35 = v34;
      [v33 doubleValue];
      [v7 appendFormat:@"%@Rate[%u]: %f - %f\n", v8, v29, v35, v36];
      uint64_t v29 = (v29 + 1);

      v37 = [(ASAAudioDevice *)self nominalSampleRates];
      unint64_t v38 = [v37 count];

      v28 += 2;
    }
    while (v38 > v28);
  }
  BOOL v39 = [(ASAAudioDevice *)self isHidden];
  v40 = @"NO";
  if (v39) {
    v40 = @"YES";
  }
  v41 = v104;
  [v7 appendFormat:@"%@|    Is Hidden: %@\n", v104, v40];
  [v7 appendFormat:@"%@|    Input Latency: %u\n", v104, -[ASAAudioDevice inputLatency](self, "inputLatency")];
  [v7 appendFormat:@"%@|    Output Latency: %u\n", v104, -[ASAAudioDevice outputLatency](self, "outputLatency")];
  [v7 appendFormat:@"%@|    Input Safety Offset: %u\n", v104, -[ASAAudioDevice inputSafetyOffset](self, "inputSafetyOffset")];
  [v7 appendFormat:@"%@|    Output Safety Offset: %u\n", v104, -[ASAAudioDevice outputSafetyOffset](self, "outputSafetyOffset")];
  [v7 appendFormat:@"%@|    Zero Timestamp Period: %u\n", v104, -[ASAAudioDevice zeroTimestampPeriod](self, "zeroTimestampPeriod")];
  [v7 appendFormat:@"%@|    IO Buffer Frame Size: %u\n", v104, -[ASAAudioDevice ioBufferFrameSize](self, "ioBufferFrameSize")];
  [v7 appendFormat:@"%@|    Minimum IO Buffer Frame Size: %u\n", v104, -[ASAAudioDevice minimumIOBufferFrameSize](self, "minimumIOBufferFrameSize")];
  [v7 appendFormat:@"%@|    Maximum IO Buffer Frame Size: %u\n", v104, -[ASAAudioDevice maximumIOBufferFrameSize](self, "maximumIOBufferFrameSize")];
  [(ASAAudioDevice *)self ioCycleUsage];
  [v7 appendFormat:@"%@|    IO Cycle Usage: %f\n", v104, v42];
  if ([(ASAAudioDevice *)self isRunning])
  {
    [(ASAAudioDevice *)self actualSampleRate];
    [v7 appendFormat:@"%@|    Actual Sample Rate: %f\n", v104, v43];
  }
  v44 = [(ASAAudioDevice *)self clockDeviceUID];
  v45 = v44;
  if (v44) {
    [v7 appendFormat:@"%@| Clock Device UID: %s\n", v104, objc_msgSend(v44, "UTF8String")];
  }
  [v7 appendFormat:@"%@|    Input Streams:\n", v104];
  v99 = [(ASAAudioDevice *)self inputStreamObjectIDs];
  v100 = self;
  v101 = v45;
  if ([v99 count])
  {
    long long v120 = 0u;
    long long v121 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    id v46 = v99;
    uint64_t v47 = [v46 countByEnumeratingWithState:&v118 objects:v126 count:16];
    if (v47)
    {
      uint64_t v48 = v47;
      uint64_t v49 = *(void *)v119;
      do
      {
        for (uint64_t i = 0; i != v48; ++i)
        {
          if (*(void *)v119 != v49) {
            objc_enumerationMutation(v46);
          }
          v51 = *(void **)(*((void *)&v118 + 1) + 8 * i);
          v52 = -[ASAObject initWithAudioObjectID:]([ASAStream alloc], "initWithAudioObjectID:", [v51 unsignedIntValue]);
          v53 = v52;
          if (v52)
          {
            v54 = [(ASAStream *)v52 diagnosticDescriptionWithIndent:v8 walkTree:v105];
            [v7 appendString:v54];
          }
          else
          {
            [v7 appendFormat:@"%@Could not get stream object with ID %u\n", v8, objc_msgSend(v51, "unsignedIntValue")];
          }
        }
        uint64_t v48 = [v46 countByEnumeratingWithState:&v118 objects:v126 count:16];
      }
      while (v48);
    }

    v41 = v104;
    self = v100;
    v45 = v101;
  }
  [v7 appendFormat:@"%@|    Output Streams:\n", v41];
  v98 = [(ASAAudioDevice *)self outputStreamObjectIDs];
  if ([v98 count])
  {
    long long v116 = 0u;
    long long v117 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    id v55 = v98;
    uint64_t v56 = [v55 countByEnumeratingWithState:&v114 objects:v125 count:16];
    if (v56)
    {
      uint64_t v57 = v56;
      uint64_t v58 = *(void *)v115;
      do
      {
        for (uint64_t j = 0; j != v57; ++j)
        {
          if (*(void *)v115 != v58) {
            objc_enumerationMutation(v55);
          }
          v60 = *(void **)(*((void *)&v114 + 1) + 8 * j);
          v61 = -[ASAObject initWithAudioObjectID:]([ASAStream alloc], "initWithAudioObjectID:", [v60 unsignedIntValue]);
          v62 = v61;
          if (v61)
          {
            v63 = [(ASAStream *)v61 diagnosticDescriptionWithIndent:v8 walkTree:v105];
            [v7 appendString:v63];
          }
          else
          {
            [v7 appendFormat:@"%@Could not get stream object with ID %u\n", v8, objc_msgSend(v60, "unsignedIntValue")];
          }
        }
        uint64_t v57 = [v55 countByEnumeratingWithState:&v114 objects:v125 count:16];
      }
      while (v57);
    }

    v41 = v104;
    self = v100;
    v45 = v101;
  }
  [v7 appendFormat:@"%@|    Controls:\n", v41];
  v64 = [(ASAAudioDevice *)self controlObjectIDs];
  v97 = v64;
  if ([v64 count])
  {
    long long v112 = 0u;
    long long v113 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    obuint64_t j = v64;
    uint64_t v65 = [obj countByEnumeratingWithState:&v110 objects:v124 count:16];
    if (!v65) {
      goto LABEL_116;
    }
    uint64_t v66 = v65;
    uint64_t v102 = 0;
    uint64_t v67 = *(void *)v111;
    while (1)
    {
      for (uint64_t k = 0; k != v66; ++k)
      {
        if (*(void *)v111 != v67) {
          objc_enumerationMutation(obj);
        }
        v69 = -[ASAObject initWithAudioObjectID:]([ASAObject alloc], "initWithAudioObjectID:", [*(id *)(*((void *)&v110 + 1) + 8 * k) unsignedIntValue]);
        uint64_t v70 = [(ASAObject *)v69 baseClass];
        uint64_t v71 = v70;
        if ((int)v70 > 1936483441)
        {
          if (v70 == 1936483442)
          {
            v72 = ASASliderControl;
            goto LABEL_113;
          }
          if (v70 == 1953458028)
          {
            v73 = [(ASAObject *)[ASABooleanControl alloc] initWithAudioObjectID:[(ASAObject *)v69 objectID]];
            v74 = [(ASABooleanControl *)v73 diagnosticDescriptionWithIndent:v8 walkTree:v105];
            [v7 appendString:v74];

            goto LABEL_114;
          }
        }
        else
        {
          if (v70 == 1818588780)
          {
            v72 = ASALevelControl;
            goto LABEL_113;
          }
          if (v70 == 1936483188)
          {
            v72 = ASASelectorControl;
LABEL_113:
            v87 = objc_msgSend([v72 alloc], "initWithAudioObjectID:", -[ASAObject objectID](v69, "objectID"));
            v88 = [v87 diagnosticDescriptionWithIndent:v8 walkTree:v105];
            [v7 appendString:v88];

            goto LABEL_114;
          }
        }
        uint64_t v75 = [(ASAObject *)v69 objectClass];
        uint64_t v76 = [(ASAObject *)v69 objectID];
        LODWORD(v77) = BYTE3(v71);
        if ((v71 - 0x20000000) >> 24 >= 0x5F) {
          uint64_t v77 = 32;
        }
        else {
          uint64_t v77 = v77;
        }
        if (((v71 << 8) - 0x20000000) >> 24 >= 0x5F) {
          uint64_t v78 = 32;
        }
        else {
          uint64_t v78 = BYTE2(v71);
        }
        if (((v71 << 16) - 0x20000000) >> 24 >= 0x5F) {
          uint64_t v79 = 32;
        }
        else {
          uint64_t v79 = BYTE1(v71);
        }
        if (v71 << 24 == 2130706432 || v71 << 24 < 520093697) {
          uint64_t v81 = 32;
        }
        else {
          uint64_t v81 = v71;
        }
        LODWORD(v82) = (int)v75 >> 24;
        if ((v75 - 0x20000000) >> 24 >= 0x5F) {
          uint64_t v82 = 32;
        }
        else {
          uint64_t v82 = v82;
        }
        LODWORD(v83) = (int)(v75 << 8) >> 24;
        if (((v75 << 8) - 0x20000000) >> 24 >= 0x5F) {
          uint64_t v83 = 32;
        }
        else {
          uint64_t v83 = v83;
        }
        LODWORD(v84) = (__int16)v75 >> 8;
        if (((v75 << 16) - 0x20000000) >> 24 >= 0x5F) {
          uint64_t v84 = 32;
        }
        else {
          uint64_t v84 = v84;
        }
        if (v75 << 24 == 2130706432 || v75 << 24 < 520093697) {
          uint64_t v86 = 32;
        }
        else {
          uint64_t v86 = (char)v75;
        }
        v41 = v104;
        [v7 appendFormat:@"%@|        %u: Object %u has unknown control class  %c%c%c%c (0x%08x) %c%c%c%c (0x%08x)\n", v104, v102 + k, v76, v77, v78, v79, v81, v71, v82, v83, v84, v86, v75];
LABEL_114:
      }
      uint64_t v66 = [obj countByEnumeratingWithState:&v110 objects:v124 count:16];
      uint64_t v102 = (v102 + k);
      if (!v66)
      {
LABEL_116:

        self = v100;
        v45 = v101;
        v64 = v97;
        break;
      }
    }
  }
  v89 = [(ASAAudioDevice *)self relatedDeviceObjectIDs];
  if ([v89 count])
  {
    [v7 appendFormat:@"%@|    Related Device Objects:\n", v41];
    long long v108 = 0u;
    long long v109 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    id v90 = v89;
    uint64_t v91 = [v90 countByEnumeratingWithState:&v106 objects:v123 count:16];
    if (v91)
    {
      uint64_t v92 = v91;
      uint64_t v93 = 0;
      uint64_t v94 = *(void *)v107;
      do
      {
        for (uint64_t m = 0; m != v92; ++m)
        {
          if (*(void *)v107 != v94) {
            objc_enumerationMutation(v90);
          }
          [v7 appendFormat:@"%@|        %u: %u\n", v104, v93 + m, objc_msgSend(*(id *)(*((void *)&v106 + 1) + 8 * m), "unsignedIntValue")];
        }
        uint64_t v92 = [v90 countByEnumeratingWithState:&v106 objects:v123 count:16];
        uint64_t v93 = (v93 + m);
      }
      while (v92);
    }

    v41 = v104;
    v45 = v101;
    v64 = v97;
  }

  return v7;
}

- (id)coreAudioClassName
{
  return @"AudioDevice";
}

- (BOOL)createAudioProcID:(void *)a3 forIOProc:(void *)a4 withClientData:(void *)a5 error:(id *)a6
{
  OSStatus IOProcID = AudioDeviceCreateIOProcID([(ASAObject *)self objectID], (AudioDeviceIOProc)a4, a5, (AudioDeviceIOProcID *)a3);
  OSStatus v8 = IOProcID;
  if (a6 && IOProcID)
  {
    *a6 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:IOProcID userInfo:0];
  }
  return v8 == 0;
}

- (BOOL)destroyAudioProcID:(void *)a3 error:(id *)a4
{
  OSStatus v5 = AudioDeviceDestroyIOProcID([(ASAObject *)self objectID], (AudioDeviceIOProcID)a3);
  OSStatus v6 = v5;
  if (a4 && v5)
  {
    *a4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:v5 userInfo:0];
  }
  return v6 == 0;
}

- (BOOL)startAudioProc:(void *)a3 error:(id *)a4
{
  OSStatus v5 = AudioDeviceStart([(ASAObject *)self objectID], (AudioDeviceIOProcID)a3);
  OSStatus v6 = v5;
  if (a4 && v5)
  {
    *a4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:v5 userInfo:0];
  }
  return v6 == 0;
}

- (BOOL)stopAudioProc:(void *)a3 error:(id *)a4
{
  OSStatus v5 = AudioDeviceStop([(ASAObject *)self objectID], (AudioDeviceIOProcID)a3);
  OSStatus v6 = v5;
  if (a4 && v5)
  {
    *a4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:v5 userInfo:0];
  }
  return v6 == 0;
}

- (id)inputStreamUsageForAudioProc:(void *)a3
{
  unsigned int v5 = [(ASAObject *)self sizeOfMainInputProperty:1937009955 withQualifier:0 ofSize:0];
  OSStatus v6 = 0;
  unsigned int v13 = v5;
  if (v5 >= 4)
  {
    unsigned int v7 = v5;
    unsigned int v13 = (v5 & 0xFFFFFFFC) + 12;
    OSStatus v8 = (unsigned int *)malloc_type_calloc(1uLL, v13, 0x17982E2FuLL);
    if (v8)
    {
      id v9 = v8;
      *(void *)OSStatus v8 = a3;
      v8[2] = v7 >> 2;
      OSStatus v6 = 0;
      if ([(ASAObject *)self getMainInputProperty:1937077093 withData:v8 ofSize:&v13 withQualifier:0 ofSize:0])
      {
        OSStatus v6 = [MEMORY[0x263EFF980] array];
        if (v9[2])
        {
          unint64_t v10 = 0;
          do
          {
            id v11 = [NSNumber numberWithBool:v9[v10 + 3] != 0];
            [v6 addObject:v11];

            ++v10;
          }
          while (v10 < v9[2]);
        }
      }
      free(v9);
    }
    else
    {
      OSStatus v6 = 0;
    }
  }
  return v6;
}

- (BOOL)setInputStreamUsage:(id)a3 forAudioProc:(void *)a4
{
  id v6 = a3;
  int v7 = [v6 count];
  int v8 = v7;
  if (v7 && (size_t v9 = (4 * v7 + 12), (v10 = malloc_type_calloc(1uLL, v9, 0x37501A32uLL)) != 0))
  {
    id v11 = v10;
    uint64_t v12 = 0;
    *unint64_t v10 = a4;
    *((_DWORD *)v10 + 2) = v8;
    do
    {
      unsigned int v13 = [v6 objectAtIndexedSubscript:v12];
      v11[v12 + 3] = [v13 unsignedIntValue];

      ++v12;
    }
    while (v8 != v12);
    BOOL v14 = [(ASAObject *)self setMainInputProperty:1937077093 withData:v11 ofSize:v9 withQualifier:0 ofSize:0];
    free(v11);
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (id)outputStreamUsageForAudioProc:(void *)a3
{
  unsigned int v5 = [(ASAObject *)self sizeOfMainOutputProperty:1937009955 withQualifier:0 ofSize:0];
  id v6 = 0;
  unsigned int v13 = v5;
  if (v5 >= 4)
  {
    unsigned int v7 = v5;
    unsigned int v13 = (v5 & 0xFFFFFFFC) + 12;
    int v8 = (unsigned int *)malloc_type_calloc(1uLL, v13, 0xB58B0B3CuLL);
    if (v8)
    {
      size_t v9 = v8;
      *(void *)int v8 = a3;
      v8[2] = v7 >> 2;
      id v6 = 0;
      if ([(ASAObject *)self getMainOutputProperty:1937077093 withData:v8 ofSize:&v13 withQualifier:0 ofSize:0])
      {
        id v6 = [MEMORY[0x263EFF980] array];
        if (v9[2])
        {
          unint64_t v10 = 0;
          do
          {
            id v11 = [NSNumber numberWithBool:v9[v10 + 3] != 0];
            [v6 addObject:v11];

            ++v10;
          }
          while (v10 < v9[2]);
        }
      }
      free(v9);
    }
    else
    {
      id v6 = 0;
    }
  }
  return v6;
}

- (BOOL)setOutputStreamUsage:(id)a3 forAudioProc:(void *)a4
{
  id v6 = a3;
  int v7 = [v6 count];
  int v8 = v7;
  if (v7 && (size_t v9 = (4 * v7 + 12), (v10 = malloc_type_calloc(1uLL, v9, 0xCE7706FDuLL)) != 0))
  {
    id v11 = v10;
    uint64_t v12 = 0;
    *unint64_t v10 = a4;
    *((_DWORD *)v10 + 2) = v8;
    do
    {
      unsigned int v13 = [v6 objectAtIndexedSubscript:v12];
      v11[v12 + 3] = [v13 unsignedIntValue];

      ++v12;
    }
    while (v8 != v12);
    BOOL v14 = [(ASAObject *)self setMainOutputProperty:1937077093 withData:v11 ofSize:v9 withQualifier:0 ofSize:0];
    free(v11);
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

@end