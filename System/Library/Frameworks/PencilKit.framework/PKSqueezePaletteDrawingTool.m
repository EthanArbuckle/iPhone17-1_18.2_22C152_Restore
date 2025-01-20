@interface PKSqueezePaletteDrawingTool
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGAffineTransform)_makeTransformForPointerInteractionVisible:(int)a3;
- (id)initWithTool:(void *)a1;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (uint64_t)resetPointerInteractionTransform;
- (void)_updateUI;
- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5;
- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5;
- (void)setDragging:(uint64_t)a1;
- (void)setSelected:(BOOL)a3;
- (void)setSelected:(int)a3 animated:(void *)a4 completion:;
- (void)setTool:(uint64_t)a1;
@end

@implementation PKSqueezePaletteDrawingTool

- (id)initWithTool:(void *)a1
{
  v39[6] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    v38.receiver = a1;
    v38.super_class = (Class)PKSqueezePaletteDrawingTool;
    id v4 = objc_msgSendSuper2(&v38, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    if (v4)
    {
      uint64_t v5 = [v3 copy];
      id v37 = v3;
      v6 = (void *)*((void *)v4 + 102);
      *((void *)v4 + 102) = v5;

      *((void *)v4 + 96) = PKSqueezePaletteToolWidth;
      v7 = objc_alloc_init(PKPaletteToolViewFactory);
      v8 = (void *)*((void *)v4 + 94);
      *((void *)v4 + 94) = v7;

      *((void *)v4 + 97) = 0;
      id v9 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      v10 = (void *)*((void *)v4 + 95);
      *((void *)v4 + 95) = v9;

      [*((id *)v4 + 95) setUserInteractionEnabled:0];
      [*((id *)v4 + 95) setTranslatesAutoresizingMaskIntoConstraints:0];
      v11 = [*((id *)v4 + 95) layer];
      [v11 setMasksToBounds:0];

      [v4 addSubview:*((void *)v4 + 95)];
      uint64_t v12 = -[PKPaletteToolViewFactory makePaletteToolViewForTool:](*((void *)v4 + 94), *((void **)v4 + 102));
      v13 = (void *)*((void *)v4 + 93);
      *((void *)v4 + 93) = v12;

      [*((id *)v4 + 93) setUserInteractionEnabled:0];
      [*((id *)v4 + 93) setEdgeLocation:4];
      [*((id *)v4 + 93) setSelected:1];
      [*((id *)v4 + 93) setTranslatesAutoresizingMaskIntoConstraints:0];
      [*((id *)v4 + 95) addSubview:*((void *)v4 + 93)];
      uint64_t v14 = [objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:v4];
      v15 = (void *)*((void *)v4 + 99);
      *((void *)v4 + 99) = v14;

      [v4 addInteraction:*((void *)v4 + 99)];
      v16 = [*((id *)v4 + 95) topAnchor];
      v17 = [v4 topAnchor];
      uint64_t v18 = [v16 constraintEqualToAnchor:v17 constant:*((double *)v4 + 97)];
      v19 = (void *)*((void *)v4 + 98);
      *((void *)v4 + 98) = v18;

      v31 = (void *)MEMORY[0x1E4F28DC8];
      v39[0] = *((void *)v4 + 98);
      v36 = [*((id *)v4 + 95) bottomAnchor];
      v35 = [v4 bottomAnchor];
      v34 = [v36 constraintEqualToAnchor:v35 constant:*(double *)&PKSqueezePaletteToolHoverOffsetY];
      v39[1] = v34;
      v33 = [*((id *)v4 + 95) widthAnchor];
      v32 = [v4 widthAnchor];
      v30 = [v33 constraintEqualToAnchor:v32];
      v39[2] = v30;
      v20 = [*((id *)v4 + 93) topAnchor];
      v21 = [*((id *)v4 + 95) topAnchor];
      v22 = [v20 constraintEqualToAnchor:v21];
      v39[3] = v22;
      v23 = [*((id *)v4 + 93) centerXAnchor];
      v24 = [*((id *)v4 + 95) centerXAnchor];
      v25 = [v23 constraintEqualToAnchor:v24];
      v39[4] = v25;
      v26 = [*((id *)v4 + 93) widthAnchor];
      v27 = [v26 constraintEqualToConstant:*((double *)v4 + 96)];
      v39[5] = v27;
      v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:6];
      [v31 activateConstraints:v28];

      id v3 = v37;
      objc_msgSend(v4, "setHitTestInsets:", -16.0, 0.0, -10.0, 0.0);
      -[PKSqueezePaletteDrawingTool _updateUI]((uint64_t)v4);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)_updateUI
{
  if (a1)
  {
    BOOL v2 = ([(id)a1 isSelected] & 1) == 0 && *(unsigned char *)(a1 + 800) == 0;
    [*(id *)(a1 + 792) setEnabled:v2];
    if (*(unsigned char *)(a1 + 800)) {
      -[PKSqueezePaletteDrawingTool resetPointerInteractionTransform](a1);
    }
    int v3 = [(id)a1 isSelected];
    double v4 = 8.0;
    if (v3) {
      double v4 = -16.0;
    }
    *(double *)(a1 + 776) = v4;
    objc_msgSend(*(id *)(a1 + 784), "setConstant:");
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [*(id *)(a1 + 744) _setOverrideLabelCenterOffsetYHandler:&__block_literal_global_15];
    }
    [*(id *)(a1 + 744) setColorUserInterfaceStyle:*(void *)(a1 + 824)];
    uint64_t v5 = NSString;
    v6 = [*(id *)(a1 + 744) toolName];
    v7 = [v5 stringWithFormat:@"MiniPalette-Tool-%@", v6];
    [(id)a1 setAccessibilityIdentifier:v7];

    id v8 = [*(id *)(a1 + 744) toolName];
    [(id)a1 setAccessibilityLabel:v8];
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  [(PKSqueezePaletteDrawingTool *)self hitTestInsets];
  if (v11 == *(double *)(MEMORY[0x1E4FB2848] + 8)
    && v8 == *MEMORY[0x1E4FB2848]
    && v10 == *(double *)(MEMORY[0x1E4FB2848] + 24)
    && v9 == *(double *)(MEMORY[0x1E4FB2848] + 16))
  {
    v32.receiver = self;
    v32.super_class = (Class)PKSqueezePaletteDrawingTool;
    BOOL v29 = -[PKSqueezePaletteDrawingTool pointInside:withEvent:](&v32, sel_pointInside_withEvent_, v7, x, y);
  }
  else
  {
    [(PKSqueezePaletteDrawingTool *)self bounds];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    [(PKSqueezePaletteDrawingTool *)self hitTestInsets];
    CGFloat v24 = v18 + v23;
    CGFloat v27 = v20 - (v25 + v26);
    v34.size.height = v22 - (v23 + v28);
    v34.origin.double x = v16 + v25;
    v34.origin.double y = v24;
    v34.size.width = v27;
    v33.double x = x;
    v33.double y = y;
    BOOL v29 = CGRectContainsPoint(v34, v33);
  }
  BOOL v30 = v29;

  return v30;
}

- (void)setSelected:(BOOL)a3
{
}

- (void)setSelected:(int)a3 animated:(void *)a4 completion:
{
  id v7 = a4;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)PKSqueezePaletteDrawingTool;
    objc_msgSendSuper2(&v9, sel_setSelected_, a2);
    -[PKSqueezePaletteDrawingTool _updateUI]((uint64_t)a1);
    if (a3)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __63__PKSqueezePaletteDrawingTool_setSelected_animated_completion___block_invoke;
      v8[3] = &unk_1E64C61C0;
      v8[4] = a1;
      +[PKPaletteToolViewAnimation performSelectionAnimations:completion:]((uint64_t)PKPaletteToolViewAnimation, v8, v7);
    }
  }
}

