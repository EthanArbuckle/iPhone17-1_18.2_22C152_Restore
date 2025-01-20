@interface HUIconListView
- (HUIconListView)init;
- (NSArray)iconDescriptors;
- (NSMutableArray)iconViews;
- (void)_addIconNamed:(id)a3;
- (void)_addIconWithDescriptor:(id)a3;
- (void)_layoutLeftToRight;
- (void)_layoutRightToLeft;
- (void)_prepareIconArray;
- (void)_setUpIcons;
- (void)layoutSubviews;
- (void)setIconDescriptors:(id)a3;
- (void)setIconViews:(id)a3;
@end

@implementation HUIconListView

- (HUIconListView)init
{
  v6.receiver = self;
  v6.super_class = (Class)HUIconListView;
  v2 = [(HUIconListView *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C978] array];
    iconDescriptors = v2->_iconDescriptors;
    v2->_iconDescriptors = (NSArray *)v3;
  }
  return v2;
}

- (void)setIconDescriptors:(id)a3
{
  id v5 = a3;
  if ((-[NSArray isEqual:](self->_iconDescriptors, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_iconDescriptors, a3);
    [(HUIconListView *)self _setUpIcons];
  }
}

- (void)_setUpIcons
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(HUIconListView *)self _prepareIconArray];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v3 = [(HUIconListView *)self iconDescriptors];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(HUIconListView *)self _addIconWithDescriptor:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(HUIconListView *)self setNeedsLayout];
  [(HUIconListView *)self layoutIfNeeded];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)HUIconListView;
  [(HUIconListView *)&v3 layoutSubviews];
  if (objc_msgSend(MEMORY[0x1E4F42FF0], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[HUIconListView semanticContentAttribute](self, "semanticContentAttribute")) == 1)-[HUIconListView _layoutRightToLeft](self, "_layoutRightToLeft"); {
  else
  }
    [(HUIconListView *)self _layoutLeftToRight];
}

- (void)_layoutLeftToRight
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [(HUIconListView *)self frame];
  double v4 = v3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [(HUIconListView *)self iconViews];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    double v9 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        [v11 intrinsicContentSize];
        double v13 = v12;
        double v15 = round(v14);
        [(HUIconListView *)self bounds];
        v22.x = v9 + v15;
        v22.y = 0.0;
        if (CGRectContainsPoint(v23, v22)) {
          objc_msgSend(v11, "setFrame:", v9, floor((v4 - v13) * 0.5), v15, v13);
        }
        else {
          [v11 removeFromSuperview];
        }
        double v9 = v9 + v15 + 12.0;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
}

- (void)_layoutRightToLeft
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [(HUIconListView *)self frame];
  double v4 = v3;
  double v6 = v5;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v7 = [(HUIconListView *)self iconViews];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        [v12 intrinsicContentSize];
        double v14 = v13;
        double v16 = round(v15);
        [(HUIconListView *)self bounds];
        v23.y = 0.0;
        v23.x = v4 - v16;
        if (CGRectContainsPoint(v24, v23)) {
          objc_msgSend(v12, "setFrame:", v4 - v16, floor((v6 - v14) * 0.5), v16, v14);
        }
        else {
          [v12 removeFromSuperview];
        }
        double v4 = v4 - (v16 + 12.0);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
}

- (void)_addIconNamed:(id)a3
{
  double v4 = (objc_class *)MEMORY[0x1E4F691D0];
  id v5 = a3;
  id v6 = (id)[[v4 alloc] initWithImageIdentifier:v5];

  [(HUIconListView *)self _addIconWithDescriptor:v6];
}

- (void)_addIconWithDescriptor:(id)a3
{
  id v4 = a3;
  id v6 = [[HUTriggerIconView alloc] initWithIconDescriptor:v4];

  [(HUTriggerIconView *)v6 setContentMode:1];
  id v5 = [(HUIconListView *)self iconViews];
  [v5 addObject:v6];

  [(HUIconListView *)self addSubview:v6];
}

- (void)_prepareIconArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  double v3 = [(HUIconListView *)self iconViews];

  if (v3)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = [(HUIconListView *)self iconViews];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * i) removeFromSuperview];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }

    uint64_t v9 = [(HUIconListView *)self iconViews];
    [v9 removeAllObjects];
  }
  else
  {
    id v10 = [MEMORY[0x1E4F1CA48] array];
    -[HUIconListView setIconViews:](self, "setIconViews:");
  }
}

- (NSArray)iconDescriptors
{
  return self->_iconDescriptors;
}

- (NSMutableArray)iconViews
{
  return self->_iconViews;
}

- (void)setIconViews:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconViews, 0);

  objc_storeStrong((id *)&self->_iconDescriptors, 0);
}

@end