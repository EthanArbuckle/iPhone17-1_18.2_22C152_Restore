@interface AMDOutputBuilder
- (AMDOutputBuilder)initWithDictionary:(id)a3 forUseCase:(id)a4;
- (BOOL)isValid;
- (NSMutableDictionary)outputDefinitions;
- (NSString)useCaseId;
- (id)convertMultiArray:(id)a3 withShape:(id)a4 atDepth:(unsigned int)a5 withKey:(id)a6 withScoreThreshold:(double)a7 error:(id *)a8;
- (id)createHeapOfType:(int64_t)a3 withCapacity:(unint64_t)a4;
- (id)generateMappingDictionary:(id)a3;
- (id)getAllFeatureIds;
- (id)getOutputfor:(id)a3 FromMLProvider:(id)a4 andModelAssets:(id)a5 withColdstartModelId:(id)a6 topN:(unint64_t)a7 error:(id *)a8;
- (id)getPredictions:(unint64_t)a3 fromMLProvider:(id)a4 andModelAssets:(id)a5 withColdstartModelId:(id)a6 error:(id *)a7;
- (id)getRemapDictFor:(id)a3 withModelAssets:(id)a4;
- (id)getTopN:(unint64_t)a3 idsAndScoresFrom:(id)a4 withMappingDictionary:(id)a5 withType:(int64_t)a6;
- (id)mapInferenceOutputsToIds:(id)a3 withRemapData:(id)a4 error:(id *)a5;
- (id)postProcessInferenceOutput:(id)a3 withOperations:(id)a4 error:(id *)a5;
- (id)process2DMultiArray:(id)a3 shapeLength:(unsigned int)a4 withDataType:(int64_t)a5 withOutputDefinition:(id)a6 andModelAssets:(id)a7 withColdstartModelId:(id)a8 idsOnly:(BOOL)a9 inferenceMode:(id)a10 error:(id *)a11;
- (id)processArrayOutput:(id)a3 withDataType:(int64_t)a4 withOutputDefinition:(id)a5 andModelAssets:(id)a6 withColdstartModelId:(id)a7 idsOnly:(BOOL)a8 error:(id *)a9;
- (id)processMultiArrayModelOutput:(id)a3 withOutputDefinition:(id)a4 FromMLProvider:(id)a5 andModelAssets:(id)a6 withColdstartModelId:(id)a7 withTopN:(unint64_t)a8 error:(id *)a9;
- (void)setOutputDefinitions:(id)a3;
- (void)setUseCaseId:(id)a3;
@end

@implementation AMDOutputBuilder

- (AMDOutputBuilder)initWithDictionary:(id)a3 forUseCase:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v22 = 0;
  objc_storeStrong(&v22, a4);
  v4 = v24;
  v24 = 0;
  v21.receiver = v4;
  v21.super_class = (Class)AMDOutputBuilder;
  v24 = [(AMDOutputBuilder *)&v21 init];
  objc_storeStrong((id *)&v24, v24);
  [(AMDOutputBuilder *)v24 setUseCaseId:v22];
  id v14 = (id)objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(location[0], "count"));
  -[AMDOutputBuilder setOutputDefinitions:](v24, "setOutputDefinitions:");

  memset(__b, 0, sizeof(__b));
  id v15 = location[0];
  uint64_t v16 = [v15 countByEnumeratingWithState:__b objects:v25 count:16];
  if (v16)
  {
    uint64_t v10 = *(void *)__b[2];
    uint64_t v11 = 0;
    unint64_t v12 = v16;
    while (1)
    {
      uint64_t v9 = v11;
      if (*(void *)__b[2] != v10) {
        objc_enumerationMutation(v15);
      }
      uint64_t v20 = *(void *)(__b[1] + 8 * v11);
      id v18 = (id)[location[0] objectForKey:v20];
      v5 = [OutputDefinition alloc];
      id v17 = [(OutputDefinition *)v5 initWithOutputDefinitionDictionary:v18];
      if ([v17 isValid])
      {
        v8 = [(AMDOutputBuilder *)v24 outputDefinitions];
        [(NSMutableDictionary *)v8 setObject:v17 forKey:v20];
      }
      objc_storeStrong(&v17, 0);
      objc_storeStrong(&v18, 0);
      ++v11;
      if (v9 + 1 >= v12)
      {
        uint64_t v11 = 0;
        unint64_t v12 = [v15 countByEnumeratingWithState:__b objects:v25 count:16];
        if (!v12) {
          break;
        }
      }
    }
  }

  v7 = v24;
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v24, 0);
  return v7;
}

- (BOOL)isValid
{
  v3 = [(AMDOutputBuilder *)self outputDefinitions];
  char v5 = 0;
  BOOL v4 = 0;
  if (v3)
  {
    v6 = [(AMDOutputBuilder *)self outputDefinitions];
    char v5 = 1;
    BOOL v4 = [(NSMutableDictionary *)v6 count] != 0;
  }
  if (v5) {

  }
  return v4;
}

