@interface AMDLighthouseODMLWorker
- (AMDLighthouseODMLWorker)init;
- (MLRTaskAttachments)attachments;
- (NSDictionary)recipe;
- (NSLocale)locale;
- (NSMutableArray)candidateModels;
- (NSNumber)taskShouldBeStopped;
- (NSURL)modelsURL;
- (TRIExperimentIdentifiers)triExperimentIdentifiers;
- (id)checkIfModelShouldBeDownloaded:(id)a3 outError:(id *)a4;
- (id)checkIfTaskShouldBeStopped:(id *)a3;
- (id)createMLRTaskAttachmentsObject:(id)a3 modelDirURL:(id)a4 error:(id *)a5;
- (id)gatherGaussianResults:(id)a3 withPartitions:(id)a4 outError:(id *)a5;
- (id)gatherMetricsToReturn:(id)a3 withRecipe:(id)a4 withAttachments:(id)a5 outError:(id *)a6;
- (id)logAllResultsToCoreAnalyticsOrDeDisco:(id)a3 withLoggingStrategies:(id)a4 outError:(id *)a5;
- (id)logDeDiscoResults:(id)a3 outError:(id *)a4;
- (id)logMultipleDeDiscoResults:(id)a3 outError:(id *)a4;
- (id)logResultToCoreAnalytics:(id)a3 withMetric:(id)a4 withValue:(id)a5;
- (id)performGenericTaskWithDataProcessingCarryover:(id)a3 outError:(id *)a4;
- (id)targetingKeyValuePairsForKeys:(id)a3 error:(id *)a4;
- (void)setAttachments:(id)a3;
- (void)setCandidateModels:(id)a3;
- (void)setLocale:(id)a3;
- (void)setModelsURL:(id)a3;
- (void)setRecipe:(id)a3;
- (void)setTaskShouldBeStopped:(id)a3;
- (void)setTriExperimentIdentifiers:(id)a3;
- (void)stop;
@end

@implementation AMDLighthouseODMLWorker

- (AMDLighthouseODMLWorker)init
{
  id location = self;
  SEL v7 = a2;
  os_log_t v2 = os_log_create("com.apple.aiml.AMDLighthouseODMLPlugin", "AMDLighthouseODMLWorker");
  v3 = (void *)sLog;
  sLog = (uint64_t)v2;

  id v4 = location;
  id location = 0;
  v6.receiver = v4;
  v6.super_class = (Class)AMDLighthouseODMLWorker;
  id location = [(AMDLighthouseODMLWorker *)&v6 init];
  if (location) {
    v9 = (AMDLighthouseODMLWorker *)location;
  }
  else {
    v9 = 0;
  }
  objc_storeStrong(&location, 0);
  return v9;
}

- (id)createMLRTaskAttachmentsObject:(id)a3 modelDirURL:(id)a4 error:(id *)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v22 = 0;
  objc_storeStrong(&v22, a4);
  v21[1] = a5;
  v21[0] = (id)[location[0] objectForKey:AttachmentKeys];
  id v20 = (id)objc_opt_new();
  memset(__b, 0, sizeof(__b));
  id v14 = v21[0];
  uint64_t v15 = [v14 countByEnumeratingWithState:__b objects:v24 count:16];
  if (v15)
  {
    uint64_t v9 = *(void *)__b[2];
    uint64_t v10 = 0;
    unint64_t v11 = v15;
    while (1)
    {
      uint64_t v8 = v10;
      if (*(void *)__b[2] != v9) {
        objc_enumerationMutation(v14);
      }
      uint64_t v19 = *(void *)(__b[1] + 8 * v10);
      id v17 = (id)[v22 URLByAppendingPathComponent:v19];
      [v20 addObject:v17];
      objc_storeStrong(&v17, 0);
      ++v10;
      if (v8 + 1 >= v11)
      {
        uint64_t v10 = 0;
        unint64_t v11 = [v14 countByEnumeratingWithState:__b objects:v24 count:16];
        if (!v11) {
          break;
        }
      }
    }
  }

  id v5 = objc_alloc(MEMORY[0x263F53498]);
  id v16 = (id)[v5 initWithURLs:v20];
  id v7 = v16;
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
  return v7;
}

- (id)logResultToCoreAnalytics:(id)a3 withMetric:(id)a4 withValue:(id)a5
{
  id v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  id v13 = 0;
  objc_storeStrong(&v13, a5);
  id v9 = location[0];
  id v10 = v14;
  id v11 = v13;
  v12 = v16;
  AnalyticsSendEventLazy();
  id v8 = (id)[NSNumber numberWithLong:1];
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
  return v8;
}

id __73__AMDLighthouseODMLWorker_logResultToCoreAnalytics_withMetric_withValue___block_invoke(uint64_t a1)
{
  v17[2] = (id)a1;
  v17[1] = (id)a1;
  v17[0] = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v17[0] setObject:*(void *)(a1 + 32) forKeyedSubscript:ModelNameKeyForLogging];
  [v17[0] setObject:*(void *)(a1 + 40) forKeyedSubscript:MetricNameKeyForLogging];
  [v17[0] setObject:*(void *)(a1 + 48) forKeyedSubscript:MetricValKeyForLogging];
  id v1 = (id)[*(id *)(a1 + 56) triExperimentIdentifiers];
  BOOL v13 = v1 == 0;

  if (v13)
  {
    id v5 = (id)[NSNumber numberWithInt:0xFFFFFFFFLL];
    id v4 = (id)[v5 stringValue];
    objc_msgSend(v17[0], "setObject:forKeyedSubscript:");

    [v17[0] setObject:FailureKey forKeyedSubscript:ExperimentIdKey];
    [v17[0] setObject:FailureKey forKeyedSubscript:TreatmentIdKey];
  }
  else
  {
    id v6 = (id)[*(id *)(a1 + 56) triExperimentIdentifiers];
    id v16 = (id)[v6 experimentId];

    unsigned int v15 = 0;
    id v7 = (id)[*(id *)(a1 + 56) triExperimentIdentifiers];
    unsigned int v8 = [v7 deploymentId];

    unsigned int v15 = v8;
    id v9 = (id)[*(id *)(a1 + 56) triExperimentIdentifiers];
    id v14 = (id)[v9 treatmentId];

    id v11 = (id)[NSNumber numberWithInt:v15];
    id v10 = (id)[v11 stringValue];
    objc_msgSend(v17[0], "setObject:forKeyedSubscript:");

    [v17[0] setObject:v16 forKeyedSubscript:ExperimentIdKey];
    [v17[0] setObject:v14 forKeyedSubscript:TreatmentIdKey];
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v16, 0);
  }
  id v3 = v17[0];
  objc_storeStrong(v17, 0);
  return v3;
}

