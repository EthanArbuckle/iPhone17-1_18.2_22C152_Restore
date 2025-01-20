@interface AAOBCustodianInvitationModel
+ (BOOL)supportsSecureCoding;
- (AACustodianshipInfo)custodianshipInfo;
- (AAOBCustodianInvitationModel)initWithCoder:(id)a3;
- (AAOBCustodianInvitationModel)initWithCustodianshipInfo:(id)a3;
- (AAOBCustodianInvitationModel)initWithType:(int64_t)a3 ownerHandle:(id)a4;
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
- (id)detailsTextWithFirstName:(id)a3 fullName:(id)a4;
- (int64_t)type;
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
- (void)setType:(int64_t)a3;
@end

@implementation AAOBCustodianInvitationModel

- (AAOBCustodianInvitationModel)initWithType:(int64_t)a3 ownerHandle:(id)a4
{
  id v7 = a4;
  v73.receiver = self;
  v73.super_class = (Class)AAOBCustodianInvitationModel;
  v8 = [(AAOBCustodianInvitationModel *)&v73 init];
  v9 = v8;
  if (v8)
  {
    imageName = v8->_imageName;
    v8->_imageName = (NSString *)@"recovery_contact_shield";

    v9->_type = a3;
    switch(a3)
    {
      case 0:
        v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
        uint64_t v12 = [v11 localizedStringForKey:@"INVITED_OTHER_DETAIL_TEXT" value:0 table:@"Localizable"];
        detailText = v9->_detailText;
        v9->_detailText = (NSString *)v12;

        v14 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
        uint64_t v15 = [v14 localizedStringForKey:@"INVITED_OTHER_CONTACT_TITLE" value:0 table:@"Localizable"];
        title = v9->_title;
        v9->_title = (NSString *)v15;

        v17 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
        uint64_t v18 = [v17 localizedStringForKey:@"INVITED_OTHER_CONFIRM_BUTTON" value:0 table:@"Localizable"];
        primaryButton = v9->_primaryButton;
        v9->_primaryButton = (NSString *)v18;

        v20 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
        v21 = v20;
        v22 = @"INVITED_OTHER_DECLINE_BUTTON";
        goto LABEL_5;
      case 1:
        v23 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
        uint64_t v24 = [v23 localizedStringForKey:@"ADDED_AS_DETAIL_TEXT" value:0 table:@"Localizable"];
        v25 = v9->_detailText;
        v9->_detailText = (NSString *)v24;

        v26 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
        uint64_t v27 = [v26 localizedStringForKey:@"ADDED_AS_CONTACT_TITLE" value:0 table:@"Localizable"];
        v28 = v9->_title;
        v9->_title = (NSString *)v27;

        v29 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
        uint64_t v30 = [v29 localizedStringForKey:@"ADDED_AS_CONFIRM_BUTTON" value:0 table:@"Localizable"];
        v31 = v9->_primaryButton;
        v9->_primaryButton = (NSString *)v30;

        v20 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
        v21 = v20;
        v22 = @"ADDED_AS_MANAGE_BUTTON";
LABEL_5:
        uint64_t v32 = [v20 localizedStringForKey:v22 value:0 table:@"Localizable"];
        secondaryButton = v9->_secondaryButton;
        v9->_secondaryButton = (NSString *)v32;

        v34 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
        uint64_t v35 = [v34 localizedStringForKey:@"LEARN_MORE_ELIPSES" value:0 table:@"Localizable"];
        helpLinkTitle = v9->_helpLinkTitle;
        v9->_helpLinkTitle = (NSString *)v35;

        v37 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
        uint64_t v38 = [v37 localizedStringForKey:@"INELIGIBLE_CUSTODIAN_LEARN_URL" value:0 table:@"Localizable"];
        helpLinkURL = v9->_helpLinkURL;
        v9->_helpLinkURL = (NSString *)v38;
        goto LABEL_9;
      case 2:
        v40 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
        uint64_t v41 = [v40 localizedStringForKey:@"INVITED_OTHER_CONTACT_ACCEPTED_DETAIL_TEXT" value:0 table:@"Localizable"];
        v42 = v9->_detailText;
        v9->_detailText = (NSString *)v41;

        v43 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
        uint64_t v44 = [v43 localizedStringForKey:@"INVITED_OTHER_CONTACT_ACCEPTED_TITLE" value:0 table:@"Localizable"];
        v45 = v9->_title;
        v9->_title = (NSString *)v44;

        v46 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
        uint64_t v47 = [v46 localizedStringForKey:@"OK" value:0 table:@"Localizable"];
        v48 = v9->_primaryButton;
        v9->_primaryButton = (NSString *)v47;

        v37 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
        uint64_t v49 = [v37 localizedStringForKey:@"INVITED_OTHER_CONTACT_ACCEPTED_MANAGE_BUTTON" value:0 table:@"Localizable"];
        helpLinkURL = v9->_secondaryButton;
        v9->_secondaryButton = (NSString *)v49;
        goto LABEL_9;
      case 3:
        v50 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
        uint64_t v51 = [v50 localizedStringForKey:@"INELIGIBLE_CUSTODIAN_DETAILS" value:0 table:@"Localizable"];
        v52 = v9->_detailText;
        v9->_detailText = (NSString *)v51;

        v53 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
        uint64_t v54 = [v53 localizedStringForKey:@"INELIGIBLE_CUSTODIAN_TITLE" value:0 table:@"Localizable"];
        v55 = v9->_title;
        v9->_title = (NSString *)v54;

        v56 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
        uint64_t v57 = [v56 localizedStringForKey:@"INELIGIBLE_CUSTODIAN_LEARN" value:0 table:@"Localizable"];
        v58 = v9->_helpLinkTitle;
        v9->_helpLinkTitle = (NSString *)v57;

        v59 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
        uint64_t v60 = [v59 localizedStringForKey:@"INELIGIBLE_CUSTODIAN_LEARN_URL" value:0 table:@"Localizable"];
        v61 = v9->_helpLinkURL;
        v9->_helpLinkURL = (NSString *)v60;

        v62 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
        uint64_t v63 = [v62 localizedStringForKey:@"OK" value:0 table:@"Localizable"];
        v64 = v9->_primaryButton;
        v9->_primaryButton = (NSString *)v63;

        goto LABEL_8;
      case 4:
LABEL_8:
        v65 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
        uint64_t v66 = [v65 localizedStringForKey:@"DECLINED_CUSTODIAN_DETAILS" value:0 table:@"Localizable"];
        v67 = v9->_detailText;
        v9->_detailText = (NSString *)v66;

        v68 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
        uint64_t v69 = [v68 localizedStringForKey:@"DECLINED_CUSTODIAN_TITLE" value:0 table:@"Localizable"];
        v70 = v9->_title;
        v9->_title = (NSString *)v69;

        v37 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
        uint64_t v71 = [v37 localizedStringForKey:@"OK" value:0 table:@"Localizable"];
        helpLinkURL = v9->_primaryButton;
        v9->_primaryButton = (NSString *)v71;
LABEL_9:

        break;
      default:
        break;
    }
    objc_storeStrong((id *)&v9->_ownerHandle, a4);
  }

  return v9;
}

