@interface LSBundleRecord(DOCExtensions)
- (id)fpui_containingApplicationRecord;
@end

@implementation LSBundleRecord(DOCExtensions)

- (id)fpui_containingApplicationRecord
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v2 = [v1 containingBundleRecord];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v3 = v2;
    }
    else {
      id v3 = 0;
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

@end