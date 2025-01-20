@interface PKSqueezePaletteViewExpandedEraserToolLayout
- (NSArray)layoutConstraints;
- (PKSqueezePaletteRoundedButton)lastTappedAttributeButton;
- (PKSqueezePaletteView)paletteView;
- (PKSqueezePaletteViewExpandedEraserToolLayoutContext)context;
- (void)_didTapAttributeButton:(id)a3;
- (void)_didTapDrawingTool:(id)a3;
- (void)handlePencilInteractionDidTap:(int64_t)a3;
- (void)initWithContext:(void *)a3 attributeButtons:;
- (void)setContext:(id)a3;
- (void)setLastTappedAttributeButton:(id)a3;
- (void)setLayoutConstraints:(id)a3;
- (void)setPaletteView:(id)a3;
- (void)setupUI;
- (void)updateUI;
- (void)willTransitionToLayout:(id)a3;
@end

@implementation PKSqueezePaletteViewExpandedEraserToolLayout

- (void)initWithContext:(void *)a3 attributeButtons:
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)PKSqueezePaletteViewExpandedEraserToolLayout;
    id v8 = objc_msgSendSuper2(&v12, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong((id *)v8 + 3, a2);
      uint64_t v9 = [v7 copy];
      v10 = (void *)a1[2];
      a1[2] = v9;
    }
  }

  return a1;
}

- (void)setupUI
{
  v46[2] = *MEMORY[0x1E4F143B8];
  p_paletteView = &self->_paletteView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);

  if (!WeakRetained) {
    return;
  }
  uint64_t v5 = [(PKSqueezePaletteViewExpandedEraserToolLayout *)self context];
  id v6 = (double *)v5;
  if (!v5)
  {
    id v7 = 0;
    double v8 = 0.0;
    if (self) {
      goto LABEL_4;
    }
LABEL_10:
    attributeButtons = 0;
    goto LABEL_5;
  }
  id v7 = *(id *)(v5 + 24);
  double v8 = v6[1];
  if (!self) {
    goto LABEL_10;
  }
LABEL_4:
  attributeButtons = self->_attributeButtons;
LABEL_5:
  v35 = attributeButtons;
  v10 = [v7 centerXAnchor];
  id v11 = objc_loadWeakRetained((id *)p_paletteView);
  objc_super v12 = [v11 centerXAnchor];
  v13 = [v10 constraintEqualToAnchor:v12];

  v14 = [v7 centerYAnchor];
  id v15 = objc_loadWeakRetained((id *)p_paletteView);
  v16 = [v15 centerYAnchor];
  v17 = [v14 constraintEqualToAnchor:v16];

  v18 = (double *)objc_loadWeakRetained((id *)p_paletteView);
  v19 = v18;
  if (v18) {
    double v20 = v18[62];
  }
  else {
    double v20 = 0.0;
  }
  double v21 = PKPointOnArc(*MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v20, v8);
  double v23 = v22;

  [v13 setConstant:v21];
  [v17 setConstant:v23];
  v24 = objc_opt_new();
  v46[0] = v13;
  v46[1] = v17;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2];
  [v24 addObjectsFromArray:v25];

  v26 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_attributeButtons, "count"));
  double v27 = PKSqueezePaletteButtonSize();
  v29 = v28;
  v30 = (void *)PKSqueezePaletteButtonInterItemSpacing;
  objc_initWeak(&location, self);
  uint64_t v41 = 0;
  v42 = (double *)&v41;
  uint64_t v43 = 0x2020000000;
  double v44 = v8;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __55__PKSqueezePaletteViewExpandedEraserToolLayout_setupUI__block_invoke;
  v36[3] = &unk_1E64CAF58;
  v36[4] = self;
  v39 = &v41;
  v40[1] = *(id *)&v27;
  v40[2] = v29;
  v40[3] = v30;
  id v31 = v24;
  id v37 = v31;
  id v32 = v26;
  id v38 = v32;
  objc_copyWeak(v40, &location);
  [(NSArray *)v35 enumerateObjectsUsingBlock:v36];
  [MEMORY[0x1E4F28DC8] activateConstraints:v31];
  v33 = (void *)[v31 copy];
  [(PKSqueezePaletteViewExpandedEraserToolLayout *)self setLayoutConstraints:v33];

  id v34 = objc_loadWeakRetained((id *)p_paletteView);
  -[PKSqueezePaletteView updateUIStartAngle:endAngle:clockwise:animated:]((uint64_t)v34, 1, 1, v42[3], v8);

  [v7 addTarget:self action:sel__didTapDrawingTool_ forControlEvents:64];
  objc_destroyWeak(v40);

  _Block_object_dispose(&v41, 8);
  objc_destroyWeak(&location);
}

