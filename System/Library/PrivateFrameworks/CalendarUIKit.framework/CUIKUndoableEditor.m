@interface CUIKUndoableEditor
- (BOOL)_saveChangesToEvents:(id)a3 span:(int64_t)a4 impliedCommitDecision:(BOOL)a5 error:(id *)a6;
- (BOOL)calendarUsesEditor:(id)a3;
- (BOOL)commitEventForOOPModificationRecording:(id)a3 error:(id *)a4;
- (BOOL)deleteEvent:(id)a3 span:(int64_t)a4 error:(id *)a5;
- (BOOL)eventUsesEditor:(id)a3;
- (BOOL)saveCalendar:(id)a3 error:(id *)a4;
- (BOOL)saveEvent:(id)a3 span:(int64_t)a4 error:(id *)a5;
- (BOOL)saveEventForOOPModificationRecording:(id)a3 span:(int64_t)a4 error:(id *)a5;
- (BOOL)saveNewEvents:(id)a3 commit:(BOOL)a4 error:(id *)a5;
- (BOOL)sourceUsesEditor:(id)a3;
- (CUIKCommitDelegate)commitDelegate;
- (CUIKDecisionDelegate)decisionDelegate;
- (CUIKUndoDelegate)undoDelegate;
- (CUIKUndoableEditor)initWithEditingManager:(id)a3;
- (id)_openEditingContextForObjects:(id)a3;
- (void)deleteCalendar:(id)a3 forEntityType:(unint64_t)a4;
- (void)deleteCalendars:(id)a3;
- (void)deleteEvents:(id)a3;
- (void)deleteEvents:(id)a3 span:(int64_t)a4;
- (void)deleteEvents:(id)a3 span:(int64_t)a4 result:(id)a5;
- (void)deleteSources:(id)a3;
- (void)performWithOptions:(id)a3 block:(id)a4;
- (void)saveCalendars:(id)a3;
- (void)saveChangesToEvents:(id)a3 impliedCommitDecision:(BOOL)a4;
- (void)saveChangesToEvents:(id)a3 span:(int64_t)a4;
- (void)saveChangesToSources:(id)a3;
- (void)saveNewSources:(id)a3 commit:(BOOL)a4;
- (void)setCommitDelegate:(id)a3;
- (void)setDecisionDelegate:(id)a3;
- (void)setUndoDelegate:(id)a3;
@end

@implementation CUIKUndoableEditor

- (void)setUndoDelegate:(id)a3
{
}

- (CUIKUndoableEditor)initWithEditingManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CUIKUndoableEditor;
  v6 = [(CUIKUndoableEditor *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_editingManager, a3);
  }

  return v7;
}

- (id)_openEditingContextForObjects:(id)a3
{
  editingManager = self->_editingManager;
  id v5 = [a3 allObjects];
  v6 = [(CUIKEditingManager *)editingManager openEditingContextWithObjects:v5 interfaceType:0];

  v7 = [(CUIKUndoableEditor *)self decisionDelegate];
  [v6 setDecisionDelegate:v7];

  v8 = [(CUIKUndoableEditor *)self undoDelegate];
  [v6 setUndoDelegate:v8];

  objc_super v9 = [(CUIKUndoableEditor *)self commitDelegate];
  [v6 setCommitDelegate:v9];

  return v6;
}

- (void)saveChangesToEvents:(id)a3 impliedCommitDecision:(BOOL)a4
{
}

- (void)saveChangesToEvents:(id)a3 span:(int64_t)a4
{
}

- (BOOL)_saveChangesToEvents:(id)a3 span:(int64_t)a4 impliedCommitDecision:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  objc_super v9 = [(CUIKUndoableEditor *)self _openEditingContextForObjects:a3];
  if (a4 != -1) {
    objc_msgSend(v9, "_specifySpanDecision:", +[CUIKEditingContext spanDecisionFromSpan:](CUIKEditingContext, "spanDecisionFromSpan:", a4));
  }
  if (v7) {
    char v10 = [v9 saveCompleteChangeWithImpliedCommitDecisionAndClose:1 error:a6];
  }
  else {
    char v10 = [v9 saveCompleteChangeAndClose:1 error:a6];
  }
  BOOL v11 = v10;

  return v11;
}

- (void)deleteEvents:(id)a3
{
}

- (void)saveCalendars:(id)a3
{
  id v4 = [(CUIKUndoableEditor *)self _openEditingContextForObjects:a3];
  [v4 saveCompleteChange];
  [(CUIKEditingManager *)self->_editingManager closeEditingContext:v4];
}

- (void)deleteCalendars:(id)a3
{
  id v4 = [(CUIKUndoableEditor *)self _openEditingContextForObjects:a3];
  [v4 deleteAllObjects];
  [(CUIKEditingManager *)self->_editingManager closeEditingContext:v4];
}

- (void)saveNewSources:(id)a3 commit:(BOOL)a4
{
  -[CUIKUndoableEditor _openEditingContextForObjects:](self, "_openEditingContextForObjects:", a3, a4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 addAllObjects];
  [(CUIKEditingManager *)self->_editingManager closeEditingContext:v5];
}

