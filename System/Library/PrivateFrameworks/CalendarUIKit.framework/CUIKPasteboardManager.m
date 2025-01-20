@interface CUIKPasteboardManager
+ (id)_pasteboardItemForEvent:(id)a3;
- (BOOL)_calendarIsPasteableTo:(id)a3 allCalendars:(id)a4;
- (BOOL)canPerformPaste;
- (CGColor)colorOfCalendarToPasteTo;
- (CUIKPasteboardManager)initWithEventStoreProvider:(id)a3 pasteboard:(id)a4 calendarProvider:(id)a5;
- (id)_eventsFromPasteboard:(id)a3;
- (id)calendarToPasteTo;
- (id)calendarToPasteToWithEvents:(id)a3;
- (id)eventsFromPasteboard;
- (unint64_t)numberOfEventsToPaste;
- (void)_copyEvents:(id)a3 toDict:(id)a4;
- (void)_cutEvents:(id)a3 editor:(id)a4;
- (void)_pasteEvents:(id)a3 atDate:(id)a4 dateMode:(unint64_t)a5 pasteDelegate:(id)a6 duplicate:(BOOL)a7;
- (void)_saveNewEventsOrOpenEditor:(id)a3 pasteDelegate:(id)a4 duplicate:(BOOL)a5;
- (void)_validateAction:(unint64_t)a3 forEvents:(id)a4 delegate:(id)a5 completion:(id)a6;
- (void)copyEvents:(id)a3 delegate:(id)a4;
- (void)cutEvents:(id)a3 delegate:(id)a4;
- (void)duplicateEvents:(id)a3 withDateMode:(unint64_t)a4 delegate:(id)a5;
- (void)pasteEventsWithDateMode:(unint64_t)a3 delegate:(id)a4;
- (void)setCalendarForPaste:(id)a3;
- (void)setDateForPaste:(id)a3;
@end

@implementation CUIKPasteboardManager

- (void)setDateForPaste:(id)a3
{
}

- (CUIKPasteboardManager)initWithEventStoreProvider:(id)a3 pasteboard:(id)a4 calendarProvider:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CUIKPasteboardManager;
  v11 = [(CUIKPasteboardManager *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_eventStoreProvider, v8);
    objc_storeStrong((id *)&v12->_pasteboard, a4);
    objc_storeWeak((id *)&v12->_calendarProvider, v10);
    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    copiedEvents = v12->_copiedEvents;
    v12->_copiedEvents = (NSMutableDictionary *)v13;
  }
  return v12;
}

- (void)cutEvents:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__CUIKPasteboardManager_cutEvents_delegate___block_invoke;
  v10[3] = &unk_1E636A6A8;
  id v11 = v7;
  v12 = self;
  id v13 = v6;
  id v8 = v6;
  id v9 = v7;
  [(CUIKPasteboardManager *)self _validateAction:0 forEvents:v8 delegate:v9 completion:v10];
}

void __44__CUIKPasteboardManager_cutEvents_delegate___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) editorForPasteboardManager:*(void *)(a1 + 40)];
    [*(id *)(a1 + 40) _cutEvents:*(void *)(a1 + 48) editor:v3];
  }
}

- (void)_cutEvents:(id)a3 editor:(id)a4
{
  copiedEvents = self->_copiedEvents;
  id v7 = a4;
  id v8 = a3;
  [(CUIKPasteboardManager *)self _copyEvents:v8 toDict:copiedEvents];
  [v7 deleteEvents:v8 span:0];
}

- (void)copyEvents:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__CUIKPasteboardManager_copyEvents_delegate___block_invoke;
  v8[3] = &unk_1E636A6D0;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(CUIKPasteboardManager *)self _validateAction:1 forEvents:v7 delegate:a4 completion:v8];
}

uint64_t __45__CUIKPasteboardManager_copyEvents_delegate___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _copyEvents:*(void *)(result + 40) toDict:*(void *)(*(void *)(result + 32) + 32)];
  }
  return result;
}

