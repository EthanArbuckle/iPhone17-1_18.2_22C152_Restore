@interface GTPerfStatsHelper
- (BOOL)_collectOperatingPoints;
- (GTPerfStatsHelper)initWithConfigurationVariables:(id)a3;
- (GTPerfStatsHelper)initWithOutputPath:(id)a3;
- (id).cxx_construct;
- (id)_frequenciesForStateName:(const char *)a3 forReg:(unsigned int)a4;
- (id)exportStats;
- (void)gatherStats;
- (void)reset;
- (void)setup;
- (void)startCollectingPerfStatsAtInterval:(unint64_t)a3 andPeriodicSamplesAtInterval:(unint64_t)a4;
- (void)stopCollectingStats;
@end

@implementation GTPerfStatsHelper

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_socBlockBandwidths, 0);
  objc_storeStrong((id *)&self->_configVariables, 0);
  begin = self->_perfStateGroups.__begin_;
  if (begin)
  {
    end = self->_perfStateGroups.__end_;
    v5 = self->_perfStateGroups.__begin_;
    if (end != begin)
    {
      do
        GTPerfStateGroup::~GTPerfStateGroup((GTPerfStateGroup *)((char *)end - 152));
      while (end != begin);
      v5 = self->_perfStateGroups.__begin_;
    }
    self->_perfStateGroups.__end_ = begin;
    operator delete(v5);
  }

  objc_storeStrong((id *)&self->_outputPath, 0);
}

- (id)exportStats
{
  v4 = +[NSMutableDictionary dictionaryWithCapacity:0x86BCA1AF286BCA1BLL * ((self->_perfStateGroups.__end_ - self->_perfStateGroups.__begin_) >> 3) + 1];
  v5 = +[NSMutableDictionary dictionaryWithCapacity:0x86BCA1AF286BCA1BLL * ((self->_perfStateGroups.__end_ - self->_perfStateGroups.__begin_) >> 3)];
  begin = self->_perfStateGroups.__begin_;
  end = self->_perfStateGroups.__end_;
  if (begin == end) {
    goto LABEL_13;
  }
  char v8 = 0;
  do
  {
    int v9 = *((_DWORD *)begin + 19);
    if ((v9 - 1) < 2)
    {
      uint64_t v10 = *((void *)begin + 10);
      uint64_t v11 = *((void *)begin + 11);
      if (v10 == v11) {
        goto LABEL_10;
      }
      v12 = +[NSMutableData dataWithBytes:v10 length:v11 - v10];
      [v4 setObject:v12 forKeyedSubscript:*((void *)begin + 3)];
      goto LABEL_9;
    }
    if (!v9)
    {
      uint64_t v13 = *((void *)begin + 6);
      uint64_t v14 = *((void *)begin + 7);
      if (v13 != v14)
      {
        v12 = +[NSMutableData dataWithBytes:v13 length:v14 - v13];
        [v4 setObject:v12 forKeyedSubscript:*((void *)begin + 3)];
        char v8 = 1;
LABEL_9:
      }
    }
LABEL_10:
    [v5 setObject:*((void *)begin + 17) forKeyedSubscript:*((void *)begin + 3)];
    begin = (GTPerfStateGroup *)((char *)begin + 152);
  }
  while (begin != end);
  if (v8)
  {
    id v33 = 0;
    uint64_t v15 = +[NSKeyedArchiver archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v33];
    id v16 = v33;
    v29 = (void *)v15;
    [v4 setObject:v15 forKeyedSubscript:@"Group Counters"];
    v17 = +[NSNumber numberWithUnsignedInt:self->_timebaseInfo.numer];
    v34[0] = v17;
    v18 = +[NSNumber numberWithUnsignedInt:self->_timebaseInfo.denom];
    v34[1] = v18;
    v19 = +[NSArray arrayWithObjects:v34 count:2];

    id v32 = v16;
    v20 = +[NSKeyedArchiver archivedDataWithRootObject:v19 requiringSecureCoding:1 error:&v32];
    id v21 = v32;

    [v4 setObject:v20 forKeyedSubscript:@"Time Base Info"];
    socBlockBandwidths = self->_socBlockBandwidths;
    id v31 = v21;
    v23 = +[NSKeyedArchiver archivedDataWithRootObject:socBlockBandwidths requiringSecureCoding:1 error:&v31];
    id v24 = v31;

    [v4 setObject:v23 forKeyedSubscript:@"BW Info"];
    configVariables = self->_configVariables;
    id v30 = v24;
    v26 = +[NSKeyedArchiver archivedDataWithRootObject:configVariables requiringSecureCoding:1 error:&v30];
    id v27 = v30;

    [v4 setObject:v26 forKeyedSubscript:@"Configuration"];
  }
LABEL_13:

  return v4;
}

