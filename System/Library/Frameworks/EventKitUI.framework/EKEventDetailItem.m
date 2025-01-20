@interface EKEventDetailItem
- (BOOL)allowsEditing;
- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4;
- (BOOL)detailItemVisibilityChanged;
- (BOOL)editItemViewControllerSave:(id)a3;
- (BOOL)editItemViewControllerShouldShowDetachAlert;
- (BOOL)eventViewController:(id)a3 shouldSelectSubitem:(unint64_t)a4;
- (BOOL)hasDetailViewControllerAtIndex:(unint64_t)a3;
- (BOOL)isPrivateEvent;
- (BOOL)isReadOnlyDelegateCalendar;
- (BOOL)requiresLayoutForSubitemCount;
- (BOOL)saveAndDismissWithForce:(BOOL)a3;
- (BOOL)shouldIndent;
- (EKEventDetailItemDelegate)delegate;
- (EKUINavigationDelegateProvider)viewControllerToPresentFrom;
- (UIViewController)viewController;
- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4;
- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4 forceUpdate:(BOOL)a5;
- (id)cellForSubitemAtIndex:(unint64_t)a3;
- (id)detailViewControllerWithFrame:(CGRect)a3 forSubitemAtIndex:(unint64_t)a4;
- (id)editItemEventToDetach;
- (id)infoDetailViewControllerWithFrame:(CGRect)a3;
- (int)cellPosition;
- (unint64_t)numberOfSubitems;
- (void)dealloc;
- (void)editItemViewController:(id)a3 didCompleteWithAction:(int)a4;
- (void)eventViewController:(id)a3 didSelectSubitem:(unint64_t)a4;
- (void)eventViewControllerDidTapInfoButton:(id)a3;
- (void)layoutCellsForWidth:(double)a3 position:(int)a4;
- (void)notifyDidCommit;
- (void)notifyDidEndEditing;
- (void)notifyDidStartEditing;
- (void)notifySubitemDidSave:(unint64_t)a3;
- (void)setAllowsEditing:(BOOL)a3;
- (void)setCellPosition:(int)a3;
- (void)setDelegate:(id)a3;
- (void)setEvent:(id)a3 reminder:(id)a4 store:(id)a5;
- (void)setShouldIndent:(BOOL)a3;
- (void)setViewController:(id)a3;
- (void)setViewControllerToPresentFrom:(id)a3;
@end

@implementation EKEventDetailItem

- (void)dealloc
{
  [(EKUIRecurrenceAlertController *)self->_recurrenceAlertController cancelAnimated:0];
  v3.receiver = self;
  v3.super_class = (Class)EKEventDetailItem;
  [(EKEventDetailItem *)&v3 dealloc];
}

- (void)setEvent:(id)a3 reminder:(id)a4 store:(id)a5
{
  v12 = (EKEvent *)a3;
  v9 = (REMReminder *)a4;
  v10 = (EKEventStore *)a5;
  if (self->_event != v12 || self->_reminder != v9)
  {
    objc_storeStrong((id *)&self->_event, a3);
    objc_storeStrong((id *)&self->_reminder, a4);
    if ((unint64_t)v9 | (unint64_t)self->_event) {
      [(EKEventDetailItem *)self reset];
    }
  }
  [(EKEventDetailItem *)self setAllowsEditing:0];
  store = self->_store;
  self->_store = v10;
}

- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4
{
  return 1;
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4
{
  [(EKEventDetailItem *)self defaultCellHeightForSubitemAtIndex:a3 forWidth:1 forceUpdate:a4];
  return result;
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4 forceUpdate:(BOOL)a5
{
  return *MEMORY[0x1E4FB2F28];
}

- (unint64_t)numberOfSubitems
{
  return 1;
}

- (void)layoutCellsForWidth:(double)a3 position:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  if ([(EKEventDetailItem *)self numberOfSubitems])
  {
    unint64_t v7 = 0;
    do
    {
      v8 = [(EKEventDetailItem *)self cellForSubitemAtIndex:v7];
      if (objc_opt_respondsToSelector()) {
        [v8 layoutForWidth:v4 position:a3];
      }

      ++v7;
    }
    while ([(EKEventDetailItem *)self numberOfSubitems] > v7);
  }
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  return 0;
}

- (BOOL)hasDetailViewControllerAtIndex:(unint64_t)a3
{
  objc_super v3 = [(EKEventDetailItem *)self cellForSubitemAtIndex:a3];
  BOOL v4 = [v3 accessoryType] == 1;

  return v4;
}

- (id)detailViewControllerWithFrame:(CGRect)a3 forSubitemAtIndex:(unint64_t)a4
{
  return 0;
}

- (id)infoDetailViewControllerWithFrame:(CGRect)a3
{
  return 0;
}

- (BOOL)eventViewController:(id)a3 shouldSelectSubitem:(unint64_t)a4
{
  return 1;
}

- (void)eventViewController:(id)a3 didSelectSubitem:(unint64_t)a4
{
  id v9 = a3;
  v6 = [v9 view];
  [v6 frame];
  unint64_t v7 = -[EKEventDetailItem detailViewControllerWithFrame:forSubitemAtIndex:](self, "detailViewControllerWithFrame:forSubitemAtIndex:", a4);

  if (v7)
  {
    objc_storeStrong((id *)&self->_viewController, v7);
    if (objc_opt_respondsToSelector()) {
      [(EKEditItemViewControllerProtocol *)self->_viewController setEditDelegate:self];
    }
    v8 = [v9 navigationDelegate];
    [v8 pushViewController:v7 animated:1];
  }
  if ([(EKEventDetailItem *)self allowsEditing]) {
    [(EKEventDetailItem *)self notifyDidStartEditing];
  }
}

- (void)eventViewControllerDidTapInfoButton:(id)a3
{
  id v7 = a3;
  BOOL v4 = [v7 view];
  [v4 frame];
  v5 = -[EKEventDetailItem infoDetailViewControllerWithFrame:](self, "infoDetailViewControllerWithFrame:");

  if (v5)
  {
    objc_storeStrong((id *)&self->_viewController, v5);
    if (objc_opt_respondsToSelector()) {
      [(EKEditItemViewControllerProtocol *)self->_viewController setEditDelegate:self];
    }
    v6 = [v7 navigationDelegate];
    [v6 pushViewController:v5 animated:1];
  }
  if ([(EKEventDetailItem *)self allowsEditing]) {
    [(EKEventDetailItem *)self notifyDidStartEditing];
  }
}

- (void)notifyDidStartEditing
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 eventItemDidStartEditing:self];
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
    [v6 eventItemDidEndEditing:self];
  }
}