- (void)_copyEvents:(id)a3 toDict:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [v7 removeAllObjects];
  [(CUIKPasteboardManager *)self setDateForPaste:0];
  [(CUIKPasteboardManager *)self setCalendarForPaste:0];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        v14 = [v13 eventOccurrenceID];
        v15 = [v13 duplicate];
        [v7 setObject:v15 forKeyedSubscript:v14];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v10);
  }

  objc_super v16 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:1];
  v35 = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
  v18 = [v8 sortedArrayUsingDescriptors:v17];

  v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v18, "count"));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v20 = v18;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v27 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = objc_msgSend((id)objc_opt_class(), "_pasteboardItemForEvent:", *(void *)(*((void *)&v26 + 1) + 8 * j), (void)v26);
        [v19 addObject:v25];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v22);
  }

  [(CUIKPasteboard *)self->_pasteboard setItems:v19];
}

- (void)setCalendarForPaste:(id)a3
{
}

- (BOOL)_calendarIsPasteableTo:(id)a3 allCalendars:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 allowsContentModifications]) {
    char v7 = [v6 containsObject:v5];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (id)calendarToPasteTo
{
  id v3 = [(CUIKPasteboardManager *)self _eventsFromPasteboard:self->_pasteboard];
  v4 = [(CUIKPasteboardManager *)self calendarToPasteToWithEvents:v3];

  return v4;
}

- (id)calendarToPasteToWithEvents:(id)a3
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_eventStoreProvider);
  id v6 = [WeakRetained eventStore];
  char v7 = [v6 calendarsForEntityType:0];

  calendarForPaste = self->_calendarForPaste;
  if (calendarForPaste
    && [(CUIKPasteboardManager *)self _calendarIsPasteableTo:calendarForPaste allCalendars:v7])
  {
    uint64_t v9 = self->_calendarForPaste;
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:1];
    v28[0] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
    v12 = [v4 sortedArrayUsingDescriptors:v11];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          v19 = objc_msgSend(v18, "calendar", (void)v23);
          BOOL v20 = [(CUIKPasteboardManager *)self _calendarIsPasteableTo:v19 allCalendars:v7];

          if (v20)
          {
            uint64_t v9 = [v18 calendar];
            id v21 = v13;
            goto LABEL_14;
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    id v21 = objc_loadWeakRetained((id *)&self->_calendarProvider);
    uint64_t v9 = [v21 defaultCalendarForNewEvents];
LABEL_14:
  }

  return v9;
}

- (BOOL)canPerformPaste
{
  if (![(CUIKPasteboardManager *)self numberOfEventsToPaste]) {
    return 0;
  }
  id v3 = [(CUIKPasteboardManager *)self calendarToPasteTo];
  BOOL v4 = v3 != 0;

  return v4;
}

- (unint64_t)numberOfEventsToPaste
{
  v7[1] = *MEMORY[0x1E4F143B8];
  pasteboard = self->_pasteboard;
  v7[0] = @"com.apple.calendar.pasteboard.event";
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  BOOL v4 = [(CUIKPasteboard *)pasteboard itemSetWithPasteboardTypes:v3];

  unint64_t v5 = [v4 count];
  return v5;
}

- (void)pasteEventsWithDateMode:(unint64_t)a3 delegate:(id)a4
{
  pasteboard = self->_pasteboard;
  id v7 = a4;
  id v8 = [(CUIKPasteboardManager *)self _eventsFromPasteboard:pasteboard];
  [(CUIKPasteboardManager *)self _pasteEvents:v8 atDate:self->_dateForPaste dateMode:a3 pasteDelegate:v7 duplicate:0];
}

- (void)duplicateEvents:(id)a3 withDateMode:(unint64_t)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__CUIKPasteboardManager_duplicateEvents_withDateMode_delegate___block_invoke;
  v12[3] = &unk_1E636A6F8;
  v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  unint64_t v15 = a4;
  id v10 = v9;
  id v11 = v8;
  [(CUIKPasteboardManager *)self _validateAction:2 forEvents:v11 delegate:v10 completion:v12];
}

uint64_t __63__CUIKPasteboardManager_duplicateEvents_withDateMode_delegate___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _pasteEvents:*(void *)(result + 40) atDate:*(void *)(*(void *)(result + 32) + 48) dateMode:*(void *)(result + 56) pasteDelegate:*(void *)(result + 48) duplicate:1];
  }
  return result;
}