- (void)gatherStats
{
  begin = self->_perfStateGroups.__begin_;
  end = self->_perfStateGroups.__end_;
  if (begin != end)
  {
    while (1)
    {
      int v4 = *((_DWORD *)begin + 19);
      if (!v4) {
        break;
      }
      if (v4 == 2)
      {
        uint64_t v18 = 0;
        v19 = &v18;
        uint64_t v20 = 0x2020000000;
        id v21 = 0;
        uint64_t v10 = [*((id *)begin + 5) firstObject];

        id v21 = v10;
        id v6 = objc_alloc_init((Class)NSNumberFormatter);
        [v6 setNumberStyle:1];
        uint64_t v11 = (void *)*((void *)begin + 5);
        v12 = _NSConcreteStackBlock;
        uint64_t v13 = 3221225472;
        uint64_t v14 = ___ZN16GTPerfStateGroup29_GatherSampleDataSOCPerfStateERK18mach_timebase_info_block_invoke;
        uint64_t v15 = &unk_745818;
        id v16 = &v18;
        v17 = begin;
        [v11 enumerateObjectsUsingBlock:&v12];
        goto LABEL_8;
      }
      if (v4 == 1)
      {
        uint64_t v18 = 0;
        v19 = &v18;
        uint64_t v20 = 0x2020000000;
        id v21 = 0;
        v5 = [*((id *)begin + 5) firstObject];

        id v21 = v5;
        id v6 = objc_alloc_init((Class)NSNumberFormatter);
        [v6 setNumberStyle:1];
        v7 = (void *)*((void *)begin + 5);
        v12 = _NSConcreteStackBlock;
        uint64_t v13 = 3221225472;
        uint64_t v14 = ___ZN16GTPerfStateGroup26_GatherSampleDataPerfStateERK18mach_timebase_info_block_invoke;
        uint64_t v15 = &unk_745818;
        id v16 = &v18;
        v17 = begin;
        [v7 enumerateObjectsUsingBlock:&v12];
LABEL_8:

        _Block_object_dispose(&v18, 8);
      }
      begin = (GTPerfStateGroup *)((char *)begin + 152);
      if (begin == end) {
        return;
      }
    }
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2020000000;
    id v21 = 0;
    char v8 = [*((id *)begin + 5) firstObject];

    id v21 = v8;
    id v6 = objc_alloc_init((Class)NSNumberFormatter);
    [v6 setNumberStyle:1];
    int v9 = (void *)*((void *)begin + 5);
    v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    uint64_t v14 = ___ZN16GTPerfStateGroup32_GatherSampleDataPeriodicSamplesERK18mach_timebase_info_block_invoke;
    uint64_t v15 = &unk_7458A8;
    id v16 = &v18;
    [v9 enumerateObjectsUsingBlock:&v12];
    goto LABEL_8;
  }
}

- (void)stopCollectingStats
{
  begin = self->_perfStateGroups.__begin_;
  end = self->_perfStateGroups.__end_;
  while (begin != end)
  {
    if (*(void *)begin)
    {
      dispatch_source_cancel(*(dispatch_source_t *)begin);
      dispatch_source_t v4 = *(dispatch_source_t *)begin;
      *(void *)begin = 0;
    }
    begin = (GTPerfStateGroup *)((char *)begin + 152);
  }
}

