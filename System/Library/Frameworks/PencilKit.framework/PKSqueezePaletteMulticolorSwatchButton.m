@interface PKSqueezePaletteMulticolorSwatchButton
- (id)initWithColor:(id *)a1;
- (void)_updateSwatchColor;
- (void)_updateUI;
- (void)setColor:(uint64_t)a1;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation PKSqueezePaletteMulticolorSwatchButton

- (id)initWithColor:(id *)a1
{
  v25[4] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (a1)
  {
    v24.receiver = a1;
    v24.super_class = (Class)PKSqueezePaletteMulticolorSwatchButton;
    v5 = (id *)objc_msgSendSuper2(&v24, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong(v5 + 94, a2);
      v6 = -[PKPaletteColorSwatch initWithSelectionRingInset:bulletInset:]([PKPaletteMulticolorSwatch alloc], 4.0, 7.0);
      id v7 = a1[93];
      a1[93] = v6;

      [a1[93] setUserInteractionEnabled:0];
      [a1[93] setTranslatesAutoresizingMaskIntoConstraints:0];
      [a1 addSubview:a1[93]];
      v18 = (void *)MEMORY[0x1E4F28DC8];
      v23 = [a1[93] centerXAnchor];
      v22 = [a1 centerXAnchor];
      v21 = [v23 constraintEqualToAnchor:v22];
      v25[0] = v21;
      v20 = [a1[93] centerYAnchor];
      v19 = [a1 centerYAnchor];
      v8 = [v20 constraintEqualToAnchor:v19];
      v25[1] = v8;
      v9 = [a1[93] widthAnchor];
      v10 = [a1 widthAnchor];
      v11 = [v9 constraintEqualToAnchor:v10];
      v25[2] = v11;
      v12 = [a1[93] heightAnchor];
      v13 = [a1 heightAnchor];
      v14 = [v12 constraintEqualToAnchor:v13];
      v25[3] = v14;
      v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:4];
      [v18 activateConstraints:v15];

      -[PKSqueezePaletteMulticolorSwatchButton _updateSwatchColor]((uint64_t)a1);
      -[PKSqueezePaletteMulticolorSwatchButton _updateUI]((uint64_t)a1);
      v16 = [a1[93] accessibilityIdentifier];
      [a1 setAccessibilityIdentifier:v16];
    }
  }

  return a1;
}

- (void)_updateSwatchColor
{
  if (a1)
  {
    v2 = *(void **)(a1 + 752);
    if (v2)
    {
      +[PKSwatchColor swatchColor:identifier:]((uint64_t)PKSwatchColor, v2, @"multi");
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 744) setSwatchColor:v4];
    }
    else
    {
      v3 = *(void **)(a1 + 744);
      [v3 setSwatchColor:0];
    }
  }
}

- (void)_updateUI
{
  if (a1)
  {
    [*(id *)(a1 + 744) setSelected:*(void *)(a1 + 752) != 0];
    int v2 = [(id)a1 isHighlighted];
    v3 = *(unsigned char **)(a1 + 744);
    if (v3 && v3[409] != v2)
    {
      v3[409] = v2;
      -[PKPaletteColorSwatch _updateSelectionHighlight](v3);
      v3 = *(unsigned char **)(a1 + 744);
    }
    uint64_t v4 = *(void *)(a1 + 760);
    -[PKPaletteColorSwatch setColorUserInterfaceStyle:](v3, v4);
  }
}

- (void)setColor:(uint64_t)a1
{
  id v4 = a2;
  if (a1 && *(id *)(a1 + 752) != v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(a1 + 752), a2);
    -[PKSqueezePaletteMulticolorSwatchButton _updateSwatchColor](a1);
    -[PKSqueezePaletteMulticolorSwatchButton _updateUI](a1);
    id v4 = v5;
  }
}

- (void)setSelected:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKSqueezePaletteMulticolorSwatchButton;
  [(PKSqueezePaletteMulticolorSwatchButton *)&v4 setSelected:a3];
  -[PKSqueezePaletteMulticolorSwatchButton _updateUI]((uint64_t)self);
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKSqueezePaletteMulticolorSwatchButton;
  [(PKSqueezePaletteMulticolorSwatchButton *)&v4 setHighlighted:a3];
  -[PKSqueezePaletteMulticolorSwatchButton _updateUI]((uint64_t)self);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);

  objc_storeStrong((id *)&self->_swatch, 0);
}

@end