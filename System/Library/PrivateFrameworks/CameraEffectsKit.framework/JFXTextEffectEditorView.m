@interface JFXTextEffectEditorView
- (BOOL)indirectScribbleInteraction:(id)a3 isElementFocused:(id)a4;
- (CGRect)indirectScribbleInteraction:(id)a3 frameForElement:(id)a4;
- (JFXEffectTextEditingProperties)textEditingProperties;
- (JFXOverlayEffectDebugViewOptions)debugOptions;
- (JFXTextEffectEditorTextView)editField;
- (JFXTextEffectEditorView)initWithFrame:(CGRect)a3 textEditingProperties:(id)a4;
- (JFXTextEffectEditorView)initWithFrame:(CGRect)a3 textEditingProperties:(id)a4 textContainer:(id)a5;
- (NSString)text;
- (NSUUID)pencilTextEditingElementID;
- (UIView)debugView;
- (UIView)transformView;
- (void)applyTextEditingProperties:(id)a3;
- (void)endEditing;
- (void)indirectScribbleInteraction:(id)a3 focusElementIfNeeded:(id)a4 referencePoint:(CGPoint)a5 completion:(id)a6;
- (void)indirectScribbleInteraction:(id)a3 requestElementsInRect:(CGRect)a4 completion:(id)a5;
- (void)selectAll;
- (void)setDebugOptions:(id)a3;
- (void)setDebugView:(id)a3;
- (void)setEditField:(id)a3;
- (void)setPencilTextEditingElementID:(id)a3;
- (void)setTextEditingProperties:(id)a3;
- (void)setTransformView:(id)a3;
@end

@implementation JFXTextEffectEditorView

