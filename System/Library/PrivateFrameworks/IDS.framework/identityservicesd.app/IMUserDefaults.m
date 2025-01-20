@interface IMUserDefaults
+ (BOOL)abcOnQueryCacheDifference;
+ (BOOL)bypassHomeNumberCarrierCheck;
+ (BOOL)bypassRegistrationControlStatusCheck;
+ (BOOL)clearStewieStoreOnLaunch;
+ (BOOL)forceFlushOnDeliveryReceipt;
+ (BOOL)forceStewieHTTP;
+ (BOOL)forceStewieQA1;
+ (BOOL)forceStewieQA2;
+ (BOOL)handleInFirewallAllowList:(id)a3;
+ (BOOL)isAbsintheV4Enabled;
+ (BOOL)isAlwaysPairAsTinker;
+ (BOOL)isBAACertDisabled;
+ (BOOL)isDebugPiscoLoggingEnabled;
+ (BOOL)isDroppingMadridMessages;
+ (BOOL)isFakingEveryUnlockAsFirstUnlock;
+ (BOOL)isFirewallEnabled;
+ (BOOL)isForcefulECCEnabled;
+ (BOOL)isForcefulLegacyEnabled;
+ (BOOL)isForcingAttachmentMessage;
+ (BOOL)isForcingOnePerFanout;
+ (BOOL)isKTAsyncEnrollmentDisabled;
+ (BOOL)isKeyTransparencyAccountKeyCircleDisabled;
+ (BOOL)isKeyTransparencyAggressiveVerificationScheduleEnabled;
+ (BOOL)isKeyTransparencyCloudKitCircleDisabled;
+ (BOOL)isKeyTransparencyDisabled;
+ (BOOL)isKeyTransparencyUIEnabled;
+ (BOOL)isPiscoDisabled;
+ (BOOL)keyTransparencyDropOptInMessageAfterSending;
+ (BOOL)keyTransparencyDropOptInMessageBeforeSending;
+ (BOOL)shouldDropKTAccountKeyOnlyDuringReg;
+ (BOOL)shouldDropKTAccountKeySignatureOnlyDuringReg;
+ (BOOL)shouldDropKTAccountKeySignatureRequestDuringReg;
+ (BOOL)shouldDropKTAccountKeySignatureRequestOnLaunch;
+ (BOOL)shouldDropKTAccountKeySignatureResponseDuringReg;
+ (BOOL)shouldDropKTAccountKeySignatureResponseOnLaunch;
+ (BOOL)shouldFirewallDropForAllCategories;
+ (BOOL)shouldForceFailKTKVSSync;
+ (BOOL)useKeyTransparencyAccountStatusDefault;
+ (id)configurationForOptions:(id)a3;
+ (id)fileForOptions:(id)a3;
+ (id)fileTypeForOptions:(id)a3;
+ (id)fixedInterface;
+ (id)fixedInterfaceDestination;
+ (id)secondaryRegistrationDisabledDiceRoll;
+ (id)stewieProvisionURLOverride;
+ (int64_t)coalesceDelayOverride;
+ (int64_t)excessiveQueryCacheEntriesThreshold;
+ (int64_t)homeNumberSecondsUntilExpiration;
+ (int64_t)keyTransparencyAccountStatusDefault;
+ (int64_t)keyTransparencyCKContainerExpiryOverride;
+ (int64_t)keyTransparencyFirstGossipChance;
+ (int64_t)keyTransparencySubsequentGossipChance;
+ (int64_t)offGridModeDisableWhenOnlineForTimeInterval;
+ (int64_t)serviceConstraintOverride:(id)a3;
+ (int64_t)sessionNetworkAvailabilityCheckOverrideBehavior;
+ (int64_t)stewieDebounceWindow;
+ (int64_t)stewieHeartbeatInterval;
+ (void)setSecondaryRegistrationDisabledDiceRoll:(id)a3;
@end

@implementation IMUserDefaults

