@interface LSBundleRecord(IntentsFoundation)
- (id)if_allIntentDefinitionURLs;
- (id)if_containingAppRecord;
@end

@implementation LSBundleRecord(IntentsFoundation)

- (id)if_containingAppRecord
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = a1;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = [a1 containingBundleRecord];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_7;
    }
  }
  id v2 = 0;
LABEL_7:
  return v2;
}

- (id)if_allIntentDefinitionURLs
{
  id v2 = [a1 URL];

  if (v2)
  {
    v3 = [a1 intentDefinitionURLs];
    v4 = [v3 allValues];

    id v5 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  }
  return v5;
}

@end