- (JFXTextEffectEditorView)initWithFrame:(CGRect)a3 textEditingProperties:(id)a4 textContainer:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a4;
  id v12 = a5;
  [v11 frame];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  v69.receiver = self;
  v69.super_class = (Class)JFXTextEffectEditorView;
  v21 = -[JFXTextEffectEditorView initWithFrame:](&v69, sel_initWithFrame_, x, y, width, height);
  v22 = v21;
  if (v21)
  {
    [(JFXTextEffectEditorView *)v21 setTextEditingProperties:v11];
    if ([v11 useFullTransform])
    {
      v23 = [JFXTextEffectEditorTransformView alloc];
      v24 = [(JFXTextEffectEditorView *)v22 editField];
      v25 = -[JFXTextEffectEditorTransformView initWithFrame:textView:](v23, "initWithFrame:textView:", v24, v14, v16, v18, v20);
      [(JFXTextEffectEditorView *)v22 setTransformView:v25];
    }
    else
    {
      v24 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", v14, v16, v18, v20);
      [(JFXTextEffectEditorView *)v22 setTransformView:v24];
    }

    v26 = [[JFXTextEffectEditorTextView alloc] initWithTextEditingProperties:v11 editorView:v22 textContainer:v12];
    [(JFXTextEffectEditorView *)v22 setEditField:v26];

    v27 = [(JFXTextEffectEditorView *)v22 transformView];
    [(JFXTextEffectEditorView *)v22 addSubview:v27];

    v28 = [(JFXTextEffectEditorView *)v22 transformView];
    v29 = [(JFXTextEffectEditorView *)v22 editField];
    [v28 addSubview:v29];

    v30 = JFX_getDrawOverlayBoundsOptionsDictionary();
    v31 = +[JFXOverlayEffectDebugViewOptions debugViewOptionsWithDictionary:v30];
    [(JFXTextEffectEditorView *)v22 setDebugOptions:v31];

    if (JFX_isDrawOverlayBoundsEnabled())
    {
      v32 = [(JFXTextEffectEditorView *)v22 debugOptions];
      int v33 = [v32 showTextBoundingBoxes];

      if (v33)
      {
        v34 = [(JFXTextEffectEditorView *)v22 transformView];
        v35 = [v34 layer];
        [v35 setBorderWidth:2.0];

        id v36 = [MEMORY[0x263F1C550] magentaColor];
        uint64_t v37 = [v36 CGColor];
        v38 = [(JFXTextEffectEditorView *)v22 transformView];
        v39 = [v38 layer];
        [v39 setBorderColor:v37];

        v40 = [(JFXTextEffectEditorView *)v22 layer];
        [v40 setBorderWidth:4.0];

        id v41 = [MEMORY[0x263F1C550] purpleColor];
        uint64_t v42 = [v41 CGColor];
        v43 = [(JFXTextEffectEditorView *)v22 layer];
        [v43 setBorderColor:v42];

        v44 = [(JFXTextEffectEditorView *)v22 debugView];
        [v44 removeFromSuperview];

        id v45 = objc_alloc(MEMORY[0x263F1CB60]);
        [(JFXTextEffectEditorView *)v22 frame];
        v46 = objc_msgSend(v45, "initWithFrame:");
        [(JFXTextEffectEditorView *)v22 setDebugView:v46];

        v47 = [(JFXTextEffectEditorView *)v22 debugView];
        [v47 setUserInteractionEnabled:0];

        v48 = [(JFXTextEffectEditorView *)v22 debugView];
        v49 = [v48 layer];
        [v49 setBorderWidth:2.0];

        id v50 = [MEMORY[0x263F1C550] yellowColor];
        uint64_t v51 = [v50 CGColor];
        v52 = [(JFXTextEffectEditorView *)v22 debugView];
        v53 = [v52 layer];
        [v53 setBorderColor:v51];

        v54 = [(JFXTextEffectEditorView *)v22 transformView];
        v55 = [(JFXTextEffectEditorView *)v22 debugView];
        [v54 addSubview:v55];

        v56 = [MEMORY[0x263F157E8] layer];
        id v57 = [MEMORY[0x263F1C550] grayColor];
        objc_msgSend(v56, "setBorderColor:", objc_msgSend(v57, "CGColor"));

        [v56 setBorderWidth:3.0];
        id v58 = [MEMORY[0x263F1C550] colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.25];
        objc_msgSend(v56, "setBackgroundColor:", objc_msgSend(v58, "CGColor"));

        v59 = [(JFXTextEffectEditorView *)v22 debugView];
        v60 = [v59 layer];
        [v60 addSublayer:v56];

        v61 = [MEMORY[0x263F157E8] layer];
        id v62 = [MEMORY[0x263F1C550] whiteColor];
        objc_msgSend(v61, "setBorderColor:", objc_msgSend(v62, "CGColor"));

        [v61 setBorderWidth:2.0];
        v63 = [(JFXTextEffectEditorView *)v22 debugView];
        v64 = [v63 layer];
        [v64 addSublayer:v61];
      }
    }
    v65 = [(JFXTextEffectEditorView *)v22 textEditingProperties];
    [(JFXTextEffectEditorView *)v22 applyTextEditingProperties:v65];

    v66 = (void *)[objc_alloc(MEMORY[0x263F1C6E0]) initWithDelegate:v22];
    [(JFXTextEffectEditorView *)v22 addInteraction:v66];
    v67 = [MEMORY[0x263F08C38] UUID];
    [(JFXTextEffectEditorView *)v22 setPencilTextEditingElementID:v67];
  }
  return v22;
}

- (JFXTextEffectEditorView)initWithFrame:(CGRect)a3 textEditingProperties:(id)a4
{
  return -[JFXTextEffectEditorView initWithFrame:textEditingProperties:textContainer:](self, "initWithFrame:textEditingProperties:textContainer:", a4, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)applyTextEditingProperties:(id)a3
{
  id v4 = a3;
  [(JFXTextEffectEditorView *)self setTextEditingProperties:v4];
  v5 = [(JFXTextEffectEditorView *)self editField];
  [v5 applyTextEditingProperties:v4];

  if (JFX_isDrawOverlayBoundsEnabled())
  {
    v6 = [(JFXTextEffectEditorView *)self debugOptions];
    int v7 = [v6 showTextBoundingBoxes];

    if (v7)
    {
      v8 = [(JFXTextEffectEditorView *)self editField];
      [v8 textFrameWithoutFudge];
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;
      double v17 = [(JFXTextEffectEditorView *)self debugView];
      objc_msgSend(v17, "setFrame:", v10, v12, v14, v16);

      double v18 = [(JFXTextEffectEditorView *)self editField];
      [v18 frame];
      double v20 = v19;
      double v22 = v21;

      double v24 = *MEMORY[0x263F00148];
      double v23 = *(double *)(MEMORY[0x263F00148] + 8);
      v25 = [(JFXTextEffectEditorView *)self debugView];
      v26 = [v25 layer];
      v27 = [v26 sublayers];
      v28 = [v27 objectAtIndexedSubscript:1];
      objc_msgSend(v28, "setFrame:", v24, v23, v20, v22);

      v29 = [(JFXTextEffectEditorView *)self editField];
      [v29 textContainerInset];
      double v31 = v30;
      double v33 = v32;
      double v35 = v34;
      double v37 = v36;

      id v41 = [(JFXTextEffectEditorView *)self debugView];
      v38 = [v41 layer];
      v39 = [v38 sublayers];
      v40 = [v39 objectAtIndexedSubscript:0];
      objc_msgSend(v40, "setFrame:", v24 + v33, v23 + v31, v20 - (v33 + v37), v22 - (v31 + v35));
    }
  }
}

- (void)selectAll
{
  id v2 = [(JFXTextEffectEditorView *)self editField];
  [v2 selectAll:0];
}

- (void)endEditing
{
  id v2 = [(JFXTextEffectEditorView *)self editField];
  [v2 resignFirstResponder];
}

- (NSString)text
{
  id v2 = [(JFXTextEffectEditorView *)self editField];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)indirectScribbleInteraction:(id)a3 requestElementsInRect:(CGRect)a4 completion:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v13[1] = *MEMORY[0x263EF8340];
  double v10 = (void (**)(id, void *))a5;
  [(JFXTextEffectEditorView *)self bounds];
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  if (CGRectContainsRect(v14, v15))
  {
    double v11 = [(JFXTextEffectEditorView *)self pencilTextEditingElementID];
    v13[0] = v11;
    double v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
    v10[2](v10, v12);
  }
  else
  {
    v10[2](v10, (void *)MEMORY[0x263EFFA68]);
  }
}

