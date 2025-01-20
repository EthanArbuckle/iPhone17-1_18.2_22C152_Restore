@interface CUIKCompositeEditor
- (BOOL)calendarUsesEditor:(id)a3;
- (BOOL)commitEventForOOPModificationRecording:(id)a3 error:(id *)a4;
- (BOOL)deleteEvent:(id)a3 span:(int64_t)a4 error:(id *)a5;
- (BOOL)eventUsesEditor:(id)a3;
- (BOOL)saveCalendar:(id)a3 error:(id *)a4;
- (BOOL)saveEvent:(id)a3 span:(int64_t)a4 error:(id *)a5;
- (BOOL)saveEventForOOPModificationRecording:(id)a3 span:(int64_t)a4 error:(id *)a5;
- (BOOL)saveNewEvents:(id)a3 commit:(BOOL)a4 error:(id *)a5;
- (BOOL)sourceUsesEditor:(id)a3;
- (CUIKCompositeEditor)initWithEditors:(id)a3;
- (void)deleteCalendar:(id)a3 forEntityType:(unint64_t)a4;
- (void)deleteCalendars:(id)a3;
- (void)deleteEvents:(id)a3;
- (void)deleteEvents:(id)a3 span:(int64_t)a4;
- (void)deleteEvents:(id)a3 span:(int64_t)a4 result:(id)a5;
- (void)deleteSources:(id)a3;
- (void)dispatchCalendar:(id)a3 block:(id)a4;
- (void)dispatchCalendars:(id)a3 block:(id)a4;
- (void)dispatchEvent:(id)a3 block:(id)a4;
- (void)dispatchEvents:(id)a3 block:(id)a4;
- (void)dispatchSources:(id)a3 block:(id)a4;
- (void)performWithOptions:(id)a3 block:(id)a4;
- (void)saveCalendars:(id)a3;
- (void)saveChangesToEvents:(id)a3 impliedCommitDecision:(BOOL)a4;
- (void)saveChangesToEvents:(id)a3 span:(int64_t)a4;
- (void)saveChangesToSources:(id)a3;
- (void)saveNewSources:(id)a3 commit:(BOOL)a4;
@end

@implementation CUIKCompositeEditor

- (CUIKCompositeEditor)initWithEditors:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CUIKCompositeEditor;
  v6 = [(CUIKCompositeEditor *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_editors, a3);
  }

  return v7;
}

- (BOOL)saveNewEvents:(id)a3 commit:(BOOL)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__6;
  v21 = __Block_byref_object_dispose__6;
  id v22 = 0;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 1;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__CUIKCompositeEditor_saveNewEvents_commit_error___block_invoke;
  v11[3] = &unk_1E636A448;
  BOOL v12 = a4;
  v11[4] = &v17;
  v11[5] = &v13;
  [(CUIKCompositeEditor *)self dispatchEvents:v8 block:v11];
  if (a5) {
    *a5 = (id) v18[5];
  }
  char v9 = *((unsigned char *)v14 + 24);
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  return v9;
}

void __50__CUIKCompositeEditor_saveNewEvents_commit_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v7 + 40);
  char v8 = [a2 saveNewEvents:a3 commit:v6 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  if ((v8 & 1) == 0)
  {
    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

- (void)saveChangesToEvents:(id)a3 span:(int64_t)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__CUIKCompositeEditor_saveChangesToEvents_span___block_invoke;
  v4[3] = &__block_descriptor_40_e44_v32__0___CUIKEditorExtended__8__NSSet_16_B24l;
  v4[4] = a4;
  [(CUIKCompositeEditor *)self dispatchEvents:a3 block:v4];
}

uint64_t __48__CUIKCompositeEditor_saveChangesToEvents_span___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 saveChangesToEvents:a3 span:*(void *)(a1 + 32)];
}

