@interface WDMedicalRecordCategorySectionHeaderCell
- (HKGradient)gradient;
- (HKRoundedHeaderView)headerView;
- (NSString)title;
- (UIImage)image;
- (void)setGradient:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)setImage:(id)a3;
- (void)setTitle:(id)a3;
- (void)setupSubviews;
@end

@implementation WDMedicalRecordCategorySectionHeaderCell

- (void)setupSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)WDMedicalRecordCategorySectionHeaderCell;
  [(WDMedicalRecordGroupableCell *)&v13 setupSubviews];
  id v3 = objc_alloc(MEMORY[0x1E4F67BF0]);
  v4 = [MEMORY[0x1E4F67AE0] defaultGradient];
  v5 = (void *)[v3 initWithGradient:v4];
  [(WDMedicalRecordCategorySectionHeaderCell *)self setHeaderView:v5];

  v6 = [MEMORY[0x1E4FB1618] systemWhiteColor];
  v7 = [(WDMedicalRecordCategorySectionHeaderCell *)self headerView];
  [v7 setTextColor:v6];

  v8 = [(WDMedicalRecordCategorySectionHeaderCell *)self headerView];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  v9 = [(WDMedicalRecordCategorySectionHeaderCell *)self contentView];
  v10 = [(WDMedicalRecordCategorySectionHeaderCell *)self headerView];
  [v9 addSubview:v10];

  v11 = [(WDMedicalRecordCategorySectionHeaderCell *)self headerView];
  v12 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  objc_msgSend(v11, "hk_alignConstraintsWithView:", v12);
}

- (void)setGradient:(id)a3
{
  id v4 = a3;
  id v5 = [(WDMedicalRecordCategorySectionHeaderCell *)self headerView];
  [v5 setGradient:v4];
}

- (HKGradient)gradient
{
  v2 = [(WDMedicalRecordCategorySectionHeaderCell *)self headerView];
  id v3 = [v2 gradient];

  return (HKGradient *)v3;
}

- (UIImage)image
{
  v2 = [(WDMedicalRecordCategorySectionHeaderCell *)self headerView];
  id v3 = [v2 image];

  return (UIImage *)v3;
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  id v5 = [(WDMedicalRecordCategorySectionHeaderCell *)self headerView];
  [v5 setImage:v4];
}

- (NSString)title
{
  v2 = [(WDMedicalRecordCategorySectionHeaderCell *)self headerView];
  id v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(WDMedicalRecordCategorySectionHeaderCell *)self headerView];
  [v5 setText:v4];
}

- (HKRoundedHeaderView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end