@interface CUIKEditingContext
+ (int64_t)spanFromSpanDecision:(unint64_t)a3;
+ (unint64_t)spanDecisionFromSpan:(int64_t)a3;
+ (void)postLiveEditNotificationForObject:(id)a3;
- (BOOL)_allObjectsAreCalendars;
- (BOOL)_allObjectsAreEvents;
- (BOOL)_allObjectsAreItems;
- (BOOL)_deleteIsUndoable;
- (BOOL)_doManualDelete;
- (BOOL)_earlyCommitDecisionSpecified;
- (BOOL)_editingObjectsNeverCommitted;
- (BOOL)_hasChangesRequiringSpanAllAndSpanIsThis;
- (BOOL)_hasChangesToSave;
- (BOOL)_prepareForCommitWithDecision:(unint64_t)a3 shouldClose:(BOOL *)a4;
- (BOOL)_requestEarlyCommitDecisionAtSaveTimeForAction:(unint64_t)a3;
- (BOOL)_requestSaveAndSpanDecisionIfNeededForAction:(unint64_t)a3;
- (BOOL)_requestSaveDecisionIfNeededForAction:(unint64_t)a3 diffSummary:(id)a4 delegate:(id)a5;
- (BOOL)_requestSpanDecisionIfNeededForAction:(unint64_t)a3 diffSummary:(id)a4 delegate:(id)a5;
- (BOOL)_saveActionIsDecline;
- (BOOL)_savePartialChangeAndPostNotification:(BOOL)a3;
- (BOOL)_shouldSilentlyTransitionToSpanAllAfterSave;
- (BOOL)_spanDecisionSpecified;
- (BOOL)addAllObjects;
- (BOOL)deleteAllObjects;
- (BOOL)hasUpdatePriority;
- (BOOL)isActive;
- (BOOL)isOpen;
- (BOOL)performUndoableOperation:(id)a3;
- (BOOL)saveCompleteChange;
- (BOOL)saveCompleteChange:(id *)a3;
- (BOOL)saveCompleteChangeAndClose:(BOOL)a3 error:(id *)a4;
- (BOOL)saveCompleteChangeWithImpliedCommitDecision:(id *)a3;
- (BOOL)saveCompleteChangeWithImpliedCommitDecisionAndClose:(BOOL)a3 error:(id *)a4;
- (BOOL)savePartialChange;
- (BOOL)shouldResetUndoStack;
- (CUIKCommitDelegate)commitDelegate;
- (CUIKDecisionDelegate)decisionDelegate;
- (CUIKEditingContext)initWithObjects:(id)a3 interfaceType:(unint64_t)a4 observer:(id)a5;
- (CUIKEditingContextGroup)group;
- (CUIKEditingContextObserver)observer;
- (CUIKEditingManager)editingManager;
- (CUIKUndoDelegate)undoDelegate;
- (NSArray)objectsBeingEdited;
- (NSArray)pendingGroupUpdates;
- (NSArray)pendingObserverUpdates;
- (NSError)error;
- (NSSet)originalEventOccurrenceIDsForObjectsBeingEdited;
- (NSSet)originalIdentifiersForObjectsBeingEdited;
- (id)_diffSummarySinceLastSave;
- (id)_eventStore;
- (id)changeUserInfoForObjects:(id)a3;
- (id)trackedObjects;
- (int64_t)_currentSpan;
- (unint64_t)_actionToCommit;
- (unint64_t)_currentSpanDecision;
- (unint64_t)_earlyCommitDecision;
- (unint64_t)_requestCommitDecisionIfNeededForAction:(unint64_t)a3;
- (unint64_t)interfaceType;
- (void)_cancelCurrentSave;
- (void)_clearLiveChanges;
- (void)_earlyCommitDecisionSpecified;
- (void)_markAsActive;
- (void)_markAsClosed;
- (void)_markAsInactive;
- (void)_markAsOpen;
- (void)_revert;
- (void)_setAllObjectsToDontNotify;
- (void)_specifyEarlyCommitDecision:(unint64_t)a3;
- (void)_specifySpanDecision:(unint64_t)a3;
- (void)_unspecifyEarlyCommitDecision;
- (void)_unspecifySpanDecision;
- (void)addAllObjects;
- (void)addOriginalIdentifiersForObjectsBeingEdited:(id)a3;
- (void)createAutoBugCapture;
- (void)deleteAllObjects;
- (void)hide;
- (void)notifyObservers;
- (void)postLiveEditNotificationForEditedObjects;
- (void)revert;
- (void)revert:(BOOL)a3;
- (void)setCommitDelegate:(id)a3;
- (void)setDecisionDelegate:(id)a3;
- (void)setEditingManager:(id)a3;
- (void)setError:(id)a3;
- (void)setGroup:(id)a3;
- (void)setInterfaceType:(unint64_t)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setIsOpen:(BOOL)a3;
- (void)setObjectsBeingEdited:(id)a3;
- (void)setObserver:(id)a3;
- (void)setOriginalEventOccurrenceIDsForObjectsBeingEdited:(id)a3;
- (void)setOriginalIdentifiersForObjectsBeingEdited:(id)a3;
- (void)setPendingGroupUpdates:(id)a3;
- (void)setPendingObserverUpdates:(id)a3;
- (void)setUndoDelegate:(id)a3;
- (void)trackedObjectsDidRevert:(id)a3;
- (void)trackedObjectsDidUpdate:(id)a3;
- (void)unhide;
@end

@implementation CUIKEditingContext

- (CUIKEditingContext)initWithObjects:(id)a3 interfaceType:(unint64_t)a4 observer:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v10 = +[CUIKLogSubsystem editingContext];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v18 = self;
    __int16 v19 = 2112;
    id v20 = v8;
    __int16 v21 = 2112;
    id v22 = v9;
    _os_log_debug_impl(&dword_1BDF08000, v10, OS_LOG_TYPE_DEBUG, "Creating context %@ with objects %@ and observer %@", buf, 0x20u);
  }

  v16.receiver = self;
  v16.super_class = (Class)CUIKEditingContext;
  v11 = [(CUIKEditingContext *)&v16 init];
  if (v11)
  {
    v12 = [v8 firstObject];
    uint64_t v13 = [v12 eventStore];
    eventStore = v11->_eventStore;
    v11->_eventStore = (EKEventStore *)v13;

    [(CUIKEditingContext *)v11 setObjectsBeingEdited:v8];
    [(CUIKEditingContext *)v11 setInterfaceType:a4];
    [(CUIKEditingContext *)v11 setObserver:v9];
  }

  return v11;
}

- (NSArray)objectsBeingEdited
{
  return self->_objectsBeingEdited;
}

- (void)setObjectsBeingEdited:(id)a3
{
  objc_storeStrong((id *)&self->_objectsBeingEdited, a3);
  id v5 = a3;
  [(CUIKEditingContext *)self addOriginalIdentifiersForObjectsBeingEdited:v5];
}

