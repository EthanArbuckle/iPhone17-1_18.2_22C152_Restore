@interface AMDCoreMLTrainer
- (id)computeAndGetMetrics:(id)a3 programTrainer:(id)a4 numIterationsToTrain:(int64_t)a5 error:(id *)a6 errorDomain:(id)a7 dataProvider:(id)a8 localTrainingStage:(unint64_t)a9;
- (id)runTask:(id)a3 error:(id *)a4 errorDomain:(id)a5 dataProvider:(id)a6;
- (id)taskResultFromDict:(id)a3;
@end

@implementation AMDCoreMLTrainer

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
  v6 = [AMDDODMLModelMetadata alloc];
  id v40 = [(AMDDODMLModelMetadata *)v6 initModelMetadata:location[0] error:v43 errorDomain:v42];
  if (v40)
  {
    id v19 = [v40 modelPath];
    v18 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:");
    id v38 = [(NSURL *)v18 URLByDeletingLastPathComponent];

    id v37 = objc_alloc_init((Class)MLModelConfiguration);
    [v37 setComputeUnits:0];
    id v36 = +[MLModel modelWithContentsOfURL:v38 configuration:v37 error:v43];
    if (v36)
    {
      id v15 = objc_alloc((Class)MLProgramTrainer);
      id v17 = [v36 program];
      id v16 = [v40 learningRate];
      [v16 doubleValue];
      id v35 = objc_msgSend(v15, "initWithProgram:learningRate:error:", v17, v43);

      if (v35)
      {
        id v34 = objc_msgSend(v41, "numberOfIterationsPerEpoch:", objc_msgSend(v40, "batchSize"));
        if (v34)
        {
          id v33 = [v40 numLocalIterations];
          id v13 = [v40 learningRateSchedule];
          BOOL v14 = 0;
          if (!v13) {
            BOOL v14 = (uint64_t)[v40 numEpochs] > 0;
          }

          if (v14) {
            id v33 = (id)((void)[v40 numEpochs] * (void)v34);
          }
          id v32 = [(AMDCoreMLTrainer *)v45 computeAndGetMetrics:v40 programTrainer:v35 numIterationsToTrain:v33 error:v43 errorDomain:v42 dataProvider:v41 localTrainingStage:0];
          if (v32)
          {
            id v31 = [(AMDCoreMLTrainer *)v45 computeAndGetMetrics:v40 programTrainer:v35 numIterationsToTrain:v33 error:v43 errorDomain:v42 dataProvider:v41 localTrainingStage:1];
            if (v31)
            {
              id v30 = [v35 copyCurrentTrainingDelta];
              id v29 = [v30 flattenedModelUpdate];
              id v28 = [(AMDCoreMLTrainer *)v45 computeAndGetMetrics:v40 programTrainer:v35 numIterationsToTrain:v33 error:v43 errorDomain:v42 dataProvider:v41 localTrainingStage:2];
              if (v28)
              {
                id v27 = [v32 objectForKey:LossBeforeEachLocalIteration];
                id v26 = [v28 objectForKey:LossAfterEachLocalIteration];
                id v25 = [v31 objectForKey:LossDuringEachLocalIteration];
                id v24 = +[NSMutableDictionary dictionary];
                [v24 addEntriesFromDictionary:v32];
                [v24 addEntriesFromDictionary:v31];
                [v24 addEntriesFromDictionary:v28];
                [v24 removeObjectForKey:LossBeforeEachLocalIteration];
                [v24 removeObjectForKey:LossDuringEachLocalIteration];
                [v24 removeObjectForKey:LossAfterEachLocalIteration];
                id v23 = +[NSMutableDictionary dictionary];
                [v23 setObject:v29 forKey:ModelDeltas];
                id v11 = v23;
                id v12 = [v40 weightNames];
                objc_msgSend(v11, "setObject:forKey:");

                [v23 setObject:v27 forKey:LossBeforeEachLocalIteration];
                [v23 setObject:v25 forKey:LossDuringEachLocalIteration];
                [v23 setObject:v26 forKey:LossAfterEachLocalIteration];
                [v23 setObject:v24 forKey:ModelMetrics];
                id v46 = [(AMDCoreMLTrainer *)v45 taskResultFromDict:v23];
                int v39 = 1;
                objc_storeStrong(&v23, 0);
                objc_storeStrong(&v24, 0);
                objc_storeStrong(&v25, 0);
                objc_storeStrong(&v26, 0);
                objc_storeStrong(&v27, 0);
              }
              else
              {
                id v46 = 0;
                int v39 = 1;
              }
              objc_storeStrong(&v28, 0);
              objc_storeStrong(&v29, 0);
              objc_storeStrong(&v30, 0);
            }
            else
            {
              id v46 = 0;
              int v39 = 1;
            }
            objc_storeStrong(&v31, 0);
          }
          else
          {
            id v46 = 0;
            int v39 = 1;
          }
          objc_storeStrong(&v32, 0);
        }
        else
        {
          id v7 = objc_alloc((Class)NSError);
          id v8 = [v7 initWithDomain:v42 code:127 userInfo:0];
          id *v43 = v8;
          id v46 = 0;
          int v39 = 1;
        }
      }
      else
      {
        id v46 = 0;
        int v39 = 1;
      }
      objc_storeStrong(&v35, 0);
    }
    else
    {
      id v46 = 0;
      int v39 = 1;
    }
    objc_storeStrong(&v36, 0);
    objc_storeStrong(&v37, 0);
    objc_storeStrong(&v38, 0);
  }
  else
  {
    id v46 = 0;
    int v39 = 1;
  }
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(location, 0);
  v9 = v46;

  return v9;
}

