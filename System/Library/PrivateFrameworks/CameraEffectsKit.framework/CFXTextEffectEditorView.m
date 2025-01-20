@interface CFXTextEffectEditorView
+ (id)viewWithFrame:(CGRect)a3 textEditingProperties:(id)a4;
- (BOOL)textPasteConfigurationSupporting:(id)a3 shouldAnimatePasteOfAttributedString:(id)a4 toRange:(id)a5;
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (CFXTextEffectEditorView)initWithFrame:(CGRect)a3 textEditingProperties:(id)a4;
- (CFXTextEffectEditorViewDelegate)delegate;
- (CGRect)textEditingFrameRelativeToView:(id)a3;
- (JFXTextEffectEditorView)editorView;
- (NSString)text;
- (id)textDraggableView:(id)a3 itemsForDrag:(id)a4;
- (void)CFX_setupTextField:(id)a3;
- (void)applyTextEditingProperties:(id)a3;
- (void)endTextEditing;
- (void)selectAll;
- (void)selectAtEnd;
- (void)setDelegate:(id)a3;
- (void)setEditorView:(id)a3;
- (void)textEffectEditorTextViewDidUnmarkText:(id)a3;
- (void)textViewDidChange:(id)a3;
@end

@implementation CFXTextEffectEditorView

+ (id)viewWithFrame:(CGRect)a3 textEditingProperties:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v10 = objc_msgSend(objc_alloc((Class)a1), "initWithFrame:textEditingProperties:", v9, x, y, width, height);

  return v10;
}

- (CFXTextEffectEditorView)initWithFrame:(CGRect)a3 textEditingProperties:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CFXTextEffectEditorView;
  v10 = -[CFXTextEffectEditorView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    v11 = [MEMORY[0x263F1C550] clearColor];
    [(CFXTextEffectEditorView *)v10 setBackgroundColor:v11];

    [(CFXTextEffectEditorView *)v10 CFX_setupTextField:v9];
    v12 = [MEMORY[0x263F08A00] defaultCenter];
    [v12 addObserver:v10 selector:sel_applicationDidEnterBackground_ name:*MEMORY[0x263F1D0D8] object:0];
  }
  return v10;
}

- (void)CFX_setupTextField:(id)a3
{
  id v4 = a3;
  v5 = [JFXTextEffectEditorView alloc];
  [(CFXTextEffectEditorView *)self bounds];
  v6 = -[JFXTextEffectEditorView initWithFrame:textEditingProperties:](v5, "initWithFrame:textEditingProperties:", v4);

  [(CFXTextEffectEditorView *)self setEditorView:v6];
  v7 = [(CFXTextEffectEditorView *)self editorView];
  id v9 = [v7 editField];

  [v9 setDelegate:self];
  [v9 setPasteDelegate:self];
  [v9 setTextDragDelegate:self];
  v8 = [(CFXTextEffectEditorView *)self editorView];
  [(CFXTextEffectEditorView *)self addSubview:v8];
}

- (void)selectAtEnd
{
  v2 = [(CFXTextEffectEditorView *)self editorView];
  id v4 = [v2 editField];

  [v4 becomeFirstResponder];
  v3 = [v4 text];
  objc_msgSend(v4, "setSelectedRange:", objc_msgSend(v3, "length"), 0);
}

- (void)selectAll
{
  id v2 = [(CFXTextEffectEditorView *)self editorView];
  [v2 selectAll];
}

- (void)endTextEditing
{
  id v2 = [(CFXTextEffectEditorView *)self editorView];
  [v2 endEditing];
}

- (NSString)text
{
  id v2 = [(CFXTextEffectEditorView *)self editorView];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)applyTextEditingProperties:(id)a3
{
  id v4 = a3;
  id v5 = [(CFXTextEffectEditorView *)self editorView];
  [v5 applyTextEditingProperties:v4];
}

- (CGRect)textEditingFrameRelativeToView:(id)a3
{
  id v4 = a3;
  id v5 = [(CFXTextEffectEditorView *)self editorView];
  v6 = [v5 editField];

  if (v6)
  {
    [v6 textEditingFrame];
    double x = v23.origin.x;
    double y = v23.origin.y;
    double width = v23.size.width;
    double height = v23.size.height;
    if (!CGRectIsNull(v23))
    {
      objc_msgSend(v6, "convertRect:toView:", v4, x, y, width, height);
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      CGFloat v16 = v15;
      CGFloat v18 = v17;
      [v4 bounds];
      v27.origin.double x = v12;
      v27.origin.double y = v14;
      v27.size.double width = v16;
      v27.size.double height = v18;
      CGRect v25 = CGRectIntersection(v24, v27);
      double x = v25.origin.x;
      double y = v25.origin.y;
      double width = v25.size.width;
      double height = v25.size.height;
    }
  }
  else
  {
    double x = *MEMORY[0x263F001A0];
    double y = *(double *)(MEMORY[0x263F001A0] + 8);
    double width = *(double *)(MEMORY[0x263F001A0] + 16);
    double height = *(double *)(MEMORY[0x263F001A0] + 24);
  }

  double v19 = x;
  double v20 = y;
  double v21 = width;
  double v22 = height;
  result.size.double height = v22;
  result.size.double width = v21;
  result.origin.double y = v20;
  result.origin.double x = v19;
  return result;
}

- (void)textEffectEditorTextViewDidUnmarkText:(id)a3
{
  id v4 = a3;
  id v6 = [(CFXTextEffectEditorView *)self delegate];
  id v5 = [v4 text];

  [v6 textEffectEditorView:self textChanged:v5 shouldUpdateTextEditingProperties:1];
}

- (void)textViewDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [v4 markedTextRange];
  BOOL v6 = v5 == 0;

  id v8 = [(CFXTextEffectEditorView *)self delegate];
  v7 = [v4 text];

  [v8 textEffectEditorView:self textChanged:v7 shouldUpdateTextEditingProperties:v6];
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a5;
  id v9 = [(CFXTextEffectEditorView *)self delegate];
  LOBYTE(length) = objc_msgSend(v9, "textEffectEditorView:shouldChangeTextInRange:replacementText:", self, location, length, v8);

  return length;
}

- (BOOL)textPasteConfigurationSupporting:(id)a3 shouldAnimatePasteOfAttributedString:(id)a4 toRange:(id)a5
{
  return 0;
}

- (id)textDraggableView:(id)a3 itemsForDrag:(id)a4
{
  return (id)MEMORY[0x263EFFA68];
}

- (CFXTextEffectEditorViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CFXTextEffectEditorViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (JFXTextEffectEditorView)editorView
{
  return self->_editorView;
}

- (void)setEditorView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editorView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end