- (void)addOriginalIdentifiersForObjectsBeingEdited:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(EKEventStore *)self->_eventStore uniqueIdentifiersForAllObjectsWithChangesRelatedToObjects:v4];
  v6 = [(CUIKEditingContext *)self originalIdentifiersForObjectsBeingEdited];

  if (v6)
  {
    v7 = [(CUIKEditingContext *)self originalIdentifiersForObjectsBeingEdited];
    id v8 = [v7 setByAddingObjectsFromSet:v5];
    [(CUIKEditingContext *)self setOriginalIdentifiersForObjectsBeingEdited:v8];
  }
  else
  {
    [(CUIKEditingContext *)self setOriginalIdentifiersForObjectsBeingEdited:v5];
  }
  id v9 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = v4;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_super v16 = objc_msgSend(v15, "eventOccurrenceID", (void)v20);
          [v9 addObject:v16];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }

  v17 = [(CUIKEditingContext *)self originalEventOccurrenceIDsForObjectsBeingEdited];

  if (v17)
  {
    v18 = [(CUIKEditingContext *)self originalEventOccurrenceIDsForObjectsBeingEdited];
    __int16 v19 = [v18 setByAddingObjectsFromSet:v9];
    [(CUIKEditingContext *)self setOriginalEventOccurrenceIDsForObjectsBeingEdited:v19];
  }
  else
  {
    [(CUIKEditingContext *)self setOriginalEventOccurrenceIDsForObjectsBeingEdited:v9];
  }
}

- (id)_eventStore
{
  return self->_eventStore;
}

- (BOOL)_allObjectsAreItems
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(CUIKEditingContext *)self objectsBeingEdited];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          BOOL v7 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 1;
LABEL_11:

  return v7;
}

- (BOOL)_allObjectsAreEvents
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(CUIKEditingContext *)self objectsBeingEdited];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          BOOL v7 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 1;
LABEL_11:

  return v7;
}

- (BOOL)_allObjectsAreCalendars
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(CUIKEditingContext *)self objectsBeingEdited];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          BOOL v7 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 1;
LABEL_11:

  return v7;
}

- (BOOL)addAllObjects
{
  uint64_t v3 = +[CUIKLogSubsystem editingContext];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[CUIKEditingContext addAllObjects]();
  }

  [(CUIKEditingContext *)self _markAsActive];
  uint64_t v4 = +[CUIKUndoManager operationForAction:1 context:self];
  BOOL v5 = [(CUIKEditingContext *)self performUndoableOperation:v4];

  return v5;
}

- (BOOL)deleteAllObjects
{
  uint64_t v3 = +[CUIKLogSubsystem editingContext];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[CUIKEditingContext deleteAllObjects]();
  }

  if ([(CUIKEditingContext *)self _requestSaveAndSpanDecisionIfNeededForAction:4]&& [(CUIKEditingContext *)self _requestEarlyCommitDecisionAtSaveTimeForAction:4])
  {
    uint64_t v4 = +[CUIKLogSubsystem editingContext];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[CUIKEditingContext deleteAllObjects]();
    }

    [(CUIKEditingContext *)self _markAsActive];
    if ([(CUIKEditingContext *)self _earlyCommitDecision] == 2) {
      [(CUIKEditingContext *)self _setAllObjectsToDontNotify];
    }
    BOOL v5 = [(CUIKEditingContext *)self _editingObjectsNeverCommitted];
    if ([(CUIKEditingContext *)self _deleteIsUndoable])
    {
      v6 = +[CUIKUndoManager operationForAction:4 context:self];
      BOOL v7 = [(CUIKEditingContext *)self performUndoableOperation:v6];
    }
    else
    {
      BOOL v7 = [(CUIKEditingContext *)self _doManualDelete];
    }
    if (v7 && v5)
    {
      [(CUIKEditingContext *)self postLiveEditNotificationForEditedObjects];
      LOBYTE(v7) = 1;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (BOOL)_editingObjectsNeverCommitted
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(CUIKEditingContext *)self objectsBeingEdited];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (![*(id *)(*((void *)&v7 + 1) + 8 * i) hasEverBeenCommitted])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)_deleteIsUndoable
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (![(CUIKEditingContext *)self _allObjectsAreCalendars]) {
    return 1;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = [(CUIKEditingContext *)self objectsBeingEdited];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * i) isSubscribed])
        {
          BOOL v8 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 1;
LABEL_13:

  return v8;
}

- (BOOL)_doManualDelete
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(CUIKEditingContext *)self _allObjectsAreCalendars];
  if (v3)
  {
    BOOL v20 = v3;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id obj = [(CUIKEditingContext *)self objectsBeingEdited];
    uint64_t v4 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (!v4) {
      goto LABEL_18;
    }
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v26;
    unint64_t v7 = 0x1E4F17000uLL;
    unint64_t v8 = 0x1E4F57000uLL;
    while (1)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(obj);
        }
        long long v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if ([v10 isSubscribedHolidayCalendar])
        {
          id v11 = objc_alloc_init(*(Class *)(v7 + 2504));
          [*(id *)(v8 + 1832) setHolidayCalendarIsEnabled:0 withAccountStore:v11];
        }
        else
        {
          if (![v10 isSubscribed]) {
            goto LABEL_16;
          }
          id v11 = [v10 subcalAccountID];
          id v12 = objc_alloc_init(*(Class *)(v7 + 2504));
          long long v13 = [v12 accountWithIdentifier:v11];
          if (v13)
          {
            uint64_t v14 = [MEMORY[0x1E4F5E950] sharedConnection];
            uint64_t v15 = v5;
            unint64_t v16 = v7;
            uint64_t v17 = [v14 requestDaemonStopMonitoringAgents];

            v22[0] = MEMORY[0x1E4F143A8];
            v22[1] = 3221225472;
            v22[2] = __37__CUIKEditingContext__doManualDelete__block_invoke;
            v22[3] = &unk_1E636A630;
            uint64_t v24 = v17;
            unint64_t v7 = v16;
            uint64_t v5 = v15;
            unint64_t v8 = 0x1E4F57000;
            long long v23 = v11;
            [v12 removeAccount:v13 withCompletionHandler:v22];
            v18 = v23;
          }
          else
          {
            v18 = +[CUIKLogSubsystem editingContext];
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              id v30 = v11;
              _os_log_error_impl(&dword_1BDF08000, v18, OS_LOG_TYPE_ERROR, "Can't find account with ID %{public}@ for calendar being removed", buf, 0xCu);
            }
          }
        }
LABEL_16:
        objc_msgSend(v10, "CUIKEditingContext_removeWithSpan:", 0);
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
      if (!v5)
      {
LABEL_18:

        LOBYTE(v3) = v20;
        return v3;
      }
    }
  }
  return v3;
}

