@interface EKCalendarItemEditItem
+ (double)scaledHeightOfSystemTableViewCell;
- (BOOL)canBeConfiguredForCalendarConstraints:(id)a3;
- (BOOL)editItemViewControllerSave:(id)a3;
- (BOOL)editItemViewControllerShouldShowDetachAlert;
- (BOOL)editor:(id)a3 canSelectSubitem:(unint64_t)a4;
- (BOOL)editor:(id)a3 shouldClearSelectionFromSubitem:(unint64_t)a4;
- (BOOL)isInline;
- (BOOL)saveAndDismissWithForce:(BOOL)a3;
- (BOOL)shouldAppear;
- (BOOL)shouldPinKeyboard;
- (BOOL)usesDetailViewControllerForSubitem:(unint64_t)a3;
- (EKCalendarItemEditItemDelegate)delegate;
- (UIResponder)selectedResponder;
- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4;
- (double)footerHeightForWidth:(double)a3;
- (id)calendarItem;
- (id)cellForSubitemAtIndex:(unint64_t)a3;
- (id)detailViewControllerWithFrame:(CGRect)a3 forSubitemAtIndex:(unint64_t)a4;
- (id)editItemEventToDetach;
- (id)footerTitle;
- (id)footerView;
- (id)headerTitle;
- (id)injectableViewControllerWithFrame:(CGRect)a3 forSubitemAtIndex:(unint64_t)a4;
- (id)trailingSwipeActionsConfigurationForRowAtIndex:(int64_t)a3;
- (id)viewForActionSheet;
- (unint64_t)numberOfSubitems;
- (unint64_t)onSaveEditItemsToRefresh;
- (unint64_t)onSaveEditorReloadBehavior;
- (void)editItemViewController:(id)a3 didCompleteWithAction:(int)a4;
- (void)editItemViewControllerWantsKeyboardPinned:(BOOL)a3;
- (void)editor:(id)a3 didSelectSubitem:(unint64_t)a4;
- (void)editor:(id)a3 requestsInjectableViewControllerToBeShownForSubitem:(unint64_t)a4;
- (void)notifyDidEndEditing;
- (void)notifyDidStartEditing;
- (void)notifyRequiresHeightChange;
- (void)notifySubitemDidSave:(unint64_t)a3;
- (void)notifyTextChanged;
- (void)setCalendarItem:(id)a3 store:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setSelectedResponder:(id)a3;
- (void)showViewController:(id)a3 editor:(id)a4 animated:(BOOL)a5;
@end

@implementation EKCalendarItemEditItem

- (void)setCalendarItem:(id)a3 store:(id)a4
{
  id obj = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_calendarItem);

  if (WeakRetained != obj)
  {
    id v8 = objc_storeWeak((id *)&self->_calendarItem, obj);

    if (!obj) {
      [(EKCalendarItemEditItem *)self reset];
    }
  }
  id v9 = objc_loadWeakRetained((id *)&self->_store);

  if (v9 != v6) {
    objc_storeWeak((id *)&self->_store, v6);
  }
  [(EKCalendarItemEditItem *)self refreshFromCalendarItemAndStore];
}

- (id)calendarItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_calendarItem);

  return WeakRetained;
}

- (BOOL)canBeConfiguredForCalendarConstraints:(id)a3
{
  return 1;
}

- (unint64_t)onSaveEditorReloadBehavior
{
  return 0;
}

- (unint64_t)onSaveEditItemsToRefresh
{
  return 0;
}

- (BOOL)shouldAppear
{
  return 1;
}

- (unint64_t)numberOfSubitems
{
  return 1;
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4
{
  return *MEMORY[0x1E4FB2F28];
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  return 0;
}

- (id)detailViewControllerWithFrame:(CGRect)a3 forSubitemAtIndex:(unint64_t)a4
{
  return 0;
}

- (id)injectableViewControllerWithFrame:(CGRect)a3 forSubitemAtIndex:(unint64_t)a4
{
  return 0;
}

- (double)footerHeightForWidth:(double)a3
{
  return 0.0;
}

- (id)footerView
{
  return 0;
}

- (id)footerTitle
{
  return 0;
}

- (id)headerTitle
{
  return 0;
}

- (BOOL)editor:(id)a3 canSelectSubitem:(unint64_t)a4
{
  return 1;
}

- (void)editor:(id)a3 requestsInjectableViewControllerToBeShownForSubitem:(unint64_t)a4
{
  id v6 = a3;
  v7 = [v6 view];
  [v7 frame];
  -[EKCalendarItemEditItem injectableViewControllerWithFrame:forSubitemAtIndex:](self, "injectableViewControllerWithFrame:forSubitemAtIndex:", a4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  [(EKCalendarItemEditItem *)self showViewController:v8 editor:v6 animated:0];
}

- (void)editor:(id)a3 didSelectSubitem:(unint64_t)a4
{
  id v6 = a3;
  v7 = [v6 view];
  [v7 frame];
  -[EKCalendarItemEditItem detailViewControllerWithFrame:forSubitemAtIndex:](self, "detailViewControllerWithFrame:forSubitemAtIndex:", a4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  [(EKCalendarItemEditItem *)self showViewController:v8 editor:v6 animated:1];
}

- (void)showViewController:(id)a3 editor:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id obj = a3;
  id v8 = a4;
  if (obj)
  {
    id v9 = objc_storeWeak((id *)&self->_viewController, obj);
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
      [WeakRetained setEditDelegate:self];
    }
    id v12 = objc_loadWeakRetained((id *)&self->_viewController);
    if (objc_opt_respondsToSelector())
    {
      id v13 = objc_loadWeakRetained((id *)&self->_viewController);
      int v14 = [v13 presentModally];

      if (v14)
      {
        v15 = +[EKEditItemViewController preferredViewControllerForPresentationsFromViewController:v8];
        v16 = [EKUIManagedNavigationController alloc];
        id v17 = objc_loadWeakRetained((id *)&self->_viewController);
        v18 = [(EKUIManagedNavigationController *)v16 initWithRootViewController:v17];

        v19 = [v8 view];
        if (EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v19))
        {
          v20 = [v8 view];
          BOOL IsRegular = EKUICurrentHeightSizeClassIsRegular(v20);

          if (IsRegular) {
            [(EKUIManagedNavigationController *)v18 setModalPresentationStyle:6];
          }
        }
        else
        {
        }
        [v8 preferredContentSize];
        double v27 = v26;
        double v29 = v28;
        id v30 = objc_loadWeakRetained((id *)&self->_viewController);
        objc_msgSend(v30, "setPreferredContentSize:", v27, v29);

        [v15 presentViewController:v18 animated:v5 completion:0];
        goto LABEL_15;
      }
    }
    else
    {
    }
    v22 = [v8 navigationController];
    v15 = v22;
    if (v5)
    {
      [v22 pushViewController:obj animated:1];
    }
    else
    {
      uint64_t v23 = [v22 viewControllers];

      v24 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v23];
      [v24 addObject:obj];
      v25 = [v8 navigationController];
      [v25 setViewControllers:v24 animated:0];

      v15 = (void *)v23;
    }
LABEL_15:
  }
  [(EKCalendarItemEditItem *)self notifyDidStartEditing];
}

