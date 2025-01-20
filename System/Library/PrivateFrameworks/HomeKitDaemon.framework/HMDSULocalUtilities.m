@interface HMDSULocalUtilities
+ (id)descriptorFromControllerStatus:(id)a3 controllerDescriptor:(id)a4 errorCode:(id)a5;
+ (id)progressFromControllerProgress:(id)a3;
+ (void)parseProductVersion:(id)a3 intoMajorVersion:(id *)a4 minorVersion:(id *)a5 updateVersion:(id *)a6;
@end

@implementation HMDSULocalUtilities

+ (id)progressFromControllerProgress:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F0E7F8];
  id v4 = a3;
  id v5 = [v3 alloc];
  [v4 portionComplete];
  int v7 = v6;
  [v4 estimatedTimeRemaining];
  double v9 = v8;

  LODWORD(v10) = v7;
  v11 = (void *)[v5 initWithPercentageComplete:v10 estimatedTimeRemaining:v9];
  return v11;
}

+ (id)descriptorFromControllerStatus:(id)a3 controllerDescriptor:(id)a4 errorCode:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = [v8 productVersion];

  if (v11)
  {
    v12 = [v8 productVersion];
    id v38 = 0;
    id v39 = 0;
    id v37 = 0;
    [a1 parseProductVersion:v12 intoMajorVersion:&v39 minorVersion:&v38 updateVersion:&v37];
    id v36 = v39;
    id v35 = v38;
    id v34 = v37;
  }
  else
  {
    id v35 = 0;
    id v36 = 0;
    id v34 = 0;
  }
  id v13 = objc_alloc(MEMORY[0x263F0E7D8]);
  unint64_t v14 = [v10 updateState];

  if (v14 <= 0x12) {
    v15 = (void *)v14;
  }
  else {
    v15 = 0;
  }
  uint64_t v16 = [v8 downloadSize];
  if (v16)
  {
    v33 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v8, "downloadSize"));
  }
  else
  {
    v33 = 0;
  }
  v17 = [v8 humanReadableUpdateName];
  v30 = v9;
  uint64_t v31 = v16;
  id v28 = v15;
  HIDWORD(v26) = [v8 rampEnabled];
  if (HIDWORD(v26))
  {
    v32 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "rampEnabled"));
  }
  else
  {
    v32 = 0;
  }
  v18 = [v8 documentation];
  v19 = [v18 serverAssetURL];
  v20 = [v8 documentation];
  v21 = [v20 serverAssetAlgorithm];
  v22 = [v8 documentation];
  v23 = [v22 serverAssetMeasurement];
  v24 = [v8 productBuildVersion];
  LOBYTE(v26) = 1;
  id v29 = (id)[v13 initWithStatus:v28 downloadSize:v33 humanReadableUpdateName:v17 rampEnabled:v32 errorCode:v30 serverAssetURL:v19 serverAssetAlgorithm:v21 serverAssetMeasurement:v23 majorVersion:v36 minorVersion:v35 updateVersion:v34 buildVersion:v24 softwareVersionRequiresMetadata:v26];

  if (v27) {
  if (v31)
  }

  return v29;
}

+ (void)parseProductVersion:(id)a3 intoMajorVersion:(id *)a4 minorVersion:(id *)a5 updateVersion:(id *)a6
{
  id v26 = [a3 componentsSeparatedByString:@"."];
  BOOL v10 = (unint64_t)[v26 count] >= 2;
  v11 = v26;
  if (v10)
  {
    v12 = NSNumber;
    id v13 = [v26 objectAtIndex:0];
    objc_msgSend(v12, "numberWithInteger:", objc_msgSend(v13, "integerValue"));
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    unint64_t v14 = NSNumber;
    v15 = [v26 objectAtIndex:1];
    objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v15, "integerValue"));
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v16 = NSNumber;
    uint64_t v17 = [v26 count];
    if (v17 == 3)
    {
      int v6 = [v26 objectAtIndex:2];
      uint64_t v18 = [v6 integerValue];
    }
    else
    {
      uint64_t v18 = 0;
    }
    *a6 = [v16 numberWithInteger:v18];
    if (v17 == 3) {

    }
    BOOL v19 = [*a4 integerValue] == 9;
    v11 = v26;
    if (v19)
    {
      BOOL v19 = [*a5 integerValue] == 9;
      v11 = v26;
      if (v19)
      {
        if ((unint64_t)[v26 count] >= 4)
        {
          v20 = NSNumber;
          v21 = [v26 objectAtIndex:2];
          objc_msgSend(v20, "numberWithInteger:", objc_msgSend(v21, "integerValue"));
          *a4 = (id)objc_claimAutoreleasedReturnValue();

          v22 = NSNumber;
          v23 = [v26 objectAtIndex:3];
          objc_msgSend(v22, "numberWithInteger:", objc_msgSend(v23, "integerValue"));
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        BOOL v10 = (unint64_t)[v26 count] >= 5;
        v11 = v26;
        if (v10)
        {
          v24 = NSNumber;
          v25 = [v26 objectAtIndex:4];
          objc_msgSend(v24, "numberWithInteger:", objc_msgSend(v25, "integerValue"));
          *a6 = (id)objc_claimAutoreleasedReturnValue();

          v11 = v26;
        }
      }
    }
  }
}

@end