void __37__CUIKEditingContext__doManualDelete__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F5E950] sharedConnection];
  [v6 requestDaemonStartMonitoringAgentsWithToken:*(void *)(a1 + 40)];

  unint64_t v7 = +[CUIKLogSubsystem editingContext];
  unint64_t v8 = v7;
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __37__CUIKEditingContext__doManualDelete__block_invoke_cold_1(a1, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __37__CUIKEditingContext__doManualDelete__block_invoke_cold_2(a1);
  }
}

- (BOOL)saveCompleteChangeWithImpliedCommitDecision:(id *)a3
{
  return [(CUIKEditingContext *)self saveCompleteChangeWithImpliedCommitDecisionAndClose:0 error:a3];
}

- (BOOL)saveCompleteChangeWithImpliedCommitDecisionAndClose:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  unint64_t v7 = +[CUIKLogSubsystem editingContext];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[CUIKEditingContext saveCompleteChangeWithImpliedCommitDecisionAndClose:error:]();
  }

  [(CUIKEditingContext *)self _specifyEarlyCommitDecision:1];
  return [(CUIKEditingContext *)self saveCompleteChangeAndClose:v5 error:a4];
}

- (BOOL)saveCompleteChange
{
  return [(CUIKEditingContext *)self saveCompleteChangeAndClose:0 error:0];
}

- (BOOL)saveCompleteChange:(id *)a3
{
  return [(CUIKEditingContext *)self saveCompleteChangeAndClose:0 error:a3];
}

- (BOOL)saveCompleteChangeAndClose:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  unint64_t v7 = +[CUIKLogSubsystem editingContext];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[CUIKEditingContext saveCompleteChangeAndClose:error:].cold.4();
  }

  if (![(CUIKEditingContext *)self _hasChangesToSave])
  {
    uint64_t v10 = +[CUIKLogSubsystem editingContext];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[CUIKEditingContext saveCompleteChangeAndClose:error:]();
    }
    BOOL v11 = 1;
    goto LABEL_34;
  }
  [(CUIKEditingContext *)self _savePartialChangeAndPostNotification:0];
  BOOL v8 = [(CUIKEditingContext *)self _hasChangesRequiringSpanAllAndSpanIsThis];
  if (v8)
  {
    uint64_t v9 = +[CUIKLogSubsystem editingContext];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[CUIKEditingContext saveCompleteChangeAndClose:error:]();
    }

    [(CUIKEditingContext *)self _unspecifySpanDecision];
  }
  else if ([(CUIKEditingContext *)self _shouldSilentlyTransitionToSpanAllAfterSave])
  {
    uint64_t v12 = +[CUIKLogSubsystem editingContext];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[CUIKEditingContext saveCompleteChangeAndClose:error:]();
    }

    int v13 = 1;
    goto LABEL_16;
  }
  int v13 = 0;
LABEL_16:
  BOOL v14 = [(CUIKEditingContext *)self _saveActionIsDecline];
  if (v14) {
    uint64_t v15 = 3;
  }
  else {
    uint64_t v15 = 2;
  }
  BOOL v16 = [(CUIKEditingContext *)self _requestSaveAndSpanDecisionIfNeededForAction:v15];
  if (v14 && v16) {
    LOBYTE(v16) = [(CUIKEditingContext *)self _requestEarlyCommitDecisionAtSaveTimeForAction:3];
  }
  if (!v16)
  {
    [(CUIKEditingContext *)self _cancelCurrentSave];
    BOOL v11 = 0;
    if (!v5) {
      return v11;
    }
    goto LABEL_35;
  }
  [(CUIKEditingContext *)self _markAsActive];
  uint64_t v10 = +[CUIKUndoManager operationForAction:2 context:self];
  BOOL v11 = [(CUIKEditingContext *)self performUndoableOperation:v10];
  if (!v5) {
    [(CUIKEditingContext *)self postLiveEditNotificationForEditedObjects];
  }
  if (v8)
  {
    [(CUIKEditingContext *)self _unspecifySpanDecision];
  }
  else if (v13)
  {
    [(CUIKEditingContext *)self _specifySpanDecision:2];
  }
  uint64_t v17 = [v10 error];

  if (a4 && v17)
  {
    *a4 = [v10 error];
  }
LABEL_34:

  if (v5)
  {
LABEL_35:
    v18 = [(CUIKEditingContext *)self editingManager];
    [v18 closeEditingContext:self];
  }
  return v11;
}

- (BOOL)_hasChangesToSave
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(CUIKEditingContext *)self objectsBeingEdited];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    char v5 = 0;
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        if (v5)
        {
          char v5 = 1;
          goto LABEL_12;
        }
        char v5 = [*(id *)(*((void *)&v9 + 1) + 8 * i) hasUnsavedChanges];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    char v5 = 0;
  }
LABEL_12:

  return v5;
}

- (BOOL)_hasChangesRequiringSpanAllAndSpanIsThis
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([(CUIKEditingContext *)self _currentSpan])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v4 = [(CUIKEditingContext *)self objectsBeingEdited];
    uint64_t v3 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v3)
    {
      uint64_t v5 = *(void *)v10;
      while (2)
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v4);
          }
          unint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass() & 1) != 0 && ([v7 hasChangesRequiringSpanAll])
          {
            LOBYTE(v3) = 1;
            goto LABEL_14;
          }
        }
        uint64_t v3 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v3) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  return v3;
}

- (BOOL)_shouldSilentlyTransitionToSpanAllAfterSave
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([(CUIKEditingContext *)self _currentSpan])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v4 = [(CUIKEditingContext *)self objectsBeingEdited];
    uint64_t v3 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v3)
    {
      uint64_t v5 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v14 != v5) {
            objc_enumerationMutation(v4);
          }
          unint64_t v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v8 = [v7 recurrenceRuleString];
            if (v8)
            {
              long long v9 = (void *)v8;
              long long v10 = [v7 shallowCopyWithoutChanges];
              long long v11 = [v10 recurrenceRuleString];

              if (!v11)
              {
                LOBYTE(v3) = 1;
                goto LABEL_15;
              }
            }
          }
        }
        uint64_t v3 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v3) {
          continue;
        }
        break;
      }
    }
LABEL_15:
  }
  return v3;
}

- (BOOL)_saveActionIsDecline
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(CUIKEditingContext *)self _diffSummarySinceLastSave];
  uint64_t v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F253E0]];

  if (v4)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v5 = [(CUIKEditingContext *)self objectsBeingEdited];
    uint64_t v4 = (void *)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      uint64_t v6 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v5);
          }
          uint64_t v8 = [*(id *)(*((void *)&v11 + 1) + 8 * i) selfAttendee];
          uint64_t v9 = [v8 participantStatus];

          if (v9 == 3)
          {
            LOBYTE(v4) = 1;
            goto LABEL_12;
          }
        }
        uint64_t v4 = (void *)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  return (char)v4;
}

- (id)_diffSummarySinceLastSave
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [(CUIKEditingContext *)self objectsBeingEdited];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(id *)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_12;
        }
        long long v10 = [v9 shallowCopyWithoutChanges];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

