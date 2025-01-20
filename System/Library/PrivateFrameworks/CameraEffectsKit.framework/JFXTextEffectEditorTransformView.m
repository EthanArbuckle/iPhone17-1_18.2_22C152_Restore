@interface JFXTextEffectEditorTransformView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (JFXTextEffectEditorTextView)textView;
- (JFXTextEffectEditorTransformView)initWithFrame:(CGRect)a3 textView:(id)a4;
@end

@implementation JFXTextEffectEditorTransformView

- (JFXTextEffectEditorTransformView)initWithFrame:(CGRect)a3 textView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)JFXTextEffectEditorTransformView;
  v11 = -[JFXTextEffectEditorTransformView initWithFrame:](&v18, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    double v13 = *MEMORY[0x263F00148];
    double v14 = *(double *)(MEMORY[0x263F00148] + 8);
    v15 = [(JFXTextEffectEditorTransformView *)v11 layer];
    objc_msgSend(v15, "setAnchorPoint:", v13, v14);

    v16 = [(JFXTextEffectEditorTransformView *)v12 layer];
    [v16 setGeometryFlipped:1];

    [(JFXTextEffectEditorTransformView *)v12 setClipsToBounds:0];
    objc_storeStrong((id *)&v12->_textView, a4);
  }

  return v12;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = [(JFXTextEffectEditorTransformView *)self textView];
  -[JFXTextEffectEditorTransformView convertPoint:toView:](self, "convertPoint:toView:", v8, x, y);
  double v10 = v9;
  double v12 = v11;

  double v13 = [(JFXTextEffectEditorTransformView *)self textView];
  LOBYTE(v8) = objc_msgSend(v13, "pointInside:withEvent:", v7, v10, v12);

  return (char)v8;
}

- (JFXTextEffectEditorTextView)textView
{
  return self->_textView;
}

- (void).cxx_destruct
{
}

@end