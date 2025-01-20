@interface EKUIInviteesViewAlternativeTimeSection
- (BOOL)_isConflictSearchRow:(int64_t)a3;
- (BOOL)_isValidRow:(int64_t)a3;
- (BOOL)availabilityRequestInProgress;
- (BOOL)canEditRow:(id)a3;
- (BOOL)canSelectRow:(id)a3;
- (BOOL)hasCheckedRow;
- (BOOL)initialSearchInProgress;
- (BOOL)injectNewRowsBeforeLastExistingRow;
- (BOOL)searchExhausted;
- (BOOL)searcherHasError;
- (BOOL)searchingForMoreTimes;
- (BOOL)sectionShouldBeShown;
- (BOOL)supportsContextMenuForIndexPath:(id)a3;
- (Class)customTimeCellClass;
- (EKInviteeAlternativeTimeSearcher)availabilitySearcher;
- (EKUIInviteesViewAlternativeTimeSection)init;
- (NSArray)alternativeTimes;
- (NSArray)searcherTimeSlots;
- (NSMutableSet)rowsShowingAllParticipants;
- (NSString)cachedConflictSearchCellReuseIdentifier;
- (NSString)cachedTimeCellReuseIdentifier;
- (NSTimeZone)timeZone;
- (double)estimatedHeightForRow:(id)a3;
- (id)_alternativeTimeAtIndex:(int64_t)a3;
- (id)actionsForRow:(id)a3;
- (id)cellForIndexPath:(id)a3 inTableView:(id)a4;
- (id)contextMenuDataForIndexPath:(id)a3 interaction:(id)a4;
- (id)debugTitle;
- (id)headerTitle;
- (id)newTimeChosen;
- (id)showMoreAlternativeTimesTapped;
- (id)showPreviewOfEventAtTime;
- (id)tableViewCellHook;
- (id)titleForDeleteConfirmationButtonForRow:(id)a3;
- (int64_t)editingStyleForRow:(id)a3;
- (int64_t)lastCheckedRow;
- (unint64_t)_numberOfTimeSlotsShown;
- (unint64_t)initialNumberOfTimeSlotsToShow;
- (unint64_t)maximumNumberOfTimeSlotsToShow;
- (unint64_t)numberOfRows;
- (unint64_t)reuseIdentifierVersion;
- (void)availabilitySearcherChangedState:(int64_t)a3;
- (void)clearCheckmark;
- (void)refreshCellsAfterStateChange;
- (void)reloadAndRegisterReusableCellsWithTableView:(id)a3;
- (void)searchForMoreTimes;
- (void)selectRow:(id)a3;
- (void)setAlternativeTimes:(id)a3;
- (void)setAvailabilityRequestInProgress:(BOOL)a3;
- (void)setAvailabilitySearcher:(id)a3;
- (void)setCachedConflictSearchCellReuseIdentifier:(id)a3;
- (void)setCachedTimeCellReuseIdentifier:(id)a3;
- (void)setHasCheckedRow:(BOOL)a3;
- (void)setInitialSearchInProgress:(BOOL)a3;
- (void)setLastCheckedRow:(int64_t)a3;
- (void)setMaximumNumberOfTimeSlotsToShow:(unint64_t)a3;
- (void)setNewTimeChosen:(id)a3;
- (void)setReuseIdentifierVersion:(unint64_t)a3;
- (void)setRowsShowingAllParticipants:(id)a3;
- (void)setSearchExhausted:(BOOL)a3;
- (void)setSearcherHasError:(BOOL)a3;
- (void)setShowMoreAlternativeTimesTapped:(id)a3;
- (void)setShowPreviewOfEventAtTime:(id)a3;
- (void)setTableViewCellHook:(id)a3;
- (void)setTimeZone:(id)a3;
@end

@implementation EKUIInviteesViewAlternativeTimeSection

- (EKUIInviteesViewAlternativeTimeSection)init
{
  v5.receiver = self;
  v5.super_class = (Class)EKUIInviteesViewAlternativeTimeSection;
  v2 = [(EKUIInviteesViewAlternativeTimeSection *)&v5 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    [(EKUIInviteesViewAlternativeTimeSection *)v2 setRowsShowingAllParticipants:v3];
  }
  return v2;
}

- (id)debugTitle
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (id)headerTitle
{
  return 0;
}

