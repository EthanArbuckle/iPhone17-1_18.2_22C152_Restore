@interface _UIDocumentListController
+ (id)_listControllerHierarchyForURL:(id)a3 withConstructorBlock:(id)a4;
+ (id)listControllerHierarchyForURL:(id)a3;
+ (id)viewControllerWithRestorationIdentifierPath:(id)a3 coder:(id)a4;
- (BOOL)editing;
- (BOOL)hideSearchField;
- (BOOL)shouldHighlightItem:(id)a3;
- (BOOL)shouldSelectItem:(id)a3;
- (BOOL)shouldShowAction:(int64_t)a3;
- (NSArray)containedItems;
- (NSArray)selectedItems;
- (NSString)description;
- (NSURL)presentedURL;
- (_UIDocumentListController)init;
- (_UIDocumentListController)initWithCoder:(id)a3;
- (_UIDocumentListController)initWithModel:(id)a3;
- (_UIDocumentListController)initWithURL:(id)a3;
- (_UIDocumentListController)rootListController;
- (_UIDocumentListControllerDelegate)delegate;
- (id)model;
- (id)previewViewControllerForItem:(id)a3;
- (int)sortOrder;
- (int64_t)availableActions;
- (int64_t)displayMode;
- (void)_commonInitWithModel:(id)a3;
- (void)_performScrollTest:(id)a3 iterations:(int)a4 delta:(int)a5 listMode:(int64_t)a6;
- (void)_setContainerViewController:(id)a3;
- (void)_updateScrollPositionForStateRestoration;
- (void)createSearchControllerWithModel:(id)a3;
- (void)decodeRestorableStateWithCoder:(id)a3;
- (void)didHighlightItem:(id)a3;
- (void)didSelectItem:(id)a3;
- (void)didUnhighlightItem:(id)a3;
- (void)encodeRestorableStateWithCoder:(id)a3;
- (void)itemsOrSelectionDidChange:(BOOL)a3;
- (void)performAction:(int64_t)a3 item:(id)a4 view:(id)a5 completion:(id)a6;
- (void)setAvailableActions:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayMode:(int64_t)a3;
- (void)setEditing:(BOOL)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setHideSearchField:(BOOL)a3;
- (void)setRootListController:(id)a3;
- (void)setSelectedItems:(id)a3;
- (void)setSortOrder:(int)a3;
- (void)startSearchWithQueryString:(id)a3 becomeFirstResponder:(BOOL)a4;
- (void)updateTitle;
@end

@implementation _UIDocumentListController

- (void)_commonInitWithModel:(id)a3
{
  id v5 = a3;
  v4 = [[_UIDocumentPickerContainerViewController alloc] initWithModel:v5];
  [(_UIDocumentListController *)self _setContainerViewController:v4];
  [(_UIDocumentListController *)self setRestorationClass:objc_opt_class()];
  [(_UIDocumentListController *)self setRestorationIdentifier:@"DocumentList"];
  [(_UIDocumentListController *)self setAvailableActions:7];
  [(_UIDocumentListController *)self setEdgesForExtendedLayout:0];
  [(_UIDocumentListController *)self updateTitle];
  if (![(_UIDocumentListController *)self hideSearchField]) {
    [(_UIDocumentListController *)self createSearchControllerWithModel:v5];
  }
}

- (_UIDocumentListController)init
{
  return [(_UIDocumentListController *)self initWithURL:0];
}

- (_UIDocumentListController)initWithURL:(id)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_UIDocumentListController;
  id v5 = [(_UIDocumentListController *)&v16 initWithNibName:0 bundle:0];
  if (!v5) {
    goto LABEL_9;
  }
  if (!v4)
  {
    v13 = [_UIDocumentPickerRootContainerModel alloc];
    uint64_t v17 = *MEMORY[0x263F01A78];
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
    v11 = [(_UIDocumentPickerRootContainerModel *)v13 initWithPickableTypes:v8 mode:1];
    goto LABEL_8;
  }
  id v15 = 0;
  int v6 = [v4 getPromisedItemResourceValue:&v15 forKey:*MEMORY[0x263EFF6A8] error:0];
  id v7 = v15;
  v8 = v7;
  if (v6 && [v7 BOOLValue])
  {
    v9 = [_UIDocumentPickerURLContainerModel alloc];
    v18[0] = *MEMORY[0x263F01A78];
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
    v11 = [(_UIDocumentPickerURLContainerModel *)v9 initWithURL:v4 pickableTypes:v10 mode:1];

LABEL_8:
    [(_UIDocumentListController *)v5 _commonInitWithModel:v11];

LABEL_9:
    v12 = v5;
    goto LABEL_10;
  }

  v12 = 0;
