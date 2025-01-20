@interface EKUIInviteesViewProposedTimeSection
- (BOOL)_isValidRow:(int64_t)a3;
- (BOOL)canEditRow:(id)a3;
- (BOOL)canSelectRow:(id)a3;
- (BOOL)conflictFound;
- (BOOL)injectNewRowsBeforeLastExistingRow;
- (BOOL)isRowChecked:(int64_t)a3;
- (BOOL)sectionShouldBeShown;
- (BOOL)supportsContextMenuForIndexPath:(id)a3;
- (EKEvent)event;
- (EKInviteeAlternativeTimeSearcher)availabilitySearcher;
- (EKUIInviteesViewProposedTimeSection)init;
- (NSArray)busyParticipants;
- (NSArray)proposedTimeResults;
- (NSMutableOrderedSet)proposedTimes;
- (NSMutableSet)rowsShowingAllParticipants;
- (NSString)cachedCellReuseIdentifier;
- (NSString)title;
- (double)estimatedHeightForRow:(id)a3;
- (id)actionsForRow:(id)a3;
- (id)busyParticipantsForDate:(id)a3;
- (id)cellForIndexPath:(id)a3 inTableView:(id)a4;
- (id)contextMenuDataForIndexPath:(id)a3 interaction:(id)a4;
- (id)debugTitle;
- (id)namesForParticipantsProposingDate:(id)a3;
- (id)newTimeChosen;
- (id)showPreviewOfEventAtTime;
- (id)tableViewCellHook;
- (id)titleForDeleteConfirmationButtonForRow:(id)a3;
- (int64_t)checkedRow;
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
- (void)setChecked:(int64_t)a3;
- (void)setCheckedRow:(int64_t)a3;
- (void)setConflictFound:(BOOL)a3;
- (void)setEvent:(id)a3;
- (void)setNewTimeChosen:(id)a3;
- (void)setProposedTimeResults:(id)a3;
- (void)setProposedTimes:(id)a3;
- (void)setReuseIdentifierVersion:(unint64_t)a3;
- (void)setRowsShowingAllParticipants:(id)a3;
- (void)setShowPreviewOfEventAtTime:(id)a3;
- (void)setTableViewCellHook:(id)a3;
- (void)setTitle:(id)a3;
- (void)updateWithEvent:(id)a3;
@end

@implementation EKUIInviteesViewProposedTimeSection

- (EKUIInviteesViewProposedTimeSection)init
{
  v9.receiver = self;
  v9.super_class = (Class)EKUIInviteesViewProposedTimeSection;
  v2 = [(EKUIInviteesViewProposedTimeSection *)&v9 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    [(EKUIInviteesViewProposedTimeSection *)v2 setRowsShowingAllParticipants:v3];

    v4 = EventKitUIBundle();
    v5 = [v4 localizedStringForKey:@"Proposed Times" value:&stru_1F0CC2140 table:0];
    [(EKUIInviteesViewProposedTimeSection *)v2 setTitle:v5];

    uint64_t v6 = objc_opt_new();
    proposedTimes = v2->_proposedTimes;
    v2->_proposedTimes = (NSMutableOrderedSet *)v6;

    v2->_checkedRow = -1;
  }
  return v2;
}

- (void)updateWithEvent:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(EKUIInviteesViewProposedTimeSection *)self setEvent:v4];
  v5 = [(EKUIInviteesViewProposedTimeSection *)self proposedTimes];
  [v5 removeAllObjects];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = objc_msgSend(v4, "attendees", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(*((void *)&v16 + 1) + 8 * v10) proposedStartDateForEvent:v4];
        if (v11)
        {
          v12 = [(EKUIInviteesViewProposedTimeSection *)self proposedTimes];
          char v13 = [v12 containsObject:v11];

          if ((v13 & 1) == 0)
          {
            v14 = [(EKUIInviteesViewProposedTimeSection *)self proposedTimes];
            [v14 addObject:v11];
          }
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  v15 = [(EKUIInviteesViewProposedTimeSection *)self proposedTimes];
  [v15 sortUsingComparator:&__block_literal_global_37];
}

