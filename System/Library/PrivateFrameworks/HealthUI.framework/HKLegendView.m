@interface HKLegendView
+ (UIEdgeInsets)modifiedInsetsForOpaqueLegend:(BOOL)a3 originalInsets:(UIEdgeInsets)a4;
+ (double)horizontalOffsetWithOpaque:(BOOL)a3;
- (BOOL)opaqueBackground;
- (HKLegendView)initWithEdgeInsets:(UIEdgeInsets)a3 opaqueBackground:(BOOL)a4;
- (NSArray)leftEntries;
- (NSArray)rightEntries;
- (NSMutableArray)extensionViews;
- (UIColor)lollipopColor;
- (UIColor)topBorderColor;
- (UIEdgeInsets)edgeInsets;
- (void)_rebuildExtensionsWithStickLocations:(id)a3;
- (void)_rebuildStackStructure;
- (void)_updateLegendLeftEntries:(id)a3 rightEntries:(id)a4;
- (void)hideLollipops;
- (void)setEdgeInsets:(UIEdgeInsets)a3;
- (void)setExtensionViews:(id)a3;
- (void)setLeftEntries:(id)a3 rightEntries:(id)a4;
- (void)setLollipopColor:(id)a3;
- (void)setOpaqueBackground:(BOOL)a3;
- (void)setTopBorderColor:(id)a3;
@end

@implementation HKLegendView

- (HKLegendView)initWithEdgeInsets:(UIEdgeInsets)a3 opaqueBackground:(BOOL)a4
{
  BOOL v4 = a4;
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  v10 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v10 bounds];
  v54.receiver = self;
  v54.super_class = (Class)HKLegendView;
  v11 = -[HKBorderLineView initWithFrame:](&v54, sel_initWithFrame_);

  if (v11)
  {
    id v12 = objc_alloc(MEMORY[0x1E4FB1C60]);
    uint64_t v13 = [v12 initWithArrangedSubviews:MEMORY[0x1E4F1CBF0]];
    mainStack = v11->_mainStack;
    v11->_mainStack = (UIStackView *)v13;

    [(UIStackView *)v11->_mainStack setTranslatesAutoresizingMaskIntoConstraints:0];
    [(HKLegendView *)v11 addSubview:v11->_mainStack];
    [(UIStackView *)v11->_mainStack setAlignment:3];
    [(UIStackView *)v11->_mainStack setDistribution:0];
    [(UIStackView *)v11->_mainStack setSpacing:10.0];
    [(UIStackView *)v11->_mainStack setAxis:0];
    v15 = [(UIStackView *)v11->_mainStack layer];
    [v15 setZPosition:2.0];

    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    leftEntryViews = v11->_leftEntryViews;
    v11->_leftEntryViews = v16;

    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    rightEntryViews = v11->_rightEntryViews;
    v11->_rightEntryViews = v18;

    [(HKLegendView *)v11 _rebuildStackStructure];
    v20 = [(UIStackView *)v11->_mainStack leadingAnchor];
    v21 = [(HKLegendView *)v11 leadingAnchor];
    uint64_t v22 = [v20 constraintEqualToAnchor:v21 constant:0.0];
    leadingConstraint = v11->_leadingConstraint;
    v11->_leadingConstraint = (NSLayoutConstraint *)v22;

    [(NSLayoutConstraint *)v11->_leadingConstraint setActive:1];
    v24 = [(UIStackView *)v11->_mainStack trailingAnchor];
    v25 = [(HKLegendView *)v11 trailingAnchor];
    uint64_t v26 = [v24 constraintEqualToAnchor:v25 constant:0.0];
    trailingConstraint = v11->_trailingConstraint;
    v11->_trailingConstraint = (NSLayoutConstraint *)v26;

    [(NSLayoutConstraint *)v11->_trailingConstraint setActive:1];
    v28 = [(UIStackView *)v11->_mainStack topAnchor];
    v29 = [(HKLegendView *)v11 topAnchor];
    uint64_t v30 = [v28 constraintEqualToAnchor:v29 constant:0.0];
    topConstraint = v11->_topConstraint;
    v11->_topConstraint = (NSLayoutConstraint *)v30;

    [(NSLayoutConstraint *)v11->_topConstraint setActive:1];
    v32 = [(UIStackView *)v11->_mainStack bottomAnchor];
    v33 = [(HKLegendView *)v11 bottomAnchor];
    uint64_t v34 = [v32 constraintEqualToAnchor:v33 constant:0.0];
    bottomConstraint = v11->_bottomConstraint;
    v11->_bottomConstraint = (NSLayoutConstraint *)v34;

    [(NSLayoutConstraint *)v11->_bottomConstraint setActive:1];
    -[HKLegendView setEdgeInsets:](v11, "setEdgeInsets:", top, left, bottom, right);
    [(HKLegendView *)v11 setUserInteractionEnabled:0];
    v36 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    extensionViews = v11->_extensionViews;
    v11->_extensionViews = v36;

    lollipopColor = v11->_lollipopColor;
    v11->_lollipopColor = 0;

    v11->_opaqueBackground = v4;
    if (v4)
    {
      [(HKLegendView *)v11 setOpaque:1];
      v39 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartBackgroundColor");
      [(HKLegendView *)v11 setBackgroundColor:v39];
    }
    else
    {
      [(HKLegendView *)v11 setOpaque:0];
    }
    v40 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    topDividerView = v11->_topDividerView;
    v11->_topDividerView = v40;

    [(UIView *)v11->_topDividerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(HKLegendView *)v11 addSubview:v11->_topDividerView];
    v42 = [(UIView *)v11->_topDividerView topAnchor];
    v43 = [(HKLegendView *)v11 topAnchor];
    v44 = [v42 constraintEqualToAnchor:v43];
    [v44 setActive:1];

    v45 = [(UIView *)v11->_topDividerView heightAnchor];
    v46 = [v45 constraintEqualToConstant:HKUIOnePixel()];
    [v46 setActive:1];

    v47 = [(UIView *)v11->_topDividerView leftAnchor];
    v48 = [(HKLegendView *)v11 leftAnchor];
    v49 = [v47 constraintEqualToAnchor:v48];
    [v49 setActive:1];

    v50 = [(UIView *)v11->_topDividerView rightAnchor];
    v51 = [(HKLegendView *)v11 rightAnchor];
    v52 = [v50 constraintEqualToAnchor:v51];
    [v52 setActive:1];

    [(UIView *)v11->_topDividerView setHidden:1];
  }
  return v11;
}

