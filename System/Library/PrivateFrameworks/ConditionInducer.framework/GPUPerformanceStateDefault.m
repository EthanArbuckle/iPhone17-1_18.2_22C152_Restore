@interface GPUPerformanceStateDefault
+ (BOOL)supportsConsistentStateDevice:(id)a3;
+ (id)consistentStateDevice;
+ (id)description;
+ (id)perfLevelEnumToGPUStateStringKey:(unsigned int)a3;
+ (id)profileFriendlyName;
+ (unsigned)ioAccelerator;
- (BOOL)_acquireLock;
- (BOOL)_setConsistentPerformanceLevel;
- (BOOL)active;
- (BOOL)isDestructive;
- (BOOL)isInternalOnly;
- (BOOL)setUp;
- (GPUPerformanceStateDefault)initWithGPUPerformanceState:(unsigned int)a3;
- (id)identifierName;
- (id)userFriendlyName;
- (unsigned)desiredGPUPerformanceState;
- (void)_acquireLock;
- (void)_cleanup;
- (void)_dumpCurrentState:(id)a3;
- (void)_setConsistentPerformanceLevel;
- (void)active;
- (void)setDesiredGPUPerformanceState:(unsigned int)a3;
- (void)setUp;
- (void)tearDown;
@end

@implementation GPUPerformanceStateDefault

+ (unsigned)ioAccelerator
{
  mach_port_t v2 = *MEMORY[0x263F0EC90];
  CFDictionaryRef v3 = IOServiceMatching("IOAccelerator");
  unsigned int result = IOServiceGetMatchingService(v2, v3);
  if (!result)
  {
    CFDictionaryRef v5 = IOServiceMatching("IOAcceleratorES");
    return IOServiceGetMatchingService(v2, v5);
  }
  return result;
}

+ (BOOL)supportsConsistentStateDevice:(id)a3
{
  id v3 = a3;
  if (v3
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    char v4 = objc_opt_respondsToSelector();
  }
  else
  {
    char v4 = 0;
  }

  return v4 & 1;
}

+ (id)consistentStateDevice
{
  id v2 = MTLCreateSystemDefaultDevice();
  if (+[GPUPerformanceStateDefault supportsConsistentStateDevice:v2])
  {
    id v3 = v2;
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

+ (id)perfLevelEnumToGPUStateStringKey:(unsigned int)a3
{
  if (a3 < 4) {
    return off_264935EE0[a3];
  }
  BOOL v4 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
  if (v4) {
    +[GPUPerformanceStateDefault perfLevelEnumToGPUStateStringKey:](v4, v5, v6, v7, v8, v9, v10, v11);
  }
  return 0;
}

- (id)identifierName
{
  uint64_t v8 = 0;
  id v2 = @"GPUPerformanceState";
  id v3 = +[COConditionSession prepareInfoDictForBuiltInCondition:@"GPUPerformanceState" error:&v8];
  BOOL v4 = [v3 objectForKey:@"ConditionIdentifierName"];
  uint64_t v5 = v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6) {
    id v2 = v4;
  }

  return v2;
}

- (id)userFriendlyName
{
  uint64_t v6 = 0;
  id v2 = +[COConditionSession prepareInfoDictForBuiltInCondition:@"GPUPerformanceState" error:&v6];
  id v3 = v2;
  if (v2)
  {
    BOOL v4 = [v2 objectForKey:@"ConditionUserFriendlyName"];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)isDestructive
{
  uint64_t v5 = 0;
  id v2 = +[COConditionSession prepareInfoDictForBuiltInCondition:@"GPUPerformanceState" error:&v5];
  id v3 = v2;
  if (v2)
  {
    [v2 valueForKey:@"ConditionIsDestructive"];
  }
  return 1;
}

- (BOOL)isInternalOnly
{
  uint64_t v5 = 0;
  id v2 = +[COConditionSession prepareInfoDictForBuiltInCondition:@"GPUPerformanceState" error:&v5];
  id v3 = v2;
  if (v2)
  {
    [v2 valueForKey:@"ConditionIsInternalOnly"];
  }
  return 1;
}

+ (id)description
{
  return @"Set GPU performance state to default behavior";
}

+ (id)profileFriendlyName
{
  return @"Default";
}

- (GPUPerformanceStateDefault)initWithGPUPerformanceState:(unsigned int)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v9.receiver = self;
  v9.super_class = (Class)GPUPerformanceStateDefault;
  BOOL v4 = [(COCondition *)&v9 init];
  uint64_t v5 = v4;
  if (v4)
  {
    if (!a3) {
      -[GPUPerformanceStateDefault initWithGPUPerformanceState:]();
    }
    v4->_desiredGPUPerformanceState = a3;
    v4->_acceleratorService = +[GPUPerformanceStateDefault ioAccelerator];
    v5->_performanceLevel = a3;
    uint64_t v6 = objc_opt_new();
    applePMPPerfStateControl = v5->_applePMPPerfStateControl;
    v5->_applePMPPerfStateControl = (ApplePMPPerfStateControl *)v6;

    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v11 = a3;
      _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "Set Performance State: %lu", buf, 0xCu);
    }
  }
  return v5;
}

