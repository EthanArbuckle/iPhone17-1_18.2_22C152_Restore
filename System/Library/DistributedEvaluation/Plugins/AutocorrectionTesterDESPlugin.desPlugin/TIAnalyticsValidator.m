@interface TIAnalyticsValidator
- (TIAnalyticsValidator)initWithRequiredFieldValues:(id)a3 andOptionalFieldValues:(id)a4;
- (id)validateEvent:(id)a3 withExpectedFieldValues:(id)a4;
@end

@implementation TIAnalyticsValidator

- (TIAnalyticsValidator)initWithRequiredFieldValues:(id)a3 andOptionalFieldValues:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TIAnalyticsValidator;
  v9 = [(TIAnalyticsValidator *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_requiredFieldValues, a3);
    objc_storeStrong((id *)&v10->_optionalFieldValues, a4);
  }

  return v10;
}

- (id)validateEvent:(id)a3 withExpectedFieldValues:(id)a4
{
  id v67 = a3;
  id v6 = a4;
  id v66 = (id)objc_opt_new();
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id v7 = [(NSDictionary *)self->_optionalFieldValues allKeys];
  id v8 = [v7 countByEnumeratingWithState:&v84 objects:v92 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v85;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v85 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v84 + 1) + 8 * i);
        v13 = [(NSDictionary *)self->_requiredFieldValues objectForKey:v12];

        if (v13)
        {
          v14 = +[NSString stringWithFormat:@"Field '%@' is found in both the required and optional field values", v12];
          [v66 addError:v14];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v84 objects:v92 count:16];
    }
    while (v9);
  }

  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id obj = v6;
  id v15 = [obj countByEnumeratingWithState:&v80 objects:v91 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v81;
    do
    {
      v18 = 0;
      do
      {
        if (*(void *)v81 != v17) {
          objc_enumerationMutation(obj);
        }
        v19 = *(void **)(*((void *)&v80 + 1) + 8 * (void)v18);
        if (([v19 isEqualToString:@"finalPreferenceValue"] & 1) == 0)
        {
          v20 = [(NSDictionary *)self->_requiredFieldValues objectForKey:v19];
          if (v20) {
            goto LABEL_17;
          }
          v21 = [(NSDictionary *)self->_optionalFieldValues objectForKey:v19];

          if (!v21)
          {
            v20 = +[NSString stringWithFormat:@"Field '%@' in the expected field values is not found in the required or optional field values", v19];
            [v66 addError:v20];
LABEL_17:
          }
        }
        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v22 = [obj countByEnumeratingWithState:&v80 objects:v91 count:16];
      id v16 = v22;
    }
    while (v22);
  }

  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  v23 = [v67 allKeys];
  id v24 = [v23 countByEnumeratingWithState:&v76 objects:v90 count:16];
  if (!v24) {
    goto LABEL_36;
  }
  id v25 = v24;
  uint64_t v26 = *(void *)v77;
  do
  {
    v27 = 0;
    do
    {
      if (*(void *)v77 != v26) {
        objc_enumerationMutation(v23);
      }
      v28 = *(void **)(*((void *)&v76 + 1) + 8 * (void)v27);
      if (([v28 isEqualToString:@"finalPreferenceValue"] & 1) == 0)
      {
        v29 = [(NSDictionary *)self->_requiredFieldValues objectForKey:v28];
        if (v29) {
          goto LABEL_30;
        }
        v30 = [(NSDictionary *)self->_optionalFieldValues objectForKey:v28];

        if (!v30)
        {
          v29 = +[NSString stringWithFormat:@"Field '%@' unexpected", v28];
          [v66 addError:v29];
LABEL_30:
        }
      }
      v27 = (char *)v27 + 1;
    }
    while (v25 != v27);
    id v31 = [v23 countByEnumeratingWithState:&v76 objects:v90 count:16];
    id v25 = v31;
  }
  while (v31);
LABEL_36:

  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  v32 = self->_requiredFieldValues;
  id v33 = [(NSDictionary *)v32 countByEnumeratingWithState:&v72 objects:v89 count:16];
  if (!v33) {
    goto LABEL_53;
  }
  id v34 = v33;
  uint64_t v35 = *(void *)v73;
  while (2)
  {
    uint64_t v36 = 0;
    while (2)
    {
      if (*(void *)v73 != v35) {
        objc_enumerationMutation(v32);
      }
      uint64_t v37 = *(void *)(*((void *)&v72 + 1) + 8 * v36);
      v38 = [v67 objectForKey:v37];
      if (!v38
        || (+[NSNull null],
            v39 = objc_claimAutoreleasedReturnValue(),
            v39,
            v38 == v39))
      {
        v43 = +[NSString stringWithFormat:@"Field '%@' missing", v37];
        [v66 addError:v43];
      }
      else
      {
        v40 = [obj objectForKey:v37];
        v41 = v40;
        if (v40)
        {
          id v42 = v40;
        }
        else
        {
          id v42 = [(NSDictionary *)self->_requiredFieldValues objectForKey:v37];
        }
        v43 = v42;

        uint64_t v44 = +[NSNull null];
        v45 = v43;
        if (v43 == (void *)v44)
        {
LABEL_50:
        }
        else
        {
          v46 = (void *)v44;
          unsigned __int8 v47 = [v38 isEqual:v43];

          if ((v47 & 1) == 0)
          {
            v45 = +[NSString stringWithFormat:@"Field '%@' expected: %@ actual: %@", v37, v43, v38];
            [v66 addError:v45];
            goto LABEL_50;
          }
        }
      }

      if (v34 != (id)++v36) {
        continue;
      }
      break;
    }
    id v34 = [(NSDictionary *)v32 countByEnumeratingWithState:&v72 objects:v89 count:16];
    if (v34) {
      continue;
    }
    break;
  }
LABEL_53:

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  v48 = self->_optionalFieldValues;
  id v49 = [(NSDictionary *)v48 countByEnumeratingWithState:&v68 objects:v88 count:16];
  if (!v49) {
    goto LABEL_70;
  }
  id v50 = v49;
  uint64_t v51 = *(void *)v69;
  while (2)
  {
    uint64_t v52 = 0;
    while (2)
    {
      if (*(void *)v69 != v51) {
        objc_enumerationMutation(v48);
      }
      uint64_t v53 = *(void *)(*((void *)&v68 + 1) + 8 * v52);
      v54 = [v67 objectForKey:v53];
      if (v54)
      {
        v55 = +[NSNull null];

        if (v54 != v55)
        {
          v56 = [obj objectForKey:v53];
          v57 = v56;
          if (v56)
          {
            id v58 = v56;
          }
          else
          {
            id v58 = [(NSDictionary *)self->_optionalFieldValues objectForKey:v53];
          }
          v59 = v58;

          uint64_t v60 = +[NSNull null];
          v61 = v59;
          if (v59 == (void *)v60)
          {
LABEL_66:
          }
          else
          {
            v62 = (void *)v60;
            unsigned __int8 v63 = [v54 isEqual:v59];

            if ((v63 & 1) == 0)
            {
              v61 = +[NSString stringWithFormat:@"Field '%@' expected: %@ actual: %@", v53, v59, v54];
              [v66 addError:v61];
              goto LABEL_66;
            }
          }
        }
      }

      if (v50 != (id)++v52) {
        continue;
      }
      break;
    }
    id v50 = [(NSDictionary *)v48 countByEnumeratingWithState:&v68 objects:v88 count:16];
    if (v50) {
      continue;
    }
    break;
  }
LABEL_70:

  return v66;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionalFieldValues, 0);

  objc_storeStrong((id *)&self->_requiredFieldValues, 0);
}

@end