@interface AMDJSInference
+ (BOOL)areValidInputs:(id)a3 domainOut:(int64_t *)a4 useCaseIdsArray:(id)a5 useCaseIdsSetOut:(id *)a6 storeFrontIdString:(id)a7 storeFrontIdOut:(id *)a8 dsId:(id)a9 error:(id *)a10;
+ (id)getDataForBizLogicForWorkflow:(id)a3 useCaseId:(id)a4 domainName:(id)a5;
+ (id)getIdAndScoresFrom:(id)a3 useCaseId:(id)a4 summary:(id)a5 bigGummary:(id)a6 errorKey:(id)a7;
+ (id)getPredictionForUseCase:(id)a3 treatmentId:(id)a4 UsingWorkflow:(id)a5 domainName:(id)a6 summary:(id)a7 bigSummary:(id)a8 errorKey:(id)a9;
+ (id)getWorkflowForUseCase:(id)a3 treatmentId:(id)a4 domain:(int64_t)a5 summary:(id)a6 bigSummary:(id)a7 errorKey:(id)a8;
+ (id)persist:(id)a3 withUsecase:(id)a4 withConfig:(id)a5 domainName:(id)a6;
+ (id)runInference:(id)a3 error:(id *)a4;
+ (void)appendInAppEventDataTo:(id)a3 forDsId:(id)a4 withInferencePayload:(id)a5;
@end

@implementation AMDJSInference

