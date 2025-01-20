@interface ASStorageUtils
+ (id)duetStoreForCommand:(id)a3;
+ (id)privateDuetStore;
+ (id)publicDuetStore;
@end

@implementation ASStorageUtils

+ (id)publicDuetStore
{
  if (qword_12C60 != -1) {
    dispatch_once(&qword_12C60, &stru_C5A8);
  }
  v2 = (void *)qword_12C58;

  return v2;
}

+ (id)privateDuetStore
{
  if (qword_12C70 != -1) {
    dispatch_once(&qword_12C70, &stru_C5C8);
  }
  v2 = (void *)qword_12C68;

  return v2;
}

+ (id)duetStoreForCommand:(id)a3
{
  id v4 = a3;
  v5 = [a1 privateDuetStore];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [v4 activity];
    v7 = [v6 visibility];
    unsigned int v8 = [v7 isEqualToString:SAAceActivityVisibilityTypePublicValue];

    if (v8)
    {
      uint64_t v9 = [a1 publicDuetStore];

      v5 = (void *)v9;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_10;
        }
      }
      v10 = [v4 visibility];
      unsigned int v11 = [v10 isEqualToString:SAAceActivityVisibilityTypePublicValue];

      if (!v11) {
        goto LABEL_10;
      }
    }
    [a1 publicDuetStore];
    v5 = v6 = v5;
  }

LABEL_10:

  return v5;
}

@end