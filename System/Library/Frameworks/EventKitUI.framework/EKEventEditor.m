@interface EKEventEditor
+ (Class)_SGSuggestionsServiceClass;
+ (id)defaultTitleForCalendarItem;
- (BOOL)attachmentsModifiedOnRecurrence;
- (BOOL)hasAttachmentChanges;
- (BOOL)hasUnsavedChanges;
- (BOOL)isShowingAccessDeniedView;
- (BOOL)saveCalendarItemWithSpan:(int64_t)a3 error:(id *)a4;
- (BOOL)shouldRecordPrecommitEvent;
- (CGSize)preferredContentSize;
- (EKRemoteUISerializedObject)precommitSerializedEvent;
- (NSString)suggestionKey;
- (UIColor)backgroundColor;
- (id)_calendarItemIndexSet;
- (id)_editItems;
- (id)_nameForDeleteButton;
- (id)_orderedEditItems;
- (id)_viewForSheet;
- (id)attachmentsModifiedEvent;
- (id)defaultAlertTitle;
- (id)notificationNamesForLocaleChange;
- (id)preferredTitle;
- (unint64_t)entityType;
- (unint64_t)supportedInterfaceOrientations;
- (void)_beginAutocompleteSearch:(id)a3;
- (void)_cancelPendingAutocompleteAndCleanup;
- (void)_focusAppearanceTarget;
- (void)_hideAndCancelAutocompleteResults;
- (void)_modifyCurrentEvent:(id)a3 withAutocompleteResult:(id)a4;
- (void)_revertEvent;
- (void)_scheduleAutocompleteSearchWithString:(id)a3;
- (void)_scheduleAutocompleteTimerIfNeeded;
- (void)_setAutocompleteResultsVisible:(BOOL)a3;
- (void)_setEventTitleForTestingAutocomplete:(id)a3;
- (void)_showAutocompleteResults;
- (void)_updateTitleEditItemSeparatorVisibility;
- (void)autocompleteResultsEditItem:(id)a3 resultSelected:(id)a4;
- (void)autocompleteResultsEditItemDidHideResults:(id)a3;
- (void)autocompleteResultsEditItemDidShowResults:(id)a3;
- (void)confirmMultiPasteViewController:(id)a3 finishedWithCancel:(BOOL)a4;
- (void)editItem:(id)a3 didSaveFromDetailViewController:(BOOL)a4;
- (void)editItemDidStartEditing:(id)a3;
- (void)editItemTextChanged:(id)a3;
- (void)focus:(unint64_t)a3 select:(BOOL)a4;
- (void)loadView;
- (void)prepareEditItems;
- (void)refreshAttachments;
- (void)refreshInvitees;
- (void)refreshLocation;
- (void)refreshRecurrence;
- (void)refreshStartAndEndDates;
- (void)refreshTitle;
- (void)refreshURL;
- (void)reloadTableViewSectionsForTime:(BOOL)a3 invitees:(BOOL)a4 location:(BOOL)a5 recurrence:(BOOL)a6;
- (void)setBackgroundColor:(id)a3;
- (void)setDefaultCalendar:(id)a3;
- (void)setEvent:(id)a3;
- (void)setShouldRecordPrecommitEvent:(BOOL)a3;
- (void)setSuggestionKey:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation EKEventEditor

+ (Class)_SGSuggestionsServiceClass
{
  return (Class)EKWeakLinkClass();
}

- (void)loadView
{
  v6.receiver = self;
  v6.super_class = (Class)EKEventEditor;
  [(EKCalendarItemEditor *)&v6 loadView];
  v3 = [(EKEventEditor *)self backgroundColor];

  if (v3)
  {
    v4 = [(EKEventEditor *)self backgroundColor];
    v5 = [(EKEventEditor *)self view];
    [v5 setBackgroundColor:v4];
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  if (self->_isTransitioning)
  {
    v2 = [(EKEventEditor *)self view];
    v3 = [v2 window];
    v4 = [v3 windowScene];
    char v5 = [v4 interfaceOrientation];

    return 1 << v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)EKEventEditor;
    return [(EKCalendarItemEditor *)&v7 supportedInterfaceOrientations];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  self->_isTransitioning = 1;
  v4.receiver = self;
  v4.super_class = (Class)EKEventEditor;
  [(EKCalendarItemEditor *)&v4 viewWillAppear:a3];
  [(EKEventEditor *)self setNeedsUpdateOfSupportedInterfaceOrientations];
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  v30.receiver = self;
  v30.super_class = (Class)EKEventEditor;
  [(EKCalendarItemEditor *)&v30 viewDidAppear:a3];
  objc_super v4 = (void *)kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_INFO))
  {
    log = v4;
    char v5 = (objc_class *)objc_opt_class();
    v29 = NSStringFromClass(v5);
    v27 = [(EKEventEditor *)self event];
    v28 = [v27 startDate];
    v26 = [(EKEventEditor *)self event];
    [v26 duration];
    double v7 = v6 / 60.0;
    v25 = [(EKEventEditor *)self event];
    int v19 = [v25 isNew];
    v24 = [(EKEventEditor *)self event];
    v18 = [v24 UUID];
    v22 = [(EKEventEditor *)self event];
    v8 = [v22 uniqueID];
    v21 = [(EKEventEditor *)self event];
    v9 = [v21 externalURL];
    v20 = [(EKEventEditor *)self event];
    v10 = [v20 calendar];
    v11 = [v10 calendarIdentifier];
    v12 = [(EKEventEditor *)self event];
    v13 = [v12 calendar];
    v14 = [v13 source];
    v15 = [v14 sourceIdentifier];
    *(_DWORD *)buf = 138545410;
    v32 = v29;
    __int16 v33 = 2114;
    v34 = v28;
    __int16 v35 = 2048;
    double v36 = v7;
    __int16 v37 = 1024;
    int v38 = v19;
    __int16 v39 = 2114;
    v40 = v18;
    __int16 v41 = 2114;
    v42 = v8;
    __int16 v43 = 2114;
    v44 = v9;
    __int16 v45 = 2114;
    v46 = v11;
    __int16 v47 = 2114;
    v48 = v15;
    _os_log_impl(&dword_1B3F4C000, log, OS_LOG_TYPE_INFO, "[UserStateLog] State -> %{public}@ viewDidAppear. startDate = %{public}@, duration = %.1f min, isNew = %d. UUID = %{public}@, uniqueID = %{public}@, externalURL = %{public}@, calendarIdentifier = %{public}@, sourceIdentifier = %{public}@", buf, 0x58u);
  }
  self->_isTransitioning = 0;
  [(EKEventEditor *)self setNeedsUpdateOfSupportedInterfaceOrientations];
  v16 = [(EKEventEditor *)self navigationController];
  v17 = [v16 presentationController];
  [v17 preferredContentSizeDidChangeForChildContentContainer:self];
}

