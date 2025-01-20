@interface PKSqueezePaletteViewExpandedInkingToolLayout
- (NSArray)layoutConstraints;
- (PKAngularOpacitySlider)opacitySlider;
- (PKSqueezePaletteStrokeWeightButton)lastTappedStrokeWeightButton;
- (PKSqueezePaletteView)paletteView;
- (PKSqueezePaletteViewExpandedInkingToolLayoutContext)context;
- (void)_colorAlphaSliderUserDidChangeSlider:(id)a3;
- (void)_didTapDrawingTool:(id)a3;
- (void)_didTapStrokeWeightButton:(id)a3;
- (void)_updateToolUIStyle;
- (void)handlePencilInteractionDidTap:(int64_t)a3;
- (void)initWithContext:(void *)a3 strokeWeightButtons:;
- (void)setContext:(id)a3;
- (void)setLastTappedStrokeWeightButton:(id)a3;
- (void)setLayoutConstraints:(id)a3;
- (void)setOpacitySlider:(id)a3;
- (void)setPaletteView:(id)a3;
- (void)setStrokeWeightButtons:(id)a3;
- (void)setupUI;
- (void)updateUI;
- (void)willTransitionToLayout:(id)a3;
@end

@implementation PKSqueezePaletteViewExpandedInkingToolLayout

