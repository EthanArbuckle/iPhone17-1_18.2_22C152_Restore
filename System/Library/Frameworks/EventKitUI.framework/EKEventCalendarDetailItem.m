@interface EKEventCalendarDetailItem
- (BOOL)_calendarCanBeChanged;
- (BOOL)_shouldAllowViewingDetailsForCalendar:(id)a3;
- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4;
- (BOOL)editItemViewControllerSave:(id)a3;
- (BOOL)eventViewController:(id)a3 shouldSelectSubitem:(unint64_t)a4;
- (BOOL)hasDetailViewControllerAtIndex:(unint64_t)a3;
- (BOOL)minimalMode;
- (EKEventCalendarDetailItem)init;
- (id)cellForSubitemAtIndex:(unint64_t)a3 withTraitCollection:(id)a4;
- (id)detailViewControllerWithFrame:(CGRect)a3 forSubitemAtIndex:(unint64_t)a4;
- (id)eligibleCalendars;
- (id)popupMenu:(id)a3;
- (void)dealloc;
- (void)reset;
@end

@implementation EKEventCalendarDetailItem

- (EKEventCalendarDetailItem)init
{
  v5.receiver = self;
  v5.super_class = (Class)EKEventCalendarDetailItem;
  v2 = [(EKEventCalendarDetailItem *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel__contentSizeCategoryChanged_ name:*MEMORY[0x1E4FB27A8] object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB27A8] object:0];

  v4.receiver = self;
  v4.super_class = (Class)EKEventCalendarDetailItem;
  [(EKEventDetailItem *)&v4 dealloc];
}

- (void)reset
{
  calendar = self->_calendar;
  self->_calendar = 0;

  popupCell = self->_popupCell;
  self->_popupCell = 0;

  displayCell = self->_displayCell;
  self->_displayCell = 0;

  popupMenu = self->_popupMenu;
  self->_popupMenu = 0;
}

- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_calendar, a3);
  BOOL v8 = [(EKEventCalendarDetailItem *)self _calendarCanBeChanged]
    && (([(EKEvent *)self->super._event isSelfOrganized] & 1) != 0
     || ![(EKEventDetailItem *)self isPrivateEvent]
     && ![(EKEventDetailItem *)self isReadOnlyDelegateCalendar])
    || [(EKEventCalendarDetailItem *)self _shouldAllowViewingDetailsForCalendar:v7];
  [(EKEventDetailItem *)self setAllowsEditing:v8];
  if ([(EKEventCalendarDetailItem *)self minimalMode])
  {
    if ([v7 isSubscribed]) {
      int v9 = [v7 isSubscribedHolidayCalendar] ^ 1;
    }
    else {
      LOBYTE(v9) = 0;
    }
  }
  else
  {
    LOBYTE(v9) = !a4;
  }

  return v9;
}

