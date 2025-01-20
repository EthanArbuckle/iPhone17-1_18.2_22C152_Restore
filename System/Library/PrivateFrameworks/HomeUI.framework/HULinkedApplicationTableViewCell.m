@interface HULinkedApplicationTableViewCell
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (HFItem)item;
- (HULinkedApplicationTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (HULinkedApplicationView)linkedApplicationView;
- (void)layoutSubviews;
- (void)setItem:(id)a3;
- (void)setLinkedApplicationView:(id)a3;
- (void)updateUIWithAnimation:(BOOL)a3;
@end

@implementation HULinkedApplicationTableViewCell

- (HULinkedApplicationTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)HULinkedApplicationTableViewCell;
  v4 = [(HULinkedApplicationTableViewCell *)&v11 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = [HULinkedApplicationView alloc];
    v6 = [(HULinkedApplicationTableViewCell *)v4 contentView];
    [v6 bounds];
    uint64_t v7 = -[HULinkedApplicationView initWithFrame:](v5, "initWithFrame:");
    linkedApplicationView = v4->_linkedApplicationView;
    v4->_linkedApplicationView = (HULinkedApplicationView *)v7;

    v9 = [(HULinkedApplicationTableViewCell *)v4 contentView];
    [v9 addSubview:v4->_linkedApplicationView];
  }
  return v4;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)HULinkedApplicationTableViewCell;
  [(HULinkedApplicationTableViewCell *)&v13 layoutSubviews];
  v3 = [(HULinkedApplicationTableViewCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(HULinkedApplicationTableViewCell *)self linkedApplicationView];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  double v9 = [(HULinkedApplicationTableViewCell *)self linkedApplicationView];
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
  v2 = [(HULinkedApplicationTableViewCell *)self linkedApplicationView];
  v3 = [v2 item];

  return (HFItem *)v3;
}

- (void)setItem:(id)a3
{
  id v4 = a3;
  id v5 = [(HULinkedApplicationTableViewCell *)self linkedApplicationView];
  [v5 setItem:v4];
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(HULinkedApplicationTableViewCell *)self linkedApplicationView];
  [v4 updateUIWithAnimation:v3];
}

- (HULinkedApplicationView)linkedApplicationView
{
  return self->_linkedApplicationView;
}

- (void)setLinkedApplicationView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end