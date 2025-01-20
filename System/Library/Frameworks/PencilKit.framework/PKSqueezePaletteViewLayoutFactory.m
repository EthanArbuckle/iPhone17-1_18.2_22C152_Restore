@interface PKSqueezePaletteViewLayoutFactory
- (PKSqueezePaletteViewLayoutFactory)init;
- (id)makeExpandedColorsLayoutWithContext:(void *)a3 colors:(void *)a4 selectedColor:;
- (id)makeExpandedLassoToolLayoutWithContext:(uint64_t)a1;
- (id)makeExpandedOptionsLayoutWithContext:(id *)a1;
- (id)makeExpandedToolsLayoutWithContext:(void *)a3 drawingTools:(void *)a4 selectedToolIndex:(void *)a5 visibleToolsCount:(void *)a6 delegate:;
- (id)makeExpandedUndoRedoLayoutWithContext:(int)a3 isLTR:;
- (uint64_t)makeInitialLayoutWithToolPicker:(void *)a3 undoManager:(void *)a4 paletteViewStartAngleProvider:(int)a5 isLTR:;
- (void)makeExpandedEraserToolLayoutWithContext:(void *)a1;
- (void)makeExpandedInkingToolLayoutWithContext:(void *)a1;
@end

@implementation PKSqueezePaletteViewLayoutFactory

- (PKSqueezePaletteViewLayoutFactory)init
{
  v3 = objc_alloc_init(PKSqueezePaletteButtonFactory);
  v4 = v3;
  if (self)
  {
    v7.receiver = self;
    v7.super_class = (Class)PKSqueezePaletteViewLayoutFactory;
    v5 = [(PKSqueezePaletteViewLayoutFactory *)&v7 init];
    self = v5;
    if (v5) {
      objc_storeStrong((id *)&v5->_buttonFactory, v3);
    }
  }

  return self;
}

