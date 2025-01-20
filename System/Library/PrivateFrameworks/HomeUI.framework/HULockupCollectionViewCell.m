@interface HULockupCollectionViewCell
- (BOOL)bottomSeparatorVisible;
- (BOOL)topSeparatorVisible;
- (Class)lockupViewClass;
- (HFItem)item;
- (HULockupCollectionViewCell)initWithFrame:(CGRect)a3;
- (HULockupView)lockupView;
- (HUResizableCellDelegate)resizingDelegate;
- (UIView)bottomSeparatorView;
- (UIView)topSeparatorView;
- (void)didUpdateRequiredHeightForLockupView:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setBottomSeparatorVisible:(BOOL)a3;
- (void)setItem:(id)a3;
- (void)setResizingDelegate:(id)a3;
- (void)setTopSeparatorVisible:(BOOL)a3;
- (void)updateUIWithAnimation:(BOOL)a3;
@end

@implementation HULockupCollectionViewCell

- (HULockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  v50.receiver = self;
  v50.super_class = (Class)HULockupCollectionViewCell;
  v3 = -[HULockupCollectionViewCell initWithFrame:](&v50, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
    [(HULockupCollectionViewCell *)v3 setBackgroundColor:v4];

    id v5 = objc_alloc([(HULockupCollectionViewCell *)v3 lockupViewClass]);
    v6 = [(HULockupCollectionViewCell *)v3 contentView];
    [v6 bounds];
    uint64_t v7 = objc_msgSend(v5, "initWithFrame:");
    lockupView = v3->_lockupView;
    v3->_lockupView = (HULockupView *)v7;

    [(HULockupView *)v3->_lockupView setInternalViewResizingDelegate:v3];
    [(HULockupView *)v3->_lockupView setTranslatesAutoresizingMaskIntoConstraints:0];
    v9 = [(HULockupCollectionViewCell *)v3 contentView];
    [v9 addSubview:v3->_lockupView];

    v10 = [MEMORY[0x1E4F1CA48] array];
    v11 = [(HULockupView *)v3->_lockupView leadingAnchor];
    v12 = [(HULockupCollectionViewCell *)v3 contentView];
    v13 = [v12 layoutMarginsGuide];
    v14 = [v13 leadingAnchor];
    v15 = [(HULockupCollectionViewCell *)v3 contentView];
    [v15 directionalLayoutMargins];
    v17 = [v11 constraintEqualToAnchor:v14 constant:v16];
    [v10 addObject:v17];

    v18 = [(HULockupView *)v3->_lockupView trailingAnchor];
    v19 = [(HULockupCollectionViewCell *)v3 contentView];
    v20 = [v19 layoutMarginsGuide];
    v21 = [v20 trailingAnchor];
    v22 = [v18 constraintEqualToAnchor:v21];
    [v10 addObject:v22];

    v23 = [(HULockupView *)v3->_lockupView topAnchor];
    v24 = [(HULockupCollectionViewCell *)v3 contentView];
    v25 = [v24 layoutMarginsGuide];
    v26 = [v25 topAnchor];
    v27 = [v23 constraintEqualToAnchor:v26];
    [v10 addObject:v27];

    v28 = [(HULockupView *)v3->_lockupView bottomAnchor];
    v29 = [(HULockupCollectionViewCell *)v3 contentView];
    v30 = [v29 layoutMarginsGuide];
    v31 = [v30 bottomAnchor];
    v32 = [v28 constraintEqualToAnchor:v31];
    [v10 addObject:v32];

    [MEMORY[0x1E4F28DC8] activateConstraints:v10];
    v33 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    topSeparatorView = v3->_topSeparatorView;
    v3->_topSeparatorView = v33;

    v35 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    bottomSeparatorView = v3->_bottomSeparatorView;
    v3->_bottomSeparatorView = v35;

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v51[0] = v3->_topSeparatorView;
    v51[1] = v3->_bottomSeparatorView;
    v37 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v51, 2, 0);
    uint64_t v38 = [v37 countByEnumeratingWithState:&v46 objects:v52 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v39; ++i)
        {
          if (*(void *)v47 != v40) {
            objc_enumerationMutation(v37);
          }
          v42 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          [v42 setHidden:1];
          v43 = [MEMORY[0x1E4F428B8] tableSeparatorDarkColor];
          [v42 setBackgroundColor:v43];

          v44 = [(HULockupCollectionViewCell *)v3 contentView];
          [v44 addSubview:v42];
        }
        uint64_t v39 = [v37 countByEnumeratingWithState:&v46 objects:v52 count:16];
      }
      while (v39);
    }
  }
  return v3;
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)HULockupCollectionViewCell;
  [(HULockupCollectionViewCell *)&v14 layoutSubviews];
  v3 = [MEMORY[0x1E4F42D90] mainScreen];
  [v3 scale];
  double v5 = 1.0 / v4;

  v6 = [(HULockupCollectionViewCell *)self contentView];
  [v6 bounds];
  double Width = CGRectGetWidth(v15);
  v8 = [(HULockupCollectionViewCell *)self topSeparatorView];
  objc_msgSend(v8, "setFrame:", 0.0, 0.0, Width, v5);

  v9 = [(HULockupCollectionViewCell *)self contentView];
  [v9 bounds];
  CGFloat v10 = CGRectGetMaxY(v16) - v5;
  v11 = [(HULockupCollectionViewCell *)self contentView];
  [v11 bounds];
  double v12 = CGRectGetWidth(v17);
  v13 = [(HULockupCollectionViewCell *)self bottomSeparatorView];
  objc_msgSend(v13, "setFrame:", 0.0, v10, v12, v5);
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)HULockupCollectionViewCell;
  [(HULockupCollectionViewCell *)&v3 prepareForReuse];
  [(HULockupCollectionViewCell *)self setTopSeparatorVisible:0];
  [(HULockupCollectionViewCell *)self setBottomSeparatorVisible:0];
}