- (BOOL)_acquireLock
{
  uint64_t outputStruct = 256;
  BOOL v2 = CallIO(self->_connection, &outputStruct, &outputStruct, (uint64_t)"ConsistentPerfState_Lock");
  if (!v2)
  {
    BOOL v3 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
    if (v3) {
      [(GPUPerformanceStateDefault *)v3 _acquireLock];
    }
  }
  return v2;
}

- (void)_cleanup
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_fault_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_FAULT, "Unable to reset %@ Condition", (uint8_t *)&v1, 0xCu);
}

- (BOOL)_setConsistentPerformanceLevel
{
  if (!self->_consistentDevice)
  {
    uint64_t outputStruct = 1;
    p_performanceLevel = (int *)&self->_performanceLevel;
    BYTE1(outputStruct) = self->_performanceLevel;
    if (!CallIO(self->_connection, &outputStruct, &outputStruct, (uint64_t)"ConsistentPerfState_Set"))
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
        -[GPUPerformanceStateDefault _setConsistentPerformanceLevel](p_performanceLevel);
      }
      goto LABEL_9;
    }
    goto LABEL_6;
  }
  uint64_t v2 = (int *)&self->_performanceLevel;
  if ([(AGXConsistentStateDevice *)self->_consistentDevice enableConsistentPerfState:self->_performanceLevel])
  {
LABEL_6:
    LOBYTE(v3) = 1;
    return v3;
  }
  BOOL v3 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
  if (v3)
  {
    -[GPUPerformanceStateDefault _setConsistentPerformanceLevel](v2);
LABEL_9:
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)setUp
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    uint64_t v10 = self;
    _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "Starting Setup - %@ Condition", (uint8_t *)&v9, 0xCu);
  }
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.dt.gputools.gpuperfstate"];
  [v3 setInteger:self->_performanceLevel forKey:@"gpuperfstate"];
  uint64_t v4 = +[GPUPerformanceStateDefault consistentStateDevice];
  consistentDevice = self->_consistentDevice;
  self->_consistentDevice = v4;

  if (!self->_consistentDevice)
  {
    if (IOServiceOpen(self->_acceleratorService, *MEMORY[0x263EF8960], 1u, &self->_connection))
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
        -[GPUPerformanceStateDefault setUp]((uint64_t)self);
      }
      goto LABEL_12;
    }
    if (![(GPUPerformanceStateDefault *)self _acquireLock]) {
      goto LABEL_13;
    }
  }
  if (![(GPUPerformanceStateDefault *)self _setConsistentPerformanceLevel])
  {
LABEL_12:
    [(GPUPerformanceStateDefault *)self _cleanup];
LABEL_13:
    BOOL v7 = 0;
    goto LABEL_14;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    uint64_t v10 = self;
    _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "Finished Setup - %@ Condition", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v6 = [NSString stringWithUTF8String:"-[GPUPerformanceStateDefault setUp]"];
  [(GPUPerformanceStateDefault *)self _dumpCurrentState:v6];

  if ([(ApplePMPPerfStateControl *)self->_applePMPPerfStateControl setupConnectionForPowerState:self->_performanceLevel - 1])
  {
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 1;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      uint64_t v10 = self;
      _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "Unable to Setup PMP %@ Condition", (uint8_t *)&v9, 0xCu);
    }
  }
