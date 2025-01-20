@interface CKTextTighteningLabel
+ (BOOL)attributedText:(id)a3 fitsInRect:(CGRect)a4;
+ (id)_attributedStringWithText:(id)a3 font:(id)a4 sizeCategory:(id)a5 textRect:(CGRect)a6 forFittingSize:(BOOL)a7;
+ (void)applyKerning:(double)a3 whitespaceKerning:(double)a4 toAttributedString:(id)a5;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSAttributedString)tightenedAttributedText;
- (NSAttributedString)untightenedAttributedText;
- (NSString)managedText;
- (double)tightenedAttributedTextBoundsWidth;
- (double)untightenedAttributedTextBoundsWidth;
- (id)_attributedTextForFittingSize:(BOOL)a3 boundsSize:(CGSize)a4;
- (void)_clearTextTighteningCaches;
- (void)_updateAttributedTextForFittingSize:(BOOL)a3 boundsSize:(CGSize)a4;
- (void)_updateTightenedAttributedText;
- (void)layoutSubviews;
- (void)setFont:(id)a3;
- (void)setManagedText:(id)a3;
- (void)setTightenedAttributedText:(id)a3;
- (void)setTightenedAttributedTextBoundsWidth:(double)a3;
- (void)setUntightenedAttributedText:(id)a3;
- (void)setUntightenedAttributedTextBoundsWidth:(double)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CKTextTighteningLabel

- (void)layoutSubviews
{
  [(CKTextTighteningLabel *)self _updateTightenedAttributedText];
  v3.receiver = self;
  v3.super_class = (Class)CKTextTighteningLabel;
  [(CKTextTighteningLabel *)&v3 layoutSubviews];
}

- (void)setManagedText:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (v4)
  {
    v5 = [v4 trimmedString];
  }
  else
  {
    v5 = &stru_1EDE4CA38;
  }
  if (![(NSString *)self->_managedText isEqualToString:v5])
  {
    v6 = (NSString *)[(__CFString *)v5 copy];
    managedText = self->_managedText;
    self->_managedText = v6;

    [(CKTextTighteningLabel *)self _clearTextTighteningCaches];
    [(CKTextTighteningLabel *)self setNeedsLayout];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKTextTighteningLabel;
  [(CKTextTighteningLabel *)&v4 traitCollectionDidChange:a3];
  [(CKTextTighteningLabel *)self _clearTextTighteningCaches];
  [(CKTextTighteningLabel *)self setNeedsLayout];
}

- (void)setFont:(id)a3
{
  id v4 = a3;
  v5 = [(CKTextTighteningLabel *)self font];
  char v6 = [v5 isEqual:v4];

  v7.receiver = self;
  v7.super_class = (Class)CKTextTighteningLabel;
  [(CKTextTighteningLabel *)&v7 setFont:v4];

  if ((v6 & 1) == 0)
  {
    [(CKTextTighteningLabel *)self _clearTextTighteningCaches];
    [(CKTextTighteningLabel *)self setNeedsLayout];
  }
}

- (void)_clearTextTighteningCaches
{
  tightenedAttributedText = self->_tightenedAttributedText;
  self->_tightenedAttributedText = 0;

  self->_tightenedAttributedTextBoundsWidth = 0.0;
  untightenedAttributedText = self->_untightenedAttributedText;
  self->_untightenedAttributedText = 0;
}

- (void)_updateTightenedAttributedText
{
  [(CKTextTighteningLabel *)self bounds];

  -[CKTextTighteningLabel _updateAttributedTextForFittingSize:boundsSize:](self, "_updateAttributedTextForFittingSize:boundsSize:", 0, v3, v4);
}

- (id)_attributedTextForFittingSize:(BOOL)a3 boundsSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  BOOL v6 = a3;
  id v8 = self->_managedText;
  v9 = [(CKTextTighteningLabel *)self traitCollection];
  v10 = [v9 preferredContentSizeCategory];

  v11 = [(CKTextTighteningLabel *)self font];
  v12 = objc_msgSend((id)objc_opt_class(), "_attributedStringWithText:font:sizeCategory:textRect:forFittingSize:", v8, v11, v10, v6, 0.0, 0.0, width, height);

  return v12;
}

