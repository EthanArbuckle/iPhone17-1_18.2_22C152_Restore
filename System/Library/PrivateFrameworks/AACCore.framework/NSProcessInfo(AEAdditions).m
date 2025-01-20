@interface NSProcessInfo(AEAdditions)
- (BOOL)ae_isBeingTested;
- (uint64_t)ae_hasEntitlement:()AEAdditions withValue:;
@end

@implementation NSProcessInfo(AEAdditions)

- (BOOL)ae_isBeingTested
{
  v1 = [a1 environment];
  v2 = [v1 objectForKeyedSubscript:@"XCTestConfigurationFilePath"];
  BOOL v3 = v2 != 0;

  return v3;
}

- (uint64_t)ae_hasEntitlement:()AEAdditions withValue:
{
  v5 = a3;
  id v6 = a4;
  v7 = SecTaskCreateFromSelf(0);
  if (v7)
  {
    v8 = v7;
    CFTypeRef v9 = SecTaskCopyValueForEntitlement(v7, v5, 0);
    if (v9)
    {
      v10 = v9;
      uint64_t v11 = [v6 isEqual:v9];
      CFRelease(v10);
    }
    else
    {
      uint64_t v11 = 0;
    }
    CFRelease(v8);
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

@end