- (void)viewWillDisappear:(BOOL)a3
{
  self->_isTransitioning = 1;
  v4.receiver = self;
  v4.super_class = (Class)EKEventEditor;
  [(EKCalendarItemEditor *)&v4 viewWillDisappear:a3];
  [(EKEventEditor *)self setNeedsUpdateOfSupportedInterfaceOrientations];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_shouldAutocomplete)
  {
    autocompleteTracker = self->_autocompleteTracker;
    double v6 = [(EKEventEditor *)self event];
    [(EKUIAutocompleteTracker *)autocompleteTracker finalizeAutocompleteTrackingOnSave:0 withEvent:v6 selectedResult:0 selectedIndex:0 isZKW:0];
  }
  v7.receiver = self;
  v7.super_class = (Class)EKEventEditor;
  [(EKCalendarItemEditor *)&v7 viewDidDisappear:v3];
  self->_isTransitioning = 0;
  [(EKEventEditor *)self setNeedsUpdateOfSupportedInterfaceOrientations];
}

- (void)setEvent:(id)a3
{
  id v4 = a3;
  [v4 setPredictedLocationFrozen:1];
  v13.receiver = self;
  v13.super_class = (Class)EKEventEditor;
  [(EKCalendarItemEditor *)&v13 setCalendarItem:v4];
  char v5 = [(EKEventEditor *)self preferredTitle];
  [(EKCalendarItemEditor *)self setTitle:v5];

  [(EKEventEditor *)self _updateTitleEditItemSeparatorVisibility];
  self->_shouldAutocomplete = [v4 isNew];
  double v6 = objc_alloc_init(EKUIAutocompleteTracker);
  autocompleteTracker = self->_autocompleteTracker;
  self->_autocompleteTracker = v6;

  v8 = [v4 startDate];
  [(EKUIAutocompleteTracker *)self->_autocompleteTracker setInitialStartDate:v8];

  v9 = [v4 endDateUnadjustedForLegacyClients];
  [(EKUIAutocompleteTracker *)self->_autocompleteTracker setInitialEndDate:v9];

  v10 = [v4 timeZone];
  [(EKUIAutocompleteTracker *)self->_autocompleteTracker setInitialTimeZone:v10];

  -[EKUIAutocompleteTracker setInitialIsAllDay:](self->_autocompleteTracker, "setInitialIsAllDay:", [v4 isAllDay]);
  v11 = [v4 calendar];
  [(EKUIAutocompleteTracker *)self->_autocompleteTracker setInitialCalendar:v11];

  if (([v4 isNew] & 1) == 0)
  {
    v12 = [MEMORY[0x1E4F25540] sharedInstance];
    [v12 prepareForEventUpdate:v4];
  }
  [(UIResponder *)self EKUI_setDataOwnersFromEvent:v4];
}

- (void)setSuggestionKey:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)&self->_suggestionKey, a3);
    double v6 = [(EKEventEditor *)self event];

    if (v6)
    {
      objc_super v7 = [(EKCalendarItemEditor *)self store];
      uint64_t v8 = [v7 predicateForNaturalLanguageSuggestedEventsWithSearchString:0];

      v9 = [(EKCalendarItemEditor *)self store];
      double v36 = (void *)v8;
      v10 = [v9 eventsMatchingPredicate:v8];

      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v37 objects:v41 count:16];
      id v13 = v11;
      if (v12)
      {
        uint64_t v14 = v12;
        id v35 = v5;
        uint64_t v15 = *(void *)v38;
LABEL_5:
        uint64_t v16 = 0;
        while (1)
        {
          if (*(void *)v38 != v15) {
            objc_enumerationMutation(v11);
          }
          v17 = *(void **)(*((void *)&v37 + 1) + 8 * v16);
          v18 = [v17 suggestionInfo];
          int v19 = [v18 uniqueKey];
          char v20 = [v19 isEqualToString:self->_suggestionKey];

          if (v20) {
            break;
          }
          if (v14 == ++v16)
          {
            uint64_t v14 = [v11 countByEnumeratingWithState:&v37 objects:v41 count:16];
            if (v14) {
              goto LABEL_5;
            }
            id v13 = v11;
            id v5 = v35;
            goto LABEL_14;
          }
        }
        id v13 = v17;

        id v5 = v35;
        if (!v13) {
          goto LABEL_15;
        }
        v34 = EKWeakLinkStringConstant();
        __int16 v33 = [v13 customObjectForKey:v34];
        v21 = [(EKEventEditor *)self event];
        [v21 setCustomObject:v33 forKey:v34];

        id v31 = objc_alloc(MEMORY[0x1E4F25640]);
        v22 = [v13 suggestionInfo];
        v23 = [v22 opaqueKey];
        v24 = [v13 suggestionInfo];
        v25 = [v24 uniqueKey];
        v26 = [v13 suggestionInfo];
        v27 = [v26 extractionGroupIdentifier];
        v32 = (void *)[v31 initWithOpaqueKey:v23 uniqueKey:v25 extractionGroupIdentifier:v27];

        v28 = [(EKEventEditor *)self event];
        [v28 setSuggestionInfo:v32];

        v29 = [v13 URL];
        objc_super v30 = [(EKEventEditor *)self event];
        [v30 setURL:v29];
      }
LABEL_14:

LABEL_15:
    }
  }
}

- (void)_updateTitleEditItemSeparatorVisibility
{
  if (self->_autocompleteResultsVisible)
  {
    uint64_t v3 = 1;
  }
  else
  {
    id v4 = [(EKEventEditor *)self event];
    id v5 = [v4 preferredLocation];
    uint64_t v3 = [v5 isPrediction];
  }
  titleInlineEditItem = self->_titleInlineEditItem;

  [(EKCalendarItemTitleInlineEditItem *)titleInlineEditItem setDrawsOwnRowSeparators:v3];
}

- (void)setDefaultCalendar:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)EKEventEditor;
  [(EKCalendarItemEditor *)&v4 setDefaultCalendar:a3];
  [(EKCalendarItemEditItem *)self->_calendarEditItem refreshFromCalendarItemAndStore];
}

