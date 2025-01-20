@interface HUContainedServicesGridViewController_legacy
+ (id)itemManagerWithServiceContainerItem:(id)a3 shouldGroupByRoom:(BOOL)a4 mediaItem:(id)a5 valueSource:(id)a6;
- (BOOL)hasDetailsActionForPresentationCoordinator:(id)a3 item:(id)a4;
- (BOOL)isPresentedModally;
- (BOOL)requiresPresentingViewControllerDismissal;
- (HUContainedServiceGridViewControllerDelegate_legacy)serviceGridDelegate;
- (HUContainedServicesGridViewController_legacy)initWithItemManager:(id)a3;
- (HUContainedServicesGridViewController_legacy)initWithServiceContainerItem:(id)a3;
- (HUContainedServicesGridViewController_legacy)initWithServiceContainerItem:(id)a3 isPresentedModally:(BOOL)a4 valueSource:(id)a5;
- (HUPresentationDelegate)presentationDelegate;
- (HUServiceContainerItem)serviceContainerItem;
- (id)detailsViewControllerForPresentationCoordinator:(id)a3 item:(id)a4;
- (id)finishPresentation:(id)a3 animated:(BOOL)a4;
- (id)layoutOptionsForSection:(int64_t)a3;
- (void)_done:(id)a3;
- (void)_edit:(id)a3;
- (void)_updateRightBarButtons;
- (void)configureCell:(id)a3 forItem:(id)a4;
- (void)itemManagerDidUpdate:(id)a3;
- (void)setPresentationDelegate:(id)a3;
- (void)setPresentedModally:(BOOL)a3;
- (void)setRequiresPresentingViewControllerDismissal:(BOOL)a3;
- (void)setServiceGridDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation HUContainedServicesGridViewController_legacy

- (HUContainedServicesGridViewController_legacy)initWithServiceContainerItem:(id)a3
{
  return [(HUContainedServicesGridViewController_legacy *)self initWithServiceContainerItem:a3 isPresentedModally:0 valueSource:0];
}

+ (id)itemManagerWithServiceContainerItem:(id)a3 shouldGroupByRoom:(BOOL)a4 mediaItem:(id)a5 valueSource:(id)a6
{
  BOOL v8 = a4;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v14 = [HUServiceGridItemManager alloc];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __124__HUContainedServicesGridViewController_legacy_itemManagerWithServiceContainerItem_shouldGroupByRoom_mediaItem_valueSource___block_invoke;
  v20[3] = &unk_1E6385FC8;
  id v21 = v11;
  id v22 = v13;
  id v24 = a1;
  SEL v25 = a2;
  id v23 = v12;
  id v15 = v12;
  id v16 = v13;
  id v17 = v11;
  v18 = [(HUServiceGridItemManager *)v14 initWithDelegate:0 shouldGroupByRoom:v8 itemProvidersCreator:v20];

  return v18;
}

- (HUContainedServicesGridViewController_legacy)initWithServiceContainerItem:(id)a3 isPresentedModally:(BOOL)a4 valueSource:(id)a5
{
  id v8 = a5;
  v9 = (void *)[a3 copy];
  v10 = [(id)objc_opt_class() itemManagerWithServiceContainerItem:v9 shouldGroupByRoom:1 mediaItem:0 valueSource:v8];

  [v10 setDelegate:self];
  v15.receiver = self;
  v15.super_class = (Class)HUContainedServicesGridViewController_legacy;
  id v11 = [(HUServiceGridViewController *)&v15 initWithItemManager:v10];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_serviceContainerItem, v9);
    v12->_presentedModally = a4;
    id v13 = [(HUItemCollectionViewController *)v12 itemManager];
    [v13 setSourceItem:v12->_serviceContainerItem];
  }
  return v12;
}

- (HUContainedServicesGridViewController_legacy)initWithItemManager:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithActionSetBuilder_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUContainedServicesGridViewController_legacy.m", 253, @"%s is unavailable; use %@ instead",
    "-[HUContainedServicesGridViewController_legacy initWithItemManager:]",
    v6);

  return 0;
}

- (void)_done:(id)a3
{
  id v5 = [(HUContainedServicesGridViewController_legacy *)self presentationDelegate];
  id v4 = (id)[v5 finishPresentation:self animated:1];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)HUContainedServicesGridViewController_legacy;
  [(HUServiceGridViewController *)&v5 viewDidLoad];
  v3 = [MEMORY[0x1E4F428B8] systemGroupedBackgroundColor];
  id v4 = [(HUContainedServicesGridViewController_legacy *)self collectionView];
  [v4 setBackgroundColor:v3];
}

- (void)_edit:(id)a3
{
  uint64_t v4 = objc_opt_class();
  id v5 = [(HUContainedServicesGridViewController_legacy *)self serviceContainerItem];
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
    id v7 = v6;
    id v8 = v5;
    if (v7) {
      goto LABEL_8;
    }
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v10 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v9 handleFailureInFunction:v10, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v4, objc_opt_class() file lineNumber description];
  }
  id v8 = 0;
