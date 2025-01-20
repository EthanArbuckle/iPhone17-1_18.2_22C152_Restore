@interface PKSqueezePaletteViewExpandedOptionsLayout
- (PKSqueezePaletteView)paletteView;
- (id)initWithContext:(void *)a3 backButton:(void *)a4 textBoxButton:(void *)a5 signatureButton:(void *)a6 shapesButton:(void *)a7 stickersButton:(void *)a8 gearButton:;
- (void)_didTapButton:(id)a3;
- (void)_performButtonAction:(uint64_t)a1;
- (void)dealloc;
- (void)handlePencilInteractionDidTap:(int64_t)a3;
- (void)setPaletteView:(id)a3;
- (void)setupUI;
- (void)updateUI;
- (void)willTransitionToLayout:(id)a3;
@end

@implementation PKSqueezePaletteViewExpandedOptionsLayout

- (id)initWithContext:(void *)a3 backButton:(void *)a4 textBoxButton:(void *)a5 signatureButton:(void *)a6 shapesButton:(void *)a7 stickersButton:(void *)a8 gearButton:
{
  v52[5] = *MEMORY[0x1E4F143B8];
  id v31 = a2;
  id v32 = a3;
  id v33 = a4;
  id v34 = a5;
  id v35 = a6;
  id v36 = a7;
  id v37 = a8;
  if (a1
    && (v50.receiver = a1,
        v50.super_class = (Class)PKSqueezePaletteViewExpandedOptionsLayout,
        v16 = (id *)objc_msgSendSuper2(&v50, sel_init),
        (val = v16) != 0))
  {
    objc_storeStrong(v16 + 7, a2);
    objc_storeStrong(val + 8, a3);
    objc_storeStrong(val + 9, a4);
    objc_storeStrong(val + 10, a5);
    objc_storeStrong(val + 11, a6);
    objc_storeStrong(val + 12, a7);
    objc_storeStrong(val + 13, a8);
    *((double *)val + 1) = PKSqueezePaletteButtonSize();
    val[2] = v17;
    val[3] = (id)PKSqueezePaletteButtonInterItemSpacing;
    id v18 = objc_alloc(MEMORY[0x1E4F1CA48]);
    id v19 = val[11];
    v52[0] = val[13];
    v52[1] = v19;
    id v20 = val[9];
    v52[2] = val[10];
    v52[3] = v20;
    v52[4] = val[8];
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:5];
    v38 = (void *)[v18 initWithArray:v21];

    id v22 = val[12];
    if (v22) {
      objc_msgSend(v38, "insertObject:atIndex:", v22, objc_msgSend(v38, "indexOfObject:", val[8]));
    }
    uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithArray:v38];
    id v24 = val[4];
    val[4] = (id)v23;

    val[5] = malloc_type_malloc(8 * [val[4] count], 0x100004000313F17uLL);
    objc_initWeak(&location, val);
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id obj = val[4];
    uint64_t v25 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v46;
      uint64_t v27 = MEMORY[0x1E4F143A8];
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v46 != v26) {
            objc_enumerationMutation(obj);
          }
          v29 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          objc_initWeak(&from, v29);
          v41[0] = v27;
          v41[1] = 3221225472;
          v41[2] = __141__PKSqueezePaletteViewExpandedOptionsLayout_initWithContext_backButton_textBoxButton_signatureButton_shapesButton_stickersButton_gearButton___block_invoke;
          v41[3] = &unk_1E64C6A38;
          objc_copyWeak(&v42, &location);
          objc_copyWeak(&v43, &from);
          objc_msgSend(v29, "_set_pk_longSqueezeAction:", v41);
          objc_destroyWeak(&v43);
          objc_destroyWeak(&v42);
          objc_destroyWeak(&from);
        }
        uint64_t v25 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
      }
      while (v25);
    }

    objc_destroyWeak(&location);
  }
  else
  {
    val = 0;
  }

  return val;
}

void __141__PKSqueezePaletteViewExpandedOptionsLayout_initWithContext_backButton_textBoxButton_signatureButton_shapesButton_stickersButton_gearButton___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  -[PKSqueezePaletteViewExpandedOptionsLayout _performButtonAction:]((uint64_t)WeakRetained, v2);
}

