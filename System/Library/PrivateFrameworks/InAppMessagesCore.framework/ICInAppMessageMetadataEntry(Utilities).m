@interface ICInAppMessageMetadataEntry(Utilities)
- (uint64_t)didCancelUserNotification;
- (uint64_t)numberOfDisplays;
- (void)setDidCancelUserNotification:()Utilities;
- (void)setNumberOfDisplays:()Utilities;
@end

@implementation ICInAppMessageMetadataEntry(Utilities)

- (uint64_t)numberOfDisplays
{
  v1 = [a1 metadataValueForKey:@"__iam_internal_display_count"];
  uint64_t v2 = [v1 unsignedIntegerValue];

  return v2;
}

- (void)setNumberOfDisplays:()Utilities
{
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setMetadataValue:v2 forKey:@"__iam_internal_display_count"];
}

- (uint64_t)didCancelUserNotification
{
  v1 = [a1 metadataValueForKey:@"__iam_internal_did_cancel_user_notification"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (void)setDidCancelUserNotification:()Utilities
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setMetadataValue:v2 forKey:@"__iam_internal_did_cancel_user_notification"];
}

@end