@interface EKEventAlarmDetailItem
- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4;
- (EKAlarmsViewModel)alarmsViewModel;
- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4;
- (id)_createRealPopupMenuForIndex:(int64_t)a3 popupCell:(id)a4;
- (id)cellForSubitemAtIndex:(unint64_t)a3;
- (unint64_t)numberOfSubitems;
- (void)_setAlarmsAreEditable;
- (void)_updateAlarms;
- (void)setAlarmsViewModel:(id)a3;
- (void)setEvent:(id)a3 reminder:(id)a4 store:(id)a5;
- (void)ttlLocationStatusChanged:(id)a3;
@end

@implementation EKEventAlarmDetailItem

- (void)_updateAlarms
{
  v3 = [(EKEventAlarmDetailItem *)self alarmsViewModel];
  [v3 setNeedsUpdate];

  v4 = [(EKEventAlarmDetailItem *)self alarmsViewModel];
  v5 = [v4 uiAlarms];

  alarms = self->_alarms;
  self->_alarms = v5;
  v8 = v5;

  alarmPopupMenus = self->_alarmPopupMenus;
  self->_alarmPopupMenus = 0;
}

- (void)setEvent:(id)a3 reminder:(id)a4 store:(id)a5
{
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)EKEventAlarmDetailItem;
  [(EKEventDetailItem *)&v14 setEvent:v8 reminder:a4 store:a5];
  v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v10 = [(EKEventAlarmDetailItem *)self alarmsViewModel];
  [v9 removeObserver:self name:@"EKAlarmsViewModelTTLLocationStatusChangedNotification" object:v10];

  if (v8)
  {
    v11 = [[EKAlarmsViewModel alloc] initWithCalendarItem:v8];
    [(EKEventAlarmDetailItem *)self setAlarmsViewModel:v11];

    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v13 = [(EKEventAlarmDetailItem *)self alarmsViewModel];
    [v12 addObserver:self selector:sel_ttlLocationStatusChanged_ name:@"EKAlarmsViewModelTTLLocationStatusChangedNotification" object:v13];
  }
  else
  {
    [(EKEventAlarmDetailItem *)self setAlarmsViewModel:0];
  }
  [(EKEventAlarmDetailItem *)self _updateAlarms];
}

- (void)_setAlarmsAreEditable
{
  v3 = [(EKEvent *)self->super._event calendar];
  int v4 = [v3 allowsContentModifications];

  if (!v4 || [(EKEvent *)self->super._event status] == EKEventStatusCanceled) {
    goto LABEL_3;
  }
  v6 = [(EKEvent *)self->super._event calendar];
  v7 = [v6 source];
  id v8 = [v7 constraints];
  int v5 = [v8 maxAlarmsAllowed];

  if (!v5) {
    goto LABEL_4;
  }
  v9 = [(EKEvent *)self->super._event calendar];
  v10 = [v9 source];
  v11 = [v10 constraints];
  if (![v11 supportsAlarmTriggerIntervals]
    || [(EKEventDetailItem *)self isPrivateEvent])
  {
    LOBYTE(v5) = 0;
LABEL_9:

    goto LABEL_4;
  }
  BOOL v12 = [(EKEventDetailItem *)self isReadOnlyDelegateCalendar];

  if (!v12)
  {
    if (![(EKEvent *)self->super._event isExternallyOrganizedInvitation])
    {
      LOBYTE(v5) = 1;
      goto LABEL_4;
    }
    v9 = [(EKEvent *)self->super._event calendar];
    v10 = [v9 source];
    v11 = [v10 constraints];
    LOBYTE(v5) = [v11 supportsInvitationModifications];
    goto LABEL_9;
  }
LABEL_3:
  LOBYTE(v5) = 0;
LABEL_4:
  self->_alarmsAreEditable = v5;
}

- (void)ttlLocationStatusChanged:(id)a3
{
  id v4 = [(EKEventDetailItem *)self delegate];
  [v4 eventDetailItemWantsRefresh:self];
}

- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4
{
  [(EKEventAlarmDetailItem *)self _setAlarmsAreEditable];
  if (![(NSArray *)self->_alarms count] && !self->_alarmsAreEditable) {
    return 0;
  }
  int v5 = [(EKEvent *)self->super._event externalID];
  if (v5) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = [(EKEvent *)self->super._event actionsState] == 0;
  }

  return v6;
}

