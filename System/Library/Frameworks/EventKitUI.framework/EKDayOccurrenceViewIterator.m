@interface EKDayOccurrenceViewIterator
- (EKDayOccurrenceViewIterator)initWithOccurrenceViews:(id)a3 selectedEvent:(id)a4;
- (NSArray)occurrenceViews;
- (id)_occurrenceViewAtIndex:(int64_t)a3;
- (id)next;
- (id)previous;
- (int64_t)_firstTimedOccurrenceViewIndexInOccurrenceViews:(id)a3;
- (int64_t)_nextIndexFromCurrentIndex:(int64_t)a3 forward:(BOOL)a4;
- (int64_t)_selectedCopyOccurrenceViewIndexInOccurrenceViews:(id)a3 selectedIndex:(int64_t)a4;
- (int64_t)_selectedOccurrenceViewIndexInOccurrenceViews:(id)a3 selectedEvent:(id)a4;
- (int64_t)currentIndex;
- (int64_t)firstTimedOccurrenceIndex;
- (void)_prepareOccurrenceViewsForIteration:(id)a3 selectedEvent:(id)a4 result:(id)a5;
- (void)_separateOccurrenceViews:(id)a3 result:(id)a4;
- (void)setCurrentIndex:(int64_t)a3;
- (void)setFirstTimedOccurrenceIndex:(int64_t)a3;
- (void)setOccurrenceViews:(id)a3;
@end

@implementation EKDayOccurrenceViewIterator

- (EKDayOccurrenceViewIterator)initWithOccurrenceViews:(id)a3 selectedEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)EKDayOccurrenceViewIterator;
  v8 = [(EKDayOccurrenceViewIterator *)&v13 init];
  v9 = v8;
  if (v8)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __69__EKDayOccurrenceViewIterator_initWithOccurrenceViews_selectedEvent___block_invoke;
    v11[3] = &unk_1E6088CD0;
    v12 = v8;
    [(EKDayOccurrenceViewIterator *)v12 _prepareOccurrenceViewsForIteration:v6 selectedEvent:v7 result:v11];
  }
  return v9;
}

uint64_t __69__EKDayOccurrenceViewIterator_initWithOccurrenceViews_selectedEvent___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  [*(id *)(a1 + 32) setOccurrenceViews:a2];
  [*(id *)(a1 + 32) setCurrentIndex:a3];
  id v7 = *(void **)(a1 + 32);

  return [v7 setFirstTimedOccurrenceIndex:a4];
}

- (id)next
{
  [(EKDayOccurrenceViewIterator *)self setCurrentIndex:[(EKDayOccurrenceViewIterator *)self _nextIndexFromCurrentIndex:[(EKDayOccurrenceViewIterator *)self currentIndex] forward:1]];
  int64_t v3 = [(EKDayOccurrenceViewIterator *)self currentIndex];

  return [(EKDayOccurrenceViewIterator *)self _occurrenceViewAtIndex:v3];
}

- (id)previous
{
  [(EKDayOccurrenceViewIterator *)self setCurrentIndex:[(EKDayOccurrenceViewIterator *)self _nextIndexFromCurrentIndex:[(EKDayOccurrenceViewIterator *)self currentIndex] forward:0]];
  int64_t v3 = [(EKDayOccurrenceViewIterator *)self currentIndex];

  return [(EKDayOccurrenceViewIterator *)self _occurrenceViewAtIndex:v3];
}

- (id)_occurrenceViewAtIndex:(int64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v3 = 0;
  }
  else
  {
    v5 = [(EKDayOccurrenceViewIterator *)self occurrenceViews];
    int64_t v3 = [v5 objectAtIndexedSubscript:a3];
  }

  return v3;
}

- (int64_t)_nextIndexFromCurrentIndex:(int64_t)a3 forward:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(EKDayOccurrenceViewIterator *)self occurrenceViews];
  uint64_t v8 = [v7 count];

  if (!v8) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if (!v4)
  {
    v11 = [(EKDayOccurrenceViewIterator *)self occurrenceViews];
    int64_t v10 = [v11 count] - 1;

    if (a3 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v12 = -1;
      goto LABEL_11;
    }
    return v10;
  }
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v10 = 0;
    uint64_t v12 = 1;
