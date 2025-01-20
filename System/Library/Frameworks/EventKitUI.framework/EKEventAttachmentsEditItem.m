@interface EKEventAttachmentsEditItem
- (BOOL)_shouldCondenseIntoSingleItem;
- (BOOL)_shouldShowAddAttachmentCell;
- (BOOL)attachmentsModified;
- (BOOL)canBeConfiguredForCalendarConstraints:(id)a3;
- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4;
- (BOOL)usesDetailViewControllerForSubitem:(unint64_t)a3;
- (EKEvent)eventToModify;
- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4;
- (id)_addAttachmentCell;
- (id)attachmentEvent;
- (id)cellForSubitemAtIndex:(unint64_t)a3;
- (id)detailViewControllerWithFrame:(CGRect)a3 forSubitemAtIndex:(unint64_t)a4;
- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4;
- (id)footerTitle;
- (id)parentViewControllerForAttachmentCellController:(id)a3;
- (id)trailingSwipeActionsConfigurationForRowAtIndex:(int64_t)a3;
- (unint64_t)numberOfSubitems;
- (unint64_t)onSaveEditItemsToRefresh;
- (unint64_t)onSaveEditorReloadBehavior;
- (void)_addAttachment:(id)a3;
- (void)_cleanUpCellControllers;
- (void)_loadAndAddDataAttachmentFromItem:(id)a3;
- (void)_showAddAttachmentViewControllerAnimated:(BOOL)a3;
- (void)attachmentEditViewController:(id)a3 attachmentDidChange:(int64_t)a4;
- (void)dealloc;
- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4;
- (void)documentPickerWasCancelled:(id)a3;
- (void)dropInteraction:(id)a3 performDrop:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4;
- (void)editor:(id)a3 didSelectSubitem:(unint64_t)a4;
- (void)refreshFromCalendarItemAndStore;
- (void)setAttachmentsModified:(BOOL)a3;
- (void)setEventToModify:(id)a3;
@end

@implementation EKEventAttachmentsEditItem

- (void)_cleanUpCellControllers
{
  [(NSArray *)self->_cellControllers enumerateObjectsUsingBlock:&__block_literal_global_40];
  cellControllers = self->_cellControllers;
  self->_cellControllers = 0;
}

uint64_t __53__EKEventAttachmentsEditItem__cleanUpCellControllers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDelegate:0];
}

- (id)attachmentEvent
{
  if (!self->_eventToModify)
  {
    v3 = [(EKEventEditItem *)self event];
    if ([v3 isNew])
    {
    }
    else
    {
      v4 = [(EKEventEditItem *)self event];
      int v5 = [v4 isOrWasPartOfRecurringSeries];

      if (v5)
      {
        v6 = [(EKEventEditItem *)self event];
        v7 = [v6 masterEvent];
        eventToModify = self->_eventToModify;
        self->_eventToModify = v7;

LABEL_7:
        goto LABEL_8;
      }
    }
    v9 = [(EKEventEditItem *)self event];
    v6 = self->_eventToModify;
    self->_eventToModify = v9;
    goto LABEL_7;
  }
LABEL_8:
  v10 = self->_eventToModify;

  return v10;
}

- (void)refreshFromCalendarItemAndStore
{
  v12.receiver = self;
  v12.super_class = (Class)EKEventAttachmentsEditItem;
  [(EKCalendarItemEditItem *)&v12 refreshFromCalendarItemAndStore];
  if (![(EKEventAttachmentsEditItem *)self _shouldCondenseIntoSingleItem])
  {
    v3 = [(EKEventAttachmentsEditItem *)self attachmentEvent];
    v4 = [v3 calendar];
    int v5 = [v4 source];

    v6 = [MEMORY[0x1E4F57B18] sharedInstance];
    uint64_t v7 = [v6 sourceIsManaged:v5];

    v8 = [v3 attachments];
    v9 = +[EKEventAttachmentCellController cellControllersForAttachments:v8 givenExistingControllers:self->_cellControllers sourceIsManaged:v7];

    [(NSArray *)self->_cellControllers makeObjectsPerformSelector:sel_setDelegate_ withObject:0];
    cellControllers = self->_cellControllers;
    self->_cellControllers = v9;
    v11 = v9;

    [(NSArray *)self->_cellControllers makeObjectsPerformSelector:sel_setDelegate_ withObject:self];
  }
}