- (void)startCollectingPerfStatsAtInterval:(unint64_t)a3 andPeriodicSamplesAtInterval:(unint64_t)a4
{
  begin = self->_perfStateGroups.__begin_;
  end = self->_perfStateGroups.__end_;
  if (begin != end)
  {
    BOOL v8 = a4 != 0;
    id v21 = v29;
    v22 = v24;
    do
    {
      *((unsigned char *)begin + 148) = v8;
      int v9 = *((_DWORD *)begin + 19);
      if (v9 != 1)
      {
        if (!a4) {
          goto LABEL_18;
        }
        if (!v9)
        {
          unint64_t v10 = a4;
LABEL_9:
          uint64_t v11 = *((unsigned int *)begin + 36);
          if ((int)v11 >= 1)
          {
            if (v9 == 2) {
              uint64_t v12 = v10 >> 2;
            }
            else {
              uint64_t v12 = v10;
            }
            uint64_t v13 = *((void *)begin + 1);
            uint64_t v14 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 0x2540BE400 / v12 * v11, v21, v22);
            uint64_t v15 = (void *)*((void *)begin + 5);
            *((void *)begin + 5) = v14;

            std::vector<unsigned long long>::reserve((void **)begin + 6, 0x2540BE400 / v12 * (*((_DWORD *)begin + 36) + 1));
            *((void *)begin + 13) = IOReportCreateSamples();
            if (!*((_DWORD *)begin + 19))
            {
              id v27 = _NSConcreteStackBlock;
              uint64_t v28 = 3221225472;
              v29[0] = ___ZN16GTPerfStateGroup20StartCollectingStatsEy_block_invoke;
              v29[1] = &__block_descriptor_40_e25_v16__0____CFDictionary__8l;
              v29[2] = begin;
              IOReportIterate();
            }
            id v16 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
            v17 = dispatch_queue_create("reporting_queue", v16);

            v25[0] = 0;
            v25[1] = v25;
            v25[2] = 0x2020000000;
            int v26 = 0;
            handler[0] = _NSConcreteStackBlock;
            handler[1] = 3221225472;
            v24[0] = ___ZN16GTPerfStateGroup20StartCollectingStatsEy_block_invoke_2;
            v24[1] = &unk_7457A8;
            v24[2] = v25;
            v24[3] = begin;
            v24[4] = 0x2540BE400 / v12;
            v24[5] = v13;
            uint64_t v18 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v17);
            if (v18)
            {
              dispatch_time_t v19 = dispatch_time(0, v12);
              dispatch_source_set_timer(v18, v19, v12, 0);
              dispatch_source_set_event_handler(v18, handler);
              dispatch_resume(v18);
            }
            uint64_t v20 = *(void **)begin;
            *(void *)begin = v18;

            _Block_object_dispose(v25, 8);
          }
          goto LABEL_18;
        }
      }
      unint64_t v10 = a3;
      if (a3) {
        goto LABEL_9;
      }
LABEL_18:
      begin = (GTPerfStateGroup *)((char *)begin + 152);
    }
    while (begin != end);
  }
}