LABEL_10:

  return v12;
}

- (_UIDocumentListController)initWithModel:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIDocumentListController;
  id v5 = [(_UIDocumentListController *)&v8 initWithNibName:0 bundle:0];
  int v6 = v5;
  if (v5) {
    [(_UIDocumentListController *)v5 _commonInitWithModel:v4];
  }

  return v6;
}

- (_UIDocumentListController)initWithCoder:(id)a3
{
  return [(_UIDocumentListController *)self initWithModel:0];
}

- (void)createSearchControllerWithModel:(id)a3
{
  id v4 = a3;
  id v5 = [_UIDocumentPickerSearchContainerModel alloc];
  int v6 = [v4 pickableTypes];
  uint64_t v7 = [v4 pickerMode];

  v10 = [(_UIDocumentPickerSearchContainerModel *)v5 initWithPickableTypes:v6 mode:v7];
  objc_super v8 = [[_UIDocumentSearchListController alloc] initWithModel:v10];
  searchController = self->_searchController;
  self->_searchController = v8;

  [(_UIDocumentListController *)self->_searchController setRootListController:self];
  [(_UIDocumentPickerContainerViewController *)self->_containerViewController setResultsController:self->_searchController];
}

- (void)setHideSearchField:(BOOL)a3
{
  if (self->_hideSearchField != a3)
  {
    self->_hideSearchField = a3;
    if (a3)
    {
      searchController = self->_searchController;
      self->_searchController = 0;

      containerViewController = self->_containerViewController;
      [(_UIDocumentPickerContainerViewController *)containerViewController setResultsController:0];
    }
    else
    {
      id v6 = [(_UIDocumentPickerContainerViewController *)self->_containerViewController model];
      [(_UIDocumentListController *)self createSearchControllerWithModel:v6];
    }
  }
}

- (void)_setContainerViewController:(id)a3
{
  p_containerViewController = &self->_containerViewController;
  objc_storeStrong((id *)&self->_containerViewController, a3);
  id v11 = a3;
  [(_UIDocumentPickerContainerViewController *)*p_containerViewController beginAppearanceTransition:1 animated:0];
  id v6 = [(_UIDocumentPickerContainerViewController *)*p_containerViewController view];
  uint64_t v7 = [(_UIDocumentListController *)self view];
  [v7 bounds];
  objc_msgSend(v6, "setFrame:");

  [(_UIDocumentListController *)self addChildViewController:*p_containerViewController];
  objc_super v8 = [(_UIDocumentPickerContainerViewController *)*p_containerViewController view];
  [v8 setAutoresizingMask:18];

  [(_UIDocumentPickerContainerViewController *)*p_containerViewController setServiceViewController:self];
  v9 = [(_UIDocumentListController *)self view];
  v10 = [(_UIDocumentPickerContainerViewController *)*p_containerViewController view];
  [v9 addSubview:v10];

  [(_UIDocumentPickerContainerViewController *)*p_containerViewController didMoveToParentViewController:self];
  [(_UIDocumentPickerContainerViewController *)*p_containerViewController endAppearanceTransition];
}

- (void)updateTitle
{
  id v4 = [(_UIDocumentPickerContainerViewController *)self->_containerViewController model];
  v3 = [v4 displayTitle];
  [(_UIDocumentListController *)self setTitle:v3];
}

- (void)startSearchWithQueryString:(id)a3 becomeFirstResponder:(BOOL)a4
{
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id v4 = [(_UIDocumentListController *)self rootListController];

  if (v4)
  {
    id v5 = [(_UIDocumentListController *)self rootListController];
    [v5 setDelegate:obj];
  }
  else
  {
    objc_storeWeak((id *)&self->_delegateIfNotDeferred, obj);
  }
}