- (id)logMultipleDeDiscoResults:(id)a3 outError:(id *)a4
{
  uint64_t v120 = *MEMORY[0x263EF8340];
  v112 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v110 = a4;
  id v109 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  memset(__b, 0, sizeof(__b));
  id obj = location[0];
  uint64_t v74 = [obj countByEnumeratingWithState:__b objects:v119 count:16];
  if (v74)
  {
    uint64_t v69 = *(void *)__b[2];
    uint64_t v70 = 0;
    unint64_t v71 = v74;
    while (1)
    {
      uint64_t v68 = v70;
      if (*(void *)__b[2] != v69) {
        objc_enumerationMutation(obj);
      }
      id v108 = *(id *)(__b[1] + 8 * v70);
      id v106 = (id)[v108 objectForKey:ModelMetrics];
      id v105 = (id)[v108 objectForKey:ModelName];
      memset(v103, 0, sizeof(v103));
      id v66 = v106;
      uint64_t v67 = [v66 countByEnumeratingWithState:v103 objects:v118 count:16];
      if (v67)
      {
        uint64_t v63 = *(void *)v103[2];
        uint64_t v64 = 0;
        unint64_t v65 = v67;
        while (1)
        {
          uint64_t v62 = v64;
          if (*(void *)v103[2] != v63) {
            objc_enumerationMutation(v66);
          }
          uint64_t v104 = *(void *)(v103[1] + 8 * v64);
          id v4 = [(AMDLighthouseODMLWorker *)v112 checkIfTaskShouldBeStopped:v110];
          BOOL v61 = v4 != 0;

          if (!v61) {
            break;
          }
          id v101 = (id)[v106 objectForKey:v104];
          id v100 = (id)[NSString stringWithFormat:@"%@:%@", v105, v104];
          v59 = NSNumber;
          [v101 floatValue];
          id v60 = (id)objc_msgSend(v59, "numberWithFloat:");
          objc_msgSend(v109, "setObject:forKeyedSubscript:");

          objc_storeStrong(&v100, 0);
          objc_storeStrong(&v101, 0);
          ++v64;
          if (v62 + 1 >= v65)
          {
            uint64_t v64 = 0;
            unint64_t v65 = [v66 countByEnumeratingWithState:v103 objects:v118 count:16];
            if (!v65) {
              goto LABEL_13;
            }
          }
        }
        id v113 = 0;
        int v102 = 1;
      }
      else
      {
LABEL_13:
        int v102 = 0;
      }

      if (!v102) {
        int v102 = 0;
      }
      objc_storeStrong(&v105, 0);
      objc_storeStrong(&v106, 0);
      if (v102) {
        break;
      }
      ++v70;
      if (v68 + 1 >= v71)
      {
        uint64_t v70 = 0;
        unint64_t v71 = [obj countByEnumeratingWithState:__b objects:v119 count:16];
        if (!v71) {
          goto LABEL_19;
        }
      }
    }
  }
  else
  {
LABEL_19:
    int v102 = 0;
  }

  if (!v102)
  {
    id v99 = 0;
    v58 = [(AMDLighthouseODMLWorker *)v112 recipe];
    id v98 = [(NSDictionary *)v58 objectForKey:@"multipleDediscoEncodingSchema"];

    if (v98) {
      goto LABEL_30;
    }
    id v97 = [(AMDLighthouseODMLWorker *)v112 modelsURL];
    if (v97)
    {
      id v96 = (id)[v97 URLByAppendingPathComponent:EncodingPath];
      id v94 = 0;
      id v57 = (id)[MEMORY[0x263EFF8F8] dataWithContentsOfURL:v96 options:0 error:&v94];
      objc_storeStrong(&v99, v94);
      id v95 = v57;
      if (v99)
      {
        id v6 = objc_alloc(MEMORY[0x263F087E8]);
        id v7 = (id)[v6 initWithDomain:AMDLighthouseODMLPluginErrorDomain code:150 userInfo:0];
        id *v110 = v7;
      }
      id v93 = v99;
      id v56 = (id)[MEMORY[0x263F08900] JSONObjectWithData:v95 options:0 error:&v93];
      objc_storeStrong(&v99, v93);
      id v8 = v98;
      id v98 = v56;

      if (v99)
      {
        id v9 = objc_alloc(MEMORY[0x263F087E8]);
        id v10 = (id)[v9 initWithDomain:AMDLighthouseODMLPluginErrorDomain code:151 userInfo:0];
        id *v110 = v10;
      }
      objc_storeStrong(&v95, 0);
      objc_storeStrong(&v96, 0);
      int v102 = 0;
    }
    else
    {
      id v5 = v99;
      id *v110 = v5;
      id v113 = 0;
      int v102 = 1;
    }
    objc_storeStrong(&v97, 0);
    if (!v102)
    {
LABEL_30:
      memset(v91, 0, sizeof(v91));
      id v54 = v98;
      uint64_t v55 = [v54 countByEnumeratingWithState:v91 objects:v117 count:16];
      if (v55)
      {
        uint64_t v51 = *(void *)v91[2];
        uint64_t v52 = 0;
        unint64_t v53 = v55;
        while (1)
        {
          uint64_t v50 = v52;
          if (*(void *)v91[2] != v51) {
            objc_enumerationMutation(v54);
          }
          id v92 = *(id *)(v91[1] + 8 * v52);
          id v90 = (id)[v92 objectForKey:PopulationSection];
          id v89 = [(AMDLighthouseODMLWorker *)v112 triExperimentIdentifiers];
          if (v89)
          {
            id v88 = (id)[v89 experimentId];
            unsigned int v87 = 0;
            unsigned int v87 = [v89 deploymentId];
            id v86 = (id)[v89 treatmentId];
            id v85 = 0;
            if (v90)
            {
              id v84 = (id)[v109 objectForKey:v90];
              id v83 = (id)[v84 stringValue];
              v43 = NSString;
              id v41 = v83;
              id v42 = v88;
              id v45 = (id)[NSNumber numberWithInt:v87];
              id v44 = (id)[v45 stringValue];
              id v15 = (id)[v43 stringWithFormat:@"com.apple.ampaiml.AppleMediaDiscoveryFrameworkLighthousePlugin:%@:%@:%@:%@", v41, v42, v44, v86];
              id v16 = v85;
              id v85 = v15;

              objc_storeStrong(&v83, 0);
              objc_storeStrong(&v84, 0);
            }
            else
            {
              v47 = NSString;
              id v46 = v88;
              id v49 = (id)[NSNumber numberWithInt:v87];
              id v48 = (id)[v49 stringValue];
              id v13 = (id)[v47 stringWithFormat:@"com.apple.ampaiml.AppleMediaDiscoveryFrameworkLighthousePlugin:%@:%@:%@", v46, v48, v86];
              id v14 = v85;
              id v85 = v13;
            }
            os_log_t oslog = (os_log_t)(id)sLog;
            os_log_type_t type = OS_LOG_TYPE_DEBUG;
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
            {
              log = oslog;
              os_log_type_t v40 = type;
              __os_log_helper_16_2_1_8_64((uint64_t)v116, (uint64_t)v109);
              _os_log_debug_impl(&dword_247E25000, log, v40, "dataToUpload: %@", v116, 0xCu);
            }
            objc_storeStrong((id *)&oslog, 0);
            os_log_t v80 = (os_log_t)(id)sLog;
            os_log_type_t v79 = OS_LOG_TYPE_DEBUG;
            if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
            {
              v37 = v80;
              os_log_type_t v38 = v79;
              __os_log_helper_16_2_1_8_64((uint64_t)v115, (uint64_t)v85);
              _os_log_debug_impl(&dword_247E25000, v37, v38, "baseKeyWithTrialInfo: %@", v115, 0xCu);
            }
            objc_storeStrong((id *)&v80, 0);
            id v78 = objc_alloc_init(MEMORY[0x263EFF9A0]);
            memset(v76, 0, sizeof(v76));
            id v35 = (id)[v92 objectForKeyedSubscript:DataToUpload];
            uint64_t v36 = [v35 countByEnumeratingWithState:v76 objects:v114 count:16];
            if (v36)
            {
              uint64_t v32 = *(void *)v76[2];
              uint64_t v33 = 0;
              unint64_t v34 = v36;
              while (1)
              {
                uint64_t v31 = v33;
                if (*(void *)v76[2] != v32) {
                  objc_enumerationMutation(v35);
                }
                uint64_t v77 = *(void *)(v76[1] + 8 * v33);
                id v17 = (id)[v109 objectForKey:v77];
                BOOL v30 = v17 != 0;

                if (!v30)
                {
                  id v18 = objc_alloc(MEMORY[0x263F087E8]);
                  id v19 = (id)[v18 initWithDomain:AMDLighthouseODMLPluginErrorDomain code:182 userInfo:0];
                  id *v110 = v19;
                }
                id v28 = v78;
                id v29 = (id)[v109 objectForKey:v77];
                objc_msgSend(v28, "setObject:forKey:");

                ++v33;
                if (v31 + 1 >= v34)
                {
                  uint64_t v33 = 0;
                  unint64_t v34 = [v35 countByEnumeratingWithState:v76 objects:v114 count:16];
                  if (!v34) {
                    break;
                  }
                }
              }
            }

            uint64_t v25 = (void *)MEMORY[0x263F61148];
            id v24 = v78;
            id v26 = (id)[v92 objectForKeyedSubscript:DataContentTypes];
            id v75 = v99;
            char v27 = objc_msgSend(v25, "encodeDataAndRecord:dataTypeContent:baseKey:errorOut:", v24);
            objc_storeStrong(&v99, v75);

            if ((v27 & 1) != 1) {
              goto LABEL_53;
            }
            if (!v99)
            {
              int v102 = 0;
            }
            else
            {
LABEL_53:
              NSLog(&cfstr_FailedToSubmit.isa, v99);
              id v20 = objc_alloc(MEMORY[0x263F087E8]);
              id v21 = (id)[v20 initWithDomain:AMDLighthouseODMLPluginErrorDomain code:144 userInfo:0];
              id *v110 = v21;
              id v113 = 0;
              int v102 = 1;
            }
            objc_storeStrong(&v78, 0);
            objc_storeStrong(&v85, 0);
            objc_storeStrong(&v86, 0);
            objc_storeStrong(&v88, 0);
          }
          else
          {
            id v11 = objc_alloc(MEMORY[0x263F087E8]);
            id v12 = (id)[v11 initWithDomain:AMDLighthouseODMLPluginErrorDomain code:145 userInfo:0];
            id *v110 = v12;
            id v113 = 0;
            int v102 = 1;
          }
          objc_storeStrong(&v89, 0);
          objc_storeStrong(&v90, 0);
          if (v102) {
            break;
          }
          ++v52;
          if (v50 + 1 >= v53)
          {
            uint64_t v52 = 0;
            unint64_t v53 = [v54 countByEnumeratingWithState:v91 objects:v117 count:16];
            if (!v53) {
              goto LABEL_59;
            }
          }
        }
      }
      else
      {
LABEL_59:
        int v102 = 0;
      }

      if (!v102)
      {
        id v113 = (id)[NSNumber numberWithLong:1];
        int v102 = 1;
      }
    }
    objc_storeStrong(&v98, 0);
    objc_storeStrong(&v99, 0);
  }
  objc_storeStrong(&v109, 0);
  objc_storeStrong(location, 0);
  id v22 = v113;
  return v22;
}

