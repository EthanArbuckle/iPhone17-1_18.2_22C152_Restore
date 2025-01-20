@interface PKSqueezePaletteViewMiniPaletteLayout
- (BOOL)expandedToolsLayout:(id)a3 canSelectTool:(id)a4 atIndex:(unint64_t)a5;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (PKSqueezePaletteView)paletteView;
- (double)_defaultToolsContentClipIndicatorAngle;
- (double)toolAngle:(id)a3;
- (double)undoRedoLayoutStartAngle:(id)a3;
- (id)_selectedTool;
- (id)initWithUndoButton:(void *)a3 redoButton:(void *)a4 drawingTools:(void *)a5 selectedToolIndex:(void *)a6 eraserToolIndex:(void *)a7 visibleToolsCount:(void *)a8 multicolorButton:(double)a9 moreButton:(void *)a10 startAngle:;
- (uint64_t)_canSelectTool:(uint64_t)a3 atIndex:;
- (uint64_t)_updateClipIndicatorView;
- (uint64_t)_updateMoreButtonConstraints;
- (uint64_t)_updateMulticolorButtonConstraints;
- (void)_didTapDrawingTool:(id)a3;
- (void)_handlePanGesture:(id)a3;
- (void)_performDrawingToolTapAction:(uint64_t)a1;
- (void)_performMoreButtonTapAction;
- (void)_performMulticolorButtonTapAction;
- (void)_selectTool:(uint64_t)a1;
- (void)_updateColorUIStyle;
- (void)expandedToolsLayout:(id)a3 didChangeDrawingTools:(id)a4;
- (void)expandedToolsLayout:(id)a3 didChangeSelectedToolIndex:(unint64_t)a4;
- (void)handlePencilInteractionDidTap:(int64_t)a3;
- (void)setPaletteView:(id)a3;
- (void)setupUI;
- (void)updateUI;
- (void)willTransitionToLayout:(id)a3;
@end

@implementation PKSqueezePaletteViewMiniPaletteLayout

- (id)initWithUndoButton:(void *)a3 redoButton:(void *)a4 drawingTools:(void *)a5 selectedToolIndex:(void *)a6 eraserToolIndex:(void *)a7 visibleToolsCount:(void *)a8 multicolorButton:(double)a9 moreButton:(void *)a10 startAngle:
{
  id v42 = a2;
  id v41 = a3;
  id v19 = a4;
  id v40 = a8;
  id v20 = a10;
  if (a1)
  {
    v46.receiver = a1;
    v46.super_class = (Class)PKSqueezePaletteViewMiniPaletteLayout;
    v21 = (id *)objc_msgSendSuper2(&v46, sel_init);
    a1 = v21;
    if (v21)
    {
      *((double *)v21 + 34) = a9;
      objc_storeStrong(v21 + 37, a2);
      objc_storeStrong(a1 + 38, a3);
      v22 = -[PKSqueezePaletteViewUndoRedoLayout initWithUndoButton:redoButton:startAngle:]((id *)[PKSqueezePaletteViewUndoRedoLayout alloc], a1[37], a1[38], a9);
      id v23 = a1[1];
      a1[1] = v22;

      v24 = (id *)a1[1];
      if (v24) {
        objc_storeWeak(v24 + 12, a1);
      }
      uint64_t v25 = [v19 copy];
      id v26 = a1[39];
      a1[39] = (id)v25;

      a1[40] = a5;
      a1[41] = a6;
      a1[42] = a7;
      objc_storeStrong(a1 + 43, a8);
      objc_storeStrong(a1 + 44, a10);
      uint64_t v27 = PKSqueezePaletteBeforeToolsSpacing;
      a1[2] = (id)PKSqueezePaletteButtonInterItemSpacing;
      a1[3] = (id)v27;
      uint64_t v28 = PKSqueezePaletteAfterToolsSpacing;
      a1[4] = (id)PKSqueezePaletteToolsInterItemSpacing;
      a1[5] = (id)v28;
      v29 = -[PKFloatArray initWithCapacity:]([PKFloatArray alloc], [a1[39] count]);
      id v30 = a1[6];
      a1[6] = v29;

      *((int64x2_t *)a1 + 5) = vdupq_n_s64(0x4042800000000000uLL);
      a1[12] = (id)PKSqueezePaletteToolContainerWidth;
      v31 = objc_alloc_init(PKSqueezePaletteClipIndicatorView);
      id v32 = a1[22];
      a1[22] = v31;

      v33 = objc_alloc_init(PKViewWithHitTestHandler);
      id v34 = a1[20];
      a1[20] = v33;

      objc_initWeak(&location, a1);
      newValue[0] = MEMORY[0x1E4F143A8];
      newValue[1] = 3221225472;
      newValue[2] = __175__PKSqueezePaletteViewMiniPaletteLayout_initWithUndoButton_redoButton_drawingTools_selectedToolIndex_eraserToolIndex_visibleToolsCount_multicolorButton_moreButton_startAngle___block_invoke;
      newValue[3] = &unk_1E64C69C8;
      objc_copyWeak(&v44, &location);
      id v36 = a1[20];
      if (v36) {
        objc_setProperty_nonatomic_copy(v36, v35, newValue, 408);
      }
      uint64_t v37 = [MEMORY[0x1E4F39C88] layer];
      id v38 = a1[21];
      a1[21] = (id)v37;

      objc_destroyWeak(&v44);
      objc_destroyWeak(&location);
    }
  }

  return a1;
}

id __175__PKSqueezePaletteViewMiniPaletteLayout_initWithUndoButton_redoButton_drawingTools_selectedToolIndex_eraserToolIndex_visibleToolsCount_multicolorButton_moreButton_startAngle___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained(v4);
  id v8 = v6;
  id v9 = v5;
  if (!WeakRetained) {
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_9;
  }
  id v10 = objc_loadWeakRetained(WeakRetained + 36);
  v11 = v10;
  v12 = v10 ? (void *)*((void *)v10 + 71) : 0;
  v13 = v12;

  if (v13 != WeakRetained
    || (unint64_t v15 = [WeakRetained[39] indexOfObject:v8], v15 != 0x7FFFFFFFFFFFFFFFLL)
    && v15 < (unint64_t)WeakRetained[42])
  {
    id v14 = v8;
  }
  else
  {
LABEL_9:
    id v14 = 0;
  }

  return v14;
}

- (void)setPaletteView:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);

  if (WeakRetained != obj)
  {
    id v5 = objc_storeWeak((id *)&self->_paletteView, obj);
    undoRedoLayout = self->_undoRedoLayout;
    id v7 = v5;
    [(PKSqueezePaletteViewUndoRedoLayout *)undoRedoLayout setPaletteView:obj];
  }
}

- (void)_didTapDrawingTool:(id)a3
{
}

- (void)_performDrawingToolTapAction:(uint64_t)a1
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    v4 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138477827;
      id v6 = v3;
      _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "drawing tool tapped: %{private}@", (uint8_t *)&v5, 0xCu);
    }

    -[PKSqueezePaletteViewMiniPaletteLayout _selectTool:](a1, v3);
  }
}

