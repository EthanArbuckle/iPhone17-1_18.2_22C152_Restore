uint64_t KRExperimentsInit()
{
  return KRExperimentsUpdateExperimentState(1u, 1);
}

uint64_t KRExperimentsUpdateExperimentState(unsigned int a1, int a2)
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  os_log_t v2 = os_log_create("com.apple.coreos.sysperf.KRExperiments", "KRExperiments");
  v3 = [MEMORY[0x263F80E18] clientWithIdentifier:241];
  int v78 = 0;
  id v76 = 0;
  id v77 = 0;
  char v4 = [v3 trialIdentifiersWithNamespaceName:@"FREEZER_POLICIES" experimentId:&v77 deploymentId:&v78 treatmentId:&v76];
  id v64 = v77;
  id v65 = v76;
  if ((v4 & 1) == 0) {
    KRExperimentsUpdateExperimentState_cold_1();
  }
  os_log_t oslog = v2;
  id v5 = v3;
  id v69 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v68 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v6 = [v5 factorLevelsWithNamespaceName:@"FREEZER_POLICIES"];
  if ([v6 count])
  {
    for (unint64_t i = 0; i < [v6 count]; ++i)
    {
      v8 = [v6 objectAtIndexedSubscript:i];
      if (([v8 hasFactor] & 1) == 0) {
        KRExperimentsUpdateExperimentState_cold_1();
      }
      if (([v8 hasLevel] & 1) == 0) {
        KRExperimentsUpdateExperimentState_cold_1();
      }
      v9 = [v8 factor];
      v10 = [v9 name];
      v11 = [v10 componentsSeparatedByString:@"."];

      if (![v11 count])
      {
        v12 = oslog;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          KRExperimentsUpdateExperimentState_cold_4((uint64_t)v88, (uint64_t)v9);
        }
        goto LABEL_17;
      }
      v12 = [v11 objectAtIndexedSubscript:0];
      v13 = objc_msgSend(v11, "subarrayWithRange:", 1, objc_msgSend(v11, "count") - 1);
      v14 = [v13 componentsJoinedByString:@"."];

      if ([v12 isEqualToString:@"meta"])
      {
        v15 = [v8 level];
        v16 = v69;
      }
      else
      {
        if (![v12 isEqualToString:@"sysctl"])
        {
          v15 = oslog;
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            KRExperimentsUpdateExperimentState_cold_4((uint64_t)v89, (uint64_t)v9);
          }
          goto LABEL_16;
        }
        v15 = [v8 level];
        v16 = v68;
      }
      [v16 setObject:v15 forKeyedSubscript:v14];
LABEL_16:

LABEL_17:
    }
  }
  id v17 = v69;
  id v18 = v68;

  id v19 = v17;
  id v20 = v18;
  v21 = [v19 objectForKey:@"component"];
  v22 = [v21 stringValue];
  v23 = v22;
  if (!v22) {
    goto LABEL_23;
  }
  if (([v22 isEqualToString:@"freezer"] & 1) == 0)
  {
    if (([v23 isEqualToString:@"stackshot"] & 1) == 0) {
      [v23 isEqualToString:@"libmalloc"];
    }
LABEL_23:
    int v24 = 1;
    goto LABEL_24;
  }
  int v24 = 0;
