@interface IMCoreSpotlightUtilities
+ (BOOL)exitOnIndexingTimeout;
+ (BOOL)ignorePreviewGenerationNotifications;
+ (BOOL)needsDeferredIndexing;
+ (BOOL)needsDonation;
+ (BOOL)needsIndexing;
+ (BOOL)needsInitialDonation;
+ (BOOL)notifyForSpotlightEvents;
+ (BOOL)notifyForVerboseSpotlightEvents;
+ (BOOL)reindexingSuspended;
+ (BOOL)skipIndexing;
+ (BOOL)spotlightEventsAreTimeSensitive;
+ (BOOL)verboseLoggingEnabled;
+ (BOOL)withdrawDonationsForFailedPreviewGenerations;
+ (NSDate)reindexingSuspendedUntilDate;
+ (NSString)reindexingSuspensionReason;
+ (id)_chatBatchSizeKey;
+ (id)_exitOnIndexingTimeoutKey;
+ (id)_extendedSpotlightTimeoutSecondsKey;
+ (id)_ignorePreviewGenerationNotificationsKey;
+ (id)_messageRecordBatchSizeKey;
+ (id)_messageSubBatchSizeKey;
+ (id)_notifyForSpotlightEventsKey;
+ (id)_notifyForVerboseSpotlightEventsKey;
+ (id)_reindexFirstBatchSizeKey;
+ (id)_reindexSupplementalBatchSizeKey;
+ (id)_reindexSuspendedUntilKey;
+ (id)_reindexSuspensionReasonKey;
+ (id)_spotlightEventsAreTimeSensitiveKey;
+ (id)_spotlightTimeoutSecondsKey;
+ (id)_withdrawDonationsForFailedPreviewGenerationsKey;
+ (id)descriptionForReindexReason:(unint64_t)a3;
+ (int64_t)chatBatchSize;
+ (int64_t)extendedSpotlightTimeoutSeconds;
+ (int64_t)messageRecordBatchSize;
+ (int64_t)messageSubBatchSize;
+ (int64_t)reindexFirstBatchSize;
+ (int64_t)reindexSupplementalBatchSize;
+ (int64_t)spotlightTimeoutSeconds;
+ (unint64_t)lastDonatedRowID;
+ (unint64_t)reindexReason;
+ (void)setChatBatchSize:(int64_t)a3;
+ (void)setExitOnIndexingTimeout:(BOOL)a3;
+ (void)setExtendedSpotlightTimeoutSeconds:(int64_t)a3;
+ (void)setIgnorePreviewGenerationNotifications:(BOOL)a3;
+ (void)setMessageRecordBatchSize:(int64_t)a3;
+ (void)setMessageSubBatchSize:(int64_t)a3;
+ (void)setNeedsDeferredIndexing;
+ (void)setNeedsInitialDonation:(BOOL)a3;
+ (void)setNotifyForSpotlightEvents:(BOOL)a3;
+ (void)setNotifyForVerboseSpotlightEvents:(BOOL)a3;
+ (void)setReindexFirstBatchSize:(int64_t)a3;
+ (void)setReindexSupplementalBatchSize:(int64_t)a3;
+ (void)setReindexingSuspendedUntilDate:(id)a3;
+ (void)setReindexingSuspensionReason:(id)a3;
+ (void)setSpotlightEventsAreTimeSensitive:(BOOL)a3;
+ (void)setSpotlightTimeoutSeconds:(int64_t)a3;
+ (void)setWithdrawDonationsForFailedPreviewGenerations:(BOOL)a3;
@end

@implementation IMCoreSpotlightUtilities

+ (BOOL)needsIndexing
{
  return IMGetCachedDomainBoolForKeyWithDefaultValue();
}

+ (BOOL)skipIndexing
{
  return IMGetCachedDomainBoolForKeyWithDefaultValue();
}

+ (BOOL)needsDonation
{
  return IMGetCachedDomainBoolForKeyWithDefaultValue();
}

+ (BOOL)needsInitialDonation
{
  return IMGetCachedDomainBoolForKeyWithDefaultValue();
}

+ (void)setNeedsInitialDonation:(BOOL)a3
{
}

+ (BOOL)needsDeferredIndexing
{
  return IMGetCachedDomainBoolForKeyWithDefaultValue();
}

+ (void)setNeedsDeferredIndexing
{
}

+ (unint64_t)lastDonatedRowID
{
  return IMGetCachedDomainIntForKeyWithDefaultValue();
}

+ (id)descriptionForReindexReason:(unint64_t)a3
{
  if (a3 - 1 > 5) {
    return @"No Recorded Reason";
  }
  else {
    return off_1E5A148F8[a3 - 1];
  }
}

+ (BOOL)verboseLoggingEnabled
{
  if (qword_1E94FE968 != -1) {
    dispatch_once(&qword_1E94FE968, &unk_1EF2BFB60);
  }
  return byte_1E94FFC30;
}

