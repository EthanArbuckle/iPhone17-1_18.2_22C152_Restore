@interface AMDDODMLTrainer
- (id)runTask:(id)a3 error:(id *)a4 errorDomain:(id)a5 dataProvider:(id)a6 attachmentProcessor:(id)a7;
- (id)taskResultFromDict:(id)a3;
@end

@implementation AMDDODMLTrainer

- (id)runTask:(id)a3 error:(id *)a4 errorDomain:(id)a5 dataProvider:(id)a6 attachmentProcessor:(id)a7
{
  v28 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v26 = a4;
  id v25 = 0;
  objc_storeStrong(&v25, a5);
  id v24 = 0;
  objc_storeStrong(&v24, a6);
  id v23 = 0;
  objc_storeStrong(&v23, a7);
  v7 = [AMDDODMLModelMetadata alloc];
  id v22 = [(AMDDODMLModelMetadata *)v7 initModelMetadata:location[0] error:v26 errorDomain:v25];
  if (v22)
  {
    v8 = [AMDDODMLEspressoModel alloc];
    id v20 = [(AMDDODMLEspressoModel *)v8 initWithModelMetadata:v22 withAttachmentProcessor:v23 error:v26 errorDomain:v25];
    if (v20)
    {
      id v19 = objc_msgSend(v24, "numberOfIterationsPerEpoch:", objc_msgSend(v22, "batchSize"));
      if (v19)
      {
        id v18 = [v22 numLocalIterations];
        if ((uint64_t)[v22 numEpochs] > 0) {
          id v18 = (id)((void)[v22 numEpochs] * (void)v19);
        }
        id v17 = [v20 trainOnData:v24 numLocalIterations:v18 error:v26 errorDomain:v25];
        if (v17) {
          id v29 = [(AMDDODMLTrainer *)v28 taskResultFromDict:v17];
        }
        else {
          id v29 = 0;
        }
        int v21 = 1;
        objc_storeStrong(&v17, 0);
      }
      else
      {
        id v9 = objc_alloc((Class)NSError);
        id v10 = [v9 initWithDomain:v25 code:127 userInfo:0];
        id *v26 = v10;
        id v29 = 0;
        int v21 = 1;
      }
    }
    else
    {
      id v29 = 0;
      int v21 = 1;
    }
    objc_storeStrong(&v20, 0);
  }
  else
  {
    id v29 = 0;
    int v21 = 1;
  }
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
  v11 = v29;

  return v11;
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