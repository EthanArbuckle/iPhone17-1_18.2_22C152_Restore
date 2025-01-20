@interface AAOBInheritanceInviteMessageModel
- (AAOBInheritanceInviteMessageModel)initWithBeneficiaryName:(id)a3;
- (AAOBInheritanceInviteMessageModel)initWithType:(unint64_t)a3 recipientHandle:(id)a4;
- (NSString)bubbleText;
- (NSString)detailText;
- (NSString)helpLinkTitle;
- (NSString)helpLinkURL;
- (NSString)imageName;
- (NSString)ownerHandle;
- (NSString)primaryButton;
- (NSString)recipientHandle;
- (NSString)secondaryButton;
- (NSString)title;
- (void)setBubbleText:(id)a3;
- (void)setDetailText:(id)a3;
- (void)setHelpLinkTitle:(id)a3;
- (void)setHelpLinkURL:(id)a3;
- (void)setImageName:(id)a3;
- (void)setOwnerHandle:(id)a3;
- (void)setPrimaryButton:(id)a3;
- (void)setRecipientHandle:(id)a3;
- (void)setSecondaryButton:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation AAOBInheritanceInviteMessageModel

- (AAOBInheritanceInviteMessageModel)initWithBeneficiaryName:(id)a3
{
  id v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)AAOBInheritanceInviteMessageModel;
  v6 = [(AAOBInheritanceInviteMessageModel *)&v31 init];
  v7 = v6;
  if (v6)
  {
    imageName = v6->_imageName;
    v6->_imageName = 0;

    v9 = NSString;
    v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    v11 = [v10 localizedStringForKey:@"INHERITANCE_INVITE_MESSAGE_TITLE" value:0 table:@"Localizable"];
    uint64_t v12 = objc_msgSend(v9, "stringWithFormat:", v11, v5);
    title = v7->_title;
    v7->_title = (NSString *)v12;

    v14 = NSString;
    v15 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    v16 = [v15 localizedStringForKey:@"INHERITANCE_ADDED_MESSAGE_DETAIL_TEXT" value:0 table:@"Localizable"];
    uint64_t v17 = objc_msgSend(v14, "stringWithFormat:", v16, v5);
    detailText = v7->_detailText;
    v7->_detailText = (NSString *)v17;

    v19 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    uint64_t v20 = [v19 localizedStringForKey:@"INHERITANCE_INVITE_MESSAGE_SEND" value:0 table:@"Localizable"];
    primaryButton = v7->_primaryButton;
    v7->_primaryButton = (NSString *)v20;

    v22 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    uint64_t v23 = [v22 localizedStringForKey:@"INHERITANCE_INVITE_MESSAGE_EDIT_MESSAGE" value:0 table:@"Localizable"];
    secondaryButton = v7->_secondaryButton;
    v7->_secondaryButton = (NSString *)v23;

    objc_storeStrong((id *)&v7->_recipientHandle, a3);
    v25 = NSString;
    v26 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    v27 = [v26 localizedStringForKey:@"INHERITANCE_ADDED_MESSAGES_BUBBLE_BODY" value:0 table:@"Localizable"];
    uint64_t v28 = objc_msgSend(v25, "stringWithFormat:", v27, v5);
    bubbleText = v7->_bubbleText;
    v7->_bubbleText = (NSString *)v28;
  }
  return v7;
}

