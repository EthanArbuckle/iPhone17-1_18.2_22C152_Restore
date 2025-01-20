@interface LSBundleRecord(LNAdditions)
- (id)ln_linkedFrameworksWithError:()LNAdditions;
@end

@implementation LSBundleRecord(LNAdditions)

- (id)ln_linkedFrameworksWithError:()LNAdditions
{
  v4 = [a1 executableURL];
  v5 = objc_msgSend(v4, "ln_linkedFrameworksWithError:", a3);

  return v5;
}

@end