+ (int64_t)sessionNetworkAvailabilityCheckOverrideBehavior
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  id v3 = [v2 integerForKey:@"NetworkAvailabilityCheckOverrideValue"];
  if ((unint64_t)v3 >= 3) {
    int64_t v4 = 0;
  }
  else {
    int64_t v4 = (int64_t)v3;
  }

  return v4;
}

+ (id)fixedInterface
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  id v3 = [v2 stringForKey:@"FixedInterface"];

  return v3;
}

+ (id)fixedInterfaceDestination
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  id v3 = [v2 stringForKey:@"FixedInterfaceDestination"];

  return v3;
}

+ (BOOL)isPiscoDisabled
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  unsigned __int8 v3 = [v2 BOOLForKey:@"DisablePisco"];

  return v3;
}

+ (BOOL)isAbsintheV4Enabled
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  unsigned __int8 v3 = [v2 BOOLForKey:@"EnableAbsintheV4Option"];

  return v3;
}

+ (BOOL)isBAACertDisabled
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  unsigned __int8 v3 = [v2 BOOLForKey:@"DisableBAACertOption"];

  return v3;
}

+ (BOOL)isDebugPiscoLoggingEnabled
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  unsigned __int8 v3 = [v2 BOOLForKey:@"EnableDebugPiscoLogging"];

  return v3;
}

+ (BOOL)isAlwaysPairAsTinker
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  unsigned __int8 v3 = [v2 BOOLForKey:@"AlwaysPairAsTinker"];

  return v3;
}

+ (BOOL)isForcefulECCEnabled
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  unsigned __int8 v3 = [v2 BOOLForKey:@"ForcefulECC"];

  return v3;
}

+ (BOOL)isForcefulLegacyEnabled
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  unsigned __int8 v3 = [v2 BOOLForKey:@"ForcefulLegacy"];

  return v3;
}

+ (BOOL)isKTAsyncEnrollmentDisabled
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  unsigned __int8 v3 = [v2 BOOLForKey:@"DisableKTAsyncEnrollment"];

  return v3;
}

+ (BOOL)isKeyTransparencyDisabled
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  unsigned __int8 v3 = [v2 BOOLForKey:@"DisableKeyTransparency"];

  return v3;
}

+ (BOOL)isKeyTransparencyCloudKitCircleDisabled
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  unsigned __int8 v3 = [v2 BOOLForKey:@"DisableKeyTransparencyCloudKitCircle"];

  return v3;
}

+ (BOOL)isKeyTransparencyAccountKeyCircleDisabled
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  unsigned __int8 v3 = [v2 BOOLForKey:@"DisableKeyTransparencyAccountKeyCircle"];

  return v3;
}

+ (BOOL)isKeyTransparencyAggressiveVerificationScheduleEnabled
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  unsigned __int8 v3 = [v2 BOOLForKey:@"EnableKeyTransparencyAggressiveVerificationSchedule"];

  return v3;
}

+ (BOOL)isKeyTransparencyUIEnabled
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  unsigned __int8 v3 = [v2 BOOLForKey:@"EnableKeyTransparencyUI"];

  return v3;
}

+ (BOOL)shouldDropKTAccountKeySignatureRequestDuringReg
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  unsigned __int8 v3 = [v2 BOOLForKey:@"IDSKTDropAccountKeySignatureRequestDuringReg"];

  return v3;
}

+ (BOOL)shouldDropKTAccountKeySignatureResponseDuringReg
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  unsigned __int8 v3 = [v2 BOOLForKey:@"IDSKTDropAccountKeySignatureResponseDuringReg"];

  return v3;
}

+ (BOOL)shouldDropKTAccountKeySignatureRequestOnLaunch
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  unsigned __int8 v3 = [v2 BOOLForKey:@"IDSKTDropAccountKeySignatureRequestOnLaunch"];

  return v3;
}

+ (BOOL)shouldDropKTAccountKeySignatureResponseOnLaunch
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  unsigned __int8 v3 = [v2 BOOLForKey:@"IDSKTDropAccountKeySignatureResponseOnLaunch"];

  return v3;
}

+ (BOOL)shouldDropKTAccountKeyOnlyDuringReg
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  unsigned __int8 v3 = [v2 BOOLForKey:@"IDSKTDropPublicKeyFromResponseDuringReg"];

  return v3;
}