- (AAOBCustodianInvitationModel)initWithCustodianshipInfo:(id)a3
{
  id v5 = a3;
  v70.receiver = self;
  v70.super_class = (Class)AAOBCustodianInvitationModel;
  v6 = [(AAOBCustodianInvitationModel *)&v70 init];
  id v7 = v6;
  if (v6)
  {
    imageName = v6->_imageName;
    v6->_imageName = (NSString *)@"recovery_contact_shield";

    switch([v5 status])
    {
      case 1:
        v9 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
        uint64_t v10 = [v9 localizedStringForKey:@"INVITED_OTHER_DETAIL_TEXT" value:0 table:@"Localizable"];
        detailText = v7->_detailText;
        v7->_detailText = (NSString *)v10;

        uint64_t v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
        uint64_t v13 = [v12 localizedStringForKey:@"INVITED_OTHER_CONTACT_TITLE" value:0 table:@"Localizable"];
        title = v7->_title;
        v7->_title = (NSString *)v13;

        uint64_t v15 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
        uint64_t v16 = [v15 localizedStringForKey:@"INVITED_OTHER_CONFIRM_BUTTON" value:0 table:@"Localizable"];
        primaryButton = v7->_primaryButton;
        v7->_primaryButton = (NSString *)v16;

        uint64_t v18 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
        uint64_t v19 = [v18 localizedStringForKey:@"INVITED_OTHER_DECLINE_BUTTON" value:0 table:@"Localizable"];
        secondaryButton = v7->_secondaryButton;
        v7->_secondaryButton = (NSString *)v19;

        v21 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
        uint64_t v22 = [v21 localizedStringForKey:@"LEARN_MORE_ELIPSES" value:0 table:@"Localizable"];
        helpLinkTitle = v7->_helpLinkTitle;
        v7->_helpLinkTitle = (NSString *)v22;

        uint64_t v24 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
        uint64_t v25 = [v24 localizedStringForKey:@"INELIGIBLE_CUSTODIAN_LEARN_URL" value:0 table:@"Localizable"];
        helpLinkURL = v7->_helpLinkURL;
        v7->_helpLinkURL = (NSString *)v25;

        uint64_t v27 = [v5 ownerHandle];
        uint64_t v28 = 0;
        ownerHandle = v7->_ownerHandle;
        v7->_ownerHandle = (NSString *)v27;
        goto LABEL_7;
      case 2:
        uint64_t v30 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
        uint64_t v31 = [v30 localizedStringForKey:@"ADDED_AS_DETAIL_TEXT" value:0 table:@"Localizable"];
        uint64_t v32 = v7->_detailText;
        v7->_detailText = (NSString *)v31;

        v33 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
        uint64_t v34 = [v33 localizedStringForKey:@"ADDED_AS_CONTACT_TITLE" value:0 table:@"Localizable"];
        uint64_t v35 = v7->_title;
        v7->_title = (NSString *)v34;

        v36 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
        uint64_t v37 = [v36 localizedStringForKey:@"ADDED_AS_CONFIRM_BUTTON" value:0 table:@"Localizable"];
        uint64_t v38 = v7->_primaryButton;
        v7->_primaryButton = (NSString *)v37;

        v39 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
        uint64_t v40 = [v39 localizedStringForKey:@"ADDED_AS_MANAGE_BUTTON" value:0 table:@"Localizable"];
        uint64_t v41 = v7->_secondaryButton;
        v7->_secondaryButton = (NSString *)v40;

        uint64_t v42 = [v5 ownerHandle];
        ownerHandle = v7->_ownerHandle;
        v7->_ownerHandle = (NSString *)v42;
        uint64_t v28 = 1;
        goto LABEL_7;
      case 4:
        v43 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
        uint64_t v44 = [v43 localizedStringForKey:@"DECLINED_CUSTODIAN_DETAILS" value:0 table:@"Localizable"];
        v45 = v7->_detailText;
        v7->_detailText = (NSString *)v44;

        v46 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
        uint64_t v47 = [v46 localizedStringForKey:@"DECLINED_CUSTODIAN_TITLE" value:0 table:@"Localizable"];
        v48 = v7->_title;
        v7->_title = (NSString *)v47;

        uint64_t v49 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
        uint64_t v50 = [v49 localizedStringForKey:@"OK" value:0 table:@"Localizable"];
        uint64_t v51 = v7->_primaryButton;
        v7->_primaryButton = (NSString *)v50;

        uint64_t v52 = [v5 ownerHandle];
        ownerHandle = v7->_ownerHandle;
        v7->_ownerHandle = (NSString *)v52;
        uint64_t v28 = 4;
        goto LABEL_7;
      case 5:
        v53 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
        uint64_t v54 = [v53 localizedStringForKey:@"INELIGIBLE_CUSTODIAN_DETAILS" value:0 table:@"Localizable"];
        v55 = v7->_detailText;
        v7->_detailText = (NSString *)v54;

        v56 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
        uint64_t v57 = [v56 localizedStringForKey:@"INELIGIBLE_CUSTODIAN_TITLE" value:0 table:@"Localizable"];
        v58 = v7->_title;
        v7->_title = (NSString *)v57;

        v59 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
        uint64_t v60 = [v59 localizedStringForKey:@"OK" value:0 table:@"Localizable"];
        v61 = v7->_primaryButton;
        v7->_primaryButton = (NSString *)v60;

        v62 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
        uint64_t v63 = [v62 localizedStringForKey:@"INELIGIBLE_CUSTODIAN_LEARN" value:0 table:@"Localizable"];
        v64 = v7->_helpLinkTitle;
        v7->_helpLinkTitle = (NSString *)v63;

        v65 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
        uint64_t v66 = [v65 localizedStringForKey:@"INELIGIBLE_CUSTODIAN_LEARN_URL" value:0 table:@"Localizable"];
        v67 = v7->_helpLinkURL;
        v7->_helpLinkURL = (NSString *)v66;

        uint64_t v68 = [v5 ownerHandle];
        ownerHandle = v7->_ownerHandle;
        v7->_ownerHandle = (NSString *)v68;
        uint64_t v28 = 3;
LABEL_7:

        objc_storeStrong((id *)&v7->_custodianshipInfo, a3);
        v7->_type = v28;
        break;
      default:
        break;
    }
  }

  return v7;
}

