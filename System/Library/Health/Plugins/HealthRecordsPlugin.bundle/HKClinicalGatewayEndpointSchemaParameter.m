@interface HKClinicalGatewayEndpointSchemaParameter
+ (id)parameterFromDefinition:(id)a3 error:(id *)a4;
+ (id)parametersFromDefinitions:(id)a3 error:(id *)a4;
@end

@implementation HKClinicalGatewayEndpointSchemaParameter

+ (id)parametersFromDefinitions:(id)a3 error:(id *)a4
{
  id v5 = a3;
  objc_opt_class();
  v6 = HKSafeObject();

  if (v6)
  {
    v7 = objc_msgSend(v6, "hk_map:error:", &stru_114348, a4);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)parameterFromDefinition:(id)a3 error:(id *)a4
{
  id v5 = a3;
  objc_opt_class();
  v6 = HKSafeObject();

  if (v6)
  {
    v7 = [v6 objectForKeyedSubscript:@"param"];
    objc_opt_class();
    v8 = HKSafeObject();

    if (v8)
    {
      objc_opt_class();
      v9 = HDSafeObjectFromDictionaryIfExists(v6, @"literal");
      id v10 = 0;
      id v11 = v10;
      if (v9 || !v10)
      {

        objc_opt_class();
        v13 = HDSafeObjectFromDictionaryIfExists(v6, @"variable");
        id v14 = 0;
        id v11 = v14;
        if (v13 || !v14)
        {

          objc_opt_class();
          v15 = HDSafeObjectFromDictionaryIfExists(v6, @"mode");
          id v16 = 0;
          id v11 = v16;
          if (v15 || !v16)
          {
            v17 = objc_msgSend(v15, "hk_map:error:", &stru_114368, a4);
            if (v17 || ![v15 count]) {
              id v12 = [objc_alloc((Class)HKClinicalGatewayEndpointSchemaParameter) initWithParam:v8 literal:v9 variable:v13 mode:v17];
            }
            else {
              id v12 = 0;
            }
          }
          else if (a4)
          {
            id v12 = 0;
            *a4 = v16;
          }
          else
          {
            _HKLogDroppedError();
            id v12 = 0;
          }
        }
        else if (a4)
        {
          id v11 = v14;
          id v12 = 0;
          *a4 = v11;
        }
        else
        {
          _HKLogDroppedError();
          id v12 = 0;
        }
      }
      else if (a4)
      {
        id v11 = v10;
        id v12 = 0;
        *a4 = v11;
      }
      else
      {
        _HKLogDroppedError();
        id v12 = 0;
      }
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

@end