- (void)setup
{
  p_perfStateGroups = &self->_perfStateGroups;
  begin = self->_perfStateGroups.__begin_;
  if (0x86BCA1AF286BCA1BLL * ((self->_perfStateGroups.__end_cap_.__value_ - begin) >> 3) <= 2)
  {
    v5 = (char *)(self->_perfStateGroups.__end_ - begin);
    p_end_cap = &self->_perfStateGroups.__end_cap_;
    v46 = operator new(0x1C8uLL);
    uint64_t v47 = (uint64_t)&v5[(void)v46];
    v48 = (uint64_t (*)(uint64_t))&v5[(void)v46];
    v49 = (char *)v46 + 456;
    std::vector<GTPerfStateGroup>::__swap_out_circular_buffer(p_perfStateGroups, &v46);
    std::__split_buffer<GTPerfStateGroup>::~__split_buffer((uint64_t)&v46);
  }
  v45 = self;
  CFStringRef v56 = @"Perf Counters";
  id v6 = +[NSSet setWithObjects:@"GFX", 0];
  v57 = v6;
  v7 = +[NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
  BOOL v8 = v7;
  int v9 = v45;
  end = v45->_perfStateGroups.__end_;
  int v11 = 678152731 * ((unint64_t)(end - v45->_perfStateGroups.__begin_) >> 3);
  if (end >= v45->_perfStateGroups.__end_cap_.__value_)
  {
    uint64_t v13 = std::vector<GTPerfStateGroup>::__emplace_back_slow_path<NSString * {__strong},NSDictionary * {__strong},GTPerfStateGroup::eGTPerfStateGroup,GTPerfStateGroup::eGTPerfStateGroupType>(p_perfStateGroups, @"AMC Stats", v7, 678152731 * ((unint64_t)(end - v45->_perfStateGroups.__begin_) >> 3), 0);
    int v9 = v45;
  }
  else
  {
    id v12 = v7;
    *(void *)end = 0;
    *((void *)end + 1) = 0;
    *((void *)end + 3) = @"AMC Stats";
    *((void *)end + 4) = v12;
    *(_OWORD *)((char *)end + 40) = 0u;
    *(_OWORD *)((char *)end + 56) = 0u;
    *((_DWORD *)end + 18) = v11;
    *((_OWORD *)end + 7) = 0u;
    *((_OWORD *)end + 8) = 0u;
    *(void *)((char *)end + 141) = 0;
    uint64_t v13 = (uint64_t)end + 152;
    *(void *)((char *)end + 76) = 0;
    *(void *)((char *)end + 92) = 0;
    *(void *)((char *)end + 84) = 0;
    *((_DWORD *)end + 25) = 0;
    v45->_perfStateGroups.__end_ = (GTPerfStateGroup *)((char *)end + 152);
  }
  v9->_perfStateGroups.__end_ = (GTPerfStateGroup *)v13;

  CFStringRef v54 = @"GPU";
  uint64_t v14 = +[NSSet setWithObjects:@"GPUPH", @"PWRCTRL", 0];
  v55 = v14;
  uint64_t v15 = +[NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
  id v16 = v15;
  v17 = v45;
  uint64_t v18 = v45->_perfStateGroups.__end_;
  int v19 = 678152731 * ((unint64_t)(v18 - v45->_perfStateGroups.__begin_) >> 3);
  if (v18 >= v45->_perfStateGroups.__end_cap_.__value_)
  {
    uint64_t v21 = std::vector<GTPerfStateGroup>::__emplace_back_slow_path<NSString * {__strong},NSDictionary * {__strong},GTPerfStateGroup::eGTPerfStateGroup,GTPerfStateGroup::eGTPerfStateGroupType>(p_perfStateGroups, @"GPU Stats", v15, 678152731 * ((unint64_t)(v18 - v45->_perfStateGroups.__begin_) >> 3), 1);
    v17 = v45;
  }
  else
  {
    id v20 = v15;
    *(void *)uint64_t v18 = 0;
    *((void *)v18 + 1) = 0;
    *((void *)v18 + 3) = @"GPU Stats";
    *((void *)v18 + 4) = v20;
    *(_OWORD *)((char *)v18 + 40) = 0u;
    *(_OWORD *)((char *)v18 + 56) = 0u;
    *((_DWORD *)v18 + 18) = v19;
    *((_DWORD *)v18 + 19) = 1;
    *((void *)v18 + 11) = 0;
    *((void *)v18 + 12) = 0;
    *((void *)v18 + 10) = 0;
    *((_OWORD *)v18 + 7) = 0u;
    *((_OWORD *)v18 + 8) = 0u;
    *(void *)((char *)v18 + 141) = 0;
    uint64_t v21 = (uint64_t)v18 + 152;
    v45->_perfStateGroups.__end_ = (GTPerfStateGroup *)((char *)v18 + 152);
  }
  v17->_perfStateGroups.__end_ = (GTPerfStateGroup *)v21;

  CFStringRef v52 = @"Events";
  v22 = +[NSSet setWithObjects:@"SOC", @"DCS", @"AFR", 0];
  v53 = v22;
  v23 = +[NSDictionary dictionaryWithObjects:&v53 forKeys:&v52 count:1];
  id v24 = v23;
  v25 = v45->_perfStateGroups.__end_;
  int v26 = 678152731 * ((unint64_t)(v25 - v45->_perfStateGroups.__begin_) >> 3);
  if (v25 >= v45->_perfStateGroups.__end_cap_.__value_)
  {
    uint64_t v28 = std::vector<GTPerfStateGroup>::__emplace_back_slow_path<NSString * {__strong},NSDictionary * {__strong},GTPerfStateGroup::eGTPerfStateGroup,GTPerfStateGroup::eGTPerfStateGroupType>(p_perfStateGroups, @"SoC Stats", v23, 678152731 * ((unint64_t)(v25 - v45->_perfStateGroups.__begin_) >> 3), 2);
  }
  else
  {
    id v27 = v23;
    *(void *)v25 = 0;
    *((void *)v25 + 1) = 0;
    *((void *)v25 + 3) = @"SoC Stats";
    *((void *)v25 + 4) = v27;
    *(_OWORD *)((char *)v25 + 40) = 0u;
    *(_OWORD *)((char *)v25 + 56) = 0u;
    *((_DWORD *)v25 + 18) = v26;
    *((_DWORD *)v25 + 19) = 2;
    *((void *)v25 + 11) = 0;
    *((void *)v25 + 12) = 0;
    *((void *)v25 + 10) = 0;
    *((_OWORD *)v25 + 7) = 0u;
    *((_OWORD *)v25 + 8) = 0u;
    *(void *)((char *)v25 + 141) = 0;
    uint64_t v28 = (uint64_t)v25 + 152;
    v45->_perfStateGroups.__end_ = (GTPerfStateGroup *)((char *)v25 + 152);
  }
  v45->_perfStateGroups.__end_ = (GTPerfStateGroup *)v28;

  v29 = v45->_perfStateGroups.__begin_;
  for (i = v45->_perfStateGroups.__end_; v29 != i; v29 = (GTPerfStateGroup *)((char *)v29 + 152))
  {
    id v31 = (const void *)IOReportCopyChannelsInCategories();
    if ((IOReportPrune() & 1) == 0)
    {
      *((void *)v29 + 2) = IOReportCreateSubscription();
      int ChannelCount = IOReportGetChannelCount();
      id v33 = (void *)*((void *)v29 + 1);
      *((_DWORD *)v29 + 36) = ChannelCount;
      *((void *)v29 + 1) = 0;

      v34 = [*((id *)v29 + 1) objectForKeyedSubscript:@"IOReportChannels"];
      v35 = [&off_759238 allKeys];
      if (v34)
      {
        uint64_t v36 = +[NSMutableArray arrayWithCapacity:(*((_DWORD *)v29 + 36) + 1)];
        v37 = (void *)*((void *)v29 + 17);
        *((void *)v29 + 17) = v36;

        if (!*((_DWORD *)v29 + 19)) {
          [*((id *)v29 + 17) addObject:@"Sample Time"];
        }
        v46 = _NSConcreteStackBlock;
        uint64_t v47 = 3221225472;
        v48 = ___ZN16GTPerfStateGroup27_FindSubscribedCounterNamesEv_block_invoke;
        v49 = &unk_745760;
        p_end_cap = (__compressed_pair<GTPerfStateGroup *, std::allocator<GTPerfStateGroup>> *)&off_759238;
        v51 = v29;
        IOReportPrune();
      }
      if ((*((_DWORD *)v29 + 19) - 1) <= 1)
      {
        uint64_t v38 = *((void *)v29 + 10);
        if (0xAAAAAAAAAAAAAAABLL * ((*((void *)v29 + 12) - v38) >> 3) <= 0x3FF)
        {
          uint64_t v39 = *((void *)v29 + 11);
          v40 = (char *)operator new(0x6000uLL);
          v41 = (char *)*((void *)v29 + 11);
          v42 = (char *)*((void *)v29 + 10);
          v43 = &v40[24 * ((v39 - v38) / 24)];
          if (v41 != v42)
          {
            do
            {
              long long v44 = *(_OWORD *)(v41 - 24);
              *((void *)v43 - 1) = *((void *)v41 - 1);
              *(_OWORD *)(v43 - 24) = v44;
              v43 -= 24;
              v41 -= 24;
            }
            while (v41 != v42);
            v41 = v42;
          }
          *((void *)v29 + 10) = v43;
          *((void *)v29 + 11) = &v40[24 * ((v39 - v38) / 24)];
          *((void *)v29 + 12) = v40 + 24576;
          if (v41) {
            operator delete(v41);
          }
        }
      }
    }
    CFRelease(v31);
  }
  [(GTPerfStatsHelper *)v45 _collectOperatingPoints];
  mach_timebase_info(&v45->_timebaseInfo);
}

- (BOOL)_collectOperatingPoints
{
  CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (snprintf(__str, 0x80uLL, "%s%s", "IODeviceTree", ":/arm-io/pmgr") > 0x80) {
    return 0;
  }
  v66 = self;
  io_registry_entry_t v3 = IORegistryEntryFromPath(kIOMainPortDefault, __str);
  if (!v3) {
    return 0;
  }
  v86[0] = @"GPU";
  dispatch_source_t v4 = +[NSString stringWithUTF8String:"voltage-states9"];
  v86[1] = @"AFR";
  v87[0] = v4;
  v5 = +[NSString stringWithUTF8String:"voltage-states31"];
  v87[1] = v5;
  v62 = +[NSDictionary dictionaryWithObjects:v87 forKeys:v86 count:2];

  +[NSMutableDictionary dictionaryWithCapacity:10];
  v81[0] = _NSConcreteStackBlock;
  v81[1] = 3221225472;
  v81[2] = __44__GTPerfStatsHelper__collectOperatingPoints__block_invoke;
  v81[3] = &unk_745718;
  v81[4] = v66;
  io_registry_entry_t v83 = v3;
  id v65 = (id)objc_claimAutoreleasedReturnValue();
  id v82 = v65;
  [v62 enumerateKeysAndObjectsUsingBlock:v81];
  id v6 = [(NSDictionary *)v66->_configVariables objectForKeyedSubscript:@"num_cores"];
  unsigned int v7 = [v6 unsignedIntValue];

  BOOL v8 = [(NSDictionary *)v66->_configVariables objectForKeyedSubscript:@"num_mgpus"];
  unsigned int v9 = [v8 unsignedIntValue];

  unint64_t v10 = [(NSDictionary *)v66->_configVariables objectForKeyedSubscript:@"gpu_gen"];
  unsigned int v11 = [v10 unsignedIntValue];

  if (v9 <= 1) {
    unsigned int v12 = 1;
  }
  else {
    unsigned int v12 = v9;
  }
  unsigned int v13 = v7 / v12 + 1;
  if ((v13 & 0xFFFFFFFC) != 0) {
    unsigned int v14 = v13 & 0xFFFFFFFC;
  }
  else {
    unsigned int v14 = 1;
  }
  uint64_t v15 = (char *)operator new(0x18uLL);
  *(_OWORD *)uint64_t v15 = xmmword_4C8238;
  v64 = v15;
  *((void *)v15 + 2) = 4266;
  id v16 = (char *)operator new(0x18uLL);
  *(_OWORD *)id v16 = xmmword_4C8250;
  v61 = v16;
  *((void *)v16 + 2) = 2933;
  v17 = (char *)operator new(0x28uLL);
  *(_OWORD *)v17 = xmmword_4C8268;
  *((_OWORD *)v17 + 1) = unk_4C8278;
  v63 = v17;
  *((void *)v17 + 4) = 6400;
  uint64_t v18 = operator new(0x18uLL);
  v80[1] = v18 + 3;
  v80[2] = v18 + 3;
  v18[2] = 400;
  *(_OWORD *)uint64_t v18 = xmmword_4C8290;
  v58 = v18;
  v80[0] = v18;
  int v19 = operator new(0x18uLL);
  v79[1] = v19 + 3;
  v79[2] = v19 + 3;
  v19[2] = 900;
  *(_OWORD *)int v19 = xmmword_4C82A8;
  v57 = v19;
  v79[0] = v19;
  id v20 = operator new(0x20uLL);
  v78[1] = v20 + 2;
  v78[2] = v20 + 2;
  _OWORD *v20 = xmmword_4C82C0;
  v20[1] = unk_4C82D0;
  CFStringRef v56 = v20;
  v78[0] = v20;
  uint64_t v21 = operator new(0x18uLL);
  v77[1] = v21 + 3;
  v77[2] = v21 + 3;
  v21[2] = 900;
  *(_OWORD *)uint64_t v21 = xmmword_4C82E0;
  v55 = v21;
  v77[0] = v21;
  v22 = operator new(0x18uLL);
  v76[1] = v22 + 3;
  v76[2] = v22 + 3;
  v22[2] = 1068;
  *(_OWORD *)v22 = xmmword_4C82F8;
  __p = v22;
  v76[0] = v22;
  v67 = +[NSMutableArray arrayWithCapacity:5];
  v23 = +[NSMutableArray arrayWithCapacity:5];
  unsigned int v24 = v13 >> 2;
  if (v13 < 4) {
    int v25 = 1;
  }
  else {
    int v25 = v13 >> 2;
  }
  uint64_t v26 = +[NSMutableDictionary dictionaryWithCapacity:4];
  socBlockBandwidths = v66->_socBlockBandwidths;
  v66->_socBlockBandwidths = (NSMutableDictionary *)v26;

  [(NSMutableDictionary *)v66->_socBlockBandwidths setObject:&off_758B70 forKeyedSubscript:@"WriteReadRatio"];
  uint64_t v28 = v63 + 40;
  unint64_t v29 = (v9 * v25) << 6;
  uint64_t v30 = 2 * v29;
  if (v24 == 2)
  {
    if (v11 <= 0xD)
    {
      if (v11 != 13 || v9 < 2)
      {
        if (v11 == 13) {
          id v32 = v77;
        }
        else {
          id v32 = v79;
        }
LABEL_27:
        uint64_t v28 = v64 + 24;
        uint64_t v33 = 2 * v29;
        uint64_t v30 = (v9 * v25) << 6;
LABEL_40:
        id v31 = v64;
LABEL_41:
        uint64_t v35 = 2000000 * v9 * v14;
        do
        {
          uint64_t v36 = +[NSNumber numberWithUnsignedLongLong:v35 * *(void *)v31];
          [v67 addObject:v36];

          v31 += 8;
        }
        while (v31 != v28);
        unint64_t v29 = v30;
        goto LABEL_44;
      }
      [(NSMutableDictionary *)v66->_socBlockBandwidths setObject:&off_758B88 forKeyedSubscript:@"WriteReadRatio"];
    }
    else if (v9 < 2)
    {
      id v32 = v76;
      uint64_t v33 = 2 * v29;
      uint64_t v30 = (v9 * v25) << 6;
LABEL_35:
      id v31 = v63;
      goto LABEL_41;
    }
    if (v11 <= 0xD) {
      uint64_t v33 = 2 * v29;
    }
    else {
      uint64_t v33 = 4 * v29;
    }
    id v32 = v76;
    goto LABEL_35;
  }
  if (v24 != 1)
  {
    if (!v24)
    {
      id v31 = v61;
      uint64_t v28 = v61 + 24;
      uint64_t v30 = v29 >> 1;
      id v32 = v80;
      uint64_t v33 = (v9 * v25) << 6;
      goto LABEL_41;
    }
    id v32 = v79;
    goto LABEL_27;
  }
  if (v11 <= 0xD)
  {
    if (v11 == 10) {
      uint64_t v33 = (v9 * v25) << 6;
    }
    else {
      uint64_t v33 = 2 * v29;
    }
    uint64_t v30 = v29 >> (v11 == 10);
    id v32 = v79;
    uint64_t v28 = v64 + 24;
    goto LABEL_40;
  }
  if (v11 == 14)
  {
    uint64_t v28 = v64 + 24;
    id v31 = v64;
  }
  else
  {
    id v31 = v63;
  }
  id v32 = v78;
  uint64_t v33 = 2 * v29;
  if (v31 != v28)
  {
    uint64_t v30 = (v9 * v25) << 6;
    goto LABEL_41;
  }
LABEL_44:
  v37 = [v65 objectForKeyedSubscript:@"AFR"];
  v60 = v37;
  if (v37)
  {
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id v38 = v37;
    id v39 = [v38 countByEnumeratingWithState:&v72 objects:v85 count:16];
    if (v39)
    {
      uint64_t v40 = *(void *)v73;
      do
      {
        for (i = 0; i != v39; i = (char *)i + 1)
        {
          if (*(void *)v73 != v40) {
            objc_enumerationMutation(v38);
          }
          v42 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (void)[*(id *)(*((void *)&v72 + 1) + 8 * i) unsignedLongLongValue] * v29);
          [v23 addObject:v42];
        }
        id v39 = [v38 countByEnumeratingWithState:&v72 objects:v85 count:16];
      }
      while (v39);
    }
  }
  else
  {
    v43 = (void *)*v32;
    long long v44 = (void *)v32[1];
    if (v43 != v44)
    {
      uint64_t v45 = 1000000 * v29;
      do
      {
        v46 = +[NSNumber numberWithUnsignedLongLong:v45 * *v43];
        [v23 addObject:v46];

        ++v43;
      }
      while (v43 != v44);
    }
  }
  uint64_t v47 = [v65 objectForKeyedSubscript:@"GPU"];
  v48 = v47;
  if (v47)
  {
    v49 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v47 count]);
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id v50 = v48;
    id v51 = [v50 countByEnumeratingWithState:&v68 objects:v84 count:16];
    if (v51)
    {
      uint64_t v52 = *(void *)v69;
      do
      {
        for (j = 0; j != v51; j = (char *)j + 1)
        {
          if (*(void *)v69 != v52) {
            objc_enumerationMutation(v50);
          }
          CFStringRef v54 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (void)[*(id *)(*((void *)&v68 + 1) + 8 * (void)j) unsignedLongLongValue] * v33);
          [v49 addObject:v54];
        }
        id v51 = [v50 countByEnumeratingWithState:&v68 objects:v84 count:16];
      }
      while (v51);
    }

    [(NSMutableDictionary *)v66->_socBlockBandwidths setObject:v49 forKeyedSubscript:@"GPU"];
    if (!v23) {
      goto LABEL_68;
    }
    goto LABEL_67;
  }
  v49 = 0;
  if (v23) {
LABEL_67:
  }
    [(NSMutableDictionary *)v66->_socBlockBandwidths setObject:v23 forKeyedSubscript:@"AFR"];
