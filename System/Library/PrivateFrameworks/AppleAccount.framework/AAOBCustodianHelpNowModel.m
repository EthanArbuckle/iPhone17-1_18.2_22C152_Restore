@interface AAOBCustodianHelpNowModel
+ (BOOL)supportsSecureCoding;
- (AAOBCustodianHelpNowModel)initWithCoder:(id)a3;
- (AAOBCustodianHelpNowModel)initWithRecoveryCode:(id)a3 ownerName:(id)a4;
- (NSString)description;
- (NSString)detailText;
- (NSString)helpLinkTitle;
- (NSString)helpLinkURL;
- (NSString)imageName;
- (NSString)ownerName;
- (NSString)primaryButton;
- (NSString)recoveryCode;
- (NSString)secondaryButton;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDetailText:(id)a3;
- (void)setHelpLinkTitle:(id)a3;
- (void)setHelpLinkURL:(id)a3;
- (void)setImageName:(id)a3;
- (void)setOwnerName:(id)a3;
- (void)setPrimaryButton:(id)a3;
- (void)setRecoveryCode:(id)a3;
- (void)setSecondaryButton:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation AAOBCustodianHelpNowModel

- (AAOBCustodianHelpNowModel)initWithRecoveryCode:(id)a3 ownerName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)AAOBCustodianHelpNowModel;
  v9 = [(AAOBCustodianHelpNowModel *)&v24 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_recoveryCode, a3);
    objc_storeStrong((id *)&v10->_ownerName, a4);
    v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    uint64_t v12 = [v11 localizedStringForKey:@"CUSTODIAN_HELP_NOW_TITLE" value:0 table:@"Localizable"];
    title = v10->_title;
    v10->_title = (NSString *)v12;

    v14 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    uint64_t v15 = [v14 localizedStringForKey:@"CUSTODIAN_HELP_NOW_TEXT" value:0 table:@"Localizable"];
    detailText = v10->_detailText;
    v10->_detailText = (NSString *)v15;

    v17 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    uint64_t v18 = [v17 localizedStringForKey:@"CUSTODIAN_HELP_NOW_DONE_BUTTON" value:0 table:@"Localizable"];
    primaryButton = v10->_primaryButton;
    v10->_primaryButton = (NSString *)v18;

    helpLinkTitle = v10->_helpLinkTitle;
    v10->_helpLinkTitle = 0;

    helpLinkURL = v10->_helpLinkURL;
    v10->_helpLinkURL = 0;

    imageName = v10->_imageName;
    v10->_imageName = (NSString *)@"recovery_contact_shield";
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
  [v5 encodeObject:self->_recoveryCode forKey:@"_recoveryCode"];
  [v5 encodeObject:self->_ownerName forKey:@"_ownerName"];
}

- (AAOBCustodianHelpNowModel)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)AAOBCustodianHelpNowModel;
  id v5 = [(AAOBCustodianHelpNowModel *)&v25 init];
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

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_recoveryCode"];
    recoveryCode = v5->_recoveryCode;
    v5->_recoveryCode = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_ownerName"];
    ownerName = v5->_ownerName;
    v5->_ownerName = (NSString *)v22;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(AAOBCustodianHelpNowModel);
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

  uint64_t v19 = [(NSString *)self->_recoveryCode copy];
  recoveryCode = v4->_recoveryCode;
  v4->_recoveryCode = (NSString *)v19;

  uint64_t v21 = [(NSString *)self->_ownerName copy];
  ownerName = v4->_ownerName;
  v4->_ownerName = (NSString *)v21;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = [(AAOBCustodianHelpNowModel *)self imageName];
  uint64_t v5 = [(AAOBCustodianHelpNowModel *)self title];
  uint64_t v6 = [(AAOBCustodianHelpNowModel *)self detailText];
  uint64_t v7 = [(AAOBCustodianHelpNowModel *)self primaryButton];
  uint64_t v8 = [(AAOBCustodianHelpNowModel *)self secondaryButton];
  uint64_t v9 = [(AAOBCustodianHelpNowModel *)self helpLinkTitle];
  uint64_t v10 = [(AAOBCustodianHelpNowModel *)self helpLinkURL];
  uint64_t v11 = [(AAOBCustodianHelpNowModel *)self recoveryCode];
  uint64_t v12 = [(AAOBCustodianHelpNowModel *)self ownerName];
  uint64_t v13 = [v3 stringWithFormat:@"imageName: %@\title: %@\ndetailText: %@\nprimaryButton: %@\nsecondaryButton: %@\nhelpLinkTitle: %@\nhelpLinkURL: %@\nrecoveryCode: %@\nownerName: %@\n", v4, v5, v6, v7, v8, v9, v10, v11, v12];

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

- (NSString)recoveryCode
{
  return self->_recoveryCode;
}

- (void)setRecoveryCode:(id)a3
{
}

- (NSString)ownerName
{
  return self->_ownerName;
}

- (void)setOwnerName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ownerName, 0);
  objc_storeStrong((id *)&self->_recoveryCode, 0);
  objc_storeStrong((id *)&self->_helpLinkURL, 0);
  objc_storeStrong((id *)&self->_helpLinkTitle, 0);
  objc_storeStrong((id *)&self->_secondaryButton, 0);
  objc_storeStrong((id *)&self->_primaryButton, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_imageName, 0);
}

@end