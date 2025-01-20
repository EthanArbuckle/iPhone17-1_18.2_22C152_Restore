@interface HDFHIRAuthorizationSchema
+ (BOOL)validateName:(id)a3 error:(id *)a4;
- (id)bodyParameters;
- (id)name;
- (id)queryParameters;
- (int64_t)authorizationEndpointType;
@end

@implementation HDFHIRAuthorizationSchema

- (int64_t)authorizationEndpointType
{
  v5.receiver = self;
  v5.super_class = (Class)HDFHIRAuthorizationSchema;
  v2 = [(HDFHIREndpointSchema *)&v5 name];
  id v3 = sub_100001540((uint64_t)v2);

  return (int64_t)v3;
}

- (id)name
{
  int64_t v2 = [(HDFHIRAuthorizationSchema *)self authorizationEndpointType];
  if ((unint64_t)(v2 - 1) > 2) {
    return 0;
  }
  else {
    return *(&off_1000143E0 + v2 - 1);
  }
}

- (id)queryParameters
{
  v32.receiver = self;
  v32.super_class = (Class)HDFHIRAuthorizationSchema;
  id obj = [(HDFHIREndpointSchema *)&v32 queryParameters];
  id v3 = [(HDFHIRAuthorizationSchema *)self name];
  if (sub_100001540((uint64_t)v3) == (id)2)
  {
    v4 = [(HDFHIREndpointSchema *)self authenticationInformation];
    [v4 PKCEAlgorithm];
    int IsSupported = HKFHIRServerAuthenticationPKCEAlgorithmIsSupported();

    if (!IsSupported) {
      goto LABEL_26;
    }
    v25 = self;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = obj;
    id v6 = [obj countByEnumeratingWithState:&v28 objects:v37 count:16];
    if (v6)
    {
      id v7 = v6;
      char v8 = 0;
      char v27 = 0;
      uint64_t v9 = *(void *)v29;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v29 != v9) {
            objc_enumerationMutation(obj);
          }
          v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          v12 = [v11 objectForKeyedSubscript:@"param"];
          if (v12 == @"code_challenge"
            || (v13 = v12,
                [v11 objectForKeyedSubscript:@"param"],
                v14 = objc_claimAutoreleasedReturnValue(),
                unsigned __int8 v15 = [v14 isEqualToString:@"code_challenge"],
                v14,
                v13,
                (v15 & 1) != 0))
          {
            char v8 = 1;
          }
          else
          {
            v16 = [v11 objectForKeyedSubscript:@"param"];
            if (v16 == @"code_challenge_method")
            {
              unsigned __int8 v18 = 1;
            }
            else
            {
              v17 = [v11 objectForKeyedSubscript:@"param"];
              unsigned __int8 v18 = [v17 isEqualToString:@"code_challenge_method"];
            }
            v27 |= v18;
          }
        }
        id v7 = [obj countByEnumeratingWithState:&v28 objects:v37 count:16];
      }
      while (v7);
    }
    else
    {
      char v8 = 0;
      char v27 = 0;
    }

    id v3 = objc_alloc_init((Class)NSMutableArray);
    if ((v8 & 1) == 0)
    {
      v35[0] = @"param";
      v35[1] = @"variable";
      v36[0] = @"code_challenge";
      v36[1] = @"PKCEChallenge";
      v19 = +[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];
      [v3 addObject:v19];
    }
    if ((v27 & 1) == 0)
    {
      v34[0] = @"code_challenge_method";
      v33[0] = @"param";
      v33[1] = @"literal";
      v20 = [(HDFHIREndpointSchema *)v25 authenticationInformation];
      [v20 PKCEAlgorithm];
      v21 = NSStringFromHKFHIRServerAuthenticationPKCEAlgorithm();
      v34[1] = v21;
      v22 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];
      [v3 addObject:v22];
    }
    if ([v3 count])
    {
      uint64_t v23 = [obj arrayByAddingObjectsFromArray:v3];

      id obj = (id)v23;
    }
  }

LABEL_26:

  return obj;
}

- (id)bodyParameters
{
  v22.receiver = self;
  v22.super_class = (Class)HDFHIRAuthorizationSchema;
  id v3 = [(HDFHIREndpointSchema *)&v22 bodyParameters];
  v4 = [(HDFHIRAuthorizationSchema *)self name];
  if (sub_100001540((uint64_t)v4) != (id)1) {
    goto LABEL_17;
  }
  objc_super v5 = [(HDFHIREndpointSchema *)self authenticationInformation];
  [v5 PKCEAlgorithm];
  int IsSupported = HKFHIRServerAuthenticationPKCEAlgorithmIsSupported();

  if (!IsSupported) {
    goto LABEL_18;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = v3;
  id v7 = [v3 countByEnumeratingWithState:&v18 objects:v25 count:16];
  if (!v7)
  {

LABEL_16:
    v23[0] = @"param";
    v23[1] = @"variable";
    v24[0] = @"code_verifier";
    v24[1] = @"PKCEVerifier";
    v4 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v23, 2, (void)v18);
    uint64_t v16 = [v3 arrayByAddingObject:v4];

    id v3 = (id)v16;
LABEL_17:

    goto LABEL_18;
  }
  id v8 = v7;
  char v9 = 0;
  uint64_t v10 = *(void *)v19;
  do
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v19 != v10) {
        objc_enumerationMutation(v3);
      }
      v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
      objc_msgSend(v12, "objectForKeyedSubscript:", @"param", (void)v18);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v13 == @"code_verifier")
      {
        unsigned __int8 v15 = 1;
      }
      else
      {
        v14 = [v12 objectForKeyedSubscript:@"param"];
        unsigned __int8 v15 = [v14 isEqualToString:@"code_verifier"];
      }
      v9 |= v15;
    }
    id v8 = [v3 countByEnumeratingWithState:&v18 objects:v25 count:16];
  }
  while (v8);

  if ((v9 & 1) == 0) {
    goto LABEL_16;
  }
LABEL_18:

  return v3;
}

+ (BOOL)validateName:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = sub_100001540((uint64_t)v5);
  if (!v6) {
    +[NSError hk_assignError:a4, 3, @"Invalid name: %@", v5 code format];
  }

  return v6 != 0;
}

@end