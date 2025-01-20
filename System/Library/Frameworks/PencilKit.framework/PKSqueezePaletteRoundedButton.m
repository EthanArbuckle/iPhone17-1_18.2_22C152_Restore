@interface PKSqueezePaletteRoundedButton
- (PKSqueezePaletteRoundedButton)init;
- (void)layoutSubviews;
@end

@implementation PKSqueezePaletteRoundedButton

- (PKSqueezePaletteRoundedButton)init
{
  v5.receiver = self;
  v5.super_class = (Class)PKSqueezePaletteRoundedButton;
  v2 = -[PKSqueezePaletteRoundedButton initWithFrame:](&v5, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v3 = v2;
  if (v2) {
    [(PKSqueezePaletteRoundedButton *)v2 setPointerInteractionEnabled:1];
  }
  return v3;
}

- (void)layoutSubviews
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)PKSqueezePaletteRoundedButton;
  [(PKSqueezePaletteRoundedButton *)&v21 layoutSubviews];
  [(PKSqueezePaletteRoundedButton *)self bounds];
  double v4 = v3;
  [(PKSqueezePaletteRoundedButton *)self bounds];
  if (v4 >= v5) {
    double v6 = v5;
  }
  else {
    double v6 = v4;
  }
  double v7 = v6 * 0.5;
  v8 = [(PKSqueezePaletteRoundedButton *)self layer];
  [v8 setCornerRadius:v7];

  v9 = [(PKSqueezePaletteRoundedButton *)self layer];
  [v9 setMasksToBounds:1];

  v10 = [(PKSqueezePaletteRoundedButton *)self layer];
  [v10 setAllowsEdgeAntialiasing:1];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v11 = [(PKSqueezePaletteRoundedButton *)self layer];
  v12 = [v11 sublayers];

  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * v16++) setAllowsEdgeAntialiasing:1];
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v14);
  }
}

@end