- (void)refreshStartAndEndDates
{
  v3.receiver = self;
  v3.super_class = (Class)EKEventEditor;
  [(EKCalendarItemEditor *)&v3 refreshStartAndEndDates];
  [(EKEventDateEditItem *)self->_dateItem refreshFromCalendarItemAndStore];
  [(EKCalendarItemAlarmEditItem *)self->_alarmEditItem refreshFromCalendarItemAndStore];
}

- (void)refreshInvitees
{
  v3.receiver = self;
  v3.super_class = (Class)EKEventEditor;
  [(EKCalendarItemEditor *)&v3 refreshInvitees];
  [(EKEventAttendeesEditItem *)self->_attendeesEditItem refreshFromCalendarItemAndStore];
}

- (void)refreshLocation
{
  v3.receiver = self;
  v3.super_class = (Class)EKEventEditor;
  [(EKCalendarItemEditor *)&v3 refreshLocation];
  [(EKCalendarItemLocationInlineEditItem *)self->_locationInlineEditItem refreshFromCalendarItemAndStore];
  [(EKEventEditor *)self _updateTitleEditItemSeparatorVisibility];
}

- (void)refreshURL
{
  v3.receiver = self;
  v3.super_class = (Class)EKEventEditor;
  [(EKCalendarItemEditor *)&v3 refreshURL];
  [(EKEventURLAndNotesInlineEditItem *)self->_notesEditItem refreshFromCalendarItemAndStore];
}

- (void)refreshRecurrence
{
  v3.receiver = self;
  v3.super_class = (Class)EKEventEditor;
  [(EKCalendarItemEditor *)&v3 refreshRecurrence];
  [(EKCalendarItemRecurrenceEditItem *)self->_recurrenceEditItem refreshFromCalendarItemAndStore];
}

- (void)refreshAttachments
{
  v3.receiver = self;
  v3.super_class = (Class)EKEventEditor;
  [(EKCalendarItemEditor *)&v3 refreshRecurrence];
  [(EKEventAttachmentsEditItem *)self->_attachmentsEditItem refreshFromCalendarItemAndStore];
}

- (void)refreshTitle
{
}

- (void)reloadTableViewSectionsForTime:(BOOL)a3 invitees:(BOOL)a4 location:(BOOL)a5 recurrence:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  BOOL v9 = a3;
  id v12 = (id)objc_opt_new();
  if (v9)
  {
    objc_msgSend(v12, "addIndex:", -[EKCalendarItemEditor tableSectionForEditItem:](self, "tableSectionForEditItem:", self->_dateItem));
    if (!v8)
    {
LABEL_3:
      if (!v7) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if (!v8)
  {
    goto LABEL_3;
  }
  objc_msgSend(v12, "addIndex:", -[EKCalendarItemEditor tableSectionForEditItem:](self, "tableSectionForEditItem:", self->_attendeesEditItem));
  if (!v7)
  {
LABEL_4:
    if (!v6) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  objc_msgSend(v12, "addIndex:", -[EKCalendarItemEditor tableSectionForEditItem:](self, "tableSectionForEditItem:", self->_locationInlineEditItem));
  if (v6) {
LABEL_5:
  }
    objc_msgSend(v12, "addIndex:", -[EKCalendarItemEditor tableSectionForEditItem:](self, "tableSectionForEditItem:", self->_recurrenceEditItem));
LABEL_6:
  id v11 = [(EKEventEditor *)self tableView];
  [v11 reloadSections:v12 withRowAnimation:5];
}

- (id)_calendarItemIndexSet
{
  unint64_t v2 = [(EKCalendarItemEditor *)self tableSectionForEditItem:self->_calendarEditItem];
  objc_super v3 = (void *)[objc_alloc(MEMORY[0x1E4F28D60]) initWithIndex:v2];

  return v3;
}

- (id)_editItems
{
  v52[3] = *MEMORY[0x1E4F143B8];
  editItems = self->super._editItems;
  if (!editItems)
  {
    objc_super v4 = objc_alloc_init(EKCalendarItemTitleInlineEditItem);
    uint64_t v42 = objc_alloc_init(EKCalendarItemLocationInlineEditItem);
    id v5 = objc_alloc_init(EKEventDateEditItem);
    __int16 v41 = objc_alloc_init(EKEventTravelTimeEditItem);
    obj = objc_alloc_init(EKEventRecurrenceEditItem);
    BOOL v6 = objc_alloc_init(EKEventAttendeesEditItem);
    long long v39 = objc_alloc_init(EKCalendarItemAlarmEditItem);
    v32 = [[EKCalendarItemCalendarEditItem alloc] initWithEntityType:0];
    long long v38 = objc_alloc_init(EKEventVisibilityEditItem);
    BOOL v7 = objc_alloc_init(EKEventAttachmentsEditItem);
    long long v37 = objc_alloc_init(EKConferenceInformationInlineEditItem);
    BOOL v8 = objc_alloc_init(EKEventURLAndNotesInlineEditItem);
    v34 = objc_alloc_init(EKEventDeleteButtonEditItem);
    [(EKEventDeleteButtonEditItem *)v34 setDeleteButtonTarget:self action:sel_deleteClicked_];
    BOOL v9 = [(EKEventEditor *)self event];
    -[EKEventDateEditItem setShowsAllDay:](v5, "setShowsAllDay:", [v9 changingAllDayPropertyIsAllowed]);

    objc_storeStrong((id *)&self->_dateItem, v5);
    objc_storeStrong((id *)&self->_titleInlineEditItem, v4);
    objc_storeStrong((id *)&self->_locationInlineEditItem, v42);
    objc_storeStrong((id *)&self->_alarmEditItem, v39);
    objc_storeStrong((id *)&self->_calendarEditItem, v32);
    v10 = v6;
    objc_storeStrong((id *)&self->_attendeesEditItem, v6);
    objc_storeStrong((id *)&self->_notesEditItem, v8);
    objc_storeStrong((id *)&self->_attachmentsEditItem, v7);
    objc_storeStrong((id *)&self->_recurrenceEditItem, obj);
    id v11 = objc_alloc_init(EKEventAutocompleteResultsEditItem);
    [(EKCalendarItemEditItem *)v11 setDelegate:self];
    objc_storeStrong((id *)&self->_autocompleteEditItem, v11);
    [(EKEventEditor *)self _updateTitleEditItemSeparatorVisibility];
    id v12 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v13 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(NSArray *)v12 addObject:v4];
    __int16 v33 = v11;
    [(NSArray *)v12 addObject:v11];
    [(NSArray *)v12 addObject:v42];
    uint64_t v14 = v5;
    [(NSArray *)v12 addObject:v5];
    [(NSArray *)v12 addObject:v41];
    [(NSArray *)v12 addObject:obj];
    [(NSArray *)v12 addObject:v10];
    [(NSArray *)v12 addObject:v39];
    [(NSArray *)v12 addObject:v32];
    [(NSArray *)v12 addObject:v38];
    double v36 = v7;
    [(NSArray *)v12 addObject:v7];
    [(NSArray *)v12 addObject:v37];
    id v35 = v8;
    [(NSArray *)v12 addObject:v8];
    uint64_t v15 = [(EKCalendarItemEditor *)self calendarItem];
    LOBYTE(v5) = [v15 isNew];

    if ((v5 & 1) == 0) {
      [(NSArray *)v12 addObject:v34];
    }
    v52[0] = v4;
    v52[1] = v33;
    v52[2] = v42;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:3];
    [(NSArray *)v13 addObject:v16];

    v51[0] = v14;
    v51[1] = v41;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:2];
    [(NSArray *)v13 addObject:v17];

    v50 = obj;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
    [(NSArray *)v13 addObject:v18];

    v49[0] = v32;
    v49[1] = v10;
    int v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
    [(NSArray *)v13 addObject:v19];

    v48 = v39;
    char v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
    [(NSArray *)v13 addObject:v20];

    __int16 v47 = v38;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
    [(NSArray *)v13 addObject:v21];

    v46 = v7;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
    [(NSArray *)v13 addObject:v22];

    __int16 v45 = v37;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
    [(NSArray *)v13 addObject:v23];

    v44 = v35;
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
    [(NSArray *)v13 addObject:v24];

    v25 = [(EKCalendarItemEditor *)self calendarItem];
    char v26 = [v25 isNew];

    if ((v26 & 1) == 0)
    {
      __int16 v43 = v34;
      v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
      [(NSArray *)v13 addObject:v27];
    }
    v28 = self->super._editItems;
    self->super._editItems = v12;
    v29 = v12;

    orderedEditItems = self->super._orderedEditItems;
    self->super._orderedEditItems = v13;

    editItems = self->super._editItems;
  }

  return editItems;
}

