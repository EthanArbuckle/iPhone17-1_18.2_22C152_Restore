@interface PKSqueezePaletteViewExpandedToolsLayout
- (PKSqueezePaletteView)paletteView;
- (id)_selectedTool;
- (id)initWithContext:(void *)a3 drawingTools:(void *)a4 selectedToolIndex:(void *)a5 visibleToolsCount:;
- (uint64_t)_updateToolsUIStyle;
- (void)_didTapDrawingTool:(id)a3;
- (void)_performDrawingToolTapAction:(uint64_t)a1;
- (void)handlePencilInteractionDidTap:(int64_t)a3;
- (void)setPaletteView:(id)a3;
- (void)setupUI;
- (void)updateUI;
- (void)willTransitionToLayout:(id)a3;
@end

@implementation PKSqueezePaletteViewExpandedToolsLayout

- (id)initWithContext:(void *)a3 drawingTools:(void *)a4 selectedToolIndex:(void *)a5 visibleToolsCount:
{
  id v10 = a2;
  id v11 = a3;
  if (a1)
  {
    v19.receiver = a1;
    v19.super_class = (Class)PKSqueezePaletteViewExpandedToolsLayout;
    v12 = (id *)objc_msgSendSuper2(&v19, sel_init);
    a1 = v12;
    if (v12)
    {
      objc_storeStrong(v12 + 8, a2);
      uint64_t v13 = [v11 copy];
      id v14 = a1[9];
      a1[9] = (id)v13;

      a1[10] = a4;
      a1[11] = a5;
      uint64_t v15 = PKSqueezePaletteToolContainerWidth;
      a1[1] = (id)PKSqueezePaletteToolsInterItemSpacing;
      a1[2] = (id)v15;
      v16 = -[PKFloatArray initWithCapacity:]([PKFloatArray alloc], [a1[9] count]);
      id v17 = a1[3];
      a1[3] = v16;
    }
  }

  return a1;
}

- (void)_didTapDrawingTool:(id)a3
{
}

- (void)_performDrawingToolTapAction:(uint64_t)a1
{
  v3 = a2;
  if (a1)
  {
    v23 = v3;
    unint64_t v4 = [*(id *)(a1 + 72) indexOfObject:v3];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    int v6 = [WeakRetained expandedToolsLayout:a1 canSelectTool:v23 atIndex:v4];

    v3 = v23;
    if (v6)
    {
      if (v23) {
        id v7 = v23[102];
      }
      else {
        id v7 = 0;
      }
      id v8 = v7;
      int v9 = [v8 _isRulerTool];

      if (v9)
      {
        id v10 = -[PKSqueezePaletteViewTapRulerAction initWithRulerTool:]((id *)[PKSqueezePaletteViewTapRulerAction alloc], v23);
        -[PKSqueezePaletteViewTapRulerAction performAction]((uint64_t)v10);
        id v11 = objc_loadWeakRetained((id *)(a1 + 48));
        -[PKSqueezePaletteView _didTapRuler]((uint64_t)v11);
      }
      else
      {
        -[PKSqueezePaletteViewExpandedToolsLayout _selectedTool](a1);
        v12 = (id *)objc_claimAutoreleasedReturnValue();
        id v10 = v12;
        if (v12 && v12 == v23)
        {
          uint64_t v13 = *(void **)(a1 + 64);
          if (v13) {
            uint64_t v13 = (void *)v13[1];
          }
        }
        else
        {
          -[PKSqueezePaletteDrawingTool setSelected:animated:completion:](v12, 0, 1, 0);
          -[PKSqueezePaletteDrawingTool setSelected:animated:completion:](v23, 1, 1, 0);
          if (v4 >= *(void *)(a1 + 88))
          {
            id v14 = (void *)[*(id *)(a1 + 72) mutableCopy];
            [v14 removeObjectAtIndex:v4];
            [v14 insertObject:v23 atIndex:1];
            uint64_t v15 = [v14 copy];
            v16 = *(void **)(a1 + 72);
            *(void *)(a1 + 72) = v15;

            *(void *)(a1 + 80) = 1;
            id v17 = objc_loadWeakRetained((id *)(a1 + 56));
            [v17 expandedToolsLayout:a1 didChangeDrawingTools:*(void *)(a1 + 72)];
          }
          else
          {
            *(void *)(a1 + 80) = v4;
          }
          id v18 = objc_loadWeakRetained((id *)(a1 + 56));
          [v18 expandedToolsLayout:a1 didChangeSelectedToolIndex:*(void *)(a1 + 80)];

          id v19 = objc_loadWeakRetained((id *)(a1 + 48));
          if (v23) {
            id v20 = v23[102];
          }
          else {
            id v20 = 0;
          }
          id v21 = v20;
          -[PKSqueezePaletteView _didSelectTool:atIndex:]((uint64_t)v19, v21, *(void *)(a1 + 80));

          uint64_t v13 = *(void **)(a1 + 64);
          if (v13) {
            uint64_t v13 = (void *)v13[1];
          }
        }
        id v11 = v13;
        id v22 = objc_loadWeakRetained((id *)(a1 + 48));
        -[PKSqueezePaletteView setCurrentLayout:]((uint64_t)v22, v11);
      }
      v3 = v23;
    }
  }
}

