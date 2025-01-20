@interface HMBLocalZoneMirrorInput(FirewallRuleManager)
+ (uint64_t)frmSyncCommitWithMirrorInput:()FirewallRuleManager options:error:;
- (uint64_t)frmSyncCommitWithOptions:()FirewallRuleManager error:;
@end

@implementation HMBLocalZoneMirrorInput(FirewallRuleManager)

- (uint64_t)frmSyncCommitWithOptions:()FirewallRuleManager error:
{
  id v6 = a3;
  uint64_t v7 = [(id)objc_opt_class() frmSyncCommitWithMirrorInput:a1 options:v6 error:a4];

  return v7;
}

+ (uint64_t)frmSyncCommitWithMirrorInput:()FirewallRuleManager options:error:
{
  id v6 = [a3 commitWithOptions:a4 error:a5];
  uint64_t v7 = v6;
  if (v6)
  {
    v8 = [v6 blockAndWaitForCompletionWithError:a5];
    v9 = v8;
    if (v8)
    {
      v10 = [v8 mirrorOutputResult];

      if (!v10
        || ([v9 mirrorOutputResult],
            v11 = objc_claimAutoreleasedReturnValue(),
            [v11 blockAndWaitForCompletionWithError:a5],
            uint64_t v12 = objc_claimAutoreleasedReturnValue(),
            v11,
            (id)v12,
            v12))
      {
        uint64_t v12 = 1;
      }
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

@end