LABEL_12:
          id v12 = 0;
          goto LABEL_13;
        }
        long long v11 = [MEMORY[0x1E4F25590] diffSummaryBetweenObject:v10 andObject:v9];
        [v3 addEntriesFromDictionary:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  id v12 = v3;
LABEL_13:

  return v12;
}

- (BOOL)_requestSaveAndSpanDecisionIfNeededForAction:(unint64_t)a3
{
  uint64_t v5 = [(CUIKEditingContext *)self decisionDelegate];
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v6 = [(CUIKEditingContext *)self _diffSummarySinceLastSave];
    uint64_t v7 = +[CUIKLogSubsystem editingContext];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[CUIKEditingContext _requestSaveAndSpanDecisionIfNeededForAction:]((uint64_t)self);
    }

    if ([(CUIKEditingContext *)self _requestSaveDecisionIfNeededForAction:a3 diffSummary:v6 delegate:v5])
    {
      BOOL v8 = [(CUIKEditingContext *)self _requestSpanDecisionIfNeededForAction:a3 diffSummary:v6 delegate:v5];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (BOOL)_requestSaveDecisionIfNeededForAction:(unint64_t)a3 diffSummary:(id)a4 delegate:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ([(CUIKEditingContext *)self _allObjectsAreItems]
    && ([(CUIKEditingContext *)self objectsBeingEdited],
        long long v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v9 shouldSaveForItems:v10 forEditingAction:a3 diffSummary:v8],
        v10,
        (v11 & 1) == 0))
  {
    long long v13 = +[CUIKLogSubsystem editingContext];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[CUIKEditingContext _requestSaveDecisionIfNeededForAction:diffSummary:delegate:]();
    }

    BOOL v12 = 0;
  }
  else
  {
    BOOL v12 = 1;
  }

  return v12;
}

- (BOOL)_requestSpanDecisionIfNeededForAction:(unint64_t)a3 diffSummary:(id)a4 delegate:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ([(CUIKEditingContext *)self _spanDecisionSpecified]
    || ![(CUIKEditingContext *)self _allObjectsAreEvents])
  {
LABEL_10:
    BOOL v14 = 1;
    goto LABEL_11;
  }
  long long v10 = [(CUIKEditingContext *)self objectsBeingEdited];
  uint64_t v11 = [v9 spanDecisionForEvents:v10 forEditingAction:a3 diffSummary:v8];

  BOOL v12 = +[CUIKLogSubsystem editingContext];
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
  if (v11 != 4)
  {
    if (v13) {
      -[CUIKEditingContext _requestSpanDecisionIfNeededForAction:diffSummary:delegate:]();
    }

    [(CUIKEditingContext *)self _specifySpanDecision:v11];
    goto LABEL_10;
  }
  if (v13) {
    -[CUIKEditingContext _requestSaveDecisionIfNeededForAction:diffSummary:delegate:]();
  }

  BOOL v14 = 0;
LABEL_11:

  return v14;
}

- (void)_cancelCurrentSave
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1BDF08000, v0, v1, "Context %@: cancelling current save", v2, v3, v4, v5, v6);
}

- (void)_clearLiveChanges
{
  uint64_t v3 = [(CUIKEditingContext *)self editingManager];
  uint64_t v4 = [(CUIKEditingContext *)self objectsBeingEdited];
  [v3 clearLiveChangesForObjects:v4];

  [(CUIKEditingContext *)self postLiveEditNotificationForEditedObjects];
}

- (BOOL)_requestEarlyCommitDecisionAtSaveTimeForAction:(unint64_t)a3
{
  unint64_t v4 = [(CUIKEditingContext *)self _requestCommitDecisionIfNeededForAction:a3];
  if (v4 == 4)
  {
    uint64_t v5 = +[CUIKLogSubsystem editingContext];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[CUIKEditingContext _requestEarlyCommitDecisionAtSaveTimeForAction:]();
    }
  }
  else
  {
    [(CUIKEditingContext *)self _specifyEarlyCommitDecision:v4];
  }
  return v4 != 4;
}

- (unint64_t)_requestCommitDecisionIfNeededForAction:(unint64_t)a3
{
  unint64_t v5 = [(CUIKEditingContext *)self _earlyCommitDecision];
  uint8_t v6 = [(CUIKEditingContext *)self decisionDelegate];
  if (v6)
  {
    if ([(CUIKEditingContext *)self _allObjectsAreItems]
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      uint64_t v7 = [(CUIKEditingContext *)self objectsBeingEdited];
      uint64_t v8 = objc_msgSend(v6, "editingContext:commitDecisionForItems:forEditingAction:userImpliedDecision:withSpanDecision:", self, v7, a3, v5 != 0, -[CUIKEditingContext _currentSpanDecision](self, "_currentSpanDecision"));
LABEL_8:
      unint64_t v5 = v8;

      goto LABEL_9;
    }
    if ([(CUIKEditingContext *)self _allObjectsAreCalendars]
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      uint64_t v7 = [(CUIKEditingContext *)self objectsBeingEdited];
      uint64_t v8 = [v6 commitDecisionForCalendars:v7 forEditingAction:a3];
      goto LABEL_8;
    }
  }
LABEL_9:
  id v9 = +[CUIKLogSubsystem editingContext];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[CUIKEditingContext _requestCommitDecisionIfNeededForAction:]();
  }

  unint64_t v10 = [(CUIKEditingContext *)self _earlyCommitDecision];
  if (v5 <= v10) {
    unint64_t v11 = v10;
  }
  else {
    unint64_t v11 = v5;
  }

  return v11;
}

- (unint64_t)_currentSpanDecision
{
  if (![(CUIKEditingContext *)self _spanDecisionSpecified]) {
    return 0;
  }
  uint64_t v3 = [(CUIKEditingContext *)self group];
  unint64_t v4 = [v3 spanDecisionForGroup];

  return v4;
}

- (int64_t)_currentSpan
{
  uint64_t v3 = objc_opt_class();
  unint64_t v4 = [(CUIKEditingContext *)self _currentSpanDecision];

  return [v3 spanFromSpanDecision:v4];
}

- (BOOL)_spanDecisionSpecified
{
  uint64_t v2 = [(CUIKEditingContext *)self group];
  char v3 = [v2 spanDecisionForGroupIsSet];

  return v3;
}

- (void)_specifySpanDecision:(unint64_t)a3
{
  id v4 = [(CUIKEditingContext *)self group];
  [v4 specifySpanDecisionForGroup:a3];
}

- (void)_unspecifySpanDecision
{
  id v2 = [(CUIKEditingContext *)self group];
  [v2 unspecifySpanDecisionForGroup];
}

- (unint64_t)_earlyCommitDecision
{
  if (![(CUIKEditingContext *)self _earlyCommitDecisionSpecified]) {
    return 0;
  }
  char v3 = [(CUIKEditingContext *)self group];
  unint64_t v4 = [v3 earlyCommitDecisionForGroup];

  return v4;
}

