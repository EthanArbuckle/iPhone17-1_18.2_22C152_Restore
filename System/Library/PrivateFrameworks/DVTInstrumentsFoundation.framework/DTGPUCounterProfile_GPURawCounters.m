@interface DTGPUCounterProfile_GPURawCounters
+ (id)_sourceNameFromProfile:(unint64_t)a3;
+ (id)_supportedProfileNameFromEnum:(unint64_t)a3 vendor:(unsigned int)a4;
+ (id)create:(id)a3 profile:(unint64_t)a4;
+ (unsigned)vendorFromDevice:(id)a3;
- (BOOL)_validateAndConfigureRawCounters;
- (BOOL)prepare;
- (BOOL)start:(unint64_t)a3 vendorFeatures:(id)a4;
- (DTGPUCounterProfile_GPURawCounters)initWithDevice:(id)a3 profile:(unint64_t)a4;
- (DTGPUCounterProfile_GPURawCounters)initWithDevice:(id)a3 sourceName:(id)a4 profile:(unint64_t)a5;
- (DTGPUCounterProfile_GPURawCounters)initWithLimitersProfile:(id)a3;
- (id)counterProfileForHost;
- (id)ringBufferCounts;
- (id)sampleSizes;
- (void)_releaseCounterSource;
- (void)_releaseDataSource;
- (void)sampleCounters:(unint64_t)a3 callback:(id)a4;
- (void)stop;
@end

@implementation DTGPUCounterProfile_GPURawCounters

+ (id)_supportedProfileNameFromEnum:(unint64_t)a3 vendor:(unsigned int)a4
{
  if (a3 == 4)
  {
    if (a4 == 2) {
      return @"Set2";
    }
    else {
      return 0;
    }
  }
  else if (a3 == 3 && a4 < 3)
  {
    return off_264B90618[a4];
  }
  else
  {
    return 0;
  }
}

+ (id)_sourceNameFromProfile:(unint64_t)a3
{
  if (a3 - 5 > 8) {
    return 0;
  }
  else {
    return off_264B90630[a3 - 5];
  }
}

+ (id)create:(id)a3 profile:(unint64_t)a4
{
  id v5 = a3;
  v6 = 0;
  switch(a4)
  {
    case 1uLL:
    case 3uLL:
    case 4uLL:
      v8 = [[DTGPUCounterProfile_GPURawCounters alloc] initWithDevice:v5 profile:a4];
      goto LABEL_14;
    case 2uLL:
      v8 = [[DTGPUCounterProfile_GPURawCounters alloc] initWithLimitersProfile:v5];
      goto LABEL_14;
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
      v7 = +[DTGPUCounterProfile_GPURawCounters _sourceNameFromProfile:a4];
      if (!v7
        || +[DTGPUCounterProfile_GPURawCounters vendorFromDevice:v5])
      {
        goto LABEL_4;
      }
      v9 = [[DTGPUCounterProfile_GPURawCounters alloc] initWithDevice:v5 sourceName:v7 profile:a4];
      goto LABEL_7;
    case 0xCuLL:
      v7 = +[DTGPUCounterProfile_GPURawCounters _sourceNameFromProfile:12];
      if (v7
        && +[DTGPUCounterProfile_GPURawCounters vendorFromDevice:v5] == 1)
      {
        v9 = [[DTGPUCounterProfile_GPURawCounters alloc] initWithDevice:v5 sourceName:v7 profile:12];
LABEL_7:
        v6 = v9;
      }
      else
      {
LABEL_4:
        v6 = 0;
      }

LABEL_15:
      return v6;
    case 0xDuLL:
      v8 = [[DTGPUCounterProfile_GPURawCountersAPS alloc] initWithProfile:13 device:v5];
LABEL_14:
      v6 = v8;
      goto LABEL_15;
    default:
      goto LABEL_15;
  }
}

+ (unsigned)vendorFromDevice:(id)a3
{
  id v3 = a3;
  v4 = [v3 vendorName];
  id v5 = [v4 lowercaseString];

  if ([v3 supportsFamily:1001])
  {
    unsigned int v6 = 2;
  }
  else if ([v5 rangeOfString:@"intel"] == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([v5 rangeOfString:@"amd"] == 0x7FFFFFFFFFFFFFFFLL) {
      unsigned int v6 = 3;
    }
    else {
      unsigned int v6 = 1;
    }
  }
  else
  {
    unsigned int v6 = 0;
  }

  return v6;
}

