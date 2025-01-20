@interface _EARProfiler
+ (id)sharedProfiler;
- (BOOL)_hasPMP;
- (BOOL)_keepLogFiles;
- (BOOL)_memoryProfiler;
- (BOOL)_perfProfiler;
- (BOOL)_powerProfiler;
- (_EARProfiler)init;
- (id).cxx_construct;
- (id)reportProfilingAsDictionary;
- (void)addProfilingNetwork:(void *)a3;
- (void)cleanupLogfiles;
- (void)finishProfiling;
- (void)finishProfilingNetworks;
- (void)parsePowerSummary:(id)a3 writeTo:(powerSummary *)a4;
- (void)reportProfiling;
- (void)reset;
- (void)sample;
- (void)setPerfProfiler:(BOOL)a3;
- (void)setPowerProfiler:(BOOL)a3 powerProfilerName:(id)a4;
- (void)set_hasPMP:(BOOL)a3;
- (void)set_keepLogFiles:(BOOL)a3;
- (void)set_memoryProfiler:(BOOL)a3;
- (void)set_perfProfiler:(BOOL)a3;
- (void)set_powerProfiler:(BOOL)a3;
@end

@implementation _EARProfiler

- (_EARProfiler)init
{
  v5.receiver = self;
  v5.super_class = (Class)_EARProfiler;
  v2 = [(_EARProfiler *)&v5 init];
  v3 = v2;
  if (v2) {
    [(_EARProfiler *)v2 reset];
  }
  return v3;
}

+ (id)sharedProfiler
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30___EARProfiler_sharedProfiler__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[_EARProfiler sharedProfiler]::onceToken != -1) {
    dispatch_once(&+[_EARProfiler sharedProfiler]::onceToken, block);
  }
  v2 = (void *)+[_EARProfiler sharedProfiler]::sharedProfiler;
  return v2;
}

- (void)reset
{
  [(_EARProfiler *)self set_memoryProfiler:0];
  [(_EARProfiler *)self set_perfProfiler:0];
  [(_EARProfiler *)self set_powerProfiler:0];
  [(_EARProfiler *)self set_hasPMP:1];
  [(_EARProfiler *)self set_keepLogFiles:0];
  *(_OWORD *)&self->_jetsam_max = 0u;
  *(_OWORD *)&self->_n_samples = 0u;
  std::vector<float>::vector(&v10, 4uLL);
  begin = self->_background_power.__begin_;
  if (begin)
  {
    self->_background_power.__end_ = begin;
    operator delete(begin);
  }
  *(_OWORD *)&self->_background_power.__begin_ = v10;
  self->_background_power.__end_cap_.__value_ = v11;
  v4 = self->_networks.__begin_;
  if (v4)
  {
    self->_networks.__end_ = v4;
    operator delete(v4);
  }
  self->_networks.__begin_ = 0;
  self->_networks.__end_ = 0;
  self->_networks.__end_cap_.__value_ = 0;
  self->_start_time = 0.0;
  self->_end_time = 0.0;
  power_profiler_name = self->_power_profiler_name;
  self->_ane_time = 0.0;
  self->_power_profiler_name = (NSString *)&stru_1F0A64AB0;

  objc_msgSend(NSString, "stringWithFormat:", @"./background_power_%ld.log", getpid());
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  background_power_logfile_name = self->_background_power_logfile_name;
  self->_background_power_logfile_name = v6;

  objc_msgSend(NSString, "stringWithFormat:", @"./runtime_power_%ld.log", getpid());
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  runtime_power_logfile_name = self->_runtime_power_logfile_name;
  self->_runtime_power_logfile_name = v8;
}

- (void)setPerfProfiler:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_EARProfiler *)self _perfProfiler] != a3)
  {
    [(_EARProfiler *)self set_perfProfiler:v3];
    BOOL v5 = [(_EARProfiler *)self _perfProfiler];
    double v6 = 0.0;
    if (v5)
    {
      getrusage(0, &v7);
      double v6 = (double)v7.ru_utime.tv_sec + (double)v7.ru_utime.tv_usec * 0.000001;
    }
    self->_start_time = v6;
  }
}