- (uint64_t)makeInitialLayoutWithToolPicker:(void *)a3 undoManager:(void *)a4 paletteViewStartAngleProvider:(int)a5 isLTR:
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  v9 = a2;
  id v10 = a3;
  v11 = a4;
  if (a1)
  {
    v12 = [v9 _tools];
    uint64_t v13 = [v12 count];

    if (v13)
    {
      int v50 = a5;
      id v48 = v10;
      if (v9)
      {
        uint64_t v14 = [v9[1] indexOfObjectPassingTest:&__block_literal_global_194];
        uint64_t v15 = [v9 _indexOfTool:v9[16]];
        uint64_t v16 = [v9 _indexOfTool:v9[6]];
        if (v16 == 0x7FFFFFFFFFFFFFFFLL) {
          uint64_t v16 = [v9[1] indexOfObjectPassingTest:&__block_literal_global_192];
        }
        uint64_t v17 = [v9[1] indexOfObjectPassingTest:&__block_literal_global_196];
      }
      else
      {
        uint64_t v16 = 0;
        uint64_t v14 = 0;
        uint64_t v15 = 0;
        uint64_t v17 = 0;
      }
      v18 = [v9 _tools];
      v19 = (void *)[v18 mutableCopy];

      if (v14 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v20 = 0;
      }
      else
      {
        uint64_t v20 = [v19 objectAtIndex:v14];
      }
      if (v15 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v24 = 0;
      }
      else
      {
        uint64_t v24 = [v19 objectAtIndex:v15];
      }
      if (v16 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v56 = 0;
      }
      else
      {
        v56 = [v19 objectAtIndex:v16];
      }
      if (v17 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v25 = 0;
      }
      else
      {
        uint64_t v25 = [v19 objectAtIndex:v17];
      }
      if (v20)
      {
        [v19 removeObject:v20];
        [v19 insertObject:v20 atIndex:0];
        uint64_t v26 = 1;
        if (!v24) {
          goto LABEL_29;
        }
      }
      else
      {
        uint64_t v26 = 0;
        if (!v24) {
          goto LABEL_29;
        }
      }
      if (v24 != v20)
      {
        [v19 removeObject:v24];
        [v19 insertObject:v24 atIndex:v26++];
      }
LABEL_29:
      if (v56 && v56 != (void *)v20)
      {
        [v19 removeObject:v56];
        [v19 insertObject:v56 atIndex:v26];
      }
      if (v25)
      {
        [v19 removeObject:v25];
        [v19 addObject:v25];
      }
      if (v24)
      {
        uint64_t v27 = [v19 indexOfObjectIdenticalTo:v24];
        if (v20)
        {
LABEL_36:
          uint64_t v47 = [v19 indexOfObjectIdenticalTo:v20];
LABEL_39:
          v53 = (void *)v24;
          v54 = (void *)v20;
          double v28 = (double)(unint64_t)[v19 count];
          double v29 = *(double *)&PKSqueezePaletteVisibleToolsCount;
          if (*(double *)&PKSqueezePaletteVisibleToolsCount + 1.0 >= v28) {
            double v29 = (double)(unint64_t)objc_msgSend(v19, "count", *(double *)&PKSqueezePaletteVisibleToolsCount, v28, *(double *)&PKSqueezePaletteVisibleToolsCount + 1.0);
          }
          v49 = (void *)v29;
          v55 = v11;
          double v30 = v11[2](v11, 0);
          id v31 = v19;
          v32 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v31, "count"));
          long long v57 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          long long v60 = 0u;
          id v22 = v31;
          uint64_t v33 = [v22 countByEnumeratingWithState:&v57 objects:v61 count:16];
          if (v33)
          {
            uint64_t v34 = v33;
            uint64_t v35 = *(void *)v58;
            do
            {
              for (uint64_t i = 0; i != v34; ++i)
              {
                if (*(void *)v58 != v35) {
                  objc_enumerationMutation(v22);
                }
                v37 = -[PKSqueezePaletteButtonFactory makeDrawingToolButtonWithTool:](a1[1], *(void **)(*((void *)&v57 + 1) + 8 * i));
                [v32 addObject:v37];
              }
              uint64_t v34 = [v22 countByEnumeratingWithState:&v57 objects:v61 count:16];
            }
            while (v34);
          }
          v51 = v9;
          v52 = (void *)v25;

          v38 = -[PKSqueezePaletteButtonFactory makeUndoButtonIsLTR:](a1[1], v50);
          v39 = -[PKSqueezePaletteButtonFactory makeRedoButtonIsLTR:](a1[1], v50);
          v40 = -[PKSqueezePaletteButtonFactory makeMoreButton](a1[1]);
          v41 = (void *)v27;
          if (v27 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v42 = 0;
          }
          else
          {
            v43 = [v22 objectAtIndex:v27];
            v44 = [v43 ink];
            v42 = [v44 color];
          }
          id v10 = v48;
          v45 = -[PKSqueezePaletteButtonFactory makeMulticolorButtonWithColor:](a1[1], v42);
          a1 = (uint64_t *)-[PKSqueezePaletteViewMiniPaletteLayout initWithUndoButton:redoButton:drawingTools:selectedToolIndex:eraserToolIndex:visibleToolsCount:multicolorButton:moreButton:startAngle:]((id *)[PKSqueezePaletteViewMiniPaletteLayout alloc], v38, v39, v32, v41, (void *)v47, v49, v45, v30, v40);

          v23 = v54;
          v11 = v55;
          v9 = v51;
          goto LABEL_52;
        }
      }
      else
      {
        uint64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
        if (v20) {
          goto LABEL_36;
        }
      }
      uint64_t v47 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_39;
    }
    if (v10 && (([v10 canUndo] & 1) != 0 || objc_msgSend(v10, "canRedo")))
    {
      double v21 = v11[2](v11, 1);
      -[PKSqueezePaletteButtonFactory makeUndoButtonIsLTR:](a1[1], a5);
      id v22 = (id)objc_claimAutoreleasedReturnValue();
      v23 = -[PKSqueezePaletteButtonFactory makeRedoButtonIsLTR:](a1[1], a5);
      a1 = (uint64_t *)-[PKSqueezePaletteViewUndoRedoLayout initWithUndoButton:redoButton:startAngle:]((id *)[PKSqueezePaletteViewUndoRedoLayout alloc], v22, v23, v21);
LABEL_52:

      goto LABEL_53;
    }
    a1 = 0;
  }
LABEL_53:

  return a1;
}