- (BOOL)sectionShouldBeShown
{
  return [(EKUIInviteesViewAlternativeTimeSection *)self numberOfRows] != 0;
}

- (unint64_t)numberOfRows
{
  unint64_t v3 = [(EKUIInviteesViewAlternativeTimeSection *)self _numberOfTimeSlotsShown];
  if ([(EKUIInviteesViewAlternativeTimeSection *)self initialSearchInProgress]) {
    return v3 + 1;
  }
  BOOL v5 = [(EKUIInviteesViewAlternativeTimeSection *)self searchExhausted];
  if (v3) {
    unint64_t v6 = v3 + 1;
  }
  else {
    unint64_t v6 = 0;
  }
  if (v5) {
    return v3 + 1;
  }
  else {
    return v6;
  }
}

- (id)cellForIndexPath:(id)a3 inTableView:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)[v6 row];
  if ([(EKUIInviteesViewAlternativeTimeSection *)self _isValidRow:v8])
  {
    if ([(EKUIInviteesViewAlternativeTimeSection *)self _isConflictSearchRow:v8])
    {
      v9 = [(EKUIInviteesViewAlternativeTimeSection *)self cachedConflictSearchCellReuseIdentifier];
      id v10 = [v7 dequeueReusableCellWithIdentifier:v9 forIndexPath:v6];

      if ([(EKUIInviteesViewAlternativeTimeSection *)self initialSearchInProgress])
      {
        [v10 setInitialSearchInProgressState];
      }
      else if ([(EKUIInviteesViewAlternativeTimeSection *)self searchExhausted])
      {
        objc_msgSend(v10, "setNoAvailableTimesStateWithNumberOfExistingTimes:hasError:", -[EKUIInviteesViewAlternativeTimeSection _numberOfTimeSlotsShown](self, "_numberOfTimeSlotsShown"), -[EKUIInviteesViewAlternativeTimeSection searcherHasError](self, "searcherHasError"));
      }
      else if ([(EKUIInviteesViewAlternativeTimeSection *)self availabilityRequestInProgress])
      {
        [v10 setAvailabilityRequestInProgressState];
      }
      else
      {
        [v10 setShowMoreState];
      }
    }
    else
    {
      v16 = [(EKUIInviteesViewAlternativeTimeSection *)self cachedTimeCellReuseIdentifier];
      id v10 = [v7 dequeueReusableCellWithIdentifier:v16 forIndexPath:v6];

      objc_initWeak((id *)buf, self);
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __71__EKUIInviteesViewAlternativeTimeSection_cellForIndexPath_inTableView___block_invoke;
      v29[3] = &unk_1E6089BA0;
      objc_copyWeak(&v30, (id *)buf);
      [v10 setShowPreviewOfEventAtTime:v29];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __71__EKUIInviteesViewAlternativeTimeSection_cellForIndexPath_inTableView___block_invoke_2;
      v27[3] = &unk_1E60878C8;
      objc_copyWeak(v28, (id *)buf);
      v28[1] = v8;
      [v10 setShowAllConflictedParticipantsTapped:v27];
      v17 = [(EKUIInviteesViewAlternativeTimeSection *)self rowsShowingAllParticipants];
      v18 = [NSNumber numberWithInteger:v8];
      uint64_t v19 = [v17 containsObject:v18];

      if ([(EKUIInviteesViewAlternativeTimeSection *)self hasCheckedRow]) {
        BOOL v20 = v8 == (void *)[(EKUIInviteesViewAlternativeTimeSection *)self lastCheckedRow];
      }
      else {
        BOOL v20 = 0;
      }
      v21 = [(EKUIInviteesViewAlternativeTimeSection *)self _alternativeTimeAtIndex:v8];
      v22 = [v21 startDate];
      v23 = [v21 endDate];
      v24 = [(EKUIInviteesViewAlternativeTimeSection *)self timeZone];
      v25 = [v21 conflictedParticipants];
      [v10 updateWithStartDate:v22 endDate:v23 timeZone:v24 busyParticipants:v25 showAllParticipants:v19 checked:v20];

      objc_destroyWeak(v28);
      objc_destroyWeak(&v30);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    v11 = (void *)kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
    {
      v12 = NSNumber;
      v13 = v11;
      v14 = [v12 numberWithInteger:v8];
      v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[EKUIInviteesViewAlternativeTimeSection numberOfRows](self, "numberOfRows"));
      *(_DWORD *)buf = 138412546;
      v32 = v14;
      __int16 v33 = 2112;
      v34 = v15;
      _os_log_impl(&dword_1B3F4C000, v13, OS_LOG_TYPE_ERROR, "A cell was requested for a nonexistent row.  Giving back a fresh cell.  Row: [%@].  Number of rows: [%@]", buf, 0x16u);
    }
    id v10 = objc_alloc_init([(EKUIInviteesViewAlternativeTimeSection *)self customTimeCellClass]);
  }

  return v10;
}