uint64_t __63__PKSqueezePaletteDrawingTool_setSelected_animated_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)setTool:(uint64_t)a1
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  uint64_t v5 = v4;
  if (a1)
  {
    if (!v4)
    {
      id v17 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Tool parameter can not be nil." userInfo:0];
      objc_exception_throw(v17);
    }
    if (*(id *)(a1 + 816) != v4)
    {
      objc_storeStrong((id *)(a1 + 816), a2);
      [*(id *)(a1 + 744) removeFromSuperview];
      v6 = *(void **)(a1 + 744);
      *(void *)(a1 + 744) = 0;

      uint64_t v7 = -[PKPaletteToolViewFactory makePaletteToolViewForTool:](*(void *)(a1 + 752), *(void **)(a1 + 816));
      double v8 = *(void **)(a1 + 744);
      *(void *)(a1 + 744) = v7;

      [*(id *)(a1 + 744) setUserInteractionEnabled:0];
      [*(id *)(a1 + 744) setEdgeLocation:4];
      [*(id *)(a1 + 744) setSelected:1];
      [*(id *)(a1 + 744) setTranslatesAutoresizingMaskIntoConstraints:0];
      [*(id *)(a1 + 760) addSubview:*(void *)(a1 + 744)];
      double v18 = (void *)MEMORY[0x1E4F28DC8];
      double v19 = [*(id *)(a1 + 744) topAnchor];
      objc_super v9 = [*(id *)(a1 + 760) topAnchor];
      double v10 = [v19 constraintEqualToAnchor:v9];
      v20[0] = v10;
      double v11 = [*(id *)(a1 + 744) centerXAnchor];
      uint64_t v12 = [*(id *)(a1 + 760) centerXAnchor];
      v13 = [v11 constraintEqualToAnchor:v12];
      v20[1] = v13;
      uint64_t v14 = [*(id *)(a1 + 744) widthAnchor];
      double v15 = [v14 constraintEqualToConstant:*(double *)(a1 + 768)];
      v20[2] = v15;
      double v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
      [v18 activateConstraints:v16];

      -[PKSqueezePaletteDrawingTool _updateUI](a1);
    }
  }
}

