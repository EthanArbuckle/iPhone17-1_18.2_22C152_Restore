@interface LSBundleRecord(DOCExtensions)
+ (id)doc_applicationExtensionRecordAtURL:()DOCExtensions;
- (id)containingApplicationRecord;
@end

@implementation LSBundleRecord(DOCExtensions)

+ (id)doc_applicationExtensionRecordAtURL:()DOCExtensions
{
  v3 = (objc_class *)MEMORY[0x263F01858];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithURL:v4 error:0];

  return v5;
}

- (id)containingApplicationRecord
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