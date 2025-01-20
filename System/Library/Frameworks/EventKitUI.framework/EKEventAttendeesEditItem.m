@interface EKEventAttendeesEditItem
+ (id)_noneInviteesLocalizedString;
- (BOOL)canBeConfiguredForCalendarConstraints:(id)a3;
- (BOOL)configureForCalendarConstraints:(id)a3;
- (BOOL)editItemViewControllerSave:(id)a3;
- (BOOL)shouldAppear;
- (EKEventAttendeesEditItem)init;
- (id)attendeesWithoutSelfOrganizerAndLocations;
- (id)cellForSubitemAtIndex:(unint64_t)a3;
- (id)detailViewControllerWithFrame:(CGRect)a3 forSubitemAtIndex:(unint64_t)a4;
- (id)injectableViewControllerWithFrame:(CGRect)a3 forSubitemAtIndex:(unint64_t)a4;
- (unint64_t)onSaveEditItemsToRefresh;
- (unint64_t)onSaveEditorReloadBehavior;
- (void)dealloc;
- (void)editor:(id)a3 didSelectSubitem:(unint64_t)a4;
- (void)refreshFromCalendarItemAndStore;
@end

@implementation EKEventAttendeesEditItem

- (EKEventAttendeesEditItem)init
{
  v8.receiver = self;
  v8.super_class = (Class)EKEventAttendeesEditItem;
  v2 = [(EKEventAttendeesEditItem *)&v8 init];
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    availabilityQueue = v2->_availabilityQueue;
    v2->_availabilityQueue = v3;

    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    [(NSOperationQueue *)v2->_availabilityQueue setName:v6];
  }
  return v2;
}

- (void)dealloc
{
  [(NSOperationQueue *)self->_availabilityQueue cancelAllOperations];
  v3.receiver = self;
  v3.super_class = (Class)EKEventAttendeesEditItem;
  [(EKEventAttendeesEditItem *)&v3 dealloc];
}

- (BOOL)canBeConfiguredForCalendarConstraints:(id)a3
{
  objc_super v3 = [(EKEventEditItem *)self event];
  char v4 = [v3 allowsAttendeesModifications];

  return v4;
}

- (BOOL)configureForCalendarConstraints:(id)a3
{
  id v4 = a3;
  v5 = [v4 source];
  v6 = [v5 externalID];
  searchAccountID = self->_searchAccountID;
  self->_searchAccountID = v6;

  LOBYTE(self) = [(EKEventAttendeesEditItem *)self canBeConfiguredForCalendarConstraints:v4];
  return (char)self;
}

- (unint64_t)onSaveEditorReloadBehavior
{
  return 2;
}

