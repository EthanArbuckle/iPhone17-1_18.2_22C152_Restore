@interface NSProgress(LSInstallProgressAdditions)
+ (id)childProgressForBundleID:()LSInstallProgressAdditions andPhase:;
+ (id)publishingKeyForApp:()LSInstallProgressAdditions withPhase:;
+ (uint64_t)keyPathsForValuesAffectingInstallPhase;
+ (uint64_t)keyPathsForValuesAffectingInstallState;
- (id)_LSDescription;
- (uint64_t)installPhase;
- (uint64_t)installPhaseString;
- (uint64_t)installState;
- (uint64_t)ls_expectedFinalInstallPhase;
- (void)initWithParent:()LSInstallProgressAdditions bundleID:andPhase:;
- (void)ls_setExpectedFinalInstallPhase:()LSInstallProgressAdditions;
- (void)setInstallPhase:()LSInstallProgressAdditions;
- (void)setInstallState:()LSInstallProgressAdditions;
@end

@implementation NSProgress(LSInstallProgressAdditions)

- (void)initWithParent:()LSInstallProgressAdditions bundleID:andPhase:
{
  v18[5] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = *MEMORY[0x1E4F28808];
  v18[0] = a4;
  v17[0] = v7;
  v17[1] = @"installPhase";
  v8 = NSNumber;
  id v9 = a4;
  v10 = [v8 numberWithUnsignedInteger:a5];
  v18[1] = v10;
  v17[2] = @"installState";
  v11 = [NSNumber numberWithUnsignedInteger:0];
  v18[2] = v11;
  v18[3] = v9;
  v17[3] = @"bundleID";
  v17[4] = @"expectedFinalInstallPhase";
  v18[4] = &unk_1ECB43900;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:5];

  v13 = (void *)[a1 initWithParent:0 userInfo:v12];
  v14 = v13;
  if (v13)
  {
    [v13 setTotalUnitCount:100];
    [v14 setCompletedUnitCount:0];
    if (a5 <= 4 && ((1 << a5) & 0x19) != 0)
    {
      BOOL v15 = 1;
      [v14 setPausable:1];
      [v14 setCancellable:1];
    }
    else
    {
      [v14 setPausable:0];
      [v14 setCancellable:0];
      BOOL v15 = a5 == 1;
    }
    [v14 setPrioritizable:v15];
  }

  return v14;
}

+ (id)childProgressForBundleID:()LSInstallProgressAdditions andPhase:
{
  v6 = objc_msgSend(a1, "publishingKeyForApp:withPhase:");
  uint64_t v7 = (void *)[objc_alloc((Class)a1) initWithParent:0 bundleID:v6 andPhase:a4];

  return v7;
}

+ (id)publishingKeyForApp:()LSInstallProgressAdditions withPhase:
{
  v5 = NSString;
  id v6 = a3;
  uint64_t v7 = [v5 NSStringFromLSInstallPhase:a4];
  v8 = [v5 stringWithFormat:@"%@.%@", v6, v7];

  return v8;
}

+ (uint64_t)keyPathsForValuesAffectingInstallState
{
  return [MEMORY[0x1E4F1CAD0] setWithObject:@"userInfo.installState"];
}

+ (uint64_t)keyPathsForValuesAffectingInstallPhase
{
  return objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"userInfo.installPhase", @"userInfo.expectedFinalInstallPhase", 0);
}

- (void)setInstallState:()LSInstallProgressAdditions
{
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setUserInfoObject:v2 forKey:@"installState"];
}

- (uint64_t)installState
{
  v1 = [a1 userInfo];
  id v2 = [v1 objectForKeyedSubscript:@"installState"];

  uint64_t v3 = [v2 unsignedIntegerValue];
  return v3;
}

- (void)setInstallPhase:()LSInstallProgressAdditions
{
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setUserInfoObject:v2 forKey:@"installPhase"];
}

- (uint64_t)installPhase
{
  v1 = [a1 userInfo];
  id v2 = [v1 objectForKeyedSubscript:@"installPhase"];

  uint64_t v3 = [v2 unsignedIntegerValue];
  return v3;
}

- (uint64_t)installPhaseString
{
  v1 = NSString;
  uint64_t v2 = [a1 installPhase];

  return [v1 NSStringFromLSInstallPhase:v2];
}

- (uint64_t)ls_expectedFinalInstallPhase
{
  v1 = [a1 userInfo];
  uint64_t v2 = [v1 objectForKeyedSubscript:@"expectedFinalInstallPhase"];

  if (v2) {
    uint64_t v3 = [v2 unsignedIntegerValue];
  }
  else {
    uint64_t v3 = 1;
  }

  return v3;
}

- (void)ls_setExpectedFinalInstallPhase:()LSInstallProgressAdditions
{
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setUserInfoObject:v2 forKey:@"expectedFinalInstallPhase"];
}

- (id)_LSDescription
{
  id v2 = NSString;
  uint64_t v3 = [a1 userInfo];
  v4 = [v3 objectForKeyedSubscript:@"bundleID"];
  v5 = objc_msgSend(NSString, "NSStringFromLSInstallPhase:", objc_msgSend(a1, "installPhase"));
  id v6 = objc_msgSend(NSString, "NSStringFromLSInstallState:", objc_msgSend(a1, "installState"));
  uint64_t v7 = objc_msgSend(NSString, "NSStringFromLSInstallPhase:", objc_msgSend(a1, "ls_expectedFinalInstallPhase"));
  [a1 fractionCompleted];
  objc_msgSend(v2, "stringWithFormat:", @"<NSProgress: %@ phase=%@; state=%@; finalPhase=%@; fractionCompleted=%f>",
    v4,
    v5,
    v6,
    v7,
  id v9 = v8);

  return v9;
}

@end