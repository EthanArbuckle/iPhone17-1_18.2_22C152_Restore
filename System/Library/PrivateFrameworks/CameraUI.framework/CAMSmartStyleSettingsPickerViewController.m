@interface CAMSmartStyleSettingsPickerViewController
- (BOOL)isWaitingOnLoading;
- (CAMSmartStyleSettingsPickerViewController)initWithPickerConfiguration:(id)a3 selectedAssetIdentifiers:(id)a4;
- (CAMSmartStyleSettingsPickerViewControllerDelegate)delegate;
- (NSArray)initialSelectedAssetIdentifiers;
- (NSArray)selectedAssetIdentifiers;
- (PHPickerViewController)_phPicker;
- (UIButton)_continueButton;
- (UIButton)_deselectAllButton;
- (unint64_t)_requiredAssetCount;
- (void)_handleContinueButton:(id)a3;
- (void)_handleDeselectAllButton:(id)a3;
- (void)_pickerDidPerformCancelAction:(id)a3;
- (void)_updateButtonsEnablementState;
- (void)loadView;
- (void)picker:(id)a3 didFinishPicking:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setSelectedAssetIdentifiers:(id)a3;
- (void)setWaitingOnLoading:(BOOL)a3;
@end

@implementation CAMSmartStyleSettingsPickerViewController

- (CAMSmartStyleSettingsPickerViewController)initWithPickerConfiguration:(id)a3 selectedAssetIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CAMSmartStyleSettingsPickerViewController;
  v8 = [(CAMSmartStyleSettingsPickerViewController *)&v19 initWithNibName:0 bundle:0];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    initialSelectedAssetIdentifiers = v8->_initialSelectedAssetIdentifiers;
    v8->_initialSelectedAssetIdentifiers = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    selectedAssetIdentifiers = v8->_selectedAssetIdentifiers;
    v8->_selectedAssetIdentifiers = (NSArray *)v11;

    v13 = (void *)[v6 copy];
    [v13 setPreselectedAssetIdentifiers:v7];
    [v13 setEdgesWithoutContentMargins:10];
    v14 = [MEMORY[0x263F15228] styleabilitySuggestionGroup];
    objc_msgSend(v13, "set_suggestionGroup:", v14);

    [v13 setDisabledCapabilities:3];
    [v13 setSelection:3];
    [v13 _setDisabledPrivateCapabilities:3972];
    [v13 setEdgesWithoutContentMargins:4];
    uint64_t v15 = [objc_alloc(MEMORY[0x263F15220]) initWithConfiguration:v13];
    phPicker = v8->__phPicker;
    v8->__phPicker = (PHPickerViewController *)v15;

    [(PHPickerViewController *)v8->__phPicker setDelegate:v8];
    v17 = v8;
  }
  return v8;
}

- (void)loadView
{
  id v8 = [(CAMSmartStyleSettingsPickerViewController *)self _phPicker];
  [(CAMSmartStyleSettingsPickerViewController *)self addChildViewController:v8];
  v3 = [CAMSmartStyleSettingsPickerView alloc];
  v4 = [v8 view];
  v5 = [(CAMSmartStyleSettingsPickerView *)v3 initWithPHPickerView:v4];

  [(CAMSmartStyleSettingsPickerViewController *)self setView:v5];
  id v6 = [(CAMSmartStyleSettingsPickerView *)v5 continueButton];
  [v6 addTarget:self action:sel__handleContinueButton_ forControlEvents:64];
  id v7 = [(CAMSmartStyleSettingsPickerView *)v5 deselectAllButton];
  [v7 addTarget:self action:sel__handleDeselectAllButton_ forControlEvents:64];
  [(CAMSmartStyleSettingsPickerViewController *)self _updateButtonsEnablementState];
  [v8 didMoveToParentViewController:self];
}

- (UIButton)_continueButton
{
  v2 = [(CAMSmartStyleSettingsPickerViewController *)self _pickerView];
  v3 = [v2 continueButton];

  return (UIButton *)v3;
}