- (BOOL)shouldAppear
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(EKEventEditItem *)self event];
  id v4 = [v3 calendar];
  v5 = [v4 source];
  v6 = [v5 constraints];
  int v7 = [v6 prohibitsPrivateEventsWithAttendees];

  if (v7 && [v3 privacyLevel])
  {
    objc_super v8 = (void *)kEKUILogHandle;
    char v9 = 0;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v8;
      *(_DWORD *)buf = 134217984;
      uint64_t v50 = [v3 privacyLevel];
      _os_log_impl(&dword_1B3F4C000, v10, OS_LOG_TYPE_DEFAULT, "MissingAttendees: Event is non-standard privacy level %ld", buf, 0xCu);

      char v9 = 0;
    }
  }
  else
  {
    char v9 = 1;
  }
  v11 = [v3 calendar];
  BOOL v12 = [(EKEventAttendeesEditItem *)self canBeConfiguredForCalendarConstraints:v11];

  if (!v12)
  {
    char v48 = v9;
    v13 = [v3 calendar];
    v14 = [v13 source];
    v15 = (void *)kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      v17 = [v13 title];
      v18 = [v13 calendarIdentifier];
      v19 = [v14 title];
      v20 = [v14 sourceIdentifier];
      *(_DWORD *)buf = 138413058;
      uint64_t v50 = (uint64_t)v17;
      __int16 v51 = 2114;
      v52 = v18;
      __int16 v53 = 2112;
      v54 = v19;
      __int16 v55 = 2114;
      v56 = v20;
      _os_log_impl(&dword_1B3F4C000, v16, OS_LOG_TYPE_DEFAULT, "MissingAttendees: Event calendar (%@ %{public}@) does not allow attendees (source %@ %{public}@)", buf, 0x2Au);
    }
    v21 = (void *)kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v22 = NSNumber;
      v23 = v21;
      v24 = objc_msgSend(v22, "numberWithInt:", objc_msgSend(v3, "status") == 3);
      *(_DWORD *)buf = 138412290;
      uint64_t v50 = (uint64_t)v24;
      _os_log_impl(&dword_1B3F4C000, v23, OS_LOG_TYPE_DEFAULT, "MissingAttendees: Cancelled %@", buf, 0xCu);
    }
    v25 = (void *)kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v26 = NSNumber;
      v27 = v25;
      v28 = objc_msgSend(v26, "numberWithBool:", objc_msgSend(v3, "isSelfOrganized"));
      *(_DWORD *)buf = 138412290;
      uint64_t v50 = (uint64_t)v28;
      _os_log_impl(&dword_1B3F4C000, v27, OS_LOG_TYPE_DEFAULT, "MissingAttendees: Self Organized %@", buf, 0xCu);
    }
    v29 = (void *)kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v30 = NSNumber;
      v31 = v29;
      v32 = objc_msgSend(v30, "numberWithBool:", objc_msgSend(v13, "allowsScheduling"));
      *(_DWORD *)buf = 138412290;
      uint64_t v50 = (uint64_t)v32;
      _os_log_impl(&dword_1B3F4C000, v31, OS_LOG_TYPE_DEFAULT, "MissingAttendees: Calendar Allows Scheduling %@", buf, 0xCu);
    }
    v33 = (void *)kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v34 = NSNumber;
      v35 = v33;
      v36 = [v14 constraints];
      v37 = objc_msgSend(v34, "numberWithBool:", objc_msgSend(v36, "supportsOutgoingInvitations"));
      *(_DWORD *)buf = 138412290;
      uint64_t v50 = (uint64_t)v37;
      _os_log_impl(&dword_1B3F4C000, v35, OS_LOG_TYPE_DEFAULT, "MissingAttendees: Source Supports Outgoing Invitations %@", buf, 0xCu);
    }
    v38 = (void *)kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v39 = NSNumber;
      v40 = v38;
      v41 = [v14 constraints];
      v42 = objc_msgSend(v39, "numberWithBool:", objc_msgSend(v41, "requiresOutgoingInvitationsInDefaultCalendar"));
      *(_DWORD *)buf = 138412290;
      uint64_t v50 = (uint64_t)v42;
      _os_log_impl(&dword_1B3F4C000, v40, OS_LOG_TYPE_DEFAULT, "MissingAttendees: Source Requires Default Outgoing Invitations %@", buf, 0xCu);
    }
    v43 = (void *)kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v44 = NSNumber;
      v45 = v43;
      v46 = objc_msgSend(v44, "numberWithBool:", objc_msgSend(v13, "isDefaultSchedulingCalendar"));
      *(_DWORD *)buf = 138412290;
      uint64_t v50 = (uint64_t)v46;
      _os_log_impl(&dword_1B3F4C000, v45, OS_LOG_TYPE_DEFAULT, "MissingAttendees: Calendar is Default %@", buf, 0xCu);
    }
    char v9 = v48;
  }

  return v9 & v12;
}

