@interface PKSqueezePaletteViewExpandedLassoToolLayout
- (PKSqueezePaletteView)paletteView;
- (id)initWithContext:(id *)a1;
- (void)_performDrawingToolTapAction:(uint64_t)a1;
- (void)handlePencilInteractionDidTap:(int64_t)a3;
- (void)setPaletteView:(id)a3;
- (void)setupUI;
- (void)updateUI;
- (void)willTransitionToLayout:(id)a3;
@end

@implementation PKSqueezePaletteViewExpandedLassoToolLayout

- (id)initWithContext:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)PKSqueezePaletteViewExpandedLassoToolLayout;
    v5 = (id *)objc_msgSendSuper2(&v13, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong(v5 + 9, a2);
      *((double *)a1 + 4) = PKSqueezePaletteButtonSize();
      a1[5] = v6;
      a1[6] = (id)PKSqueezePaletteButtonInterItemSpacing;
      v7 = [PKFloatArray alloc];
      v8 = a1[9];
      if (v8) {
        v8 = (void *)v8[3];
      }
      v9 = v8;
      v10 = -[PKFloatArray initWithCapacity:](v7, [v9 count]);
      id v11 = a1[7];
      a1[7] = v10;
    }
  }

  return a1;
}

- (void)_performDrawingToolTapAction:(uint64_t)a1
{
  if (a1)
  {
    v2 = *(void **)(a1 + 72);
    if (v2) {
      v2 = (void *)v2[4];
    }
    id v4 = v2;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    -[PKSqueezePaletteView setCurrentLayout:]((uint64_t)WeakRetained, v4);
  }
}

- (void)setupUI
{
  v64[2] = *MEMORY[0x1E4F143B8];
  p_paletteView = &self->_paletteView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);

  if (WeakRetained)
  {
    context = self->_context;
    if (context) {
      context = (PKSqueezePaletteViewExpandedLassoToolLayoutContext *)context->_drawingTool;
    }
    v6 = context;
    [(PKSqueezePaletteViewExpandedLassoToolLayoutContext *)v6 addTarget:self action:sel__didTapDrawingTool_ forControlEvents:64];

    objc_initWeak(&location, self);
    v7 = self->_context;
    if (v7) {
      v7 = (PKSqueezePaletteViewExpandedLassoToolLayoutContext *)v7->_drawingTool;
    }
    v8 = v7;
    objc_initWeak(&from, v8);

    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __54__PKSqueezePaletteViewExpandedLassoToolLayout_setupUI__block_invoke;
    v59[3] = &unk_1E64C6A38;
    objc_copyWeak(&v60, &from);
    objc_copyWeak(&v61, &location);
    v9 = self->_context;
    if (v9) {
      v9 = (PKSqueezePaletteViewExpandedLassoToolLayoutContext *)v9->_drawingTool;
    }
    v10 = v9;
    [(PKSqueezePaletteViewExpandedLassoToolLayoutContext *)v10 _set_pk_longSqueezeAction:v59];

    id v11 = self->_context;
    if (v11) {
      id v11 = (PKSqueezePaletteViewExpandedLassoToolLayoutContext *)v11->_drawingTool;
    }
    v12 = v11;
    objc_super v13 = [(PKSqueezePaletteViewExpandedLassoToolLayoutContext *)v12 centerXAnchor];
    id v14 = objc_loadWeakRetained((id *)p_paletteView);
    v15 = [v14 centerXAnchor];
    v16 = [v13 constraintEqualToAnchor:v15];
    lassoToolCenterXConstraint = self->_lassoToolCenterXConstraint;
    self->_lassoToolCenterXConstraint = v16;

    v18 = self->_context;
    if (v18) {
      v18 = (PKSqueezePaletteViewExpandedLassoToolLayoutContext *)v18->_drawingTool;
    }
    v19 = v18;
    v20 = [(PKSqueezePaletteViewExpandedLassoToolLayoutContext *)v19 centerYAnchor];
    id v21 = objc_loadWeakRetained((id *)p_paletteView);
    v22 = [v21 centerYAnchor];
    v23 = [v20 constraintEqualToAnchor:v22];
    lassoToolCenterYConstraint = self->_lassoToolCenterYConstraint;
    self->_lassoToolCenterYConstraint = v23;

    v25 = (double *)objc_loadWeakRetained((id *)p_paletteView);
    v26 = v25;
    double toolAngle = 0.0;
    double v28 = 0.0;
    if (v25) {
      double v28 = v25[62];
    }
    v29 = self->_context;
    if (v29) {
      double toolAngle = v29->_toolAngle;
    }
    double v30 = PKPointOnArc(*MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v28, toolAngle);
    double v32 = v31;

    [(NSLayoutConstraint *)self->_lassoToolCenterXConstraint setConstant:v30];
    [(NSLayoutConstraint *)self->_lassoToolCenterYConstraint setConstant:v32];
    v33 = self->_context;
    if (v33) {
      v33 = (PKSqueezePaletteViewExpandedLassoToolLayoutContext *)v33->_barButtonItems;
    }
    v34 = (void *)MEMORY[0x1E4F1CA48];
    v35 = v33;
    v36 = objc_msgSend(v34, "arrayWithCapacity:", -[PKSqueezePaletteViewExpandedLassoToolLayoutContext count](v35, "count"));

    uint64_t v55 = 0;
    v56 = (double *)&v55;
    uint64_t v57 = 0x2020000000;
    double v58 = 0.0;
    v37 = self->_context;
    if (v37)
    {
      double v58 = v37->_toolAngle;
      v37 = (PKSqueezePaletteViewExpandedLassoToolLayoutContext *)v37->_barButtonItems;
    }
    v38 = v37;
    uint64_t v48 = MEMORY[0x1E4F143A8];
    uint64_t v49 = 3221225472;
    v50 = __54__PKSqueezePaletteViewExpandedLassoToolLayout_setupUI__block_invoke_2;
    v51 = &unk_1E64CAA40;
    id v39 = v36;
    id v52 = v39;
    v53 = self;
    v54 = &v55;
    [(PKSqueezePaletteViewExpandedLassoToolLayoutContext *)v38 enumerateObjectsUsingBlock:&v48];

    v40 = (NSArray *)objc_msgSend(v39, "copy", v48, v49, v50, v51);
    barButtons = self->_barButtons;
    self->_barButtons = v40;

    v42 = (void *)MEMORY[0x1E4F28DC8];
    v43 = self->_lassoToolCenterYConstraint;
    v64[0] = self->_lassoToolCenterXConstraint;
    v64[1] = v43;
    v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:2];
    [v42 activateConstraints:v44];

    v45 = self->_context;
    if (v45) {
      double v46 = v45->_toolAngle + 0.0523598776;
    }
    else {
      double v46 = 0.0523598776;
    }
    id v47 = objc_loadWeakRetained((id *)p_paletteView);
    -[PKSqueezePaletteView updateUIStartAngle:endAngle:clockwise:animated:]((uint64_t)v47, 1, 1, v56[3], v46);

    _Block_object_dispose(&v55, 8);
    objc_destroyWeak(&v61);
    objc_destroyWeak(&v60);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