LABEL_24:

  v25 = [v5 experimentIdentifiersWithNamespaceName:@"FREEZER_POLICIES"];

  uint64_t v26 = v24 | a2 | a1;
  if (v26 == 1 && v25)
  {
    int v61 = v24;
    id v62 = v20;
    id v63 = v19;
    id v60 = v5;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id v27 = v20;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v72 objects:v87 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      id v70 = *(id *)v73;
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(id *)v73 != v70) {
            objc_enumerationMutation(v27);
          }
          v31 = *(void **)(*((void *)&v72 + 1) + 8 * j);
          v32 = [v27 objectForKeyedSubscript:v31];
          v33 = oslog;
          id v34 = v31;
          id v35 = v32;
          int v36 = [v35 levelOneOfCase];
          uint64_t v80 = 0;
          int v79 = 0;
          id v37 = v34;
          v38 = (const char *)[v37 cStringUsingEncoding:1];
          switch(v36)
          {
            case 13:
              uint64_t v43 = [v35 longValue];
              uint64_t v80 = v43;
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                id v82 = v37;
                __int16 v83 = 2048;
                uint64_t v84 = v43;
                _os_log_impl(&dword_22223A000, v33, OS_LOG_TYPE_DEFAULT, "Setting %@ to %llu", buf, 0x16u);
              }
              id v40 = 0;
              v41 = (char *)&v80;
              size_t v42 = 8;
              break;
            case 11:
              id v40 = [v35 stringValue];
              v41 = (char *)[v40 cStringUsingEncoding:1];
              size_t v42 = strlen(v41);
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                id v82 = v37;
                __int16 v83 = 2080;
                uint64_t v84 = (uint64_t)v41;
                _os_log_impl(&dword_22223A000, v33, OS_LOG_TYPE_DEFAULT, "Setting %@ to %s", buf, 0x16u);
              }
              break;
            case 10:
              int v39 = [v35 BOOLeanValue];
              int v79 = v39;
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                id v82 = v37;
                __int16 v83 = 1024;
                LODWORD(v84) = v39;
                _os_log_impl(&dword_22223A000, v33, OS_LOG_TYPE_DEFAULT, "Setting %@ to %u", buf, 0x12u);
              }
              id v40 = 0;
              v41 = (char *)&v79;
              size_t v42 = 4;
              break;
            default:
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109120;
                LODWORD(v82) = v36;
                _os_log_error_impl(&dword_22223A000, v33, OS_LOG_TYPE_ERROR, "Attempt to set unsupported factor type: %d", buf, 8u);
              }
              id v40 = 0;
              size_t v42 = 0;
              v41 = 0;
              break;
          }
          if (sysctlbyname(v38, 0, 0, v41, v42))
          {
            v44 = v33;
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            {
              v45 = __error();
              v46 = strerror(*v45);
              *(_DWORD *)buf = 136315394;
              id v82 = (id)v38;
              __int16 v83 = 2080;
              uint64_t v84 = (uint64_t)v46;
              _os_log_error_impl(&dword_22223A000, v44, OS_LOG_TYPE_ERROR, "Unable to set %s: %s", buf, 0x16u);
            }
          }
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v72 objects:v87 count:16];
      }
      while (v29);
    }

    uint64_t v26 = 1;
    id v20 = v62;
    id v19 = v63;
    if (((a2 ^ 1 | a1 | v61) & 1) == 0)
    {
      v47 = oslog;
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22223A000, v47, OS_LOG_TYPE_DEFAULT, "Resetting freezer state to enroll in an experiment. All frozen processes will be killed.", buf, 2u);
      }
      if (memorystatus_control())
      {
        v48 = v47;
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          v49 = __error();
          v50 = strerror(*v49);
          *(_DWORD *)buf = 136315138;
          id v82 = v50;
          _os_log_impl(&dword_22223A000, v48, OS_LOG_TYPE_DEFAULT, "Error while trying to reset freezer state: %s", buf, 0xCu);
        }
      }
      else if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22223A000, v47, OS_LOG_TYPE_DEFAULT, "Freezer state reset.", buf, 2u);
      }
    }
    id v51 = v65;
    v52 = (const char *)[v51 UTF8String];
    if (v52)
    {
      v53 = (char *)v52;
      size_t v54 = strlen(v52);
      if (sysctlbyname("kern.trial_treatment_id", 0, 0, v53, v54)) {
        KRExperimentsUpdateExperimentState_cold_1();
      }
    }
    id v55 = v64;
    v56 = (const char *)[v55 UTF8String];
    id v5 = v60;
    if (v56)
    {
      v57 = (char *)v56;
      size_t v58 = strlen(v56);
      if (sysctlbyname("kern.trial_experiment_id", 0, 0, v57, v58)) {
        KRExperimentsUpdateExperimentState_cold_1();
      }
    }
    if (sysctlbyname("kern.trial_deployment_id", 0, 0, &v78, 4uLL)) {
      KRExperimentsUpdateExperimentState_cold_1();
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v82 = v51;
      __int16 v83 = 2112;
      uint64_t v84 = (uint64_t)v55;
      __int16 v85 = 1024;
      int v86 = v78;
      _os_log_impl(&dword_22223A000, oslog, OS_LOG_TYPE_DEFAULT, "Set trial treatment information. %@ %@ %d", buf, 0x1Cu);
    }
  }

  return v26;
}

uint64_t KRExperimentsHandleUpdate(int a1)
{
  return KRExperimentsUpdateExperimentState(0, a1);
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_error_impl(a1, v4, OS_LOG_TYPE_ERROR, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_1(uint64_t a1, uint64_t a2)
{
  return a2;
}

void KRExperimentsUpdateExperimentState_cold_1()
{
}

void KRExperimentsUpdateExperimentState_cold_4(uint64_t a1, uint64_t a2)
{
  char v4 = objc_msgSend((id)OUTLINED_FUNCTION_1(a1, a2), "name");
  _DWORD *v3 = 138412290;
  *os_log_t v2 = v4;
  OUTLINED_FUNCTION_0(&dword_22223A000, v5, v6, "Skipping unknown factor: %@");
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x270ED8050]();
}

uint64_t _os_crash()
{
  return MEMORY[0x270ED8060]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t memorystatus_control()
{
  return MEMORY[0x270EDA490]();
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}