- (void)refreshFromCalendarItemAndStore
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  v56.receiver = self;
  v56.super_class = (Class)EKEventAttendeesEditItem;
  [(EKCalendarItemEditItem *)&v56 refreshFromCalendarItemAndStore];
  [(NSOperationQueue *)self->_availabilityQueue cancelAllOperations];
  v41 = [(EKEventEditItem *)self event];
  v2 = [v41 calendar];
  v39 = [v2 source];

  objc_super v3 = [v39 constraints];
  char v4 = [v3 supportsAvailabilityRequests];

  v5 = [v41 attendees];
  v38 = v5;
  if (!v5)
  {
    if (v4)
    {
LABEL_9:
      char v9 = kEKUILogHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        v10 = "There are no attendees associated with this event.  Will not attempt to detect conflicts.";
LABEL_13:
        _os_log_impl(&dword_1B3F4C000, v9, OS_LOG_TYPE_DEBUG, v10, buf, 2u);
        goto LABEL_14;
      }
      goto LABEL_14;
    }
LABEL_11:
    char v9 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v10 = "This event's source does not support availability requests.  Will not attempt to detect conflicts.";
      goto LABEL_13;
    }
LABEL_14:
    self->_numberOfConflicts = 0;
    goto LABEL_15;
  }
  uint64_t v6 = [v5 count];
  if ((v4 & 1) == 0) {
    goto LABEL_11;
  }
  if (!v6) {
    goto LABEL_9;
  }
  int v7 = kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3F4C000, v7, OS_LOG_TYPE_DEBUG, "Attempting to detect conflicts.", buf, 2u);
  }
  *(void *)buf = 0;
  __int16 v53 = buf;
  uint64_t v54 = 0x2020000000;
  uint64_t v55 = 0;
  id v43 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v41 isStartDateDirty]) {
    char v8 = 1;
  }
  else {
    char v8 = [v41 isEndDateDirty];
  }
  v11 = [v41 organizer];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  BOOL v12 = [v41 attendees];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v48 objects:v59 count:16];
  if (!v13)
  {
    v42 = 0;
    goto LABEL_50;
  }
  v42 = 0;
  uint64_t v14 = *(void *)v49;
  do
  {
    uint64_t v15 = 0;
    do
    {
      if (*(void *)v49 != v14) {
        objc_enumerationMutation(v12);
      }
      v16 = *(void **)(*((void *)&v48 + 1) + 8 * v15);
      if (!EKUIAttendeeUtils_ShouldConsiderAttendeeForConflictChecking(v16))
      {
        v17 = (id)kEKUILogHandle;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          v19 = [v16 URL];
          *(_DWORD *)uint64_t v57 = 138412290;
          id v58 = v19;
          _os_log_impl(&dword_1B3F4C000, v17, OS_LOG_TYPE_DEBUG, "Attendee will not be considered for conflict checking: [%@]", v57, 0xCu);
        }
        goto LABEL_46;
      }
      if (v11 && [v11 isEqualToParticipant:v16])
      {
        v17 = (id)kEKUILogHandle;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          v18 = [v16 URL];
          *(_DWORD *)uint64_t v57 = 138412290;
          id v58 = v18;
          _os_log_impl(&dword_1B3F4C000, v17, OS_LOG_TYPE_DEBUG, "Organizer will not be considered for conflict checking: [%@]", v57, 0xCu);
        }
LABEL_46:

        goto LABEL_42;
      }
      if ((v8 & 1) != 0 || (EKUIAttendeeUtils_AttendeeHasResponded(v16) & 1) == 0)
      {
        v23 = [v16 URL];
        v24 = [v23 absoluteString];
        v25 = kEKUILogHandle;
        if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)uint64_t v57 = 138412290;
          id v58 = v24;
          _os_log_impl(&dword_1B3F4C000, v25, OS_LOG_TYPE_DEBUG, "Attendee's conflict status is unknown.  Will issue availability request to determine if there is a conflict.  Attendee's address: [%@]", v57, 0xCu);
        }
        if (v24) {
          [v43 addObject:v24];
        }
      }
      else
      {
        uint64_t v20 = [v16 participantStatus];
        v17 = (id)kEKUILogHandle;
        BOOL v21 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
        if (v20 != 3)
        {
          if (v21)
          {
            v26 = [v16 URL];
            *(_DWORD *)uint64_t v57 = 138412290;
            id v58 = v26;
            _os_log_impl(&dword_1B3F4C000, v17, OS_LOG_TYPE_DEBUG, "Attendee has no conflict.  Attendee's address: [%@]", v57, 0xCu);
          }
          goto LABEL_46;
        }
        if (v21)
        {
          v22 = [v16 URL];
          *(_DWORD *)uint64_t v57 = 138412290;
          id v58 = v22;
          _os_log_impl(&dword_1B3F4C000, v17, OS_LOG_TYPE_DEBUG, "Attendee was detected as conflicted.  Attendee's address: [%@]", v57, 0xCu);
        }
        ++v42;
      }
