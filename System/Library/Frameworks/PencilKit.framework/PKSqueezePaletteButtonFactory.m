@interface PKSqueezePaletteButtonFactory
- (PKSqueezePaletteButtonFactory)init;
- (PKSqueezePaletteObjectEraserButton)makeObjectEraserButton;
- (PKSqueezePaletteRoundedButton)makeMoreButton;
- (PKSqueezePaletteRoundedButton)makeRedoButtonIsLTR:(uint64_t)a1;
- (PKSqueezePaletteRoundedButton)makeUndoButtonIsLTR:(uint64_t)a1;
- (double)makeStrokeWeightButtonForTool:(double)a3 withWeight:;
- (id)_preferredButtonConfigurationWithSystemImageName:(uint64_t)a1;
- (id)_preferredButtonConfigurationWithSystemImageName:(void *)a3 baseBackgroundColor:;
- (id)makeBackButton;
- (id)makeColorSwatchButtonWithColor:(uint64_t)a1;
- (id)makeDrawingToolButtonWithTool:(uint64_t)a1;
- (id)makeGearButton;
- (id)makeMulticolorButtonWithColor:(uint64_t)a1;
- (id)makeShapesButton;
- (id)makeSignatureButton;
- (id)makeStickersButton;
- (id)makeTextBoxButton;
- (id)sliderButtonConfigurationIsLTR:(uint64_t)a1;
- (id)undoButtonConfigurationIsLTR:(uint64_t)a1;
@end

@implementation PKSqueezePaletteButtonFactory

- (PKSqueezePaletteButtonFactory)init
{
  v18.receiver = self;
  v18.super_class = (Class)PKSqueezePaletteButtonFactory;
  v2 = [(PKSqueezePaletteButtonFactory *)&v18 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:17.0];
    preferredFont = v2->_preferredFont;
    v2->_preferredFont = (UIFont *)v3;

    v2->_preferredImageScale = 2;
    uint64_t v5 = [MEMORY[0x1E4FB1618] colorWithDynamicProvider:&__block_literal_global_49];
    preferredBaseBackgroundColor = v2->_preferredBaseBackgroundColor;
    v2->_preferredBaseBackgroundColor = (UIColor *)v5;

    uint64_t v7 = [MEMORY[0x1E4FB1618] colorWithDynamicProvider:&__block_literal_global_3];
    preferredBaseForegroundColor = v2->_preferredBaseForegroundColor;
    v2->_preferredBaseForegroundColor = (UIColor *)v7;

    uint64_t v9 = [MEMORY[0x1E4FB1618] colorWithDynamicProvider:&__block_literal_global_5_0];
    strokeWeightButtonForegroundColor = v2->_strokeWeightButtonForegroundColor;
    v2->_strokeWeightButtonForegroundColor = (UIColor *)v9;

    uint64_t v11 = [MEMORY[0x1E4FB1618] colorWithDynamicProvider:&__block_literal_global_7_0];
    strokeWeightButtonSelectedForegroundColor = v2->_strokeWeightButtonSelectedForegroundColor;
    v2->_strokeWeightButtonSelectedForegroundColor = (UIColor *)v11;

    uint64_t v13 = [MEMORY[0x1E4FB1618] colorWithDynamicProvider:&__block_literal_global_9];
    strokeWeightButtonBackgroundColor = v2->_strokeWeightButtonBackgroundColor;
    v2->_strokeWeightButtonBackgroundColor = (UIColor *)v13;

    uint64_t v15 = [MEMORY[0x1E4FB1618] colorWithDynamicProvider:&__block_literal_global_11];
    strokeWeightButtonSelectedBackgroundColor = v2->_strokeWeightButtonSelectedBackgroundColor;
    v2->_strokeWeightButtonSelectedBackgroundColor = (UIColor *)v15;
  }
  return v2;
}

id __37__PKSqueezePaletteButtonFactory_init__block_invoke(uint64_t a1, void *a2)
{
  return PKSqueezePaletteButtonBaseBackgroundColor(a2);
}

id __37__PKSqueezePaletteButtonFactory_init__block_invoke_2(uint64_t a1, void *a2)
{
  return PKSqueezePaletteButtonBaseForegroundColor(a2);
}

id __37__PKSqueezePaletteButtonFactory_init__block_invoke_3(uint64_t a1, void *a2)
{
  return PKSqueezePaletteStrokeWeightButtonForegroundColor(a2);
}