void __71__EKUIInviteesViewAlternativeTimeSection_cellForIndexPath_inTableView___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v6);
  v8 = [WeakRetained showPreviewOfEventAtTime];

  if (v8)
  {
    id v9 = objc_loadWeakRetained(v6);
    id v10 = [v9 showPreviewOfEventAtTime];
    ((void (**)(void, id, id))v10)[2](v10, v11, v5);
  }
}

void __71__EKUIInviteesViewAlternativeTimeSection_cellForIndexPath_inTableView___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained rowsShowingAllParticipants];
  unint64_t v3 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  [v2 addObject:v3];
}

- (void)reloadAndRegisterReusableCellsWithTableView:(id)a3
{
  id v4 = a3;
  id v5 = [(EKUIInviteesViewAlternativeTimeSection *)self customTimeCellClass];
  id v6 = [NSString alloc];
  id v7 = NSStringFromClass(v5);
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[EKUIInviteesViewAlternativeTimeSection reuseIdentifierVersion](self, "reuseIdentifierVersion"));
  id v9 = (void *)[v6 initWithFormat:@"%@-%@", v7, v8];
  [(EKUIInviteesViewAlternativeTimeSection *)self setCachedTimeCellReuseIdentifier:v9];

  id v10 = [(EKUIInviteesViewAlternativeTimeSection *)self cachedTimeCellReuseIdentifier];
  [v4 registerClass:v5 forCellReuseIdentifier:v10];

  id v11 = (objc_class *)objc_opt_class();
  id v12 = [NSString alloc];
  v13 = NSStringFromClass(v11);
  v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[EKUIInviteesViewAlternativeTimeSection reuseIdentifierVersion](self, "reuseIdentifierVersion"));
  v15 = (void *)[v12 initWithFormat:@"%@-%@", v13, v14];
  [(EKUIInviteesViewAlternativeTimeSection *)self setCachedConflictSearchCellReuseIdentifier:v15];

  v16 = [(EKUIInviteesViewAlternativeTimeSection *)self cachedConflictSearchCellReuseIdentifier];
  [v4 registerClass:v11 forCellReuseIdentifier:v16];

  unint64_t v17 = [(EKUIInviteesViewAlternativeTimeSection *)self reuseIdentifierVersion] + 1;

  [(EKUIInviteesViewAlternativeTimeSection *)self setReuseIdentifierVersion:v17];
}

- (BOOL)canSelectRow:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 row];
  if (![(EKUIInviteesViewAlternativeTimeSection *)self _isValidRow:v4])
  {
    id v6 = (void *)kEKUILogInviteesHandle;
    BOOL v5 = os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR);
    if (!v5) {
      return v5;
    }
    id v7 = NSNumber;
    v8 = v6;
    id v9 = [v7 numberWithInteger:v4];
    int v11 = 138412290;
    id v12 = v9;
    _os_log_impl(&dword_1B3F4C000, v8, OS_LOG_TYPE_ERROR, "There is no row with index [%@].  Will not determine if row can be selected.", (uint8_t *)&v11, 0xCu);

LABEL_8:
    LOBYTE(v5) = 0;
    return v5;
  }
  if (![(EKUIInviteesViewAlternativeTimeSection *)self _isConflictSearchRow:v4])
  {
    LOBYTE(v5) = 1;
    return v5;
  }
  if ([(EKUIInviteesViewAlternativeTimeSection *)self availabilityRequestInProgress]
    || [(EKUIInviteesViewAlternativeTimeSection *)self searchExhausted])
  {
    goto LABEL_8;
  }
  LOBYTE(v5) = ![(EKUIInviteesViewAlternativeTimeSection *)self initialSearchInProgress];
  return v5;
}

