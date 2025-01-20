@interface AKColorPaletteButton
- (UIColor)color;
- (void)setColor:(id)a3;
@end

@implementation AKColorPaletteButton

- (void)setColor:(id)a3
{
  v5 = (UIColor *)a3;
  color = self->_color;
  if (color != v5)
  {
    v8 = v5;
    if (![(UIColor *)color akIsEqualToColor:v5])
    {
      objc_storeStrong((id *)&self->_color, a3);
      v7 = objc_msgSend(MEMORY[0x263F1C6B0], "ak_colorSwatchToolbarButtonImageWithColor:size:selected:", v8, 1, 19.0, 19.0);
      [(AKColorPaletteButton *)self setImage:v7 forState:0];
    }
  }

  MEMORY[0x270F9A758]();
}

- (UIColor)color
{
  return self->_color;
}

- (void).cxx_destruct
{
}

@end