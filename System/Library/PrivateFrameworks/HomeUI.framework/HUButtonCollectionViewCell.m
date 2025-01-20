@interface HUButtonCollectionViewCell
- (BOOL)bottomSeparatorVisible;
- (BOOL)isDisabled;
- (BOOL)topSeparatorVisible;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (HFItem)item;
- (HUButtonCell)buttonView;
- (HUButtonCollectionViewCell)initWithFrame:(CGRect)a3;
- (UIView)bottomSeparatorView;
- (UIView)topSeparatorView;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setBottomSeparatorVisible:(BOOL)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setItem:(id)a3;
- (void)setTopSeparatorVisible:(BOOL)a3;
- (void)updateUIWithAnimation:(BOOL)a3;
@end

@implementation HUButtonCollectionViewCell

- (HUButtonCollectionViewCell)initWithFrame:(CGRect)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v25.receiver = self;
  v25.super_class = (Class)HUButtonCollectionViewCell;
  v3 = -[HUButtonCollectionViewCell initWithFrame:](&v25, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
    [(HUButtonCollectionViewCell *)v3 setBackgroundColor:v4];

    v5 = [[HUButtonCell alloc] initWithStyle:0 reuseIdentifier:0];
    buttonView = v3->_buttonView;
    v3->_buttonView = v5;

    [(HUButtonCell *)v3->_buttonView setUserInteractionEnabled:0];
    v7 = [(HUButtonCollectionViewCell *)v3 contentView];
    [v7 addSubview:v3->_buttonView];

    v8 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    topSeparatorView = v3->_topSeparatorView;
    v3->_topSeparatorView = v8;

    v10 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    bottomSeparatorView = v3->_bottomSeparatorView;
    v3->_bottomSeparatorView = v10;

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v26[0] = v3->_topSeparatorView;
    v26[1] = v3->_bottomSeparatorView;
    v12 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v26, 2, 0);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          [v17 setHidden:1];
          v18 = [MEMORY[0x1E4F428B8] tableSeparatorDarkColor];
          [v17 setBackgroundColor:v18];

          v19 = [(HUButtonCollectionViewCell *)v3 contentView];
          [v19 addSubview:v17];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v27 count:16];
      }
      while (v14);
    }
  }
  return v3;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  v9 = [(HUButtonCollectionViewCell *)self buttonView];
  *(float *)&double v10 = a4;
  *(float *)&double v11 = a5;
  objc_msgSend(v9, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v10, v11);
  double v13 = v12;
  double v15 = v14;

  double v16 = v13;
  double v17 = v15;
  result.double height = v17;
  result.double width = v16;
  return result;
}

- (void)layoutSubviews
{
  v26.receiver = self;
  v26.super_class = (Class)HUButtonCollectionViewCell;
  [(HUButtonCollectionViewCell *)&v26 layoutSubviews];
  v3 = [(HUButtonCollectionViewCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = [(HUButtonCollectionViewCell *)self buttonView];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  double v13 = [MEMORY[0x1E4F42D90] mainScreen];
  [v13 scale];
  double v15 = 1.0 / v14;

  [(HUButtonCollectionViewCell *)self layoutMargins];
  double v17 = v16;
  v18 = [(HUButtonCollectionViewCell *)self contentView];
  [v18 bounds];
  double Width = CGRectGetWidth(v27);
  v20 = [(HUButtonCollectionViewCell *)self topSeparatorView];
  objc_msgSend(v20, "setFrame:", v17, 0.0, Width, v15);

  long long v21 = [(HUButtonCollectionViewCell *)self contentView];
  [v21 bounds];
  CGFloat v22 = CGRectGetMaxY(v28) - v15;
  long long v23 = [(HUButtonCollectionViewCell *)self contentView];
  [v23 bounds];
  double v24 = CGRectGetWidth(v29);
  objc_super v25 = [(HUButtonCollectionViewCell *)self bottomSeparatorView];
  objc_msgSend(v25, "setFrame:", 0.0, v22, v24, v15);
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)HUButtonCollectionViewCell;
  [(HUButtonCollectionViewCell *)&v3 prepareForReuse];
  [(HUButtonCollectionViewCell *)self setTopSeparatorVisible:0];
  [(HUButtonCollectionViewCell *)self setBottomSeparatorVisible:0];
}

- (void)setHighlighted:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HUButtonCollectionViewCell;
  -[HUButtonCollectionViewCell setHighlighted:](&v6, sel_setHighlighted_);
  if (a3) {
    [MEMORY[0x1E4F428B8] colorWithWhite:0.85 alpha:1.0];
  }
  else {
  double v5 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  }
  [(HUButtonCollectionViewCell *)self setBackgroundColor:v5];
}

- (HFItem)item
{
  v2 = [(HUButtonCollectionViewCell *)self buttonView];
  objc_super v3 = [v2 item];

  return (HFItem *)v3;
}

- (void)setItem:(id)a3
{
  id v4 = a3;
  id v5 = [(HUButtonCollectionViewCell *)self buttonView];
  [v5 setItem:v4];
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(HUButtonCollectionViewCell *)self buttonView];
  [v4 updateUIWithAnimation:v3];
}

- (BOOL)topSeparatorVisible
{
  v2 = [(HUButtonCollectionViewCell *)self topSeparatorView];
  char v3 = [v2 isHidden] ^ 1;

  return v3;
}

- (void)setTopSeparatorVisible:(BOOL)a3
{
  BOOL v3 = !a3;
  id v4 = [(HUButtonCollectionViewCell *)self topSeparatorView];
  [v4 setHidden:v3];
}

- (BOOL)bottomSeparatorVisible
{
  v2 = [(HUButtonCollectionViewCell *)self bottomSeparatorView];
  char v3 = [v2 isHidden] ^ 1;

  return v3;
}

- (void)setBottomSeparatorVisible:(BOOL)a3
{
  BOOL v3 = !a3;
  id v4 = [(HUButtonCollectionViewCell *)self bottomSeparatorView];
  [v4 setHidden:v3];
}

- (BOOL)isDisabled
{
  v2 = [(HUButtonCollectionViewCell *)self buttonView];
  char v3 = [v2 isDisabled];

  return v3;
}

- (void)setDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(HUButtonCollectionViewCell *)self buttonView];
  [v4 setDisabled:v3];
}

- (HUButtonCell)buttonView
{
  return self->_buttonView;
}

- (UIView)topSeparatorView
{
  return self->_topSeparatorView;
}

- (UIView)bottomSeparatorView
{
  return self->_bottomSeparatorView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomSeparatorView, 0);
  objc_storeStrong((id *)&self->_topSeparatorView, 0);

  objc_storeStrong((id *)&self->_buttonView, 0);
}

@end