- (unint64_t)numberOfSubitems
{
  BOOL alarmsAreEditable = self->_alarmsAreEditable;
  NSUInteger v3 = [(NSArray *)self->_alarms count];
  unint64_t v4 = 1;
  if (v3) {
    unint64_t v4 = 2;
  }
  unint64_t v5 = 2;
  if (v3 < 2) {
    unint64_t v5 = v3;
  }
  if (alarmsAreEditable) {
    return v4;
  }
  else {
    return v5;
  }
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4
{
  v5.receiver = self;
  v5.super_class = (Class)EKEventAlarmDetailItem;
  [(EKEventDetailItem *)&v5 defaultCellHeightForSubitemAtIndex:a3 forWidth:a4];
  return result;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  v47[4] = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)self->_alarms count] <= a3)
  {
    objc_super v5 = EventKitUIBundle();
    uint64_t v36 = [v5 localizedStringForKey:@"None alert - event alarm detail item" value:@"None" table:0];
    uint64_t v6 = 0;
    v38 = 0;
    goto LABEL_5;
  }
  v38 = [(NSArray *)self->_alarms objectAtIndexedSubscript:a3];
  uint64_t v36 = objc_msgSend(v38, "localizedDescriptionAllDay:", -[EKEvent isAllDay](self->super._event, "isAllDay"));
  if (v38)
  {
    objc_super v5 = [(EKEventAlarmDetailItem *)self alarmsViewModel];
    uint64_t v6 = [v5 isAlarmEffectivelyDisabled:v38];
LABEL_5:

    goto LABEL_6;
  }
  uint64_t v6 = 0;
  v38 = 0;
LABEL_6:
  if (!self->_alarmsAreEditable)
  {
    v9 = [[EKUITableViewCell alloc] initWithStyle:1 reuseIdentifier:0];
    if (v6)
    {
      uint64_t v11 = *MEMORY[0x1E4FB0768];
      v47[0] = &unk_1F0D03640;
      uint64_t v12 = *MEMORY[0x1E4FB06F8];
      v46[0] = v11;
      v46[1] = v12;
      v13 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
      v47[1] = v13;
      v46[2] = *MEMORY[0x1E4FB0700];
      objc_super v14 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      v47[2] = v14;
      v46[3] = *MEMORY[0x1E4FB0760];
      v15 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      v16 = [v15 colorWithAlphaComponent:0.75];
      v47[3] = v16;
      v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:4];

      v18 = [(EKUIPopupTableViewCell *)v9 detailTextLabel];
      v19 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v36 attributes:v17];
      [v18 setAttributedText:v19];
    }
    else
    {
      v26 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
      v27 = [(EKUIPopupTableViewCell *)v9 detailTextLabel];
      [v27 setFont:v26];

      v28 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      v29 = [(EKUIPopupTableViewCell *)v9 detailTextLabel];
      [v29 setTextColor:v28];

      v30 = [(EKUIPopupTableViewCell *)v9 detailTextLabel];
      [v30 setText:v36];
    }
    goto LABEL_27;
  }
  if ([(NSMutableArray *)self->_alarmPopupMenus count] <= a3) {
    goto LABEL_10;
  }
  v7 = [(NSMutableArray *)self->_alarmPopupMenus objectAtIndexedSubscript:a3];
  id v8 = [MEMORY[0x1E4F1CA98] null];

  if (v7 == v8)
  {

LABEL_10:
    v7 = 0;
  }
  v9 = [[EKUIPopupTableViewCell alloc] initWithStyle:1 reuseIdentifier:0];
  if (EKUICatalyst())
  {
    v10 = [(EKEventAlarmDetailItem *)self _createRealPopupMenuForIndex:a3 popupCell:v9];
    [(EKUIPopupTableViewCell *)v9 setPopupMenu:v10];
  }
  else
  {
    if (!v7)
    {
      v20 = [(EKEventAlarmDetailItem *)self alarmsViewModel];
      v7 = [v20 placeholderMenuForAlarmAtIndex:a3];
    }
    -[EKUIPopupTableViewCell setPopupMenu:](v9, "setPopupMenu:", v7, v36, v38);
    objc_initWeak(&location, v9);
    objc_initWeak(&from, self);
    v42[0] = 0;
    v42[1] = v42;
    v42[2] = 0x3032000000;
    v42[3] = __Block_byref_object_copy__3;
    v42[4] = __Block_byref_object_dispose__3;
    id v43 = 0;
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __48__EKEventAlarmDetailItem_cellForSubitemAtIndex___block_invoke;
    v39[3] = &unk_1E6088548;
    objc_copyWeak(&v40, &from);
    objc_copyWeak(v41, &location);
    v39[4] = v42;
    v41[1] = (id)a3;
    [(EKUIPopupTableViewCell *)v9 setPopupMenuProvider:v39];
    objc_destroyWeak(v41);
    objc_destroyWeak(&v40);
    _Block_object_dispose(v42, 8);

    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  if (v7)
  {
    alarmPopupMenus = self->_alarmPopupMenus;
    if (!alarmPopupMenus)
    {
      v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v23 = self->_alarmPopupMenus;
      self->_alarmPopupMenus = v22;

      alarmPopupMenus = self->_alarmPopupMenus;
    }
    if ([(NSMutableArray *)alarmPopupMenus count] <= a3)
    {
      do
      {
        v24 = self->_alarmPopupMenus;
        v25 = [MEMORY[0x1E4F1CA98] null];
        [(NSMutableArray *)v24 addObject:v25];
      }
      while ([(NSMutableArray *)self->_alarmPopupMenus count] <= a3);
    }
    [(NSMutableArray *)self->_alarmPopupMenus setObject:v7 atIndexedSubscript:a3];
  }
  -[EKUIPopupTableViewCell setTitleStrikethrough:](v9, "setTitleStrikethrough:", v6, v36);

LABEL_27:
  v31 = +[EKAlarmsViewModel labelTextForIndex:](EKAlarmsViewModel, "labelTextForIndex:", a3, v36);
  v32 = [(EKUIPopupTableViewCell *)v9 textLabel];
  [v32 setText:v31];

  v33 = [MEMORY[0x1E4FB1618] labelColor];
  v34 = [(EKUIPopupTableViewCell *)v9 textLabel];
  [v34 setTextColor:v33];

  return v9;
}