+ (id)runInference:(id)a3 error:(id *)a4
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v73 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v71 = a4;
  id v70 = (id)[location[0] objectForKey:0x26BEAE298];
  id v69 = (id)[location[0] objectForKey:0x26BEB87B8];
  id v68 = (id)[location[0] objectForKey:0x26BEB0DB8];
  id v67 = (id)[location[0] objectForKey:0x26BEB0D98];
  uint64_t v66 = 0;
  id v65 = 0;
  id v64 = 0;
  id obj = 0;
  id v62 = 0;
  char v35 = [v73 areValidInputs:v70 domainOut:&v66 useCaseIdsArray:v69 useCaseIdsSetOut:&obj storeFrontIdString:v68 storeFrontIdOut:&v62 dsId:v67 error:a4];
  objc_storeStrong(&v65, obj);
  objc_storeStrong(&v64, v62);
  if (v35)
  {
    id v60 = (id)[location[0] objectForKey:@"inferenceInputData"];
    if (!v60
      || ((id v59 = +[AMDFeatureProvider getProviderForSource:WithDomain:](AMDFeatureProvider, "getProviderForSource:WithDomain:", 0x26BEB0F78, 0), [v59 storeFeatureData:v60 error:v71], !*v71)? (v61 = 0): (v74 = 0, v61 = 1), objc_storeStrong(&v59, 0), !v61))
    {
      id v58 = (id)[location[0] objectForKey:@"auxillaryData"];
      if (!v58
        || ((id v57 = +[AMDFeatureProvider getProviderForSource:WithDomain:](AMDFeatureProvider, "getProviderForSource:WithDomain:", 0x26BEB0F78, 0), [v57 storeOutputRemapData:v58 error:v71], !*v71)? (v61 = 0): (v74 = 0, v61 = 1), objc_storeStrong(&v57, 0), !v61))
      {
        id v56 = (id)[location[0] objectForKey:0x26BEB8618];
        if (v56) {
          objc_storeStrong(&v56, v56);
        }
        else {
          objc_storeStrong(&v56, MEMORY[0x263EFFA78]);
        }
        id v55 = (id)[location[0] objectForKey:@"returnInferenceResult"];
        if (v55) {
          objc_storeStrong(&v55, v55);
        }
        else {
          objc_storeStrong(&v55, MEMORY[0x263EFFA78]);
        }
        id v54 = (id)[location[0] objectForKey:0x26BEB05F8];
        id v30 = objc_alloc(MEMORY[0x263EFF9A0]);
        id v53 = (id)objc_msgSend(v30, "initWithCapacity:", objc_msgSend(v65, "count"));
        id v31 = objc_alloc(MEMORY[0x263EFF9A0]);
        id v52 = (id)objc_msgSend(v31, "initWithCapacity:", objc_msgSend(v65, "count"));
        id v51 = 0;
        memset(__b, 0, sizeof(__b));
        id v32 = v65;
        uint64_t v33 = [v32 countByEnumeratingWithState:__b objects:v79 count:16];
        if (v33)
        {
          uint64_t v27 = *(void *)__b[2];
          uint64_t v28 = 0;
          unint64_t v29 = v33;
          while (1)
          {
            uint64_t v26 = v28;
            if (*(void *)__b[2] != v27) {
              objc_enumerationMutation(v32);
            }
            uint64_t v50 = *(void *)(__b[1] + 8 * v28);
            objc_storeStrong(&v51, 0);
            id v48 = objc_alloc_init(MEMORY[0x263EFF9A0]);
            id v47 = (id)[@"inferenceUseCase:" stringByAppendingString:v50];
            id v46 = (id)[@"inferenceError" stringByAppendingString:v47];
            +[AMDPerf startMonitoringEvent:v47];
            id v45 = (id)[v73 getWorkflowForUseCase:v50 treatmentId:v54 domain:v66 summary:v48 bigSummary:v52 errorKey:v46];
            if (v45)
            {
              id v24 = v73;
              uint64_t v22 = v50;
              id v23 = v54;
              id v25 = (id)[v45 first];
              id v44 = (id)objc_msgSend(v24, "getPredictionForUseCase:treatmentId:UsingWorkflow:domainName:summary:bigSummary:errorKey:", v22, v23, v46);

              if (v44)
              {
                id v43 = (id)[v56 objectForKey:v50];
                if (v43)
                {
                  id v42 = (id)[v73 persist:v44 withUsecase:v50 withConfig:v43 domainName:v70];
                  [v48 setObject:v42 forKey:@"resultPersistanceSummary"];
                  objc_storeStrong(&v42, 0);
                }
                id v41 = (id)[v73 getIdAndScoresFrom:v44 useCaseId:v50 summary:v48 bigGummary:v52 errorKey:v46];
                id v40 = MEMORY[0x263EFFA78];
                id v21 = (id)[v44 objectForKey:@"results"];

                if (v21)
                {
                  v77[0] = @"reco_id";
                  id v20 = objc_alloc_init(MEMORY[0x263F08C38]);
                  id v19 = (id)[v20 UUIDString];
                  v78[0] = v19;
                  v77[1] = @"reco_eligible";
                  v78[1] = &unk_26BEC1820;
                  v77[2] = @"reco_useCase";
                  v78[2] = v50;
                  id v4 = (id)[NSDictionary dictionaryWithObjects:v78 forKeys:v77 count:3];
                  id v5 = v40;
                  id v40 = v4;
                }
                char v39 = 1;
                id v38 = (id)[v55 objectForKey:v50];
                if (v38) {
                  char v39 = [v38 BOOLValue] & 1;
                }
                if ((v39 & 1) == 0) {
                  objc_storeStrong(&v44, MEMORY[0x263EFFA78]);
                }
                id v37 = +[AMDFrameworkMetrics getValueForKey:](AMDFrameworkMetrics, "getValueForKey:");
                v75[0] = @"outputs";
                v76[0] = v44;
                v75[1] = @"contentIdsProvided";
                uint64_t v9 = MEMORY[0x263EFFA88];
                v76[1] = MEMORY[0x263EFFA88];
                v75[2] = @"contentIds";
                id v10 = (id)[v41 first];
                v76[2] = v10;
                v75[3] = @"scoresProvided";
                v76[3] = v9;
                v75[4] = @"scores";
                id v11 = (id)[v41 second];
                v76[4] = v11;
                v75[5] = @"maxItemsToDisplay";
                id v12 = (id)[v45 first];
                id v13 = (id)[v12 getMaxItemsToDisplay];
                v76[5] = v13;
                v75[6] = @"workflowUsed";
                id v14 = (id)[v45 second];
                v76[6] = v14;
                v75[7] = @"outputFeatures";
                id v16 = v73;
                id v15 = (id)[v45 first];
                id v17 = (id)[v15 getOutputFeatureIds];
                id v18 = (id)objc_msgSend(v16, "getDataForBizLogicForWorkflow:useCaseId:domainName:");
                v76[7] = v18;
                v75[8] = @"metrics";
                v76[8] = v40;
                v75[9] = @"inferenceModelInfo";
                if (v37) {
                  id v8 = v37;
                }
                else {
                  id v8 = (id)MEMORY[0x263EFFA78];
                }
                v76[9] = v8;
                id v36 = (id)[NSDictionary dictionaryWithObjects:v76 forKeys:v75 count:10];

                [v53 setValue:v36 forKey:v50];
                [v52 setObject:v48 forKey:v50];
                +[AMDPerf endMonitoringEvent:v47];
                objc_storeStrong(&v36, 0);
                objc_storeStrong(&v37, 0);
                objc_storeStrong(&v38, 0);
                objc_storeStrong(&v40, 0);
                objc_storeStrong(&v41, 0);
                objc_storeStrong(&v43, 0);
                int v61 = 0;
              }
              else
              {
                int v61 = 3;
              }
              objc_storeStrong(&v44, 0);
            }
            else
            {
              int v61 = 3;
            }
            objc_storeStrong(&v45, 0);
            objc_storeStrong(&v46, 0);
            objc_storeStrong(&v47, 0);
            objc_storeStrong(&v48, 0);
            ++v28;
            if (v26 + 1 >= v29)
            {
              uint64_t v28 = 0;
              unint64_t v29 = [v32 countByEnumeratingWithState:__b objects:v79 count:16];
              if (!v29) {
                break;
              }
            }
          }
        }

        +[AMDFrameworkMetrics log:v52 withKey:@"recommendationSummary" atVerbosity:0];
        [v73 appendInAppEventDataTo:v53 forDsId:v67 withInferencePayload:location[0]];
        id v74 = v53;
        int v61 = 1;
        objc_storeStrong(&v51, 0);
        objc_storeStrong(&v52, 0);
        objc_storeStrong(&v53, 0);
        objc_storeStrong(&v54, 0);
        objc_storeStrong(&v55, 0);
        objc_storeStrong(&v56, 0);
      }
      objc_storeStrong(&v58, 0);
    }
    objc_storeStrong(&v60, 0);
  }
  else
  {
    id v74 = 0;
    int v61 = 1;
  }
  objc_storeStrong(&v64, 0);
  objc_storeStrong(&v65, 0);
  objc_storeStrong(&v67, 0);
  objc_storeStrong(&v68, 0);
  objc_storeStrong(&v69, 0);
  objc_storeStrong(&v70, 0);
  objc_storeStrong(location, 0);
  v6 = v74;

  return v6;
}

