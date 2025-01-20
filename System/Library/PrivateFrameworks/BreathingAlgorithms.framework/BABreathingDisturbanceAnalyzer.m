@interface BABreathingDisturbanceAnalyzer
+ (BABreathingDisturbanceAnalysis)analyzeSamples:(SEL)a3 dateInterval:(id)a4;
@end

@implementation BABreathingDisturbanceAnalyzer

+ (BABreathingDisturbanceAnalysis)analyzeSamples:(SEL)a3 dateInterval:(id)a4
{
  uint64_t v115 = *MEMORY[0x263EF8340];
  id v7 = a4;
  v90 = retstr;
  id v91 = a5;
  retstr->var0 = &unk_26FCFCED0;
  retstr->id var1 = 0;
  retstr->var2 = 0;
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  id obj = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v103 objects:v114 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v104;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v104 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v103 + 1) + 8 * i);
        v12 = hws_get_framework_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = [v11 quantity];
          v14 = [MEMORY[0x263F0A830] countUnit];
          [v13 doubleValueForUnit:v14];
          uint64_t v16 = v15;
          v17 = [v11 startDate];
          v18 = [v11 endDate];
          v19 = [v11 UUID];
          *(_DWORD *)buf = 134546435;
          *(void *)&buf[4] = v16;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v17;
          *(_WORD *)&buf[22] = 2114;
          *(void *)&buf[24] = v18;
          LOWORD(v112) = 2114;
          *(void *)((char *)&v112 + 2) = v19;
          _os_log_impl(&dword_249352000, v12, OS_LOG_TYPE_DEFAULT, "%{sensitive}lf for %{public}@ - %{public}@ for %{public}@", buf, 0x2Au);
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v103 objects:v114 count:16];
    }
    while (v8);
  }

  if ((unint64_t)[obj count] < 0x1F)
  {
    v21 = [v91 startDate];
    v22 = [v91 endDate];
    int v23 = [v21 isEqualToDate:v22];

    if (v23)
    {
      v24 = hws_get_framework_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        v25 = [v91 startDate];
        v26 = [v91 endDate];
        +[BABreathingDisturbanceAnalyzer analyzeSamples:buf dateInterval:v24];
      }
    }
    else
    {
      __p = 0;
      v101 = 0;
      v102 = 0;
      std::vector<NebulaNotification::BDReport>::reserve(&__p, [obj count]);
      long long v98 = 0u;
      long long v99 = 0u;
      long long v96 = 0u;
      long long v97 = 0u;
      id v92 = obj;
      uint64_t v27 = [v92 countByEnumeratingWithState:&v96 objects:v113 count:16];
      if (v27)
      {
        uint64_t v28 = *(void *)v97;
        v29 = (void *)*MEMORY[0x263F09BD8];
LABEL_20:
        uint64_t v30 = 0;
        while (1)
        {
          if (*(void *)v97 != v28) {
            objc_enumerationMutation(v92);
          }
          v31 = *(void **)(*((void *)&v96 + 1) + 8 * v30);
          v32 = [v31 quantity];
          v33 = [MEMORY[0x263F0A830] countUnit];
          [v32 doubleValueForUnit:v33];
          double v35 = v34;

          v36 = [v31 quantityType];
          v37 = [v36 identifier];
          BOOL v38 = v37 == v29;

          if (!v38)
          {
            v85 = hws_get_framework_log();
            if (os_log_type_enabled(v85, OS_LOG_TYPE_FAULT))
            {
              v86 = [v31 quantityType];
              v87 = [v86 identifier];
              v88 = [v31 UUID];
              *(_DWORD *)buf = 138543618;
              *(void *)&buf[4] = v87;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v88;
              _os_log_fault_impl(&dword_249352000, v85, OS_LOG_TYPE_FAULT, "Invalid HealthKit type (%{public}@) for sample %{public}@.", buf, 0x16u);
            }
            goto LABEL_61;
          }
          if (v35 < 0.0)
          {
            v85 = hws_get_framework_log();
            if (os_log_type_enabled(v85, OS_LOG_TYPE_FAULT))
            {
              [v31 UUID];
              objc_claimAutoreleasedReturnValue();
              +[BABreathingDisturbanceAnalyzer analyzeSamples:dateInterval:].cold.4();
            }
            goto LABEL_61;
          }
          if (v35 > 130.0)
          {
            v85 = hws_get_framework_log();
            if (os_log_type_enabled(v85, OS_LOG_TYPE_FAULT))
            {
              [v31 UUID];
              objc_claimAutoreleasedReturnValue();
              +[BABreathingDisturbanceAnalyzer analyzeSamples:dateInterval:].cold.5();
            }
            goto LABEL_61;
          }
          v39 = [v31 endDate];
          v40 = [v91 startDate];
          BOOL v41 = [v39 compare:v40] == 1;

          if (!v41) {
            break;
          }
          v42 = [v31 endDate];
          v43 = [v91 endDate];
          BOOL v44 = [v42 compare:v43] == 1;

          if (v44)
          {
            v85 = hws_get_framework_log();
            if (os_log_type_enabled(v85, OS_LOG_TYPE_FAULT))
            {
              [v31 UUID];
              objc_claimAutoreleasedReturnValue();
              +[BABreathingDisturbanceAnalyzer analyzeSamples:dateInterval:].cold.6();
            }
LABEL_61:

            goto LABEL_62;
          }
          v45 = [v31 startDate];
          [v45 timeIntervalSinceReferenceDate];
          uint64_t v47 = v46;
          v48 = [v31 endDate];
          [v48 timeIntervalSinceReferenceDate];
          uint64_t v50 = v49;
          float v51 = v35;
          v52 = v101;
          if (v101 >= v102)
          {
            v54 = (float *)__p;
            unint64_t v55 = 0xAAAAAAAAAAAAAAABLL * (((char *)v101 - (unsigned char *)__p) >> 3);
            unint64_t v56 = v55 + 1;
            if (v55 + 1 > 0xAAAAAAAAAAAAAAALL) {
              std::vector<NebulaNotification::BDReport>::__throw_length_error[abi:ne180100]();
            }
            if (0x5555555555555556 * (((char *)v102 - (unsigned char *)__p) >> 3) > v56) {
              unint64_t v56 = 0x5555555555555556 * (((char *)v102 - (unsigned char *)__p) >> 3);
            }
            if (0xAAAAAAAAAAAAAAABLL * (((char *)v102 - (unsigned char *)__p) >> 3) >= 0x555555555555555) {
              unint64_t v57 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v57 = v56;
            }
            if (v57)
            {
              v58 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<NebulaNotification::BDReport>>((uint64_t)&v102, v57);
              v54 = (float *)__p;
              v52 = v101;
            }
            else
            {
              v58 = 0;
            }
            v59 = (float *)&v58[24 * v55];
            float *v59 = v51;
            *((void *)v59 + 1) = v47;
            *((void *)v59 + 2) = v50;
            v60 = v59;
            if (v52 != v54)
            {
              do
              {
                long long v61 = *(_OWORD *)(v52 - 6);
                *((void *)v60 - 1) = *((void *)v52 - 1);
                *(_OWORD *)(v60 - 6) = v61;
                v60 -= 6;
                v52 -= 6;
              }
              while (v52 != v54);
              v54 = (float *)__p;
            }
            v53 = v59 + 6;
            __p = v60;
            v101 = v59 + 6;
            v102 = (float *)&v58[24 * v57];
            if (v54) {
              operator delete(v54);
            }
          }
          else
          {
            float *v101 = v51;
            v53 = v52 + 6;
            *((void *)v52 + 1) = v47;
            *((void *)v52 + 2) = v49;
          }
          v101 = v53;

          if (++v30 == v27)
          {
            uint64_t v27 = [v92 countByEnumeratingWithState:&v96 objects:v113 count:16];
            if (v27) {
              goto LABEL_20;
            }
            goto LABEL_46;
          }
        }
        v85 = hws_get_framework_log();
        if (os_log_type_enabled(v85, OS_LOG_TYPE_FAULT))
        {
          [v31 UUID];
          objc_claimAutoreleasedReturnValue();
          +[BABreathingDisturbanceAnalyzer analyzeSamples:dateInterval:].cold.7();
        }
        goto LABEL_61;
      }
LABEL_46:

      NebulaNotification::Processor::Processor((NebulaNotification::Processor *)v95);
      long long v112 = 0u;
      memset(buf, 0, sizeof(buf));
      NebulaNotification::Processor::process((int **)&__p, (uint64_t)buf);
      v109[0] = @"notification_status";
      v62 = [NSNumber numberWithUnsignedChar:buf[4]];
      v110[0] = v62;
      v109[1] = @"percent_bd_at_least_10";
      LODWORD(v63) = *(_DWORD *)&buf[8];
      v93 = [NSNumber numberWithFloat:v63];
      v110[1] = v93;
      v109[2] = @"percent_bd_at_least_11";
      LODWORD(v64) = *(_DWORD *)&buf[12];
      v65 = [NSNumber numberWithFloat:v64];
      v110[2] = v65;
      v109[3] = @"percent_bd_at_least_12";
      LODWORD(v66) = *(_DWORD *)&buf[16];
      v67 = [NSNumber numberWithFloat:v66];
      v110[3] = v67;
      v109[4] = @"percent_bd_at_least_13";
      LODWORD(v68) = *(_DWORD *)&buf[20];
      v69 = [NSNumber numberWithFloat:v68];
      v110[4] = v69;
      v109[5] = @"bd_count";
      v70 = [NSNumber numberWithInt:*(unsigned int *)&buf[24]];
      v110[5] = v70;
      v109[6] = @"bd_median";
      LODWORD(v71) = *(_DWORD *)&buf[28];
      v72 = [NSNumber numberWithFloat:v71];
      v110[6] = v72;
      v109[7] = @"bd_mean";
      LODWORD(v73) = v112;
      v74 = [NSNumber numberWithFloat:v73];
      v110[7] = v74;
      v109[8] = @"bd_standard_deviation";
      LODWORD(v75) = DWORD1(v112);
      v76 = [NSNumber numberWithFloat:v75];
      v110[8] = v76;
      v109[9] = @"bd_maximum";
      LODWORD(v77) = DWORD2(v112);
      v78 = [NSNumber numberWithFloat:v77];
      v110[9] = v78;
      v109[10] = @"bd_minimum";
      LODWORD(v79) = HIDWORD(v112);
      v80 = [NSNumber numberWithFloat:v79];
      v110[10] = v80;
      uint64_t v81 = [NSDictionary dictionaryWithObjects:v110 forKeys:v109 count:11];
      id var1 = v90->var1;
      v90->id var1 = (id)v81;

      int v83 = buf[0];
      v90->var2 = buf[0];
      v84 = hws_get_framework_log();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v107 = 67436801;
        int v108 = v83;
        _os_log_impl(&dword_249352000, v84, OS_LOG_TYPE_DEFAULT, "Algs result: %{sensitive}u", v107, 8u);
      }

      if (MGGetBoolAnswer()) {
        +[BABreathingDisturbanceAnalyzerFileHandler deleteLogsForLiveOnUsers];
      }
      NebulaNotification::Processor::~Processor((NebulaNotification::Processor *)v95);