LABEL_42:
      ++v15;
    }
    while (v13 != v15);
    uint64_t v27 = [v12 countByEnumeratingWithState:&v48 objects:v59 count:16];
    uint64_t v13 = v27;
  }
  while (v27);
LABEL_50:

  uint64_t v28 = [v43 count];
  v29 = kEKUILogHandle;
  if (v28)
  {
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)uint64_t v57 = 138412290;
      id v58 = v43;
      _os_log_impl(&dword_1B3F4C000, v29, OS_LOG_TYPE_DEBUG, "Creating an availability request to look up availability for attendees: [%@]", v57, 0xCu);
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__EKEventAttendeesEditItem_refreshFromCalendarItemAndStore__block_invoke;
    aBlock[3] = &unk_1E6089888;
    aBlock[4] = buf;
    v30 = _Block_copy(aBlock);
    id v31 = objc_alloc(MEMORY[0x1E4F25608]);
    v32 = [v41 startDate];
    v33 = [v41 endDateUnadjustedForLegacyClients];
    v34 = (void *)[v31 initWithSource:v39 startDate:v32 endDate:v33 ignoredEvent:v41 addresses:v43 resultsBlock:v30];

    objc_initWeak(&location, v34);
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __59__EKEventAttendeesEditItem_refreshFromCalendarItemAndStore__block_invoke_18;
    v44[3] = &unk_1E60898D8;
    objc_copyWeak(v45, &location);
    v45[1] = v42;
    v44[5] = buf;
    v44[4] = self;
    [v34 setCompletionBlock:v44];
    v35 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)uint64_t v57 = 138412290;
      id v58 = v34;
      _os_log_impl(&dword_1B3F4C000, v35, OS_LOG_TYPE_DEBUG, "Adding availability operation: [%@]", v57, 0xCu);
    }
    [(NSOperationQueue *)self->_availabilityQueue addOperation:v34];
    objc_destroyWeak(v45);
    objc_destroyWeak(&location);
  }
  else
  {
    v36 = (id)kEKUILogHandle;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      v37 = [NSNumber numberWithUnsignedInteger:v42];
      *(_DWORD *)uint64_t v57 = 138412290;
      id v58 = v37;
      _os_log_impl(&dword_1B3F4C000, v36, OS_LOG_TYPE_DEBUG, "There are no attendees that have an unknown conflict status.  Will not send an availability request.  Setting number of conflicts to [%@].", v57, 0xCu);
    }
    self->_numberOfConflicts = (int64_t)v42;
  }

  _Block_object_dispose(buf, 8);
LABEL_15:
}

void __59__EKEventAttendeesEditItem_refreshFromCalendarItemAndStore__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__EKEventAttendeesEditItem_refreshFromCalendarItemAndStore__block_invoke_2;
  v6[3] = &unk_1E6089660;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __59__EKEventAttendeesEditItem_refreshFromCalendarItemAndStore__block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __59__EKEventAttendeesEditItem_refreshFromCalendarItemAndStore__block_invoke_3;
  v3[3] = &unk_1E6089860;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 enumerateKeysAndObjectsUsingBlock:v3];
}