- (void)saveChangesToSources:(id)a3
{
  id v4 = [(CUIKUndoableEditor *)self _openEditingContextForObjects:a3];
  [v4 saveCompleteChange];
  [(CUIKEditingManager *)self->_editingManager closeEditingContext:v4];
}

- (void)deleteSources:(id)a3
{
  id v4 = [(CUIKUndoableEditor *)self _openEditingContextForObjects:a3];
  [v4 deleteAllObjects];
  [(CUIKEditingManager *)self->_editingManager closeEditingContext:v4];
}

- (BOOL)eventUsesEditor:(id)a3
{
  return [a3 isIntegrationEvent] ^ 1;
}

- (BOOL)calendarUsesEditor:(id)a3
{
  return 1;
}

- (BOOL)sourceUsesEditor:(id)a3
{
  return 1;
}

- (BOOL)saveNewEvents:(id)a3 commit:(BOOL)a4 error:(id *)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if ([v8 count])
  {
    v27 = a5;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v29 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          v15 = objc_msgSend(v14, "startDate", v27);

          if (!v15)
          {
            v16 = [MEMORY[0x1E4F1C9C8] nextRoundedHour];
            [v14 setStartDate:v16];
          }
          v17 = [v14 endDateUnadjustedForLegacyClients];

          if (!v17)
          {
            v18 = [v14 startDate];
            v19 = [v18 dateByAddingHours:1 inCalendar:0];
            [v14 setEndDateUnadjustedForLegacyClients:v19];
          }
          v20 = [v14 calendar];

          if (!v20)
          {
            v21 = [v14 eventStore];
            v22 = [v21 acquireDefaultCalendarForNewEvents];
            [v14 setCalendar:v22];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v11);
    }

    v23 = [(CUIKUndoableEditor *)self _openEditingContextForObjects:v9];
    if ([v23 addAllObjects]) {
      char v24 = [v23 savePartialChange];
    }
    else {
      char v24 = 0;
    }
    if (v27 && (v24 & 1) == 0)
    {
      id *v27 = [v23 error];
    }
    editingManager = self->_editingManager;
    if (a4) {
      [(CUIKEditingManager *)editingManager closeEditingContext:v23];
    }
    else {
      [(CUIKEditingManager *)editingManager closeEditingContextWithoutCommittingChanges:v23];
    }
  }
  else
  {
    char v24 = 1;
  }

  return v24;
}

- (BOOL)saveEvent:(id)a3 span:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = v8;
  if (v8)
  {
    int v10 = [v8 isNew];
    uint64_t v11 = [MEMORY[0x1E4F1CAD0] setWithObject:v9];
    if (v10) {
      BOOL v12 = [(CUIKUndoableEditor *)self saveNewEvents:v11 commit:1 error:a5];
    }
    else {
      BOOL v12 = [(CUIKUndoableEditor *)self _saveChangesToEvents:v11 span:a4 impliedCommitDecision:0 error:a5];
    }
    BOOL v13 = v12;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)saveEventForOOPModificationRecording:(id)a3 span:(int64_t)a4 error:(id *)a5
{
  return 0;
}

- (BOOL)commitEventForOOPModificationRecording:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)deleteEvent:(id)a3 span:(int64_t)a4 error:(id *)a5
{
  BOOL v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObject:", a3, a4, a5);
  [(CUIKUndoableEditor *)self deleteEvents:v7 span:a4];

  return 1;
}

- (void)deleteEvents:(id)a3 span:(int64_t)a4
{
  id v6 = [(CUIKUndoableEditor *)self _openEditingContextForObjects:a3];
  if (a4 != -1) {
    objc_msgSend(v6, "_specifySpanDecision:", +[CUIKEditingContext spanDecisionFromSpan:](CUIKEditingContext, "spanDecisionFromSpan:", a4));
  }
  [v6 deleteAllObjects];
  [(CUIKEditingManager *)self->_editingManager closeEditingContext:v6];
}

- (void)deleteEvents:(id)a3 span:(int64_t)a4 result:(id)a5
{
  id v9 = a5;
  [(CUIKUndoableEditor *)self deleteEvents:a3 span:a4];
  id v8 = v9;
  if (v9)
  {
    (*((void (**)(id, uint64_t, void))v9 + 2))(v9, 1, 0);
    id v8 = v9;
  }
}

- (BOOL)saveCalendar:(id)a3 error:(id *)a4
{
  id v5 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObject:", a3, a4);
  [(CUIKUndoableEditor *)self saveCalendars:v5];

  return 1;
}

- (void)deleteCalendar:(id)a3 forEntityType:(unint64_t)a4
{
  objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObject:", a3, a4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(CUIKUndoableEditor *)self deleteCalendars:v5];
}

- (void)performWithOptions:(id)a3 block:(id)a4
{
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

- (CUIKCommitDelegate)commitDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_commitDelegate);

  return (CUIKCommitDelegate *)WeakRetained;
}

- (void)setCommitDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_commitDelegate);
  objc_destroyWeak((id *)&self->_undoDelegate);
  objc_destroyWeak((id *)&self->_decisionDelegate);

  objc_storeStrong((id *)&self->_editingManager, 0);
}

@end