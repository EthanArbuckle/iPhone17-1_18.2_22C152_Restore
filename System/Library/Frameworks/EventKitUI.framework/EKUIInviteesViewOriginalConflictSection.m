@interface EKUIInviteesViewOriginalConflictSection
- (BOOL)_isValidRow:(int64_t)a3;
- (BOOL)canEditRow:(id)a3;
- (BOOL)canSelectRow:(id)a3;
- (BOOL)checked;
- (BOOL)conflictFound;
- (BOOL)injectNewRowsBeforeLastExistingRow;
- (BOOL)sectionShouldBeShown;
- (BOOL)supportsContextMenuForIndexPath:(id)a3;
- (EKInviteeAlternativeTimeSearcher)availabilitySearcher;
- (EKUIInviteesViewOriginalConflictSection)init;
- (NSArray)busyParticipants;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSMutableSet)rowsShowingAllParticipants;
- (NSString)cachedCellReuseIdentifier;
- (NSString)title;
- (NSTimeZone)timeZone;
- (double)estimatedHeightForRow:(id)a3;
- (id)actionsForRow:(id)a3;
- (id)cellForIndexPath:(id)a3 inTableView:(id)a4;
- (id)contextMenuDataForIndexPath:(id)a3 interaction:(id)a4;
- (id)debugTitle;
- (id)newTimeChosen;
- (id)showPreviewOfEventAtTime;
- (id)tableViewCellHook;
- (id)titleForDeleteConfirmationButtonForRow:(id)a3;
- (int64_t)editingStyleForRow:(id)a3;
- (unint64_t)numberOfRows;
- (unint64_t)reuseIdentifierVersion;
- (void)availabilitySearcherChangedState:(int64_t)a3;
- (void)clearCheckmark;
- (void)reloadAndRegisterReusableCellsWithTableView:(id)a3;
- (void)selectRow:(id)a3;
- (void)setAvailabilitySearcher:(id)a3;
- (void)setBusyParticipants:(id)a3;
- (void)setCachedCellReuseIdentifier:(id)a3;
- (void)setChecked:(BOOL)a3;
- (void)setConflictFound:(BOOL)a3;
- (void)setEndDate:(id)a3;
- (void)setNewTimeChosen:(id)a3;
- (void)setReuseIdentifierVersion:(unint64_t)a3;
- (void)setRowsShowingAllParticipants:(id)a3;
- (void)setShowPreviewOfEventAtTime:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setTableViewCellHook:(id)a3;
- (void)setTimeZone:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation EKUIInviteesViewOriginalConflictSection

- (EKUIInviteesViewOriginalConflictSection)init
{
  v7.receiver = self;
  v7.super_class = (Class)EKUIInviteesViewOriginalConflictSection;
  v2 = [(EKUIInviteesViewOriginalConflictSection *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    [(EKUIInviteesViewOriginalConflictSection *)v2 setRowsShowingAllParticipants:v3];

    v4 = EventKitUIBundle();
    v5 = [v4 localizedStringForKey:@"Scheduling Conflict" value:&stru_1F0CC2140 table:0];
    [(EKUIInviteesViewOriginalConflictSection *)v2 setTitle:v5];
  }
  return v2;
}

- (id)debugTitle
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (BOOL)sectionShouldBeShown
{
  return [(EKUIInviteesViewOriginalConflictSection *)self numberOfRows] != 0;
}

- (unint64_t)numberOfRows
{
  if (![(EKUIInviteesViewOriginalConflictSection *)self conflictFound]) {
    return 0;
  }
  id v3 = [(EKUIInviteesViewOriginalConflictSection *)self startDate];
  if (v3)
  {
    v4 = [(EKUIInviteesViewOriginalConflictSection *)self endDate];
    unint64_t v5 = v4 != 0;
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (id)cellForIndexPath:(id)a3 inTableView:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)[v6 row];
  if ([(EKUIInviteesViewOriginalConflictSection *)self _isValidRow:v8])
  {
    v9 = [(EKUIInviteesViewOriginalConflictSection *)self cachedCellReuseIdentifier];
    v10 = [v7 dequeueReusableCellWithIdentifier:v9 forIndexPath:v6];

    objc_initWeak((id *)location, self);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __72__EKUIInviteesViewOriginalConflictSection_cellForIndexPath_inTableView___block_invoke;
    v27[3] = &unk_1E6089BA0;
    objc_copyWeak(&v28, (id *)location);
    [(EKUIInviteesViewTimeSlotCell *)v10 setShowPreviewOfEventAtTime:v27];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __72__EKUIInviteesViewOriginalConflictSection_cellForIndexPath_inTableView___block_invoke_2;
    v25[3] = &unk_1E60878C8;
    objc_copyWeak(v26, (id *)location);
    v26[1] = v8;
    [(EKUIInviteesViewTimeSlotCell *)v10 setShowAllConflictedParticipantsTapped:v25];
    v11 = [(EKUIInviteesViewOriginalConflictSection *)self rowsShowingAllParticipants];
    v12 = [NSNumber numberWithInteger:v8];
    uint64_t v13 = [v11 containsObject:v12];

    v14 = [(EKUIInviteesViewOriginalConflictSection *)self busyParticipants];
    -[EKUIInviteesViewOriginalConflictCell setConflict:](v10, "setConflict:", [v14 count] != 0);

    v15 = [(EKUIInviteesViewOriginalConflictSection *)self startDate];
    v16 = [(EKUIInviteesViewOriginalConflictSection *)self endDate];
    v17 = [(EKUIInviteesViewOriginalConflictSection *)self timeZone];
    v18 = [(EKUIInviteesViewOriginalConflictSection *)self busyParticipants];
    [(EKUIInviteesViewTimeSlotCell *)v10 updateWithStartDate:v15 endDate:v16 timeZone:v17 busyParticipants:v18 showAllParticipants:v13 checked:[(EKUIInviteesViewOriginalConflictSection *)self checked]];

    objc_destroyWeak(v26);
    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)location);
  }
  else
  {
    v19 = (void *)kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
    {
      v20 = NSNumber;
      v21 = v19;
      v22 = [v20 numberWithInteger:v8];
      v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[EKUIInviteesViewOriginalConflictSection numberOfRows](self, "numberOfRows"));
      *(_DWORD *)location = 138412546;
      *(void *)&location[4] = v22;
      __int16 v30 = 2112;
      v31 = v23;
      _os_log_impl(&dword_1B3F4C000, v21, OS_LOG_TYPE_ERROR, "A cell was requested for a nonexistent row.  Giving back a fresh cell.  Row: [%@].  Number of rows: [%@]", location, 0x16u);
    }
    v10 = objc_alloc_init(EKUIInviteesViewOriginalConflictCell);
  }

  return v10;
}

