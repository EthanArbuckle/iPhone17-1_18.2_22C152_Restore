@interface FBABugFormLabel
- (FBABugFormLabel)initWithCoder:(id)a3;
- (FBABugFormLabel)initWithFrame:(CGRect)a3;
- (NSLayoutManager)layoutManager;
- (NSTextContainer)container;
- (NSTextStorage)textStorage;
- (void)_initLabel;
- (void)layoutSubviews;
- (void)setContainer:(id)a3;
- (void)setLayoutManager:(id)a3;
- (void)setTextStorage:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation FBABugFormLabel

- (FBABugFormLabel)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FBABugFormLabel;
  v3 = -[FBABugFormLabel initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(FBABugFormLabel *)v3 _initLabel];
  }
  return v4;
}

- (FBABugFormLabel)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FBABugFormLabel;
  v3 = [(FBABugFormLabel *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(FBABugFormLabel *)v3 _initLabel];
  }
  return v4;
}

- (void)_initLabel
{
  v3 = (NSTextStorage *)objc_alloc_init((Class)NSTextStorage);
  textStorage = self->_textStorage;
  self->_textStorage = v3;

  v5 = (NSLayoutManager *)objc_alloc_init((Class)NSLayoutManager);
  layoutManager = self->_layoutManager;
  self->_layoutManager = v5;

  [(NSTextStorage *)self->_textStorage addLayoutManager:self->_layoutManager];
  id v7 = objc_alloc((Class)NSTextContainer);
  [(FBABugFormLabel *)self bounds];
  v10 = [v7 initWithSize:v8, v9];
  container = self->_container;
  self->_container = v10;

  [(NSTextContainer *)self->_container setMaximumNumberOfLines:[(FBABugFormLabel *)self numberOfLines]];
  [(NSTextContainer *)self->_container setLineBreakMode:[(FBABugFormLabel *)self lineBreakMode]];
  [(NSTextContainer *)self->_container setLineFragmentPadding:0.0];
  v12 = self->_layoutManager;
  v13 = self->_container;

  [(NSLayoutManager *)v12 addTextContainer:v13];
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)FBABugFormLabel;
  [(FBABugFormLabel *)&v12 layoutSubviews];
  [(FBABugFormLabel *)self bounds];
  double Width = CGRectGetWidth(v13);
  if (Width > 0.0)
  {
    double v4 = Width;
    [(FBABugFormLabel *)self preferredMaxLayoutWidth];
    if (v4 != v5)
    {
      [(FBABugFormLabel *)self bounds];
      [(FBABugFormLabel *)self setPreferredMaxLayoutWidth:CGRectGetWidth(v14)];
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)FBABugFormLabel;
  [(FBABugFormLabel *)&v11 layoutSubviews];
  [(FBABugFormLabel *)self bounds];
  double v7 = v6;
  double v9 = v8;
  v10 = [(FBABugFormLabel *)self container];
  [v10 setSize:v7, v9];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  double v6 = [(FBABugFormLabel *)self textStorage];
  double v7 = [(FBABugFormLabel *)self attributedText];
  [v6 setAttributedString:v7];

  double v8 = [(FBABugFormLabel *)self attributedText];
  id v9 = [v8 mutableCopy];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v5;
  id v10 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v30;
    do
    {
      CGRect v13 = 0;
      do
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(obj);
        }
        [*(id *)(*((void *)&v29 + 1) + 8 * (void)v13) locationInView:self];
        double v15 = v14;
        double v17 = v16;
        v18 = [(FBABugFormLabel *)self layoutManager];
        v19 = [(FBABugFormLabel *)self container];
        id v20 = [v18 characterIndexForPoint:v19 inTextContainer:0 fractionOfDistanceBetweenInsertionPoints:v15, v17];

        uint64_t v27 = 0;
        uint64_t v28 = 0;
        v21 = [(FBABugFormLabel *)self attributedText];
        v22 = [v21 attributesAtIndex:v20 effectiveRange:&v27];

        v23 = [v22 objectForKey:NSLinkAttributeName];
        if (v23)
        {
          v24 = +[UIColor colorWithWhite:0.0 alpha:0.100000001];
          [v9 addAttribute:NSBackgroundColorAttributeName value:v24 range:v27, v28];
        }
        CGRect v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v11);
  }

  id v25 = [v9 copy];
  [(FBABugFormLabel *)self setAttributedText:v25];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  double v6 = [(FBABugFormLabel *)self attributedText];
  id v7 = [v6 mutableCopy];

  id v8 = objc_alloc_init((Class)NSMutableIndexSet);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v9 = v5;
  id v10 = [v9 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v34;
    do
    {
      CGRect v13 = 0;
      do
      {
        if (*(void *)v34 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v33 + 1) + 8 * (void)v13) locationInView:self];
        double v15 = v14;
        double v17 = v16;
        v18 = [(FBABugFormLabel *)self layoutManager];
        v19 = [(FBABugFormLabel *)self container];
        id v20 = [v18 characterIndexForPoint:v19 inTextContainer:0 fractionOfDistanceBetweenInsertionPoints:v15 v17];

        [v8 addIndex:v20];
        CGRect v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v11);
  }

  v21 = [(FBABugFormLabel *)self attributedText];
  v22 = [(FBABugFormLabel *)self attributedText];
  id v23 = [v22 length];
  uint64_t v27 = _NSConcreteStackBlock;
  uint64_t v28 = 3221225472;
  long long v29 = sub_100010464;
  long long v30 = &unk_1000F2940;
  id v31 = v8;
  id v32 = v7;
  id v24 = v7;
  id v25 = v8;
  [v21 enumerateAttribute:NSBackgroundColorAttributeName inRange:0 options:0 usingBlock:&v27];

  id v26 = [v24 copy:v27, v28, v29, v30];
  [(FBABugFormLabel *)self setAttributedText:v26];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  double v6 = [(FBABugFormLabel *)self attributedText];
  id v7 = [v6 mutableCopy];

  id v8 = objc_alloc_init((Class)NSMutableIndexSet);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v9 = v5;
  id v10 = [v9 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v34;
    do
    {
      CGRect v13 = 0;
      do
      {
        if (*(void *)v34 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v33 + 1) + 8 * (void)v13) locationInView:self];
        double v15 = v14;
        double v17 = v16;
        v18 = [(FBABugFormLabel *)self layoutManager];
        v19 = [(FBABugFormLabel *)self container];
        id v20 = [v18 characterIndexForPoint:v19 inTextContainer:0 fractionOfDistanceBetweenInsertionPoints:v15, v17];

        [v8 addIndex:v20];
        CGRect v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v11);
  }

  v21 = [(FBABugFormLabel *)self attributedText];
  v22 = [(FBABugFormLabel *)self attributedText];
  id v23 = [v22 length];
  uint64_t v27 = _NSConcreteStackBlock;
  uint64_t v28 = 3221225472;
  long long v29 = sub_100010754;
  long long v30 = &unk_1000F2940;
  id v31 = v8;
  id v32 = v7;
  id v24 = v7;
  id v25 = v8;
  [v21 enumerateAttribute:NSBackgroundColorAttributeName inRange:0 options:0 usingBlock:&v27];

  id v26 = [v24 copy:v27, v28, v29, v30];
  [(FBABugFormLabel *)self setAttributedText:v26];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  double v6 = [(FBABugFormLabel *)self attributedText];
  id v27 = [v6 mutableCopy];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v5;
  id v7 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v31;
    while (2)
    {
      id v10 = 0;
      do
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(obj);
        }
        [*(id *)(*((void *)&v30 + 1) + 8 * (void)v10) locationInView:self];
        double v12 = v11;
        double v14 = v13;
        double v15 = [(FBABugFormLabel *)self layoutManager];
        double v16 = [(FBABugFormLabel *)self container];
        id v17 = [v15 characterIndexForPoint:v16 inTextContainer:0 fractionOfDistanceBetweenInsertionPoints:v12 v14];

        uint64_t v28 = 0;
        uint64_t v29 = 0;
        v18 = [(FBABugFormLabel *)self attributedText];
        v19 = [v18 attributesAtIndex:v17 effectiveRange:&v28];

        id v20 = [v19 objectForKey:NSBackgroundColorAttributeName];

        if (v20) {
          [v27 removeAttribute:NSBackgroundColorAttributeName range:v28, v29];
        }
        v21 = [v19 objectForKey:NSLinkAttributeName];
        if (v21)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v22 = v21;
LABEL_16:
            id v23 = v22;

            goto LABEL_17;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v22 = +[NSURL URLWithString:v21];
            if (v22) {
              goto LABEL_16;
            }
          }
        }

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v23 = 0;
LABEL_17:

  id v24 = [v27 copy];
  [(FBABugFormLabel *)self setAttributedText:v24];

  if (v23)
  {
    id v25 = +[UIApplication sharedApplication];
    [v25 openURL:v23 options:&__NSDictionary0__struct completionHandler:0];
  }
}

- (NSTextStorage)textStorage
{
  return (NSTextStorage *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTextStorage:(id)a3
{
}

- (NSLayoutManager)layoutManager
{
  return (NSLayoutManager *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLayoutManager:(id)a3
{
}

- (NSTextContainer)container
{
  return (NSTextContainer *)objc_getProperty(self, a2, 24, 1);
}

- (void)setContainer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_layoutManager, 0);

  objc_storeStrong((id *)&self->_textStorage, 0);
}

@end