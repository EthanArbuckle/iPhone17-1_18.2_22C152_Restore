@interface HUQuickControlColorViewController
+ (Class)controlItemClass;
- (CGSize)preferredContentSize;
- (HUQuickControlColorViewController)colorViewController;
- (HUQuickControlColorViewController)presentingColorViewController;
- (NSIndexPath)selectedColorIndexPath;
- (id)controlToViewValueTransformer;
- (id)createInteractionCoordinator;
- (id)createViewProfile;
- (unint64_t)_paletteType;
- (unint64_t)mode;
- (void)cancelButtonTapped;
- (void)didSelectColorAtIndexPath:(id)a3;
- (void)doneButtonTapped;
- (void)interactionCoordinator:(id)a3 colorPaletteDidChange:(id)a4;
- (void)interactionCoordinator:(id)a3 didSelectColorAtIndexPath:(id)a4;
- (void)interactionCoordinator:(id)a3 viewValueDidChange:(id)a4;
- (void)presentFullColorViewForInteractionCoordinator:(id)a3 selectedColorIndexPath:(id)a4;
- (void)quickControlItemUpdater:(id)a3 didUpdateResultsForControlItems:(id)a4;
- (void)setColorViewController:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)setPresentingColorViewController:(id)a3;
- (void)setSelectedColorIndexPath:(id)a3;
- (void)updateValueFromControlItem;
@end

@implementation HUQuickControlColorViewController

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
  [(HUQuickControlSingleControlViewController *)self invalidateViewProfile];
}

+ (Class)controlItemClass
{
  return (Class)objc_opt_class();
}

- (void)updateValueFromControlItem
{
  v3 = [(HUQuickControlSingleControlViewController *)self controlItem];
  v4 = [v3 latestResults];
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F68B60]];

  if (v5)
  {
    uint64_t v6 = [v5 BOOLValue];
    v7 = [(HUQuickControlSingleControlViewController *)self viewProfile];
    [v7 setNaturalLightingEnabled:v6];
  }
  v8.receiver = self;
  v8.super_class = (Class)HUQuickControlColorViewController;
  [(HUQuickControlSingleControlViewController *)&v8 updateValueFromControlItem];
}

- (unint64_t)_paletteType
{
  v3 = [(HUQuickControlSingleControlViewController *)self viewProfile];
  int v4 = [v3 supportsNaturalLighting];

  v5 = [(HUQuickControlSingleControlViewController *)self controlItem];
  int v6 = [v5 supportsRGBColor];

  unint64_t v7 = 2;
  if (!v4) {
    unint64_t v7 = 0;
  }
  unint64_t v8 = 3;
  if (!v4) {
    unint64_t v8 = 1;
  }
  if (v6) {
    return v7;
  }
  else {
    return v8;
  }
}

- (id)createInteractionCoordinator
{
  v3 = [(HUQuickControlViewController *)self home];
  int v4 = objc_msgSend(v3, "hf_colorPaletteOfType:", -[HUQuickControlColorViewController _paletteType](self, "_paletteType"));

  v5 = [HUQuickControlColorView alloc];
  int v6 = [(HUQuickControlSingleControlViewController *)self viewProfile];
  unint64_t v7 = [(HUQuickControlColorView *)v5 initWithProfile:v6 colorPalette:v4];

  unint64_t v8 = [[HUQuickControlColorInteractionCoordinator alloc] initWithControlView:v7 colorPalette:v4 delegate:self];
  [(HUQuickControlSimpleInteractionCoordinator *)v8 setShouldDismissAutomatically:0];

  return v8;
}