- (void)selectRow:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 row];
  if (-[EKUIInviteesViewAlternativeTimeSection _isValidRow:](self, "_isValidRow:", [v4 row]))
  {
    if ([(EKUIInviteesViewAlternativeTimeSection *)self _isConflictSearchRow:v5])
    {
      id v6 = [(EKUIInviteesViewAlternativeTimeSection *)self alternativeTimes];
      unint64_t v7 = [v6 count];

      unint64_t v8 = [(EKUIInviteesViewAlternativeTimeSection *)self maximumNumberOfTimeSlotsToShow];
      unint64_t v9 = v8 + 10;
      [(EKUIInviteesViewAlternativeTimeSection *)self setMaximumNumberOfTimeSlotsToShow:v8 + 10];
      if (v7 < v8 + 10)
      {
        [(EKUIInviteesViewAlternativeTimeSection *)self setAvailabilityRequestInProgress:1];
        [(EKUIInviteesViewAlternativeTimeSection *)self searchForMoreTimes];
      }
      id v10 = [(EKUIInviteesViewAlternativeTimeSection *)self tableViewCellHook];

      if (v10)
      {
        int v11 = [(EKUIInviteesViewAlternativeTimeSection *)self tableViewCellHook];
        id v12 = v11[2](v11, v5);

        if (v7 < v9) {
          [v12 setAvailabilityRequestInProgressState];
        }
      }
      else
      {
        unint64_t v17 = kEKUILogInviteesHandle;
        if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v23) = 0;
          _os_log_impl(&dword_1B3F4C000, v17, OS_LOG_TYPE_ERROR, " No 'tableViewCellHook' callback found.  Will not invoke.", (uint8_t *)&v23, 2u);
        }
      }
      v18 = [(EKUIInviteesViewAlternativeTimeSection *)self showMoreAlternativeTimesTapped];

      if (v18)
      {
        if (v7 < v9) {
          unint64_t v9 = v7;
        }
        if (v9 <= v8)
        {
          id v19 = 0;
        }
        else
        {
          id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          if ((uint64_t)v8 < (uint64_t)v9)
          {
            do
            {
              BOOL v20 = (void *)[objc_alloc(NSNumber) initWithInteger:v8];
              [v19 addObject:v20];

              ++v8;
            }
            while (v9 != v8);
          }
        }
        v22 = [(EKUIInviteesViewAlternativeTimeSection *)self showMoreAlternativeTimesTapped];
        ((void (**)(void, id))v22)[2](v22, v19);
      }
      else
      {
        v21 = kEKUILogInviteesHandle;
        if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v23) = 0;
          _os_log_impl(&dword_1B3F4C000, v21, OS_LOG_TYPE_ERROR, " No 'showMoreAlternativeTimesTapped' callback found.  Will not invoke.", (uint8_t *)&v23, 2u);
        }
      }
    }
    else
    {
      [(EKUIInviteesViewAlternativeTimeSection *)self setHasCheckedRow:1];
      [(EKUIInviteesViewAlternativeTimeSection *)self setLastCheckedRow:v5];
    }
  }
  else
  {
    uint64_t v13 = (void *)kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
    {
      v14 = NSNumber;
      v15 = v13;
      v16 = [v14 numberWithInteger:v5];
      int v23 = 138412290;
      v24 = v16;
      _os_log_impl(&dword_1B3F4C000, v15, OS_LOG_TYPE_ERROR, "There is no row with index [%@].  Will not select a row.", (uint8_t *)&v23, 0xCu);
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
  [(EKUIInviteesViewAlternativeTimeSection *)self setHasCheckedRow:0];

  [(EKUIInviteesViewAlternativeTimeSection *)self setLastCheckedRow:0];
}

- (BOOL)injectNewRowsBeforeLastExistingRow
{
  return 1;
}

- (void)availabilitySearcherChangedState:(int64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 0:
      [(EKUIInviteesViewAlternativeTimeSection *)self setAlternativeTimes:0];
      [(EKUIInviteesViewAlternativeTimeSection *)self setHasCheckedRow:0];
      [(EKUIInviteesViewAlternativeTimeSection *)self setLastCheckedRow:0];
      id v4 = [(EKUIInviteesViewAlternativeTimeSection *)self rowsShowingAllParticipants];
      [v4 removeAllObjects];

      [(EKUIInviteesViewAlternativeTimeSection *)self setAvailabilityRequestInProgress:0];
      [(EKUIInviteesViewAlternativeTimeSection *)self setMaximumNumberOfTimeSlotsToShow:0];
      [(EKUIInviteesViewAlternativeTimeSection *)self setSearchExhausted:0];
      [(EKUIInviteesViewAlternativeTimeSection *)self setInitialSearchInProgress:0];
      [(EKUIInviteesViewAlternativeTimeSection *)self setSearcherHasError:0];
      return;
    case 1:
      [(EKUIInviteesViewAlternativeTimeSection *)self setSearcherHasError:0];
      [(EKUIInviteesViewAlternativeTimeSection *)self setMaximumNumberOfTimeSlotsToShow:[(EKUIInviteesViewAlternativeTimeSection *)self initialNumberOfTimeSlotsToShow]];
      [(EKUIInviteesViewAlternativeTimeSection *)self setInitialSearchInProgress:1];
      unint64_t v5 = [(EKUIInviteesViewAlternativeTimeSection *)self numberOfRows] - 1;
      id v6 = [(EKUIInviteesViewAlternativeTimeSection *)self tableViewCellHook];
      v6[2](v6, v5);
      id v19 = (id)objc_claimAutoreleasedReturnValue();

      [v19 setInitialSearchInProgressState];
      goto LABEL_10;
    case 2:
      [(EKUIInviteesViewAlternativeTimeSection *)self setSearcherHasError:0];
      if ([(EKUIInviteesViewAlternativeTimeSection *)self searchExhausted])
      {
        unint64_t v7 = kEKUILogInviteesHandle;
        if (!os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG)) {
          return;
        }
        *(_DWORD *)buf = 138412290;
        v21 = self;
        unint64_t v8 = "Search has been exhausted.  Will not update [%@]";
LABEL_16:
        _os_log_impl(&dword_1B3F4C000, v7, OS_LOG_TYPE_DEBUG, v8, buf, 0xCu);
        return;
      }
      if ([(EKUIInviteesViewAlternativeTimeSection *)self searchingForMoreTimes])
      {
        unint64_t v7 = kEKUILogInviteesHandle;
        if (!os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG)) {
          return;
        }
        *(_DWORD *)buf = 138412290;
        v21 = self;
        unint64_t v8 = "Still searching for more times.  Will not update [%@]";
        goto LABEL_16;
      }
      if ([(EKUIInviteesViewAlternativeTimeSection *)self availabilityRequestInProgress]|| [(EKUIInviteesViewAlternativeTimeSection *)self initialSearchInProgress])
      {
        [(EKUIInviteesViewAlternativeTimeSection *)self setInitialSearchInProgress:0];
        [(EKUIInviteesViewAlternativeTimeSection *)self setAvailabilityRequestInProgress:0];
        int v11 = [(EKUIInviteesViewAlternativeTimeSection *)self alternativeTimes];
        id v19 = v11;
        if (v11) {
          uint64_t v12 = [v11 count];
        }
        else {
          uint64_t v12 = 0;
        }
        uint64_t v13 = [(EKUIInviteesViewAlternativeTimeSection *)self searcherTimeSlots];
        v14 = v13;
        if (v13) {
          uint64_t v15 = [v13 count];
        }
        else {
          uint64_t v15 = 0;
        }
        [(EKUIInviteesViewAlternativeTimeSection *)self setAlternativeTimes:v14];
        unint64_t v16 = [(EKUIInviteesViewAlternativeTimeSection *)self numberOfRows] - 1;
        unint64_t v17 = [(EKUIInviteesViewAlternativeTimeSection *)self tableViewCellHook];
        v18 = v17[2](v17, v16);

        if (v12 == v15)
        {
          [(EKUIInviteesViewAlternativeTimeSection *)self setSearchExhausted:1];
          [v18 setNoAvailableTimesStateWithNumberOfExistingTimes:v12 hasError:0];
        }
        else
        {
          [v18 setShowMoreState];
        }

LABEL_10:
      }
      return;
    case 3:
      [(EKUIInviteesViewAlternativeTimeSection *)self setSearcherHasError:1];
      [(EKUIInviteesViewAlternativeTimeSection *)self setInitialSearchInProgress:0];
      [(EKUIInviteesViewAlternativeTimeSection *)self setAvailabilityRequestInProgress:0];
      [(EKUIInviteesViewAlternativeTimeSection *)self setSearchExhausted:1];
      unint64_t v9 = [(EKUIInviteesViewAlternativeTimeSection *)self numberOfRows] - 1;
      id v10 = [(EKUIInviteesViewAlternativeTimeSection *)self tableViewCellHook];
      v10[2](v10, v9);
      id v19 = (id)objc_claimAutoreleasedReturnValue();

      [v19 setNoAvailableTimesStateWithNumberOfExistingTimes:0 hasError:1];
      goto LABEL_10;
    default:
      return;
  }
}

