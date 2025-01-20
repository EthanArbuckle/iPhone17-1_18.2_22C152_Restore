@interface ASCEligibility
+ (BOOL)isAppDistributionLaunchAngel:(id)a3;
+ (BOOL)isGameOverlayUI:(id)a3;
+ (BOOL)isITunesStoreClient:(id)a3;
+ (BOOL)isInternalASCClient:(id)a3;
+ (BOOL)isSpotlightClient:(id)a3;
+ (uint64_t)clientWithBundleID:(void *)a3 isEligibleToUseLockupViewSize:;
+ (uint64_t)clientWithBundleIDIsEligibleToUseASC:(uint64_t)a1;
+ (uint64_t)clientWithProcessNameIsEligibleToUseASC:(uint64_t)a1;
+ (uint64_t)currentClientIsEligibleToUseASC;
+ (uint64_t)currentClientIsEligibleToUseLockupViewSize:(uint64_t)a1;
+ (void)abortExecution;
+ (void)assertCurrentProcessEligibility;
@end

@implementation ASCEligibility

+ (void)abortExecution
{
  *(_WORD *)v0 = 0;
  _os_log_fault_impl(&dword_1C2B8D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Current process is not eligible to use ASC", v0, 2u);
}

+ (void)assertCurrentProcessEligibility
{
  self;
  if ((+[ASCEligibility currentClientIsEligibleToUseASC]() & 1) == 0)
  {
    +[ASCEligibility abortExecution]();
  }
}

+ (uint64_t)currentClientIsEligibleToUseASC
{
  uint64_t v0 = self;
  v1 = [MEMORY[0x1E4F28B50] mainBundle];
  v2 = [v1 bundleIdentifier];
  if (+[ASCEligibility clientWithBundleIDIsEligibleToUseASC:](v0, v2))
  {
    uint64_t v3 = 1;
  }
  else
  {
    v4 = [MEMORY[0x1E4F28F80] processInfo];
    v5 = [v4 processName];
    uint64_t v3 = +[ASCEligibility clientWithProcessNameIsEligibleToUseASC:](v0, v5);
  }
  return v3;
}

+ (uint64_t)clientWithBundleIDIsEligibleToUseASC:(uint64_t)a1
{
  id v2 = a2;
  self;
  uint64_t v3 = [v2 hasPrefix:@"com.apple."];

  return v3;
}

+ (uint64_t)clientWithProcessNameIsEligibleToUseASC:(uint64_t)a1
{
  id v2 = a2;
  self;
  uint64_t v3 = [v2 isEqualToString:@"Clip"];

  return v3;
}

+ (BOOL)isSpotlightClient:(id)a3
{
  if ([a3 hasPrefix:@"com.apple.Spotlight"]) {
    return 1;
  }
  unint64_t v5 = 0;
  do
  {
    unint64_t v6 = v5;
    if (v5 == 9) {
      break;
    }
    int v7 = [a3 hasPrefix:SpotlightClientBundleIDPrefixes[v5 + 1]];
    unint64_t v5 = v6 + 1;
  }
  while (!v7);
  return v6 < 9;
}

+ (BOOL)isInternalASCClient:(id)a3
{
  uint64_t v4 = 0;
  char v5 = 1;
  do
  {
    int v6 = [a3 hasPrefix:InternalASCClientBundleIDPrefixes[v4]];
    if ((v5 & 1) == 0) {
      break;
    }
    char v5 = 0;
    uint64_t v4 = 1;
  }
  while (!v6);
  return v6;
}

+ (BOOL)isAppDistributionLaunchAngel:(id)a3
{
  return [a3 isEqualToString:@"com.apple.AppDistributionLaunchAngel"];
}

+ (BOOL)isITunesStoreClient:(id)a3
{
  return [a3 hasPrefix:@"com.apple.MobileStore"];
}

+ (BOOL)isGameOverlayUI:(id)a3
{
  return [a3 hasPrefix:@"com.apple.GameOverlayUI"];
}

+ (uint64_t)currentClientIsEligibleToUseLockupViewSize:(uint64_t)a1
{
  id v2 = a2;
  uint64_t v3 = self;
  uint64_t v4 = [MEMORY[0x1E4F28B50] mainBundle];
  char v5 = [v4 bundleIdentifier];
  uint64_t v6 = +[ASCEligibility clientWithBundleID:isEligibleToUseLockupViewSize:](v3, v5, v2);

  return v6;
}

+ (uint64_t)clientWithBundleID:(void *)a3 isEligibleToUseLockupViewSize:
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = self;
  int IsSmallOfferButton = ASCLockupViewSizeIsSmallOfferButton(v5, v7);

  if (!IsSmallOfferButton
    || (objc_msgSend(v4, "asc_sha246Hash"),
        v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v9 isEqualToString:@"BKN3YPrkowJshOfzYN9kxtu/zEFYrAWOeXV3rzu9h1k="],
        v9,
        (v10 & 1) != 0)
    || ([v6 isInternalASCClient:v4] & 1) != 0
    || ([v6 isSpotlightClient:v4] & 1) != 0
    || ([v6 isITunesStoreClient:v4] & 1) != 0
    || ([v6 isGameOverlayUI:v4] & 1) != 0)
  {
    uint64_t v11 = 1;
  }
  else
  {
    uint64_t v11 = [v6 isAppDistributionLaunchAngel:v4];
  }

  return v11;
}

@end