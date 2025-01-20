@interface HKClinicalGatewayFeature
+ (id)gatewayFeatureFromDefinition:(id)a3 error:(id *)a4;
+ (id)gatewayFeaturesFromDefinitions:(id)a3 error:(id *)a4;
@end

@implementation HKClinicalGatewayFeature

+ (id)gatewayFeaturesFromDefinitions:(id)a3 error:(id *)a4
{
  id v5 = a3;
  objc_opt_class();
  v6 = HKSafeObject();

  if (v6)
  {
    v7 = objc_msgSend(v6, "hk_map:error:", &stru_114388, a4);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)gatewayFeatureFromDefinition:(id)a3 error:(id *)a4
{
  id v5 = a3;
  objc_opt_class();
  v6 = HKSafeObject();

  if (v6)
  {
    uint64_t v7 = objc_opt_class();
    v8 = HDSafeObjectFromDictionary(v6, @"name", v7, (uint64_t)a4);
    if (v8)
    {
      uint64_t v9 = objc_opt_class();
      v10 = HDSafeObjectFromDictionary(v6, @"minCompatibleApiVersion", v9, (uint64_t)a4);
      if (v10)
      {
        uint64_t v11 = objc_opt_class();
        v12 = HDSafeObjectFromDictionary(v6, @"status", v11, (uint64_t)a4);
        if (v12)
        {
          uint64_t v13 = HKClinicalGatewayFeatureStatusFromString();
          v14 = [v6 objectForKeyedSubscript:@"interactions"];
          v15 = +[HKClinicalGatewayEndpointSchema endpointSchemasFromDefinitions:v14 error:a4];

          if (v15) {
            id v16 = objc_msgSend(objc_alloc((Class)HKClinicalGatewayFeature), "initWithName:minCompatibleAPIVersion:status:interactions:", v8, objc_msgSend(v10, "integerValue"), v13, v15);
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

  return v16;
}

@end