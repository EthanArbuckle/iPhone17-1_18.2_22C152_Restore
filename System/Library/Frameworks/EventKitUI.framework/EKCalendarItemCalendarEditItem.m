@interface EKCalendarItemCalendarEditItem
- (BOOL)canBeConfiguredForCalendarConstraints:(id)a3;
- (BOOL)shouldAppear;
- (EKCalendarItemCalendarEditItem)init;
- (EKCalendarItemCalendarEditItem)initWithEntityType:(unint64_t)a3;
- (id)cellForSubitemAtIndex:(unint64_t)a3;
- (id)eligibleCalendars;
- (id)popupMenu:(id)a3;
- (unint64_t)onSaveEditorReloadBehavior;
@end

@implementation EKCalendarItemCalendarEditItem

- (EKCalendarItemCalendarEditItem)initWithEntityType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)EKCalendarItemCalendarEditItem;
  result = [(EKCalendarItemCalendarEditItem *)&v5 init];
  if (result) {
    result->_entityType = a3;
  }
  return result;
}

- (EKCalendarItemCalendarEditItem)init
{
  return [(EKCalendarItemCalendarEditItem *)self initWithEntityType:0];
}

- (BOOL)canBeConfiguredForCalendarConstraints:(id)a3
{
  v9 = [(EKCalendarItemEditItem *)self calendarItem];
  int v10 = [v9 isNew];
  if (v10)
  {
    v3 = [(EKCalendarItemEditItem *)self calendarItem];
    v4 = [v3 calendar];
    objc_super v5 = [v4 source];
    v6 = [v5 constraints];
    if ([v6 requiresOutgoingInvitationsInDefaultCalendar])
    {
      v7 = [(EKCalendarItemEditItem *)self calendarItem];
      if ([v7 isSelfOrganizedInvitation]) {
        goto LABEL_4;
      }
    }
LABEL_10:
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._store);
    BOOL v13 = (int)[WeakRetained readWriteCalendarCountForEntityType:self->_entityType] > 1;

    return v13;
  }
LABEL_4:
  v11 = [(EKCalendarItemEditItem *)self calendarItem];
  char v12 = [v11 hasAttendees];

  if (v10)
  {
  }
  if ((v12 & 1) == 0) {
    goto LABEL_10;
  }
  return 0;
}

- (BOOL)shouldAppear
{
  return self->_entityType == 0;
}

- (unint64_t)onSaveEditorReloadBehavior
{
  return 2;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  v4 = [(EKCalendarItemEditItem *)self calendarItem];
  objc_super v5 = [v4 calendar];

  id WeakRetained = objc_loadWeakRetained((id *)&self->super._store);
  int v7 = [WeakRetained readWriteCalendarCountForEntityType:self->_entityType];

  if (v7 < 2)
  {
    v8 = [[EKUITableViewCell alloc] initWithStyle:1 reuseIdentifier:0];
    [(EKUIPopupTableViewCell *)v8 setSelectionStyle:0];
    if (self->_entityType)
    {
      v11 = [v5 title];

      if (v11)
      {
        char v12 = CUIKDisplayedTitleForCalendar();
      }
      else
      {
        v16 = EventKitUIBundle();
        char v12 = [v16 localizedStringForKey:@"Untitled Calendar" value:&stru_1F0CC2140 table:0];
      }
      v14 = [(EKUIPopupTableViewCell *)v8 detailTextLabel];
      [v14 setText:v12];
    }
    else
    {
      char v12 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
      v14 = CalendarTitleWithDotAttributedString(v5, v12);
      v15 = [(EKUIPopupTableViewCell *)v8 detailTextLabel];
      [v15 setAttributedText:v14];
    }
  }
  else
  {
    v8 = [[EKUIPopupTableViewCell alloc] initWithStyle:1 reuseIdentifier:0];
    [(EKUIPopupTableViewCell *)v8 setShowSelectedImage:1];
    v9 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    if (EKUICatalyst())
    {
      int v10 = [(EKCalendarItemCalendarEditItem *)self popupMenu:v9];
      [(EKUIPopupTableViewCell *)v8 setPopupMenu:v10];
    }
    else
    {
      BOOL v13 = +[EKUICalendarMenu placeholderMenuForCalendar:v5 backgroundColor:v9];
      [(EKUIPopupTableViewCell *)v8 setPopupMenu:v13];

      v26[0] = 0;
      v26[1] = v26;
      v26[2] = 0x3032000000;
      v26[3] = __Block_byref_object_copy__6;
      v26[4] = __Block_byref_object_dispose__6;
      id v27 = 0;
      objc_initWeak(&location, self);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __56__EKCalendarItemCalendarEditItem_cellForSubitemAtIndex___block_invoke;
      v21[3] = &unk_1E60887A0;
      objc_copyWeak(&v24, &location);
      v23 = v26;
      id v22 = v9;
      [(EKUIPopupTableViewCell *)v8 setPopupMenuProvider:v21];

      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
      _Block_object_dispose(v26, 8);
    }
  }
  v17 = EventKitUIBundle();
  v18 = [v17 localizedStringForKey:@"Calendar" value:&stru_1F0CC2140 table:0];
  v19 = [(EKUIPopupTableViewCell *)v8 textLabel];
  [v19 setText:v18];

  return v8;
}

id __56__EKCalendarItemCalendarEditItem_cellForSubitemAtIndex___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained && !*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v4 = [WeakRetained popupMenu:*(void *)(a1 + 32)];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  id v7 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  return v7;
}

- (id)eligibleCalendars
{
  v2 = (void *)MEMORY[0x1E4F57B40];
  v3 = [(EKCalendarItemEditItem *)self calendarItem];
  uint64_t v4 = [v2 eligibleCalendarsForMovingEvent:v3];

  return v4;
}

- (id)popupMenu:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(EKCalendarItemCalendarEditItem *)self eligibleCalendars];
  objc_initWeak(&location, self);
  v6 = [(EKCalendarItemEditItem *)self calendarItem];
  id v7 = [v6 eventStore];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __44__EKCalendarItemCalendarEditItem_popupMenu___block_invoke;
  v12[3] = &unk_1E60887C8;
  objc_copyWeak(&v13, &location);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__EKCalendarItemCalendarEditItem_popupMenu___block_invoke_2;
  v10[3] = &unk_1E60887F0;
  objc_copyWeak(&v11, &location);
  v8 = +[EKUICalendarMenu calendarMenuWithCalendars:v5 eventStore:v7 backgroundColor:v4 setupActionHandler:v12 selectionHandler:v10];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v8;
}

void __44__EKCalendarItemCalendarEditItem_popupMenu___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = [WeakRetained calendarItem];
    v9 = [v8 calendar];
    int v10 = [v5 isEqual:v9];

    if (v10) {
      [v11 setState:1];
    }
  }
}

void __44__EKCalendarItemCalendarEditItem_popupMenu___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained calendarItem];
    [v5 setCalendar:v6];

    [v4 notifySubitemDidSave:0];
  }
}

@end