LABEL_11:
    uint64_t v13 = v12 + a3;
    if (v13 >= 0)
    {
      v14 = [(EKDayOccurrenceViewIterator *)self occurrenceViews];
      if (v13 < [v14 count]) {
        int64_t v10 = v13;
      }
    }
    return v10;
  }

  return [(EKDayOccurrenceViewIterator *)self firstTimedOccurrenceIndex];
}

- (void)_prepareOccurrenceViewsForIteration:(id)a3 selectedEvent:(id)a4 result:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __88__EKDayOccurrenceViewIterator__prepareOccurrenceViewsForIteration_selectedEvent_result___block_invoke;
  v12[3] = &unk_1E6088CF8;
  v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(EKDayOccurrenceViewIterator *)self _separateOccurrenceViews:a3 result:v12];
}

void __88__EKDayOccurrenceViewIterator__prepareOccurrenceViewsForIteration_selectedEvent_result___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [a2 sortedArrayUsingSelector:sel_compareOccurrenceViewForTabOrdering_];
  id v7 = [v5 sortedArrayUsingSelector:sel_compareOccurrenceViewForTabOrdering_];

  id v8 = [v6 arrayByAddingObjectsFromArray:v7];
  uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "_selectedCopyOccurrenceViewIndexInOccurrenceViews:selectedIndex:", v8, objc_msgSend(*(id *)(a1 + 32), "_selectedOccurrenceViewIndexInOccurrenceViews:selectedEvent:", v8, *(void *)(a1 + 40)));
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v10 = [v8 objectAtIndexedSubscript:v9];
    v13[0] = v10;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    uint64_t v12 = [v8 arrayByExcludingObjectsInArray:v11];

    id v8 = (void *)v12;
  }
  [*(id *)(a1 + 32) _firstTimedOccurrenceViewIndexInOccurrenceViews:v8];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_separateOccurrenceViews:(id)a3 result:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void (**)(id, void *, void *))a4;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  id v8 = [MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v14, "isAllDay", (void)v18)) {
          v15 = v7;
        }
        else {
          v15 = v8;
        }
        [v15 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  v16 = (void *)[v7 copy];
  v17 = (void *)[v8 copy];
  v6[2](v6, v16, v17);
}

- (int64_t)_selectedOccurrenceViewIndexInOccurrenceViews:(id)a3 selectedEvent:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (v5)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __91__EKDayOccurrenceViewIterator__selectedOccurrenceViewIndexInOccurrenceViews_selectedEvent___block_invoke;
    v9[3] = &unk_1E6088D20;
    id v10 = v5;
    int64_t v7 = [a3 indexOfObjectPassingTest:v9];
  }
  else
  {
    int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

uint64_t __91__EKDayOccurrenceViewIterator__selectedOccurrenceViewIndexInOccurrenceViews_selectedEvent___block_invoke(uint64_t a1, void *a2)
{
  int64_t v3 = [a2 occurrence];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (int64_t)_selectedCopyOccurrenceViewIndexInOccurrenceViews:(id)a3 selectedIndex:(int64_t)a4
{
  id v5 = a3;
  id v6 = v5;
  int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  if (a4 != 0x7FFFFFFFFFFFFFFFLL && a4 >= -1)
  {
    int64_t v8 = a4 + 1;
    if (v8 < [v5 count])
    {
      id v9 = [v6 objectAtIndexedSubscript:v8];
      if ([v9 isSelectedCopyView]) {
        int64_t v7 = v8;
      }
    }
  }

  return v7;
}

- (int64_t)_firstTimedOccurrenceViewIndexInOccurrenceViews:(id)a3
{
  return [a3 indexOfObjectPassingTest:&__block_literal_global_19];
}

uint64_t __79__EKDayOccurrenceViewIterator__firstTimedOccurrenceViewIndexInOccurrenceViews___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isAllDay] ^ 1;
}

- (int64_t)currentIndex
{
  return self->_currentIndex;
}

- (void)setCurrentIndex:(int64_t)a3
{
  self->_currentIndex = a3;
}

- (int64_t)firstTimedOccurrenceIndex
{
  return self->_firstTimedOccurrenceIndex;
}

- (void)setFirstTimedOccurrenceIndex:(int64_t)a3
{
  self->_firstTimedOccurrenceIndex = a3;
}

- (NSArray)occurrenceViews
{
  return self->_occurrenceViews;
}

- (void)setOccurrenceViews:(id)a3
{
}

- (void).cxx_destruct
{
}

@end