- (UIButton)_deselectAllButton
{
  v2 = [(CAMSmartStyleSettingsPickerViewController *)self _pickerView];
  v3 = [v2 deselectAllButton];

  return (UIButton *)v3;
}

- (unint64_t)_requiredAssetCount
{
  v2 = [(CAMSmartStyleSettingsPickerViewController *)self _phPicker];
  v3 = [v2 configuration];
  unint64_t v4 = [v3 selectionLimit];

  return v4;
}

- (BOOL)isWaitingOnLoading
{
  v2 = [(CAMSmartStyleSettingsPickerViewController *)self _pickerView];
  char v3 = [v2 isWaitingOnLoading];

  return v3;
}

- (void)setWaitingOnLoading:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CAMSmartStyleSettingsPickerViewController *)self _pickerView];
  [v4 setWaitingOnLoading:v3];
}

- (void)_handleContinueButton:(id)a3
{
  id v4 = [(CAMSmartStyleSettingsPickerViewController *)self delegate];
  [v4 smartStyleSettingsPickerDidConfirmSelection:self];
}

- (void)_handleDeselectAllButton:(id)a3
{
  id v4 = [(CAMSmartStyleSettingsPickerViewController *)self selectedAssetIdentifiers];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = [(CAMSmartStyleSettingsPickerViewController *)self _phPicker];
    id v7 = [(CAMSmartStyleSettingsPickerViewController *)self selectedAssetIdentifiers];
    [v6 deselectAssetsWithIdentifiers:v7];

    [(CAMSmartStyleSettingsPickerViewController *)self _updateButtonsEnablementState];
    id v8 = [(CAMSmartStyleSettingsPickerViewController *)self delegate];
    [v8 smartStyleSettingsPickerDidUpdateSelectedAssetIdentifiers:self];
  }
}

- (void)picker:(id)a3 didFinishPicking:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11), "assetIdentifier", (void)v14);
        [v6 addObject:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  [(CAMSmartStyleSettingsPickerViewController *)self setSelectedAssetIdentifiers:v6];
  [(CAMSmartStyleSettingsPickerViewController *)self _updateButtonsEnablementState];
  v13 = [(CAMSmartStyleSettingsPickerViewController *)self delegate];
  [v13 smartStyleSettingsPickerDidUpdateSelectedAssetIdentifiers:self];
}

- (void)_pickerDidPerformCancelAction:(id)a3
{
  id v4 = [(CAMSmartStyleSettingsPickerViewController *)self delegate];
  [v4 smartStyleSettingsPickerDidCancelSelection:self];
}

- (void)_updateButtonsEnablementState
{
  BOOL v3 = [(CAMSmartStyleSettingsPickerViewController *)self selectedAssetIdentifiers];
  unint64_t v4 = [v3 count];
  BOOL v5 = v4 >= [(CAMSmartStyleSettingsPickerViewController *)self _requiredAssetCount];
  id v6 = [(CAMSmartStyleSettingsPickerViewController *)self _continueButton];
  [v6 setEnabled:v5];

  id v9 = [(CAMSmartStyleSettingsPickerViewController *)self selectedAssetIdentifiers];
  BOOL v7 = [v9 count] != 0;
  uint64_t v8 = [(CAMSmartStyleSettingsPickerViewController *)self _deselectAllButton];
  [v8 setEnabled:v7];
}

- (CAMSmartStyleSettingsPickerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMSmartStyleSettingsPickerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)selectedAssetIdentifiers
{
  return self->_selectedAssetIdentifiers;
}

- (void)setSelectedAssetIdentifiers:(id)a3
{
}

- (NSArray)initialSelectedAssetIdentifiers
{
  return self->_initialSelectedAssetIdentifiers;
}

- (PHPickerViewController)_phPicker
{
  return self->__phPicker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__phPicker, 0);
  objc_storeStrong((id *)&self->_initialSelectedAssetIdentifiers, 0);
  objc_storeStrong((id *)&self->_selectedAssetIdentifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end