- (void)_performButtonAction:(uint64_t)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (*(id *)(a1 + 64) == v3)
    {
      v8 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C44F8000, v8, OS_LOG_TYPE_DEFAULT, "Did tap on back button", buf, 2u);
      }

      v9 = *(void **)(a1 + 56);
      if (v9) {
        v9 = (void *)v9[2];
      }
      v7 = v9;
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      -[PKSqueezePaletteView setCurrentLayout:]((uint64_t)WeakRetained, v7);
    }
    else if (*(id *)(a1 + 104) == v3)
    {
      v11 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v20 = 0;
        _os_log_impl(&dword_1C44F8000, v11, OS_LOG_TYPE_DEFAULT, "Did tap on gear button", v20, 2u);
      }

      v7 = objc_loadWeakRetained((id *)(a1 + 48));
      -[PKSqueezePaletteView _didTapMoreOptionsButton:]((uint64_t)v7, v4);
    }
    else if (*(id *)(a1 + 96) == v3)
    {
      v12 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v19 = 0;
        _os_log_impl(&dword_1C44F8000, v12, OS_LOG_TYPE_DEFAULT, "Did tap on stickers button", v19, 2u);
      }

      v7 = objc_loadWeakRetained((id *)(a1 + 48));
      -[PKSqueezePaletteView _didTapStickersButton:]((uint64_t)v7, v4);
    }
    else if (*(id *)(a1 + 88) == v3)
    {
      v13 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v18 = 0;
        _os_log_impl(&dword_1C44F8000, v13, OS_LOG_TYPE_DEFAULT, "Did tap on shapes button", v18, 2u);
      }

      v7 = objc_loadWeakRetained((id *)(a1 + 48));
      -[PKSqueezePaletteView _didTapShapesButton:]((uint64_t)v7, v4);
    }
    else if (*(id *)(a1 + 80) == v3)
    {
      v14 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_1C44F8000, v14, OS_LOG_TYPE_DEFAULT, "Did tap on signatures button", v17, 2u);
      }

      v7 = objc_loadWeakRetained((id *)(a1 + 48));
      -[PKSqueezePaletteView _didTapSignatureButton:]((uint64_t)v7, v4);
    }
    else
    {
      v5 = *(void **)(a1 + 72);
      v6 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
      v7 = v6;
      if (v5 == v4)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v16 = 0;
          _os_log_impl(&dword_1C44F8000, v7, OS_LOG_TYPE_DEFAULT, "Did tap on text-box button", v16, 2u);
        }

        v7 = objc_loadWeakRetained((id *)(a1 + 48));
        -[PKSqueezePaletteView _didTapTextBoxButton:]((uint64_t)v7, v4);
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_fault_impl(&dword_1C44F8000, v7, OS_LOG_TYPE_FAULT, "Unhandled button action", v15, 2u);
      }
    }
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
  v4.super_class = (Class)PKSqueezePaletteViewExpandedOptionsLayout;
  [(PKSqueezePaletteViewExpandedOptionsLayout *)&v4 dealloc];
}

- (void)_didTapButton:(id)a3
{
}

- (void)setupUI
{
  p_paletteView = &self->_paletteView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);

  if (WeakRetained)
  {
    uint64_t v13 = 0;
    v14 = (double *)&v13;
    uint64_t v15 = 0x2020000000;
    double v16 = 0.0;
    context = self->_context;
    if (context) {
      double moreButtonAngle = context->_moreButtonAngle;
    }
    else {
      double moreButtonAngle = 0.0;
    }
    double v16 = moreButtonAngle;
    buttons = self->_buttons;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __52__PKSqueezePaletteViewExpandedOptionsLayout_setupUI__block_invoke;
    v12[3] = &unk_1E64CB238;
    v12[4] = self;
    v12[5] = &v13;
    [(NSArray *)buttons enumerateObjectsUsingBlock:v12];
    id v8 = objc_loadWeakRetained((id *)p_paletteView);
    v9 = v8;
    v10 = self->_context;
    if (v10) {
      double v11 = v10->_moreButtonAngle;
    }
    else {
      double v11 = 0.0;
    }
    -[PKSqueezePaletteView updateUIStartAngle:endAngle:clockwise:animated:]((uint64_t)v8, 1, 1, v14[3], v11);

    _Block_object_dispose(&v13, 8);
  }
}

