@interface CNStarkContactInfoViewController
+ (CNKeyDescriptor)descriptorForRequiredKeys;
- (BOOL)shouldShowGemini;
- (CNContact)contact;
- (CNContactGeminiView)contactGeminiView;
- (CNGeminiResult)geminiResult;
- (CNStarkContactInfoViewController)init;
- (CNStarkContactInfoViewController)initWithCoder:(id)a3;
- (CNStarkContactInfoViewController)initWithContact:(id)a3;
- (CNStarkContactInfoViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (CNUIGeminiDataSource)geminiDataSource;
- (NSArray)layoutConstraints;
- (NSLayoutYAxisAnchor)firstBaselineAnchor;
- (UILabel)primaryLabel;
- (UILabel)secondaryLabel;
- (UIStackView)stackView;
- (void)geminiDataSourceDidUpdate:(id)a3;
- (void)resetLayoutConstraints;
- (void)setContactGeminiView:(id)a3;
- (void)setGeminiDataSource:(id)a3;
- (void)setGeminiResult:(id)a3;
- (void)setLayoutConstraints:(id)a3;
- (void)setupLayoutConstraints;
- (void)setupViews;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateViewConstraints;
- (void)updateViews;
- (void)viewDidLoad;
@end

@implementation CNStarkContactInfoViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geminiResult, 0);
  objc_storeStrong((id *)&self->_geminiDataSource, 0);
  objc_storeStrong((id *)&self->_contactGeminiView, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_layoutConstraints, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);

  objc_storeStrong((id *)&self->_firstBaselineAnchor, 0);
}

- (void)setGeminiResult:(id)a3
{
}

- (CNGeminiResult)geminiResult
{
  return self->_geminiResult;
}

- (void)setGeminiDataSource:(id)a3
{
}

- (CNUIGeminiDataSource)geminiDataSource
{
  return self->_geminiDataSource;
}

- (void)setContactGeminiView:(id)a3
{
}