+ (unint64_t)reindexReason
{
  return IMGetCachedDomainIntForKeyWithDefaultValue();
}

+ (id)_reindexSuspendedUntilKey
{
  return @"IMCSReindexSuspendedUntilDate";
}

+ (NSDate)reindexingSuspendedUntilDate
{
  v2 = [a1 _reindexSuspendedUntilKey];
  v3 = IMGetCachedDomainValueForKey();

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

+ (void)setReindexingSuspendedUntilDate:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _reindexSuspendedUntilKey];
  IMSetDomainValueForKey();
}

+ (id)_reindexSuspensionReasonKey
{
  return @"IMCSReindexSuspensionReason";
}

+ (NSString)reindexingSuspensionReason
{
  v2 = [a1 _reindexSuspensionReasonKey];
  v3 = IMGetCachedDomainValueForKey();

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSString *)v4;
}

+ (void)setReindexingSuspensionReason:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _reindexSuspensionReasonKey];
  IMSetDomainValueForKey();
}

+ (BOOL)reindexingSuspended
{
  v3 = [MEMORY[0x1E4F1C9C8] date];
  id v4 = [a1 reindexingSuspendedUntilDate];
  [v3 timeIntervalSinceDate:v4];
  BOOL v6 = v5 < 0.0;

  return v6;
}

+ (BOOL)notifyForSpotlightEvents
{
  v3 = [MEMORY[0x1E4F6C360] sharedInstance];
  int v4 = [v3 isInternalInstall];

  if (!v4) {
    return 0;
  }
  double v5 = [a1 _notifyForSpotlightEventsKey];
  char v6 = IMGetDomainBoolForKeyWithDefaultValue();

  return v6;
}

+ (void)setNotifyForSpotlightEvents:(BOOL)a3
{
  id v3 = [a1 _notifyForSpotlightEventsKey];
  IMSetDomainBoolForKey();
}

+ (id)_notifyForSpotlightEventsKey
{
  return @"IMCSNotifyForEvents";
}

+ (BOOL)notifyForVerboseSpotlightEvents
{
  id v3 = [MEMORY[0x1E4F6C360] sharedInstance];
  int v4 = [v3 isInternalInstall];

  if (!v4) {
    return 0;
  }
  double v5 = [a1 _notifyForVerboseSpotlightEventsKey];
  char v6 = IMGetDomainBoolForKeyWithDefaultValue();

  return v6;
}

+ (void)setNotifyForVerboseSpotlightEvents:(BOOL)a3
{
  id v3 = [a1 _notifyForVerboseSpotlightEventsKey];
  IMSetDomainBoolForKey();
}

+ (id)_notifyForVerboseSpotlightEventsKey
{
  return @"IMCSNotifyForVerboseEvents";
}

+ (BOOL)spotlightEventsAreTimeSensitive
{
  id v3 = [MEMORY[0x1E4F6C360] sharedInstance];
  int v4 = [v3 isInternalInstall];

  if (!v4) {
    return 0;
  }
  double v5 = [a1 _spotlightEventsAreTimeSensitiveKey];
  char v6 = IMGetDomainBoolForKeyWithDefaultValue();

  return v6;
}

+ (void)setSpotlightEventsAreTimeSensitive:(BOOL)a3
{
  id v3 = [a1 _spotlightEventsAreTimeSensitiveKey];
  IMSetDomainBoolForKey();
}

+ (id)_spotlightEventsAreTimeSensitiveKey
{
  return @"IMCSEventsAreTimeSensitive";
}

+ (BOOL)exitOnIndexingTimeout
{
  id v3 = [MEMORY[0x1E4F6C360] sharedInstance];
  int v4 = [v3 isInternalInstall];

  if (!v4) {
    return 0;
  }
  double v5 = [a1 _exitOnIndexingTimeoutKey];
  char v6 = IMGetDomainBoolForKeyWithDefaultValue();

  return v6;
}

+ (void)setExitOnIndexingTimeout:(BOOL)a3
{
  id v3 = [a1 _exitOnIndexingTimeoutKey];
  IMSetDomainBoolForKey();
}

+ (id)_exitOnIndexingTimeoutKey
{
  return @"IMCSExitOnIndexingTimeout";
}

+ (int64_t)spotlightTimeoutSeconds
{
  v2 = [a1 _spotlightTimeoutSecondsKey];
  int64_t v3 = IMGetCachedDomainIntForKeyWithDefaultValue();

  return v3;
}

+ (void)setSpotlightTimeoutSeconds:(int64_t)a3
{
  id v3 = [a1 _spotlightTimeoutSecondsKey];
  IMSetDomainIntForKey();
}