+ (BOOL)areValidInputs:(id)a3 domainOut:(int64_t *)a4 useCaseIdsArray:(id)a5 useCaseIdsSetOut:(id *)a6 storeFrontIdString:(id)a7 storeFrontIdOut:(id *)a8 dsId:(id)a9 error:(id *)a10
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v34 = a4;
  id v33 = 0;
  objc_storeStrong(&v33, a5);
  id v32 = a6;
  id v31 = 0;
  objc_storeStrong(&v31, a7);
  id v30 = a8;
  id v29 = 0;
  objc_storeStrong(&v29, a9);
  uint64_t v28 = a10;
  id v27 = 0;
  char v26 = 0;
  if (location[0])
  {
    int64_t v24 = +[AMDDomains getCodeForDomain:location[0]];
    if (v24)
    {
      int64_t *v34 = v24;
      if (v33 && [v33 count])
      {
        id v11 = (id)[MEMORY[0x263EFFA08] setWithArray:v33];
        *id v32 = v11;
        if (v31)
        {
          id v12 = (id)objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v31, "intValue"));
          *id v30 = v12;
          if (v29)
          {
            if (+[AMDMiscHelpers isValidDSID:v29])
            {
              id v23 = +[AMDTasteProfile getStorefrontIdForDomain:location[0]];
              id v22 = +[AMDTasteProfile getUserIdForDomain:location[0]];
              if (*v30 && v22)
              {
                if ([v29 isEqualToString:v22])
                {
                  if ([*v30 isEqualToNumber:v23])
                  {
                    int v25 = 0;
                  }
                  else
                  {
                    id v13 = (id)[NSString stringWithFormat:@"SfId mismatch: payload:%@ TP:%@", *v30, v23];
                    id v14 = v27;
                    id v27 = v13;

                    char v36 = 0;
                    int v25 = 1;
                  }
                }
                else
                {
                  objc_storeStrong(&v27, @"DsId mismatch");
                  char v36 = 0;
                  int v25 = 1;
                }
              }
              else
              {
                objc_storeStrong(&v27, @"No dsId or sfId in TP");
                char v36 = 0;
                int v25 = 1;
              }
              objc_storeStrong(&v22, 0);
              objc_storeStrong(&v23, 0);
              if (!v25) {
                int v25 = 0;
              }
            }
            else
            {
              objc_storeStrong(&v27, @"Invalid dsId");
              char v36 = 0;
              int v25 = 1;
            }
          }
          else
          {
            objc_storeStrong(&v27, @"Missing dsId");
            char v36 = 0;
            int v25 = 1;
          }
        }
        else
        {
          objc_storeStrong(&v27, @"Missing storeFrontId");
          char v36 = 0;
          int v25 = 1;
        }
      }
      else
      {
        objc_storeStrong(&v27, @"No use cases");
        char v36 = 0;
        int v25 = 1;
      }
    }
    else
    {
      objc_storeStrong(&v27, @"Unknown domain");
      char v36 = 0;
      int v25 = 1;
    }
  }
  else
  {
    objc_storeStrong(&v27, @"Missing domain");
    char v36 = 0;
    int v25 = 1;
  }
  int v16 = v25;
  if (v27)
  {
    id v15 = +[AMDError allocError:15 withMessage:v27];
    *uint64_t v28 = v15;
    BOOL result = +[AMDFrameworkMetrics log:v27 withKey:@"inferenceError" atVerbosity:0];
  }
  if (v26) {
    objc_exception_rethrow();
  }
  int v25 = v16;
  if (!v16)
  {
    char v36 = 1;
    int v25 = 1;
LABEL_32:
    objc_storeStrong(&v27, 0);
    objc_storeStrong(&v29, 0);
    objc_storeStrong(&v31, 0);
    objc_storeStrong(&v33, 0);
    objc_storeStrong(location, 0);
    return v36 & 1;
  }
  if (v16 != 2) {
    goto LABEL_32;
  }
  __break(1u);
  return result;
}

