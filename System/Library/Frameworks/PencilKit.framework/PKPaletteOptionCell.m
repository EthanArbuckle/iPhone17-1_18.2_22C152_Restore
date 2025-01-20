@interface PKPaletteOptionCell
- (PKPaletteOptionCell)init;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
@end

@implementation PKPaletteOptionCell

- (PKPaletteOptionCell)init
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaletteOptionCell;
  v2 = -[PKPaletteOptionCell initWithFrame:](&v5, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v2)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:v2];
    [(PKPaletteOptionCell *)v2 addInteraction:v3];
  }
  return v2;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  objc_super v5 = (void *)MEMORY[0x1E4FB1AD8];
  [(PKPaletteOptionCell *)self bounds];

  return (id)objc_msgSend(v5, "regionWithRect:identifier:", 0);
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:self];
  objc_super v5 = [MEMORY[0x1E4FB1AC0] effectWithPreview:v4];
  [v5 setPreferredTintMode:2];
  [v5 setPrefersScaledContent:0];
  v6 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v5 shape:0];

  return v6;
}

@end