- (id)_orderedEditItems
{
  orderedEditItems = self->super._orderedEditItems;
  if (!orderedEditItems)
  {
    id v4 = [(EKEventEditor *)self _editItems];
    orderedEditItems = self->super._orderedEditItems;
  }

  return orderedEditItems;
}

- (BOOL)hasAttachmentChanges
{
  return [(EKEventAttachmentsEditItem *)self->_attachmentsEditItem attachmentsModified];
}

- (BOOL)hasUnsavedChanges
{
  if ([(EKEventAttachmentsEditItem *)self->_attachmentsEditItem attachmentsModified]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)EKEventEditor;
  return [(EKCalendarItemEditor *)&v4 hasUnsavedChanges];
}

- (BOOL)attachmentsModifiedOnRecurrence
{
  BOOL v3 = [(EKEventAttachmentsEditItem *)self->_attachmentsEditItem attachmentsModified];
  if (v3)
  {
    objc_super v4 = [(EKEventEditor *)self event];
    char v5 = [v4 isOrWasPartOfRecurringSeries];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (id)attachmentsModifiedEvent
{
  return [(EKEventAttachmentsEditItem *)self->_attachmentsEditItem attachmentEvent];
}

- (EKRemoteUISerializedObject)precommitSerializedEvent
{
  return self->_precommitSerializedEvent;
}

- (BOOL)saveCalendarItemWithSpan:(int64_t)a3 error:(id *)a4
{
  BOOL v7 = EKUILogSignpostHandle();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B3F4C000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SaveEvent", " enableTelemetry=YES ", buf, 2u);
  }

  BOOL v8 = [(EKEventEditor *)self event];
  if (self->_shouldAutocomplete)
  {
    if (self->_zeroKeywordResult) {
      uint64_t v9 = -[EKAutocompleteSearchResult isEqual:](self->_selectedAutocompleteResult, "isEqual:");
    }
    else {
      uint64_t v9 = 0;
    }
    autocompleteTracker = self->_autocompleteTracker;
    id v11 = [(EKEventEditor *)self event];
    [(EKUIAutocompleteTracker *)autocompleteTracker finalizeAutocompleteTrackingOnSave:1 withEvent:v11 selectedResult:self->_selectedAutocompleteResult selectedIndex:self->_selectedAutocompleteResultIndex isZKW:v9];

    if (v9)
    {
      id v12 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_SGSuggestionsServiceClass"), "serviceForEvents");
      id v13 = [(EKAutocompleteSearchResult *)self->_zeroKeywordResult suggestionInfo];
      uint64_t v14 = [v13 uniqueKey];
      uint64_t v15 = v12;
      uint64_t v16 = v14;
      uint64_t v17 = 14;
LABEL_12:
      [v15 logEventInteractionForEventWithUniqueKey:v16 interface:v17 actionType:6];

      goto LABEL_13;
    }
    if (self->_naturalLanguageResult
      && -[EKAutocompleteSearchResult isEqual:](self->_selectedAutocompleteResult, "isEqual:"))
    {
      id v12 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_SGSuggestionsServiceClass"), "serviceForEvents");
      id v13 = [(EKAutocompleteSearchResult *)self->_naturalLanguageResult suggestionInfo];
      uint64_t v14 = [v13 uniqueKey];
      uint64_t v15 = v12;
      uint64_t v16 = v14;
      uint64_t v17 = 15;
      goto LABEL_12;
    }
  }
LABEL_13:
  v18 = [(EKEventEditor *)self suggestionKey];

  if (v18)
  {
    int v19 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_SGSuggestionsServiceClass"), "serviceForEvents");
    char v20 = [(EKEventEditor *)self suggestionKey];
    [v19 logEventInteractionForEventWithUniqueKey:v20 interface:20 actionType:6];
  }
  int v21 = [v8 isNew];
  if (a3 || v21)
  {
    v22 = [v8 recurrenceRules];
    v23 = [v22 firstObject];

    v24 = [v23 recurrenceEnd];
    v25 = [v24 endDate];

    if (v25)
    {
      char v26 = CUIKCalendar();
      v27 = [v26 components:30 fromDate:v25];
      v28 = [v8 startDate];
      [v26 components:224 fromDate:v28];
      int64_t v54 = a3;
      objc_super v30 = v29 = a4;

      objc_msgSend(v27, "setHour:", objc_msgSend(v30, "hour"));
      objc_msgSend(v27, "setMinute:", objc_msgSend(v30, "minute"));
      objc_msgSend(v27, "setSecond:", objc_msgSend(v30, "second"));
      id v31 = [v26 dateFromComponents:v27];
      v32 = [MEMORY[0x1E4F255E0] recurrenceEndWithEndDate:v31];
      [v23 setRecurrenceEnd:v32];

      a4 = v29;
      a3 = v54;
    }
  }
  if (objc_msgSend(v8, "hasAttendees", v54)
    && ([v8 allowsAttendeesModifications] & 1) == 0)
  {
    [v8 setAttendees:0];
  }
  __int16 v33 = [v8 structuredLocation];
  if ([v33 isStructured])
  {
    v34 = [v8 calendar];
    id v35 = [v34 source];
    double v36 = [v35 constraints];
    char v37 = [v36 supportsStructuredLocations];

    if (v37) {
      goto LABEL_27;
    }
    long long v38 = (void *)MEMORY[0x1E4F25630];
    __int16 v33 = [v8 location];
    long long v39 = [v38 locationWithTitle:v33];
    [v8 setStructuredLocation:v39];
  }
LABEL_27:
  int v40 = [v8 isNew];
  __int16 v41 = [MEMORY[0x1E4F25540] sharedInstance];
  uint64_t v42 = v41;
  if (v40)
  {
    [v41 handleEventCreation:v8];

    CalAnalyticsSendEventLazy();
  }
  else
  {
    [v41 handleEventUpdate:v8];
  }
  __int16 v43 = [(EKCalendarItemEditor *)self editorDelegate];
  v44 = [v43 editorForCalendarItemEditor:self];

  if (self->_shouldRecordPrecommitEvent)
  {
    int v45 = [v44 saveEventForOOPModificationRecording:v8 span:a3 error:a4];
    v46 = objc_alloc_init(_TtC10EventKitUI33EKRemoteUIObjectSerializerWrapper);
    __int16 v47 = [(EKRemoteUIObjectSerializerWrapper *)v46 serializedRepresentationWithEkObject:v8];
    precommitSerializedEvent = self->_precommitSerializedEvent;
    self->_precommitSerializedEvent = v47;

    if (!v45)
    {
      BOOL v50 = 0;
      goto LABEL_38;
    }
    char v49 = [v44 commitEventForOOPModificationRecording:v8 error:a4];

    if ((v49 & 1) == 0)
    {
LABEL_33:
      BOOL v50 = 0;
      goto LABEL_39;
    }
  }
  else if (![v44 saveEvent:v8 span:a3 error:a4])
  {
    goto LABEL_33;
  }
  v51 = [v8 suggestionInfo];

  if (v51)
  {
    v46 = [(EKCalendarItemEditor *)self store];
    [(EKRemoteUIObjectSerializerWrapper *)v46 confirmSuggestedEvent:v8];
    BOOL v50 = 1;
LABEL_38:

    goto LABEL_39;
  }
  BOOL v50 = 1;
LABEL_39:
  v52 = EKUILogSignpostHandle();
  if (os_signpost_enabled(v52))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B3F4C000, v52, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SaveEvent", " enableTelemetry=YES ", buf, 2u);
  }

  return v50;
}

