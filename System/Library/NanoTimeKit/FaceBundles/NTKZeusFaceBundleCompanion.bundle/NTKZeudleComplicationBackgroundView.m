@interface NTKZeudleComplicationBackgroundView
- (CGRect)contentFrame;
- (CLKDevice)device;
- (NTKZeudleColorPalette)palette;
- (id)complicationColorForBlancEditMode:(int64_t)a3;
- (unint64_t)style;
- (void)setBlancEditModePalette:(id)a3;
- (void)setContentFrame:(CGRect)a3;
- (void)setDevice:(id)a3;
- (void)setPalette:(id)a3;
- (void)setStyle:(unint64_t)a3;
@end

@implementation NTKZeudleComplicationBackgroundView

- (void)setBlancEditModePalette:(id)a3
{
  objc_storeStrong((id *)&self->_palette, a3);

  [(NTKZeudleComplicationBackgroundView *)self applyBlancEditModeStyleChange];
}

- (void)setPalette:(id)a3
{
  objc_storeStrong((id *)&self->_palette, a3);

  [(NTKZeudleComplicationBackgroundView *)self applyStyleChange];
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
  [(NTKZeudleComplicationBackgroundView *)self applyStyleChange];
}

- (id)complicationColorForBlancEditMode:(int64_t)a3
{
  v4 = [(NTKZeudleComplicationBackgroundView *)self palette];
  v5 = v4;
  if (a3 == 1) {
    [v4 editMode];
  }
  else {
  v6 = [v4 bottomComplication];
  }

  return v6;
}

- (CGRect)contentFrame
{
  double x = self->_contentFrame.origin.x;
  double y = self->_contentFrame.origin.y;
  double width = self->_contentFrame.size.width;
  double height = self->_contentFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setContentFrame:(CGRect)a3
{
  self->_contentFrame = a3;
}

- (unint64_t)style
{
  return self->_style;
}

- (NTKZeudleColorPalette)palette
{
  return self->_palette;
}

- (CLKDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_palette, 0);
}

@end