@interface DASharedAccountProperties
+ (id)CalDAVSubscribedCalendarsKey;
+ (id)DAAccountDoNotSaveReason;
+ (id)DAAccountIdentifiersToIgnoreForUniquenessCheck;
+ (id)DAAccountPrincipalPath;
+ (id)DAAccountSavePreflighted;
+ (id)DACardDAVAccountDSID;
+ (id)SubCalFilterAlarmsKey;
+ (id)SubCalInsecureConnectionApproved;
+ (id)SubCalSubscriptionURLKey;
+ (id)SubCalTitleKey;
+ (id)leafAccountTypes;
+ (id)leafAccountTypesToCheckForEquality;
+ (id)parentAccountTypes;
@end

@implementation DASharedAccountProperties

+ (id)parentAccountTypes
{
  if (parentAccountTypes_onceToken != -1) {
    dispatch_once(&parentAccountTypes_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)parentAccountTypes__sParentAccountTypes;
  return v2;
}

uint64_t __47__DASharedAccountProperties_parentAccountTypes__block_invoke()
{
  parentAccountTypes__sParentAccountTypes = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F17750], *MEMORY[0x1E4F177E8], *MEMORY[0x1E4F177C0], *MEMORY[0x1E4F17878], *MEMORY[0x1E4F17740], *MEMORY[0x1E4F177A0], *MEMORY[0x1E4F17770], *MEMORY[0x1E4F17778], *MEMORY[0x1E4F17820], 0);
  return MEMORY[0x1F41817F8]();
}

+ (id)leafAccountTypes
{
  if (leafAccountTypes_onceToken != -1) {
    dispatch_once(&leafAccountTypes_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)leafAccountTypes__sLeafAccountTypes;
  return v2;
}

uint64_t __45__DASharedAccountProperties_leafAccountTypes__block_invoke()
{
  leafAccountTypes__sLeafAccountTypes = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F17858], *MEMORY[0x1E4F17770], *MEMORY[0x1E4F17778], *MEMORY[0x1E4F17818], *MEMORY[0x1E4F177F8], *MEMORY[0x1E4F177C8], 0);
  return MEMORY[0x1F41817F8]();
}

+ (id)leafAccountTypesToCheckForEquality
{
  if (leafAccountTypesToCheckForEquality_onceToken != -1) {
    dispatch_once(&leafAccountTypesToCheckForEquality_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)leafAccountTypesToCheckForEquality__sLeafAccountTypesToCheckForEquality;
  return v2;
}

uint64_t __63__DASharedAccountProperties_leafAccountTypesToCheckForEquality__block_invoke()
{
  v0 = +[DASharedAccountProperties leafAccountTypes];
  uint64_t v1 = [v0 mutableCopy];
  v2 = (void *)leafAccountTypesToCheckForEquality__sLeafAccountTypesToCheckForEquality;
  leafAccountTypesToCheckForEquality__sLeafAccountTypesToCheckForEquality = v1;

  v3 = (void *)leafAccountTypesToCheckForEquality__sLeafAccountTypesToCheckForEquality;
  uint64_t v4 = *MEMORY[0x1E4F177F8];
  return [v3 removeObject:v4];
}

+ (id)DAAccountSavePreflighted
{
  return @"DAAccountSavePreflighted";
}

+ (id)DAAccountDoNotSaveReason
{
  return @"DAAccountDoNotSaveReason";
}

+ (id)DAAccountIdentifiersToIgnoreForUniquenessCheck
{
  return @"kDAAccountIdentifiersToIgnoreForUniquenessCheck";
}

+ (id)DAAccountPrincipalPath
{
  return @"DAAccountPrincipalPath";
}

+ (id)CalDAVSubscribedCalendarsKey
{
  return @"SubscribedCalendars";
}

+ (id)SubCalFilterAlarmsKey
{
  return @"com.apple.ical.urlsubscribe.filteralarms";
}

+ (id)SubCalSubscriptionURLKey
{
  return @"subscription_url";
}

+ (id)SubCalTitleKey
{
  return @"title";
}

+ (id)SubCalInsecureConnectionApproved
{
  return @"SubCalInsecureConnectionApproved";
}

+ (id)DACardDAVAccountDSID
{
  return @"DACardDAVAccountDSID";
}

@end