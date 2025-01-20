@interface PKPaletteSystemColorPickerController
- (BOOL)_shouldConvertColorPickerColorFromDarkToLight;
- (BOOL)supportsAlpha;
- (PKPaletteSystemColorPickerController)init;
- (UIColorPickerViewController)colorPickerViewController;
- (id)selectedColor;
- (int64_t)colorUserInterfaceStyle;
- (void)colorPickerViewController:(id)a3 didSelectColor:(id)a4 continuously:(BOOL)a5;
- (void)dismissEyeDropper;
- (void)setColorPickerViewController:(id)a3;
- (void)setColorUserInterfaceStyle:(int64_t)a3;
- (void)setSelectedColor:(id)a3;
- (void)setSupportsAlpha:(BOOL)a3;
@end

@implementation PKPaletteSystemColorPickerController

- (PKPaletteSystemColorPickerController)init
{
  v6.receiver = self;
  v6.super_class = (Class)PKPaletteSystemColorPickerController;
  v2 = [(PKPaletteSystemColorPickerController *)&v6 init];
  if (v2)
  {
    v3 = (UIColorPickerViewController *)objc_alloc_init(MEMORY[0x1E4FB1628]);
    colorPickerViewController = v2->_colorPickerViewController;
    v2->_colorPickerViewController = v3;

    [(UIColorPickerViewController *)v2->_colorPickerViewController _setShouldUseDarkGridInDarkMode:1];
    [(UIColorPickerViewController *)v2->_colorPickerViewController setDelegate:v2];
  }
  return v2;
}

- (void)dismissEyeDropper
{
  v3 = os_log_create("com.apple.pencilkit", "PKPalette");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1C44F8000, v3, OS_LOG_TYPE_DEFAULT, "Dismiss eye dropper, don't reshow color picker.", v5, 2u);
  }

  v4 = [(PKPaletteSystemColorPickerController *)self colorPickerViewController];
  [v4 dismissEyedropper:0];
}

- (id)selectedColor
{
  v3 = [(PKPaletteSystemColorPickerController *)self colorPickerViewController];
  v4 = [v3 selectedColor];

  if ([(PKPaletteSystemColorPickerController *)self _shouldConvertColorPickerColorFromDarkToLight])
  {
    v5 = (void *)MEMORY[0x1E4FB1618];
    objc_super v6 = [(PKPaletteSystemColorPickerController *)self colorPickerViewController];
    v7 = [v6 selectedColor];
    uint64_t v8 = objc_msgSend(v5, "pk_convertColorPickerColor:fromUserInterfaceStyle:to:", v7, 2, 1);

    v4 = (void *)v8;
  }

  return v4;
}

- (void)setSelectedColor:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (v4)
  {
    id v5 = v4;
    if ([(PKPaletteSystemColorPickerController *)self _shouldConvertColorPickerColorFromDarkToLight])
    {
      uint64_t v6 = objc_msgSend(MEMORY[0x1E4FB1618], "pk_convertColorPickerColor:fromUserInterfaceStyle:to:", v5, 2, 1);

      id v5 = (id)v6;
    }
    v7 = [(PKPaletteSystemColorPickerController *)self colorPickerViewController];
    [v7 setSelectedColor:v5];
  }
  else
  {
    id v5 = [(PKPaletteSystemColorPickerController *)self colorPickerViewController];
    [v5 setSelectedColor:0];
  }
}

- (BOOL)supportsAlpha
{
  v2 = [(PKPaletteSystemColorPickerController *)self colorPickerViewController];
  char v3 = [v2 supportsAlpha];

  return v3;
}

- (void)setSupportsAlpha:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PKPaletteSystemColorPickerController *)self colorPickerViewController];
  [v4 setSupportsAlpha:v3];
}

- (int64_t)colorUserInterfaceStyle
{
  return [(UIColorPickerViewController *)self->_colorPickerViewController _userInterfaceStyleForGrid];
}

- (void)setColorUserInterfaceStyle:(int64_t)a3
{
}

- (BOOL)_shouldConvertColorPickerColorFromDarkToLight
{
  if ([(PKPaletteSystemColorPickerController *)self colorUserInterfaceStyle]
    && [(PKPaletteSystemColorPickerController *)self colorUserInterfaceStyle] != 2)
  {
    return 0;
  }
  BOOL v3 = [(PKPaletteSystemColorPickerController *)self colorPickerViewController];
  id v4 = [v3 traitCollection];
  BOOL v5 = [v4 userInterfaceStyle] == 2;

  return v5;
}

- (void)colorPickerViewController:(id)a3 didSelectColor:(id)a4 continuously:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = [(PKPaletteBaseColorPickerController *)self delegate];
  [v7 colorPickerControllerDidChangeSelectedColor:self isContinuousColorSelection:v5];
}

- (UIColorPickerViewController)colorPickerViewController
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