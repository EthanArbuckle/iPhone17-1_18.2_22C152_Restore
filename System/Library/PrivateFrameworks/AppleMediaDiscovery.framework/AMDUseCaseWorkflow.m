@interface AMDUseCaseWorkflow
- (AMDInputBuilder)inputBuilder;
- (AMDInputBuilder)secondaryModelInputBuilder;
- (AMDOutputBuilder)outputBuilder;
- (AMDOutputBuilder)secondaryModelOutputBuilder;
- (AMDUseCaseWorkflow)initWithDictionary:(id)a3;
- (BOOL)isValid;
- (NSDictionary)ruleParams;
- (NSNumber)endTimestamp;
- (NSNumber)maxItemsToDisplay;
- (NSNumber)startTimestamp;
- (NSNumber)useMinimalMap;
- (NSString)coldstartModelId;
- (NSString)modelFormat;
- (NSString)modelId;
- (NSString)modelName;
- (NSString)secondaryModelId;
- (NSString)treatmentId;
- (NSString)useCaseId;
- (id)getColdstartModelId;
- (id)getMaxItemsToDisplay;
- (id)getModelFormat;
- (id)getModelId;
- (id)getOutputFeatureIds;
- (id)getPredictions:(unint64_t)a3 forDomain:(id)a4 error:(id *)a5;
- (id)getTreatmentId;
- (id)getUseCaseId;
- (void)setColdstartModelId:(id)a3;
- (void)setEndTimestamp:(id)a3;
- (void)setInputBuilder:(id)a3;
- (void)setMaxItemsToDisplay:(id)a3;
- (void)setModelFormat:(id)a3;
- (void)setModelId:(id)a3;
- (void)setModelName:(id)a3;
- (void)setOutputBuilder:(id)a3;
- (void)setRuleParams:(id)a3;
- (void)setSecondaryModelId:(id)a3;
- (void)setSecondaryModelInputBuilder:(id)a3;
- (void)setSecondaryModelOutputBuilder:(id)a3;
- (void)setStartTimestamp:(id)a3;
- (void)setTreatmentId:(id)a3;
- (void)setUseCaseId:(id)a3;
- (void)setUseMinimalMap:(id)a3;
@end

@implementation AMDUseCaseWorkflow

