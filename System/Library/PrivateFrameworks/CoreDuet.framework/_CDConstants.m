@interface _CDConstants
+ (__CFString)contactsAutocompleteBundleId;
+ (__CFString)facetimeBundleId;
+ (__CFString)mobileCalendarBundleId;
+ (__CFString)mobileMailBundleId;
+ (__CFString)mobileMessagesBundleId;
+ (__CFString)mobilePhoneBundleId;
+ (__CFString)shareSheetTargetBundleIdMail;
+ (__CFString)shareSheetTargetBundleIdMessages;
@end

@implementation _CDConstants

+ (__CFString)mobileMailBundleId
{
  return @"com.apple.mobilemail";
}

+ (__CFString)mobileMessagesBundleId
{
  return @"com.apple.MobileSMS";
}

+ (__CFString)contactsAutocompleteBundleId
{
  return @"com.apple.Contacts.Autocomplete";
}

+ (__CFString)mobileCalendarBundleId
{
  return @"com.apple.mobilecal";
}

+ (__CFString)mobilePhoneBundleId
{
  return @"com.apple.InCallService";
}

+ (__CFString)facetimeBundleId
{
  return @"com.apple.facetime";
}

+ (__CFString)shareSheetTargetBundleIdMessages
{
  return @"com.apple.UIKit.activity.Message";
}

+ (__CFString)shareSheetTargetBundleIdMail
{
  return @"com.apple.UIKit.activity.Mail";
}

@end