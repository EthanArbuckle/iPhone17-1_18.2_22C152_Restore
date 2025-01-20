@interface PKSqueezePaletteViewExpandedColorsLayout
- (PKSqueezePaletteView)paletteView;
- (id)_currentSelectedButton;
- (id)initWithContext:(void *)a3 colorButtons:(uint64_t)a4 selectedColorIndex:(void *)a5 backButton:;
- (uint64_t)_updateColorUIStyle;
- (void)_didTapColorButton:(id)a3;
- (void)_didTapMulticolorButton:(id)a3;
- (void)_performBackButtonTapAction;
- (void)_performColorButtonTapAction:(uint64_t)a1;
- (void)_performMulticolorButtonTapAction:(id *)a1;
- (void)_updateSelectedToolColorWithColor:(uint64_t)a3 isFromExtendedColorPicker:(uint64_t)a4 isContinuousColorSelection:;
- (void)dealloc;
- (void)handlePencilInteractionDidTap:(int64_t)a3;
- (void)setPaletteView:(id)a3;
- (void)setupUI;
- (void)updateUI;
- (void)willTransitionToLayout:(id)a3;
@end

@implementation PKSqueezePaletteViewExpandedColorsLayout

- (id)initWithContext:(void *)a3 colorButtons:(uint64_t)a4 selectedColorIndex:(void *)a5 backButton:
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v26 = a2;
  id v28 = a3;
  id v27 = a5;
  if (a1
    && (v44.receiver = a1,
        v44.super_class = (Class)PKSqueezePaletteViewExpandedColorsLayout,
        v10 = (char *)objc_msgSendSuper2(&v44, sel_init),
        (id val = v10) != 0))
  {
    v25 = (void **)(v10 + 56);
    objc_storeStrong((id *)v10 + 7, a2);
    *((void *)val + 9) = a4;
    *((double *)val + 1) = PKSqueezePaletteButtonSize();
    *((void *)val + 2) = v11;
    uint64_t v12 = [v28 copy];
    v13 = (void *)*((void *)val + 8);
    *((void *)val + 8) = v12;

    *((void *)val + 3) = malloc_type_malloc(8 * [*((id *)val + 8) count], 0x100004000313F17uLL);
    *((void *)val + 4) = PKSqueezePaletteButtonInterItemSpacing;
    objc_storeStrong((id *)val + 10, a5);
    objc_initWeak(&location, val);
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v14 = *((id *)val + 8);
    uint64_t v15 = [v14 countByEnumeratingWithState:&v39 objects:v45 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v40;
      uint64_t v17 = MEMORY[0x1E4F143A8];
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v40 != v16) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          objc_initWeak(&from, v19);
          v35[0] = v17;
          v35[1] = 3221225472;
          v35[2] = __103__PKSqueezePaletteViewExpandedColorsLayout_initWithContext_colorButtons_selectedColorIndex_backButton___block_invoke;
          v35[3] = &unk_1E64C6A38;
          objc_copyWeak(&v36, &location);
          objc_copyWeak(&v37, &from);
          objc_msgSend(v19, "_set_pk_longSqueezeAction:", v35);
          objc_destroyWeak(&v37);
          objc_destroyWeak(&v36);
          objc_destroyWeak(&from);
        }
        uint64_t v15 = [v14 countByEnumeratingWithState:&v39 objects:v45 count:16];
      }
      while (v15);
    }

    v20 = *v25;
    if (*v25) {
      v20 = (void *)v20[2];
    }
    v21 = v20;
    objc_initWeak(&from, v21);

    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __103__PKSqueezePaletteViewExpandedColorsLayout_initWithContext_colorButtons_selectedColorIndex_backButton___block_invoke_2;
    v32[3] = &unk_1E64C6A38;
    objc_copyWeak(&v33, &location);
    objc_copyWeak(&v34, &from);
    v22 = *v25;
    if (*v25) {
      v22 = (void *)v22[2];
    }
    v23 = v22;
    objc_msgSend(v23, "_set_pk_longSqueezeAction:", v32);

    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __103__PKSqueezePaletteViewExpandedColorsLayout_initWithContext_colorButtons_selectedColorIndex_backButton___block_invoke_3;
    v30[3] = &unk_1E64C5998;
    objc_copyWeak(&v31, &location);
    objc_msgSend(*((id *)val + 10), "_set_pk_longSqueezeAction:", v30);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&v34);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  else
  {
    id val = 0;
  }

  return val;
}