- (void)_selectTool:(uint64_t)a1
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (-[PKSqueezePaletteViewMiniPaletteLayout _canSelectTool:atIndex:](a1, v3, [*(id *)(a1 + 312) indexOfObject:v3]))
  {
    uint64_t v4 = -[PKSqueezePaletteViewMiniPaletteLayout _selectedTool](a1);
    int v5 = (void *)v4;
    if (v4 && (id *)v4 == v3)
    {
      double v6 = -[PKFloatArray floatAtIndex:](*(void *)(a1 + 48), *(void *)(a1 + 320));
      id v7 = v3[102];
      int v8 = [v7 _isEraserTool];

      if (v8)
      {
        id v9 = (void (**)(void, void))-[PKSqueezePaletteViewExpandedEraserToolLayoutContext initWithDrawingTool:toolAngle:previousLayout:]((id *)[PKSqueezePaletteViewExpandedEraserToolLayoutContext alloc], v3, (void *)a1, v6);
        id v10 = (id *)(a1 + 288);
        id WeakRetained = objc_loadWeakRetained(v10);
        v12 = WeakRetained;
        if (WeakRetained) {
          v13 = (void *)*((void *)WeakRetained + 70);
        }
        else {
          v13 = 0;
        }
        id v14 = v13;
        -[PKSqueezePaletteViewLayoutFactory makeExpandedEraserToolLayoutWithContext:](v14, v9);
        id v15 = (id)objc_claimAutoreleasedReturnValue();

        v16 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_36;
        }
        LOWORD(v48) = 0;
        v17 = "Navigate to expanded eraser tool layout";
LABEL_35:
        _os_log_impl(&dword_1C44F8000, v16, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v48, 2u);
LABEL_36:

        id v47 = objc_loadWeakRetained(v10);
        -[PKSqueezePaletteView setCurrentLayout:]((uint64_t)v47, v15);

LABEL_37:
        goto LABEL_38;
      }
      id v22 = v3[102];
      int v23 = [v22 _isLassoTool];

      id v24 = v3[102];
      uint64_t v25 = v24;
      if (!v23)
      {
        uint64_t v37 = [v24 _configuration];
        id v38 = v37;
        if (v37 && [v37 supportsStrokeWeight] && v38[16])
        {
        }
        else
        {
          id v39 = v3[102];
          id v40 = [v39 _configuration];
          id v41 = v40;
          if (!v40 || ![v40 supportsOpacity])
          {

            goto LABEL_39;
          }
          int v42 = v41[17];

          if (!v42)
          {
LABEL_39:

            goto LABEL_40;
          }
        }
        id v9 = (void (**)(void, void))-[PKSqueezePaletteViewExpandedInkingToolLayoutContext initWithDrawingTool:toolAngle:previousLayout:]((id *)[PKSqueezePaletteViewExpandedInkingToolLayoutContext alloc], v3, (void *)a1, v6);
        id v10 = (id *)(a1 + 288);
        id v43 = objc_loadWeakRetained(v10);
        id v44 = v43;
        if (v43) {
          v45 = (void *)*((void *)v43 + 70);
        }
        else {
          v45 = 0;
        }
        objc_super v46 = v45;
        -[PKSqueezePaletteViewLayoutFactory makeExpandedInkingToolLayoutWithContext:](v46, v9);
        id v15 = (id)objc_claimAutoreleasedReturnValue();

        v16 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_36;
        }
        LOWORD(v48) = 0;
        v17 = "Navigate to expanded inking tool layout";
        goto LABEL_35;
      }
      id v9 = [v24 _barButtonItemsProvider];

      if (v9)
      {
        id v26 = v3[102];
        ((void (**)(void, id))v9)[2](v9, v26);
        id v15 = (id)objc_claimAutoreleasedReturnValue();

        if ([v15 count])
        {
          uint64_t v27 = -[PKSqueezePaletteViewExpandedLassoToolLayoutContext initWithDrawingTool:toolAngle:barButtonItems:previousLayout:]((id *)[PKSqueezePaletteViewExpandedLassoToolLayoutContext alloc], v3, v15, (void *)a1, v6);
          uint64_t v28 = (id *)(a1 + 288);
          id v29 = objc_loadWeakRetained(v28);
          id v30 = v29;
          if (v29) {
            v31 = (void *)*((void *)v29 + 70);
          }
          else {
            v31 = 0;
          }
          id v32 = v31;
          v33 = -[PKSqueezePaletteViewLayoutFactory makeExpandedLassoToolLayoutWithContext:]((uint64_t)v32, v27);

          id v34 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            int v48 = 134217984;
            uint64_t v49 = [v15 count];
            _os_log_impl(&dword_1C44F8000, v34, OS_LOG_TYPE_DEFAULT, "Navigate to expanded lasso tool layout, bar button items: %ld", (uint8_t *)&v48, 0xCu);
          }

          id v35 = objc_loadWeakRetained(v28);
          -[PKSqueezePaletteView setCurrentLayout:]((uint64_t)v35, v33);
        }
        goto LABEL_37;
      }
    }
    else
    {
      if (v3) {
        id v18 = v3[102];
      }
      else {
        id v18 = 0;
      }
      id v19 = v18;
      int v20 = [v19 _isRulerTool];

      if (!v20)
      {
        -[PKSqueezePaletteDrawingTool setSelected:animated:completion:](v5, 0, 1, 0);
        *(void *)(a1 + 320) = [*(id *)(a1 + 312) indexOfObject:v3];
        *(double *)(a1 + 256) = -[PKSqueezePaletteViewMiniPaletteLayout _defaultToolsContentClipIndicatorAngle](a1);
        -[PKSqueezePaletteDrawingTool setSelected:animated:completion:](v3, 1, 1, 0);
        id v9 = (void (**)(void, void))objc_loadWeakRetained((id *)(a1 + 288));
        if (v3) {
          id v36 = v3[102];
        }
        else {
          id v36 = 0;
        }
        id v15 = v36;
        -[PKSqueezePaletteView _didSelectTool:atIndex:]((uint64_t)v9, v15, *(void *)(a1 + 320));
        goto LABEL_37;
      }
      id v9 = (void (**)(void, void))-[PKSqueezePaletteViewTapRulerAction initWithRulerTool:]((id *)[PKSqueezePaletteViewTapRulerAction alloc], v3);
      -[PKSqueezePaletteViewTapRulerAction performAction]((uint64_t)v9);
      id v21 = objc_loadWeakRetained((id *)(a1 + 288));
      -[PKSqueezePaletteView _didTapRuler]((uint64_t)v21);
    }
LABEL_38:

    goto LABEL_39;
  }
LABEL_40:
}

- (uint64_t)_canSelectTool:(uint64_t)a3 atIndex:
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v5 = a2;
  if (!a1) {
    goto LABEL_13;
  }
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v6 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      id v7 = "can't select an untracked tool";
      int v8 = v6;
      uint32_t v9 = 2;
LABEL_11:
      _os_log_impl(&dword_1C44F8000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v16, v9);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 288));
  if (v5) {
    v11 = (void *)v5[102];
  }
  else {
    v11 = 0;
  }
  id v12 = v11;
  char v13 = -[PKSqueezePaletteView _canSelectTool:atIndex:]((uint64_t)WeakRetained, v12, a3);

  if ((v13 & 1) == 0)
  {
    double v6 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138477827;
      v17 = v5;
      id v7 = "can't select tool: %{private}@";
      int v8 = v6;
      uint32_t v9 = 12;
      goto LABEL_11;
    }
LABEL_12:

LABEL_13:
    uint64_t v14 = 0;
    goto LABEL_14;
  }
  uint64_t v14 = 1;
LABEL_14:

  return v14;
}

- (id)_selectedTool
{
  if (a1)
  {
    if (*(void *)(a1 + 320) == 0x7FFFFFFFFFFFFFFFLL)
    {
      a1 = 0;
    }
    else
    {
      a1 = objc_msgSend(*(id *)(a1 + 312), "objectAtIndexedSubscript:");
    }
    uint64_t v1 = vars8;
  }
  return (id)a1;
}

- (double)_defaultToolsContentClipIndicatorAngle
{
  if (!a1) {
    return 0.0;
  }
  uint64_t v2 = *(void *)(a1 + 336);
  if (!v2) {
    return 1.79769313e308;
  }
  double v3 = -[PKFloatArray floatAtIndex:](*(void *)(a1 + 48), v2 - 1);
  if (*(void *)(a1 + 320) == 2) {
    double v4 = 17.0;
  }
  else {
    double v4 = 10.0;
  }
  id WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 288));
  if (WeakRetained) {
    double v6 = WeakRetained[62];
  }
  else {
    double v6 = 0.0;
  }
  double v7 = v3 + v4 / v6;

  return v7;
}

- (void)_performMulticolorButtonTapAction
{
  if (!a1) {
    return;
  }
  uint64_t v2 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v25[0] = 0;
    _os_log_impl(&dword_1C44F8000, v2, OS_LOG_TYPE_DEFAULT, "multicolor button tapped", (uint8_t *)v25, 2u);
  }

  double v3 = [PKSqueezePaletteViewExpandedColorsLayoutContext alloc];
  double v4 = -[PKSqueezePaletteViewMiniPaletteLayout _selectedTool](a1);
  int v5 = -[PKSqueezePaletteViewExpandedColorsLayoutContext initWithSelectedTool:multicolorButton:multicolorButtonAngle:previousLayout:]((id *)&v3->super.isa, v4, *(void **)(a1 + 344), (void *)a1, *(double *)(a1 + 104));

  double v6 = (id *)(a1 + 288);
  id WeakRetained = (id *)objc_loadWeakRetained(v6);
  int v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = WeakRetained[72];
    id v10 = v9;
    if (v9)
    {
      v11 = (void *)*((void *)v9 + 4);
      goto LABEL_7;
    }
  }
  else
  {
    id v10 = 0;
  }
  v11 = 0;
LABEL_7:
  id v12 = v11;

  char v13 = (id *)objc_loadWeakRetained(v6);
  uint64_t v14 = v13;
  if (!v13)
  {
    int v16 = 0;
    goto LABEL_17;
  }
  id v15 = v13[72];
  int v16 = v15;
  if (!v15)
  {
LABEL_17:
    v17 = 0;
    goto LABEL_10;
  }
  v17 = (void *)*((void *)v15 + 5);
LABEL_10:
  id v18 = v17;

  id v19 = objc_loadWeakRetained(v6);
  int v20 = v19;
  if (v19) {
    id v21 = (void *)*((void *)v19 + 70);
  }
  else {
    id v21 = 0;
  }
  id v22 = v21;
  int v23 = -[PKSqueezePaletteViewLayoutFactory makeExpandedColorsLayoutWithContext:colors:selectedColor:](v22, v5, v12, v18);

  id v24 = objc_loadWeakRetained(v6);
  -[PKSqueezePaletteView setCurrentLayout:]((uint64_t)v24, v23);
}