- (_UIDocumentListControllerDelegate)delegate
{
  v3 = [(_UIDocumentListController *)self rootListController];
  if (v3)
  {
    id v4 = [(_UIDocumentListController *)self rootListController];
    WeakRetained = [v4 delegate];
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegateIfNotDeferred);
  }

  return (_UIDocumentListControllerDelegate *)WeakRetained;
}

- (void)setSortOrder:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(_UIDocumentListController *)self rootListController];

  if (v5)
  {
    id v6 = [(_UIDocumentListController *)self rootListController];
    [v6 setSortOrder:v3];
  }
  else
  {
    self->_sortOrderIfNotDeferred = v3;
  }
}

- (int)sortOrder
{
  uint64_t v3 = [(_UIDocumentListController *)self rootListController];
  if (v3)
  {
    id v4 = [(_UIDocumentListController *)self rootListController];
    int sortOrderIfNotDeferred = [v4 sortOrder];
  }
  else
  {
    int sortOrderIfNotDeferred = self->_sortOrderIfNotDeferred;
  }

  return sortOrderIfNotDeferred;
}

- (void)setDisplayMode:(int64_t)a3
{
  id v5 = [(_UIDocumentListController *)self rootListController];

  if (v5)
  {
    id v6 = [(_UIDocumentListController *)self rootListController];
    [v6 setDisplayMode:a3];
  }
  else
  {
    self->_displayModeIfNotDeferred = a3;
  }
}

- (int64_t)displayMode
{
  uint64_t v3 = [(_UIDocumentListController *)self rootListController];
  if (v3)
  {
    id v4 = [(_UIDocumentListController *)self rootListController];
    uint64_t displayModeIfNotDeferred = [v4 displayMode];
  }
  else
  {
    uint64_t displayModeIfNotDeferred = self->_displayModeIfNotDeferred;
  }

  return displayModeIfNotDeferred;
}

- (void)setAvailableActions:(int64_t)a3
{
  id v5 = [(_UIDocumentListController *)self rootListController];

  if (v5)
  {
    id v6 = [(_UIDocumentListController *)self rootListController];
    [v6 setAvailableActions:a3];
  }
  else
  {
    self->_availableActionsIfNotDeferred = a3;
  }
}

- (int64_t)availableActions
{
  uint64_t v3 = [(_UIDocumentListController *)self rootListController];
  if (v3)
  {
    id v4 = [(_UIDocumentListController *)self rootListController];
    uint64_t availableActionsIfNotDeferred = [v4 availableActions];
  }
  else
  {
    uint64_t availableActionsIfNotDeferred = self->_availableActionsIfNotDeferred;
  }

  return availableActionsIfNotDeferred;
}

- (BOOL)shouldHighlightItem:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIDocumentListController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v7 = [(_UIDocumentListController *)self delegate];
    objc_super v8 = [v4 urlInLocalContainer];
    char v9 = [v7 documentListController:self shouldHighlightItemAtURL:v8];
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

- (void)didHighlightItem:(id)a3
{
  id v8 = a3;
  id v4 = [(_UIDocumentListController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(_UIDocumentListController *)self delegate];
    uint64_t v7 = [v8 urlInLocalContainer];
    [v6 documentListController:self didHighlightItemAtURL:v7];
  }
}

- (void)didUnhighlightItem:(id)a3
{
  id v8 = a3;
  id v4 = [(_UIDocumentListController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(_UIDocumentListController *)self delegate];
    uint64_t v7 = [v8 urlInLocalContainer];
    [v6 documentListController:self didUnhighlightItemAtURL:v7];
  }
}

