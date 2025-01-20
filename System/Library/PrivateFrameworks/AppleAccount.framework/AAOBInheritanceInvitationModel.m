@interface AAOBInheritanceInvitationModel
+ (BOOL)supportsSecureCoding;
- (AACustodianshipInfo)custodianshipInfo;
- (AAOBInheritanceInvitationModel)initWithAcceptedViewForBenefactorInfo:(id)a3;
- (AAOBInheritanceInvitationModel)initWithBenefactorInfo:(id)a3;
- (AAOBInheritanceInvitationModel)initWithCoder:(id)a3;
- (AAOBInheritanceInvitationModel)initWithModel:(id)a3;
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
- (void)setCustodianshipInfo:(id)a3;
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

@implementation AAOBInheritanceInvitationModel

- (AAOBInheritanceInvitationModel)initWithBenefactorInfo:(id)a3
{
  id v5 = a3;
  v58.receiver = self;
  v58.super_class = (Class)AAOBInheritanceInvitationModel;
  v6 = [(AAOBInheritanceInvitationModel *)&v58 init];
  if (v6)
  {
    id obj = a3;
    if (v5) {
      uint64_t v7 = [v5 status];
    }
    else {
      uint64_t v7 = 2;
    }
    uint64_t v8 = [v5 ownerHandle];
    ownerHandle = v6->_ownerHandle;
    v6->_ownerHandle = (NSString *)v8;

    v10 = +[AAOBModelHelper contactInfoForHandle:v6->_ownerHandle];
    uint64_t v11 = [v10 displayName];
    uint64_t v12 = [v10 firstNameOrHandleForDisplay];
    v13 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    uint64_t v14 = [v13 localizedStringForKey:@"INHERITANCE_BENEFICIARY_ADDED_CONFIRM_BUTTON" value:0 table:@"Localizable"];
    primaryButton = v6->_primaryButton;
    v6->_primaryButton = (NSString *)v14;

    v16 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    uint64_t v17 = [v16 localizedStringForKey:@"INHERITANCE_BENEFICIARY_ADDED_MANAGE_BUTTON" value:0 table:@"Localizable"];
    secondaryButton = v6->_secondaryButton;
    v6->_secondaryButton = (NSString *)v17;

    v57 = (void *)v11;
    if (v7 == 1)
    {
      v19 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
      uint64_t v20 = [v19 localizedStringForKey:@"INHERITANCE_BENEFICIARY_INVITED_TITLE" value:0 table:@"Localizable"];
      title = v6->_title;
      v6->_title = (NSString *)v20;

      v22 = NSString;
      v23 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
      uint64_t v24 = [v23 localizedStringForKey:@"INHERITANCE_BENEFICIARY_INVITED_DETAIL_TEXT" value:0 table:@"Localizable"];
      uint64_t v25 = v11;
      v26 = (void *)v24;
      uint64_t v27 = objc_msgSend(v22, "stringWithFormat:", v24, v25, v12, obj);
      detailText = v6->_detailText;
      v6->_detailText = (NSString *)v27;

      v29 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
      uint64_t v30 = [v29 localizedStringForKey:@"INVITED_OTHER_CONFIRM_BUTTON" value:0 table:@"Localizable"];
      v31 = v6->_primaryButton;
      v6->_primaryButton = (NSString *)v30;

      v32 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
      uint64_t v33 = [v32 localizedStringForKey:@"INVITED_OTHER_DECLINE_BUTTON" value:0 table:@"Localizable"];
      v34 = v6->_secondaryButton;
      v6->_secondaryButton = (NSString *)v33;
    }
    else
    {
      if ((v7 & 0xFFFFFFFFFFFFFFFELL) != 4)
      {
        v41 = (void *)v12;
        if (v7 != 2) {
          goto LABEL_11;
        }
        v50 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
        uint64_t v51 = [v50 localizedStringForKey:@"INHERITANCE_BENEFICIARY_ADDED_TITLE" value:0 table:@"Localizable"];
        v52 = v6->_title;
        v6->_title = (NSString *)v51;

        v53 = NSString;
        v32 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
        v41 = (void *)v12;
        v34 = [v32 localizedStringForKey:@"INHERITANCE_BENEFICIARY_ADDED_DETAIL_TEXT" value:0 table:@"Localizable"];
        uint64_t v54 = objc_msgSend(v53, "stringWithFormat:", v34, v11, v12, obj);
        v55 = v6->_detailText;
        v6->_detailText = (NSString *)v54;

LABEL_10:
LABEL_11:
        objc_storeStrong((id *)&v6->_imageName, @"legacy_contact_header");
        v42 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
        uint64_t v43 = [v42 localizedStringForKey:@"INHERITANCE_BENEFICIARY_ADDED_HELP_LINK_TEXT" value:0 table:@"Localizable"];
        helpLinkTitle = v6->_helpLinkTitle;
        v6->_helpLinkTitle = (NSString *)v43;

        v45 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
        uint64_t v46 = [v45 localizedStringForKey:@"INHERITANCE_BENEFICIARY_ADDED_HELP_URL" value:0 table:@"Localizable"];
        helpLinkURL = v6->_helpLinkURL;
        v6->_helpLinkURL = (NSString *)v46;

        objc_storeStrong((id *)&v6->_custodianshipInfo, obj);
        recipientHandle = v6->_recipientHandle;
        v6->_recipientHandle = 0;

        goto LABEL_12;
      }
      v35 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
      uint64_t v36 = [v35 localizedStringForKey:@"BENEFICIARY_DECLINED_INVITE_TITLE" value:0 table:@"Localizable"];
      v37 = v6->_title;
      v6->_title = (NSString *)v36;

      v38 = NSString;
      v32 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
      v34 = [v32 localizedStringForKey:@"BENEFICIARY_DECLINED_INVITE_DETAIL_TEXT" value:0 table:@"Localizable"];
      uint64_t v39 = objc_msgSend(v38, "stringWithFormat:", v34, v11);
      v40 = v6->_detailText;
      v6->_detailText = (NSString *)v39;
    }
    v41 = (void *)v12;
    goto LABEL_10;
  }
LABEL_12:

  return v6;
}