- (void)setPowerProfiler:(BOOL)a3 powerProfilerName:(id)a4
{
  BOOL v5 = a3;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v20 = a4;
  if ([(_EARProfiler *)self _powerProfiler] != v5)
  {
    [(_EARProfiler *)self set_powerProfiler:v5];
    objc_storeStrong((id *)&self->_power_profiler_name, a4);
    if ([(_EARProfiler *)self _powerProfiler])
    {
      rusage v7 = (FILE **)MEMORY[0x1E4F143C8];
      fprintf((FILE *)*MEMORY[0x1E4F143C8], "Sampling background power consumption for %d seconds ", 4);
      for (uint64_t i = 0; i != 4; ++i)
      {
        if ([(_EARProfiler *)self _hasPMP])
        {
          id v9 = [NSString stringWithFormat:@"%@ -fi 1 -G PMP > %@", self->_power_profiler_name, self->_background_power_logfile_name];
          std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v9 UTF8String]);
          posix_spawn_file_actions_t v24 = 0;
          posix_spawn_file_actions_init(&v24);
          posix_spawn_file_actions_addopen(&v24, 1, "/dev/null", 0, 0);
          posix_spawn_file_actions_addopen(&v24, 2, "/dev/null", 0, 0);
          pid_t v23 = 0;
          v25 = "/usr/bin/sudo";
          v26 = "/bin/bash";
          if (v22 >= 0) {
            long long v10 = __p;
          }
          else {
            long long v10 = (void **)__p[0];
          }
          v27 = "-c";
          v28 = v10;
          uint64_t v29 = 0;
          posix_spawn(&v23, "/bin/bash", &v24, 0, &v26, 0);
          posix_spawn_file_actions_destroy(&v24);
          if (v22 < 0) {
            operator delete(__p[0]);
          }

          usleep(0x16E360u);
          [(_EARProfiler *)self parsePowerSummary:self->_background_power_logfile_name writeTo:&v25];
          double v11 = v30;
          if (v30 == 0.0)
          {
            -[_EARProfiler set_hasPMP:](self, "set_hasPMP:", 0, v30);
            fwrite("(turning off PMP because it's unavailable, power measurements might be less accurate) ", 0x56uLL, 1uLL, *v7);
            double v11 = v30;
          }
          float v12 = v11;
          self->_background_power.__begin_[i] = v12;
        }
        if (![(_EARProfiler *)self _hasPMP])
        {
          id v13 = [NSString stringWithFormat:@"%@ -fi 1 > %@", self->_power_profiler_name, self->_background_power_logfile_name];
          std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v13 UTF8String]);
          posix_spawn_file_actions_t v24 = 0;
          posix_spawn_file_actions_init(&v24);
          posix_spawn_file_actions_addopen(&v24, 1, "/dev/null", 0, 0);
          posix_spawn_file_actions_addopen(&v24, 2, "/dev/null", 0, 0);
          pid_t v23 = 0;
          v25 = "/usr/bin/sudo";
          v26 = "/bin/bash";
          if (v22 >= 0) {
            v14 = __p;
          }
          else {
            v14 = (void **)__p[0];
          }
          v27 = "-c";
          v28 = v14;
          uint64_t v29 = 0;
          posix_spawn(&v23, "/bin/bash", &v24, 0, &v26, 0);
          posix_spawn_file_actions_destroy(&v24);
          if (v22 < 0) {
            operator delete(__p[0]);
          }

          usleep(0x16E360u);
          [(_EARProfiler *)self parsePowerSummary:self->_background_power_logfile_name writeTo:&v25];
          float v15 = v30;
          self->_background_power.__begin_[i] = v15;
        }
        fputc(46, *v7);
      }
      fputc(10, *v7);
      if ([(_EARProfiler *)self _hasPMP])
      {
        id v16 = [NSString stringWithFormat:@"%@ -ft -G PMP > %@", self->_power_profiler_name, self->_runtime_power_logfile_name];
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v16 UTF8String]);
        posix_spawn_file_actions_t v24 = 0;
        posix_spawn_file_actions_init(&v24);
        posix_spawn_file_actions_addopen(&v24, 1, "/dev/null", 0, 0);
        posix_spawn_file_actions_addopen(&v24, 2, "/dev/null", 0, 0);
        pid_t v23 = 0;
        v25 = "/usr/bin/sudo";
        v26 = "/bin/bash";
        v17 = __p;
        if (v22 < 0) {
          v17 = (void **)__p[0];
        }
        v27 = "-c";
        v28 = v17;
        uint64_t v29 = 0;
        posix_spawn(&v23, "/bin/bash", &v24, 0, &v26, 0);
        posix_spawn_file_actions_destroy(&v24);
        if (v22 < 0) {
          operator delete(__p[0]);
        }
      }
      else
      {
        id v16 = [NSString stringWithFormat:@"%@ -ft > %@", self->_power_profiler_name, self->_runtime_power_logfile_name];
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v16 UTF8String]);
        posix_spawn_file_actions_t v24 = 0;
        posix_spawn_file_actions_init(&v24);
        posix_spawn_file_actions_addopen(&v24, 1, "/dev/null", 0, 0);
        posix_spawn_file_actions_addopen(&v24, 2, "/dev/null", 0, 0);
        pid_t v23 = 0;
        v25 = "/usr/bin/sudo";
        v26 = "/bin/bash";
        v19 = __p;
        if (v22 < 0) {
          v19 = (void **)__p[0];
        }
        v27 = "-c";
        v28 = v19;
        uint64_t v29 = 0;
        posix_spawn(&v23, "/bin/bash", &v24, 0, &v26, 0);
        posix_spawn_file_actions_destroy(&v24);
        if (v22 < 0) {
          operator delete(__p[0]);
        }
      }
    }
    else
    {
      id v16 = [NSString stringWithFormat:@"killall %@", self->_power_profiler_name];
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v16 UTF8String]);
      posix_spawn_file_actions_t v24 = 0;
      posix_spawn_file_actions_init(&v24);
      posix_spawn_file_actions_addopen(&v24, 1, "/dev/null", 0, 0);
      posix_spawn_file_actions_addopen(&v24, 2, "/dev/null", 0, 0);
      pid_t v23 = 0;
      v25 = "/usr/bin/sudo";
      v26 = "/bin/bash";
      v18 = __p;
      if (v22 < 0) {
        v18 = (void **)__p[0];
      }
      v27 = "-c";
      v28 = v18;
      uint64_t v29 = 0;
      posix_spawn(&v23, "/bin/bash", &v24, 0, &v26, 0);
      posix_spawn_file_actions_destroy(&v24);
      if (v22 < 0) {
        operator delete(__p[0]);
      }
    }
  }
}