- (AMDUseCaseWorkflow)initWithDictionary:(id)a3
{
  v54 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v54;
  v54 = 0;
  v52.receiver = v3;
  v52.super_class = (Class)AMDUseCaseWorkflow;
  v54 = [(AMDUseCaseWorkflow *)&v52 init];
  objc_storeStrong((id *)&v54, v54);
  id v24 = (id)[location[0] objectForKey:@"model_id"];
  -[AMDUseCaseWorkflow setModelId:](v54, "setModelId:");

  id v25 = (id)[location[0] objectForKey:@"secondary_model_id"];
  -[AMDUseCaseWorkflow setSecondaryModelId:](v54, "setSecondaryModelId:");

  id v26 = (id)[location[0] objectForKey:@"end_timestamp"];
  -[AMDUseCaseWorkflow setEndTimestamp:](v54, "setEndTimestamp:");

  id v27 = (id)[location[0] objectForKey:@"use_case_id"];
  -[AMDUseCaseWorkflow setUseCaseId:](v54, "setUseCaseId:");

  id v51 = (id)[location[0] objectForKey:@"input_definitions"];
  char v49 = 0;
  char v47 = 0;
  if (v51)
  {
    v22 = [AMDInputBuilder alloc];
    v50 = [(AMDUseCaseWorkflow *)v54 modelId];
    char v49 = 1;
    v48 = -[AMDInputBuilder initWithDictionary:andModelId:](v22, "initWithDictionary:andModelId:", v51);
    char v47 = 1;
    v23 = v48;
  }
  else
  {
    v23 = 0;
  }
  [(AMDUseCaseWorkflow *)v54 setInputBuilder:v23];
  if (v47) {

  }
  if (v49) {
  id v20 = (id)[location[0] objectForKey:@"max_items_to_display"];
  }
  -[AMDUseCaseWorkflow setMaxItemsToDisplay:](v54, "setMaxItemsToDisplay:");

  id v21 = (id)[location[0] objectForKey:@"model_format"];
  -[AMDUseCaseWorkflow setModelFormat:](v54, "setModelFormat:");

  -[AMDUseCaseWorkflow setColdstartModelId:](v54, "setColdstartModelId:");
  [(AMDUseCaseWorkflow *)v54 setUseMinimalMap:0];
  id v46 = (id)[location[0] objectForKey:@"resources"];
  if (v46 && [v46 count])
  {
    id v18 = (id)[v46 firstObject];
    char v44 = 0;
    char isKindOfClass = 0;
    if (v18)
    {
      id v45 = (id)[v46 firstObject];
      char v44 = 1;
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
    if (v44) {

    }
    if (isKindOfClass)
    {
      id v43 = (id)[v46 firstObject];
      id v16 = (id)[v43 objectForKey:@"coldstart_model_id"];
      -[AMDUseCaseWorkflow setColdstartModelId:](v54, "setColdstartModelId:");

      id v17 = (id)[v43 objectForKey:@"use_minimal_map"];
      -[AMDUseCaseWorkflow setUseMinimalMap:](v54, "setUseMinimalMap:");

      objc_storeStrong(&v43, 0);
    }
  }
  id v13 = (id)[location[0] objectForKey:@"rule_params"];
  -[AMDUseCaseWorkflow setRuleParams:](v54, "setRuleParams:");

  id v14 = (id)[location[0] objectForKey:@"start_timestamp"];
  -[AMDUseCaseWorkflow setStartTimestamp:](v54, "setStartTimestamp:");

  id v15 = (id)[location[0] objectForKey:@"treatment_id"];
  -[AMDUseCaseWorkflow setTreatmentId:](v54, "setTreatmentId:");

  id v42 = (id)[location[0] objectForKey:@"output_definitions"];
  char v40 = 0;
  char v38 = 0;
  if (v42)
  {
    v11 = [AMDOutputBuilder alloc];
    v41 = [(AMDUseCaseWorkflow *)v54 useCaseId];
    char v40 = 1;
    v39 = -[AMDOutputBuilder initWithDictionary:forUseCase:](v11, "initWithDictionary:forUseCase:", v42);
    char v38 = 1;
    v12 = v39;
  }
  else
  {
    v12 = 0;
  }
  [(AMDUseCaseWorkflow *)v54 setOutputBuilder:v12];
  if (v38) {

  }
  if (v40) {
  v10 = [(AMDUseCaseWorkflow *)v54 secondaryModelId];
  }

  if (v10)
  {
    id v37 = (id)[location[0] objectForKey:@"secondary_model_input_definitions"];
    char v35 = 0;
    char v33 = 0;
    if (v37)
    {
      v8 = [AMDInputBuilder alloc];
      v36 = [(AMDUseCaseWorkflow *)v54 secondaryModelId];
      char v35 = 1;
      v34 = -[AMDInputBuilder initWithDictionary:andModelId:](v8, "initWithDictionary:andModelId:", v37);
      char v33 = 1;
      v9 = v34;
    }
    else
    {
      v9 = 0;
    }
    [(AMDUseCaseWorkflow *)v54 setSecondaryModelInputBuilder:v9];
    if (v33) {

    }
    if (v35) {
    id v32 = (id)[location[0] objectForKey:@"secondary_model_output_definitions"];
    }
    char v30 = 0;
    char v28 = 0;
    if (v32)
    {
      v6 = [AMDOutputBuilder alloc];
      v31 = [(AMDUseCaseWorkflow *)v54 useCaseId];
      char v30 = 1;
      v29 = -[AMDOutputBuilder initWithDictionary:forUseCase:](v6, "initWithDictionary:forUseCase:", v32);
      char v28 = 1;
      v7 = v29;
    }
    else
    {
      v7 = 0;
    }
    [(AMDUseCaseWorkflow *)v54 setSecondaryModelOutputBuilder:v7];
    if (v28) {

    }
    if (v30) {
    objc_storeStrong(&v32, 0);
    }
    objc_storeStrong(&v37, 0);
  }
  v5 = v54;
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v46, 0);
  objc_storeStrong(&v51, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v54, 0);
  return v5;
}

- (id)getUseCaseId
{
  return [(AMDUseCaseWorkflow *)self useCaseId];
}

- (id)getModelId
{
  return [(AMDUseCaseWorkflow *)self modelId];
}

- (id)getColdstartModelId
{
  return [(AMDUseCaseWorkflow *)self coldstartModelId];
}

- (id)getModelFormat
{
  return [(AMDUseCaseWorkflow *)self modelFormat];
}