void __103__PKSqueezePaletteViewExpandedColorsLayout_initWithContext_colorButtons_selectedColorIndex_backButton___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  -[PKSqueezePaletteViewExpandedColorsLayout _performColorButtonTapAction:]((uint64_t)WeakRetained, v2);
}

- (void)_performColorButtonTapAction:(uint64_t)a1
{
  v3 = a2;
  if (a1)
  {
    v4 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "Color button tapped", v12, 2u);
    }

    v5 = -[PKSqueezePaletteViewExpandedColorsLayout _currentSelectedButton](a1);
    v6 = v5;
    if (v5 && v5 == v3)
    {
      v7 = *(void **)(a1 + 56);
      if (v7) {
        v7 = (void *)v7[4];
      }
      v8 = v7;
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      -[PKSqueezePaletteView setCurrentLayout:]((uint64_t)WeakRetained, v8);
    }
    else
    {
      [v5 setSelected:0];
      *(void *)(a1 + 72) = [*(id *)(a1 + 64) indexOfObject:v3];
      [v3 setSelected:1];
      if (v3) {
        v10 = (void *)v3[94];
      }
      else {
        v10 = 0;
      }
      id v11 = v10;
      v8 = [v11 color];

      -[PKSqueezePaletteViewExpandedColorsLayout _updateSelectedToolColorWithColor:isFromExtendedColorPicker:isContinuousColorSelection:](a1, v8, 0, 0);
    }
  }
}

void __103__PKSqueezePaletteViewExpandedColorsLayout_initWithContext_colorButtons_selectedColorIndex_backButton___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  -[PKSqueezePaletteViewExpandedColorsLayout _performMulticolorButtonTapAction:](WeakRetained, v2);
}

- (void)_performMulticolorButtonTapAction:(id *)a1
{
  v3 = a2;
  if (a1)
  {
    v4 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "Multicolor button tapped", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, a1);
    newValue[0] = MEMORY[0x1E4F143A8];
    newValue[1] = 3221225472;
    newValue[2] = __78__PKSqueezePaletteViewExpandedColorsLayout__performMulticolorButtonTapAction___block_invoke;
    newValue[3] = &unk_1E64C6AA8;
    objc_copyWeak(&v13, buf);
    v5 = a1 + 6;
    id WeakRetained = objc_loadWeakRetained(v5);
    v8 = WeakRetained;
    if (WeakRetained) {
      objc_setProperty_nonatomic_copy(WeakRetained, v7, newValue, 600);
    }

    if (v3) {
      v9 = (void *)v3[94];
    }
    else {
      v9 = 0;
    }
    id v10 = v9;
    id v11 = objc_loadWeakRetained(v5);
    -[PKSqueezePaletteView _didTapMulticolorButton:currentSelectedColor:]((uint64_t)v11, v3, v10);

    objc_destroyWeak(&v13);
    objc_destroyWeak(buf);
  }
}

void __103__PKSqueezePaletteViewExpandedColorsLayout_initWithContext_colorButtons_selectedColorIndex_backButton___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[PKSqueezePaletteViewExpandedColorsLayout _performBackButtonTapAction]((uint64_t)WeakRetained);
}

- (void)_performBackButtonTapAction
{
  if (a1)
  {
    id v2 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1C44F8000, v2, OS_LOG_TYPE_DEFAULT, "Back button tapped", v6, 2u);
    }

    v3 = *(void **)(a1 + 56);
    if (v3) {
      v3 = (void *)v3[4];
    }
    v4 = v3;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    -[PKSqueezePaletteView setCurrentLayout:]((uint64_t)WeakRetained, v4);
  }
}

