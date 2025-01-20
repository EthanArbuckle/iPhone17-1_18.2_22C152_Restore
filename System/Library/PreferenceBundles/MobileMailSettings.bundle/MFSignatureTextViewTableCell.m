@interface MFSignatureTextViewTableCell
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)resignFirstResponder;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MFSignatureTextView)textView;
- (MFSignatureTextViewTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (id)pasteConfiguration;
- (id)styleString;
- (void)_updateInterfaceColorForTextView:(id)a3;
- (void)cellRemovedFromView;
- (void)layoutSubviews;
- (void)setPasteConfiguration:(id)a3;
- (void)setTextView:(id)a3;
- (void)setValue:(id)a3;
- (void)textContentViewDidChange:(id)a3;
- (void)textContentViewDidEndEditing:(id)a3;
@end

@implementation MFSignatureTextViewTableCell

- (MFSignatureTextViewTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a4;
  v9 = (char *)a5;
  v27.receiver = self;
  v27.super_class = (Class)MFSignatureTextViewTableCell;
  v10 = [(MFSignatureTextViewTableCell *)&v27 initWithStyle:a3 reuseIdentifier:v8 specifier:v9];
  v11 = v10;
  if (v10)
  {
    [(MFSignatureTextViewTableCell *)v10 setSelectionStyle:0];
    [(MFSignatureTextViewTableCell *)v11 setAccessoryType:0];
    [(MFSignatureTextViewTableCell *)v11 bounds];
    double v13 = v12;
    double v15 = v14;
    v16 = [MFSignatureWebDocumentView alloc];
    v17 = [(MFSignatureTextViewTableCell *)v11 styleString];
    v18 = +[MFSignatureWebDocumentView standardTextViewPreferences];
    id v19 = -[MFSignatureWebDocumentView initSimpleHTMLDocumentWithStyle:frame:preferences:groupName:](v16, "initSimpleHTMLDocumentWithStyle:frame:preferences:groupName:", v17, v18, 0, 0.0, 0.0, v13, v15);

    [v19 setUserInteractionEnabled:0];
    [v19 setIgnoresFocusingMouse:1];
    [v19 setLoadsSynchronously:1];
    v20 = -[MFSignatureTextView initWithFrame:webView:]([MFSignatureTextView alloc], "initWithFrame:webView:", v19, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v21 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleBody];
    v22 = +[UIFont fontWithDescriptor:v21 size:0.0];
    [(MFSignatureTextView *)v20 setFont:v22];

    [(MFSignatureTextView *)v20 setTextLoupeVisibility:2];
    [(MFSignatureTextView *)v20 setAcceptsEmoji:1];
    [(MFSignatureTextView *)v20 setAllowsEditingTextAttributes:1];
    [(MFSignatureTextView *)v20 setCell:v11];
    id WeakRetained = objc_loadWeakRetained((id *)&v9[OBJC_IVAR___PSSpecifier_target]);
    if (*(void *)&v9[OBJC_IVAR___PSSpecifier_getter] && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v24 = [v9 performGetter];
      [(MFSignatureTextViewTableCell *)v11 setValue:v24];
    }
    if (*(void *)&v9[OBJC_IVAR___PSSpecifier_setter] && *(void *)&v9[OBJC_IVAR___PSSpecifier_getter]) {
      -[MFSignatureTextViewTableCell setValueChangedTarget:action:specifier:](v11, "setValueChangedTarget:action:specifier:", WeakRetained);
    }
    v25 = +[NSNumber numberWithDouble:UITableViewAutomaticDimension];
    [v9 setProperty:v25 forKey:PSTableCellHeightKey];

    [(MFSignatureTextViewTableCell *)v11 _updateInterfaceColorForTextView:v11->_textView];
    [(MFSignatureTextViewTableCell *)v11 setTextView:v20];
  }
  return v11;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  CGFloat width = a3.width;
  v6 = [(MFSignatureTextViewTableCell *)self specifier];
  v7 = [(MFSignatureTextViewTableCell *)self textView];
  id v8 = [v6 propertyForKey:PSTextViewBottomMarginKey];
  if (v8)
  {
    id v9 = [v7 text];
    PSTextViewInsets();
    double v11 = v10;
    double v13 = v12;
    double v14 = [v7 webView];
    [v14 frame];
    double v15 = CGRectGetHeight(v25);
    [v8 floatValue];
    double height = v13 + v11 + v15 + v16;

    *(float *)&double v17 = height;
    v18 = +[NSNumber numberWithFloat:v17];
    uint64_t v19 = PSTableCellHeightKey;
    v20 = [v6 propertyForKey:PSTableCellHeightKey];
    unsigned __int8 v21 = [v20 isEqual:v18];

    if ((v21 & 1) == 0) {
      [v6 setProperty:v18 forKey:v19];
    }
  }
  double v22 = width;
  double v23 = height;
  result.double height = v23;
  result.CGFloat width = v22;
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)MFSignatureTextViewTableCell;
  [(MFSignatureTextViewTableCell *)&v4 layoutSubviews];
  v3 = [(MFSignatureTextViewTableCell *)self textView];
  [(MFSignatureTextViewTableCell *)self _updateInterfaceColorForTextView:v3];
}

