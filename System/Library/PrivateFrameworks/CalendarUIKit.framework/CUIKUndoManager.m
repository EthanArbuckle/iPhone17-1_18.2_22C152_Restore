@interface CUIKUndoManager
+ (id)operationForAction:(unint64_t)a3 context:(id)a4;
- (BOOL)disableUndoForOrganizerScheduling;
- (CUIKCommitDelegate)commitDelegate;
- (CUIKDecisionDelegate)decisionDelegate;
- (CUIKEditorExtended)undoableEditor;
- (CUIKUndoManager)init;
- (NSError)lastError;
- (NSMutableDictionary)specificIdentifierMapForRevert;
- (NSMutableDictionary)specificIdentifierMapForUndo;
- (NSMutableDictionary)undeletedObjectMap;
- (id)editingManagerProvider;
- (id)objectToSaveForRevertingChangeToObject:(id)a3;
- (id)objectToSaveForUndoingChangeToObject:(id)a3;
- (void)_clearUndeletedObjects;
- (void)_registerUndeletedObject:(id)a3 withOriginalObjectID:(id)a4;
- (void)clearUndoOperations;
- (void)handleUndoForOperation:(id)a3;
- (void)objectWithSpecificIdentifierWasReverted:(id)a3;
- (void)removeAllActions;
- (void)setCommitDelegate:(id)a3;
- (void)setDecisionDelegate:(id)a3;
- (void)setDisableUndoForOrganizerScheduling:(BOOL)a3;
- (void)setEditingManagerProvider:(id)a3;
- (void)setLastError:(id)a3;
- (void)setRevertObject:(id)a3 forSpecificIdentifier:(id)a4;
- (void)setSpecificIdentifierMapForRevert:(id)a3;
- (void)setSpecificIdentifierMapForUndo:(id)a3;
- (void)setUndeletedObjectMap:(id)a3;
- (void)setUndoObject:(id)a3 forSpecificIdentifier:(id)a4;
- (void)setUndoableEditor:(id)a3;
- (void)undoOperation:(id)a3;
@end

@implementation CUIKUndoManager

- (void)setUndoableEditor:(id)a3
{
}

- (void)setEditingManagerProvider:(id)a3
{
}

- (void)setDisableUndoForOrganizerScheduling:(BOOL)a3
{
  self->_disableUndoForOrganizerScheduling = a3;
}

- (CUIKUndoManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)CUIKUndoManager;
  v2 = [(CUIKUndoManager *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CUIKUndoManager *)v2 setGroupsByEvent:0];
  }
  return v3;
}

- (CUIKEditorExtended)undoableEditor
{
  return self->_undoableEditor;
}

- (void)handleUndoForOperation:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [v4 inverseOperation];
  if (v5)
  {
    [(CUIKUndoManager *)self beginUndoGrouping];
    [(CUIKUndoManager *)self registerUndoWithTarget:self selector:sel_undoOperation_ object:v5];
    v18 = v5;
    if ([(CUIKUndoManager *)self isUndoing]) {
      v6 = v5;
    }
    else {
      v6 = v4;
    }
    v17 = [v6 actionName];
    [(CUIKUndoManager *)self setActionName:v17];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v7 = [v4 objects];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = 0;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v7);
          }
          v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          v14 = [v4 originalObjects];
          v15 = [v14 objectAtIndexedSubscript:v10 + i];

          if ([v13 isUndeleted])
          {
            v16 = [v15 objectID];
            [(CUIKUndoManager *)self _registerUndeletedObject:v13 withOriginalObjectID:v16];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
        v10 += i;
      }
      while (v9);
    }

    [(CUIKUndoManager *)self endUndoGrouping];
    objc_super v5 = v18;
  }
  else
  {
    [(CUIKUndoManager *)self clearUndoOperations];
  }
}

