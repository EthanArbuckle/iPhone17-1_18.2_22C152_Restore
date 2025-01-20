@interface ThermalNominal
+ (id)description;
+ (id)profileFriendlyName;
+ (id)thermalStateEnumToCLTMStringKey:(int64_t)a3;
- (BOOL)active;
- (BOOL)isDestructive;
- (BOOL)isInternalOnly;
- (BOOL)setUp;
- (ThermalNominal)init;
- (ThermalNominal)initWithThermalLevel:(int64_t)a3;
- (id)identifierName;
- (id)userFriendlyName;
- (int64_t)actualState;
- (int64_t)desiredState;
- (void)setActualState:(int64_t)a3;
- (void)setDesiredState:(int64_t)a3;
- (void)setUp;
- (void)tearDown;
@end

@implementation ThermalNominal

+ (id)thermalStateEnumToCLTMStringKey:(int64_t)a3
{
  if ((unint64_t)a3 < 4) {
    return off_264935DC0[a3];
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
    +[ThermalNominal thermalStateEnumToCLTMStringKey:]();
  }
  return 0;
}

- (id)identifierName
{
  uint64_t v8 = 0;
  v2 = @"ThermalCondition";
  v3 = +[COConditionSession prepareInfoDictForBuiltInCondition:@"ThermalCondition" error:&v8];
  v4 = [v3 objectForKey:@"ConditionIdentifierName"];
  v5 = v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6) {
    v2 = v4;
  }

  return v2;
}

- (id)userFriendlyName
{
  uint64_t v6 = 0;
  v2 = +[COConditionSession prepareInfoDictForBuiltInCondition:@"ThermalCondition" error:&v6];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 objectForKey:@"ConditionUserFriendlyName"];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isDestructive
{
  uint64_t v5 = 0;
  v2 = +[COConditionSession prepareInfoDictForBuiltInCondition:@"ThermalCondition" error:&v5];
  v3 = v2;
  if (v2)
  {
    [v2 valueForKey:@"ConditionIsDestructive"];
  }
  return 1;
}

- (BOOL)isInternalOnly
{
  uint64_t v5 = 0;
  v2 = +[COConditionSession prepareInfoDictForBuiltInCondition:@"ThermalCondition" error:&v5];
  v3 = v2;
  if (v2)
  {
    [v2 valueForKey:@"ConditionIsInternalOnly"];
  }
  return 1;
}

+ (id)description
{
  return @"Simulate nominal thermal pressure";
}

+ (id)profileFriendlyName
{
  return @"Thermal State: Nominal";
}

- (ThermalNominal)init
{
  return [(ThermalNominal *)self initWithThermalLevel:0];
}

- (ThermalNominal)initWithThermalLevel:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)ThermalNominal;
  v4 = [(COCondition *)&v10 init];
  uint64_t v5 = v4;
  if (v4
    && (v4->_desiredState = a3,
        +[ThermalNominal thermalStateEnumToCLTMStringKey:a3], uint64_t v6 = objc_claimAutoreleasedReturnValue(), thermalLevelKey = v5->_thermalLevelKey, v5->_thermalLevelKey = (NSString *)v6, thermalLevelKey, !v5->_thermalLevelKey))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ThermalNominal initWithThermalLevel:](a3);
    }
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = v5;
  }

  return v8;
}

- (BOOL)setUp
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v17 = self;
    _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "Starting Setup - %@ Condition", buf, 0xCu);
  }
  v3 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.cltm"];
  [v3 setObject:self->_thermalLevelKey forKey:@"thermalSimulationMode"];
  int v4 = 30;
  uint64_t v5 = &_os_log_internal;
  *(void *)&long long v6 = 134218240;
  long long v15 = v6;
  while (1)
  {
    v7 = objc_msgSend(MEMORY[0x263F08AB0], "processInfo", v15);
    -[ThermalNominal setActualState:](self, "setActualState:", [v7 thermalState]);

    int64_t v8 = [(ThermalNominal *)self actualState];
    if (v8 >= [(ThermalNominal *)self desiredState]) {
      break;
    }
    [MEMORY[0x263F08B88] sleepForTimeInterval:0.5];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int64_t v9 = [(ThermalNominal *)self actualState];
      int64_t v10 = [(ThermalNominal *)self desiredState];
      *(_DWORD *)buf = v15;
      v17 = (ThermalNominal *)v9;
      __int16 v18 = 2048;
      int64_t v19 = v10;
      _os_log_debug_impl(&dword_22CE75000, v5, OS_LOG_TYPE_DEBUG, "Thermal state is at currently at %lu, and the desired state is %lu", buf, 0x16u);
    }
    if (!--v4) {
      goto LABEL_11;
    }
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int64_t v11 = [(ThermalNominal *)self actualState];
    int64_t v12 = [(ThermalNominal *)self desiredState];
    *(_DWORD *)buf = v15;
    v17 = (ThermalNominal *)v11;
    __int16 v18 = 2048;
    int64_t v19 = v12;
    _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "Thermal state is at %lu, which is at or above the desired state of %lu", buf, 0x16u);
  }
LABEL_11:
  int64_t v13 = [(ThermalNominal *)self actualState];
  if (v13 < [(ThermalNominal *)self desiredState]
    && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
  {
    -[ThermalNominal setUp](self);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v17 = self;
    _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "Finished Setup - %@ Condition", buf, 0xCu);
  }

  return 1;
}

- (void)tearDown
{
  id v2 = (id)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.cltm"];
  [v2 setObject:@"off" forKey:@"thermalSimulationMode"];
  sleep(5u);
}

- (BOOL)active
{
  v3 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.cltm"];
  int v4 = [v3 objectForKey:@"thermalSimulationMode"];
  LOBYTE(self) = [v4 isEqualToString:self->_thermalLevelKey];

  return (char)self;
}

- (int64_t)actualState
{
  return self->_actualState;
}

- (void)setActualState:(int64_t)a3
{
  self->_actualState = a3;
}

- (int64_t)desiredState
{
  return self->_desiredState;
}

- (void)setDesiredState:(int64_t)a3
{
  self->_desiredState = a3;
}

- (void).cxx_destruct
{
}

+ (void)thermalStateEnumToCLTMStringKey:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_fault_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_FAULT, "We should not have reached this log line! It means we got an NSProcessInfoThermalState that is not handled in our switch!", v0, 2u);
}

- (void)initWithThermalLevel:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 134217984;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Unknown thermal state passed to enum translator: %lu", (uint8_t *)&v1, 0xCu);
}

- (void)setUp
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 134218240;
  uint64_t v3 = [a1 desiredState];
  __int16 v4 = 2048;
  uint64_t v5 = [a1 actualState];
  _os_log_fault_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_FAULT, "Timed out waiting for thermal mitigation to reach %lu. Last known level was %lu, but we will assume that we actually reached it and move on", (uint8_t *)&v2, 0x16u);
}

@end