- (BOOL)minimalMode
{
  v2 = [(EKEventDetailItem *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 minimalMode];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)eventViewController:(id)a3 shouldSelectSubitem:(unint64_t)a4
{
  return ![(EKEventCalendarDetailItem *)self minimalMode];
}

- (id)cellForSubitemAtIndex:(unint64_t)a3 withTraitCollection:(id)a4
{
  id v5 = a4;
  if (![(EKEventDetailItem *)self allowsEditing]
    || ([(EKEvent *)self->super._event calendar],
        v6 = objc_claimAutoreleasedReturnValue(),
        BOOL v7 = [(EKEventCalendarDetailItem *)self _shouldAllowViewingDetailsForCalendar:v6], v6, v7))
  {
    if (!self->_displayCell)
    {
      BOOL v8 = [[EKUITableViewCell alloc] initWithStyle:1 reuseIdentifier:0];
      displayCell = self->_displayCell;
      self->_displayCell = v8;
    }
    v10 = [MEMORY[0x1E4FB1E20] _currentTraitCollection];
    [MEMORY[0x1E4FB1E20] _setCurrentTraitCollection:v5];
    id v11 = objc_alloc(MEMORY[0x1E4F28E48]);
    v12 = [(EKEvent *)self->super._event calendar];
    v13 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    v14 = CalendarTitleWithDotAttributedString(v12, v13);
    v15 = (void *)[v11 initWithAttributedString:v14];

    uint64_t v16 = *MEMORY[0x1E4FB06F8];
    v17 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    objc_msgSend(v15, "addAttribute:value:range:", v16, v17, 0, objc_msgSend(v15, "length"));

    uint64_t v18 = *MEMORY[0x1E4FB0700];
    v19 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    objc_msgSend(v15, "addAttribute:value:range:", v18, v19, 0, objc_msgSend(v15, "length"));

    v20 = [(EKUITableViewCell *)self->_displayCell detailTextLabel];
    [v20 setAttributedText:v15];

    [(EKUITableViewCell *)self->_displayCell setAccessoryType:0];
    [MEMORY[0x1E4FB1E20] _setCurrentTraitCollection:v10];
    v21 = self->_displayCell;
    goto LABEL_6;
  }
  popupCell = self->_popupCell;
  if (!popupCell)
  {
    v29 = [[EKUIPopupTableViewCell alloc] initWithStyle:1 reuseIdentifier:0];
    v30 = self->_popupCell;
    self->_popupCell = v29;

    popupCell = self->_popupCell;
  }
  v21 = popupCell;
  [(EKUITableViewCell *)v21 setShowSelectedImage:1];
  v10 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  if (!EKUICatalyst())
  {
    v32 = [(EKEvent *)self->super._event calendar];
    v15 = +[EKUICalendarMenu placeholderMenuForCalendar:v32 backgroundColor:v10];

    [(EKUITableViewCell *)v21 setPopupMenu:v15];
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x3032000000;
    v38[3] = __Block_byref_object_copy__18;
    v38[4] = __Block_byref_object_dispose__18;
    id v39 = 0;
    objc_initWeak(&location, self);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __71__EKEventCalendarDetailItem_cellForSubitemAtIndex_withTraitCollection___block_invoke;
    v33[3] = &unk_1E60887A0;
    objc_copyWeak(&v36, &location);
    v35 = v38;
    id v34 = v10;
    [(EKUITableViewCell *)v21 setPopupMenuProvider:v33];

    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
    _Block_object_dispose(v38, 8);

LABEL_6:
    goto LABEL_7;
  }
  v31 = [(EKEventCalendarDetailItem *)self popupMenu:v10];
  [(EKUITableViewCell *)v21 setPopupMenu:v31];

LABEL_7:
  v22 = EventKitUIBundle();
  v23 = [v22 localizedStringForKey:@"Calendar" value:&stru_1F0CC2140 table:0];
  v24 = [(EKUITableViewCell *)v21 textLabel];
  [v24 setText:v23];

  v25 = [MEMORY[0x1E4FB1618] labelColor];
  v26 = [(EKUITableViewCell *)v21 textLabel];
  [v26 setTextColor:v25];

  return v21;
}

id __71__EKEventCalendarDetailItem_cellForSubitemAtIndex_withTraitCollection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  char v3 = WeakRetained;
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

- (BOOL)hasDetailViewControllerAtIndex:(unint64_t)a3
{
  return 1;
}

- (id)eligibleCalendars
{
  return (id)[MEMORY[0x1E4F57B40] eligibleCalendarsForMovingEvent:self->super._event];
}

- (id)popupMenu:(id)a3
{
  id v4 = a3;
  popupMenu = self->_popupMenu;
  if (!popupMenu)
  {
    v6 = [(EKEventCalendarDetailItem *)self eligibleCalendars];
    objc_initWeak(&location, self);
    id v7 = [(EKEvent *)self->super._event eventStore];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __39__EKEventCalendarDetailItem_popupMenu___block_invoke;
    v14[3] = &unk_1E60887C8;
    objc_copyWeak(&v15, &location);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __39__EKEventCalendarDetailItem_popupMenu___block_invoke_2;
    v12[3] = &unk_1E60887F0;
    objc_copyWeak(&v13, &location);
    BOOL v8 = +[EKUICalendarMenu calendarMenuWithCalendars:v6 eventStore:v7 backgroundColor:v4 setupActionHandler:v14 selectionHandler:v12];

    int v9 = self->_popupMenu;
    self->_popupMenu = v8;

    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);

    popupMenu = self->_popupMenu;
  }
  v10 = popupMenu;

  return v10;
}

void __39__EKEventCalendarDetailItem_popupMenu___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v8 = [WeakRetained[2] calendar];
    int v9 = [v5 isEqual:v8];

    if (v9) {
      [v10 setState:1];
    }
  }
}

void __39__EKEventCalendarDetailItem_popupMenu___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[2] setCalendar:v5];
    [v4 notifySubitemDidSave:0];
    [v4 editItemViewController:0 didCompleteWithAction:3];
  }
}

- (id)detailViewControllerWithFrame:(CGRect)a3 forSubitemAtIndex:(unint64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(EKEventDetailItem *)self allowsEditing])
  {
    int v9 = [(EKEvent *)self->super._event calendar];
    if ([(EKEventCalendarDetailItem *)self _shouldAllowViewingDetailsForCalendar:v9])
    {
      id v10 = -[EKSubscribedCalendarEditItemViewController initWithFrame:calendar:]([EKSubscribedCalendarEditItemViewController alloc], "initWithFrame:calendar:", v9, x, y, width, height);
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (BOOL)editItemViewControllerSave:(id)a3
{
  return 1;
}

- (BOOL)_calendarCanBeChanged
{
  if (![(EKCalendar *)self->_calendar allowsContentModifications]) {
    return 0;
  }
  int v3 = [(EKEvent *)self->super._event hasAttendees];
  event = self->super._event;
  if (!v3)
  {
    id v10 = [(EKEvent *)event eventStore];
    id v11 = [v10 readWriteCalendarsForEntityType:0];
    unint64_t v12 = [v11 count];
LABEL_7:
    BOOL v9 = v12 > 1;

    return v9;
  }
  id v5 = [(EKEvent *)event calendar];
  v6 = [v5 source];
  id v7 = [v6 constraints];
  char v8 = [v7 requiresOutgoingInvitationsInDefaultCalendar];

  if ((v8 & 1) == 0)
  {
    id v10 = [(EKEvent *)self->super._event calendar];
    id v11 = [v10 source];
    id v13 = [v11 readWriteCalendarsForEntityType:0];
    unint64_t v12 = [v13 count];

    goto LABEL_7;
  }
  return 0;
}

- (BOOL)_shouldAllowViewingDetailsForCalendar:(id)a3
{
  id v4 = a3;
  if ([v4 isSubscribed]
    && ([v4 isSubscribedHolidayCalendar] & 1) == 0
    && [MEMORY[0x1E4F57700] currentProcessIsFirstPartyCalendarApp])
  {
    BOOL v5 = ![(EKEventCalendarDetailItem *)self minimalMode];
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_popupMenu, 0);
  objc_storeStrong((id *)&self->_displayCell, 0);
  objc_storeStrong((id *)&self->_popupCell, 0);

  objc_storeStrong((id *)&self->_calendar, 0);
}

@end