- (id)makeExpandedUndoRedoLayoutWithContext:(int)a3 isLTR:
{
  if (a1)
  {
    id v5 = a2;
    v6 = [PKSqueezePaletteViewExpandedUndoRedoLayout alloc];
    objc_super v7 = -[PKSqueezePaletteButtonFactory sliderButtonConfigurationIsLTR:](*(void *)(a1 + 8), a3);
    v8 = -[PKSqueezePaletteViewExpandedUndoRedoLayout initWithContext:sliderButtonConfiguration:]((id *)&v6->super.isa, v5, v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)makeExpandedToolsLayoutWithContext:(void *)a3 drawingTools:(void *)a4 selectedToolIndex:(void *)a5 visibleToolsCount:(void *)a6 delegate:
{
  if (a1)
  {
    id v10 = a6;
    id v11 = a3;
    id v12 = a2;
    uint64_t v13 = -[PKSqueezePaletteViewExpandedToolsLayout initWithContext:drawingTools:selectedToolIndex:visibleToolsCount:]((id *)[PKSqueezePaletteViewExpandedToolsLayout alloc], v12, v11, a4, a5);

    if (v13) {
      objc_storeWeak(v13 + 7, v10);
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)makeExpandedColorsLayoutWithContext:(void *)a3 colors:(void *)a4 selectedColor:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
    uint64_t v23 = 0;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x2020000000;
    uint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __94__PKSqueezePaletteViewLayoutFactory_makeExpandedColorsLayoutWithContext_colors_selectedColor___block_invoke;
    v18 = &unk_1E64CAFC8;
    v19 = a1;
    id v11 = v10;
    id v20 = v11;
    id v21 = v9;
    id v22 = &v23;
    [v8 enumerateObjectsUsingBlock:&v15];
    id v12 = objc_msgSend(a1[1], "makeBackButton", v15, v16, v17, v18, v19);
    uint64_t v13 = [PKSqueezePaletteViewExpandedColorsLayout alloc];
    a1 = (id *)-[PKSqueezePaletteViewExpandedColorsLayout initWithContext:colorButtons:selectedColorIndex:backButton:](v13, v7, v11, v24[3], v12);

    _Block_object_dispose(&v23, 8);
  }

  return a1;
}

void __94__PKSqueezePaletteViewLayoutFactory_makeExpandedColorsLayoutWithContext_colors_selectedColor___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = a2;
  -[PKSqueezePaletteButtonFactory makeColorSwatchButtonWithColor:](v5, v6);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:");
  id v7 = [v6 color];

  id v8 = v7;
  LODWORD(v6) = DKUColorIsEqualToColorIgnoringOpacity((CGColor *)[v8 CGColor], (CGColor *)objc_msgSend(*(id *)(a1 + 48), "CGColor"), 1);

  if (v6) {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a3;
  }
}

- (id)makeExpandedOptionsLayoutWithContext:(id *)a1
{
  v2 = a1;
  if (a1)
  {
    id v3 = a2;
    v4 = [PKSqueezePaletteViewExpandedOptionsLayout alloc];
    uint64_t v5 = [v2[1] makeBackButton];
    id v6 = [v2[1] makeTextBoxButton];
    id v7 = [v2[1] makeSignatureButton];
    id v8 = [v2[1] makeShapesButton];
    BOOL v9 = PKIsDeviceLocked();
    if (v9)
    {
      id v10 = 0;
    }
    else
    {
      id v10 = [v2[1] makeStickersButton];
    }
    id v11 = [v2[1] makeGearButton];
    v2 = -[PKSqueezePaletteViewExpandedOptionsLayout initWithContext:backButton:textBoxButton:signatureButton:shapesButton:stickersButton:gearButton:](v4, v3, v5, v6, v7, v8, v10, v11);

    if (!v9) {
  }
    }

  return v2;
}

- (void)makeExpandedInkingToolLayoutWithContext:(void *)a1
{
  v2 = a1;
  if (a1)
  {
    id v3 = a2;
    v4 = v3;
    if (v3) {
      uint64_t v5 = (void *)*((void *)v3 + 3);
    }
    else {
      uint64_t v5 = 0;
    }
    id v6 = v5;
    id v7 = objc_opt_new();
    if (v6) {
      id v8 = (void *)v6[102];
    }
    else {
      id v8 = 0;
    }
    id v9 = v8;
    id v10 = [v9 _configuration];
    id v11 = [v10 strokeWeightsToButtonImages];

    id v12 = [v11 allKeys];
    uint64_t v13 = [v12 sortedArrayUsingSelector:sel_compare_];

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __77__PKSqueezePaletteViewLayoutFactory_makeExpandedInkingToolLayoutWithContext___block_invoke;
    v17[3] = &unk_1E64CAFF0;
    v17[4] = v2;
    id v18 = v6;
    id v19 = v7;
    id v14 = v7;
    uint64_t v15 = v6;
    [v13 enumerateObjectsUsingBlock:v17];
    v2 = -[PKSqueezePaletteViewExpandedInkingToolLayout initWithContext:strokeWeightButtons:]([PKSqueezePaletteViewExpandedInkingToolLayout alloc], v4, v14);
  }

  return v2;
}

void __77__PKSqueezePaletteViewLayoutFactory_makeExpandedInkingToolLayoutWithContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  v4 = *(void **)(*(void *)(a1 + 32) + 8);
  id v5 = a2;
  if (v3) {
    id v6 = *(void **)(v3 + 816);
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;
  [v5 floatValue];
  -[PKSqueezePaletteButtonFactory makeStrokeWeightButtonForTool:withWeight:](v4, v7, v8);
  id v22 = (id)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 48) addObject:v22];
  [v5 floatValue];
  float v10 = v9;

  double v11 = v10;
  id v12 = [*(id *)(a1 + 40) accessibilityLabel];
  [v22 setAccessibilityIdentifier:@"Weight"];
  if (v10 == -1.0
    || (fabs(v11 + 1.0) >= 0.000000999999997 ? (BOOL v13 = v10 == 10.0) : (BOOL v13 = 1),
        v13
     || (fabs(v11 + -10.0) >= 0.00000999999997 ? (BOOL v14 = v10 == 1.5) : (BOOL v14 = 1), v14 || fabs(v11 + -1.5) < 0.0000015)))
  {
    [v22 setAccessibilityLabel:@"Very Light"];
  }
  if (v10 == -0.5
    || (fabs(v11 + 0.5) >= 0.000000499999999 ? (BOOL v15 = v10 == 20.0) : (BOOL v15 = 1),
        v15
     || (fabs(v11 + -20.0) >= 0.0000199999999 ? (BOOL v16 = v10 == 2.5) : (BOOL v16 = 1),
         v16 || fabs(v11 + -2.5) < 0.00000249999999)))
  {
    [v22 setAccessibilityLabel:@"Light"];
  }
  if (v10 == 0.0
    || v10 == 30.0
    || (fabs(v11 + -30.0) >= 0.0000299999999 ? (BOOL v17 = v10 == 4.0) : (BOOL v17 = 1), v17
                                                                            || fabs(v11 + -4.0) < 0.00000399999999))
  {
    [v22 setAccessibilityLabel:@"Medium"];
  }
  if (v10 == 0.5
    || (fabs(v11 + -0.5) >= 0.000000499999999 ? (BOOL v18 = v10 == 60.0) : (BOOL v18 = 1),
        v18
     || (fabs(v11 + -60.0) >= 0.0000599999998 ? (BOOL v19 = v10 == 8.0) : (BOOL v19 = 1),
         v19 || fabs(v11 + -8.0) < 0.00000799999998)))
  {
    [v22 setAccessibilityLabel:@"Heavy"];
  }
  if (v10 == 1.0
    || (fabs(v11 + -1.0) >= 0.000000999999997 ? (BOOL v20 = v10 == 50.0) : (BOOL v20 = 1),
        v20
     || fabs(v11 + -50.0) < 0.0000499999999
     || v10 == 80.0
     || fabs(v11 + -80.0) < 0.0000799999998
     || v10 == 14.0
     || fabs(v11 + -14.0) < 0.000014))
  {
    [v22 setAccessibilityLabel:@"Very Heavy"];
  }
  if (v10 == 40.0 || fabs(v11 + -40.0) < 0.0000399999999)
  {
    if ([v12 isEqual:@"Watercolor"]) {
      id v21 = @"Medium";
    }
    else {
      id v21 = @"Heavy";
    }
    [v22 setAccessibilityLabel:v21];
  }
}