- (BOOL)saveEvent:(id)a3 span:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__6;
  v25 = __Block_byref_object_dispose__6;
  id v26 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 1;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __44__CUIKCompositeEditor_saveEvent_span_error___block_invoke;
  v12[3] = &unk_1E636A490;
  v14 = &v17;
  id v9 = v8;
  uint64_t v15 = &v21;
  int64_t v16 = a4;
  id v13 = v9;
  [(CUIKCompositeEditor *)self dispatchEvent:v9 block:v12];
  if (a5) {
    *a5 = (id) v22[5];
  }
  char v10 = *((unsigned char *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v10;
}

void __44__CUIKCompositeEditor_saveEvent_span_error___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[7];
  uint64_t v5 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v5 + 40);
  char v6 = [a2 saveEvent:v3 span:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v6;
}

- (BOOL)commitEventForOOPModificationRecording:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__6;
  id v22 = __Block_byref_object_dispose__6;
  id v23 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 1;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__CUIKCompositeEditor_commitEventForOOPModificationRecording_error___block_invoke;
  v10[3] = &unk_1E636A4B8;
  BOOL v12 = &v14;
  id v7 = v6;
  id v11 = v7;
  id v13 = &v18;
  [(CUIKCompositeEditor *)self dispatchEvent:v7 block:v10];
  if (a4) {
    *a4 = (id) v19[5];
  }
  char v8 = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v8;
}

void __68__CUIKCompositeEditor_commitEventForOOPModificationRecording_error___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v4 + 40);
  char v5 = [a2 commitEventForOOPModificationRecording:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v5;
}

- (BOOL)saveEventForOOPModificationRecording:(id)a3 span:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__6;
  v25 = __Block_byref_object_dispose__6;
  id v26 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 1;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__CUIKCompositeEditor_saveEventForOOPModificationRecording_span_error___block_invoke;
  v12[3] = &unk_1E636A490;
  uint64_t v14 = &v17;
  id v9 = v8;
  uint64_t v15 = &v21;
  int64_t v16 = a4;
  id v13 = v9;
  [(CUIKCompositeEditor *)self dispatchEvent:v9 block:v12];
  if (a5) {
    *a5 = (id) v22[5];
  }
  char v10 = *((unsigned char *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v10;
}

void __71__CUIKCompositeEditor_saveEventForOOPModificationRecording_span_error___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[7];
  uint64_t v5 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v5 + 40);
  char v6 = [a2 saveEventForOOPModificationRecording:v3 span:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v6;
}

- (void)saveChangesToEvents:(id)a3 impliedCommitDecision:(BOOL)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__CUIKCompositeEditor_saveChangesToEvents_impliedCommitDecision___block_invoke;
  v4[3] = &__block_descriptor_33_e44_v32__0___CUIKEditorExtended__8__NSSet_16_B24l;
  BOOL v5 = a4;
  [(CUIKCompositeEditor *)self dispatchEvents:a3 block:v4];
}

uint64_t __65__CUIKCompositeEditor_saveChangesToEvents_impliedCommitDecision___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 saveChangesToEvents:a3 impliedCommitDecision:*(unsigned __int8 *)(a1 + 32)];
}

- (void)deleteEvents:(id)a3
{
}

uint64_t __36__CUIKCompositeEditor_deleteEvents___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deleteEvents:");
}

- (BOOL)deleteEvent:(id)a3 span:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__6;
  v25 = __Block_byref_object_dispose__6;
  id v26 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 1;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __46__CUIKCompositeEditor_deleteEvent_span_error___block_invoke;
  v12[3] = &unk_1E636A490;
  uint64_t v14 = &v17;
  id v9 = v8;
  uint64_t v15 = &v21;
  int64_t v16 = a4;
  id v13 = v9;
  [(CUIKCompositeEditor *)self dispatchEvent:v9 block:v12];
  if (a5) {
    *a5 = (id) v22[5];
  }
  char v10 = *((unsigned char *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v10;
}

void __46__CUIKCompositeEditor_deleteEvent_span_error___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[7];
  uint64_t v5 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v5 + 40);
  char v6 = [a2 deleteEvent:v3 span:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v6;
}