- (id)getAllFeatureIds
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  v35 = self;
  v34[1] = (id)a2;
  v34[0] = objc_alloc_init(MEMORY[0x263EFF9C0]);
  memset(__b, 0, sizeof(__b));
  obj = [(AMDOutputBuilder *)v35 outputDefinitions];
  uint64_t v21 = [(NSMutableDictionary *)obj countByEnumeratingWithState:__b objects:v38 count:16];
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
      uint64_t v33 = *(void *)(__b[1] + 8 * v18);
      id v14 = [(AMDOutputBuilder *)v35 outputDefinitions];
      id v31 = (id)[(NSMutableDictionary *)v14 objectForKey:v33];

      id v2 = (id)[v31 modifiers];
      BOOL v15 = v2 != 0;

      if (v15)
      {
        memset(v28, 0, sizeof(v28));
        id v12 = (id)[v31 modifiers];
        uint64_t v13 = [v12 countByEnumeratingWithState:v28 objects:v37 count:16];
        if (v13)
        {
          uint64_t v9 = *(void *)v28[2];
          uint64_t v10 = 0;
          unint64_t v11 = v13;
          while (1)
          {
            uint64_t v8 = v10;
            if (*(void *)v28[2] != v9) {
              objc_enumerationMutation(v12);
            }
            id v29 = *(id *)(v28[1] + 8 * v10);
            id v27 = (id)[v29 objectForKey:@"feature_ids"];
            id location = (id)[v29 objectForKey:@"js_method_name"];
            if (location)
            {
              if (v27)
              {
                [v34[0] addObjectsFromArray:v27];
                int v30 = 0;
              }
              else
              {
                os_log_t v22 = (os_log_t)&_os_log_internal;
                if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                {
                  char v5 = v22;
                  __os_log_helper_16_2_1_8_64((uint64_t)v36, (uint64_t)location);
                  _os_log_error_impl(&dword_20ABD4000, v5, OS_LOG_TYPE_ERROR, "Nil feature ids provided for js method: %@", v36, 0xCu);
                }
                objc_storeStrong((id *)&v22, 0);
                int v30 = 5;
              }
            }
            else
            {
              os_log_t oslog = (os_log_t)&_os_log_internal;
              os_log_type_t type = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
              {
                log = oslog;
                os_log_type_t v7 = type;
                __os_log_helper_16_0_0(v23);
                _os_log_error_impl(&dword_20ABD4000, log, v7, "Nil js feature name provided in modifier", v23, 2u);
              }
              objc_storeStrong((id *)&oslog, 0);
              int v30 = 5;
            }
            objc_storeStrong(&location, 0);
            objc_storeStrong(&v27, 0);
            ++v10;
            if (v8 + 1 >= v11)
            {
              uint64_t v10 = 0;
              unint64_t v11 = [v12 countByEnumeratingWithState:v28 objects:v37 count:16];
              if (!v11) {
                break;
              }
            }
          }
        }

        int v30 = 0;
      }
      else
      {
        int v30 = 3;
      }
      objc_storeStrong(&v31, 0);
      ++v18;
      if (v16 + 1 >= v19)
      {
        uint64_t v18 = 0;
        unint64_t v19 = [(NSMutableDictionary *)obj countByEnumeratingWithState:__b objects:v38 count:16];
        if (!v19) {
          break;
        }
      }
    }
  }

  id v4 = v34[0];
  int v30 = 1;
  objc_storeStrong(v34, 0);

  return v4;
}

- (id)getPredictions:(unint64_t)a3 fromMLProvider:(id)a4 andModelAssets:(id)a5 withColdstartModelId:(id)a6 error:(id *)a7
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  v44 = self;
  SEL v43 = a2;
  unint64_t v42 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v40 = 0;
  objc_storeStrong(&v40, a5);
  id v39 = 0;
  objc_storeStrong(&v39, a6);
  v38 = a7;
  if ([(AMDOutputBuilder *)v44 isValid])
  {
    os_log_t v22 = (void *)MEMORY[0x263EFF9A0];
    v23 = [(AMDOutputBuilder *)v44 outputDefinitions];
    id v36 = (id)objc_msgSend(v22, "dictionaryWithCapacity:", -[NSMutableDictionary count](v23, "count"));

    memset(__b, 0, sizeof(__b));
    v24 = [(AMDOutputBuilder *)v44 outputDefinitions];
    uint64_t v25 = [(NSMutableDictionary *)v24 countByEnumeratingWithState:__b objects:v46 count:16];
    if (v25)
    {
      uint64_t v19 = *(void *)__b[2];
      uint64_t v20 = 0;
      unint64_t v21 = v25;
      while (1)
      {
        uint64_t v18 = v20;
        if (*(void *)__b[2] != v19) {
          objc_enumerationMutation(v24);
        }
        uint64_t v35 = *(void *)(__b[1] + 8 * v20);
        uint64_t v17 = [(AMDOutputBuilder *)v44 outputDefinitions];
        id v33 = (id)[(NSMutableDictionary *)v17 objectForKey:v35];

        id v32 = [(AMDOutputBuilder *)v44 getOutputfor:v33 FromMLProvider:location andModelAssets:v40 withColdstartModelId:v39 topN:v42 error:v38];
        if (*v38)
        {
          id v45 = 0;
          int v37 = 1;
        }
        else
        {
          id v15 = (id)[v33 nativePostprocessingOperations];
          BOOL v16 = 0;
          if (v15) {
            BOOL v16 = v32 != 0;
          }

          if (!v16) {
            goto LABEL_36;
          }
          uint64_t v13 = v44;
          id v12 = v32;
          id v14 = (id)[v33 nativePostprocessingOperations];
          id v7 = -[AMDOutputBuilder postProcessInferenceOutput:withOperations:error:](v13, "postProcessInferenceOutput:withOperations:error:", v12);
          id v8 = v32;
          id v32 = v7;

          if (*v38)
          {
            id v45 = 0;
            int v37 = 1;
          }
          else
          {
LABEL_36:
            if (v32 && !*v38) {
              [v36 setObject:v32 forKey:v35];
            }
            int v37 = 0;
          }
        }
        objc_storeStrong(&v32, 0);
        objc_storeStrong(&v33, 0);
        if (v37) {
          break;
        }
        ++v20;
        if (v18 + 1 >= v21)
        {
          uint64_t v20 = 0;
          unint64_t v21 = [(NSMutableDictionary *)v24 countByEnumeratingWithState:__b objects:v46 count:16];
          if (!v21) {
            goto LABEL_21;
          }
        }
      }
    }
    else
    {
LABEL_21:
      int v37 = 0;
    }

    if (!v37)
    {
      id v31 = +[AMDFeatureProvider getProviderForSource:0x26BEB0F78 WithDomain:0];
      unint64_t v11 = [(AMDOutputBuilder *)v44 useCaseId];
      id v30 = (id)objc_msgSend(v31, "fetchOutputRemapDictForUsecase:");

      if (v30)
      {
        id v29 = [(AMDOutputBuilder *)v44 mapInferenceOutputsToIds:v36 withRemapData:v30 error:v38];
        if (*v38) {
          id v45 = 0;
        }
        else {
          id v45 = v29;
        }
        int v37 = 1;
        objc_storeStrong(&v29, 0);
      }
      else
      {
        id v45 = v36;
        int v37 = 1;
      }
      objc_storeStrong(&v30, 0);
      objc_storeStrong(&v31, 0);
    }
    objc_storeStrong(&v36, 0);
  }
  else
  {
    id v45 = 0;
    int v37 = 1;
  }
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&location, 0);
  uint64_t v9 = v45;

  return v9;
}