- (void)_performMoreButtonTapAction
{
  if (a1)
  {
    uint64_t v2 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_1C44F8000, v2, OS_LOG_TYPE_DEFAULT, "more button tapped", v14, 2u);
    }

    double v3 = (id *)(a1 + 288);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 288));
    if (WeakRetained && (uint64_t v5 = WeakRetained[72]) != 0)
    {
      int v6 = *(unsigned __int8 *)(v5 + 8);

      if (v6)
      {
        double v7 = -[PKSqueezePaletteViewExpandedOptionsLayoutContext initMoreButtonAngle:previousLayout:]((id *)[PKSqueezePaletteViewExpandedOptionsLayoutContext alloc], (void *)a1, *(double *)(a1 + 112));
        id v8 = objc_loadWeakRetained((id *)(a1 + 288));
        id v9 = v8;
        if (v8) {
          id v10 = (void *)*((void *)v8 + 70);
        }
        else {
          id v10 = 0;
        }
        v11 = v10;
        id v12 = -[PKSqueezePaletteViewLayoutFactory makeExpandedOptionsLayoutWithContext:](v11, v7);

        id v13 = objc_loadWeakRetained(v3);
        -[PKSqueezePaletteView setCurrentLayout:]((uint64_t)v13, v12);

        goto LABEL_12;
      }
    }
    else
    {
    }
    double v7 = objc_loadWeakRetained((id *)(a1 + 288));
    -[PKSqueezePaletteView _didTapMoreOptionsButton:]((uint64_t)v7, *(void **)(a1 + 352));
LABEL_12:
  }
}

- (void)_handlePanGesture:(id)a3
{
  id v4 = a3;
  p_paletteView = &self->_paletteView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);
  [v4 locationInView:WeakRetained];
  double v8 = v7;
  double v10 = v9;

  id v11 = objc_loadWeakRetained((id *)&self->_paletteView);
  [v11 bounds];
  double MidX = CGRectGetMidX(v80);
  id v13 = objc_loadWeakRetained((id *)&self->_paletteView);
  [v13 bounds];
  double MidY = CGRectGetMidY(v81);

  long double v15 = atan2(v10 - MidY, v8 - MidX);
  double v16 = fmod(v15, 6.28318531);
  double v17 = 0.0;
  if (v15 <= 6.28318531 && v15 >= 0.0) {
    double v16 = v15;
  }
  if (v16 < 0.0) {
    double v16 = v16 + 6.28318531;
  }
  if (v16 == 0.0) {
    double v19 = 0.0;
  }
  else {
    double v19 = v16;
  }
  uint64_t v20 = [v4 state];
  if (v20 == 3)
  {
    self->_endPanGestureAngleOnArc = v19;
    [(NSArray *)self->_drawingTools enumerateObjectsUsingBlock:&__block_literal_global_15];
    double v30 = -[PKFloatArray floatAtIndex:]((uint64_t)self->_toolAngles, 0);
    v31 = (double *)objc_loadWeakRetained((id *)&self->_paletteView);
    if (v31) {
      double v17 = v31[64];
    }

    if (v30 - v17 >= 0.5)
    {
      id v40 = (PKFloatArray *)[(PKFloatArray *)self->_toolAnglesBeforePanning copy];
      toolAngles = self->_toolAngles;
      self->_toolAngles = v40;

      undoRedoLayout = self->_undoRedoLayout;
      if (undoRedoLayout)
      {
        undoRedoLayout->_undoButtonAngle = self->_initialUndoButtonAngle;
        -[PKSqueezePaletteViewUndoRedoLayout _updateUndoButtonConstraints]((uint64_t)undoRedoLayout);
        id v43 = self->_undoRedoLayout;
        if (v43)
        {
          v43->_double redoButtonAngle = self->_initialRedoButtonAngle;
          -[PKSqueezePaletteViewUndoRedoLayout _updateRedoButtonConstraints]((uint64_t)v43);
        }
      }
      *(_OWORD *)&self->_multicolorButtonAngle = *(_OWORD *)&self->_initialMulticolorButtonAngle;
      self->_toolsContentClippingIndicatorAngle = self->_initialToolsContentClippingIndicatorAngle;
      if ([(NSArray *)self->_drawingTools count])
      {
        unint64_t v44 = 0;
        double v45 = *MEMORY[0x1E4F1DAD8];
        double v46 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
        do
        {
          id v47 = (double *)objc_loadWeakRetained((id *)&self->_paletteView);
          int v48 = v47;
          if (v47) {
            double v49 = v47[62];
          }
          else {
            double v49 = 0.0;
          }
          double v50 = -[PKFloatArray floatAtIndex:]((uint64_t)self->_toolAngles, v44);
          double v51 = PKPointOnArc(v45, v46, v49, v50);
          double v53 = v52;

          v54 = [(NSArray *)self->_toolCenterXConstraints objectAtIndexedSubscript:v44];
          [v54 setConstant:v51];

          v55 = [(NSArray *)self->_toolCenterYConstraints objectAtIndexedSubscript:v44];
          [v55 setConstant:v53];

          ++v44;
        }
        while (v44 < [(NSArray *)self->_drawingTools count]);
      }
      [(PKSqueezePaletteViewMiniPaletteLayout *)self updateUI];
    }
    else
    {
      drawingTools = self->_drawingTools;
      v78[0] = MEMORY[0x1E4F143A8];
      v78[1] = 3221225472;
      v78[2] = __59__PKSqueezePaletteViewMiniPaletteLayout__handlePanGesture___block_invoke_4;
      v78[3] = &unk_1E64C69F0;
      v78[4] = self;
      [(NSArray *)drawingTools enumerateObjectsUsingBlock:v78];
      v33 = -[PKSqueezePaletteViewExpandedToolsLayoutContext initWithPreviousLayout:]((id *)[PKSqueezePaletteViewExpandedToolsLayoutContext alloc], self);
      id v34 = objc_loadWeakRetained((id *)&self->_paletteView);
      id v35 = v34;
      if (v34) {
        id v36 = (void *)*((void *)v34 + 70);
      }
      else {
        id v36 = 0;
      }
      id v37 = v36;
      id v38 = -[PKSqueezePaletteViewLayoutFactory makeExpandedToolsLayoutWithContext:drawingTools:selectedToolIndex:visibleToolsCount:delegate:]((uint64_t)v37, v33, self->_drawingTools, (void *)self->_selectedToolIndex, (void *)self->_visibleToolsCount, self);

      id v39 = objc_loadWeakRetained((id *)p_paletteView);
      -[PKSqueezePaletteView setCurrentLayout:]((uint64_t)v39, v38);
    }
    goto LABEL_63;
  }
  if (v20 != 2)
  {
    if (v20 == 1)
    {
      self->_startPanGestureLocation.y = v10;
      self->_double startPanGestureAngleOnArc = v19;
      self->_startPanGestureLocation.x = v8;
      id v21 = (PKFloatArray *)[(PKFloatArray *)self->_toolAngles copy];
      toolAnglesBeforePanning = self->_toolAnglesBeforePanning;
      self->_toolAnglesBeforePanning = v21;

      int v23 = self->_undoRedoLayout;
      if (v23)
      {
        self->_initialUndoButtonAngle = v23->_undoButtonAngle;
        double redoButtonAngle = v23->_redoButtonAngle;
      }
      else
      {
        self->_initialUndoButtonAngle = 0.0;
        double redoButtonAngle = 0.0;
      }
      self->_initialRedoButtonAngle = redoButtonAngle;
      *(_OWORD *)&self->_initialMulticolorButtonAngle = *(_OWORD *)&self->_multicolorButtonAngle;
      self->_initialToolsContentClippingIndicatorAngle = self->_toolsContentClippingIndicatorAngle;
      uint64_t v25 = self->_drawingTools;
      v79[0] = MEMORY[0x1E4F143A8];
      v79[1] = 3221225472;
      v79[2] = __59__PKSqueezePaletteViewMiniPaletteLayout__handlePanGesture___block_invoke;
      v79[3] = &unk_1E64C69F0;
      v79[4] = self;
      id v26 = v79;
LABEL_62:
      [(NSArray *)v25 enumerateObjectsUsingBlock:v26];
      goto LABEL_63;
    }
    goto LABEL_63;
  }
  uint64_t v27 = (unsigned __int8 *)objc_loadWeakRetained((id *)&self->_paletteView);
  if (v27)
  {
    int v28 = v27[480];
    double startPanGestureAngleOnArc = self->_startPanGestureAngleOnArc;

    if (v28)
    {
      if (v19 > startPanGestureAngleOnArc) {
        goto LABEL_63;
      }
      goto LABEL_40;
    }
  }
  else
  {
    double startPanGestureAngleOnArc = self->_startPanGestureAngleOnArc;
  }
  if (v19 < startPanGestureAngleOnArc) {
    goto LABEL_63;
  }
LABEL_40:
  double v56 = -[PKFloatArray floatAtIndex:]((uint64_t)self->_toolAnglesBeforePanning, 0)
      + v19
      - self->_startPanGestureAngleOnArc;
  v57 = (unsigned __int8 *)objc_loadWeakRetained((id *)&self->_paletteView);
  v58 = v57;
  if (v57)
  {
    int v59 = v57[480];
    v60 = (char *)objc_loadWeakRetained((id *)&self->_paletteView);
    if (v59)
    {
      if (v60)
      {
        uint64_t v61 = 512;
LABEL_49:
        double v62 = *(double *)&v60[v61];
        goto LABEL_50;
      }
      goto LABEL_64;
    }
  }
  else
  {
    v60 = (char *)objc_loadWeakRetained((id *)&self->_paletteView);
  }
  if (v60)
  {
    uint64_t v61 = 520;
    goto LABEL_49;
  }
