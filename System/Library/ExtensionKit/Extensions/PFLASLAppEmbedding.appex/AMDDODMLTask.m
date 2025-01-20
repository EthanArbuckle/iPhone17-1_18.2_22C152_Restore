@interface AMDDODMLTask
- (AMDDODMLTask)initWithErrorDomain:(id)a3;
- (NSString)errorDomain;
- (id)performTask:(id)a3 error:(id *)a4;
- (void)setErrorDomain:(id)a3;
@end

@implementation AMDDODMLTask

- (AMDDODMLTask)initWithErrorDomain:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = v8;
  id v8 = 0;
  v6.receiver = v3;
  v6.super_class = (Class)AMDDODMLTask;
  v5 = [(AMDDODMLTask *)&v6 init];
  id v8 = v5;
  objc_storeStrong(&v8, v5);
  if (v5)
  {
    [v8 setErrorDomain:location[0]];
    v9 = (AMDDODMLTask *)v8;
  }
  else
  {
    v9 = 0;
  }
  objc_storeStrong(location, 0);
  objc_storeStrong(&v8, 0);
  return v9;
}

- (id)performTask:(id)a3 error:(id *)a4
{
  v87 = a4;
  v103 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v101 = v87;
  id v88 = [location[0] parameters];
  id v85 = v88;
  id v86 = [v85 objectForKeyedSubscript:AttachmentInstructions];
  id v100 = v86;

  v84 = [AMDDODMLAttachmentProcessor alloc];
  id v83 = [location[0] attachments];
  id v79 = v83;
  id v80 = v100;
  v81 = v87;
  v82 = [(AMDDODMLTask *)v103 errorDomain];
  id v77 = v82;
  v78 = -[AMDDODMLAttachmentProcessor initWithAttachmentURLs:withInstructions:error:errorDomain:](v84, "initWithAttachmentURLs:withInstructions:error:errorDomain:", v79, v100, v87);
  id v99 = v78;

  if (v78)
  {
    id v76 = [location[0] parameters];
    id v74 = v76;
    id v75 = [v74 objectForKeyedSubscript:DataProcessing];
    id v97 = v75;

    if (v97)
    {
      v69 = [AMDDODMLDataProcessor alloc];
      v68 = [(AMDDODMLDataProcessor *)v69 initWithActionArray:v97 withAttachmentProcessor:v99];
      id v96 = v68;
      if (v68)
      {
        id v61 = v96;
        v62 = v101;
        id v63 = [(AMDDODMLTask *)v103 errorDomain];
        id v59 = v63;
        id v60 = objc_msgSend(v96, "processRecipe:errorDomain:", v101);
        id v95 = v60;

        if (v95)
        {
          v58 = [AMDDODMLModelMetadata alloc];
          id v55 = location[0];
          v56 = v101;
          id v57 = [(AMDDODMLTask *)v103 errorDomain];
          id v53 = v57;
          id v54 = -[AMDDODMLModelMetadata initModelMetadata:error:errorDomain:](v58, "initModelMetadata:error:errorDomain:", v55, v101);
          id v94 = v54;

          id v93 = 0;
          id v52 = [v54 useCoreMLTrainer];
          id v50 = v52;
          id v51 = [v50 longValue];
          BOOL v49 = v51 != 0;

          if (v51)
          {
            v33 = [AMDCoreMLDataProvider alloc];
            id v32 = [v96 getInputSize];
            id v31 = [v96 getElementsInSampleDictionary];
            id v29 = v31;
            id v30 = [v96 getInputDictionary];
            id v27 = v30;
            v28 = -[AMDCoreMLDataProvider initWithInputs:featureSizeMap:inputDictionary:](v33, "initWithInputs:featureSizeMap:inputDictionary:", v32, v29);
            id v90 = v28;

            v26 = objc_alloc_init(AMDCoreMLTrainer);
            id v89 = v26;
            v22 = v26;
            id v23 = location[0];
            v24 = v101;
            id v25 = [(AMDDODMLTask *)v103 errorDomain];
            id v20 = v25;
            id v21 = -[AMDCoreMLTrainer runTask:error:errorDomain:dataProvider:](v26, "runTask:error:errorDomain:dataProvider:", v23, v101);
            id v10 = v21;
            id v11 = v93;
            id v93 = v10;

            id v19 = 0;
            objc_storeStrong(&v89, 0);
            objc_storeStrong(&v90, 0);
          }
          else
          {
            v48 = [AMDDODMLEspressoDataProvider alloc];
            id v47 = [v96 getInputSize];
            id v46 = [v96 getElementsInSampleDictionary];
            id v44 = v46;
            id v45 = [v96 getInputDictionary];
            id v42 = v45;
            v43 = -[AMDDODMLEspressoDataProvider initWithInputs:featureSizeMap:inputDictionary:](v48, "initWithInputs:featureSizeMap:inputDictionary:", v47, v44);
            id v92 = v43;

            v41 = objc_alloc_init(AMDDODMLTrainer);
            id v91 = v41;
            v37 = v41;
            id v38 = location[0];
            v39 = v101;
            id v40 = [(AMDDODMLTask *)v103 errorDomain];
            id v35 = v40;
            id v36 = -[AMDDODMLTrainer runTask:error:errorDomain:dataProvider:attachmentProcessor:](v41, "runTask:error:errorDomain:dataProvider:attachmentProcessor:", v38, v101);
            id v8 = v36;
            id v9 = v93;
            id v93 = v8;

            id obj = 0;
            objc_storeStrong(&v91, 0);
            objc_storeStrong(&v92, 0);
          }
          if (v93)
          {
            id v18 = [v93 JSONResult];
            id v17 = v18;
            NSLog(@"%@", v17);
          }
          else
          {
            NSLog(@"result is nil");
          }
          v15 = &v93;
          id v104 = v93;
          int v98 = 1;
          id v16 = 0;
          objc_storeStrong(v15, 0);
          objc_storeStrong(&v94, v16);
        }
        else
        {
          id v104 = 0;
          int v98 = 1;
        }
        objc_storeStrong(&v95, 0);
      }
      else
      {
        id v67 = objc_alloc((Class)NSError);
        id v66 = [(AMDDODMLTask *)v103 errorDomain];
        id v64 = v66;
        id v65 = objc_msgSend(v67, "initWithDomain:code:userInfo:");
        id v6 = v65;
        id v7 = v64;
        id *v101 = v6;

        id v104 = 0;
        int v98 = 1;
      }
      objc_storeStrong(&v96, 0);
    }
    else
    {
      id v73 = objc_alloc((Class)NSError);
      id v72 = [(AMDDODMLTask *)v103 errorDomain];
      id v70 = v72;
      id v71 = objc_msgSend(v73, "initWithDomain:code:userInfo:");
      id v4 = v71;
      id v5 = v70;
      id *v101 = v4;

      id v104 = 0;
      int v98 = 1;
    }
    objc_storeStrong(&v97, 0);
  }
  else
  {
    id v104 = 0;
    int v98 = 1;
  }
  id v14 = 0;
  objc_storeStrong(&v99, 0);
  objc_storeStrong(&v100, v14);
  objc_storeStrong(location, 0);
  v12 = v104;

  return v12;
}

- (NSString)errorDomain
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setErrorDomain:(id)a3
{
}

- (void).cxx_destruct
{
}

@end