- (id)postProcessInferenceOutput:(id)a3 withOperations:(id)a4 error:(id *)a5
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v42 = 0;
  objc_storeStrong(&v42, a4);
  v41 = a5;
  memset(__b, 0, sizeof(__b));
  id v27 = v42;
  uint64_t v28 = [v27 countByEnumeratingWithState:__b objects:v52 count:16];
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
      id v40 = *(id *)(__b[1] + 8 * v23);
      id v38 = (id)[v40 objectForKey:@"operation"];
      if (v38)
      {
        if ([v38 isEqualToString:@"vectorSearch"])
        {
          id v36 = (id)[v40 objectForKey:@"dbName"];
          if (v36)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v35 = location[0];
              id v19 = (id)[v35 firstObject];
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();

              if ((isKindOfClass & 1) == 0)
              {
                id v8 = +[AMDMiscHelpers logAndCreateError:16 errorMessage:@"vector search can only be applied for post-processing on batched inputs"];
                id *v41 = v8;
              }
              id v34 = objc_alloc_init(MEMORY[0x263EFF980]);
              memset(v32, 0, sizeof(v32));
              id v17 = v35;
              uint64_t v18 = [v17 countByEnumeratingWithState:v32 objects:v51 count:16];
              if (v18)
              {
                uint64_t v14 = *(void *)v32[2];
                uint64_t v15 = 0;
                unint64_t v16 = v18;
                while (1)
                {
                  uint64_t v13 = v15;
                  if (*(void *)v32[2] != v14) {
                    objc_enumerationMutation(v17);
                  }
                  uint64_t v33 = *(void *)(v32[1] + 8 * v15);
                  v49 = @"queryVector";
                  uint64_t v50 = v33;
                  id v31 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v50, &v49);
                  v47[0] = @"vectorDBConfig";
                  id v45 = @"dbName";
                  id v46 = v36;
                  id v12 = (id)[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
                  v48[0] = v12;
                  v47[1] = @"queryDict";
                  v48[1] = v31;
                  id v30 = (id)[NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:2];

                  id v29 = +[AMDVectorDBManager runVectorDBSearchWithSearchPayload:v30 error:v41];
                  if (*v41)
                  {
                    id v44 = 0;
                    int v37 = 1;
                  }
                  else
                  {
                    [v34 addObject:v29];
                    int v37 = 0;
                  }
                  objc_storeStrong(&v29, 0);
                  objc_storeStrong(&v30, 0);
                  objc_storeStrong(&v31, 0);
                  if (v37) {
                    break;
                  }
                  ++v15;
                  if (v13 + 1 >= v16)
                  {
                    uint64_t v15 = 0;
                    unint64_t v16 = [v17 countByEnumeratingWithState:v32 objects:v51 count:16];
                    if (!v16) {
                      goto LABEL_24;
                    }
                  }
                }
              }
              else
              {
LABEL_24:
                int v37 = 0;
              }

              if (!v37)
              {
                objc_storeStrong(location, v34);
                int v37 = 0;
              }
              objc_storeStrong(&v34, 0);
              objc_storeStrong(&v35, 0);
            }
            else
            {
              id v7 = +[AMDMiscHelpers logAndCreateError:16 errorMessage:@"vector search can only run on model outputs of type array"];
              id *v41 = v7;
              id v44 = 0;
              int v37 = 1;
            }
          }
          else
          {
            id v6 = +[AMDMiscHelpers logAndCreateError:16 errorMessage:@"dbName missing in post processing config for vector search"];
            id *v41 = v6;
            id v44 = 0;
            int v37 = 1;
          }
          objc_storeStrong(&v36, 0);
          if (!v37) {
            int v37 = 0;
          }
        }
        else
        {
          id v9 = +[AMDMiscHelpers logAndCreateError:16 errorMessage:@"Unrecognized operation passed for inference post processing. vectorSearch is the only supported operation."];
          id *v41 = v9;
          id v44 = 0;
          int v37 = 1;
        }
      }
      else
      {
        id v5 = +[AMDMiscHelpers logAndCreateError:16 errorMessage:@"Operation key missing in inference post processing config"];
        id *v41 = v5;
        id v44 = 0;
        int v37 = 1;
      }
      objc_storeStrong(&v38, 0);
      if (v37) {
        break;
      }
      ++v23;
      if (v21 + 1 >= v24)
      {
        uint64_t v23 = 0;
        unint64_t v24 = [v27 countByEnumeratingWithState:__b objects:v52 count:16];
        if (!v24) {
          goto LABEL_34;
        }
      }
    }
  }
  else
  {
LABEL_34:
    int v37 = 0;
  }

  if (!v37)
  {
    id v44 = location[0];
    int v37 = 1;
  }
  objc_storeStrong(&v42, 0);
  objc_storeStrong(location, 0);
  uint64_t v10 = v44;

  return v10;
}

