@interface MULinkView
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (BOOL)textViewShouldBeginEditing:(id)a3;
- (MULinkView)initWithFrame:(CGRect)a3;
- (NSAttributedString)attributedText;
- (id)selectionBlock;
- (unint64_t)numberOfLines;
- (void)_setupLinkView;
- (void)_updateForButtonShapeStatusChange;
- (void)_updateTintColor;
- (void)setAttributedText:(id)a3;
- (void)setNumberOfLines:(unint64_t)a3;
- (void)setSelectionBlock:(id)a3;
- (void)textViewDidChangeSelection:(id)a3;
@end

@implementation MULinkView

- (MULinkView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MULinkView;
  v3 = -[MULinkView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    [(MULinkView *)v3 setAccessibilityIdentifier:v5];

    [(MULinkView *)v3 _setupLinkView];
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    [(MULinkView *)v3 setAccessibilityIdentifier:v7];
  }
  return v3;
}

- (void)_setupLinkView
{
  v18[1] = *MEMORY[0x1E4F143B8];
  objc_msgSend(MEMORY[0x1E4FB1DD8], "_mapsui_defaultTextView");
  v3 = (UITextView *)objc_claimAutoreleasedReturnValue();
  textView = self->_textView;
  self->_textView = v3;

  [(UITextView *)self->_textView setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = [MEMORY[0x1E4FB1618] clearColor];
  [(UITextView *)self->_textView setBackgroundColor:v5];

  v6 = [MEMORY[0x1E4FB1618] labelColor];
  [(UITextView *)self->_textView setTextColor:v6];

  [(UITextView *)self->_textView setDelegate:self];
  [(UITextView *)self->_textView setAccessibilityIdentifier:@"LinkViewTextView"];
  v7 = [(UITextView *)self->_textView textContainer];
  [v7 setLineBreakMode:4];

  -[MULinkView setDirectionalLayoutMargins:](self, "setDirectionalLayoutMargins:", *MEMORY[0x1E4FB12A8], *(double *)(MEMORY[0x1E4FB12A8] + 8), *(double *)(MEMORY[0x1E4FB12A8] + 16), *(double *)(MEMORY[0x1E4FB12A8] + 24));
  [(UITextView *)self->_textView setInsetsLayoutMarginsFromSafeArea:0];
  [(UITextView *)self->_textView setAdjustsFontForContentSizeCategory:1];
  [(MULinkView *)self _updateForButtonShapeStatusChange];
  [(MULinkView *)self _updateTintColor];
  MURegisterForButtonShapeEnablementChanges(self, (uint64_t)sel__updateForButtonShapeStatusChange);
  [(MULinkView *)self addSubview:self->_textView];
  v8 = (void *)MEMORY[0x1E4F28DC8];
  objc_super v9 = [MUEdgeLayout alloc];
  v10 = self->_textView;
  v11 = [(MULinkView *)self layoutMarginsGuide];
  v12 = [(MUEdgeLayout *)v9 initWithItem:v10 container:v11];
  v18[0] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  objc_msgSend(v8, "_mapsui_activateLayouts:", v13);

  v14 = self;
  v17 = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  id v16 = (id)[(MULinkView *)self registerForTraitChanges:v15 withAction:sel__updateTintColor];
}

- (void)setAttributedText:(id)a3
{
}

- (NSAttributedString)attributedText
{
  return [(UITextView *)self->_textView _mapsui_attributedText];
}

- (void)setNumberOfLines:(unint64_t)a3
{
  id v4 = [(UITextView *)self->_textView textContainer];
  [v4 setMaximumNumberOfLines:a3];
}

- (unint64_t)numberOfLines
{
  v2 = [(UITextView *)self->_textView textContainer];
  unint64_t v3 = [v2 maximumNumberOfLines];

  return v3;
}

- (void)_updateTintColor
{
  id v3 = +[MUInfoCardStyle tintColor];
  [(UITextView *)self->_textView setTintColor:v3];
}

- (void)_updateForButtonShapeStatusChange
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (UIAccessibilityButtonShapesEnabled())
  {
    uint64_t v5 = *MEMORY[0x1E4FB0808];
    v6[0] = &unk_1EE404DC0;
    id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
    [(UITextView *)self->_textView setLinkTextAttributes:v3];
  }
  else
  {
    textView = self->_textView;
    [(UITextView *)textView setLinkTextAttributes:0];
  }
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  if (!a6)
  {
    selectionBlock = (void (**)(id, MULinkView *))self->_selectionBlock;
    if (selectionBlock) {
      selectionBlock[2](selectionBlock, self);
    }
  }

  return 0;
}

- (void)textViewDidChangeSelection:(id)a3
{
}

- (BOOL)textViewShouldBeginEditing:(id)a3
{
  return 0;
}

- (id)selectionBlock
{
  return self->_selectionBlock;
}

- (void)setSelectionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_selectionBlock, 0);
  objc_storeStrong((id *)&self->_textView, 0);
}

@end