void __48__EKEventEditor_saveCalendarItemWithSpan_error___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  unint64_t v3 = [*(id *)(a1 + 32) calendarItemCreationMethod] - 1;
  if (v3 <= 3) {
    [v4 setObject:off_1E608A8A8[v3] forKeyedSubscript:@"method"];
  }
}

- (id)preferredTitle
{
  unint64_t v2 = [(EKEventEditor *)self event];
  unint64_t v3 = v2;
  if (v2 && ([v2 isNew] & 1) == 0)
  {
    id v4 = EventKitUIBundle();
    char v5 = v4;
    BOOL v6 = @"Edit Event";
  }
  else
  {
    id v4 = EventKitUIBundle();
    char v5 = v4;
    BOOL v6 = @"New Event";
  }
  BOOL v7 = [v4 localizedStringForKey:v6 value:&stru_1F0CC2140 table:0];

  return v7;
}

+ (id)defaultTitleForCalendarItem
{
  unint64_t v2 = EventKitUIBundle();
  unint64_t v3 = [v2 localizedStringForKey:@"Untitled event" value:@"New Event" table:0];

  return v3;
}

- (id)_nameForDeleteButton
{
  unint64_t v2 = EventKitUIBundle();
  unint64_t v3 = [v2 localizedStringForKey:@"Delete Event" value:&stru_1F0CC2140 table:0];

  return v3;
}

- (id)defaultAlertTitle
{
  unint64_t v2 = EventKitUIBundle();
  unint64_t v3 = [v2 localizedStringForKey:@"Cannot Save Event" value:&stru_1F0CC2140 table:0];

  return v3;
}

- (id)notificationNamesForLocaleChange
{
  return (id)[MEMORY[0x1E4F1C978] arrayWithObject:*MEMORY[0x1E4F57AB0]];
}

- (unint64_t)entityType
{
  return 0;
}

- (void)setBackgroundColor:(id)a3
{
  char v5 = (UIColor *)a3;
  if (self->_backgroundColor != v5)
  {
    BOOL v7 = v5;
    objc_storeStrong((id *)&self->_backgroundColor, a3);
    if ([(EKEventEditor *)self isViewLoaded])
    {
      BOOL v6 = [(EKEventEditor *)self view];
      [v6 setBackgroundColor:v7];
    }
  }

  MEMORY[0x1F4181820]();
}

- (CGSize)preferredContentSize
{
  double v3 = EKUIContainedControllerIdealWidth();
  double v4 = EKUIContainedControllerIdealHeight();
  char v5 = [(EKEventEditor *)self view];
  objc_msgSend(v5, "sizeThatFits:", v3, v4);
  double v7 = v6;

  double v8 = v3;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)prepareEditItems
{
  v3.receiver = self;
  v3.super_class = (Class)EKEventEditor;
  [(EKCalendarItemEditor *)&v3 prepareEditItems];
  [(EKEventEditor *)self _updateTitleEditItemSeparatorVisibility];
}

