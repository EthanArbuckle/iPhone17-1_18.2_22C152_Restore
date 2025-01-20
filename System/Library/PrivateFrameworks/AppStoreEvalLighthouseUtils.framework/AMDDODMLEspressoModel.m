@interface AMDDODMLEspressoModel
- (AMDDODMLEspressoModel)initWithModelMetadata:(id)a3 withAttachmentProcessor:(id)a4 error:(id *)a5 errorDomain:(id)a6;
- (id)_flattenedWeightsBeforeTraining;
- (id)createBufferDictionary:(id)a3;
- (id)finishInitializeManually:(id *)a3 errorDomain:(id)a4;
- (id)getNewDeltasContainer:(id)a3 withError:(id *)a4 errorDomain:(id)a5;
- (id)trainOnData:(id)a3 numLocalIterations:(int64_t)a4 error:(id *)a5 errorDomain:(id)a6;
- (int64_t)_bindBuffers:(id *)a3 errorDomain:(id)a4;
- (int64_t)_buildPlan:(id *)a3 errorDomain:(id)a4;
- (int64_t)initializeManually:(id *)a3 errorDomain:(id)a4;
- (void)dealloc;
@end

@implementation AMDDODMLEspressoModel

- (AMDDODMLEspressoModel)initWithModelMetadata:(id)a3 withAttachmentProcessor:(id)a4 error:(id *)a5 errorDomain:(id)a6
{
  id v58 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v56 = 0;
  objc_storeStrong(&v56, a4);
  v55 = a5;
  id v54 = 0;
  objc_storeStrong(&v54, a6);
  id v6 = v58;
  id v58 = 0;
  v53.receiver = v6;
  v53.super_class = (Class)AMDDODMLEspressoModel;
  v52 = [(AMDDODMLEspressoModel *)&v53 init];
  id v58 = v52;
  objc_storeStrong(&v58, v52);
  if (!v52)
  {
    v59 = 0;
    goto LABEL_15;
  }
  id v7 = (id)[location[0] modelPath];
  v8 = (void *)*((void *)v58 + 1);
  *((void *)v58 + 1) = v7;

  uint64_t v9 = [location[0] batchSize];
  *((void *)v58 + 7) = v9;
  id v10 = (id)[location[0] inputNames];
  v11 = (void *)*((void *)v58 + 2);
  *((void *)v58 + 2) = v10;

  id v12 = (id)[location[0] weightNames];
  v13 = (void *)*((void *)v58 + 5);
  *((void *)v58 + 5) = v12;

  id v14 = (id)[v58 createBufferDictionary:*((void *)v58 + 2)];
  v15 = (void *)*((void *)v58 + 3);
  *((void *)v58 + 3) = v14;

  id v47 = v58;
  id v48 = (id)[location[0] outputNames];
  id v16 = (id)objc_msgSend(v47, "createBufferDictionary:");
  v17 = (void *)*((void *)v58 + 4);
  *((void *)v58 + 4) = v16;

  id v18 = (id)[v58 createBufferDictionary:*((void *)v58 + 5)];
  v19 = (void *)*((void *)v58 + 6);
  *((void *)v58 + 6) = v18;

  id v20 = (id)[location[0] learningRate];
  v21 = (void *)*((void *)v58 + 8);
  *((void *)v58 + 8) = v20;

  id v22 = (id)[location[0] trainingModeBufferName];
  v23 = (void *)*((void *)v58 + 14);
  *((void *)v58 + 14) = v22;

  id v24 = (id)[location[0] learningRateBufferName];
  v25 = (void *)*((void *)v58 + 36);
  *((void *)v58 + 36) = v24;

  id v26 = (id)[location[0] lossName];
  v27 = (void *)*((void *)v58 + 58);
  *((void *)v58 + 58) = v26;

  id v28 = (id)[location[0] metricsNames];
  v29 = (void *)*((void *)v58 + 9);
  *((void *)v58 + 9) = v28;

  id v30 = (id)[location[0] shortenedEmbeddingNames];
  v31 = (void *)*((void *)v58 + 59);
  *((void *)v58 + 59) = v30;

  id v32 = (id)[location[0] shortenedEmbeddingMappingKeys];
  v33 = (void *)*((void *)v58 + 63);
  *((void *)v58 + 63) = v32;

  id v34 = (id)[location[0] shortenedEmbeddingNumberVectorsBefore];
  v35 = (void *)*((void *)v58 + 60);
  *((void *)v58 + 60) = v34;

  id v36 = (id)[location[0] shortenedEmbeddingNumberVectorsAfter];
  v37 = (void *)*((void *)v58 + 61);
  *((void *)v58 + 61) = v36;

  id v38 = (id)[location[0] shortenedEmbeddingSize];
  v39 = (void *)*((void *)v58 + 62);
  *((void *)v58 + 62) = v38;

  objc_storeStrong((id *)v58 + 64, v56);
  id v40 = (id)[location[0] initializeManually];
  v41 = (void *)*((void *)v58 + 65);
  *((void *)v58 + 65) = v40;

  if ([v58 _buildPlan:v55 errorDomain:v54])
  {
    if ([v58 _bindBuffers:v55 errorDomain:v54])
    {
      if ([*((id *)v58 + 65) longValue])
      {
        if (![v58 initializeManually:v55 errorDomain:v54])
        {
          v59 = 0;
          goto LABEL_15;
        }
      }
      else
      {
        id v45 = (id)[location[0] initializationFunctionName];
        [v45 UTF8String];
        uint64_t v46 = (int)espresso_network_set_function_name();

        if (v46 || espresso_plan_execute_sync())
        {
          id v42 = objc_alloc(MEMORY[0x263F087E8]);
          id v43 = (id)[v42 initWithDomain:v54 code:77 userInfo:0];
          id *v55 = v43;
          v59 = 0;
          goto LABEL_15;
        }
      }
      v59 = (AMDDODMLEspressoModel *)v58;
      goto LABEL_15;
    }
    v59 = 0;
  }
  else
  {
    v59 = 0;
  }
LABEL_15:
  objc_storeStrong(&v54, 0);
  objc_storeStrong(&v56, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v58, 0);
  return v59;
}

