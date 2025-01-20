@interface PKColorPicker
+ (id)_representableColorForColor:(id)a3;
- (BOOL)_canShowWhileLocked;
- (CGSize)preferredContentSize;
- (PKColorPicker)init;
- (PKColorPickerDelegate)delegate;
- (UIColor)selectedColor;
- (_PKColorPickerView)colorPickerView;
- (int64_t)colorUserInterfaceStyle;
- (void)_colorPickerViewDidChangeSelectedColor:(id)a3;
- (void)_colorPickerViewUserDidTouchUpInside:(id)a3;
- (void)_setInitialColorForSpringLoading:(id)a3;
- (void)_setSelectedColorForPoint:(CGPoint)a3;
- (void)setColorPickerView:(id)a3;
- (void)setColorUserInterfaceStyle:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setSelectedColor:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation PKColorPicker

- (PKColorPicker)init
{
  v7.receiver = self;
  v7.super_class = (Class)PKColorPicker;
  v2 = [(PKColorPicker *)&v7 init];
  v3 = [_PKColorPickerView alloc];
  uint64_t v4 = -[_PKColorPickerView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  colorPickerView = v2->_colorPickerView;
  v2->_colorPickerView = (_PKColorPickerView *)v4;

  [(_PKColorPickerView *)v2->_colorPickerView setDelegate:v2];
  return v2;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)PKColorPicker;
  [(PKColorPicker *)&v5 viewDidLoad];
  v3 = [(PKColorPicker *)self view];
  uint64_t v4 = [(PKColorPicker *)self colorPickerView];
  [v3 addSubview:v4];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewWillLayoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)PKColorPicker;
  [(PKColorPicker *)&v10 viewWillLayoutSubviews];
  v3 = [(PKColorPicker *)self view];
  uint64_t v4 = [v3 safeAreaLayoutGuide];
  [v4 layoutFrame];
  CGRect v12 = CGRectInset(v11, 5.0, 5.0);
  double x = v12.origin.x;
  double y = v12.origin.y;
  double width = v12.size.width;
  double height = v12.size.height;
  v9 = [(PKColorPicker *)self colorPickerView];
  objc_msgSend(v9, "setFrame:", x, y, width, height);
}

- (UIColor)selectedColor
{
  v2 = [(PKColorPicker *)self colorPickerView];
  v3 = [v2 selectedColor];

  return (UIColor *)v3;
}

- (void)setSelectedColor:(id)a3
{
  id v4 = a3;
  id v5 = [(PKColorPicker *)self colorPickerView];
  [v5 setSelectedColor:v4];
}

- (int64_t)colorUserInterfaceStyle
{
  v2 = [(_PKColorPickerView *)self->_colorPickerView gridColorPicker];
  int64_t v3 = [v2 colorUserInterfaceStyle];

  return v3;
}

- (void)setColorUserInterfaceStyle:(int64_t)a3
{
  id v4 = [(_PKColorPickerView *)self->_colorPickerView gridColorPicker];
  [v4 setColorUserInterfaceStyle:a3];
}

- (CGSize)preferredContentSize
{
  v2 = [(PKColorPicker *)self colorPickerView];
  objc_msgSend(v2, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)_setSelectedColorForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(PKColorPicker *)self view];
  double v7 = [(PKColorPicker *)self colorPickerView];
  objc_msgSend(v6, "convertPoint:toView:", v7, x, y);
  double v9 = v8;
  double v11 = v10;

  id v12 = [(PKColorPicker *)self colorPickerView];
  objc_msgSend(v12, "_setSelectedColorForPoint:", v9, v11);
}

- (void)_setInitialColorForSpringLoading:(id)a3
{
  id v4 = a3;
  id v5 = [(PKColorPicker *)self colorPickerView];
  [v5 setInitialColor:v4];
}

+ (id)_representableColorForColor:(id)a3
{
  return +[PKColorMatrixView _representableColorForColor:a3];
}

- (void)_colorPickerViewDidChangeSelectedColor:(id)a3
{
  id v4 = [(PKColorPicker *)self delegate];
  [v4 colorPickerDidChangeSelectedColor:self];
}

- (void)_colorPickerViewUserDidTouchUpInside:(id)a3
{
  uint64_t v4 = [(PKColorPicker *)self delegate];
  if (v4)
  {
    id v5 = (void *)v4;
    double v6 = [(PKColorPicker *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = [(PKColorPicker *)self delegate];
      [v8 _colorPickerUserDidTouchUpInside:self];
    }
  }
}

- (PKColorPickerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKColorPickerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_PKColorPickerView)colorPickerView
{
  return self->_colorPickerView;
}

- (void)setColorPickerView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorPickerView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end