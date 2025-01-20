@interface _SFSettingsAlertController
- (BOOL)usesReverseOrder;
- (NSArray)items;
- (_SFPopoverSourceInfo)safari_popoverSourceInfo;
- (_SFSettingsAlertContentController)_rootContentController;
- (_SFSettingsAlertController)initWithNibName:(id)a3 bundle:(id)a4;
- (_SFSettingsAlertControllerDelegate)delegate;
- (_SFSettingsAlertItem)focusedItem;
- (id)presentingViewController;
- (int64_t)provenance;
- (void)_pushSubItemsForGroup:(id)a3;
- (void)addDivider;
- (void)addItem:(id)a3;
- (void)pushViewController:(id)a3;
- (void)removeAllItems;
- (void)resizeMenu;
- (void)setDelegate:(id)a3;
- (void)setFocusedItem:(id)a3;
- (void)setPreferredContentSize:(CGSize)a3;
- (void)setProvenance:(int64_t)a3;
- (void)setUsesReverseOrder:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation _SFSettingsAlertController

- (_SFSettingsAlertController)initWithNibName:(id)a3 bundle:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)_SFSettingsAlertController;
  v4 = [(_SFSettingsAlertController *)&v10 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = objc_alloc_init(_SFSettingsAlertContentController);
    [(_SFSettingsAlertContentController *)v5 setAlertController:v4];
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v5];
    navigationController = v4->_navigationController;
    v4->_navigationController = (UINavigationController *)v6;

    v8 = v4;
  }

  return v4;
}

- (void)viewDidLoad
{
  v18.receiver = self;
  v18.super_class = (Class)_SFSettingsAlertController;
  [(_SFSettingsAlertController *)&v18 viewDidLoad];
  [(UINavigationController *)self->_navigationController _setClipUnderlapWhileTransitioning:1];
  v3 = [MEMORY[0x1E4FB1618] labelColor];
  v4 = [(UINavigationController *)self->_navigationController navigationBar];
  [v4 setTintColor:v3];

  [(UINavigationController *)self->_navigationController willMoveToParentViewController:self];
  [(_SFSettingsAlertController *)self addChildViewController:self->_navigationController];
  v5 = [(_SFSettingsAlertController *)self view];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  v14 = [(UINavigationController *)self->_navigationController view];
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

  v15 = [(UINavigationController *)self->_navigationController view];
  [v15 setAutoresizingMask:18];

  v16 = [(_SFSettingsAlertController *)self view];
  v17 = [(UINavigationController *)self->_navigationController view];
  [v16 addSubview:v17];
}

- (_SFSettingsAlertContentController)_rootContentController
{
  v2 = [(UINavigationController *)self->_navigationController viewControllers];
  v3 = [v2 firstObject];

  return (_SFSettingsAlertContentController *)v3;
}

- (id)presentingViewController
{
  v3 = [(_SFSettingsAlertController *)self delegate];
  v4 = [v3 presentingViewControllerForAlertController:self];

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_SFSettingsAlertController;
    id v5 = [(_SFSettingsAlertController *)&v8 presentingViewController];
  }
  double v6 = v5;

  return v6;
}

- (void)setUsesReverseOrder:(BOOL)a3
{
  if (self->_usesReverseOrder != a3)
  {
    BOOL v3 = a3;
    self->_usesReverseOrder = a3;
    id v4 = [(_SFSettingsAlertController *)self _rootContentController];
    [v4 setUsesReverseOrder:v3];
  }
}

- (void)addItem:(id)a3
{
  id v4 = a3;
  id v5 = [(_SFSettingsAlertController *)self _rootContentController];
  [v5 addItem:v4];

  id v6 = [(_SFSettingsAlertController *)self delegate];
  [v6 alertController:self didAddItem:v4];
}

- (void)addDivider
{
  BOOL v3 = [(_SFSettingsAlertController *)self _rootContentController];
  [v3 addDivider];

  id v4 = [(_SFSettingsAlertController *)self delegate];
  [v4 alertControllerDidAddDivider:self];
}

- (_SFSettingsAlertItem)focusedItem
{
  v2 = [(_SFSettingsAlertController *)self _rootContentController];
  BOOL v3 = [v2 focusedItem];

  return (_SFSettingsAlertItem *)v3;
}

- (void)setFocusedItem:(id)a3
{
  id v4 = a3;
  id v5 = [(_SFSettingsAlertController *)self _rootContentController];
  [v5 setFocusedItem:v4];
}

- (void)removeAllItems
{
  BOOL v3 = [(_SFSettingsAlertController *)self _rootContentController];
  [v3 removeAllItems];

  id v4 = [(_SFSettingsAlertController *)self delegate];
  [v4 alertControllerResetSections:self];
}

- (void)resizeMenu
{
  id v2 = [(_SFSettingsAlertController *)self _rootContentController];
  [v2 resizeMenu];
}

- (NSArray)items
{
  id v2 = [(_SFSettingsAlertController *)self _rootContentController];
  BOOL v3 = [v2 items];

  return (NSArray *)v3;
}

- (void)_pushSubItemsForGroup:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(_SFSettingsAlertContentController);
  id v6 = [v4 title];
  double v7 = [(_SFSettingsAlertContentController *)v5 navigationItem];
  [v7 setTitle:v6];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  objc_super v8 = objc_msgSend(v4, "subItems", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [(_SFSettingsAlertContentController *)v5 addItem:*(void *)(*((void *)&v13 + 1) + 8 * v12++)];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  -[UINavigationController pushViewController:animated:](self->_navigationController, "pushViewController:animated:", v5, [MEMORY[0x1E4FB1EB0] areAnimationsEnabled]);
}

- (void)pushViewController:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4FB1EB0];
  id v5 = a3;
  uint64_t v6 = [v4 areAnimationsEnabled];
  [(UINavigationController *)self->_navigationController pushViewController:v5 animated:v6];
  navigationController = self->_navigationController;
  id v9 = [(UINavigationController *)navigationController viewControllers];
  id v8 = [v9 firstObject];

  [(UINavigationController *)navigationController setNavigationBarHidden:v8 == v5 animated:v6];
}

- (void)setPreferredContentSize:(CGSize)a3
{
  -[UINavigationController _adjustedContentSizeForPopover:](self->_navigationController, "_adjustedContentSizeForPopover:", a3.width, a3.height);
  v4.receiver = self;
  v4.super_class = (Class)_SFSettingsAlertController;
  -[_SFSettingsAlertController setPreferredContentSize:](&v4, sel_setPreferredContentSize_);
}

- (_SFPopoverSourceInfo)safari_popoverSourceInfo
{
  BOOL v3 = [(_SFSettingsAlertController *)self delegate];
  objc_super v4 = [v3 popoverSourceInfoForAlertController:self];

  return (_SFPopoverSourceInfo *)v4;
}

- (_SFSettingsAlertControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_SFSettingsAlertControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)provenance
{
  return self->_provenance;
}

- (void)setProvenance:(int64_t)a3
{
  self->_provenance = a3;
}

- (BOOL)usesReverseOrder
{
  return self->_usesReverseOrder;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_navigationController, 0);
}

@end