- (unint64_t)onSaveEditorReloadBehavior
{
  return 2;
}

- (unint64_t)onSaveEditItemsToRefresh
{
  return 32;
}

- (void)dealloc
{
  [(EKEventAttachmentsEditItem *)self _cleanUpCellControllers];
  v3.receiver = self;
  v3.super_class = (Class)EKEventAttachmentsEditItem;
  [(EKEventAttachmentsEditItem *)&v3 dealloc];
}

- (BOOL)canBeConfiguredForCalendarConstraints:(id)a3
{
  return 1;
}

- (BOOL)_shouldCondenseIntoSingleItem
{
  v2 = [(EKEventAttachmentsEditItem *)self attachmentEvent];
  objc_super v3 = [v2 attachments];
  BOOL v4 = (unint64_t)[v3 count] > 3;

  return v4;
}

- (unint64_t)numberOfSubitems
{
  if ([(EKEventAttachmentsEditItem *)self _shouldCondenseIntoSingleItem]) {
    NSUInteger v3 = 1;
  }
  else {
    NSUInteger v3 = [(NSArray *)self->_cellControllers count];
  }
  return v3 + [(EKEventAttachmentsEditItem *)self _shouldShowAddAttachmentCell];
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4
{
  if (![(EKEventAttachmentsEditItem *)self _shouldCondenseIntoSingleItem]) {
    return *MEMORY[0x1E4FB2F28];
  }
  v8.receiver = self;
  v8.super_class = (Class)EKEventAttachmentsEditItem;
  [(EKCalendarItemEditItem *)&v8 defaultCellHeightForSubitemAtIndex:a3 forWidth:a4];
  return result;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  if ([(EKEventAttachmentsEditItem *)self _shouldCondenseIntoSingleItem])
  {
    if (!a3)
    {
      int v5 = [[EKUITableViewCell alloc] initWithStyle:1 reuseIdentifier:0];
      [(EKUITableViewCell *)v5 setAccessoryType:1];
      v6 = EventKitUIBundle();
      uint64_t v7 = [v6 localizedStringForKey:@"Attachments" value:&stru_1F0CC2140 table:0];
      objc_super v8 = [(EKUITableViewCell *)v5 textLabel];
      [v8 setText:v7];

      v9 = [(EKEventAttachmentsEditItem *)self attachmentEvent];
      v10 = [v9 attachments];
      [v10 count];
      v11 = CUIKLocalizedStringForInteger();
      objc_super v12 = [(EKUITableViewCell *)v5 detailTextLabel];
      [v12 setText:v11];

LABEL_6:
      goto LABEL_10;
    }
LABEL_8:
    int v5 = [(EKEventAttachmentsEditItem *)self _addAttachmentCell];
    goto LABEL_10;
  }
  unint64_t v13 = [(NSArray *)self->_cellControllers count];
  cellControllers = self->_cellControllers;
  if (v13 > a3)
  {
    v9 = [(NSArray *)cellControllers objectAtIndex:a3];
    int v5 = [v9 cell];
    goto LABEL_6;
  }
  if ([(NSArray *)cellControllers count] == a3) {
    goto LABEL_8;
  }
  int v5 = 0;
LABEL_10:

  return v5;
}

- (id)_addAttachmentCell
{
  addAttachmentCell = self->_addAttachmentCell;
  if (!addAttachmentCell)
  {
    BOOL v4 = [[EKUITableViewCell alloc] initWithStyle:0 reuseIdentifier:0];
    int v5 = self->_addAttachmentCell;
    self->_addAttachmentCell = v4;

    v6 = EventKitUIBundle();
    uint64_t v7 = [v6 localizedStringForKey:@"Add attachment" value:@"Add attachment…" table:0];
    objc_super v8 = [(EKUITableViewCell *)self->_addAttachmentCell textLabel];
    [v8 setText:v7];

    v9 = (void *)[objc_alloc(MEMORY[0x1E4FB1738]) initWithDelegate:self];
    [(EKUITableViewCell *)self->_addAttachmentCell addInteraction:v9];

    addAttachmentCell = self->_addAttachmentCell;
  }

  return addAttachmentCell;
}

- (void)editor:(id)a3 didSelectSubitem:(unint64_t)a4
{
  id v6 = a3;
  if (![(EKEventAttachmentsEditItem *)self _shouldCondenseIntoSingleItem])
  {
    unint64_t v7 = [(NSArray *)self->_cellControllers count];
    cellControllers = self->_cellControllers;
    if (v7 > a4)
    {
      v9 = [(NSArray *)cellControllers objectAtIndex:a4];
      [v9 cellSelected];

      goto LABEL_8;
    }
    if ([(NSArray *)cellControllers count] != a4) {
      goto LABEL_8;
    }
LABEL_7:
    [(EKEventAttachmentsEditItem *)self _showAddAttachmentViewControllerAnimated:1];
    goto LABEL_8;
  }
  if (a4) {
    goto LABEL_7;
  }
  v10.receiver = self;
  v10.super_class = (Class)EKEventAttachmentsEditItem;
  [(EKCalendarItemEditItem *)&v10 editor:v6 didSelectSubitem:0];
LABEL_8:
}

- (id)detailViewControllerWithFrame:(CGRect)a3 forSubitemAtIndex:(unint64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9 = [(EKCalendarItemEditItem *)self calendarItem];
  objc_super v10 = [v9 calendar];
  v11 = [v10 source];

  objc_super v12 = [MEMORY[0x1E4F57B18] sharedInstance];
  uint64_t v13 = [v12 sourceIsManaged:v11];

  v14 = [EKEventAttachmentEditViewController alloc];
  v15 = [(EKEventAttachmentsEditItem *)self attachmentEvent];
  v16 = [v15 attachments];
  v17 = -[EKEventAttachmentEditViewController initWithFrame:attachments:sourceIsManaged:](v14, "initWithFrame:attachments:sourceIsManaged:", v16, v13, x, y, width, height);

  [(EKEventAttachmentEditViewController *)v17 setDelegate:self];

  return v17;
}

- (BOOL)usesDetailViewControllerForSubitem:(unint64_t)a3
{
  return 0;
}

- (BOOL)_shouldShowAddAttachmentCell
{
  v2 = [(EKEventAttachmentsEditItem *)self attachmentEvent];
  char v3 = [v2 supportsAddingAttachments];

  return v3;
}

- (id)trailingSwipeActionsConfigurationForRowAtIndex:(int64_t)a3
{
  if (a3 < 0 || [(NSArray *)self->_cellControllers count] <= a3)
  {
    v11 = 0;
  }
  else
  {
    objc_initWeak(&location, self);
    int v5 = (void *)MEMORY[0x1E4FB1688];
    id v6 = EventKitUIBundle();
    unint64_t v7 = [v6 localizedStringForKey:@"Remove attachment" value:@"Remove" table:0];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __77__EKEventAttachmentsEditItem_trailingSwipeActionsConfigurationForRowAtIndex___block_invoke;
    v16 = &unk_1E6089DA8;
    objc_copyWeak(v18, &location);
    v18[1] = (id)a3;
    v17 = self;
    objc_super v8 = [v5 contextualActionWithStyle:1 title:v7 handler:&v13];

    v9 = (void *)MEMORY[0x1E4FB1CC0];
    objc_super v10 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:", v8, v13, v14, v15, v16);
    v11 = [v9 configurationWithActions:v10];

    [v11 setPerformsFirstActionWithFullSwipe:0];
    objc_destroyWeak(v18);
    objc_destroyWeak(&location);
  }

  return v11;
}

void __77__EKEventAttachmentsEditItem_trailingSwipeActionsConfigurationForRowAtIndex___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  v9 = a4;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v11 = [WeakRetained[6] objectAtIndex:*(void *)(a1 + 48)];
  id location = WeakRetained + 6;
  id obj = [MEMORY[0x1E4F1CA48] arrayWithArray:WeakRetained[6]];
  [obj removeObjectAtIndex:*(void *)(a1 + 48)];
  objc_super v12 = [v11 attachment];
  uint64_t v13 = [WeakRetained attachmentEvent];
  id v14 = v12;
  v15 = v14;
  v36 = v13;
  if (([v13 isNew] & 1) == 0)
  {
    uint64_t v29 = a1;
    v30 = v11;
    v31 = WeakRetained;
    v32 = v9;
    id v33 = v8;
    id v34 = v7;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v16 = [v13 attachments];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v38 objects:v42 count:16];
    v15 = v14;
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v39;
      v15 = v14;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v39 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          v22 = [v21 UUID];
          v23 = [v14 UUID];
          int v24 = [v22 isEqualToString:v23];

          if (v24)
          {
            id v25 = v21;

            v15 = v25;
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v18);
    }

    id v8 = v33;
    id v7 = v34;
    WeakRetained = v31;
    v9 = v32;
    a1 = v29;
    v11 = v30;
    uint64_t v13 = v36;
  }
  [v13 removeAttachment:v15];
  [WeakRetained setAttachmentsModified:1];
  objc_storeStrong(location, obj);
  [*(id *)(a1 + 32) notifySubitemDidSave:*(void *)(a1 + 48)];
  v26 = [*(id *)(a1 + 32) delegate];
  char v27 = objc_opt_respondsToSelector();

  if (v27)
  {
    v28 = [*(id *)(a1 + 32) delegate];
    [v28 editItem:*(void *)(a1 + 32) wantsDoneButtonDisabled:0];
  }
  v9[2](v9, 1);
}