+ (id)getWorkflowForUseCase:(id)a3 treatmentId:(id)a4 domain:(int64_t)a5 summary:(id)a6 bigSummary:(id)a7 errorKey:(id)a8
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v45 = 0;
  objc_storeStrong(&v45, a4);
  int64_t v44 = a5;
  id v43 = 0;
  objc_storeStrong(&v43, a6);
  id v42 = 0;
  objc_storeStrong(&v42, a7);
  id v41 = 0;
  objc_storeStrong(&v41, a8);
  id v40 = 0;
  id v38 = 0;
  id v25 = +[AMDWorkflow getCurrentWorkflowForDomain:v44 andTreatmentId:v45 andUseCaseId:location[0] error:&v38];
  objc_storeStrong(&v40, v38);
  id v39 = v25;
  if (v40)
  {
    os_log_t oslog = (os_log_t)&_os_log_internal;
    os_log_type_t type = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      id v17 = location[0];
      id v18 = v45;
      id v19 = (id)[v40 localizedDescription];
      __os_log_helper_16_2_3_8_64_8_64_8_64((uint64_t)v51, (uint64_t)v17, (uint64_t)v18, (uint64_t)v19);
      _os_log_impl(&dword_20ABD4000, oslog, type, "error fetching workflow for use case %@, treatment %@: %@", v51, 0x20u);
    }
    objc_storeStrong((id *)&oslog, 0);
    [v43 setObject:@"Error getting workflow" forKey:@"error"];
    id v15 = v43;
    id v16 = (id)[v40 localizedDescription];
    objc_msgSend(v15, "setObject:forKey:");

    [v42 setObject:v43 forKey:location[0]];
    +[AMDFrameworkMetrics log:@"Error fetching workflow" withKey:v41 atVerbosity:0];
    id v47 = 0;
    int v35 = 1;
  }
  else if (v39)
  {
    id v32 = (id)[v39 second];
    if (!v45)
    {
      id v8 = (id)[v39 first];
      id v9 = v45;
      id v45 = v8;
    }
    if (v32 && [v32 count])
    {
      if (v45) {
        [v43 setObject:v45 forKey:0x26BEB05F8];
      }
      id v27 = [[AMDUseCaseWorkflow alloc] initWithDictionary:v32];
      if ([v27 isValid])
      {
        id v47 = [[AMDPair alloc] initWith:v27 and:v32];
        int v35 = 1;
      }
      else
      {
        os_log_t v26 = (os_log_t)&_os_log_internal;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v48, (uint64_t)location[0], (uint64_t)v45);
          _os_log_error_impl(&dword_20ABD4000, v26, OS_LOG_TYPE_ERROR, "invalid workflow for use case %@, treatment %@", v48, 0x16u);
        }
        objc_storeStrong((id *)&v26, 0);
        objc_msgSend(v43, "setObject:forKey:");
        [v42 setObject:v43 forKey:location[0]];
        +[AMDFrameworkMetrics log:@"Invalid workflow" withKey:v41 atVerbosity:0];
        id v47 = 0;
        int v35 = 1;
      }
      objc_storeStrong(&v27, 0);
    }
    else
    {
      os_log_t v31 = (os_log_t)&_os_log_internal;
      os_log_type_t v30 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v49, (uint64_t)location[0], (uint64_t)v45);
        _os_log_impl(&dword_20ABD4000, v31, v30, "no workflow for use case %@, treatment %@", v49, 0x16u);
      }
      objc_storeStrong((id *)&v31, 0);
      objc_msgSend(v43, "setObject:forKey:");
      [v42 setObject:v43 forKey:location[0]];
      +[AMDFrameworkMetrics log:@"No workflow" withKey:v41 atVerbosity:0];
      id v28 = v40;
      id v14 = +[AMDWorkflowInFlight fetchAllModelIds:&v28];
      objc_storeStrong(&v40, v28);
      id v29 = v14;
      if (!v40)
      {
        id v12 = v29;
        id v13 = (id)[@"inflight_" stringByAppendingString:location[0]];
        +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v12);
      }
      id v47 = 0;
      int v35 = 1;
      objc_storeStrong(&v29, 0);
    }
    objc_storeStrong(&v32, 0);
  }
  else
  {
    os_log_t v34 = (os_log_t)&_os_log_internal;
    os_log_type_t v33 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v50, (uint64_t)location[0], (uint64_t)v45);
      _os_log_impl(&dword_20ABD4000, v34, v33, "no workflow for use case %@, treatment %@", v50, 0x16u);
    }
    objc_storeStrong((id *)&v34, 0);
    [v43 setObject:@"No workflow" forKey:@"error"];
    [v42 setObject:v43 forKey:location[0]];
    id v47 = 0;
    int v35 = 1;
  }
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v43, 0);
  objc_storeStrong(&v45, 0);
  objc_storeStrong(location, 0);
  id v10 = v47;

  return v10;
}