- (void)_pasteEvents:(id)a3 atDate:(id)a4 dateMode:(unint64_t)a5 pasteDelegate:(id)a6 duplicate:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  id v17 = [(CUIKPasteboardManager *)self calendarToPasteToWithEvents:v14];
  unint64_t v15 = +[CUIKPasteboardUtilities duplicateEventsByStrippingUnsupportedFields:v14 toNewCalendar:v17];

  uint64_t v16 = CUIKCalendar();
  +[CUIKPasteboardUtilities adjustTimesForEventsToPaste:v15 pasteDate:v13 dateMode:a5 calendar:v16];

  [(CUIKPasteboardManager *)self _saveNewEventsOrOpenEditor:v15 pasteDelegate:v12 duplicate:v7];
}

- (void)_saveNewEventsOrOpenEditor:(id)a3 pasteDelegate:(id)a4 duplicate:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v42 = self;
  id v10 = [v9 editorForPasteboardManager:self];
  id v11 = objc_opt_new();
  id v12 = objc_opt_new();
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v13 = v8;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v51 objects:v55 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v52 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        if ([v18 hasAttendees]) {
          v19 = v12;
        }
        else {
          v19 = v11;
        }
        [v19 addObject:v18];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v51 objects:v55 count:16];
    }
    while (v15);
  }

  if ((unint64_t)[v12 count] >= 2)
  {
    BOOL v20 = CUIKBundle();
    id v21 = v20;
    if (v5)
    {
      uint64_t v22 = v9;
      uint64_t v23 = [v20 localizedStringForKey:@"You’re duplicating multiple events with attendees." value:&stru_1F187C430 table:0];

      long long v24 = CUIKBundle();
      uint64_t v25 = [v24 localizedStringForKey:@"More than one of the events you are trying to duplicate has attendees." value:&stru_1F187C430 table:0];

      long long v26 = CUIKBundle();
      long long v27 = v26;
      long long v28 = @"Duplicate And Send Invitations";
    }
    else
    {
      uint64_t v22 = v9;
      uint64_t v23 = [v20 localizedStringForKey:@"You’re pasting multiple events with attendees." value:&stru_1F187C430 table:0];

      long long v30 = CUIKBundle();
      uint64_t v25 = [v30 localizedStringForKey:@"More than one of the events you are trying to paste has attendees." value:&stru_1F187C430 table:0];

      long long v26 = CUIKBundle();
      long long v27 = v26;
      long long v28 = @"Paste And Send Invitations";
    }
    v38 = [v26 localizedStringForKey:v28 value:&stru_1F187C430 table:0];
    v40 = (void *)v25;
    v41 = (void *)v23;

    long long v31 = +[CUIKAlertController alertControllerWithTitle:v23 message:v25];
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __76__CUIKPasteboardManager__saveNewEventsOrOpenEditor_pasteDelegate_duplicate___block_invoke;
    v46[3] = &unk_1E636A720;
    id v47 = v10;
    id v48 = v13;
    v39 = v22;
    id v32 = v22;
    id v49 = v32;
    v50 = v42;
    long long v33 = +[CUIKAlertAction actionWithTitle:v38 style:0 handler:v46];
    [v31 addAction:v33];
    v34 = CUIKBundle();
    v35 = [v34 localizedStringForKey:@"Cancel" value:&stru_1F187C430 table:0];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __76__CUIKPasteboardManager__saveNewEventsOrOpenEditor_pasteDelegate_duplicate___block_invoke_2;
    v43[3] = &unk_1E636A748;
    id v36 = v32;
    id v44 = v36;
    v45 = v42;
    uint64_t v37 = +[CUIKAlertAction actionWithTitle:v35 style:1 handler:v43];

    long long v29 = v41;
    [v31 addAction:v37];
    [v36 pasteboardManager:v42 presentAlert:v31];

    id v9 = v39;
    goto LABEL_20;
  }
  [v10 saveNewEvents:v11 commit:1 error:0];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v9, "pasteboardManager:didFinishPasteWithResult:willOpenEditor:", v42, 0, objc_msgSend(v12, "count") != 0);
  }
  if ([v12 count] == 1)
  {
    long long v29 = [v12 anyObject];
    [v9 pasteboardManager:v42 beginEditingEvent:v29];
LABEL_20:
  }
}