- (void)addProfilingNetwork:(void *)a3
{
  value = self->_networks.__end_cap_.__value_;
  p_end_cap = &self->_networks.__end_cap_;
  double v6 = value;
  v8 = p_end_cap[-1].__value_;
  if (v8 >= value)
  {
    p_value = &p_end_cap[-2].__value_;
    double v11 = p_end_cap[-2].__value_;
    uint64_t v12 = v8 - v11;
    if ((unint64_t)(v12 + 1) >> 61) {
      std::vector<int>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v13 = (char *)v6 - (char *)v11;
    uint64_t v14 = v13 >> 2;
    if (v13 >> 2 <= (unint64_t)(v12 + 1)) {
      uint64_t v14 = v12 + 1;
    }
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v15 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v15 = v14;
    }
    if (v15) {
      id v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<kaldi::CuWorkspace *>>((uint64_t)p_end_cap, v15);
    }
    else {
      id v16 = 0;
    }
    v17 = (void **)&v16[8 * v12];
    v18 = (void **)&v16[8 * v15];
    *v17 = a3;
    id v9 = v17 + 1;
    begin = self->_networks.__begin_;
    end = self->_networks.__end_;
    if (end != begin)
    {
      do
      {
        v21 = *--end;
        *--v17 = v21;
      }
      while (end != begin);
      end = *p_value;
    }
    self->_networks.__begin_ = v17;
    self->_networks.__end_ = v9;
    self->_networks.__end_cap_.__value_ = v18;
    if (end) {
      operator delete(end);
    }
  }
  else
  {
    NSString *v8 = a3;
    id v9 = v8 + 1;
  }
  self->_networks.__end_ = v9;
}

