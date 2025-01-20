@interface VOTNameSearcher
- (BOOL)itemsLoaded;
- (BOOL)searchPending;
- (NSArray)allEntries;
- (NSArray)filteredEntries;
- (VOTNameSearcher)initWithDelegate:(id)a3 itemSource:(id)a4 filter:(id)a5;
- (VOTNameSearcherDelegate)delegate;
- (VOTNameSearcherEntry)focusedEntry;
- (VOTNameSearcherFilter)filter;
- (VOTNameSearcherItemSource)itemSource;
- (void)_focusOnItemAtIndexInFilteredItems:(int64_t)a3;
- (void)_updateFilteredItemsWithSearchText;
- (void)didRetrieveAllEntries:(id)a3;
- (void)focusOnFirstMatchingItem;
- (void)focusOnLastMatchingItem;
- (void)focusOnNextMatchingItem;
- (void)focusOnPreviousMatchingItem;
- (void)selectFocusedItem;
- (void)setAllEntries:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFilter:(id)a3;
- (void)setFilteredEntries:(id)a3;
- (void)setFocusedEntry:(id)a3;
- (void)setItemSource:(id)a3;
- (void)setSearchPending:(BOOL)a3;
- (void)updateMatchingItems;
@end

@implementation VOTNameSearcher

- (VOTNameSearcher)initWithDelegate:(id)a3 itemSource:(id)a4 filter:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)VOTNameSearcher;
  v11 = [(VOTNameSearcher *)&v16 init];
  v12 = v11;
  if (v11)
  {
    [(VOTNameSearcher *)v11 setDelegate:v8];
    [(VOTNameSearcher *)v12 setItemSource:v9];
    [(VOTNameSearcher *)v12 setFilter:v10];
    [(VOTNameSearcher *)v12 setSearchPending:0];
    v13 = [(VOTNameSearcher *)v12 itemSource];
    [v13 retrieveAllEntries:v12];

    v14 = v12;
  }

  return v12;
}

- (void)setFocusedEntry:(id)a3
{
  id v6 = a3;
  id v5 = [(VOTNameSearcher *)self focusedEntry];

  if (v5 != v6)
  {
    objc_storeStrong((id *)&self->_focusedEntry, a3);
    if (v6) {
      [v6 focus];
    }
  }
}

- (BOOL)itemsLoaded
{
  v2 = [(VOTNameSearcher *)self filteredEntries];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)updateMatchingItems
{
  if ([(VOTNameSearcher *)self itemsLoaded])
  {
    [(VOTNameSearcher *)self _updateFilteredItemsWithSearchText];
  }
  else
  {
    [(VOTNameSearcher *)self setSearchPending:1];
  }
}

