@interface MUILocalizedBlackPearlStrings
+ (NSString)alwaysCategorizeAsMenuTitle;
+ (NSString)automaticallyCategorizeAllMessages;
+ (NSString)categorizeMessagesTitle;
+ (NSString)categorizeSenderMenuTitle;
+ (NSString)categorizeToolbarTitle;
+ (NSString)dockCountPrimaryUnreadMessages;
+ (NSString)manuallyCategorizeFooterTitle;
+ (NSString)manuallyCategorizeHeaderTitle;
+ (NSString)notificationPrimaryInbox;
+ (id)allCurrentAndFutureMessagesAutomaticallyCategorizedForDisplayName:(id)a3;
+ (id)allCurrentAndFutureMessagesFromDisplayName:(id)a3 willBeCategorizedInBucket:(int64_t)a4;
+ (id)categorizeAllMessagesForDisplayName:(id)a3;
+ (id)resetUserOverrideForNumberOfOverrides:(int64_t)a3;
+ (id)timeSensitiveBannerSubtitleForCategoryType:(unint64_t)a3;
+ (id)timeSensitiveTitleForCategoryType:(unint64_t)a3;
+ (id)titleForManuallyCategorizingMessagesFromDisplayName:(id)a3 toBucket:(int64_t)a4;
+ (id)titleForRestoringAutomaticCategorizationForDisplayName:(id)a3;
@end

@implementation MUILocalizedBlackPearlStrings

+ (id)resetUserOverrideForNumberOfOverrides:(int64_t)a3
{
  v4 = _EFLocalizedStringFromTable();
  v5 = objc_msgSend(NSString, "localizedStringWithFormat:", v4, a3);

  return v5;
}

+ (NSString)categorizeMessagesTitle
{
  return (NSString *)_EFLocalizedStringFromTable();
}

+ (NSString)categorizeSenderMenuTitle
{
  return (NSString *)_EFLocalizedStringFromTable();
}

+ (NSString)categorizeToolbarTitle
{
  return (NSString *)_EFLocalizedStringFromTable();
}

+ (NSString)alwaysCategorizeAsMenuTitle
{
  return (NSString *)_EFLocalizedStringFromTable();
}

+ (NSString)automaticallyCategorizeAllMessages
{
  return (NSString *)_EFLocalizedStringFromTable();
}

+ (NSString)manuallyCategorizeHeaderTitle
{
  return (NSString *)_EFLocalizedStringFromTable();
}

+ (NSString)manuallyCategorizeFooterTitle
{
  return (NSString *)_EFLocalizedStringFromTable();
}

+ (NSString)dockCountPrimaryUnreadMessages
{
  return (NSString *)_EFLocalizedStringFromTable();
}

+ (NSString)notificationPrimaryInbox
{
  return (NSString *)_EFLocalizedStringFromTable();
}

+ (id)allCurrentAndFutureMessagesAutomaticallyCategorizedForDisplayName:(id)a3
{
  id v3 = a3;
  v4 = _EFLocalizedStringFromTable();
  v5 = objc_msgSend(NSString, "localizedStringWithFormat:", v4, v3);

  return v5;
}

+ (id)categorizeAllMessagesForDisplayName:(id)a3
{
  id v3 = a3;
  v4 = _EFLocalizedStringFromTable();
  v5 = objc_msgSend(NSString, "localizedStringWithFormat:", v4, v3);

  return v5;
}

+ (id)allCurrentAndFutureMessagesFromDisplayName:(id)a3 willBeCategorizedInBucket:(int64_t)a4
{
  id v5 = a3;
  v6 = _EFLocalizedStringFromTable();
  v7 = NSString;
  v8 = MUILocalizedStringFromBucket((void *)a4);
  v9 = objc_msgSend(v7, "localizedStringWithFormat:", v6, v5, v8);

  return v9;
}

+ (id)titleForRestoringAutomaticCategorizationForDisplayName:(id)a3
{
  id v3 = a3;
  v4 = _EFLocalizedStringFromTable();
  id v5 = objc_msgSend(NSString, "localizedStringWithFormat:", v4, v3);

  return v5;
}

+ (id)titleForManuallyCategorizingMessagesFromDisplayName:(id)a3 toBucket:(int64_t)a4
{
  id v5 = a3;
  v6 = _EFLocalizedStringFromTable();
  v7 = NSString;
  v8 = MUILocalizedStringFromBucket((void *)a4);
  v9 = objc_msgSend(v7, "localizedStringWithFormat:", v6, v5, v8);

  return v9;
}

+ (id)timeSensitiveTitleForCategoryType:(unint64_t)a3
{
  v4 = _EFLocalizedStringFromTable();
  id v5 = NSString;
  v6 = MUILocalizedStringSingularFromCategory((void *)a3);
  v7 = objc_msgSend(v5, "localizedStringWithFormat:", v4, v6);

  return v7;
}

+ (id)timeSensitiveBannerSubtitleForCategoryType:(unint64_t)a3
{
  v4 = _EFLocalizedStringFromTable();
  id v5 = NSString;
  v6 = (void *)MUIBucketFromEMCategoryType(a3);
  v7 = MUILocalizedStringFromBucket(v6);
  v8 = objc_msgSend(v5, "localizedStringWithFormat:", v4, v7);

  return v8;
}

@end