- (id)gatherGaussianResults:(id)a3 withPartitions:(id)a4 outError:(id *)a5
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  v43 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v41 = 0;
  objc_storeStrong(&v41, a4);
  os_log_type_t v40 = a5;
  id v39 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v38 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  memset(__b, 0, sizeof(__b));
  id v27 = location[0];
  uint64_t v28 = [v27 countByEnumeratingWithState:__b objects:v46 count:16];
  if (v28)
  {
    uint64_t v22 = *(void *)__b[2];
    uint64_t v23 = 0;
    unint64_t v24 = v28;
    while (1)
    {
      uint64_t v21 = v23;
      if (*(void *)__b[2] != v22) {
        objc_enumerationMutation(v27);
      }
      id v37 = *(id *)(__b[1] + 8 * v23);
      id v35 = (id)[v37 objectForKey:ModelMetrics];
      id v34 = (id)[v37 objectForKey:ModelName];
      memset(v32, 0, sizeof(v32));
      id v19 = v35;
      uint64_t v20 = [v19 countByEnumeratingWithState:v32 objects:v45 count:16];
      if (v20)
      {
        uint64_t v16 = *(void *)v32[2];
        uint64_t v17 = 0;
        unint64_t v18 = v20;
        while (1)
        {
          uint64_t v15 = v17;
          if (*(void *)v32[2] != v16) {
            objc_enumerationMutation(v19);
          }
          uint64_t v33 = *(void *)(v32[1] + 8 * v17);
          id v5 = [(AMDLighthouseODMLWorker *)v43 checkIfTaskShouldBeStopped:v40];
          BOOL v14 = v5 != 0;

          if (!v14) {
            break;
          }
          id v30 = (id)[v35 objectForKey:v33];
          id v29 = (id)[NSString stringWithFormat:@"%@:%@", v34, v33];
          if ([v41 containsObject:v29])
          {
            id v10 = v38;
            id v9 = NSNumber;
            [v30 floatValue];
            id v11 = (id)objc_msgSend(v9, "numberWithFloat:");
            objc_msgSend(v10, "setObject:forKey:");
          }
          else
          {
            id v12 = NSNumber;
            [v30 floatValue];
            id v13 = (id)objc_msgSend(v12, "numberWithFloat:");
            objc_msgSend(v39, "setObject:forKeyedSubscript:");
          }
          objc_storeStrong(&v29, 0);
          objc_storeStrong(&v30, 0);
          ++v17;
          if (v15 + 1 >= v18)
          {
            uint64_t v17 = 0;
            unint64_t v18 = [v19 countByEnumeratingWithState:v32 objects:v45 count:16];
            if (!v18) {
              goto LABEL_16;
            }
          }
        }
        uint64_t v44 = 0;
        int v31 = 1;
      }
      else
      {
LABEL_16:
        int v31 = 0;
      }

      if (!v31) {
        int v31 = 0;
      }
      objc_storeStrong(&v34, 0);
      objc_storeStrong(&v35, 0);
      if (v31) {
        break;
      }
      ++v23;
      if (v21 + 1 >= v24)
      {
        uint64_t v23 = 0;
        unint64_t v24 = [v27 countByEnumeratingWithState:__b objects:v46 count:16];
        if (!v24) {
          goto LABEL_22;
        }
      }
    }
  }
  else
  {
LABEL_22:
    int v31 = 0;
  }

  if (!v31)
  {
    id v6 = objc_alloc(MEMORY[0x263F534B0]);
    uint64_t v44 = [v6 initWithJSONResult:v39 namespaceName:TrialNamespace factorName:@"recipe" additionalKeyVariables:v38];
    int v31 = 1;
  }
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(location, 0);
  id v7 = (void *)v44;
  return v7;
}