void __59__EKEventAttendeesEditItem_refreshFromCalendarItemAndStore__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  int v6 = [MEMORY[0x1E4F254B8] spansIncludeBusyPeriod:a3];
  id v7 = kEKUILogHandle;
  BOOL v8 = os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8)
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_impl(&dword_1B3F4C000, v7, OS_LOG_TYPE_DEBUG, "Attendee was detected as conflicted after finding out its availability.  Attendee's address: [%@]", (uint8_t *)&v9, 0xCu);
    }
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else if (v8)
  {
    int v9 = 138412290;
    id v10 = v5;
    _os_log_impl(&dword_1B3F4C000, v7, OS_LOG_TYPE_DEBUG, "Attendee was detected as not being conflicted after finding out its availability.  Attendee's address: [%@]", (uint8_t *)&v9, 0xCu);
  }
}

void __59__EKEventAttendeesEditItem_refreshFromCalendarItemAndStore__block_invoke_18(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = kEKUILogHandle;
  BOOL v4 = os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG);
  if (WeakRetained)
  {
    if (v4)
    {
      *(_DWORD *)buf = 138412290;
      id v15 = WeakRetained;
      _os_log_impl(&dword_1B3F4C000, v3, OS_LOG_TYPE_DEBUG, "Availability operation completed: [%@]", buf, 0xCu);
    }
    id v5 = [WeakRetained error];
    char v6 = [WeakRetained isCancelled];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __59__EKEventAttendeesEditItem_refreshFromCalendarItemAndStore__block_invoke_19;
    v8[3] = &unk_1E60898B0;
    id v9 = v5;
    char v13 = v6;
    id v10 = WeakRetained;
    uint64_t v12 = *(void *)(a1 + 56);
    long long v11 = *(_OWORD *)(a1 + 32);
    id v7 = v5;
    dispatch_async(MEMORY[0x1E4F14428], v8);
  }
  else if (v4)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3F4C000, v3, OS_LOG_TYPE_DEBUG, "The availability operation has gone away.  Returning early.", buf, 2u);
  }
}

void __59__EKEventAttendeesEditItem_refreshFromCalendarItemAndStore__block_invoke_19(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    v2 = kEKUILogHandle;
    if (!os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_8;
    }
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)v18 = 138412290;
    *(void *)&v18[4] = v3;
    BOOL v4 = "Error encountered during availability request: [%@]";
    goto LABEL_7;
  }
  if (*(unsigned char *)(a1 + 72))
  {
    v2 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      *(_DWORD *)v18 = 138412290;
      *(void *)&v18[4] = v5;
      BOOL v4 = "An availability operation was cancelled: [%@]";
LABEL_7:
      _os_log_impl(&dword_1B3F4C000, v2, OS_LOG_TYPE_DEBUG, v4, v18, 0xCu);
    }
  }
