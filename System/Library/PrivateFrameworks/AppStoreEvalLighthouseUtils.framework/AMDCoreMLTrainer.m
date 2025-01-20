@interface AMDCoreMLTrainer
- (id)computeAndGetMetrics:(id)a3 programTrainer:(id)a4 numIterationsToTrain:(int64_t)a5 error:(id *)a6 errorDomain:(id)a7 dataProvider:(id)a8 localTrainingStage:(unint64_t)a9;
- (id)runTask:(id)a3 error:(id *)a4 errorDomain:(id)a5 dataProvider:(id)a6;
- (id)taskResultFromDict:(id)a3;
@end

@implementation AMDCoreMLTrainer

- (id)runTask:(id)a3 error:(id *)a4 errorDomain:(id)a5 dataProvider:(id)a6
{
  v46 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v44 = a4;
  id v43 = 0;
  objc_storeStrong(&v43, a5);
  id v42 = 0;
  objc_storeStrong(&v42, a6);
  v6 = [AMDDODMLModelMetadata alloc];
  id v41 = [(AMDDODMLModelMetadata *)v6 initModelMetadata:location[0] error:v44 errorDomain:v43];
  if (v41)
  {
    v18 = NSURL;
    id v20 = (id)[v41 modelPath];
    id v19 = (id)objc_msgSend(v18, "fileURLWithPath:");
    id v39 = (id)[v19 URLByDeletingLastPathComponent];

    id v38 = objc_alloc_init(MEMORY[0x263F00D98]);
    [v38 setComputeUnits:0];
    id v37 = (id)[MEMORY[0x263F00D80] modelWithContentsOfURL:v39 configuration:v38 error:v44];
    if (v37)
    {
      id v15 = objc_alloc(MEMORY[0x263F00DD8]);
      id v17 = (id)[v37 program];
      id v16 = (id)[v41 learningRate];
      [v16 doubleValue];
      id v36 = (id)objc_msgSend(v15, "initWithProgram:learningRate:error:", v17, v44);

      if (v36)
      {
        uint64_t v35 = objc_msgSend(v42, "numberOfIterationsPerEpoch:", objc_msgSend(v41, "batchSize"));
        if (v35)
        {
          uint64_t v34 = [v41 numLocalIterations];
          id v13 = (id)[v41 learningRateSchedule];
          BOOL v14 = 0;
          if (!v13) {
            BOOL v14 = [v41 numEpochs] > 0;
          }

          if (v14) {
            uint64_t v34 = [v41 numEpochs] * v35;
          }
          id v33 = [(AMDCoreMLTrainer *)v46 computeAndGetMetrics:v41 programTrainer:v36 numIterationsToTrain:v34 error:v44 errorDomain:v43 dataProvider:v42 localTrainingStage:0];
          if (v33)
          {
            id v32 = [(AMDCoreMLTrainer *)v46 computeAndGetMetrics:v41 programTrainer:v36 numIterationsToTrain:v34 error:v44 errorDomain:v43 dataProvider:v42 localTrainingStage:1];
            if (v32)
            {
              id v31 = (id)[v36 copyCurrentTrainingDelta];
              id v30 = (id)[v31 flattenedModelUpdate];
              id v29 = [(AMDCoreMLTrainer *)v46 computeAndGetMetrics:v41 programTrainer:v36 numIterationsToTrain:v34 error:v44 errorDomain:v43 dataProvider:v42 localTrainingStage:2];
              if (v29)
              {
                id v28 = (id)[v33 objectForKey:LossBeforeEachLocalIteration];
                id v27 = (id)[v29 objectForKey:LossAfterEachLocalIteration];
                id v26 = (id)[v32 objectForKey:LossDuringEachLocalIteration];
                id v25 = (id)[MEMORY[0x263EFF9A0] dictionary];
                [v25 addEntriesFromDictionary:v33];
                [v25 addEntriesFromDictionary:v32];
                [v25 addEntriesFromDictionary:v29];
                [v25 removeObjectForKey:LossBeforeEachLocalIteration];
                [v25 removeObjectForKey:LossDuringEachLocalIteration];
                [v25 removeObjectForKey:LossAfterEachLocalIteration];
                id v24 = (id)[MEMORY[0x263EFF9A0] dictionary];
                [v24 setObject:v30 forKey:ModelDeltas];
                id v11 = v24;
                id v12 = (id)[v41 weightNames];
                objc_msgSend(v11, "setObject:forKey:");

                [v24 setObject:v28 forKey:LossBeforeEachLocalIteration];
                [v24 setObject:v26 forKey:LossDuringEachLocalIteration];
                [v24 setObject:v27 forKey:LossAfterEachLocalIteration];
                [v24 setObject:v25 forKey:ModelMetrics];
                id v47 = [(AMDCoreMLTrainer *)v46 taskResultFromDict:v24];
                int v40 = 1;
                objc_storeStrong(&v24, 0);
                objc_storeStrong(&v25, 0);
                objc_storeStrong(&v26, 0);
                objc_storeStrong(&v27, 0);
                objc_storeStrong(&v28, 0);
              }
              else
              {
                id v47 = 0;
                int v40 = 1;
              }
              objc_storeStrong(&v29, 0);
              objc_storeStrong(&v30, 0);
              objc_storeStrong(&v31, 0);
            }
            else
            {
              id v47 = 0;
              int v40 = 1;
            }
            objc_storeStrong(&v32, 0);
          }
          else
          {
            id v47 = 0;
            int v40 = 1;
          }
          objc_storeStrong(&v33, 0);
        }
        else
        {
          id v7 = objc_alloc(MEMORY[0x263F087E8]);
          id v8 = (id)[v7 initWithDomain:v43 code:127 userInfo:0];
          id *v44 = v8;
          id v47 = 0;
          int v40 = 1;
        }
      }
      else
      {
        id v47 = 0;
        int v40 = 1;
      }
      objc_storeStrong(&v36, 0);
    }
    else
    {
      id v47 = 0;
      int v40 = 1;
    }
    objc_storeStrong(&v37, 0);
    objc_storeStrong(&v38, 0);
    objc_storeStrong(&v39, 0);
  }
  else
  {
    id v47 = 0;
    int v40 = 1;
  }
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v43, 0);
  objc_storeStrong(location, 0);
  v9 = v47;
  return v9;
}