- (id)_selectedTool
{
  if (a1)
  {
    if (*(void *)(a1 + 80) == 0x7FFFFFFFFFFFFFFFLL)
    {
      a1 = 0;
    }
    else
    {
      a1 = objc_msgSend(*(id *)(a1 + 72), "objectAtIndexedSubscript:");
    }
    uint64_t v1 = vars8;
  }
  return (id)a1;
}

- (void)setupUI
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  p_paletteView = (id *)&self->_paletteView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);

  if (WeakRetained)
  {
    v31 = self;
    objc_initWeak(&location, self);
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    obj = self->_drawingTools;
    uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v43;
      uint64_t v6 = MEMORY[0x1E4F143A8];
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v43 != v5) {
            objc_enumerationMutation(obj);
          }
          id v8 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          objc_initWeak(from, v8);
          v39[0] = v6;
          v39[1] = 3221225472;
          v39[2] = __50__PKSqueezePaletteViewExpandedToolsLayout_setupUI__block_invoke;
          v39[3] = &unk_1E64C6A38;
          objc_copyWeak(&v40, from);
          objc_copyWeak(&v41, &location);
          objc_msgSend(v8, "_set_pk_longSqueezeAction:", v39);
          objc_destroyWeak(&v41);
          objc_destroyWeak(&v40);
          objc_destroyWeak(from);
        }
        uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v42 objects:v47 count:16];
      }
      while (v4);
    }

    from[0] = 0;
    from[1] = from;
    from[2] = (id)0x2020000000;
    uint64_t v38 = 0;
    int v9 = objc_loadWeakRetained(p_paletteView);
    if (v9) {
      uint64_t v10 = v9[64];
    }
    else {
      uint64_t v10 = 0;
    }

    uint64_t v38 = v10;
    id v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](v31->_drawingTools, "count"));
    v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](v31->_drawingTools, "count"));
    drawingTools = v31->_drawingTools;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __50__PKSqueezePaletteViewExpandedToolsLayout_setupUI__block_invoke_2;
    v33[3] = &unk_1E64C6A60;
    v33[4] = v31;
    v36 = from;
    id v14 = v11;
    id v34 = v14;
    id v15 = v12;
    id v35 = v15;
    [(NSArray *)drawingTools enumerateObjectsUsingBlock:v33];
    -[PKSqueezePaletteViewExpandedToolsLayout _updateToolsUIStyle]((uint64_t)v31);
    uint64_t v16 = [v14 copy];
    toolCenterXConstraints = v31->_toolCenterXConstraints;
    v31->_toolCenterXConstraints = (NSArray *)v16;

    uint64_t v18 = [v15 copy];
    toolCenterYConstraints = v31->_toolCenterYConstraints;
    v31->_toolCenterYConstraints = (NSArray *)v18;

    double v20 = -[PKFloatArray lastFloat]((uint64_t)v31->_toolAngles);
    double toolWidth = v31->_toolWidth;
    id v22 = (double *)objc_loadWeakRetained(p_paletteView);
    if (v22) {
      double v23 = v22[62];
    }
    else {
      double v23 = 0.0;
    }

    v24 = (double *)objc_loadWeakRetained(p_paletteView);
    v25 = v24;
    if (v24) {
      double v26 = v24[64];
    }
    else {
      double v26 = 0.0;
    }
    id v27 = objc_loadWeakRetained(p_paletteView);
    v28 = v27;
    if (v27) {
      char v29 = *((unsigned char *)v27 + 480) != 0;
    }
    else {
      char v29 = 0;
    }
    -[PKSqueezePaletteView updateUIStartAngle:endAngle:clockwise:animated:]((uint64_t)v25, v29, 1, v26, v20 + toolWidth / 6.0 / v23);

    _Block_object_dispose(from, 8);
    objc_destroyWeak(&location);
  }
}