- (AAOBInheritanceInvitationModel)initWithAcceptedViewForBenefactorInfo:(id)a3
{
  id v5 = a3;
  v33.receiver = self;
  v33.super_class = (Class)AAOBInheritanceInvitationModel;
  v6 = [(AAOBInheritanceInvitationModel *)&v33 init];
  if (v6)
  {
    uint64_t v7 = [v5 ownerHandle];
    ownerHandle = v6->_ownerHandle;
    v6->_ownerHandle = (NSString *)v7;

    v32 = +[AAOBModelHelper contactInfoForHandle:v6->_ownerHandle];
    v9 = [v32 displayName];
    v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    uint64_t v11 = [v10 localizedStringForKey:@"INHERITANCE_BENEFICIARY_ADDED_CONFIRM_BUTTON" value:0 table:@"Localizable"];
    primaryButton = v6->_primaryButton;
    v6->_primaryButton = (NSString *)v11;

    v13 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    uint64_t v14 = [v13 localizedStringForKey:@"INHERITANCE_BENEFICIARY_ADDED_MANAGE_BUTTON" value:0 table:@"Localizable"];
    secondaryButton = v6->_secondaryButton;
    v6->_secondaryButton = (NSString *)v14;

    v16 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    uint64_t v17 = [v16 localizedStringForKey:@"BENEFICIARY_ACCEPTED_INVITE_TITLE" value:0 table:@"Localizable"];
    title = v6->_title;
    v6->_title = (NSString *)v17;

    v19 = NSString;
    uint64_t v20 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    v21 = [v20 localizedStringForKey:@"BENEFICIARY_ACCEPTED_INVITE_DETAIL_TEXT" value:0 table:@"Localizable"];
    uint64_t v22 = objc_msgSend(v19, "stringWithFormat:", v21, v9);
    detailText = v6->_detailText;
    v6->_detailText = (NSString *)v22;

    objc_storeStrong((id *)&v6->_imageName, @"legacy_contact_header");
    uint64_t v24 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    uint64_t v25 = [v24 localizedStringForKey:@"INHERITANCE_BENEFICIARY_ADDED_HELP_LINK_TEXT" value:0 table:@"Localizable"];
    helpLinkTitle = v6->_helpLinkTitle;
    v6->_helpLinkTitle = (NSString *)v25;

    uint64_t v27 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    uint64_t v28 = [v27 localizedStringForKey:@"INHERITANCE_BENEFICIARY_ADDED_HELP_URL" value:0 table:@"Localizable"];
    helpLinkURL = v6->_helpLinkURL;
    v6->_helpLinkURL = (NSString *)v28;

    objc_storeStrong((id *)&v6->_custodianshipInfo, a3);
    recipientHandle = v6->_recipientHandle;
    v6->_recipientHandle = 0;
  }
  return v6;
}