LABEL_8:
  id v19 = v8;

  id v11 = objc_alloc(MEMORY[0x1E4F69530]);
  id v12 = [v19 serviceGroup];
  id v13 = [(HUItemCollectionViewController *)self itemManager];
  v14 = [v13 home];
  objc_super v15 = (void *)[v11 initWithExistingObject:v12 inHome:v14];

  id v16 = [[HUServiceGroupEditorViewController alloc] initWithServiceGroupBuilder:v15];
  [(HUServiceGroupEditorViewController *)v16 setPresentationDelegate:self];
  id v17 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v16];
  [v17 setModalPresentationStyle:2];
  id v18 = [(UIViewController *)self hu_presentPreloadableViewController:v17 animated:1];
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HUContainedServicesGridViewController_legacy;
  [(HUServiceGridViewController *)&v12 configureCell:v6 forItem:a4];
  objc_opt_class();
  id v7 = v6;
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  v10 = [v9 layoutOptions];
  id v11 = [v10 backgroundDisplayOptions];
  [v11 setDisplayStyle:4];

  [v9 layoutOptionsDidChange];
}

- (id)layoutOptionsForSection:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HUContainedServicesGridViewController_legacy;
  uint64_t v4 = [(HUServiceGridViewController *)&v7 layoutOptionsForSection:sel_layoutOptionsForSection_];
  id v5 = (void *)[v4 copy];

  if (!a3)
  {
    [v5 sectionTitleMargin];
    [v5 setSectionTitleMargin:40.0];
  }

  return v5;
}

- (BOOL)hasDetailsActionForPresentationCoordinator:(id)a3 item:(id)a4
{
  id v5 = a4;
  id v6 = [(HUContainedServicesGridViewController_legacy *)self serviceGridDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(HUContainedServicesGridViewController_legacy *)self serviceGridDelegate];
    char v9 = [v8 hasDetailsActionForContainedServiceGridViewController:self item:v5];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)detailsViewControllerForPresentationCoordinator:(id)a3 item:(id)a4
{
  id v5 = a4;
  id v6 = [(HUContainedServicesGridViewController_legacy *)self serviceGridDelegate];
  char v7 = [v6 detailsViewControllerForContainedServiceGridViewController:self item:v5];

  if (!v7
    || ([(HUContainedServicesGridViewController_legacy *)self serviceGridDelegate],
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v8 detailsViewControllerForContainedServiceGridViewController:self item:v5],
        char v9 = objc_claimAutoreleasedReturnValue(),
        v8,
        !v9))
  {
    NSLog(&cfstr_NoDetailsViewC.isa, v5);
    char v9 = 0;
  }

  return v9;
}

- (void)itemManagerDidUpdate:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUContainedServicesGridViewController_legacy;
  [(HUItemCollectionViewController *)&v4 itemManagerDidUpdate:a3];
  [(HUContainedServicesGridViewController_legacy *)self _updateRightBarButtons];
}

- (id)finishPresentation:(id)a3 animated:(BOOL)a4
{
  return -[UIViewController hu_dismissViewControllerAnimated:](self, "hu_dismissViewControllerAnimated:", 1, a4);
}

- (void)_updateRightBarButtons
{
  objc_opt_class();
  v3 = [(HUContainedServicesGridViewController_legacy *)self serviceContainerItem];
  if (objc_opt_isKindOfClass()) {
    objc_super v4 = v3;
  }
  else {
    objc_super v4 = 0;
  }
  id v5 = v4;

  id v6 = 0;
  if ([(HUContainedServicesGridViewController_legacy *)self isPresentedModally]) {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:0 target:self action:sel__done_];
  }
  uint64_t v7 = [v5 serviceGroup];
  if (!v7) {
    goto LABEL_11;
  }
  id v8 = (void *)v7;
  char v9 = [(HUItemCollectionViewController *)self itemManager];
  v10 = [v9 home];
  int v11 = objc_msgSend(v10, "hf_currentUserIsAdministrator");

  if (v11)
  {
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:2 target:self action:sel__edit_];
    if (!v6)
    {
      id v6 = (void *)v12;
      uint64_t v12 = 0;
    }
    id v15 = (id)v12;
  }
  else
  {
LABEL_11:
    id v15 = 0;
  }
  id v13 = [(HUContainedServicesGridViewController_legacy *)self navigationItem];
  [v13 setLeftBarButtonItem:v15];

  v14 = [(HUContainedServicesGridViewController_legacy *)self navigationItem];
  [v14 setRightBarButtonItem:v6];
}

- (HUPresentationDelegate)presentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);

  return (HUPresentationDelegate *)WeakRetained;
}

- (void)setPresentationDelegate:(id)a3
{
}

- (BOOL)requiresPresentingViewControllerDismissal
{
  return self->_requiresPresentingViewControllerDismissal;
}

- (void)setRequiresPresentingViewControllerDismissal:(BOOL)a3
{
  self->_requiresPresentingViewControllerDismissal = a3;
}

- (HUServiceContainerItem)serviceContainerItem
{
  return self->_serviceContainerItem;
}

- (HUContainedServiceGridViewControllerDelegate_legacy)serviceGridDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceGridDelegate);

  return (HUContainedServiceGridViewControllerDelegate_legacy *)WeakRetained;
}

- (void)setServiceGridDelegate:(id)a3
{
}

- (BOOL)isPresentedModally
{
  return self->_presentedModally;
}

- (void)setPresentedModally:(BOOL)a3
{
  self->_presentedModally = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_serviceGridDelegate);
  objc_storeStrong((id *)&self->_serviceContainerItem, 0);

  objc_destroyWeak((id *)&self->_presentationDelegate);
}

@end