- (id)getTreatmentId
{
  return [(AMDUseCaseWorkflow *)self treatmentId];
}

- (id)getMaxItemsToDisplay
{
  return [(AMDUseCaseWorkflow *)self maxItemsToDisplay];
}

- (id)getOutputFeatureIds
{
  v3 = [(AMDUseCaseWorkflow *)self outputBuilder];
  id v4 = [(AMDOutputBuilder *)v3 getAllFeatureIds];

  return v4;
}

- (id)getPredictions:(unint64_t)a3 forDomain:(id)a4 error:(id *)a5
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  v71 = self;
  SEL v70 = a2;
  unint64_t v69 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  v67 = a5;
  if ([(AMDUseCaseWorkflow *)v71 isValid])
  {
    v39 = [(AMDUseCaseWorkflow *)v71 modelId];
    char v38 = [(AMDUseCaseWorkflow *)v71 useMinimalMap];
    id v62 = +[AMDBaseRecoModel getModelforId:useMinimalMap:error:](AMDBaseRecoModel, "getModelforId:useMinimalMap:error:", v39);

    if (*v67)
    {
      id v72 = 0;
      int v63 = 1;
    }
    else
    {
      id v61 = [(AMDUseCaseWorkflow *)v71 getColdstartModelId];
      unint64_t v34 = v69;
      char v35 = [(AMDUseCaseWorkflow *)v71 inputBuilder];
      v36 = [(AMDUseCaseWorkflow *)v71 outputBuilder];
      id v37 = [(AMDUseCaseWorkflow *)v71 secondaryModelId];
      if (v37) {
        id v33 = 0;
      }
      else {
        id v33 = v61;
      }
      id v60 = (id)[v62 getPredictions:v34 andInputBuilder:v35 andOutputBuilder:v36 withColdstartModelId:v33 error:v67];

      if (*v67)
      {
        char v30 = NSString;
        id v32 = [(AMDUseCaseWorkflow *)v71 modelId];
        id v31 = (id)[*v67 localizedDescription];
        id v59 = (id)[v30 stringWithFormat:@"Inference failed for model: %@ error: %@", v32, v31];

        id v58 = &_os_log_internal;
        os_log_type_t v57 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled((os_log_t)v58, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v77, (uint64_t)v59);
          _os_log_error_impl(&dword_20ABD4000, (os_log_t)v58, v57, "%@", v77, 0xCu);
        }
        objc_storeStrong(&v58, 0);
        +[AMDFrameworkMetrics log:v59 withKey:@"inferenceFailure" atVerbosity:0];
        id v72 = 0;
        int v63 = 1;
        objc_storeStrong(&v59, 0);
      }
      else if (v60)
      {
        id v26 = (id)[v62 modelMetadata];
        id v25 = (id)[v26 getModelUid];
        id v24 = [(AMDUseCaseWorkflow *)v71 modelId];
        +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v25);

        v5 = [(AMDUseCaseWorkflow *)v71 secondaryModelId];
        BOOL v27 = v5 != 0;

        if (v27)
        {
          id v53 = +[AMDFeatureProvider getProviderForSource:0x26BEB0F58 WithDomain:0];
          [v53 storeFeatureData:v60 error:v67];
          if (*v67)
          {
            os_log_t v52 = (os_log_t)&_os_log_internal;
            os_log_type_t v51 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            {
              id v21 = v52;
              os_log_type_t v22 = v51;
              id v23 = (id)[*v67 localizedDescription];
              id v50 = v23;
              __os_log_helper_16_2_1_8_64((uint64_t)v75, (uint64_t)v50);
              _os_log_error_impl(&dword_20ABD4000, v21, v22, "Intermediate output store failed. Error: %@", v75, 0xCu);

              objc_storeStrong(&v50, 0);
            }
            objc_storeStrong((id *)&v52, 0);
            id v72 = 0;
            int v63 = 1;
          }
          else
          {
            id v17 = [(AMDUseCaseWorkflow *)v71 secondaryModelId];
            id v16 = [(AMDUseCaseWorkflow *)v71 useMinimalMap];
            id v49 = +[AMDBaseRecoModel getModelforId:useMinimalMap:error:](AMDBaseRecoModel, "getModelforId:useMinimalMap:error:", v17);

            unint64_t v18 = v69;
            id v20 = [(AMDUseCaseWorkflow *)v71 secondaryModelInputBuilder];
            v19 = [(AMDUseCaseWorkflow *)v71 secondaryModelOutputBuilder];
            id v48 = (id)objc_msgSend(v49, "getPredictions:andInputBuilder:andOutputBuilder:withColdstartModelId:error:", v18, v20);

            if (*v67)
            {
              id v13 = NSString;
              id v15 = [(AMDUseCaseWorkflow *)v71 secondaryModelId];
              id v14 = (id)[*v67 localizedDescription];
              id v47 = (id)[v13 stringWithFormat:@"Inference failed for model: %@ error: %@", v15, v14];

              os_log_t v46 = (os_log_t)&_os_log_internal;
              os_log_type_t v45 = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
              {
                __os_log_helper_16_2_1_8_64((uint64_t)v74, (uint64_t)v47);
                _os_log_error_impl(&dword_20ABD4000, v46, v45, "%@", v74, 0xCu);
              }
              objc_storeStrong((id *)&v46, 0);
              +[AMDFrameworkMetrics log:v47 withKey:@"inferenceFailure" atVerbosity:0];
              id v72 = 0;
              int v63 = 1;
              objc_storeStrong(&v47, 0);
            }
            else if (v48)
            {
              id v10 = (id)[v49 modelMetadata];
              id v9 = (id)[v10 getModelUid];
              v8 = [(AMDUseCaseWorkflow *)v71 secondaryModelId];
              +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v9);

              id v72 = v48;
              int v63 = 1;
            }
            else
            {
              v11 = NSString;
              v12 = [(AMDUseCaseWorkflow *)v71 modelId];
              id v44 = (id)[v11 stringWithFormat:@"Inference failed for model: %@. Nil output", v12];

              os_log_t v43 = (os_log_t)&_os_log_internal;
              if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              {
                __os_log_helper_16_2_1_8_64((uint64_t)v73, (uint64_t)v44);
                _os_log_error_impl(&dword_20ABD4000, v43, OS_LOG_TYPE_ERROR, "%@", v73, 0xCu);
              }
              objc_storeStrong((id *)&v43, 0);
              +[AMDFrameworkMetrics log:v44 withKey:@"inferenceFailure" atVerbosity:0];
              id v72 = 0;
              int v63 = 1;
              objc_storeStrong(&v44, 0);
            }
            objc_storeStrong(&v48, 0);
            objc_storeStrong(&v49, 0);
          }
          objc_storeStrong(&v53, 0);
        }
        else
        {
          id v72 = v60;
          int v63 = 1;
        }
      }
      else
      {
        char v28 = NSString;
        v29 = [(AMDUseCaseWorkflow *)v71 modelId];
        id v56 = (id)[v28 stringWithFormat:@"Inference failed for model: %@. Nil output", v29];

        os_log_t oslog = (os_log_t)&_os_log_internal;
        os_log_type_t v54 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v76, (uint64_t)v56);
          _os_log_error_impl(&dword_20ABD4000, oslog, v54, "%@", v76, 0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
        +[AMDFrameworkMetrics log:v56 withKey:@"inferenceFailure" atVerbosity:0];
        id v72 = 0;
        int v63 = 1;
        objc_storeStrong(&v56, 0);
      }
      objc_storeStrong(&v60, 0);
      objc_storeStrong(&v61, 0);
    }
    objc_storeStrong(&v62, 0);
  }
  else
  {
    char v40 = NSString;
    v41 = [(AMDUseCaseWorkflow *)v71 useCaseId];
    id v66 = (id)[v40 stringWithFormat:@"Using unusable workflow for use case '%@'", v41];

    id v65 = &_os_log_internal;
    os_log_type_t v64 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v65, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v78, (uint64_t)v66);
      _os_log_error_impl(&dword_20ABD4000, (os_log_t)v65, v64, "%@", v78, 0xCu);
    }
    objc_storeStrong(&v65, 0);
    id *v67 = +[AMDError allocError:24 withMessage:v66];
    id v72 = 0;
    int v63 = 1;
    objc_storeStrong(&v66, 0);
  }
  objc_storeStrong(&location, 0);
  v6 = v72;

  return v6;
}