- (void)initWithContext:(void *)a3 strokeWeightButtons:
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)PKSqueezePaletteViewExpandedInkingToolLayout;
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
  v85[2] = *MEMORY[0x1E4F143B8];
  p_paletteView = &self->_paletteView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);

  if (WeakRetained)
  {
    uint64_t v5 = [(PKSqueezePaletteViewExpandedInkingToolLayout *)self context];
    v69 = (void *)v5;
    uint64_t v6 = v5;
    if (v5)
    {
      id v7 = *(id *)(v5 + 24);
      double v8 = *(double *)(v6 + 8);
      if (self)
      {
LABEL_4:
        strokeWeightButtons = self->_strokeWeightButtons;
        goto LABEL_5;
      }
    }
    else
    {
      id v7 = 0;
      double v8 = 0.0;
      if (self) {
        goto LABEL_4;
      }
    }
    strokeWeightButtons = 0;
LABEL_5:
    v70 = strokeWeightButtons;
    v10 = [v7 centerXAnchor];
    id v11 = objc_loadWeakRetained((id *)p_paletteView);
    objc_super v12 = [v11 centerXAnchor];
    v68 = [v10 constraintEqualToAnchor:v12];

    v13 = [v7 centerYAnchor];
    id v14 = objc_loadWeakRetained((id *)p_paletteView);
    v15 = [v14 centerYAnchor];
    v67 = [v13 constraintEqualToAnchor:v15];

    v16 = (double *)objc_loadWeakRetained((id *)p_paletteView);
    v17 = v16;
    if (v16) {
      double v18 = v16[62];
    }
    else {
      double v18 = 0.0;
    }
    double v19 = PKPointOnArc(*MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v18, v8);
    double v21 = v20;

    [v68 setConstant:v19];
    [v67 setConstant:v21];
    v71 = objc_opt_new();
    v85[0] = v68;
    v85[1] = v67;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v85 count:2];
    [v71 addObjectsFromArray:v22];

    v66 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](v70, "count"));
    uint64_t v23 = PKSqueezePaletteButtonInterItemSpacing;
    uint64_t v80 = 0;
    v81 = (double *)&v80;
    uint64_t v82 = 0x2020000000;
    double v83 = v8;
    if (v7) {
      v24 = (void *)v7[102];
    }
    else {
      v24 = 0;
    }
    id v25 = v24;
    v26 = [v25 _configuration];
    v27 = v26;
    if (v26 && ([v26 supportsStrokeWeight] & 1) != 0)
    {
      BOOL v28 = v27[16] == 0;

      if (!v28)
      {
        objc_initWeak(&location, self);
        v72[0] = MEMORY[0x1E4F143A8];
        v72[1] = 3221225472;
        v72[2] = __55__PKSqueezePaletteViewExpandedInkingToolLayout_setupUI__block_invoke;
        v72[3] = &unk_1E64C8DB8;
        v72[4] = self;
        v75 = &v80;
        int64x2_t v77 = vdupq_n_s64(0x4042800000000000uLL);
        uint64_t v78 = v23;
        id v73 = v71;
        id v74 = v66;
        objc_copyWeak(&v76, &location);
        [(NSArray *)v70 enumerateObjectsUsingBlock:v72];
        objc_destroyWeak(&v76);

        objc_destroyWeak(&location);
      }
    }
    else
    {
    }
    if (v7) {
      v29 = (void *)v7[102];
    }
    else {
      v29 = 0;
    }
    id v30 = v29;
    v31 = [v30 _configuration];
    v32 = v31;
    if (v31 && [v31 supportsOpacity])
    {
      BOOL v33 = v32[17] == 0;

      if (v33)
      {
LABEL_27:
        [MEMORY[0x1E4F28DC8] activateConstraints:v71];
        v54 = (void *)[v71 copy];
        [(PKSqueezePaletteViewExpandedInkingToolLayout *)self setLayoutConstraints:v54];

        id v55 = objc_loadWeakRetained((id *)p_paletteView);
        -[PKSqueezePaletteView updateUIStartAngle:endAngle:clockwise:animated:]((uint64_t)v55, 1, 1, v81[3], v8);

        [v7 addTarget:self action:sel__didTapDrawingTool_ forControlEvents:64];
        _Block_object_dispose(&v80, 8);

        return;
      }
      v34 = (double *)objc_loadWeakRetained((id *)p_paletteView);
      if (v34) {
        double v35 = v34[62];
      }
      else {
        double v35 = 0.0;
      }

      double v36 = *(double *)&PKSqueezePaletteBeforeOpacitySliderSpacing;
      double v37 = *(double *)&PKSqueezePaletteOpacitySliderAngularWidth;
      v38 = [PKAngularOpacitySlider alloc];
      v39 = (double *)objc_loadWeakRetained((id *)p_paletteView);
      v40 = v39;
      double v41 = v8 + v36 / v35;
      double v8 = v41 + v37 / v35;
      if (v39) {
        double v42 = v39[63];
      }
      else {
        double v42 = 0.0;
      }
      v43 = -[PKAngularOpacitySlider initWithFrame:startAngle:endAngle:arcRadius:arcWidth:](v38, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24), v41, v41 + v37 / v35, v35, v42 * *(double *)&PKSqueezePaletteOpacitySliderHeighRatio);
      opacitySlider = self->_opacitySlider;
      self->_opacitySlider = (PKAngularOpacitySlider *)v43;

      [(PKAngularOpacitySlider *)self->_opacitySlider setTranslatesAutoresizingMaskIntoConstraints:0];
      [(PKAngularOpacitySlider *)self->_opacitySlider setDelegate:self];
      id v45 = objc_loadWeakRetained((id *)p_paletteView);
      v46 = v45;
      if (v45) {
        v47 = (void *)*((void *)v45 + 69);
      }
      else {
        v47 = 0;
      }
      id v48 = v47;
      [v48 addSubview:self->_opacitySlider];

      [(PKSqueezePaletteViewExpandedInkingToolLayout *)self setOpacitySlider:self->_opacitySlider];
      id v30 = [(PKAngularOpacitySlider *)self->_opacitySlider centerXAnchor];
      v32 = objc_loadWeakRetained((id *)p_paletteView);
      v65 = [v32 centerXAnchor];
      v64 = [v30 constraintEqualToAnchor:v65];
      v84[0] = v64;
      v62 = [(PKAngularOpacitySlider *)self->_opacitySlider centerYAnchor];
      id v63 = objc_loadWeakRetained((id *)p_paletteView);
      v61 = [v63 centerYAnchor];
      v60 = [v62 constraintEqualToAnchor:v61];
      v84[1] = v60;
      v57 = [(PKAngularOpacitySlider *)self->_opacitySlider widthAnchor];
      id v59 = objc_loadWeakRetained((id *)p_paletteView);
      v58 = [v59 widthAnchor];
      v56 = [v57 constraintEqualToAnchor:v58];
      v84[2] = v56;
      v49 = [(PKAngularOpacitySlider *)self->_opacitySlider heightAnchor];
      id v50 = objc_loadWeakRetained((id *)p_paletteView);
      v51 = [v50 heightAnchor];
      v52 = [v49 constraintEqualToAnchor:v51];
      v84[3] = v52;
      v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:4];
      [v71 addObjectsFromArray:v53];
    }
    goto LABEL_27;
  }
}