- (id)createBufferDictionary:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = (id)[MEMORY[0x263EFF9A0] dictionary];
  memset(__b, 0, sizeof(__b));
  id obj = location[0];
  uint64_t v10 = [obj countByEnumeratingWithState:__b objects:v17 count:16];
  if (v10)
  {
    uint64_t v6 = *(void *)__b[2];
    uint64_t v7 = 0;
    unint64_t v8 = v10;
    while (1)
    {
      uint64_t v5 = v7;
      if (*(void *)__b[2] != v6) {
        objc_enumerationMutation(obj);
      }
      uint64_t v14 = *(void *)(__b[1] + 8 * v7);
      memset(v12, 0, sizeof(v12));
      id v11 = (id)[MEMORY[0x263EFF990] dataWithBytes:v12 length:168];
      [v15 setObject:v11 forKey:v14];
      objc_storeStrong(&v11, 0);
      ++v7;
      if (v5 + 1 >= v8)
      {
        uint64_t v7 = 0;
        unint64_t v8 = [obj countByEnumeratingWithState:__b objects:v17 count:16];
        if (!v8) {
          break;
        }
      }
    }
  }

  id v4 = v15;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (int64_t)_buildPlan:(id *)a3 errorDomain:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v29 = self;
  SEL v28 = a2;
  v27 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  v29->_ctx = (void *)espresso_create_context();
  if (v29->_ctx)
  {
    v29->_plan = (void *)espresso_create_plan();
    if (v29->_plan)
    {
      uint64_t v24 = 0;
      [(NSString *)v29->_modelPath UTF8String];
      int v8 = espresso_plan_add_network();
      uint64_t v24 = v8;
      if (v8)
      {
        id v9 = objc_alloc(MEMORY[0x263F087E8]);
        id v10 = (id)[v9 initWithDomain:location code:67 userInfo:0];
        id *v27 = v10;
        int64_t v30 = 0;
        int v25 = 1;
      }
      else
      {
        memset(__b, 0, sizeof(__b));
        id obj = v29->_outputNameBufferMap;
        uint64_t v21 = [(NSDictionary *)obj countByEnumeratingWithState:__b objects:v31 count:16];
        if (v21)
        {
          uint64_t v17 = *(void *)__b[2];
          uint64_t v18 = 0;
          unint64_t v19 = v21;
          while (1)
          {
            uint64_t v16 = v18;
            if (*(void *)__b[2] != v17) {
              objc_enumerationMutation(obj);
            }
            id v23 = *(id *)(__b[1] + 8 * v18);
            [v23 UTF8String];
            if (espresso_network_declare_output()) {
              break;
            }
            ++v18;
            if (v16 + 1 >= v19)
            {
              uint64_t v18 = 0;
              unint64_t v19 = [(NSDictionary *)obj countByEnumeratingWithState:__b objects:v31 count:16];
              if (!v19) {
                goto LABEL_15;
              }
            }
          }
          id v11 = objc_alloc(MEMORY[0x263F087E8]);
          id v12 = (id)[v11 initWithDomain:location code:70 userInfo:0];
          id *v27 = v12;
          int64_t v30 = 0;
          int v25 = 1;
        }
        else
        {
LABEL_15:
          int v25 = 0;
        }

        if (!v25)
        {
          if (espresso_plan_build())
          {
            id v13 = objc_alloc(MEMORY[0x263F087E8]);
            id v14 = (id)[v13 initWithDomain:location code:71 userInfo:0];
            id *v27 = v14;
            int64_t v30 = 0;
          }
          else
          {
            int64_t v30 = 1;
          }
          int v25 = 1;
        }
      }
    }
    else
    {
      id v6 = objc_alloc(MEMORY[0x263F087E8]);
      id v7 = (id)[v6 initWithDomain:location code:69 userInfo:0];
      id *v27 = v7;
      int64_t v30 = 0;
      int v25 = 1;
    }
  }
  else
  {
    id v4 = objc_alloc(MEMORY[0x263F087E8]);
    id v5 = (id)[v4 initWithDomain:location code:68 userInfo:0];
    id *v27 = v5;
    int64_t v30 = 0;
    int v25 = 1;
  }
  objc_storeStrong(&location, 0);
  return v30;
}