uint64_t __55__EKUIInviteesViewProposedTimeSection_updateWithEvent___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (id)debugTitle
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (BOOL)sectionShouldBeShown
{
  id v3 = [(EKUIInviteesViewProposedTimeSection *)self event];
  if ([v3 isSelfOrganized]) {
    BOOL v4 = [(EKUIInviteesViewProposedTimeSection *)self numberOfRows] != 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (unint64_t)numberOfRows
{
  v2 = [(EKUIInviteesViewProposedTimeSection *)self proposedTimes];
  unint64_t v3 = [v2 count];

  return v3;
}

- (id)cellForIndexPath:(id)a3 inTableView:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)[v6 row];
  if ([(EKUIInviteesViewProposedTimeSection *)self _isValidRow:v8])
  {
    uint64_t v9 = [(EKUIInviteesViewProposedTimeSection *)self cachedCellReuseIdentifier];
    uint64_t v10 = [v7 dequeueReusableCellWithIdentifier:v9 forIndexPath:v6];

    objc_initWeak((id *)location, self);
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __68__EKUIInviteesViewProposedTimeSection_cellForIndexPath_inTableView___block_invoke;
    v35[3] = &unk_1E6089BA0;
    objc_copyWeak(&v36, (id *)location);
    [(EKUIInviteesViewTimeSlotCell *)v10 setShowPreviewOfEventAtTime:v35];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __68__EKUIInviteesViewProposedTimeSection_cellForIndexPath_inTableView___block_invoke_2;
    v33[3] = &unk_1E60878C8;
    objc_copyWeak(v34, (id *)location);
    v34[1] = v8;
    [(EKUIInviteesViewTimeSlotCell *)v10 setShowAllConflictedParticipantsTapped:v33];
    v11 = [(EKUIInviteesViewProposedTimeSection *)self rowsShowingAllParticipants];
    v12 = [NSNumber numberWithInteger:v8];
    unsigned int v32 = [v11 containsObject:v12];

    char v13 = [(EKUIInviteesViewProposedTimeSection *)self proposedTimes];
    v14 = [v13 objectAtIndexedSubscript:v8];

    v15 = [(EKUIInviteesViewProposedTimeSection *)self event];
    long long v16 = [v15 endDateUnadjustedForLegacyClients];
    long long v17 = [(EKUIInviteesViewProposedTimeSection *)self event];
    long long v18 = [v17 startDate];
    [v16 timeIntervalSinceDate:v18];
    double v20 = v19;

    uint64_t v21 = [v14 dateByAddingTimeInterval:v20];
    v22 = [(EKUIInviteesViewProposedTimeSection *)self busyParticipantsForDate:v14];
    [(EKUIInviteesViewTimeSlotCell *)v10 setSearchInProgress:v22 != 0];
    v23 = [(EKUIInviteesViewProposedTimeSection *)self namesForParticipantsProposingDate:v14];
    [(EKUIInviteesViewTimeSlotCell *)v10 setProposedBy:v23];

    v24 = [(EKUIInviteesViewProposedTimeSection *)self event];
    v25 = [v24 startTimeZone];
    [(EKUIInviteesViewTimeSlotCell *)v10 updateWithStartDate:v14 endDate:v21 timeZone:v25 busyParticipants:v22 showAllParticipants:v32 checked:[(EKUIInviteesViewProposedTimeSection *)self isRowChecked:v8]];

    objc_destroyWeak(v34);
    objc_destroyWeak(&v36);
    objc_destroyWeak((id *)location);
  }
  else
  {
    v26 = (void *)kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
    {
      v27 = NSNumber;
      v28 = v26;
      v29 = [v27 numberWithInteger:v8];
      v30 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[EKUIInviteesViewProposedTimeSection numberOfRows](self, "numberOfRows"));
      *(_DWORD *)location = 138412546;
      *(void *)&location[4] = v29;
      __int16 v38 = 2112;
      v39 = v30;
      _os_log_impl(&dword_1B3F4C000, v28, OS_LOG_TYPE_ERROR, "A cell was requested for a nonexistent row.  Giving back a fresh cell.  Row: [%@].  Number of rows: [%@]", location, 0x16u);
    }
    uint64_t v10 = objc_alloc_init(EKUIInviteesViewProposedTimeCell);
  }

  return v10;
}

void __68__EKUIInviteesViewProposedTimeSection_cellForIndexPath_inTableView___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v6);
  uint64_t v8 = [WeakRetained showPreviewOfEventAtTime];

  if (v8)
  {
    id v9 = objc_loadWeakRetained(v6);
    uint64_t v10 = [v9 showPreviewOfEventAtTime];
    ((void (**)(void, id, id))v10)[2](v10, v11, v5);
  }
}

void __68__EKUIInviteesViewProposedTimeSection_cellForIndexPath_inTableView___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained rowsShowingAllParticipants];
  unint64_t v3 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  [v2 addObject:v3];
}

