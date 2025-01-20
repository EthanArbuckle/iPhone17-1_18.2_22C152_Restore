@interface CNAutocompleteDisambiguatingTableViewCell
+ (id)createCheckmarkView;
+ (id)identifier;
- (BOOL)canCollapseRecipient;
- (BOOL)isCheckmarkVisible;
- (CNAutocompleteDisambiguatingTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIImageView)checkmarkImageView;
- (double)leadingInsetsFromCurrentMargins:(NSDirectionalEdgeInsets)a3;
- (id)titleTextStyle;
- (void)setCheckmarkImageView:(id)a3;
- (void)setCheckmarkVisible:(BOOL)a3;
- (void)setRecipient:(id)a3;
@end

@implementation CNAutocompleteDisambiguatingTableViewCell

+ (id)identifier
{
  return @"CNAutocompleteDisambiguatingTableViewCell";
}

+ (id)createCheckmarkView
{
  id v2 = objc_alloc(MEMORY[0x1E4F42AA0]);
  v3 = [MEMORY[0x1E4F42A80] systemImageNamed:@"checkmark"];
  v4 = +[CNComposeTableViewCell axCappedSymbolConfigurationIsBold:1];
  v5 = [v3 imageWithConfiguration:v4];
  v6 = (void *)[v2 initWithImage:v5];

  [v6 setContentMode:4];

  return v6;
}

- (CNAutocompleteDisambiguatingTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)CNAutocompleteDisambiguatingTableViewCell;
  v4 = [(CNComposeTableViewCell *)&v12 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = [(id)objc_opt_class() createCheckmarkView];
    [(CNAutocompleteDisambiguatingTableViewCell *)v4 setCheckmarkImageView:v5];

    v6 = objc_opt_class();
    v7 = [(CNAutocompleteDisambiguatingTableViewCell *)v4 checkmarkImageView];
    [v6 requireIntrinsicSizeForView:v7];

    v8 = [(NUITableViewContainerCell *)v4 containerView];
    v9 = [(CNAutocompleteDisambiguatingTableViewCell *)v4 checkmarkImageView];
    [v8 addArrangedSubview:v9];

    v10 = [(CNComposeTableViewCell *)v4 titleLabel];
    [v10 setNumberOfLines:0];
  }
  return v4;
}

- (id)titleTextStyle
{
  return (id)*MEMORY[0x1E4F438C8];
}

- (void)setRecipient:(id)a3
{
  id v4 = a3;
  id v5 = [(CNComposeTableViewCell *)self recipient];

  if (v5 != v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)CNAutocompleteDisambiguatingTableViewCell;
    [(CNComposeTableViewCell *)&v10 setRecipient:v4];
    v6 = [v4 address];
    v7 = [(CNComposeTableViewCell *)self titleLabel];
    [v7 setText:v6];

    v8 = [v4 label];
    v9 = [(CNComposeTableViewCell *)self detailLabel];
    [v9 setText:v8];
  }
}

- (void)setCheckmarkVisible:(BOOL)a3
{
  self->_checkmarkVisible = a3;
  double v3 = (double)a3;
  id v4 = [(CNAutocompleteDisambiguatingTableViewCell *)self checkmarkImageView];
  [v4 setAlpha:v3];
}

- (BOOL)canCollapseRecipient
{
  return 1;
}

- (double)leadingInsetsFromCurrentMargins:(NSDirectionalEdgeInsets)a3
{
  double leading = a3.leading;
  BOOL v5 = +[CNAutocompleteResultsTableViewController avatarsAreHidden];
  double result = 0.0;
  if (!v5)
  {
    v8.receiver = self;
    v8.super_class = (Class)CNAutocompleteDisambiguatingTableViewCell;
    objc_msgSend(-[CNAutocompleteDisambiguatingTableViewCell class](&v8, sel_class, 0.0), "additionalSeparatorInset");
    return leading + v7;
  }
  return result;
}

- (BOOL)isCheckmarkVisible
{
  return self->_checkmarkVisible;
}

- (UIImageView)checkmarkImageView
{
  return (UIImageView *)objc_getProperty(self, a2, 1096, 1);
}

- (void)setCheckmarkImageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end