- (BOOL)shouldSelectItem:(id)a3
{
  id v4 = a3;
  char v5 = [(_UIDocumentListController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v7 = [(_UIDocumentListController *)self delegate];
    id v8 = [v4 urlInLocalContainer];
    char v9 = [v7 documentListController:self shouldSelectItemAtURL:v8];
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

- (void)didSelectItem:(id)a3
{
  id v13 = a3;
  if ([v13 type] == 1 || objc_msgSend(v13, "type") == 2)
  {
    [v13 incrementModelDisplayCount];
    id v4 = objc_alloc([(_UIDocumentListController *)self _classForChildren]);
    char v5 = [v13 model];
    char v6 = (void *)[v4 initWithModel:v5];

    [v13 decrementModelDisplayCount];
    uint64_t v7 = [(_UIDocumentListController *)self delegate];
    [v6 setDelegate:v7];

    uint64_t v8 = [(_UIDocumentListController *)self rootListController];
    char v9 = (void *)v8;
    if (v8) {
      v10 = (_UIDocumentListController *)v8;
    }
    else {
      v10 = self;
    }
    [v6 setRootListController:v10];

    id v11 = [(_UIDocumentListController *)self delegate];

    if (v11)
    {
      v12 = [(_UIDocumentListController *)self delegate];
      [v12 documentListController:self didSelectContainerWithViewController:v6];
    }
    else
    {
      v12 = [(_UIDocumentListController *)self navigationController];
      [v12 pushViewController:v6 animated:1];
    }
  }
  else
  {
    char v6 = [(_UIDocumentListController *)self delegate];
    v12 = [v13 urlInLocalContainer];
    [v6 documentListController:self didSelectItemAtURL:v12];
  }
}

- (void)performAction:(int64_t)a3 item:(id)a4 view:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v14 = [(_UIDocumentListController *)self delegate];
  id v13 = [v12 urlInLocalContainer];

  [v14 documentListController:self performAction:a3 URL:v13 originatingView:v11 completion:v10];
}

- (BOOL)shouldShowAction:(int64_t)a3
{
  return ((1 << a3) & (unint64_t)~[(_UIDocumentListController *)self availableActions]) == 0;
}

- (void)itemsOrSelectionDidChange:(BOOL)a3
{
  if (a3)
  {
    id v4 = [(_UIDocumentListController *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      char v6 = cdui_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        -[_UIDocumentListController itemsOrSelectionDidChange:](v6);
      }

      uint64_t v7 = [(_UIDocumentListController *)self delegate];
      [v7 documentListControllerItemsChanged:self];
    }
  }
  [(_UIDocumentListController *)self updateTitle];
  uint64_t v8 = [(_UIDocumentListController *)self model];
  char v9 = [v8 url];
  if (v9)
  {

LABEL_12:
    goto LABEL_13;
  }
  id v10 = [(_UIDocumentListController *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = cdui_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[_UIDocumentListController itemsOrSelectionDidChange:](v12);
    }

    uint64_t v8 = [(_UIDocumentListController *)self delegate];
    [v8 documentListControllerURLWasRemoved:self];
    goto LABEL_12;
  }
LABEL_13:
  [(_UIDocumentListController *)self _updateScrollPositionForStateRestoration];
}

- (id)previewViewControllerForItem:(id)a3
{
  id v4 = a3;
  char v5 = [(_UIDocumentListController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v7 = [(_UIDocumentListController *)self delegate];
    uint64_t v8 = [v4 url];
    char v9 = [v7 documentListController:self viewControllerForPreviewingItemAtURL:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)model
{
  return [(_UIDocumentPickerContainerViewController *)self->_containerViewController model];
}

- (NSURL)presentedURL
{
  v2 = [(_UIDocumentListController *)self model];
  uint64_t v3 = [v2 url];

  return (NSURL *)v3;
}

- (NSArray)containedItems
{
  v2 = [(_UIDocumentListController *)self model];
  uint64_t v3 = [v2 modelObjects];
  id v4 = [v3 valueForKey:@"urlInLocalContainer"];

  return (NSArray *)v4;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  -[_UIDocumentPickerContainerViewController setEditing:animated:](self->_containerViewController, "setEditing:animated:");
  v7.receiver = self;
  v7.super_class = (Class)_UIDocumentListController;
  [(_UIDocumentListController *)&v7 setEditing:v5 animated:v4];
}

- (NSArray)selectedItems
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(_UIDocumentListController *)self model];
  BOOL v4 = [v3 modelObjects];

  BOOL v5 = [MEMORY[0x263F089C8] indexSet];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  char v6 = [(_UIDocumentPickerContainerViewController *)self->_containerViewController indexPathsForSelectedItems];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(v5, "addIndex:", objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "row"));
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  char v11 = [v4 objectsAtIndexes:v5];
  id v12 = [v11 valueForKey:@"urlInLocalContainer"];

  return (NSArray *)v12;
}

- (void)setSelectedItems:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [MEMORY[0x263EFF980] array];
  char v6 = [(_UIDocumentListController *)self containedItems];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v4;
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
        uint64_t v12 = objc_msgSend(v6, "indexOfObject:", *(void *)(*((void *)&v14 + 1) + 8 * v11), (void)v14);
        if (v12 != 0x7FFFFFFFFFFFFFFFLL)
        {
          id v13 = [MEMORY[0x263F088C8] indexPathForRow:v12 inSection:0];
          [v5 addObject:v13];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  [(_UIDocumentPickerContainerViewController *)self->_containerViewController setIndexPathsForSelectedItems:v5];
}

- (void)_performScrollTest:(id)a3 iterations:(int)a4 delta:(int)a5 listMode:(int64_t)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  containerViewController = self->_containerViewController;
  id v11 = a3;
  uint64_t v12 = [(_UIDocumentPickerContainerViewController *)containerViewController childViewControllers];
  id v14 = [v12 firstObject];

  [(_UIDocumentPickerContainerViewController *)self->_containerViewController setExplicitDisplayMode:a6];
  [(_UIDocumentPickerContainerViewController *)self->_containerViewController displayModeChanged];
  id v13 = [v14 scrollView];
  [v13 _performScrollTest:v11 iterations:v8 delta:v7];
}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_UIDocumentListController;
  id v4 = a3;
  [(_UIDocumentListController *)&v9 encodeRestorableStateWithCoder:v4];
  BOOL v5 = [(_UIDocumentListController *)self model];
  char v6 = [v5 url];
  [v4 encodeObject:v6 forKey:@"url"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[_UIDocumentListController availableActions](self, "availableActions"), @"AvailableActions");
  [(_UIDocumentPickerContainerViewController *)self->_containerViewController contentOffset];
  objc_msgSend(v4, "encodeCGPoint:forKey:", @"ContentOffset");
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rootListController);
  [v4 encodeObject:WeakRetained forKey:@"Root"];

  uint64_t v8 = [(_UIDocumentListController *)self delegate];
  [v4 encodeObject:v8 forKey:@"Delegate"];
}