- (void)setDragging:(uint64_t)a1
{
  if (a1 && *(unsigned __int8 *)(a1 + 800) != a2)
  {
    *(unsigned char *)(a1 + 800) = a2;
    [*(id *)(a1 + 792) invalidate];
    -[PKSqueezePaletteDrawingTool _updateUI](a1);
  }
}

- (uint64_t)resetPointerInteractionTransform
{
  if (result)
  {
    uint64_t v1 = result;
    result = [(id)result isSelected];
    if ((result & 1) == 0)
    {
      v2[0] = MEMORY[0x1E4F143A8];
      v2[1] = 3221225472;
      v2[2] = __63__PKSqueezePaletteDrawingTool_resetPointerInteractionTransform__block_invoke;
      v2[3] = &unk_1E64C61C0;
      v2[4] = v1;
      return [MEMORY[0x1E4FB1EB0] _performWithoutRetargetingAnimations:v2];
    }
  }
  return result;
}

uint64_t __63__PKSqueezePaletteDrawingTool_resetPointerInteractionTransform__block_invoke(uint64_t a1)
{
  [(PKSqueezePaletteDrawingTool *)&v5 _makeTransformForPointerInteractionVisible:0];
  BOOL v2 = *(void **)(a1 + 32);
  CGAffineTransform v4 = v5;
  return [v2 setTransform:&v4];
}

- (CGAffineTransform)_makeTransformForPointerInteractionVisible:(int)a3
{
  int v3 = result;
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained(a2 + 101);
    [WeakRetained toolAngle:a2];
    long double v8 = v7;

    if (a3) {
      double v9 = *(double *)&PKSqueezePaletteToolHoverOffsetY;
    }
    else {
      double v9 = -*(double *)&PKSqueezePaletteToolHoverOffsetY;
    }
    *(_OWORD *)&v3->a = 0u;
    *(_OWORD *)&v3->c = 0u;
    *(_OWORD *)&v3->tdouble x = 0u;
    [a2 transform];
    long double v10 = sin(v8);
    return CGAffineTransformTranslate(v3, &v11, 0.0, v10 * v9);
  }
  else
  {
    *(_OWORD *)&result->c = 0u;
    *(_OWORD *)&result->tdouble x = 0u;
    *(_OWORD *)&result->a = 0u;
  }
  return result;
}

double __40__PKSqueezePaletteDrawingTool__updateUI__block_invoke()
{
  return *(double *)&PKSqueezePaletteHandwritingToolOverrideLabelCenterOffsetY;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  id v7 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75__PKSqueezePaletteDrawingTool_pointerInteraction_willEnterRegion_animator___block_invoke;
  v9[3] = &unk_1E64C5F60;
  id v10 = v7;
  CGAffineTransform v11 = self;
  id v8 = v7;
  [a5 addAnimations:v9];
}

void __75__PKSqueezePaletteDrawingTool_pointerInteraction_willEnterRegion_animator___block_invoke(uint64_t a1)
{
  [(PKSqueezePaletteDrawingTool *)&v4 _makeTransformForPointerInteractionVisible:1];
  BOOL v2 = [*(id *)(a1 + 32) view];
  CGAffineTransform v3 = v4;
  [v2 setTransform:&v3];
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  id v7 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__PKSqueezePaletteDrawingTool_pointerInteraction_willExitRegion_animator___block_invoke;
  v9[3] = &unk_1E64C5F60;
  id v10 = v7;
  CGAffineTransform v11 = self;
  id v8 = v7;
  [a5 addAnimations:v9];
}

void __74__PKSqueezePaletteDrawingTool_pointerInteraction_willExitRegion_animator___block_invoke(uint64_t a1)
{
  [(PKSqueezePaletteDrawingTool *)&v4 _makeTransformForPointerInteractionVisible:0];
  BOOL v2 = [*(id *)(a1 + 32) view];
  CGAffineTransform v3 = v4;
  [v2 setTransform:&v3];
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E4FB1AE8], "systemPointerStyle", a3, a4);
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  objc_msgSend(a5, "rect", a3, a4);
  CGAffineTransform v5 = (void *)MEMORY[0x1E4FB1AD8];

  return (id)objc_msgSend(v5, "regionWithRect:identifier:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tool, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_toolTopConstraint, 0);
  objc_storeStrong((id *)&self->_clippingView, 0);
  objc_storeStrong((id *)&self->_factory, 0);

  objc_storeStrong((id *)&self->_toolView, 0);
}

@end