- (void)setLeftEntries:(id)a3 rightEntries:(id)a4
{
  id v10 = a3;
  id v7 = a4;
  uint64_t v8 = [v10 count];
  if (v8 == [(NSArray *)self->_leftEntries count]
    && (uint64_t v9 = [v7 count], v9 == -[NSArray count](self->_rightEntries, "count")))
  {
    [(HKLegendView *)self _updateLegendLeftEntries:v10 rightEntries:v7];
  }
  else
  {
    objc_storeStrong((id *)&self->_leftEntries, a3);
    objc_storeStrong((id *)&self->_rightEntries, a4);
    [(HKLegendView *)self _rebuildStackStructure];
  }
}

- (void)_rebuildStackStructure
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v3 = [(UIStackView *)self->_mainStack arrangedSubviews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v34 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        [(UIStackView *)self->_mainStack removeArrangedSubview:v8];
        [v8 removeFromSuperview];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_leftEntryViews removeAllObjects];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v9 = self->_leftEntries;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = [[_HKLegendEntryView alloc] initWithLegendEntry:*(void *)(*((void *)&v29 + 1) + 8 * j)];
        [(NSMutableArray *)self->_leftEntryViews addObject:v14];
        [(UIStackView *)self->_mainStack addArrangedSubview:v14];
      }
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v11);
  }

  v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", 0.0, 0.0, 1.0, 1.0);
  LODWORD(v16) = 1132068864;
  [v15 setContentHuggingPriority:0 forAxis:v16];
  [(UIStackView *)self->_mainStack addArrangedSubview:v15];
  [(NSMutableArray *)self->_rightEntryViews removeAllObjects];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v17 = self->_rightEntries;
  uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v25 objects:v37 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v26;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v25 + 1) + 8 * k);
        v23 = [_HKLegendEntryView alloc];
        v24 = -[_HKLegendEntryView initWithLegendEntry:](v23, "initWithLegendEntry:", v22, (void)v25);
        [(NSMutableArray *)self->_rightEntryViews addObject:v24];
        [(UIStackView *)self->_mainStack addArrangedSubview:v24];
      }
      uint64_t v19 = [(NSArray *)v17 countByEnumeratingWithState:&v25 objects:v37 count:16];
    }
    while (v19);
  }
}

- (void)_updateLegendLeftEntries:(id)a3 rightEntries:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  if ([v13 count])
  {
    unint64_t v7 = 0;
    do
    {
      uint64_t v8 = [v13 objectAtIndexedSubscript:v7];
      uint64_t v9 = [(NSMutableArray *)self->_leftEntryViews objectAtIndexedSubscript:v7];
      [v9 setLegendEntry:v8];

      ++v7;
    }
    while (v7 < [v13 count]);
  }
  if ([v6 count])
  {
    unint64_t v10 = 0;
    do
    {
      uint64_t v11 = [v6 objectAtIndexedSubscript:v10];
      uint64_t v12 = [(NSMutableArray *)self->_rightEntryViews objectAtIndexedSubscript:v10];
      [v12 setLegendEntry:v11];

      ++v10;
    }
    while (v10 < [v6 count]);
  }
}