id __48__EKEventAlarmDetailItem_cellForSubitemAtIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v6 = (void *)kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
  {
    v7 = v6;
    id v8 = objc_loadWeakRetained((id *)(a1 + 48));
    int v15 = 138412546;
    id v16 = v3;
    __int16 v17 = 2112;
    id v18 = v8;
    _os_log_impl(&dword_1B3F4C000, v7, OS_LOG_TYPE_ERROR, "Menu owner = %@. popupCell = %@", (uint8_t *)&v15, 0x16u);
  }
  id v9 = 0;
  if (WeakRetained && v5)
  {
    v10 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (!v10)
    {
      uint64_t v11 = [WeakRetained _createRealPopupMenuForIndex:*(void *)(a1 + 56) popupCell:v5];
      uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
      v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;

      [v5 setPopupMenu:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
      [v5 setPopupMenuProvider:0];
      v10 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    }
    id v9 = v10;
  }

  return v9;
}

- (id)_createRealPopupMenuForIndex:(int64_t)a3 popupCell:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  objc_initWeak(&from, v6);
  v7 = [(EKEventAlarmDetailItem *)self alarmsViewModel];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__EKEventAlarmDetailItem__createRealPopupMenuForIndex_popupCell___block_invoke;
  v10[3] = &unk_1E60885E8;
  objc_copyWeak(&v11, &location);
  v12[1] = (id)a3;
  objc_copyWeak(v12, &from);
  id v8 = [v7 menuForAlarmAtIndex:a3 actionHandler:v10];

  objc_destroyWeak(v12);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v8;
}

