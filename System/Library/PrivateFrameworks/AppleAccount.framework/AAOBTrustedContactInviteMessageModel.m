@interface AAOBTrustedContactInviteMessageModel
+ (BOOL)supportsSecureCoding;
- (AAOBTrustedContactInviteMessageModel)initWithCoder:(id)a3;
- (AAOBTrustedContactInviteMessageModel)initWithRecipientHandle:(id)a3;
- (AAOBTrustedContactInviteMessageModel)initWithType:(unint64_t)a3 recipientHandle:(id)a4;
- (NSString)bubbleText;
- (NSString)description;
- (NSString)detailText;
- (NSString)helpLinkTitle;
- (NSString)helpLinkURL;
- (NSString)imageName;
- (NSString)ownerHandle;
- (NSString)primaryButton;
- (NSString)recipientHandle;
- (NSString)secondaryButton;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
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

@implementation AAOBTrustedContactInviteMessageModel

- (AAOBTrustedContactInviteMessageModel)initWithRecipientHandle:(id)a3
{
  return [(AAOBTrustedContactInviteMessageModel *)self initWithType:0 recipientHandle:a3];
}

- (AAOBTrustedContactInviteMessageModel)initWithType:(unint64_t)a3 recipientHandle:(id)a4
{
  id v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)AAOBTrustedContactInviteMessageModel;
  v8 = [(AAOBTrustedContactInviteMessageModel *)&v30 init];
  if (v8)
  {
    v9 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    v10 = v9;
    if (a3 == 2)
    {
      uint64_t v11 = [v9 localizedStringForKey:@"CUSTODIAN_MESSAGES_ADDED_TEXT" value:0 table:@"Localizable"];
      detailText = v8->_detailText;
      v8->_detailText = (NSString *)v11;

      v13 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
      v14 = v13;
      v15 = @"CUSTODIAN_MESSAGES_BUBBLE_ADDED_BODY";
    }
    else
    {
      uint64_t v16 = [v9 localizedStringForKey:@"CUSTODIAN_MESSAGES_INVITE_TEXT" value:0 table:@"Localizable"];
      v17 = v8->_detailText;
      v8->_detailText = (NSString *)v16;

      v13 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
      v14 = v13;
      v15 = @"CUSTODIAN_MESSAGES_BUBBLE_INVITE_BODY";
    }
    uint64_t v18 = [v13 localizedStringForKey:v15 value:0 table:@"Localizable"];
    bubbleText = v8->_bubbleText;
    v8->_bubbleText = (NSString *)v18;

    v20 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    uint64_t v21 = [v20 localizedStringForKey:@"CUSTODIAN_MESSAGES_TITLE" value:0 table:@"Localizable"];
    title = v8->_title;
    v8->_title = (NSString *)v21;

    v23 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    uint64_t v24 = [v23 localizedStringForKey:@"CUSTODIAN_MESSAGES_CONFIRM_BUTTON" value:0 table:@"Localizable"];
    primaryButton = v8->_primaryButton;
    v8->_primaryButton = (NSString *)v24;

    v26 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    uint64_t v27 = [v26 localizedStringForKey:@"CUSTODIAN_MESSAGES_DECLINE_BUTTON" value:0 table:@"Localizable"];
    secondaryButton = v8->_secondaryButton;
    v8->_secondaryButton = (NSString *)v27;

    objc_storeStrong((id *)&v8->_recipientHandle, a4);
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  imageName = self->_imageName;
  id v5 = a3;
  [v5 encodeObject:imageName forKey:@"_imageName"];
  [v5 encodeObject:self->_title forKey:@"_title"];
  [v5 encodeObject:self->_detailText forKey:@"_detailText"];
  [v5 encodeObject:self->_primaryButton forKey:@" _primaryButton"];
  [v5 encodeObject:self->_secondaryButton forKey:@"_secondaryButton"];
  [v5 encodeObject:self->_helpLinkTitle forKey:@"_helpLinkTitle"];
  [v5 encodeObject:self->_helpLinkURL forKey:@"_helpLinkURL"];
  [v5 encodeObject:self->_ownerHandle forKey:@"_ownerHandle"];
  [v5 encodeObject:self->_recipientHandle forKey:@"_recipientHandle"];
  [v5 encodeObject:self->_bubbleText forKey:@"_bubbleText"];
}

