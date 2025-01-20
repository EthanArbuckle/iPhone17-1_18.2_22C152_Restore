@interface CNContactViewFooterView
- (CNContact)contact;
- (CNContactViewFooterView)init;
- (UILabel)label;
- (void)setContact:(id)a3;
- (void)setLabel:(id)a3;
- (void)setupSubviews;
- (void)updateLabelText;
@end

@implementation CNContactViewFooterView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setLabel:(id)a3
{
}

- (UILabel)label
{
  return self->_label;
}

- (void)updateLabelText
{
  v3 = [(CNContactViewFooterView *)self contact];
  uint64_t v4 = [v3 contactType];

  v5 = CNContactsUIBundle();
  id v9 = v5;
  if (v4 == 1) {
    v6 = @"ORGANIZATION_PRONUNCIATION_UPDATED_MESSAGE";
  }
  else {
    v6 = @"CONTACT_PRONUNCIATION_UPDATED_MESSAGE";
  }
  v7 = [v5 localizedStringForKey:v6 value:&stru_1ED8AC728 table:@"Localized"];
  v8 = [(CNContactViewFooterView *)self label];
  [v8 setText:v7];
}

- (void)setContact:(id)a3
{
  id v5 = a3;
  if ((-[CNContact isEqual:](self->_contact, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_contact, a3);
    [(CNContactViewFooterView *)self updateLabelText];
  }
}

- (void)setupSubviews
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 setAdjustsFontForContentSizeCategory:1];
  uint64_t v4 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
  [v3 setFont:v4];

  id v5 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
  [v3 setTextColor:v5];

  [v3 setTextAlignment:1];
  [v3 setNumberOfLines:0];
  [(CNContactViewFooterView *)self setLabel:v3];
  [(CNContactViewFooterView *)self updateLabelText];
  [(CNContactViewFooterView *)self addSubview:v3];
  v15 = (void *)MEMORY[0x1E4F28DC8];
  v18 = [v3 leadingAnchor];
  v19 = [(CNContactViewFooterView *)self layoutMarginsGuide];
  v17 = [v19 leadingAnchor];
  v16 = [v18 constraintEqualToAnchor:v17];
  v20[0] = v16;
  v6 = [v3 trailingAnchor];
  v7 = [(CNContactViewFooterView *)self layoutMarginsGuide];
  v8 = [v7 trailingAnchor];
  id v9 = [v6 constraintEqualToAnchor:v8];
  v20[1] = v9;
  v10 = [v3 topAnchor];
  v11 = [(CNContactViewFooterView *)self layoutMarginsGuide];
  v12 = [v11 topAnchor];
  v13 = [v10 constraintEqualToAnchor:v12 constant:8.0];
  v20[2] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
  [v15 activateConstraints:v14];
}

- (CNContactViewFooterView)init
{
  v6.receiver = self;
  v6.super_class = (Class)CNContactViewFooterView;
  v2 = -[CNContactViewFooterView initWithFrame:](&v6, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  id v3 = v2;
  if (v2)
  {
    [(CNContactViewFooterView *)v2 setupSubviews];
    uint64_t v4 = v3;
  }

  return v3;
}

@end