- (int64_t)_bindBuffers:(id *)a3 errorDomain:(id)a4
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  v55 = self;
  SEL v54 = a2;
  objc_super v53 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  memset(__b, 0, sizeof(__b));
  id obj = v55->_inputNameBufferMap;
  uint64_t v37 = [(NSDictionary *)obj countByEnumeratingWithState:__b objects:v59 count:16];
  if (v37)
  {
    uint64_t v33 = *(void *)__b[2];
    uint64_t v34 = 0;
    unint64_t v35 = v37;
    while (1)
    {
      uint64_t v32 = v34;
      if (*(void *)__b[2] != v33) {
        objc_enumerationMutation(obj);
      }
      id v51 = *(id *)(__b[1] + 8 * v34);
      id v49 = [(NSDictionary *)v55->_inputNameBufferMap objectForKeyedSubscript:v51];
      [v51 UTF8String];
      [v49 mutableBytes];
      int v4 = espresso_network_bind_buffer();
      uint64_t v48 = v4;
      if (v4)
      {
        id v5 = objc_alloc(MEMORY[0x263F087E8]);
        id v6 = (id)[v5 initWithDomain:location code:72 userInfo:0];
        *objc_super v53 = v6;
        int64_t v56 = 0;
        int v47 = 1;
      }
      else
      {
        int v47 = 0;
      }
      objc_storeStrong(&v49, 0);
      if (v47) {
        break;
      }
      ++v34;
      if (v32 + 1 >= v35)
      {
        uint64_t v34 = 0;
        unint64_t v35 = [(NSDictionary *)obj countByEnumeratingWithState:__b objects:v59 count:16];
        if (!v35) {
          goto LABEL_11;
        }
      }
    }
  }
  else
  {
LABEL_11:
    int v47 = 0;
  }

  if (!v47)
  {
    memset(v45, 0, sizeof(v45));
    int64_t v30 = v55->_outputNameBufferMap;
    uint64_t v31 = [(NSDictionary *)v30 countByEnumeratingWithState:v45 objects:v58 count:16];
    if (v31)
    {
      uint64_t v27 = *(void *)v45[2];
      uint64_t v28 = 0;
      unint64_t v29 = v31;
      while (1)
      {
        uint64_t v26 = v28;
        if (*(void *)v45[2] != v27) {
          objc_enumerationMutation(v30);
        }
        id v46 = *(id *)(v45[1] + 8 * v28);
        id v44 = [(NSDictionary *)v55->_outputNameBufferMap objectForKeyedSubscript:v46];
        [v46 UTF8String];
        [v44 mutableBytes];
        int v7 = espresso_network_bind_buffer();
        uint64_t v43 = v7;
        if (v7)
        {
          id v8 = objc_alloc(MEMORY[0x263F087E8]);
          id v9 = (id)[v8 initWithDomain:location code:73 userInfo:0];
          *objc_super v53 = v9;
          int64_t v56 = 0;
          int v47 = 1;
        }
        else
        {
          int v47 = 0;
        }
        objc_storeStrong(&v44, 0);
        if (v47) {
          break;
        }
        ++v28;
        if (v26 + 1 >= v29)
        {
          uint64_t v28 = 0;
          unint64_t v29 = [(NSDictionary *)v30 countByEnumeratingWithState:v45 objects:v58 count:16];
          if (!v29) {
            goto LABEL_23;
          }
        }
      }
    }
    else
    {
LABEL_23:
      int v47 = 0;
    }

    if (!v47)
    {
      uint64_t v42 = 0;
      [(NSString *)v55->_trainingModeBufferName UTF8String];
      int v10 = espresso_network_bind_buffer_to_global();
      uint64_t v42 = v10;
      if (v10)
      {
        id v11 = objc_alloc(MEMORY[0x263F087E8]);
        id v12 = (id)[v11 initWithDomain:location code:75 userInfo:0];
        *objc_super v53 = v12;
        int64_t v56 = 0;
        int v47 = 1;
        goto LABEL_45;
      }
      uint64_t v41 = 0;
      [(NSString *)v55->_learningRateBufferName UTF8String];
      int v13 = espresso_network_bind_buffer_to_global();
      uint64_t v41 = v13;
      if (v13)
      {
        id v14 = objc_alloc(MEMORY[0x263F087E8]);
        id v15 = (id)[v14 initWithDomain:location code:76 userInfo:0];
        *objc_super v53 = v15;
        int64_t v56 = 0;
        int v47 = 1;
        goto LABEL_45;
      }
      *(float *)v55->_bufIsTraining.data = 1.0;
      [(NSNumber *)v55->_learningRate floatValue];
      *(_DWORD *)v55->_bufLR.data = v16;
      memset(v39, 0, sizeof(v39));
      uint64_t v24 = v55->_weightNameBufferMap;
      uint64_t v25 = [(NSDictionary *)v24 countByEnumeratingWithState:v39 objects:v57 count:16];
      if (v25)
      {
        uint64_t v21 = *(void *)v39[2];
        uint64_t v22 = 0;
        unint64_t v23 = v25;
        while (1)
        {
          uint64_t v20 = v22;
          if (*(void *)v39[2] != v21) {
            objc_enumerationMutation(v24);
          }
          id v40 = *(id *)(v39[1] + 8 * v22);
          id v38 = [(NSDictionary *)v55->_weightNameBufferMap objectForKeyedSubscript:v40];
          if ([(NSNumber *)v55->_initializeManually longValue])
          {
            [v40 UTF8String];
            [v38 mutableBytes];
            if (!espresso_network_bind_buffer_to_global())
            {
LABEL_38:
              int v47 = 0;
              goto LABEL_39;
            }
          }
          else
          {
            [v40 UTF8String];
            [v38 mutableBytes];
            if (!espresso_network_bind_buffer_to_global()) {
              goto LABEL_38;
            }
          }
          id v17 = objc_alloc(MEMORY[0x263F087E8]);
          id v18 = (id)[v17 initWithDomain:location code:74 userInfo:0];
          *objc_super v53 = v18;
          int64_t v56 = 0;
          int v47 = 1;
LABEL_39:
          objc_storeStrong(&v38, 0);
          if (v47) {
            goto LABEL_43;
          }
          ++v22;
          if (v20 + 1 >= v23)
          {
            uint64_t v22 = 0;
            unint64_t v23 = [(NSDictionary *)v24 countByEnumeratingWithState:v39 objects:v57 count:16];
            if (!v23) {
              break;
            }
          }
        }
      }
      int v47 = 0;
LABEL_43:

      if (!v47)
      {
        int64_t v56 = 1;
        int v47 = 1;
      }
    }
  }
LABEL_45:
  objc_storeStrong(&location, 0);
  return v56;
}