- (CNContactGeminiView)contactGeminiView
{
  return self->_contactGeminiView;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setLayoutConstraints:(id)a3
{
}

- (NSArray)layoutConstraints
{
  return self->_layoutConstraints;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (UILabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (UILabel)primaryLabel
{
  return self->_primaryLabel;
}

- (NSLayoutYAxisAnchor)firstBaselineAnchor
{
  return self->_firstBaselineAnchor;
}

- (void)geminiDataSourceDidUpdate:(id)a3
{
  id v7 = [a3 geminiResult];
  [(CNStarkContactInfoViewController *)self setGeminiResult:v7];
  v4 = [(CNStarkContactInfoViewController *)self contactGeminiView];
  [v4 setGeminiResult:v7];

  if ([(CNStarkContactInfoViewController *)self shouldShowGemini])
  {
    v5 = [(CNStarkContactInfoViewController *)self stackView];
    v6 = [(CNStarkContactInfoViewController *)self contactGeminiView];
    [v5 addArrangedSubview:v6];
  }
  else
  {
    v5 = [(CNStarkContactInfoViewController *)self contactGeminiView];
    [v5 removeFromSuperview];
  }
}

- (BOOL)shouldShowGemini
{
  v3 = [(CNStarkContactInfoViewController *)self geminiResult];
  v4 = [(CNStarkContactInfoViewController *)self contact];
  BOOL v5 = +[CNContactContentDisplayViewController shouldShowGeminiForResult:v3 contact:v4];

  return v5;
}

- (void)setupLayoutConstraints
{
  v26[4] = *MEMORY[0x1E4F143B8];
  v25 = [(CNStarkContactInfoViewController *)self view];
  v23 = [v25 leadingAnchor];
  v24 = [(CNStarkContactInfoViewController *)self stackView];
  v22 = [v24 leadingAnchor];
  v21 = [v23 constraintEqualToAnchor:v22];
  v26[0] = v21;
  v20 = [(CNStarkContactInfoViewController *)self view];
  v18 = [v20 topAnchor];
  v19 = [(CNStarkContactInfoViewController *)self stackView];
  v17 = [v19 topAnchor];
  v16 = [v18 constraintEqualToAnchor:v17];
  v26[1] = v16;
  v15 = [(CNStarkContactInfoViewController *)self view];
  v3 = [v15 trailingAnchor];
  v4 = [(CNStarkContactInfoViewController *)self stackView];
  BOOL v5 = [v4 trailingAnchor];
  v6 = [v3 constraintEqualToAnchor:v5];
  v26[2] = v6;
  id v7 = [(CNStarkContactInfoViewController *)self view];
  v8 = [v7 bottomAnchor];
  v9 = [(CNStarkContactInfoViewController *)self stackView];
  v10 = [v9 bottomAnchor];
  v11 = [v8 constraintEqualToAnchor:v10];
  v26[3] = v11;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:4];

  [(CNStarkContactInfoViewController *)self setLayoutConstraints:v14];
  v12 = [(CNStarkContactInfoViewController *)self view];
  v13 = [(CNStarkContactInfoViewController *)self layoutConstraints];
  [v12 addConstraints:v13];
}

- (void)updateViewConstraints
{
  v5.receiver = self;
  v5.super_class = (Class)CNStarkContactInfoViewController;
  [(CNStarkContactInfoViewController *)&v5 updateViewConstraints];
  uint64_t v3 = *MEMORY[0x1E4F5A258];
  v4 = [(CNStarkContactInfoViewController *)self layoutConstraints];
  LODWORD(v3) = (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  if (v3) {
    [(CNStarkContactInfoViewController *)self setupLayoutConstraints];
  }
}

- (void)resetLayoutConstraints
{
  uint64_t v3 = [(CNStarkContactInfoViewController *)self view];
  v4 = [(CNStarkContactInfoViewController *)self layoutConstraints];
  [v3 removeConstraints:v4];

  [(CNStarkContactInfoViewController *)self setLayoutConstraints:0];
  id v5 = [(CNStarkContactInfoViewController *)self view];
  [v5 setNeedsUpdateConstraints];
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CNStarkContactInfoViewController;
  [(CNStarkContactInfoViewController *)&v8 traitCollectionDidChange:a3];
  v4 = +[CNUIFontRepository carPlayContactInfoViewPrimaryLabelFont];
  id v5 = [(CNStarkContactInfoViewController *)self primaryLabel];
  [v5 setFont:v4];

  v6 = +[CNUIFontRepository carPlayContactInfoViewSecondaryLabelFont];
  id v7 = [(CNStarkContactInfoViewController *)self secondaryLabel];
  [v7 setFont:v6];

  [(CNStarkContactInfoViewController *)self resetLayoutConstraints];
}

- (void)updateViews
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1B910];
  v4 = [(CNStarkContactInfoViewController *)self contact];
  id v22 = [v3 stringFromContact:v4 style:0];

  id v5 = [(CNStarkContactInfoViewController *)self contact];
  v6 = [v5 organizationName];

  int v7 = [v22 isEqualToString:v6];
  objc_super v8 = [(CNStarkContactInfoViewController *)self primaryLabel];
  v9 = v8;
  if (v7)
  {
    [v8 setText:v6];

    v10 = [(CNStarkContactInfoViewController *)self primaryLabel];
    [v10 setAccessibilityValue:@"CNStarkContactCompanyLabel"];

    v11 = [(CNStarkContactInfoViewController *)self secondaryLabel];
    [v11 setText:0];

    v12 = [(CNStarkContactInfoViewController *)self secondaryLabel];
    v13 = v12;
    v14 = 0;
  }
  else
  {
    [v8 setText:v22];

    v15 = [(CNStarkContactInfoViewController *)self primaryLabel];
    [v15 setAccessibilityValue:@"CNStarkContactNameLabel"];

    v16 = [(CNStarkContactInfoViewController *)self secondaryLabel];
    [v16 setText:v6];

    v12 = [(CNStarkContactInfoViewController *)self secondaryLabel];
    v13 = v12;
    v14 = @"CNStarkContactCompanyLabel";
  }
  [v12 setAccessibilityValue:v14];

  v17 = [(CNStarkContactInfoViewController *)self secondaryLabel];
  v18 = [v17 text];
  uint64_t v19 = [v18 length];

  if (v19)
  {
    v20 = [(CNStarkContactInfoViewController *)self stackView];
    v21 = [(CNStarkContactInfoViewController *)self secondaryLabel];
    [v20 insertArrangedSubview:v21 atIndex:1];
  }
  else
  {
    v20 = [(CNStarkContactInfoViewController *)self secondaryLabel];
    [v20 removeFromSuperview];
  }
}

- (void)setupViews
{
  v46[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(CNStarkContactInfoViewController *)self primaryLabel];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  v4 = [(CNStarkContactInfoViewController *)self primaryLabel];
  [v4 setNumberOfLines:1];

  id v5 = [(CNStarkContactInfoViewController *)self primaryLabel];
  [v5 setAdjustsFontForContentSizeCategory:1];

  v6 = +[CNUIFontRepository carPlayContactInfoViewPrimaryLabelFont];
  int v7 = [(CNStarkContactInfoViewController *)self primaryLabel];
  [v7 setFont:v6];

  objc_super v8 = +[CNUIColorRepository carPlayContactInfoViewPrimaryLabelTextColor];
  v9 = [(CNStarkContactInfoViewController *)self primaryLabel];
  [v9 setTextColor:v8];

  v10 = [(CNStarkContactInfoViewController *)self primaryLabel];
  [v10 setIsAccessibilityElement:0];

  v11 = [(CNStarkContactInfoViewController *)self primaryLabel];
  [v11 setTextAlignment:4];

  v12 = [(CNStarkContactInfoViewController *)self secondaryLabel];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];

  v13 = [(CNStarkContactInfoViewController *)self secondaryLabel];
  [v13 setNumberOfLines:1];

  v14 = [(CNStarkContactInfoViewController *)self secondaryLabel];
  [v14 setAdjustsFontForContentSizeCategory:1];

  v15 = +[CNUIFontRepository carPlayContactInfoViewSecondaryLabelFont];
  v16 = [(CNStarkContactInfoViewController *)self secondaryLabel];
  [v16 setFont:v15];

  v17 = +[CNUIColorRepository carPlayContactInfoViewSecondaryLabelTextColor];
  v18 = [(CNStarkContactInfoViewController *)self secondaryLabel];
  [v18 setTextColor:v17];

  uint64_t v19 = [(CNStarkContactInfoViewController *)self secondaryLabel];
  [v19 setIsAccessibilityElement:0];

  v20 = [(CNStarkContactInfoViewController *)self secondaryLabel];
  [v20 setTextAlignment:4];

  v21 = [(CNStarkContactInfoViewController *)self stackView];
  [v21 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v22 = [(CNStarkContactInfoViewController *)self stackView];
  [v22 setAlignment:1];

  v23 = [(CNStarkContactInfoViewController *)self stackView];
  [v23 setDistribution:3];

  v24 = [(CNStarkContactInfoViewController *)self stackView];
  [v24 setAxis:1];

  v25 = [(CNStarkContactInfoViewController *)self stackView];
  [v25 setBaselineRelativeArrangement:1];

  v26 = [(CNStarkContactInfoViewController *)self stackView];
  [v26 setSpacing:20.0];

  v27 = [(CNStarkContactInfoViewController *)self stackView];
  v28 = [(CNStarkContactInfoViewController *)self primaryLabel];
  [v27 addArrangedSubview:v28];

  v29 = [(CNStarkContactInfoViewController *)self stackView];
  v30 = [(CNStarkContactInfoViewController *)self secondaryLabel];
  [v29 addArrangedSubview:v30];

  v31 = [(CNStarkContactInfoViewController *)self contactGeminiView];

  if (v31)
  {
    v32 = [(CNStarkContactInfoViewController *)self contactGeminiView];
    [v32 setTranslatesAutoresizingMaskIntoConstraints:0];

    v33 = [(CNStarkContactInfoViewController *)self contactGeminiView];
    [v33 setUserInteractionEnabled:0];

    v34 = [(CNStarkContactInfoViewController *)self contactGeminiView];
    [v34 setAllowsPickerActions:0];

    v35 = [(CNStarkContactInfoViewController *)self geminiResult];
    v36 = [(CNStarkContactInfoViewController *)self contactGeminiView];
    [v36 setGeminiResult:v35];

    v45[0] = *MEMORY[0x1E4FB06F8];
    v37 = +[CNUIFontRepository carPlayContactInfoViewSecondaryLabelFont];
    v46[0] = v37;
    v45[1] = *MEMORY[0x1E4FB0700];
    v38 = +[CNUIColorRepository carPlayContactInfoViewSecondaryLabelTextColor];
    v46[1] = v38;
    v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:2];
    v40 = [(CNStarkContactInfoViewController *)self contactGeminiView];
    objc_msgSend(v40, "setAb_textAttributes:", v39);

    if ([(CNStarkContactInfoViewController *)self shouldShowGemini])
    {
      v41 = [(CNStarkContactInfoViewController *)self stackView];
      v42 = [(CNStarkContactInfoViewController *)self contactGeminiView];
      [v41 addArrangedSubview:v42];
    }
  }
  v43 = [(CNStarkContactInfoViewController *)self view];
  v44 = [(CNStarkContactInfoViewController *)self stackView];
  [v43 addSubview:v44];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CNStarkContactInfoViewController;
  [(CNStarkContactInfoViewController *)&v3 viewDidLoad];
  [(CNStarkContactInfoViewController *)self setupViews];
  [(CNStarkContactInfoViewController *)self updateViews];
}