uint64_t __76__CUIKPasteboardManager__saveNewEventsOrOpenEditor_pasteDelegate_duplicate___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) saveNewEvents:*(void *)(a1 + 40) commit:1 error:0];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v3 = *(void **)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 56);
    return [v3 pasteboardManager:v4 didFinishPasteWithResult:0 willOpenEditor:1];
  }
  return result;
}

uint64_t __76__CUIKPasteboardManager__saveNewEventsOrOpenEditor_pasteDelegate_duplicate___block_invoke_2(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 pasteboardManager:v4 didFinishPasteWithResult:1 willOpenEditor:0];
  }
  return result;
}

- (void)_validateAction:(unint64_t)a3 forEvents:(id)a4 delegate:(id)a5 completion:(id)a6
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  uint64_t v13 = [v10 countByEnumeratingWithState:&v68 objects:v72 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = 0;
    uint64_t v16 = *(void *)v69;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v69 != v16) {
          objc_enumerationMutation(v10);
        }
        v15 += [*(id *)(*((void *)&v68 + 1) + 8 * i) isOnlyOccurrence] ^ 1;
      }
      uint64_t v14 = [v10 countByEnumeratingWithState:&v68 objects:v72 count:16];
    }
    while (v14);
    if (v15 >= 1)
    {
      long long v53 = self;
      v18 = +[CUIKAlertController alertControllerWithTitle:0 message:0];
      v19 = CUIKBundle();
      BOOL v20 = [v19 localizedStringForKey:@"Cancel" value:&stru_1F187C430 table:0];
      v66[0] = MEMORY[0x1E4F143A8];
      v66[1] = 3221225472;
      v66[2] = __71__CUIKPasteboardManager__validateAction_forEvents_delegate_completion___block_invoke;
      v66[3] = &unk_1E636A770;
      id v21 = v12;
      id v67 = v21;
      uint64_t v22 = +[CUIKAlertAction actionWithTitle:v20 style:1 handler:v66];

      [v18 addAction:v22];
      if (a3)
      {
        if (a3 == 2)
        {
          v38 = CUIKBundle();
          v39 = v38;
          if (v15 == 1)
          {
            v40 = [v38 localizedStringForKey:@"You’re duplicating an event." value:&stru_1F187C430 table:0];
            [v18 setTitle:v40];

            v41 = CUIKBundle();
            v42 = [v41 localizedStringForKey:@"This event is an occurrence of a repeating event. Calendar will duplicate only this selected occurrence." value:&stru_1F187C430 table:0];
            [v18 setMessage:v42];

            long long v29 = CUIKBundle();
            long long v30 = [v29 localizedStringForKey:@"Duplicate This Event" value:&stru_1F187C430 table:0];
            v54[0] = MEMORY[0x1E4F143A8];
            v54[1] = 3221225472;
            v54[2] = __71__CUIKPasteboardManager__validateAction_forEvents_delegate_completion___block_invoke_7;
            v54[3] = &unk_1E636A770;
            long long v31 = &v55;
            id v55 = v21;
            id v32 = v54;
          }
          else
          {
            v46 = [v38 localizedStringForKey:@"You’re duplicating events." value:&stru_1F187C430 table:0];
            [v18 setTitle:v46];

            id v47 = CUIKBundle();
            id v48 = [v47 localizedStringForKey:@"Some of the selected events are repeating events. Calendar will duplicate only the selected occurrences of these events." value:&stru_1F187C430 table:0];
            [v18 setMessage:v48];

            long long v29 = CUIKBundle();
            long long v30 = [v29 localizedStringForKey:@"Duplicate These Events" value:&stru_1F187C430 table:0];
            v56[0] = MEMORY[0x1E4F143A8];
            v56[1] = 3221225472;
            v56[2] = __71__CUIKPasteboardManager__validateAction_forEvents_delegate_completion___block_invoke_6;
            v56[3] = &unk_1E636A770;
            long long v31 = &v57;
            id v57 = v21;
            id v32 = v56;
          }
        }
        else
        {
          uint64_t v23 = v53;
          if (a3 != 1)
          {
LABEL_23:
            [v11 pasteboardManager:v23 presentAlert:v18];

            goto LABEL_24;
          }
          long long v24 = CUIKBundle();
          uint64_t v25 = v24;
          if (v15 == 1)
          {
            long long v26 = [v24 localizedStringForKey:@"You’re copying an event." value:&stru_1F187C430 table:0];
            [v18 setTitle:v26];

            long long v27 = CUIKBundle();
            long long v28 = [v27 localizedStringForKey:@"This event is an occurrence of a repeating event. Calendar will copy only this selected occurrence." value:&stru_1F187C430 table:0];
            [v18 setMessage:v28];

            long long v29 = CUIKBundle();
            long long v30 = [v29 localizedStringForKey:@"Copy This Event" value:&stru_1F187C430 table:0];
            v62[0] = MEMORY[0x1E4F143A8];
            v62[1] = 3221225472;
            v62[2] = __71__CUIKPasteboardManager__validateAction_forEvents_delegate_completion___block_invoke_3;
            v62[3] = &unk_1E636A770;
            long long v31 = &v63;
            id v63 = v21;
            id v32 = v62;
          }
          else
          {
            id v49 = [v24 localizedStringForKey:@"You’re copying events." value:&stru_1F187C430 table:0];
            [v18 setTitle:v49];

            v50 = CUIKBundle();
            long long v51 = [v50 localizedStringForKey:@"Some of the selected events are repeating events. Calendar will copy only the selected occurrences of these events." value:&stru_1F187C430 table:0];
            [v18 setMessage:v51];

            long long v29 = CUIKBundle();
            long long v30 = [v29 localizedStringForKey:@"Copy These Events" value:&stru_1F187C430 table:0];
            v64[0] = MEMORY[0x1E4F143A8];
            v64[1] = 3221225472;
            v64[2] = __71__CUIKPasteboardManager__validateAction_forEvents_delegate_completion___block_invoke_2;
            v64[3] = &unk_1E636A770;
            long long v31 = &v65;
            id v65 = v21;
            id v32 = v64;
          }
        }
      }
      else
      {
        long long v33 = CUIKBundle();
        v34 = v33;
        if (v15 == 1)
        {
          v35 = [v33 localizedStringForKey:@"You’re cutting an event." value:&stru_1F187C430 table:0];
          [v18 setTitle:v35];

          id v36 = CUIKBundle();
          uint64_t v37 = [v36 localizedStringForKey:@"This event is an occurrence of a repeating event. Calendar will cut only this selected occurrence." value:&stru_1F187C430 table:0];
          [v18 setMessage:v37];

          long long v29 = CUIKBundle();
          long long v30 = [v29 localizedStringForKey:@"Cut This Event" value:&stru_1F187C430 table:0];
          v58[0] = MEMORY[0x1E4F143A8];
          v58[1] = 3221225472;
          v58[2] = __71__CUIKPasteboardManager__validateAction_forEvents_delegate_completion___block_invoke_5;
          v58[3] = &unk_1E636A770;
          long long v31 = &v59;
          id v59 = v21;
          id v32 = v58;
        }
        else
        {
          v43 = [v33 localizedStringForKey:@"You’re cutting events." value:&stru_1F187C430 table:0];
          [v18 setTitle:v43];

          id v44 = CUIKBundle();
          v45 = [v44 localizedStringForKey:@"Some of the selected events are repeating events. Calendar will cut only the selected occurrences of these events." value:&stru_1F187C430 table:0];
          [v18 setMessage:v45];

          long long v29 = CUIKBundle();
          long long v30 = [v29 localizedStringForKey:@"Cut These Events" value:&stru_1F187C430 table:0];
          v60[0] = MEMORY[0x1E4F143A8];
          v60[1] = 3221225472;
          v60[2] = __71__CUIKPasteboardManager__validateAction_forEvents_delegate_completion___block_invoke_4;
          v60[3] = &unk_1E636A770;
          long long v31 = &v61;
          id v61 = v21;
          id v32 = v60;
        }
      }
      long long v52 = +[CUIKAlertAction actionWithTitle:v30 style:0 handler:v32];
      [v18 addAction:v52];

      uint64_t v23 = v53;
      goto LABEL_23;
    }
  }
  (*((void (**)(id, uint64_t))v12 + 2))(v12, 1);