void __55__PKSqueezePaletteViewExpandedEraserToolLayout_setupUI__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v41[4] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v4 addTarget:*(void *)(a1 + 32) action:sel__didTapAttributeButton_ forControlEvents:64];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v6 = WeakRetained;
  if (WeakRetained) {
    id v7 = (void *)*((void *)WeakRetained + 69);
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;
  [v8 addSubview:v4];

  uint64_t v9 = [v4 centerXAnchor];
  id v10 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v11 = [v10 centerXAnchor];
  objc_super v12 = [v9 constraintEqualToAnchor:v11];

  v13 = [v4 centerYAnchor];
  id v14 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v15 = [v14 centerYAnchor];
  v16 = [v13 constraintEqualToAnchor:v15];

  double v17 = *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  double v18 = *(double *)(a1 + 72) + *(double *)(a1 + 88);
  v19 = (double *)objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  double v20 = 0.0;
  double v21 = 0.0;
  if (v19) {
    double v21 = v19[62];
  }
  double v22 = v17 - v18 / v21;

  double v23 = (double *)objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  v24 = v23;
  if (v23) {
    double v20 = v23[62];
  }
  double v25 = PKPointOnArc(*MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v20, v22);
  double v27 = v26;

  [v12 setConstant:v25];
  [v16 setConstant:v27];
  v28 = *(void **)(a1 + 40);
  v41[0] = v12;
  v41[1] = v16;
  v29 = [v4 heightAnchor];
  v30 = [v29 constraintEqualToConstant:*(double *)(a1 + 80)];
  v41[2] = v30;
  id v31 = [v4 widthAnchor];
  id v32 = [v31 constraintEqualToConstant:*(double *)(a1 + 72)];
  v41[3] = v32;
  v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:4];
  [v28 addObjectsFromArray:v33];

  *(float *)&double v34 = v22;
  v35 = [NSNumber numberWithFloat:v34];
  [*(id *)(a1 + 48) setObject:v35 atIndexedSubscript:a3];

  *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v22;
  objc_initWeak(&location, v4);
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __55__PKSqueezePaletteViewExpandedEraserToolLayout_setupUI__block_invoke_2;
  v37[3] = &unk_1E64C6A38;
  objc_copyWeak(&v38, &location);
  objc_copyWeak(&v39, (id *)(a1 + 64));
  objc_msgSend(v4, "_set_pk_longSqueezeAction:", v37);
  objc_destroyWeak(&v39);
  objc_destroyWeak(&v38);
  objc_destroyWeak(&location);
}

void __55__PKSqueezePaletteViewExpandedEraserToolLayout_setupUI__block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  objc_copyWeak(&to, (id *)(a1 + 32));
  id v3 = objc_loadWeakRetained(&to);

  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v5 = objc_loadWeakRetained(v2);
    [WeakRetained _didTapAttributeButton:v5];
  }
  objc_destroyWeak(&to);
}

- (void)updateUI
{
  v2 = self;
  if (self) {
    self = (PKSqueezePaletteViewExpandedEraserToolLayout *)self->_attributeButtons;
  }
  [(PKSqueezePaletteViewExpandedEraserToolLayout *)self enumerateObjectsUsingBlock:&__block_literal_global_81];
  uint64_t v3 = [(PKSqueezePaletteViewExpandedEraserToolLayout *)v2 context];
  id v4 = (void *)v3;
  if (v3) {
    id v5 = *(void **)(v3 + 24);
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6) {
    id v7 = (void *)v6[102];
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;
  [v8 width];
  +[PKInkingTool _weightForWidth:type:](PKInkingTool, "_weightForWidth:type:", @"com.apple.ink.eraser");
  if (v2) {
    v2 = (PKSqueezePaletteViewExpandedEraserToolLayout *)v2->_attributeButtons;
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__PKSqueezePaletteViewExpandedEraserToolLayout_updateUI__block_invoke_2;
  v11[3] = &unk_1E64CAFA0;
  uint64_t v13 = v9;
  id v12 = v8;
  id v10 = v8;
  [(PKSqueezePaletteViewExpandedEraserToolLayout *)v2 enumerateObjectsUsingBlock:v11];
}

uint64_t __56__PKSqueezePaletteViewExpandedEraserToolLayout_updateUI__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSelected:0];
}

void __56__PKSqueezePaletteViewExpandedEraserToolLayout_updateUI__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = (double *)v9;
    id v7 = v6;
    if (v6) {
      double v8 = v6[93];
    }
    else {
      double v8 = 0.0;
    }
    if (vabdd_f64(v8, *(double *)(a1 + 40)) < 0.1)
    {
      [v6 setSelected:1];
      *a4 = 1;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && ![*(id *)(a1 + 32) eraserType])
    {
      [v9 setSelected:1];
      *a4 = 1;
    }
  }
}