- (DTGPUCounterProfile_GPURawCounters)initWithDevice:(id)a3 profile:(unint64_t)a4
{
  uint64_t v160 = *MEMORY[0x263EF8340];
  v150.receiver = self;
  v150.super_class = (Class)DTGPUCounterProfile_GPURawCounters;
  id v127 = a3;
  unsigned int v6 = -[DTGPUCounterProfile initWithProfile:device:](&v150, sel_initWithProfile_device_, a4);
  v7 = v6;
  v134 = v6;
  if (!v6) {
    goto LABEL_74;
  }
  p_device = (id *)&v6->_device;
  objc_storeStrong((id *)&v6->_device, a3);
  v7 = v134;
  uint64_t v8 = +[DTGPUCounterProfile_GPURawCounters vendorFromDevice:v127];
  v134->_vendor = v8;
  if (a4 == 1)
  {
    -[DTGPUCounterProfile setDefaultSampleInterval:](v134, "setDefaultSampleInterval:", 10000, v8);
LABEL_74:
    v70 = v7;
    goto LABEL_75;
  }
  v116 = +[DTGPUCounterProfile_GPURawCounters _supportedProfileNameFromEnum:a4 vendor:v8];
  if (v116 || v134->_vendor != 2)
  {
    id v123 = v127;
    CFProperty = (void *)IORegistryEntryCreateCFProperty([v123 acceleratorPort], @"MetalPluginName", 0, 0);
    v122 = (void *)IORegistryEntryCreateCFProperty([v123 acceleratorPort], @"MetalStatisticsName", 0, 0);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v122;
      if ([v9 count])
      {
        v135 = [v9 objectAtIndexedSubscript:0];
      }
      else
      {
        v135 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_14:
        v135 = @"MetalStatistics";
LABEL_15:
        v10 = (void *)GRCCopyAllCounterSourceGroup();
        v112 = v10;
        if ([v10 count])
        {
          v11 = [v10 firstObject];
          v12 = (void *)MEMORY[0x263EFF9A0];
          v13 = [v11 features];
          v14 = [v13 objectForKeyedSubscript:@"ConstantAGX_CoreConfig"];
          uint64_t v15 = [v12 dictionaryWithDictionary:v14];
          gpuConfigurationVariables = v134->_gpuConfigurationVariables;
          v134->_gpuConfigurationVariables = (NSMutableDictionary *)v15;
        }
        v17 = v134->_gpuConfigurationVariables;
        if (!v17 || ![(NSMutableDictionary *)v17 count])
        {
          v18 = (void *)MEMORY[0x263EFF9A0];
          v19 = (void *)IORegistryEntryCreateCFProperty([v123 acceleratorPort], @"GPUConfigurationVariable", 0, 0);
          uint64_t v20 = [v18 dictionaryWithDictionary:v19];
          v21 = v134->_gpuConfigurationVariables;
          v134->_gpuConfigurationVariables = (NSMutableDictionary *)v20;
        }
        GRCReleaseAllCounterSourceGroup();
        v22 = v134->_gpuConfigurationVariables;
        v23 = v22;
        if (v22)
        {
          v131 = [(NSMutableDictionary *)v22 objectForKeyedSubscript:@"core_mask_list"];
          v24 = objc_opt_new();
          if (v131 && [v131 count])
          {
            long long v153 = 0u;
            long long v154 = 0u;
            long long v151 = 0u;
            long long v152 = 0u;
            id v25 = v131;
            uint64_t v26 = [v25 countByEnumeratingWithState:&v151 objects:v159 count:16];
            uint64_t v27 = 0;
            if (v26)
            {
              uint64_t v28 = *(void *)v152;
              do
              {
                for (uint64_t i = 0; i != v26; ++i)
                {
                  if (*(void *)v152 != v28) {
                    objc_enumerationMutation(v25);
                  }
                  v30.i32[0] = [*(id *)(*((void *)&v151 + 1) + 8 * i) unsignedIntValue];
                  uint8x8_t v31 = (uint8x8_t)vcnt_s8(v30);
                  v31.i16[0] = vaddlv_u8(v31);
                  __int32 v32 = v31.i32[0];
                  v33 = [NSNumber numberWithUnsignedInt:v31.u32[0]];
                  [v24 addObject:v33];

                  uint64_t v27 = (v32 + v27);
                }
                uint64_t v26 = [v25 countByEnumeratingWithState:&v151 objects:v159 count:16];
              }
              while (v26);
            }

            v34 = [NSNumber numberWithUnsignedInt:v27];
            [(NSMutableDictionary *)v23 setObject:v34 forKeyedSubscript:@"num_cores"];

            [(NSMutableDictionary *)v23 setObject:v24 forKeyedSubscript:@"num_cores_per_ringbuffer"];
          }
        }
        if (!v134->_vendor)
        {
          v35 = [*p_device name];
          int v36 = [v35 containsString:@"Iris"];

          if ([CFProperty rangeOfString:@"KBL"] == 0x7FFFFFFFFFFFFFFFLL
            && [CFProperty rangeOfString:@"SKL"] == 0x7FFFFFFFFFFFFFFFLL
            && [CFProperty rangeOfString:@"BDW"] == 0x7FFFFFFFFFFFFFFFLL)
          {
            if ([CFProperty rangeOfString:@"HSW"] == 0x7FFFFFFFFFFFFFFFLL)
            {
              if ([CFProperty rangeOfString:@"ICL"] != 0x7FFFFFFFFFFFFFFFLL) {
                [(NSMutableDictionary *)v134->_gpuConfigurationVariables setObject:&unk_26E534208 forKeyedSubscript:@"EUCoreCount"];
              }
              goto LABEL_43;
            }
            v37 = NSNumber;
            if (v36) {
              uint64_t v38 = 40;
            }
            else {
              uint64_t v38 = 20;
            }
          }
          else
          {
            v37 = NSNumber;
            if (v36) {
              uint64_t v38 = 48;
            }
            else {
              uint64_t v38 = 24;
            }
          }
          v39 = [v37 numberWithInt:v38];
          [(NSMutableDictionary *)v134->_gpuConfigurationVariables setObject:v39 forKeyedSubscript:@"EUCoreCount"];
        }
LABEL_43:
        v40 = (__CFString *)IORegistryEntryCreateCFProperty([v123 acceleratorPort], @"AGXInternalPerfCounterResourcesPath", 0, 0);
        v41 = v40;
        v42 = @"/AppleInternal/Library/AGX/Performance";
        if (v40) {
          v42 = v40;
        }
        v118 = v42;

        v43 = [(__CFString *)v118 stringByAppendingPathComponent:CFProperty];
        v158[0] = v43;
        v44 = [NSString stringWithFormat:@"/System/Library/Extensions/%@.bundle", CFProperty];
        v158[1] = v44;
        v45 = [NSString stringWithFormat:@"/System/Library/Extensions/%@.bundle/Contents/Resources", CFProperty];
        v158[2] = v45;
        v113 = [MEMORY[0x263EFF8C0] arrayWithObjects:v158 count:3];

        v137 = [MEMORY[0x263F08850] defaultManager];
        long long v148 = 0u;
        long long v149 = 0u;
        long long v146 = 0u;
        long long v147 = 0u;
        obuint64_t j = v113;
        uint64_t v46 = [obj countByEnumeratingWithState:&v146 objects:v157 count:16];
        if (v46)
        {
          uint64_t v47 = 0;
          uint64_t v48 = 0;
          uint64_t v49 = *(void *)v147;
          while (2)
          {
            uint64_t v50 = 0;
            v51 = (void *)v47;
            v52 = (void *)v48;
            do
            {
              if (*(void *)v147 != v49) {
                objc_enumerationMutation(obj);
              }
              v53 = [*(id *)(*((void *)&v146 + 1) + 8 * v50) stringByAppendingPathComponent:v135];
              uint64_t v54 = [v53 stringByAppendingString:@"-counters.plist"];

              v55 = (void *)v54;
              uint64_t v56 = [v53 stringByAppendingString:@"-derived.js"];

              v57 = (void *)v56;
              if ([v137 fileExistsAtPath:v55]
                && ([v137 fileExistsAtPath:v56] & 1) != 0)
              {
                uint64_t v47 = v56;
                uint64_t v48 = (uint64_t)v55;
LABEL_60:

                goto LABEL_61;
              }
              uint64_t v48 = [v55 stringByReplacingOccurrencesOfString:@"AGXMetalStatistics" withString:@"AGXMetalStatisticsExternal"];

              uint64_t v47 = [v57 stringByReplacingOccurrencesOfString:@"AGXMetalStatistics" withString:@"AGXMetalStatisticsExternal"];

              if ([v137 fileExistsAtPath:v48]
                && [v137 fileExistsAtPath:v47])
              {
                goto LABEL_60;
              }

              ++v50;
              v51 = (void *)v47;
              v52 = (void *)v48;
            }
            while (v46 != v50);
            uint64_t v46 = [obj countByEnumeratingWithState:&v146 objects:v157 count:16];
            if (v46) {
              continue;
            }
            break;
          }
LABEL_61:
          v114 = (void *)v47;
          v117 = (void *)v48;

          int v58 = 1;
          uint64_t v60 = v48;
          if (!v48) {
            goto LABEL_71;
          }
          v61 = (void *)v47;
          if (!v47
            || ![v137 fileExistsAtPath:v117]
            || ![v137 fileExistsAtPath:v47])
          {
LABEL_72:

            v7 = v134;
            if (!v58) {
              goto LABEL_74;
            }
            goto LABEL_73;
          }
          v109 = [NSDictionary dictionaryWithContentsOfFile:v60];
          v62 = [v109 objectForKeyedSubscript:@"DerivedCounters"];
          v111 = [v109 objectForKeyedSubscript:@"Instruments"];
          v63 = [v111 objectForKeyedSubscript:@"DefaultSamplingInterval"];
          unint64_t v64 = [v63 unsignedIntegerValue];

          uint64_t v65 = 50;
          if (v64 > 0x32) {
            uint64_t v65 = v64;
          }
          [(DTGPUCounterProfile *)v134 setDefaultSampleInterval:1000 * v65];
          v66 = [v111 objectForKeyedSubscript:@"Profiles"];
          v110 = v66;
          if ([v66 count])
          {
            if (!v116
              || ([v66 objectForKeyedSubscript:v116],
                  v67 = objc_claimAutoreleasedReturnValue(),
                  BOOL v68 = v67 == 0,
                  v67,
                  v68))
            {
              v72 = [v66 allKeys];
              uint64_t v73 = [v72 objectAtIndexedSubscript:0];

              v69 = (void *)v73;
              v66 = v110;
            }
            else
            {
              v69 = v116;
            }
            v116 = v69;
            v74 = [v66 objectForKeyedSubscript:];
            v75 = v74;
            if (v74)
            {
              v108 = v74;
              v76 = [v74 objectForKeyedSubscript:@"DerivedCounters"];
              if (v76)
              {
                v107 = v76;
                v77 = [v75 objectForKeyedSubscript:@"Name"];
                [(DTGPUCounterProfile *)v134 setProfileName:v77];

                v78 = [(DTGPUCounterProfile *)v134 profileName];
                LODWORD(v77) = v78 == 0;

                if (v77) {
                  [(DTGPUCounterProfile *)v134 setProfileName:v116];
                }
                uint64_t v79 = [(DTGPUCounterProfile *)v134 profileName];
                sourceName = v134->_sourceName;
                v134->_sourceName = (NSString *)v79;

                v81 = [v108 objectForKeyedSubscript:@"RawCounterWidth"];
                long long v144 = 0u;
                long long v145 = 0u;
                long long v142 = 0u;
                long long v143 = 0u;
                id v115 = v107;
                uint64_t v121 = [v115 countByEnumeratingWithState:&v142 objects:v156 count:16];
                if (v121)
                {
                  uint64_t v120 = *(void *)v143;
                  do
                  {
                    for (uint64_t j = 0; j != v121; ++j)
                    {
                      if (*(void *)v143 != v120) {
                        objc_enumerationMutation(v115);
                      }
                      v82 = *(void **)(*((void *)&v142 + 1) + 8 * j);
                      v133 = [v82 objectForKeyedSubscript:@"Name"];
                      v125 = [v82 objectForKeyedSubscript:@"GroupIndex"];
                      v126 = [v82 objectForKeyedSubscript:@"Multiplier"];
                      v83 = [v62 objectForKeyedSubscript:v133];
                      if (v83)
                      {
                        id v129 = v83;
                        v124 = [v83 objectForKeyedSubscript:@"name"];
                        v84 = [DTGPUCounter alloc];
                        if (v124) {
                          v85 = v124;
                        }
                        else {
                          v85 = v133;
                        }
                        v132 = [(DTGPUCounter *)v84 initWithName:v85 maxValue:0];
                        v86 = [v129 objectForKeyedSubscript:@"description"];
                        [(DTGPUCounter *)v132 setCounterDescription:v86];

                        v87 = [v129 objectForKeyedSubscript:@"type"];
                        [(DTGPUCounter *)v132 setType:v87];

                        if (v125)
                        {
                          v88 = v132;
                          uint64_t v89 = [v125 unsignedIntValue];
                        }
                        else
                        {
                          uint64_t v89 = 0;
                          v88 = v132;
                        }
                        [(DTGPUCounter *)v88 setGroupIndex:v89];
                        if (v126) {
                          uint64_t v90 = [v126 unsignedIntValue];
                        }
                        else {
                          uint64_t v90 = 1;
                        }
                        [(DTGPUCounter *)v88 setMultiplier:v90];
                        v91 = [(DTGPUCounter *)v88 type];
                        int v92 = [v91 isEqualToString:@"Percentage"];

                        if (v92)
                        {
                          [(DTGPUCounter *)v132 setMaxValue:100];
                          [(DTGPUCounter *)v132 setMultiplier:100];
                        }
                        else
                        {
                          [(DTGPUCounter *)v132 setMaxValue:0x225C17D04];
                        }
                        [(DTGPUCounter *)v132 setFunctionName:v133];
                        v93 = objc_opt_new();
                        v94 = [v129 objectForKeyedSubscript:@"counters"];
                        long long v140 = 0u;
                        long long v141 = 0u;
                        long long v138 = 0u;
                        long long v139 = 0u;
                        id v95 = v94;
                        uint64_t v96 = [v95 countByEnumeratingWithState:&v138 objects:v155 count:16];
                        if (v96)
                        {
                          uint64_t v97 = *(void *)v139;
                          do
                          {
                            for (uint64_t k = 0; k != v96; ++k)
                            {
                              if (*(void *)v139 != v97) {
                                objc_enumerationMutation(v95);
                              }
                              uint64_t v99 = *(void *)(*((void *)&v138 + 1) + 8 * k);
                              v100 = [v62 objectForKeyedSubscript:v99];
                              BOOL v101 = v100 == 0;

                              if (v101)
                              {
                                v102 = [v81 objectForKeyedSubscript:v99];
                                BOOL v103 = v102 == 0;

                                if (v103)
                                {
                                  uint64_t v105 = 32;
                                }
                                else
                                {
                                  v104 = [v81 objectForKeyedSubscript:v99];
                                  uint64_t v105 = [v104 unsignedIntValue];
                                }
                                v106 = [[DTGPURawCounter_GPURawCounter alloc] initWithName:v99 width:v105];
                                [v93 addObject:v106];
                              }
                            }
                            uint64_t v96 = [v95 countByEnumeratingWithState:&v138 objects:v155 count:16];
                          }
                          while (v96);
                        }

                        [(DTGPUCounter *)v132 setRawCounters:v93];
                        [(DTGPUCounterProfile *)v134 addCounter:v132];

                        v83 = v129;
                      }
                    }
                    uint64_t v121 = [v115 countByEnumeratingWithState:&v142 objects:v156 count:16];
                  }
                  while (v121);
                }

                [(DTGPUCounterProfile *)v134 setDerivedCounterScriptPath:v114];
                int v58 = 0;
                v76 = v107;
              }
              else
              {
                int v58 = 1;
              }

              v75 = v108;
            }
            else
            {
              int v58 = 1;
            }

            v66 = v110;
          }
          else
          {
            int v58 = 1;
          }

          v59 = v109;
        }
        else
        {
          v117 = 0;
          v114 = 0;
          int v58 = 1;
          v59 = obj;
        }

LABEL_71:
        v61 = v114;
        goto LABEL_72;
      }
      v135 = v122;
    }
    if (v135) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_73:
  v70 = 0;
LABEL_75:

  return v70;
}