- (id)_flattenedWeightsBeforeTraining
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v15 = self;
  v14[1] = (id)a2;
  v14[0] = objc_alloc_init(MEMORY[0x263EFF990]);
  memset(__b, 0, sizeof(__b));
  id obj = v15->_weightNames;
  uint64_t v9 = [(NSArray *)obj countByEnumeratingWithState:__b objects:v16 count:16];
  if (v9)
  {
    uint64_t v5 = *(void *)__b[2];
    uint64_t v6 = 0;
    unint64_t v7 = v9;
    while (1)
    {
      uint64_t v4 = v6;
      if (*(void *)__b[2] != v5) {
        objc_enumerationMutation(obj);
      }
      uint64_t v13 = *(void *)(__b[1] + 8 * v6);
      id v11 = [(NSDictionary *)v15->_weightNameBufferMap objectForKeyedSubscript:v13];
      memset(v10, 0, sizeof(v10));
      [v11 getBytes:v10 length:168];
      [v14[0] appendBytes:v10[0] length:4 * v10[2] * v10[3] * v10[4] * v10[5]];
      objc_storeStrong(&v11, 0);
      ++v6;
      if (v4 + 1 >= v7)
      {
        uint64_t v6 = 0;
        unint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:__b objects:v16 count:16];
        if (!v7) {
          break;
        }
      }
    }
  }

  id v3 = v14[0];
  objc_storeStrong(v14, 0);
  return v3;
}

- (id)trainOnData:(id)a3 numLocalIterations:(int64_t)a4 error:(id *)a5 errorDomain:(id)a6
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  v75 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v73 = a4;
  v72 = a5;
  id v71 = 0;
  objc_storeStrong(&v71, a6);
  get_main_function_name();
  int v6 = espresso_network_set_function_name();
  uint64_t v70 = v6;
  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x263F087E8]);
    id v8 = (id)[v7 initWithDomain:v71 code:75 userInfo:0];
    id *v72 = v8;
    id v76 = 0;
    int v69 = 1;
  }
  else
  {
    id v68 = [(AMDDODMLEspressoModel *)v75 _flattenedWeightsBeforeTraining];
    id v67 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:");
    id v66 = (id)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:0];
    for (int64_t i = 0; i < v73; ++i)
    {
      id v64 = (id)[location[0] bindDataToInputsDirectly:v75->_inputNameBufferMap batchSize:v75->_batchSize error:v72 errorDomain:v71];
      if (v64)
      {
        uint64_t v63 = 0;
        int v9 = espresso_plan_execute_sync();
        uint64_t v63 = v9;
        if (v9)
        {
          id v10 = objc_alloc(MEMORY[0x263F087E8]);
          id v11 = (id)[v10 initWithDomain:v71 code:79 userInfo:0];
          id *v72 = v11;
          id v76 = 0;
          int v69 = 1;
        }
        else
        {
          v62 = 0;
          id v32 = [(NSDictionary *)v75->_outputNameBufferMap objectForKeyedSubscript:v75->_lossName];
          uint64_t v33 = (float **)[v32 mutableBytes];

          v62 = v33;
          float v61 = 0.0;
          float v61 = **v33;
          id v34 = v67;
          id v35 = (id)[NSNumber numberWithFloat:COERCE_DOUBLE((unint64_t)LODWORD(v61))];
          objc_msgSend(v34, "addObject:");

          NSLog(&cfstr_Loss4f.isa, v61);
          memset(__b, 0, sizeof(__b));
          id v36 = v75->_metricNames;
          uint64_t v37 = [(NSArray *)v36 countByEnumeratingWithState:__b objects:v86 count:16];
          if (v37)
          {
            uint64_t v29 = *(void *)__b[2];
            uint64_t v30 = 0;
            unint64_t v31 = v37;
            while (1)
            {
              uint64_t v28 = v30;
              if (*(void *)__b[2] != v29) {
                objc_enumerationMutation(v36);
              }
              uint64_t v60 = *(void *)(__b[1] + 8 * v30);
              id v58 = 0;
              id v26 = [(NSDictionary *)v75->_outputNameBufferMap objectForKeyedSubscript:v60];
              uint64_t v27 = (int **)[v26 mutableBytes];

              id v58 = v27;
              int v57 = 0;
              int v57 = **v27;
              id v56 = (id)[v66 valueForKey:v60];
              if (!v56)
              {
                uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:0];
                id v14 = v56;
                id v56 = v13;

                [v66 setValue:v56 forKey:v60];
              }
              id v24 = v56;
              LODWORD(v12) = v57;
              id v25 = (id)[NSNumber numberWithFloat:v12];
              objc_msgSend(v24, "addObject:");

              objc_storeStrong(&v56, 0);
              ++v30;
              if (v28 + 1 >= v31)
              {
                uint64_t v30 = 0;
                unint64_t v31 = [(NSArray *)v36 countByEnumeratingWithState:__b objects:v86 count:16];
                if (!v31) {
                  break;
                }
              }
            }
          }

          if (!i && [(NSNumber *)v75->_initializeManually longValue] == 1) {
            id v15 = [(AMDDODMLEspressoModel *)v75 finishInitializeManually:v72 errorDomain:v71];
          }
          int v69 = 0;
        }
      }
      else
      {
        id v76 = 0;
        int v69 = 1;
      }
      objc_storeStrong(&v64, 0);
      if (v69) {
        goto LABEL_38;
      }
    }
    int v55 = 0;
    memset(v53, 0, sizeof(v53));
    uint64_t v22 = v75->_weightNames;
    uint64_t v23 = [(NSArray *)v22 countByEnumeratingWithState:v53 objects:v85 count:16];
    if (v23)
    {
      uint64_t v19 = *(void *)v53[2];
      uint64_t v20 = 0;
      unint64_t v21 = v23;
      while (1)
      {
        uint64_t v18 = v20;
        if (*(void *)v53[2] != v19) {
          objc_enumerationMutation(v22);
        }
        uint64_t v54 = *(void *)(v53[1] + 8 * v20);
        id v52 = [(NSDictionary *)v75->_weightNameBufferMap objectForKeyedSubscript:v54];
        memset(v51, 0, sizeof(v51));
        [v52 getBytes:v51 length:168];
        unint64_t v50 = v51[2] * v51[3] * v51[4] * v51[5];
        float v49 = 0.0;
        float v48 = 0.0;
        for (int j = 0; j < v50; ++j)
        {
          uint64_t v82 = v55;
          uint64_t v81 = 4;
          uint64_t v83 = v55;
          uint64_t v84 = 4;
          uint64_t v45 = v55;
          uint64_t v46 = 4;
          objc_msgSend(v68, "getBytes:range:", &v49, v55, 4);
          float v48 = *(float *)(v51[0] + 4 * j);
          float v44 = v48 - v49;
          uint64_t v78 = v55;
          uint64_t v77 = 4;
          uint64_t v79 = v55;
          uint64_t v80 = 4;
          v43[1] = (id)v55;
          v43[2] = (id)4;
          objc_msgSend(v68, "replaceBytesInRange:withBytes:", v55, 4, &v44);
          v55 += 4;
        }
        objc_storeStrong(&v52, 0);
        ++v20;
        if (v18 + 1 >= v21)
        {
          uint64_t v20 = 0;
          unint64_t v21 = [(NSArray *)v22 countByEnumeratingWithState:v53 objects:v85 count:16];
          if (!v21) {
            break;
          }
        }
      }
    }

    if ([(NSNumber *)v75->_initializeManually longValue])
    {
      id v42 = [(AMDDODMLEspressoModel *)v75 getNewDeltasContainer:v68 withError:v72 errorDomain:v71];
      if (v42)
      {
        id v41 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        [v41 setObject:v42 forKey:ModelDeltas];
        [v41 setObject:v75->_weightNames forKey:WeightNamesKeyInResponse];
        [v41 setObject:v67 forKey:LossesKeyInResponse];
        [v41 setObject:v66 forKey:ModelMetrics];
        id v76 = v41;
        int v69 = 1;
        objc_storeStrong(&v41, 0);
      }
      else
      {
        id v76 = 0;
        int v69 = 1;
      }
      objc_storeStrong(&v42, 0);
    }
    else
    {
      v43[0] = (id)[MEMORY[0x263EFF9A0] dictionary];
      [v43[0] setObject:v68 forKey:ModelDeltas];
      [v43[0] setObject:v75->_weightNames forKey:WeightNamesKeyInResponse];
      [v43[0] setObject:v67 forKey:LossesKeyInResponse];
      [v43[0] setObject:v66 forKey:ModelMetrics];
      id v76 = v43[0];
      int v69 = 1;
      objc_storeStrong(v43, 0);
    }