void __54__PKSqueezePaletteViewExpandedLassoToolLayout_setupUI__block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)(a1 + 40));
    id v4 = objc_loadWeakRetained(v2);
    -[PKSqueezePaletteViewExpandedLassoToolLayout _performDrawingToolTapAction:]((uint64_t)v5);
  }
}

void __54__PKSqueezePaletteViewExpandedLassoToolLayout_setupUI__block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  v38[4] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = [[PKPaletteBarButton alloc] initWithBarButtonItem:v4];

  [*(id *)(a1 + 32) addObject:v5];
  [(PKPaletteBarButton *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 64));
  v7 = WeakRetained;
  if (WeakRetained) {
    v8 = (void *)*((void *)WeakRetained + 69);
  }
  else {
    v8 = 0;
  }
  id v9 = v8;
  [v9 addSubview:v5];

  v10 = [(PKPaletteBarButton *)v5 centerXAnchor];
  id v11 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 64));
  v12 = [v11 centerXAnchor];
  objc_super v13 = [v10 constraintEqualToAnchor:v12];

  id v14 = [(PKPaletteBarButton *)v5 centerYAnchor];
  id v15 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 64));
  v16 = [v15 centerYAnchor];
  v17 = [v14 constraintEqualToAnchor:v16];

  uint64_t v18 = *(void *)(a1 + 40);
  double v19 = *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  double v20 = *(double *)(v18 + 32);
  double v21 = *(double *)(v18 + 48);
  v22 = (double *)objc_loadWeakRetained((id *)(v18 + 64));
  double v23 = 0.0;
  double v24 = 0.0;
  if (v22) {
    double v24 = v22[62];
  }

  v25 = (double *)objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 64));
  v26 = v25;
  if (v25) {
    double v23 = v25[62];
  }
  double v27 = v19 - (v20 + v21) / v24;
  double v28 = PKPointOnArc(*MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v23, v27);
  double v30 = v29;

  [v13 setConstant:v28];
  [v17 setConstant:v30];
  double v31 = (void *)MEMORY[0x1E4F28DC8];
  v38[0] = v13;
  v38[1] = v17;
  double v32 = [(PKPaletteBarButton *)v5 heightAnchor];
  v33 = [v32 constraintEqualToConstant:*(double *)(*(void *)(a1 + 40) + 40)];
  v38[2] = v33;
  v34 = [(PKPaletteBarButton *)v5 widthAnchor];
  v35 = [v34 constraintEqualToConstant:*(double *)(*(void *)(a1 + 40) + 32)];
  v38[3] = v35;
  v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:4];
  [v31 activateConstraints:v36];

  -[PKFloatArray setFloat:atIndex:](*(void *)(*(void *)(a1 + 40) + 56), a3, v27);
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v27;
}