- (void)focusOnPreviousMatchingItem
{
  if ([(VOTNameSearcher *)self itemsLoaded])
  {
    BOOL v3 = [(VOTNameSearcher *)self filteredEntries];
    v4 = [(VOTNameSearcher *)self focusedEntry];
    id v5 = (char *)[v3 indexOfObject:v4];

    unint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
    if (v5 != (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v7 = (unint64_t)(v5 + 1);
      id v8 = [(VOTNameSearcher *)self filteredEntries];
      unint64_t v6 = v7 % (unint64_t)[v8 count];
    }
    [(VOTNameSearcher *)self _focusOnItemAtIndexInFilteredItems:v6];
  }
}

- (void)focusOnNextMatchingItem
{
  if ([(VOTNameSearcher *)self itemsLoaded])
  {
    BOOL v3 = [(VOTNameSearcher *)self filteredEntries];
    v4 = [(VOTNameSearcher *)self focusedEntry];
    id v5 = (char *)[v3 indexOfObject:v4];

    if (v5)
    {
      if (v5 != (char *)0x7FFFFFFFFFFFFFFFLL) {
        --v5;
      }
    }
    else
    {
      unint64_t v6 = [(VOTNameSearcher *)self filteredEntries];
      id v5 = (char *)[v6 count] - 1;
    }
    [(VOTNameSearcher *)self _focusOnItemAtIndexInFilteredItems:v5];
  }
}

- (void)focusOnFirstMatchingItem
{
  if ([(VOTNameSearcher *)self itemsLoaded])
  {
    [(VOTNameSearcher *)self _focusOnItemAtIndexInFilteredItems:0];
  }
}

- (void)focusOnLastMatchingItem
{
  if ([(VOTNameSearcher *)self itemsLoaded])
  {
    id v3 = [(VOTNameSearcher *)self filteredEntries];
    -[VOTNameSearcher _focusOnItemAtIndexInFilteredItems:](self, "_focusOnItemAtIndexInFilteredItems:", (char *)[v3 count] - 1);
  }
}

- (void)selectFocusedItem
{
  if ([(VOTNameSearcher *)self itemsLoaded])
  {
    id v3 = [(VOTNameSearcher *)self focusedEntry];

    if (v3)
    {
      v4 = [(VOTNameSearcher *)self focusedEntry];
      [v4 select];
    }
    id v8 = [(VOTNameSearcher *)self delegate];
    id v5 = [(VOTNameSearcher *)self itemSource];
    unint64_t v6 = [(VOTNameSearcher *)self focusedEntry];
    unint64_t v7 = [v6 name];
    [v8 itemSource:v5 didSelect:v7];
  }
}

- (void)didRetrieveAllEntries:(id)a3
{
  id v4 = a3;
  [(VOTNameSearcher *)self setAllEntries:v4];
  [(VOTNameSearcher *)self setFilteredEntries:v4];

  if ([(VOTNameSearcher *)self searchPending])
  {
    [(VOTNameSearcher *)self updateMatchingItems];
    [(VOTNameSearcher *)self setSearchPending:0];
  }
}

- (void)_updateFilteredItemsWithSearchText
{
  id v21 = [(VOTNameSearcher *)self filteredEntries];
  id v4 = [(VOTNameSearcher *)self focusedEntry];
  id v5 = [(VOTNameSearcher *)self filter];
  unint64_t v6 = [(VOTNameSearcher *)self allEntries];
  unint64_t v7 = [v5 nameSearcherEntriesPassingSearchFrom:v6];
  [(VOTNameSearcher *)self setFilteredEntries:v7];

  id v8 = [(VOTNameSearcher *)self filteredEntries];
  id v9 = [v8 count];

  if (v9)
  {
    id v10 = [(VOTNameSearcher *)self filteredEntries];
    v11 = [v10 firstObject];
    [(VOTNameSearcher *)self setFocusedEntry:v11];
  }
  else
  {
    [(VOTNameSearcher *)self setFocusedEntry:0];
  }
  v12 = [(VOTNameSearcher *)self filteredEntries];
  unsigned __int8 v13 = [v21 isEqualToArray:v12];

  v14 = [(VOTNameSearcher *)self focusedEntry];
  unsigned int v15 = [v4 isEqual:v14];

  objc_super v16 = [(VOTNameSearcher *)self delegate];
  v17 = [(VOTNameSearcher *)self itemSource];
  if (v13)
  {
    v18 = 0;
    if (!v15) {
      goto LABEL_6;
    }
LABEL_9:
    [v16 itemSource:v17 didFilter:v18 didSwitchFocus:0];
    if (v13) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  v2 = [(VOTNameSearcher *)self filteredEntries];
  v18 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v2 count]);
  if (v15) {
    goto LABEL_9;
  }
LABEL_6:
  v19 = [(VOTNameSearcher *)self focusedEntry];
  v20 = [v19 name];
  [v16 itemSource:v17 didFilter:v18 didSwitchFocus:v20];

  if ((v13 & 1) == 0)
  {
LABEL_10:
  }
LABEL_11:
}

- (void)_focusOnItemAtIndexInFilteredItems:(int64_t)a3
{
  id v5 = [(VOTNameSearcher *)self filteredEntries];
  unint64_t v6 = v5;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v7 = [v5 objectAtIndex:a3];
    [(VOTNameSearcher *)self setFocusedEntry:v7];
    goto LABEL_5;
  }
  if ([v5 count])
  {
    unint64_t v7 = [(VOTNameSearcher *)self filteredEntries];
    id v8 = [v7 firstObject];
    [(VOTNameSearcher *)self setFocusedEntry:v8];

LABEL_5:
    goto LABEL_7;
  }
  [(VOTNameSearcher *)self setFocusedEntry:0];
LABEL_7:

  id v12 = [(VOTNameSearcher *)self delegate];
  id v9 = [(VOTNameSearcher *)self itemSource];
  id v10 = [(VOTNameSearcher *)self focusedEntry];
  v11 = [v10 name];
  [v12 itemSource:v9 didFilter:0 didSwitchFocus:v11];
}

- (VOTNameSearcherDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VOTNameSearcherDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (VOTNameSearcherItemSource)itemSource
{
  return self->_itemSource;
}

- (void)setItemSource:(id)a3
{
}

- (VOTNameSearcherFilter)filter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filter);

  return (VOTNameSearcherFilter *)WeakRetained;
}

- (void)setFilter:(id)a3
{
}

- (NSArray)allEntries
{
  return self->_allEntries;
}

- (void)setAllEntries:(id)a3
{
}

- (NSArray)filteredEntries
{
  return self->_filteredEntries;
}

- (void)setFilteredEntries:(id)a3
{
}

- (VOTNameSearcherEntry)focusedEntry
{
  return self->_focusedEntry;
}

- (BOOL)searchPending
{
  return self->_searchPending;
}

- (void)setSearchPending:(BOOL)a3
{
  self->_searchPending = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusedEntry, 0);
  objc_storeStrong((id *)&self->_filteredEntries, 0);
  objc_storeStrong((id *)&self->_allEntries, 0);
  objc_destroyWeak((id *)&self->_filter);
  objc_storeStrong((id *)&self->_itemSource, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end