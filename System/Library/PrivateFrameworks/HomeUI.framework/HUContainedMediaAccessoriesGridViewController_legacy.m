@interface HUContainedMediaAccessoriesGridViewController_legacy
- (BOOL)hasDetailsActionForPresentationCoordinator:(id)a3 item:(id)a4;
- (BOOL)isPresentedModally;
- (BOOL)requiresPresentingViewControllerDismissal;
- (HFMediaAccessoryItem)mediaAccessoryItem;
- (HUContainedMediaAccessoriesGridViewControllerDelegate_legacy)mediaAccessoryGridDelegate;
- (HUContainedMediaAccessoriesGridViewController_legacy)initWithAccessoryContainerItem:(id)a3;
- (HUContainedMediaAccessoriesGridViewController_legacy)initWithMediaAccessoryContainerItem:(id)a3 isPresentedModally:(BOOL)a4 valueSource:(id)a5;
- (HUPresentationDelegate)presentationDelegate;
- (id)detailsViewControllerForPresentationCoordinator:(id)a3 item:(id)a4;
- (id)finishPresentation:(id)a3 animated:(BOOL)a4;
- (id)layoutOptionsForSection:(int64_t)a3;
- (void)_done:(id)a3;
- (void)_updateRightBarButtons;
- (void)itemManagerDidUpdate:(id)a3;
- (void)setMediaAccessoryGridDelegate:(id)a3;
- (void)setPresentationDelegate:(id)a3;
- (void)setPresentedModally:(BOOL)a3;
- (void)setRequiresPresentingViewControllerDismissal:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HUContainedMediaAccessoriesGridViewController_legacy

- (HUContainedMediaAccessoriesGridViewController_legacy)initWithAccessoryContainerItem:(id)a3
{
  return [(HUContainedMediaAccessoriesGridViewController_legacy *)self initWithMediaAccessoryContainerItem:a3 isPresentedModally:0 valueSource:0];
}

- (HUContainedMediaAccessoriesGridViewController_legacy)initWithMediaAccessoryContainerItem:(id)a3 isPresentedModally:(BOOL)a4 valueSource:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = (void *)[v9 copy];
  v11 = +[HUContainedServicesGridViewController_legacy itemManagerWithServiceContainerItem:0 shouldGroupByRoom:1 mediaItem:v9 valueSource:v8];

  v16.receiver = self;
  v16.super_class = (Class)HUContainedMediaAccessoriesGridViewController_legacy;
  v12 = [(HUServiceGridViewController *)&v16 initWithItemManager:v11];
  v13 = v12;
  if (v12)
  {
    v12->_presentedModally = a4;
    objc_storeStrong((id *)&v12->_mediaAccessoryItem, v10);
    v14 = [(HUItemCollectionViewController *)v13 itemManager];
    [v14 setSourceItem:v13->_mediaAccessoryItem];
  }
  return v13;
}

- (void)_done:(id)a3
{
  id v5 = [(HUContainedMediaAccessoriesGridViewController_legacy *)self presentationDelegate];
  id v4 = (id)[v5 finishPresentation:self animated:1];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)HUContainedMediaAccessoriesGridViewController_legacy;
  [(HUServiceGridViewController *)&v5 viewDidLoad];
  v3 = [MEMORY[0x1E4F428B8] systemGroupedBackgroundColor];
  id v4 = [(HUContainedMediaAccessoriesGridViewController_legacy *)self collectionView];
  [v4 setBackgroundColor:v3];
}

- (id)layoutOptionsForSection:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HUContainedMediaAccessoriesGridViewController_legacy;
  id v4 = [(HUServiceGridViewController *)&v7 layoutOptionsForSection:sel_layoutOptionsForSection_];
  objc_super v5 = (void *)[v4 copy];

  if (!a3)
  {
    [v5 sectionTitleMargin];
    [v5 setSectionTitleMargin:40.0];
  }

  return v5;
}

- (BOOL)hasDetailsActionForPresentationCoordinator:(id)a3 item:(id)a4
{
  return 1;
}

- (id)detailsViewControllerForPresentationCoordinator:(id)a3 item:(id)a4
{
  id v5 = a4;
  v6 = [(HUContainedMediaAccessoriesGridViewController_legacy *)self mediaAccessoryGridDelegate];
  objc_super v7 = [v6 detailsViewControllerForContainedMediaAccessoryGridViewController:self item:v5];

  if (!v7
    || (-[HUContainedMediaAccessoriesGridViewController_legacy mediaAccessoryGridDelegate](self, "mediaAccessoryGridDelegate"), id v8 = objc_claimAutoreleasedReturnValue(), [v8 detailsViewControllerForContainedMediaAccessoryGridViewController:self item:v5], v9 = objc_claimAutoreleasedReturnValue(), v8, !v9))
  {
    NSLog(&cfstr_NoDetailsViewC.isa, v5);
    id v9 = 0;
  }

  return v9;
}

- (void)itemManagerDidUpdate:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUContainedMediaAccessoriesGridViewController_legacy;
  [(HUItemCollectionViewController *)&v4 itemManagerDidUpdate:a3];
  [(HUContainedMediaAccessoriesGridViewController_legacy *)self _updateRightBarButtons];
}

- (id)finishPresentation:(id)a3 animated:(BOOL)a4
{
  return -[UIViewController hu_dismissViewControllerAnimated:](self, "hu_dismissViewControllerAnimated:", 1, a4);
}

- (void)_updateRightBarButtons
{
  if ([(HUContainedMediaAccessoriesGridViewController_legacy *)self isPresentedModally]) {
    id v5 = (id)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:0 target:self action:sel__done_];
  }
  else {
    id v5 = 0;
  }
  v3 = [(HUContainedMediaAccessoriesGridViewController_legacy *)self navigationItem];
  [v3 setLeftBarButtonItem:0];

  objc_super v4 = [(HUContainedMediaAccessoriesGridViewController_legacy *)self navigationItem];
  [v4 setRightBarButtonItem:v5];
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

- (HFMediaAccessoryItem)mediaAccessoryItem
{
  return self->_mediaAccessoryItem;
}

- (HUContainedMediaAccessoriesGridViewControllerDelegate_legacy)mediaAccessoryGridDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaAccessoryGridDelegate);

  return (HUContainedMediaAccessoriesGridViewControllerDelegate_legacy *)WeakRetained;
}

- (void)setMediaAccessoryGridDelegate:(id)a3
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
  objc_destroyWeak((id *)&self->_mediaAccessoryGridDelegate);
  objc_storeStrong((id *)&self->_mediaAccessoryItem, 0);

  objc_destroyWeak((id *)&self->_presentationDelegate);
}

@end