LABEL_14:

  return v7;
}

- (void)_dumpCurrentState:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  consistentDevice = self->_consistentDevice;
  if (consistentDevice)
  {
    uint64_t v6 = [(AGXConsistentStateDevice *)consistentDevice getConsistentPerfStateInfoAndReset:0];
    if (v6)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v26 = v4;
        __int16 v27 = 2112;
        *(void *)v28 = v6;
        _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "%@ Consistent Perf State Status: %@", buf, 0x16u);
      }
    }
    else
    {
      BOOL v8 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
      if (v8) {
        -[GPUPerformanceStateDefault _dumpCurrentState:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  else
  {
    mach_port_t connection = self->_connection;
    if (connection)
    {
      uint64_t outputStruct = 2;
      if (CallIO(connection, &outputStruct, &outputStruct, (uint64_t)"ConsistentPerfState_Get"))
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138413058;
          id v26 = v4;
          __int16 v27 = 1024;
          *(_DWORD *)v28 = BYTE2(outputStruct);
          *(_WORD *)&v28[4] = 1024;
          *(_DWORD *)&v28[6] = BYTE3(outputStruct);
          __int16 v29 = 1024;
          int v30 = BYTE4(outputStruct);
          _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "%@ Consistent Perf State Status: is_enabled=%u was_maintained=%u level=%u", buf, 0x1Eu);
        }
      }
      else
      {
        BOOL v16 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
        if (v16) {
          -[GPUPerformanceStateDefault _dumpCurrentState:](v16, v17, v18, v19, v20, v21, v22, v23);
        }
      }
    }
  }
}

- (void)tearDown
{
  BOOL v3 = [NSString stringWithUTF8String:"-[GPUPerformanceStateDefault tearDown]"];
  [(GPUPerformanceStateDefault *)self _dumpCurrentState:v3];

  [(GPUPerformanceStateDefault *)self _cleanup];
}

- (BOOL)active
{
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.dt.gputools.gpuperfstate"];
  if (!self->_performanceLevel) {
    -[GPUPerformanceStateDefault active]();
  }
  id v4 = v3;
  BOOL v5 = self->_performanceLevel == [v3 integerForKey:@"gpuperfstate"];

  return v5;
}

- (unsigned)desiredGPUPerformanceState
{
  return self->_desiredGPUPerformanceState;
}

- (void)setDesiredGPUPerformanceState:(unsigned int)a3
{
  self->_desiredGPUPerformanceState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applePMPPerfStateControl, 0);

  objc_storeStrong((id *)&self->_consistentDevice, 0);
}

+ (void)perfLevelEnumToGPUStateStringKey:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithGPUPerformanceState:.cold.1()
{
  __assert_rtn("-[GPUPerformanceStateDefault initWithGPUPerformanceState:]", "GPUPerformanceState.m", 281, "desiredGPUPerformanceState != GPUPerformanceStateLevelNone");
}

- (void)_acquireLock
{
}

- (void)_setConsistentPerformanceLevel
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = *a1;
  v2[0] = 67109120;
  v2[1] = v1;
  _os_log_fault_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_FAULT, "Error, fail to set consistent perf state to level = %u!", (uint8_t *)v2, 8u);
}

- (void)setUp
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_fault_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_FAULT, "Unable to set %@ Condition", (uint8_t *)&v1, 0xCu);
}

- (void)_dumpCurrentState:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)active
{
  __assert_rtn("-[GPUPerformanceStateDefault active]", "GPUPerformanceState.m", 420, "_performanceLevel != GPUPerformanceStateLevelNone");
}

@end