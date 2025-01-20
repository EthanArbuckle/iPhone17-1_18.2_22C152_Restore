@interface MFComposeSubjectTextView
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (MFComposeSubjectTextView)initWithFrame:(CGRect)a3;
- (void)setContentOffset:(CGPoint)a3;
- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4;
@end

@implementation MFComposeSubjectTextView

- (MFComposeSubjectTextView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MFComposeSubjectTextView;
  v3 = -[MFComposeSubjectTextView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(MFComposeSubjectTextView *)v3 setSupportsAdaptiveImageGlyph:0];
  }
  return v4;
}

- (void)setContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  objc_super v6 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
  IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v6);

  if (!IsAccessibilityCategory)
  {
    v8.receiver = self;
    v8.super_class = (Class)MFComposeSubjectTextView;
    -[MFComposeSubjectTextView setContentOffset:](&v8, sel_setContentOffset_, x, y);
  }
}

- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  objc_super v8 = cleanupSubjectString(v7, 0);

  v9.receiver = self;
  v9.super_class = (Class)MFComposeSubjectTextView;
  -[MFComposeSubjectTextView setMarkedText:selectedRange:](&v9, sel_setMarkedText_selectedRange_, v8, location, length);
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if (sel_selectAll_ == a3)
  {
    objc_super v8 = [(MFComposeSubjectTextView *)self text];
    unint64_t v9 = [v8 length];

    if (v9)
    {
      [(MFComposeSubjectTextView *)self selectedRange];
      unsigned __int8 v7 = v10 < v9;
    }
    else
    {
      unsigned __int8 v7 = 0;
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)MFComposeSubjectTextView;
    unsigned __int8 v7 = [(MFComposeSubjectTextView *)&v12 canPerformAction:a3 withSender:v6];
  }

  return v7;
}

@end