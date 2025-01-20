@interface SGSuggestionStore
- (NSArray)suggestions;
- (SGSuggestionDelegate)suggestionDelegate;
- (SGSuggestionStore)init;
- (id)sectionWithItem:(id)a3;
- (int64_t)hostApp;
- (void)addSuggestion:(id)a3;
- (void)dismissAllSuggestions;
- (void)list:(id)a3 didAddItem:(id)a4 atIndex:(unint64_t)a5;
- (void)list:(id)a3 didRemoveItem:(id)a4 atIndex:(unint64_t)a5;
- (void)lockNotifications;
- (void)removeSuggestion:(id)a3;
- (void)setHostApp:(int64_t)a3;
- (void)setSuggestionDelegate:(id)a3;
- (void)setSuggestions:(id)a3;
- (void)unlockNotifications;
- (void)updateSuggestion:(id)a3;
@end

@implementation SGSuggestionStore

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_suggestionDelegate);
  objc_storeStrong((id *)&self->_suggestions, 0);
}

- (void)setHostApp:(int64_t)a3
{
  self->_hostApp = a3;
}

- (void)setSuggestionDelegate:(id)a3
{
}

- (SGSuggestionDelegate)suggestionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_suggestionDelegate);
  return (SGSuggestionDelegate *)WeakRetained;
}

- (void)list:(id)a3 didRemoveItem:(id)a4 atIndex:(unint64_t)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v8 = (SGSuggestionStore *)a3;
  id v9 = a4;
  if (self->_notificationsLockCount)
  {
    if (v8 != self) {
      [(NSMutableArray *)self->_suggestions removeObject:v9];
    }
    self->_modified = 1;
  }
  else if (v8 == self)
  {
    v17 = sgLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      unint64_t v26 = a5;
      _os_log_debug_impl(&dword_1B5B6C000, v17, OS_LOG_TYPE_DEBUG, "SGSuggestionStore: Removed notification sent out for index:(%{public}lu)", buf, 0xCu);
    }

    v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a5, @"SGListNotificationKeyItemRemoved", @"SGListNotificationKeyItemIndex", v9);
    v22[1] = v19;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:2];
    [v18 postNotificationName:@"com.apple.coresuggestionsui.SGListDidChangeNotification" object:self userInfo:v20];
  }
  else
  {
    uint64_t v10 = [(NSMutableArray *)self->_suggestions indexOfObject:v9];
    if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
      __assert_rtn("-[SGSuggestionStore list:didRemoveItem:atIndex:]", "SGSuggestionStore.m", 282, "globalIndex!=NSNotFound");
    }
    uint64_t v11 = v10;
    [(NSMutableArray *)self->_suggestions removeObject:v9];
    v12 = sgLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349312;
      unint64_t v26 = a5;
      __int16 v27 = 2050;
      uint64_t v28 = v11;
      _os_log_debug_impl(&dword_1B5B6C000, v12, OS_LOG_TYPE_DEBUG, "SGSuggestionStore: Removed notification sent out for index:(%{public}lu, %{public}lu)", buf, 0x16u);
    }

    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v24[0] = v9;
    v23[0] = @"SGListNotificationKeyItemRemoved";
    v23[1] = @"SGListNotificationKeyItemIndex";
    v14 = [NSNumber numberWithUnsignedInteger:a5];
    v24[1] = v14;
    v23[2] = @"SGListNotificationKeyItemGlobalIndex";
    v15 = [NSNumber numberWithUnsignedInteger:v11];
    v24[2] = v15;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];
    [v13 postNotificationName:@"com.apple.coresuggestionsui.SGListDidChangeNotification" object:v8 userInfo:v16];
  }
}