- (void)deleteEvents:(id)a3 span:(int64_t)a4 result:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  int v36 = 1;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  int v32 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  char v28 = 1;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__6;
  v25[4] = __Block_byref_object_dispose__6;
  id v26 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__CUIKCompositeEditor_deleteEvents_span_result___block_invoke;
  aBlock[3] = &unk_1E636A520;
  id v10 = v9;
  id v22 = v10;
  uint64_t v23 = v27;
  v24 = v25;
  id v11 = _Block_copy(aBlock);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __48__CUIKCompositeEditor_deleteEvents_span_result___block_invoke_2;
  v14[3] = &unk_1E636A570;
  uint64_t v19 = v25;
  int64_t v20 = a4;
  int64_t v16 = &v33;
  uint64_t v17 = &v29;
  uint64_t v18 = v27;
  BOOL v12 = v11;
  id v15 = v12;
  [(CUIKCompositeEditor *)self dispatchEvents:v8 block:v14];
  int v13 = *((_DWORD *)v34 + 6) - 1;
  *((_DWORD *)v34 + 6) = v13;
  if (*((_DWORD *)v30 + 6) == v13) {
    v12[2](v12);
  }

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v27, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
}

uint64_t __48__CUIKCompositeEditor_deleteEvents_span_result___block_invoke(void *a1)
{
  uint64_t result = a1[4];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24), *(void *)(*(void *)(a1[6] + 8) + 40));
  }
  return result;
}

void __48__CUIKCompositeEditor_deleteEvents_span_result___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__CUIKCompositeEditor_deleteEvents_span_result___block_invoke_3;
  v8[3] = &unk_1E636A548;
  long long v10 = *(_OWORD *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 72);
  id v7 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 64);
  uint64_t v12 = v6;
  id v9 = v7;
  [a2 deleteEvents:a3 span:v5 result:v8];
}

void __48__CUIKCompositeEditor_deleteEvents_span_result___block_invoke_3(void *a1, char a2, void *a3)
{
  id v6 = a3;
  ++*(_DWORD *)(*(void *)(a1[5] + 8) + 24);
  if ((a2 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
    objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a3);
  }
  if (*(_DWORD *)(*(void *)(a1[5] + 8) + 24) == *(_DWORD *)(*(void *)(a1[8] + 8) + 24)) {
    (*(void (**)(void))(a1[4] + 16))();
  }
}

- (void)deleteEvents:(id)a3 span:(int64_t)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__CUIKCompositeEditor_deleteEvents_span___block_invoke;
  v4[3] = &__block_descriptor_40_e44_v32__0___CUIKEditorExtended__8__NSSet_16_B24l;
  void v4[4] = a4;
  [(CUIKCompositeEditor *)self dispatchEvents:a3 block:v4];
}

uint64_t __41__CUIKCompositeEditor_deleteEvents_span___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 deleteEvents:a3 span:*(void *)(a1 + 32)];
}

- (void)deleteCalendar:(id)a3 forEntityType:(unint64_t)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__CUIKCompositeEditor_deleteCalendar_forEntityType___block_invoke;
  v8[3] = &unk_1E636A598;
  id v9 = v6;
  unint64_t v10 = a4;
  id v7 = v6;
  [(CUIKCompositeEditor *)self dispatchCalendar:v7 block:v8];
}

uint64_t __52__CUIKCompositeEditor_deleteCalendar_forEntityType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 deleteCalendar:*(void *)(a1 + 32) forEntityType:*(void *)(a1 + 40)];
}

- (BOOL)saveCalendar:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__6;
  id v22 = __Block_byref_object_dispose__6;
  id v23 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 1;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__CUIKCompositeEditor_saveCalendar_error___block_invoke;
  v10[3] = &unk_1E636A4B8;
  uint64_t v12 = &v14;
  id v7 = v6;
  id v11 = v7;
  int v13 = &v18;
  [(CUIKCompositeEditor *)self dispatchCalendar:v7 block:v10];
  if (a4) {
    *a4 = (id) v19[5];
  }
  char v8 = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v8;
}

void __42__CUIKCompositeEditor_saveCalendar_error___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v4 + 40);
  char v5 = [a2 saveCalendar:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v5;
}

- (void)saveCalendars:(id)a3
{
}

uint64_t __37__CUIKCompositeEditor_saveCalendars___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "saveCalendars:");
}

- (void)deleteCalendars:(id)a3
{
}

