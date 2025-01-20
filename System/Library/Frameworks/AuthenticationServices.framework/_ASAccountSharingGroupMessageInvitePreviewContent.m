@interface _ASAccountSharingGroupMessageInvitePreviewContent
+ (NSString)cancelButtonTitle;
+ (NSString)headerImageName;
+ (NSString)notNowButtonTitle;
+ (NSString)sendMessageButtonTitle;
+ (UIImage)headerImage;
+ (id)_genericHeaderSubtitle;
+ (id)headerSubtitleForInvitedGroupMemberData:(id)a3;
+ (id)headerTitleForInvitedGroupMemberData:(id)a3;
@end

@implementation _ASAccountSharingGroupMessageInvitePreviewContent

+ (NSString)headerImageName
{
  return (NSString *)@"message.and.message.fill";
}

+ (UIImage)headerImage
{
  v2 = (void *)MEMORY[0x263F82818];
  v3 = [MEMORY[0x263F825C8] tintColor];
  v4 = [v2 configurationWithHierarchicalColor:v3];

  v5 = [MEMORY[0x263F82818] configurationWithPointSize:48.0];
  v6 = [v4 configurationByApplyingConfiguration:v5];

  v7 = [MEMORY[0x263F827E8] _systemImageNamed:@"message.and.message.fill"];
  v8 = [v7 imageWithConfiguration:v6];

  return (UIImage *)v8;
}

+ (id)headerTitleForInvitedGroupMemberData:(id)a3
{
  id v3 = a3;
  if ([v3 count] == 1
    && ([v3 objectAtIndexedSubscript:0],
        v4 = objc_claimAutoreleasedReturnValue(),
        [v4 contactDisplayName],
        v5 = objc_claimAutoreleasedReturnValue(),
        v4,
        v5))
  {
    v6 = NSString;
    v7 = _WBSLocalizedString();
    v8 = objc_msgSend(v6, "localizedStringWithFormat:", v7, v5);
  }
  else
  {
    v8 = _WBSLocalizedString();
  }

  return v8;
}

+ (id)headerSubtitleForInvitedGroupMemberData:(id)a3
{
  v4 = objc_msgSend(a3, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_3);
  switch([v4 count])
  {
    case 1:
      v6 = NSString;
      v7 = _WBSLocalizedString();
      v8 = [v4 objectAtIndexedSubscript:0];
      v5 = objc_msgSend(v6, "localizedStringWithFormat:", v7, v8);
      goto LABEL_7;
    case 2:
      v9 = NSString;
      v7 = _WBSLocalizedString();
      v8 = [v4 objectAtIndexedSubscript:0];
      v10 = [v4 objectAtIndexedSubscript:1];
      v5 = objc_msgSend(v9, "localizedStringWithFormat:", v7, v8, v10);
      goto LABEL_6;
    case 3:
      v11 = NSString;
      v7 = _WBSLocalizedString();
      v8 = [v4 objectAtIndexedSubscript:0];
      v10 = [v4 objectAtIndexedSubscript:1];
      v12 = [v4 objectAtIndexedSubscript:2];
      v5 = objc_msgSend(v11, "localizedStringWithFormat:", v7, v8, v10, v12);

LABEL_6:
LABEL_7:

      break;
    default:
      v5 = [a1 _genericHeaderSubtitle];
      break;
  }

  return v5;
}

+ (id)_genericHeaderSubtitle
{
  return (id)_WBSLocalizedString();
}

+ (NSString)sendMessageButtonTitle
{
  return (NSString *)_WBSLocalizedString();
}

+ (NSString)notNowButtonTitle
{
  return (NSString *)_WBSLocalizedString();
}

+ (NSString)cancelButtonTitle
{
  return (NSString *)_WBSLocalizedString();
}

@end