void __72__EKUIInviteesViewOriginalConflictSection_cellForIndexPath_inTableView___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v6);
  v8 = [WeakRetained showPreviewOfEventAtTime];

  if (v8)
  {
    id v9 = objc_loadWeakRetained(v6);
    v10 = [v9 showPreviewOfEventAtTime];
    ((void (**)(void, id, id))v10)[2](v10, v11, v5);
  }
}

void __72__EKUIInviteesViewOriginalConflictSection_cellForIndexPath_inTableView___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained rowsShowingAllParticipants];
  id v3 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  [v2 addObject:v3];
}

- (void)reloadAndRegisterReusableCellsWithTableView:(id)a3
{
  id v4 = a3;
  id v5 = (objc_class *)objc_opt_class();
  id v6 = [NSString alloc];
  id v7 = NSStringFromClass(v5);
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[EKUIInviteesViewOriginalConflictSection reuseIdentifierVersion](self, "reuseIdentifierVersion"));
  id v9 = (void *)[v6 initWithFormat:@"%@-%@", v7, v8];
  [(EKUIInviteesViewOriginalConflictSection *)self setCachedCellReuseIdentifier:v9];

  v10 = [(EKUIInviteesViewOriginalConflictSection *)self cachedCellReuseIdentifier];
  [v4 registerClass:v5 forCellReuseIdentifier:v10];

  unint64_t v11 = [(EKUIInviteesViewOriginalConflictSection *)self reuseIdentifierVersion] + 1;

  [(EKUIInviteesViewOriginalConflictSection *)self setReuseIdentifierVersion:v11];
}