- (void)sample
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  ++self->_n_samples;
  if ([(_EARProfiler *)self _memoryProfiler])
  {
    getrusage(0, &v15);
    double max_rss = (double)v15.ru_maxrss * 0.0009765625 * 0.0009765625;
    if (max_rss < self->_max_rss) {
      double max_rss = self->_max_rss;
    }
    self->_double max_rss = max_rss;
    getpid();
    if ((ledger() & 0x80000000) != 0)
    {
      fwrite("Warning: Could not get ledger info for pid\n", 0x2BuLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
      int v7 = 0;
    }
    else
    {
      unsigned __int16 ru_ixrss = v15.ru_ixrss;
      v4 = (char *)malloc_type_malloc(96 * SLOWORD(v15.ru_ixrss), 0x1000040565EDBD2uLL);
      if (!v4) {
        exit(-1);
      }
      BOOL v5 = v4;
      if ((ledger() & 0x80000000) != 0 || (__int16)ru_ixrss < 1)
      {
        int v7 = -1;
      }
      else
      {
        uint64_t v6 = 0;
        int v7 = -1;
        v8 = v5;
        do
        {
          if (!strcmp(v8, "phys_footprint")) {
            int v7 = v6;
          }
          ++v6;
          v8 += 96;
        }
        while (ru_ixrss != v6);
      }
      free(v5);
    }
    getpid();
    if ((ledger() & 0x80000000) != 0)
    {
      fwrite("Warning: Could not get ledger info for pid.\n", 0x2CuLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
      double v11 = 0.0;
    }
    else
    {
      uint64_t v9 = v15.ru_ixrss;
      long long v10 = malloc_type_malloc(48 * v15.ru_ixrss, 0x137D46BFuLL);
      if ((ledger() & 0x80000000) != 0 || v9 <= v7)
      {
        fwrite("Warning: Could not get ledger entry info for pid\n", 0x31uLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
        free(v10);
      }
      if (v7 == -1) {
        double v11 = 0.0;
      }
      else {
        double v11 = (double)*((uint64_t *)v10 + 6 * v7) * 0.000000953674316;
      }
      free(v10);
    }
    double jetsam_max = self->_jetsam_max;
    if (jetsam_max < v11) {
      double jetsam_max = v11;
    }
    double v13 = v11 + self->_jetsam_tot;
    self->_double jetsam_max = jetsam_max;
    self->_jetsam_tot = v13;
  }
}

- (void)finishProfilingNetworks
{
  if ([(_EARProfiler *)self _perfProfiler])
  {
    begin = self->_networks.__begin_;
    end = self->_networks.__end_;
    if (begin != end)
    {
      do
      {
        BOOL v5 = espresso_plan_finish_profiling();
        uint64_t v6 = objc_msgSend(v5, "ane_performance_info");
        self->_ane_time = (double)(unint64_t)objc_msgSend(v6, "total_ane_time_ns") / 1000000000.0
                        + self->_ane_time;

        ++begin;
      }
      while (begin != end);
      begin = self->_networks.__begin_;
    }
    self->_networks.__end_ = begin;
  }
}

- (void)finishProfiling
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(_EARProfiler *)self sample];
  if ([(_EARProfiler *)self _memoryProfiler])
  {
    pid_t v3 = getpid();
    int v4 = proc_pid_rusage(v3, 6, (rusage_info_t *)&buffer);
    p_double jetsam_max = &self->_jetsam_max;
    double v6 = (double)v14 * 0.0009765625 * 0.0009765625;
    if (v4) {
      double v6 = 0.0;
    }
    if (*p_jetsam_max >= v6) {
      double v6 = *p_jetsam_max;
    }
    *p_double jetsam_max = v6;
  }
  if ([(_EARProfiler *)self _perfProfiler])
  {
    getrusage(0, &buffer);
    self->_end_time = (double)buffer.ru_utime.tv_sec + (double)buffer.ru_utime.tv_usec * 0.000001;
    [(_EARProfiler *)self finishProfilingNetworks];
  }
  if ([(_EARProfiler *)self _powerProfiler])
  {
    id v7 = [NSString stringWithFormat:@"killall %@", self->_power_profiler_name];
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v7 UTF8String]);
    posix_spawn_file_actions_t v12 = 0;
    posix_spawn_file_actions_init(&v12);
    posix_spawn_file_actions_addopen(&v12, 1, "/dev/null", 0, 0);
    posix_spawn_file_actions_addopen(&v12, 2, "/dev/null", 0, 0);
    pid_t v11 = 0;
    buffer.ru_utime.tv_sec = (__darwin_time_t)"/usr/bin/sudo";
    *(void *)&buffer.ru_utime.tv_usec = "/bin/bash";
    v8 = __p;
    if (v10 < 0) {
      v8 = (void **)__p[0];
    }
    buffer.ru_stime.tv_sec = (__darwin_time_t)"-c";
    *(void *)&buffer.ru_stime.tv_usec = v8;
    buffer.ru_maxrss = 0;
    posix_spawn(&v11, "/bin/bash", &v12, 0, (char *const *)&buffer.ru_utime.tv_usec, 0);
    posix_spawn_file_actions_destroy(&v12);
    if (v10 < 0) {
      operator delete(__p[0]);
    }

    usleep(0xF4240u);
    [(_EARProfiler *)self parsePowerSummary:self->_runtime_power_logfile_name writeTo:&self->_power_summary];
  }
}