void __52__PKSqueezePaletteViewExpandedOptionsLayout_setupUI__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v38[4] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 addTarget:*(void *)(a1 + 32) action:sel__didTapButton_ forControlEvents:64];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  v7 = WeakRetained;
  if (WeakRetained) {
    id v8 = (void *)*((void *)WeakRetained + 69);
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  [v9 addSubview:v5];

  v10 = [v5 centerXAnchor];
  id v11 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  v12 = [v11 centerXAnchor];
  uint64_t v13 = [v10 constraintEqualToAnchor:v12];

  v14 = [v5 centerYAnchor];
  id v15 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  double v16 = [v15 centerYAnchor];
  v17 = [v14 constraintEqualToAnchor:v16];

  double v18 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  double v19 = 0.0;
  double v20 = 0.0;
  if (a3)
  {
    uint64_t v21 = *(void *)(a1 + 32);
    double v22 = *(double *)(v21 + 8) + *(double *)(v21 + 24);
    uint64_t v23 = (double *)objc_loadWeakRetained((id *)(v21 + 48));
    if (v23) {
      double v24 = v23[62];
    }
    else {
      double v24 = 0.0;
    }
    double v20 = v22 / v24;
  }
  uint64_t v37 = a3;
  uint64_t v25 = (double *)objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  uint64_t v26 = v25;
  if (v25) {
    double v19 = v25[62];
  }
  double v27 = v18 - v20;
  double v28 = PKPointOnArc(*MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v19, v27);
  double v30 = v29;

  [v13 setConstant:v28];
  [v17 setConstant:v30];
  id v31 = (void *)MEMORY[0x1E4F28DC8];
  v38[0] = v13;
  v38[1] = v17;
  id v32 = [v5 heightAnchor];
  id v33 = [v32 constraintEqualToConstant:*(double *)(*(void *)(a1 + 32) + 16)];
  v38[2] = v33;
  id v34 = [v5 widthAnchor];
  id v35 = [v34 constraintEqualToConstant:*(double *)(*(void *)(a1 + 32) + 8)];
  v38[3] = v35;
  id v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:4];
  [v31 activateConstraints:v36];

  *(double *)(*(void *)(*(void *)(a1 + 32) + 40) + 8 * v37) = v27;
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v27;
}

- (void)updateUI
{
  buttons = self->_buttons;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__PKSqueezePaletteViewExpandedOptionsLayout_updateUI__block_invoke;
  v3[3] = &unk_1E64CB260;
  v3[4] = self;
  [(NSArray *)buttons enumerateObjectsUsingBlock:v3];
}

void __53__PKSqueezePaletteViewExpandedOptionsLayout_updateUI__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  [v5 setAlpha:1.0];
  CGAffineTransformMakeRotation(&v7, *(double *)(*(void *)(*(void *)(a1 + 32) + 40) + 8 * a3) + 1.57079633);
  CGAffineTransform v6 = v7;
  [v5 setTransform:&v6];
}

- (void)willTransitionToLayout:(id)a3
{
}

uint64_t __68__PKSqueezePaletteViewExpandedOptionsLayout_willTransitionToLayout___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAlpha:0.0];
}

- (void)handlePencilInteractionDidTap:(int64_t)a3
{
  context = self->_context;
  if (context) {
    context = (PKSqueezePaletteViewExpandedOptionsLayoutContext *)context->_previousLayout;
  }
  CGAffineTransform v6 = context;
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
  objc_storeStrong((id *)&self->_gearButton, 0);
  objc_storeStrong((id *)&self->_stickersButton, 0);
  objc_storeStrong((id *)&self->_shapesButton, 0);
  objc_storeStrong((id *)&self->_signatureButton, 0);
  objc_storeStrong((id *)&self->_textBoxButton, 0);
  objc_storeStrong((id *)&self->_backButton, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_paletteView);

  objc_storeStrong((id *)&self->_buttons, 0);
}

@end