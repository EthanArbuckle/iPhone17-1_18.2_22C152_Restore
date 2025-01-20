@interface AMDHeuristicModelEvaluator
- (id)computeAndGetMetrics:(int64_t)a3 model:(id)a4 error:(id *)a5 errorDomain:(id)a6 dataProvider:(id)a7 metricNames:(id)a8;
- (id)runTask:(id)a3 error:(id *)a4 errorDomain:(id)a5 dataProvider:(id)a6;
- (id)taskResultFromDict:(id)a3;
@end

@implementation AMDHeuristicModelEvaluator

- (id)runTask:(id)a3 error:(id *)a4 errorDomain:(id)a5 dataProvider:(id)a6
{
  v45 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v43 = a4;
  id v42 = 0;
  objc_storeStrong(&v42, a5);
  id v41 = 0;
  objc_storeStrong(&v41, a6);
  id v23 = (id)[location[0] parameters];
  id v40 = (id)[v23 stringValueForKey:ModelFileNameKey defaultValue:0];

  id v24 = (id)[location[0] attachments];
  id v39 = (id)[v24 attachmentURLsForBasename:v40];

  v25 = NSURL;
  id v27 = (id)objc_msgSend(v39, "objectAtIndexedSubscript:");
  id v26 = (id)[v27 path];
  id v38 = (id)objc_msgSend(v25, "fileURLWithPath:");

  id v37 = objc_alloc_init(MEMORY[0x263F00D98]);
  [v37 setComputeUnits:0];
  id v36 = (id)[MEMORY[0x263F00D80] modelWithContentsOfURL:v38 configuration:v37 error:v43];
  if (v36)
  {
    id v18 = (id)[location[0] parameters];
    uint64_t v19 = [v18 unsignedIntegerValueForKey:BatchSizeKey defaultValue:1];

    uint64_t v34 = v19;
    if (v19 >= 1)
    {
      id v17 = (id)[location[0] parameters];
      id v33 = (id)[v17 objectForKeyedSubscript:OutputNamesKey];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v33 count])
      {
        id v16 = (id)[location[0] parameters];
        id v32 = (id)[v16 objectForKeyedSubscript:MetricsNamesKey];

        if (!v32 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v31 = (id)[MEMORY[0x263EFFA08] setWithArray:v32];
          id v30 = (id)[MEMORY[0x263EFFA08] setWithArray:v33];
          if ([v31 isSubsetOfSet:v30])
          {
            id v29 = [(AMDHeuristicModelEvaluator *)v45 computeAndGetMetrics:v34 model:v36 error:v43 errorDomain:v42 dataProvider:v41 metricNames:v32];
            if (v29)
            {
              id v28 = (id)[MEMORY[0x263EFF9A0] dictionary];
              [v28 setObject:v29 forKey:ModelMetrics];
              id v46 = [(AMDHeuristicModelEvaluator *)v45 taskResultFromDict:v28];
              int v35 = 1;
              objc_storeStrong(&v28, 0);
            }
            else
            {
              id v46 = 0;
              int v35 = 1;
            }
            objc_storeStrong(&v29, 0);
          }
          else
          {
            id v12 = objc_alloc(MEMORY[0x263F087E8]);
            id v13 = (id)[v12 initWithDomain:v42 code:61 userInfo:0];
            id *v43 = v13;
            id v46 = 0;
            int v35 = 1;
          }
          objc_storeStrong(&v30, 0);
          objc_storeStrong(&v31, 0);
        }
        else
        {
          id v10 = objc_alloc(MEMORY[0x263F087E8]);
          id v11 = (id)[v10 initWithDomain:v42 code:60 userInfo:0];
          id *v43 = v11;
          id v46 = 0;
          int v35 = 1;
        }
        objc_storeStrong(&v32, 0);
      }
      else
      {
        id v8 = objc_alloc(MEMORY[0x263F087E8]);
        id v9 = (id)[v8 initWithDomain:v42 code:5 userInfo:0];
        id *v43 = v9;
        id v46 = 0;
        int v35 = 1;
      }
      objc_storeStrong(&v33, 0);
    }
    else
    {
      id v6 = objc_alloc(MEMORY[0x263F087E8]);
      id v7 = (id)[v6 initWithDomain:v42 code:7 userInfo:0];
      id *v43 = v7;
      id v46 = 0;
      int v35 = 1;
    }
  }
  else
  {
    id v46 = 0;
    int v35 = 1;
  }
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(location, 0);
  v14 = v46;
  return v14;
}