+ (id)_spotlightTimeoutSecondsKey
{
  return @"IMCSIndexingTimeoutSeconds";
}

+ (int64_t)extendedSpotlightTimeoutSeconds
{
  v2 = [a1 _extendedSpotlightTimeoutSecondsKey];
  int64_t v3 = IMGetCachedDomainIntForKeyWithDefaultValue();

  return v3;
}

+ (void)setExtendedSpotlightTimeoutSeconds:(int64_t)a3
{
  id v3 = [a1 _extendedSpotlightTimeoutSecondsKey];
  IMSetDomainIntForKey();
}

+ (id)_extendedSpotlightTimeoutSecondsKey
{
  return @"IMCSIndexingExtendedTimeoutSeconds";
}

+ (int64_t)chatBatchSize
{
  v2 = [a1 _chatBatchSizeKey];
  int64_t v3 = IMGetCachedDomainIntForKeyWithDefaultValue();

  return v3;
}

+ (void)setChatBatchSize:(int64_t)a3
{
  id v3 = [a1 _chatBatchSizeKey];
  IMSetDomainIntForKey();
}

+ (id)_chatBatchSizeKey
{
  return @"ChatBatchSize";
}

+ (int64_t)messageSubBatchSize
{
  v2 = [a1 _messageSubBatchSizeKey];
  int64_t v3 = IMGetCachedDomainIntForKeyWithDefaultValue();

  return v3;
}

+ (void)setMessageSubBatchSize:(int64_t)a3
{
  id v3 = [a1 _messageSubBatchSizeKey];
  IMSetDomainIntForKey();
}

+ (id)_messageSubBatchSizeKey
{
  return @"MessageSubBatchSize";
}

+ (int64_t)messageRecordBatchSize
{
  v2 = [a1 _messageRecordBatchSizeKey];
  int64_t v3 = IMGetCachedDomainIntForKeyWithDefaultValue();

  return v3;
}

+ (void)setMessageRecordBatchSize:(int64_t)a3
{
  id v3 = [a1 _messageRecordBatchSizeKey];
  IMSetDomainIntForKey();
}

+ (id)_messageRecordBatchSizeKey
{
  return @"MessageRecordBatchSize";
}

+ (int64_t)reindexFirstBatchSize
{
  v2 = [a1 _reindexFirstBatchSizeKey];
  int64_t v3 = IMGetCachedDomainIntForKeyWithDefaultValue();

  return v3;
}

+ (void)setReindexFirstBatchSize:(int64_t)a3
{
  id v3 = [a1 _reindexFirstBatchSizeKey];
  IMSetDomainIntForKey();
}

+ (id)_reindexFirstBatchSizeKey
{
  return @"ReindexFirstBatchSize";
}

+ (int64_t)reindexSupplementalBatchSize
{
  v2 = [a1 _reindexSupplementalBatchSizeKey];
  int64_t v3 = IMGetCachedDomainIntForKeyWithDefaultValue();

  return v3;
}

+ (void)setReindexSupplementalBatchSize:(int64_t)a3
{
  id v3 = [a1 _reindexSupplementalBatchSizeKey];
  IMSetDomainIntForKey();
}

+ (id)_reindexSupplementalBatchSizeKey
{
  return @"ReindexSupplementalBatchSize";
}

+ (BOOL)withdrawDonationsForFailedPreviewGenerations
{
  id v3 = [MEMORY[0x1E4F6C360] sharedInstance];
  int v4 = [v3 isInternalInstall];

  if (!v4) {
    return 0;
  }
  double v5 = [a1 _withdrawDonationsForFailedPreviewGenerationsKey];
  char v6 = IMGetDomainBoolForKeyWithDefaultValue();

  return v6;
}

+ (void)setWithdrawDonationsForFailedPreviewGenerations:(BOOL)a3
{
  id v3 = [a1 _withdrawDonationsForFailedPreviewGenerationsKey];
  IMSetDomainBoolForKey();
}

+ (id)_withdrawDonationsForFailedPreviewGenerationsKey
{
  return @"IMCSWithdrawDonationsForFailedPreviewGenerations";
}

+ (BOOL)ignorePreviewGenerationNotifications
{
  id v3 = [MEMORY[0x1E4F6C360] sharedInstance];
  int v4 = [v3 isInternalInstall];

  if (!v4) {
    return 0;
  }
  double v5 = [a1 _ignorePreviewGenerationNotificationsKey];
  char v6 = IMGetDomainBoolForKeyWithDefaultValue();

  return v6;
}

+ (void)setIgnorePreviewGenerationNotifications:(BOOL)a3
{
  id v3 = [a1 _ignorePreviewGenerationNotificationsKey];
  IMSetDomainBoolForKey();
}

+ (id)_ignorePreviewGenerationNotificationsKey
{
  return @"IgnorePreviewGenerationNotifications";
}

@end