- (void)undoOperation:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [(CUIKUndoManager *)self editingManagerProvider];
  v6 = [v4 eventStore];
  v7 = ((void (**)(void, void *))v5)[2](v5, v6);

  uint64_t v8 = [v4 objects];
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v24;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = -[CUIKUndoManager objectToSaveForUndoingChangeToObject:](self, "objectToSaveForUndoingChangeToObject:", *(void *)(*((void *)&v23 + 1) + 8 * v14), (void)v23);
        [v9 addObject:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v12);
  }

  v16 = [v7 openEditingContextWithObjects:v9 interfaceType:2];
  [v16 setUndoDelegate:self];
  v17 = [(CUIKUndoManager *)self decisionDelegate];
  [v16 setDecisionDelegate:v17];

  v18 = [(CUIKUndoManager *)self commitDelegate];
  [v16 setCommitDelegate:v18];

  int v19 = [(CUIKUndoManager *)self isUndoing];
  long long v20 = +[CUIKLogSubsystem undo];
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);
  if (v19)
  {
    if (v21) {
      -[CUIKUndoManager undoOperation:]((uint64_t)v4, v20);
    }
  }
  else if (v21)
  {
    -[CUIKUndoManager undoOperation:]((uint64_t)v4, v20);
  }

  [v16 performUndoableOperation:v4];
  long long v22 = [v4 error];
  [(CUIKUndoManager *)self setLastError:v22];

  [v7 closeEditingContext:v16];
}

- (void)clearUndoOperations
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__CUIKUndoManager_clearUndoOperations__block_invoke;
  block[3] = &unk_1E6369C50;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __38__CUIKUndoManager_clearUndoOperations__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeAllActions];
}

- (void)removeAllActions
{
  v3.receiver = self;
  v3.super_class = (Class)CUIKUndoManager;
  [(CUIKUndoManager *)&v3 removeAllActions];
  [(CUIKUndoManager *)self _clearUndeletedObjects];
}

+ (id)operationForAction:(unint64_t)a3 context:(id)a4
{
  id v5 = a4;
  if (a3 - 1 > 4)
  {
    v6 = 0;
  }
  else
  {
    v6 = [(__objc2_class *)*off_1E636A8A0[a3 - 1] operationForContext:v5];
  }

  return v6;
}

- (id)objectToSaveForRevertingChangeToObject:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
    v7 = [(CUIKUndoManager *)self specificIdentifierMapForRevert];
    uint64_t v8 = [v6 specificIdentifier];
    uint64_t v9 = [v7 objectForKeyedSubscript:v8];

    if (v9)
    {
      uint64_t v10 = [v9 copy];

      id v6 = (id)v10;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)objectToSaveForUndoingChangeToObject:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
    v7 = [(CUIKUndoManager *)self specificIdentifierMapForUndo];
    uint64_t v8 = [v6 specificIdentifier];
    uint64_t v9 = [v7 objectForKeyedSubscript:v8];

    if (v9)
    {
      uint64_t v10 = [v9 copy];

      id v6 = (id)v10;
    }
    uint64_t v11 = [(CUIKUndoManager *)self undeletedObjectMap];
    uint64_t v12 = [v6 objectID];
    uint64_t v13 = [v11 objectForKeyedSubscript:v12];
    uint64_t v14 = [v13 undeletedObject];

    if (v14)
    {
      uint64_t v15 = [v14 copy];

      id v6 = (id)v15;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)setUndoObject:(id)a3 forSpecificIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(CUIKUndoManager *)self specificIdentifierMapForUndo];

  if (!v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
    [(CUIKUndoManager *)self setSpecificIdentifierMapForUndo:v9];
  }
  id v10 = [(CUIKUndoManager *)self specificIdentifierMapForUndo];
  [v10 setObject:v7 forKeyedSubscript:v6];
}

- (void)setRevertObject:(id)a3 forSpecificIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(CUIKUndoManager *)self specificIdentifierMapForRevert];

  if (!v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
    [(CUIKUndoManager *)self setSpecificIdentifierMapForRevert:v9];
  }
  id v10 = [(CUIKUndoManager *)self specificIdentifierMapForRevert];
  [v10 setObject:v7 forKeyedSubscript:v6];
}