- (void)willTransitionToLayout:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28DC8];
  id v5 = [(PKSqueezePaletteViewExpandedEraserToolLayout *)self layoutConstraints];
  [v4 deactivateConstraints:v5];

  if (self) {
    attributeButtons = self->_attributeButtons;
  }
  else {
    attributeButtons = 0;
  }
  [(NSArray *)attributeButtons makeObjectsPerformSelector:sel_removeFromSuperview];
  uint64_t v7 = [(PKSqueezePaletteViewExpandedEraserToolLayout *)self context];
  id v10 = (id)v7;
  if (v7) {
    double v8 = *(void **)(v7 + 24);
  }
  else {
    double v8 = 0;
  }
  id v9 = v8;
  [v9 removeTarget:self action:sel__didTapDrawingTool_ forControlEvents:64];
}

- (void)handlePencilInteractionDidTap:(int64_t)a3
{
  context = self->_context;
  if (context) {
    context = (PKSqueezePaletteViewExpandedEraserToolLayoutContext *)context->_previousLayout;
  }
  id v6 = context;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);
  -[PKSqueezePaletteView setCurrentLayout:]((uint64_t)WeakRetained, v6);
}

- (void)_didTapDrawingTool:(id)a3
{
  id v4 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "Drawing tool tapped", v10, 2u);
  }

  uint64_t v5 = [(PKSqueezePaletteViewExpandedEraserToolLayout *)self context];
  id v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = *(void **)(v5 + 16);
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);
  -[PKSqueezePaletteView setCurrentLayout:]((uint64_t)WeakRetained, v8);
}

- (void)_didTapAttributeButton:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = (double *)a3;
  uint64_t v5 = [(PKSqueezePaletteViewExpandedEraserToolLayout *)self lastTappedAttributeButton];

  if (v5 == v4)
  {
    uint64_t v15 = [(PKSqueezePaletteViewExpandedEraserToolLayout *)self context];
    id v9 = (void *)v15;
    if (v15) {
      v16 = *(void **)(v15 + 16);
    }
    else {
      v16 = 0;
    }
    id v11 = v16;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);
    -[PKSqueezePaletteView setCurrentLayout:]((uint64_t)WeakRetained, v11);
  }
  else
  {
    [(PKSqueezePaletteViewExpandedEraserToolLayout *)self setLastTappedAttributeButton:v4];
    uint64_t v6 = [(PKSqueezePaletteViewExpandedEraserToolLayout *)self context];
    uint64_t v7 = (void *)v6;
    if (v6) {
      id v8 = *(void **)(v6 + 24);
    }
    else {
      id v8 = 0;
    }
    id v9 = v8;

    if (v9) {
      id v10 = (void *)v9[102];
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (v4) {
        double v12 = v4[93];
      }
      else {
        double v12 = 0.0;
      }
      uint64_t v13 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 134217984;
        double v22 = v12;
        _os_log_impl(&dword_1C44F8000, v13, OS_LOG_TYPE_DEFAULT, "Tap stroke weight button %f", (uint8_t *)&v21, 0xCu);
      }

      id v14 = [[PKEraserTool alloc] initWithEraserType:2 weight:v12];
LABEL_19:
      v19 = v14;

      -[PKSqueezePaletteDrawingTool setTool:]((uint64_t)v9, v19);
      id v20 = objc_loadWeakRetained((id *)&self->_paletteView);
      -[PKSqueezePaletteView _didSelectTool:atIndex:]((uint64_t)v20, v19, 1);

      id v11 = v19;
      goto LABEL_20;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v18 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_1C44F8000, v18, OS_LOG_TYPE_DEFAULT, "Tap object eraser button", (uint8_t *)&v21, 2u);
      }

      id v14 = [[PKEraserTool alloc] initWithEraserType:0];
      goto LABEL_19;
    }
  }
LABEL_20:
}

- (PKSqueezePaletteView)paletteView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);

  return (PKSqueezePaletteView *)WeakRetained;
}

- (void)setPaletteView:(id)a3
{
}

- (PKSqueezePaletteViewExpandedEraserToolLayoutContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSArray)layoutConstraints
{
  return self->_layoutConstraints;
}

- (void)setLayoutConstraints:(id)a3
{
}

- (PKSqueezePaletteRoundedButton)lastTappedAttributeButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lastTappedAttributeButton);

  return (PKSqueezePaletteRoundedButton *)WeakRetained;
}

- (void)setLastTappedAttributeButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_lastTappedAttributeButton);
  objc_storeStrong((id *)&self->_layoutConstraints, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_attributeButtons, 0);

  objc_destroyWeak((id *)&self->_paletteView);
}

@end