LABEL_8:
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) + *(void *)(a1 + 64);
  id v7 = (void *)kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    BOOL v8 = NSNumber;
    uint64_t v9 = *(void *)(a1 + 64);
    id v10 = v7;
    long long v11 = [v8 numberWithUnsignedInteger:v9];
    uint64_t v12 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
    char v13 = [NSNumber numberWithUnsignedInteger:v6];
    *(_DWORD *)v18 = 138412802;
    *(void *)&v18[4] = v11;
    *(_WORD *)&v18[12] = 2112;
    *(void *)&v18[14] = v12;
    __int16 v19 = 2112;
    uint64_t v20 = v13;
    _os_log_impl(&dword_1B3F4C000, v10, OS_LOG_TYPE_DEBUG, "Number of conflicted participants with a response: [%@].  Number of conflicted participants without a response: [%@].  Total: [%@].", v18, 0x20u);
  }
  *(void *)(*(void *)(a1 + 48) + 72) = v6;
  uint64_t v14 = objc_msgSend(*(id *)(a1 + 48), "delegate", *(_OWORD *)v18);
  uint64_t v15 = [v14 rowNumberForEditItem:*(void *)(a1 + 48)];

  uint64_t v16 = [MEMORY[0x1E4F28D58] indexPathForRow:v15 inSection:0];
  v17 = [*(id *)(a1 + 48) delegate];
  [v17 editItem:*(void *)(a1 + 48) wantsRowReload:v16];
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  BOOL v4 = [[EKUITableViewCell alloc] initWithStyle:1 reuseIdentifier:0];
  uint64_t v5 = [(EKEventEditItem *)self event];
  uint64_t v6 = [v5 attendees];
  uint64_t v7 = [v6 count];

  if (!v7) {
    goto LABEL_5;
  }
  if (![MEMORY[0x1E4F254B8] availabilityPanelVisibilityForEvent:v5] && self->_numberOfConflicts >= 1)
  {
    v17 = CUIKLocalizedStringForInteger();
    int64_t numberOfConflicts = self->_numberOfConflicts;
    __int16 v19 = NSString;
    uint64_t v20 = EventKitUIBundle();
    uint64_t v21 = v20;
    if (numberOfConflicts == 1) {
      v22 = @"%@ Conflict";
    }
    else {
      v22 = @"%@ Conflicts";
    }
    v23 = [v20 localizedStringForKey:v22 value:&stru_1F0CC2140 table:0];
    long long v11 = objc_msgSend(v19, "localizedStringWithFormat:", v23, v17);

    v24 = [MEMORY[0x1E4FB1618] redColor];
    v25 = [(EKUITableViewCell *)v4 detailTextLabel];
    [v25 setTextColor:v24];

    goto LABEL_7;
  }
  BOOL v8 = [(EKEventAttendeesEditItem *)self attendeesWithoutSelfOrganizerAndLocations];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    uint64_t v10 = CUIKLocalizedStringForInteger();
  }
  else
  {
LABEL_5:
    uint64_t v10 = [(id)objc_opt_class() _noneInviteesLocalizedString];
  }
  long long v11 = (void *)v10;
LABEL_7:
  [(EKUITableViewCell *)v4 setAccessoryType:1];
  uint64_t v12 = EventKitUIBundle();
  char v13 = [v12 localizedStringForKey:@"Invitees" value:&stru_1F0CC2140 table:0];
  uint64_t v14 = [(EKUITableViewCell *)v4 textLabel];
  [v14 setText:v13];

  uint64_t v15 = [(EKUITableViewCell *)v4 detailTextLabel];
  [v15 setText:v11];

  return v4;
}

+ (id)_noneInviteesLocalizedString
{
  v2 = EventKitUIBundle();
  uint64_t v3 = [v2 localizedStringForKey:@"None invitees" value:@"None" table:0];

  return v3;
}

- (id)attendeesWithoutSelfOrganizerAndLocations
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  p_selfOrganizer = (id *)&self->_selfOrganizer;
  selfOrganizer = self->_selfOrganizer;
  self->_selfOrganizer = 0;

  uint64_t v5 = [(EKEventEditItem *)self event];
  uint64_t v6 = [v5 organizer];

  uint64_t v7 = [(EKEventEditItem *)self event];
  BOOL v8 = [v7 calendar];
  uint64_t v9 = [v8 sharingStatus];

  uint64_t v10 = [(EKEventEditItem *)self event];
  long long v11 = [v10 calendar];
  uint64_t v12 = [v11 sharingStatus];

  char v13 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v14 = [(EKEventEditItem *)self event];
  uint64_t v15 = [v14 attendees];

  uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v25;
    if (v9) {
      BOOL v19 = v12 == 2;
    }
    else {
      BOOL v19 = 0;
    }
    char v20 = !v19;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(v15);
        }
        v22 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if ([v22 participantType] != 2)
        {
          if (*p_selfOrganizer
            || ![v22 isEqualToParticipant:v6]
            || ![v6 isCurrentUser]
            || (objc_storeStrong(p_selfOrganizer, v22), (v20 & 1) == 0))
          {
            [v13 addObject:v22];
          }
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v17);
  }

  return v13;
}