- (void)objectWithSpecificIdentifierWasReverted:(id)a3
{
  id v4 = a3;
  id v5 = [(CUIKUndoManager *)self specificIdentifierMapForUndo];
  [v5 removeObjectForKey:v4];

  id v6 = [(CUIKUndoManager *)self specificIdentifierMapForRevert];
  [v6 removeObjectForKey:v4];
}

- (void)_registerUndeletedObject:(id)a3 withOriginalObjectID:(id)a4
{
  id v14 = a4;
  id v6 = a3;
  id v7 = [(CUIKUndoManager *)self undeletedObjectMap];

  if (v7)
  {
    uint64_t v8 = [(CUIKUndoManager *)self undeletedObjectMap];
    uint64_t v9 = [v8 objectForKeyedSubscript:v14];

    if (v9)
    {
      id v10 = [v9 undeletedObject];
      uint64_t v11 = [v10 objectID];

      uint64_t v12 = [(CUIKUndoManager *)self undeletedObjectMap];
      [v12 setObject:v9 forKeyedSubscript:v11];

      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
    [(CUIKUndoManager *)self setUndeletedObjectMap:v13];
  }
  uint64_t v9 = objc_opt_new();
  uint64_t v11 = [(CUIKUndoManager *)self undeletedObjectMap];
  [v11 setObject:v9 forKeyedSubscript:v14];
LABEL_6:

  [v9 setUndeletedObject:v6];
}

- (void)_clearUndeletedObjects
{
  [(CUIKUndoManager *)self setUndeletedObjectMap:0];
  [(CUIKUndoManager *)self setSpecificIdentifierMapForUndo:0];

  [(CUIKUndoManager *)self setSpecificIdentifierMapForRevert:0];
}

- (BOOL)disableUndoForOrganizerScheduling
{
  return self->_disableUndoForOrganizerScheduling;
}

- (CUIKCommitDelegate)commitDelegate
{
  return self->_commitDelegate;
}

- (void)setCommitDelegate:(id)a3
{
}

- (CUIKDecisionDelegate)decisionDelegate
{
  return self->_decisionDelegate;
}

- (void)setDecisionDelegate:(id)a3
{
}

- (id)editingManagerProvider
{
  return self->_editingManagerProvider;
}

- (NSError)lastError
{
  return self->_lastError;
}

- (void)setLastError:(id)a3
{
}

- (NSMutableDictionary)undeletedObjectMap
{
  return self->_undeletedObjectMap;
}

- (void)setUndeletedObjectMap:(id)a3
{
}

- (NSMutableDictionary)specificIdentifierMapForUndo
{
  return self->_specificIdentifierMapForUndo;
}

- (void)setSpecificIdentifierMapForUndo:(id)a3
{
}

- (NSMutableDictionary)specificIdentifierMapForRevert
{
  return self->_specificIdentifierMapForRevert;
}

- (void)setSpecificIdentifierMapForRevert:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specificIdentifierMapForRevert, 0);
  objc_storeStrong((id *)&self->_specificIdentifierMapForUndo, 0);
  objc_storeStrong((id *)&self->_undeletedObjectMap, 0);
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_undoableEditor, 0);
  objc_storeStrong(&self->_editingManagerProvider, 0);
  objc_storeStrong((id *)&self->_decisionDelegate, 0);

  objc_storeStrong((id *)&self->_commitDelegate, 0);
}

- (void)undoOperation:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1BDF08000, a2, OS_LOG_TYPE_DEBUG, "Undo occurred.  Performing operation %@", (uint8_t *)&v2, 0xCu);
}

- (void)undoOperation:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1BDF08000, a2, OS_LOG_TYPE_DEBUG, "Redo occurred.  Performing operation %@", (uint8_t *)&v2, 0xCu);
}

@end