void __65__EKEventAlarmDetailItem__createRealPopupMenuForIndex_popupCell___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__EKEventAlarmDetailItem__createRealPopupMenuForIndex_popupCell___block_invoke_2;
  aBlock[3] = &unk_1E6088598;
  v7 = (id *)(a1 + 32);
  objc_copyWeak(v37, (id *)(a1 + 32));
  id v8 = v5;
  id v35 = v8;
  id v9 = v6;
  v10 = *(void **)(a1 + 48);
  id v36 = v9;
  v37[1] = v10;
  id v11 = (void (**)(void))_Block_copy(aBlock);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v13 = WeakRetained;
  if (WeakRetained)
  {
    objc_super v14 = [WeakRetained editItemEventToDetach];
    int v15 = [v14 isOrWasPartOfRecurringSeries];
    if (v14) {
      int v16 = v15;
    }
    else {
      int v16 = 0;
    }
    if (v16 == 1)
    {
      id v17 = objc_loadWeakRetained((id *)(a1 + 40));
      if (v17)
      {
        id v18 = [v13 viewControllerToPresentFrom];
        [v17 bounds];
        double v20 = v19;
        double v22 = v21;
        double v24 = v23;
        double v26 = v25;
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __65__EKEventAlarmDetailItem__createRealPopupMenuForIndex_popupCell___block_invoke_31;
        v31[3] = &unk_1E60885C0;
        objc_copyWeak(&v33, v7);
        v32 = v11;
        uint64_t v27 = +[EKUIRecurrenceAlertController presentDetachAlertWithOptions:viewController:sourceView:sourceRect:forEvent:withCompletionHandler:](EKUIRecurrenceAlertController, "presentDetachAlertWithOptions:viewController:sourceView:sourceRect:forEvent:withCompletionHandler:", 0, v18, v17, v14, v31, v20, v22, v24, v26);
        id v28 = v13[13];
        v13[13] = (id)v27;

        v29 = [v13[13] alertController];
        v30 = [v29 popoverPresentationController];
        [v30 setPermittedArrowDirections:12];

        objc_destroyWeak(&v33);
      }
    }
    else
    {
      v11[2](v11);
      [v13 editItemViewController:0 didCompleteWithAction:2];
    }
  }
  objc_destroyWeak(v37);
}

void __65__EKEventAlarmDetailItem__createRealPopupMenuForIndex_popupCell___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    unint64_t v4 = [WeakRetained alarmsViewModel];

    if (v4)
    {
      id v5 = [v3 alarmsViewModel];
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      uint64_t v8 = *(void *)(a1 + 56);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __65__EKEventAlarmDetailItem__createRealPopupMenuForIndex_popupCell___block_invoke_3;
      v10[3] = &unk_1E6088570;
      void v10[4] = v3;
      [v5 updatedUIAlarmFromUIAlarm:v6 toUIAlarm:v7 atIndex:v8 completion:v10];
    }
    else
    {
      id v9 = kEKUILogHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v12 = "-[EKEventAlarmDetailItem _createRealPopupMenuForIndex:popupCell:]_block_invoke_2";
        _os_log_impl(&dword_1B3F4C000, v9, OS_LOG_TYPE_ERROR, "Error: %s: 'alarmsViewModel' should not be nil", buf, 0xCu);
      }
    }
  }
}

uint64_t __65__EKEventAlarmDetailItem__createRealPopupMenuForIndex_popupCell___block_invoke_3(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    [*(id *)(result + 32) _updateAlarms];
    id v3 = *(void **)(v2 + 32);
    return [v3 notifySubitemDidSave:0];
  }
  return result;
}

void __65__EKEventAlarmDetailItem__createRealPopupMenuForIndex_popupCell___block_invoke_31(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = 3;
  switch(a2)
  {
    case 0:
      goto LABEL_5;
    case 1:
      uint64_t v3 = 4;
      goto LABEL_5;
    case 2:
      uint64_t v3 = 5;
LABEL_5:
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      [WeakRetained editItemViewController:0 didCompleteWithAction:v3];
      goto LABEL_6;
    case 4:
    case 5:
      return;
    default:
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      [WeakRetained reset];
      unint64_t v4 = [WeakRetained delegate];
      [v4 eventDetailItemWantsRefresh:WeakRetained];

LABEL_6:
      id v5 = (void *)WeakRetained[13];
      WeakRetained[13] = 0;

      return;
  }
}

- (EKAlarmsViewModel)alarmsViewModel
{
  return self->_alarmsViewModel;
}

- (void)setAlarmsViewModel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarmsViewModel, 0);
  objc_storeStrong((id *)&self->_recurrenceAlertController, 0);
  objc_storeStrong((id *)&self->_alarmPopupMenus, 0);

  objc_storeStrong((id *)&self->_alarms, 0);
}

@end