@interface _ASAccountSharingGroupInvitationContent
+ (NSString)acceptButtonTitle;
+ (NSString)cancelButtonTitle;
+ (NSString)declineButtonTitle;
+ (NSString)knownSenderHeaderImageName;
+ (NSString)linkPresentationBubbleTitle;
+ (NSString)unknownSenderCellTitle;
+ (NSString)unknownSenderHeaderSubtitle;
+ (NSString)unknownSenderHeaderTitle;
+ (NSString)unknownSenderImageName;
+ (NSString)viewButtonTitle;
+ (UIImage)knownSenderHeaderImage;
+ (UIImage)linkPresentationBubbleIcon;
+ (UIImage)unknownSenderCellImage;
+ (UIImage)unknownSenderHeaderImage;
+ (id)_headerImageWithSymbolNamed:(id)a3;
+ (id)groupMemberListFooterTextForPermissionLevel:(int64_t)a3;
+ (id)invitationDescriptionForOwner:(id)a3;
+ (id)knownSenderHeaderSubtitleForPermissionLevel:(int64_t)a3;
+ (id)knownSenderHeaderTitleWithGroupName:(id)a3;
+ (id)linkPresentationBubbleSubtitleForGroupName:(id)a3 groupOwnerName:(id)a4;
@end

@implementation _ASAccountSharingGroupInvitationContent

+ (id)knownSenderHeaderTitleWithGroupName:(id)a3
{
  v3 = NSString;
  id v4 = a3;
  v5 = _WBSLocalizedString();
  v6 = objc_msgSend(v3, "localizedStringWithFormat:", v5, v4);

  return v6;
}

+ (id)_headerImageWithSymbolNamed:(id)a3
{
  v3 = (void *)MEMORY[0x263F82818];
  id v4 = (void *)MEMORY[0x263F825C8];
  id v5 = a3;
  v6 = [v4 tintColor];
  v7 = [v3 configurationWithHierarchicalColor:v6];

  v8 = [MEMORY[0x263F82818] configurationWithPointSize:48.0];
  v9 = [v7 configurationByApplyingConfiguration:v8];

  v10 = [MEMORY[0x263F827E8] _systemImageNamed:v5];

  v11 = [v10 imageWithConfiguration:v9];

  return v11;
}

+ (NSString)knownSenderHeaderImageName
{
  return (NSString *)@"person.2.badge.key.fill";
}

+ (UIImage)knownSenderHeaderImage
{
  v3 = [a1 knownSenderHeaderImageName];
  id v4 = [a1 _headerImageWithSymbolNamed:v3];

  return (UIImage *)v4;
}

+ (id)knownSenderHeaderSubtitleForPermissionLevel:(int64_t)a3
{
  id v4 = _WBSLocalizedString();
  return v4;
}

+ (NSString)unknownSenderHeaderTitle
{
  return (NSString *)_WBSLocalizedString();
}

+ (NSString)unknownSenderHeaderSubtitle
{
  return (NSString *)_WBSLocalizedString();
}

+ (NSString)unknownSenderCellTitle
{
  return (NSString *)_WBSLocalizedString();
}

+ (NSString)unknownSenderImageName
{
  return (NSString *)@"person.crop.circle.badge.questionmark.fill";
}

+ (UIImage)unknownSenderHeaderImage
{
  uint64_t v3 = [a1 unknownSenderImageName];
  id v4 = [a1 _headerImageWithSymbolNamed:v3];

  return (UIImage *)v4;
}

+ (UIImage)unknownSenderCellImage
{
  v2 = [a1 unknownSenderImageName];
  uint64_t v3 = [MEMORY[0x263F827E8] _systemImageNamed:v2];
  id v4 = (void *)MEMORY[0x263F82818];
  id v5 = [MEMORY[0x263F825C8] systemGrayColor];
  v6 = [v4 configurationWithHierarchicalColor:v5];
  v7 = [v3 imageWithConfiguration:v6];

  return (UIImage *)v7;
}

+ (id)groupMemberListFooterTextForPermissionLevel:(int64_t)a3
{
  if (a3)
  {
    id v4 = _WBSLocalizedString();
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

+ (NSString)acceptButtonTitle
{
  return (NSString *)_WBSLocalizedString();
}

+ (NSString)cancelButtonTitle
{
  return (NSString *)_WBSLocalizedString();
}

+ (NSString)declineButtonTitle
{
  return (NSString *)_WBSLocalizedString();
}

+ (NSString)viewButtonTitle
{
  return (NSString *)_WBSLocalizedString();
}

+ (id)invitationDescriptionForOwner:(id)a3
{
  id v3 = a3;
  id v4 = [v3 contactDisplayName];
  id v5 = NSString;
  v6 = _WBSLocalizedString();
  v7 = [v3 handle];

  if (v4) {
    objc_msgSend(v5, "localizedStringWithFormat:", v6, v4, v7);
  }
  else {
  v8 = objc_msgSend(v5, "localizedStringWithFormat:", v6, v7, v10);
  }

  return v8;
}

+ (UIImage)linkPresentationBubbleIcon
{
  return (UIImage *)objc_msgSend(MEMORY[0x263F827E8], "as_imageNamed:", @"PasswordsSharingInvite");
}

+ (NSString)linkPresentationBubbleTitle
{
  return (NSString *)_WBSLocalizedString();
}

+ (id)linkPresentationBubbleSubtitleForGroupName:(id)a3 groupOwnerName:(id)a4
{
  id v5 = NSString;
  id v6 = a4;
  id v7 = a3;
  v8 = _WBSLocalizedString();
  v9 = objc_msgSend(v5, "localizedStringWithFormat:", v8, v6, v7);

  return v9;
}

@end