+ (BOOL)shouldDropKTAccountKeySignatureOnlyDuringReg
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  unsigned __int8 v3 = [v2 BOOLForKey:@"IDSKTDropSignatureFromResponseDuringReg"];

  return v3;
}

+ (BOOL)shouldForceFailKTKVSSync
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  unsigned __int8 v3 = [v2 BOOLForKey:@"IDSForceFailKVSSync"];

  return v3;
}

+ (int64_t)keyTransparencyFirstGossipChance
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  id v3 = [v2 integerForKey:@"IDSKeyTransparencyFirstGossipChanceDefault"];

  return (int64_t)v3;
}

+ (int64_t)keyTransparencySubsequentGossipChance
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  id v3 = [v2 integerForKey:@"IDSKeyTransparencySubsequentGossipChanceDefault"];

  return (int64_t)v3;
}

+ (BOOL)keyTransparencyDropOptInMessageBeforeSending
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  unsigned __int8 v3 = [v2 BOOLForKey:@"IDSKeyTransparencyDropOptInMessageBeforeSending"];

  return v3;
}

+ (BOOL)keyTransparencyDropOptInMessageAfterSending
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  unsigned __int8 v3 = [v2 BOOLForKey:@"IDSKeyTransparencyDropOptInMessageAfterSending"];

  return v3;
}

+ (BOOL)useKeyTransparencyAccountStatusDefault
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  unsigned __int8 v3 = [v2 BOOLForKey:@"IDSKeyTransparencyUseAccountStatusDefault"];

  return v3;
}

+ (int64_t)keyTransparencyAccountStatusDefault
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  id v3 = [v2 integerForKey:@"IDSKeyTransparencyAccountStatusDefault"];

  return (int64_t)v3;
}

+ (BOOL)forceFlushOnDeliveryReceipt
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  unsigned __int8 v3 = [v2 BOOLForKey:@"ForceFlushOnDeliveryReceipt"];

  return v3;
}

+ (BOOL)isFakingEveryUnlockAsFirstUnlock
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  unsigned __int8 v3 = [v2 BOOLForKey:@"EveryUnlockAsFirstUnlock"];

  return v3;
}

+ (BOOL)isForcingAttachmentMessage
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  unsigned __int8 v3 = [v2 BOOLForKey:@"ForceAttachmentMessage"];

  return v3;
}

+ (BOOL)isForcingOnePerFanout
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  unsigned __int8 v3 = [v2 BOOLForKey:@"ForceOnePerFanout"];

  return v3;
}

+ (BOOL)isDroppingMadridMessages
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  unsigned __int8 v3 = [v2 BOOLForKey:@"DropMadridMessages"];

  return v3;
}

+ (BOOL)bypassHomeNumberCarrierCheck
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  unsigned __int8 v3 = [v2 BOOLForKey:@"BypassHomeNumberCarrierCheck"];

  return v3;
}

+ (int64_t)homeNumberSecondsUntilExpiration
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  id v3 = [v2 integerForKey:@"HomeNumberSecondsUntilExpiration"];

  return (int64_t)v3;
}

+ (int64_t)coalesceDelayOverride
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  id v3 = [v2 integerForKey:@"CoalesceDelayOverride"];

  return (int64_t)v3;
}

+ (int64_t)keyTransparencyCKContainerExpiryOverride
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  id v3 = [v2 integerForKey:@"KeyTransparencyCKContainerExpiryOverride"];

  return (int64_t)v3;
}

+ (BOOL)forceStewieQA2
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  unsigned __int8 v3 = [v2 BOOLForKey:@"ForceStewieQA2"];

  return v3;
}

+ (BOOL)forceStewieQA1
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  unsigned __int8 v3 = [v2 BOOLForKey:@"ForceStewieQA1"];

  return v3;
}

+ (id)stewieProvisionURLOverride
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  unsigned __int8 v3 = [v2 stringForKey:@"StewieProvisionURLOverride"];

  return v3;
}