id __37__PKSqueezePaletteButtonFactory_init__block_invoke_4(uint64_t a1, void *a2)
{
  return PKSqueezePaletteStrokeWeightButtonSelectedForegroundColor(a2);
}

uint64_t __37__PKSqueezePaletteButtonFactory_init__block_invoke_5()
{
  return PKSqueezePaletteStrokeWeightButtonBackgroundColor();
}

id __37__PKSqueezePaletteButtonFactory_init__block_invoke_6(uint64_t a1, void *a2)
{
  return PKSqueezePaletteStrokeWeightButtonSelectedBackgroundColor(a2);
}

- (id)sliderButtonConfigurationIsLTR:(uint64_t)a1
{
  if (a1)
  {
    v2 = -[PKSqueezePaletteButtonFactory undoButtonConfigurationIsLTR:](a1, a2);
    uint64_t v3 = [MEMORY[0x1E4FB1618] colorWithDynamicProvider:&__block_literal_global_13];
    [v2 setBaseBackgroundColor:v3];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)undoButtonConfigurationIsLTR:(uint64_t)a1
{
  if (a2) {
    v2 = @"arrow.uturn.left";
  }
  else {
    v2 = @"arrow.uturn.right";
  }
  uint64_t v3 = -[PKSqueezePaletteButtonFactory _preferredButtonConfigurationWithSystemImageName:](a1, v2);

  return v3;
}

id __64__PKSqueezePaletteButtonFactory_sliderButtonConfigurationIsLTR___block_invoke(uint64_t a1, void *a2)
{
  return PKSqueezePaletteButtonExpandedLayoutBaseBackgroundColor(a2);
}

- (id)_preferredButtonConfigurationWithSystemImageName:(uint64_t)a1
{
  if (a1)
  {
    a1 = -[PKSqueezePaletteButtonFactory _preferredButtonConfigurationWithSystemImageName:baseBackgroundColor:]((void *)a1, a2, *(void **)(a1 + 24));
    uint64_t v2 = vars8;
  }
  return (id)a1;
}

- (PKSqueezePaletteRoundedButton)makeUndoButtonIsLTR:(uint64_t)a1
{
  if (a1)
  {
    v4 = objc_alloc_init(PKSqueezePaletteRoundedButton);
    uint64_t v5 = -[PKSqueezePaletteButtonFactory undoButtonConfigurationIsLTR:](a1, a2);
    [(PKSqueezePaletteRoundedButton *)v4 setConfiguration:v5];

    [(PKSqueezePaletteRoundedButton *)v4 setAccessibilityIdentifier:@"Undo-Button"];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (PKSqueezePaletteRoundedButton)makeRedoButtonIsLTR:(uint64_t)a1
{
  if (a1)
  {
    v4 = objc_alloc_init(PKSqueezePaletteRoundedButton);
    if (a2) {
      uint64_t v5 = @"arrow.uturn.right";
    }
    else {
      uint64_t v5 = @"arrow.uturn.left";
    }
    v6 = -[PKSqueezePaletteButtonFactory _preferredButtonConfigurationWithSystemImageName:](a1, v5);
    [(PKSqueezePaletteRoundedButton *)v4 setConfiguration:v6];

    [(PKSqueezePaletteRoundedButton *)v4 setAccessibilityIdentifier:@"Redo-Button"];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)makeDrawingToolButtonWithTool:(uint64_t)a1
{
  if (a1)
  {
    id v2 = a2;
    id v3 = -[PKSqueezePaletteDrawingTool initWithTool:]([PKSqueezePaletteDrawingTool alloc], v2);
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)makeMulticolorButtonWithColor:(uint64_t)a1
{
  if (a1)
  {
    id v2 = a2;
    id v3 = -[PKSqueezePaletteMulticolorSwatchButton initWithColor:]((id *)[PKSqueezePaletteMulticolorSwatchButton alloc], v2);

    [v3 setAccessibilityIdentifier:@"MultiColor-Swatch"];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)makeColorSwatchButtonWithColor:(uint64_t)a1
{
  if (a1)
  {
    id v2 = a2;
    id v3 = -[PKSqueezePaletteColorSwatchButton initWithColor:]((id *)[PKSqueezePaletteColorSwatchButton alloc], v2);
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (PKSqueezePaletteRoundedButton)makeMoreButton
{
  if (a1)
  {
    id v2 = objc_alloc_init(PKSqueezePaletteRoundedButton);
    id v3 = -[PKSqueezePaletteButtonFactory _preferredButtonConfigurationWithSystemImageName:](a1, @"ellipsis");
    [(PKSqueezePaletteRoundedButton *)v2 setConfiguration:v3];

    [(PKSqueezePaletteRoundedButton *)v2 setAccessibilityIdentifier:@"More-Button"];
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

- (id)makeBackButton
{
  id v3 = objc_alloc_init(PKSqueezePaletteRoundedButton);
  v4 = [MEMORY[0x1E4FB1618] clearColor];
  uint64_t v5 = -[PKSqueezePaletteButtonFactory _preferredButtonConfigurationWithSystemImageName:baseBackgroundColor:](self, @"arrow.left", v4);
  [(PKSqueezePaletteRoundedButton *)v3 setConfiguration:v5];

  [(PKSqueezePaletteRoundedButton *)v3 setPointerStyleProvider:&__block_literal_global_42];
  [(PKSqueezePaletteRoundedButton *)v3 setAccessibilityIdentifier:@"Back-Button"];

  return v3;
}

- (id)_preferredButtonConfigurationWithSystemImageName:(void *)a3 baseBackgroundColor:
{
  if (a1)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4FB14D8];
    id v6 = a3;
    id v7 = a2;
    v8 = [v5 filledButtonConfiguration];
    uint64_t v9 = [MEMORY[0x1E4FB1830] configurationWithFont:a1[1] scale:a1[2]];
    v10 = [MEMORY[0x1E4FB1818] _systemImageNamed:v7 withConfiguration:v9];

    [v8 setImage:v10];
    [v8 setBaseBackgroundColor:v6];

    [v8 setBaseForegroundColor:a1[4]];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id __47__PKSqueezePaletteButtonFactory_makeBackButton__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v5 = (objc_class *)MEMORY[0x1E4FB1D48];
  id v6 = a4;
  id v7 = a2;
  v8 = (void *)[[v5 alloc] initWithView:v7];

  uint64_t v9 = [MEMORY[0x1E4FB1AC0] effectWithPreview:v8];
  v10 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v9 shape:v6];

  return v10;
}

- (id)makeTextBoxButton
{
  id v3 = objc_alloc_init(PKSqueezePaletteRoundedButton);
  v4 = -[PKSqueezePaletteButtonFactory _preferredButtonConfigurationWithSystemImageName:]((uint64_t)self, @"character.textbox");
  [(PKSqueezePaletteRoundedButton *)v3 setConfiguration:v4];

  [(PKSqueezePaletteRoundedButton *)v3 setAccessibilityIdentifier:@"Add Text"];

  return v3;
}

- (id)makeSignatureButton
{
  id v3 = objc_alloc_init(PKSqueezePaletteRoundedButton);
  v4 = -[PKSqueezePaletteButtonFactory _preferredButtonConfigurationWithSystemImageName:]((uint64_t)self, @"signature");
  [(PKSqueezePaletteRoundedButton *)v3 setConfiguration:v4];

  [(PKSqueezePaletteRoundedButton *)v3 setAccessibilityIdentifier:@"Add Signature"];

  return v3;
}

- (id)makeShapesButton
{
  id v3 = objc_alloc_init(PKSqueezePaletteRoundedButton);
  v4 = -[PKSqueezePaletteButtonFactory _preferredButtonConfigurationWithSystemImageName:]((uint64_t)self, @"square.on.circle");
  [(PKSqueezePaletteRoundedButton *)v3 setConfiguration:v4];

  [(PKSqueezePaletteRoundedButton *)v3 setAccessibilityIdentifier:@"Add Shape"];

  return v3;
}

- (id)makeStickersButton
{
  id v3 = objc_alloc_init(PKSqueezePaletteRoundedButton);
  v4 = -[PKSqueezePaletteButtonFactory _preferredButtonConfigurationWithSystemImageName:]((uint64_t)self, @"sticker");
  [(PKSqueezePaletteRoundedButton *)v3 setConfiguration:v4];

  [(PKSqueezePaletteRoundedButton *)v3 setAccessibilityIdentifier:@"Add Sticker"];

  return v3;
}

- (id)makeGearButton
{
  id v3 = objc_alloc_init(PKSqueezePaletteRoundedButton);
  v4 = -[PKSqueezePaletteButtonFactory _preferredButtonConfigurationWithSystemImageName:]((uint64_t)self, @"gearshape");
  [(PKSqueezePaletteRoundedButton *)v3 setConfiguration:v4];

  [(PKSqueezePaletteRoundedButton *)v3 setAccessibilityIdentifier:@"Settings-Button"];

  return v3;
}

- (PKSqueezePaletteObjectEraserButton)makeObjectEraserButton
{
  if (a1)
  {
    id v2 = objc_alloc_init(PKSqueezePaletteObjectEraserButton);
    objc_initWeak(&location, a1);
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    v10 = __55__PKSqueezePaletteButtonFactory_makeObjectEraserButton__block_invoke;
    uint64_t v11 = &unk_1E64C8C28;
    objc_copyWeak(&v12, &location);
    [(PKSqueezePaletteObjectEraserButton *)v2 setConfigurationUpdateHandler:&v8];
    id v3 = objc_msgSend(MEMORY[0x1E4FB14D8], "tintedButtonConfiguration", v8, v9, v10, v11);
    v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark"];
    uint64_t v5 = [MEMORY[0x1E4FB1618] blackColor];
    id v6 = [v4 imageWithTintColor:v5 renderingMode:2];
    [v3 setImage:v6];

    [(PKSqueezePaletteObjectEraserButton *)v2 setConfiguration:v3];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

void __55__PKSqueezePaletteButtonFactory_makeObjectEraserButton__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  WeakRetained = (char *)objc_loadWeakRetained(v2);
  v4 = [v3 configuration];
  int v5 = [v3 isSelected];
  uint64_t v6 = 56;
  if (v5) {
    uint64_t v6 = 64;
  }
  [v4 setBaseBackgroundColor:*(void *)&WeakRetained[v6]];
  int v7 = [v3 isSelected];
  uint64_t v8 = 40;
  if (v7) {
    uint64_t v8 = 48;
  }
  [v4 setBaseForegroundColor:*(void *)&WeakRetained[v8]];
  [v3 setConfiguration:v4];
}

- (double)makeStrokeWeightButtonForTool:(double)a3 withWeight:
{
  id v5 = a2;
  if (a1)
  {
    uint64_t v6 = -[PKSqueezePaletteStrokeWeightButton initWithStrokeWeight:]([PKSqueezePaletteStrokeWeightButton alloc], a3);
    objc_initWeak(&location, a1);
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __74__PKSqueezePaletteButtonFactory_makeStrokeWeightButtonForTool_withWeight___block_invoke;
    objc_super v18 = &unk_1E64C8C28;
    objc_copyWeak(&v19, &location);
    [v6 setConfigurationUpdateHandler:&v15];
    int v7 = objc_msgSend(MEMORY[0x1E4FB14D8], "tintedButtonConfiguration", v15, v16, v17, v18);
    uint64_t v8 = [v5 _configuration];
    uint64_t v9 = [v8 strokeWeightsToButtonImages];

    v10 = [NSNumber numberWithDouble:a3];
    uint64_t v11 = [v9 objectForKey:v10];
    id v12 = [MEMORY[0x1E4FB1618] blackColor];
    uint64_t v13 = [v11 imageWithTintColor:v12 renderingMode:2];
    [v7 setImage:v13];

    [v6 setConfiguration:v7];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

void __74__PKSqueezePaletteButtonFactory_makeStrokeWeightButtonForTool_withWeight___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = [v9 configuration];
    int v5 = [v9 isSelected];
    uint64_t v6 = 56;
    if (v5) {
      uint64_t v6 = 64;
    }
    [v4 setBaseBackgroundColor:*(void *)&WeakRetained[v6]];
    int v7 = [v9 isSelected];
    uint64_t v8 = 40;
    if (v7) {
      uint64_t v8 = 48;
    }
    [v4 setBaseForegroundColor:*(void *)&WeakRetained[v8]];
    [v9 setConfiguration:v4];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeWeightButtonSelectedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_strokeWeightButtonBackgroundColor, 0);
  objc_storeStrong((id *)&self->_strokeWeightButtonSelectedForegroundColor, 0);
  objc_storeStrong((id *)&self->_strokeWeightButtonForegroundColor, 0);
  objc_storeStrong((id *)&self->_preferredBaseForegroundColor, 0);
  objc_storeStrong((id *)&self->_preferredBaseBackgroundColor, 0);

  objc_storeStrong((id *)&self->_preferredFont, 0);
}

@end