- (void)_updateAttributedTextForFittingSize:(BOOL)a3 boundsSize:(CGSize)a4
{
  CGFloat width = a4.width;
  if (a3)
  {
    p_untightenedAttributedText = &self->_untightenedAttributedText;
    untightenedAttributedText = self->_untightenedAttributedText;
    id v8 = &OBJC_IVAR___CKTextTighteningLabel__untightenedAttributedTextBoundsWidth;
    if (!untightenedAttributedText || vabdd_f64(self->_untightenedAttributedTextBoundsWidth, a4.width) > 2.22044605e-16)
    {
      uint64_t v9 = 1;
LABEL_8:
      uint64_t v10 = -[CKTextTighteningLabel _attributedTextForFittingSize:boundsSize:](self, "_attributedTextForFittingSize:boundsSize:", v9, a4.width, a4.height);
      v11 = *p_untightenedAttributedText;
      *p_untightenedAttributedText = (NSAttributedString *)v10;

      *(CGFloat *)((char *)&self->super.super.super.super.isa + *v8) = width;
      untightenedAttributedText = *p_untightenedAttributedText;
    }
  }
  else
  {
    p_untightenedAttributedText = &self->_tightenedAttributedText;
    untightenedAttributedText = self->_tightenedAttributedText;
    id v8 = &OBJC_IVAR___CKTextTighteningLabel__tightenedAttributedTextBoundsWidth;
    if (!untightenedAttributedText || vabdd_f64(self->_tightenedAttributedTextBoundsWidth, a4.width) > 2.22044605e-16)
    {
      uint64_t v9 = 0;
      goto LABEL_8;
    }
  }
  v12 = untightenedAttributedText;
  [(CKTextTighteningLabel *)self setAttributedText:v12];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  BOOL v6 = [(CKTextTighteningLabel *)self attributedText];
  -[CKTextTighteningLabel _updateAttributedTextForFittingSize:boundsSize:](self, "_updateAttributedTextForFittingSize:boundsSize:", 1, width, height);
  v13.receiver = self;
  v13.super_class = (Class)CKTextTighteningLabel;
  -[CKTextTighteningLabel sizeThatFits:](&v13, sel_sizeThatFits_, width, height);
  double v8 = v7;
  double v10 = v9;
  [(CKTextTighteningLabel *)self setAttributedText:v6];

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

+ (id)_attributedStringWithText:(id)a3 font:(id)a4 sizeCategory:(id)a5 textRect:(CGRect)a6 forFittingSize:(BOOL)a7
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  id v15 = a3;
  id v16 = a4;
  v17 = (NSString *)a5;
  v18 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v15];
  if ([v15 length])
  {
    uint64_t v19 = [v15 length];
    objc_msgSend(v18, "addAttribute:value:range:", *MEMORY[0x1E4FB06F8], v16, 0, v19);
    id v20 = objc_alloc_init(MEMORY[0x1E4FB0848]);
    [v20 setAlignment:1];
    [v20 setAllowsDefaultTighteningForTruncation:1];
    [v20 setLineBreakMode:4];
    objc_msgSend(v18, "addAttribute:value:range:", *MEMORY[0x1E4FB0738], v20, 0, v19);
    if (!a7 && width > 0.0 && (objc_msgSend(a1, "attributedText:fitsInRect:", v18, x, y, width, height) & 1) == 0)
    {
      if (v17
        && UIContentSizeCategoryCompareToCategory(v17, (UIContentSizeCategory)*MEMORY[0x1E4F437B0]) == NSOrderedDescending)
      {
        double v21 = 1.5;
        unint64_t v22 = 30;
      }
      else
      {
        double v21 = 3.0;
        unint64_t v22 = 20;
      }
      unint64_t v23 = 0;
      while (1)
      {
        ++v23;
        [a1 applyKerning:v18 whitespaceKerning:(double)v23 * -0.05 toAttributedString:v21 * ((double)v23 * -0.05)];
        if (objc_msgSend(a1, "attributedText:fitsInRect:", v18, x, y, width, height)) {
          break;
        }
        if (v22 == v23)
        {
          double v24 = (double)((unint64_t)((double)v22 * 0.9) + 1) * -0.05;
          [a1 applyKerning:v18 whitespaceKerning:v24 toAttributedString:v21 * v24];
          break;
        }
      }
    }
  }
  v25 = (void *)[v18 copy];

  return v25;
}

+ (BOOL)attributedText:(id)a3 fitsInRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  objc_msgSend(a3, "boundingRectWithSize:options:context:", 0, 0, 1.79769313e308, 1.79769313e308);
  double v8 = CGRectGetWidth(v10);
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  return v8 <= CGRectGetWidth(v11);
}

+ (void)applyKerning:(double)a3 whitespaceKerning:(double)a4 toAttributedString:(id)a5
{
  id v20 = a5;
  double v7 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  double v8 = [v20 string];
  uint64_t v9 = [v20 length];
  uint64_t v10 = [v8 rangeOfCharacterFromSet:v7];
  uint64_t v12 = v11;
  uint64_t v13 = 0;
  uint64_t v14 = *MEMORY[0x1E4FB0710];
  while (1)
  {
    uint64_t v15 = v10 == 0x7FFFFFFFFFFFFFFFLL ? v9 : v10;
    uint64_t v16 = v15 - v13;
    v17 = [NSNumber numberWithDouble:a3];
    v18 = [NSNumber numberWithDouble:a4];
    objc_msgSend(v20, "addAttribute:value:range:", v14, v17, v13, v16);
    if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
    objc_msgSend(v20, "addAttribute:value:range:", v14, v18, v10, v12);
    uint64_t v13 = v10 + v12;
    uint64_t v10 = objc_msgSend(v8, "rangeOfCharacterFromSet:options:range:", v7, 0, v10 + v12, v9 - (v10 + v12));
    uint64_t v12 = v19;
  }
}

- (NSString)managedText
{
  return self->_managedText;
}

- (NSAttributedString)tightenedAttributedText
{
  return self->_tightenedAttributedText;
}

- (void)setTightenedAttributedText:(id)a3
{
}

- (double)tightenedAttributedTextBoundsWidth
{
  return self->_tightenedAttributedTextBoundsWidth;
}

- (void)setTightenedAttributedTextBoundsWidth:(double)a3
{
  self->_tightenedAttributedTextBoundsWidth = a3;
}

- (NSAttributedString)untightenedAttributedText
{
  return self->_untightenedAttributedText;
}

- (void)setUntightenedAttributedText:(id)a3
{
}

- (double)untightenedAttributedTextBoundsWidth
{
  return self->_untightenedAttributedTextBoundsWidth;
}

- (void)setUntightenedAttributedTextBoundsWidth:(double)a3
{
  self->_untightenedAttributedTextBoundsWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_untightenedAttributedText, 0);
  objc_storeStrong((id *)&self->_tightenedAttributedText, 0);

  objc_storeStrong((id *)&self->_managedText, 0);
}

@end