- (void)indirectScribbleInteraction:(id)a3 focusElementIfNeeded:(id)a4 referencePoint:(CGPoint)a5 completion:(id)a6
{
  double v12 = (void (**)(id, void *))a6;
  id v8 = a4;
  double v9 = [(JFXTextEffectEditorView *)self pencilTextEditingElementID];
  int v10 = [v8 isEqual:v9];

  if (v10)
  {
    double v11 = [(JFXTextEffectEditorView *)self editField];
    v12[2](v12, v11);
  }
  else
  {
    v12[2](v12, 0);
  }
}

- (BOOL)indirectScribbleInteraction:(id)a3 isElementFocused:(id)a4
{
  id v5 = a4;
  v6 = [(JFXTextEffectEditorView *)self pencilTextEditingElementID];
  char v7 = [v5 isEqual:v6];

  return v7;
}

- (CGRect)indirectScribbleInteraction:(id)a3 frameForElement:(id)a4
{
  id v5 = a4;
  v6 = [(JFXTextEffectEditorView *)self pencilTextEditingElementID];
  int v7 = [v5 isEqual:v6];

  if (v7)
  {
    [(JFXTextEffectEditorView *)self bounds];
  }
  else
  {
    double v8 = *MEMORY[0x263F001A0];
    double v9 = *(double *)(MEMORY[0x263F001A0] + 8);
    double v10 = *(double *)(MEMORY[0x263F001A0] + 16);
    double v11 = *(double *)(MEMORY[0x263F001A0] + 24);
  }
  result.size.CGFloat height = v11;
  result.size.CGFloat width = v10;
  result.origin.CGFloat y = v9;
  result.origin.CGFloat x = v8;
  return result;
}

- (JFXTextEffectEditorTextView)editField
{
  return self->_editField;
}

- (void)setEditField:(id)a3
{
}

- (UIView)transformView
{
  return self->_transformView;
}

- (void)setTransformView:(id)a3
{
}

- (JFXEffectTextEditingProperties)textEditingProperties
{
  return self->_textEditingProperties;
}

- (void)setTextEditingProperties:(id)a3
{
}

- (NSUUID)pencilTextEditingElementID
{
  return self->_pencilTextEditingElementID;
}

- (void)setPencilTextEditingElementID:(id)a3
{
}

- (JFXOverlayEffectDebugViewOptions)debugOptions
{
  return self->_debugOptions;
}

- (void)setDebugOptions:(id)a3
{
}

- (UIView)debugView
{
  return self->_debugView;
}

- (void)setDebugView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugView, 0);
  objc_storeStrong((id *)&self->_debugOptions, 0);
  objc_storeStrong((id *)&self->_pencilTextEditingElementID, 0);
  objc_storeStrong((id *)&self->_textEditingProperties, 0);
  objc_storeStrong((id *)&self->_transformView, 0);
  objc_storeStrong((id *)&self->_editField, 0);
}

@end