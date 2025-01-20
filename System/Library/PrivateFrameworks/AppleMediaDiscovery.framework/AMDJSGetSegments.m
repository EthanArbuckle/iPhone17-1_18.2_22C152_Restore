@interface AMDJSGetSegments
+ (id)getAppSegments:(id)a3 error:(id *)a4;
@end

@implementation AMDJSGetSegments

+ (id)getAppSegments:(id)a3 error:(id *)a4
{
  v26[3] = *MEMORY[0x263EF8340];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = a4;
  id v15 = +[AMDWorkflow getCurrentWorkflowForDomain:andTreatmentId:andUseCaseId:error:](AMDWorkflow, "getCurrentWorkflowForDomain:andTreatmentId:andUseCaseId:error:", +[AMDDomains getCodeForDomain:@"apps"], 0, 0x26BEB06F8, a4);
  if (*a4)
  {
    id v18 = 0;
    int v14 = 1;
  }
  else if (v15)
  {
    id v13 = (id)[v15 first];
    id v12 = +[AMDAppSegment getSegmentsInfoForTreatment:v13 error:v16];
    if (*v16)
    {
      id v18 = 0;
      int v14 = 1;
    }
    else
    {
      id v11 = (id)[v12 first];
      id v10 = (id)[v12 second];
      id v6 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
      +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:");

      v23[0] = @"segmentDataType";
      v24[0] = &unk_26BEC1808;
      v23[1] = @"segmentData";
      v24[1] = v11;
      v23[2] = @"metadata";
      v21 = @"metrics";
      v19[0] = @"algoId";
      v20[0] = v10;
      v19[1] = @"treatmentId";
      v20[1] = v13;
      id v8 = (id)[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
      id v22 = v8;
      id v7 = (id)[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      v24[2] = v7;
      id v18 = (id)[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:3];

      int v14 = 1;
      objc_storeStrong(&v10, 0);
      objc_storeStrong(&v11, 0);
    }
    objc_storeStrong(&v12, 0);
    objc_storeStrong(&v13, 0);
  }
  else
  {
    v25[0] = @"segmentDataType";
    v26[0] = &unk_26BEC1808;
    v25[1] = @"segmentData";
    v26[1] = MEMORY[0x263EFFA78];
    v25[2] = @"metadata";
    v26[2] = &unk_26BEC25F8;
    id v18 = (id)[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:3];
    int v14 = 1;
  }
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  v4 = v18;

  return v4;
}

@end