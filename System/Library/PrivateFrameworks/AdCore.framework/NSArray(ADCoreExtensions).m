@interface NSArray(ADCoreExtensions)
- (__CFString)AD_jsonStringWithPrettyPrint:()ADCoreExtensions;
- (id)AD_arrayForJSON;
- (uint64_t)AD_jsonString;
@end

@implementation NSArray(ADCoreExtensions)

- (id)AD_arrayForJSON
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = a1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v4)
  {
    v6 = 0;
    goto LABEL_28;
  }
  uint64_t v5 = v4;
  v6 = 0;
  uint64_t v7 = *(void *)v18;
  do
  {
    uint64_t v8 = 0;
    do
    {
      if (*(void *)v18 != v7) {
        objc_enumerationMutation(v3);
      }
      v9 = *(void **)(*((void *)&v17 + 1) + 8 * v8);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v10 = objc_msgSend(v9, "AD_arrayForJSON");
LABEL_14:
        v11 = (void *)v10;
        [v2 addObject:v10];

        goto LABEL_15;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v10 = objc_msgSend(v9, "AD_dictionaryForJSON");
        goto LABEL_14;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v10 = objc_msgSend(v9, "AD_dataStringForJSON");
        goto LABEL_14;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v10 = [v9 absoluteString];
        goto LABEL_14;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_22:
        [v2 addObject:v9];
        goto LABEL_15;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v9 doubleValue];
        if (fabs(v12) != INFINITY) {
          goto LABEL_22;
        }
        uint64_t v14 = [NSString stringWithFormat:@"Unable to serialize the following number into JSON. Please file a radar against SearchAds | iOS: %@ (%@). Self: %@", v9, objc_opt_class(), v3];

        [v2 addObject:@"∞"];
        v6 = (void *)v14;
      }
      else
      {
        v13 = [NSString stringWithFormat:@"WARNING: Unable to serialize the following object into JSON. Please file a radar against SearchAds Framework.\n%@ (%@)", v9, objc_opt_class()];
        _ADLog(@"ToroLogging", v13, 0);
      }
LABEL_15:
      if (v6) {
        ADSimulateCrash(2696598945, v6, 0);
      }
      ++v8;
    }
    while (v5 != v8);
    uint64_t v15 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    uint64_t v5 = v15;
  }
  while (v15);
LABEL_28:

  return v2;
}

- (__CFString)AD_jsonStringWithPrettyPrint:()ADCoreExtensions
{
  uint64_t v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F28D90];
  v6 = objc_msgSend(a1, "AD_arrayForJSON");
  id v15 = 0;
  uint64_t v7 = [v5 dataWithJSONObject:v6 options:v4 error:&v15];
  id v8 = v15;

  if (v8)
  {
    v9 = NSString;
    uint64_t v10 = [v8 localizedDescription];
    v11 = objc_msgSend(a1, "AD_arrayForJSON");
    double v12 = [v9 stringWithFormat:@"There was an error serializing the following array into JSON (%@):\n%@", v10, v11];
    _ADLog(@"ToroLogging", v12, 0);
  }
  if (v7) {
    v13 = (__CFString *)[[NSString alloc] initWithData:v7 encoding:4];
  }
  else {
    v13 = @"[]";
  }

  return v13;
}

- (uint64_t)AD_jsonString
{
  return objc_msgSend(a1, "AD_jsonStringWithPrettyPrint:", 1);
}

@end