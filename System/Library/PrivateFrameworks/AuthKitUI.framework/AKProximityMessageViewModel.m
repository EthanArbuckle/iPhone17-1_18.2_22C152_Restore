@interface AKProximityMessageViewModel
- (AKProximityMessageViewModel)initWithType:(unint64_t)a3;
- (NSString)detailedText;
- (NSString)primaryButtonTitle;
- (NSString)secondaryButtonTitle;
- (NSString)titleText;
- (unint64_t)type;
- (void)setDetailedText:(id)a3;
- (void)setPrimaryButtonTitle:(id)a3;
- (void)setSecondaryButtonTitle:(id)a3;
- (void)setTitleText:(id)a3;
@end

@implementation AKProximityMessageViewModel

- (AKProximityMessageViewModel)initWithType:(unint64_t)a3
{
  v30.receiver = self;
  v30.super_class = (Class)AKProximityMessageViewModel;
  v4 = [(AKProximityMessageViewModel *)&v30 init];
  v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    switch(a3)
    {
      case 0uLL:
        v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        uint64_t v7 = [v6 localizedStringForKey:@"PROXIMITY_AUTH_BROADCAST_TITLE" value:&stru_1F1EE8138 table:@"Localizable"];
        titleText = v5->_titleText;
        v5->_titleText = (NSString *)v7;

        v9 = (void *)MEMORY[0x1E4F4F010];
        v10 = @"PROXIMITY_AUTH_BROADCAST_DESCRIPTION";
        goto LABEL_9;
      case 1uLL:
        v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        uint64_t v12 = [v11 localizedStringForKey:@"PROXIMITY_AUTH_VISUAL_PAIRING_TITLE" value:&stru_1F1EE8138 table:@"Localizable"];
        v13 = v5->_titleText;
        v5->_titleText = (NSString *)v12;

        v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v15 = v14;
        v16 = @"PROXIMITY_AUTH_VISUAL_PAIRING_DESCRIPTION";
        goto LABEL_6;
      case 2uLL:
        v17 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        uint64_t v18 = [v17 localizedStringForKey:@"PROXIMITY_AUTH_PIN_VIEW_TITLE" value:&stru_1F1EE8138 table:@"Localizable"];
        v19 = v5->_titleText;
        v5->_titleText = (NSString *)v18;

        v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v15 = v14;
        v16 = @"PROXIMITY_AUTH_PIN_VIEW_DESCRIPTION";
LABEL_6:
        uint64_t v20 = [(NSString *)v14 localizedStringForKey:v16 value:&stru_1F1EE8138 table:@"Localizable"];
        detailedText = v5->_detailedText;
        v5->_detailedText = (NSString *)v20;

        goto LABEL_10;
      case 3uLL:
        v22 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        uint64_t v23 = [v22 localizedStringForKey:@"PROXIMITY_AUTH_BROADCAST_TITLE" value:&stru_1F1EE8138 table:@"Localizable"];
        v24 = v5->_titleText;
        v5->_titleText = (NSString *)v23;

        v9 = (void *)MEMORY[0x1E4F4F010];
        v10 = @"PROXIMITY_AUTH_SETUP_IN_PROGRESS_DESCRIPTION";
        goto LABEL_9;
      case 4uLL:
        v25 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        uint64_t v26 = [v25 localizedStringForKey:@"PROXIMITY_AUTH_ERROR_TITLE" value:&stru_1F1EE8138 table:@"Localizable"];
        v27 = v5->_titleText;
        v5->_titleText = (NSString *)v26;

        v9 = (void *)MEMORY[0x1E4F4F010];
        v10 = @"PROXIMITY_AUTH_ERROR_DESCRIPTION";
LABEL_9:
        uint64_t v28 = [v9 deviceSpecificLocalizedStringWithKey:v10];
        v15 = v5->_detailedText;
        v5->_detailedText = (NSString *)v28;
LABEL_10:

        break;
      default:
        return v5;
    }
  }
  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (void)setTitleText:(id)a3
{
}

- (NSString)detailedText
{
  return self->_detailedText;
}

- (void)setDetailedText:(id)a3
{
}

- (NSString)primaryButtonTitle
{
  return self->_primaryButtonTitle;
}

- (void)setPrimaryButtonTitle:(id)a3
{
}

- (NSString)secondaryButtonTitle
{
  return self->_secondaryButtonTitle;
}

- (void)setSecondaryButtonTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryButtonTitle, 0);
  objc_storeStrong((id *)&self->_primaryButtonTitle, 0);
  objc_storeStrong((id *)&self->_detailedText, 0);

  objc_storeStrong((id *)&self->_titleText, 0);
}

@end