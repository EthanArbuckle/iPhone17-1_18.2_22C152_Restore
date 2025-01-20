@interface HKClinicalGatewayReference
+ (id)gatewayReferenceFromDefinition:(id)a3 error:(id *)a4;
+ (id)gatewayReferencesFromDefinitions:(id)a3 error:(id *)a4;
@end

@implementation HKClinicalGatewayReference

+ (id)gatewayReferencesFromDefinitions:(id)a3 error:(id *)a4
{
  id v5 = a3;
  objc_opt_class();
  v6 = HKSafeObject();

  if (v6)
  {
    v7 = objc_msgSend(v6, "hk_map:error:", &stru_1143A8, a4);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)gatewayReferenceFromDefinition:(id)a3 error:(id *)a4
{
  id v5 = a3;
  objc_opt_class();
  v6 = HKSafeObject();

  if (v6)
  {
    uint64_t v7 = objc_opt_class();
    v8 = HDSafeObjectFromDictionary(v6, @"fhirVersion", v7, (uint64_t)a4);
    if (v8)
    {
      v9 = +[HKFHIRVersion versionFromVersionString:v8 error:a4];
      if (v9)
      {
        uint64_t v10 = objc_opt_class();
        v11 = HDSafeObjectFromDictionary(v6, @"gatewayID", v10, (uint64_t)a4);
        if (v11)
        {
          uint64_t v12 = objc_opt_class();
          v13 = HDSafeObjectFromDictionary(v6, @"gatewayBatchID", v12, (uint64_t)a4);
          if (v13)
          {
            uint64_t v14 = objc_opt_class();
            v15 = HDSafeObjectFromDictionary(v6, @"minCompatibleApiVersion", v14, (uint64_t)a4);
            if (v15) {
              id v16 = objc_msgSend(objc_alloc((Class)HKClinicalGatewayReference), "initWithGatewayID:gatewayBatchID:minCompatibleAPIVersion:FHIRVersion:", v11, v13, objc_msgSend(v15, "integerValue"), v9);
            }
            else {
              id v16 = 0;
            }
          }
          else
          {
            id v16 = 0;
          }
        }
        else
        {
          id v16 = 0;
        }
      }
      else
      {
        id v16 = 0;
      }
    }
    else
    {
      id v16 = 0;
    }
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

@end