- (id)detailsTextWithFirstName:(id)a3 fullName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  switch([(AAOBCustodianInvitationModel *)self type])
  {
    case 0:
      v8 = NSString;
      detailText = self->_detailText;
      id v14 = v6;
      goto LABEL_5;
    case 1:
    case 2:
      v8 = NSString;
      detailText = self->_detailText;
LABEL_5:
      objc_msgSend(v8, "stringWithFormat:", detailText, v7, v6, v14);
      goto LABEL_8;
    case 3:
      v11 = self->_detailText;
      goto LABEL_9;
    case 4:
      objc_msgSend(NSString, "stringWithFormat:", self->_detailText, v7, v13, v14);
LABEL_8:
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_9:
      uint64_t v10 = (__CFString *)v11;
      break;
    default:
      uint64_t v10 = &stru_1EF456870;
      break;
  }

  return v10;
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
  [v5 encodeObject:self->_custodianshipInfo forKey:@"_custodianshipInfo"];
}

- (AAOBCustodianInvitationModel)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)AAOBCustodianInvitationModel;
  id v5 = [(AAOBCustodianInvitationModel *)&v27 init];
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

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_custodianshipInfo"];
    custodianshipInfo = v5->_custodianshipInfo;
    v5->_custodianshipInfo = (AACustodianshipInfo *)v24;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(AAOBCustodianInvitationModel);
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

  uint64_t v23 = [(AACustodianshipInfo *)self->_custodianshipInfo copy];
  custodianshipInfo = v4->_custodianshipInfo;
  v4->_custodianshipInfo = (AACustodianshipInfo *)v23;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  uint64_t v15 = NSString;
  uint64_t v14 = [(AAOBCustodianInvitationModel *)self imageName];
  v3 = [(AAOBCustodianInvitationModel *)self title];
  id v4 = [(AAOBCustodianInvitationModel *)self detailText];
  uint64_t v5 = [(AAOBCustodianInvitationModel *)self primaryButton];
  uint64_t v6 = [(AAOBCustodianInvitationModel *)self secondaryButton];
  uint64_t v7 = [(AAOBCustodianInvitationModel *)self helpLinkTitle];
  uint64_t v8 = [(AAOBCustodianInvitationModel *)self helpLinkURL];
  uint64_t v9 = [(AAOBCustodianInvitationModel *)self ownerHandle];
  uint64_t v10 = [(AAOBCustodianInvitationModel *)self recipientHandle];
  uint64_t v11 = [(AAOBCustodianInvitationModel *)self custodianshipInfo];
  uint64_t v12 = [v15 stringWithFormat:@"imageName: %@\title: %@\ndetailText: %@\nprimaryButton: %@\nsecondaryButton: %@\nhelpLinkTitle: %@\nhelpLinkURL: %@\nownerHandle: %@\nrecipientHandle: %@\ncustodianshipInfo: %@\n", v14, v3, v4, v5, v6, v7, v8, v9, v10, v11];

  return (NSString *)v12;
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

- (AACustodianshipInfo)custodianshipInfo
{
  return self->_custodianshipInfo;
}

- (void)setCustodianshipInfo:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_custodianshipInfo, 0);
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