void __55__PKSqueezePaletteViewExpandedInkingToolLayout_setupUI__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v41[4] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v4 addTarget:*(void *)(a1 + 32) action:sel__didTapStrokeWeightButton_ forControlEvents:64];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v6 = WeakRetained;
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
  v15 = [v14 centerYAnchor];
  v16 = [v13 constraintEqualToAnchor:v15];

  double v17 = *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  double v18 = *(double *)(a1 + 72) + *(double *)(a1 + 88);
  double v19 = (double *)objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  double v20 = 0.0;
  double v21 = 0.0;
  if (v19) {
    double v21 = v19[62];
  }
  double v22 = v17 - v18 / v21;

  uint64_t v23 = (double *)objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  v24 = v23;
  if (v23) {
    double v20 = v23[62];
  }
  double v25 = PKPointOnArc(*MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v20, v22);
  double v27 = v26;

  [v12 setConstant:v25];
  [v16 setConstant:v27];
  BOOL v28 = *(void **)(a1 + 40);
  v41[0] = v12;
  v41[1] = v16;
  v29 = [v4 heightAnchor];
  id v30 = [v29 constraintEqualToConstant:*(double *)(a1 + 80)];
  v41[2] = v30;
  v31 = [v4 widthAnchor];
  v32 = [v31 constraintEqualToConstant:*(double *)(a1 + 72)];
  v41[3] = v32;
  BOOL v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:4];
  [v28 addObjectsFromArray:v33];

  *(float *)&double v34 = v22;
  double v35 = [NSNumber numberWithFloat:v34];
  [*(id *)(a1 + 48) setObject:v35 atIndexedSubscript:a3];

  *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v22;
  objc_initWeak(&location, v4);
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __55__PKSqueezePaletteViewExpandedInkingToolLayout_setupUI__block_invoke_2;
  v37[3] = &unk_1E64C6A38;
  objc_copyWeak(&v38, &location);
  objc_copyWeak(&v39, (id *)(a1 + 64));
  objc_msgSend(v4, "_set_pk_longSqueezeAction:", v37);
  objc_destroyWeak(&v39);
  objc_destroyWeak(&v38);
  objc_destroyWeak(&location);
}

void __55__PKSqueezePaletteViewExpandedInkingToolLayout_setupUI__block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  objc_copyWeak(&to, (id *)(a1 + 32));
  id v3 = objc_loadWeakRetained(&to);

  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v5 = objc_loadWeakRetained(v2);
    [WeakRetained _didTapStrokeWeightButton:v5];
  }
  objc_destroyWeak(&to);
}