LABEL_64:
  double v62 = 0.0;
LABEL_50:

  if (v56 >= v62)
  {
    if ([(NSArray *)self->_drawingTools count])
    {
      unint64_t v63 = 0;
      double v64 = *MEMORY[0x1E4F1DAD8];
      double v65 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      do
      {
        double v66 = -[PKFloatArray floatAtIndex:]((uint64_t)self->_toolAnglesBeforePanning, v63)
            + v19
            - self->_startPanGestureAngleOnArc;
        -[PKFloatArray setFloat:atIndex:]((uint64_t)self->_toolAngles, v63, v66);
        v67 = (double *)objc_loadWeakRetained((id *)&self->_paletteView);
        v68 = v67;
        if (v67) {
          double v69 = v67[62];
        }
        else {
          double v69 = 0.0;
        }
        double v70 = PKPointOnArc(v64, v65, v69, v66);
        double v72 = v71;

        v73 = [(NSArray *)self->_toolCenterXConstraints objectAtIndexedSubscript:v63];
        [v73 setConstant:v70];

        v74 = [(NSArray *)self->_toolCenterYConstraints objectAtIndexedSubscript:v63];
        [v74 setConstant:v72];

        ++v63;
      }
      while (v63 < [(NSArray *)self->_drawingTools count]);
    }
    v75 = self->_undoRedoLayout;
    if (v75)
    {
      v75->_undoButtonAngle = self->_initialUndoButtonAngle + v19 - self->_startPanGestureAngleOnArc;
      -[PKSqueezePaletteViewUndoRedoLayout _updateUndoButtonConstraints]((uint64_t)v75);
      v76 = self->_undoRedoLayout;
      if (v76)
      {
        v76->_double redoButtonAngle = self->_initialRedoButtonAngle + v19 - self->_startPanGestureAngleOnArc;
        -[PKSqueezePaletteViewUndoRedoLayout _updateRedoButtonConstraints]((uint64_t)v76);
      }
    }
    *(double *)&uint64_t v77 = v19 - self->_startPanGestureAngleOnArc;
    *(float64x2_t *)&self->_multicolorButtonAngle = vsubq_f64(*(float64x2_t *)&self->_initialMulticolorButtonAngle, (float64x2_t)vdupq_lane_s64(v77, 0));
    self->_toolsContentClippingIndicatorAngle = self->_initialToolsContentClippingIndicatorAngle - *(double *)&v77;
    [(PKSqueezePaletteViewMiniPaletteLayout *)self updateUI];
    uint64_t v25 = self->_drawingTools;
    id v26 = &__block_literal_global_14;
    goto LABEL_62;
  }
LABEL_63:
}

void __59__PKSqueezePaletteViewMiniPaletteLayout__handlePanGesture___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(*(void *)(a1 + 32) + 288);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained bringSubviewToFront:v3];
}

void __59__PKSqueezePaletteViewMiniPaletteLayout__handlePanGesture___block_invoke_2(uint64_t a1, uint64_t a2)
{
}

void __59__PKSqueezePaletteViewMiniPaletteLayout__handlePanGesture___block_invoke_3(uint64_t a1, uint64_t a2)
{
}

uint64_t __59__PKSqueezePaletteViewMiniPaletteLayout__handlePanGesture___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 removeTarget:*(void *)(a1 + 32) action:sel__didTapDrawingTool_ forControlEvents:64];
}

- (uint64_t)_updateMulticolorButtonConstraints
{
  if (result)
  {
    uint64_t v1 = result;
    id WeakRetained = (double *)objc_loadWeakRetained((id *)(result + 288));
    id v3 = WeakRetained;
    if (WeakRetained) {
      double v4 = WeakRetained[62];
    }
    else {
      double v4 = 0.0;
    }
    double v5 = PKPointOnArc(*MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v4, *(double *)(v1 + 104));
    double v7 = v6;

    [*(id *)(v1 + 224) setConstant:v5];
    double v8 = *(void **)(v1 + 232);
    return [v8 setConstant:v7];
  }
  return result;
}

- (uint64_t)_updateMoreButtonConstraints
{
  if (result)
  {
    uint64_t v1 = result;
    id WeakRetained = (double *)objc_loadWeakRetained((id *)(result + 288));
    id v3 = WeakRetained;
    if (WeakRetained) {
      double v4 = WeakRetained[62];
    }
    else {
      double v4 = 0.0;
    }
    double v5 = PKPointOnArc(*MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v4, *(double *)(v1 + 112));
    double v7 = v6;

    [*(id *)(v1 + 240) setConstant:v5];
    double v8 = *(void **)(v1 + 248);
    return [v8 setConstant:v7];
  }
  return result;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (self->_panGestureRecognizer == a3)
  {
    unint64_t visibleToolsCount = self->_visibleToolsCount;
    if (visibleToolsCount >= [(NSArray *)self->_drawingTools count])
    {
      BOOL v7 = 0;
    }
    else
    {
      p_paletteView = &self->_paletteView;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);
      [v6 locationInView:WeakRetained];
      double v12 = v11;
      double v14 = v13;

      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long double v15 = self->_drawingTools;
      uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v28;
        while (2)
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v28 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            id v21 = objc_loadWeakRetained((id *)p_paletteView);
            objc_msgSend(v21, "convertPoint:toView:", v20, v12, v14, (void)v27);
            CGFloat v23 = v22;
            CGFloat v25 = v24;

            [v20 bounds];
            v33.x = v23;
            v33.y = v25;
            if (CGRectContainsPoint(v34, v33))
            {
              BOOL v7 = 1;
              goto LABEL_15;
            }
          }
          uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
          if (v17) {
            continue;
          }
          break;
        }
      }
      BOOL v7 = 0;
LABEL_15:
    }
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (BOOL)expandedToolsLayout:(id)a3 canSelectTool:(id)a4 atIndex:(unint64_t)a5
{
  return -[PKSqueezePaletteViewMiniPaletteLayout _canSelectTool:atIndex:]((uint64_t)self, a4, a5);
}

- (void)expandedToolsLayout:(id)a3 didChangeSelectedToolIndex:(unint64_t)a4
{
  self->_selectedToolIndex = a4;
}

- (void)expandedToolsLayout:(id)a3 didChangeDrawingTools:(id)a4
{
  double v5 = (NSArray *)objc_msgSend(a4, "copy", a3);
  drawingTools = self->_drawingTools;
  self->_drawingTools = v5;
}

- (void)setupUI
{
  uint64_t v162 = *MEMORY[0x1E4F143B8];
  [(PKSqueezePaletteViewUndoRedoLayout *)self->_undoRedoLayout setupUI];
  p_paletteView = (id *)&self->_paletteView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);

  if (!WeakRetained) {
    return;
  }
  v133 = self;
  objc_initWeak(&location, self);
  v156[0] = MEMORY[0x1E4F143A8];
  v156[1] = 3221225472;
  v156[2] = __48__PKSqueezePaletteViewMiniPaletteLayout_setupUI__block_invoke;
  v156[3] = &unk_1E64C5998;
  objc_copyWeak(&v157, &location);
  [(UIView *)self->_multicolorButton _set_pk_longSqueezeAction:v156];
  v154[0] = MEMORY[0x1E4F143A8];
  v154[1] = 3221225472;
  v154[2] = __48__PKSqueezePaletteViewMiniPaletteLayout_setupUI__block_invoke_2;
  v154[3] = &unk_1E64C5998;
  objc_copyWeak(&v155, &location);
  [(UIButton *)self->_moreButton _set_pk_longSqueezeAction:v154];
  long long v152 = 0u;
  long long v153 = 0u;
  long long v150 = 0u;
  long long v151 = 0u;
  id obj = self->_drawingTools;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v150 objects:v161 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v151;
    uint64_t v6 = MEMORY[0x1E4F143A8];
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v151 != v5) {
          objc_enumerationMutation(obj);
        }
        double v8 = *(void **)(*((void *)&v150 + 1) + 8 * i);
        objc_initWeak(&from, v8);
        v147[0] = v6;
        v147[1] = 3221225472;
        v147[2] = __48__PKSqueezePaletteViewMiniPaletteLayout_setupUI__block_invoke_3;
        v147[3] = &unk_1E64C6A38;
        objc_copyWeak(&v148, &location);
        objc_copyWeak(&v149, &from);
        objc_msgSend(v8, "_set_pk_longSqueezeAction:", v147);
        objc_destroyWeak(&v149);
        objc_destroyWeak(&v148);
        objc_destroyWeak(&from);
      }
      uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v150 objects:v161 count:16];
    }
    while (v4);

    double v9 = self;
    if (!self) {
      goto LABEL_13;
    }
  }
  else
  {

    double v9 = self;
  }
  unint64_t visibleToolsCount = v9->_visibleToolsCount;
  LOBYTE(v9) = visibleToolsCount < [(NSArray *)v9->_drawingTools count];