- (id)logDeDiscoResults:(id)a3 outError:(id *)a4
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  unint64_t v71 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v69 = a4;
  id v68 = [(AMDLighthouseODMLWorker *)v71 triExperimentIdentifiers];
  if (v68)
  {
    id v66 = (id)[v68 experimentId];
    unsigned int v65 = [v68 deploymentId];
    id v64 = (id)[v68 treatmentId];
    uint64_t v36 = NSString;
    id v38 = (id)[NSNumber numberWithInt:v65];
    id v37 = (id)[v38 stringValue];
    id v63 = (id)[v36 stringWithFormat:@"com.apple.ampaiml.AppleMediaDiscoveryFrameworkLighthousePlugin:%@:%@:%@", v66, v37, v64];

    id v62 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    memset(__b, 0, sizeof(__b));
    id obj = location[0];
    uint64_t v40 = [obj countByEnumeratingWithState:__b objects:v76 count:16];
    if (v40)
    {
      uint64_t v33 = *(void *)__b[2];
      uint64_t v34 = 0;
      unint64_t v35 = v40;
      while (1)
      {
        uint64_t v32 = v34;
        if (*(void *)__b[2] != v33) {
          objc_enumerationMutation(obj);
        }
        id v61 = *(id *)(__b[1] + 8 * v34);
        id v59 = (id)[v61 objectForKey:ModelMetrics];
        id v58 = (id)[v61 objectForKey:ModelName];
        memset(v56, 0, sizeof(v56));
        id v30 = v59;
        uint64_t v31 = [v30 countByEnumeratingWithState:v56 objects:v75 count:16];
        if (v31)
        {
          uint64_t v27 = *(void *)v56[2];
          uint64_t v28 = 0;
          unint64_t v29 = v31;
          while (1)
          {
            uint64_t v26 = v28;
            if (*(void *)v56[2] != v27) {
              objc_enumerationMutation(v30);
            }
            uint64_t v57 = *(void *)(v56[1] + 8 * v28);
            id v5 = [(AMDLighthouseODMLWorker *)v71 checkIfTaskShouldBeStopped:v69];
            BOOL v25 = v5 != 0;

            if (!v25) {
              break;
            }
            id v55 = (id)[v59 objectForKey:v57];
            id v54 = (id)[NSString stringWithFormat:@"%@:%@", v58, v57];
            uint64_t v23 = NSNumber;
            [v55 floatValue];
            id v24 = (id)objc_msgSend(v23, "numberWithFloat:");
            objc_msgSend(v62, "setObject:forKeyedSubscript:");

            objc_storeStrong(&v54, 0);
            objc_storeStrong(&v55, 0);
            ++v28;
            if (v26 + 1 >= v29)
            {
              uint64_t v28 = 0;
              unint64_t v29 = [v30 countByEnumeratingWithState:v56 objects:v75 count:16];
              if (!v29) {
                goto LABEL_15;
              }
            }
          }
          id v72 = 0;
          int v67 = 1;
        }
        else
        {
LABEL_15:
          int v67 = 0;
        }

        if (!v67) {
          int v67 = 0;
        }
        objc_storeStrong(&v58, 0);
        objc_storeStrong(&v59, 0);
        if (v67) {
          break;
        }
        ++v34;
        if (v32 + 1 >= v35)
        {
          uint64_t v34 = 0;
          unint64_t v35 = [obj countByEnumeratingWithState:__b objects:v76 count:16];
          if (!v35) {
            goto LABEL_21;
          }
        }
      }
    }
    else
    {
LABEL_21:
      int v67 = 0;
    }

    if (!v67)
    {
      os_log_t oslog = (os_log_t)(id)sLog;
      os_log_type_t type = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v74, (uint64_t)v62);
        _os_log_debug_impl(&dword_247E25000, oslog, type, "dataToUpload: %@", v74, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      os_log_t v51 = (os_log_t)(id)sLog;
      os_log_type_t v50 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v73, (uint64_t)v63);
        _os_log_debug_impl(&dword_247E25000, v51, v50, "baseKeyWithTrialInfo: %@", v73, 0xCu);
      }
      objc_storeStrong((id *)&v51, 0);
      id v49 = 0;
      uint64_t v22 = [(AMDLighthouseODMLWorker *)v71 recipe];
      id v48 = [(NSDictionary *)v22 objectForKey:@"dediscoEncodingSchema"];

      if (v48) {
        goto LABEL_36;
      }
      id v47 = [(AMDLighthouseODMLWorker *)v71 modelsURL];
      if (v47)
      {
        id v46 = (id)[v47 URLByAppendingPathComponent:EncodingPath];
        id v44 = 0;
        id v21 = (id)[MEMORY[0x263EFF8F8] dataWithContentsOfURL:v46 options:0 error:&v44];
        objc_storeStrong(&v49, v44);
        id v45 = v21;
        if (v49)
        {
          id v7 = objc_alloc(MEMORY[0x263F087E8]);
          id v8 = (id)[v7 initWithDomain:AMDLighthouseODMLPluginErrorDomain code:150 userInfo:0];
          *uint64_t v69 = v8;
        }
        id v43 = v49;
        id v20 = (id)[MEMORY[0x263F08900] JSONObjectWithData:v45 options:0 error:&v43];
        objc_storeStrong(&v49, v43);
        id v9 = v48;
        id v48 = v20;

        if (v49)
        {
          id v10 = objc_alloc(MEMORY[0x263F087E8]);
          id v11 = (id)[v10 initWithDomain:AMDLighthouseODMLPluginErrorDomain code:151 userInfo:0];
          *uint64_t v69 = v11;
        }
        objc_storeStrong(&v45, 0);
        objc_storeStrong(&v46, 0);
        int v67 = 0;
      }
      else
      {
        id v6 = v49;
        *uint64_t v69 = v6;
        id v72 = 0;
        int v67 = 1;
      }
      objc_storeStrong(&v47, 0);
      if (!v67)
      {
LABEL_36:
        uint64_t v17 = (void *)MEMORY[0x263F61148];
        id v16 = v62;
        id v18 = (id)[v48 objectForKeyedSubscript:DataContentTypes];
        id v42 = v49;
        char v19 = objc_msgSend(v17, "encodeDataAndRecord:dataTypeContent:baseKey:errorOut:", v16);
        objc_storeStrong(&v49, v42);

        if ((v19 & 1) == 1 && !v49)
        {
          id v72 = (id)[NSNumber numberWithLong:1];
          int v67 = 1;
        }
        else
        {
          NSLog(&cfstr_FailedToSubmit.isa, v49);
          id v12 = objc_alloc(MEMORY[0x263F087E8]);
          id v13 = (id)[v12 initWithDomain:AMDLighthouseODMLPluginErrorDomain code:144 userInfo:0];
          *uint64_t v69 = v13;
          id v72 = 0;
          int v67 = 1;
        }
      }
      objc_storeStrong(&v48, 0);
      objc_storeStrong(&v49, 0);
    }
    objc_storeStrong(&v62, 0);
    objc_storeStrong(&v63, 0);
    objc_storeStrong(&v64, 0);
    objc_storeStrong(&v66, 0);
  }
  else
  {
    id v4 = objc_alloc(MEMORY[0x263F087E8]);
    *uint64_t v69 = (id)[v4 initWithDomain:AMDLighthouseODMLPluginErrorDomain code:145 userInfo:0];
    id v72 = 0;
    int v67 = 1;
  }
  objc_storeStrong(&v68, 0);
  objc_storeStrong(location, 0);
  BOOL v14 = v72;
  return v14;
}