- (void)dealloc
{
  buttonAngles = self->_buttonAngles;
  if (buttonAngles)
  {
    free(buttonAngles);
    self->_buttonAngles = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PKSqueezePaletteViewExpandedColorsLayout;
  [(PKSqueezePaletteViewExpandedColorsLayout *)&v4 dealloc];
}

- (void)_didTapMulticolorButton:(id)a3
{
}

void __78__PKSqueezePaletteViewExpandedColorsLayout__performMulticolorButtonTapAction___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  objc_super v4 = (id *)(a1 + 32);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  id v6 = v5;
  if (WeakRetained)
  {
    v7 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      id v18 = v6;
      _os_log_impl(&dword_1C44F8000, v7, OS_LOG_TYPE_DEFAULT, "Update multicolor button color from extended color picker, color: %{private}@", buf, 0xCu);
    }

    v8 = WeakRetained;
    if (WeakRetained[9] != 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = (void *)WeakRetained[9];
        *(_DWORD *)buf = 134283521;
        id v18 = v10;
        _os_log_impl(&dword_1C44F8000, v9, OS_LOG_TYPE_DEFAULT, "Unselect color swatch at index: %{private}ld", buf, 0xCu);
      }

      id v11 = -[PKSqueezePaletteViewExpandedColorsLayout _currentSelectedButton]((uint64_t)WeakRetained);
      [v11 setSelected:0];

      v8 = WeakRetained;
      WeakRetained[9] = 0x7FFFFFFFFFFFFFFFLL;
    }
    uint64_t v12 = (void *)v8[7];
    if (v12) {
      uint64_t v12 = (void *)v12[2];
    }
    id v13 = v12;
    [v13 setSelected:1];

    id v14 = (void *)WeakRetained[7];
    if (v14) {
      id v14 = (void *)v14[2];
    }
    uint64_t v15 = v14;
    -[PKSqueezePaletteMulticolorSwatchButton setColor:]((uint64_t)v15, v6);

    -[PKSqueezePaletteViewExpandedColorsLayout _updateSelectedToolColorWithColor:isFromExtendedColorPicker:isContinuousColorSelection:]((uint64_t)WeakRetained, v6, 1, a3);
  }
}

- (id)_currentSelectedButton
{
  if (*(void *)(a1 + 72) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v1 = 0;
  }
  else
  {
    v1 = objc_msgSend(*(id *)(a1 + 64), "objectAtIndexedSubscript:");
  }

  return v1;
}

