@interface _ANEPerformanceStats
+ (id)new;
+ (id)statsWithHardwareExecutionNS:(unint64_t)a3;
+ (id)statsWithReconstructed:(id)a3 hardwareExecutionNS:(unint64_t)a4;
+ (id)statsWithRequestPerformanceBuffer:(void *)a3 statsBufferSize:(unsigned int *)a4;
+ (unsigned)driverMaskForANEFMask:(unsigned int)a3;
- (NSData)pStatsRawData;
- (NSData)perfCounterData;
- (_ANEPerformanceStats)init;
- (_ANEPerformanceStats)initWithHardwareExecution:(unint64_t)a3 perfCounterData:(id)a4 ANEStatsRawData:(id)a5;
- (_ANEPerformanceStats)initWithReconstructedData:(id)a3 hardwareExecutionNS:(unint64_t)a4;
- (_ANEPerformanceStats)initWithRequestPerformanceBuffer:(void *)a3 statsBufferSize:(unsigned int *)a4;
- (id)description;
- (id)performanceCounters;
- (id)stringForPerfCounter:(int)a3;
- (unint64_t)hwExecutionTime;
- (void)emitPerfcounterSignpostsWithModelStringID:(unint64_t)a3;
@end

@implementation _ANEPerformanceStats

+ (unsigned)driverMaskForANEFMask:(unsigned int)a3
{
  if (a3 <= 0xF) {
    return a3 & 1 | (2 * ((a3 >> 3) & 1)) & 0xFFFFFFF3 | (4 * ((a3 >> 1) & 3));
  }
  else {
    return 0;
  }
}

- (id)stringForPerfCounter:(int)a3
{
  if (a3 > 0x17) {
    return @"kANE_UKNOWN";
  }
  else {
    return *(&off_10004C928 + a3);
  }
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  unint64_t v5 = [(_ANEPerformanceStats *)self hwExecutionTime];
  v6 = [(_ANEPerformanceStats *)self performanceCounters];
  v7 = +[NSString stringWithFormat:@"%@: { hwExecutionTime=%llu : perfCounterData=%@} ", v4, v5, v6];

  return v7;
}

+ (id)new
{
  return 0;
}

- (_ANEPerformanceStats)init
{
  return 0;
}

- (_ANEPerformanceStats)initWithHardwareExecution:(unint64_t)a3 perfCounterData:(id)a4 ANEStatsRawData:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_ANEPerformanceStats;
  v11 = [(_ANEPerformanceStats *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_hwExecutionTime = a3;
    objc_storeStrong((id *)&v11->_perfCounterData, a4);
    objc_storeStrong((id *)&v12->_pStatsRawData, a5);
  }

  return v12;
}

- (_ANEPerformanceStats)initWithRequestPerformanceBuffer:(void *)a3 statsBufferSize:(unsigned int *)a4
{
  if (!a3 || !a4)
  {
    id v10 = +[_ANELog common];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v21 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v24 = v21;
      __int16 v25 = 2048;
      v26 = a3;
      __int16 v27 = 2048;
      double v28 = *(double *)&a4;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@: Invalid argument. requestPerfStatsBuffer=%p : requestStatsBufferSize=%p", buf, 0x20u);
    }
    v11 = 0;
    goto LABEL_24;
  }
  unsigned int v8 = *a4;
  if (*a4 >= 0x10)
  {
    unint64_t v9 = *((void *)*a3 + 1);
    v12 = +[_ANELog common];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v24 = v13;
      __int16 v25 = 2048;
      v26 = (void **)v9;
      __int16 v27 = 2048;
      double v28 = (float)((float)v9 / 1000000.0);
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%@: HW Execution time: %llu ns (%.2f ms)", buf, 0x20u);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if (a4[2] >= 0xE0)
  {
    id v10 = +[NSData dataWithBytes:(char *)a3[2] + 8 length:216];
    v16 = +[_ANELog common];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v17 = NSStringFromSelector(a2);
      sub_10002E4D8(v17, buf, v16);
    }

    unsigned int v14 = a4[1];
    if (v14 < 0x228)
    {
      v15 = 0;
      goto LABEL_23;
    }
LABEL_20:
    v15 = +[NSData dataWithBytes:a3[1] length:v14];
    v18 = +[_ANELog common];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v19 = NSStringFromSelector(a2);
      sub_10002E480(v19, v22, v18);
    }

    goto LABEL_23;
  }
  unsigned int v14 = a4[1];
  if (v14 >= 0x228)
  {
    id v10 = 0;
    goto LABEL_20;
  }
  id v10 = 0;
  v15 = 0;
  if (v8 >= 0x10)
  {
LABEL_23:
    self = [(_ANEPerformanceStats *)self initWithHardwareExecution:v9 perfCounterData:v10 ANEStatsRawData:v15];

    v11 = self;
LABEL_24:

    goto LABEL_25;
  }
  v11 = 0;