+ (id)getPredictionForUseCase:(id)a3 treatmentId:(id)a4 UsingWorkflow:(id)a5 domainName:(id)a6 summary:(id)a7 bigSummary:(id)a8 errorKey:(id)a9
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v42 = 0;
  objc_storeStrong(&v42, a4);
  id v41 = 0;
  objc_storeStrong(&v41, a5);
  id v40 = 0;
  objc_storeStrong(&v40, a6);
  id v39 = 0;
  objc_storeStrong(&v39, a7);
  id v38 = 0;
  objc_storeStrong(&v38, a8);
  id v37 = 0;
  objc_storeStrong(&v37, a9);
  id v36 = 0;
  id v35 = 0;
  id v25 = v41;
  id v27 = (id)[v41 getMaxItemsToDisplay];
  unsigned int v9 = [v27 unsignedIntValue];
  id v34 = v36;
  id v26 = (id)[v25 getPredictions:((double)v9 * 1.5) forDomain:v40 error:&v34];
  objc_storeStrong(&v36, v34);
  id v10 = v35;
  id v35 = v26;

  if (v36)
  {
    id v33 = &_os_log_internal;
    char v32 = 1;
    if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_INFO))
    {
      log = v33;
      os_log_type_t type = v32;
      id v15 = location[0];
      id v16 = v42;
      id v19 = (id)[v36 localizedDescription];
      id v31 = v19;
      __os_log_helper_16_2_3_8_64_8_64_8_64((uint64_t)v46, (uint64_t)v15, (uint64_t)v16, (uint64_t)v31);
      _os_log_impl(&dword_20ABD4000, log, type, "error running inference for use case %@, treatment %@: %@", v46, 0x20u);

      objc_storeStrong(&v31, 0);
    }
    objc_storeStrong(&v33, 0);
    objc_msgSend(v39, "setObject:forKey:");
    id v13 = v39;
    id v14 = (id)[v36 localizedDescription];
    objc_msgSend(v13, "setObject:forKey:");

    [v38 setObject:v39 forKey:location[0]];
    +[AMDFrameworkMetrics log:@"Error running inference" withKey:v37 atVerbosity:0];
    id v44 = 0;
    int v30 = 1;
  }
  else if (v35 && [v35 count])
  {
    id v44 = v35;
    int v30 = 1;
  }
  else
  {
    id v29 = @"No inference output";
    id v28 = &_os_log_internal;
    if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v45, (uint64_t)v29);
      _os_log_error_impl(&dword_20ABD4000, (os_log_t)v28, OS_LOG_TYPE_ERROR, "%@", v45, 0xCu);
    }
    objc_storeStrong(&v28, 0);
    [v39 setObject:v29 forKey:@"error"];
    [v38 setObject:v39 forKey:location[0]];
    +[AMDFrameworkMetrics log:v29 withKey:v37 atVerbosity:0];
    id v44 = 0;
    int v30 = 1;
    objc_storeStrong((id *)&v29, 0);
  }
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(location, 0);
  id v11 = v44;

  return v11;
}

