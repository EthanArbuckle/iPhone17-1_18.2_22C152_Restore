@interface HUIconPickerViewController
+ (id)sceneIconDescriptors;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (HFIconDescriptor)selectedIconDescriptor;
- (HUIconPickerViewController)initWithIconDescriptors:(id)a3 selectedIconDescriptor:(id)a4 delegate:(id)a5;
- (HUIconPickerViewControllerDelegate)delegate;
- (NSArray)iconDescriptors;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)_cancel:(id)a3;
- (void)_done:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setSelectedIconDescriptor:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation HUIconPickerViewController

+ (id)sceneIconDescriptors
{
  if (qword_1EA12DF60 != -1) {
    dispatch_once(&qword_1EA12DF60, &__block_literal_global_47);
  }
  v2 = (void *)_MergedGlobals_3_2;

  return v2;
}

void __50__HUIconPickerViewController_sceneIconDescriptors__block_invoke()
{
  v9[12] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F68600];
  v9[0] = *MEMORY[0x1E4F685F8];
  v9[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F68610];
  v9[2] = *MEMORY[0x1E4F68608];
  v9[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F68620];
  v9[4] = *MEMORY[0x1E4F68618];
  v9[5] = v2;
  uint64_t v3 = *MEMORY[0x1E4F68630];
  v9[6] = *MEMORY[0x1E4F68628];
  v9[7] = v3;
  uint64_t v4 = *MEMORY[0x1E4F68640];
  v9[8] = *MEMORY[0x1E4F68638];
  v9[9] = v4;
  uint64_t v5 = *MEMORY[0x1E4F685D0];
  v9[10] = *MEMORY[0x1E4F68648];
  v9[11] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:12];
  uint64_t v7 = objc_msgSend(v6, "na_map:", &__block_literal_global_3);
  v8 = (void *)_MergedGlobals_3_2;
  _MergedGlobals_3_2 = v7;
}

id __50__HUIconPickerViewController_sceneIconDescriptors__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (objc_class *)MEMORY[0x1E4F691D0];
  id v3 = a2;
  uint64_t v4 = (void *)[[v2 alloc] initWithImageIdentifier:v3];

  return v4;
}

- (HUIconPickerViewController)initWithIconDescriptors:(id)a3 selectedIconDescriptor:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v10 && ([v9 containsObject:v10] & 1) == 0) {
    NSLog(&cfstr_SelectedIconDe.isa, v10, v9);
  }
  id v12 = objc_alloc_init(MEMORY[0x1E4F42890]);
  objc_msgSend(v12, "setItemSize:", 88.0, 88.0);
  [v12 setScrollDirection:0];
  [v12 setMinimumLineSpacing:0.0];
  [v12 setMinimumInteritemSpacing:0.0];
  v17.receiver = self;
  v17.super_class = (Class)HUIconPickerViewController;
  v13 = [(HUIconPickerViewController *)&v17 initWithCollectionViewLayout:v12];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_iconDescriptors, a3);
    objc_storeStrong((id *)&v14->_selectedIconDescriptor, a4);
    objc_storeWeak((id *)&v14->_delegate, v11);
    v15 = _HULocalizedStringWithDefaultValue(@"HUIconPickerTitle", @"HUIconPickerTitle", 1);
    [(HUIconPickerViewController *)v14 setTitle:v15];
  }
  return v14;
}

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)HUIconPickerViewController;
  [(HUIconPickerViewController *)&v16 viewDidLoad];
  id v3 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  uint64_t v4 = [(HUIconPickerViewController *)self collectionView];
  [v4 setBackgroundColor:v3];

  uint64_t v5 = [(HUIconPickerViewController *)self collectionView];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  [v5 registerClass:v6 forCellWithReuseIdentifier:v8];

  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:1 target:self action:sel__cancel_];
  id v10 = [(HUIconPickerViewController *)self navigationItem];
  [v10 setLeftBarButtonItem:v9];

  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:0 target:self action:sel__done_];
  id v12 = [(HUIconPickerViewController *)self navigationItem];
  [v12 setRightBarButtonItem:v11];

  v13 = [(HUIconPickerViewController *)self selectedIconDescriptor];
  v14 = [(HUIconPickerViewController *)self navigationItem];
  v15 = [v14 rightBarButtonItem];
  [v15 setEnabled:v13 != 0];
}

- (void)viewDidLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)HUIconPickerViewController;
  [(HUIconPickerViewController *)&v13 viewDidLayoutSubviews];
  uint64_t v3 = [(HUIconPickerViewController *)self selectedIconDescriptor];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    uint64_t v5 = [(HUIconPickerViewController *)self collectionView];
    uint64_t v6 = [v5 indexPathsForSelectedItems];
    uint64_t v7 = [v6 count];

    if (!v7)
    {
      v8 = [(HUIconPickerViewController *)self iconDescriptors];
      id v9 = [(HUIconPickerViewController *)self selectedIconDescriptor];
      uint64_t v10 = [v8 indexOfObject:v9];

      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        id v11 = [(HUIconPickerViewController *)self collectionView];
        id v12 = [MEMORY[0x1E4F28D58] indexPathForItem:v10 inSection:0];
        [v11 selectItemAtIndexPath:v12 animated:0 scrollPosition:2];
      }
    }
  }
}

- (void)_cancel:(id)a3
{
  id v4 = [(HUIconPickerViewController *)self delegate];
  [v4 iconPickerDidCancel:self];
}

- (void)_done:(id)a3
{
  id v5 = [(HUIconPickerViewController *)self delegate];
  id v4 = [(HUIconPickerViewController *)self selectedIconDescriptor];
  [v5 iconPicker:self didPickIconDescriptor:v4];
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v4 = [(HUIconPickerViewController *)self iconDescriptors];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  uint64_t v10 = [v7 dequeueReusableCellWithReuseIdentifier:v9 forIndexPath:v6];

  id v11 = [(HUIconPickerViewController *)self iconDescriptors];
  uint64_t v12 = [v6 item];

  objc_super v13 = [v11 objectAtIndexedSubscript:v12];
  [v10 setIconDescriptor:v13];

  return v10;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(HUIconPickerViewController *)self iconDescriptors];
  uint64_t v7 = [v5 item];

  v8 = [v6 objectAtIndexedSubscript:v7];
  [(HUIconPickerViewController *)self setSelectedIconDescriptor:v8];

  id v10 = [(HUIconPickerViewController *)self navigationItem];
  id v9 = [v10 rightBarButtonItem];
  [v9 setEnabled:1];
}

- (NSArray)iconDescriptors
{
  return self->_iconDescriptors;
}

- (HFIconDescriptor)selectedIconDescriptor
{
  return self->_selectedIconDescriptor;
}

- (void)setSelectedIconDescriptor:(id)a3
{
}

- (HUIconPickerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUIconPickerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedIconDescriptor, 0);

  objc_storeStrong((id *)&self->_iconDescriptors, 0);
}

@end