- (BOOL)_earlyCommitDecisionSpecified
{
  id v2 = [(CUIKEditingContext *)self group];
  char v3 = [v2 earlyCommitDecisionForGroupIsSet];

  unint64_t v4 = +[CUIKLogSubsystem editingContext];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[CUIKEditingContext _earlyCommitDecisionSpecified]();
  }

  return v3;
}

- (void)_specifyEarlyCommitDecision:(unint64_t)a3
{
  unint64_t v5 = +[CUIKLogSubsystem editingContext];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CUIKEditingContext _specifyEarlyCommitDecision:]();
  }

  uint8_t v6 = [(CUIKEditingContext *)self group];
  [v6 specifyEarlyCommitDecisionForGroup:a3];
}

- (void)_unspecifyEarlyCommitDecision
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1BDF08000, v0, v1, "Context %@: unspecifying early commit decision", v2, v3, v4, v5, v6);
}

- (void)_markAsActive
{
}

- (void)_markAsInactive
{
}

- (void)_markAsOpen
{
}

- (void)_markAsClosed
{
}

- (void)_setAllObjectsToDontNotify
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1BDF08000, v0, v1, "Context %@: Setting objects to dontNotify", v2, v3, v4, v5, v6);
}

- (BOOL)_savePartialChangeAndPostNotification:(BOOL)a3
{
  BOOL v14 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [(CUIKEditingContext *)self objectsBeingEdited];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        unint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
        }
        [(CUIKEditingContext *)self _markAsActive];
        unint64_t v11 = [(CUIKEditingContext *)self editingManager];
        [v11 partialSaveObject:v10];

        BOOL v12 = [v10 specificIdentifier];
        [v4 setObject:v10 forKeyedSubscript:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  [(CUIKEditingContext *)self trackedObjectsDidUpdate:v4];
  [(CUIKEditingContext *)self notifyObservers];
  if (v14) {
    [(CUIKEditingContext *)self postLiveEditNotificationForEditedObjects];
  }

  return 1;
}

- (BOOL)savePartialChange
{
  return [(CUIKEditingContext *)self _savePartialChangeAndPostNotification:1];
}

- (void)postLiveEditNotificationForEditedObjects
{
  uint64_t v3 = [(CUIKEditingContext *)self objectsBeingEdited];
  id v6 = [(CUIKEditingContext *)self changeUserInfoForObjects:v3];

  uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v5 = [(CUIKEditingContext *)self _eventStore];
  if (v6) {
    [v4 postNotificationName:@"CUIKLiveEditNotification" object:v5 userInfo:v6];
  }
  else {
    [v4 postNotificationName:@"CUIKLiveEditNotification" object:v5];
  }
}

+ (void)postLiveEditNotificationForObject:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 eventStore];
  v12[0] = v3;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  id v6 = [v4 uniqueIdentifiersForAllObjectsWithChangesRelatedToObjects:v5];

  if ([v6 count])
  {
    unint64_t v10 = @"CUIKLiveEditNotificationModifiedObjectUniqueIdentifiersUserInfoKey";
    unint64_t v11 = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v9 = [v3 eventStore];
  [v8 postNotificationName:@"CUIKLiveEditNotification" object:v9 userInfo:v7];
}

- (id)changeUserInfoForObjects:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(EKEventStore *)self->_eventStore uniqueIdentifiersForAllObjectsWithChangesRelatedToObjects:a3];
  uint64_t v5 = [(CUIKEditingContext *)self originalIdentifiersForObjectsBeingEdited];

  if (v5)
  {
    id v6 = [(CUIKEditingContext *)self originalIdentifiersForObjectsBeingEdited];
    uint64_t v7 = [v4 setByAddingObjectsFromSet:v6];

    uint64_t v4 = (void *)v7;
  }
  if ([v4 count])
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CA60];
    BOOL v12 = @"CUIKLiveEditNotificationModifiedObjectUniqueIdentifiersUserInfoKey";
    v13[0] = v4;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    unint64_t v10 = [v8 dictionaryWithDictionary:v9];
  }
  else
  {
    unint64_t v10 = 0;
  }

  return v10;
}

- (void)hide
{
  id v3 = [(CUIKEditingContext *)self editingManager];
  uint64_t v4 = [(CUIKEditingContext *)self objectsBeingEdited];
  [v3 hide:v4];

  [(CUIKEditingContext *)self postLiveEditNotificationForEditedObjects];
}

- (void)unhide
{
  id v3 = [(CUIKEditingContext *)self editingManager];
  uint64_t v4 = [(CUIKEditingContext *)self objectsBeingEdited];
  [v3 unhide:v4];

  [(CUIKEditingContext *)self postLiveEditNotificationForEditedObjects];
}

- (void)revert
{
}

- (void)_revert
{
}

- (void)revert:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = +[CUIKUndoManager operationForAction:5 context:self];
  if (v3)
  {
    id v6 = +[CUIKLogSubsystem editingContext];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[CUIKEditingContext revert:]();
    }

    [(CUIKEditingContext *)self performUndoableOperation:v5];
  }
  else
  {
    uint64_t v7 = [(CUIKEditingContext *)self undoDelegate];
    [v5 executeWithUndoDelegate:v7];
  }
  [(CUIKEditingContext *)self _clearLiveChanges];
  [(CUIKEditingContext *)self _unspecifyEarlyCommitDecision];
  [(CUIKEditingContext *)self _cancelCurrentSave];
}

- (void)createAutoBugCapture
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v22 = (void *)[objc_alloc(MEMORY[0x1E4F57648]) initWithType:@"EditingContext" subtype:@"UnexpectedDiff" context:0];
  long long v23 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = [(CUIKEditingContext *)self objectsBeingEdited];
  uint64_t v3 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0x1E4F25000uLL;
    uint64_t v6 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v9 = v8;
          unint64_t v10 = [v9 diffFromCommitted];
          if ([v10 result])
          {
            long long v25 = [v9 exportToICSWithOptions:1];
            unint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4FB7F48]) initWithData:v25 options:0 error:0];
            uint64_t v12 = [v11 ICSStringWithOptions:0];
            BOOL v13 = (void *)v12;
            if (v12) {
              BOOL v14 = (__CFString *)v12;
            }
            else {
              BOOL v14 = &stru_1F187C430;
            }
            v30[0] = @"ICS";
            v30[1] = @"Diff";
            v31[0] = v14;
            uint64_t v15 = objc_msgSend(v10, "summaryString", v22);
            long long v16 = (void *)v15;
            if (v15) {
              long long v17 = (__CFString *)v15;
            }
            else {
              long long v17 = &stru_1F187C430;
            }
            v31[1] = v17;
            [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
            uint64_t v18 = v4;
            uint64_t v19 = v6;
            v21 = unint64_t v20 = v5;
            [v23 addObject:v21];

            unint64_t v5 = v20;
            uint64_t v6 = v19;
            uint64_t v4 = v18;
          }
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v4);
  }

  [v22 setEvents:v23];
  [v22 report];
}

