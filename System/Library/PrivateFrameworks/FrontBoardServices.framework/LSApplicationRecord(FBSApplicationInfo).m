@interface LSApplicationRecord(FBSApplicationInfo)
- (uint64_t)fbs_processIdentityForApplicationIdentity:()FBSApplicationInfo;
@end

@implementation LSApplicationRecord(FBSApplicationInfo)

- (uint64_t)fbs_processIdentityForApplicationIdentity:()FBSApplicationInfo
{
  return [MEMORY[0x1E4F96408] identityForLSApplicationIdentity:a3 LSApplicationRecord:a1];
}

@end