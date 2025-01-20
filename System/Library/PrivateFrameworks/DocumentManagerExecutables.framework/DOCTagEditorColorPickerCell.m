@interface DOCTagEditorColorPickerCell
- (DOCHorizontalTagDotPicker)colorPickerView;
- (DOCTagEditorColorPickerCell)initWithFrame:(CGRect)a3;
- (UIGestureRecognizer)changeColorPanGestureRecognizer;
- (int64_t)selectedColor;
- (void)setColorPickerView:(id)a3;
@end

@implementation DOCTagEditorColorPickerCell

- (DOCTagEditorColorPickerCell)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)DOCTagEditorColorPickerCell;
  v3 = -[DOCTagEditorColorPickerCell initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(DOCHorizontalTagDotPicker);
    colorPickerView = v3->_colorPickerView;
    v3->_colorPickerView = v4;

    [(DOCHorizontalTagDotPicker *)v3->_colorPickerView setTranslatesAutoresizingMaskIntoConstraints:0];
    v6 = [(DOCTagEditorColorPickerCell *)v3 contentView];
    v7 = [(DOCTagEditorColorPickerCell *)v3 colorPickerView];
    [v6 addSubview:v7];

    v8 = [(DOCTagEditorColorPickerCell *)v3 colorPickerView];
    v9 = +[DOCTagAppearance makerUI];
    [v9 rowOfTagsContentInsets];
    v10 = DOCConstraintsToResizeWithSuperviewSafeArea();
    v11 = DOCConstraintsWithPriority();

    [MEMORY[0x263F08938] activateConstraints:v11];
    [(DOCTagEditorColorPickerCell *)v3 setHoverStyle:0];
  }
  return v3;
}

- (int64_t)selectedColor
{
  v2 = [(DOCTagEditorColorPickerCell *)self colorPickerView];
  int64_t v3 = [v2 selectedTagColor];

  return v3;
}

- (UIGestureRecognizer)changeColorPanGestureRecognizer
{
  v2 = [(DOCTagEditorColorPickerCell *)self colorPickerView];
  int64_t v3 = [v2 changeColorPanGestureRecognizer];

  return (UIGestureRecognizer *)v3;
}

- (DOCHorizontalTagDotPicker)colorPickerView
{
  return self->_colorPickerView;
}

- (void)setColorPickerView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end