- (id)mapInferenceOutputsToIds:(id)a3 withRemapData:(id)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v30 = 0;
  objc_storeStrong(&v30, a4);
  id v29 = a5;
  id v28 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  memset(__b, 0, sizeof(__b));
  id v15 = location[0];
  uint64_t v16 = [v15 countByEnumeratingWithState:__b objects:v33 count:16];
  if (v16)
  {
    uint64_t v10 = *(void *)__b[2];
    uint64_t v11 = 0;
    unint64_t v12 = v16;
    while (1)
    {
      uint64_t v9 = v11;
      if (*(void *)__b[2] != v10) {
        objc_enumerationMutation(v15);
      }
      uint64_t v27 = *(void *)(__b[1] + 8 * v11);
      id v25 = (id)[location[0] objectForKey:v27];
      id v24 = (id)[v30 objectForKey:v27];
      if (v24)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v21 = v25;
          id v20 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          for (int i = 0; ; ++i)
          {
            unint64_t v8 = i;
            if (v8 >= [v24 count]) {
              break;
            }
            id v18 = (id)[v21 objectAtIndex:i];
            id v17 = (id)[v24 objectAtIndex:i];
            [v20 setObject:v18 forKey:v17];
            objc_storeStrong(&v17, 0);
            objc_storeStrong(&v18, 0);
          }
          [v28 setObject:v20 forKey:v27];
          objc_storeStrong(&v20, 0);
          objc_storeStrong(&v21, 0);
          int v23 = 0;
        }
        else
        {
          id v22 = (id)[NSString stringWithFormat:@"Output mapping is only supported for arrays"];
          id v5 = +[AMDError allocError:16 withMessage:v22];
          *id v29 = v5;
          id v32 = 0;
          int v23 = 1;
          objc_storeStrong(&v22, 0);
        }
      }
      else
      {
        [v28 setObject:v25 forKey:v27];
        int v23 = 3;
      }
      objc_storeStrong(&v24, 0);
      objc_storeStrong(&v25, 0);
      if (v23)
      {
        if (v23 != 3) {
          break;
        }
      }
      ++v11;
      if (v9 + 1 >= v12)
      {
        uint64_t v11 = 0;
        unint64_t v12 = [v15 countByEnumeratingWithState:__b objects:v33 count:16];
        if (!v12) {
          goto LABEL_17;
        }
      }
    }
  }
  else
  {
LABEL_17:
    int v23 = 0;
  }

  if (!v23)
  {
    id v32 = v28;
    int v23 = 1;
  }
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
  id v6 = v32;

  return v6;
}

- (id)getOutputfor:(id)a3 FromMLProvider:(id)a4 andModelAssets:(id)a5 withColdstartModelId:(id)a6 topN:(unint64_t)a7 error:(id *)a8
{
  int v37 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v35 = 0;
  objc_storeStrong(&v35, a4);
  id v34 = 0;
  objc_storeStrong(&v34, a5);
  id v33 = 0;
  objc_storeStrong(&v33, a6);
  unint64_t v32 = a7;
  id v31 = a8;
  id v25 = v35;
  id v26 = (id)[location[0] modelOutputName];
  id v30 = (id)objc_msgSend(v25, "featureValueForName:");

  if (v30)
  {
    unint64_t v9 = [v30 type];
    if (v9 <= 1)
    {
      unint64_t v11 = v9 - 1;
      char v10 = 0;
    }
    else
    {
      unint64_t v11 = v9 - 1;
      char v10 = 1;
    }
    if ((v10 & 1) == 0)
    {
      switch(v11)
      {
        case 0uLL:
          id v38 = (id)objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v30, "int64Value"));
          int v28 = 1;
          goto LABEL_14;
        case 1uLL:
          id v17 = NSNumber;
          [v30 doubleValue];
          id v38 = (id)objc_msgSend(v17, "numberWithDouble:");
          int v28 = 1;
          goto LABEL_14;
        case 2uLL:
          id v38 = (id)[v30 stringValue];
          int v28 = 1;
          goto LABEL_14;
        case 3uLL:
          break;
        case 4uLL:
          id v15 = v37;
          id v16 = (id)[v30 multiArrayValue];
          id v38 = -[AMDOutputBuilder processMultiArrayModelOutput:withOutputDefinition:FromMLProvider:andModelAssets:withColdstartModelId:withTopN:error:](v15, "processMultiArrayModelOutput:withOutputDefinition:FromMLProvider:andModelAssets:withColdstartModelId:withTopN:error:", v31);

          int v28 = 1;
          goto LABEL_14;
        case 5uLL:
          id v38 = (id)[v30 dictionaryValue];
          int v28 = 1;
          goto LABEL_14;
        default:
          JUMPOUT(0);
      }
    }
    id v27 = (id)[NSString stringWithFormat:@"Invalid output type specified for the model"];
    id v12 = +[AMDError allocError:16 withMessage:v27];
    *id v31 = v12;
    id v38 = 0;
    int v28 = 1;
    objc_storeStrong(&v27, 0);
  }
  else
  {
    id v18 = NSString;
    id v19 = (id)[location[0] modelOutputName];
    id v29 = (id)[v18 stringWithFormat:@"Nil model output obtained for: %@", v19];

    id v8 = +[AMDError allocError:15 withMessage:v29];
    *id v31 = v8;
    id v38 = 0;
    int v28 = 1;
    objc_storeStrong(&v29, 0);
  }