LABEL_62:
      if (__p)
      {
        v101 = (float *)__p;
        operator delete(__p);
      }
    }
  }
  else
  {
    v20 = hws_get_framework_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      +[BABreathingDisturbanceAnalyzer analyzeSamples:dateInterval:]((uint64_t)buf, [obj count], v20);
    }
  }
  return result;
}

+ (void)analyzeSamples:(NSObject *)a3 dateInterval:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134349056;
  *(void *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_0(&dword_249352000, a2, a3, "Invalid number (%{public}lu) of BD samples, more than expected.", (uint8_t *)a1);
}

+ (void)analyzeSamples:(uint8_t *)buf dateInterval:(os_log_t)log .cold.2(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_249352000, log, OS_LOG_TYPE_FAULT, "Invalid query interval (%{public}@ - %{public}@) with a duration of zero.", buf, 0x16u);
}

+ (void)analyzeSamples:dateInterval:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_249352000, v3, v4, "Invalid BD sample %{public}@ has NAN.", v5);
}

+ (void)analyzeSamples:dateInterval:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_249352000, v3, v4, "Invalid BD sample %{public}@, less than minimum.", v5);
}

+ (void)analyzeSamples:dateInterval:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_249352000, v3, v4, "Invalid BD sample %{public}@, greater than limit.", v5);
}

+ (void)analyzeSamples:dateInterval:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_249352000, v3, v4, "Invalid BD sample %{public}@ with end date after end of query interval.", v5);
}

+ (void)analyzeSamples:dateInterval:.cold.7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_249352000, v3, v4, "Invalid BD sample %{public}@ with end date prior to or equal to start of query interval.", v5);
}

@end