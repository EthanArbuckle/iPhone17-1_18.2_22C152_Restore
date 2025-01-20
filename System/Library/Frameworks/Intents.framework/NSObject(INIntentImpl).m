@interface NSObject(INIntentImpl)
+ (id)intents_arrayOfWidgetPlistRepresentableInDict:()INIntentImpl key:error:resultTransformer:;
+ (uint64_t)intents_widgetPlistRepresentableInDict:()INIntentImpl key:error:;
@end

@implementation NSObject(INIntentImpl)

+ (id)intents_arrayOfWidgetPlistRepresentableInDict:()INIntentImpl key:error:resultTransformer:
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v12 = a6;
  v13 = objc_msgSend(v10, "intents_safeObjectForKey:ofType:", v11, objc_opt_class());
  if ([v13 count])
  {
    v30 = a5;
    id v32 = v11;
    id v33 = v10;
    v34 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v13, "count"));
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v31 = v13;
    id v14 = v13;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v37;
LABEL_4:
      uint64_t v18 = 0;
      while (1)
      {
        if (*(void *)v37 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v36 + 1) + 8 * v18);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v35 = 0;
          v20 = [a1 makeFromWidgetPlistableRepresentation:v19 error:&v35];
          id v21 = v35;
          if (v21)
          {
            id v26 = v21;
            if (v30) {
              void *v30 = v21;
            }

LABEL_22:
            id v11 = v32;
            id v10 = v33;
            v13 = v31;
            v27 = v34;

            v28 = 0;
            goto LABEL_23;
          }
          if (v12) {
            v12[2](v12, v20);
          }
          [v34 addObject:v20];
        }
        else
        {
          v22 = NSString;
          v23 = (objc_class *)objc_opt_class();
          v24 = NSStringFromClass(v23);
          objc_msgSend(v22, "stringWithFormat:", @"Unable to decode %@; expected a dictionary form but found %@",
            v24,
          v25 = v19);
          INIntentError(8001, v25, 0);
          id v26 = (id)objc_claimAutoreleasedReturnValue();

          if (v26)
          {
            if (v30)
            {
              id v26 = v26;
              void *v30 = v26;
            }
            goto LABEL_22;
          }
        }
        if (v16 == ++v18)
        {
          uint64_t v16 = [v14 countByEnumeratingWithState:&v36 objects:v40 count:16];
          if (v16) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    v27 = v34;
    v28 = (void *)[v34 copy];
    id v11 = v32;
    id v10 = v33;
    v13 = v31;
LABEL_23:
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

+ (uint64_t)intents_widgetPlistRepresentableInDict:()INIntentImpl key:error:
{
  return objc_msgSend(a3, "_intents_widgetPlistRepresentableForKey:ofClass:error:", a4, a1);
}

@end