+ (id)persist:(id)a3 withUsecase:(id)a4 withConfig:(id)a5 domainName:(id)a6
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v48 = 0;
  objc_storeStrong(&v48, a4);
  id v47 = 0;
  objc_storeStrong(&v47, a5);
  id v46 = 0;
  objc_storeStrong(&v46, a6);
  id v45 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  os_log_t oslog = (os_log_t)&_os_log_internal;
  os_log_type_t type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v56, (uint64_t)v48);
    _os_log_debug_impl(&dword_20ABD4000, oslog, type, "Persisting inference result with usecase %@", v56, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  memset(__b, 0, sizeof(__b));
  id v19 = location[0];
  uint64_t v20 = [v19 countByEnumeratingWithState:__b objects:v55 count:16];
  if (v20)
  {
    uint64_t v16 = *(void *)__b[2];
    uint64_t v17 = 0;
    unint64_t v18 = v20;
    while (1)
    {
      uint64_t v15 = v17;
      if (*(void *)__b[2] != v16) {
        objc_enumerationMutation(v19);
      }
      uint64_t v42 = *(void *)(__b[1] + 8 * v17);
      id v40 = (id)[v47 objectForKey:v42];
      if (!v40)
      {
        int v39 = 3;
        goto LABEL_30;
      }
      id v38 = (id)[v40 objectForKey:@"datastore"];
      if (v38 && ([v38 isEqualToString:@"AMDDatabase"] & 1) == 0)
      {
        if ([v38 isEqualToString:@"vectorDB"])
        {
          id v30 = (id)[v40 objectForKey:@"vectorDBConfig"];
          if (v30)
          {
            id v29 = (id)[location[0] objectForKey:v42];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v28 = v29;
              id v27 = 0;
              v50[0] = @"vectorDBConfig";
              v51[0] = v30;
              v50[1] = @"vectorDict";
              v51[1] = v28;
              id v26 = (id)[NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:2];
              id v24 = v27;
              id v8 = +[AMDVectorDBManager insertVectorsHandlerWithInsertVectorsPayload:v26 error:&v24];
              objc_storeStrong(&v27, v24);
              id v25 = v8;
              [v45 setObject:v8 forKey:v42];
              objc_storeStrong(&v25, 0);
              objc_storeStrong(&v26, 0);
              objc_storeStrong(&v27, 0);
              objc_storeStrong(&v28, 0);
              int v39 = 0;
            }
            else
            {
              [v45 setObject:@"Inference output has to be a dictionary to be persisted in vectorDB" forKey:v42];
              int v39 = 3;
            }
            objc_storeStrong(&v29, 0);
          }
          else
          {
            [v45 setObject:@"VectorDB Config missing" forKey:v42];
            int v39 = 3;
          }
          objc_storeStrong(&v30, 0);
          if (v39) {
            goto LABEL_29;
          }
        }
        else
        {
          [v45 setObject:@"Unsupported datastore passed for persistance" forKey:v42];
        }
      }
      else
      {
        id v37 = (id)[v48 stringByAppendingString:v42];
        id v53 = v37;
        id v54 = location[0];
        id v36 = (id)[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
        id v35 = 0;
        id v33 = 0;
        id v14 = +[AMDTasteProfile saveTasteProfileEntriesFromDict:v36 inDomain:v46 forSource:0x26BEB7E78 error:&v33];
        objc_storeStrong(&v35, v33);
        id v34 = v14;
        if (v35)
        {
          os_log_t v32 = (os_log_t)&_os_log_internal;
          os_log_type_t v31 = OS_LOG_TYPE_INFO;
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            id v11 = v32;
            os_log_type_t v12 = v31;
            id v13 = (id)[v35 localizedDescription];
            __os_log_helper_16_2_1_8_64((uint64_t)v52, (uint64_t)v13);
            _os_log_impl(&dword_20ABD4000, v11, v12, "Error persisting inference result: %@", v52, 0xCu);
          }
          objc_storeStrong((id *)&v32, 0);
          id v9 = v45;
          id v10 = (id)[v35 localizedDescription];
          objc_msgSend(v9, "setObject:forKey:");

          int v39 = 3;
        }
        else
        {
          [v45 setObject:v34 forKey:@"saveSummary"];
          int v39 = 0;
        }
        objc_storeStrong(&v34, 0);
        objc_storeStrong(&v35, 0);
        objc_storeStrong(&v36, 0);
        objc_storeStrong(&v37, 0);
        if (v39) {
          goto LABEL_29;
        }
      }
      int v39 = 0;
LABEL_29:
      objc_storeStrong(&v38, 0);
LABEL_30:
      objc_storeStrong(&v40, 0);
      ++v17;
      if (v15 + 1 >= v18)
      {
        uint64_t v17 = 0;
        unint64_t v18 = [v19 countByEnumeratingWithState:__b objects:v55 count:16];
        if (!v18) {
          break;
        }
      }
    }
  }

  id v7 = v45;
  int v39 = 1;
  objc_storeStrong(&v45, 0);
  objc_storeStrong(&v46, 0);
  objc_storeStrong(&v47, 0);
  objc_storeStrong(&v48, 0);
  objc_storeStrong(location, 0);

  return v7;
}