- (void)notifySubitemDidSave:(unint64_t)a3
{
  [(EKEventDetailItem *)self reset];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 eventItemDidSave:self];
  }
}

- (BOOL)saveAndDismissWithForce:(BOOL)a3
{
  if (self->_viewController) {
    BOOL v4 = !a3;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4 && (objc_opt_respondsToSelector() & 1) != 0) {
    [(EKEditItemViewControllerProtocol *)self->_viewController saveAndDismissWithExtremePrejudice];
  }
  return 1;
}

- (BOOL)isReadOnlyDelegateCalendar
{
  objc_super v3 = [(EKEvent *)self->_event calendar];
  BOOL v4 = [v3 source];
  if ([v4 isDelegate])
  {
    char v5 = [(EKEvent *)self->_event calendar];
    id v6 = [v5 source];
    int v7 = [v6 isWritable] ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)isPrivateEvent
{
  return [(EKEvent *)self->_event privacyLevel] != 0;
}

- (BOOL)editItemViewControllerSave:(id)a3
{
  return 1;
}

- (BOOL)editItemViewControllerShouldShowDetachAlert
{
  return 0;
}

- (id)editItemEventToDetach
{
  return self->_event;
}

- (void)editItemViewController:(id)a3 didCompleteWithAction:(int)a4
{
  id v23 = a3;
  if ([(EKEvent *)self->_event hasChanges])
  {
    id v6 = [(EKEventDetailItem *)self delegate];
    int v7 = [v6 editorForEventDetailItem:self];

    switch(a4)
    {
      case 0:
        [(EKEvent *)self->_event rollback];
        [(EKEventDetailItem *)self reset];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        char v9 = objc_opt_respondsToSelector();

        if (v9)
        {
          id v10 = objc_loadWeakRetained((id *)&self->_delegate);
          [v10 eventItemDidSave:self];
        }
        break;
      case 2:
        if ([(EKEvent *)self->_event isOrWasPartOfRecurringSeries]
          && [(EKEvent *)self->_event isExternallyOrganizedInvitation])
        {
          event = self->_event;
          v15 = v7;
          uint64_t v16 = 0;
        }
        else
        {
          event = self->_event;
          v15 = v7;
          uint64_t v16 = 1;
        }
        [v15 saveEvent:event span:v16 error:0];
        break;
      case 3:
        v11 = self->_event;
        v12 = v7;
        uint64_t v13 = 0;
        goto LABEL_11;
      case 4:
        v11 = self->_event;
        v12 = v7;
        uint64_t v13 = 1;
        goto LABEL_11;
      case 5:
        v11 = self->_event;
        v12 = v7;
        uint64_t v13 = 2;
LABEL_11:
        [v12 saveEvent:v11 span:v13 error:0];
        [(EKEventDetailItem *)self notifyDidCommit];
        break;
      default:
        break;
    }
  }
  id v17 = objc_loadWeakRetained((id *)&self->_delegate);
  char v18 = objc_opt_respondsToSelector();

  if (v18)
  {
    id v19 = objc_loadWeakRetained((id *)&self->_delegate);
    [v19 eventItemDidEndEditing:self];
  }
  if ([v23 modal])
  {
    v20 = [(EKEditItemViewControllerProtocol *)self->_viewController navigationController];
    id v21 = (id)[v20 popViewControllerAnimated:1];
  }
  viewController = self->_viewController;
  self->_viewController = 0;
}

- (void)notifyDidCommit
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained eventItemDidCommit:self];
  }
}

- (BOOL)requiresLayoutForSubitemCount
{
  return 0;
}

- (BOOL)detailItemVisibilityChanged
{
  return 0;
}

- (EKEventDetailItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EKEventDetailItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)allowsEditing
{
  return self->_allowsEditing;
}

- (void)setAllowsEditing:(BOOL)a3
{
  self->_allowsEditing = a3;
}

- (int)cellPosition
{
  return self->_cellPosition;
}

- (void)setCellPosition:(int)a3
{
  self->_cellPosition = a3;
}

- (BOOL)shouldIndent
{
  return self->_shouldIndent;
}

- (void)setShouldIndent:(BOOL)a3
{
  self->_shouldIndent = a3;
}

- (UIViewController)viewController
{
  return (UIViewController *)self->_viewController;
}

- (void)setViewController:(id)a3
{
}

- (EKUINavigationDelegateProvider)viewControllerToPresentFrom
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewControllerToPresentFrom);

  return (EKUINavigationDelegateProvider *)WeakRetained;
}

- (void)setViewControllerToPresentFrom:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewControllerToPresentFrom);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_recurrenceAlertController, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_reminder, 0);
  objc_storeStrong((id *)&self->_lastEventUpdated, 0);
  objc_storeStrong((id *)&self->_event, 0);

  objc_storeStrong((id *)&self->_store, 0);
}

@end