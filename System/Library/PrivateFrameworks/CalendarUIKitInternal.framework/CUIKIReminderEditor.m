@interface CUIKIReminderEditor
- (BOOL)_saveChangesToEvents:(id)a3 error:(id *)a4;
- (BOOL)calendarUsesEditor:(id)a3;
- (BOOL)commitEventForOOPModificationRecording:(id)a3 error:(id *)a4;
- (BOOL)deleteEvent:(id)a3 span:(int64_t)a4 error:(id *)a5;
- (BOOL)eventUsesEditor:(id)a3;
- (BOOL)saveCalendar:(id)a3 error:(id *)a4;
- (BOOL)saveEvent:(id)a3 span:(int64_t)a4 error:(id *)a5;
- (BOOL)saveEventForOOPModificationRecording:(id)a3 span:(int64_t)a4 error:(id *)a5;
- (BOOL)saveNewEvents:(id)a3 commit:(BOOL)a4 error:(id *)a5;
- (BOOL)sourceUsesEditor:(id)a3;
- (CUIKIReminderEditor)initWithEventStore:(id)a3 undoManager:(id)a4 alertDisplayer:(id)a5 pendingReminderTracker:(id)a6;
- (void)deleteCalendar:(id)a3 forEntityType:(unint64_t)a4;
- (void)deleteEvents:(id)a3;
- (void)deleteEvents:(id)a3 resultHandler:(id)a4;
- (void)deleteEvents:(id)a3 span:(int64_t)a4;
- (void)deleteEvents:(id)a3 span:(int64_t)a4 result:(id)a5;
- (void)performWithOptions:(id)a3 block:(id)a4;
- (void)saveChangesToEvents:(id)a3 impliedCommitDecision:(BOOL)a4;
- (void)saveChangesToEvents:(id)a3 span:(int64_t)a4;
@end

@implementation CUIKIReminderEditor

- (CUIKIReminderEditor)initWithEventStore:(id)a3 undoManager:(id)a4 alertDisplayer:(id)a5 pendingReminderTracker:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CUIKIReminderEditor;
  v14 = [(CUIKIReminderEditor *)&v18 init];
  if (v14)
  {
    v15 = [[_TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation alloc] initWithEventStore:v10 alertDisplayer:v12 undoManager:v11 changeTracker:v13];
    reminderEditor = v14->_reminderEditor;
    v14->_reminderEditor = v15;
  }
  return v14;
}

- (void)saveChangesToEvents:(id)a3 impliedCommitDecision:(BOOL)a4
{
}

- (void)saveChangesToEvents:(id)a3 span:(int64_t)a4
{
}

- (BOOL)_saveChangesToEvents:(id)a3 error:(id *)a4
{
  reminderEditor = self->_reminderEditor;
  v6 = [a3 allObjects];
  LOBYTE(a4) = [(CUIKIReminderEditorImplementation *)reminderEditor saveChangesToEvents:v6 error:a4];

  return (char)a4;
}

- (void)deleteEvents:(id)a3 resultHandler:(id)a4
{
  id v6 = a4;
  reminderEditor = self->_reminderEditor;
  v8 = [a3 allObjects];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __50__CUIKIReminderEditor_deleteEvents_resultHandler___block_invoke;
  v10[3] = &unk_2652615C0;
  id v11 = v6;
  id v9 = v6;
  [(CUIKIReminderEditorImplementation *)reminderEditor delete:v8 completionHandler:v10];
}

uint64_t __50__CUIKIReminderEditor_deleteEvents_resultHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)saveNewEvents:(id)a3 commit:(BOOL)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v28;
    uint64_t v11 = 1;
    do
    {
      uint64_t v12 = 0;
      uint64_t v13 = v11;
      do
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v7);
        }
        v14 = *(void **)(*((void *)&v27 + 1) + 8 * v12);
        v15 = [v14 eventStore];
        id v26 = 0;
        int v16 = [v15 saveEvent:v14 span:0 commit:0 error:&v26];
        id v17 = v26;

        uint64_t v11 = 0;
        if (v16)
        {
          [v6 addObject:v14];
          uint64_t v11 = v13;
        }

        ++v12;
        uint64_t v13 = v11;
      }
      while (v9 != v12);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v9);
  }
  else
  {
    LOBYTE(v11) = 1;
  }

  if ([v6 count])
  {
    objc_super v18 = [v6 firstObject];
    v19 = [v18 eventStore];

    v20 = [v19 uniqueIdentifiersForAllObjectsWithChangesRelatedToObjects:v6];
    if ([v20 count])
    {
      v21 = (void *)MEMORY[0x263EFF9A0];
      uint64_t v31 = *MEMORY[0x263F304B0];
      v32 = v20;
      v22 = [NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      v23 = [v21 dictionaryWithDictionary:v22];
    }
    else
    {
      v23 = 0;
    }
    v24 = [MEMORY[0x263F08A00] defaultCenter];
    [v24 postNotificationName:*MEMORY[0x263F304A8] object:v19 userInfo:v23];
  }
  return v11 & 1;
}

- (BOOL)saveEvent:(id)a3 span:(int64_t)a4 error:(id *)a5
{
  id v7 = a3;
  uint64_t v8 = v7;
  if (v7)
  {
    int v9 = [v7 isNew];
    uint64_t v10 = [MEMORY[0x263EFFA08] setWithObject:v8];
    if (v9) {
      BOOL v11 = [(CUIKIReminderEditor *)self saveNewEvents:v10 commit:1 error:a5];
    }
    else {
      BOOL v11 = [(CUIKIReminderEditor *)self _saveChangesToEvents:v10 error:a5];
    }
    BOOL v12 = v11;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
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
  id v7 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObject:", a3, a4, a5);
  [(CUIKIReminderEditor *)self deleteEvents:v7 span:a4];

  return 1;
}

- (void)deleteEvents:(id)a3
{
}

- (void)deleteEvents:(id)a3 span:(int64_t)a4
{
}

- (void)deleteEvents:(id)a3 span:(int64_t)a4 result:(id)a5
{
}

- (BOOL)saveCalendar:(id)a3 error:(id *)a4
{
  id v5 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObject:", a3, a4);
  [(CUIKIReminderEditor *)self saveCalendars:v5];

  return 1;
}

- (void)deleteCalendar:(id)a3 forEntityType:(unint64_t)a4
{
  objc_msgSend(MEMORY[0x263EFFA08], "setWithObject:", a3, a4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(CUIKIReminderEditor *)self deleteCalendars:v5];
}

- (BOOL)eventUsesEditor:(id)a3
{
  return [a3 isIntegrationEvent];
}

- (BOOL)calendarUsesEditor:(id)a3
{
  return 0;
}

- (BOOL)sourceUsesEditor:(id)a3
{
  return 0;
}

- (void)performWithOptions:(id)a3 block:(id)a4
{
  uint64_t v10 = (void (**)(void))a4;
  reminderEditor = self->_reminderEditor;
  id v7 = a3;
  uint64_t v8 = [(CUIKIReminderEditorImplementation *)reminderEditor alertDisplayer];
  int v9 = [v7 objectForKeyedSubscript:*MEMORY[0x263F304A0]];

  if (v9)
  {
    [(CUIKIReminderEditorImplementation *)self->_reminderEditor setAlertDisplayer:v9];
    v10[2]();
    [(CUIKIReminderEditorImplementation *)self->_reminderEditor setAlertDisplayer:v8];
  }
  else
  {
    v10[2]();
  }
}

- (void).cxx_destruct
{
}

@end