+ (id)getIdAndScoresFrom:(id)a3 useCaseId:(id)a4 summary:(id)a5 bigGummary:(id)a6 errorKey:(id)a7
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v34 = 0;
  objc_storeStrong(&v34, a4);
  id v33 = 0;
  objc_storeStrong(&v33, a5);
  id v32 = 0;
  objc_storeStrong(&v32, a6);
  id v31 = 0;
  objc_storeStrong(&v31, a7);
  id v30 = &_os_log_internal;
  os_log_type_t v29 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v38, (uint64_t)v34);
    _os_log_debug_impl(&dword_20ABD4000, (os_log_t)v30, v29, "Retrieving contentId and scores for use case %@", v38, 0xCu);
  }
  objc_storeStrong(&v30, 0);
  id v14 = (id)[location[0] allValues];
  id v28 = (id)[v14 firstObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v23 = v28;
    id v22 = (id)[v23 objectForKey:@"ids"];
    id v21 = (id)[v23 objectForKey:@"scores"];
    if (!v22 || ![v22 count] || !v21 || !objc_msgSend(v21, "count"))
    {
      uint64_t v20 = @"No content ids or scores available";
      os_log_t oslog = (os_log_t)&_os_log_internal;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v37, (uint64_t)v20);
        _os_log_error_impl(&dword_20ABD4000, oslog, OS_LOG_TYPE_ERROR, "%@", v37, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      [v33 setObject:v20 forKey:@"error"];
      [v32 setObject:v33 forKey:v34];
      +[AMDFrameworkMetrics log:@"Empty inference" withKey:v31 atVerbosity:0];
      id v11 = (id)MEMORY[0x263EFFA68];
      objc_storeStrong(&v22, MEMORY[0x263EFFA68]);
      objc_storeStrong(&v21, v11);
      objc_storeStrong((id *)&v20, 0);
    }
    id v8 = [AMDPair alloc];
    uint64_t v36 = [(AMDPair *)v8 initWith:v22 and:v21];
    int v24 = 1;
    objc_storeStrong(&v21, 0);
    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v23, 0);
  }
  else
  {
    id v27 = &_os_log_internal;
    char v26 = 1;
    if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_INFO))
    {
      os_log_type_t v12 = v27;
      os_log_type_t v13 = v26;
      __os_log_helper_16_0_0(v25);
      _os_log_impl(&dword_20ABD4000, v12, v13, "Recommendation results are not a dict", v25, 2u);
    }
    objc_storeStrong(&v27, 0);
    id v7 = [AMDPair alloc];
    uint64_t v36 = -[AMDPair initWith:and:](v7, "initWith:and:", MEMORY[0x263EFFA68]);
    int v24 = 1;
  }
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(location, 0);
  id v9 = (void *)v36;

  return v9;
}