- (void)refreshCellsAfterStateChange
{
  unint64_t v3 = [(EKUIInviteesViewAlternativeTimeSection *)self numberOfRows] - 1;
  id v4 = [(EKUIInviteesViewAlternativeTimeSection *)self tableViewCellHook];
  v4[2](v4, v3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  if ([(EKUIInviteesViewAlternativeTimeSection *)self initialSearchInProgress])
  {
    [v5 setInitialSearchInProgressState];
  }
  else if ([(EKUIInviteesViewAlternativeTimeSection *)self searchExhausted])
  {
    objc_msgSend(v5, "setNoAvailableTimesStateWithNumberOfExistingTimes:hasError:", -[EKUIInviteesViewAlternativeTimeSection _numberOfTimeSlotsShown](self, "_numberOfTimeSlotsShown"), -[EKUIInviteesViewAlternativeTimeSection searcherHasError](self, "searcherHasError"));
  }
  else if ([(EKUIInviteesViewAlternativeTimeSection *)self availabilityRequestInProgress])
  {
    [v5 setAvailabilityRequestInProgressState];
  }
  else
  {
    [v5 setShowMoreState];
  }
}

- (unint64_t)initialNumberOfTimeSlotsToShow
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    id v6 = "-[EKUIInviteesViewAlternativeTimeSection initialNumberOfTimeSlotsToShow]";
    __int16 v7 = 2112;
    unint64_t v8 = self;
    _os_log_impl(&dword_1B3F4C000, v3, OS_LOG_TYPE_ERROR, "A subclass has not overridden this method, which must be overridden: [%s].  Subclass instance: [%@]", (uint8_t *)&v5, 0x16u);
  }
  return 0;
}