- (BOOL)isValid
{
  unint64_t v18 = [(AMDUseCaseWorkflow *)self useCaseId];
  char v26 = 0;
  BOOL v19 = 1;
  if (v18)
  {
    BOOL v27 = [(AMDUseCaseWorkflow *)self modelId];
    char v26 = 1;
    BOOL v19 = v27 == 0;
  }
  if (v26) {

  }
  if (v19) {
    return 0;
  }
  id v16 = [(AMDUseCaseWorkflow *)self useCaseId];
  BOOL v17 = [(NSString *)v16 isEqualToString:0x26BEB06F8];

  if (v17)
  {
    id v14 = [(AMDUseCaseWorkflow *)self ruleParams];
    char v24 = 0;
    BOOL v15 = 0;
    if (v14)
    {
      id v25 = [(AMDUseCaseWorkflow *)self ruleParams];
      char v24 = 1;
      BOOL v15 = [(NSDictionary *)v25 count] != 0;
    }
    BOOL v29 = v15;
    if (v24) {
  }
    }
  else
  {
    v12 = [(AMDUseCaseWorkflow *)self modelFormat];
    BOOL v13 = [(NSString *)v12 isEqualToString:0x26BEB36D8];

    if (v13)
    {
      return 1;
    }
    else
    {
      v2 = [(AMDUseCaseWorkflow *)self modelId];
      BOOL v8 = v2 != 0;

      v3 = [(AMDUseCaseWorkflow *)self maxItemsToDisplay];
      BOOL v9 = v3 != 0;

      id v10 = [(AMDUseCaseWorkflow *)self inputBuilder];
      char v22 = 0;
      BOOL v11 = 0;
      if (v10)
      {
        id v23 = [(AMDUseCaseWorkflow *)self inputBuilder];
        char v22 = 1;
        BOOL v11 = [(AMDInputBuilder *)v23 isValid];
      }
      if (v22) {

      }
      v6 = [(AMDUseCaseWorkflow *)self outputBuilder];
      char v20 = 0;
      BOOL v7 = 0;
      if (v6)
      {
        id v21 = [(AMDUseCaseWorkflow *)self outputBuilder];
        char v20 = 1;
        BOOL v7 = [(AMDOutputBuilder *)v21 isValid];
      }
      if (v20) {

      }
      BOOL v5 = 0;
      if (v8)
      {
        BOOL v5 = 0;
        if (v9)
        {
          BOOL v5 = 0;
          if (v11) {
            return v7;
          }
        }
      }
      return v5;
    }
  }
  return v29;
}