+ (id)getDataForBizLogicForWorkflow:(id)a3 useCaseId:(id)a4 domainName:(id)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v33 = 0;
  objc_storeStrong(&v33, a4);
  id v32 = 0;
  objc_storeStrong(&v32, a5);
  id v31 = (id)objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(location[0], "count"));
  memset(__b, 0, sizeof(__b));
  id v20 = location[0];
  uint64_t v21 = [v20 countByEnumeratingWithState:__b objects:v36 count:16];
  if (v21)
  {
    uint64_t v15 = *(void *)__b[2];
    uint64_t v16 = 0;
    unint64_t v17 = v21;
    while (1)
    {
      uint64_t v14 = v16;
      if (*(void *)__b[2] != v15) {
        objc_enumerationMutation(v20);
      }
      uint64_t v30 = *(void *)(__b[1] + 8 * v16);
      id v28 = 0;
      id v26 = 0;
      id v13 = +[AMDTasteProfile getFeatureWithName:v30 inDomain:v32 withColumnName:0 error:&v26];
      objc_storeStrong(&v28, v26);
      id v27 = v13;
      if (!v28 && v27)
      {
        id v22 = (id)[v27 getValue];
        if (v22) {
          [v31 setObject:v22 forKey:v30];
        }
        objc_storeStrong(&v22, 0);
        int v23 = 0;
      }
      else
      {
        os_log_t oslog = (os_log_t)&_os_log_internal;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          log = oslog;
          os_log_type_t v11 = type;
          uint64_t v7 = v30;
          id v8 = v32;
          id v9 = v33;
          id v12 = (id)[v28 localizedDescription];
          __os_log_helper_16_2_4_8_64_8_64_8_64_8_64((uint64_t)v35, v7, (uint64_t)v8, (uint64_t)v9, (uint64_t)v12);
          _os_log_impl(&dword_20ABD4000, log, v11, "Error fetching feature '%@' for domain: %@, useCaseId: %@: %@", v35, 0x2Au);
        }
        objc_storeStrong((id *)&oslog, 0);
        int v23 = 3;
      }
      objc_storeStrong(&v27, 0);
      objc_storeStrong(&v28, 0);
      ++v16;
      if (v14 + 1 >= v17)
      {
        uint64_t v16 = 0;
        unint64_t v17 = [v20 countByEnumeratingWithState:__b objects:v36 count:16];
        if (!v17) {
          break;
        }
      }
    }
  }

  id v6 = v31;
  int v23 = 1;
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(location, 0);

  return v6;
}

+ (void)appendInAppEventDataTo:(id)a3 forDsId:(id)a4 withInferencePayload:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v23 = 0;
  objc_storeStrong(&v23, a4);
  id v22 = 0;
  objc_storeStrong(&v22, a5);
  id v21 = (id)[v22 objectForKey:0x26BEB88B8];
  if (v21 && [v21 intValue])
  {
    id v16 = (id)[v22 objectForKey:0x26BEB8858];
    id v15 = (id)[v22 objectForKey:0x26BEB8878];
    if (v15) {
      objc_storeStrong(&v15, v15);
    }
    else {
      objc_storeStrong(&v15, &unk_26BEC1838);
    }
    id v14 = 0;
    id v12 = 0;
    id v6 = +[AMDAppStoreEvent retrieveEventsOfType:v16 inPeriod:v15 forUser:v23 error:&v12];
    objc_storeStrong(&v14, v12);
    id v13 = v6;
    if (v14)
    {
      os_log_t oslog = (os_log_t)&_os_log_internal;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        id v5 = (id)[v14 localizedDescription];
        __os_log_helper_16_2_1_8_64((uint64_t)v25, (uint64_t)v5);
        _os_log_error_impl(&dword_20ABD4000, oslog, OS_LOG_TYPE_ERROR, "Error while retrieving AppStore Events: %@", v25, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      int v17 = 1;
    }
    else
    {
      if (v13) {
        [location[0] setObject:v13 forKey:@"appStoreEvents"];
      }
      int v17 = 0;
    }
    objc_storeStrong(&v13, 0);
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v16, 0);
  }
  else
  {
    id v20 = &_os_log_internal;
    char v19 = 2;
    if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEBUG))
    {
      log = v20;
      os_log_type_t type = v19;
      __os_log_helper_16_0_0(v18);
      _os_log_debug_impl(&dword_20ABD4000, log, type, "App store impressions/clicks skipped", v18, 2u);
    }
    objc_storeStrong(&v20, 0);
    int v17 = 1;
  }
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
}

@end