- (id)computeAndGetMetrics:(id)a3 programTrainer:(id)a4 numIterationsToTrain:(int64_t)a5 error:(id *)a6 errorDomain:(id)a7 dataProvider:(id)a8 localTrainingStage:(unint64_t)a9
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v77 = 0;
  objc_storeStrong(&v77, a4);
  int64_t v76 = a5;
  v75 = a6;
  id v74 = 0;
  objc_storeStrong(&v74, a7);
  id v73 = 0;
  objc_storeStrong(&v73, a8);
  unint64_t v72 = a9;
  id v71 = 0;
  id v70 = 0;
  if (a9 == 1)
  {
    objc_storeStrong(&v71, LossDuringEachLocalIteration);
    objc_storeStrong(&v70, DuringIterationMetricsSuffix);
  }
  else if (v72)
  {
    if (v72 == 2)
    {
      objc_storeStrong(&v71, LossAfterEachLocalIteration);
      objc_storeStrong(&v70, AfterIterationMetricsSuffix);
    }
  }
  else
  {
    objc_storeStrong(&v71, LossBeforeEachLocalIteration);
    objc_storeStrong(&v70, BeforeIterationMetricsSuffix);
  }
  id v69 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:0];
  for (int i = 0; i < v76; ++i)
  {
    id v51 = v73;
    id v9 = [location[0] batchSize];
    id v67 = [v51 fetchData:v9 error:v75 errorDomain:v74];
    if (v67)
    {
      id v10 = [location[0] learningRateSchedule];
      BOOL v50 = v10 == 0;

      if (!v50)
      {
        id v49 = [location[0] learningRateSchedule];
        id v48 = [v49 objectAtIndexedSubscript:i];
        [v48 doubleValue];
        objc_msgSend(v77, "setLearningRate:");
      }
      id v65 = 0;
      if (v72 == 1)
      {
        id v45 = v77;
        id v44 = v67;
        id v47 = [location[0] metricsNames];
        id v46 = +[NSSet setWithArray:](NSSet, "setWithArray:");
        id v11 = objc_msgSend(v45, "trainUsingTrainingData:evaluationMetricNames:error:", v44);
        id v12 = v65;
        id v65 = v11;
      }
      else
      {
        id v41 = v77;
        id v40 = v67;
        id v43 = [location[0] metricsNames];
        id v42 = +[NSSet setWithArray:](NSSet, "setWithArray:");
        id v13 = objc_msgSend(v41, "evaluateUsingTestData:evaluationMetricNames:error:", v40);
        id v14 = v65;
        id v65 = v13;
      }
      if (v65)
      {
        [v65 loss];
        NSLog(@"Loss: %f", v15);
        id v64 = [v69 valueForKey:v71];
        if (!v64)
        {
          id v16 = [objc_alloc((Class)NSMutableArray) initWithCapacity:0];
          id v17 = v64;
          id v64 = v16;

          [v69 setValue:v64 forKey:v71];
        }
        id v35 = v64;
        [v65 loss];
        id v36 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        objc_msgSend(v35, "addObject:");

        id v37 = [v65 evaluationMetrics];
        id v63 = [v37 featuresAtIndex:0];

        memset(__b, 0, sizeof(__b));
        id v38 = [location[0] metricsNames];
        id v39 = [v38 countByEnumeratingWithState:__b objects:v80 count:16];
        if (v39)
        {
          uint64_t v32 = *(void *)__b[2];
          uint64_t v33 = 0;
          id v34 = v39;
          while (1)
          {
            uint64_t v31 = v33;
            if (*(void *)__b[2] != v32) {
              objc_enumerationMutation(v38);
            }
            id v62 = *(id *)(__b[1] + 8 * v33);
            id v60 = [v63 featureValueForName:v62];
            if (v60)
            {
              int v59 = 0;
              id v29 = [v60 multiArrayValue];
              id v28 = [v29 objectAtIndexedSubscript:0];
              [v28 floatValue];
              int v30 = v20;

              int v59 = v30;
              id v58 = [v62 stringByAppendingString:v70];
              id v57 = [v69 valueForKey:v58];
              if (!v57)
              {
                id v22 = [objc_alloc((Class)NSMutableArray) initWithCapacity:0];
                id v23 = v57;
                id v57 = v22;

                [v69 setValue:v57 forKey:v58];
              }
              id v26 = v57;
              LODWORD(v21) = v59;
              id v27 = +[NSNumber numberWithFloat:v21];
              objc_msgSend(v26, "addObject:");

              objc_storeStrong(&v57, 0);
              objc_storeStrong(&v58, 0);
              int v66 = 0;
            }
            else
            {
              id v18 = objc_alloc((Class)NSError);
              id v19 = [v18 initWithDomain:v74 code:61 userInfo:0];
              id *v75 = v19;
              id v79 = 0;
              int v66 = 1;
            }
            objc_storeStrong(&v60, 0);
            if (v66) {
              break;
            }
            ++v33;
            if (v31 + 1 >= (unint64_t)v34)
            {
              uint64_t v33 = 0;
              id v34 = [v38 countByEnumeratingWithState:__b objects:v80 count:16];
              if (!v34) {
                goto LABEL_32;
              }
            }
          }
        }
        else
        {
LABEL_32:
          int v66 = 0;
        }

        if (!v66) {
          int v66 = 0;
        }
        objc_storeStrong(&v63, 0);
        objc_storeStrong(&v64, 0);
      }
      else
      {
        id v79 = 0;
        int v66 = 1;
      }
      objc_storeStrong(&v65, 0);
    }
    else
    {
      id v79 = 0;
      int v66 = 1;
    }
    objc_storeStrong(&v67, 0);
    if (v66) {
      goto LABEL_40;
    }
  }
  id v79 = v69;
  int v66 = 1;
LABEL_40:
  objc_storeStrong(&v69, 0);
  objc_storeStrong(&v70, 0);
  objc_storeStrong(&v71, 0);
  objc_storeStrong(&v73, 0);
  objc_storeStrong(&v74, 0);
  objc_storeStrong(&v77, 0);
  objc_storeStrong(location, 0);
  id v24 = v79;

  return v24;
}

- (id)taskResultFromDict:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = [location[0] mutableCopy];
  id v6 = [v7 objectForKeyedSubscript:ModelDeltas];
  [v7 removeObjectForKey:ModelDeltas];
  id v3 = objc_alloc((Class)MLRTaskResult);
  id v5 = [v3 initWithJSONResult:v7 unprivatizedVector:v6];
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);

  return v5;
}

@end