- (void)decodeRestorableStateWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_UIDocumentListController;
  id v4 = a3;
  [(_UIDocumentListController *)&v9 decodeRestorableStateWithCoder:v4];
  BOOL v5 = objc_msgSend(v4, "decodeObjectForKey:", @"Root", v9.receiver, v9.super_class);
  objc_storeWeak((id *)&self->_rootListController, v5);

  [v4 decodeCGPointForKey:@"ContentOffset"];
  self->_stateRestoredContentOffset.x = v6;
  self->_stateRestoredContentOffset.y = v7;
  -[_UIDocumentListController setAvailableActions:](self, "setAvailableActions:", [v4 decodeIntegerForKey:@"AvailableActions"]);
  uint64_t v8 = [v4 decodeObjectForKey:@"Delegate"];

  [(_UIDocumentListController *)self setDelegate:v8];
}

- (void)_updateScrollPositionForStateRestoration
{
  uint64_t v3 = [(_UIDocumentListController *)self model];
  id v4 = [v3 modelObjects];

  if (v4)
  {
    BOOL v5 = (CGPoint *)MEMORY[0x263F00148];
    if (self->_stateRestoredContentOffset.x != *MEMORY[0x263F00148]
      || self->_stateRestoredContentOffset.y != *(double *)(MEMORY[0x263F00148] + 8))
    {
      -[_UIDocumentPickerContainerViewController setContentOffset:](self->_containerViewController, "setContentOffset:");
      self->_stateRestoredContentOffset = *v5;
    }
  }
}