+ (BOOL)forceStewieHTTP
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  unsigned __int8 v3 = [v2 BOOLForKey:@"ForceStewieHTTP"];

  return v3;
}

+ (int64_t)stewieDebounceWindow
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  id v3 = [v2 integerForKey:@"StewieDebounceWindow"];

  return (int64_t)v3;
}

+ (BOOL)clearStewieStoreOnLaunch
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  unsigned __int8 v3 = [v2 BOOLForKey:@"ClearStewieStoreOnLaunch"];

  return v3;
}

+ (int64_t)stewieHeartbeatInterval
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  id v3 = [v2 integerForKey:@"StewieHeartbeatInterval"];

  return (int64_t)v3;
}

+ (BOOL)bypassRegistrationControlStatusCheck
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  unsigned __int8 v3 = [v2 BOOLForKey:@"BypassRegistrationControlStatusCheck"];

  return v3;
}

+ (id)configurationForOptions:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  v5 = [v3 bundleID];
  v6 = [v3 name];

  v7 = +[NSString stringWithFormat:@"global-bag-config-%@-%@", v5, v6];

  v8 = [v4 dictionaryForKey:v7];

  return v8;
}

+ (id)fileForOptions:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  v5 = [v3 bundleID];
  v6 = [v3 name];

  v7 = +[NSString stringWithFormat:@"global-bag-file-%@-%@", v5, v6];

  v8 = [v4 dataForKey:v7];

  return v8;
}

+ (id)fileTypeForOptions:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  v5 = [v3 bundleID];
  v6 = [v3 name];

  v7 = +[NSString stringWithFormat:@"global-bag-filetype-%@-%@", v5, v6];

  v8 = [v4 stringForKey:v7];

  return v8;
}

+ (BOOL)isFirewallEnabled
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  if (([v2 BOOLForKey:@"FirewallOn"] & 1) != 0
    || (+[NSUserDefaults standardUserDefaults],
        id v3 = objc_claimAutoreleasedReturnValue(),
        [v3 objectForKey:@"LDMGlobalEnabled" inDomain:NSGlobalDomain],
        id v4 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v5 = [v4 BOOLValue],
        v4,
        v3,
        (v5 & 1) != 0))
  {
    unsigned __int8 v6 = 1;
  }
  else
  {
    v7 = [(id)IMWeakLinkClass() shared];
    unsigned __int8 v6 = [v7 enabled];
  }
  return v6;
}

+ (BOOL)shouldFirewallDropForAllCategories
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  unsigned __int8 v3 = [v2 BOOLForKey:@"FirewallBlocksAll"];

  return v3;
}

+ (BOOL)handleInFirewallAllowList:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  unsigned __int8 v5 = +[NSString stringWithFormat:@"%@%@", @"FirewallAllowList-", v3];

  LOBYTE(v3) = [v4 BOOLForKey:v5];
  return (char)v3;
}

+ (int64_t)serviceConstraintOverride:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  unsigned __int8 v5 = +[NSString stringWithFormat:@"%@%@", @"ServiceConstraintOverride-", v3];

  id v6 = [v4 integerForKey:v5];
  return (int64_t)v6;
}

+ (int64_t)excessiveQueryCacheEntriesThreshold
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  id v3 = [v2 integerForKey:@"ExcessiveQueryCacheEntriesThreshold"];

  return (int64_t)v3;
}

+ (BOOL)abcOnQueryCacheDifference
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  unsigned __int8 v3 = [v2 BOOLForKey:@"ABCOnQueryCacheDifference"];

  return v3;
}

+ (id)secondaryRegistrationDisabledDiceRoll
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  unsigned __int8 v3 = [v2 objectForKey:@"SecondaryRegistrationDisabledDiceRoll"];

  return v3;
}

+ (void)setSecondaryRegistrationDisabledDiceRoll:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  [v4 setObject:v3 forKey:@"SecondaryRegistrationDisabledDiceRoll"];
}

+ (int64_t)offGridModeDisableWhenOnlineForTimeInterval
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  id v3 = [v2 integerForKey:@"ExcessiveQueryCacheEntriesThreshold"];

  return (int64_t)v3;
}

@end