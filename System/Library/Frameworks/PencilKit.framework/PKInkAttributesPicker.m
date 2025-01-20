@interface PKInkAttributesPicker
+ (double)defaultMinimumOpacityValue;
- (BOOL)_canShowWhileLocked;
- (BOOL)isUpdatingOpacityValue;
- (PKInk)selectedInk;
- (PKInkAttributesPicker)initWithInk:(id)a3 toolConfiguration:(id)a4;
- (PKInkAttributesPickerDelegate)delegate;
- (UIViewController)topViewController;
- (_PKInkAttributesPickerView)pickerView;
- (double)minimumOpacityValue;
- (int64_t)colorUserInterfaceStyle;
- (unint64_t)displayMode;
- (void)_inkAttributesPickerViewUserDidEndDraggingSlider:(id)a3;
- (void)_inkAttributesPickerViewUserDidStartDraggingSlider:(id)a3;
- (void)_notifyInkAttributesPickerDidChangeInk;
- (void)_updateUI;
- (void)inkAttributesPickerViewDidChangeInkOpacity:(id)a3;
- (void)inkAttributesPickerViewDidChangeInkThickness:(id)a3;
- (void)setColorUserInterfaceStyle:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayMode:(unint64_t)a3;
- (void)setMinimumOpacityValue:(double)a3;
- (void)setPickerView:(id)a3;
- (void)setSelectedInk:(id)a3;
- (void)setSelectedInk:(id)a3 animated:(BOOL)a4;
- (void)setTopViewController:(id)a3;
- (void)viewDidLoad;
@end

@implementation PKInkAttributesPicker

+ (double)defaultMinimumOpacityValue
{
  return 0.1;
}

- (PKInkAttributesPicker)initWithInk:(id)a3 toolConfiguration:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PKInkAttributesPicker;
  v8 = [(PKInkAttributesPicker *)&v17 init];
  v9 = v8;
  if (v8)
  {
    v8->_minimumOpacityValue = 0.1;
    v10 = [[_PKInkAttributesPickerView alloc] initWithInk:v6 toolConfiguration:v7];
    pickerView = v9->_pickerView;
    v9->_pickerView = v10;

    [(_PKInkAttributesPickerView *)v9->_pickerView setDelegate:v9];
    [(_PKInkAttributesPickerView *)v9->_pickerView setDisplayMode:[(PKInkAttributesPicker *)v9 displayMode]];
    id v12 = objc_alloc(MEMORY[0x1E4FB1C60]);
    v18[0] = v9->_pickerView;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    uint64_t v14 = [v12 initWithArrangedSubviews:v13];
    stackView = v9->_stackView;
    v9->_stackView = (UIStackView *)v14;

    [(UIStackView *)v9->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v9->_stackView setAxis:1];
    -[_PKInkAttributesPickerView sizeThatFits:](v9->_pickerView, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    -[PKInkAttributesPicker setPreferredContentSize:](v9, "setPreferredContentSize:");
    [(PKInkAttributesPicker *)v9 _updateUI];
  }

  return v9;
}