uint64_t __39__CUIKCompositeEditor_deleteCalendars___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deleteCalendars:");
}

- (void)saveNewSources:(id)a3 commit:(BOOL)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__CUIKCompositeEditor_saveNewSources_commit___block_invoke;
  v4[3] = &__block_descriptor_33_e44_v32__0___CUIKEditorExtended__8__NSSet_16_B24l;
  BOOL v5 = a4;
  [(CUIKCompositeEditor *)self dispatchSources:a3 block:v4];
}

uint64_t __45__CUIKCompositeEditor_saveNewSources_commit___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 saveNewSources:a3 commit:*(unsigned __int8 *)(a1 + 32)];
}

- (void)saveChangesToSources:(id)a3
{
}

uint64_t __44__CUIKCompositeEditor_saveChangesToSources___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "saveChangesToSources:");
}

- (void)deleteSources:(id)a3
{
}

uint64_t __37__CUIKCompositeEditor_deleteSources___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deleteSources:");
}

- (BOOL)eventUsesEditor:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v5 = self->_editors;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "eventUsesEditor:", v4, (void)v10))
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)calendarUsesEditor:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v5 = self->_editors;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "calendarUsesEditor:", v4, (void)v10))
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)sourceUsesEditor:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v5 = self->_editors;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "sourceUsesEditor:", v4, (void)v10))
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)dispatchEvents:(id)a3 block:(id)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v29 = a4;
  id v31 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
  if (v6)
  {
    uint64_t v32 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v52 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v51 + 1) + 8 * i);
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id v9 = self->_editors;
        uint64_t v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v47, v56, 16, v29);
        if (v10)
        {
          uint64_t v11 = 0;
          uint64_t v12 = *(void *)v48;
          while (2)
          {
            uint64_t v13 = 0;
            uint64_t v14 = v11 + v10;
            do
            {
              if (*(void *)v48 != v12) {
                objc_enumerationMutation(v9);
              }
              if ([*(id *)(*((void *)&v47 + 1) + 8 * v13) eventUsesEditor:v8])
              {
                uint64_t v15 = [NSNumber numberWithUnsignedInteger:v11 + v13];
                id v16 = [v31 objectForKeyedSubscript:v15];

                if (!v16)
                {
                  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
                  char v17 = [NSNumber numberWithUnsignedInteger:v11 + v13];
                  [v31 setObject:v16 forKeyedSubscript:v17];
                }
                [v16 addObject:v8];

                goto LABEL_18;
              }
              ++v13;
            }
            while (v10 != v13);
            uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v47 objects:v56 count:16];
            uint64_t v11 = v14;
            if (v10) {
              continue;
            }
            break;
          }
        }
LABEL_18:
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
    }
    while (v6);
  }

  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x2020000000;
  char v46 = 0;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v18 = v31;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v39 objects:v55 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v40;
LABEL_22:
    uint64_t v21 = 0;
    while (1)
    {
      if (*(void *)v40 != v20) {
        objc_enumerationMutation(v18);
      }
      id v22 = *(void **)(*((void *)&v39 + 1) + 8 * v21);
      uint64_t v23 = objc_msgSend(v22, "unsignedIntegerValue", v29);
      v24 = [v18 objectForKeyedSubscript:v22];
      v25 = [(NSArray *)self->_editors objectAtIndexedSubscript:v23];
      options = self->_options;
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __44__CUIKCompositeEditor_dispatchEvents_block___block_invoke;
      v34[3] = &unk_1E636A5C0;
      id v36 = v29;
      v34[4] = self;
      uint64_t v38 = v23;
      id v27 = v24;
      id v35 = v27;
      v37 = &v43;
      [v25 performWithOptions:options block:v34];

      BOOL v28 = *((unsigned char *)v44 + 24) == 0;
      if (!v28) {
        break;
      }
      if (v19 == ++v21)
      {
        uint64_t v19 = [v18 countByEnumeratingWithState:&v39 objects:v55 count:16];
        if (v19) {
          goto LABEL_22;
        }
        break;
      }
    }
  }

  _Block_object_dispose(&v43, 8);
}

