@interface EKEventAutocompleteResultsEditItem
- (BOOL)editor:(id)a3 canSelectSubitem:(unint64_t)a4;
- (BOOL)editor:(id)a3 shouldClearSelectionFromSubitem:(unint64_t)a4;
- (BOOL)hasSuggestedLocationResult;
- (BOOL)shouldAppear;
- (NSArray)results;
- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4;
- (id)cellForSubitemAtIndex:(unint64_t)a3;
- (unint64_t)numberOfSubitems;
- (void)_updateTableWithOldCount:(int64_t)a3 newCount:(int64_t)a4;
- (void)editor:(id)a3 didSelectSubitem:(unint64_t)a4;
- (void)setResults:(id)a3;
@end

@implementation EKEventAutocompleteResultsEditItem

- (void)setResults:(id)a3
{
  id v5 = a3;
  results = self->_results;
  id v14 = v5;
  if (!results)
  {
    BOOL v8 = 1;
    if (v5) {
      goto LABEL_3;
    }
LABEL_9:
    BOOL v10 = 1;
    goto LABEL_10;
  }
  uint64_t v7 = [(NSArray *)results count];
  id v5 = v14;
  BOOL v8 = v7 == 0;
  if (!v14) {
    goto LABEL_9;
  }
LABEL_3:
  uint64_t v9 = [v5 count];
  BOOL v10 = v9 == 0;
  if (v9) {
    char v11 = v8;
  }
  else {
    char v11 = 1;
  }
  if ((v11 & 1) == 0)
  {
    BOOL v12 = [(NSArray *)self->_results isEqualToArray:v14];
    id v5 = v14;
    if (v12) {
      goto LABEL_17;
    }
LABEL_13:
    if (self->_suggestionApplied)
    {
      objc_storeStrong((id *)&self->_results, a3);
    }
    else
    {
      unint64_t v13 = [(EKEventAutocompleteResultsEditItem *)self numberOfSubitems];
      objc_storeStrong((id *)&self->_results, a3);
      [(EKEventAutocompleteResultsEditItem *)self _updateTableWithOldCount:v13 newCount:[(EKEventAutocompleteResultsEditItem *)self numberOfSubitems]];
    }
    id v5 = v14;
    goto LABEL_17;
  }
  id v5 = v14;
LABEL_10:
  if (!v8 || !v10) {
    goto LABEL_13;
  }
LABEL_17:
}

- (void)_updateTableWithOldCount:(int64_t)a3 newCount:(int64_t)a4
{
  id v26 = (id)objc_opt_new();
  uint64_t v7 = objc_opt_new();
  BOOL v8 = objc_opt_new();
  if (!a3 || !a4)
  {
    uint64_t v9 = [(EKCalendarItemEditItem *)self delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      char v11 = [(EKCalendarItemEditItem *)self delegate];
      [v11 editItemVisibilityChanged:self];
    }
  }
  if (a3 == a4)
  {
    if (a3)
    {
      uint64_t v12 = 0;
      do
        [v8 addIndex:v12++];
      while (a3 != v12);
    }
  }
  else if (a3 <= a4)
  {
    if (a4)
    {
      unint64_t v15 = 0;
      do
      {
        v16 = v26;
        if (v15 < a3) {
          v16 = v8;
        }
        [v16 addIndex:v15++];
      }
      while (a4 != v15);
    }
  }
  else if (a3)
  {
    unint64_t v13 = 0;
    do
    {
      if (v13 >= a4) {
        id v14 = v7;
      }
      else {
        id v14 = v8;
      }
      [v14 addIndex:v13++];
    }
    while (a3 != v13);
  }
  v17 = [(EKCalendarItemEditItem *)self delegate];
  char v18 = objc_opt_respondsToSelector();

  if (v18)
  {
    v19 = [(EKCalendarItemEditItem *)self delegate];
    [v19 editItem:self wantsRowInsertions:v26 rowDeletions:v7 rowReloads:v8];
  }
  if ((a3 == 0) != (a4 == 0))
  {
    if (!a3)
    {
      v20 = [(EKCalendarItemEditItem *)self delegate];
      char v21 = objc_opt_respondsToSelector();

      if (v21)
      {
        v22 = [(EKCalendarItemEditItem *)self delegate];
        [v22 autocompleteResultsEditItemDidShowResults:self];
      }
    }
    if (!a4)
    {
      v23 = [(EKCalendarItemEditItem *)self delegate];
      char v24 = objc_opt_respondsToSelector();

      if (v24)
      {
        v25 = [(EKCalendarItemEditItem *)self delegate];
        [v25 autocompleteResultsEditItemDidHideResults:self];
      }
    }
  }
}

- (unint64_t)numberOfSubitems
{
  if (self->_suggestionApplied) {
    return 0;
  }
  else {
    return [(NSArray *)self->_results count];
  }
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  v4 = [(NSArray *)self->_results objectAtIndexedSubscript:a3];
  id v5 = [v4 pasteboardResults];
  [v5 count];

  v6 = objc_opt_class();
  uint64_t v7 = [(EKCalendarItemEditItem *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) == 0) {
    goto LABEL_3;
  }
  uint64_t v9 = [(EKCalendarItemEditItem *)self delegate];
  char v10 = [v6 reuseIdentifier];
  char v11 = [v9 cellWithReuseIdentifier:v10 forEditItem:self];

  if (!v11)
  {
LABEL_3:
    id v12 = objc_alloc((Class)v6);
    unint64_t v13 = [v6 reuseIdentifier];
    char v11 = (void *)[v12 initWithStyle:0 reuseIdentifier:v13];
  }
  [v11 updateWithResult:v4];

  return v11;
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4
{
  id v5 = [(NSArray *)self->_results objectAtIndexedSubscript:a3];
  v6 = [v5 pasteboardResults];
  unint64_t v7 = [v6 count];

  char v8 = off_1E6086A18;
  if (v7 <= 1) {
    char v8 = off_1E60867A8;
  }
  [(__objc2_class *)*v8 cellHeightForResult:v5 forWidth:a4];
  double v10 = v9;

  return v10;
}

- (BOOL)editor:(id)a3 canSelectSubitem:(unint64_t)a4
{
  return 1;
}

- (void)editor:(id)a3 didSelectSubitem:(unint64_t)a4
{
  id v9 = [(NSArray *)self->_results objectAtIndexedSubscript:a4];
  id v5 = [v9 pasteboardResults];
  self->_suggestionApplied = (unint64_t)[v5 count] < 2;

  v6 = [(EKCalendarItemEditItem *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    char v8 = [(EKCalendarItemEditItem *)self delegate];
    [v8 autocompleteResultsEditItem:self resultSelected:v9];
  }
}

- (BOOL)editor:(id)a3 shouldClearSelectionFromSubitem:(unint64_t)a4
{
  return 1;
}

- (BOOL)shouldAppear
{
  return [(EKEventAutocompleteResultsEditItem *)self numberOfSubitems] != 0;
}

- (BOOL)hasSuggestedLocationResult
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_results;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "preferredLocation", (void)v9);
        char v7 = [v6 isPrediction];

        if (v7)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (NSArray)results
{
  return self->_results;
}

- (void).cxx_destruct
{
}

@end