LABEL_68:
  if (v67) {
    [(NSMutableDictionary *)v66->_socBlockBandwidths setObject:v67 forKeyedSubscript:@"DCS"];
  }

  operator delete(__p);
  operator delete(v55);
  operator delete(v56);
  operator delete(v57);
  operator delete(v58);
  operator delete(v63);
  operator delete(v61);
  operator delete(v64);

  return 1;
}

void __44__GTPerfStatsHelper__collectOperatingPoints__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  id v7 = v5;
  BOOL v8 = [v6 _frequenciesForStateName:[v7 UTF8String] forReg:*(unsigned int *)(a1 + 48)];
  if ([v8 count]) {
    [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:v9];
  }
}

- (id)_frequenciesForStateName:(const char *)a3 forReg:(unsigned int)a4
{
  CFStringRef v5 = CFStringCreateWithCString(kCFAllocatorDefault, a3, 0x600u);
  CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(a4, v5, kCFAllocatorDefault, 0);
  id v7 = +[NSMutableArray arrayWithCapacity:10];
  if (CFProperty)
  {
    CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    uint64_t v8 = 0;
    for (unint64_t i = 0; CFDataGetLength(CFProperty) >> 3 > i; ++i)
    {
      unint64_t v10 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)&CFDataGetBytePtr(CFProperty)[v8]];
      [v7 addObject:v10];

      v8 += 8;
    }
  }

  return v7;
}

- (GTPerfStatsHelper)initWithOutputPath:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GTPerfStatsHelper;
  id v6 = [(GTPerfStatsHelper *)&v10 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_outputPath, a3);
    uint64_t v8 = v7;
  }

  return v7;
}

- (void)reset
{
  begin = self->_perfStateGroups.__begin_;
  end = self->_perfStateGroups.__end_;
  while (begin != end)
  {
    [*((id *)begin + 5) removeAllObjects];
    *((void *)begin + 7) = *((void *)begin + 6);
    *((void *)begin + 11) = *((void *)begin + 10);
    begin = (GTPerfStateGroup *)((char *)begin + 152);
  }
}

- (GTPerfStatsHelper)initWithConfigurationVariables:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GTPerfStatsHelper;
  id v5 = [(GTPerfStatsHelper *)&v9 init];
  if (v5)
  {
    id v6 = (NSDictionary *)[v4 copy];
    configVariables = v5->_configVariables;
    v5->_configVariables = v6;
  }
  return v5;
}

@end