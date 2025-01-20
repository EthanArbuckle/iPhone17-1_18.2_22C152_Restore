@interface HDVerifiableClinicalRecordEntity
+ (BOOL)insertRecords:(id)a3 gatewayExternalID:(id)a4 profile:(id)a5 error:(id *)a6;
+ (id)issuerToRecordsMappedRecords:(id)a3;
@end

@implementation HDVerifiableClinicalRecordEntity

+ (BOOL)insertRecords:(id)a3 gatewayExternalID:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v32 = a4;
  id v11 = a5;
  if ([v10 count])
  {
    [a1 issuerToRecordsMappedRecords:v10];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v35 = long long v40 = 0u;
    id obj = [v35 allKeys];
    id v34 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v34)
    {
      id v29 = v10;
      v30 = a6;
      uint64_t v33 = *(void *)v38;
      while (2)
      {
        for (i = 0; i != v34; i = (char *)i + 1)
        {
          if (*(void *)v38 != v33) {
            objc_enumerationMutation(obj);
          }
          v13 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          v14 = [v35 objectForKeyedSubscript:v13];
          if ([v14 count])
          {
            v15 = v32;
            if (!v32) {
              v15 = v13;
            }
            id v16 = v15;
            v17 = [v11 sourceManager];
            id v36 = 0;
            v18 = [v17 publicSourceForClinicalExternalIdentifier:v16 provenance:0 createOrUpdateIfNecessary:0 nameOnCreateOrUpdate:0 error:&v36];
            id v19 = v36;

            if (!v18)
            {
              if (v19)
              {
                if (v30) {
                  id *v30 = v19;
                }
                else {
                  _HKLogDroppedError();
                }
              }
              else
              {
                CFStringRef v28 = @"gateway external ID";
                if (!v32) {
                  CFStringRef v28 = @"issuer";
                }
                +[NSError hk_assignError:v30, 100, @"unable to insert verifiable records for %@ %@: no matching public source entity is present", v28, v16 code format];
              }
              goto LABEL_24;
            }
            v20 = [v11 dataProvenanceManager];
            v21 = [v20 localDataProvenanceForSourceEntity:v18 version:0 deviceEntity:0];

            if (!v21)
            {
              id v22 = v11;
              +[NSError hk_assignError:v30 code:100 description:@"Failed to get provenance for public source entity"];
LABEL_23:

              id v11 = v22;
LABEL_24:

              BOOL v26 = 0;
              id v10 = v29;
              goto LABEL_25;
            }
            id v22 = v11;
            v23 = [v11 dataManager];
            v24 = [v14 firstObject];
            [v24 _creationTimestamp];
            unsigned __int8 v25 = objc_msgSend(v23, "insertDataObjects:withProvenance:creationDate:error:", v14, v21, v30);

            if ((v25 & 1) == 0) {
              goto LABEL_23;
            }

            id v11 = v22;
          }
        }
        BOOL v26 = 1;
        id v10 = v29;
        id v34 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
        if (v34) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v26 = 1;
    }
LABEL_25:
  }
  else
  {
    +[NSError hk_assignError:a6 code:3 description:@"No verifiable records given"];
    BOOL v26 = 0;
  }

  return v26;
}

+ (id)issuerToRecordsMappedRecords:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "issuerIdentifier", (void)v16);
        id v12 = [v4 objectForKeyedSubscript:v11];

        if (!v12)
        {
          id v12 = objc_alloc_init((Class)NSMutableArray);
          v13 = [v10 issuerIdentifier];
          [v4 setObject:v12 forKeyedSubscript:v13];
        }
        [v12 addObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  id v14 = [v4 copy];

  return v14;
}

@end