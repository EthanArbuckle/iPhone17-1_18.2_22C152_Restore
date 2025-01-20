@interface SampleAlgorithm
+ (id)algorithmWithData:(id)a3;
- (BOOL)freshInitNeeded;
- (NSNumber)runPeriod;
- (NSString)algoDescription;
- (NSString)name;
- (NSString)version;
- (OS_os_log)logger;
- (SampleAlgorithm)initWithSMCKeys:(id)a3 withSystemState:(id)a4 withSavedAlgoState:(id)a5;
- (id)output;
- (int)freshInitWithData:(id)a3;
- (int)runWithData:(id)a3;
- (unint64_t)runType;
- (void)setLogger:(id)a3;
@end

@implementation SampleAlgorithm

+ (id)algorithmWithData:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v6 = [v4 valueForKey:@"smcData"];
  v7 = [v4 valueForKey:@"systemState"];
  v8 = [v4 valueForKey:@"savedAlgoState"];

  v9 = (void *)[v5 initWithSMCKeys:v6 withSystemState:v7 withSavedAlgoState:v8];
  return v9;
}

- (int)freshInitWithData:(id)a3
{
  return 0;
}

- (SampleAlgorithm)initWithSMCKeys:(id)a3 withSystemState:(id)a4 withSavedAlgoState:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SampleAlgorithm;
  v7 = [(SampleAlgorithm *)&v17 init];
  os_log_t v8 = os_log_create("com.apple.batteryalgorithms", "SampleAlgorithm");
  logger = v7->_logger;
  v7->_logger = (OS_os_log *)v8;

  v10 = v7->_logger;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v6;
    _os_log_impl(&dword_248B51000, v10, OS_LOG_TYPE_DEFAULT, "I was passed in these keys: %@", buf, 0xCu);
  }
  name = v7->_name;
  v7->_name = (NSString *)@"SampleAlgorithm";

  version = v7->_version;
  v7->_version = (NSString *)@"1.0";

  algoDescription = v7->_algoDescription;
  v7->_algoDescription = (NSString *)@"Just to show that this works";

  uint64_t v14 = [NSNumber numberWithInt:90000];
  runPeriod = v7->_runPeriod;
  v7->_runPeriod = (NSNumber *)v14;

  v7->_freshInitNeeded = 1;
  return v7;
}

- (int)runWithData:(id)a3
{
  return 0;
}

- (id)output
{
  v10[3] = *MEMORY[0x263EF8340];
  v9[0] = @"savedAlgoState";
  v9[1] = @"kCoreAnalyticsData";
  v10[0] = &unk_26FCCD778;
  v10[1] = &unk_26FCCD7A0;
  v9[2] = @"kPowerLogData";
  v10[2] = &unk_26FCCD7C8;
  v3 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];
  id v4 = [NSDictionary dictionaryWithDictionary:v3];
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    os_log_t v8 = v4;
    _os_log_impl(&dword_248B51000, logger, OS_LOG_TYPE_DEFAULT, "Output Dictionary looks like : %@", (uint8_t *)&v7, 0xCu);
  }

  return v4;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)version
{
  return self->_version;
}

- (NSString)algoDescription
{
  return self->_algoDescription;
}

- (NSNumber)runPeriod
{
  return self->_runPeriod;
}

- (unint64_t)runType
{
  return self->_runType;
}

- (BOOL)freshInitNeeded
{
  return self->_freshInitNeeded;
}

- (OS_os_log)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_runPeriod, 0);
  objc_storeStrong((id *)&self->_algoDescription, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end