- (id)logAllResultsToCoreAnalyticsOrDeDisco:(id)a3 withLoggingStrategies:(id)a4 outError:(id *)a5
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  uint64_t v40 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v38 = 0;
  objc_storeStrong(&v38, a4);
  id v37 = a5;
  char v36 = 0;
  if (([v38 containsObject:DeDisco] & 1) == 0
    || ((v35 = [(AMDLighthouseODMLWorker *)v40 logDeDiscoResults:location[0] outError:v37]) != 0? (v36 = 1, int v34 = 0): (v41 = 0, int v34 = 1), objc_storeStrong(&v35, 0), !v34))
  {
    if (([v38 containsObject:MultipleDeDisco] & 1) == 0
      || ((id v33 = [(AMDLighthouseODMLWorker *)v40 logMultipleDeDiscoResults:location[0] outError:v37]) != 0? (v36 = 1, v34 = 0): (v41 = 0, v34 = 1), objc_storeStrong(&v33, 0), !v34))
    {
      if (([v38 containsObject:CoreAnalytics] & 1) == 0) {
        goto LABEL_36;
      }
      memset(__b, 0, sizeof(__b));
      id v21 = location[0];
      uint64_t v22 = [v21 countByEnumeratingWithState:__b objects:v43 count:16];
      if (v22)
      {
        uint64_t v18 = *(void *)__b[2];
        uint64_t v19 = 0;
        unint64_t v20 = v22;
        while (1)
        {
          uint64_t v17 = v19;
          if (*(void *)__b[2] != v18) {
            objc_enumerationMutation(v21);
          }
          id v32 = *(id *)(__b[1] + 8 * v19);
          id v30 = (id)[v32 objectForKey:ModelMetrics];
          id v29 = (id)[v32 objectForKey:ModelName];
          memset(v27, 0, sizeof(v27));
          id v15 = v30;
          uint64_t v16 = [v15 countByEnumeratingWithState:v27 objects:v42 count:16];
          if (v16)
          {
            uint64_t v12 = *(void *)v27[2];
            uint64_t v13 = 0;
            unint64_t v14 = v16;
            while (1)
            {
              uint64_t v11 = v13;
              if (*(void *)v27[2] != v12) {
                objc_enumerationMutation(v15);
              }
              uint64_t v28 = *(void *)(v27[1] + 8 * v13);
              id v5 = [(AMDLighthouseODMLWorker *)v40 checkIfTaskShouldBeStopped:v37];
              BOOL v10 = v5 != 0;

              if (!v10) {
                break;
              }
              id v26 = (id)[v30 objectForKey:v28];
              id v25 = [(AMDLighthouseODMLWorker *)v40 logResultToCoreAnalytics:v29 withMetric:v28 withValue:v26];
              if (v25)
              {
                char v36 = 1;
                int v34 = 0;
              }
              else
              {
                id v41 = 0;
                int v34 = 1;
              }
              objc_storeStrong(&v25, 0);
              objc_storeStrong(&v26, 0);
              if (v34) {
                goto LABEL_29;
              }
              ++v13;
              if (v11 + 1 >= v14)
              {
                uint64_t v13 = 0;
                unint64_t v14 = [v15 countByEnumeratingWithState:v27 objects:v42 count:16];
                if (!v14) {
                  goto LABEL_28;
                }
              }
            }
            id v41 = 0;
            int v34 = 1;
          }
          else
          {
LABEL_28:
            int v34 = 0;
          }
LABEL_29:

          if (!v34) {
            int v34 = 0;
          }
          objc_storeStrong(&v29, 0);
          objc_storeStrong(&v30, 0);
          if (v34) {
            break;
          }
          ++v19;
          if (v17 + 1 >= v20)
          {
            uint64_t v19 = 0;
            unint64_t v20 = [v21 countByEnumeratingWithState:__b objects:v43 count:16];
            if (!v20) {
              goto LABEL_34;
            }
          }
        }
      }
      else
      {
LABEL_34:
        int v34 = 0;
      }

      if (!v34)
      {
LABEL_36:
        if (v36)
        {
          id v41 = (id)[NSNumber numberWithLong:1];
        }
        else
        {
          id v6 = objc_alloc(MEMORY[0x263F087E8]);
          id v7 = (id)[v6 initWithDomain:AMDLighthouseODMLPluginErrorDomain code:143 userInfo:0];
          id *v37 = v7;
          id v41 = 0;
        }
        int v34 = 1;
      }
    }
  }
  objc_storeStrong(&v38, 0);
  objc_storeStrong(location, 0);
  id v8 = v41;
  return v8;
}

