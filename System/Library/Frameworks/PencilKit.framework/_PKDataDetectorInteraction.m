@interface _PKDataDetectorInteraction
- (BOOL)handleTapAtPoint:(CGPoint)a3;
- (BOOL)isEnabled;
- (CGAffineTransform)drawingTransform;
- (CGAffineTransform)highlightPreviewTransform;
- (CGAffineTransform)highlightTransform;
- (CGRect)sourceRect;
- (UIContextMenuInteraction)menuInteraction;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (UIView)view;
- (_PKDataDetectorController)dataDetectorController;
- (_PKDataDetectorInteraction)initWithRecognitionController:(id)a3;
- (id)_contextMenuInteraction:(id)a3 overrideSuggestedActionsForConfiguration:(id)a4;
- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)dataDetectorHitTest:(CGPoint)a3;
- (id)itemWithIdentifier:(id)a3;
- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)didMoveToView:(id)a3;
- (void)setDrawingTransform:(CGAffineTransform *)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlightPreviewTransform:(CGAffineTransform *)a3;
- (void)setHighlightTransform:(CGAffineTransform *)a3;
- (void)setSourceRect:(CGRect)a3;
- (void)setView:(id)a3;
- (void)tapHandler:(id)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation _PKDataDetectorInteraction

- (_PKDataDetectorInteraction)initWithRecognitionController:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_PKDataDetectorInteraction;
  v6 = [(_PKDataDetectorInteraction *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_recognitionController, a3);
    uint64_t v8 = [v5 dataDetectorController];
    dataDetectorController = v7->_dataDetectorController;
    v7->_dataDetectorController = (_PKDataDetectorController *)v8;

    uint64_t v10 = MEMORY[0x1E4F1DAB8];
    long long v11 = *MEMORY[0x1E4F1DAB8];
    long long v12 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v7->_drawingTransform.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v7->_drawingTransform.c = v12;
    long long v13 = *(_OWORD *)(v10 + 32);
    *(_OWORD *)&v7->_drawingTransform.tx = v13;
    *(_OWORD *)&v7->_highlightTransform.a = v11;
    *(_OWORD *)&v7->_highlightTransform.c = v12;
    *(_OWORD *)&v7->_highlightTransform.tx = v13;
    *(_OWORD *)&v7->_highlightPreviewTransform.tx = v13;
    *(_OWORD *)&v7->_highlightPreviewTransform.a = v11;
    *(_OWORD *)&v7->_highlightPreviewTransform.c = v12;
    CGPoint v14 = (CGPoint)*MEMORY[0x1E4F1DB20];
    v7->_sourceRect.size = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v7->_sourceRect.origin = v14;
  }

  return v7;
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled == a3) {
    return;
  }
  BOOL v3 = a3;
  self->_enabled = a3;
  -[UITapGestureRecognizer setEnabled:](self->_tapGestureRecognizer, "setEnabled:");
  id v5 = [(_PKDataDetectorInteraction *)self view];
  if (!v5 || !v3)
  {

    if (v3) {
      return;
    }
    goto LABEL_8;
  }
  menuInteraction = self->_menuInteraction;

  if (menuInteraction)
  {
    if (v3) {
      return;
    }
LABEL_8:
    if (!self->_menuInteraction) {
      return;
    }
    v7 = [(_PKDataDetectorInteraction *)self view];
    [v7 removeInteraction:self->_menuInteraction];

    uint64_t v8 = self->_menuInteraction;
    self->_menuInteraction = 0;
    goto LABEL_12;
  }
  v9 = (UIContextMenuInteraction *)[objc_alloc(MEMORY[0x1E4FB1680]) initWithDelegate:self];
  uint64_t v10 = self->_menuInteraction;
  self->_menuInteraction = v9;

  long long v11 = [(_PKDataDetectorInteraction *)self view];
  [(UIContextMenuInteraction *)v11 addInteraction:self->_menuInteraction];
  uint64_t v8 = v11;
LABEL_12:
}

- (void)willMoveToView:(id)a3
{
  uint64_t v4 = [(_PKDataDetectorInteraction *)self view];
  if (v4)
  {
    id v5 = (void *)v4;
    v6 = [(_PKDataDetectorInteraction *)self menuInteraction];

    if (v6)
    {
      v7 = [(_PKDataDetectorInteraction *)self view];
      uint64_t v8 = [(_PKDataDetectorInteraction *)self menuInteraction];
      [v7 removeInteraction:v8];

      menuInteraction = self->_menuInteraction;
      self->_menuInteraction = 0;
    }
  }
}

- (void)didMoveToView:(id)a3
{
  id v9 = a3;
  [(_PKDataDetectorInteraction *)self setView:v9];
  uint64_t v4 = v9;
  if (v9)
  {
    if ([(_PKDataDetectorInteraction *)self isEnabled])
    {
      id v5 = (UIContextMenuInteraction *)[objc_alloc(MEMORY[0x1E4FB1680]) initWithDelegate:self];
      menuInteraction = self->_menuInteraction;
      self->_menuInteraction = v5;

      [v9 addInteraction:self->_menuInteraction];
    }
    v7 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_tapHandler_];
    tapGestureRecognizer = self->_tapGestureRecognizer;
    self->_tapGestureRecognizer = v7;

    [(UITapGestureRecognizer *)self->_tapGestureRecognizer setEnabled:[(_PKDataDetectorInteraction *)self isEnabled]];
    [v9 addGestureRecognizer:self->_tapGestureRecognizer];
    uint64_t v4 = v9;
  }
}