- (id)makeExpandedLassoToolLayoutWithContext:(uint64_t)a1
{
  if (a1)
  {
    id v2 = a2;
    uint64_t v3 = -[PKSqueezePaletteViewExpandedLassoToolLayout initWithContext:]((id *)[PKSqueezePaletteViewExpandedLassoToolLayout alloc], v2);
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)makeExpandedEraserToolLayoutWithContext:(void *)a1
{
  id v2 = a1;
  if (a1)
  {
    id v3 = a2;
    v4 = objc_opt_new();
    id v5 = -[PKSqueezePaletteButtonFactory makeObjectEraserButton](v2[1]);
    [v4 addObject:v5];
    id v6 = [[PKEraserTool alloc] initWithEraserType:1];
    id v7 = [(PKTool *)v6 _configuration];
    float v8 = [v7 strokeWeightsToButtonImages];

    float v9 = [v8 allKeys];
    float v10 = [v9 sortedArrayUsingSelector:sel_compare_];

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __77__PKSqueezePaletteViewLayoutFactory_makeExpandedEraserToolLayoutWithContext___block_invoke;
    v14[3] = &unk_1E64CAFF0;
    v14[4] = v2;
    BOOL v15 = v6;
    id v16 = v4;
    id v11 = v4;
    id v12 = v6;
    [v10 enumerateObjectsUsingBlock:v14];
    id v2 = (void **)-[PKSqueezePaletteViewExpandedEraserToolLayout initWithContext:attributeButtons:]([PKSqueezePaletteViewExpandedEraserToolLayout alloc], v3, v11);
  }

  return v2;
}

void __77__PKSqueezePaletteViewLayoutFactory_makeExpandedEraserToolLayoutWithContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 40);
  v4 = *(void **)(*(void *)(a1 + 32) + 8);
  [a2 floatValue];
  -[PKSqueezePaletteButtonFactory makeStrokeWeightButtonForTool:withWeight:](v4, v3, v5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 48) addObject:v6];
}

- (void).cxx_destruct
{
}

@end