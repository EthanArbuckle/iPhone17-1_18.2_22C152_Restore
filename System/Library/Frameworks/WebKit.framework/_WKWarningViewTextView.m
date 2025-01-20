@interface _WKWarningViewTextView
- (CGSize)intrinsicContentSize;
- (_WKWarningViewTextView)initWithAttributedString:(id)a3 forWarning:(id)a4;
- (id).cxx_construct;
@end

@implementation _WKWarningViewTextView

- (_WKWarningViewTextView)initWithAttributedString:(id)a3 forWarning:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)_WKWarningViewTextView;
  v6 = [(_WKWarningViewTextView *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeWeak(&v6->_warning.m_weakReference, a4);
    [(_WKWarningViewTextView *)v7 setDelegate:a4];
    uint64_t v8 = colorForItem(4, a4);
    v9 = (void *)[a3 mutableCopy];
    uint64_t v15 = *MEMORY[0x1E4F42510];
    uint64_t v10 = v15;
    v16[0] = v8;
    objc_msgSend(v9, "addAttributes:range:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1), 0, objc_msgSend(v9, "length"));
    [(_WKWarningViewTextView *)v7 setBackgroundColor:colorForItem(1, a4)];
    uint64_t v13 = v10;
    uint64_t v14 = v8;
    -[_WKWarningViewTextView setLinkTextAttributes:](v7, "setLinkTextAttributes:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1]);
    objc_msgSend((id)-[_WKWarningViewTextView textStorage](v7, "textStorage"), "appendAttributedString:", v9);
    [(_WKWarningViewTextView *)v7 setEditable:0];
    [(_WKWarningViewTextView *)v7 setScrollEnabled:0];
    if (v9) {
      CFRelease(v9);
    }
  }
  return v7;
}

- (CGSize)intrinsicContentSize
{
  [objc_loadWeak(&self->_warning.m_weakReference) frame];
  if (v3 >= 675.0) {
    double v4 = 635.0;
  }
  else {
    double v4 = v3 + -40.0;
  }
  -[_WKWarningViewTextView sizeThatFits:](self, "sizeThatFits:", v4, 1.79769313e308);
  double v6 = v4;
  result.height = v5;
  result.width = v6;
  return result;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 347) = 0;
  return self;
}

@end