@interface HSKeylineLabel
- (CALayer)leadingKeylineLayer;
- (CALayer)trailingKeylineLayer;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (HSKeylineLabel)init;
- (NSAttributedString)attributedText;
- (NSString)text;
- (UILabel)label;
- (double)margin;
- (id)firstBaselineAnchor;
- (id)lastBaselineAnchor;
- (void)layoutSubviews;
- (void)setAttributedText:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLeadingKeylineLayer:(id)a3;
- (void)setMargin:(double)a3;
- (void)setText:(id)a3;
- (void)setTrailingKeylineLayer:(id)a3;
@end

@implementation HSKeylineLabel

- (HSKeylineLabel)init
{
  v32.receiver = self;
  v32.super_class = (Class)HSKeylineLabel;
  v2 = [(HSKeylineLabel *)&v32 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(HSKeylineLabel *)v2 setLeadingKeylineLayer:v3];

    v4 = objc_opt_new();
    [(HSKeylineLabel *)v2 setTrailingKeylineLayer:v4];

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v5 = [(HSKeylineLabel *)v2 leadingKeylineLayer];
    v33[0] = v5;
    v6 = [(HSKeylineLabel *)v2 trailingKeylineLayer];
    v33[1] = v6;
    v7 = +[NSArray arrayWithObjects:v33 count:2];

    id v8 = [v7 countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v29;
      do
      {
        v11 = 0;
        do
        {
          if (*(void *)v29 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v28 + 1) + 8 * (void)v11);
          id v13 = +[UIColor _externalSystemGrayColor];
          [v12 setBackgroundColor:[v13 CGColor]];

          v14 = [(HSKeylineLabel *)v2 layer];
          [v14 addSublayer:v12];

          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v9);
    }

    v15 = objc_opt_new();
    [(HSKeylineLabel *)v2 setLabel:v15];

    v16 = [(HSKeylineLabel *)v2 label];
    [v16 setTranslatesAutoresizingMaskIntoConstraints:0];

    v17 = [(HSKeylineLabel *)v2 label];
    [v17 setNumberOfLines:1];

    v18 = [(HSKeylineLabel *)v2 label];
    [(HSKeylineLabel *)v2 addSubview:v18];

    v19 = [(HSKeylineLabel *)v2 label];
    v20 = [v19 centerXAnchor];
    v21 = [(HSKeylineLabel *)v2 centerXAnchor];
    v22 = [v20 constraintEqualToAnchor:v21];
    [v22 setActive:1];

    v23 = [(HSKeylineLabel *)v2 label];
    v24 = [v23 centerYAnchor];
    v25 = [(HSKeylineLabel *)v2 centerYAnchor];
    v26 = [v24 constraintEqualToAnchor:v25];
    [v26 setActive:1];

    [(HSKeylineLabel *)v2 setMargin:8.0];
  }
  return v2;
}

- (void)layoutSubviews
{
  v29.receiver = self;
  v29.super_class = (Class)HSKeylineLabel;
  [(HSKeylineLabel *)&v29 layoutSubviews];
  v3 = [(HSKeylineLabel *)self window];
  v4 = [v3 screen];
  [v4 scale];
  double v28 = 1.0 / v5;

  v6 = [(HSKeylineLabel *)self label];
  [v6 frame];
  double v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  v30.origin.x = v8;
  v30.origin.y = v10;
  v30.size.width = v12;
  v30.size.height = v14;
  double MidY = CGRectGetMidY(v30);
  [(HSKeylineLabel *)self margin];
  double v16 = v8 - v15;
  [(HSKeylineLabel *)self margin];
  double v18 = v17;
  v31.origin.x = v8;
  v31.origin.y = v10;
  v31.size.width = v12;
  v31.size.height = v14;
  double v19 = v18 + CGRectGetMaxX(v31);
  v32.origin.x = v8;
  v32.origin.y = v10;
  v32.size.width = v12;
  v32.size.height = v14;
  double v20 = CGRectGetMidY(v32);
  [(HSKeylineLabel *)self bounds];
  double MaxX = CGRectGetMaxX(v33);
  v34.origin.x = v8;
  v34.origin.y = v10;
  v34.size.width = v12;
  v34.size.height = v14;
  double v22 = MaxX - CGRectGetMaxX(v34);
  [(HSKeylineLabel *)self margin];
  double v24 = v22 - v23;
  v25 = [(HSKeylineLabel *)self leadingKeylineLayer];
  [v25 setFrame:0.0, MidY, v16, v28];

  v26 = [(HSKeylineLabel *)self trailingKeylineLayer];
  [v26 setFrame:v19, v20, v24, v28];
}

- (CGSize)intrinsicContentSize
{
  v2 = [(HSKeylineLabel *)self label];
  [v2 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = [(HSKeylineLabel *)self label];
  [v5 sizeThatFits:width, height];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)setBackgroundColor:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HSKeylineLabel;
  [(HSKeylineLabel *)&v17 setBackgroundColor:v4];
  double v5 = [(HSKeylineLabel *)self label];
  [v5 setBackgroundColor:v4];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v6 = [(HSKeylineLabel *)self leadingKeylineLayer];
  v18[0] = v6;
  double v7 = [(HSKeylineLabel *)self trailingKeylineLayer];
  v18[1] = v7;
  double v8 = +[NSArray arrayWithObjects:v18 count:2];

  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      CGFloat v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) setBackgroundColor:[v4 CGColor]];
        CGFloat v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v10);
  }
}

- (id)firstBaselineAnchor
{
  v2 = [(HSKeylineLabel *)self label];
  double v3 = [v2 firstBaselineAnchor];

  return v3;
}

- (id)lastBaselineAnchor
{
  v2 = [(HSKeylineLabel *)self label];
  double v3 = [v2 lastBaselineAnchor];

  return v3;
}

- (NSString)text
{
  v2 = [(HSKeylineLabel *)self attributedText];
  double v3 = [v2 string];

  return (NSString *)v3;
}

- (void)setText:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSAttributedString) initWithString:v4];

  [(HSKeylineLabel *)self setAttributedText:v5];
}

- (NSAttributedString)attributedText
{
  v2 = [(HSKeylineLabel *)self label];
  double v3 = [v2 attributedText];

  return (NSAttributedString *)v3;
}

- (void)setAttributedText:(id)a3
{
  id v4 = a3;
  id v5 = [(HSKeylineLabel *)self label];
  [v5 setAttributedText:v4];

  double v6 = [(HSKeylineLabel *)self label];
  [v6 sizeToFit];

  [(HSKeylineLabel *)self invalidateIntrinsicContentSize];

  [(HSKeylineLabel *)self setNeedsLayout];
}

- (void)setMargin:(double)a3
{
  self->_margin = a3;
  [(HSKeylineLabel *)self setNeedsLayout];
}

- (CALayer)leadingKeylineLayer
{
  return self->_leadingKeylineLayer;
}

- (void)setLeadingKeylineLayer:(id)a3
{
}

- (CALayer)trailingKeylineLayer
{
  return self->_trailingKeylineLayer;
}

- (void)setTrailingKeylineLayer:(id)a3
{
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (double)margin
{
  return self->_margin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_trailingKeylineLayer, 0);

  objc_storeStrong((id *)&self->_leadingKeylineLayer, 0);
}

@end