LABEL_14:
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(location, 0);
  uint64_t v13 = v38;

  return v13;
}

- (id)processMultiArrayModelOutput:(id)a3 withOutputDefinition:(id)a4 FromMLProvider:(id)a5 andModelAssets:(id)a6 withColdstartModelId:(id)a7 withTopN:(unint64_t)a8 error:(id *)a9
{
  id v46 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v44 = 0;
  objc_storeStrong(&v44, a4);
  id v43 = 0;
  objc_storeStrong(&v43, a5);
  id v42 = 0;
  objc_storeStrong(&v42, a6);
  id v41 = 0;
  objc_storeStrong(&v41, a7);
  unint64_t v40 = a8;
  id v39 = a9;
  double v38 = 0.0;
  id v9 = (id)[v44 scoreThresholdAsMultipleOfRandomScore];
  BOOL v32 = v9 == 0;

  if (!v32)
  {
    id v26 = (id)[v44 scoreThresholdAsMultipleOfRandomScore];
    [v26 doubleValue];
    double v38 = v10;
  }
  id v37 = (id)[location[0] shape];
  id v24 = v46;
  id v23 = location[0];
  id v25 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v36 = -[AMDOutputBuilder convertMultiArray:withShape:atDepth:withKey:withScoreThreshold:error:](v24, "convertMultiArray:withShape:atDepth:withKey:withScoreThreshold:error:", v23, v37, 0, v38);

  id v35 = (id)[v44 mode];
  if (!v35) {
    objc_storeStrong(&v35, @"values");
  }
  if (([v35 isEqualToString:@"top_n"] & 1) != 0
    || ([v35 isEqualToString:@"idsAndScores"] & 1) != 0)
  {
    id v22 = v46;
    id v20 = v36;
    unsigned int v21 = [v37 count];
    uint64_t v11 = [location[0] dataType];
    LOBYTE(v16) = 0;
    id v47 = [(AMDOutputBuilder *)v22 process2DMultiArray:v20 shapeLength:v21 withDataType:v11 withOutputDefinition:v44 andModelAssets:v42 withColdstartModelId:v41 idsOnly:v16 inferenceMode:v35 error:v39];
    int v34 = 1;
  }
  else if ([v35 isEqualToString:@"idsOnly"])
  {
    id v19 = v46;
    id v17 = v36;
    unsigned int v18 = [v37 count];
    uint64_t v12 = [location[0] dataType];
    LOBYTE(v16) = 1;
    id v47 = [(AMDOutputBuilder *)v19 process2DMultiArray:v17 shapeLength:v18 withDataType:v12 withOutputDefinition:v44 andModelAssets:v42 withColdstartModelId:v41 idsOnly:v16 inferenceMode:v35 error:v39];
    int v34 = 1;
  }
  else if ([v35 isEqualToString:@"values"])
  {
    id v47 = v36;
    int v34 = 1;
  }
  else
  {
    id v33 = (id)[NSString stringWithFormat:@"Unrecognized inference mode: %@ passed in the workflow", v35];
    id v13 = +[AMDError allocError:16 withMessage:v33];
    *id v39 = v13;
    id v47 = 0;
    int v34 = 1;
    objc_storeStrong(&v33, 0);
  }
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v43, 0);
  objc_storeStrong(&v44, 0);
  objc_storeStrong(location, 0);
  uint64_t v14 = v47;

  return v14;
}

- (id)process2DMultiArray:(id)a3 shapeLength:(unsigned int)a4 withDataType:(int64_t)a5 withOutputDefinition:(id)a6 andModelAssets:(id)a7 withColdstartModelId:(id)a8 idsOnly:(BOOL)a9 inferenceMode:(id)a10 error:(id *)a11
{
  id v35 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unsigned int v33 = a4;
  v32[1] = (id)a5;
  v32[0] = 0;
  objc_storeStrong(v32, a6);
  id v31 = 0;
  objc_storeStrong(&v31, a7);
  id v30 = 0;
  objc_storeStrong(&v30, a8);
  BOOL v29 = a9;
  id v28 = 0;
  objc_storeStrong(&v28, a10);
  id v27 = a11;
  if (v33 == 2)
  {
    unsigned int v24 = [location[0] count];
    id v23 = (id)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v24];
    for (unsigned int i = 0; i < v24; ++i)
    {
      uint64_t v14 = v35;
      id v15 = (id)[location[0] objectAtIndex:i];
      id v21 = -[AMDOutputBuilder processArrayOutput:withDataType:withOutputDefinition:andModelAssets:withColdstartModelId:idsOnly:error:](v14, "processArrayOutput:withDataType:withOutputDefinition:andModelAssets:withColdstartModelId:idsOnly:error:", v27);

      [v23 addObject:v21];
      objc_storeStrong(&v21, 0);
    }
    if (v24 == 1) {
      id v36 = (id)[v23 firstObject];
    }
    else {
      id v36 = v23;
    }
    int v25 = 1;
    objc_storeStrong(&v23, 0);
  }
  else
  {
    id v26 = (id)[NSString stringWithFormat:@"Invalid output shape for mode %@: %u", v28, v33];
    id v11 = +[AMDError allocError:16 withMessage:v26];
    *id v27 = v11;
    id v36 = 0;
    int v25 = 1;
    objc_storeStrong(&v26, 0);
  }
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(v32, 0);
  objc_storeStrong(location, 0);
  uint64_t v12 = v36;

  return v12;
}

