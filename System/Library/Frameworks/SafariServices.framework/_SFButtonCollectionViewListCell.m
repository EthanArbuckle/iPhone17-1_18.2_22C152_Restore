@interface _SFButtonCollectionViewListCell
+ (NSString)reuseIdentifier;
- (BOOL)isEnabled;
- (NSString)title;
- (_SFButtonCollectionViewListCell)initWithFrame:(CGRect)a3;
- (_SFButtonCollectionViewListCellDelegate)delegate;
- (void)_reportTranslationIssue:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation _SFButtonCollectionViewListCell

+ (NSString)reuseIdentifier
{
  return (NSString *)@"translationIssueReportButtonCell";
}

- (_SFButtonCollectionViewListCell)initWithFrame:(CGRect)a3
{
  v17.receiver = self;
  v17.super_class = (Class)_SFButtonCollectionViewListCell;
  v3 = -[_SFButtonCollectionViewListCell initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
    [v4 contentInsets];
    [v4 setContentInsets:v5 + 8.0];
    uint64_t v6 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v4 primaryAction:0];
    button = v3->_button;
    v3->_button = (UIButton *)v6;

    [(UIButton *)v3->_button setEnabled:0];
    [(UIButton *)v3->_button setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)v3->_button setAccessibilityIdentifier:@"ReportTranslationIssueButton"];
    v8 = [MEMORY[0x1E4FB1618] systemGrayColor];
    v9 = [v8 colorWithAlphaComponent:0.5];
    [(UIButton *)v3->_button setBackgroundColor:v9];

    [(UIButton *)v3->_button addTarget:v3 action:sel__reportTranslationIssue_ forControlEvents:64];
    v10 = [(_SFButtonCollectionViewListCell *)v3 contentView];
    [v10 addSubview:v3->_button];

    v11 = (void *)MEMORY[0x1E4F28DC8];
    v12 = v3->_button;
    v13 = [(_SFButtonCollectionViewListCell *)v3 contentView];
    v14 = objc_msgSend(v11, "safari_constraintsMatchingFrameOfView:withFrameOfView:", v12, v13);
    [v11 activateConstraints:v14];

    v15 = v3;
  }

  return v3;
}

- (void)setTitle:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v4 = (NSString *)[a3 copy];
  title = self->_title;
  self->_title = v4;

  uint64_t v6 = [(UIButton *)self->_button configuration];
  id v7 = objc_alloc(MEMORY[0x1E4F28B18]);
  v8 = self->_title;
  v13[0] = *MEMORY[0x1E4FB12B0];
  v9 = objc_msgSend(MEMORY[0x1E4FB1798], "_sf_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E4FB28C8], 2);
  v14[0] = v9;
  v13[1] = *MEMORY[0x1E4FB12B8];
  v10 = [MEMORY[0x1E4FB1618] whiteColor];
  v14[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  v12 = (void *)[v7 initWithString:v8 attributes:v11];
  [v6 setAttributedTitle:v12];

  [(UIButton *)self->_button setConfiguration:v6];
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    double v5 = [MEMORY[0x1E4FB1618] systemBlueColor];
    p_button = &self->_button;
    [(UIButton *)*p_button setBackgroundColor:v5];
  }
  else
  {
    double v5 = [MEMORY[0x1E4FB1618] systemGrayColor];
    id v7 = [v5 colorWithAlphaComponent:0.5];
    p_button = &self->_button;
    [(UIButton *)*p_button setBackgroundColor:v7];
  }
  v8 = *p_button;

  [(UIButton *)v8 setEnabled:v3];
}

- (BOOL)isEnabled
{
  return [(UIButton *)self->_button isEnabled];
}

- (void)_reportTranslationIssue:(id)a3
{
  id v4 = [(_SFButtonCollectionViewListCell *)self delegate];
  [v4 collectionViewListCellButtonPressed:self];
}

- (NSString)title
{
  return self->_title;
}

- (_SFButtonCollectionViewListCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_SFButtonCollectionViewListCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_button, 0);
}

@end