- (void)_updateSelectedToolColorWithColor:(uint64_t)a3 isFromExtendedColorPicker:(uint64_t)a4 isContinuousColorSelection:
{
  id v18 = a2;
  uint64_t v7 = *(void *)(a1 + 56);
  if (v7)
  {
    id v8 = *(id *)(v7 + 8);
    v9 = v8;
    if (v8)
    {
      id v10 = (void *)*((void *)v8 + 102);
      goto LABEL_4;
    }
  }
  else
  {
    v9 = 0;
  }
  id v10 = 0;
LABEL_4:
  id v11 = v10;

  uint64_t v12 = [v11 _configuration];
  int v13 = [v12 supportsColor];

  if (v13)
  {
    id v14 = (void *)[v11 _copyWithColor:v18];
    if (v14)
    {
      uint64_t v15 = *(void **)(a1 + 56);
      if (v15) {
        uint64_t v15 = (void *)v15[1];
      }
      uint64_t v16 = v15;
      -[PKSqueezePaletteDrawingTool setTool:]((uint64_t)v16, v14);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    -[PKSqueezePaletteView _didSelectColor:isFromExtendedColorPicker:isContinuousColorSelection:]((uint64_t)WeakRetained, v18, a3, a4);
  }
}

- (void)_didTapColorButton:(id)a3
{
}

- (uint64_t)_updateColorUIStyle
{
  if (result)
  {
    uint64_t v1 = result;
    id WeakRetained = objc_loadWeakRetained((id *)(result + 48));
    v3 = WeakRetained;
    if (WeakRetained) {
      uint64_t v4 = *((void *)WeakRetained + 73);
    }
    else {
      uint64_t v4 = 0;
    }
    uint64_t v5 = *(void *)(v1 + 56);
    if (v5)
    {
      id v6 = *(id *)(v5 + 16);
      uint64_t v7 = v6;
      if (v6)
      {
        if (*((void *)v6 + 95) != v4)
        {
          *((void *)v6 + 95) = v4;
          -[PKSqueezePaletteMulticolorSwatchButton _updateUI]((uint64_t)v6);
        }
      }
    }
    else
    {
      uint64_t v7 = 0;
    }

    id v8 = *(void **)(v1 + 64);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __63__PKSqueezePaletteViewExpandedColorsLayout__updateColorUIStyle__block_invoke;
    v9[3] = &unk_1E64C7650;
    v9[4] = v1;
    return [v8 enumerateObjectsUsingBlock:v9];
  }
  return result;
}

void __63__PKSqueezePaletteViewExpandedColorsLayout__updateColorUIStyle__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(*(void *)(a1 + 32) + 48);
  v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  if (WeakRetained) {
    uint64_t v5 = WeakRetained[73];
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = WeakRetained;
  if (v3 && v3[95] != v5)
  {
    v3[95] = v5;
    -[PKPaletteColorSwatch setColorUserInterfaceStyle:]((void *)v3[93], v5);
  }
}

- (void)setupUI
{
  v46[4] = *MEMORY[0x1E4F143B8];
  p_paletteView = &self->_paletteView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);

  if (WeakRetained)
  {
    context = self->_context;
    if (context) {
      context = (PKSqueezePaletteViewExpandedColorsLayoutContext *)context->_multicolorButton;
    }
    id v34 = context;
    [(PKSqueezePaletteViewExpandedColorsLayoutContext *)v34 addTarget:self action:sel__didTapMulticolorButton_ forControlEvents:64];
    [(UIButton *)self->_backButton addTarget:self action:sel__didTapBackButton_ forControlEvents:64];
    id v6 = self->_context;
    if (v6) {
      double multicolorButtonAngle = v6->_multicolorButtonAngle;
    }
    else {
      double multicolorButtonAngle = 0.0;
    }
    uint64_t v42 = 0;
    v43 = (double *)&v42;
    uint64_t v44 = 0x2020000000;
    double v45 = multicolorButtonAngle;
    colorButtons = self->_colorButtons;
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __51__PKSqueezePaletteViewExpandedColorsLayout_setupUI__block_invoke;
    v41[3] = &unk_1E64C7678;
    v41[4] = self;
    v41[5] = &v42;
    [(NSArray *)colorButtons enumerateObjectsUsingBlock:v41];
    if (self->_selectedColorIndex != 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = -[NSArray objectAtIndexedSubscript:](self->_colorButtons, "objectAtIndexedSubscript:");
      [v9 setSelected:1];
    }
    double v10 = v43[3];
    double width = self->_buttonSize.width;
    double interButtonSpace = self->_interButtonSpace;
    int v13 = (double *)objc_loadWeakRetained((id *)p_paletteView);
    if (v13) {
      double v14 = v13[62];
    }
    else {
      double v14 = 0.0;
    }
    self->_backButtonAngle = v10 - (width + interButtonSpace) / v14;

    uint64_t v15 = (double *)objc_loadWeakRetained((id *)p_paletteView);
    uint64_t v16 = v15;
    if (v15) {
      double v17 = v15[62];
    }
    else {
      double v17 = 0.0;
    }
    double v18 = PKPointOnArc(*MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v17, self->_backButtonAngle);
    double v20 = v19;

    [(UIButton *)self->_backButton setTranslatesAutoresizingMaskIntoConstraints:0];
    id v21 = objc_loadWeakRetained((id *)p_paletteView);
    v22 = v21;
    if (v21) {
      v23 = (void *)*((void *)v21 + 69);
    }
    else {
      v23 = 0;
    }
    id v24 = v23;
    [v24 addSubview:self->_backButton];

    v35 = (void *)MEMORY[0x1E4F28DC8];
    long long v39 = [(UIButton *)self->_backButton centerXAnchor];
    id v40 = objc_loadWeakRetained((id *)p_paletteView);
    v38 = [v40 centerXAnchor];
    id v37 = [v39 constraintEqualToAnchor:v38 constant:v18];
    v46[0] = v37;
    id v36 = [(UIButton *)self->_backButton centerYAnchor];
    id v25 = objc_loadWeakRetained((id *)p_paletteView);
    id v26 = [v25 centerYAnchor];
    id v27 = [v36 constraintEqualToAnchor:v26 constant:v20];
    v46[1] = v27;
    id v28 = [(UIButton *)self->_backButton heightAnchor];
    v29 = [v28 constraintEqualToConstant:self->_buttonSize.height];
    v46[2] = v29;
    v30 = [(UIButton *)self->_backButton widthAnchor];
    id v31 = [v30 constraintEqualToConstant:self->_buttonSize.width];
    v46[3] = v31;
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:4];
    [v35 activateConstraints:v32];

    id v33 = objc_loadWeakRetained((id *)p_paletteView);
    -[PKSqueezePaletteView updateUIStartAngle:endAngle:clockwise:animated:]((uint64_t)v33, 1, 1, self->_backButtonAngle, multicolorButtonAngle);

    _Block_object_dispose(&v42, 8);
  }
}