- (id)reportProfilingAsDictionary
{
  v51[4] = *MEMORY[0x1E4F143B8];
  id v43 = (id)objc_opt_new();
  if ([(_EARProfiler *)self _memoryProfiler])
  {
    unint64_t n_samples = self->_n_samples;
    v50[0] = @"jetsam max";
    double jetsam_tot = self->_jetsam_tot;
    BOOL v5 = [NSNumber numberWithDouble:self->_jetsam_max];
    double v6 = jetsam_tot / (double)n_samples;
    *(float *)&double v6 = v6;
    v51[0] = v5;
    v50[1] = @"jetsam average";
    id v7 = [NSNumber numberWithFloat:v6];
    v51[1] = v7;
    v50[2] = @"max rss";
    v8 = [NSNumber numberWithDouble:self->_max_rss];
    v50[3] = @"units";
    v51[2] = v8;
    v51[3] = @"MB";
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:4];

    [v43 setObject:v9 forKeyedSubscript:@"memory"];
  }
  if ([(_EARProfiler *)self _perfProfiler])
  {
    double v10 = self->_end_time - self->_start_time;
    v48[0] = @"CPU time";
    pid_t v11 = [NSNumber numberWithDouble:v10];
    v49[0] = v11;
    v48[1] = @"ANE time";
    posix_spawn_file_actions_t v12 = [NSNumber numberWithDouble:self->_ane_time];
    v48[2] = @"units";
    v49[1] = v12;
    v49[2] = @"s";
    double v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:3];

    [v43 setObject:v13 forKeyedSubscript:@"perf"];
  }
  if ([(_EARProfiler *)self _powerProfiler])
  {
    begin = self->_background_power.__begin_;
    end = self->_background_power.__end_;
    if (begin == end)
    {
      double v20 = NAN;
      double v23 = NAN;
    }
    else
    {
      double v16 = 0.0;
      v17 = self->_background_power.__begin_;
      do
      {
        float v18 = *v17++;
        double v16 = v16 + v18;
      }
      while (v17 != end);
      uint64_t v19 = end - begin;
      double v20 = v16 / (double)(unint64_t)v19;
      double v21 = 0.0;
      do
      {
        float v22 = *begin++;
        double v21 = v21 + (float)(v22 * v22);
      }
      while (begin != end);
      double v23 = v21 / (double)(unint64_t)v19;
    }
    v46[0] = @"total energy";
    posix_spawn_file_actions_t v24 = [NSNumber numberWithDouble:self->_power_summary.total_energy];
    v47[0] = v24;
    v46[1] = @"ANE energy";
    v25 = [NSNumber numberWithDouble:self->_power_summary.ane_energy];
    v47[1] = v25;
    v46[2] = @"GPU energy";
    v26 = [NSNumber numberWithDouble:self->_power_summary.gpu_energy];
    v47[2] = v26;
    v46[3] = @"DRAM energy";
    v27 = [NSNumber numberWithDouble:self->_power_summary.dram_energy];
    v47[3] = v27;
    v46[4] = @"ECPU energy";
    v28 = [NSNumber numberWithDouble:self->_power_summary.ecpu_energy];
    v47[4] = v28;
    v46[5] = @"PCPU energy";
    uint64_t v29 = [NSNumber numberWithDouble:self->_power_summary.pcpu_energy];
    v47[5] = v29;
    v46[6] = @"other energy";
    double v30 = [NSNumber numberWithDouble:self->_power_summary.other_energy];
    v46[7] = @"units";
    v47[6] = v30;
    v47[7] = @"J";
    v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:8];

    [v43 setObject:v42 forKeyedSubscript:@"energy"];
    v44[0] = @"mean background power";
    v45[0] = [NSNumber numberWithDouble:v20];
    v44[1] = @"std background power";
    v41 = (void *)v45[0];
    uint64_t v31 = [NSNumber numberWithDouble:sqrt(v23 - v20 * v20)];
    v45[1] = v31;
    v44[2] = @"total power";
    v32 = [NSNumber numberWithDouble:self->_power_summary.total_power];
    v45[2] = v32;
    v44[3] = @"ANE power";
    v33 = [NSNumber numberWithDouble:self->_power_summary.ane_power];
    v45[3] = v33;
    v44[4] = @"GPU power";
    v34 = [NSNumber numberWithDouble:self->_power_summary.gpu_power];
    v45[4] = v34;
    v44[5] = @"DRAM power";
    v35 = [NSNumber numberWithDouble:self->_power_summary.dram_power];
    v45[5] = v35;
    v44[6] = @"ECPU power";
    v36 = [NSNumber numberWithDouble:self->_power_summary.ecpu_power];
    v45[6] = v36;
    v44[7] = @"PCPU power";
    v37 = [NSNumber numberWithDouble:self->_power_summary.pcpu_power];
    v45[7] = v37;
    v44[8] = @"other power";
    v38 = [NSNumber numberWithDouble:self->_power_summary.other_power];
    v44[9] = @"units";
    v45[8] = v38;
    v45[9] = @"mW";
    v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:10];

    [v43 setObject:v39 forKeyedSubscript:@"power"];
  }
  return v43;
}