- (void)viewDidLoad
{
  v24.receiver = self;
  v24.super_class = (Class)PKInkAttributesPicker;
  [(PKInkAttributesPicker *)&v24 viewDidLoad];
  v3 = [(PKInkAttributesPicker *)self view];
  [v3 addSubview:self->_stackView];

  v4 = [(PKInkAttributesPicker *)self view];
  v5 = [v4 safeAreaLayoutGuide];
  id v6 = [v5 leadingAnchor];
  id v7 = [(UIStackView *)self->_stackView leadingAnchor];
  v8 = [v6 constraintEqualToAnchor:v7];
  [v8 setActive:1];

  v9 = [(PKInkAttributesPicker *)self view];
  v10 = [v9 safeAreaLayoutGuide];
  v11 = [v10 trailingAnchor];
  id v12 = [(UIStackView *)self->_stackView trailingAnchor];
  v13 = [v11 constraintEqualToAnchor:v12];
  [v13 setActive:1];

  uint64_t v14 = [(PKInkAttributesPicker *)self view];
  v15 = [v14 safeAreaLayoutGuide];
  v16 = [v15 topAnchor];
  objc_super v17 = [(UIStackView *)self->_stackView topAnchor];
  v18 = [v16 constraintEqualToAnchor:v17];
  [v18 setActive:1];

  v19 = [(PKInkAttributesPicker *)self view];
  v20 = [v19 safeAreaLayoutGuide];
  v21 = [v20 bottomAnchor];
  v22 = [(UIStackView *)self->_stackView bottomAnchor];
  v23 = [v21 constraintEqualToAnchor:v22];
  [v23 setActive:1];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setTopViewController:(id)a3
{
  v5 = (UIViewController *)a3;
  p_topViewController = &self->_topViewController;
  topViewController = self->_topViewController;
  if (topViewController != v5)
  {
    if (topViewController)
    {
      [(UIViewController *)topViewController willMoveToParentViewController:0];
      [(UIView *)self->_topViewControllerViewWrapper removeFromSuperview];
      [(UIViewController *)*p_topViewController removeFromParentViewController];
      topViewControllerViewWrapper = self->_topViewControllerViewWrapper;
      self->_topViewControllerViewWrapper = 0;
    }
    objc_storeStrong((id *)&self->_topViewController, a3);
    [(_PKInkAttributesPickerView *)self->_pickerView setShowsTopSeparator:*p_topViewController != 0];
    -[_PKInkAttributesPickerView sizeThatFits:](self->_pickerView, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    double v10 = v9;
    double v12 = v11;
    if (*p_topViewController)
    {
      v13 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      uint64_t v14 = self->_topViewControllerViewWrapper;
      self->_topViewControllerViewWrapper = v13;

      [(UIView *)self->_topViewControllerViewWrapper setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIView *)self->_topViewControllerViewWrapper setClipsToBounds:1];
      v15 = [(UIViewController *)*p_topViewController view];
      [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIView *)self->_topViewControllerViewWrapper addSubview:v15];
      [(PKInkAttributesPicker *)self addChildViewController:*p_topViewController];
      [(UIStackView *)self->_stackView insertArrangedSubview:self->_topViewControllerViewWrapper atIndex:0];
      [(UIViewController *)*p_topViewController didMoveToParentViewController:self];
      [(UIViewController *)*p_topViewController preferredContentSize];
      double v18 = v17;
      if (v16 == 0.0)
      {
        v19 = os_log_create("com.apple.pencilkit", "");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v35 = 0;
          _os_log_error_impl(&dword_1C44F8000, v19, OS_LOG_TYPE_ERROR, "View controller from viewControllerProvider has a preferredContentSize height of zero. Defaulting to 50pt height.", v35, 2u);
        }

        double v20 = 50.0;
      }
      else
      {
        double v20 = v16;
      }
      if (v10 < v18) {
        double v10 = v18;
      }
      double v12 = v12 + v20;
      v21 = [(UIView *)self->_topViewControllerViewWrapper heightAnchor];
      v22 = [v21 constraintEqualToConstant:v20];
      [v22 setActive:1];

      v23 = [v15 leadingAnchor];
      objc_super v24 = [(UIView *)self->_topViewControllerViewWrapper leadingAnchor];
      v25 = [v23 constraintEqualToAnchor:v24];
      [v25 setActive:1];

      v26 = [v15 trailingAnchor];
      v27 = [(UIView *)self->_topViewControllerViewWrapper trailingAnchor];
      v28 = [v26 constraintEqualToAnchor:v27];
      [v28 setActive:1];

      v29 = [v15 topAnchor];
      v30 = [(UIView *)self->_topViewControllerViewWrapper topAnchor];
      v31 = [v29 constraintEqualToAnchor:v30];
      [v31 setActive:1];

      v32 = [v15 bottomAnchor];
      v33 = [(UIView *)self->_topViewControllerViewWrapper bottomAnchor];
      v34 = [v32 constraintEqualToAnchor:v33];
      [v34 setActive:1];
    }
    -[PKInkAttributesPicker setPreferredContentSize:](self, "setPreferredContentSize:", v10, v12);
  }
}

- (void)setColorUserInterfaceStyle:(int64_t)a3
{
  id v4 = [(PKInkAttributesPicker *)self pickerView];
  [v4 setColorUserInterfaceStyle:a3];
}

- (int64_t)colorUserInterfaceStyle
{
  v2 = [(PKInkAttributesPicker *)self pickerView];
  int64_t v3 = [v2 colorUserInterfaceStyle];

  return v3;
}

- (void)setMinimumOpacityValue:(double)a3
{
  if (self->_minimumOpacityValue != a3)
  {
    self->_minimumOpacityValue = a3;
    [(PKInkAttributesPicker *)self _updateUI];
  }
}