- (id)createViewProfile
{
  v3 = objc_alloc_init(HUQuickControlColorViewProfile);
  int v4 = [(HUQuickControlSingleControlViewController *)self controlItem];
  -[HUQuickControlColorViewProfile setSupportsRGBColor:](v3, "setSupportsRGBColor:", [v4 supportsRGBColor]);

  v5 = [(HUQuickControlSingleControlViewController *)self controlItem];
  -[HUQuickControlColorViewProfile setSupportsNaturalLighting:](v3, "setSupportsNaturalLighting:", [v5 supportsNaturalLighting]);

  int v6 = [(HUQuickControlSingleControlViewController *)self controlItem];
  -[HUQuickControlColorViewProfile setNaturalLightingEnabled:](v3, "setNaturalLightingEnabled:", [v6 naturalLightingEnabled]);

  unint64_t v7 = [(HUQuickControlSingleControlViewController *)self controlItem];
  unint64_t v8 = [v7 colorProfile];
  [(HUQuickControlColorViewProfile *)v3 setColorProfile:v8];

  [(HUQuickControlColorViewProfile *)v3 setMode:[(HUQuickControlColorViewController *)self mode]];
  [(HUQuickControlViewProfile *)v3 setOrientation:1];

  return v3;
}

- (id)controlToViewValueTransformer
{
  v2 = (void *)MEMORY[0x1E4F69760];
  uint64_t v3 = objc_opt_class();

  return (id)[v2 transformerForValueClass:v3 transformBlock:&__block_literal_global_19 reverseTransformBlock:&__block_literal_global_9];
}

id __66__HUQuickControlColorViewController_controlToViewValueTransformer__block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v2 = (objc_class *)MEMORY[0x1E4F69070];
    id v3 = a2;
    int v4 = (void *)[[v2 alloc] initWithColorCollection:v3];
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

uint64_t __66__HUQuickControlColorViewController_controlToViewValueTransformer__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 colorValue];
}

- (void)interactionCoordinator:(id)a3 colorPaletteDidChange:(id)a4
{
  id v5 = a4;
  int v6 = [(HUQuickControlViewController *)self home];
  id v7 = (id)objc_msgSend(v6, "hf_updateColorPalette:type:", v5, -[HUQuickControlColorViewController _paletteType](self, "_paletteType"));

  unint64_t v8 = [(HUQuickControlSingleControlViewController *)self interactionCoordinator];
  id v10 = [v8 controlView];

  [v10 setColorPalette:v5];
  if ([v10 isSelectedColorInPalette])
  {
    v9 = [(HUQuickControlViewController *)self delegate];
    [v9 quickControlViewControllerDidUpdateStatusOverrides:self];
  }
}