- (NSString)useCaseId
{
  return self->_useCaseId;
}

- (void)setUseCaseId:(id)a3
{
}

- (NSString)modelId
{
  return self->_modelId;
}

- (void)setModelId:(id)a3
{
}

- (NSString)coldstartModelId
{
  return self->_coldstartModelId;
}

- (void)setColdstartModelId:(id)a3
{
}

- (NSString)modelFormat
{
  return self->_modelFormat;
}

- (void)setModelFormat:(id)a3
{
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (void)setTreatmentId:(id)a3
{
}

- (NSNumber)maxItemsToDisplay
{
  return self->_maxItemsToDisplay;
}

- (void)setMaxItemsToDisplay:(id)a3
{
}

- (NSString)modelName
{
  return self->_modelName;
}

- (void)setModelName:(id)a3
{
}

- (AMDInputBuilder)inputBuilder
{
  return self->_inputBuilder;
}

- (void)setInputBuilder:(id)a3
{
}

- (AMDOutputBuilder)outputBuilder
{
  return self->_outputBuilder;
}

- (void)setOutputBuilder:(id)a3
{
}

- (NSNumber)startTimestamp
{
  return self->_startTimestamp;
}

- (void)setStartTimestamp:(id)a3
{
}

- (NSNumber)endTimestamp
{
  return self->_endTimestamp;
}

- (void)setEndTimestamp:(id)a3
{
}

- (NSDictionary)ruleParams
{
  return self->_ruleParams;
}

- (void)setRuleParams:(id)a3
{
}

- (NSString)secondaryModelId
{
  return self->_secondaryModelId;
}

- (void)setSecondaryModelId:(id)a3
{
}

- (AMDInputBuilder)secondaryModelInputBuilder
{
  return self->_secondaryModelInputBuilder;
}

- (void)setSecondaryModelInputBuilder:(id)a3
{
}

- (AMDOutputBuilder)secondaryModelOutputBuilder
{
  return self->_secondaryModelOutputBuilder;
}

- (void)setSecondaryModelOutputBuilder:(id)a3
{
}

- (NSNumber)useMinimalMap
{
  return self->_useMinimalMap;
}

- (void)setUseMinimalMap:(id)a3
{
}

- (void).cxx_destruct
{
}

@end