- (void)_focusAppearanceTarget
{
  unint64_t focusOnAppearanceTarget = self->_focusOnAppearanceTarget;
  if (focusOnAppearanceTarget == 2)
  {
    dateItem = self->_dateItem;
    if (dateItem)
    {
      id v9 = [(EKEventDateEditItem *)dateItem cellForSubitemAtIndex:1];
      char v5 = [(EKEventEditor *)self tableView];
      double v6 = [v5 indexPathForCell:v9];

      double v7 = [(EKEventEditor *)self tableView];
      [v7 selectRowAtIndexPath:v6 animated:1 scrollPosition:0];

      double v8 = [(EKEventEditor *)self tableView];
      [(EKCalendarItemEditor *)self tableView:v8 didSelectRowAtIndexPath:v6];

      self->_unint64_t focusOnAppearanceTarget = 0;
    }
  }
  else if (focusOnAppearanceTarget == 1)
  {
    if ([(EKCalendarItemTitleInlineEditItem *)self->_titleInlineEditItem focusTitleAndSelectTitle:self->_selectOnFocus])
    {
      self->_unint64_t focusOnAppearanceTarget = 0;
    }
  }
}

- (void)focus:(unint64_t)a3 select:(BOOL)a4
{
  self->_unint64_t focusOnAppearanceTarget = a3;
  self->_selectOnFocus = a4;
  [(EKEventEditor *)self _focusAppearanceTarget];
}

- (BOOL)isShowingAccessDeniedView
{
  return (unint64_t)(self->super._lastAuthorizationStatus - 5) < 0xFFFFFFFFFFFFFFFELL;
}

- (void)_revertEvent
{
  objc_super v3 = [(EKEventEditor *)self event];
  [v3 rollback];

  id v4 = [(EKEventEditor *)self event];
  [v4 forceLocationPredictionUpdate];
}

- (id)_viewForSheet
{
  objc_super v3 = [(EKCalendarItemEditor *)self currentEditItem];

  if (!v3
    || ([(EKCalendarItemEditor *)self currentEditItem],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [v4 viewForActionSheet],
        char v5 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v5))
  {
    char v5 = [(EKEventEditor *)self view];
  }

  return v5;
}

- (void)_setEventTitleForTestingAutocomplete:(id)a3
{
  id v5 = a3;
  id v4 = [(EKEventEditor *)self event];
  [v4 setTitle:v5];

  [(EKCalendarItemTitleInlineEditItem *)self->_titleInlineEditItem setTitle:v5];
  [(EKEventEditor *)self _scheduleAutocompleteSearchWithString:v5];
}

- (void)editItemTextChanged:(id)a3
{
  id v4 = (EKCalendarItemTitleInlineEditItem *)a3;
  if (self->_titleInlineEditItem == v4) {
    [(EKEventEditor *)self _showAutocompleteResults];
  }
  v5.receiver = self;
  v5.super_class = (Class)EKEventEditor;
  [(EKCalendarItemEditor *)&v5 editItemTextChanged:v4];
}

- (void)editItemDidStartEditing:(id)a3
{
  titleInlineEditItem = self->_titleInlineEditItem;
  id v6 = a3;
  if (titleInlineEditItem == a3) {
    [(EKEventEditor *)self _showAutocompleteResults];
  }
  else {
    [(EKEventEditor *)self _hideAndCancelAutocompleteResults];
  }
  v7.receiver = self;
  v7.super_class = (Class)EKEventEditor;
  [(EKCalendarItemEditor *)&v7 editItemDidStartEditing:v6];
}

- (void)editItem:(id)a3 didSaveFromDetailViewController:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (EKCalendarItemCalendarEditItem *)a3;
  if (self->_calendarEditItem == v6)
  {
    objc_super v7 = [(EKEventEditor *)self event];
    [(UIResponder *)self EKUI_setDataOwnersFromEvent:v7];
  }
  if (objc_msgSend((id)-[EKEventEditor superclass](self, "superclass"), "instancesRespondToSelector:", sel_editItem_didSaveFromDetailViewController_))
  {
    v8.receiver = self;
    v8.super_class = (Class)EKEventEditor;
    [(EKCalendarItemEditor *)&v8 editItem:v6 didSaveFromDetailViewController:v4];
  }
}

- (void)_showAutocompleteResults
{
  if (self->_shouldAutocomplete && !self->_selectedAutocompleteResult)
  {
    id v3 = [(EKCalendarItemTitleInlineEditItem *)self->_titleInlineEditItem searchStringForEventAutocomplete];
    [(EKEventEditor *)self _scheduleAutocompleteSearchWithString:v3];
  }
}

- (void)_hideAndCancelAutocompleteResults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__EKEventEditor__hideAndCancelAutocompleteResults__block_invoke;
  block[3] = &unk_1E6087570;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __50__EKEventEditor__hideAndCancelAutocompleteResults__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1216) setResults:MEMORY[0x1E4F1CBF0]];
  unint64_t v2 = *(void **)(a1 + 32);

  return [v2 _cancelPendingAutocompleteAndCleanup];
}

- (void)_scheduleAutocompleteSearchWithString:(id)a3
{
  id v7 = a3;
  objc_super v5 = [MEMORY[0x1E4F57C00] sharedPreferences];
  int v6 = [v5 eventAutocompleteEnabled];

  if (v6)
  {
    objc_storeStrong((id *)&self->_autocompleteSearchString, a3);
    [(EKEventEditor *)self _scheduleAutocompleteTimerIfNeeded];
  }
}

- (void)_scheduleAutocompleteTimerIfNeeded
{
  if (!self->_autocompleteTimer)
  {
    id v3 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__beginAutocompleteSearch_ selector:0 userInfo:0 repeats:0.35];
    autocompleteTimer = self->_autocompleteTimer;
    self->_autocompleteTimer = v3;
  }
}

- (void)_cancelPendingAutocompleteAndCleanup
{
  autocompleteTimer = self->_autocompleteTimer;
  if (autocompleteTimer)
  {
    [(NSTimer *)autocompleteTimer invalidate];
    BOOL v4 = self->_autocompleteTimer;
    self->_autocompleteTimer = 0;
  }
}