- (DTGPUCounterProfile_GPURawCounters)initWithLimitersProfile:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  v50.receiver = self;
  v50.super_class = (Class)DTGPUCounterProfile_GPURawCounters;
  id v41 = a3;
  id v3 = -[DTGPUCounterProfile initWithProfile:device:](&v50, sel_initWithProfile_device_, 2);
  v44 = v3;
  if (!v3) {
    goto LABEL_33;
  }
  id v38 = v41;
  v3->_vendor = +[DTGPUCounterProfile_GPURawCounters vendorFromDevice:v38];
  CFProperty = (void *)IORegistryEntryCreateCFProperty([v38 acceleratorPort], @"MetalPluginName", 0, 0);
  v40 = [MEMORY[0x263F08850] defaultManager];
  v4 = [NSString stringWithFormat:@"/System/Library/Extensions/%@.bundle", CFProperty];
  v42 = [v40 enumeratorAtPath:v4];

  id v5 = [v42 nextObject];
  if (v5)
  {
    while ([v5 rangeOfString:@"MetalLimiters"] == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v6 = [v42 nextObject];

      id v5 = (void *)v6;
      if (!v6) {
        goto LABEL_5;
      }
    }
    uint64_t v8 = NSString;
    id v9 = v5;
    v37 = [v8 stringWithFormat:@"/System/Library/Extensions/%@.bundle/%@", CFProperty, v9];
    v35 = v9;

    int v36 = [NSString stringWithFormat:@"/System/Library/Extensions/%@.bundle/AGXMetalPerfCounters.plist", CFProperty];
    if (![v40 fileExistsAtPath:v37]) {
      goto LABEL_27;
    }
    if ([v40 fileExistsAtPath:v36])
    {
      v34 = [NSDictionary dictionaryWithContentsOfFile:v37];
      v45 = [NSDictionary dictionaryWithContentsOfFile:v36];
      v10 = [v34 objectForKeyedSubscript:@"Configuration"];
      v11 = [v10 objectForKeyedSubscript:@"Timer Interval (microseconds)"];
      unint64_t v12 = [v11 unsignedIntegerValue];

      uint64_t v13 = 50;
      if (v12 > 0x32) {
        uint64_t v13 = v12;
      }
      [(DTGPUCounterProfile *)v44 setDefaultSampleInterval:1000 * v13];
      v14 = [v34 objectForKeyedSubscript:@"Profiles"];
      uint64_t v15 = [v14 objectForKeyedSubscript:@"limiters"];
      v33 = [v15 objectForKeyedSubscript:@"Counters"];

      if (v33)
      {
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        obuint64_t j = v33;
        uint64_t v16 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
        if (v16)
        {
          uint64_t v17 = *(void *)v47;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v47 != v17) {
                objc_enumerationMutation(obj);
              }
              v19 = *(void **)(*((void *)&v46 + 1) + 8 * i);
              uint64_t v20 = [v19 objectForKeyedSubscript:@"Name"];
              v21 = [v19 objectForKeyedSubscript:@"Width"];
              v22 = [v45 objectForKeyedSubscript:v20];
              if (v22)
              {
                v23 = objc_opt_new();
                v24 = [DTGPURawCounter_GPURawCounter alloc];
                if (v21) {
                  uint64_t v25 = [v21 unsignedIntValue];
                }
                else {
                  uint64_t v25 = 32;
                }
                uint64_t v26 = [(DTGPURawCounter_GPURawCounter *)v24 initWithName:v20 width:v25];
                [v23 addObject:v26];

                uint64_t v27 = [[DTGPUCounter alloc] initWithName:v20 maxValue:0];
                [(DTGPUCounter *)v27 setRawCounters:v23];
                uint64_t v28 = [v22 objectForKeyedSubscript:@"Description"];
                v29 = (void *)v28;
                if (v28) {
                  int8x8_t v30 = (__CFString *)v28;
                }
                else {
                  int8x8_t v30 = &stru_26E517620;
                }
                [(DTGPUCounter *)v27 setCounterDescription:v30];
                [(DTGPUCounter *)v27 setFunctionName:v20];
                [(DTGPUCounter *)v27 setMaxValue:0x7FFFFFFFLL];
                [(DTGPUCounter *)v27 setMultiplier:1];
                [(DTGPUCounter *)v27 setGroupIndex:1];
                [(DTGPUCounterProfile *)v44 addCounter:v27];
              }
            }
            uint64_t v16 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
          }
          while (v16);
        }

        [(DTGPUCounterProfile *)v44 setDerivedCounterScriptPath:0];
        int v7 = 0;
      }
      else
      {
        int v7 = 1;
      }
    }
    else
    {
LABEL_27:
      int v7 = 1;
    }
  }
  else
  {
LABEL_5:
    int v7 = 1;
  }

  id v3 = v44;
  if (v7) {
    uint8x8_t v31 = 0;
  }
  else {
LABEL_33:
  }
    uint8x8_t v31 = v3;

  return v31;
}