- (AAOBTrustedContactInviteMessageModel)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)AAOBTrustedContactInviteMessageModel;
  id v5 = [(AAOBTrustedContactInviteMessageModel *)&v27 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_imageName"];
    imageName = v5->_imageName;
    v5->_imageName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_title"];
    title = v5->_title;
    v5->_title = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_detailText"];
    detailText = v5->_detailText;
    v5->_detailText = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@" _primaryButton"];
    primaryButton = v5->_primaryButton;
    v5->_primaryButton = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_secondaryButton"];
    secondaryButton = v5->_secondaryButton;
    v5->_secondaryButton = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_helpLinkTitle"];
    helpLinkTitle = v5->_helpLinkTitle;
    v5->_helpLinkTitle = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_helpLinkURL"];
    helpLinkURL = v5->_helpLinkURL;
    v5->_helpLinkURL = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_ownerHandle"];
    ownerHandle = v5->_ownerHandle;
    v5->_ownerHandle = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_recipientHandle"];
    recipientHandle = v5->_recipientHandle;
    v5->_recipientHandle = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_bubbleText"];
    bubbleText = v5->_bubbleText;
    v5->_bubbleText = (NSString *)v24;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(AAOBTrustedContactInviteMessageModel);
  uint64_t v5 = [(NSString *)self->_imageName copy];
  imageName = v4->_imageName;
  v4->_imageName = (NSString *)v5;

  uint64_t v7 = [(NSString *)self->_title copy];
  title = v4->_title;
  v4->_title = (NSString *)v7;

  uint64_t v9 = [(NSString *)self->_detailText copy];
  detailText = v4->_detailText;
  v4->_detailText = (NSString *)v9;

  uint64_t v11 = [(NSString *)self->_primaryButton copy];
  primaryButton = v4->_primaryButton;
  v4->_primaryButton = (NSString *)v11;

  uint64_t v13 = [(NSString *)self->_secondaryButton copy];
  secondaryButton = v4->_secondaryButton;
  v4->_secondaryButton = (NSString *)v13;

  uint64_t v15 = [(NSString *)self->_helpLinkTitle copy];
  helpLinkTitle = v4->_helpLinkTitle;
  v4->_helpLinkTitle = (NSString *)v15;

  uint64_t v17 = [(NSString *)self->_helpLinkURL copy];
  helpLinkURL = v4->_helpLinkURL;
  v4->_helpLinkURL = (NSString *)v17;

  uint64_t v19 = [(NSString *)self->_ownerHandle copy];
  ownerHandle = v4->_ownerHandle;
  v4->_ownerHandle = (NSString *)v19;

  uint64_t v21 = [(NSString *)self->_recipientHandle copy];
  recipientHandle = v4->_recipientHandle;
  v4->_recipientHandle = (NSString *)v21;

  uint64_t v23 = [(NSString *)self->_bubbleText copy];
  bubbleText = v4->_bubbleText;
  v4->_bubbleText = (NSString *)v23;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = [(AAOBTrustedContactInviteMessageModel *)self imageName];
  uint64_t v5 = [(AAOBTrustedContactInviteMessageModel *)self title];
  uint64_t v6 = [(AAOBTrustedContactInviteMessageModel *)self detailText];
  uint64_t v7 = [(AAOBTrustedContactInviteMessageModel *)self primaryButton];
  uint64_t v8 = [(AAOBTrustedContactInviteMessageModel *)self secondaryButton];
  uint64_t v9 = [(AAOBTrustedContactInviteMessageModel *)self helpLinkTitle];
  uint64_t v10 = [(AAOBTrustedContactInviteMessageModel *)self helpLinkURL];
  uint64_t v11 = [(AAOBTrustedContactInviteMessageModel *)self ownerHandle];
  uint64_t v12 = [(AAOBTrustedContactInviteMessageModel *)self recipientHandle];
  uint64_t v13 = [v3 stringWithFormat:@"imageName: %@\title: %@\ndetailText: %@\nprimaryButton: %@\nsecondaryButton: %@\nhelpLinkTitle: %@\nhelpLinkURL: %@\nownerHandle: %@\nrecipientHandle: %@\n", v4, v5, v6, v7, v8, v9, v10, v11, v12];

  return (NSString *)v13;
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