- (BOOL)_prepareForCommitWithDecision:(unint64_t)a3 shouldClose:(BOOL *)a4
{
  if (a4) {
    *a4 = 1;
  }
  uint64_t v7 = +[CUIKLogSubsystem editingContext];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[CUIKEditingContext _prepareForCommitWithDecision:shouldClose:].cold.8();
  }

  if ([(CUIKEditingContext *)self _earlyCommitDecision] == 4)
  {
    uint64_t v8 = +[CUIKLogSubsystem editingContext];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[CUIKEditingContext _prepareForCommitWithDecision:shouldClose:]();
    }

    [(CUIKEditingContext *)self _revert];
LABEL_9:
    BOOL v9 = 0;
    if (!a4) {
      goto LABEL_56;
    }
LABEL_53:
    uint64_t v24 = +[CUIKLogSubsystem editingContext];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      -[CUIKEditingContext _prepareForCommitWithDecision:shouldClose:]();
    }

    goto LABEL_56;
  }
  unint64_t v10 = [(CUIKEditingContext *)self _earlyCommitDecision];
  if (v10 <= a3) {
    unint64_t v11 = a3;
  }
  else {
    unint64_t v11 = v10;
  }
  [(CUIKEditingContext *)self _specifyEarlyCommitDecision:v11];
  unint64_t v12 = [(CUIKEditingContext *)self _actionToCommit];
  if ([(CUIKEditingContext *)self _allObjectsAreEvents] && v12)
  {
    switch([(CUIKEditingContext *)self _requestCommitDecisionIfNeededForAction:v12])
    {
      case 2uLL:
        BOOL v13 = +[CUIKLogSubsystem editingContext];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          -[CUIKEditingContext _prepareForCommitWithDecision:shouldClose:].cold.7();
        }

        if (a4) {
          *a4 = 1;
        }
        if (v12 == 2) {
          [(CUIKEditingContext *)self _setAllObjectsToDontNotify];
        }
        char v14 = 0;
        goto LABEL_48;
      case 4uLL:
        uint64_t v15 = +[CUIKLogSubsystem editingContext];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          -[CUIKEditingContext _prepareForCommitWithDecision:shouldClose:].cold.4();
        }

        [(CUIKEditingContext *)self _revert];
        if (!a4) {
          goto LABEL_47;
        }
        long long v16 = [(CUIKEditingContext *)self commitDelegate];
        if (!v16) {
          goto LABEL_45;
        }
        long long v17 = [(CUIKEditingContext *)self commitDelegate];
        char v18 = [v17 contextShouldStayOpenWhenCommitIsCanceled];
        goto LABEL_34;
      case 5uLL:
        uint64_t v19 = +[CUIKLogSubsystem editingContext];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          -[CUIKEditingContext _prepareForCommitWithDecision:shouldClose:].cold.5();
        }

        [(CUIKEditingContext *)self _revert];
        if (!a4) {
          goto LABEL_47;
        }
        long long v16 = [(CUIKEditingContext *)self commitDelegate];
        if (v16)
        {
          long long v17 = [(CUIKEditingContext *)self commitDelegate];
          char v18 = [v17 contextShouldStayOpenWhenCommitIsReverted];
LABEL_34:
          *a4 = v18 ^ 1;
        }
        else
        {
LABEL_45:
          *a4 = 1;
        }

LABEL_47:
        char v14 = 1;
LABEL_48:
        if ([(CUIKEditingContext *)self _actionToCommit])
        {
          [(CUIKEditingContext *)self createAutoBugCapture];
          if (a4)
          {
            BOOL v9 = 1;
            *a4 = 1;
            return v9;
          }
        }
        if ((v14 & 1) == 0) {
          break;
        }
        goto LABEL_9;
      case 6uLL:
        unint64_t v20 = +[CUIKLogSubsystem editingContext];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          -[CUIKEditingContext _prepareForCommitWithDecision:shouldClose:].cold.6();
        }

        if (a4) {
          *a4 = 1;
        }
        [(CUIKEditingContext *)self deleteAllObjects];
        break;
      case 7uLL:
        long long v21 = +[CUIKLogSubsystem editingContext];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
          -[CUIKEditingContext _prepareForCommitWithDecision:shouldClose:]();
        }

        if (a4)
        {
          long long v22 = [(CUIKEditingContext *)self commitDelegate];
          if (v22)
          {
            long long v23 = [(CUIKEditingContext *)self commitDelegate];
            *a4 = [v23 contextShouldStayOpenWhenCommitIsDeferred] ^ 1;
          }
          else
          {
            *a4 = 1;
          }
        }
        long long v26 = [(CUIKEditingContext *)self commitDelegate];
        long long v27 = [(CUIKEditingContext *)self objectsBeingEdited];
        long long v28 = [(CUIKEditingContext *)self originalEventOccurrenceIDsForObjectsBeingEdited];
        [v26 commitDeferredForObjects:v27 originalIdentifiers:v28];

        goto LABEL_9;
      default:
        break;
    }
  }
  [(CUIKEditingContext *)self _markAsInactive];
  BOOL v9 = 1;
  if (a4) {
    goto LABEL_53;
  }
LABEL_56:
  [(CUIKEditingContext *)self _unspecifyEarlyCommitDecision];
  return v9;
}

- (unint64_t)_actionToCommit
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v2 = [(CUIKEditingContext *)self objectsBeingEdited];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v8 isDeleted])
        {
          unint64_t v5 = 4;
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            int v9 = [v8 isDifferentFromCommitted];
          }
          else {
            int v9 = [v8 hasChanges];
          }
          if (v9) {
            unint64_t v5 = 2;
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)performUndoableOperation:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CUIKEditingContext *)self editingManager];
  uint64_t v6 = [(CUIKEditingContext *)self objectsBeingEdited];
  [v5 clearLiveChangesForObjects:v6];

  uint64_t v7 = +[CUIKLogSubsystem editingContext];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[CUIKEditingContext performUndoableOperation:]((uint64_t)self);
  }

  uint64_t v8 = [(CUIKEditingContext *)self undoDelegate];
  char v9 = [v4 executeWithUndoDelegate:v8];

  if ((v9 & 1) == 0)
  {
    unint64_t v10 = [v4 error];
    [(CUIKEditingContext *)self setError:v10];
  }
  long long v11 = [(CUIKEditingContext *)self undoDelegate];
  [v11 handleUndoForOperation:v4];

  return v9;
}

- (BOOL)shouldResetUndoStack
{
  return 0;
}

- (BOOL)hasUpdatePriority
{
  return 1;
}