- (id)computeAndGetMetrics:(int64_t)a3 model:(id)a4 error:(id *)a5 errorDomain:(id)a6 dataProvider:(id)a7 metricNames:(id)a8
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  v48 = self;
  SEL v47 = a2;
  int64_t v46 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  v44 = a5;
  id v43 = 0;
  objc_storeStrong(&v43, a6);
  id v42 = 0;
  objc_storeStrong(&v42, a7);
  id v41 = 0;
  objc_storeStrong(&v41, a8);
  id v40 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:");
  id v39 = (id)[v42 fetchData:v46 error:v44 errorDomain:v43];
  if (v39)
  {
    id v37 = (id)[location predictionsFromBatch:v39 error:v44];
    if (v37)
    {
      id v36 = (id)[v37 featuresAtIndex:0];
      memset(__b, 0, sizeof(__b));
      id v25 = v41;
      uint64_t v26 = [v25 countByEnumeratingWithState:__b objects:v50 count:16];
      if (v26)
      {
        uint64_t v22 = *(void *)__b[2];
        uint64_t v23 = 0;
        unint64_t v24 = v26;
        while (1)
        {
          uint64_t v21 = v23;
          if (*(void *)__b[2] != v22) {
            objc_enumerationMutation(v25);
          }
          uint64_t v35 = *(void *)(__b[1] + 8 * v23);
          id v33 = (id)[v36 featureValueForName:v35];
          if (v33)
          {
            int v32 = 0;
            id v19 = (id)[v33 multiArrayValue];
            id v18 = (id)[v19 objectAtIndexedSubscript:0];
            [v18 floatValue];
            int v20 = v10;

            int v32 = v20;
            id v31 = (id)[v40 valueForKey:v35];
            if (!v31)
            {
              id v12 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:0];
              id v13 = v31;
              id v31 = v12;

              [v40 setValue:v31 forKey:v35];
            }
            id v16 = v31;
            LODWORD(v11) = v32;
            id v17 = (id)[NSNumber numberWithFloat:v11];
            objc_msgSend(v16, "addObject:");

            objc_storeStrong(&v31, 0);
            int v38 = 0;
          }
          else
          {
            id v8 = objc_alloc(MEMORY[0x263F087E8]);
            id v9 = (id)[v8 initWithDomain:v43 code:61 userInfo:0];
            id *v44 = v9;
            id v49 = 0;
            int v38 = 1;
          }
          objc_storeStrong(&v33, 0);
          if (v38) {
            break;
          }
          ++v23;
          if (v21 + 1 >= v24)
          {
            uint64_t v23 = 0;
            unint64_t v24 = [v25 countByEnumeratingWithState:__b objects:v50 count:16];
            if (!v24) {
              goto LABEL_17;
            }
          }
        }
      }
      else
      {
LABEL_17:
        int v38 = 0;
      }

      if (!v38)
      {
        id v49 = v40;
        int v38 = 1;
      }
      objc_storeStrong(&v36, 0);
    }
    else
    {
      id v49 = 0;
      int v38 = 1;
    }
    objc_storeStrong(&v37, 0);
  }
  else
  {
    id v49 = 0;
    int v38 = 1;
  }
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v43, 0);
  objc_storeStrong(&location, 0);
  v14 = v49;
  return v14;
}

- (id)taskResultFromDict:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = (id)[location[0] mutableCopy];
  id v6 = (id)[v7 objectForKeyedSubscript:ModelDeltas];
  [v7 removeObjectForKey:ModelDeltas];
  id v3 = objc_alloc(MEMORY[0x263F534A8]);
  id v5 = (id)[v3 initWithJSONResult:v7 unprivatizedVector:v6];
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v5;
}

@end