- (void)_updateUI
{
  [(PKInkAttributesPicker *)self minimumOpacityValue];
  double v4 = v3;
  id v5 = [(PKInkAttributesPicker *)self pickerView];
  [v5 setMinimumOpacityValue:v4];
}

- (PKInk)selectedInk
{
  v2 = [(PKInkAttributesPicker *)self pickerView];
  double v3 = [v2 ink];

  return (PKInk *)v3;
}

- (void)setSelectedInk:(id)a3
{
}

- (void)setSelectedInk:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(PKInkAttributesPicker *)self pickerView];
  [v7 setInk:v6 animated:v4];
}

- (unint64_t)displayMode
{
  v2 = [(PKInkAttributesPicker *)self pickerView];
  unint64_t v3 = [v2 displayMode];

  return v3;
}

- (void)setDisplayMode:(unint64_t)a3
{
  id v5 = [(PKInkAttributesPicker *)self pickerView];
  [v5 setDisplayMode:a3];

  id v6 = [(PKInkAttributesPicker *)self pickerView];
  objc_msgSend(v6, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  -[PKInkAttributesPicker setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)_notifyInkAttributesPickerDidChangeInk
{
  uint64_t v3 = [(PKInkAttributesPicker *)self delegate];
  if (v3)
  {
    BOOL v4 = (void *)v3;
    id v5 = [(PKInkAttributesPicker *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [(PKInkAttributesPicker *)self delegate];
      [v7 inkAttributesPickerDidChangeSelectedInk:self];
    }
  }
}

- (void)inkAttributesPickerViewDidChangeInkThickness:(id)a3
{
  [(PKPaletteAttributeViewController *)self setDidExperienceUserInteraction:1];
  [(PKInkAttributesPicker *)self _notifyInkAttributesPickerDidChangeInk];
  uint64_t v4 = [(PKInkAttributesPicker *)self delegate];
  if (v4)
  {
    id v5 = (void *)v4;
    char v6 = [(PKInkAttributesPicker *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = [(PKInkAttributesPicker *)self delegate];
      [v8 inkAttributesPickerDidChangeInkThickness:self];
    }
  }
}

- (void)inkAttributesPickerViewDidChangeInkOpacity:(id)a3
{
  [(PKPaletteAttributeViewController *)self setDidExperienceUserInteraction:1];
  [(PKInkAttributesPicker *)self _notifyInkAttributesPickerDidChangeInk];
  uint64_t v4 = [(PKInkAttributesPicker *)self delegate];
  if (v4)
  {
    id v5 = (void *)v4;
    char v6 = [(PKInkAttributesPicker *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = [(PKInkAttributesPicker *)self delegate];
      [v8 inkAttributesPickerDidChangeInkOpacity:self];
    }
  }
}

- (void)_inkAttributesPickerViewUserDidStartDraggingSlider:(id)a3
{
  self->_updatingOpacityValue = 1;
  [(PKPaletteAttributeViewController *)self setDidExperienceUserInteraction:1];
  uint64_t v4 = [(PKInkAttributesPicker *)self delegate];
  if (v4)
  {
    id v5 = (void *)v4;
    char v6 = [(PKInkAttributesPicker *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = [(PKInkAttributesPicker *)self delegate];
      [v8 _inkAttributesPickerUserDidStartDraggingSlider:self];
    }
  }
}

- (void)_inkAttributesPickerViewUserDidEndDraggingSlider:(id)a3
{
  self->_updatingOpacityValue = 0;
  [(PKPaletteAttributeViewController *)self setDidExperienceUserInteraction:1];
  uint64_t v4 = [(PKInkAttributesPicker *)self delegate];
  if (v4)
  {
    id v5 = (void *)v4;
    char v6 = [(PKInkAttributesPicker *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = [(PKInkAttributesPicker *)self delegate];
      [v8 _inkAttributesPickerUserDidEndDraggingSlider:self];
    }
  }
}

- (UIViewController)topViewController
{
  return self->_topViewController;
}

- (PKInkAttributesPickerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (_PKInkAttributesPickerView)pickerView
{
  return self->_pickerView;
}

- (void)setPickerView:(id)a3
{
}

- (double)minimumOpacityValue
{
  return self->_minimumOpacityValue;
}

- (BOOL)isUpdatingOpacityValue
{
  return self->_updatingOpacityValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickerView, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_topViewController, 0);
  objc_storeStrong((id *)&self->_topViewControllerViewWrapper, 0);

  objc_storeStrong((id *)&self->_stackView, 0);
}

@end