- (void)presentFullColorViewForInteractionCoordinator:(id)a3 selectedColorIndexPath:(id)a4
{
  objc_opt_class();
  id v5 = [(HUQuickControlSingleControlViewController *)self interactionCoordinator];
  int v6 = [v5 controlView];
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v40 = v7;

  if (v40) {
    [v40 storeCurrentColorInformationAsOriginalValues];
  }
  unint64_t v8 = [HUQuickControlColorViewController alloc];
  v9 = [(HUQuickControlSingleControlViewController *)self controlItem];
  id v10 = [(HUQuickControlViewController *)self home];
  v11 = [(HUQuickControlViewController *)self itemUpdater];
  v12 = [(HUQuickControlSingleControlViewController *)v8 initWithControlItem:v9 home:v10 itemUpdater:v11 controlOrientation:[(HUQuickControlViewController *)self controlOrientation] preferredControl:[(HUQuickControlViewController *)self preferredControl]];
  [(HUQuickControlColorViewController *)self setColorViewController:v12];

  v13 = [(HUQuickControlColorViewController *)self colorViewController];
  [v13 setMode:1];

  v14 = [(HUQuickControlColorViewController *)self colorViewController];
  [v14 setPresentingColorViewController:self];

  objc_opt_class();
  v15 = [(HUQuickControlColorViewController *)self colorViewController];
  v16 = [v15 interactionCoordinator];
  v17 = [v16 controlView];
  if (objc_opt_isKindOfClass()) {
    v18 = v17;
  }
  else {
    v18 = 0;
  }
  id v19 = v18;

  if (v19)
  {
    v20 = [v40 linearPaletteViewSelectedColorIndexPath];
    [v19 updateSelectedColorIndexPathToIndexPath:v20];

    v21 = [v40 value];
    [v19 setValue:v21];

    [v19 storeCurrentColorInformationAsOriginalValues];
  }
  id v22 = objc_alloc(MEMORY[0x1E4F42BF8]);
  v23 = [(HUQuickControlColorViewController *)self colorViewController];
  v24 = (void *)[v22 initWithRootViewController:v23];

  uint64_t v25 = 2;
  [v24 setModalPresentationStyle:2];
  v26 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:1 target:self action:sel_cancelButtonTapped];
  v27 = [(HUQuickControlColorViewController *)self colorViewController];
  v28 = [v27 navigationItem];
  [v28 setLeftBarButtonItem:v26];

  v29 = _HULocalizedStringWithDefaultValue(@"HUQuickControlColorFullPickerModeViewControllerTitle", @"HUQuickControlColorFullPickerModeViewControllerTitle", 1);
  v30 = [(HUQuickControlColorViewController *)self colorViewController];
  [v30 setTitle:v29];

  v31 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:0 target:self action:sel_doneButtonTapped];
  v32 = [(HUQuickControlColorViewController *)self colorViewController];
  v33 = [v32 navigationItem];
  [v33 setRightBarButtonItem:v31];

  if (([MEMORY[0x1E4F69758] shouldUseControlCenterMaterials] & 1) == 0)
  {
    v34 = [(HUQuickControlColorViewController *)self view];
    v35 = [v34 traitCollection];
    uint64_t v25 = [v35 userInterfaceStyle];
  }
  v36 = +[HUQuickControlUtilities backgroundColorForUserInterfaceStyle:v25];
  v37 = [(HUQuickControlColorViewController *)self colorViewController];
  v38 = [v37 view];
  [v38 setBackgroundColor:v36];

  [v24 setOverrideUserInterfaceStyle:v25];
  id v39 = [(UIViewController *)self hu_presentPreloadableViewController:v24 animated:1];
}

- (void)interactionCoordinator:(id)a3 didSelectColorAtIndexPath:(id)a4
{
  id v10 = a4;
  objc_opt_class();
  id v5 = [(HUQuickControlSingleControlViewController *)self interactionCoordinator];
  int v6 = [v5 controlView];
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if (v8 && [v8 mode] == 1)
  {
    v9 = [(HUQuickControlColorViewController *)self presentingColorViewController];
    [v9 didSelectColorAtIndexPath:v10];
  }
}

- (void)interactionCoordinator:(id)a3 viewValueDidChange:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (([v7 isUserInteractionActive] & 1) == 0) {
    NSLog(&cfstr_ReceivedAValue.isa, v7);
  }
  v9 = [(HUQuickControlColorViewController *)self controlToViewValueTransformer];
  id v10 = [v9 valueForTransformedValue:v8];

  objc_opt_class();
  id v11 = v10;
  if (objc_opt_isKindOfClass()) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  objc_opt_class();
  id v14 = v11;
  if (objc_opt_isKindOfClass()) {
    v15 = v14;
  }
  else {
    v15 = 0;
  }
  id v16 = v15;

  if (v13)
  {
    v17 = [(HUQuickControlSingleControlViewController *)self controlItem];
    [v17 setNaturalLightingEnabled:0];

    v20.receiver = self;
    v20.super_class = (Class)HUQuickControlColorViewController;
    [(HUQuickControlSingleControlViewController *)&v20 interactionCoordinator:v7 viewValueDidChange:v8];
  }
  else if (v16)
  {
    v18 = [(HUQuickControlSingleControlViewController *)self controlItem];
    [v18 setNaturalLightingEnabled:1];
  }
  else
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"HUQuickControlColorViewController.m", 205, @"Unknown color value: %@", v14 object file lineNumber description];
  }
}