- (void)reportProfiling
{
  BOOL v3 = [(_EARProfiler *)self _memoryProfiler];
  int v4 = (FILE **)MEMORY[0x1E4F143C8];
  if (v3
    || [(_EARProfiler *)self _perfProfiler]
    || [(_EARProfiler *)self _powerProfiler])
  {
    fwrite("================ Profiler Summary ===============\n", 0x32uLL, 1uLL, *v4);
  }
  if ([(_EARProfiler *)self _memoryProfiler])
  {
    float v5 = self->_jetsam_tot / (double)self->_n_samples;
    fprintf(*v4, "|             |  Jetsam  |    Peak   |  Average |\n|             |          |  %7.2f  | %7.2f  |\n| Memory (MB) -----------------------------------\n|             |  MAX_RSS |    Peak   |     -    |\n|             |          |  %7.2f  |          |\n=================================================\n", self->_jetsam_max, v5, self->_max_rss);
  }
  if ([(_EARProfiler *)self _perfProfiler]) {
    fprintf(*v4, "| Time (s)    |    CPU   |    GPU    |    ANE*  |\n|             | %7.2f  |      -    | %7.2f  |\n=================================================\n| * ANE time unavailable for CoreML networks.   |\n=================================================\n", self->_end_time - self->_start_time, self->_ane_time);
  }
  if ([(_EARProfiler *)self _powerProfiler])
  {
    begin = self->_background_power.__begin_;
    end = self->_background_power.__end_;
    if (begin == end)
    {
      double v12 = NAN;
      double v15 = NAN;
    }
    else
    {
      double v8 = 0.0;
      uint64_t v9 = self->_background_power.__begin_;
      do
      {
        float v10 = *v9++;
        double v8 = v8 + v10;
      }
      while (v9 != end);
      uint64_t v11 = end - begin;
      double v12 = v8 / (double)(unint64_t)v11;
      double v13 = 0.0;
      do
      {
        float v14 = *begin++;
        double v13 = v13 + (float)(v14 * v14);
      }
      while (begin != end);
      double v15 = v13 / (double)(unint64_t)v11;
    }
    double v16 = sqrt(v15 - v12 * v12);
    v17 = *v4;
    if ([(_EARProfiler *)self _hasPMP]) {
      float v18 = "via PMP";
    }
    else {
      float v18 = "non-PMP";
    }
    *(_OWORD *)uint64_t v29 = *(_OWORD *)&self->_power_summary.total_energy;
    double gpu_energy = self->_power_summary.gpu_energy;
    double dram_energy = self->_power_summary.dram_energy;
    if ([(_EARProfiler *)self _hasPMP]) {
      double v21 = "via PMP";
    }
    else {
      double v21 = "non-PMP";
    }
    double other_energy = self->_power_summary.other_energy;
    int total_power = (int)self->_power_summary.total_power;
    int ane_power = (int)self->_power_summary.ane_power;
    long long v28 = *(_OWORD *)&self->_power_summary.ecpu_energy;
    int gpu_power = (int)self->_power_summary.gpu_power;
    int dram_power = (int)self->_power_summary.dram_power;
    if ([(_EARProfiler *)self _hasPMP]) {
      v27 = "via PMP";
    }
    else {
      v27 = "non-PMP";
    }
    fprintf(v17, "| Background  |   Idle   |  Average  |   std    |\n| Power* (mW) |          |   %5.1f   |  %5.1f   |\n| %s     |          |           |          |\n|------------------------------------------------\n|             |  Total  |  ANE  |  GPU  |  DRAM |\n|             |  %6.2f | %5.1f | %5.1f | %5.1f |\n| Energy (J)  -----------------------------------\n| %s     |         |  ECPU |  PCPU | OTHER |\n|             |         | %5.1f | %5.1f | %5.1f |\n|------------------------------------------------\n|             |  Total  |  ANE  |  GPU  |  DRAM |\n|             |   %5d |  %4d |  %4d |  %4d |\n| Power (mW)  -----------------------------------\n| %s     |         |  ECPU |  PCPU | OTHER |\n| ^           |         |  %4d |  %4d |  %4d |\n=================================================\n| * If Idle power consumption is significant,   |\n|   try enabling one of the power settings      |\n"
      "|   recommended  above and kill any daemon(s)   |\n"
      "|   that are not needed by transcribe.          |\n"
      "| ^ Power measurements can be inaccurate on     |\n"
      "|   short audios and/or new hardwares.          |\n"
      "=================================================\n",
      v12,
      v16,
      v18,
      v29[0],
      v29[1],
      gpu_energy,
      dram_energy,
      v21,
      *(double *)&v28,
      *((double *)&v28 + 1),
      other_energy,
      total_power,
      ane_power,
      gpu_power,
      dram_power,
      v27,
      (int)self->_power_summary.ecpu_power,
      (int)self->_power_summary.pcpu_power,
      (int)self->_power_summary.other_power);
  }
}

