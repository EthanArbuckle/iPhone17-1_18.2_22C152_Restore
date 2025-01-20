@interface HUServicePickerViewController
- (BOOL)_isItemPreselected:(id)a3;
- (BOOL)_preselectedServicesContainsService:(id)a3;
- (BOOL)isPresentedModally;
- (BOOL)serviceGridItemManager:(id)a3 shouldHideItem:(id)a4;
- (HUServicePickerViewController)initWithHome:(id)a3 isPresentedModally:(BOOL)a4 delegate:(id)a5;
- (HUServicePickerViewController)initWithHome:(id)a3 selectedServices:(id)a4 isPresentedModally:(BOOL)a5 delegate:(id)a6;
- (NSSet)preselectedServices;
- (id)_servicesForItem:(id)a3;
- (id)_servicesForItems:(id)a3;
- (void)_cancel:(id)a3;
- (void)_done:(id)a3;
- (void)_setUpNavButtons;
- (void)itemManagerDidUpdate:(id)a3;
- (void)setIsPresentedModally:(BOOL)a3;
- (void)setPreselectedServices:(id)a3;
- (void)viewDidLoad;
@end

@implementation HUServicePickerViewController

- (HUServicePickerViewController)initWithHome:(id)a3 isPresentedModally:(BOOL)a4 delegate:(id)a5
{
  return [(HUServicePickerViewController *)self initWithHome:a3 selectedServices:0 isPresentedModally:a4 delegate:a5];
}

- (HUServicePickerViewController)initWithHome:(id)a3 selectedServices:(id)a4 isPresentedModally:(BOOL)a5 delegate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = [HUServiceGridItemManager alloc];
  v14 = +[HUSelectableServiceGridViewController defaultItemProviderCreatorWithOptions:11];
  v15 = [(HUServiceGridItemManager *)v13 initWithDelegate:self shouldGroupByRoom:1 itemProvidersCreator:v14];

  [(HFItemManager *)v15 setHome:v10];
  v20.receiver = self;
  v20.super_class = (Class)HUServicePickerViewController;
  v16 = [(HUSelectableServiceGridViewController *)&v20 initWithServiceGridItemManager:v15];
  v17 = v16;
  if (v16)
  {
    [(HUServiceGridViewController *)v16 setDelegate:v12];
    v17->_isPresentedModally = a5;
    objc_storeStrong((id *)&v17->_preselectedServices, a4);
    v18 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    [v18 setOverrideHome:v10];
  }
  return v17;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)HUServicePickerViewController;
  [(HUServiceGridViewController *)&v8 viewDidLoad];
  v3 = [(HUItemCollectionViewController *)self itemManager];
  v4 = [v3 home];
  v5 = objc_msgSend(v4, "hf_displayName");
  [(HUServicePickerViewController *)self setTitle:v5];

  [(HUServicePickerViewController *)self _setUpNavButtons];
  v6 = [MEMORY[0x1E4F428B8] systemGroupedBackgroundColor];
  v7 = [(HUServicePickerViewController *)self collectionView];
  [v7 setBackgroundColor:v6];
}

- (void)_setUpNavButtons
{
  BOOL v3 = [(HUServicePickerViewController *)self isPresentedModally];
  id v4 = objc_alloc(MEMORY[0x1E4F427C0]);
  v5 = v4;
  if (v3)
  {
    v6 = (void *)[v4 initWithBarButtonSystemItem:1 target:self action:sel__cancel_];
    v7 = [(HUServicePickerViewController *)self navigationItem];
    [v7 setLeftBarButtonItem:v6];

    id v10 = (id)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:0 target:self action:sel__done_];
    objc_super v8 = [(HUServicePickerViewController *)self navigationItem];
    [v8 setRightBarButtonItem:v10];
  }
  else
  {
    _HULocalizedStringWithDefaultValue(@"HUNextTitle", @"HUNextTitle", 1);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_super v8 = objc_msgSend(v5, "initWithTitle:style:target:action:");
    v9 = [(HUServicePickerViewController *)self navigationItem];
    [v9 setRightBarButtonItem:v8];
  }
}