- (id)trackedObjects
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (![(CUIKEditingContext *)self isOpen]) {
    goto LABEL_20;
  }
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [MEMORY[0x1E4F1CA80] set];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  unint64_t v5 = [(CUIKEditingContext *)self objectsBeingEdited];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v5);
        }
        unint64_t v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        long long v11 = [v10 specificIdentifier];
        [v4 addObject:v11];

        [v3 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v7);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v12 = [(CUIKEditingContext *)self group];
  long long v13 = [v12 trackedObjects];

  uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v13);
        }
        char v18 = *(void **)(*((void *)&v22 + 1) + 8 * j);
        uint64_t v19 = [v18 specificIdentifier];
        if (([v4 containsObject:v19] & 1) == 0) {
          [v3 addObject:v18];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v15);
  }

  uint64_t v20 = [v3 count];
  if (!v20)
  {

LABEL_20:
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)trackedObjectsDidUpdate:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  id v4 = +[CUIKLogSubsystem editingContext];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[CUIKEditingContext trackedObjectsDidUpdate:](v4);
  }

  if ([(CUIKEditingContext *)self isOpen])
  {
    v37 = [MEMORY[0x1E4F1CA48] array];
    unint64_t v5 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v35 = self;
    id obj = [(CUIKEditingContext *)self objectsBeingEdited];
    uint64_t v7 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v44 != v9) {
            objc_enumerationMutation(obj);
          }
          long long v11 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v12 = v11;
            long long v13 = [v12 specificIdentifier];
            uint64_t v14 = [v38 objectForKeyedSubscript:v13];

            if (v14) {
              goto LABEL_11;
            }
            uint64_t v19 = [(CUIKEditingContext *)v35 group];
            uint64_t v20 = [v12 specificIdentifier];
            long long v21 = (void *)[v19 newIdentifierForIdentifier:v20];

            if (!v21) {
              goto LABEL_15;
            }
            uint64_t v14 = [v38 objectForKeyedSubscript:v21];

            if (v14)
            {
LABEL_11:
              [v37 addObject:v14];
              uint64_t v15 = [v14 specificIdentifier];
              [v5 addObject:v15];

              id v16 = v14;
              long long v17 = v16;
            }
            else
            {
LABEL_15:
              id v16 = [MEMORY[0x1E4F1CA98] null];
              long long v17 = 0;
            }
            v50[0] = v12;
            v50[1] = v16;
            long long v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2];
            [v6 addObject:v22];
          }
          else
          {
            v49[0] = v11;
            v49[1] = v11;
            char v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
            [v6 addObject:v18];

            [v37 addObject:v11];
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
      }
      while (v8);
    }

    [(CUIKEditingContext *)v35 setObjectsBeingEdited:v37];
    long long v23 = [MEMORY[0x1E4F1CA48] arrayWithArray:v6];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v24 = [(CUIKEditingContext *)v35 group];
    long long v25 = [v24 trackedObjects];

    uint64_t v26 = [v25 countByEnumeratingWithState:&v39 objects:v48 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v40;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v40 != v28) {
            objc_enumerationMutation(v25);
          }
          id v30 = *(void **)(*((void *)&v39 + 1) + 8 * j);
          v31 = [v30 specificIdentifier];
          if (([v5 containsObject:v31] & 1) == 0)
          {
            uint64_t v32 = [v38 objectForKeyedSubscript:v31];
            uint64_t v33 = (void *)v32;
            if (v32)
            {
              v47[0] = v30;
              v47[1] = v32;
              v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:2];
              [v23 addObject:v34];
            }
          }
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v39 objects:v48 count:16];
      }
      while (v27);
    }

    [(CUIKEditingContext *)v35 setPendingObserverUpdates:v6];
    [(CUIKEditingContext *)v35 setPendingGroupUpdates:v23];
  }
}

- (void)notifyObservers
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = [(CUIKEditingContext *)self pendingObserverUpdates];
  uint64_t v3 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v39;
    uint64_t v28 = v35;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v39 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(v7, "objectAtIndexedSubscript:", 0, v28);
        uint64_t v9 = [v7 objectAtIndexedSubscript:1];
        unint64_t v10 = [MEMORY[0x1E4F1CA98] null];
        int v11 = [v9 isEqual:v10];

        if (v11)
        {

          uint64_t v9 = 0;
        }
        if (([MEMORY[0x1E4F29060] isMainThread] & 1) != 0
          || ([(CUIKEditingContext *)self observer],
              id v12 = objc_claimAutoreleasedReturnValue(),
              int v13 = [v12 isTestObserver],
              v12,
              v13))
        {
          uint64_t v14 = [(CUIKEditingContext *)self observer];
          id v15 = (id)[v14 oldObject:v8 didUpdateTo:v9];
        }
        else
        {
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          v35[0] = __37__CUIKEditingContext_notifyObservers__block_invoke;
          v35[1] = &unk_1E6369D18;
          v35[2] = self;
          id v36 = v8;
          id v37 = v9;
          dispatch_async(MEMORY[0x1E4F14428], block);
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v4);
  }

  [(CUIKEditingContext *)self setPendingObserverUpdates:0];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v16 = [(CUIKEditingContext *)self pendingGroupUpdates];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v42 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v31 != v19) {
          objc_enumerationMutation(v16);
        }
        long long v21 = *(void **)(*((void *)&v30 + 1) + 8 * j);
        long long v22 = [v21 objectAtIndexedSubscript:0];
        long long v23 = [v21 objectAtIndexedSubscript:1];
        long long v24 = [MEMORY[0x1E4F1CA98] null];
        int v25 = [v23 isEqual:v24];

        if (v25)
        {

          long long v23 = 0;
        }
        uint64_t v26 = [(CUIKEditingContext *)self group];
        id v27 = (id)[v26 oldObject:v22 didUpdateTo:v23];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v42 count:16];
    }
    while (v18);
  }

  [(CUIKEditingContext *)self setPendingGroupUpdates:0];
}

void __37__CUIKEditingContext_notifyObservers__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) observer];
  id v2 = (id)[v3 oldObject:*(void *)(a1 + 40) didUpdateTo:*(void *)(a1 + 48)];
}

- (void)trackedObjectsDidRevert:(id)a3
{
  id v4 = objc_alloc(MEMORY[0x1E4F1C978]);
  id v7 = [(CUIKEditingContext *)self group];
  uint64_t v5 = [v7 originalObjects];
  uint64_t v6 = (void *)[v4 initWithArray:v5 copyItems:1];
  [(CUIKEditingContext *)self setObjectsBeingEdited:v6];
}

+ (int64_t)spanFromSpanDecision:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return 0;
  }
  else {
    return qword_1BE0793C8[a3 - 1];
  }
}

+ (unint64_t)spanDecisionFromSpan:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return 4;
  }
  else {
    return qword_1BE0793E0[a3];
  }
}

- (CUIKEditingContextGroup)group
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_group);

  return (CUIKEditingContextGroup *)WeakRetained;
}

- (void)setGroup:(id)a3
{
}

- (CUIKEditingManager)editingManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editingManager);

  return (CUIKEditingManager *)WeakRetained;
}

- (void)setEditingManager:(id)a3
{
}

- (unint64_t)interfaceType
{
  return self->_interfaceType;
}

- (void)setInterfaceType:(unint64_t)a3
{
  self->_interfaceType = a3;
}