- (DTGPUCounterProfile_GPURawCounters)initWithDevice:(id)a3 sourceName:(id)a4 profile:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DTGPUCounterProfile_GPURawCounters;
  v10 = [(DTGPUCounterProfile *)&v14 initWithProfile:a5 device:v8];
  if (v10)
  {
    uint64_t v11 = [v9 lowercaseString];
    sourceName = v10->_sourceName;
    v10->_sourceName = (NSString *)v11;

    v10->_vendor = +[DTGPUCounterProfile_GPURawCounters vendorFromDevice:v8];
    [(DTGPUCounterProfile *)v10 setDerivedCounterScriptPath:0];
    [(DTGPUCounterProfile *)v10 setDefaultSampleInterval:50000];
  }

  return v10;
}

- (BOOL)prepare
{
  return MEMORY[0x270F9A6D0](self, sel__validateAndConfigureRawCounters);
}

- (BOOL)_validateAndConfigureRawCounters
{
  uint64_t v156 = *MEMORY[0x263EF8340];
  v93 = (void *)GRCCopyAllCounterSourceGroup();
  if (![v93 count]) {
    goto LABEL_58;
  }
  uint64_t v99 = self;
  if (self->_vendor != 2)
  {
    long long v143 = 0uLL;
    long long v144 = 0uLL;
    long long v141 = 0uLL;
    long long v142 = 0uLL;
    id v101 = v93;
    uint64_t v21 = [v101 countByEnumeratingWithState:&v141 objects:v155 count:16];
    if (v21)
    {
      uint64_t v107 = *(void *)v142;
      do
      {
        uint64_t v113 = 0;
        uint64_t v104 = v21;
        do
        {
          if (*(void *)v142 != v107) {
            objc_enumerationMutation(v101);
          }
          v22 = *(void **)(*((void *)&v141 + 1) + 8 * v113);
          long long v137 = 0u;
          long long v138 = 0u;
          long long v139 = 0u;
          long long v140 = 0u;
          v23 = [v22 sourceList];
          uint64_t v24 = [v23 countByEnumeratingWithState:&v137 objects:v154 count:16];
          id v110 = v22;
          if (!v24)
          {
LABEL_36:

            goto LABEL_38;
          }
          uint64_t v25 = *(void *)v138;
LABEL_30:
          uint64_t v26 = 0;
          while (1)
          {
            if (*(void *)v138 != v25) {
              objc_enumerationMutation(v23);
            }
            uint64_t v27 = *(void **)(*((void *)&v137 + 1) + 8 * v26);
            uint64_t v28 = [v27 name];
            v29 = [v28 lowercaseString];
            int8x8_t v30 = [(NSString *)v99->_sourceName lowercaseString];
            int v31 = [v29 isEqualToString:v30];

            if (v31) {
              break;
            }
            if (v24 == ++v26)
            {
              uint64_t v24 = [v23 countByEnumeratingWithState:&v137 objects:v154 count:16];
              if (!v24) {
                goto LABEL_36;
              }
              goto LABEL_30;
            }
          }
          objc_storeStrong((id *)&v99->_sourceGroup, v110);
          objc_storeStrong((id *)&v99->_source, v27);

LABEL_38:
          if (v99->_sourceGroup) {
            goto LABEL_41;
          }
          ++v113;
        }
        while (v113 != v104);
        uint64_t v21 = [v101 countByEnumeratingWithState:&v141 objects:v155 count:16];
      }
      while (v21);
    }
LABEL_41:

    goto LABEL_51;
  }
  long long v135 = 0uLL;
  long long v136 = 0uLL;
  long long v133 = 0uLL;
  long long v134 = 0uLL;
  obid j = v93;
  uint64_t v3 = [obj countByEnumeratingWithState:&v133 objects:v153 count:16];
  if (!v3)
  {
    id v109 = 0;
    v112 = 0;
    id v100 = 0;
    BOOL v103 = 0;
    goto LABEL_44;
  }
  id v109 = 0;
  v112 = 0;
  id v100 = 0;
  BOOL v103 = 0;
  uint64_t v95 = *(void *)v134;
  do
  {
    uint64_t v4 = 0;
    id v96 = (id)v3;
    do
    {
      if (*(void *)v134 != v95) {
        objc_enumerationMutation(obj);
      }
      id v5 = *(void **)(*((void *)&v133 + 1) + 8 * v4);
      long long v129 = 0u;
      long long v130 = 0u;
      long long v131 = 0u;
      long long v132 = 0u;
      uint64_t v6 = [v5 sourceList];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v129 objects:v152 count:16];
      uint64_t v98 = v4;
      if (v7)
      {
        uint64_t v106 = *(void *)v130;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v130 != v106) {
              objc_enumerationMutation(v6);
            }
            id v9 = *(void **)(*((void *)&v129 + 1) + 8 * i);
            v10 = [v9 name];
            uint64_t v11 = v6;
            BOOL v12 = [v10 rangeOfString:@"RDE"] == 0;

            if (v12)
            {
              uint64_t v16 = v100;
              uint64_t v15 = v103;
              id v18 = v109;
              uint64_t v17 = v112;
              id v100 = v9;
              BOOL v103 = v5;
LABEL_17:
              id v19 = v9;

              id v20 = v5;
              id v109 = v18;
              v112 = v17;
              goto LABEL_18;
            }
            uint64_t v13 = [v9 name];
            char v14 = [v13 isEqualToString:@"Firmware"];

            uint64_t v16 = v109;
            uint64_t v15 = v112;
            uint64_t v17 = v5;
            id v18 = v9;
            if (v14) {
              goto LABEL_17;
            }
LABEL_18:
            uint64_t v6 = v11;
          }
          uint64_t v7 = [v11 countByEnumeratingWithState:&v129 objects:v152 count:16];
        }
        while (v7);
      }

      uint64_t v4 = v98 + 1;
    }
    while ((id)(v98 + 1) != v96);
    uint64_t v3 = [obj countByEnumeratingWithState:&v133 objects:v153 count:16];
  }
  while (v3);