LABEL_13:
  self->_clipIndicatorViewVisible = (char)v9;
  double v11 = (UIPanGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:self action:sel__handlePanGesture_];
  panGestureRecognizer = self->_panGestureRecognizer;
  self->_panGestureRecognizer = v11;

  [(UIPanGestureRecognizer *)self->_panGestureRecognizer setDelegate:self];
  id v13 = objc_loadWeakRetained(p_paletteView);
  [v13 addGestureRecognizer:self->_panGestureRecognizer];

  [(PKViewWithHitTestHandler *)self->_toolsContentView setTranslatesAutoresizingMaskIntoConstraints:0];
  id v14 = objc_loadWeakRetained(p_paletteView);
  long double v15 = v14;
  if (v14) {
    uint64_t v16 = (void *)*((void *)v14 + 68);
  }
  else {
    uint64_t v16 = 0;
  }
  id v17 = v16;
  [v17 addSubview:v133->_toolsContentView];

  v121 = (void *)MEMORY[0x1E4F28DC8];
  v128 = [(PKViewWithHitTestHandler *)v133->_toolsContentView topAnchor];
  id v18 = objc_loadWeakRetained(p_paletteView);
  v130 = v18;
  if (v18) {
    double v19 = (void *)*((void *)v18 + 68);
  }
  else {
    double v19 = 0;
  }
  id v119 = v19;
  id obja = [v119 topAnchor];
  v127 = [v128 constraintEqualToAnchor:obja];
  v160[0] = v127;
  v124 = [(PKViewWithHitTestHandler *)v133->_toolsContentView leadingAnchor];
  id v20 = objc_loadWeakRetained(p_paletteView);
  v125 = v20;
  if (v20) {
    id v21 = (void *)*((void *)v20 + 68);
  }
  else {
    id v21 = 0;
  }
  id v120 = v21;
  v126 = [v120 leadingAnchor];
  v123 = [v124 constraintEqualToAnchor:v126];
  v160[1] = v123;
  v122 = [(PKViewWithHitTestHandler *)v133->_toolsContentView trailingAnchor];
  id v22 = objc_loadWeakRetained(p_paletteView);
  CGFloat v23 = v22;
  if (v22) {
    double v24 = (void *)*((void *)v22 + 68);
  }
  else {
    double v24 = 0;
  }
  id v25 = v24;
  id v26 = [v25 trailingAnchor];
  long long v27 = [v122 constraintEqualToAnchor:v26];
  v160[2] = v27;
  long long v28 = [(PKViewWithHitTestHandler *)v133->_toolsContentView bottomAnchor];
  id v29 = objc_loadWeakRetained(p_paletteView);
  long long v30 = v29;
  if (v29) {
    v31 = (void *)*((void *)v29 + 68);
  }
  else {
    v31 = 0;
  }
  id v32 = v31;
  CGPoint v33 = [v32 bottomAnchor];
  CGRect v34 = [v28 constraintEqualToAnchor:v33];
  v160[3] = v34;
  id v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v160 count:4];
  [v121 activateConstraints:v35];

  id from = 0;
  p_id from = &from;
  uint64_t v145 = 0x2020000000;
  double v146 = 0.0;
  id v36 = (double *)objc_loadWeakRetained(p_paletteView);
  id v37 = v36;
  if (v36) {
    double v38 = v36[65];
  }
  else {
    double v38 = 0.0;
  }
  double beforeToolSpace = v133->_beforeToolSpace;
  id v40 = (double *)objc_loadWeakRetained(p_paletteView);
  if (v40) {
    double v41 = v40[62];
  }
  else {
    double v41 = 0.0;
  }

  double v146 = v38 + beforeToolSpace / v41;
  int v42 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](v133->_drawingTools, "count"));
  id v43 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](v133->_drawingTools, "count"));
  drawingTools = v133->_drawingTools;
  v139[0] = MEMORY[0x1E4F143A8];
  v139[1] = 3221225472;
  v139[2] = __48__PKSqueezePaletteViewMiniPaletteLayout_setupUI__block_invoke_4;
  v139[3] = &unk_1E64C6A60;
  v139[4] = v133;
  v142 = &from;
  id objb = v42;
  id v140 = objb;
  id v131 = v43;
  id v141 = v131;
  [(NSArray *)drawingTools enumerateObjectsUsingBlock:v139];
  uint64_t v45 = [objb copy];
  toolCenterXConstraints = v133->_toolCenterXConstraints;
  v133->_toolCenterXConstraints = (NSArray *)v45;

  uint64_t v47 = [v131 copy];
  toolCenterYConstraints = v133->_toolCenterYConstraints;
  v133->_toolCenterYConstraints = (NSArray *)v47;

  double v49 = v133;
  unint64_t v50 = v133->_visibleToolsCount;
  if (v50)
  {
    double v51 = -[PKFloatArray floatAtIndex:]((uint64_t)v133->_toolAngles, v50 - 1);
    double v49 = v133;
  }
  else
  {
    double v51 = *((double *)p_from + 3);
  }
  [(PKSqueezePaletteMulticolorSwatchButton *)v49->_multicolorButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(PKSqueezePaletteMulticolorSwatchButton *)v133->_multicolorButton addTarget:v133 action:sel__didTapMulticolorButton_ forControlEvents:64];
  id v52 = objc_loadWeakRetained(p_paletteView);
  double v53 = v52;
  if (v52) {
    v54 = (void *)*((void *)v52 + 69);
  }
  else {
    v54 = 0;
  }
  id v55 = v54;
  [v55 addSubview:v133->_multicolorButton];

  [(NSLayoutConstraint *)v133->_multicolorButtonCenterXConstraint setActive:0];
  [(NSLayoutConstraint *)v133->_multicolorButtonCenterYConstraint setActive:0];
  double v56 = [(PKSqueezePaletteMulticolorSwatchButton *)v133->_multicolorButton centerXAnchor];
  id v57 = objc_loadWeakRetained(p_paletteView);
  v58 = [v57 centerXAnchor];
  uint64_t v59 = [v56 constraintEqualToAnchor:v58];
  multicolorButtonCenterXConstraint = v133->_multicolorButtonCenterXConstraint;
  v133->_multicolorButtonCenterXConstraint = (NSLayoutConstraint *)v59;

  uint64_t v61 = [(PKSqueezePaletteMulticolorSwatchButton *)v133->_multicolorButton centerYAnchor];
  id v62 = objc_loadWeakRetained(p_paletteView);
  unint64_t v63 = [v62 centerYAnchor];
  uint64_t v64 = [v61 constraintEqualToAnchor:v63];
  multicolorButtonCenterYConstraint = v133->_multicolorButtonCenterYConstraint;
  v133->_multicolorButtonCenterYConstraint = (NSLayoutConstraint *)v64;

  double height = v133->_buttonSize.height;
  double afterToolSpace = v133->_afterToolSpace;
  v68 = (double *)objc_loadWeakRetained(p_paletteView);
  if (v68) {
    double v69 = v68[62];
  }
  else {
    double v69 = 0.0;
  }
  v133->_double multicolorButtonAngle = v51 + (height + afterToolSpace) / v69;

  -[PKSqueezePaletteViewMiniPaletteLayout _updateMulticolorButtonConstraints]((uint64_t)v133);
  [(UIButton *)v133->_moreButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIButton *)v133->_moreButton addTarget:v133 action:sel__didTapMoreButton_ forControlEvents:64];
  id v70 = objc_loadWeakRetained(p_paletteView);
  double v71 = v70;
  if (v70) {
    double v72 = (void *)*((void *)v70 + 69);
  }
  else {
    double v72 = 0;
  }
  id v73 = v72;
  [v73 addSubview:v133->_moreButton];

  [(NSLayoutConstraint *)v133->_moreButtonCenterXConstraint setActive:0];
  [(NSLayoutConstraint *)v133->_moreButtonCenterYConstraint setActive:0];
  v74 = [(UIButton *)v133->_moreButton centerXAnchor];
  id v75 = objc_loadWeakRetained(p_paletteView);
  v76 = [v75 centerXAnchor];
  uint64_t v77 = [v74 constraintEqualToAnchor:v76];
  moreButtonCenterXConstraint = v133->_moreButtonCenterXConstraint;
  v133->_moreButtonCenterXConstraint = (NSLayoutConstraint *)v77;

  v79 = [(UIButton *)v133->_moreButton centerYAnchor];
  id v80 = objc_loadWeakRetained(p_paletteView);
  CGRect v81 = [v80 centerYAnchor];
  uint64_t v82 = [v79 constraintEqualToAnchor:v81];
  moreButtonCenterYConstraint = v133->_moreButtonCenterYConstraint;
  v133->_moreButtonCenterYConstraint = (NSLayoutConstraint *)v82;

  double multicolorButtonAngle = v133->_multicolorButtonAngle;
  double v85 = v133->_buttonSize.height;
  double interButtonSpace = v133->_interButtonSpace;
  v87 = (double *)objc_loadWeakRetained(p_paletteView);
  if (v87) {
    double v88 = v87[62];
  }
  else {
    double v88 = 0.0;
  }
  v133->_moreButtonAngle = multicolorButtonAngle + (v85 + interButtonSpace) / v88;

  -[PKSqueezePaletteViewMiniPaletteLayout _updateMoreButtonConstraints]((uint64_t)v133);
  v129 = (void *)MEMORY[0x1E4F28DC8];
  v89 = [(PKSqueezePaletteMulticolorSwatchButton *)v133->_multicolorButton heightAnchor];
  v90 = [v89 constraintEqualToConstant:v133->_buttonSize.height];
  v159[0] = v90;
  v91 = [(PKSqueezePaletteMulticolorSwatchButton *)v133->_multicolorButton widthAnchor];
  v92 = [v91 constraintEqualToConstant:v133->_buttonSize.width];
  v93 = v133->_multicolorButtonCenterXConstraint;
  v94 = v133->_multicolorButtonCenterYConstraint;
  v159[1] = v92;
  v159[2] = v93;
  v159[3] = v94;
  v95 = [(UIButton *)v133->_moreButton heightAnchor];
  v96 = [v95 constraintEqualToConstant:v133->_buttonSize.height];
  v159[4] = v96;
  v97 = [(UIButton *)v133->_moreButton widthAnchor];
  v98 = [v97 constraintEqualToConstant:v133->_buttonSize.width];
  v99 = v133->_moreButtonCenterXConstraint;
  v100 = v133->_moreButtonCenterYConstraint;
  v159[5] = v98;
  v159[6] = v99;
  v159[7] = v100;
  v101 = [MEMORY[0x1E4F1C978] arrayWithObjects:v159 count:8];
  [v129 activateConstraints:v101];

  v133->_toolsContentClippingIndicatorAngle = -[PKSqueezePaletteViewMiniPaletteLayout _defaultToolsContentClipIndicatorAngle]((uint64_t)v133);
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  v102 = (double *)objc_loadWeakRetained(p_paletteView);
  v103 = v102;
  if (v102) {
    double v104 = v102[63];
  }
  else {
    double v104 = 0.0;
  }
  [(CAShapeLayer *)v133->_toolsContentClippingShapeMask setLineWidth:v104 + *(double *)&PKSqueezePaletteViewToolsContentClippingShapeMaskExtraLineWidth];

  [(CAShapeLayer *)v133->_toolsContentClippingShapeMask setLineCap:*MEMORY[0x1E4F3A450]];
  [(CAShapeLayer *)v133->_toolsContentClippingShapeMask setFillColor:0];
  id v105 = [MEMORY[0x1E4FB1618] blackColor];
  -[CAShapeLayer setStrokeColor:](v133->_toolsContentClippingShapeMask, "setStrokeColor:", [v105 CGColor]);

  toolsContentClippingShapeMask = v133->_toolsContentClippingShapeMask;
  v107 = [(PKViewWithHitTestHandler *)v133->_toolsContentView layer];
  [v107 setMask:toolsContentClippingShapeMask];

  [MEMORY[0x1E4F39CF8] commit];
  id v108 = objc_loadWeakRetained(p_paletteView);
  v109 = v108;
  if (v108) {
    v110 = (void *)*((void *)v108 + 69);
  }
  else {
    v110 = 0;
  }
  id v111 = v110;
  [v111 addSubview:v133->_clipIndicatorView];

  [(PKSqueezePaletteViewMiniPaletteLayout *)(uint64_t)v133 _updateClipIndicatorView];
  newValue[0] = MEMORY[0x1E4F143A8];
  newValue[1] = 3221225472;
  newValue[2] = __48__PKSqueezePaletteViewMiniPaletteLayout_setupUI__block_invoke_5;
  newValue[3] = &unk_1E64C5998;
  objc_copyWeak(&v138, &location);
  id v113 = objc_loadWeakRetained(p_paletteView);
  v115 = v113;
  if (v113) {
    objc_setProperty_nonatomic_copy(v113, v114, newValue, 592);
  }

  v116 = (double *)objc_loadWeakRetained(p_paletteView);
  v117 = v116;
  if (v116) {
    double v118 = v116[64];
  }
  else {
    double v118 = 0.0;
  }
  -[PKSqueezePaletteView updateUIStartAngle:endAngle:clockwise:animated:]((uint64_t)v116, 1, 1, v118, v133->_moreButtonAngle);

  objc_destroyWeak(&v138);
  _Block_object_dispose(&from, 8);
  objc_destroyWeak(&v155);
  objc_destroyWeak(&v157);
  objc_destroyWeak(&location);
}