- (id)detailViewControllerWithFrame:(CGRect)a3 forSubitemAtIndex:(unint64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v9 = [(EKEventEditItem *)self event];
  uint64_t v10 = [(EKEventAttendeesEditItem *)self attendeesWithoutSelfOrganizerAndLocations];
  if ([v10 count])
  {
    long long v11 = [EKUIEventInviteesEditViewController alloc];
    uint64_t v12 = [(EKEventEditItem *)self event];
    char v13 = [(EKUIEventInviteesEditViewController *)v11 initWithEvent:v12];
  }
  else
  {
    uint64_t v14 = -[EKEventAttendeesEditViewController initWithFrame:event:overriddenEventStartDate:overriddenEventEndDate:]([EKEventAttendeesEditViewController alloc], "initWithFrame:event:overriddenEventStartDate:overriddenEventEndDate:", v9, 0, 0, x, y, width, height);
    char v13 = (EKUIEventInviteesEditViewController *)v14;
    if (self->_searchAccountID) {
      -[EKEventAttendeesEditViewController setSearchAccountID:](v14, "setSearchAccountID:");
    }
  }

  return v13;
}

- (id)injectableViewControllerWithFrame:(CGRect)a3 forSubitemAtIndex:(unint64_t)a4
{
  uint64_t v5 = [EKUIEventInviteesEditViewController alloc];
  uint64_t v6 = [(EKEventEditItem *)self event];
  uint64_t v7 = [(EKUIEventInviteesEditViewController *)v5 initWithEvent:v6];

  return v7;
}

- (unint64_t)onSaveEditItemsToRefresh
{
  return 3;
}

- (void)editor:(id)a3 didSelectSubitem:(unint64_t)a4
{
  id v6 = a3;
  [v6 setHasModifiedAttendeesFromSuggestion:0];
  v7.receiver = self;
  v7.super_class = (Class)EKEventAttendeesEditItem;
  [(EKCalendarItemEditItem *)&v7 editor:v6 didSelectSubitem:a4];
}

- (BOOL)editItemViewControllerSave:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(EKEventEditItem *)self event];
    id v6 = [v5 calendar];

    objc_super v7 = [v4 attendees];
    BOOL v8 = [(EKEventEditItem *)self event];
    uint64_t v9 = [v8 attendees];
    uint64_t v10 = (void *)v9;
    long long v11 = (void *)MEMORY[0x1E4F1CBF0];
    if (v9) {
      long long v11 = (void *)v9;
    }
    id v12 = v11;

    uint64_t v13 = [v7 count];
    if (([v6 sharingStatus] != 2
       || ([(EKEventEditItem *)self event],
           uint64_t v14 = objc_claimAutoreleasedReturnValue(),
           [v14 organizer],
           uint64_t v15 = objc_claimAutoreleasedReturnValue(),
           v15,
           v14,
           v15))
      && self->_selfOrganizer
      && v13)
    {
      uint64_t v16 = [MEMORY[0x1E4F1CA48] arrayWithArray:v12];
      [v16 addObject:self->_selfOrganizer];
      [v16 addObjectsFromArray:v7];
    }
    else
    {
      uint64_t v16 = [v7 arrayByAddingObjectsFromArray:v12];
    }
    uint64_t v21 = [(EKEventEditItem *)self event];
    [v21 setAttendees:v16];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v17 = v4;
      uint64_t v18 = [v17 selectedStartDate];
      BOOL v19 = [v17 selectedEndDate];

      char v20 = [(EKEventEditItem *)self event];
      [v20 setStartDate:v18];
      [v20 setEndDateUnadjustedForLegacyClients:v19];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v22 = kEKUILogHandle;
        if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
        {
          int v24 = 138412290;
          id v25 = v4;
          _os_log_impl(&dword_1B3F4C000, v22, OS_LOG_TYPE_ERROR, "Unrecognized controller saved: [%@]", (uint8_t *)&v24, 0xCu);
        }
      }
    }
  }
  [(EKCalendarItemEditItem *)self notifySubitemDidSave:0];

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availabilityQueue, 0);
  objc_storeStrong((id *)&self->_searchAccountID, 0);

  objc_storeStrong((id *)&self->_selfOrganizer, 0);
}

@end