- (id)targetingKeyValuePairsForKeys:(id)a3 error:(id *)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7[1] = a4;
  v7[0] = objc_alloc_init(AMDDODMLCustomTargetingHelper);
  id v6 = (id)[v7[0] mainTargetingResolver:location[0] error:a4];
  objc_storeStrong(v7, 0);
  objc_storeStrong(location, 0);
  return v6;
}

- (id)gatherMetricsToReturn:(id)a3 withRecipe:(id)a4 withAttachments:(id)a5 outError:(id *)a6
{
  uint64_t v124 = *MEMORY[0x263EF8340];
  v119 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v117 = 0;
  objc_storeStrong(&v117, a4);
  id v116 = 0;
  objc_storeStrong(&v116, a5);
  v115 = a6;
  id v114 = (id)[v117 objectForKeyedSubscript:DataProcessingAndModelTraining];
  if (v114)
  {
    id v7 = [(AMDLighthouseODMLWorker *)v119 checkIfTaskShouldBeStopped:v115];
    BOOL v75 = v7 != 0;

    if (v75)
    {
      id v112 = (id)[v117 objectForKeyedSubscript:AttachmentInstructions];
      v73 = [AMDDODMLAttachmentProcessor alloc];
      uint64_t v74 = [(AMDLighthouseODMLWorker *)v119 attachments];
      id v111 = -[AMDDODMLAttachmentProcessor initWithAttachmentURLs:withInstructions:error:errorDomain:](v73, "initWithAttachmentURLs:withInstructions:error:errorDomain:");

      if (v111)
      {
        id v8 = [AMDDODMLDataProcessor alloc];
        id v110 = [(AMDDODMLDataProcessor *)v8 initWithActionArray:MEMORY[0x263EFFA68] withAttachmentProcessor:v111];
        if (v110)
        {
          [v110 setElementsInCoreDictionary:location[0]];
          id v109 = objc_alloc_init(MEMORY[0x263EFF980]);
          memset(__b, 0, sizeof(__b));
          id v71 = v114;
          uint64_t v72 = [v71 countByEnumeratingWithState:__b objects:v123 count:16];
          if (v72)
          {
            uint64_t v68 = *(void *)__b[2];
            uint64_t v69 = 0;
            unint64_t v70 = v72;
            while (1)
            {
              uint64_t v67 = v69;
              if (*(void *)__b[2] != v68) {
                objc_enumerationMutation(v71);
              }
              id v108 = *(id *)(__b[1] + 8 * v69);
              id v106 = (id)[v108 objectForKey:ModelName];
              if (v106)
              {
                id v12 = [(AMDLighthouseODMLWorker *)v119 checkIfTaskShouldBeStopped:v115];
                BOOL v66 = v12 != 0;

                if (v66)
                {
                  id v105 = (id)[v108 objectForKey:DataProcessing];
                  if (!v105
                    || (([v110 resetDataProcessorWithRecipe:v105],
                         (id v104 = (id)[v110 processRecipe:v115 errorDomain:AMDLighthouseODMLPluginErrorDomain]) != 0)? (v113 = 0): (v120 = 0, v113 = 1), objc_storeStrong(&v104, 0), !v113))
                  {
                    id v103 = (id)[v108 objectForKey:TaskParameters];
                    if (!v103) {
                      goto LABEL_48;
                    }
                    id v13 = objc_alloc(MEMORY[0x263F534A0]);
                    id v102 = (id)[v13 initWithParametersDict:v103];
                    id v14 = objc_alloc(MEMORY[0x263F53490]);
                    id v101 = (id)[v14 initWithParameters:v102 attachments:v116];
                    id v100 = (id)[v102 objectForKeyedSubscript:UseCoreMLTrainer];
                    if (!v100)
                    {
                      id v15 = (id)[NSNumber numberWithLong:0];
                      id v16 = v100;
                      id v100 = v15;
                    }
                    id v99 = (id)[v102 objectForKeyedSubscript:IsHeuristicModel];
                    if (!v99)
                    {
                      id v17 = (id)[NSNumber numberWithLong:0];
                      id v18 = v99;
                      id v99 = v17;
                    }
                    if ([v99 longValue] == 1 && objc_msgSend(v100, "longValue") == 1)
                    {
                      id v19 = objc_alloc(MEMORY[0x263F087E8]);
                      id v20 = (id)[v19 initWithDomain:AMDLighthouseODMLPluginErrorDomain code:143 userInfo:0];
                      id *v115 = v20;
                      id v120 = 0;
                      int v113 = 1;
                    }
                    else
                    {
                      id v21 = [(AMDLighthouseODMLWorker *)v119 checkIfTaskShouldBeStopped:v115];
                      BOOL v65 = v21 != 0;

                      if (v65)
                      {
                        id v98 = 0;
                        if ([v100 longValue] == 1)
                        {
                          id v62 = [AMDCoreMLDataProvider alloc];
                          uint64_t v61 = [v110 getInputSize];
                          id v64 = (id)[v110 getElementsInSampleDictionary];
                          id v63 = (id)[v110 getInputDictionary];
                          id v97 = -[AMDCoreMLDataProvider initWithInputs:featureSizeMap:inputDictionary:](v62, "initWithInputs:featureSizeMap:inputDictionary:", v61, v64);

                          id v96 = objc_alloc_init(AMDCoreMLTrainer);
                          id v22 = [(AMDCoreMLTrainer *)v96 runTask:v101 error:v115 errorDomain:AMDLighthouseODMLPluginErrorDomain dataProvider:v97];
                          id v23 = v98;
                          id v98 = v22;

                          objc_storeStrong((id *)&v96, 0);
                          objc_storeStrong((id *)&v97, 0);
                        }
                        else if ([v99 longValue] == 1)
                        {
                          id v58 = [AMDCoreMLDataProvider alloc];
                          uint64_t v57 = [v110 getInputSize];
                          id v60 = (id)[v110 getElementsInSampleDictionary];
                          id v59 = (id)[v110 getInputDictionary];
                          id v95 = -[AMDCoreMLDataProvider initWithInputs:featureSizeMap:inputDictionary:](v58, "initWithInputs:featureSizeMap:inputDictionary:", v57, v60);

                          id v94 = objc_alloc_init(AMDHeuristicModelEvaluator);
                          id v24 = [(AMDHeuristicModelEvaluator *)v94 runTask:v101 error:v115 errorDomain:AMDLighthouseODMLPluginErrorDomain dataProvider:v95];
                          id v25 = v98;
                          id v98 = v24;

                          objc_storeStrong((id *)&v94, 0);
                          objc_storeStrong((id *)&v95, 0);
                        }
                        else
                        {
                          id v54 = [AMDDODMLEspressoDataProvider alloc];
                          uint64_t v53 = [v110 getInputSize];
                          id v56 = (id)[v110 getElementsInSampleDictionary];
                          id v55 = (id)[v110 getInputDictionary];
                          id v93 = -[AMDDODMLEspressoDataProvider initWithInputs:featureSizeMap:inputDictionary:](v54, "initWithInputs:featureSizeMap:inputDictionary:", v53, v56);

                          id v92 = objc_alloc_init(AMDDODMLTrainer);
                          id v26 = [(AMDDODMLTrainer *)v92 runTask:v101 error:v115 errorDomain:AMDLighthouseODMLPluginErrorDomain dataProvider:v93 attachmentProcessor:v111];
                          id v27 = v98;
                          id v98 = v26;

                          objc_storeStrong((id *)&v92, 0);
                          objc_storeStrong((id *)&v93, 0);
                        }
                        if (v98)
                        {
                          id v50 = (id)[v98 JSONResult];
                          id v91 = (id)[v50 objectForKey:ModelMetrics];

                          memset(v89, 0, sizeof(v89));
                          id v51 = (id)[v91 allKeys];
                          uint64_t v52 = [v51 countByEnumeratingWithState:v89 objects:v122 count:16];
                          if (v52)
                          {
                            uint64_t v47 = *(void *)v89[2];
                            uint64_t v48 = 0;
                            unint64_t v49 = v52;
                            while (1)
                            {
                              uint64_t v46 = v48;
                              if (*(void *)v89[2] != v47) {
                                objc_enumerationMutation(v51);
                              }
                              uint64_t v90 = *(void *)(v89[1] + 8 * v48);
                              id v88 = (id)[v91 objectForKey:v90];
                              [v110 setElementInCoreDictionary:v88 withKey:v90];
                              objc_storeStrong(&v88, 0);
                              ++v48;
                              if (v46 + 1 >= v49)
                              {
                                uint64_t v48 = 0;
                                unint64_t v49 = [v51 countByEnumeratingWithState:v89 objects:v122 count:16];
                                if (!v49) {
                                  break;
                                }
                              }
                            }
                          }

                          objc_storeStrong(&v91, 0);
                          int v113 = 0;
                        }
                        else
                        {
                          id v120 = 0;
                          int v113 = 1;
                        }
                        objc_storeStrong(&v98, 0);
                      }
                      else
                      {
                        id v120 = 0;
                        int v113 = 1;
                      }
                    }
                    objc_storeStrong(&v99, 0);
                    objc_storeStrong(&v100, 0);
                    objc_storeStrong(&v101, 0);
                    objc_storeStrong(&v102, 0);
                    if (!v113)
                    {
LABEL_48:
                      id v28 = [(AMDLighthouseODMLWorker *)v119 checkIfTaskShouldBeStopped:v115];
                      BOOL v45 = v28 != 0;

                      if (v45)
                      {
                        id v87 = (id)[v108 objectForKey:DataPostProcessing];
                        if (!v87
                          || (([v110 resetDataProcessorWithRecipe:v87],
                               (id v86 = (id)[v110 processRecipe:v115 errorDomain:AMDLighthouseODMLPluginErrorDomain]) != 0)? (v113 = 0): (v120 = 0, v113 = 1), objc_storeStrong(&v86, 0), !v113))
                        {
                          id v29 = [(AMDLighthouseODMLWorker *)v119 checkIfTaskShouldBeStopped:v115];
                          BOOL v44 = v29 != 0;

                          if (v44)
                          {
                            id v85 = (id)[v108 objectForKeyedSubscript:FinalMetricsToCollect];
                            id v84 = (id)[v117 objectForKeyedSubscript:LoggingStrategies];
                            if (!v85) {
                              goto LABEL_74;
                            }
                            id v83 = (id)objc_opt_new();
                            id v82 = (id)objc_opt_new();
                            [v83 setObject:v106 forKey:ModelName];
                            memset(v80, 0, sizeof(v80));
                            id v42 = v85;
                            uint64_t v43 = [v42 countByEnumeratingWithState:v80 objects:v121 count:16];
                            if (v43)
                            {
                              uint64_t v39 = *(void *)v80[2];
                              uint64_t v40 = 0;
                              unint64_t v41 = v43;
                              while (1)
                              {
                                uint64_t v38 = v40;
                                if (*(void *)v80[2] != v39) {
                                  objc_enumerationMutation(v42);
                                }
                                uint64_t v81 = *(void *)(v80[1] + 8 * v40);
                                id v79 = (id)[v110 getElementInCoreDictionary:v81];
                                if (v79)
                                {
                                  if ([v79 count] == 1)
                                  {
                                    id v37 = (id)[v79 firstObject];
                                    id v36 = (id)[v37 stringValue];
                                    objc_msgSend(v82, "setObject:forKeyedSubscript:");

                                    int v113 = 0;
                                  }
                                  else
                                  {
                                    id v32 = objc_alloc(MEMORY[0x263F087E8]);
                                    id v33 = (id)[v32 initWithDomain:AMDLighthouseODMLPluginErrorDomain code:139 userInfo:0];
                                    id *v115 = v33;
                                    id v120 = 0;
                                    int v113 = 1;
                                  }
                                }
                                else
                                {
                                  id v30 = objc_alloc(MEMORY[0x263F087E8]);
                                  id v31 = (id)[v30 initWithDomain:AMDLighthouseODMLPluginErrorDomain code:138 userInfo:0];
                                  id *v115 = v31;
                                  id v120 = 0;
                                  int v113 = 1;
                                }
                                objc_storeStrong(&v79, 0);
                                if (v113) {
                                  break;
                                }
                                ++v40;
                                if (v38 + 1 >= v41)
                                {
                                  uint64_t v40 = 0;
                                  unint64_t v41 = [v42 countByEnumeratingWithState:v80 objects:v121 count:16];
                                  if (!v41) {
                                    goto LABEL_70;
                                  }
                                }
                              }
                            }
                            else
                            {
LABEL_70:
                              int v113 = 0;
                            }

                            if (!v113)
                            {
                              [v83 setObject:v82 forKey:ModelMetrics];
                              [v109 addObject:v83];
                              int v113 = 0;
                            }
                            objc_storeStrong(&v82, 0);
                            objc_storeStrong(&v83, 0);
                            if (!v113) {
LABEL_74:
                            }
                              int v113 = 0;
                            objc_storeStrong(&v84, 0);
                            objc_storeStrong(&v85, 0);
                          }
                          else
                          {
                            id v120 = 0;
                            int v113 = 1;
                          }
                        }
                        objc_storeStrong(&v87, 0);
                      }
                      else
                      {
                        id v120 = 0;
                        int v113 = 1;
                      }
                    }
                    objc_storeStrong(&v103, 0);
                  }
                  objc_storeStrong(&v105, 0);
                }
                else
                {
                  id v120 = 0;
                  int v113 = 1;
                }
              }
              else
              {
                id v10 = objc_alloc(MEMORY[0x263F087E8]);
                id v11 = (id)[v10 initWithDomain:AMDLighthouseODMLPluginErrorDomain code:137 userInfo:0];
                id *v115 = v11;
                id v120 = 0;
                int v113 = 1;
              }
              objc_storeStrong(&v106, 0);
              if (v113) {
                break;
              }
              ++v69;
              if (v67 + 1 >= v70)
              {
                uint64_t v69 = 0;
                unint64_t v70 = [v71 countByEnumeratingWithState:__b objects:v123 count:16];
                if (!v70) {
                  goto LABEL_82;
                }
              }
            }
          }
          else
          {
LABEL_82:
            int v113 = 0;
          }

          if (!v113)
          {
            id v120 = v109;
            int v113 = 1;
          }
          objc_storeStrong(&v109, 0);
        }
        else
        {
          id v9 = objc_alloc(MEMORY[0x263F087E8]);
          id *v115 = (id)[v9 initWithDomain:AMDLighthouseODMLPluginErrorDomain code:126 userInfo:0];
          id v120 = 0;
          int v113 = 1;
        }
        objc_storeStrong(&v110, 0);
      }
      else
      {
        id v120 = 0;
        int v113 = 1;
      }
      objc_storeStrong(&v111, 0);
      objc_storeStrong(&v112, 0);
    }
    else
    {
      id v120 = 0;
      int v113 = 1;
    }
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x263F087E8]);
    id *v115 = (id)[v6 initWithDomain:AMDLighthouseODMLPluginErrorDomain code:134 userInfo:0];
    id v120 = 0;
    int v113 = 1;
  }
  objc_storeStrong(&v114, 0);
  objc_storeStrong(&v116, 0);
  objc_storeStrong(&v117, 0);
  objc_storeStrong(location, 0);
  int v34 = v120;
  return v34;
}