- (NSArray)searcherTimeSlots
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    id v6 = "-[EKUIInviteesViewAlternativeTimeSection searcherTimeSlots]";
    __int16 v7 = 2112;
    unint64_t v8 = self;
    _os_log_impl(&dword_1B3F4C000, v3, OS_LOG_TYPE_ERROR, "A subclass has not overridden this method, which must be overridden: [%s].  Subclass instance: [%@]", (uint8_t *)&v5, 0x16u);
  }
  return 0;
}

- (Class)customTimeCellClass
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    __int16 v7 = "-[EKUIInviteesViewAlternativeTimeSection customTimeCellClass]";
    __int16 v8 = 2112;
    uint64_t v9 = self;
    _os_log_impl(&dword_1B3F4C000, v3, OS_LOG_TYPE_ERROR, "A subclass has not overridden this method, which must be overridden: [%s].  Subclass instance: [%@]", (uint8_t *)&v6, 0x16u);
  }
  id v4 = objc_opt_class();

  return (Class)v4;
}

- (BOOL)searchingForMoreTimes
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    int v6 = "-[EKUIInviteesViewAlternativeTimeSection searchingForMoreTimes]";
    __int16 v7 = 2112;
    __int16 v8 = self;
    _os_log_impl(&dword_1B3F4C000, v3, OS_LOG_TYPE_ERROR, "A subclass has not overridden this method, which must be overridden: [%s].  Subclass instance: [%@]", (uint8_t *)&v5, 0x16u);
  }
  return 0;
}

- (void)searchForMoreTimes
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    int v5 = "-[EKUIInviteesViewAlternativeTimeSection searchForMoreTimes]";
    __int16 v6 = 2112;
    __int16 v7 = self;
    _os_log_impl(&dword_1B3F4C000, v3, OS_LOG_TYPE_ERROR, "A subclass has not overridden this method, which must be overridden: [%s].  Subclass instance: [%@]", (uint8_t *)&v4, 0x16u);
  }
}