void __44__CUIKCompositeEditor_dispatchEvents_block___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  id v3 = [*(id *)(a1[4] + 8) objectAtIndexedSubscript:a1[8]];
  (*(void (**)(uint64_t, id, void, uint64_t))(v2 + 16))(v2, v3, a1[5], *(void *)(a1[7] + 8) + 24);
}

- (void)dispatchEvent:(id)a3 block:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v8 = self->_editors;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v13 eventUsesEditor:v6])
        {
          options = self->_options;
          v15[0] = MEMORY[0x1E4F143A8];
          v15[1] = 3221225472;
          v15[2] = __43__CUIKCompositeEditor_dispatchEvent_block___block_invoke;
          v15[3] = &unk_1E636A5E8;
          v15[4] = v13;
          id v16 = v7;
          [v13 performWithOptions:options block:v15];

          goto LABEL_11;
        }
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

uint64_t __43__CUIKCompositeEditor_dispatchEvent_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)dispatchCalendars:(id)a3 block:(id)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v29 = a4;
  id v31 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
  if (v6)
  {
    uint64_t v32 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v52 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v51 + 1) + 8 * i);
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        uint64_t v9 = self->_editors;
        uint64_t v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v47, v56, 16, v29);
        if (v10)
        {
          uint64_t v11 = 0;
          uint64_t v12 = *(void *)v48;
          while (2)
          {
            uint64_t v13 = 0;
            uint64_t v14 = v11 + v10;
            do
            {
              if (*(void *)v48 != v12) {
                objc_enumerationMutation(v9);
              }
              if ([*(id *)(*((void *)&v47 + 1) + 8 * v13) calendarUsesEditor:v8])
              {
                uint64_t v15 = [NSNumber numberWithUnsignedInteger:v11 + v13];
                id v16 = [v31 objectForKeyedSubscript:v15];

                if (!v16)
                {
                  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
                  long long v17 = [NSNumber numberWithUnsignedInteger:v11 + v13];
                  [v31 setObject:v16 forKeyedSubscript:v17];
                }
                [v16 addObject:v8];

                goto LABEL_18;
              }
              ++v13;
            }
            while (v10 != v13);
            uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v47 objects:v56 count:16];
            uint64_t v11 = v14;
            if (v10) {
              continue;
            }
            break;
          }
        }
LABEL_18:
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
    }
    while (v6);
  }

  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x2020000000;
  char v46 = 0;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v18 = v31;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v39 objects:v55 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v40;
LABEL_22:
    uint64_t v21 = 0;
    while (1)
    {
      if (*(void *)v40 != v20) {
        objc_enumerationMutation(v18);
      }
      uint64_t v22 = *(void **)(*((void *)&v39 + 1) + 8 * v21);
      uint64_t v23 = objc_msgSend(v22, "unsignedIntegerValue", v29);
      v24 = [v18 objectForKeyedSubscript:v22];
      v25 = [(NSArray *)self->_editors objectAtIndexedSubscript:v23];
      options = self->_options;
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __47__CUIKCompositeEditor_dispatchCalendars_block___block_invoke;
      v34[3] = &unk_1E636A5C0;
      id v36 = v29;
      v34[4] = self;
      uint64_t v38 = v23;
      id v27 = v24;
      id v35 = v27;
      v37 = &v43;
      [v25 performWithOptions:options block:v34];

      BOOL v28 = *((unsigned char *)v44 + 24) == 0;
      if (!v28) {
        break;
      }
      if (v19 == ++v21)
      {
        uint64_t v19 = [v18 countByEnumeratingWithState:&v39 objects:v55 count:16];
        if (v19) {
          goto LABEL_22;
        }
        break;
      }
    }
  }

  _Block_object_dispose(&v43, 8);
}

void __47__CUIKCompositeEditor_dispatchCalendars_block___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  id v3 = [*(id *)(a1[4] + 8) objectAtIndexedSubscript:a1[8]];
  (*(void (**)(uint64_t, id, void, uint64_t))(v2 + 16))(v2, v3, a1[5], *(void *)(a1[7] + 8) + 24);
}

