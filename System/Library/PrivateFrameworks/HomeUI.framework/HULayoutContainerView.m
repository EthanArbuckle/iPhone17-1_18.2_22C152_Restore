@interface HULayoutContainerView
- (CGSize)intrinsicContentSize;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (HULayoutContainerView)initWithContentView:(id)a3 layoutBlock:(id)a4;
- (UIView)contentView;
- (id)layoutBlock;
- (void)layoutSubviews;
@end

@implementation HULayoutContainerView

- (HULayoutContainerView)initWithContentView:(id)a3 layoutBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HULayoutContainerView;
  v9 = [(HULayoutContainerView *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contentView, a3);
    if (v7)
    {
      [(HULayoutContainerView *)v10 bounds];
      objc_msgSend(v7, "setFrame:");
      [v7 setAutoresizingMask:18];
      [(HULayoutContainerView *)v10 addSubview:v7];
    }
    v11 = _Block_copy(v8);
    id layoutBlock = v10->_layoutBlock;
    v10->_id layoutBlock = v11;
  }
  return v10;
}

- (CGSize)intrinsicContentSize
{
  v3 = [(HULayoutContainerView *)self contentView];
  if (v3)
  {
    v4 = [(HULayoutContainerView *)self contentView];
    [v4 intrinsicContentSize];
    double v6 = v5;
    double v8 = v7;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)HULayoutContainerView;
    [(HULayoutContainerView *)&v13 intrinsicContentSize];
    double v6 = v9;
    double v8 = v10;
  }

  double v11 = v6;
  double v12 = v8;
  result.height = v12;
  result.width = v11;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  double v10 = [(HULayoutContainerView *)self contentView];

  if (v10)
  {
    objc_super v13 = [(HULayoutContainerView *)self contentView];
    *(float *)&double v14 = a4;
    *(float *)&double v15 = a5;
    objc_msgSend(v13, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v14, v15);
    double v17 = v16;
    double v19 = v18;

    double v20 = v17;
    double v21 = v19;
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)HULayoutContainerView;
    *(float *)&double v11 = a4;
    *(float *)&double v12 = a5;
    -[HULayoutContainerView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v22, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, width, height, v11, v12);
  }
  result.double height = v21;
  result.double width = v20;
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)HULayoutContainerView;
  [(HULayoutContainerView *)&v5 layoutSubviews];
  v3 = [(HULayoutContainerView *)self layoutBlock];
  v4 = [(HULayoutContainerView *)self contentView];
  ((void (**)(void, void *))v3)[2](v3, v4);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (id)layoutBlock
{
  return self->_layoutBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_layoutBlock, 0);

  objc_storeStrong((id *)&self->_contentView, 0);
}

@end