+ (id)viewControllerWithRestorationIdentifierPath:(id)a3 coder:(id)a4
{
  BOOL v5 = [a4 decodeObjectForKey:@"url"];
  CGFloat v6 = [MEMORY[0x263F08850] defaultManager];
  CGFloat v7 = [v5 path];
  int v8 = [v6 fileExistsAtPath:v7];

  if (v8) {
    objc_super v9 = (void *)[objc_alloc((Class)a1) initWithURL:v5];
  }
  else {
    objc_super v9 = 0;
  }

  return v9;
}

+ (id)_listControllerHierarchyForURL:(id)a3 withConstructorBlock:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a3;
  CGFloat v6 = (void (**)(id, id))a4;
  id v32 = 0;
  uint64_t v7 = *MEMORY[0x263EFF6A8];
  id v31 = 0;
  [v5 getPromisedItemResourceValue:&v32 forKey:v7 error:&v31];
  id v8 = v32;
  id v9 = v31;
  id v10 = 0;
  if ([v8 BOOLValue])
  {
    id v26 = v9;
    id v11 = [MEMORY[0x263EFF980] array];
    id v12 = v5;
    if (objc_msgSend(v12, "br_isDocumentsContainer"))
    {
      id v13 = v12;
    }
    else
    {
      do
      {
        id v14 = v6[2](v6, v12);
        [v11 insertObject:v14 atIndex:0];

        id v13 = [v12 URLByDeletingLastPathComponent];

        id v12 = v13;
      }
      while (!objc_msgSend(v13, "br_isDocumentsContainer"));
    }
    v25 = objc_msgSend(v13, "br_pathRelativeToMobileDocuments");
    if (([v25 isEqualToString:*MEMORY[0x263F324F0]] & 1) == 0)
    {
      long long v15 = v6[2](v6, v13);
      [v11 insertObject:v15 atIndex:0];
    }
    long long v16 = objc_msgSend(NSURL, "ui_cloudDocsContainerURL");
    if (v16)
    {
      long long v17 = v6[2](v6, v16);
      [v11 insertObject:v17 atIndex:0];
    }
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v10 = v11;
    uint64_t v18 = [v10 countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      id v20 = 0;
      uint64_t v21 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v28 != v21) {
            objc_enumerationMutation(v10);
          }
          v23 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          if (v20) {
            [v23 setRootListController:v20];
          }
          else {
            id v20 = v23;
          }
        }
        uint64_t v19 = [v10 countByEnumeratingWithState:&v27 objects:v33 count:16];
      }
      while (v19);
    }
    else
    {
      id v20 = 0;
    }

    id v9 = v26;
  }

  return v10;
}

+ (id)listControllerHierarchyForURL:(id)a3
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __59___UIDocumentListController_listControllerHierarchyForURL___block_invoke;
  v5[3] = &__block_descriptor_40_e42____UIDocumentListController_16__0__NSURL_8l;
  v5[4] = a1;
  uint64_t v3 = [a1 _listControllerHierarchyForURL:a3 withConstructorBlock:v5];

  return v3;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(_UIDocumentListController *)self model];
  CGFloat v6 = [v5 url];
  uint64_t v7 = [v3 stringWithFormat:@"<%@: %p, %@>", v4, self, v6];

  return (NSString *)v7;
}

- (BOOL)hideSearchField
{
  return self->_hideSearchField;
}

- (BOOL)editing
{
  return self->_editing;
}

- (void)setEditing:(BOOL)a3
{
  self->_editing = a3;
}

- (_UIDocumentListController)rootListController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rootListController);

  return (_UIDocumentListController *)WeakRetained;
}

- (void)setRootListController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_destroyWeak((id *)&self->_delegateIfNotDeferred);
  objc_storeStrong((id *)&self->_containerViewController, 0);

  objc_destroyWeak((id *)&self->_rootListController);
}

- (void)itemsOrSelectionDidChange:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_22CA47000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] folder was removed, informing delegate", v1, 2u);
}

- (void)itemsOrSelectionDidChange:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_22CA47000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] folder was changed, informing delegate", v1, 2u);
}

@end