LABEL_44:

  id v32 = v100 ? v100 : v109;
  objc_storeStrong((id *)&v99->_source, v32);
  v33 = v100 ? v103 : v112;
  objc_storeStrong((id *)&v99->_sourceGroup, v33);

LABEL_51:
  if (!v99->_sourceGroup || (source = v99->_source) == 0)
  {
LABEL_58:
    BOOL v43 = 0;
    goto LABEL_59;
  }
  uint64_t v35 = 0;
  memset(v127, 0, sizeof(v127));
  int v128 = 1065353216;
  while (1)
  {
    int v36 = [(GPURawCounterSource *)source availableCounters];
    BOOL v37 = [v36 count] > (unint64_t)v35;

    if (!v37) {
      break;
    }
    id v38 = [(GPURawCounterSource *)v99->_source availableCounters];
    v39 = [v38 objectAtIndexedSubscript:v35];

    uint64_t v40 = [v39 counterValueType];
    id v41 = [v39 name];
    sub_23089D290(__p, (char *)[v41 UTF8String]);
    long long v145 = (long long *)__p;
    v42 = sub_23090F798((uint64_t)v127, __p, (uint64_t)&unk_23094A570, &v145);
    v42[10] = v35;
    *((void *)v42 + 6) = v40;
    if (v151 < 0) {
      operator delete(*(void **)__p);
    }

    uint64_t v35 = (v35 + 1);
    source = v99->_source;
  }
  v45 = objc_opt_new();
  long long v125 = 0u;
  long long v126 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  id v97 = [(DTGPUCounterProfile *)v99 counters];
  uint64_t v105 = [v97 countByEnumeratingWithState:&v123 objects:v149 count:16];
  if (v105)
  {
    id v102 = *(id *)v124;
    long long v46 = &_os_log_internal;
    do
    {
      for (id j = 0; j != (id)v105; id j = (char *)j + 1)
      {
        if (*(id *)v124 != v102) {
          objc_enumerationMutation(v97);
        }
        long long v47 = *(void **)(*((void *)&v123 + 1) + 8 * (void)j);
        uint64_t v35 = objc_opt_new();
        long long v121 = 0u;
        long long v122 = 0u;
        long long v119 = 0u;
        long long v120 = 0u;
        v108 = v47;
        long long v48 = [v47 rawCounters];
        uint64_t v49 = [v48 countByEnumeratingWithState:&v119 objects:v148 count:16];
        if (v49)
        {
          uint64_t v50 = *(void *)v120;
          do
          {
            for (uint64_t k = 0; k != v49; ++k)
            {
              if (*(void *)v120 != v50) {
                objc_enumerationMutation(v48);
              }
              uint64_t v52 = *(void **)(*((void *)&v119 + 1) + 8 * k);
              id v53 = [v52 name];
              sub_23089D290(__p, (char *)[v53 UTF8String]);
              uint64_t v54 = sub_23090FFDC(v127, __p);
              if (v151 < 0) {
                operator delete(*(void **)__p);
              }

              if (v54)
              {
                [v52 setCounterIdx:*((unsigned int *)v54 + 10)];
                [v52 setValueType:*((void *)v54 + 6)];
                [v45 addObject:v52];
                [(id)v35 addObject:v52];
              }
              else if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
              {
                id v55 = [v52 name];
                uint64_t v56 = [v55 UTF8String];
                *(_DWORD *)__p = 136315138;
                *(void *)&__p[4] = v56;
                _os_log_impl(&dword_23087D000, v46, OS_LOG_TYPE_ERROR, "Failed to find counter: failed at %s", __p, 0xCu);
              }
            }
            uint64_t v49 = [v48 countByEnumeratingWithState:&v119 objects:v148 count:16];
          }
          while (v49);
        }

        [v108 setRawCounters:v35];
      }
      uint64_t v105 = [v97 countByEnumeratingWithState:&v123 objects:v149 count:16];
    }
    while (v105);
  }

  if (v99->_vendor != 2)
  {
    v57 = [(DTGPUCounterProfile *)v99 counters];
    BOOL v58 = [v57 count] == 0;

    if (v58)
    {
      for (unsigned int m = 0; ; unsigned int m = v79 + 1)
      {
        v78 = [(GPURawCounterSource *)v99->_source availableCounters];
        uint64_t v79 = m;
        BOOL v80 = [v78 count] > (unint64_t)m;

        if (!v80) {
          break;
        }
        v81 = [(GPURawCounterSource *)v99->_source availableCounters];
        v82 = [v81 objectAtIndexedSubscript:v79];

        v83 = [DTGPURawCounter_GPURawCounter alloc];
        v84 = [v82 name];
        v85 = [(DTGPURawCounter_GPURawCounter *)v83 initWithName:v84 width:64];

        [(DTGPURawCounter_GPURawCounter *)v85 setCounterIdx:v79];
        -[DTGPURawCounter_GPURawCounter setValueType:](v85, "setValueType:", [v82 counterValueType]);
        [v45 addObject:v85];
        v86 = [DTGPUCounter alloc];
        v87 = [v82 name];
        v88 = [(DTGPUCounter *)v86 initWithName:v87 maxValue:0x7FFFFFFFLL];

        long long v147 = v85;
        uint64_t v89 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v147 count:1];
        [(DTGPUCounter *)v88 setRawCounters:v89];

        uint64_t v90 = [v82 description];
        if (v90)
        {
          uint64_t v35 = [v82 description];
          v91 = (__CFString *)v35;
        }
        else
        {
          v91 = &stru_26E517620;
        }
        [(DTGPUCounter *)v88 setCounterDescription:v91];
        if (v90) {

        }
        int v92 = [v82 name];
        [(DTGPUCounter *)v88 setFunctionName:v92];

        [(DTGPUCounter *)v88 setMaxValue:0x7FFFFFFFLL];
        [(DTGPUCounter *)v88 setMultiplier:1];
        [(DTGPUCounter *)v88 setGroupIndex:1];
        [(DTGPUCounterProfile *)v99 addCounter:v88];
      }
    }
  }
  v59 = objc_opt_new();
  if (v99->_vendor == 2)
  {
    uint64_t v60 = [[DTGPURawCounter_GPURawCounter alloc] initWithName:@"GRC_TIMESTAMP"];
    [v59 addObject:v60];

    v61 = [[DTGPURawCounter_GPURawCounter alloc] initWithName:@"GRC_GPU_CYCLES"];
    [v59 addObject:v61];

    v62 = [[DTGPURawCounter_GPURawCounter alloc] initWithName:@"GRC_ENCODER_ID"];
    [v59 addObject:v62];

    v63 = [[DTGPURawCounter_GPURawCounter alloc] initWithName:@"GRC_KICK_TRACE_ID"];
    [v59 addObject:v63];

    unint64_t v64 = [[DTGPURawCounter_GPURawCounter alloc] initWithName:@"GRC_SAMPLE_TYPE"];
    [v59 addObject:v64];
  }
  uint64_t v65 = [v45 allObjects];
  [v59 addObjectsFromArray:v65];

  v99->_gpuTimeIndex = -1;
  if (v99->_vendor)
  {
    v99->_gpuTimeIndex = 0;
    goto LABEL_87;
  }
  [v59 sortUsingComparator:&unk_26E5158C8];
  v118[0] = MEMORY[0x263EF8330];
  v118[1] = 3221225472;
  v118[2] = sub_23090DC4C;
  v118[3] = &unk_264B905D0;
  v118[4] = v99;
  [v59 enumerateObjectsUsingBlock:v118];
  if (v99->_gpuTimeIndex == -1)
  {
    BOOL v43 = 0;
  }
  else
  {
LABEL_87:
    objc_storeStrong((id *)&v99->_rawCounters, v59);
    v66 = objc_opt_new();
    long long v116 = 0u;
    long long v117 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    v67 = v99->_rawCounters;
    uint64_t v68 = [(NSArray *)v67 countByEnumeratingWithState:&v114 objects:v146 count:16];
    if (v68)
    {
      uint64_t v69 = *(void *)v115;
      do
      {
        for (uint64_t n = 0; n != v68; ++n)
        {
          if (*(void *)v115 != v69) {
            objc_enumerationMutation(v67);
          }
          v71 = [*(id *)(*((void *)&v114 + 1) + 8 * n) rawCounterSelect];
          [v66 addObject:v71];
        }
        uint64_t v68 = [(NSArray *)v67 countByEnumeratingWithState:&v114 objects:v146 count:16];
      }
      while (v68);
    }

    if (v99->_vendor == 2)
    {
      v72 = [DTGPUAGXCounterSourceGroup alloc];
      sourceGroup = v99->_sourceGroup;
      uint64_t v74 = [(DTGPUCounterProfile *)v99 profile];
      uint64_t v75 = [(DTGPUAGXCounterSourceGroup *)v72 initWithSourceGroup:sourceGroup selects:v66 apsSelects:MEMORY[0x263EFFA68] profile:v74];
      agxSource = v99->_agxSource;
      v99->_agxSource = (DTGPUAGXCounterSourceGroup *)v75;
    }
    BOOL v43 = 1;
  }

  sub_23090F710((uint64_t)v127);
