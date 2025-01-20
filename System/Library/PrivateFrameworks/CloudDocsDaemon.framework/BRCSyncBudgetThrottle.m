@interface BRCSyncBudgetThrottle
+ (BOOL)supportsSecureCoding;
- (BRCSyncBudgetThrottle)init;
- (BRCSyncBudgetThrottle)initWithCoder:(id)a3;
- (double)_timeToLoseAmount:(float)a3 count:(int)a4;
- (double)nextDateWithBudgetWithDefaults:(id)a3;
- (float)availableBudgetWithDefaults:(id)a3;
- (float)lastDay;
- (float)lastHour;
- (float)lastMinute;
- (id)debugDescriptionWithDefaults:(id)a3;
- (id)description;
- (void)clear;
- (void)consume:(float)a3;
- (void)encodeWithCoder:(id)a3;
- (void)updateForTime:(double)a3;
@end

@implementation BRCSyncBudgetThrottle

- (float)lastMinute
{
  return self->_values[0];
}

- (float)lastHour
{
  return (float)((float)((float)((float)(self->_values[0] + self->_values[1]) + self->_values[2]) + self->_values[3])
               * 60.0)
       / 61.0;
}

- (float)lastDay
{
  return (float)((float)((float)((float)((float)((float)((float)((float)(self->_values[0] + self->_values[1])
                                                               + self->_values[2])
                                                       + self->_values[3])
                                               + self->_values[4])
                                       + self->_values[5])
                               + self->_values[6])
                       + self->_values[7])
               * 1440.0)
       / 1411.0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BRCSyncBudgetThrottle)init
{
  v6.receiver = self;
  v6.super_class = (Class)BRCSyncBudgetThrottle;
  v2 = [(BRCSyncBudgetThrottle *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1C9C8] date];
    [v3 timeIntervalSince1970];
    v2->_t0 = v4;
  }
  return v2;
}

- (BRCSyncBudgetThrottle)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BRCSyncBudgetThrottle;
  v5 = [(BRCSyncBudgetThrottle *)&v13 init];
  if (v5)
  {
    uint64_t v12 = 0;
    [v4 decodeDoubleForKey:@"t0"];
    v5->_t0 = v6;
    v7 = (_OWORD *)[v4 decodeBytesForKey:@"v" returnedLength:&v12];
    if (v12 == 32)
    {
      long long v8 = v7[1];
      *(_OWORD *)v5->_values = *v7;
      *(_OWORD *)&v5->_values[4] = v8;
    }
    else
    {
      v9 = brc_bread_crumbs();
      v10 = brc_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        [(BRCSyncBudgetThrottle *)&v12 initWithCoder:v10];
      }
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double t0 = self->_t0;
  id v5 = a3;
  [v5 encodeDouble:@"t0" forKey:t0];
  [v5 encodeBytes:self->_values length:32 forKey:@"v"];
}

- (void)clear
{
  *(_OWORD *)self->_values = 0u;
  *(_OWORD *)&self->_values[4] = 0u;
}

- (void)updateForTime:(double)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  double t0 = self->_t0;
  uint64_t v4 = vcvtmd_s64_f64((a3 - t0) / 60.0);
  if ((v4 & 0x8000000000000000) == 0)
  {
    if (!v4) {
      return;
    }
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    values = self->_values;
    long long v8 = *(_OWORD *)&self->_values[4];
    v18[0] = *(_OWORD *)self->_values;
    v18[1] = v8;
    float v9 = 0.0;
    do
    {
      uint64_t v10 = __sums[v6];
      BOOL v11 = v10 <= v4;
      unint64_t v12 = v10 - v4;
      if (v11)
      {
        values[v6] = 0.0;
      }
      else
      {
        if (v12 >= __sums[v5])
        {
          do
          {
            uint64_t v13 = v5 + 1;
            float v9 = v9 + *((float *)v18 + v5);
            unint64_t v14 = __sums[++v5];
          }
          while (v12 >= v14);
        }
        else
        {
          uint64_t v13 = v5;
        }
        *(float *)&unsigned int v15 = (float)(v12 - __sums[v13 - 1]);
        float v16 = *((float *)v18 + v13) * *(float *)&v15;
        LOWORD(v15) = __intervals[v13];
        float v17 = v9 + (float)(v16 / (float)v15);
        values[v6] = v17;
        float v9 = v9 - v17;
        uint64_t v5 = v13;
      }
      ++v6;
    }
    while (v6 != 8);
    a3 = t0 + (double)v4 * 60.0;
  }
  self->_double t0 = a3;
}

- (void)consume:(float)a3
{
  self->_values[0] = self->_values[0] + a3;
}

- (double)_timeToLoseAmount:(float)a3 count:(int)a4
{
  int v5 = a4 - 1;
  if (a4 < 1)
  {
    double v9 = 0.0;
  }
  else
  {
    int v6 = 0;
    uint64_t v7 = a4 + 1;
    while (1)
    {
      float v8 = self->_values[v5];
      if (a3 < v8) {
        break;
      }
      v6 += (unsigned __int16)__intervals[v5];
      a3 = a3 - v8;
      --v7;
      --v5;
      if (v7 < 2)
      {
        double v9 = (double)v6;
        return v9 * 60.0;
      }
    }
    LOWORD(v4) = __intervals[v5];
    double v9 = (double)v6 + ceilf((float)(a3 * (float)v4) / v8);
  }
  return v9 * 60.0;
}