LABEL_25:

  return v11;
}

- (_ANEPerformanceStats)initWithReconstructedData:(id)a3 hardwareExecutionNS:(unint64_t)a4
{
  return [(_ANEPerformanceStats *)self initWithHardwareExecution:a4 perfCounterData:a3 ANEStatsRawData:0];
}

+ (id)statsWithRequestPerformanceBuffer:(void *)a3 statsBufferSize:(unsigned int *)a4
{
  id v4 = [objc_alloc((Class)a1) initWithRequestPerformanceBuffer:a3 statsBufferSize:a4];
  return v4;
}

+ (id)statsWithHardwareExecutionNS:(unint64_t)a3
{
  id v3 = [objc_alloc((Class)a1) initWithHardwareExecution:a3 perfCounterData:0 ANEStatsRawData:0];
  return v3;
}

+ (id)statsWithReconstructed:(id)a3 hardwareExecutionNS:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [objc_alloc((Class)a1) initWithReconstructedData:v6 hardwareExecutionNS:a4];

  return v7;
}

- (id)performanceCounters
{
  id v3 = [(_ANEPerformanceStats *)self perfCounterData];

  if (v3)
  {
    id v4 = [(_ANEPerformanceStats *)self perfCounterData];
    unint64_t v5 = [v4 bytes];

    id v6 = [&__NSDictionary0__struct mutableCopy];
    id v7 = [(_ANEPerformanceStats *)self perfCounterData];
    unint64_t v8 = (unint64_t)[v7 length];

    if (v8 >= 8)
    {
      uint64_t v9 = 0;
      unint64_t v10 = v8 >> 3;
      do
      {
        v11 = [(_ANEPerformanceStats *)self stringForPerfCounter:v9];
        v12 = +[NSNumber numberWithUnsignedLongLong:v5[v9]];
        [v6 setObject:v12 forKeyedSubscript:v11];

        ++v9;
      }
      while (v10 != v9);
    }
    id v13 = [v6 copy];
  }
  else
  {
    id v13 = 0;
  }
  return v13;
}

- (void)emitPerfcounterSignpostsWithModelStringID:(unint64_t)a3
{
  if (kdebug_is_enabled())
  {
    id v4 = [(_ANEPerformanceStats *)self perfCounterData];

    if (v4)
    {
      id v5 = [(_ANEPerformanceStats *)self perfCounterData];
      [v5 bytes];

      id v6 = [(_ANEPerformanceStats *)self perfCounterData];
      unint64_t v7 = (unint64_t)[v6 length] >> 3;

      unint64_t v8 = v7 - 3 * ((v7 * (unsigned __int128)0x5555555555555556uLL) >> 64);
      kdebug_trace();
      if (v7 >= v8) {
        unint64_t v9 = 3 * ((v7 * (unsigned __int128)0x5555555555555556uLL) >> 64);
      }
      else {
        unint64_t v9 = 0;
      }
      if (v7 > v8)
      {
        unint64_t v10 = 0;
        do
        {
          kdebug_trace();
          v10 += 3;
        }
        while (v10 < v9);
      }
      if (v8) {
        kdebug_trace();
      }
      kdebug_trace();
    }
  }
}

- (unint64_t)hwExecutionTime
{
  return self->_hwExecutionTime;
}

- (NSData)pStatsRawData
{
  return self->_pStatsRawData;
}

- (NSData)perfCounterData
{
  return self->_perfCounterData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perfCounterData, 0);
  objc_storeStrong((id *)&self->_pStatsRawData, 0);
}

@end