- (void)didSelectColorAtIndexPath:(id)a3
{
  id v8 = a3;
  objc_opt_class();
  int v4 = [(HUQuickControlSingleControlViewController *)self interactionCoordinator];
  id v5 = [v4 controlView];
  if (objc_opt_isKindOfClass()) {
    int v6 = v5;
  }
  else {
    int v6 = 0;
  }
  id v7 = v6;

  if (v7 && ![v7 mode]) {
    [v7 updateSelectedColorIndexPathToIndexPath:v8];
  }
}

- (void)cancelButtonTapped
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    id v8 = self;
    __int16 v9 = 2080;
    id v10 = "-[HUQuickControlColorViewController cancelButtonTapped]";
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "%@:%s User tapped cancel button", (uint8_t *)&v7, 0x16u);
  }

  int v4 = [(HUQuickControlSingleControlViewController *)self interactionCoordinator];
  [v4 cancelButtonTappedToDismissColorViewController];

  id v5 = [(HUQuickControlColorViewController *)self colorViewController];
  int v6 = [v5 interactionCoordinator];
  [v6 cancelButtonTappedToDismissColorViewController];

  [(HUQuickControlColorViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)doneButtonTapped
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412546;
    v21 = self;
    __int16 v22 = 2080;
    v23 = "-[HUQuickControlColorViewController doneButtonTapped]";
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "%@:%s User tapped done button", (uint8_t *)&v20, 0x16u);
  }

  objc_opt_class();
  int v4 = [(HUQuickControlSingleControlViewController *)self interactionCoordinator];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  id v7 = v6;
  if ([v7 conformsToProtocol:&unk_1F1A90C58]) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  objc_opt_class();
  id v10 = [v9 controlView];
  if (objc_opt_isKindOfClass()) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  id v12 = v11;

  objc_opt_class();
  id v13 = [(HUQuickControlColorViewController *)self colorViewController];
  id v14 = [v13 interactionCoordinator];
  v15 = [v14 controlView];
  if (objc_opt_isKindOfClass()) {
    id v16 = v15;
  }
  else {
    id v16 = 0;
  }
  id v17 = v16;

  v18 = [v17 colorPalette];

  if (v9)
  {
    if (v12) {
      BOOL v19 = v18 == 0;
    }
    else {
      BOOL v19 = 1;
    }
    if (!v19) {
      [v9 controlView:v12 colorPaletteDidChange:v18];
    }
  }
  [(HUQuickControlColorViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)quickControlItemUpdater:(id)a3 didUpdateResultsForControlItems:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)HUQuickControlColorViewController;
  [(HUQuickControlSingleControlViewController *)&v10 quickControlItemUpdater:v6 didUpdateResultsForControlItems:v7];
  id v8 = [(HUQuickControlColorViewController *)self colorViewController];

  if (v8)
  {
    id v9 = [(HUQuickControlColorViewController *)self colorViewController];
    [v9 quickControlItemUpdater:v6 didUpdateResultsForControlItems:v7];
  }
}

- (CGSize)preferredContentSize
{
  v2 = [(HUQuickControlColorViewController *)self presentingViewController];
  [v2 preferredContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (NSIndexPath)selectedColorIndexPath
{
  return self->_selectedColorIndexPath;
}

- (void)setSelectedColorIndexPath:(id)a3
{
}

- (HUQuickControlColorViewController)colorViewController
{
  return self->_colorViewController;
}

- (void)setColorViewController:(id)a3
{
}

- (HUQuickControlColorViewController)presentingColorViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingColorViewController);

  return (HUQuickControlColorViewController *)WeakRetained;
}

- (void)setPresentingColorViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingColorViewController);
  objc_storeStrong((id *)&self->_colorViewController, 0);

  objc_storeStrong((id *)&self->_selectedColorIndexPath, 0);
}

@end