void __48__PKSqueezePaletteViewMiniPaletteLayout_setupUI__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[PKSqueezePaletteViewMiniPaletteLayout _performMulticolorButtonTapAction]((uint64_t)WeakRetained);
}

void __48__PKSqueezePaletteViewMiniPaletteLayout_setupUI__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[PKSqueezePaletteViewMiniPaletteLayout _performMoreButtonTapAction]((uint64_t)WeakRetained);
}

void __48__PKSqueezePaletteViewMiniPaletteLayout_setupUI__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  -[PKSqueezePaletteViewMiniPaletteLayout _performDrawingToolTapAction:]((uint64_t)WeakRetained, v2);
}

void __48__PKSqueezePaletteViewMiniPaletteLayout_setupUI__block_invoke_4(uint64_t a1, void *a2, unint64_t a3)
{
  v37[4] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a2;
  [v4 setSelected:0];
  if (v4) {
    objc_storeWeak(v4 + 101, *(id *)(a1 + 32));
  }
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v4 addTarget:*(void *)(a1 + 32) action:sel__didTapDrawingTool_ forControlEvents:64];
  [*(id *)(*(void *)(a1 + 32) + 160) addSubview:v4];
  uint64_t v5 = [v4 centerXAnchor];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 288));
  BOOL v7 = [WeakRetained centerXAnchor];
  double v8 = [v5 constraintEqualToAnchor:v7];

  double v9 = [v4 centerYAnchor];
  id v10 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 288));
  double v11 = [v10 centerYAnchor];
  double v12 = [v9 constraintEqualToAnchor:v11];

  double v13 = *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  uint64_t v14 = *(void *)(a1 + 32);
  double v15 = *(double *)(v14 + 96) + *(double *)(v14 + 32);
  uint64_t v16 = (double *)objc_loadWeakRetained((id *)(v14 + 288));
  double v17 = 0.0;
  double v18 = 0.0;
  if (v16) {
    double v18 = v16[62];
  }
  double v19 = v13 + v15 / v18;

  id v20 = (double *)objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 288));
  id v21 = v20;
  if (v20) {
    double v17 = v20[62];
  }
  double v22 = PKPointOnArc(*MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v17, v19);
  double v24 = v23;

  [v8 setConstant:v22];
  [v12 setConstant:v24];
  id v25 = (void *)MEMORY[0x1E4F28DC8];
  v37[0] = v8;
  v37[1] = v12;
  id v35 = v12;
  id v26 = [v4 widthAnchor];
  long long v27 = [v26 constraintEqualToConstant:*(double *)(*(void *)(a1 + 32) + 96)];
  v37[2] = v27;
  long long v28 = [v4 heightAnchor];
  id v29 = (double *)objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 288));
  long long v30 = v29;
  v31 = v8;
  if (v29) {
    double v32 = v29[63];
  }
  else {
    double v32 = 0.0;
  }
  CGPoint v33 = [v28 constraintEqualToConstant:v32];
  v37[3] = v33;
  CGRect v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:4];
  [v25 activateConstraints:v34];

  [*(id *)(a1 + 40) addObject:v31];
  [*(id *)(a1 + 48) addObject:v35];
  -[PKFloatArray setFloat:atIndex:](*(void *)(*(void *)(a1 + 32) + 48), a3, v19);
  *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v19;
  [v4 setAlpha:1.0];
}

- (uint64_t)_updateClipIndicatorView
{
  if (result)
  {
    uint64_t v2 = result;
    LOBYTE(a2) = *(unsigned char *)(result + 184);
    result = [*(id *)(result + 176) setAlpha:(double)*(unint64_t *)&a2];
    if (*(void *)(v2 + 336))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(v2 + 288));
      [WeakRetained bounds];
      UIRectGetCenter();
      double v5 = v4;
      double v7 = v6;

      double v8 = (double *)objc_loadWeakRetained((id *)(v2 + 288));
      double v9 = v8;
      double v10 = 0.0;
      if (v8) {
        double v10 = v8[62];
      }
      PKPointOnArc(v5, v7, v10, *(double *)(v2 + 256));

      double v11 = *(void **)(v2 + 176);
      long long v12 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      v17[0] = *MEMORY[0x1E4F1DAB8];
      v17[1] = v12;
      v17[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      [v11 setTransform:v17];

      id v13 = objc_loadWeakRetained((id *)(v2 + 288));
      UIRectIntegralWithViewScale();
      objc_msgSend(*(id *)(v2 + 176), "setFrame:");

      CGAffineTransformMakeRotation(&v16, *(double *)(v2 + 256) + -1.57079633);
      uint64_t v14 = *(void **)(v2 + 176);
      CGAffineTransform v15 = v16;
      return [v14 setTransform:&v15];
    }
  }
  return result;
}

