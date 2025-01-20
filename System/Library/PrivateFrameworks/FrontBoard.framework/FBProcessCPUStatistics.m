@interface FBProcessCPUStatistics
- (FBProcessCPUStatistics)initWithProcessHandle:(id)a3;
- (double)totalElapsedIdleTime;
- (double)totalElapsedSystemTime;
- (double)totalElapsedTime;
- (double)totalElapsedUserTime;
- (id)descriptionForCrashReport;
- (void)_hostwideUserElapsedCPUTime:(double *)a3 systemElapsedCPUTime:(double *)a4 idleElapsedCPUTime:(double *)a5;
- (void)_lock_getApplicationCPUTimesForUser:(double *)a3 system:(double *)a4 idle:(double *)a5;
- (void)reset;
@end

@implementation FBProcessCPUStatistics

- (void).cxx_destruct
{
}

- (FBProcessCPUStatistics)initWithProcessHandle:(id)a3
{
  id v6 = a3;
  NSClassFromString(&cfstr_Rbsprocesshand.isa);
  if (!v6)
  {
    v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBProcessCPUStatistics initWithProcessHandle:](a2);
    }
    }
LABEL_11:
    [v10 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A63233C4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:RBSProcessHandleClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBProcessCPUStatistics initWithProcessHandle:](a2);
    }
    }
    goto LABEL_11;
  }

  v11.receiver = self;
  v11.super_class = (Class)FBProcessCPUStatistics;
  v7 = [(FBProcessCPUStatistics *)&v11 init];
  v8 = v7;
  if (v7)
  {
    v7->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v7->_handle, a3);
    [(FBProcessCPUStatistics *)v8 reset];
  }

  return v8;
}

- (void)reset
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(FBProcessCPUStatistics *)self _hostwideUserElapsedCPUTime:&self->_times systemElapsedCPUTime:&self->_times.beginSystemCPUElapsedTime idleElapsedCPUTime:&self->_times.beginIdleCPUElapsedTime];
  [(RBSProcessHandle *)self->_handle elapsedCPUTimeForFrontBoard];
  self->_times.beginApplicationCPUElapsedTime = v4;

  os_unfair_lock_unlock(p_lock);
}

- (void)_hostwideUserElapsedCPUTime:(double *)a3 systemElapsedCPUTime:(double *)a4 idleElapsedCPUTime:(double *)a5
{
  kern_return_t v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  unsigned int v17;
  int v18;
  mach_msg_type_number_t host_info_outCnt;
  integer_t host_info_out[2];
  uint64_t v21;
  size_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26[2];
  uint64_t v27;

  v27 = *MEMORY[0x1E4F143B8];
  *(void *)host_info_out = 0;
  v21 = 0;
  host_info_outCnt = 4;
  host_t v8 = MEMORY[0x1AD0B8930](self, a2);
  v9 = host_statistics(v8, 3, host_info_out, &host_info_outCnt);
  v10 = 0.0;
  objc_super v11 = 0.0;
  v12 = 0.0;
  if (!v9)
  {
    v13 = (HIDWORD(v21) + host_info_out[0]);
    v14 = _cpuTicksToTimeInterval_microsecondsPerTick;
    if (_cpuTicksToTimeInterval_microsecondsPerTick < 1)
    {
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v22 = 20;
      *(void *)v26 = 0xC00000001;
      if (sysctl(v26, 2u, &v23, &v22, 0, 0))
      {
        v15 = _cpuTicksToTimeInterval_microsecondsPerTick;
      }
      else
      {
        v15 = HIDWORD(v23);
        _cpuTicksToTimeInterval_microsecondsPerTick = HIDWORD(v23);
      }
      v14 = v15;
      v10 = (double)(v15 * v13) / 1000000.0;
      v13 = host_info_out[1];
      if (v15 <= 0)
      {
        v23 = 0;
        v24 = 0;
        v25 = 0;
        v22 = 20;
        *(void *)v26 = 0xC00000001;
        if (sysctl(v26, 2u, &v23, &v22, 0, 0))
        {
          v18 = _cpuTicksToTimeInterval_microsecondsPerTick;
        }
        else
        {
          v18 = HIDWORD(v23);
          _cpuTicksToTimeInterval_microsecondsPerTick = HIDWORD(v23);
        }
        v14 = v18;
        v16 = v18 * v13;
        v17 = v21;
        if (v18 <= 0)
        {
          v23 = 0;
          v24 = 0;
          v25 = 0;
          v22 = 20;
          *(void *)v26 = 0xC00000001;
          if (sysctl(v26, 2u, &v23, &v22, 0, 0))
          {
            LODWORD(v14) = _cpuTicksToTimeInterval_microsecondsPerTick;
          }
          else
          {
            LODWORD(v14) = HIDWORD(v23);
            _cpuTicksToTimeInterval_microsecondsPerTick = HIDWORD(v23);
          }
          v14 = (int)v14;
        }
        goto LABEL_9;
      }
    }
    else
    {
      v10 = (double)(uint64_t)(_cpuTicksToTimeInterval_microsecondsPerTick
                            * (unint64_t)v13)
          / 1000000.0;
      LODWORD(v13) = host_info_out[1];
    }
    v16 = v14 * v13;
    v17 = v21;
LABEL_9:
    objc_super v11 = (double)v16 / 1000000.0;
    v12 = (double)(v14 * v17) / 1000000.0;
  }
  if (a3) { {
    *a3 = v10;
  }
  }
  if (a4) { {
    *a4 = v11;
  }
  }
  if (a5) { {
    *a5 = v12;
  }
  }
}