- (HFItem)item
{
  v2 = [(HULockupCollectionViewCell *)self lockupView];
  objc_super v3 = [v2 item];

  return (HFItem *)v3;
}

- (void)setItem:(id)a3
{
  id v4 = a3;
  id v5 = [(HULockupCollectionViewCell *)self lockupView];
  [v5 setItem:v4];
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(HULockupCollectionViewCell *)self lockupView];
  [v4 updateUIWithAnimation:v3];
}

- (BOOL)topSeparatorVisible
{
  v2 = [(HULockupCollectionViewCell *)self topSeparatorView];
  char v3 = [v2 isHidden] ^ 1;

  return v3;
}

- (void)setTopSeparatorVisible:(BOOL)a3
{
  BOOL v3 = !a3;
  id v4 = [(HULockupCollectionViewCell *)self topSeparatorView];
  [v4 setHidden:v3];
}

- (BOOL)bottomSeparatorVisible
{
  v2 = [(HULockupCollectionViewCell *)self bottomSeparatorView];
  char v3 = [v2 isHidden] ^ 1;

  return v3;
}

- (void)setBottomSeparatorVisible:(BOOL)a3
{
  BOOL v3 = !a3;
  id v4 = [(HULockupCollectionViewCell *)self bottomSeparatorView];
  [v4 setHidden:v3];
}

- (void)didUpdateRequiredHeightForLockupView:(id)a3
{
  id v4 = [(HULockupCollectionViewCell *)self resizingDelegate];
  [v4 didUpdateRequiredHeightForCell:self];
}

- (Class)lockupViewClass
{
  return (Class)objc_opt_class();
}

- (HULockupView)lockupView
{
  return self->_lockupView;
}

- (HUResizableCellDelegate)resizingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_resizingDelegate);

  return (HUResizableCellDelegate *)WeakRetained;
}

- (void)setResizingDelegate:(id)a3
{
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
  objc_destroyWeak((id *)&self->_resizingDelegate);

  objc_storeStrong((id *)&self->_lockupView, 0);
}

@end