- (id)parentViewControllerForAttachmentCellController:(id)a3
{
  BOOL v4 = [(EKCalendarItemEditItem *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(EKCalendarItemEditItem *)self delegate];
    id v7 = [v6 viewControllerForEditItem:self];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)attachmentEditViewController:(id)a3 attachmentDidChange:(int64_t)a4
{
}

- (void)_showAddAttachmentViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v18[1] = *MEMORY[0x1E4F143B8];
  char v5 = [(EKCalendarItemEditItem *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(EKCalendarItemEditItem *)self delegate];
    id v8 = [v7 viewControllerForEditItem:self];

    if (v8)
    {
      v9 = [v8 presentedViewController];

      if (!v9)
      {
        id v10 = objc_alloc(MEMORY[0x1E4FB16F0]);
        v18[0] = *MEMORY[0x1E4F44370];
        v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
        objc_super v12 = (void *)[v10 initForOpeningContentTypes:v11 asCopy:1];

        self->_documentPickerPresented = 1;
        [v12 setDelegate:self];
        [v12 setAllowsMultipleSelection:0];
        uint64_t v13 = [(EKEventEditItem *)self event];
        id v14 = [v13 calendar];
        v15 = [v14 source];

        v16 = [MEMORY[0x1E4F57B18] sharedInstance];
        uint64_t v17 = [v16 sourceIsManaged:v15];

        [v12 _setIsContentManaged:v17];
        [v8 presentViewController:v12 animated:v3 completion:0];
      }
    }
  }
  else
  {
    id v8 = 0;
  }
}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  self->_documentPickerPresented = 0;
  id v6 = a4;
  id v7 = [a3 presentingViewController];
  [v7 dismissViewControllerAnimated:1 completion:0];

  id v9 = [v6 firstObject];

  if (v9)
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F25498]) initWithFilepath:v9];
    [(EKEventAttachmentsEditItem *)self _addAttachment:v8];
  }
}