void __48__PKSqueezePaletteViewMiniPaletteLayout_setupUI__block_invoke_5(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    id v1 = objc_loadWeakRetained(WeakRetained + 36);
    [v1 bounds];
    UIRectGetCenter();
    double v3 = v2;
    double v5 = v4;

    id v6 = objc_loadWeakRetained(WeakRetained + 36);
    [v6 bounds];
    objc_msgSend(WeakRetained[21], "setFrame:");

    double v7 = (void *)MEMORY[0x1E4FB14C0];
    double v8 = (double *)objc_loadWeakRetained(WeakRetained + 36);
    double v9 = v8;
    if (v8) {
      double v10 = v8[62];
    }
    else {
      double v10 = 0.0;
    }
    double v11 = v10 + *(double *)&PKSqueezePaletteViewToolsContentClippingShapeMaskExtraLineWidth * 0.5;
    id v12 = objc_loadWeakRetained(WeakRetained + 36);
    id v13 = v12;
    if (v12) {
      BOOL v14 = *((unsigned char *)v12 + 480) != 0;
    }
    else {
      BOOL v14 = 0;
    }
    objc_msgSend(v7, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", v14, v3, v5, v11, 0.0, 6.28318531);
    id v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained[21], "setPath:", objc_msgSend(v15, "CGPath"));

    [MEMORY[0x1E4F39CF8] commit];
    [(PKSqueezePaletteViewMiniPaletteLayout *)(uint64_t)WeakRetained _updateClipIndicatorView];
  }
}

- (void)updateUI
{
  [(PKSqueezePaletteViewUndoRedoLayout *)self->_undoRedoLayout updateUI];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);

  if (!WeakRetained) {
    return;
  }
  drawingTools = self->_drawingTools;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __49__PKSqueezePaletteViewMiniPaletteLayout_updateUI__block_invoke;
  v35[3] = &unk_1E64C69F0;
  v35[4] = self;
  [(NSArray *)drawingTools enumerateObjectsUsingBlock:v35];
  -[PKSqueezePaletteViewMiniPaletteLayout _updateColorUIStyle]((uint64_t)self);
  [(PKSqueezePaletteMulticolorSwatchButton *)self->_multicolorButton setAlpha:1.0];
  [(UIButton *)self->_moreButton setAlpha:1.0];
  -[PKSqueezePaletteViewMiniPaletteLayout _updateMulticolorButtonConstraints]((uint64_t)self);
  -[PKSqueezePaletteViewMiniPaletteLayout _updateMoreButtonConstraints]((uint64_t)self);
  CGAffineTransformMakeRotation(&v34, self->_moreButtonAngle + 1.57079633);
  moreButton = self->_moreButton;
  CGAffineTransform v33 = v34;
  [(UIButton *)moreButton setTransform:&v33];
  CGAffineTransformMakeRotation(&v32, self->_multicolorButtonAngle + 1.57079633);
  multicolorButton = self->_multicolorButton;
  CGAffineTransform v31 = v32;
  [(PKSqueezePaletteMulticolorSwatchButton *)multicolorButton setTransform:&v31];
  [(PKSqueezePaletteViewMiniPaletteLayout *)(uint64_t)self _updateClipIndicatorView];
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  double v8 = [(PKViewWithHitTestHandler *)self->_toolsContentView layer];
  double v9 = [v8 mask];
  toolsContentClippingShapeMask = self->_toolsContentClippingShapeMask;

  if (self->_clipIndicatorViewVisible && v9 != toolsContentClippingShapeMask)
  {
    double v11 = self->_toolsContentClippingShapeMask;
    id v12 = [(PKViewWithHitTestHandler *)self->_toolsContentView layer];
    id v13 = v12;
    BOOL v14 = v11;
LABEL_8:
    [v12 setMask:v14];

    goto LABEL_9;
  }
  if (!self->_clipIndicatorViewVisible && v9 == toolsContentClippingShapeMask)
  {
    id v12 = [(PKViewWithHitTestHandler *)self->_toolsContentView layer];
    id v13 = v12;
    BOOL v14 = 0;
    goto LABEL_8;
  }
LABEL_9:
  [(CAShapeLayer *)self->_toolsContentClippingShapeMask setStrokeEnd:self->_toolsContentClippingIndicatorAngle / 6.28318531 + 0.0];
  [MEMORY[0x1E4F39CF8] commit];
  id v15 = -[PKSqueezePaletteViewMiniPaletteLayout _selectedTool]((uint64_t)self);
  [v15 setSelected:1];

  double v16 = (id *)objc_loadWeakRetained((id *)&self->_paletteView);
  double v17 = v16;
  if (!v16)
  {
    double v19 = 0;
    goto LABEL_21;
  }
  id v18 = v16[72];
  double v19 = v18;
  if (!v18)
  {
LABEL_21:
    id v20 = 0;
    goto LABEL_12;
  }
  id v20 = (void *)*((void *)v18 + 5);
LABEL_12:
  id v21 = v20;
  -[PKSqueezePaletteMulticolorSwatchButton setColor:]((uint64_t)self->_multicolorButton, v21);

  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  double v22 = (double *)objc_loadWeakRetained((id *)&self->_paletteView);
  double v23 = v22;
  double v24 = 0.0;
  double v25 = 0.0;
  if (v22) {
    double v25 = v22[64];
  }
  id v26 = objc_loadWeakRetained((id *)&self->_paletteView);
  long long v27 = v26;
  if (v26) {
    double v24 = *((double *)v26 + 63) * 0.5;
  }
  long long v28 = (double *)objc_loadWeakRetained((id *)&self->_paletteView);
  double v29 = 0.0;
  if (v28) {
    double v29 = v28[62];
  }
  double v30 = v25 - v24 / v29;

  [(CAShapeLayer *)self->_toolsContentClippingShapeMask setStrokeStart:v30 / 6.28318531 + 0.0];
  [MEMORY[0x1E4F39CF8] commit];
}

void __49__PKSqueezePaletteViewMiniPaletteLayout_updateUI__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  -[PKSqueezePaletteDrawingTool resetPointerInteractionTransform]((uint64_t)v5);
  double v6 = -[PKFloatArray floatAtIndex:](*(void *)(*(void *)(a1 + 32) + 48), a3);
  CGAffineTransformMakeRotation(&v8, v6 + 1.57079633);
  CGAffineTransform v7 = v8;
  [v5 setTransform:&v7];
}

- (void)_updateColorUIStyle
{
  if (a1)
  {
    double v2 = *(void **)(a1 + 312);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __60__PKSqueezePaletteViewMiniPaletteLayout__updateColorUIStyle__block_invoke;
    v7[3] = &unk_1E64C69F0;
    v7[4] = a1;
    [v2 enumerateObjectsUsingBlock:v7];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 288));
    double v4 = WeakRetained;
    if (WeakRetained) {
      uint64_t v5 = *((void *)WeakRetained + 73);
    }
    else {
      uint64_t v5 = 0;
    }
    uint64_t v6 = *(void *)(a1 + 344);
    if (v6)
    {
      if (*(void *)(v6 + 760) != v5)
      {
        *(void *)(v6 + 760) = v5;
        -[PKSqueezePaletteMulticolorSwatchButton _updateUI](v6);
      }
    }
  }
}

- (void)willTransitionToLayout:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  double v4 = a3;
  [(PKSqueezePaletteViewUndoRedoLayout *)self->_undoRedoLayout willTransitionToLayout:v4];
  objc_opt_class();
  double v5 = (double)(objc_opt_isKindOfClass() & 1);
  [(UIButton *)self->_undoButton setAlpha:v5];
  [(UIButton *)self->_redoButton setAlpha:v5];
  objc_opt_class();
  char v6 = objc_opt_isKindOfClass() & 1;
  drawingTools = self->_drawingTools;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __64__PKSqueezePaletteViewMiniPaletteLayout_willTransitionToLayout___block_invoke;
  v22[3] = &__block_descriptor_33_e25_v32__0__UIButton_8Q16_B24l;
  char v23 = v6;
  [(NSArray *)drawingTools enumerateObjectsUsingBlock:v22];
  [(PKSqueezePaletteMulticolorSwatchButton *)self->_multicolorButton setAlpha:0.0];
  [(UIButton *)self->_moreButton setAlpha:0.0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);
  [WeakRetained removeGestureRecognizer:self->_panGestureRecognizer];

  [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_toolCenterXConstraints];
  [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_toolCenterYConstraints];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v4) {
      double v9 = (void *)v4[3];
    }
    else {
      double v9 = 0;
    }
    id v10 = v9;
    -[PKMathResultAttribution setString:]((uint64_t)v10, self);
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(PKSqueezePaletteMulticolorSwatchButton *)self->_multicolorButton setAlpha:1.0];
    [(PKSqueezePaletteMulticolorSwatchButton *)self->_multicolorButton removeTarget:self action:sel__didTapMulticolorButton_ forControlEvents:64];
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v10 = [(NSArray *)self->_drawingTools objectAtIndexedSubscript:self->_selectedToolIndex];
    [v10 setAlpha:1.0];
LABEL_10:
  }
LABEL_11:
  self->_clipIndicatorViewVisible = 0;
  [(PKSqueezePaletteViewMiniPaletteLayout *)(uint64_t)self _updateClipIndicatorView];
  id v12 = [(PKViewWithHitTestHandler *)self->_toolsContentView layer];
  [v12 setMask:0];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v13 = self->_drawingTools;
  uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "removeTarget:action:forControlEvents:", self, sel__didTapDrawingTool_, 64, (void)v18);
      }
      uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v15);
  }
}