- (double)nextDateWithBudgetWithDefaults:(id)a3
{
  id v4 = a3;
  [v4 syncUpMinimalBudget];
  float v6 = v5;
  [(BRCSyncBudgetThrottle *)self lastDay];
  float v8 = v6 + v7;
  [v4 syncUpDailyBudget];
  float v10 = v8 - v9;
  double v11 = 0.0;
  if (v10 <= 0.0
    || (-[BRCSyncBudgetThrottle _timeToLoseAmount:count:](self, "_timeToLoseAmount:count:", 8), double v11 = v12,
                                                                                                  v12 < 3600.0))
  {
    [(BRCSyncBudgetThrottle *)self lastHour];
    float v14 = v6 + v13;
    [v4 syncUpHourlyBudget];
    if ((float)(v14 - v15) > 0.0)
    {
      -[BRCSyncBudgetThrottle _timeToLoseAmount:count:](self, "_timeToLoseAmount:count:", 4);
      if (v11 < v16) {
        double v11 = v16;
      }
    }
  }
  if (v11 < 60.0)
  {
    [(BRCSyncBudgetThrottle *)self lastMinute];
    float v18 = v6 + v17;
    [v4 syncUpMinutelyBudget];
    if (v18 > v19) {
      double v11 = 60.0;
    }
  }
  double v20 = v11 + self->_t0;

  return v20;
}

- (float)availableBudgetWithDefaults:(id)a3
{
  id v4 = a3;
  [v4 syncUpDailyBudget];
  float v6 = v5;
  [(BRCSyncBudgetThrottle *)self lastDay];
  float v8 = v6 - v7;
  [v4 syncUpHourlyBudget];
  float v10 = v9;
  [(BRCSyncBudgetThrottle *)self lastHour];
  float v12 = v10 - v11;
  [v4 syncUpMinutelyBudget];
  float v14 = v13;

  [(BRCSyncBudgetThrottle *)self lastMinute];
  float result = v14 - v15;
  if (v12 >= v8) {
    float v17 = v8;
  }
  else {
    float v17 = v12;
  }
  if (result >= v17) {
    return v17;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(BRCSyncBudgetThrottle *)self lastMinute];
  double v6 = v5;
  [(BRCSyncBudgetThrottle *)self lastHour];
  double v8 = v7;
  [(BRCSyncBudgetThrottle *)self lastDay];
  return (id)[v3 stringWithFormat:@"<%@ {  m:%.1f  h:%.1f  d:%.1f  }>", v4, *(void *)&v6, *(void *)&v8, v9];
}

- (id)debugDescriptionWithDefaults:(id)a3
{
  id v4 = a3;
  float v5 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:64];
  [(BRCSyncBudgetThrottle *)self nextDateWithBudgetWithDefaults:v4];
  double v7 = v6 - self->_t0;
  double v8 = [MEMORY[0x1E4F1C9C8] date];
  [v8 timeIntervalSince1970];
  double v10 = v9;
  double t0 = self->_t0;

  if (v7 <= 0.0) {
    [v5 appendString:@"budget available {"];
  }
  else {
    objc_msgSend(v5, "appendFormat:", @"no budget left for %.1fs {", *(void *)&v7);
  }
  long double v12 = v10 - t0;
  uint64_t v13 = ((int)fmod(v12, 3600.0) / 60);
  objc_msgSend(v5, "appendFormat:", @"  %d:%02d:%02ds ago", (int)(v12 / 3600.0), v13, (int)fmod(v12, 60.0));
  [(BRCSyncBudgetThrottle *)self lastMinute];
  float v15 = v14 * 100.0;
  [v4 syncUpMinutelyBudget];
  double v17 = (float)(v15 / v16);
  [(BRCSyncBudgetThrottle *)self lastMinute];
  objc_msgSend(v5, "appendFormat:", @"  m:%.1f%% (%.1f)", *(void *)&v17, v18);
  [(BRCSyncBudgetThrottle *)self lastHour];
  *(float *)&double v17 = v19 * 100.0;
  [v4 syncUpHourlyBudget];
  double v21 = (float)(*(float *)&v17 / v20);
  [(BRCSyncBudgetThrottle *)self lastHour];
  objc_msgSend(v5, "appendFormat:", @"  h:%.1f%% (%.1f)", *(void *)&v21, v22);
  [(BRCSyncBudgetThrottle *)self lastDay];
  *(float *)&long double v12 = v23 * 100.0;
  [v4 syncUpDailyBudget];
  double v25 = (float)(*(float *)&v12 / v24);
  [(BRCSyncBudgetThrottle *)self lastDay];
  objc_msgSend(v5, "appendFormat:", @"  d:%.1f%% (%.1f)", *(void *)&v25, v26);
  [v5 appendString:@"  }"];

  return v5;
}

- (void)initWithCoder:(os_log_t)log .cold.1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 134218242;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_fault_impl(&dword_1D353B000, log, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: invalid length: %ld%@", (uint8_t *)&v4, 0x16u);
}

@end