- (void)dispatchCalendar:(id)a3 block:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v8 = self->_editors;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v13 calendarUsesEditor:v6])
        {
          options = self->_options;
          v15[0] = MEMORY[0x1E4F143A8];
          v15[1] = 3221225472;
          v15[2] = __46__CUIKCompositeEditor_dispatchCalendar_block___block_invoke;
          v15[3] = &unk_1E636A5E8;
          v15[4] = v13;
          id v16 = v7;
          [v13 performWithOptions:options block:v15];

          goto LABEL_11;
        }
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

uint64_t __46__CUIKCompositeEditor_dispatchCalendar_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)dispatchSources:(id)a3 block:(id)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v29 = a4;
  id v31 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
  if (v6)
  {
    uint64_t v32 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v52 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v51 + 1) + 8 * i);
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        uint64_t v9 = self->_editors;
        uint64_t v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v47, v56, 16, v29);
        if (v10)
        {
          uint64_t v11 = 0;
          uint64_t v12 = *(void *)v48;
          while (2)
          {
            uint64_t v13 = 0;
            uint64_t v14 = v11 + v10;
            do
            {
              if (*(void *)v48 != v12) {
                objc_enumerationMutation(v9);
              }
              if ([*(id *)(*((void *)&v47 + 1) + 8 * v13) sourceUsesEditor:v8])
              {
                uint64_t v15 = [NSNumber numberWithUnsignedInteger:v11 + v13];
                id v16 = [v31 objectForKeyedSubscript:v15];

                if (!v16)
                {
                  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
                  long long v17 = [NSNumber numberWithUnsignedInteger:v11 + v13];
                  [v31 setObject:v16 forKeyedSubscript:v17];
                }
                [v16 addObject:v8];

                goto LABEL_18;
              }
              ++v13;
            }
            while (v10 != v13);
            uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v47 objects:v56 count:16];
            uint64_t v11 = v14;
            if (v10) {
              continue;
            }
            break;
          }
        }
LABEL_18:
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
    }
    while (v6);
  }

  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x2020000000;
  char v46 = 0;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v18 = v31;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v39 objects:v55 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v40;
LABEL_22:
    uint64_t v21 = 0;
    while (1)
    {
      if (*(void *)v40 != v20) {
        objc_enumerationMutation(v18);
      }
      uint64_t v22 = *(void **)(*((void *)&v39 + 1) + 8 * v21);
      uint64_t v23 = objc_msgSend(v22, "unsignedIntegerValue", v29);
      v24 = [v18 objectForKeyedSubscript:v22];
      v25 = [(NSArray *)self->_editors objectAtIndexedSubscript:v23];
      options = self->_options;
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __45__CUIKCompositeEditor_dispatchSources_block___block_invoke;
      v34[3] = &unk_1E636A5C0;
      id v36 = v29;
      v34[4] = self;
      uint64_t v38 = v23;
      id v27 = v24;
      id v35 = v27;
      v37 = &v43;
      [v25 performWithOptions:options block:v34];

      BOOL v28 = *((unsigned char *)v44 + 24) == 0;
      if (!v28) {
        break;
      }
      if (v19 == ++v21)
      {
        uint64_t v19 = [v18 countByEnumeratingWithState:&v39 objects:v55 count:16];
        if (v19) {
          goto LABEL_22;
        }
        break;
      }
    }
  }

  _Block_object_dispose(&v43, 8);
}

void __45__CUIKCompositeEditor_dispatchSources_block___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  id v3 = [*(id *)(a1[4] + 8) objectAtIndexedSubscript:a1[8]];
  (*(void (**)(uint64_t, id, void, uint64_t))(v2 + 16))(v2, v3, a1[5], *(void *)(a1[7] + 8) + 24);
}

- (void)performWithOptions:(id)a3 block:(id)a4
{
  uint64_t v6 = (NSDictionary *)a3;
  id v7 = self->_options;
  options = self->_options;
  self->_options = v6;
  uint64_t v11 = v6;
  uint64_t v9 = (void (**)(void))a4;

  v9[2](v9);
  uint64_t v10 = self->_options;
  self->_options = v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong((id *)&self->_editors, 0);
}

@end