void __51__PKSqueezePaletteViewExpandedColorsLayout_setupUI__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v37[4] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 addTarget:*(void *)(a1 + 32) action:sel__didTapColorButton_ forControlEvents:64];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  uint64_t v7 = WeakRetained;
  if (WeakRetained) {
    id v8 = (void *)*((void *)WeakRetained + 69);
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  [v9 addSubview:v5];

  double v10 = [v5 centerXAnchor];
  id v11 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  uint64_t v12 = [v11 centerXAnchor];
  int v13 = [v10 constraintEqualToAnchor:v12];

  double v14 = [v5 centerYAnchor];
  id v15 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  uint64_t v16 = [v15 centerYAnchor];
  double v17 = [v14 constraintEqualToAnchor:v16];

  uint64_t v18 = *(void *)(a1 + 32);
  double v19 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  double v20 = *(double *)(v18 + 8);
  double v21 = *(double *)(v18 + 32);
  v22 = (double *)objc_loadWeakRetained((id *)(v18 + 48));
  double v23 = 0.0;
  double v24 = 0.0;
  if (v22) {
    double v24 = v22[62];
  }

  id v25 = (double *)objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  id v26 = v25;
  if (v25) {
    double v23 = v25[62];
  }
  double v27 = v19 - (v20 + v21) / v24;
  double v28 = PKPointOnArc(*MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v23, v27);
  double v30 = v29;

  [v13 setConstant:v28];
  [v17 setConstant:v30];
  id v31 = (void *)MEMORY[0x1E4F28DC8];
  v37[0] = v13;
  v37[1] = v17;
  v32 = [v5 heightAnchor];
  id v33 = [v32 constraintEqualToConstant:*(double *)(*(void *)(a1 + 32) + 16)];
  v37[2] = v33;
  id v34 = [v5 widthAnchor];

  v35 = [v34 constraintEqualToConstant:*(double *)(*(void *)(a1 + 32) + 8)];
  v37[3] = v35;
  id v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:4];
  [v31 activateConstraints:v36];

  *(double *)(*(void *)(*(void *)(a1 + 32) + 24) + 8 * a3) = v27;
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v27;
}

- (void)updateUI
{
  [(NSArray *)self->_colorButtons enumerateObjectsUsingBlock:&__block_literal_global_30];
  if (self->_selectedColorIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    context = self->_context;
    if (context) {
      context = (PKSqueezePaletteViewExpandedColorsLayoutContext *)context->_multicolorButton;
    }
    uint64_t v4 = context;
    -[PKSqueezePaletteMulticolorSwatchButton setColor:]((uint64_t)v4, 0);
  }
  CGAffineTransformMakeRotation(&v7, self->_backButtonAngle + 1.57079633);
  backButton = self->_backButton;
  CGAffineTransform v6 = v7;
  [(UIButton *)backButton setTransform:&v6];
  -[PKSqueezePaletteViewExpandedColorsLayout _updateColorUIStyle]((uint64_t)self);
}

uint64_t __52__PKSqueezePaletteViewExpandedColorsLayout_updateUI__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAlpha:1.0];
}

- (void)willTransitionToLayout:(id)a3
{
  [(NSArray *)self->_colorButtons enumerateObjectsUsingBlock:&__block_literal_global_15_0];
  context = self->_context;
  if (context) {
    context = (PKSqueezePaletteViewExpandedColorsLayoutContext *)context->_multicolorButton;
  }
  CGAffineTransform v6 = context;
  [(PKSqueezePaletteViewExpandedColorsLayoutContext *)v6 removeTarget:self action:sel__didTapMulticolorButton_ forControlEvents:64];
  [(UIButton *)self->_backButton removeFromSuperview];
  backButton = self->_backButton;
  self->_backButton = 0;
}

uint64_t __67__PKSqueezePaletteViewExpandedColorsLayout_willTransitionToLayout___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAlpha:0.0];
}

- (void)handlePencilInteractionDidTap:(int64_t)a3
{
  context = self->_context;
  if (a3 == 3)
  {
    if (context) {
      context = (PKSqueezePaletteViewExpandedColorsLayoutContext *)context->_multicolorButton;
    }
    CGAffineTransform v6 = context;
    -[PKSqueezePaletteViewExpandedColorsLayout _performMulticolorButtonTapAction:]((id *)&self->super.isa, v6);
  }
  else
  {
    if (context) {
      context = (PKSqueezePaletteViewExpandedColorsLayoutContext *)context->_previousLayout;
    }
    CGAffineTransform v6 = context;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);
    -[PKSqueezePaletteView setCurrentLayout:]((uint64_t)WeakRetained, v6);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backButton, 0);
  objc_storeStrong((id *)&self->_colorButtons, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_destroyWeak((id *)&self->_paletteView);
}

@end