- (BOOL)canSelectRow:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 row];
  if ([(EKUIInviteesViewOriginalConflictSection *)self _isValidRow:v4])
  {
    LOBYTE(v5) = ![(EKUIInviteesViewOriginalConflictSection *)self checked];
  }
  else
  {
    id v6 = (void *)kEKUILogInviteesHandle;
    BOOL v5 = os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR);
    if (v5)
    {
      id v7 = NSNumber;
      v8 = v6;
      id v9 = [v7 numberWithInteger:v4];
      int v11 = 138412290;
      v12 = v9;
      _os_log_impl(&dword_1B3F4C000, v8, OS_LOG_TYPE_ERROR, "There is no row with index [%@].  Will not determine if row can be selected.", (uint8_t *)&v11, 0xCu);

      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (void)selectRow:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 row];
  if ([(EKUIInviteesViewOriginalConflictSection *)self _isValidRow:v4])
  {
    [(EKUIInviteesViewOriginalConflictSection *)self setChecked:1];
  }
  else
  {
    BOOL v5 = (void *)kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
    {
      id v6 = NSNumber;
      id v7 = v5;
      v8 = [v6 numberWithInteger:v4];
      int v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_1B3F4C000, v7, OS_LOG_TYPE_ERROR, "There is no row with index [%@].  Will not select a row.", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (BOOL)canEditRow:(id)a3
{
  return 0;
}

- (int64_t)editingStyleForRow:(id)a3
{
  return 0;
}

- (id)titleForDeleteConfirmationButtonForRow:(id)a3
{
  return 0;
}

- (double)estimatedHeightForRow:(id)a3
{
  return 44.0;
}

- (id)actionsForRow:(id)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)supportsContextMenuForIndexPath:(id)a3
{
  return 0;
}

- (id)contextMenuDataForIndexPath:(id)a3 interaction:(id)a4
{
  return 0;
}

- (void)clearCheckmark
{
}

- (BOOL)injectNewRowsBeforeLastExistingRow
{
  return 0;
}

- (void)availabilitySearcherChangedState:(int64_t)a3
{
  if (a3 == 1)
  {
    BOOL v5 = [(EKUIInviteesViewOriginalConflictSection *)self availabilitySearcher];
    id v6 = [v5 originalStartDate];
    [(EKUIInviteesViewOriginalConflictSection *)self setStartDate:v6];

    id v7 = [(EKUIInviteesViewOriginalConflictSection *)self availabilitySearcher];
    v8 = [v7 originalEndDate];
    [(EKUIInviteesViewOriginalConflictSection *)self setEndDate:v8];

    int v9 = (void *)MEMORY[0x1E4F255C0];
    v10 = [(EKUIInviteesViewOriginalConflictSection *)self availabilitySearcher];
    uint64_t v11 = [v10 originalConflictedParticipants];
    id v12 = [v9 participantsForSortingWithEKParticipants:v11];

    [(EKUIInviteesViewOriginalConflictSection *)self setBusyParticipants:v12];
    [(EKUIInviteesViewOriginalConflictSection *)self setConflictFound:1];
  }
  else if (!a3)
  {
    -[EKUIInviteesViewOriginalConflictSection setStartDate:](self, "setStartDate:");
    [(EKUIInviteesViewOriginalConflictSection *)self setEndDate:0];
    [(EKUIInviteesViewOriginalConflictSection *)self setChecked:1];
    [(EKUIInviteesViewOriginalConflictSection *)self setBusyParticipants:0];
    uint64_t v4 = [(EKUIInviteesViewOriginalConflictSection *)self rowsShowingAllParticipants];
    [v4 removeAllObjects];

    [(EKUIInviteesViewOriginalConflictSection *)self setConflictFound:0];
  }
}

- (void)setChecked:(BOOL)a3
{
  BOOL v3 = a3;
  self->_checked = a3;
  BOOL v5 = [(EKUIInviteesViewOriginalConflictSection *)self tableViewCellHook];

  if (v5)
  {
    id v6 = [(EKUIInviteesViewOriginalConflictSection *)self tableViewCellHook];
    id v7 = v6[2](v6, 0);

    [v7 setChecked:v3];
    [v7 setSelected:0];
  }
  if (v3)
  {
    v8 = [(EKUIInviteesViewOriginalConflictSection *)self newTimeChosen];

    if (v8)
    {
      id v11 = [(EKUIInviteesViewOriginalConflictSection *)self startDate];
      int v9 = [(EKUIInviteesViewOriginalConflictSection *)self endDate];
      if (v11 && v9)
      {
        v10 = [(EKUIInviteesViewOriginalConflictSection *)self newTimeChosen];
        ((void (**)(void, id, void *))v10)[2](v10, v11, v9);
      }
    }
  }
}

- (BOOL)_isValidRow:(int64_t)a3
{
  return (a3 & 0x8000000000000000) == 0
      && [(EKUIInviteesViewOriginalConflictSection *)self numberOfRows] > a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (NSArray)busyParticipants
{
  return self->_busyParticipants;
}

- (void)setBusyParticipants:(id)a3
{
}

- (NSMutableSet)rowsShowingAllParticipants
{
  return self->_rowsShowingAllParticipants;
}

- (void)setRowsShowingAllParticipants:(id)a3
{
}

- (BOOL)checked
{
  return self->_checked;
}

- (BOOL)conflictFound
{
  return self->_conflictFound;
}

- (void)setConflictFound:(BOOL)a3
{
  self->_conflictFound = a3;
}

- (NSString)cachedCellReuseIdentifier
{
  return self->_cachedCellReuseIdentifier;
}

- (void)setCachedCellReuseIdentifier:(id)a3
{
}

- (unint64_t)reuseIdentifierVersion
{
  return self->_reuseIdentifierVersion;
}

- (void)setReuseIdentifierVersion:(unint64_t)a3
{
  self->_reuseIdentifierVersion = a3;
}

- (id)tableViewCellHook
{
  return self->_tableViewCellHook;
}

- (void)setTableViewCellHook:(id)a3
{
}

- (id)newTimeChosen
{
  return self->_newTimeChosen;
}

- (void)setNewTimeChosen:(id)a3
{
}

- (id)showPreviewOfEventAtTime
{
  return self->_showPreviewOfEventAtTime;
}

- (void)setShowPreviewOfEventAtTime:(id)a3
{
}

- (EKInviteeAlternativeTimeSearcher)availabilitySearcher
{
  return self->_availabilitySearcher;
}

- (void)setAvailabilitySearcher:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availabilitySearcher, 0);
  objc_storeStrong(&self->_showPreviewOfEventAtTime, 0);
  objc_storeStrong(&self->_newTimeChosen, 0);
  objc_storeStrong(&self->_tableViewCellHook, 0);
  objc_storeStrong((id *)&self->_cachedCellReuseIdentifier, 0);
  objc_storeStrong((id *)&self->_rowsShowingAllParticipants, 0);
  objc_storeStrong((id *)&self->_busyParticipants, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end