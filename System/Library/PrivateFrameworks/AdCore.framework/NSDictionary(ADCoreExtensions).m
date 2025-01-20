@interface NSDictionary(ADCoreExtensions)
- (BOOL)AD_hasObjectForKey:()ADCoreExtensions ofKindOfClass:;
- (__CFString)AD_jsonStringWithPrettyPrint:()ADCoreExtensions;
- (id)AD_dictionaryForJSON;
- (id)AD_objectForKey:()ADCoreExtensions ofKindOfClass:;
- (uint64_t)AD_jsonString;
@end

@implementation NSDictionary(ADCoreExtensions)

- (id)AD_dictionaryForJSON
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v3 = a1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v18 + 1) + 8 * v7);
        v9 = [v3 objectForKey:v8];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v10 = [v8 stringValue];
        }
        else
        {
          objc_opt_class();
          v11 = @"UNKNOWN_KEY";
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_11;
          }
          v10 = v8;
        }
        v11 = v10;
LABEL_11:
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v12 = objc_msgSend(v9, "AD_dictionaryForJSON");
LABEL_19:
          v13 = (void *)v12;
          [v2 setObject:v12 forKey:v11];
LABEL_20:

          goto LABEL_21;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v12 = objc_msgSend(v9, "AD_arrayForJSON");
          goto LABEL_19;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v12 = objc_msgSend(v9, "AD_dataStringForJSON");
          goto LABEL_19;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v12 = [v9 absoluteString];
          goto LABEL_19;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          goto LABEL_26;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (objc_opt_respondsToSelector())
          {
            v13 = [v9 dictionaryRepresentation];
            v15 = objc_msgSend(v13, "AD_dictionaryForJSON");
            [v2 setObject:v15 forKey:v11];
          }
          else
          {
            v13 = [NSString stringWithFormat:@"WARNING: Unable to serialize the following object into JSON. Please file a radar against SearchAds Framework.\n%@ (%@)", v9, objc_opt_class()];
            _ADLog(@"ToroLogging", v13, 0);
          }
          goto LABEL_20;
        }
        [v9 doubleValue];
        if (fabs(v14) == INFINITY)
        {
          v13 = [NSString stringWithFormat:@"Unable to serialize the following number into JSON. Please file a radar against SearchAds | iOS: %@ (%@). Self: %@", v9, objc_opt_class(), v3];
          [v2 setObject:@"∞" forKey:v11];
          if (v13)
          {
            ADSimulateCrash(3501905313, v13, 0);
            goto LABEL_20;
          }
        }
        else
        {
LABEL_26:
          [v2 setObject:v9 forKey:v11];
        }
LABEL_21:

        ++v7;
      }
      while (v5 != v7);
      uint64_t v16 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
      uint64_t v5 = v16;
    }
    while (v16);
  }

  return v2;
}

- (__CFString)AD_jsonStringWithPrettyPrint:()ADCoreExtensions
{
  uint64_t v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F28D90];
  uint64_t v6 = objc_msgSend(a1, "AD_dictionaryForJSON");
  id v15 = 0;
  uint64_t v7 = [v5 dataWithJSONObject:v6 options:v4 error:&v15];
  id v8 = v15;

  if (v8)
  {
    v9 = NSString;
    v10 = [v8 localizedDescription];
    v11 = objc_msgSend(a1, "AD_dictionaryForJSON");
    uint64_t v12 = [v9 stringWithFormat:@"There was an error serializing the following dictionary into JSON (%@):\n%@", v10, v11];
    _ADLog(@"ToroLogging", v12, 0);
  }
  if (v7) {
    v13 = (__CFString *)[[NSString alloc] initWithData:v7 encoding:4];
  }
  else {
    v13 = @"{}";
  }

  return v13;
}

- (uint64_t)AD_jsonString
{
  return objc_msgSend(a1, "AD_jsonStringWithPrettyPrint:", 1);
}

- (id)AD_objectForKey:()ADCoreExtensions ofKindOfClass:
{
  v1 = objc_msgSend(a1, "objectForKey:");
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (BOOL)AD_hasObjectForKey:()ADCoreExtensions ofKindOfClass:
{
  v1 = objc_msgSend(a1, "AD_objectForKey:ofKindOfClass:");
  BOOL v2 = v1 != 0;

  return v2;
}

@end