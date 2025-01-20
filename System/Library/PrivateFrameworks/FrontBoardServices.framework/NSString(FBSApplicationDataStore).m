@interface NSString(FBSApplicationDataStore)
- (id)fbs_bundleIDFromAppID;
- (uint64_t)fbs_looksLikeAnIdentityString;
@end

@implementation NSString(FBSApplicationDataStore)

- (uint64_t)fbs_looksLikeAnIdentityString
{
  return [a1 hasPrefix:@"{\""];
}

- (id)fbs_bundleIDFromAppID
{
  if ([a1 fbs_looksLikeAnIdentityString])
  {
    id v2 = [MEMORY[0x1E4F223B0] bundleIdentifierForIdentityString:a1 error:0];
  }
  else
  {
    id v2 = a1;
  }

  return v2;
}

@end