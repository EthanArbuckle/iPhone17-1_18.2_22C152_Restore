@interface CKReference(HMB)
- (id)hmbDescription;
@end

@implementation CKReference(HMB)

- (id)hmbDescription
{
  uint64_t v2 = [a1 referenceAction];
  if (v2)
  {
    if (v2 == 1)
    {
      v3 = @"DeleteSelf";
    }
    else
    {
      uint64_t v4 = [a1 referenceAction];
      if (v4 == *MEMORY[0x1E4F19D98])
      {
        v3 = @"Validate";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"<UNKNOWN: %lu>", objc_msgSend(a1, "referenceAction"));
        v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  else
  {
    v3 = @"None";
  }
  v5 = NSString;
  v6 = [a1 recordID];
  v7 = [v6 hmbDescription];
  v8 = [v5 stringWithFormat:@"%@.%@", v3, v7];

  return v8;
}

@end