LABEL_38:
    objc_storeStrong(&v66, 0);
    objc_storeStrong(&v67, 0);
    objc_storeStrong(&v68, 0);
  }
  objc_storeStrong(&v71, 0);
  objc_storeStrong(location, 0);
  int v16 = v76;
  return v16;
}

- (int64_t)initializeManually:(id *)a3 errorDomain:(id)a4
{
  uint64_t v125 = *MEMORY[0x263EF8340];
  v112 = self;
  SEL v111 = a2;
  v110 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  if (v112->_attachmentProcessor)
  {
    id v107 = [(AMDDODMLAttachmentProcessor *)v112->_attachmentProcessor weightsArray];
    if (v107)
    {
      uint64_t v106 = 0;
      memset(__b, 0, sizeof(__b));
      id obj = v112->_weightNames;
      uint64_t v65 = [(NSArray *)obj countByEnumeratingWithState:__b objects:v124 count:16];
      if (v65)
      {
        uint64_t v61 = *(void *)__b[2];
        uint64_t v62 = 0;
        unint64_t v63 = v65;
        while (1)
        {
          uint64_t v60 = v62;
          if (*(void *)__b[2] != v61) {
            objc_enumerationMutation(obj);
          }
          uint64_t v105 = *(void *)(__b[1] + 8 * v62);
          id v59 = [(NSDictionary *)v112->_shortenedEmbeddingNames objectForKey:v105];

          if (v59)
          {
            id v103 = [(NSDictionary *)v112->_shortenedEmbeddingSize objectForKey:v105];
            id v102 = [(NSDictionary *)v112->_shortenedEmbeddingNumberVectorsBefore objectForKey:v105];
            id v101 = [(NSDictionary *)v112->_shortenedEmbeddingNumberVectorsAfter objectForKey:v105];
            id v100 = [(NSDictionary *)v112->_shortenedEmbeddingMappingKeys objectForKey:v105];
            if (v103 && v102 && v101 && v100)
            {
              uint64_t v58 = [v103 longValue];
              uint64_t v10 = [v102 longValue];
              v106 += v58 * v10;
              id v99 = [(AMDDODMLAttachmentProcessor *)v112->_attachmentProcessor hashMapForKey:v100];
              if (v99)
              {
                unint64_t v57 = [v99 count];
                if (v57 <= [v101 longValue])
                {
                  int v108 = 0;
                }
                else
                {
                  id v13 = objc_alloc(MEMORY[0x263F087E8]);
                  id v14 = (id)[v13 initWithDomain:location code:119 userInfo:0];
                  id *v110 = v14;
                  int64_t v113 = 0;
                  int v108 = 1;
                }
              }
              else
              {
                id v11 = objc_alloc(MEMORY[0x263F087E8]);
                id v12 = (id)[v11 initWithDomain:location code:118 userInfo:0];
                id *v110 = v12;
                int64_t v113 = 0;
                int v108 = 1;
              }
              objc_storeStrong(&v99, 0);
            }
            else
            {
              id v8 = objc_alloc(MEMORY[0x263F087E8]);
              id v9 = (id)[v8 initWithDomain:location code:117 userInfo:0];
              id *v110 = v9;
              int64_t v113 = 0;
              int v108 = 1;
            }
            objc_storeStrong(&v100, 0);
            objc_storeStrong(&v101, 0);
            objc_storeStrong(&v102, 0);
            objc_storeStrong(&v103, 0);
            if (v108) {
              goto LABEL_27;
            }
          }
          else
          {
            id v98 = [(NSDictionary *)v112->_weightNameBufferMap objectForKeyedSubscript:v105];
            memset(v97, 0, sizeof(v97));
            [v98 getBytes:v97 length:168];
            uint64_t v96 = v97[2] * v97[3] * v97[4] * v97[5];
            v106 += v96;
            objc_storeStrong(&v98, 0);
          }
          ++v62;
          if (v60 + 1 >= v63)
          {
            uint64_t v62 = 0;
            unint64_t v63 = [(NSArray *)obj countByEnumeratingWithState:__b objects:v124 count:16];
            if (!v63) {
              break;
            }
          }
        }
      }
      int v108 = 0;
LABEL_27:

      if (!v108)
      {
        unint64_t v15 = [v107 length];
        if (v15 / 4 == v106)
        {
          uint64_t v95 = 0;
          memset(v93, 0, sizeof(v93));
          int v55 = v112->_weightNames;
          uint64_t v56 = [(NSArray *)v55 countByEnumeratingWithState:v93 objects:v123 count:16];
          if (v56)
          {
            uint64_t v52 = *(void *)v93[2];
            uint64_t v53 = 0;
            unint64_t v54 = v56;
            while (1)
            {
              uint64_t v51 = v53;
              if (*(void *)v93[2] != v52) {
                objc_enumerationMutation(v55);
              }
              uint64_t v94 = *(void *)(v93[1] + 8 * v53);
              id v50 = [(NSDictionary *)v112->_shortenedEmbeddingNames objectForKey:v94];

              if (v50)
              {
                id v92 = [(NSDictionary *)v112->_shortenedEmbeddingSize objectForKey:v94];
                id v91 = [(NSDictionary *)v112->_shortenedEmbeddingNumberVectorsBefore objectForKey:v94];
                id v90 = [(NSDictionary *)v112->_shortenedEmbeddingNumberVectorsAfter objectForKey:v94];
                id v89 = [(NSDictionary *)v112->_shortenedEmbeddingMappingKeys objectForKey:v94];
                if (v92 && v91 && v90 && v89)
                {
                  id v88 = [(AMDDODMLAttachmentProcessor *)v112->_attachmentProcessor hashMapForKey:v89];
                  if (v88)
                  {
                    id v87 = objc_alloc_init(MEMORY[0x263EFF9A0]);
                    memset(v85, 0, sizeof(v85));
                    id v48 = v88;
                    uint64_t v49 = [v48 countByEnumeratingWithState:v85 objects:v122 count:16];
                    if (v49)
                    {
                      uint64_t v45 = *(void *)v85[2];
                      uint64_t v46 = 0;
                      unint64_t v47 = v49;
                      while (1)
                      {
                        uint64_t v44 = v46;
                        if (*(void *)v85[2] != v45) {
                          objc_enumerationMutation(v48);
                        }
                        uint64_t v86 = *(void *)(v85[1] + 8 * v46);
                        id v42 = v87;
                        uint64_t v41 = v86;
                        id v43 = (id)[v88 objectForKey:v86];
                        objc_msgSend(v42, "setObject:forKey:", v41);

                        ++v46;
                        if (v44 + 1 >= v47)
                        {
                          uint64_t v46 = 0;
                          unint64_t v47 = [v48 countByEnumeratingWithState:v85 objects:v122 count:16];
                          if (!v47) {
                            break;
                          }
                        }
                      }
                    }

                    id v84 = [(NSDictionary *)v112->_weightNameBufferMap objectForKeyedSubscript:v94];
                    memset(v83, 0, sizeof(v83));
                    [v84 getBytes:v83 length:168];
                    uint64_t v82 = v83[2];
                    uint64_t v81 = v83[3];
                    uint64_t v22 = [v92 longValue];
                    if (v22 == v82 && (uint64_t v23 = [v90 longValue], v23 == v81))
                    {
                      uint64_t v80 = v83[0];
                      for (unsigned int i = 0; ; ++i)
                      {
                        uint64_t v40 = (int)i;
                        if (v40 >= [v90 longValue]) {
                          break;
                        }
                        id v38 = v87;
                        id v39 = (id)[NSNumber numberWithInt:i];
                        id v78 = (id)objc_msgSend(v38, "objectForKey:");

                        if (v78)
                        {
                          for (int j = 0; ; ++j)
                          {
                            uint64_t v37 = j;
                            if (v37 >= [v92 longValue]) {
                              break;
                            }
                            uint64_t v76 = 0;
                            uint64_t v34 = (int)i;
                            uint64_t v26 = [v92 longValue];
                            uint64_t v76 = v34 * v26 + j;
                            uint64_t v75 = 0;
                            uint64_t v35 = v95;
                            uint64_t v36 = [v78 longValue];
                            uint64_t v27 = [v92 longValue];
                            uint64_t v75 = v35 + v36 * v27 + j;
                            uint64_t v119 = 4 * v75;
                            uint64_t v118 = 4;
                            uint64_t v120 = 4 * v75;
                            uint64_t v121 = 4;
                            uint64_t v73 = 4 * v75;
                            uint64_t v74 = 4;
                            objc_msgSend(v107, "getBytes:range:", v80 + 4 * v76, 4 * v75, 4);
                          }
                        }
                        else
                        {
                          for (int k = 0; ; ++k)
                          {
                            uint64_t v33 = k;
                            if (v33 >= [v92 longValue]) {
                              break;
                            }
                            uint64_t v71 = 0;
                            uint64_t v32 = (int)i;
                            uint64_t v28 = [v92 longValue];
                            uint64_t v71 = v32 * v28 + k;
                            *(_DWORD *)(v80 + 4 * v71) = 0;
                          }
                        }
                        objc_storeStrong(&v78, 0);
                      }
                      uint64_t v31 = [v91 longValue];
                      uint64_t v29 = [v92 longValue];
                      v95 += v31 * v29;
                      int v108 = 0;
                    }
                    else
                    {
                      id v24 = objc_alloc(MEMORY[0x263F087E8]);
                      id v25 = (id)[v24 initWithDomain:location code:121 userInfo:0];
                      id *v110 = v25;
                      int64_t v113 = 0;
                      int v108 = 1;
                    }
                    objc_storeStrong(&v84, 0);
                    objc_storeStrong(&v87, 0);
                  }
                  else
                  {
                    id v20 = objc_alloc(MEMORY[0x263F087E8]);
                    id v21 = (id)[v20 initWithDomain:location code:118 userInfo:0];
                    id *v110 = v21;
                    int64_t v113 = 0;
                    int v108 = 1;
                  }
                  objc_storeStrong(&v88, 0);
                }
                else
                {
                  id v18 = objc_alloc(MEMORY[0x263F087E8]);
                  id v19 = (id)[v18 initWithDomain:location code:117 userInfo:0];
                  id *v110 = v19;
                  int64_t v113 = 0;
                  int v108 = 1;
                }
                objc_storeStrong(&v89, 0);
                objc_storeStrong(&v90, 0);
                objc_storeStrong(&v91, 0);
                objc_storeStrong(&v92, 0);
                if (v108) {
                  goto LABEL_74;
                }
              }
              else
              {
                id v70 = [(NSDictionary *)v112->_weightNameBufferMap objectForKeyedSubscript:v94];
                memset(v69, 0, sizeof(v69));
                [v70 getBytes:v69 length:168];
                unint64_t v68 = v69[2] * v69[3] * v69[4] * v69[5];
                for (int m = 0; m < v68; ++m)
                {
                  int v66 = 0;
                  uint64_t v115 = 4 * (v95 + m);
                  uint64_t v114 = 4;
                  uint64_t v116 = v115;
                  uint64_t v117 = 4;
                  objc_msgSend(v107, "getBytes:range:", &v66, v115, 4);
                  *(_DWORD *)(v69[0] + 4 * m) = v66;
                }
                v95 += v68;
                objc_storeStrong(&v70, 0);
              }
              ++v53;
              if (v51 + 1 >= v54)
              {
                uint64_t v53 = 0;
                unint64_t v54 = [(NSArray *)v55 countByEnumeratingWithState:v93 objects:v123 count:16];
                if (!v54) {
                  break;
                }
              }
            }
          }
          int v108 = 0;
LABEL_74:

          if (!v108)
          {
            int64_t v113 = 1;
            int v108 = 1;
          }
        }
        else
        {
          id v16 = objc_alloc(MEMORY[0x263F087E8]);
          id v17 = (id)[v16 initWithDomain:location code:120 userInfo:0];
          id *v110 = v17;
          int64_t v113 = 0;
          int v108 = 1;
        }
      }
    }
    else
    {
      id v6 = objc_alloc(MEMORY[0x263F087E8]);
      id v7 = (id)[v6 initWithDomain:location code:116 userInfo:0];
      id *v110 = v7;
      int64_t v113 = 0;
      int v108 = 1;
    }
    objc_storeStrong(&v107, 0);
  }
  else
  {
    id v4 = objc_alloc(MEMORY[0x263F087E8]);
    id v5 = (id)[v4 initWithDomain:location code:116 userInfo:0];
    id *v110 = v5;
    int64_t v113 = 0;
    int v108 = 1;
  }
  objc_storeStrong(&location, 0);
  return v113;
}