- (void)updateUI
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);

  if (WeakRetained)
  {
    context = self->_context;
    if (context) {
      context = (PKSqueezePaletteViewExpandedLassoToolLayoutContext *)context->_drawingTool;
    }
    id v5 = context;
    [(PKSqueezePaletteViewExpandedLassoToolLayoutContext *)v5 setAlpha:1.0];

    v6 = self->_context;
    if (v6)
    {
      CGAffineTransformMakeRotation(&v12, v6->_toolAngle + 1.57079633);
      drawingTool = v6->_drawingTool;
    }
    else
    {
      CGAffineTransformMakeRotation(&v12, 1.57079633);
      drawingTool = 0;
    }
    v8 = drawingTool;
    CGAffineTransform v11 = v12;
    [(PKSqueezePaletteDrawingTool *)v8 setTransform:&v11];

    barButtons = self->_barButtons;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __55__PKSqueezePaletteViewExpandedLassoToolLayout_updateUI__block_invoke;
    v10[3] = &unk_1E64CAA68;
    v10[4] = self;
    [(NSArray *)barButtons enumerateObjectsUsingBlock:v10];
  }
}

void __55__PKSqueezePaletteViewExpandedLassoToolLayout_updateUI__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 56);
  id v5 = a2;
  double v6 = -[PKFloatArray floatAtIndex:](v4, a3);
  CGAffineTransformMakeRotation(&v8, v6 + 1.57079633);
  CGAffineTransform v7 = v8;
  [v5 setTransform:&v7];
}

- (void)willTransitionToLayout:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  context = self->_context;
  if (context) {
    context = (PKSqueezePaletteViewExpandedLassoToolLayoutContext *)context->_drawingTool;
  }
  id v5 = context;
  [(PKSqueezePaletteViewExpandedLassoToolLayoutContext *)v5 removeTarget:self action:sel__didTapDrawingTool_ forControlEvents:64];

  double v6 = self->_context;
  if (v6) {
    double v6 = (PKSqueezePaletteViewExpandedLassoToolLayoutContext *)v6->_drawingTool;
  }
  CGAffineTransform v7 = v6;
  [(PKSqueezePaletteViewExpandedLassoToolLayoutContext *)v7 _set_pk_longSqueezeAction:0];

  CGAffineTransform v8 = (void *)MEMORY[0x1E4F28DC8];
  lassoToolCenterYConstraint = self->_lassoToolCenterYConstraint;
  v11[0] = self->_lassoToolCenterXConstraint;
  v11[1] = lassoToolCenterYConstraint;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  [v8 deactivateConstraints:v10];

  [(NSArray *)self->_barButtons makeObjectsPerformSelector:sel_removeFromSuperview];
}

- (void)handlePencilInteractionDidTap:(int64_t)a3
{
  context = self->_context;
  if (context) {
    context = (PKSqueezePaletteViewExpandedLassoToolLayoutContext *)context->_previousLayout;
  }
  double v6 = context;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);
  -[PKSqueezePaletteView setCurrentLayout:]((uint64_t)WeakRetained, v6);
}

- (PKSqueezePaletteView)paletteView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);

  return (PKSqueezePaletteView *)WeakRetained;
}

- (void)setPaletteView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_paletteView);
  objc_storeStrong((id *)&self->_barButtonAngles, 0);
  objc_storeStrong((id *)&self->_barButtons, 0);
  objc_storeStrong((id *)&self->_lassoToolCenterYConstraint, 0);

  objc_storeStrong((id *)&self->_lassoToolCenterXConstraint, 0);
}

@end