- (id)checkIfTaskShouldBeStopped:(id *)a3
{
  if ([(NSNumber *)self->_taskShouldBeStopped intValue] == 1)
  {
    id v3 = objc_alloc(MEMORY[0x263F087E8]);
    *a3 = (id)[v3 initWithDomain:AMDLighthouseODMLPluginErrorDomain code:148 userInfo:0];
    id v6 = 0;
  }
  else
  {
    id v6 = (id)[NSNumber numberWithLong:1];
  }
  return v6;
}

- (id)checkIfModelShouldBeDownloaded:(id)a3 outError:(id *)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v18 = a4;
  id v4 = objc_alloc(MEMORY[0x263F53498]);
  id v17 = (id)[v4 initWithURLs:MEMORY[0x263EFFA68]];
  id v16 = (id)[location[0] objectForKeyedSubscript:DataProcessingToCheckIfDownloadModel];
  if (!v16) {
    objc_storeStrong(&v16, MEMORY[0x263EFFA68]);
  }
  id v11 = [AMDDODMLAttachmentProcessor alloc];
  id v10 = v17;
  id v12 = objc_alloc_init(MEMORY[0x263EFF8C0]);
  id v15 = -[AMDDODMLAttachmentProcessor initWithAttachmentURLs:withInstructions:error:errorDomain:](v11, "initWithAttachmentURLs:withInstructions:error:errorDomain:", v10);

  id v5 = [AMDDODMLDataProcessor alloc];
  id v14 = [(AMDDODMLDataProcessor *)v5 initWithActionArray:v16 withAttachmentProcessor:v15];
  if (v14)
  {
    id v20 = v14;
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x263F087E8]);
    id v7 = (id)[v6 initWithDomain:AMDLighthouseODMLPluginErrorDomain code:126 userInfo:0];
    *id v18 = v7;
    id v20 = 0;
  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
  id v8 = v20;
  return v8;
}

