@interface CKSpotlightQueryResultUtilities
+ (CLLocationCoordinate2D)coordinateForResult:(id)a3;
+ (id)contactForResult:(id)a3;
+ (id)indexDomainForItem:(id)a3;
+ (id)indexDomainForResult:(id)a3;
+ (id)indexItemTypeForItem:(id)a3;
+ (id)indexItemTypeForResult:(id)a3;
@end

@implementation CKSpotlightQueryResultUtilities

+ (id)contactForResult:(id)a3
{
  v3 = [a3 item];
  v4 = [v3 attributeSet];

  v5 = [v4 isFromMe];
  int v6 = [v5 BOOLValue];

  if (v6)
  {
    v7 = [MEMORY[0x1E4F6BD10] me];
    v8 = [v7 cnContact];
  }
  else
  {
    v9 = [v4 authorAddresses];
    v7 = [v9 firstObject];

    if (v7)
    {
      v10 = [MEMORY[0x1E4F6E6D8] sharedInstance];
      v8 = [v10 fetchCNContactForHandleWithID:v7];
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

+ (CLLocationCoordinate2D)coordinateForResult:(id)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (coordinateForResult___pred_CLLocationCoordinate2DIsValidCoreLocation != -1) {
    dispatch_once(&coordinateForResult___pred_CLLocationCoordinate2DIsValidCoreLocation, &__block_literal_global_439_0);
  }
  if (coordinateForResult___pred_CLLocationCoordinate2DMakeCoreLocation != -1) {
    dispatch_once(&coordinateForResult___pred_CLLocationCoordinate2DMakeCoreLocation, &__block_literal_global_445_1);
  }
  v4 = [v3 item];
  v5 = [v4 attributeSet];
  uint64_t v6 = [v5 contentURL];

  v53 = (void *)v6;
  v54 = v3;
  if (v6)
  {
    v7 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithContentsOfURL:options:error:", v6, 8, 0, v6, v3);
    id v65 = 0;
    v8 = [MEMORY[0x1E4F1B998] contactsWithData:v7 error:&v65];
    id v9 = v65;
    if ([v8 count])
    {
      v10 = [MEMORY[0x1E4F1CA48] array];
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      v11 = [v8 firstObject];
      v12 = [v11 urlAddresses];

      uint64_t v13 = [v12 countByEnumeratingWithState:&v61 objects:v67 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v62;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v62 != v15) {
              objc_enumerationMutation(v12);
            }
            v17 = [*(id *)(*((void *)&v61 + 1) + 8 * i) value];
            [v10 addObject:v17];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v61 objects:v67 count:16];
        }
        while (v14);
      }

      v18 = [MEMORY[0x1E4F1C978] arrayWithArray:v10];
    }
    else
    {
      v18 = 0;
    }
  }
  else
  {
    v18 = 0;
  }
  if (__kCLLocationCoordinate2DInvalid_once_0 != -1) {
    dispatch_once(&__kCLLocationCoordinate2DInvalid_once_0, &__block_literal_global_484_0);
  }
  double v20 = *((double *)&__kCLLocationCoordinate2DInvalid___kCLLocationCoordinate2DInvalid_0 + 1);
  double v19 = *(double *)&__kCLLocationCoordinate2DInvalid___kCLLocationCoordinate2DInvalid_0;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v21 = v18;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v57 objects:v66 count:16];
  if (!v22) {
    goto LABEL_41;
  }
  uint64_t v23 = v22;
  uint64_t v24 = *(void *)v58;
  id v55 = v21;
  while (2)
  {
    for (uint64_t j = 0; j != v23; ++j)
    {
      if (*(void *)v58 != v24) {
        objc_enumerationMutation(v21);
      }
      v26 = objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:", *(void *)(*((void *)&v57 + 1) + 8 * j), v53);
      v27 = [v26 host];
      if ([v27 isEqualToString:@"maps.apple.com"])
      {
        v28 = [v26 queryParameters];
        v29 = [v28 objectForKey:@"sll"];
        v30 = v29;
        if (v29)
        {
          id v31 = v29;
        }
        else
        {
          id v31 = [v28 objectForKey:@"ll"];
        }
        v32 = v31;

        v33 = [v32 componentsSeparatedByString:@","];
        if ([v33 count] == 2)
        {
          v36 = (double (*)(uint64_t, double, double))coordinateForResult___CLLocationCoordinate2DMake;
          v37 = [v33 objectAtIndex:0];
          [v37 doubleValue];
          double v39 = v38;
          v35 = [v33 objectAtIndex:1];
          uint64_t v40 = [v35 doubleValue];
          double v19 = v36(v40, v39, v41);
          double v20 = v42;
LABEL_40:

          id v21 = v55;
          goto LABEL_41;
        }
      }
      else
      {
        if (![v27 isEqualToString:@"maps.google.com"]) {
          goto LABEL_35;
        }
        v28 = [v26 tuQueryParameters];
        v32 = [v28 objectForKey:@"q"];
        v33 = [v32 componentsSeparatedByString:@" "];
        if ([v33 count])
        {
          uint64_t v34 = v23;
          v56 = [v33 objectAtIndex:0];
          v35 = [v56 componentsSeparatedByString:@","];
          if ([v35 count] == 2)
          {
            v43 = (double (*)(uint64_t, double, double))coordinateForResult___CLLocationCoordinate2DMake;
            v44 = [v35 objectAtIndex:0];
            [v44 doubleValue];
            double v46 = v45;
            v47 = [v35 objectAtIndex:1];
            uint64_t v48 = [v47 doubleValue];
            double v19 = v43(v48, v46, v49);
            double v20 = v50;

            v37 = v56;
            goto LABEL_40;
          }

          uint64_t v23 = v34;
          id v21 = v55;
        }
      }

LABEL_35:
    }
    uint64_t v23 = [v21 countByEnumeratingWithState:&v57 objects:v66 count:16];
    if (v23) {
      continue;
    }
    break;
  }
LABEL_41:

  double v51 = v19;
  double v52 = v20;
  result.longitude = v52;
  result.latitude = v51;
  return result;
}

uint64_t __55__CKSpotlightQueryResultUtilities_coordinateForResult___block_invoke()
{
  uint64_t result = MEMORY[0x192FBA870]("CLLocationCoordinate2DIsValid", @"CoreLocation");
  coordinateForResult___CLLocationCoordinate2DIsValid = result;
  return result;
}

void *__55__CKSpotlightQueryResultUtilities_coordinateForResult___block_invoke_2()
{
  uint64_t result = (void *)MEMORY[0x192FBA870]("CLLocationCoordinate2DMake", @"CoreLocation");
  coordinateForResult___CLLocationCoordinate2DMake = result;
  return result;
}

+ (id)indexItemTypeForResult:(id)a3
{
  id v3 = [a3 item];
  v4 = [(id)objc_opt_class() indexItemTypeForItem:v3];

  return v4;
}

+ (id)indexItemTypeForItem:(id)a3
{
  id v3 = [a3 attributeSet];
  v4 = [v3 messageType];

  return v4;
}

+ (id)indexDomainForResult:(id)a3
{
  id v3 = [a3 item];
  v4 = [v3 domainIdentifier];

  return v4;
}

+ (id)indexDomainForItem:(id)a3
{
  return (id)[a3 domainIdentifier];
}

@end