- (BOOL)editor:(id)a3 shouldClearSelectionFromSubitem:(unint64_t)a4
{
  return ![(EKCalendarItemEditItem *)self usesDetailViewControllerForSubitem:a4];
}

- (BOOL)usesDetailViewControllerForSubitem:(unint64_t)a3
{
  return ![(EKCalendarItemEditItem *)self isInline];
}

- (void)notifyDidStartEditing
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 editItemDidStartEditing:self];
  }
}

- (void)notifyDidEndEditing
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 editItemDidEndEditing:self];
  }
}

- (void)notifySubitemDidSave:(unint64_t)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    BOOL v8 = [(EKCalendarItemEditItem *)self usesDetailViewControllerForSubitem:a3];
    id v9 = objc_loadWeakRetained((id *)p_delegate);
    [v9 editItem:self didSaveFromDetailViewController:v8];
  }
}

- (void)notifyTextChanged
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 editItemTextChanged:self];
  }
}

- (void)notifyRequiresHeightChange
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 editItemRequiresHeightChange:self];
  }
}

- (BOOL)saveAndDismissWithForce:(BOOL)a3
{
  BOOL v3 = a3;
  p_viewController = &self->_viewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);

  if (WeakRetained && v3)
  {
    id v6 = objc_loadWeakRetained((id *)p_viewController);
    [v6 saveAndDismissWithExtremePrejudice];
  }
  return 1;
}

- (BOOL)editItemViewControllerSave:(id)a3
{
  return 1;
}

- (void)editItemViewControllerWantsKeyboardPinned:(BOOL)a3
{
  BOOL v3 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    [v8 editItem:self wantsKeyboardPinned:v3];
  }
}

- (BOOL)editItemViewControllerShouldShowDetachAlert
{
  return 0;
}

- (id)editItemEventToDetach
{
  return 0;
}

- (void)editItemViewController:(id)a3 didCompleteWithAction:(int)a4
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    [v8 editItemDidEndEditing:self];
  }
  id v14 = objc_loadWeakRetained((id *)&self->_viewController);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [v14 editItemShouldBeAskedForInjectableViewController])
  {
    id v9 = objc_loadWeakRetained((id *)p_delegate);
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = objc_loadWeakRetained((id *)p_delegate);
      [v11 editItemWantsInjectableViewControllerToBeShown:self];
    }
  }
  else
  {
    objc_storeWeak((id *)&self->_viewController, 0);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v14 presentModally])
  {
    id v12 = [v14 presentingViewController];
    [v12 dismissViewControllerAnimated:1 completion:0];
  }
  else
  {
    id v12 = [v14 navigationController];
    id v13 = (id)[v12 popViewControllerAnimated:1];
  }
}

- (BOOL)isInline
{
  return 0;
}

- (BOOL)shouldPinKeyboard
{
  return 1;
}

- (id)viewForActionSheet
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  BOOL v3 = [WeakRetained view];

  return v3;
}

- (id)trailingSwipeActionsConfigurationForRowAtIndex:(int64_t)a3
{
  return 0;
}

+ (double)scaledHeightOfSystemTableViewCell
{
  v2 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  if (EKUIUnscaledCatalyst()) {
    double v3 = EKUIUnscaledCatalystTableRowHeightDefault();
  }
  else {
    double v3 = 44.0;
  }
  [v2 _scaledValueForValue:v3];
  CalRoundToScreenScale(v4);
  if (v5 >= v3) {
    double v3 = v5;
  }

  return v3;
}

- (EKCalendarItemEditItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EKCalendarItemEditItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIResponder)selectedResponder
{
  return self->_selectedResponder;
}

- (void)setSelectedResponder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedResponder, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_calendarItem);
  objc_destroyWeak((id *)&self->_viewController);

  objc_destroyWeak((id *)&self->_store);
}

@end