- (void)list:(id)a3 didAddItem:(id)a4 atIndex:(unint64_t)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v8 = (SGSuggestionStore *)a3;
  id v9 = a4;
  if (self->_notificationsLockCount)
  {
    if (v8 != self)
    {
      [(NSMutableArray *)self->_suggestions addObject:v9];
      uint64_t v10 = [(SGList *)v8 comparator];

      if (v10)
      {
        suggestions = self->_suggestions;
        v12 = [(SGList *)v8 comparator];
        [(NSMutableArray *)suggestions sortUsingComparator:v12];
      }
    }
    self->_modified = 1;
  }
  else
  {
    if (v8 == self)
    {
      v23 = sgLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134349056;
        unint64_t v30 = a5;
        _os_log_debug_impl(&dword_1B5B6C000, v23, OS_LOG_TYPE_DEBUG, "SGSuggestionStore: Added notification sent out for index (%{public}lu)", buf, 0xCu);
      }

      v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a5, @"SGListNotificationKeyItemAdded", @"SGListNotificationKeyItemIndex", v9);
      v26[1] = v20;
      v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:2];
      [v19 postNotificationName:@"com.apple.coresuggestionsui.SGListDidChangeNotification" object:self userInfo:v24];
    }
    else
    {
      [(NSMutableArray *)self->_suggestions addObject:v9];
      v13 = [(SGList *)v8 comparator];

      if (v13)
      {
        v14 = self->_suggestions;
        v15 = [(SGList *)v8 comparator];
        [(NSMutableArray *)v14 sortUsingComparator:v15];
      }
      uint64_t v16 = [(NSMutableArray *)self->_suggestions indexOfObject:v9];
      if (v16 == 0x7FFFFFFFFFFFFFFFLL) {
        __assert_rtn("-[SGSuggestionStore list:didAddItem:atIndex:]", "SGSuggestionStore.m", 249, "globalIndex!=NSNotFound");
      }
      uint64_t v17 = v16;
      v18 = sgLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134349312;
        unint64_t v30 = a5;
        __int16 v31 = 2050;
        uint64_t v32 = v17;
        _os_log_debug_impl(&dword_1B5B6C000, v18, OS_LOG_TYPE_DEBUG, "SGSuggestionStore: Added notification sent out for :(%{public}lu, %{public}lu) index", buf, 0x16u);
      }

      v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v28[0] = v9;
      v27[0] = @"SGListNotificationKeyItemAdded";
      v27[1] = @"SGListNotificationKeyItemIndex";
      v20 = [NSNumber numberWithUnsignedInteger:a5];
      v28[1] = v20;
      v27[2] = @"SGListNotificationKeyItemGlobalIndex";
      uint64_t v21 = [NSNumber numberWithUnsignedInteger:v17];
      v28[2] = v21;
      v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:3];
      [v19 postNotificationName:@"com.apple.coresuggestionsui.SGListDidChangeNotification" object:v8 userInfo:v22];
    }
  }
}

- (void)unlockNotifications
{
  int64_t notificationsLockCount = self->_notificationsLockCount;
  BOOL v3 = notificationsLockCount == 1;
  BOOL v4 = notificationsLockCount < 1;
  int64_t v5 = notificationsLockCount - 1;
  if (!v4)
  {
    self->_int64_t notificationsLockCount = v5;
    if (v3 && self->_modified)
    {
      v7 = [(SGList *)self delegate];
      char v8 = objc_opt_respondsToSelector();

      if (v8)
      {
        id v9 = [(SGList *)self delegate];
        [v9 suggestionsStoreChanged:self];
      }
      else
      {
        id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v9 postNotificationName:@"com.apple.coresuggestionsui.SGListDidChangeNotification" object:self userInfo:0];
      }
    }
  }
}

- (void)lockNotifications
{
  int64_t notificationsLockCount = self->_notificationsLockCount;
  self->_int64_t notificationsLockCount = notificationsLockCount + 1;
  if (!notificationsLockCount) {
    self->_modified = 0;
  }
}

- (int64_t)hostApp
{
  int64_t result = self->_hostApp;
  if (result == 2)
  {
    BOOL v4 = [MEMORY[0x1E4F28B50] mainBundle];
    int64_t v5 = [v4 bundleIdentifier];

    if ([v5 isEqualToString:*MEMORY[0x1E4F5DC28]])
    {
      int64_t v6 = 0;
    }
    else
    {
      if (![v5 isEqualToString:*MEMORY[0x1E4F5DC38]])
      {
LABEL_7:

        return self->_hostApp;
      }
      int64_t v6 = 1;
    }
    self->_hostApp = v6;
    goto LABEL_7;
  }
  return result;
}

- (NSArray)suggestions
{
  v2 = (void *)[(NSMutableArray *)self->_suggestions copy];
  return (NSArray *)v2;
}