- (CUIKDecisionDelegate)decisionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_decisionDelegate);

  return (CUIKDecisionDelegate *)WeakRetained;
}

- (void)setDecisionDelegate:(id)a3
{
}

- (CUIKUndoDelegate)undoDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_undoDelegate);

  return (CUIKUndoDelegate *)WeakRetained;
}

- (void)setUndoDelegate:(id)a3
{
}

- (CUIKCommitDelegate)commitDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_commitDelegate);

  return (CUIKCommitDelegate *)WeakRetained;
}

- (void)setCommitDelegate:(id)a3
{
}

- (CUIKEditingContextObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);

  return (CUIKEditingContextObserver *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (BOOL)isOpen
{
  return self->_isOpen;
}

- (void)setIsOpen:(BOOL)a3
{
  self->_isOpen = a3;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 88, 1);
}

- (void)setError:(id)a3
{
}

- (NSSet)originalIdentifiersForObjectsBeingEdited
{
  return (NSSet *)objc_getProperty(self, a2, 96, 1);
}

- (void)setOriginalIdentifiersForObjectsBeingEdited:(id)a3
{
}

- (NSSet)originalEventOccurrenceIDsForObjectsBeingEdited
{
  return (NSSet *)objc_getProperty(self, a2, 104, 1);
}

- (void)setOriginalEventOccurrenceIDsForObjectsBeingEdited:(id)a3
{
}

- (NSArray)pendingObserverUpdates
{
  return (NSArray *)objc_getProperty(self, a2, 112, 1);
}

- (void)setPendingObserverUpdates:(id)a3
{
}

- (NSArray)pendingGroupUpdates
{
  return (NSArray *)objc_getProperty(self, a2, 120, 1);
}

- (void)setPendingGroupUpdates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingGroupUpdates, 0);
  objc_storeStrong((id *)&self->_pendingObserverUpdates, 0);
  objc_storeStrong((id *)&self->_originalEventOccurrenceIDsForObjectsBeingEdited, 0);
  objc_storeStrong((id *)&self->_originalIdentifiersForObjectsBeingEdited, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_destroyWeak((id *)&self->_commitDelegate);
  objc_destroyWeak((id *)&self->_undoDelegate);
  objc_destroyWeak((id *)&self->_decisionDelegate);
  objc_destroyWeak((id *)&self->_editingManager);
  objc_destroyWeak((id *)&self->_group);
  objc_storeStrong((id *)&self->_eventStore, 0);

  objc_storeStrong((id *)&self->_objectsBeingEdited, 0);
}

- (void)addAllObjects
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1BDF08000, v0, v1, "Context %@: addAllObjects", v2, v3, v4, v5, v6);
}

- (void)deleteAllObjects
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1BDF08000, v0, v1, "Context %@: deleteAllObjects", v2, v3, v4, v5, v6);
}

void __37__CUIKEditingContext__doManualDelete__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __37__CUIKEditingContext__doManualDelete__block_invoke_cold_2(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_1(&dword_1BDF08000, v1, v2, "Error removing account %{public}@: %@", (void)v3, DWORD2(v3));
}

- (void)saveCompleteChangeWithImpliedCommitDecisionAndClose:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1BDF08000, v0, v1, "Context %@: Saving+Committing", v2, v3, v4, v5, v6);
}

- (void)saveCompleteChangeAndClose:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1BDF08000, v0, v1, "Context %@: has changes requiring span to go from this-->all now", v2, v3, v4, v5, v6);
}

- (void)saveCompleteChangeAndClose:error:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1BDF08000, v0, v1, "Context %@: has changes requiring span to go from this-->all after save", v2, v3, v4, v5, v6);
}

- (void)saveCompleteChangeAndClose:error:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1BDF08000, v0, v1, "Context %@: No changes to save", v2, v3, v4, v5, v6);
}

- (void)saveCompleteChangeAndClose:error:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1BDF08000, v0, v1, "Context %@: saveCompleteChange", v2, v3, v4, v5, v6);
}

- (void)_requestSaveAndSpanDecisionIfNeededForAction:(uint64_t)a1 .cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1BDF08000, v1, v2, "Context %@: has diff summary %@", (void)v3, DWORD2(v3));
}

- (void)_requestSaveDecisionIfNeededForAction:diffSummary:delegate:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1BDF08000, v0, v1, "Context %@: decided not to save", v2, v3, v4, v5, v6);
}

- (void)_requestSpanDecisionIfNeededForAction:diffSummary:delegate:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BDF08000, v0, v1, "Context %@: chose span %lu");
}

- (void)_requestEarlyCommitDecisionAtSaveTimeForAction:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1BDF08000, v0, v1, "Context %@: decided not to commit", v2, v3, v4, v5, v6);
}

- (void)_requestCommitDecisionIfNeededForAction:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BDF08000, v0, v1, "Context %@: commit decision is %lu");
}

- (void)_earlyCommitDecisionSpecified
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8(&dword_1BDF08000, v0, v1, "Context %@: has an early commit decision specified? %d");
}

- (void)_specifyEarlyCommitDecision:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BDF08000, v0, v1, "Context %@: specifying early commit decision %lu");
}

- (void)revert:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1BDF08000, v0, v1, "Context %@: undoable revert", v2, v3, v4, v5, v6);
}

- (void)_prepareForCommitWithDecision:shouldClose:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8(&dword_1BDF08000, v0, v1, "Context %@: close context? %d");
}

- (void)_prepareForCommitWithDecision:shouldClose:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1BDF08000, v0, v1, "Context %@: aborting and reverting commit", v2, v3, v4, v5, v6);
}

- (void)_prepareForCommitWithDecision:shouldClose:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1BDF08000, v0, v1, "Context %@: continuing to edit", v2, v3, v4, v5, v6);
}

- (void)_prepareForCommitWithDecision:shouldClose:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1BDF08000, v0, v1, "Context %@: cancelled commit", v2, v3, v4, v5, v6);
}

- (void)_prepareForCommitWithDecision:shouldClose:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1BDF08000, v0, v1, "Context %@: reverting", v2, v3, v4, v5, v6);
}

- (void)_prepareForCommitWithDecision:shouldClose:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1BDF08000, v0, v1, "Context %@: deleting", v2, v3, v4, v5, v6);
}

- (void)_prepareForCommitWithDecision:shouldClose:.cold.7()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1BDF08000, v0, v1, "Context %@: committing without notifying", v2, v3, v4, v5, v6);
}

- (void)_prepareForCommitWithDecision:shouldClose:.cold.8()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BDF08000, v0, v1, "Context %@: preparing to commit (%lu)");
}

- (void)performUndoableOperation:(uint64_t)a1 .cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1BDF08000, v1, v2, "Context %@ performing operation %@", (void)v3, DWORD2(v3));
}

- (void)trackedObjectsDidUpdate:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1BDF08000, log, OS_LOG_TYPE_DEBUG, "Context received trackedObjectsDidUpdate", v1, 2u);
}

@end