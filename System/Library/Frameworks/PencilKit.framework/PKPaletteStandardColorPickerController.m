@interface PKPaletteStandardColorPickerController
- (BOOL)supportsAlpha;
- (PKPaletteStandardColorPickerController)init;
- (UIViewController)colorPickerViewController;
- (id)selectedColor;
- (int64_t)colorUserInterfaceStyle;
- (void)setColorPickerViewController:(id)a3;
@end

@implementation PKPaletteStandardColorPickerController

- (PKPaletteStandardColorPickerController)init
{
  v6.receiver = self;
  v6.super_class = (Class)PKPaletteStandardColorPickerController;
  v2 = [(PKPaletteStandardColorPickerController *)&v6 init];
  if (v2)
  {
    v3 = (UIViewController *)objc_alloc_init(MEMORY[0x1E4FB1EC0]);
    colorPickerViewController = v2->_colorPickerViewController;
    v2->_colorPickerViewController = v3;
  }
  return v2;
}

- (id)selectedColor
{
  return (id)[MEMORY[0x1E4FB1618] blackColor];
}

- (BOOL)supportsAlpha
{
  return 0;
}

- (int64_t)colorUserInterfaceStyle
{
  return 0;
}

- (UIViewController)colorPickerViewController
{
  return self->_colorPickerViewController;
}

- (void)setColorPickerViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end