- (void)setTopBorderColor:(id)a3
{
  id v5 = a3;
  if ((-[UIColor isEqual:](self->_topBorderColor, "isEqual:") & 1) == 0)
  {
    [(UIView *)self->_topDividerView setBackgroundColor:v5];
    objc_storeStrong((id *)&self->_topBorderColor, a3);
    [(UIView *)self->_topDividerView setHidden:v5 == 0];
  }
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double top = a3.top;
  if (a3.left != self->_edgeInsets.left
    || a3.top != self->_edgeInsets.top
    || a3.right != self->_edgeInsets.right
    || a3.bottom != self->_edgeInsets.bottom)
  {
    self->_edgeInsets = a3;
    [(NSLayoutConstraint *)self->_leadingConstraint setConstant:a3.left];
    [(NSLayoutConstraint *)self->_trailingConstraint setConstant:-right];
    [(NSLayoutConstraint *)self->_topConstraint setConstant:top];
    bottomConstraint = self->_bottomConstraint;
    [(NSLayoutConstraint *)bottomConstraint setConstant:-bottom];
  }
}

+ (UIEdgeInsets)modifiedInsetsForOpaqueLegend:(BOOL)a3 originalInsets:(UIEdgeInsets)a4
{
  double v4 = 0.0;
  if (!a3) {
    double v4 = 4.0;
  }
  double v5 = v4 + a4.left;
  double v6 = a4.right + 4.0;
  double v7 = 8.0;
  if (!a3) {
    double v7 = 4.0;
  }
  double v8 = v7 + a4.top;
  double v9 = v4 + a4.bottom;
  +[HKLegendView horizontalOffsetWithOpaque:](HKLegendView, "horizontalOffsetWithOpaque:");
  double v11 = v5 - v10;
  double v12 = v8;
  double v13 = v9;
  double v14 = v6;
  result.double right = v14;
  result.double bottom = v13;
  result.double left = v11;
  result.double top = v12;
  return result;
}

+ (double)horizontalOffsetWithOpaque:(BOOL)a3
{
  return 0.0;
}

- (void)hideLollipops
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(HKLegendView *)self extensionViews];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) setHidden:1];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_rebuildExtensionsWithStickLocations:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 count];
  uint64_t v6 = [(HKLegendView *)self extensionViews];
  uint64_t v7 = [v6 count];

  if (v5 != v7)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v8 = [(HKLegendView *)self extensionViews];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v32 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v31 + 1) + 8 * i) removeFromSuperview];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v10);
    }

    double v13 = [(HKLegendView *)self extensionViews];
    [v13 removeAllObjects];

    if ([v4 count])
    {
      unint64_t v14 = 0;
      double v15 = *MEMORY[0x1E4F1DB28];
      double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v18 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      do
      {
        uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v15, v16, v17, v18);
        uint64_t v20 = [(HKLegendView *)self lollipopColor];
        if (v20)
        {
          [v19 setBackgroundColor:v20];
        }
        else
        {
          v21 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartLollipopStickColor");
          [v19 setBackgroundColor:v21];
        }
        uint64_t v22 = [v19 layer];
        [v22 setZPosition:1.0];

        [(HKLegendView *)self addSubview:v19];
        v23 = [(HKLegendView *)self extensionViews];
        [v23 addObject:v19];

        ++v14;
      }
      while (v14 < [v4 count]);
    }
  }
  if ([v4 count])
  {
    unint64_t v24 = 0;
    do
    {
      long long v25 = [v4 objectAtIndexedSubscript:v24];
      [v25 doubleValue];
      double v27 = HKUIFloorToScreenScale(v26);

      [(HKLegendView *)self frame];
      double Height = CGRectGetHeight(v37);
      long long v29 = [(HKLegendView *)self extensionViews];
      long long v30 = [v29 objectAtIndexedSubscript:v24];

      objc_msgSend(v30, "setFrame:", v27 + -1.0, 0.0, 2.0, Height);
      [v30 setHidden:0];

      ++v24;
    }
    while (v24 < [v4 count]);
  }
}

- (NSArray)leftEntries
{
  return self->_leftEntries;
}

- (NSArray)rightEntries
{
  return self->_rightEntries;
}

- (UIColor)topBorderColor
{
  return self->_topBorderColor;
}

- (UIEdgeInsets)edgeInsets
{
  double top = self->_edgeInsets.top;
  double left = self->_edgeInsets.left;
  double bottom = self->_edgeInsets.bottom;
  double right = self->_edgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)opaqueBackground
{
  return self->_opaqueBackground;
}

- (void)setOpaqueBackground:(BOOL)a3
{
  self->_opaqueBackground = a3;
}

- (UIColor)lollipopColor
{
  return self->_lollipopColor;
}

- (void)setLollipopColor:(id)a3
{
}

- (NSMutableArray)extensionViews
{
  return self->_extensionViews;
}

- (void)setExtensionViews:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionViews, 0);
  objc_storeStrong((id *)&self->_lollipopColor, 0);
  objc_storeStrong((id *)&self->_topBorderColor, 0);
  objc_storeStrong((id *)&self->_rightEntries, 0);
  objc_storeStrong((id *)&self->_leftEntries, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_trailingConstraint, 0);
  objc_storeStrong((id *)&self->_leadingConstraint, 0);
  objc_storeStrong((id *)&self->_topDividerView, 0);
  objc_storeStrong((id *)&self->_rightEntryViews, 0);
  objc_storeStrong((id *)&self->_leftEntryViews, 0);
  objc_storeStrong((id *)&self->_mainStack, 0);
}

@end