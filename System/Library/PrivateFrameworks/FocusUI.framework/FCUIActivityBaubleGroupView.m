@interface FCUIActivityBaubleGroupView
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (CGSize)sizeThatFits:(CGSize)a3;
- (FCUIActivityBaubleGroupView)initWithBaubleDescriptions:(id)a3 baubleGroupType:(int64_t)a4;
- (NSString)preferredContentSizeCategory;
- (int64_t)baubleGroupType;
- (void)layoutSubviews;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setPreferredContentSizeCategory:(id)a3;
@end

@implementation FCUIActivityBaubleGroupView

- (FCUIActivityBaubleGroupView)initWithBaubleDescriptions:(id)a3 baubleGroupType:(int64_t)a4
{
  id v6 = a3;
  v25.receiver = self;
  v25.super_class = (Class)FCUIActivityBaubleGroupView;
  v7 = [(FCUIActivityBaubleGroupView *)&v25 init];
  v8 = v7;
  if (v7)
  {
    v7->_baubleGroupType = a4;
    v7->_adjustsFontForContentSizeCategory = 1;
    v9 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v6, "count"));
    if ([v6 count])
    {
      unint64_t v10 = 0;
      long long v21 = xmmword_21FF06480;
      do
      {
        v11 = objc_msgSend(v6, "objectAtIndexedSubscript:", v10, v21);
        v12 = [FCUIActivityBaubleView alloc];
        if (a4 == 1)
        {
          v13 = [v11 completeDescriptionWithReferencePointSize:15.0 maximumPointSize:24.0 referenceDimension:35.0];
          long long v14 = xmmword_21FF06490;
        }
        else
        {
          if (v10 == 1) {
            double v15 = 10.0;
          }
          else {
            double v15 = 13.0;
          }
          if (v10 == 1) {
            double v16 = 19.0;
          }
          else {
            double v16 = 22.0;
          }
          if (v10 == 1) {
            double v17 = 19.0;
          }
          else {
            double v17 = 25.0;
          }
          if (v10 == 2)
          {
            double v16 = 16.0;
            double v15 = 7.0;
            double v17 = 15.0;
          }
          v13 = [v11 completeDescriptionWithReferencePointSize:v15 maximumPointSize:v16 referenceDimension:v17];
          long long v14 = v21;
        }
        int v22 = 1036831949;
        uint64_t v23 = 0;
        long long v24 = v14;
        v18 = [(FCUIActivityBaubleView *)v12 initWithBaubleDescription:v13 shadowAttributes:&v22];

        [(FCUIActivityBaubleGroupView *)v8 addSubview:v18];
        [(NSArray *)v9 addObject:v18];

        ++v10;
      }
      while (v10 < [v6 count]);
    }
    baubleViews = v8->_baubleViews;
    v8->_baubleViews = v9;
  }
  return v8;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  BSRectWithSize();
  CGFloat v30 = v5;
  CGFloat v31 = v4;
  CGFloat v28 = v7;
  CGFloat v29 = v6;
  int v8 = [(FCUIActivityBaubleGroupView *)self _shouldReverseLayoutDirection];
  v9 = (CGFloat *)MEMORY[0x263F001A0];
  CGFloat width = *(double *)(MEMORY[0x263F001A0] + 16);
  double height = *(double *)(MEMORY[0x263F001A0] + 24);
  if ([(NSArray *)self->_baubleViews count])
  {
    unint64_t v12 = 0;
    CGFloat v13 = *v9;
    CGFloat v14 = v9[1];
    do
    {
      double v15 = [(NSArray *)self->_baubleViews objectAtIndexedSubscript:v12];
      double x = FrameForBaubleAtIndex(v15, v12, self->_baubleGroupType, v8, v31, v30, v29, v28);
      CGFloat y = v17;
      CGFloat v20 = v19;
      CGFloat v22 = v21;
      v33.origin.double x = v13;
      v33.origin.CGFloat y = v14;
      v33.size.CGFloat width = width;
      v33.size.double height = height;
      if (CGRectIsNull(v33))
      {
        CGFloat width = v20;
        double height = v22;
      }
      else
      {
        v34.origin.double x = v13;
        v34.origin.CGFloat y = v14;
        v34.size.CGFloat width = width;
        v34.size.double height = height;
        v36.origin.double x = x;
        v36.origin.CGFloat y = y;
        v36.size.CGFloat width = v20;
        v36.size.double height = v22;
        CGRect v35 = CGRectUnion(v34, v36);
        double x = v35.origin.x;
        CGFloat y = v35.origin.y;
        CGFloat width = v35.size.width;
        double height = v35.size.height;
      }

      ++v12;
      CGFloat v14 = y;
      CGFloat v13 = x;
    }
    while (v12 < [(NSArray *)self->_baubleViews count]);
  }
  double v23 = 0.0;
  if (!self->_baubleGroupType)
  {
    long long v24 = [(NSArray *)self->_baubleViews objectAtIndexedSubscript:0];
    [v24 scaledValueForValue:3.0];
    double v23 = v25;
  }
  double v26 = height + v23;
  double v27 = width;
  result.double height = v26;
  result.CGFloat width = v27;
  return result;
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)FCUIActivityBaubleGroupView;
  [(FCUIActivityBaubleGroupView *)&v14 layoutSubviews];
  [(FCUIActivityBaubleGroupView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  int v11 = [(FCUIActivityBaubleGroupView *)self _shouldReverseLayoutDirection];
  if ([(NSArray *)self->_baubleViews count])
  {
    unint64_t v12 = 0;
    do
    {
      CGFloat v13 = [(NSArray *)self->_baubleViews objectAtIndexedSubscript:v12];
      FrameForBaubleAtIndex(v13, v12, self->_baubleGroupType, v11, v4, v6, v8, v10);
      UIRectIntegralWithScale();
      objc_msgSend(v13, "setFrame:");

      ++v12;
    }
    while (v12 < [(NSArray *)self->_baubleViews count]);
  }
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategorCGFloat y = a3;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    CGFloat v4 = self->_baubleViews;
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "setAdjustsFontForContentSizeCategory:", self->_adjustsFontForContentSizeCategory, (void)v9);
        }
        while (v6 != v8);
        uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  double v3 = [(FCUIActivityBaubleGroupView *)self traitCollection];
  CGFloat v4 = [v3 preferredContentSizeCategory];

  if (UIContentSizeCategoryCompareToCategory(v4, self->_preferredContentSizeCategory) == NSOrderedSame) {
    goto LABEL_12;
  }
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, v4);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = self->_baubleViews;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (!v6)
  {

LABEL_12:
    BOOL v11 = 0;
    goto LABEL_13;
  }
  uint64_t v7 = v6;
  int v8 = 0;
  uint64_t v9 = *(void *)v14;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(v5);
      }
      v8 |= objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "adjustForContentSizeCategoryChange", (void)v13);
    }
    uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  }
  while (v7);

  if ((v8 & 1) == 0) {
    goto LABEL_12;
  }
  [(FCUIActivityBaubleGroupView *)self setNeedsLayout];
  BOOL v11 = 1;
LABEL_13:

  return v11;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (NSString)preferredContentSizeCategory
{
  return self->_preferredContentSizeCategory;
}

- (void)setPreferredContentSizeCategory:(id)a3
{
}

- (int64_t)baubleGroupType
{
  return self->_baubleGroupType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_baubleViews, 0);
}

@end