- (void)setHasCheckedRow:(BOOL)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v5 = (void *)kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    __int16 v6 = v5;
    __int16 v7 = CalBooleanAsString();
    int v14 = 138412546;
    uint64_t v15 = v7;
    __int16 v16 = 2112;
    unint64_t v17 = self;
    _os_log_impl(&dword_1B3F4C000, v6, OS_LOG_TYPE_DEBUG, "Setting 'hasCheckedRow' to [%@] in section [%@]", (uint8_t *)&v14, 0x16u);
  }
  self->_hasCheckedRow = a3;
  if (!a3)
  {
    uint64_t v8 = [(EKUIInviteesViewAlternativeTimeSection *)self tableViewCellHook];

    if (v8)
    {
      uint64_t v9 = [(EKUIInviteesViewAlternativeTimeSection *)self _numberOfTimeSlotsShown];
      if (v9 >= 1)
      {
        uint64_t v10 = v9;
        for (uint64_t i = 0; i != v10; ++i)
        {
          uint64_t v12 = [(EKUIInviteesViewAlternativeTimeSection *)self tableViewCellHook];
          uint64_t v13 = v12[2](v12, i);

          [v13 setChecked:0];
        }
      }
    }
  }
}

- (void)setLastCheckedRow:(int64_t)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  int v5 = (void *)kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    __int16 v6 = NSNumber;
    __int16 v7 = v5;
    uint64_t v8 = [v6 numberWithInteger:a3];
    int v24 = 138412546;
    uint64_t v25 = v8;
    __int16 v26 = 2112;
    v27 = self;
    _os_log_impl(&dword_1B3F4C000, v7, OS_LOG_TYPE_DEBUG, "Setting last checked row to [%@] in section [%@]", (uint8_t *)&v24, 0x16u);
  }
  int64_t lastCheckedRow = self->_lastCheckedRow;
  self->_int64_t lastCheckedRow = a3;
  if ([(EKUIInviteesViewAlternativeTimeSection *)self hasCheckedRow])
  {
    if ([(EKUIInviteesViewAlternativeTimeSection *)self _isValidRow:a3])
    {
      uint64_t v10 = [(EKUIInviteesViewAlternativeTimeSection *)self tableViewCellHook];

      if (v10)
      {
        int v11 = [(EKUIInviteesViewAlternativeTimeSection *)self tableViewCellHook];
        uint64_t v12 = v11[2](v11, lastCheckedRow);

        [v12 setChecked:0];
        uint64_t v13 = [(EKUIInviteesViewAlternativeTimeSection *)self tableViewCellHook];
        int v14 = v13[2](v13, a3);

        [v14 setChecked:1];
        [v14 setSelected:0 animated:1];
      }
      uint64_t v15 = [(EKUIInviteesViewAlternativeTimeSection *)self newTimeChosen];

      if (v15)
      {
        __int16 v16 = [(EKUIInviteesViewAlternativeTimeSection *)self _alternativeTimeAtIndex:a3];
        if (v16)
        {
          unint64_t v17 = [(EKUIInviteesViewAlternativeTimeSection *)self newTimeChosen];
          uint64_t v18 = [v16 startDate];
          id v19 = [v16 endDate];
          ((void (**)(void, void *, void *))v17)[2](v17, v18, v19);
        }
      }
    }
    else
    {
      BOOL v20 = (void *)kEKUILogInviteesHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
      {
        v21 = NSNumber;
        uint64_t v22 = v20;
        int v23 = [v21 numberWithInteger:a3];
        int v24 = 138412290;
        uint64_t v25 = v23;
        _os_log_impl(&dword_1B3F4C000, v22, OS_LOG_TYPE_ERROR, "There is no row with index [%@].  Will not 'set last checked row' to its row value.", (uint8_t *)&v24, 0xCu);
      }
    }
  }
}

- (BOOL)_isValidRow:(int64_t)a3
{
  return (a3 & 0x8000000000000000) == 0
      && [(EKUIInviteesViewAlternativeTimeSection *)self numberOfRows] > a3;
}

