@interface PKPaletteErasingAttributesViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)hideWeightPicker;
- (CGSize)preferredContentSize;
- (PKPaletteErasingAttributesViewControllerDelegate)delegate;
- (double)weight;
- (int64_t)eraserType;
- (void)_segmentedControlDidChangeValue:(id)a3;
- (void)_thicknessValueChanged:(id)a3;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)setEraserType:(int64_t)a3;
- (void)setHideWeightPicker:(BOOL)a3;
- (void)setWeight:(double)a3;
- (void)viewDidLoad;
@end

@implementation PKPaletteErasingAttributesViewController

- (void)loadView
{
  v5 = objc_alloc_init(PKPaletteErasingAttributesView);
  v3 = [(PKPaletteErasingAttributesView *)v5 segmentedControl];
  [v3 addTarget:self action:sel__segmentedControlDidChangeValue_ forControlEvents:4096];

  v4 = [(PKPaletteErasingAttributesView *)v5 thicknessPicker];
  [v4 addTarget:self action:sel__thicknessValueChanged_ forControlEvents:4096];

  [(PKPaletteErasingAttributesViewController *)self setView:v5];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaletteErasingAttributesViewController;
  [(PKPaletteErasingAttributesViewController *)&v4 viewDidLoad];
  if (PKIsVisionDevice())
  {
    v3 = [(PKPaletteErasingAttributesViewController *)self view];
    [v3 setOverrideUserInterfaceStyle:2];
  }
}

- (void)_segmentedControlDidChangeValue:(id)a3
{
  [(PKPaletteAttributeViewController *)self setDidExperienceUserInteraction:1];
  objc_super v4 = [(PKPaletteErasingAttributesViewController *)self _attributesView];
  [v4 _updateThicknessPickerToolConfiguration];

  id v5 = [(PKPaletteErasingAttributesViewController *)self delegate];
  [v5 erasingAttributesViewControllerDidChangeErasingType:self];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setHideWeightPicker:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PKPaletteErasingAttributesViewController *)self _attributesView];
  [v4 setHideWeightPicker:v3];
}

- (double)weight
{
  v2 = [(PKPaletteErasingAttributesViewController *)self _attributesView];
  BOOL v3 = [v2 thicknessPicker];
  if (v3) {
    double v4 = v3[58];
  }
  else {
    double v4 = 0.0;
  }

  return v4;
}

- (void)setWeight:(double)a3
{
  id v6 = [(PKPaletteErasingAttributesViewController *)self _attributesView];
  double v4 = [v6 thicknessPicker];
  id v5 = v4;
  if (v4)
  {
    v4[58] = a3;
    [v4 setNeedsLayout];
  }
}

- (void)setEraserType:(int64_t)a3
{
  id v4 = [(PKPaletteErasingAttributesViewController *)self _attributesView];
  [v4 setEraserType:a3];
}

- (int64_t)eraserType
{
  v2 = [(PKPaletteErasingAttributesViewController *)self _attributesView];
  int64_t v3 = [v2 eraserType];

  return v3;
}

- (CGSize)preferredContentSize
{
  int64_t v3 = [(PKPaletteErasingAttributesViewController *)self _attributesView];
  [v3 intrinsicContentSize];
  double v5 = v4;

  double v6 = fmax(v5, 300.0);
  if (v6 <= 400.0) {
    double v7 = v6;
  }
  else {
    double v7 = 400.0;
  }
  v8 = [(PKPaletteErasingAttributesViewController *)self _attributesView];
  [v8 intrinsicContentSize];
  double v10 = v9;

  double v11 = v7;
  double v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)_thicknessValueChanged:(id)a3
{
  id v4 = [(PKPaletteErasingAttributesViewController *)self delegate];
  [v4 erasingAttributesViewControllerDidChangeInkThickness:self];
}

- (BOOL)hideWeightPicker
{
  return self->_hideWeightPicker;
}

- (PKPaletteErasingAttributesViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPaletteErasingAttributesViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end