- (id)processArrayOutput:(id)a3 withDataType:(int64_t)a4 withOutputDefinition:(id)a5 andModelAssets:(id)a6 withColdstartModelId:(id)a7 idsOnly:(BOOL)a8 error:(id *)a9
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  v52 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v50 = a4;
  id v49 = 0;
  objc_storeStrong(&v49, a5);
  id v48 = 0;
  objc_storeStrong(&v48, a6);
  id v47 = 0;
  objc_storeStrong(&v47, a7);
  BOOL v46 = a8;
  id v45 = a9;
  id v9 = (id)[v49 remapDictionaryId];
  BOOL v36 = v9 != 0;

  BOOL v44 = v36;
  id v43 = [(AMDOutputBuilder *)v52 getRemapDictFor:v49 withModelAssets:v48];
  if (!v36 || v43)
  {
    if (v46)
    {
      if (v44)
      {
        id v26 = objc_alloc(MEMORY[0x263EFF980]);
        id v40 = (id)objc_msgSend(v26, "initWithCapacity:", objc_msgSend(location[0], "count"));
        memset(__b, 0, sizeof(__b));
        id v27 = location[0];
        uint64_t v28 = [v27 countByEnumeratingWithState:__b objects:v54 count:16];
        if (v28)
        {
          uint64_t v23 = *(void *)__b[2];
          uint64_t v24 = 0;
          unint64_t v25 = v28;
          while (1)
          {
            uint64_t v22 = v24;
            if (*(void *)__b[2] != v23) {
              objc_enumerationMutation(v27);
            }
            uint64_t v39 = *(void *)(__b[1] + 8 * v24);
            id v20 = v40;
            id v21 = (id)[v43 objectForKey:v39];
            objc_msgSend(v20, "addObject:");

            ++v24;
            if (v22 + 1 >= v25)
            {
              uint64_t v24 = 0;
              unint64_t v25 = [v27 countByEnumeratingWithState:__b objects:v54 count:16];
              if (!v25) {
                break;
              }
            }
          }
        }

        id v53 = v40;
        int v41 = 1;
        objc_storeStrong(&v40, 0);
      }
      else
      {
        id v53 = location[0];
        int v41 = 1;
      }
    }
    else
    {
      id v37 = +[AMDColdstartOperation computeUpdatedScoresV2:location[0] withModel:v47 andMappingDictionary:v43];
      if (v37)
      {
        id v11 = (id)[v37 objectForKey:@"recomputedScores"];
        id v12 = location[0];
        location[0] = v11;

        id v13 = (id)[v37 objectForKey:@"updatedRemapdict"];
        id v14 = v43;
        id v43 = v13;
      }
      unsigned int v18 = v52;
      id v19 = (id)[v49 modelTopN];
      uint64_t v15 = [v19 unsignedLongValue];
      id v53 = [(AMDOutputBuilder *)v18 getTopN:v15 idsAndScoresFrom:location[0] withMappingDictionary:v43 withType:v50];

      int v41 = 1;
      objc_storeStrong(&v37, 0);
    }
  }
  else
  {
    BOOL v29 = NSString;
    id v30 = (id)[v49 modelOutputName];
    id v42 = (id)[v29 stringWithFormat:@"Remap dictionary absent for output: %@", v30];

    id v10 = +[AMDError allocError:15 withMessage:v42];
    *id v45 = v10;
    id v53 = 0;
    int v41 = 1;
    objc_storeStrong(&v42, 0);
  }
  objc_storeStrong(&v43, 0);
  objc_storeStrong(&v47, 0);
  objc_storeStrong(&v48, 0);
  objc_storeStrong(&v49, 0);
  objc_storeStrong(location, 0);
  uint64_t v16 = v53;

  return v16;
}