- (id)computeAndGetMetrics:(id)a3 programTrainer:(id)a4 numIterationsToTrain:(int64_t)a5 error:(id *)a6 errorDomain:(id)a7 dataProvider:(id)a8 localTrainingStage:(unint64_t)a9
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v80 = 0;
  objc_storeStrong(&v80, a4);
  int64_t v79 = a5;
  v78 = a6;
  id v77 = 0;
  objc_storeStrong(&v77, a7);
  id v76 = 0;
  objc_storeStrong(&v76, a8);
  unint64_t v75 = a9;
  id v74 = 0;
  id v73 = 0;
  if (a9 == 1)
  {
    objc_storeStrong(&v74, LossDuringEachLocalIteration);
    objc_storeStrong(&v73, DuringIterationMetricsSuffix);
  }
  else if (v75)
  {
    if (v75 == 2)
    {
      objc_storeStrong(&v74, LossAfterEachLocalIteration);
      objc_storeStrong(&v73, AfterIterationMetricsSuffix);
    }
  }
  else
  {
    objc_storeStrong(&v74, LossBeforeEachLocalIteration);
    objc_storeStrong(&v73, BeforeIterationMetricsSuffix);
  }
  id v72 = (id)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:0];
  for (int i = 0; i < v79; ++i)
  {
    id v54 = v76;
    uint64_t v9 = [location[0] batchSize];
    id v70 = (id)[v54 fetchData:v9 error:v78 errorDomain:v77];
    if (v70)
    {
      id v10 = (id)[location[0] learningRateSchedule];
      BOOL v53 = v10 == 0;

      if (!v53)
      {
        id v52 = (id)[location[0] learningRateSchedule];
        id v51 = (id)[v52 objectAtIndexedSubscript:i];
        [v51 doubleValue];
        objc_msgSend(v80, "setLearningRate:");
      }
      id v68 = 0;
      if (v75 == 1)
      {
        id v48 = v80;
        id v47 = v70;
        v46 = (void *)MEMORY[0x263EFFA08];
        id v50 = (id)[location[0] metricsNames];
        id v49 = (id)objc_msgSend(v46, "setWithArray:");
        id v11 = (id)objc_msgSend(v48, "trainUsingTrainingData:evaluationMetricNames:error:", v47);
        id v12 = v68;
        id v68 = v11;
      }
      else
      {
        id v43 = v80;
        id v42 = v70;
        id v41 = (void *)MEMORY[0x263EFFA08];
        id v45 = (id)[location[0] metricsNames];
        id v44 = (id)objc_msgSend(v41, "setWithArray:");
        id v13 = (id)objc_msgSend(v43, "evaluateUsingTestData:evaluationMetricNames:error:", v42);
        id v14 = v68;
        id v68 = v13;
      }
      if (v68)
      {
        [v68 loss];
        NSLog(&cfstr_LossF.isa, v15);
        id v67 = (id)[v72 valueForKey:v74];
        if (!v67)
        {
          id v16 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:0];
          id v17 = v67;
          id v67 = v16;

          [v72 setValue:v67 forKey:v74];
        }
        id v36 = v67;
        uint64_t v35 = NSNumber;
        [v68 loss];
        id v37 = (id)objc_msgSend(v35, "numberWithDouble:");
        objc_msgSend(v36, "addObject:");

        id v38 = (id)[v68 evaluationMetrics];
        id v66 = (id)[v38 featuresAtIndex:0];

        memset(__b, 0, sizeof(__b));
        id v39 = (id)[location[0] metricsNames];
        uint64_t v40 = [v39 countByEnumeratingWithState:__b objects:v83 count:16];
        if (v40)
        {
          uint64_t v32 = *(void *)__b[2];
          uint64_t v33 = 0;
          unint64_t v34 = v40;
          while (1)
          {
            uint64_t v31 = v33;
            if (*(void *)__b[2] != v32) {
              objc_enumerationMutation(v39);
            }
            id v65 = *(id *)(__b[1] + 8 * v33);
            id v63 = (id)[v66 featureValueForName:v65];
            if (v63)
            {
              int v62 = 0;
              id v29 = (id)[v63 multiArrayValue];
              id v28 = (id)[v29 objectAtIndexedSubscript:0];
              [v28 floatValue];
              int v30 = v20;

              int v62 = v30;
              id v61 = (id)[v65 stringByAppendingString:v73];
              id v60 = (id)[v72 valueForKey:v61];
              if (!v60)
              {
                v22 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:0];
                id v23 = v60;
                id v60 = v22;

                [v72 setValue:v60 forKey:v61];
              }
              id v26 = v60;
              LODWORD(v21) = v62;
              id v27 = (id)[NSNumber numberWithFloat:v21];
              objc_msgSend(v26, "addObject:");

              objc_storeStrong(&v60, 0);
              objc_storeStrong(&v61, 0);
              int v69 = 0;
            }
            else
            {
              id v18 = objc_alloc(MEMORY[0x263F087E8]);
              id v19 = (id)[v18 initWithDomain:v77 code:61 userInfo:0];
              id *v78 = v19;
              id v82 = 0;
              int v69 = 1;
            }
            objc_storeStrong(&v63, 0);
            if (v69) {
              break;
            }
            ++v33;
            if (v31 + 1 >= v34)
            {
              uint64_t v33 = 0;
              unint64_t v34 = [v39 countByEnumeratingWithState:__b objects:v83 count:16];
              if (!v34) {
                goto LABEL_32;
              }
            }
          }
        }
        else
        {
LABEL_32:
          int v69 = 0;
        }

        if (!v69) {
          int v69 = 0;
        }
        objc_storeStrong(&v66, 0);
        objc_storeStrong(&v67, 0);
      }
      else
      {
        id v82 = 0;
        int v69 = 1;
      }
      objc_storeStrong(&v68, 0);
    }
    else
    {
      id v82 = 0;
      int v69 = 1;
    }
    objc_storeStrong(&v70, 0);
    if (v69) {
      goto LABEL_40;
    }
  }
  id v82 = v72;
  int v69 = 1;
LABEL_40:
  objc_storeStrong(&v72, 0);
  objc_storeStrong(&v73, 0);
  objc_storeStrong(&v74, 0);
  objc_storeStrong(&v76, 0);
  objc_storeStrong(&v77, 0);
  objc_storeStrong(&v80, 0);
  objc_storeStrong(location, 0);
  id v24 = v82;
  return v24;
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