- (void)reloadAndRegisterReusableCellsWithTableView:(id)a3
{
  id v4 = a3;
  id v5 = (objc_class *)objc_opt_class();
  id v6 = [NSString alloc];
  id v7 = NSStringFromClass(v5);
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[EKUIInviteesViewProposedTimeSection reuseIdentifierVersion](self, "reuseIdentifierVersion"));
  id v9 = (void *)[v6 initWithFormat:@"%@-%@", v7, v8];
  [(EKUIInviteesViewProposedTimeSection *)self setCachedCellReuseIdentifier:v9];

  uint64_t v10 = [(EKUIInviteesViewProposedTimeSection *)self cachedCellReuseIdentifier];
  [v4 registerClass:v5 forCellReuseIdentifier:v10];

  unint64_t v11 = [(EKUIInviteesViewProposedTimeSection *)self reuseIdentifierVersion] + 1;

  [(EKUIInviteesViewProposedTimeSection *)self setReuseIdentifierVersion:v11];
}

- (BOOL)canSelectRow:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 row];
  if (![(EKUIInviteesViewProposedTimeSection *)self _isValidRow:v4])
  {
    id v5 = (void *)kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
    {
      id v6 = NSNumber;
      id v7 = v5;
      uint64_t v8 = [v6 numberWithInteger:v4];
      int v10 = 138412290;
      unint64_t v11 = v8;
      _os_log_impl(&dword_1B3F4C000, v7, OS_LOG_TYPE_ERROR, "There is no row with index [%@].  Will not determine if row can be selected.", (uint8_t *)&v10, 0xCu);
    }
  }
  return ![(EKUIInviteesViewProposedTimeSection *)self isRowChecked:v4];
}

- (void)selectRow:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 row];
  if ([(EKUIInviteesViewProposedTimeSection *)self _isValidRow:v4])
  {
    id v5 = [(EKUIInviteesViewProposedTimeSection *)self proposedTimes];
    id v18 = [v5 objectAtIndexedSubscript:v4];

    id v6 = [(EKUIInviteesViewProposedTimeSection *)self event];
    id v7 = [v6 endDateUnadjustedForLegacyClients];
    uint64_t v8 = [(EKUIInviteesViewProposedTimeSection *)self event];
    id v9 = [v8 startDate];
    [v7 timeIntervalSinceDate:v9];
    double v11 = v10;

    uint64_t v12 = [v18 dateByAddingTimeInterval:v11];
    char v13 = [(EKUIInviteesViewProposedTimeSection *)self newTimeChosen];
    ((void (**)(void, id, void *))v13)[2](v13, v18, v12);

    [(EKUIInviteesViewProposedTimeSection *)self setChecked:v4];
  }
  else
  {
    v14 = (void *)kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
    {
      v15 = NSNumber;
      long long v16 = v14;
      long long v17 = [v15 numberWithInteger:v4];
      *(_DWORD *)buf = 138412290;
      double v20 = v17;
      _os_log_impl(&dword_1B3F4C000, v16, OS_LOG_TYPE_ERROR, "There is no row with index [%@].  Will not select a row.", buf, 0xCu);
    }
  }
}