- (AAOBInheritanceInviteMessageModel)initWithType:(unint64_t)a3 recipientHandle:(id)a4
{
  id v7 = a4;
  v39.receiver = self;
  v39.super_class = (Class)AAOBInheritanceInviteMessageModel;
  v8 = [(AAOBInheritanceInviteMessageModel *)&v39 init];
  if (v8)
  {
    v38 = +[AAOBModelHelper contactInfoForHandle:v7];
    v9 = [v38 displayName];
    v10 = NSString;
    v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    uint64_t v12 = v11;
    if (a3 == 2)
    {
      v13 = [v11 localizedStringForKey:@"INHERITANCE_ADDED_MESSAGE_DETAIL_TEXT" value:0 table:@"Localizable"];
      uint64_t v14 = objc_msgSend(v10, "stringWithFormat:", v13, v9);
      detailText = v8->_detailText;
      v8->_detailText = (NSString *)v14;

      v16 = NSString;
      uint64_t v17 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
      v18 = v17;
      v19 = @"INHERITANCE_ADDED_MESSAGES_BUBBLE_BODY";
    }
    else
    {
      uint64_t v20 = [v11 localizedStringForKey:@"INHERITANCE_INVITED_MESSAGE_DETAIL_TEXT" value:0 table:@"Localizable"];
      uint64_t v21 = objc_msgSend(v10, "stringWithFormat:", v20, v9);
      v22 = v8->_detailText;
      v8->_detailText = (NSString *)v21;

      v16 = NSString;
      uint64_t v17 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
      v18 = v17;
      v19 = @"INHERITANCE_INVITED_MESSAGES_BUBBLE_BODY";
    }
    uint64_t v23 = [v17 localizedStringForKey:v19 value:0 table:@"Localizable"];
    uint64_t v24 = objc_msgSend(v16, "stringWithFormat:", v23, v9);
    bubbleText = v8->_bubbleText;
    v8->_bubbleText = (NSString *)v24;

    v26 = NSString;
    v27 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    uint64_t v28 = [v27 localizedStringForKey:@"INHERITANCE_INVITE_MESSAGE_TITLE" value:0 table:@"Localizable"];
    uint64_t v29 = objc_msgSend(v26, "stringWithFormat:", v28, v9);
    title = v8->_title;
    v8->_title = (NSString *)v29;

    objc_super v31 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    uint64_t v32 = [v31 localizedStringForKey:@"INHERITANCE_INVITE_MESSAGE_SEND" value:0 table:@"Localizable"];
    primaryButton = v8->_primaryButton;
    v8->_primaryButton = (NSString *)v32;

    v34 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    uint64_t v35 = [v34 localizedStringForKey:@"INHERITANCE_INVITE_MESSAGE_EDIT_MESSAGE" value:0 table:@"Localizable"];
    secondaryButton = v8->_secondaryButton;
    v8->_secondaryButton = (NSString *)v35;

    objc_storeStrong((id *)&v8->_recipientHandle, a4);
  }

  return v8;
}

- (NSString)imageName
{
  return self->_imageName;
}

- (void)setImageName:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)detailText
{
  return self->_detailText;
}

- (void)setDetailText:(id)a3
{
}

- (NSString)primaryButton
{
  return self->_primaryButton;
}

- (void)setPrimaryButton:(id)a3
{
}

- (NSString)secondaryButton
{
  return self->_secondaryButton;
}

- (void)setSecondaryButton:(id)a3
{
}

- (NSString)helpLinkTitle
{
  return self->_helpLinkTitle;
}

- (void)setHelpLinkTitle:(id)a3
{
}

- (NSString)helpLinkURL
{
  return self->_helpLinkURL;
}

- (void)setHelpLinkURL:(id)a3
{
}

- (NSString)ownerHandle
{
  return self->_ownerHandle;
}

- (void)setOwnerHandle:(id)a3
{
}

- (NSString)recipientHandle
{
  return self->_recipientHandle;
}

- (void)setRecipientHandle:(id)a3
{
}

- (NSString)bubbleText
{
  return self->_bubbleText;
}

- (void)setBubbleText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bubbleText, 0);
  objc_storeStrong((id *)&self->_recipientHandle, 0);
  objc_storeStrong((id *)&self->_ownerHandle, 0);
  objc_storeStrong((id *)&self->_helpLinkURL, 0);
  objc_storeStrong((id *)&self->_helpLinkTitle, 0);
  objc_storeStrong((id *)&self->_secondaryButton, 0);
  objc_storeStrong((id *)&self->_primaryButton, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_imageName, 0);
}

@end