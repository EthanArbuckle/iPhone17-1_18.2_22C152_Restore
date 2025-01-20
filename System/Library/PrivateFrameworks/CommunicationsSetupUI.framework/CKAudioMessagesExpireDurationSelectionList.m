@interface CKAudioMessagesExpireDurationSelectionList
- (id)expireDescription;
@end

@implementation CKAudioMessagesExpireDurationSelectionList

- (id)expireDescription
{
  int v2 = +[CKSettingsMessagesController currentMessageAutoKeepOptionForType:1];
  switch(v2)
  {
    case 2:
      v3 = NSString;
      v4 = MessagesSettingsLocalizedString(@"AUDIO_MESSAGES_EXPIRE_DESCRIPTION");
      v5 = @"LOWER_CASE_1_YEAR";
      goto LABEL_7;
    case 1:
      v3 = NSString;
      v4 = MessagesSettingsLocalizedString(@"AUDIO_MESSAGES_EXPIRE_DESCRIPTION");
      v5 = @"LOWER_CASE_30_DAYS";
      goto LABEL_7;
    case 0:
      v3 = NSString;
      v4 = MessagesSettingsLocalizedString(@"AUDIO_MESSAGES_EXPIRE_DESCRIPTION");
      v5 = @"LOWER_CASE_2_MINUTES";
LABEL_7:
      v6 = MessagesSettingsLocalizedString(v5);
      objc_msgSend(v3, "stringWithFormat:", v4, v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
  }
  v7 = &stru_26D05D4F8;
LABEL_9:
  return v7;
}

@end