LABEL_24:
}

uint64_t __71__CUIKPasteboardManager__validateAction_forEvents_delegate_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __71__CUIKPasteboardManager__validateAction_forEvents_delegate_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __71__CUIKPasteboardManager__validateAction_forEvents_delegate_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __71__CUIKPasteboardManager__validateAction_forEvents_delegate_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __71__CUIKPasteboardManager__validateAction_forEvents_delegate_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __71__CUIKPasteboardManager__validateAction_forEvents_delegate_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __71__CUIKPasteboardManager__validateAction_forEvents_delegate_completion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)_pasteboardItemForEvent:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  BOOL v5 = [v3 eventOccurrenceID];
  id v6 = [v5 dataUsingEncoding:4];
  [v4 setObject:v6 forKeyedSubscript:@"com.apple.calendar.pasteboard.event"];
  BOOL v7 = +[CUIKEventDescriptionGenerator sharedGenerator];
  id v8 = [v7 textRepresentationForEvent:v3 withTextFormat:0 showURI:1];

  id v9 = [(id)*MEMORY[0x1E4F44510] identifier];
  [v4 setObject:v8 forKeyedSubscript:v9];

  id v10 = +[CUIKEventDescriptionGenerator sharedGenerator];
  id v11 = [v10 textRepresentationForEvent:v3 withTextFormat:1 showURI:1];

  uint64_t v12 = [v11 length];
  uint64_t v22 = *MEMORY[0x1E4FB06D8];
  v23[0] = *MEMORY[0x1E4FB0750];
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
  id v21 = 0;
  uint64_t v14 = objc_msgSend(v11, "dataFromRange:documentAttributes:error:", 0, v12, v13, &v21);
  id v15 = v21;

  if (v14)
  {
    uint64_t v16 = [(id)*MEMORY[0x1E4F444A0] identifier];
    [v4 setObject:v14 forKeyedSubscript:v16];
  }
  else
  {
    uint64_t v16 = +[CUIKLogSubsystem defaultCategory];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      +[CUIKPasteboardManager _pasteboardItemForEvent:]((uint64_t)v15, v16);
    }
  }

  id v17 = +[CUIKEventDescriptionGenerator sharedGenerator];
  v18 = [v17 textRepresentationForEvent:v3 withTextFormat:2 showURI:1];

  v19 = [(id)*MEMORY[0x1E4F443F0] identifier];
  [v4 setObject:v18 forKeyedSubscript:v19];

  return v4;
}