- (void)_cancel:(id)a3
{
  id v4 = [(HUServiceGridViewController *)self delegate];
  [v4 servicePickerDidCancel:self];
}

- (void)_done:(id)a3
{
  id v4 = [(HUSelectableServiceGridViewController *)self selectedItems];
  v5 = [v4 toSet];
  id v7 = [(HUServicePickerViewController *)self _servicesForItems:v5];

  v6 = [(HUServiceGridViewController *)self delegate];
  [v6 servicePickerDidFinish:self selectedServices:v7];
}

- (id)_servicesForItems:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __51__HUServicePickerViewController__servicesForItems___block_invoke;
  id v11 = &unk_1E638FE48;
  objc_copyWeak(&v12, &location);
  v5 = objc_msgSend(v4, "na_map:", &v8);
  v6 = objc_msgSend(v5, "na_setByFlattening", v8, v9, v10, v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v6;
}

id __51__HUServicePickerViewController__servicesForItems___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = [WeakRetained _servicesForItem:v3];

  return v5;
}

- (id)_servicesForItem:(id)a3
{
  id v3 = a3;
  if ([v3 conformsToProtocol:&unk_1F1A3D460])
  {
    id v4 = [v3 services];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)itemManagerDidUpdate:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HUServicePickerViewController;
  [(HUSelectableServiceGridViewController *)&v18 itemManagerDidUpdate:v4];
  v5 = [(HUServicePickerViewController *)self preselectedServices];

  if (v5)
  {
    objc_initWeak(&location, self);
    v6 = [(HUItemCollectionViewController *)self itemManager];
    id v7 = [v6 allItems];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __54__HUServicePickerViewController_itemManagerDidUpdate___block_invoke;
    v15 = &unk_1E638E220;
    objc_copyWeak(&v16, &location);
    uint64_t v8 = objc_msgSend(v7, "na_filter:", &v12);

    id v9 = objc_alloc(MEMORY[0x1E4F692F8]);
    id v10 = objc_msgSend(v9, "initWithFromSet:", v8, v12, v13, v14, v15);
    id v11 = (void *)[v10 copy];
    [(HUSelectableServiceGridViewController *)self setSelectedItems:v11];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

uint64_t __54__HUServicePickerViewController_itemManagerDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v5 = [WeakRetained _isItemPreselected:v3];

  return v5;
}

- (BOOL)_isItemPreselected:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HUServicePickerViewController *)self _servicesForItem:v4];
  if (v5)
  {
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __52__HUServicePickerViewController__isItemPreselected___block_invoke;
    v8[3] = &unk_1E638FE70;
    objc_copyWeak(&v9, &location);
    char v6 = objc_msgSend(v5, "na_any:", v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

uint64_t __52__HUServicePickerViewController__isItemPreselected___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v5 = [WeakRetained _preselectedServicesContainsService:v3];

  return v5;
}

- (BOOL)_preselectedServicesContainsService:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HUServicePickerViewController *)self preselectedServices];

  if (v5)
  {
    char v6 = [(HUServicePickerViewController *)self preselectedServices];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __69__HUServicePickerViewController__preselectedServicesContainsService___block_invoke;
    v9[3] = &unk_1E6387048;
    id v10 = v4;
    char v7 = objc_msgSend(v6, "na_any:", v9);
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

uint64_t __69__HUServicePickerViewController__preselectedServicesContainsService___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  id v4 = [*(id *)(a1 + 32) uniqueIdentifier];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

- (BOOL)serviceGridItemManager:(id)a3 shouldHideItem:(id)a4
{
  id v4 = [(HUServicePickerViewController *)self _servicesForItem:a4];
  BOOL v5 = v4 == 0;

  return v5;
}

- (BOOL)isPresentedModally
{
  return self->_isPresentedModally;
}

- (void)setIsPresentedModally:(BOOL)a3
{
  self->_isPresentedModally = a3;
}

- (NSSet)preselectedServices
{
  return self->_preselectedServices;
}

- (void)setPreselectedServices:(id)a3
{
}

- (void).cxx_destruct
{
}

@end