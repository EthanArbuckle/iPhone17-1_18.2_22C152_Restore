@interface PKPaletteBaseColorPickerController
- (BOOL)supportsAlpha;
- (PKPaletteColorPickerControllerDelegate)delegate;
- (UIColor)selectedColor;
- (UIViewController)viewController;
- (int64_t)colorUserInterfaceStyle;
- (void)setColorUserInterfaceStyle:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setSelectedColor:(id)a3;
- (void)setSupportsAlpha:(BOOL)a3;
@end

@implementation PKPaletteBaseColorPickerController

- (UIViewController)viewController
{
  return self->_viewController;
}

- (PKPaletteColorPickerControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPaletteColorPickerControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIColor)selectedColor
{
  return self->_selectedColor;
}

- (void)setSelectedColor:(id)a3
{
}

- (BOOL)supportsAlpha
{
  return self->_supportsAlpha;
}

- (void)setSupportsAlpha:(BOOL)a3
{
  self->_supportsAlpha = a3;
}

- (int64_t)colorUserInterfaceStyle
{
  return self->_colorUserInterfaceStyle;
}

- (void)setColorUserInterfaceStyle:(int64_t)a3
{
  self->_colorUserInterfaceStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewController, 0);

  objc_storeStrong((id *)&self->_colorPicker, 0);
}

@end