- (BOOL)_isConflictSearchRow:(int64_t)a3
{
  return [(EKUIInviteesViewAlternativeTimeSection *)self numberOfRows] - 1 == a3;
}

- (unint64_t)_numberOfTimeSlotsShown
{
  unint64_t v3 = [(EKUIInviteesViewAlternativeTimeSection *)self alternativeTimes];
  if (v3)
  {
    int v4 = [(EKUIInviteesViewAlternativeTimeSection *)self alternativeTimes];
    unint64_t v5 = [v4 count];
  }
  else
  {
    unint64_t v5 = 0;
  }

  unint64_t result = [(EKUIInviteesViewAlternativeTimeSection *)self maximumNumberOfTimeSlotsToShow];
  if (v5 < result) {
    return v5;
  }
  return result;
}

- (id)_alternativeTimeAtIndex:(int64_t)a3
{
  if ([(EKUIInviteesViewAlternativeTimeSection *)self _numberOfTimeSlotsShown] <= a3)
  {
    __int16 v6 = 0;
  }
  else
  {
    unint64_t v5 = [(EKUIInviteesViewAlternativeTimeSection *)self alternativeTimes];
    __int16 v6 = [v5 objectAtIndex:a3];
  }

  return v6;
}

- (id)showMoreAlternativeTimesTapped
{
  return self->_showMoreAlternativeTimesTapped;
}

- (void)setShowMoreAlternativeTimesTapped:(id)a3
{
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
}

- (NSString)cachedTimeCellReuseIdentifier
{
  return self->_cachedTimeCellReuseIdentifier;
}

- (void)setCachedTimeCellReuseIdentifier:(id)a3
{
}

- (NSString)cachedConflictSearchCellReuseIdentifier
{
  return self->_cachedConflictSearchCellReuseIdentifier;
}

- (void)setCachedConflictSearchCellReuseIdentifier:(id)a3
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

- (NSMutableSet)rowsShowingAllParticipants
{
  return self->_rowsShowingAllParticipants;
}

- (void)setRowsShowingAllParticipants:(id)a3
{
}

- (NSArray)alternativeTimes
{
  return self->_alternativeTimes;
}

- (void)setAlternativeTimes:(id)a3
{
}

- (int64_t)lastCheckedRow
{
  return self->_lastCheckedRow;
}

- (BOOL)hasCheckedRow
{
  return self->_hasCheckedRow;
}

- (BOOL)availabilityRequestInProgress
{
  return self->_availabilityRequestInProgress;
}

- (void)setAvailabilityRequestInProgress:(BOOL)a3
{
  self->_availabilityRequestInProgress = a3;
}

- (unint64_t)maximumNumberOfTimeSlotsToShow
{
  return self->_maximumNumberOfTimeSlotsToShow;
}

- (void)setMaximumNumberOfTimeSlotsToShow:(unint64_t)a3
{
  self->_maximumNumberOfTimeSlotsToShow = a3;
}

- (EKInviteeAlternativeTimeSearcher)availabilitySearcher
{
  return self->_availabilitySearcher;
}

- (void)setAvailabilitySearcher:(id)a3
{
}

- (BOOL)initialSearchInProgress
{
  return self->_initialSearchInProgress;
}

- (void)setInitialSearchInProgress:(BOOL)a3
{
  self->_initialSearchInProgress = a3;
}

- (BOOL)searchExhausted
{
  return self->_searchExhausted;
}

- (void)setSearchExhausted:(BOOL)a3
{
  self->_searchExhausted = a3;
}

- (BOOL)searcherHasError
{
  return self->_searcherHasError;
}

- (void)setSearcherHasError:(BOOL)a3
{
  self->_searcherHasError = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availabilitySearcher, 0);
  objc_storeStrong((id *)&self->_alternativeTimes, 0);
  objc_storeStrong((id *)&self->_rowsShowingAllParticipants, 0);
  objc_storeStrong(&self->_showPreviewOfEventAtTime, 0);
  objc_storeStrong(&self->_newTimeChosen, 0);
  objc_storeStrong(&self->_tableViewCellHook, 0);
  objc_storeStrong((id *)&self->_cachedConflictSearchCellReuseIdentifier, 0);
  objc_storeStrong((id *)&self->_cachedTimeCellReuseIdentifier, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);

  objc_storeStrong(&self->_showMoreAlternativeTimesTapped, 0);
}

@end