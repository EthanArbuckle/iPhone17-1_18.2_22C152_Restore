@interface CEKBadgeTextView
+ (UIEdgeInsets)_defaultTextInsets;
+ (double)_heightForContentSize:(id)a3 textInsets:(UIEdgeInsets)a4;
+ (double)_textHeightForContentSize:(id)a3;
+ (id)_fontForContentSize:(id)a3 fontStyle:(unint64_t)a4;
+ (id)_textAttributesForContentSize:(id)a3 fontStyle:(unint64_t)a4;
- (CEKBadgeTextView)initWithFrame:(CGRect)a3;
- (CGSize)_textSize;
- (CGSize)intrinsicContentSize;
- (NSDictionary)_textAttributes;
- (NSString)_text;
- (NSString)contentSizeCategory;
- (UIEdgeInsets)_textInsets;
- (id)_maskImage;
- (unint64_t)fontStyle;
- (void)_didUpdateContents;
- (void)_setText:(id)a3;
- (void)_setTextAttributes:(id)a3;
- (void)_setTextInsets:(UIEdgeInsets)a3;
- (void)setContentSizeCategory:(id)a3;
- (void)setFontStyle:(unint64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CEKBadgeTextView

- (CEKBadgeTextView)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CEKBadgeTextView;
  v3 = -[CEKBadgeView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    p_textInsets = &v3->__textInsets;
    [(id)objc_opt_class() _defaultTextInsets];
    *(void *)&p_textInsets->top = v6;
    v4->__textInsets.left = v7;
    v4->__textInsets.bottom = v8;
    v4->__textInsets.right = v9;
    v4->_fontStyle = 0;
    uint64_t v10 = [(id)objc_opt_class() _textAttributesForContentSize:*MEMORY[0x1E4FB27D0] fontStyle:v4->_fontStyle];
    textAttributes = v4->__textAttributes;
    v4->__textAttributes = (NSDictionary *)v10;

    v12 = v4;
  }

  return v4;
}

+ (UIEdgeInsets)_defaultTextInsets
{
  v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v2 scale];
  double v4 = 1.0 / v3;

  double v5 = 2.0 - v4;
  double v6 = 1.0 - v4 + 5.0;
  double v7 = 2.0;
  double v8 = 5.0;
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (void)setFontStyle:(unint64_t)a3
{
  if (self->_fontStyle != a3)
  {
    self->_fontStyle = a3;
    double v5 = objc_opt_class();
    id v8 = [(CEKBadgeTextView *)self traitCollection];
    double v6 = [v8 preferredContentSizeCategory];
    double v7 = [v5 _textAttributesForContentSize:v6 fontStyle:a3];
    [(CEKBadgeTextView *)self _setTextAttributes:v7];
  }
}