- (void)_beginAutocompleteSearch:(id)a3
{
  id v22 = a3;
  BOOL v4 = self->_autocompleteSearchString;
  objc_super v5 = v4;
  if (v4)
  {
    uint64_t v6 = [(NSString *)v4 length];
    [(EKEventEditor *)self _cancelPendingAutocompleteAndCleanup];
    if (v6)
    {
      [(EKUIAutocompleteTracker *)self->_autocompleteTracker trackAutocompleteQuery];
      char v21 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    [(EKEventEditor *)self _cancelPendingAutocompleteAndCleanup];
  }
  [(EKUIAutocompleteTracker *)self->_autocompleteTracker trackZKWQuery];
  char v21 = 1;
LABEL_6:
  if ([(id)*MEMORY[0x1E4FB2608] isRunningTest])
  {
    id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 postNotificationName:_EventKitUI_EventEditorDidBeginAutocompleteSearchNotification object:self];
  }
  if (!self->_suggestionGenerator)
  {
    objc_super v8 = (EKEventSuggestionGenerator *)objc_alloc_init(MEMORY[0x1E4F25558]);
    suggestionGenerator = self->_suggestionGenerator;
    self->_suggestionGenerator = v8;
  }
  BOOL v10 = [(EKCalendarItemEditor *)self timeImplicitlySet];
  uint64_t v11 = 52;
  if (v10) {
    uint64_t v11 = 20;
  }
  uint64_t v20 = v11;
  id v12 = self->_suggestionGenerator;
  id v13 = [(EKEventEditor *)self event];
  uint64_t v14 = [v13 calendar];
  uint64_t v15 = [(EKEventEditor *)self event];
  uint64_t v16 = [v15 startDate];
  uint64_t v17 = [(EKCalendarItemEditor *)self editorDelegate];
  v18 = [v17 pasteboardManagerForCalendarItemEditor:self];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __42__EKEventEditor__beginAutocompleteSearch___block_invoke;
  v23[3] = &unk_1E608A888;
  v24 = v5;
  v25 = self;
  char v26 = v21;
  int v19 = v5;
  [(EKEventSuggestionGenerator *)v12 eventSuggestionsFromString:v19 defaultCalendar:v14 referenceDate:v16 pasteboardItemProvider:v18 defaultSuggestionVisibility:1 options:v20 handler:v23];
}

void __42__EKEventEditor__beginAutocompleteSearch___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__EKEventEditor__beginAutocompleteSearch___block_invoke_2;
  v7[3] = &unk_1E608A860;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v8 = v4;
  uint64_t v9 = v5;
  id v10 = v3;
  char v11 = *(unsigned char *)(a1 + 48);
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __42__EKEventEditor__beginAutocompleteSearch___block_invoke_2(uint64_t a1)
{
  if (CalEqualStrings())
  {
    unint64_t v2 = (void *)MEMORY[0x1E4F25558];
    uint64_t v3 = *(void *)(a1 + 48);
    id v4 = [*(id *)(a1 + 40) event];
    uint64_t v5 = [v4 startDate];
    id v6 = [*(id *)(a1 + 40) event];
    id v7 = [v6 endDateUnadjustedForLegacyClients];
    uint64_t v8 = [*(id *)(a1 + 40) timeImplicitlySet];
    uint64_t v9 = CUIKCalendar();
    [v2 adjustTimeForUIAndApplyToAutocompleteResults:v3 usingCurrentStartDate:v5 currentEndDate:v7 timeImplicitlySet:v8 calendar:v9];

    id obj = [*(id *)(a1 + 48) firstObject];
    if (*(unsigned char *)(a1 + 56) && [obj source] == 2) {
      objc_storeStrong((id *)(*(void *)(a1 + 40) + 1336), obj);
    }
    [*(id *)(*(void *)(a1 + 40) + 1216) setResults:*(void *)(a1 + 48)];
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 1360), "setFinalNumberOfAutocompleteResults:", objc_msgSend(*(id *)(a1 + 48), "count"));
  }
}

- (void)autocompleteResultsEditItem:(id)a3 resultSelected:(id)a4
{
  id v35 = a3;
  id v6 = a4;
  [(EKEventEditor *)self _cancelPendingAutocompleteAndCleanup];
  p_selectedAutocompleteResult = &self->_selectedAutocompleteResult;
  objc_storeStrong((id *)&self->_selectedAutocompleteResult, a4);
  uint64_t v8 = [(EKEventAutocompleteResultsEditItem *)self->_autocompleteEditItem results];
  self->_selectedAutocompleteResultIndex = [v8 indexOfObject:v6];

  uint64_t v9 = [v6 pasteboardResults];
  unint64_t v10 = [v9 count];

  if (v10 >= 2)
  {
    char v11 = [EKUIConfirmMultiPasteViewController alloc];
    id v12 = [(EKCalendarItemEditor *)self editorDelegate];
    id v13 = [v12 pasteboardManagerForCalendarItemEditor:self];
    uint64_t v14 = [(EKEventEditor *)self event];
    uint64_t v15 = [v14 eventStore];
    uint64_t v16 = [(EKEventEditor *)self event];
    uint64_t v17 = [v16 startDate];
    v18 = [(EKUIConfirmMultiPasteViewController *)v11 initWithSearchResult:v6 pasteboardManager:v13 eventStore:v15 dateForPaste:v17];

    [(EKUIConfirmMultiPasteViewController *)v18 setDelegate:self];
    int v19 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v18];
    [v19 setModalPresentationStyle:16];
    [(EKCalendarItemEditor *)self editItem:v35 wantsViewControllerPresented:v19];

    goto LABEL_19;
  }
  uint64_t v20 = [(EKEventEditor *)self event];
  [(EKEventEditor *)self _modifyCurrentEvent:v20 withAutocompleteResult:v6];

  char v21 = [v6 preferredLocation];
  int v22 = [v21 isPrediction];

  v23 = (void *)MEMORY[0x1E4F25638];
  if (v22)
  {
    v24 = [v6 preferredLocation];
    v25 = [v24 predictedLOI];
    [v23 userInteractionWithPredictedLocationOfInterest:v25 interaction:0];
  }
  else
  {
    if ([v35 hasSuggestedLocationResult]) {
      uint64_t v26 = 1;
    }
    else {
      uint64_t v26 = 2;
    }
    [v23 userInteractionWithPredictedLocationOfInterest:0 interaction:v26];
  }
  if (self->_zeroKeywordResult
    && -[EKAutocompleteSearchResult isEqual:](*p_selectedAutocompleteResult, "isEqual:"))
  {
    v27 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_SGSuggestionsServiceClass"), "serviceForEvents");
    v28 = [(EKAutocompleteSearchResult *)*p_selectedAutocompleteResult suggestionInfo];
    v29 = [v28 uniqueKey];
    objc_super v30 = v27;
    id v31 = v29;
    uint64_t v32 = 14;
  }
  else
  {
    if (!self->_naturalLanguageResult
      || !-[EKAutocompleteSearchResult isEqual:](*p_selectedAutocompleteResult, "isEqual:"))
    {
      goto LABEL_16;
    }
    v27 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_SGSuggestionsServiceClass"), "serviceForEvents");
    v28 = [(EKAutocompleteSearchResult *)*p_selectedAutocompleteResult suggestionInfo];
    v29 = [v28 uniqueKey];
    objc_super v30 = v27;
    id v31 = v29;
    uint64_t v32 = 15;
  }
  [v30 logEventInteractionForEventWithUniqueKey:v31 interface:v32 actionType:5];

