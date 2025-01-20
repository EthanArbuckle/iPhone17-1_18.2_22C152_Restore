@interface HUMediaServiceAccountCell
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (HFItem)item;
- (HUMediaServiceAccountCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (HUMediaServiceAccountView)mediaServiceAccountView;
- (void)layoutSubviews;
- (void)setItem:(id)a3;
- (void)setMediaServiceAccountView:(id)a3;
- (void)updateUIWithAnimation:(BOOL)a3;
@end

@implementation HUMediaServiceAccountCell

- (HUMediaServiceAccountCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)HUMediaServiceAccountCell;
  v4 = [(HUMediaServiceAccountCell *)&v12 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(HUMediaServiceAccountCell *)v4 setSelectionStyle:0];
    [(HUMediaServiceAccountCell *)v5 setUserInteractionEnabled:0];
    v6 = [HUMediaServiceAccountView alloc];
    v7 = [(HUMediaServiceAccountCell *)v5 contentView];
    [v7 bounds];
    uint64_t v8 = -[HUMediaServiceAccountView initWithFrame:](v6, "initWithFrame:");
    mediaServiceAccountView = v5->_mediaServiceAccountView;
    v5->_mediaServiceAccountView = (HUMediaServiceAccountView *)v8;

    v10 = [(HUMediaServiceAccountCell *)v5 contentView];
    [v10 addSubview:v5->_mediaServiceAccountView];
  }
  return v5;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)HUMediaServiceAccountCell;
  [(HUMediaServiceAccountCell *)&v13 layoutSubviews];
  v3 = [(HUMediaServiceAccountCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  objc_super v12 = [(HUMediaServiceAccountCell *)self mediaServiceAccountView];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  double v9 = [(HUMediaServiceAccountCell *)self mediaServiceAccountView];
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

- (HFItem)item
{
  v2 = [(HUMediaServiceAccountCell *)self mediaServiceAccountView];
  v3 = [v2 item];

  return (HFItem *)v3;
}

- (void)setItem:(id)a3
{
  id v4 = a3;
  id v5 = [(HUMediaServiceAccountCell *)self mediaServiceAccountView];
  [v5 setItem:v4];
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(HUMediaServiceAccountCell *)self mediaServiceAccountView];
  [v4 updateUIWithAnimation:v3];
}

- (HUMediaServiceAccountView)mediaServiceAccountView
{
  return self->_mediaServiceAccountView;
}

- (void)setMediaServiceAccountView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end