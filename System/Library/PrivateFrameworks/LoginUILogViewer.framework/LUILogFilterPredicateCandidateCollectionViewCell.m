@interface LUILogFilterPredicateCandidateCollectionViewCell
- (LUILogFilterPredicateCandidateCollectionViewCell)initWithFrame:(CGRect)a3;
- (UILabel)titleLabel;
- (id)_createTitleLabel;
- (void)_setupUI;
- (void)layoutSubViews;
- (void)setSelected:(BOOL)a3;
@end

@implementation LUILogFilterPredicateCandidateCollectionViewCell

- (LUILogFilterPredicateCandidateCollectionViewCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)LUILogFilterPredicateCandidateCollectionViewCell;
  v3 = -[LUILogFilterPredicateCandidateCollectionViewCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(LUILogFilterPredicateCandidateCollectionViewCell *)v3 _setupUI];
  }
  return v4;
}

- (void)_setupUI
{
  v3 = [(LUILogFilterPredicateCandidateCollectionViewCell *)self _createTitleLabel];
  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;

  id v5 = [(LUILogFilterPredicateCandidateCollectionViewCell *)self contentView];
  [v5 addSubview:self->_titleLabel];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LUILogFilterPredicateCandidateCollectionViewCell;
  -[LUILogFilterPredicateCandidateCollectionViewCell setSelected:](&v9, sel_setSelected_);
  if (v3)
  {
    id v5 = [MEMORY[0x263F1C550] lightGrayColor];
    [(LUILogFilterPredicateCandidateCollectionViewCell *)self setBackgroundColor:v5];

    [MEMORY[0x263F1C550] darkGrayColor];
  }
  else
  {
    objc_super v6 = [MEMORY[0x263F1C550] clearColor];
    [(LUILogFilterPredicateCandidateCollectionViewCell *)self setBackgroundColor:v6];

    [MEMORY[0x263F1C550] whiteColor];
  v7 = };
  v8 = [(LUILogFilterPredicateCandidateCollectionViewCell *)self titleLabel];
  [v8 setTextColor:v7];
}

- (void)layoutSubViews
{
  [(LUILogFilterPredicateCandidateCollectionViewCell *)self frame];
  CGFloat v3 = CGRectGetWidth(v7) + -20.0;
  [(LUILogFilterPredicateCandidateCollectionViewCell *)self frame];
  double Height = CGRectGetHeight(v8);
  id v5 = [(LUILogFilterPredicateCandidateCollectionViewCell *)self titleLabel];
  objc_msgSend(v5, "setFrame:", 10.0, 0.0, v3, Height);
}

- (id)_createTitleLabel
{
  CGFloat v3 = objc_opt_new();
  [(LUILogFilterPredicateCandidateCollectionViewCell *)self frame];
  CGFloat v4 = CGRectGetWidth(v9) + -20.0;
  [(LUILogFilterPredicateCandidateCollectionViewCell *)self frame];
  objc_msgSend(v3, "setFrame:", 10.0, 0.0, v4, CGRectGetHeight(v10));
  id v5 = [MEMORY[0x263F1C658] systemFontOfSize:17.0 weight:*MEMORY[0x263F1D330]];
  [v3 setFont:v5];

  objc_super v6 = [MEMORY[0x263F1C550] whiteColor];
  [v3 setTextColor:v6];

  [v3 setTextAlignment:1];
  [v3 setAutoresizingMask:18];

  return v3;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void).cxx_destruct
{
}

@end