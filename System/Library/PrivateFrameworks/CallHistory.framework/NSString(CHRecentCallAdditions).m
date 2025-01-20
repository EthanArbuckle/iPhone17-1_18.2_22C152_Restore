@interface NSString(CHRecentCallAdditions)
+ (__CFString)CHCallScreenSharingType:()CHRecentCallAdditions;
+ (__CFString)ch_stringWithCHCallScreenSharingType:()CHRecentCallAdditions;
+ (__CFString)ch_stringWithCHRecentCallAutoAnsweredReason:()CHRecentCallAdditions;
+ (uint64_t)ch_stringWithCHRecentCallJunkConfidence:()CHRecentCallAdditions;
+ (uint64_t)ch_stringWithCHRecentCallVerificationStatus:()CHRecentCallAdditions;
@end

@implementation NSString(CHRecentCallAdditions)

+ (uint64_t)ch_stringWithCHRecentCallVerificationStatus:()CHRecentCallAdditions
{
  if (a3 > 4) {
    return 0;
  }
  else {
    return *((void *)&off_1E61C8198 + a3);
  }
}

+ (uint64_t)ch_stringWithCHRecentCallJunkConfidence:()CHRecentCallAdditions
{
  if (a3 > 3) {
    return 0;
  }
  else {
    return *((void *)&off_1E61C81C0 + a3);
  }
}

+ (__CFString)ch_stringWithCHRecentCallAutoAnsweredReason:()CHRecentCallAdditions
{
  v3 = @"CHRecentCallAutoAnsweredReasonScreened";
  if (a3 != 1) {
    v3 = 0;
  }
  if (a3) {
    return v3;
  }
  else {
    return @"CHRecentCallAutoAnsweredReasonNone";
  }
}

+ (__CFString)CHCallScreenSharingType:()CHRecentCallAdditions
{
  if (!a3)
  {
    v4 = @"CHCallScreenSharingTypeNone";
    goto LABEL_10;
  }
  char v3 = a3;
  if (a3)
  {
    maybeAppendStringWithSeparator(&stru_1F129F488, @"CHCallScreenSharingTypeScreenShare");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ((v3 & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  v4 = &stru_1F129F488;
  if ((a3 & 2) != 0)
  {
LABEL_7:
    uint64_t v5 = maybeAppendStringWithSeparator(v4, @"CHCallScreenSharingTypeRemoteControl");

    v4 = (__CFString *)v5;
  }
LABEL_8:
  if (![(__CFString *)v4 length])
  {

    v4 = @"Unknown";
  }
LABEL_10:
  return v4;
}

+ (__CFString)ch_stringWithCHCallScreenSharingType:()CHRecentCallAdditions
{
  if (!a3)
  {
    v4 = @"CHCallScreenSharingTypeNone";
    goto LABEL_10;
  }
  char v3 = a3;
  if (a3)
  {
    maybeAppendStringWithSeparator(&stru_1F129F488, @"CHCallScreenSharingTypeScreenShare");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ((v3 & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  v4 = &stru_1F129F488;
  if ((a3 & 2) != 0)
  {
LABEL_7:
    uint64_t v5 = maybeAppendStringWithSeparator(v4, @"CHCallScreenSharingTypeRemoteControl");

    v4 = (__CFString *)v5;
  }
LABEL_8:
  if (![(__CFString *)v4 length])
  {

    v4 = @"Unknown";
  }
LABEL_10:
  return v4;
}

@end