- (void)cellRemovedFromView
{
  v3 = [(MFSignatureTextViewTableCell *)self specifier];
  v7.receiver = self;
  v7.super_class = (Class)MFSignatureTextViewTableCell;
  [(MFSignatureTextViewTableCell *)&v7 cellRemovedFromView];
  objc_super v4 = [(MFSignatureTextViewTableCell *)self textView];
  unsigned int v5 = [v4 isEditing];
  if (v3) {
    unsigned int v6 = v5;
  }
  else {
    unsigned int v6 = 0;
  }

  if (v6 == 1) {
    [(MFSignatureTextViewTableCell *)self setSpecifier:v3];
  }
}

- (void)setValue:(id)a3
{
  id v5 = a3;
  objc_super v4 = [(MFSignatureTextViewTableCell *)self textView];
  [v4 setContentToHTMLString:v5];
}

- (BOOL)becomeFirstResponder
{
  v2 = [(MFSignatureTextViewTableCell *)self textView];
  unsigned __int8 v3 = [v2 becomeFirstResponder];

  return v3;
}

- (BOOL)canBecomeFirstResponder
{
  v2 = [(MFSignatureTextViewTableCell *)self textView];
  unsigned __int8 v3 = [v2 canBecomeFirstResponder];

  return v3;
}

- (BOOL)resignFirstResponder
{
  v7.receiver = self;
  v7.super_class = (Class)MFSignatureTextViewTableCell;
  if ([(MFSignatureTextViewTableCell *)&v7 isFirstResponder])
  {
    v6.receiver = self;
    v6.super_class = (Class)MFSignatureTextViewTableCell;
    return [(MFSignatureTextViewTableCell *)&v6 resignFirstResponder];
  }
  else
  {
    objc_super v4 = [(MFSignatureTextViewTableCell *)self textView];
    unsigned __int8 v3 = [v4 resignFirstResponder];
  }
  return v3;
}

- (MFSignatureTextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
  p_textView = &self->_textView;
  objc_super v7 = (MFSignatureTextView *)a3;
  if (*p_textView != v7)
  {
    objc_super v6 = [(MFSignatureTextViewTableCell *)self contentView];
    [v6 addSubview:v7];

    if (*p_textView) {
      [(MFSignatureTextView *)*p_textView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_textView, a3);
    [(MFSignatureTextView *)*p_textView setDelegate:self];
  }
}

- (void)_updateInterfaceColorForTextView:(id)a3
{
  id v9 = a3;
  objc_super v4 = [(MFSignatureTextViewTableCell *)self traitCollection];
  id v5 = (char *)[v4 userInterfaceStyle];

  if (v5 == (unsigned char *)&dword_0 + 2)
  {
    objc_super v6 = +[UIColor tableCellGroupedBackgroundColor];
    [v9 setBackgroundColor:v6];

    +[UIColor labelColor];
  }
  else
  {
    id v8 = +[UIColor whiteColor];
    [v9 setBackgroundColor:v8];

    +[UIColor blackColor];
  objc_super v7 = };
  [v9 setTextColor:v7];
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if ("paste:" == a3)
  {
    objc_super v7 = +[UIPasteboard generalPasteboard];
    LODWORD(self) = [v7 hasImages] ^ 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)MFSignatureTextViewTableCell;
    LOBYTE(self) = [(MFSignatureTextViewTableCell *)&v9 canPerformAction:a3 withSender:v6];
  }

  return (char)self;
}

- (id)styleString
{
  v2 = +[UIFont systemFontOfSize:12.0];
  unsigned __int8 v3 = [v2 markupDescription];
  +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", @"margin-top: %dpx; %@; color: rgba(%d, %d, %d, %d); word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space;",
    8,
    v3,
    0,
    0,
    0,
  objc_super v4 = 1);

  return v4;
}

- (void)textContentViewDidChange:(id)a3
{
  id v14 = a3;
  objc_super v4 = [(MFSignatureTextViewTableCell *)self specifier];
  id v5 = [v4 propertyForKey:PSTableCellHeightKey];
  [v14 frame];
  -[MFSignatureTextViewTableCell sizeThatFits:](self, "sizeThatFits:", v6, v7);
  double v9 = v8;
  [v5 floatValue];
  if (v9 != v10)
  {
    double v11 = [v4 target];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v12 = [v11 table];
    }
    else
    {
      double v12 = 0;
    }
    BOOL v13 = +[UIView areAnimationsEnabled];
    +[UIView setAnimationsEnabled:0];
    [v12 beginUpdates];
    [v12 endUpdates];
    +[UIView setAnimationsEnabled:v13];
  }
}

- (void)textContentViewDidEndEditing:(id)a3
{
  id v10 = a3;
  objc_super v4 = [(MFSignatureTextViewTableCell *)self cellTarget];
  if (v4)
  {
    id v5 = [(MFSignatureTextViewTableCell *)self specifier];

    if (v5)
    {
      [(MFSignatureTextViewTableCell *)self cellAction];
      double v6 = [(MFSignatureTextViewTableCell *)self cellTarget];
      double v7 = [v10 contentAsHTMLString];
      double v8 = [(MFSignatureTextViewTableCell *)self specifier];
      id v9 = (id)SFPerformSelector2();
    }
  }
}

- (id)pasteConfiguration
{
  return self->_pasteConfiguration;
}

- (void)setPasteConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pasteConfiguration, 0);

  objc_storeStrong((id *)&self->_textView, 0);
}

@end