- (id)finishInitializeManually:(id *)a3 errorDomain:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v25 = self;
  SEL v24 = a2;
  uint64_t v23 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  memset(__b, 0, sizeof(__b));
  id obj = v25->_weightNameBufferMap;
  uint64_t v16 = [(NSDictionary *)obj countByEnumeratingWithState:__b objects:v27 count:16];
  if (v16)
  {
    uint64_t v12 = *(void *)__b[2];
    uint64_t v13 = 0;
    unint64_t v14 = v16;
    while (1)
    {
      uint64_t v11 = v13;
      if (*(void *)__b[2] != v12) {
        objc_enumerationMutation(obj);
      }
      id v21 = *(id *)(__b[1] + 8 * v13);
      uint64_t v19 = 0;
      [v21 UTF8String];
      int v4 = espresso_network_unbind_buffer_to_global();
      uint64_t v19 = v4;
      if (v4) {
        break;
      }
      id v17 = [(NSDictionary *)v25->_weightNameBufferMap objectForKeyedSubscript:v21];
      [v21 UTF8String];
      [v17 mutableBytes];
      if (espresso_network_bind_buffer_to_global())
      {
        id v7 = objc_alloc(MEMORY[0x263F087E8]);
        id v8 = (id)[v7 initWithDomain:location code:74 userInfo:0];
        id *v23 = v8;
        id v26 = 0;
        int v18 = 1;
      }
      else
      {
        int v18 = 0;
      }
      objc_storeStrong(&v17, 0);
      if (v18) {
        goto LABEL_14;
      }
      ++v13;
      if (v11 + 1 >= v14)
      {
        uint64_t v13 = 0;
        unint64_t v14 = [(NSDictionary *)obj countByEnumeratingWithState:__b objects:v27 count:16];
        if (!v14) {
          goto LABEL_13;
        }
      }
    }
    id v5 = objc_alloc(MEMORY[0x263F087E8]);
    id v6 = (id)[v5 initWithDomain:location code:74 userInfo:0];
    id *v23 = v6;
    id v26 = 0;
    int v18 = 1;
  }
  else
  {
LABEL_13:
    int v18 = 0;
  }