- (void)cleanupLogfiles
{
  v9[4] = *(char **)MEMORY[0x1E4F143B8];
  if (![(_EARProfiler *)self _keepLogFiles])
  {
    id v3 = [NSString stringWithFormat:@"rm %@ %@", self->_background_power_logfile_name, self->_runtime_power_logfile_name];
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v3 UTF8String]);
    v8[0] = 0;
    posix_spawn_file_actions_init(v8);
    posix_spawn_file_actions_addopen(v8, 1, "/dev/null", 0, 0);
    posix_spawn_file_actions_addopen(v8, 2, "/dev/null", 0, 0);
    pid_t v7 = 0;
    v8[1] = "/usr/bin/sudo";
    v9[0] = "/bin/bash";
    int v4 = (char *)__p;
    if (v6 < 0) {
      int v4 = (char *)__p[0];
    }
    v9[1] = "-c";
    v9[2] = v4;
    v9[3] = 0;
    posix_spawn(&v7, "/bin/bash", v8, 0, v9, 0);
    posix_spawn_file_actions_destroy(v8);
    if (v6 < 0) {
      operator delete(__p[0]);
    }
  }
}

- (void)parsePowerSummary:(id)a3 writeTo:(powerSummary *)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  *(_OWORD *)&a4->total_energy = 0u;
  *(_OWORD *)&a4->double gpu_energy = 0u;
  *(_OWORD *)&a4->pcpu_energy = 0u;
  *(_OWORD *)&a4->double other_energy = 0u;
  *(_OWORD *)&a4->int ane_power = 0u;
  *(_OWORD *)&a4->ecpu_power = 0u;
  *(_OWORD *)&a4->int dram_power = 0u;
  id v38 = v6;
  v37 = objc_msgSend(NSString, "stringWithContentsOfFile:encoding:error:");
  [v37 componentsSeparatedByString:@"\n"];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v8)
  {
    char v9 = 0;
    uint64_t v10 = *(void *)v40;
    double v11 = 0.0;
    double v12 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v40 != v10) {
          objc_enumerationMutation(v7);
        }
        float v14 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        if ([(_EARProfiler *)self _hasPMP])
        {
          char v15 = [v14 containsString:@"---> "];
          double v16 = @"---> Energy Counters";
          if (v15) {
            goto LABEL_33;
          }
        }
        else
        {
          int v36 = [v14 containsString:@"=> "];
          double v16 = @"=> Energy Model";
          if (v36)
          {
LABEL_33:
            char v9 = [v14 containsString:v16];
            continue;
          }
        }
        if (v9)
        {
          double v17 = 1.0;
          if (([v14 containsString:@"mW]"] & 1) == 0)
          {
            double v17 = 0.001;
            if (([v14 containsString:@"uW]"] & 1) == 0)
            {
              if ([v14 containsString:@"nW]"]) {
                double v17 = 0.000001;
              }
              else {
                double v17 = 0.0;
              }
            }
          }
          double v18 = 0.001;
          if (([v14 containsString:@"mJ"] & 1) == 0)
          {
            double v18 = 0.000001;
            if (([v14 containsString:@"uJ"] & 1) == 0)
            {
              if ([v14 containsString:@"nJ"]) {
                double v18 = 0.000000001;
              }
              else {
                double v18 = 0.0;
              }
            }
          }
          uint64_t v19 = objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:options:range:", @"\\s+", @" ", 1024, 0, objc_msgSend(v14, "length"));
          double v20 = [v19 componentsSeparatedByString:@" "];
          if ((unint64_t)[v20 count] >= 7)
          {
            double v21 = [v20 objectAtIndexedSubscript:2];
            [v21 doubleValue];
            double v23 = v22;

            posix_spawn_file_actions_t v24 = [v20 objectAtIndexedSubscript:5];
            [v24 doubleValue];
            double v26 = v25;

            double v12 = v18 * v23;
            double v11 = v17 * v26;
          }
          a4->total_energy = v12 + a4->total_energy;
          a4->int total_power = v11 + a4->total_power;
          char v27 = [v14 containsString:@"ANE"];
          p_int ane_power = &a4->ane_power;
          p_ane_energy = &a4->ane_energy;
          if ((v27 & 1) == 0)
          {
            char v30 = [v14 containsString:@"GPU"];
            p_int ane_power = &a4->gpu_power;
            p_ane_energy = &a4->gpu_energy;
            if ((v30 & 1) == 0)
            {
              char v31 = [v14 containsString:@"ECPU"];
              p_int ane_power = &a4->ecpu_power;
              p_ane_energy = &a4->ecpu_energy;
              if ((v31 & 1) == 0)
              {
                char v32 = [v14 containsString:@"ECORE"];
                p_int ane_power = &a4->ecpu_power;
                p_ane_energy = &a4->ecpu_energy;
                if ((v32 & 1) == 0)
                {
                  char v33 = [v14 containsString:@"PCPU"];
                  p_int ane_power = &a4->pcpu_power;
                  p_ane_energy = &a4->pcpu_energy;
                  if ((v33 & 1) == 0)
                  {
                    char v34 = [v14 containsString:@"PCORE"];
                    p_int ane_power = &a4->pcpu_power;
                    p_ane_energy = &a4->pcpu_energy;
                    if ((v34 & 1) == 0)
                    {
                      int v35 = [v14 containsString:@"DRAM"];
                      p_ane_energy = &a4->other_energy;
                      if (v35) {
                        p_ane_energy = &a4->dram_energy;
                      }
                      p_int ane_power = &a4->other_power;
                      if (v35) {
                        p_int ane_power = &a4->dram_power;
                      }
                    }
                  }
                }
              }
            }
          }
          double *p_ane_energy = v12 + *p_ane_energy;
          *p_int ane_power = v11 + *p_ane_power;

          char v9 = 1;
        }
        else
        {
          char v9 = 0;
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v8);
  }
}