LABEL_16:
  [(EKEventEditor *)self editItemTextChanged:self->_titleInlineEditItem];
  __int16 v33 = [(EKEventEditor *)self event];
  v34 = [v33 notes];

  if (v34) {
    [(EKEventURLAndNotesInlineEditItem *)self->_notesEditItem reset];
  }
  [(EKEventEditor *)self prepareEditItems];
  [(EKEventEditor *)self _setAutocompleteResultsVisible:0];
LABEL_19:
}

- (void)_modifyCurrentEvent:(id)a3 withAutocompleteResult:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  if ([v6 source] == 4
    && ([v6 pasteboardResults],
        id v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 count],
        v7,
        v8 == 1))
  {
    uint64_t v9 = [v6 pasteboardResults];
    unint64_t v10 = [v9 firstObject];

    char v11 = [(EKCalendarItemEditor *)self editorDelegate];
    id v12 = [v11 pasteboardManagerForCalendarItemEditor:self];
    id v13 = [v12 calendarToPasteTo];

    uint64_t v14 = 1;
  }
  else
  {
    uint64_t v14 = 0;
    id v13 = 0;
    unint64_t v10 = v6;
  }
  [v10 updateEventFromSelf:v16 updateTimeProperties:1 updateTravelTimeProperties:v14 updateMode:0 overrideCalendar:v13];
  uint64_t v15 = [v10 attendees];
  -[EKCalendarItemEditor setHasModifiedAttendeesFromSuggestion:](self, "setHasModifiedAttendeesFromSuggestion:", [v15 count] != 0);
}

- (void)autocompleteResultsEditItemDidShowResults:(id)a3
{
  [(EKEventEditor *)self _setAutocompleteResultsVisible:1];
  if ([(id)*MEMORY[0x1E4FB2608] isRunningTest])
  {
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 postNotificationName:_EventKitUI_EventEditorDidShowAutocompleteResultsNotification object:self];
  }
}

- (void)autocompleteResultsEditItemDidHideResults:(id)a3
{
}

- (void)_setAutocompleteResultsVisible:(BOOL)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (self->_autocompleteResultsVisible != a3)
  {
    self->_autocompleteResultsVisible = a3;
    [(EKEventEditor *)self _updateTitleEditItemSeparatorVisibility];
    if (self->_autocompleteResultsVisible)
    {
      id v4 = self->_zeroKeywordResult;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      uint64_t v5 = [(EKEventAutocompleteResultsEditItem *)self->_autocompleteEditItem results];
      uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        char v8 = 0;
        uint64_t v9 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v19 != v9) {
              objc_enumerationMutation(v5);
            }
            char v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
            if (v4 && ([*(id *)(*((void *)&v18 + 1) + 8 * i) isEqual:v4] & 1) != 0)
            {
              char v8 = 1;
            }
            else if ([v11 source] == 2)
            {
              objc_storeStrong((id *)&self->_naturalLanguageResult, v11);
            }
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v7);

        if (v8)
        {
          if (!self->_hasShownZeroKeywordResult)
          {
            self->_hasShownZeroKeywordResult = 1;
            [(EKUIAutocompleteTracker *)self->_autocompleteTracker trackZKWResultShown];
            id v12 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_SGSuggestionsServiceClass"), "serviceForEvents");
            id v13 = [(EKAutocompleteSearchResult *)v4 suggestionInfo];
            uint64_t v14 = [v13 uniqueKey];
            [v12 logEventInteractionForEventWithUniqueKey:v14 interface:14 actionType:4];
          }
LABEL_23:

          return;
        }
      }
      else
      {
      }
      [(EKUIAutocompleteTracker *)self->_autocompleteTracker trackAutocompleteResultsShown];
      if (self->_naturalLanguageResult)
      {
        if (!self->_hasShownNaturalLanguageResult)
        {
          self->_hasShownNaturalLanguageResult = 1;
          uint64_t v15 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_SGSuggestionsServiceClass"), "serviceForEvents");
          id v16 = [(EKAutocompleteSearchResult *)self->_naturalLanguageResult suggestionInfo];
          uint64_t v17 = [v16 uniqueKey];
          [v15 logEventInteractionForEventWithUniqueKey:v17 interface:15 actionType:4];
        }
        [(EKUIAutocompleteTracker *)self->_autocompleteTracker trackNLResultShown];
      }
      goto LABEL_23;
    }
  }
}

- (void)confirmMultiPasteViewController:(id)a3 finishedWithCancel:(BOOL)a4
{
  if (a4) {
    [(EKEventEditor *)self focus:1 select:0];
  }
  else {
    [(EKCalendarItemEditor *)self cancelEditingWithDelegateNotification:1 forceCancel:1];
  }
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (NSString)suggestionKey
{
  return self->_suggestionKey;
}

- (BOOL)shouldRecordPrecommitEvent
{
  return self->_shouldRecordPrecommitEvent;
}

- (void)setShouldRecordPrecommitEvent:(BOOL)a3
{
  self->_shouldRecordPrecommitEvent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionKey, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_precommitSerializedEvent, 0);
  objc_storeStrong((id *)&self->_suggestionGenerator, 0);
  objc_storeStrong((id *)&self->_autocompleteTracker, 0);
  objc_storeStrong((id *)&self->_naturalLanguageResult, 0);
  objc_storeStrong((id *)&self->_zeroKeywordResult, 0);
  objc_storeStrong((id *)&self->_selectedAutocompleteResult, 0);
  objc_storeStrong((id *)&self->_autocompleteSearchString, 0);
  objc_storeStrong((id *)&self->_autocompleteTimer, 0);
  objc_storeStrong((id *)&self->_recurrenceEditItem, 0);
  objc_storeStrong((id *)&self->_attendeesEditItem, 0);
  objc_storeStrong((id *)&self->_attachmentsEditItem, 0);
  objc_storeStrong((id *)&self->_notesEditItem, 0);
  objc_storeStrong((id *)&self->_alarmEditItem, 0);
  objc_storeStrong((id *)&self->_calendarEditItem, 0);
  objc_storeStrong((id *)&self->_locationInlineEditItem, 0);
  objc_storeStrong((id *)&self->_titleInlineEditItem, 0);
  objc_storeStrong((id *)&self->_autocompleteEditItem, 0);

  objc_storeStrong((id *)&self->_dateItem, 0);
}

@end