- (void)updateUI
{
  v2 = self;
  if (self) {
    self = (PKSqueezePaletteViewExpandedInkingToolLayout *)self->_strokeWeightButtons;
  }
  [(PKSqueezePaletteViewExpandedInkingToolLayout *)self enumerateObjectsUsingBlock:&__block_literal_global_50];
  uint64_t v3 = [(PKSqueezePaletteViewExpandedInkingToolLayout *)v2 context];
  id v4 = (void *)v3;
  if (v3) {
    id v5 = *(void **)(v3 + 24);
  }
  else {
    id v5 = 0;
  }
  uint64_t v6 = v5;

  -[PKSqueezePaletteViewExpandedInkingToolLayout _updateToolUIStyle]((uint64_t)v2);
  if (v6) {
    id v7 = (void *)v6[102];
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;
  uint64_t v9 = [v8 _configuration];
  id v10 = v9;
  if (v9 && ([v9 supportsStrokeWeight] & 1) != 0)
  {
    int v11 = v10[16];

    if (v11)
    {
      if (v6) {
        objc_super v12 = (void *)v6[102];
      }
      else {
        objc_super v12 = 0;
      }
      id v13 = v12;
      [v13 _strokeWeight];
      uint64_t v15 = v14;

      if (v2) {
        strokeWeightButtons = v2->_strokeWeightButtons;
      }
      else {
        strokeWeightButtons = 0;
      }
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __56__PKSqueezePaletteViewExpandedInkingToolLayout_updateUI__block_invoke_2;
      v26[3] = &__block_descriptor_40_e51_v32__0__PKSqueezePaletteStrokeWeightButton_8Q16_B24l;
      v26[4] = v15;
      [(NSArray *)strokeWeightButtons enumerateObjectsUsingBlock:v26];
    }
  }
  else
  {
  }
  if (v6) {
    double v17 = (void *)v6[102];
  }
  else {
    double v17 = 0;
  }
  id v18 = v17;
  double v19 = [v18 _configuration];
  double v20 = v19;
  if (!v19 || ![v19 supportsOpacity]) {
    goto LABEL_25;
  }
  int v21 = v20[17];

  if (v21)
  {
    id v18 = [(PKSqueezePaletteViewExpandedInkingToolLayout *)v2 opacitySlider];
    if (v6) {
      double v22 = (void *)v6[102];
    }
    else {
      double v22 = 0;
    }
    id v23 = v22;
    double v20 = [v23 _color];

    v24 = [v18 color];
    char v25 = [v24 isEqual:v20];

    if ((v25 & 1) == 0) {
      [v18 setColor:v20];
    }
LABEL_25:
  }
}

uint64_t __56__PKSqueezePaletteViewExpandedInkingToolLayout_updateUI__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSelected:0];
}

- (void)_updateToolUIStyle
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    if (WeakRetained) {
      id v3 = (id)WeakRetained[73];
    }
    else {
      id v3 = 0;
    }
    id v7 = WeakRetained;
    uint64_t v4 = *(void *)(a1 + 24);
    if (v4)
    {
      id v5 = (id *)*(id *)(v4 + 24);
      uint64_t v6 = v5;
      if (v5 && v5[103] != v3)
      {
        v5[103] = v3;
        [v5[93] setColorUserInterfaceStyle:v3];
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
}

void __56__PKSqueezePaletteViewExpandedInkingToolLayout_updateUI__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = a2;
  if (v6) {
    double v7 = v6[93];
  }
  else {
    double v7 = 0.0;
  }
  if (v7 == *(double *)(a1 + 32))
  {
    id v8 = v6;
    [v6 setSelected:1];
    uint64_t v6 = v8;
    *a4 = 1;
  }
}

- (void)willTransitionToLayout:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F28DC8];
  id v5 = [(PKSqueezePaletteViewExpandedInkingToolLayout *)self layoutConstraints];
  [v4 deactivateConstraints:v5];

  if (self) {
    strokeWeightButtons = self->_strokeWeightButtons;
  }
  else {
    strokeWeightButtons = 0;
  }
  [(NSArray *)strokeWeightButtons makeObjectsPerformSelector:sel_removeFromSuperview];
  uint64_t v7 = [(PKSqueezePaletteViewExpandedInkingToolLayout *)self context];
  id v10 = (id)v7;
  if (v7) {
    id v8 = *(void **)(v7 + 24);
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  [v9 removeTarget:self action:sel__didTapDrawingTool_ forControlEvents:64];
}

- (void)handlePencilInteractionDidTap:(int64_t)a3
{
  context = self->_context;
  if (context) {
    context = (PKSqueezePaletteViewExpandedInkingToolLayoutContext *)context->_previousLayout;
  }
  uint64_t v6 = context;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);
  -[PKSqueezePaletteView setCurrentLayout:]((uint64_t)WeakRetained, v6);
}

