@interface AMDPerfContainer
+ (float)getMemoryUsage:(id)a3 logType:(id)a4 timeDelta:(double)a5;
- (AMDPerfContainer)initWithSwitch:(BOOL)a3 atLevel:(char)a4;
- (BOOL)isEnabled;
- (NSMutableDictionary)memoryUsage;
- (NSMutableDictionary)samples;
- (NSMutableDictionary)timeUsage;
- (char)level;
- (double)getTime;
- (double)timeConversionFactor;
- (void)setIsEnabled:(BOOL)a3;
- (void)setLevel:(char)a3;
- (void)setMemoryUsage:(id)a3;
- (void)setSamples:(id)a3;
- (void)setTimeConversionFactor:(double)a3;
- (void)setTimeUsage:(id)a3;
@end

@implementation AMDPerfContainer

- (AMDPerfContainer)initWithSwitch:(BOOL)a3 atLevel:(char)a4
{
  SEL v15 = a2;
  BOOL v14 = a3;
  char v13 = a4;
  v16 = 0;
  v12.receiver = self;
  v12.super_class = (Class)AMDPerfContainer;
  v16 = [(AMDPerfContainer *)&v12 init];
  objc_storeStrong((id *)&v16, v16);
  [(AMDPerfContainer *)v16 setIsEnabled:v14];
  [(AMDPerfContainer *)v16 setLevel:v13];
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  -[AMDPerfContainer setMemoryUsage:](v16, "setMemoryUsage:");

  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  -[AMDPerfContainer setTimeUsage:](v16, "setTimeUsage:");

  id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  -[AMDPerfContainer setSamples:](v16, "setSamples:");

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  LODWORD(v5) = info.denom;
  LODWORD(v4) = info.numer;
  [(AMDPerfContainer *)v16 setTimeConversionFactor:(double)v4 / (1000000000.0 * (double)v5)];
  v10 = v16;
  objc_storeStrong((id *)&v16, 0);
  return v10;
}

- (double)getTime
{
  double v4 = (double)mach_absolute_time();
  [(AMDPerfContainer *)self timeConversionFactor];
  return v4 * v2;
}

+ (float)getMemoryUsage:(id)a3 logType:(id)a4 timeDelta:(double)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v21 = 0;
  objc_storeStrong(&v21, a4);
  uint64_t v20 = *(void *)&a5;
  bzero(v17, 0x174uLL);
  mach_msg_type_number_t task_info_outCnt = 93;
  mach_error_t error_value = 0;
  mach_error_t error_value = task_info(*MEMORY[0x263EF8960], 0x16u, v17, &task_info_outCnt);
  if (error_value)
  {
    os_log_t v10 = (os_log_t)&_os_log_internal;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v6 = mach_error_string(error_value);
      __os_log_helper_16_2_1_8_32((uint64_t)v24, (uint64_t)v6);
      _os_log_error_impl(&dword_20ABD4000, v10, OS_LOG_TYPE_ERROR, "Error retrieving task_info: %s", v24, 0xCu);
    }
    objc_storeStrong((id *)&v10, 0);
    float v23 = 0.0;
    int v11 = 1;
  }
  else
  {
    unint64_t v14 = v18 + v19;
    os_log_t oslog = (os_log_t)&_os_log_internal;
    os_log_type_t type = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_4_8_64_8_64_8_0_8_0((uint64_t)v25, (uint64_t)location[0], (uint64_t)v21, COERCE__INT64((double)v14 / 1048576.0), v20);
      _os_log_impl(&dword_20ABD4000, oslog, type, "%@ %@: memory usage: %f MB, timeDelta: %.3f", v25, 0x2Au);
    }
    objc_storeStrong((id *)&oslog, 0);
    float v5 = (double)v14 / 1048576.0;
    float v23 = v5;
    int v11 = 1;
  }
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
  return v23;
}

- (NSMutableDictionary)memoryUsage
{
  return self->_memoryUsage;
}

- (void)setMemoryUsage:(id)a3
{
}

- (NSMutableDictionary)timeUsage
{
  return self->_timeUsage;
}

- (void)setTimeUsage:(id)a3
{
}

- (NSMutableDictionary)samples
{
  return self->_samples;
}

- (void)setSamples:(id)a3
{
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
}

- (char)level
{
  return self->_level;
}

- (void)setLevel:(char)a3
{
  self->_level = a3;
}

- (double)timeConversionFactor
{
  return self->_timeConversionFactor;
}

- (void)setTimeConversionFactor:(double)a3
{
  self->_timeConversionFactor = a3;
}

- (void).cxx_destruct
{
}

@end