- (void)setChecked:(int64_t)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    id v6 = NSNumber;
    id v7 = v5;
    uint64_t v8 = [v6 numberWithInteger:a3];
    int v19 = 138412546;
    double v20 = v8;
    __int16 v21 = 2112;
    v22 = self;
    _os_log_impl(&dword_1B3F4C000, v7, OS_LOG_TYPE_DEBUG, "Setting checked row to [%@] in section [%@]", (uint8_t *)&v19, 0x16u);
  }
  int64_t v9 = [(EKUIInviteesViewProposedTimeSection *)self checkedRow];
  [(EKUIInviteesViewProposedTimeSection *)self setCheckedRow:a3];
  if ([(EKUIInviteesViewProposedTimeSection *)self _isValidRow:a3])
  {
    double v10 = [(EKUIInviteesViewProposedTimeSection *)self tableViewCellHook];

    if (v10)
    {
      if ((v9 & 0x8000000000000000) == 0)
      {
        double v11 = [(EKUIInviteesViewProposedTimeSection *)self tableViewCellHook];
        uint64_t v12 = v11[2](v11, v9);

        [v12 setChecked:0];
      }
      char v13 = [(EKUIInviteesViewProposedTimeSection *)self tableViewCellHook];
      v14 = v13[2](v13, a3);

      [v14 setChecked:1];
      [v14 setSelected:0 animated:1];
    }
  }
  else
  {
    v15 = (void *)kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
    {
      long long v16 = NSNumber;
      long long v17 = v15;
      id v18 = [v16 numberWithInteger:a3];
      int v19 = 138412290;
      double v20 = v18;
      _os_log_impl(&dword_1B3F4C000, v17, OS_LOG_TYPE_ERROR, "There is no row with index [%@].  Will not 'set checked row' to its row value.", (uint8_t *)&v19, 0xCu);
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
  unint64_t v3 = [(EKUIInviteesViewProposedTimeSection *)self tableViewCellHook];
  v3[2](v3, [(EKUIInviteesViewProposedTimeSection *)self checkedRow]);
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  [v4 setChecked:0];
  [(EKUIInviteesViewProposedTimeSection *)self setCheckedRow:-1];
}

- (BOOL)injectNewRowsBeforeLastExistingRow
{
  return 0;
}

- (void)availabilitySearcherChangedState:(int64_t)a3
{
  id v5 = [(EKUIInviteesViewProposedTimeSection *)self availabilitySearcher];
  id v4 = [v5 proposedTimes];
  [(EKUIInviteesViewProposedTimeSection *)self setProposedTimeResults:v4];
}

- (id)namesForParticipantsProposingDate:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v21 = (id)objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = [(EKUIInviteesViewProposedTimeSection *)self event];
  id v6 = [v5 attendees];

  id obj = v6;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(obj);
        }
        double v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v12 = [(EKUIInviteesViewProposedTimeSection *)self event];
        char v13 = [v11 proposedStartDateForEvent:v12];

        if ([v13 isEqualToDate:v4])
        {
          v14 = [MEMORY[0x1E4F255C0] participantForSortingWithEKParticipant:v11];
          v15 = [v14 displayName];
          long long v16 = v15;
          if (v15)
          {
            id v17 = v15;
          }
          else
          {
            id v17 = [v14 firstName];
          }
          id v18 = v17;

          if (![v18 length])
          {
            uint64_t v19 = DisplayAddressForIdentity(v11);

            id v18 = (void *)v19;
          }
          if ([v18 length]) {
            [v21 addObject:v18];
          }
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v8);
  }

  return v21;
}

- (id)busyParticipantsForDate:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  memset(v11, 0, sizeof(v11));
  id v5 = [(EKUIInviteesViewProposedTimeSection *)self proposedTimeResults];
  if ([v5 countByEnumeratingWithState:v11 objects:v12 count:16])
  {
    id v6 = (void *)**((void **)&v11[0] + 1);
    uint64_t v7 = [**((id **)&v11[0] + 1) startDate];
    int v8 = [v7 isEqual:v4];

    if (v8)
    {
      uint64_t v9 = [v6 conflictedParticipants];
    }
    else
    {
      uint64_t v9 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (BOOL)isRowChecked:(int64_t)a3
{
  BOOL v5 = -[EKUIInviteesViewProposedTimeSection _isValidRow:](self, "_isValidRow:");
  if (v5) {
    LOBYTE(v5) = [(EKUIInviteesViewProposedTimeSection *)self checkedRow] == a3;
  }
  return v5;
}

- (BOOL)_isValidRow:(int64_t)a3
{
  return (a3 & 0x8000000000000000) == 0
      && [(EKUIInviteesViewProposedTimeSection *)self numberOfRows] > a3;
}

- (EKEvent)event
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_event);

  return (EKEvent *)WeakRetained;
}

- (void)setEvent:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
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

- (NSMutableOrderedSet)proposedTimes
{
  return self->_proposedTimes;
}

- (void)setProposedTimes:(id)a3
{
}

- (NSArray)proposedTimeResults
{
  return self->_proposedTimeResults;
}

- (void)setProposedTimeResults:(id)a3
{
}

- (int64_t)checkedRow
{
  return self->_checkedRow;
}

- (void)setCheckedRow:(int64_t)a3
{
  self->_checkedRow = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proposedTimeResults, 0);
  objc_storeStrong((id *)&self->_proposedTimes, 0);
  objc_storeStrong((id *)&self->_availabilitySearcher, 0);
  objc_storeStrong(&self->_showPreviewOfEventAtTime, 0);
  objc_storeStrong(&self->_newTimeChosen, 0);
  objc_storeStrong(&self->_tableViewCellHook, 0);
  objc_storeStrong((id *)&self->_cachedCellReuseIdentifier, 0);
  objc_storeStrong((id *)&self->_rowsShowingAllParticipants, 0);
  objc_storeStrong((id *)&self->_busyParticipants, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_destroyWeak((id *)&self->_event);
}

@end