LABEL_14:

  if (!v18)
  {
    id v26 = (id)[NSNumber numberWithLong:1];
    int v18 = 1;
  }
  objc_storeStrong(&location, 0);
  id v9 = v26;
  return v9;
}

- (id)getNewDeltasContainer:(id)a3 withError:(id *)a4 errorDomain:(id)a5
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  unint64_t v57 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int v55 = a4;
  id v54 = 0;
  objc_storeStrong(&v54, a5);
  id v53 = objc_alloc_init(MEMORY[0x263EFF990]);
  uint64_t v52 = 0;
  memset(__b, 0, sizeof(__b));
  uint64_t v28 = v57->_weightNames;
  uint64_t v29 = [(NSArray *)v28 countByEnumeratingWithState:__b objects:v67 count:16];
  if (v29)
  {
    uint64_t v23 = *(void *)__b[2];
    uint64_t v24 = 0;
    unint64_t v25 = v29;
    while (1)
    {
      uint64_t v22 = v24;
      if (*(void *)__b[2] != v23) {
        objc_enumerationMutation(v28);
      }
      uint64_t v51 = *(void *)(__b[1] + 8 * v24);
      id v21 = [(NSDictionary *)v57->_shortenedEmbeddingNames objectForKey:v51];

      if (v21)
      {
        id v49 = [(NSDictionary *)v57->_shortenedEmbeddingSize objectForKey:v51];
        id v48 = [(NSDictionary *)v57->_shortenedEmbeddingNumberVectorsBefore objectForKey:v51];
        id v47 = [(NSDictionary *)v57->_shortenedEmbeddingNumberVectorsAfter objectForKey:v51];
        id v46 = [(NSDictionary *)v57->_shortenedEmbeddingMappingKeys objectForKey:v51];
        if (v49 && v48 && v47 && v46)
        {
          id v44 = [(AMDDODMLAttachmentProcessor *)v57->_attachmentProcessor hashMapForKey:v46];
          if (v44)
          {
            for (uint64_t i = 0; ; ++i)
            {
              uint64_t v20 = i;
              if (v20 >= [v48 longValue]) {
                break;
              }
              id v18 = v44;
              id v19 = (id)[NSNumber numberWithLong:i];
              id v42 = (id)objc_msgSend(v18, "objectForKey:");

              if (v42)
              {
                for (uint64_t j = 0; ; ++j)
                {
                  uint64_t v17 = j;
                  if (v17 >= [v49 longValue]) {
                    break;
                  }
                  uint64_t v40 = 0;
                  uint64_t v15 = v52;
                  uint64_t v16 = [v42 longValue];
                  uint64_t v9 = [v49 longValue];
                  uint64_t v40 = v15 + 4 * v16 * v9 + 4 * j;
                  int v39 = 0;
                  uint64_t v64 = v40;
                  uint64_t v63 = 4;
                  uint64_t v65 = v40;
                  uint64_t v66 = 4;
                  uint64_t v37 = v40;
                  uint64_t v38 = 4;
                  objc_msgSend(location[0], "getBytes:range:");
                  [v53 appendBytes:&v39 length:4];
                }
              }
              else
              {
                for (uint64_t k = 0; ; ++k)
                {
                  uint64_t v14 = k;
                  if (v14 >= [v49 longValue]) {
                    break;
                  }
                  int v35 = 0;
                  [v53 appendBytes:&v35 length:4];
                }
              }
              objc_storeStrong(&v42, 0);
            }
            uint64_t v13 = [v49 longValue];
            uint64_t v10 = [v47 longValue];
            v52 += 4 * v13 * v10;
            int v45 = 0;
          }
          else
          {
            id v7 = objc_alloc(MEMORY[0x263F087E8]);
            id v8 = (id)[v7 initWithDomain:v54 code:124 userInfo:0];
            id *v55 = v8;
            id v58 = 0;
            int v45 = 1;
          }
          objc_storeStrong(&v44, 0);
        }
        else
        {
          id v5 = objc_alloc(MEMORY[0x263F087E8]);
          id v6 = (id)[v5 initWithDomain:v54 code:123 userInfo:0];
          id *v55 = v6;
          id v58 = 0;
          int v45 = 1;
        }
        objc_storeStrong(&v46, 0);
        objc_storeStrong(&v47, 0);
        objc_storeStrong(&v48, 0);
        objc_storeStrong(&v49, 0);
        if (v45) {
          goto LABEL_35;
        }
      }
      else
      {
        id v34 = [(NSDictionary *)v57->_weightNameBufferMap objectForKeyedSubscript:v51];
        memset(v33, 0, sizeof(v33));
        [v34 getBytes:v33 length:168];
        unint64_t v32 = v33[2] * v33[3] * v33[4] * v33[5];
        for (unint64_t m = 0; m < v32; ++m)
        {
          int v30 = 0;
          uint64_t v60 = v52;
          uint64_t v59 = 4;
          uint64_t v61 = v52;
          uint64_t v62 = 4;
          objc_msgSend(location[0], "getBytes:range:");
          [v53 appendBytes:&v30 length:4];
          v52 += 4;
        }
        objc_storeStrong(&v34, 0);
      }
      ++v24;
      if (v22 + 1 >= v25)
      {
        uint64_t v24 = 0;
        unint64_t v25 = [(NSArray *)v28 countByEnumeratingWithState:__b objects:v67 count:16];
        if (!v25) {
          break;
        }
      }
    }
  }
  int v45 = 0;
LABEL_35:

  if (!v45)
  {
    id v58 = v53;
    int v45 = 1;
  }
  objc_storeStrong(&v53, 0);
  objc_storeStrong(&v54, 0);
  objc_storeStrong(location, 0);
  uint64_t v11 = v58;
  return v11;
}

- (void)dealloc
{
  id v6 = self;
  SEL v5 = a2;
  if (self->_plan)
  {
    uint64_t v4 = (int)espresso_plan_destroy();
    uint64_t v3 = (int)espresso_context_destroy();
  }
  v2.receiver = v6;
  v2.super_class = (Class)AMDDODMLEspressoModel;
  [(AMDDODMLEspressoModel *)&v2 dealloc];
}

- (void).cxx_destruct
{
}

@end