- (void)_didTapStrokeWeightButton:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (double *)a3;
  id v5 = v4;
  if (v4) {
    double v6 = v4[93];
  }
  else {
    double v6 = 0.0;
  }
  uint64_t v7 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 134217984;
    double v21 = v6;
    _os_log_impl(&dword_1C44F8000, v7, OS_LOG_TYPE_DEFAULT, "Tap stroke weight button %f", (uint8_t *)&v20, 0xCu);
  }

  id v8 = [(PKSqueezePaletteViewExpandedInkingToolLayout *)self lastTappedStrokeWeightButton];

  uint64_t v9 = [(PKSqueezePaletteViewExpandedInkingToolLayout *)self context];
  id v10 = (void *)v9;
  if (v8 == v5)
  {
    if (v9) {
      double v19 = *(void **)(v9 + 16);
    }
    else {
      double v19 = 0;
    }
    id v15 = v19;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);
    -[PKSqueezePaletteView setCurrentLayout:]((uint64_t)WeakRetained, v15);
    objc_super v12 = v10;
  }
  else
  {
    if (v9) {
      int v11 = *(void **)(v9 + 24);
    }
    else {
      int v11 = 0;
    }
    objc_super v12 = v11;

    if (v12) {
      id v13 = (void *)v12[102];
    }
    else {
      id v13 = 0;
    }
    id v14 = v13;
    id v15 = (id)[v14 _copyWithStrokeWeight:v6];

    -[PKSqueezePaletteDrawingTool setTool:]((uint64_t)v12, v15);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);
    if (v12) {
      double v17 = (void *)v12[102];
    }
    else {
      double v17 = 0;
    }
    id v18 = v17;
    -[PKSqueezePaletteView _didSelectTool:atIndex:]((uint64_t)WeakRetained, v18, 1);
  }
  [(PKSqueezePaletteViewExpandedInkingToolLayout *)self setLastTappedStrokeWeightButton:v5];
}

- (void)_didTapDrawingTool:(id)a3
{
  uint64_t v4 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "Drawing tool tapped", v10, 2u);
  }

  uint64_t v5 = [(PKSqueezePaletteViewExpandedInkingToolLayout *)self context];
  double v6 = (void *)v5;
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

- (void)_colorAlphaSliderUserDidChangeSlider:(id)a3
{
  id v21 = a3;
  uint64_t v4 = [(PKSqueezePaletteViewExpandedInkingToolLayout *)self context];
  uint64_t v5 = (void *)v4;
  if (v4) {
    double v6 = *(void **)(v4 + 24);
  }
  else {
    double v6 = 0;
  }
  uint64_t v7 = v6;

  if (v7) {
    id v8 = (void *)v7[102];
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  id v10 = [v9 _color];

  if (v10)
  {
    [v10 alphaComponent];
    double v12 = v11;
    id v13 = [v21 color];
    [v13 alphaComponent];
    double v15 = v14;

    if (vabdd_f64(v12, v15) >= 0.01)
    {
      v16 = [v10 colorWithAlphaComponent:v15];
      if (v7) {
        double v17 = (void *)v7[102];
      }
      else {
        double v17 = 0;
      }
      id v18 = v17;
      double v19 = (void *)[v18 _copyWithColor:v16];

      -[PKSqueezePaletteDrawingTool setTool:]((uint64_t)v7, v19);
      id WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);
      -[PKSqueezePaletteView _didSelectTool:atIndex:]((uint64_t)WeakRetained, v19, 1);
    }
  }
}

- (PKSqueezePaletteView)paletteView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);

  return (PKSqueezePaletteView *)WeakRetained;
}

- (void)setPaletteView:(id)a3
{
}

- (void)setStrokeWeightButtons:(id)a3
{
}

- (PKSqueezePaletteViewExpandedInkingToolLayoutContext)context
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

- (PKSqueezePaletteStrokeWeightButton)lastTappedStrokeWeightButton
{
  return self->_lastTappedStrokeWeightButton;
}

- (void)setLastTappedStrokeWeightButton:(id)a3
{
}

- (PKAngularOpacitySlider)opacitySlider
{
  return self->_opacitySlider;
}

- (void)setOpacitySlider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_opacitySlider, 0);
  objc_storeStrong((id *)&self->_lastTappedStrokeWeightButton, 0);
  objc_storeStrong((id *)&self->_layoutConstraints, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_strokeWeightButtons, 0);

  objc_destroyWeak((id *)&self->_paletteView);
}

@end