- (id)_maskImage
{
  [(CEKBadgeTextView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v7 = [(CEKBadgeTextView *)self _text];
  [(CEKBadgeTextView *)self _textSize];
  double v9 = v8;
  double v11 = v10;
  [(CEKBadgeTextView *)self _textInsets];
  double v13 = v12;
  double v15 = v14;
  v20.width = v4;
  v20.height = v6;
  UIGraphicsBeginImageContextWithOptions(v20, 0, 0.0);
  v16 = [(CEKBadgeTextView *)self _textAttributes];
  objc_msgSend(v7, "drawInRect:withAttributes:", v16, v15, v13, v9, v11);

  v17 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v17;
}

- (CGSize)_textSize
{
  double v3 = [(CEKBadgeTextView *)self _text];
  CGFloat v4 = [(CEKBadgeTextView *)self _textAttributes];
  [v3 sizeWithAttributes:v4];
  UICeilToViewScale();
  double v6 = v5;
  UICeilToViewScale();
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGSize)intrinsicContentSize
{
  [(CEKBadgeTextView *)self _textInsets];
  [(CEKBadgeTextView *)self _textSize];
  UICeilToViewScale();
  double v4 = v3;
  UICeilToViewScale();
  double v6 = v5;
  double v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CEKBadgeTextView;
  id v4 = a3;
  [(CEKBadgeTextView *)&v9 traitCollectionDidChange:v4];
  double v5 = objc_msgSend(v4, "preferredContentSizeCategory", v9.receiver, v9.super_class);

  double v6 = [(CEKBadgeTextView *)self traitCollection];
  double v7 = [v6 preferredContentSizeCategory];

  if (v7 != v5 && ([v7 isEqualToString:v5] & 1) == 0)
  {
    double v8 = objc_msgSend((id)objc_opt_class(), "_textAttributesForContentSize:fontStyle:", v7, -[CEKBadgeTextView fontStyle](self, "fontStyle"));
    [(CEKBadgeTextView *)self _setTextAttributes:v8];
  }
}

- (void)_setText:(id)a3
{
  id v5 = a3;
  uint64_t text = (uint64_t)self->__text;
  if ((id)text != v5)
  {
    id v7 = v5;
    uint64_t text = [(id)text isEqualToString:v5];
    id v5 = v7;
    if ((text & 1) == 0)
    {
      objc_storeStrong((id *)&self->__text, a3);
      uint64_t text = [(CEKBadgeTextView *)self _didUpdateContents];
      id v5 = v7;
    }
  }
  MEMORY[0x1F41817F8](text, v5);
}

- (void)_setTextAttributes:(id)a3
{
  id v5 = a3;
  uint64_t textAttributes = (uint64_t)self->__textAttributes;
  if ((id)textAttributes != v5)
  {
    id v7 = v5;
    uint64_t textAttributes = [(id)textAttributes isEqualToDictionary:v5];
    id v5 = v7;
    if ((textAttributes & 1) == 0)
    {
      objc_storeStrong((id *)&self->__textAttributes, a3);
      uint64_t textAttributes = [(CEKBadgeTextView *)self _didUpdateContents];
      id v5 = v7;
    }
  }
  MEMORY[0x1F41817F8](textAttributes, v5);
}

- (void)_setTextInsets:(UIEdgeInsets)a3
{
  if (self->__textInsets.left != a3.left
    || self->__textInsets.top != a3.top
    || self->__textInsets.right != a3.right
    || self->__textInsets.bottom != a3.bottom)
  {
    self->__textInsets = a3;
    [(CEKBadgeTextView *)self _didUpdateContents];
  }
}

- (void)_didUpdateContents
{
  [(CEKBadgeTextView *)self setNeedsDisplay];
  [(CEKBadgeTextView *)self invalidateIntrinsicContentSize];
  id v3 = [(CEKBadgeView *)self delegate];
  [v3 badgeViewDidChangeIntrinsicContentSize:self];
}

+ (id)_textAttributesForContentSize:(id)a3 fontStyle:(unint64_t)a4
{
  id v5 = a3;
  double v6 = [(id)objc_opt_class() _fontForContentSize:v5 fontStyle:a4];

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v7 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4FB12B0]];
  double v8 = [MEMORY[0x1E4FB1618] whiteColor];
  [v7 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4FB12B8]];

  id v9 = objc_alloc_init(MEMORY[0x1E4FB1378]);
  [v6 leading];
  objc_msgSend(v9, "setLineSpacing:");
  [v9 setAlignment:1];
  [v7 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4FB12D0]];
  double v10 = CEKLocalizedFrameworkString(@"CAMERA_APPLY_CUSTOM_KERNING", 0);
  uint64_t v11 = [v10 caseInsensitiveCompare:@"YES"];

  if (!v11)
  {
    double v12 = (void *)MEMORY[0x1E4F28ED0];
    [v6 pointSize];
    double v14 = [v12 numberWithDouble:v13 * 25.0 / 1000.0];
    [v7 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4FB12C0]];
  }
  return v7;
}

+ (id)_fontForContentSize:(id)a3 fontStyle:(unint64_t)a4
{
  id v5 = a3;
  double v6 = 13.0;
  if (([v5 isEqualToString:*MEMORY[0x1E4FB27C8]] & 1) == 0
    && ([v5 isEqualToString:*MEMORY[0x1E4FB27E8]] & 1) == 0
    && ([v5 isEqualToString:*MEMORY[0x1E4FB27D8]] & 1) == 0
    && ([v5 isEqualToString:*MEMORY[0x1E4FB27D0]] & 1) == 0)
  {
    double v6 = 14.0;
    if (([v5 isEqualToString:*MEMORY[0x1E4FB27C0]] & 1) == 0)
    {
      if ([v5 isEqualToString:*MEMORY[0x1E4FB27B8]]) {
        double v6 = 16.0;
      }
      else {
        double v6 = 18.0;
      }
    }
  }
  id v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v7 _referenceBounds];
  double Width = CGRectGetWidth(v13);

  double v9 = 0.0;
  if (Width > 320.0) {
    double v9 = 1.0;
  }
  double v10 = CEKFontOfSizeAndStyle(a4, v6 + v9);

  return v10;
}

+ (double)_textHeightForContentSize:(id)a3
{
  id v3 = [a1 _fontForContentSize:a3 fontStyle:0];
  [v3 lineHeight];
  id v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v4 scale];

  UICeilToScale();
  double v6 = v5;

  return v6;
}

+ (double)_heightForContentSize:(id)a3 textInsets:(UIEdgeInsets)a4
{
  objc_msgSend(a1, "_textHeightForContentSize:", a3, a4.top, a4.left, a4.bottom, a4.right);
  id v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v4 scale];

  UICeilToScale();
  return result;
}

- (NSString)contentSizeCategory
{
  return self->_contentSizeCategory;
}

- (void)setContentSizeCategory:(id)a3
{
}

- (unint64_t)fontStyle
{
  return self->_fontStyle;
}

- (NSDictionary)_textAttributes
{
  return self->__textAttributes;
}

- (NSString)_text
{
  return self->__text;
}

- (UIEdgeInsets)_textInsets
{
  double top = self->__textInsets.top;
  double left = self->__textInsets.left;
  double bottom = self->__textInsets.bottom;
  double right = self->__textInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__text, 0);
  objc_storeStrong((id *)&self->__textAttributes, 0);
  objc_storeStrong((id *)&self->_contentSizeCategory, 0);
}

@end