uint64_t __64__PKSqueezePaletteViewMiniPaletteLayout_willTransitionToLayout___block_invoke(uint64_t a1, void *a2, double a3)
{
  LOBYTE(a3) = *(unsigned char *)(a1 + 32);
  return [a2 setAlpha:(double)*(unint64_t *)&a3];
}

- (void)handlePencilInteractionDidTap:(int64_t)a3
{
  v38[1] = *(id *)MEMORY[0x1E4F143B8];
  double v5 = +[PKStatisticsManager sharedStatisticsManager]();
  -[PKStatisticsManager recordPencilAction:doubleTap:]((uint64_t)v5);

  switch(a3)
  {
    case 1:
      if (!self) {
        return;
      }
      switchToEraserAction = self->_switchToEraserAction;
      if (switchToEraserAction
        || (v7 = (PKSqueezePaletteViewSwitchToEraserAction *)-[PKSqueezePaletteViewSwitchToEraserAction initWitEraserToolIndex:toolsCount:]([PKSqueezePaletteViewSwitchToEraserAction alloc], self->_eraserToolIndex, [(NSArray *)self->_drawingTools count]), CGAffineTransform v8 = self->_switchToEraserAction, self->_switchToEraserAction = v7, v8, (switchToEraserAction = self->_switchToEraserAction) != 0))
      {
        unint64_t selectedToolIndex = self->_selectedToolIndex;
        unint64_t v10 = switchToEraserAction->_selectedToolIndex;
        if (v10 != selectedToolIndex)
        {
          switchToEraserAction->_lastSelectedToolIndex = v10;
          switchToEraserAction->_unint64_t selectedToolIndex = selectedToolIndex;
          if (v10 == 0x7FFFFFFFFFFFFFFFLL && switchToEraserAction->_eraserToolIndex == selectedToolIndex)
          {
            if (selectedToolIndex + 1 < switchToEraserAction->_toolsCount) {
              ++selectedToolIndex;
            }
            switchToEraserAction->_lastSelectedToolIndex = selectedToolIndex;
          }
        }
      }
      -[PKSqueezePaletteViewSwitchToEraserAction performAction](&self->_switchToEraserAction->super.isa);
      id v12 = self->_switchToEraserAction;
      if (v12)
      {
        unint64_t v13 = v12->_selectedToolIndex;
        if (v13 == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v14 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            NSUInteger v31 = [(NSArray *)self->_drawingTools count];
            unint64_t v33 = self->_selectedToolIndex;
            unint64_t eraserToolIndex = self->_eraserToolIndex;
            *(_DWORD *)buf = 134284033;
            *(void *)&buf[4] = v31;
            *(_WORD *)&buf[12] = 2049;
            *(void *)&buf[14] = eraserToolIndex;
            *(_WORD *)&buf[22] = 2049;
            id v37 = (void *)v33;
            _os_log_error_impl(&dword_1C44F8000, v14, OS_LOG_TYPE_ERROR, "Unable to perform switch to eraser action: next tool couldn't be determined. tools count: %{private}lu, eraser tool index: %{private}lu, selected tool index: %{private}lu", buf, 0x20u);
          }

          return;
        }
      }
      else
      {
        unint64_t v13 = 0;
      }
      id v34 = [(NSArray *)self->_drawingTools objectAtIndex:v13];
      -[PKSqueezePaletteViewMiniPaletteLayout _selectTool:]((uint64_t)self, v34);

      return;
    case 2:
      if (self)
      {
        if (self->_selectedToolIndex == 1) {
          uint64_t v26 = 2;
        }
        else {
          uint64_t v26 = 1;
        }
        long long v27 = [(NSArray *)self->_drawingTools objectAtIndex:v26];
        long long v28 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C44F8000, v28, OS_LOG_TYPE_DEFAULT, "Switch to previous tool.", buf, 2u);
        }

        -[PKSqueezePaletteViewMiniPaletteLayout _selectTool:]((uint64_t)self, v27);
      }
      return;
    case 3:
      if (!self) {
        return;
      }
      uint64_t v15 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C44F8000, v15, OS_LOG_TYPE_DEFAULT, "Show color palette.", buf, 2u);
      }

      objc_initWeak(&location, self);
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __86__PKSqueezePaletteViewMiniPaletteLayout__performPencilPreferredActionShowColorPalette__block_invoke;
      id v37 = &unk_1E64C6AA8;
      objc_copyWeak(v38, &location);
      id WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);
      long long v18 = WeakRetained;
      if (WeakRetained) {
        objc_setProperty_nonatomic_copy(WeakRetained, v17, buf, 600);
      }

      long long v19 = (id *)objc_loadWeakRetained((id *)&self->_paletteView);
      long long v20 = v19;
      if (v19)
      {
        id v21 = v19[72];
        double v22 = v21;
        if (v21)
        {
          char v23 = (void *)*((void *)v21 + 5);
LABEL_27:
          id v24 = v23;

          id v25 = objc_loadWeakRetained((id *)&self->_paletteView);
          -[PKSqueezePaletteView _didTapMulticolorButton:currentSelectedColor:]((uint64_t)v25, self->_multicolorButton, v24);

          objc_destroyWeak(v38);
          objc_destroyWeak(&location);
          return;
        }
      }
      else
      {
        double v22 = 0;
      }
      char v23 = 0;
      goto LABEL_27;
    case 4:
      if (self)
      {
        double v29 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C44F8000, v29, OS_LOG_TYPE_DEFAULT, "Show ink attributes.", buf, 2u);
        }

        double v30 = -[PKSqueezePaletteViewMiniPaletteLayout _selectedTool]((uint64_t)self);
        -[PKSqueezePaletteViewMiniPaletteLayout _selectTool:]((uint64_t)self, v30);
      }
      return;
    default:
      return;
  }
}

void __86__PKSqueezePaletteViewMiniPaletteLayout__performPencilPreferredActionShowColorPalette__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  double v4 = (id *)(a1 + 32);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  id v6 = v5;
  if (WeakRetained)
  {
    CGAffineTransform v7 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      id v16 = v6;
      _os_log_impl(&dword_1C44F8000, v7, OS_LOG_TYPE_DEFAULT, "Update multicolor button color from extended color picker, color: %{private}@", buf, 0xCu);
    }

    uint64_t v8 = -[PKSqueezePaletteViewMiniPaletteLayout _selectedTool]((uint64_t)WeakRetained);
    double v9 = (void *)v8;
    if (v8) {
      unint64_t v10 = *(void **)(v8 + 816);
    }
    else {
      unint64_t v10 = 0;
    }
    id v11 = v10;
    id v12 = (void *)[v11 _copyWithColor:v6];
    -[PKSqueezePaletteDrawingTool setTool:]((uint64_t)v9, v12);

    -[PKSqueezePaletteMulticolorSwatchButton setColor:](*((void *)WeakRetained + 43), v6);
    id v13 = objc_loadWeakRetained((id *)WeakRetained + 36);
    -[PKSqueezePaletteView _didSelectColor:isFromExtendedColorPicker:isContinuousColorSelection:]((uint64_t)v13, v6, 1, a3);
  }
}

void __60__PKSqueezePaletteViewMiniPaletteLayout__updateColorUIStyle__block_invoke(uint64_t a1, void *a2)
{
  double v2 = (id *)(*(void *)(a1 + 32) + 288);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  if (WeakRetained) {
    uint64_t v5 = WeakRetained[73];
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = WeakRetained;
  if (v3 && *((void *)v3 + 103) != v5)
  {
    *((void *)v3 + 103) = v5;
    objc_msgSend(*((id *)v3 + 93), "setColorUserInterfaceStyle:");
  }
}

- (double)toolAngle:(id)a3
{
  NSUInteger v4 = [(NSArray *)self->_drawingTools indexOfObject:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0.0;
  }
  unint64_t v6 = v4;
  toolAngles = self->_toolAngles;

  return -[PKFloatArray floatAtIndex:]((uint64_t)toolAngles, v6);
}

- (double)undoRedoLayoutStartAngle:(id)a3
{
  return self->_startAngle;
}

- (PKSqueezePaletteView)paletteView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);

  return (PKSqueezePaletteView *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moreButton, 0);
  objc_storeStrong((id *)&self->_multicolorButton, 0);
  objc_storeStrong((id *)&self->_drawingTools, 0);
  objc_storeStrong((id *)&self->_redoButton, 0);
  objc_storeStrong((id *)&self->_undoButton, 0);
  objc_destroyWeak((id *)&self->_paletteView);
  objc_storeStrong((id *)&self->_switchToEraserAction, 0);
  objc_storeStrong((id *)&self->_moreButtonCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_moreButtonCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_multicolorButtonCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_multicolorButtonCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_clipIndicatorView, 0);
  objc_storeStrong((id *)&self->_toolsContentClippingShapeMask, 0);
  objc_storeStrong((id *)&self->_toolsContentView, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_toolCenterYConstraints, 0);
  objc_storeStrong((id *)&self->_toolCenterXConstraints, 0);
  objc_storeStrong((id *)&self->_toolAnglesBeforePanning, 0);
  objc_storeStrong((id *)&self->_toolAngles, 0);

  objc_storeStrong((id *)&self->_undoRedoLayout, 0);
}

@end