- (id)dataDetectorHitTest:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v4 = [(_PKDataDetectorInteraction *)self view];
  if ([v4 isHidden])
  {
  }
  else
  {
    id v5 = [(_PKDataDetectorInteraction *)self view];
    [v5 alpha];
    double v7 = v6;

    if (v7 > 0.0)
    {
      memset(&v13, 0, sizeof(v13));
      [(_PKDataDetectorInteraction *)self drawingTransform];
      CGAffineTransformInvert(&v13, &v12);
      uint64_t v8 = [(_PKDataDetectorController *)self->_dataDetectorController hitTest:vaddq_f64(*(float64x2_t *)&v13.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v13.c, y), *(float64x2_t *)&v13.a, x))];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_7;
      }
    }
  }
  uint64_t v8 = 0;
LABEL_7:

  return v8;
}

- (id)itemWithIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [(_PKDataDetectorController *)self->_dataDetectorController currentItems];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v10;
          CGAffineTransform v12 = [v11 identifier];
          char v13 = [v12 isEqualToString:v4];

          if (v13) {
            goto LABEL_12;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
  id v11 = 0;
LABEL_12:

  return v11;
}

- (void)tapHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(_PKDataDetectorInteraction *)self view];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  -[_PKDataDetectorInteraction handleTapAtPoint:](self, "handleTapAtPoint:", v7, v9);
}

- (BOOL)handleTapAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = -[_PKDataDetectorInteraction dataDetectorHitTest:](self, "dataDetectorHitTest:");
  double v7 = v6;
  if (v6)
  {
    memset(&v21, 0, sizeof(v21));
    [v6 _frame];
    CGFloat v9 = v8;
    [v7 _frame];
    CGAffineTransformMakeTranslation(&v21, v9, v10);
    id v11 = [(_PKDataDetectorInteraction *)self menuInteraction];
    CGAffineTransform v12 = [(_PKDataDetectorInteraction *)self view];
    [(_PKDataDetectorInteraction *)self drawingTransform];
    [(_PKDataDetectorInteraction *)self highlightTransform];
    [(_PKDataDetectorInteraction *)self sourceRect];
    CGAffineTransform v18 = v21;
    objc_msgSend(v7, "handleTapForMenuForInteraction:location:view:viewTransform:drawingTransform:highlightTransform:sourceRect:", v11, v12, &v18, v20, v19, x, y, v13, v14, v15, v16);
  }
  return v7 != 0;
}

- (id)_contextMenuInteraction:(id)a3 overrideSuggestedActionsForConfiguration:(id)a4
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v7 = [(_PKDataDetectorInteraction *)self dataDetectorHitTest:a3];
  double v8 = [(_PKDataDetectorInteraction *)self menuInteraction];
  CGFloat v9 = [(_PKDataDetectorInteraction *)self view];
  CGFloat v10 = [v7 identifier];
  [(_PKDataDetectorInteraction *)self sourceRect];
  double v15 = objc_msgSend(v7, "contextMenuInteraction:configurationForMenuAtLocation:view:identifier:sourceRect:", v8, v9, v10, x, y, v11, v12, v13, v14);

  return v15;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  CGFloat v10 = [(_PKDataDetectorInteraction *)self itemWithIdentifier:a5];
  [v10 _frame];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  [(_PKDataDetectorInteraction *)self highlightPreviewTransform];
  v28.origin.double x = v12;
  v28.origin.double y = v14;
  v28.size.double width = v16;
  v28.size.double height = v18;
  CGRect v29 = CGRectApplyAffineTransform(v28, &v26);
  double x = v29.origin.x;
  double y = v29.origin.y;
  double width = v29.size.width;
  double height = v29.size.height;
  v23 = [(_PKDataDetectorInteraction *)self view];
  v24 = objc_msgSend(v10, "contextMenuInteraction:configuration:highlightPreviewInContainerView:frame:", v9, v8, v23, x, y, width, height);

  return v24;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  double v11 = [v9 identifier];
  id v12 = [(_PKDataDetectorInteraction *)self itemWithIdentifier:v11];

  [v12 contextMenuInteraction:v10 willPerformPreviewActionForMenuWithConfiguration:v9 animator:v8];
}

- (_PKDataDetectorController)dataDetectorController
{
  return self->_dataDetectorController;
}

- (UIContextMenuInteraction)menuInteraction
{
  return self->_menuInteraction;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (CGAffineTransform)drawingTransform
{
  long long v3 = *(_OWORD *)&self[2].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[2].d;
  return self;
}

- (void)setDrawingTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_drawingTransform.tdouble x = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_drawingTransform.c = v4;
  *(_OWORD *)&self->_drawingTransform.a = v3;
}

- (CGAffineTransform)highlightTransform
{
  long long v3 = *(_OWORD *)&self[3].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[2].ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[3].d;
  return self;
}

- (void)setHighlightTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_highlightTransform.tdouble x = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_highlightTransform.c = v4;
  *(_OWORD *)&self->_highlightTransform.a = v3;
}

- (CGAffineTransform)highlightPreviewTransform
{
  long long v3 = *(_OWORD *)&self[4].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[3].ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[4].d;
  return self;
}

- (void)setHighlightPreviewTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_highlightPreviewTransform.tdouble x = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_highlightPreviewTransform.c = v4;
  *(_OWORD *)&self->_highlightPreviewTransform.a = v3;
}

- (CGRect)sourceRect
{
  double x = self->_sourceRect.origin.x;
  double y = self->_sourceRect.origin.y;
  double width = self->_sourceRect.size.width;
  double height = self->_sourceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSourceRect:(CGRect)a3
{
  self->_sourceRect = a3;
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  return (UIView *)WeakRetained;
}

- (void)setView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_menuInteraction, 0);
  objc_storeStrong((id *)&self->_dataDetectorController, 0);

  objc_storeStrong((id *)&self->_recognitionController, 0);
}

@end