void __50__PKSqueezePaletteViewExpandedToolsLayout_setupUI__block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)(a1 + 40));
    id v4 = objc_loadWeakRetained(v2);
    -[PKSqueezePaletteViewExpandedToolsLayout _performDrawingToolTapAction:]((uint64_t)v5, v4);
  }
}

void __50__PKSqueezePaletteViewExpandedToolsLayout_setupUI__block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  v28[2] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a2;
  [v6 addTarget:v5 action:sel__didTapDrawingTool_ forControlEvents:64];
  id v7 = [v6 centerXAnchor];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  int v9 = [WeakRetained centerXAnchor];
  uint64_t v10 = [v7 constraintEqualToAnchor:v9];

  id v11 = [v6 centerYAnchor];

  id v12 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  uint64_t v13 = [v12 centerYAnchor];
  id v14 = [v11 constraintEqualToAnchor:v13];

  double v15 = *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  if (a3)
  {
    uint64_t v16 = *(void *)(a1 + 32);
    double v17 = *(double *)(v16 + 16) + *(double *)(v16 + 8);
    uint64_t v18 = (double *)objc_loadWeakRetained((id *)(v16 + 48));
    if (v18) {
      double v19 = v18[62];
    }
    else {
      double v19 = 0.0;
    }
    double v15 = v15 + v17 / v19;
  }
  double v20 = (double *)objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  id v21 = v20;
  if (v20) {
    double v22 = v20[62];
  }
  else {
    double v22 = 0.0;
  }
  double v23 = PKPointOnArc(*MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v22, v15);
  double v25 = v24;

  [v10 setConstant:v23];
  [v14 setConstant:v25];
  double v26 = (void *)MEMORY[0x1E4F28DC8];
  v28[0] = v10;
  v28[1] = v14;
  id v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
  [v26 activateConstraints:v27];

  [*(id *)(a1 + 40) addObject:v10];
  [*(id *)(a1 + 48) addObject:v14];
  -[PKFloatArray setFloat:atIndex:](*(void *)(*(void *)(a1 + 32) + 24), a3, v15);
  *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v15;
}

- (uint64_t)_updateToolsUIStyle
{
  if (result)
  {
    uint64_t v1 = *(void **)(result + 72);
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __62__PKSqueezePaletteViewExpandedToolsLayout__updateToolsUIStyle__block_invoke;
    v2[3] = &unk_1E64C69F0;
    v2[4] = result;
    return [v1 enumerateObjectsUsingBlock:v2];
  }
  return result;
}

- (void)updateUI
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);

  if (WeakRetained)
  {
    drawingTools = self->_drawingTools;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __51__PKSqueezePaletteViewExpandedToolsLayout_updateUI__block_invoke;
    v6[3] = &unk_1E64C69F0;
    v6[4] = self;
    [(NSArray *)drawingTools enumerateObjectsUsingBlock:v6];
    uint64_t v5 = -[PKSqueezePaletteViewExpandedToolsLayout _selectedTool]((uint64_t)self);
    [v5 setSelected:1];
  }
}

void __51__PKSqueezePaletteViewExpandedToolsLayout_updateUI__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  [v5 setAlpha:1.0];
  double v6 = -[PKFloatArray floatAtIndex:](*(void *)(*(void *)(a1 + 32) + 24), a3);
  CGAffineTransformMakeRotation(&v8, v6 + 1.57079633);
  CGAffineTransform v7 = v8;
  [v5 setTransform:&v7];
}

- (void)willTransitionToLayout:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_toolCenterXConstraints];
  [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_toolCenterYConstraints];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = self->_drawingTools;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * i) removeTarget:self action:sel__didTapDrawingTool_ forControlEvents:64];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v6);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  int v9 = self->_drawingTools;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * j), "_set_pk_longSqueezeAction:", 0, (void)v14);
      }
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v11);
  }
}

- (void)handlePencilInteractionDidTap:(int64_t)a3
{
  -[PKSqueezePaletteViewExpandedToolsLayout _selectedTool]((uint64_t)self);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKSqueezePaletteViewExpandedToolsLayout _performDrawingToolTapAction:]((uint64_t)self, v4);
}

void __62__PKSqueezePaletteViewExpandedToolsLayout__updateToolsUIStyle__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(*(void *)(a1 + 32) + 48);
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
  objc_storeStrong((id *)&self->_drawingTools, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_paletteView);
  objc_storeStrong((id *)&self->_toolCenterYConstraints, 0);
  objc_storeStrong((id *)&self->_toolCenterXConstraints, 0);

  objc_storeStrong((id *)&self->_toolAngles, 0);
}

@end