- (BOOL)_memoryProfiler
{
  return self->__memoryProfiler;
}

- (void)set_memoryProfiler:(BOOL)a3
{
  self->__memoryProfiler = a3;
}

- (BOOL)_perfProfiler
{
  return self->__perfProfiler;
}

- (void)set_perfProfiler:(BOOL)a3
{
  self->__perfProfiler = a3;
}

- (BOOL)_powerProfiler
{
  return self->__powerProfiler;
}

- (void)set_powerProfiler:(BOOL)a3
{
  self->__powerProfiler = a3;
}

- (BOOL)_hasPMP
{
  return self->__hasPMP;
}

- (void)set_hasPMP:(BOOL)a3
{
  self->__hasPMP = a3;
}

- (BOOL)_keepLogFiles
{
  return self->__keepLogFiles;
}

- (void)set_keepLogFiles:(BOOL)a3
{
  self->__keepLogFiles = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runtime_power_logfile_name, 0);
  objc_storeStrong((id *)&self->_background_power_logfile_name, 0);
  objc_storeStrong((id *)&self->_power_profiler_name, 0);
  begin = self->_networks.__begin_;
  if (begin)
  {
    self->_networks.__end_ = begin;
    operator delete(begin);
  }
  int v4 = self->_background_power.__begin_;
  if (v4)
  {
    self->_background_power.__end_ = v4;
    operator delete(v4);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  return self;
}

@end