LABEL_59:

  return v43;
}

- (void)_releaseCounterSource
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  sourceGroup = self->_sourceGroup;
  if (sourceGroup)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v4 = [(GPURawCounterSourceGroup *)sourceGroup sourceList];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v11;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * v7++) setEnabled:0];
        }
        while (v5 != v7);
        uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }

    [(GPURawCounterSourceGroup *)self->_sourceGroup stopSampling];
    source = self->_source;
    self->_source = 0;

    id v9 = self->_sourceGroup;
    self->_sourceGroup = 0;

    GRCReleaseAllCounterSourceGroup();
  }
}

- (BOOL)start:(unint64_t)a3 vendorFeatures:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a4;
  source = self->_source;
  if (!source || !self->_sourceGroup) {
    goto LABEL_6;
  }
  if (self->_vendor != 2)
  {
    [(GPURawCounterSource *)source setOptions:v6];
    uint64_t v25 = 0;
    id v9 = objc_opt_new();
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v10 = self->_rawCounters;
    uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v21 objects:v30 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v10);
          }
          char v14 = [*(id *)(*((void *)&v21 + 1) + 8 * i) rawCounterSelect:(void)v21];
          [v9 addObject:v14];
        }
        uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v21 objects:v30 count:16];
      }
      while (v11);
    }

    if ([(GPURawCounterSource *)self->_source requestCounters:v9 firstErrorIndex:&v25])
    {
      if ([(GPURawCounterSource *)self->_source setEnabled:1])
      {
        self->_startTime = mach_absolute_time();
        mach_timebase_info(&self->_timeBaseInfo);
        self->_firstGpuTime = 0;
        char v8 = [(GPURawCounterSourceGroup *)self->_sourceGroup startSampling];
LABEL_22:

        goto LABEL_23;
      }
      [(DTGPUCounterProfile_GPURawCounters *)self _releaseDataSource];
    }
    else
    {
      uint64_t v15 = objc_opt_new();
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = [v9 objectAtIndexedSubscript:v25];
        id v17 = [v16 name];
        uint64_t v18 = [v17 UTF8String];
        uint64_t v19 = [v15 UTF8String];
        *(_DWORD *)buf = 136315394;
        uint64_t v27 = v18;
        __int16 v28 = 2080;
        uint64_t v29 = v19;
        _os_log_impl(&dword_23087D000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to request counters: failed at %s (%s)", buf, 0x16u);
      }
      [(DTGPUCounterProfile_GPURawCounters *)self _releaseDataSource];
    }
    char v8 = 0;
    goto LABEL_22;
  }
  if (![(DTGPUAGXCounterSourceGroup *)self->_agxSource request:a3 vendorFeatures:v6])
  {
LABEL_6:
    char v8 = 0;
    goto LABEL_23;
  }
  [(GPURawCounterSourceGroup *)self->_sourceGroup startSampling];
  [(DTGPUAGXCounterSourceGroup *)self->_agxSource resume];
  char v8 = 1;
