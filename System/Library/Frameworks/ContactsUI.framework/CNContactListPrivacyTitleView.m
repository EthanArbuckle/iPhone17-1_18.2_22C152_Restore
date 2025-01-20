@interface CNContactListPrivacyTitleView
- (BOOL)hasIcon;
- (CNContactListPrivacyTitleView)initWithTitle:(id)a3 hasIcon:(BOOL)a4;
- (NSString)title;
- (UILabel)titleLabel;
- (id)_titleTextWithIcon:(id)a3;
- (void)_setupTitleLabel;
- (void)_updateTitleLabel;
- (void)setHasIcon:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation CNContactListPrivacyTitleView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)hasIcon
{
  return self->_hasIcon;
}

- (id)_titleTextWithIcon:(id)a3
{
  v24[2] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4FB1830];
  id v4 = a3;
  v5 = [v3 configurationWithPointSize:24.0];
  v6 = (void *)MEMORY[0x1E4FB1830];
  v7 = [MEMORY[0x1E4FB1618] systemWhiteColor];
  v24[0] = v7;
  v8 = [MEMORY[0x1E4FB1618] systemBlueColor];
  v24[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  v10 = [v6 configurationWithPaletteColors:v9];

  v11 = [v5 configurationByApplyingConfiguration:v10];

  id v12 = objc_alloc_init(MEMORY[0x1E4FB0870]);
  v13 = [MEMORY[0x1E4FB1818] systemImageNamed:@"hand.raised.square.fill" withConfiguration:v11];
  [v12 setImage:v13];

  id v14 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  v15 = (void *)MEMORY[0x1E4F28B18];
  uint64_t v22 = *MEMORY[0x1E4FB06C8];
  v23 = &unk_1ED9155D0;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  v17 = [v15 attributedStringWithAttachment:v12 attributes:v16];
  [v14 appendAttributedString:v17];

  id v18 = objc_alloc(MEMORY[0x1E4F28B18]);
  v19 = [@" " stringByAppendingString:v4];

  v20 = (void *)[v18 initWithString:v19];
  [v14 appendAttributedString:v20];

  return v14;
}

- (void)_updateTitleLabel
{
  if ([(CNContactListPrivacyTitleView *)self hasIcon])
  {
    uint64_t v3 = [(CNContactListPrivacyTitleView *)self _titleTextWithIcon:self->_title];
  }
  else
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F28B18]) initWithString:self->_title];
  }
  id v4 = (id)v3;
  [(UILabel *)self->_titleLabel setAttributedText:v3];
}

- (void)_setupTitleLabel
{
  uint64_t v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;
  v5 = v3;

  v6 = [(UILabel *)v5 font];
  v7 = [v6 fontDescriptor];
  id v19 = [v7 fontDescriptorWithSymbolicTraits:2];

  v8 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v19 size:0.0];
  [(UILabel *)v5 setFont:v8];

  [(UILabel *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CNContactListPrivacyTitleView *)self _updateTitleLabel];
  v9 = [MEMORY[0x1E4F1CA48] array];
  v10 = [(UILabel *)v5 widthAnchor];
  v11 = [(CNContactListPrivacyTitleView *)self widthAnchor];
  id v12 = [v10 constraintEqualToAnchor:v11];
  [v9 addObject:v12];

  v13 = [(UILabel *)v5 centerXAnchor];
  id v14 = [(CNContactListPrivacyTitleView *)self centerXAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  [v9 addObject:v15];

  v16 = [(UILabel *)v5 centerYAnchor];
  v17 = [(CNContactListPrivacyTitleView *)self centerYAnchor];
  id v18 = [v16 constraintEqualToAnchor:v17];
  [v9 addObject:v18];

  [(CNContactListPrivacyTitleView *)self addConstraints:v9];
  [(CNContactListPrivacyTitleView *)self addSubview:v5];
}

- (void)setHasIcon:(BOOL)a3
{
  if (self->_hasIcon != a3)
  {
    self->_hasIcon = a3;
    id v4 = (void *)MEMORY[0x1E4FB1EB0];
    v5 = [(CNContactListPrivacyTitleView *)self titleLabel];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __44__CNContactListPrivacyTitleView_setHasIcon___block_invoke;
    v6[3] = &unk_1E549B488;
    v6[4] = self;
    [v4 transitionWithView:v5 duration:5308544 options:v6 animations:0 completion:0.25];
  }
}

uint64_t __44__CNContactListPrivacyTitleView_setHasIcon___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateTitleLabel];
  v2 = *(void **)(a1 + 32);

  return [v2 layoutIfNeeded];
}

- (void)setTitle:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_title, a3);
    [(CNContactListPrivacyTitleView *)self _updateTitleLabel];
    id v5 = v6;
  }
}

- (CNContactListPrivacyTitleView)initWithTitle:(id)a3 hasIcon:(BOOL)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNContactListPrivacyTitleView;
  v8 = [(CNContactListPrivacyTitleView *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_title, a3);
    v9->_hasIcon = a4;
    [(CNContactListPrivacyTitleView *)v9 _setupTitleLabel];
    v10 = v9;
  }

  return v9;
}

@end