@interface HKClinicalGatewayEndpointSchema
+ (id)endpointSchemaFromDefinition:(id)a3 error:(id *)a4;
+ (id)endpointSchemasFromDefinitions:(id)a3 error:(id *)a4;
@end

@implementation HKClinicalGatewayEndpointSchema

+ (id)endpointSchemasFromDefinitions:(id)a3 error:(id *)a4
{
  id v5 = a3;
  objc_opt_class();
  v6 = HKSafeObject();

  if (v6)
  {
    v7 = objc_msgSend(v6, "hk_map:error:", &stru_114328, a4);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)endpointSchemaFromDefinition:(id)a3 error:(id *)a4
{
  id v5 = a3;
  objc_opt_class();
  v6 = HKSafeObject();

  if (!v6)
  {
    id v22 = 0;
    goto LABEL_43;
  }
  uint64_t v7 = objc_opt_class();
  v8 = HDSafeObjectFromDictionary(v6, @"auth", v7, (uint64_t)a4);
  if (v8)
  {
    uint64_t v9 = objc_opt_class();
    v10 = HDSafeObjectFromDictionary(v6, @"enabled", v9, (uint64_t)a4);
    if (!v10)
    {
      id v22 = 0;
LABEL_41:

      goto LABEL_42;
    }
    uint64_t v11 = objc_opt_class();
    v12 = HDSafeObjectFromDictionary(v6, @"method", v11, (uint64_t)a4);
    if (!v12)
    {
      id v22 = 0;
LABEL_40:

      goto LABEL_41;
    }
    uint64_t v13 = objc_opt_class();
    v14 = HDSafeObjectFromDictionary(v6, @"minCompatibleApiVersion", v13, (uint64_t)a4);
    if (!v14)
    {
      id v22 = 0;
LABEL_39:

      goto LABEL_40;
    }
    uint64_t v15 = objc_opt_class();
    v16 = HDSafeObjectFromDictionary(v6, @"name", v15, (uint64_t)a4);
    if (!v16)
    {
      id v22 = 0;
LABEL_38:

      goto LABEL_39;
    }
    uint64_t v17 = objc_opt_class();
    v18 = HDSafeObjectFromDictionary(v6, @"url", v17, (uint64_t)a4);
    if (!v18)
    {
      id v22 = 0;
LABEL_37:

      goto LABEL_38;
    }
    objc_opt_class();
    v19 = HDSafeObjectFromDictionaryIfExists(v6, @"body");
    id v20 = 0;
    v35 = v18;
    if (!v19 && v20)
    {
      v21 = v20;
      if (a4)
      {
        id v22 = 0;
        *a4 = v20;
      }
      else
      {
        _HKLogDroppedError();
        id v22 = 0;
      }
      goto LABEL_36;
    }
    id v32 = v20;
    v23 = [v6 objectForKeyedSubscript:@"form"];

    v34 = v19;
    if (v23)
    {
      v24 = [v6 objectForKeyedSubscript:@"form"];
      id v22 = +[HKClinicalGatewayEndpointSchemaParameter parametersFromDefinitions:v24 error:a4];

      v19 = v34;
      v33 = v22;
      if (!v22) {
        goto LABEL_35;
      }
    }
    else
    {
      v33 = 0;
    }
    v25 = [v6 objectForKeyedSubscript:@"headers"];

    if (v25)
    {
      v26 = [v6 objectForKeyedSubscript:@"headers"];
      id v22 = +[HKClinicalGatewayEndpointSchemaParameter parametersFromDefinitions:v26 error:a4];

      v19 = v34;
      v27 = v22;
      if (!v22) {
        goto LABEL_34;
      }
    }
    else
    {
      v27 = 0;
    }
    v28 = [v6 objectForKeyedSubscript:@"query"];

    if (v28)
    {
      v29 = [v6 objectForKeyedSubscript:@"query"];
      v30 = +[HKClinicalGatewayEndpointSchemaParameter parametersFromDefinitions:v29 error:a4];

      if (!v30)
      {
        id v22 = 0;
LABEL_33:

        v19 = v34;
LABEL_34:

LABEL_35:
        v21 = v32;
LABEL_36:

        v18 = v35;
        goto LABEL_37;
      }
    }
    else
    {
      v30 = 0;
    }
    id v22 = objc_msgSend(objc_alloc((Class)HKClinicalGatewayEndpointSchema), "initWithAuth:body:enabled:form:headers:method:minCompatibleAPIVersion:name:query:URL:", v8, v34, objc_msgSend(v10, "BOOLValue"), v33, v27, v12, objc_msgSend(v14, "integerValue"), v16, v30, v35);

    goto LABEL_33;
  }
  id v22 = 0;
LABEL_42:

LABEL_43:

  return v22;
}

@end