- (void)documentPickerWasCancelled:(id)a3
{
  self->_documentPickerPresented = 0;
  id v3 = [a3 presentingViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)_addAttachment:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v5 = [(EKEventAttachmentsEditItem *)self attachmentEvent];
  [(id)v5 addAttachment:v4];

  [(EKEventAttachmentsEditItem *)self setAttachmentsModified:1];
  [(EKEventAttachmentsEditItem *)self refreshFromCalendarItemAndStore];
  [(EKCalendarItemEditItem *)self notifySubitemDidSave:[(EKEventAttachmentsEditItem *)self numberOfSubitems] - 1];
  id v6 = [(EKCalendarItemEditItem *)self delegate];
  LOBYTE(v5) = objc_opt_respondsToSelector();

  if (v5)
  {
    id v7 = [(EKCalendarItemEditItem *)self delegate];
    [v7 editItem:self wantsDoneButtonDisabled:0];
  }
}

- (id)footerTitle
{
  WeakRetained = objc_loadWeakRetained((id *)&self->super.super._calendarItem);
  if (![WeakRetained isOrWasPartOfRecurringSeries])
  {
    uint64_t v5 = 0;
    goto LABEL_5;
  }
  BOOL v4 = [(EKEventAttachmentsEditItem *)self _shouldShowAddAttachmentCell];

  if (v4)
  {
    WeakRetained = EventKitUIBundle();
    uint64_t v5 = [WeakRetained localizedStringForKey:@"Attachments will be applied to all recurrences" value:&stru_1F0CC2140 table:0];
LABEL_5:

    goto LABEL_7;
  }
  uint64_t v5 = 0;
LABEL_7:

  return v5;
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  v10[2] = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void *)*MEMORY[0x1E4F44378];
  id v5 = a4;
  id v6 = [v4 identifier];
  v10[0] = v6;
  id v7 = [(id)*MEMORY[0x1E4F44468] identifier];
  v10[1] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];

  LOBYTE(v6) = [v5 hasItemsConformingToTypeIdentifiers:v8];
  return (char)v6;
}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
  id v4 = [(EKEventAttachmentsEditItem *)self _addAttachmentCell];
  [v4 setHighlighted:1];
}

- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4
{
  id v4 = [(EKEventAttachmentsEditItem *)self _addAttachmentCell];
  [v4 setHighlighted:0];
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1740]) initWithDropOperation:2];

  return v4;
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  objc_msgSend(a4, "items", a3);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    id v7 = (void *)*MEMORY[0x1E4F44378];
    v15 = (void *)*MEMORY[0x1E4F44468];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v10 = [v9 itemProvider];
        v11 = [v7 identifier];
        if ([v10 hasItemConformingToTypeIdentifier:v11])
        {
        }
        else
        {
          objc_super v12 = [v9 itemProvider];
          uint64_t v13 = [v15 identifier];
          int v14 = [v12 hasItemConformingToTypeIdentifier:v13];

          if (!v14) {
            continue;
          }
        }
        [(EKEventAttachmentsEditItem *)self _loadAndAddDataAttachmentFromItem:v9];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }
}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
  id v4 = [(EKEventAttachmentsEditItem *)self _addAttachmentCell];
  [v4 setHighlighted:0];
}

- (void)_loadAndAddDataAttachmentFromItem:(id)a3
{
  id v4 = [a3 itemProvider];
  uint64_t v5 = [(id)*MEMORY[0x1E4F44378] identifier];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__EKEventAttachmentsEditItem__loadAndAddDataAttachmentFromItem___block_invoke;
  v7[3] = &unk_1E6089DD0;
  v7[4] = self;
  id v6 = (id)[v4 loadFileRepresentationForTypeIdentifier:v5 completionHandler:v7];
}

void __64__EKEventAttachmentsEditItem__loadAndAddDataAttachmentFromItem___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = (objc_class *)MEMORY[0x1E4F25498];
    id v4 = a2;
    uint64_t v5 = (void *)[[v3 alloc] initWithFilepath:v4];

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __64__EKEventAttachmentsEditItem__loadAndAddDataAttachmentFromItem___block_invoke_2;
    v7[3] = &unk_1E6087D68;
    v7[4] = *(void *)(a1 + 32);
    id v8 = v5;
    id v6 = v5;
    dispatch_async(MEMORY[0x1E4F14428], v7);
  }
}

uint64_t __64__EKEventAttachmentsEditItem__loadAndAddDataAttachmentFromItem___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addAttachment:*(void *)(a1 + 40)];
}

- (BOOL)attachmentsModified
{
  return self->_attachmentsModified;
}

- (void)setAttachmentsModified:(BOOL)a3
{
  self->_attachmentsModified = a3;
}

- (EKEvent)eventToModify
{
  return (EKEvent *)objc_getProperty(self, a2, 72, 1);
}

- (void)setEventToModify:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventToModify, 0);
  objc_storeStrong((id *)&self->_addAttachmentCell, 0);

  objc_storeStrong((id *)&self->_cellControllers, 0);
}

@end