- (void)setSuggestions:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(SGSuggestionStore *)self lockNotifications];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  int64_t v5 = self->_suggestions;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * v9++) setSuggestionDelegate:0];
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  [(SGList *)self removeAllItems];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v4;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[SGSuggestionStore addSuggestion:](self, "addSuggestion:", *(void *)(*((void *)&v15 + 1) + 8 * v14++), (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  [(SGSuggestionStore *)self unlockNotifications];
}

- (void)updateSuggestion:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = [(SGSuggestionStore *)self sectionWithItem:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 indexOfItem:v4];
    uint64_t v8 = [(NSMutableArray *)self->_suggestions indexOfObject:v4];
    if (v8 != 0x7FFFFFFFFFFFFFFFLL && v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v10 = v8;
      uint64_t v11 = sgLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134349312;
        uint64_t v19 = v7;
        __int16 v20 = 2050;
        uint64_t v21 = v10;
        _os_log_debug_impl(&dword_1B5B6C000, v11, OS_LOG_TYPE_DEBUG, "SGSuggestionStore: Updated notification sent out for :(%{public}lu, %{public}lu) index", buf, 0x16u);
      }

      uint64_t v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v17[0] = v4;
      uint64_t v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v7, @"SGListNotificationKeyItemUpdated", @"SGListNotificationKeyItemIndex");
      v17[1] = v13;
      v16[2] = @"SGListNotificationKeyItemGlobalIndex";
      uint64_t v14 = [NSNumber numberWithUnsignedInteger:v10];
      v17[2] = v14;
      long long v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];
      [v12 postNotificationName:@"com.apple.coresuggestionsui.SGListDidChangeNotification" object:v6 userInfo:v15];
    }
  }
}

- (void)dismissAllSuggestions
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(SGSuggestionStore *)self lockNotifications];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v3 = (void *)[(NSMutableArray *)self->_suggestions copy];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        [v8 setSuggestionDelegate:0];
        uint64_t v9 = [v8 suggestionDismissAction];
        [v9 execute];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  [(SGList *)self removeAllItems];
  [(SGSuggestionStore *)self unlockNotifications];
}

- (void)removeSuggestion:(id)a3
{
  id v6 = a3;
  uint64_t v4 = -[SGSuggestionStore sectionWithItem:](self, "sectionWithItem:");
  uint64_t v5 = v4;
  if (v4)
  {
    [v4 removeItem:v6];
    if (![v5 count]) {
      [(SGList *)self removeItem:v5];
    }
  }
  [v6 setSuggestionDelegate:0];
}

- (void)addSuggestion:(id)a3
{
  id v11 = a3;
  uint64_t v4 = -[SGSuggestionStore sectionWithItem:](self, "sectionWithItem:");
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = v11;
  }
  else
  {
    uint64_t v5 = objc_opt_new();
    [v5 setDelegate:self];
    [v5 addItem:v11];
    uint64_t v4 = self;
    id v6 = v5;
  }
  [v4 addItem:v6];
  if (!self->_suggestions)
  {
    uint64_t v7 = (NSMutableArray *)objc_opt_new();
    suggestions = self->_suggestions;
    self->_suggestions = v7;
  }
  uint64_t v9 = [(SGSuggestionStore *)self suggestionDelegate];

  if (v9)
  {
    long long v10 = [(SGSuggestionStore *)self suggestionDelegate];
    [v11 setSuggestionDelegate:v10];
  }
}

- (id)sectionWithItem:(id)a3
{
  uint64_t v4 = [a3 suggestionCategory];
  uint64_t v5 = [v4 suggestionCategoryId];

  if ([(SGList *)self count])
  {
    uint64_t v6 = 0;
    while (1)
    {
      uint64_t v7 = [(SGList *)self itemAtIndex:v6];
      uint64_t v8 = [v7 category];
      uint64_t v9 = [v8 suggestionCategoryId];
      char v10 = [v5 isEqual:v9];

      if (v10) {
        break;
      }

      if (++v6 >= [(SGList *)self count]) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    uint64_t v7 = 0;
  }

  return v7;
}

- (SGSuggestionStore)init
{
  v7.receiver = self;
  v7.super_class = (Class)SGSuggestionStore;
  v2 = [(SGList *)&v7 init];
  BOOL v3 = v2;
  if (v2)
  {
    [(SGList *)v2 setDelegate:v2];
    uint64_t v4 = objc_opt_new();
    suggestions = v3->_suggestions;
    v3->_suggestions = (NSMutableArray *)v4;

    v3->_hostApp = 2;
  }
  return v3;
}

@end