- (id)_eventsFromPasteboard:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [MEMORY[0x1E4F1CA80] set];
  v25[0] = @"com.apple.calendar.pasteboard.event";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  uint64_t v7 = [v4 itemSetWithPasteboardTypes:v6];

  id v17 = (void *)v7;
  v18 = v4;
  [v4 dataForPasteboardType:@"com.apple.calendar.pasteboard.event" inItemSet:v7];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = (void *)[[NSString alloc] initWithData:*(void *)(*((void *)&v20 + 1) + 8 * i) encoding:4];
        uint64_t v13 = [(NSMutableDictionary *)self->_copiedEvents objectForKeyedSubscript:v12];
        if (v13
          || (id WeakRetained = objc_loadWeakRetained((id *)&self->_eventStoreProvider),
              [WeakRetained eventStore],
              id v15 = objc_claimAutoreleasedReturnValue(),
              [v15 eventWithIdentifier:v12],
              uint64_t v13 = objc_claimAutoreleasedReturnValue(),
              v15,
              WeakRetained,
              v13))
        {
          [v5 addObject:v13];
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  return v5;
}

- (id)eventsFromPasteboard
{
  return [(CUIKPasteboardManager *)self _eventsFromPasteboard:self->_pasteboard];
}

- (CGColor)colorOfCalendarToPasteTo
{
  v2 = [(CUIKPasteboardManager *)self calendarToPasteTo];
  CGColorRef v3 = CGColorRetain((CGColorRef)[v2 CGColor]);
  id v4 = (CGColor *)CFAutorelease(v3);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateForPaste, 0);
  objc_storeStrong((id *)&self->_calendarForPaste, 0);
  objc_storeStrong((id *)&self->_copiedEvents, 0);
  objc_destroyWeak((id *)&self->_calendarProvider);
  objc_storeStrong((id *)&self->_pasteboard, 0);

  objc_destroyWeak((id *)&self->_eventStoreProvider);
}

+ (void)_pasteboardItemForEvent:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BDF08000, a2, OS_LOG_TYPE_ERROR, "Unable to convert attributed string to RTF for the pasteboard: %@", (uint8_t *)&v2, 0xCu);
}

@end