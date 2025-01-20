@interface RPCCUIActivityBaubleGroupView
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)preferredContentSizeCategory;
- (RPCCUIActivityBaubleGroupView)initWithBaubleDescriptions:(id)a3 baubleGroupType:(int64_t)a4;
- (int64_t)baubleGroupType;
- (void)layoutSubviews;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setPreferredContentSizeCategory:(id)a3;
@end

@implementation RPCCUIActivityBaubleGroupView

- (RPCCUIActivityBaubleGroupView)initWithBaubleDescriptions:(id)a3 baubleGroupType:(int64_t)a4
{
  id v6 = a3;
  v25.receiver = self;
  v25.super_class = (Class)RPCCUIActivityBaubleGroupView;
  v7 = [(RPCCUIActivityBaubleGroupView *)&v25 init];
  v8 = v7;
  if (v7)
  {
    v7->_baubleGroupType = a4;
    v7->_adjustsFontForContentSizeCategory = 1;
    v9 = (NSArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v6, "count"));
    if ([v6 count])
    {
      unint64_t v10 = 0;
      long long v21 = xmmword_55230;
      do
      {
        v11 = objc_msgSend(v6, "objectAtIndexedSubscript:", v10, v21);
        v12 = [RPCCUIActivityBaubleView alloc];
        if (a4 == 1)
        {
          v13 = [v11 completeDescriptionWithReferencePointSize:15.0 maximumPointSize:24.0 referenceDimension:35.0];
          long long v14 = xmmword_55240;
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
        v18 = [(RPCCUIActivityBaubleView *)v12 initWithBaubleDescription:v13 shadowAttributes:&v22];

        [(RPCCUIActivityBaubleGroupView *)v8 addSubview:v18];
        [(NSArray *)v9 addObject:v18];

        ++v10;
      }
      while (v10 < (unint64_t)[v6 count]);
    }
    baubleViews = v8->_baubleViews;
    v8->_baubleViews = v9;
  }
  return v8;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  BSRectWithSize();
  CGFloat v29 = v5;
  CGFloat v30 = v4;
  CGFloat v27 = v7;
  CGFloat v28 = v6;
  int v8 = [(RPCCUIActivityBaubleGroupView *)self _shouldReverseLayoutDirection];
  CGFloat width = CGRectNull.size.width;
  double height = CGRectNull.size.height;
  if ([(NSArray *)self->_baubleViews count])
  {
    unint64_t v11 = 0;
    CGFloat x = CGRectNull.origin.x;
    CGFloat y = CGRectNull.origin.y;
    do
    {
      long long v14 = [(NSArray *)self->_baubleViews objectAtIndexedSubscript:v11];
      double v15 = sub_12CD0(v14, v11, self->_baubleGroupType, v8, v30, v29, v28, v27);
      CGFloat v17 = v16;
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      v32.origin.CGFloat x = x;
      v32.origin.CGFloat y = y;
      v32.size.CGFloat width = width;
      v32.size.double height = height;
      if (CGRectIsNull(v32))
      {
        CGFloat width = v19;
        double height = v21;
      }
      else
      {
        v33.origin.CGFloat x = x;
        v33.origin.CGFloat y = y;
        v33.size.CGFloat width = width;
        v33.size.double height = height;
        v35.origin.CGFloat x = v15;
        v35.origin.CGFloat y = v17;
        v35.size.CGFloat width = v19;
        v35.size.double height = v21;
        CGRect v34 = CGRectUnion(v33, v35);
        double v15 = v34.origin.x;
        CGFloat v17 = v34.origin.y;
        CGFloat width = v34.size.width;
        double height = v34.size.height;
      }

      ++v11;
      CGFloat y = v17;
      CGFloat x = v15;
    }
    while (v11 < [(NSArray *)self->_baubleViews count]);
  }
  double v22 = 0.0;
  if (!self->_baubleGroupType)
  {
    uint64_t v23 = [(NSArray *)self->_baubleViews objectAtIndexedSubscript:0];
    [v23 scaledValueForValue:3.0];
    double v22 = v24;
  }
  double v25 = height + v22;
  double v26 = width;
  result.double height = v25;
  result.CGFloat width = v26;
  return result;
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)RPCCUIActivityBaubleGroupView;
  [(RPCCUIActivityBaubleGroupView *)&v14 layoutSubviews];
  [(RPCCUIActivityBaubleGroupView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  int v11 = [(RPCCUIActivityBaubleGroupView *)self _shouldReverseLayoutDirection];
  if ([(NSArray *)self->_baubleViews count])
  {
    unint64_t v12 = 0;
    do
    {
      v13 = [(NSArray *)self->_baubleViews objectAtIndexedSubscript:v12];
      sub_12CD0(v13, v12, self->_baubleGroupType, v11, v4, v6, v8, v10);
      UIRectIntegralWithScale();
      objc_msgSend(v13, "setFrame:");

      ++v12;
    }
    while (v12 < [(NSArray *)self->_baubleViews count]);
  }
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategorCGFloat y = a3;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    CGFloat v4 = self->_baubleViews;
    id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        CGFloat v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)v8), "setAdjustsFontForContentSizeCategory:", self->_adjustsFontForContentSizeCategory, (void)v9);
          CGFloat v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  double v3 = [(RPCCUIActivityBaubleGroupView *)self traitCollection];
  CGFloat v4 = [v3 preferredContentSizeCategory];

  if (UIContentSizeCategoryCompareToCategory(v4, self->_preferredContentSizeCategory) == NSOrderedSame) {
    goto LABEL_12;
  }
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, v4);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = self->_baubleViews;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (!v6)
  {

LABEL_12:
    BOOL v11 = 0;
    goto LABEL_13;
  }
  id v7 = v6;
  int v8 = 0;
  uint64_t v9 = *(void *)v14;
  do
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(v5);
      }
      v8 |= objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "adjustForContentSizeCategoryChange", (void)v13);
    }
    id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  }
  while (v7);

  if ((v8 & 1) == 0) {
    goto LABEL_12;
  }
  [(RPCCUIActivityBaubleGroupView *)self setNeedsLayout];
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