LABEL_23:

  return v8;
}

- (void)_releaseDataSource
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  sourceGroup = self->_sourceGroup;
  if (sourceGroup)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v4 = [(GPURawCounterSourceGroup *)sourceGroup sourceList];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v11;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * v7++) setEnabled:0];
        }
        while (v5 != v7);
        uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }

    [(GPURawCounterSourceGroup *)self->_sourceGroup stopSampling];
    source = self->_source;
    self->_source = 0;

    id v9 = self->_sourceGroup;
    self->_sourceGroup = 0;

    GRCReleaseAllCounterSourceGroup();
  }
}

- (void)stop
{
  [(DTGPUAGXCounterSourceGroup *)self->_agxSource stop];
  [(DTGPUCounterProfile_GPURawCounters *)self _releaseDataSource];
}

- (void)sampleCounters:(unint64_t)a3 callback:(id)a4
{
  id v6 = a4;
  if (self->_vendor == 2)
  {
    [(DTGPUAGXCounterSourceGroup *)self->_agxSource sampleCounters:a3 callback:v6];
  }
  else
  {
    mach_timebase_info(&info);
    for (uint64_t i = 0;
          i < [(GPURawCounterSource *)self->_source ringBufferNum];
          uint64_t i = (i + 1))
    {
      source = self->_source;
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = sub_23090E470;
      v9[3] = &unk_264B905F8;
      v9[4] = self;
      id v10 = v6;
      [(GPURawCounterSource *)source pollCountersAtBufferIndex:i withBlock:v9];
    }
  }
}