- (id)performGenericTaskWithDataProcessingCarryover:(id)a3 outError:(id *)a4
{
  id v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18[1] = a4;
  id v4 = (NSNumber *)(id)[NSNumber numberWithInt:0];
  taskShouldBeStopped = v20->_taskShouldBeStopped;
  v20->_taskShouldBeStopped = v4;

  v18[0] = (id)sLog;
  char v17 = 1;
  if (os_log_type_enabled((os_log_t)v18[0], OS_LOG_TYPE_INFO))
  {
    log = v18[0];
    os_log_type_t type = v17;
    __os_log_helper_16_0_0(v16);
    _os_log_impl(&dword_247E25000, log, type, "AMDLighthouseODMLPlugin: Start task", v16, 2u);
  }
  objc_storeStrong(v18, 0);
  id v9 = v20;
  id v8 = location[0];
  id v11 = [(AMDLighthouseODMLWorker *)v20 recipe];
  id v10 = [(AMDLighthouseODMLWorker *)v20 attachments];
  id v15 = -[AMDLighthouseODMLWorker gatherMetricsToReturn:withRecipe:withAttachments:outError:](v9, "gatherMetricsToReturn:withRecipe:withAttachments:outError:", v8, v11);

  if (v15) {
    id v21 = v15;
  }
  else {
    id v21 = 0;
  }
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  id v6 = v21;
  return v6;
}

- (void)stop
{
  os_log_t v2 = (NSNumber *)(id)objc_msgSend(NSNumber, "numberWithInt:", 1, a2);
  taskShouldBeStopped = self->_taskShouldBeStopped;
  self->_taskShouldBeStopped = v2;
}

- (NSMutableArray)candidateModels
{
  return self->_candidateModels;
}

- (void)setCandidateModels:(id)a3
{
}

- (NSDictionary)recipe
{
  return self->_recipe;
}

- (void)setRecipe:(id)a3
{
}

- (MLRTaskAttachments)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (NSNumber)taskShouldBeStopped
{
  return self->_taskShouldBeStopped;
}

- (void)setTaskShouldBeStopped:(id)a3
{
}

- (TRIExperimentIdentifiers)triExperimentIdentifiers
{
  return self->_triExperimentIdentifiers;
}

- (void)setTriExperimentIdentifiers:(id)a3
{
}

- (NSURL)modelsURL
{
  return self->_modelsURL;
}

- (void)setModelsURL:(id)a3
{
}

- (void).cxx_destruct
{
}

@end