- (AAOBInheritanceInvitationModel)initWithModel:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)AAOBInheritanceInvitationModel;
  id v5 = [(AAOBInheritanceInvitationModel *)&v27 init];
  if (v5)
  {
    uint64_t v6 = [v4 imageName];
    imageName = v5->_imageName;
    v5->_imageName = (NSString *)v6;

    uint64_t v8 = [v4 title];
    title = v5->_title;
    v5->_title = (NSString *)v8;

    uint64_t v10 = [v4 detailText];
    detailText = v5->_detailText;
    v5->_detailText = (NSString *)v10;

    uint64_t v12 = [v4 primaryButton];
    primaryButton = v5->_primaryButton;
    v5->_primaryButton = (NSString *)v12;

    uint64_t v14 = [v4 secondaryButton];
    secondaryButton = v5->_secondaryButton;
    v5->_secondaryButton = (NSString *)v14;

    uint64_t v16 = [v4 helpLinkTitle];
    helpLinkTitle = v5->_helpLinkTitle;
    v5->_helpLinkTitle = (NSString *)v16;

    uint64_t v18 = [v4 helpLinkURL];
    helpLinkURL = v5->_helpLinkURL;
    v5->_helpLinkURL = (NSString *)v18;

    uint64_t v20 = [v4 ownerHandle];
    ownerHandle = v5->_ownerHandle;
    v5->_ownerHandle = (NSString *)v20;

    uint64_t v22 = [v4 custodianshipInfo];
    custodianshipInfo = v5->_custodianshipInfo;
    v5->_custodianshipInfo = (AACustodianshipInfo *)v22;

    uint64_t v24 = [v4 recipientHandle];
    recipientHandle = v5->_recipientHandle;
    v5->_recipientHandle = (NSString *)v24;
  }
  return v5;
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
  [v5 encodeObject:self->_custodianshipInfo forKey:@"_custodianshipInfo"];
}

- (AAOBInheritanceInvitationModel)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)AAOBInheritanceInvitationModel;
  id v5 = [(AAOBInheritanceInvitationModel *)&v25 init];
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

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_custodianshipInfo"];
    custodianshipInfo = v5->_custodianshipInfo;
    v5->_custodianshipInfo = (AACustodianshipInfo *)v22;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(AAOBInheritanceInvitationModel);
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

  uint64_t v21 = [(AACustodianshipInfo *)self->_custodianshipInfo copy];
  custodianshipInfo = v4->_custodianshipInfo;
  v4->_custodianshipInfo = (AACustodianshipInfo *)v21;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = [(AAOBInheritanceInvitationModel *)self imageName];
  uint64_t v5 = [(AAOBInheritanceInvitationModel *)self title];
  uint64_t v6 = [(AAOBInheritanceInvitationModel *)self detailText];
  uint64_t v7 = [(AAOBInheritanceInvitationModel *)self primaryButton];
  uint64_t v8 = [(AAOBInheritanceInvitationModel *)self secondaryButton];
  uint64_t v9 = [(AAOBInheritanceInvitationModel *)self helpLinkTitle];
  uint64_t v10 = [(AAOBInheritanceInvitationModel *)self helpLinkURL];
  uint64_t v11 = [(AAOBInheritanceInvitationModel *)self ownerHandle];
  uint64_t v12 = [(AAOBInheritanceInvitationModel *)self custodianshipInfo];
  uint64_t v13 = [v3 stringWithFormat:@"imageName: %@\title: %@\ndetailText: %@\nprimaryButton: %@\nsecondaryButton: %@\nhelpLinkTitle: %@\nhelpLinkURL: %@\nownerHandle: %@\ncustodianshipInfo: %@\n", v4, v5, v6, v7, v8, v9, v10, v11, v12];

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

- (AACustodianshipInfo)custodianshipInfo
{
  return self->_custodianshipInfo;
}

- (void)setCustodianshipInfo:(id)a3
{
}

- (NSString)recipientHandle
{
  return self->_recipientHandle;
}

- (void)setRecipientHandle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipientHandle, 0);
  objc_storeStrong((id *)&self->_custodianshipInfo, 0);
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