- (double)totalElapsedTime
{
  return result;
}

- (double)totalElapsedUserTime
{
  double v5 = 0.0;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(FBProcessCPUStatistics *)self _lock_getApplicationCPUTimesForUser:&v5 system:0 idle:0];
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (double)totalElapsedSystemTime
{
  double v5 = 0.0;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(FBProcessCPUStatistics *)self _lock_getApplicationCPUTimesForUser:0 system:&v5 idle:0];
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (double)totalElapsedIdleTime
{
  double v5 = 0.0;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(FBProcessCPUStatistics *)self _lock_getApplicationCPUTimesForUser:0 system:0 idle:&v5];
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (id)descriptionForCrashReport
{
  v15[2] = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double v13 = 0.0;
  double v14 = 0.0;
  double v12 = 0.0;
  [(FBProcessCPUStatistics *)self _lock_getApplicationCPUTimesForUser:&v14 system:&v13 idle:&v12];
  double v4 = v14 + v13 + v12;
  unint64_t v5 = llround((v14 + v13) * 100.0 / v4);
  [(RBSProcessHandle *)self->_handle elapsedCPUTimeForFrontBoard];
  double v7 = v6 - self->_times.beginApplicationCPUElapsedTime;
  os_unfair_lock_unlock(p_lock);
  host_t v8 = [NSString stringWithFormat:@"Elapsed total CPU time (seconds): %.3f (user %.3f, system %.3f), %i%% CPU", v14 + v13, *(void *)&v14, *(void *)&v13, v5];
  v15[0] = v8;
  v9 = [NSString stringWithFormat:@"Elapsed application CPU time (seconds): %.3f, %i%% CPU", *(void *)&v7, llround(v7 * 100.0 / v4)];
  v15[1] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];

  return v10;
}

- (void)_lock_getApplicationCPUTimesForUser:(double *)a3 system:(double *)a4 idle:(double *)a5
{
  double v12 = 0.0;
  double v13 = 0.0;
  double v11 = 0.0;
  [(FBProcessCPUStatistics *)self _hostwideUserElapsedCPUTime:&v13 systemElapsedCPUTime:&v12 idleElapsedCPUTime:&v11];
  double beginSystemCPUElapsedTime = self->_times.beginSystemCPUElapsedTime;
  double beginIdleCPUElapsedTime = self->_times.beginIdleCPUElapsedTime;
  if (a3) { {
    *a3 = v13 - self->_times.beginUserCPUElapsedTime;
  }
  }
  if (a4) { {
    *a4 = v12 - beginSystemCPUElapsedTime;
  }
  }
  if (a5) { {
    *a5 = v11 - beginIdleCPUElapsedTime;
  }
  }
}

- (void)initWithProcessHandle:(const char *)a1 .cold.1(const char *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_5();
  _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, 0x3Au);
}

@end