- (id)counterProfileForHost
{
  uint64_t v121 = *MEMORY[0x263EF8340];
  unsigned int vendor = self->_vendor;
  id v72 = (id)objc_opt_new();
  if (vendor == 2)
  {
    v78 = objc_opt_new();
    long long v105 = 0u;
    long long v106 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    uint64_t v3 = self->_rawCounters;
    uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v103 objects:v120 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v104;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v104 != v5) {
            objc_enumerationMutation(v3);
          }
          uint64_t v7 = *(void **)(*((void *)&v103 + 1) + 8 * i);
          char v8 = [v7 name];
          [v78 setObject:v7 forKeyedSubscript:v8];
        }
        uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v103 objects:v120 count:16];
      }
      while (v4);
    }

    long long v101 = 0u;
    long long v102 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    obuint64_t j = [(DTGPUAGXCounterSourceGroup *)self->_agxSource sources];
    uint64_t v68 = [obj countByEnumeratingWithState:&v99 objects:v119 count:16];
    if (v68)
    {
      uint64_t v67 = *(void *)v100;
      do
      {
        for (uint64_t j = 0; j != v68; ++j)
        {
          if (*(void *)v100 != v67) {
            objc_enumerationMutation(obj);
          }
          v76 = *(void **)(*((void *)&v99 + 1) + 8 * j);
          v77 = objc_opt_new();
          id v9 = objc_opt_new();
          long long v97 = 0u;
          long long v98 = 0u;
          long long v95 = 0u;
          long long v96 = 0u;
          id v10 = [v76 selects];
          uint64_t v11 = [v10 countByEnumeratingWithState:&v95 objects:v118 count:16];
          if (v11)
          {
            uint64_t v12 = *(void *)v96;
            do
            {
              for (uint64_t k = 0; k != v11; ++k)
              {
                if (*(void *)v96 != v12) {
                  objc_enumerationMutation(v10);
                }
                char v14 = [*(id *)(*((void *)&v95 + 1) + 8 * k) name:v67];
                uint64_t v15 = [v78 objectForKeyedSubscript:v14];

                uint64_t v16 = [v15 name];
                v117[0] = v16;
                id v17 = [NSNumber numberWithBool:objc_msgSend(v15, "valueType") == 1];
                v117[1] = v17;
                uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v117 count:2];
                [v77 addObject:v18];

                uint64_t v19 = [v15 name];
                [v9 setObject:v15 forKeyedSubscript:v19];
              }
              uint64_t v11 = [v10 countByEnumeratingWithState:&v95 objects:v118 count:16];
            }
            while (v11);
          }

          uint64_t v73 = objc_opt_new();
          long long v93 = 0u;
          long long v94 = 0u;
          long long v91 = 0u;
          long long v92 = 0u;
          id v74 = [(DTGPUCounterProfile *)self counters];
          uint64_t v20 = [v74 countByEnumeratingWithState:&v91 objects:v116 count:16];
          if (v20)
          {
            uint64_t v75 = *(void *)v92;
            do
            {
              for (uint64_t m = 0; m != v20; ++m)
              {
                if (*(void *)v92 != v75) {
                  objc_enumerationMutation(v74);
                }
                long long v22 = *(void **)(*((void *)&v91 + 1) + 8 * m);
                long long v87 = 0u;
                long long v88 = 0u;
                long long v89 = 0u;
                long long v90 = 0u;
                long long v23 = [v22 rawCounters];
                uint64_t v24 = [v23 countByEnumeratingWithState:&v87 objects:v115 count:16];
                if (v24)
                {
                  uint64_t v25 = *(void *)v88;
                  while (2)
                  {
                    for (uint64_t n = 0; n != v24; ++n)
                    {
                      if (*(void *)v88 != v25) {
                        objc_enumerationMutation(v23);
                      }
                      uint64_t v27 = [*(id *)(*((void *)&v87 + 1) + 8 * n) name];
                      __int16 v28 = [v9 objectForKeyedSubscript:v27];
                      BOOL v29 = v28 == 0;

                      if (v29)
                      {
                        int v30 = 0;
                        goto LABEL_36;
                      }
                    }
                    uint64_t v24 = [v23 countByEnumeratingWithState:&v87 objects:v115 count:16];
                    if (v24) {
                      continue;
                    }
                    break;
                  }
                }
                int v30 = 1;
LABEL_36:

                uint64_t v31 = [v76 source];
                id v32 = [v31 name];
                if ([v32 hasPrefix:@"BMPR"])
                {
                  v33 = [v22 name];
                  int v34 = [v33 containsString:@"Bandwidth"];
                }
                else
                {
                  int v34 = 0;
                }

                if ((v30 | v34))
                {
                  uint64_t v35 = [v22 infoArray];
                  [v73 addObject:v35];
                }
              }
              uint64_t v20 = [v74 countByEnumeratingWithState:&v91 objects:v116 count:16];
            }
            while (v20);
          }

          int v36 = [MEMORY[0x263F08850] defaultManager];
          BOOL v37 = [(DTGPUCounterProfile *)self derivedCounterScriptPath];
          int v38 = [v36 fileExistsAtPath:v37];

          v39 = &stru_26E517620;
          if (v38)
          {
            uint64_t v40 = NSString;
            id v41 = [(DTGPUCounterProfile *)self derivedCounterScriptPath];
            v39 = [v40 stringWithContentsOfFile:v41 encoding:4 error:0];
          }
          v113[0] = &unk_26E5341D8;
          v113[1] = &unk_26E534220;
          v114[0] = v73;
          v114[1] = v77;
          gpuConfigurationVariables = self->_gpuConfigurationVariables;
          v113[2] = &unk_26E534238;
          v113[3] = &unk_26E534250;
          if (!gpuConfigurationVariables) {
            gpuConfigurationVariables = (NSMutableDictionary *)MEMORY[0x263EFFA78];
          }
          v114[2] = v39;
          v114[3] = gpuConfigurationVariables;
          BOOL v43 = [NSDictionary dictionaryWithObjects:v114 forKeys:v113 count:4];
          [v72 addObject:v43];
        }
        uint64_t v68 = [obj countByEnumeratingWithState:&v99 objects:v119 count:16];
      }
      while (v68);
    }
  }
  else
  {
    obuint64_t j = (id)objc_opt_new();
    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    v44 = [(DTGPUCounterProfile *)self counters];
    uint64_t v45 = [v44 countByEnumeratingWithState:&v83 objects:v112 count:16];
    if (v45)
    {
      uint64_t v46 = *(void *)v84;
      do
      {
        for (iuint64_t i = 0; ii != v45; ++ii)
        {
          if (*(void *)v84 != v46) {
            objc_enumerationMutation(v44);
          }
          long long v48 = [*(id *)(*((void *)&v83 + 1) + 8 * ii) infoArray];
          [v72 addObject:v48];
        }
        uint64_t v45 = [v44 countByEnumeratingWithState:&v83 objects:v112 count:16];
      }
      while (v45);
    }

    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    uint64_t v49 = self->_rawCounters;
    uint64_t v50 = [(NSArray *)v49 countByEnumeratingWithState:&v79 objects:v111 count:16];
    if (v50)
    {
      uint64_t v51 = *(void *)v80;
      do
      {
        for (juint64_t j = 0; jj != v50; ++jj)
        {
          if (*(void *)v80 != v51) {
            objc_enumerationMutation(v49);
          }
          id v53 = *(void **)(*((void *)&v79 + 1) + 8 * jj);
          uint64_t v54 = [v53 name];
          v110[0] = v54;
          id v55 = [NSNumber numberWithBool:objc_msgSend(v53, "valueType") == 1];
          v110[1] = v55;
          uint64_t v56 = [MEMORY[0x263EFF8C0] arrayWithObjects:v110 count:2];
          [obj addObject:v56];
        }
        uint64_t v50 = [(NSArray *)v49 countByEnumeratingWithState:&v79 objects:v111 count:16];
      }
      while (v50);
    }

    v57 = [MEMORY[0x263F08850] defaultManager];
    BOOL v58 = [(DTGPUCounterProfile *)self derivedCounterScriptPath];
    int v59 = [v57 fileExistsAtPath:v58];

    if (v59)
    {
      uint64_t v60 = NSString;
      v61 = [(DTGPUCounterProfile *)self derivedCounterScriptPath];
      v62 = [v60 stringWithContentsOfFile:v61 encoding:4 error:0];
    }
    else
    {
      v62 = &stru_26E517620;
    }
    v107[0] = &unk_26E5341D8;
    v107[1] = &unk_26E534220;
    v108[0] = v72;
    v108[1] = obj;
    v107[2] = &unk_26E534238;
    v107[3] = &unk_26E534250;
    v63 = self->_gpuConfigurationVariables;
    if (!v63) {
      v63 = (NSMutableDictionary *)MEMORY[0x263EFFA78];
    }
    v108[2] = v62;
    v108[3] = v63;
    unint64_t v64 = [NSDictionary dictionaryWithObjects:v108 forKeys:v107 count:4];
    id v109 = v64;
    uint64_t v65 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v109 count:1];

    v78 = v72;
    id v72 = (id)v65;
  }

  return v72;
}

- (id)sampleSizes
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_opt_new();
  if (self->_vendor == 2)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v4 = [(DTGPUAGXCounterSourceGroup *)self->_agxSource sources];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v14 != v6) {
            objc_enumerationMutation(v4);
          }
          char v8 = NSNumber;
          id v9 = [*(id *)(*((void *)&v13 + 1) + 8 * i) selects];
          id v10 = [v8 numberWithUnsignedInteger:[v9 count]];
          [v3 addObject:v10];
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v5);
    }
  }
  else
  {
    uint64_t v11 = [NSNumber numberWithUnsignedInteger:-[NSArray count](self->_rawCounters, "count")];
    [v3 addObject:v11];
  }
  return v3;
}

- (id)ringBufferCounts
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = v3;
  if (self->_vendor == 2)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v5 = [(DTGPUAGXCounterSourceGroup *)self->_agxSource sources];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = NSNumber;
          id v10 = [*(id *)(*((void *)&v15 + 1) + 8 * i) source];
          unsigned int v11 = [v10 ringBufferNum];

          if (v11 <= 1) {
            uint64_t v12 = 1;
          }
          else {
            uint64_t v12 = v11;
          }
          long long v13 = [v9 numberWithUnsignedInt:v12];
          [v4 addObject:v13];
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v6);
    }
  }
  else
  {
    [v3 addObject:&unk_26E5341F0];
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gpuConfigurationVariables, 0);
  objc_storeStrong((id *)&self->_sourceName, 0);
  objc_storeStrong((id *)&self->_rawCounters, 0);
  objc_storeStrong((id *)&self->_agxSource, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_sourceGroup, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end