- (id)getTopN:(unint64_t)a3 idsAndScoresFrom:(id)a4 withMappingDictionary:(id)a5 withType:(int64_t)a6
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v53 = self;
  SEL v52 = a2;
  unint64_t v51 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v49 = 0;
  objc_storeStrong(&v49, a5);
  v48[1] = (id)a6;
  v48[0] = [(AMDOutputBuilder *)v53 createHeapOfType:a6 withCapacity:v51];
  id v47 = (id)[MEMORY[0x263EFF980] arrayWithCapacity:v51];
  id v46 = (id)[MEMORY[0x263EFF980] arrayWithCapacity:v51];
  for (unsigned int i = 0; ; ++i)
  {
    unint64_t v34 = (int)i;
    if (v34 >= [location count]) {
      break;
    }
    id v44 = (id)[location objectAtIndex:(int)i];
    id v32 = (id)[MEMORY[0x263F087B0] notANumber];
    char v33 = [v32 isEqualToNumber:v44];

    if ((v33 & 1) == 0)
    {
      id v40 = 0;
      if (v49)
      {
        id v28 = v49;
        id v29 = (id)[NSNumber numberWithInt:i];
        id v6 = (id)objc_msgSend(v28, "objectForKey:");
        id v7 = v40;
        id v40 = v6;

        if (!v40)
        {
          int v41 = 4;
LABEL_13:
          objc_storeStrong(&v40, 0);
          goto LABEL_14;
        }
      }
      else
      {
        id v8 = (id)[NSNumber numberWithInt:i];
        id v9 = v40;
        id v40 = v8;
      }
      id v10 = [AMDPair alloc];
      uint64_t v39 = [(AMDPair *)v10 initWith:v40 and:v44];
      [v48[0] add:v39];
      objc_storeStrong((id *)&v39, 0);
      int v41 = 0;
      goto LABEL_13;
    }
    os_log_t oslog = (os_log_t)&_os_log_internal;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      os_log_type_t v31 = type;
      __os_log_helper_16_0_1_4_0((uint64_t)v57, i);
      _os_log_error_impl(&dword_20ABD4000, log, v31, "nan output produced during inference for logicalId: %d", v57, 8u);
    }
    objc_storeStrong((id *)&oslog, 0);
    int v41 = 4;
LABEL_14:
    objc_storeStrong(&v44, 0);
  }
  memset(__b, 0, sizeof(__b));
  id v26 = (id)[v48[0] topN];
  uint64_t v27 = [v26 countByEnumeratingWithState:__b objects:v56 count:16];
  if (v27)
  {
    uint64_t v23 = *(void *)__b[2];
    uint64_t v24 = 0;
    unint64_t v25 = v27;
    while (1)
    {
      uint64_t v22 = v24;
      if (*(void *)__b[2] != v23) {
        objc_enumerationMutation(v26);
      }
      id v38 = *(id *)(__b[1] + 8 * v24);
      id v20 = (id)[v38 first];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v17 = v47;
        id v19 = (id)[v38 first];
        id v18 = (id)[v19 stringValue];
        objc_msgSend(v17, "addObject:");
      }
      else
      {
        id v15 = v47;
        id v16 = (id)[v38 first];
        objc_msgSend(v15, "addObject:");
      }
      id v13 = v46;
      id v14 = (id)[v38 second];
      objc_msgSend(v13, "addObject:");

      ++v24;
      if (v22 + 1 >= v25)
      {
        uint64_t v24 = 0;
        unint64_t v25 = [v26 countByEnumeratingWithState:__b objects:v56 count:16];
        if (!v25) {
          break;
        }
      }
    }
  }

  v54[0] = @"ids";
  v55[0] = v47;
  v54[1] = @"scores";
  v55[1] = v46;
  id v12 = (id)[NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:2];
  int v41 = 1;
  objc_storeStrong(&v46, 0);
  objc_storeStrong(&v47, 0);
  objc_storeStrong(v48, 0);
  objc_storeStrong(&v49, 0);
  objc_storeStrong(&location, 0);

  return v12;
}

- (id)createHeapOfType:(int64_t)a3 withCapacity:(unint64_t)a4
{
  v6[4] = self;
  v6[3] = (id)a2;
  v6[2] = (id)a3;
  v6[1] = (id)a4;
  v6[0] = -[AMDMinHeap initWithCapacity:comparator:]([AMDMinHeap alloc], "initWithCapacity:comparator:", a4);
  id v5 = v6[0];
  objc_storeStrong(v6, 0);

  return v5;
}