- (CNStarkContactInfoViewController)initWithContact:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CNStarkContactInfoViewController;
  v6 = [(CNStarkContactInfoViewController *)&v23 initWithNibName:0 bundle:0];
  if (v6)
  {
    int v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    primaryLabel = v6->_primaryLabel;
    v6->_primaryLabel = v7;

    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    secondaryLabel = v6->_secondaryLabel;
    v6->_secondaryLabel = v9;

    v11 = (UIStackView *)objc_alloc_init(MEMORY[0x1E4FB1C60]);
    stackView = v6->_stackView;
    v6->_stackView = v11;

    if ([MEMORY[0x1E4F1B9F8] deviceSupportsGemini])
    {
      v13 = [CNContactGeminiView alloc];
      uint64_t v14 = -[CNContactGeminiView initWithFrame:](v13, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      contactGeminiView = v6->_contactGeminiView;
      v6->_contactGeminiView = (CNContactGeminiView *)v14;

      v16 = [CNUIGeminiDataSource alloc];
      v17 = +[CNUIContactsEnvironment currentEnvironment];
      v18 = [v17 geminiManager];
      uint64_t v19 = [(CNUIGeminiDataSource *)v16 initWithGeminiManager:v18];
      geminiDataSource = v6->_geminiDataSource;
      v6->_geminiDataSource = (CNUIGeminiDataSource *)v19;

      [(CNUIGeminiDataSource *)v6->_geminiDataSource setDelegate:v6];
      [(CNUIGeminiDataSource *)v6->_geminiDataSource setContact:v5];
    }
    objc_storeStrong((id *)&v6->_contact, a3);
    v21 = v6;
  }

  return v6;
}

- (CNStarkContactInfoViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = self;
  CNInitializerUnavailableException();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v9);
}

- (CNStarkContactInfoViewController)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  CNInitializerUnavailableException();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (CNStarkContactInfoViewController)init
{
  v2 = self;
  CNInitializerUnavailableException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (CNKeyDescriptor)descriptorForRequiredKeys
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1B8F8];
  id v3 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  uint64_t v4 = *MEMORY[0x1E4F1AED8];
  v8[0] = v3;
  v8[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  id v6 = [v2 descriptorWithKeyDescriptors:v5 description:@"CNStarkNameViewController keys"];

  return (CNKeyDescriptor *)v6;
}

@end