uint64_t __50__AMDOutputBuilder_createHeapOfType_withCapacity___block_invoke(void *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v25 = 0;
  objc_storeStrong(&v25, a3);
  v24[1] = a1;
  v24[0] = location[0];
  id v23 = v25;
  uint64_t v22 = a1[4];
  if (v22 == 65552 || v22 == 65568)
  {
    id v8 = (id)[v24[0] second];
    [v8 floatValue];
    float v9 = v5;

    id v10 = (id)[v23 second];
    [v10 floatValue];
    float v11 = v6;

    if (v9 < v11)
    {
      uint64_t v27 = -1;
      goto LABEL_20;
    }
    if (v9 > v11)
    {
      uint64_t v27 = 1;
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  if (v22 == 65600)
  {
    id v12 = (id)[v24[0] second];
    [v12 doubleValue];
    double v13 = v3;

    id v14 = (id)[v23 second];
    [v14 doubleValue];
    double v15 = v4;

    if (v13 < v15)
    {
      uint64_t v27 = -1;
      goto LABEL_20;
    }
    if (v13 > v15)
    {
      uint64_t v27 = 1;
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  if (v22 != 131104) {
    goto LABEL_19;
  }
  id v16 = (id)[v24[0] second];
  int v17 = [v16 intValue];

  id v18 = (id)[v23 second];
  int v19 = [v18 intValue];

  if (v17 >= v19)
  {
    if (v17 > v19)
    {
      uint64_t v27 = 1;
      goto LABEL_20;
    }
LABEL_19:
    uint64_t v27 = 0;
    goto LABEL_20;
  }
  uint64_t v27 = -1;
LABEL_20:
  objc_storeStrong(&v23, 0);
  objc_storeStrong(v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
  return v27;
}

- (id)getRemapDictFor:(id)a3 withModelAssets:(id)a4
{
  id v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v18 = 0;
  objc_storeStrong(&v18, a4);
  id v17 = 0;
  id v16 = 0;
  id v12 = (id)[location[0] remapDictionaryId];
  char v14 = 0;
  char v13 = 0;
  if (v12)
  {
    id v15 = (id)[location[0] remapDictionaryId];
    char v14 = 1;
    char v13 = [v15 isEqualToString:0x26BEB2E18];
  }
  if (v14) {

  }
  if (v13)
  {
    id v4 = (id)[v18 getLogicalToContentMap];
    float v5 = v16;
    id v16 = v4;
  }
  id v6 = -[AMDOutputBuilder generateMappingDictionary:](v20, "generateMappingDictionary:", v16, &v16);
  id v7 = v17;
  id v17 = v6;

  id v10 = v17;
  objc_storeStrong(v9, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);

  return v10;
}

- (id)generateMappingDictionary:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    id v22 = &_os_log_internal;
    char v21 = 2;
    if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEBUG))
    {
      id v8 = v22;
      os_log_type_t v9 = v21;
      __os_log_helper_16_0_0(v20);
      _os_log_debug_impl(&dword_20ABD4000, v8, v9, "Using binary map for output remapping", v20, 2u);
    }
    objc_storeStrong(&v22, 0);
    int v19 = (unsigned int *)[location[0] bytes];
    unsigned int v18 = 0;
    unsigned int v18 = *v19;
    id v17 = &_os_log_internal;
    os_log_type_t v16 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v29, v18);
      _os_log_debug_impl(&dword_20ABD4000, (os_log_t)v17, v16, "Output map: %d entries", v29, 8u);
    }
    objc_storeStrong(&v17, 0);
    ++v19;
    id v3 = objc_alloc(MEMORY[0x263EFF9A0]);
    id v15 = (id)[v3 initWithCapacity:v18];
    for (unsigned int i = 0; i < v18; ++i)
    {
      char v13 = v19++;
      id v12 = v19;
      v19 += 2;
      id v7 = (id)[NSNumber numberWithUnsignedLongLong:*(void *)v12];
      id v6 = (id)[NSNumber numberWithUnsignedInt:*v13];
      objc_msgSend(v15, "setObject:forKey:", v7);
    }
    id v28 = v15;
    int v23 = 1;
    objc_storeStrong(&v15, 0);
  }
  else
  {
    id v26 = &_os_log_internal;
    char v25 = 16;
    if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_ERROR))
    {
      log = v26;
      os_log_type_t type = v25;
      __os_log_helper_16_0_0(v24);
      _os_log_error_impl(&dword_20ABD4000, log, type, "Output map not found", v24, 2u);
    }
    objc_storeStrong(&v26, 0);
    id v28 = 0;
    int v23 = 1;
  }
  objc_storeStrong(location, 0);
  id v4 = v28;

  return v4;
}

- (id)convertMultiArray:(id)a3 withShape:(id)a4 atDepth:(unsigned int)a5 withKey:(id)a6 withScoreThreshold:(double)a7 error:(id *)a8
{
  id v45 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v43 = 0;
  objc_storeStrong(&v43, a4);
  unsigned int v42 = a5;
  id v41 = 0;
  objc_storeStrong(&v41, a6);
  double v40 = a7;
  uint64_t v39 = a8;
  id v27 = (id)[v43 objectAtIndex:v42];
  unsigned int v28 = [v27 intValue];

  unsigned int v38 = v28;
  uint64_t v29 = v42 + 1;
  if (v29 == [v43 count])
  {
    id v37 = objc_alloc_init(MEMORY[0x263EFF980]);
    for (unsigned int i = 0; i < v38; ++i)
    {
      id v19 = v41;
      id v21 = (id)[NSNumber numberWithInt:i];
      id v20 = (id)objc_msgSend(v19, "arrayByAddingObject:");
      id v35 = (id)[v20 mutableCopy];

      id v34 = (id)[location[0] objectForKeyedSubscript:v35];
      [v34 doubleValue];
      if (v8 >= v40) {
        [v37 addObject:v34];
      }
      else {
        [v37 addObject:&unk_26BEC16D0];
      }
      objc_storeStrong(&v34, 0);
      objc_storeStrong(&v35, 0);
    }
    id v46 = v37;
    int v33 = 1;
    objc_storeStrong(&v37, 0);
  }
  else
  {
    id v32 = objc_alloc_init(MEMORY[0x263EFF980]);
    for (unsigned int j = 0; j < v38; ++j)
    {
      id v15 = v45;
      id v12 = location[0];
      id v13 = v43;
      unsigned int v14 = v42 + 1;
      id v11 = v41;
      id v18 = (id)[NSNumber numberWithUnsignedInt:j];
      id v17 = (id)objc_msgSend(v11, "arrayByAddingObject:");
      id v16 = (id)[v17 mutableCopy];
      id v30 = -[AMDOutputBuilder convertMultiArray:withShape:atDepth:withKey:withScoreThreshold:error:](v15, "convertMultiArray:withShape:atDepth:withKey:withScoreThreshold:error:", v12, v13, v14, v40);

      [v32 addObject:v30];
      objc_storeStrong(&v30, 0);
    }
    id v46 = v32;
    int v33 = 1;
    objc_storeStrong(&v32, 0);
  }
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v43, 0);
  objc_storeStrong(location, 0);
  os_log_type_t v9 = v46;

  return v9;
}

- (NSString)useCaseId
{
  return self->_useCaseId;
}

- (void)setUseCaseId:(id)a3
{
}

- (NSMutableDictionary)outputDefinitions
{
  return self->_outputDefinitions;
}

- (void)setOutputDefinitions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end