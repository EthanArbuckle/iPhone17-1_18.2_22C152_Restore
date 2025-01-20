@interface CUIKSingleDayTimelineLayout
- (BOOL)_inputIsInvalid;
- (BOOL)isRightToLeftLayout;
- (CGRect)_rectForStartSeconds:(int64_t)a3 endSeconds:(int64_t)a4;
- (CUIKSingleDayTimelineLayout)initWithOccurrences:(id)a3 startOfDay:(id)a4 endOfDay:(id)a5 geometryDelegate:(id)a6 screenUtilsDelegate:(id)a7 calendar:(id)a8;
- (double)_adjustedEndTimeForOccurrence:(id)a3;
- (double)_adjustedStartTimeForOccurrence:(id)a3;
- (double)_combinedWidthOfPartitions;
- (double)_effectiveEndTimeForOccurrence:(id)a3;
- (double)_endOfCollisionZoneForY:(double)a3 occurrence:(id)a4;
- (double)_topOfOccurrence:(id)a3;
- (id)groupOccurrences:(id)a3;
- (void)_calculateVerticalFrameAspectsForOccurrence:(id)a3;
- (void)_capVisibleTextForBucket:(id)a3;
- (void)_findCollidingOccurrences;
- (void)_generateNewPartitions;
- (void)_initializeFirstGridStripe;
- (void)_inputIsInvalid;
- (void)_mergePartitions;
- (void)_popOccurrencesInPartition:(id)a3 endingBeforeTime:(double)a4;
- (void)_putCollidingOccurrencesIntoBucketsInResize:(BOOL)a3;
- (void)_reclaimSpaceFromStackedOccurrences;
- (void)_stampOccurrenceFrames;
- (void)applyLayoutToOccurrences;
- (void)applyLayoutToOccurrencesInResize:(BOOL)a3;
@end

@implementation CUIKSingleDayTimelineLayout

uint64_t __53__CUIKSingleDayTimelineLayout__stampOccurrenceFrames__block_invoke(uint64_t a1, void *a2)
{
  return [a2 stampFramesOntoOccurrences];
}

uint64_t __64__CUIKSingleDayTimelineLayout_applyLayoutToOccurrencesInResize___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _calculateVerticalFrameAspectsForOccurrence:a2];
}

- (id)groupOccurrences:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v7 = self->_ungroupedOccurrences;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v46 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v45 + 1) + 8 * i);
        if ([v4 itemIsEligibleForGrouping:v12]) {
          v13 = v5;
        }
        else {
          v13 = v6;
        }
        [v13 addObject:v12];
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v45 objects:v49 count:16];
    }
    while (v9);
  }

  [v5 sortUsingComparator:&__block_literal_global_3];
  v42 = self;
  p_geometryDelegate = &self->_geometryDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_geometryDelegate);
  int v16 = [WeakRetained originIsUpperLeft];

  if ([v5 count])
  {
    unint64_t v17 = 0;
    do
    {
      v18 = [v5 objectAtIndexedSubscript:v17];
      id v19 = objc_loadWeakRetained((id *)p_geometryDelegate);
      v20 = [v18 start];
      [v20 timeIntervalSinceReferenceDate];
      objc_msgSend(v19, "pointForDate:");
      double v22 = v21;

      [v18 enoughHeightForOneLine];
      double v24 = v23;
      unint64_t v44 = v17;
      unint64_t v25 = v17 + 1;
      unint64_t v43 = v17 + 1;
      if (v17 + 1 < [v5 count])
      {
        double v26 = -v24;
        if (v16) {
          double v26 = v24;
        }
        double v27 = v22 + v26;
        while (1)
        {
          v28 = [v5 objectAtIndexedSubscript:v25];
          id v29 = objc_loadWeakRetained((id *)p_geometryDelegate);
          v30 = [v28 start];
          [v30 timeIntervalSinceReferenceDate];
          objc_msgSend(v29, "pointForDate:");
          double v32 = v31;

          if (v16 ? v32 > v27 : v32 < v27) {
            break;
          }
          v34 = [v4 groupItem:v18 withItem:v28];
          v35 = v34;
          if (v34)
          {
            if (v34 != v18)
            {
              id v36 = v34;

              [v5 setObject:v36 atIndexedSubscript:v44];
              v18 = v36;
            }
            [v5 removeObjectAtIndex:v25];
            [v18 enoughHeightForOneLine];
            if (!v16) {
              double v37 = -v37;
            }
            double v27 = v22 + v37;
            --v25;
          }

          ++v25;
          if (v25 >= [v5 count]) {
            goto LABEL_30;
          }
        }
      }
LABEL_30:

      unint64_t v17 = v43;
    }
    while (v43 < [v5 count]);
  }
  [v6 addObjectsFromArray:v5];
  [v6 sortUsingComparator:&__block_literal_global_3];
  uint64_t v38 = [v6 copy];
  occurrences = v42->_occurrences;
  v42->_occurrences = (NSArray *)v38;

  v40 = v42->_occurrences;
  return v40;
}

- (void)applyLayoutToOccurrencesInResize:(BOOL)a3
{
  p_occurrences = (id *)&self->_occurrences;
  if (!self->_occurrences) {
    objc_storeStrong((id *)&self->_occurrences, self->_ungroupedOccurrences);
  }
  double Current = CFAbsoluteTimeGetCurrent();
  if (*p_occurrences && objc_msgSend(*p_occurrences, "count", Current))
  {
    if ([(CUIKSingleDayTimelineLayout *)self _inputIsInvalid])
    {
      v7 = +[CUIKLogSubsystem defaultCategory];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[CUIKSingleDayTimelineLayout applyLayoutToOccurrencesInResize:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
    else
    {
      [(CUIKSingleDayTimelineLayout *)self _initializeFirstGridStripe];
      unint64_t v15 = [(NSArray *)self->_occurrences count];
      occurrences = self->_occurrences;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __64__CUIKSingleDayTimelineLayout_applyLayoutToOccurrencesInResize___block_invoke;
      v22[3] = &unk_1E63697F8;
      v22[4] = self;
      [(NSArray *)occurrences enumerateObjectsUsingBlock:v22];
      if (self->_currentOccurrenceIndex < v15)
      {
        do
        {
          -[NSArray objectAtIndex:](self->_occurrences, "objectAtIndex:");
          unint64_t v17 = (CUIKSingleDayTimelineViewItem *)objc_claimAutoreleasedReturnValue();
          currentOccurrence = self->_currentOccurrence;
          self->_currentOccurrence = v17;

          if (a3)
          {
            [(CUIKSingleDayTimelineLayout *)self _findCollidingOccurrences];
            [(CUIKSingleDayTimelineLayout *)self _putCollidingOccurrencesIntoBucketsInResize:1];
          }
          else
          {
            [(CUIKSingleDayTimelineLayout *)self _generateNewPartitions];
            [(CUIKSingleDayTimelineLayout *)self _mergePartitions];
            [(CUIKSingleDayTimelineLayout *)self _findCollidingOccurrences];
            [(CUIKSingleDayTimelineLayout *)self _putCollidingOccurrencesIntoBucketsInResize:0];
            [(CUIKSingleDayTimelineLayout *)self _reclaimSpaceFromStackedOccurrences];
          }
          [(CUIKSingleDayTimelineLayout *)self _stampOccurrenceFrames];
          unint64_t currentOccurrenceIndex = self->_currentOccurrenceIndex + 1;
          self->_unint64_t currentOccurrenceIndex = currentOccurrenceIndex;
          if (currentOccurrenceIndex == v15)
          {
            occurrenceBuckets = self->_occurrenceBuckets;
            v21[0] = MEMORY[0x1E4F143A8];
            v21[1] = 3221225472;
            v21[2] = __64__CUIKSingleDayTimelineLayout_applyLayoutToOccurrencesInResize___block_invoke_2;
            v21[3] = &unk_1E6369820;
            v21[4] = self;
            [(NSMutableArray *)occurrenceBuckets enumerateObjectsUsingBlock:v21];
            unint64_t currentOccurrenceIndex = self->_currentOccurrenceIndex;
          }
        }
        while (currentOccurrenceIndex < v15);
      }
    }
  }
}

- (void)_stampOccurrenceFrames
{
  if ([(NSMutableArray *)self->_occurrenceBuckets count] == 1)
  {
    v3 = [(NSMutableArray *)self->_occurrenceBuckets objectAtIndex:0];
    [v3 setIsOnlyBucket:1];
  }
  occurrenceBuckets = self->_occurrenceBuckets;

  [(NSMutableArray *)occurrenceBuckets enumerateObjectsUsingBlock:&__block_literal_global_10];
}

- (void)_reclaimSpaceFromStackedOccurrences
{
  if ([(NSMutableArray *)self->_occurrenceBuckets count])
  {
    occurrenceBuckets = self->_occurrenceBuckets;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __66__CUIKSingleDayTimelineLayout__reclaimSpaceFromStackedOccurrences__block_invoke;
    v4[3] = &unk_1E6369820;
    v4[4] = self;
    [(NSMutableArray *)occurrenceBuckets enumerateObjectsUsingBlock:v4];
  }
}

- (void)_mergePartitions
{
  [(CUIKSingleDayTimelineLayout *)self _adjustedStartTimeForOccurrence:self->_currentOccurrence];
  uint64_t v4 = v3;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = __Block_byref_object_copy__2;
  v7[4] = __Block_byref_object_dispose__2;
  id v8 = 0;
  id v5 = (void *)[(NSMutableArray *)self->_partitions copy];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__CUIKSingleDayTimelineLayout__mergePartitions__block_invoke;
  v6[3] = &unk_1E6369898;
  v6[6] = v4;
  v6[4] = self;
  v6[5] = v7;
  [v5 enumerateObjectsUsingBlock:v6];

  _Block_object_dispose(v7, 8);
}

- (void)_generateNewPartitions
{
  uint64_t v3 = [(NSMutableArray *)self->_occurrenceBuckets count];
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v6[3] = 0;
  occurrenceBuckets = self->_occurrenceBuckets;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__CUIKSingleDayTimelineLayout__generateNewPartitions__block_invoke;
  v5[3] = &unk_1E6369870;
  v5[5] = v6;
  v5[6] = v3;
  v5[4] = self;
  [(NSMutableArray *)occurrenceBuckets enumerateObjectsUsingBlock:v5];
  _Block_object_dispose(v6, 8);
}

void __53__CUIKSingleDayTimelineLayout__generateNewPartitions__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [v5 occurrences];
  uint64_t v7 = [v6 count];
  if (v7)
  {
    uint64_t v8 = v7;
    [*(id *)(a1 + 32) _capVisibleTextForBucket:v5];
    char v9 = [*(id *)(a1 + 32) isRightToLeftLayout];
    uint64_t v10 = [v5 correspondingPartition];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __53__CUIKSingleDayTimelineLayout__generateNewPartitions__block_invoke_2;
    v13[3] = &unk_1E6369848;
    char v17 = v9;
    uint64_t v11 = *(void *)(a1 + 40);
    v13[4] = *(void *)(a1 + 32);
    id v14 = v10;
    uint64_t v15 = v11;
    uint64_t v16 = a3;
    id v12 = v10;
    [v6 enumerateObjectsUsingBlock:v13];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v8
                                                                + *(void *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 24)
                                                                - 1;
  }
}

void __66__CUIKSingleDayTimelineLayout__reclaimSpaceFromStackedOccurrences__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = [v9 occurrences];
  if ([v3 count])
  {
    uint64_t v4 = [v3 objectAtIndex:0];
    [*(id *)(a1 + 32) _adjustedStartTimeForOccurrence:v4];
    double v6 = v5;
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = [v9 correspondingPartition];
    [v7 _popOccurrencesInPartition:v8 endingBeforeTime:v6];
  }
}

void __47__CUIKSingleDayTimelineLayout__mergePartitions__block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  [*(id *)(a1 + 32) _popOccurrencesInPartition:v10 endingBeforeTime:*(double *)(a1 + 48)];
  uint64_t v4 = v10;
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    double v5 = [v10 stackedOccurrences];
    if ([v5 count])
    {

      uint64_t v4 = v10;
    }
    else
    {
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) topBoundaryTime];
      double v7 = v6;
      double v8 = *(double *)(a1 + 48);

      uint64_t v4 = v10;
      if (v7 <= v8)
      {
        [*(id *)(*(void *)(a1 + 32) + 40) removeObject:v10];
        [v10 endBoundary];
        objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "setEndBoundary:");
        goto LABEL_8;
      }
    }
  }
  [v4 topBoundaryTime];
  if (*(double *)(a1 + 48) > v9) {
    objc_msgSend(v10, "setTopBoundaryTime:");
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
LABEL_8:
}

- (void)_putCollidingOccurrencesIntoBucketsInResize:(BOOL)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(NSMutableArray *)self->_partitions count];
  uint64_t v6 = [(NSMutableArray *)self->_collidingOccurrences count];
  [(NSMutableArray *)self->_occurrenceBuckets removeAllObjects];
  [(CUIKSingleDayTimelineLayout *)self _combinedWidthOfPartitions];
  uint64_t v8 = v7;
  if ([(CUIKSingleDayTimelineLayout *)self isRightToLeftLayout]) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = v5 - 1;
  }
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  v35[3] = 0;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  double v32 = __Block_byref_object_copy__2;
  v33 = __Block_byref_object_dispose__2;
  id v34 = 0;
  partitions = self->_partitions;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __75__CUIKSingleDayTimelineLayout__putCollidingOccurrencesIntoBucketsInResize___block_invoke;
  v21[3] = &unk_1E63698C0;
  double v23 = v35;
  v21[4] = self;
  uint64_t v25 = v9;
  uint64_t v26 = v6;
  uint64_t v27 = v8;
  BOOL v28 = a3;
  id v12 = v10;
  id v22 = v12;
  double v24 = &v29;
  [(NSMutableArray *)partitions enumerateObjectsWithOptions:0 usingBlock:v21];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v17 objects:v36 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend((id)v30[5], "addOccurrenceTemporarilyToEnd:", *(void *)(*((void *)&v17 + 1) + 8 * v16), (void)v17);
        [(id)v30[5] makeTemporaryChangesPermanent];
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v17 objects:v36 count:16];
    }
    while (v14);
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(v35, 8);
}

- (BOOL)isRightToLeftLayout
{
  p_geometryDelegate = &self->_geometryDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_geometryDelegate);
  if (!WeakRetained) {
    return 0;
  }
  uint64_t v4 = WeakRetained;
  id v5 = objc_loadWeakRetained((id *)p_geometryDelegate);
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0) {
    return 0;
  }
  id v7 = objc_loadWeakRetained((id *)p_geometryDelegate);
  char v8 = [v7 shouldReverseLayoutDirection];

  return v8;
}

- (double)_combinedWidthOfPartitions
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = self->_partitions;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    double v6 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "freeSpaceWidth", (void)v10);
        double v6 = v6 + v8;
      }
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

void __75__CUIKSingleDayTimelineLayout__putCollidingOccurrencesIntoBucketsInResize___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  double v6 = v5;
  if (*(void *)(a1 + 64) == a3)
  {
    id v7 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "subarrayWithRange:", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "count")- *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
    double v8 = (void *)[v7 mutableCopy];
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 72);
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    double v8 = (void *)(v9 - v10);
    if (v9 != v10)
    {
      [v5 freeSpaceWidth];
      unint64_t v12 = vcvtad_u64_f64(v11 / *(double *)(a1 + 80) * (double)*(unint64_t *)(a1 + 72));
      if ((unint64_t)v8 >= v12) {
        unint64_t v13 = v12;
      }
      else {
        unint64_t v13 = (unint64_t)v8;
      }
      uint64_t v14 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "subarrayWithRange:", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), v13);
      double v8 = (void *)[v14 mutableCopy];

      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += v13;
    }
  }
  [v6 topBoundaryTime];
  double v16 = v15;
  if (!*(unsigned char *)(a1 + 88))
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v17 = objc_msgSend(v8, "mutableCopy", 0);
    uint64_t v18 = [v17 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v36 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v35 + 1) + 8 * i);
          [*(id *)(a1 + 32) _adjustedStartTimeForOccurrence:v22];
          if (v23 < v16)
          {
            [*(id *)(a1 + 40) addObject:v22];
            [v8 removeObject:v22];
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v19);
    }
  }
  double v24 = [CUIKSingleDayTimelineOccurrenceBucket alloc];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
  id v26 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 136));
  uint64_t v27 = [(CUIKSingleDayTimelineOccurrenceBucket *)v24 initWithOccurrences:v8 correspondingPartition:v6 screenUtilsDelegate:WeakRetained geometryDelegate:v26];

  [*(id *)(*(void *)(a1 + 32) + 48) addObject:v27];
  uint64_t v28 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v31 = *(void **)(v28 + 40);
  uint64_t v29 = (id *)(v28 + 40);
  v30 = v31;
  if (!v31) {
    goto LABEL_22;
  }
  double v32 = [v30 correspondingPartition];
  [v32 topBoundaryTime];
  double v34 = v33;

  if (v16 < v34)
  {
    uint64_t v29 = (id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
LABEL_22:
    objc_storeStrong(v29, v27);
  }
}

- (void)_capVisibleTextForBucket:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v18 = v4;
    id v5 = [v4 earliestOccurrence];
    if (v5)
    {
      double v6 = [v18 correspondingPartition];
      id v7 = [v6 peekOccurrence];

      if (v7 && ([v7 visibleHeightLocked] & 1) == 0)
      {
        [(CUIKSingleDayTimelineLayout *)self _adjustedStartTimeForOccurrence:v5];
        double v9 = v8;
        p_geometryDelegate = &self->_geometryDelegate;
        id WeakRetained = objc_loadWeakRetained((id *)p_geometryDelegate);
        [WeakRetained pointForDate:v9];
        double v13 = v12;

        [v7 stagedFrame];
        double v15 = v13 - v14;
        id v16 = objc_loadWeakRetained((id *)p_geometryDelegate);
        LOBYTE(WeakRetained) = [v16 originIsUpperLeft];

        if ((WeakRetained & 1) == 0)
        {
          [v7 stagedFrame];
          double v15 = v15 - v17;
        }
        [v7 setVisibleHeight:fabs(v15)];
      }
    }
    id v4 = v18;
  }
}

- (void)_popOccurrencesInPartition:(id)a3 endingBeforeTime:(double)a4
{
  id v6 = a3;
  if (v6)
  {
    id v10 = v6;
    id v7 = [v6 peekOccurrence];
    id v6 = v10;
    if (v7)
    {
      do
      {
        [(CUIKSingleDayTimelineLayout *)self _effectiveEndTimeForOccurrence:v7];
        if (v8 > a4) {
          break;
        }
        [v10 popOccurrence];
        uint64_t v9 = [v10 peekOccurrence];

        id v7 = (void *)v9;
      }
      while (v9);

      id v6 = v10;
    }
  }
}

void __53__CUIKSingleDayTimelineLayout__generateNewPartitions__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v39 = a2;
  [v39 stagedFrame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
  +[CUIKSingleDayTimelineOccurrenceBucket roundRectToScreenScaleForRect:screenUtilsDelegate:](CUIKSingleDayTimelineOccurrenceBucket, "roundRectToScreenScaleForRect:screenUtilsDelegate:", WeakRetained, v6, v8, v10, v12);
  objc_msgSend(v39, "setStagedFrame:");

  [v39 stagedFrame];
  CGFloat x = v41.origin.x;
  CGFloat y = v41.origin.y;
  CGFloat width = v41.size.width;
  CGFloat height = v41.size.height;
  double MinY = CGRectGetMinY(v41);
  id v19 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 136));
  LOBYTE(WeakRetained) = [v19 originIsUpperLeft];

  if ((WeakRetained & 1) == 0)
  {
    v42.origin.CGFloat x = x;
    v42.origin.CGFloat y = y;
    v42.size.CGFloat width = width;
    v42.size.CGFloat height = height;
    double MinY = CGRectGetMaxY(v42);
  }
  [*(id *)(a1 + 32) _endOfCollisionZoneForY:v39 occurrence:MinY];
  double v21 = v20;
  id v22 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 136));
  [v22 displayedRect];
  double MidX = CGRectGetMidX(v43);

  id v24 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 136));
  objc_msgSend(v24, "dateForPoint:", MidX, v21);
  double v26 = v25;

  CGFloat v27 = x;
  CGFloat v28 = y;
  CGFloat v29 = width;
  CGFloat v30 = height;
  if (*(unsigned char *)(a1 + 64)) {
    double MinX = CGRectGetMinX(*(CGRect *)&v27);
  }
  else {
    double MinX = CGRectGetMaxX(*(CGRect *)&v27);
  }
  double v32 = MinX;
  if (a3)
  {
    double v33 = objc_alloc_init(CUIKSingleDayTimelineLayoutPartition);
    [(CUIKSingleDayTimelineLayoutPartition *)v33 setTopBoundaryTime:v26];
    CGFloat v34 = x;
    CGFloat v35 = y;
    CGFloat v36 = width;
    CGFloat v37 = height;
    if (*(unsigned char *)(a1 + 64)) {
      double MaxX = CGRectGetMaxX(*(CGRect *)&v34);
    }
    else {
      double MaxX = CGRectGetMinX(*(CGRect *)&v34);
    }
    [(CUIKSingleDayTimelineLayoutPartition *)v33 setInitialStartBoundary:MaxX];
    [(CUIKSingleDayTimelineLayoutPartition *)v33 setEndBoundary:v32];
    [(CUIKSingleDayTimelineLayoutPartition *)v33 pushOccurrence:v39];
    [*(id *)(*(void *)(a1 + 32) + 40) insertObject:v33 atIndex:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) + a3 + *(void *)(a1 + 56)];
  }
  else
  {
    [*(id *)(a1 + 32) _adjustedStartTimeForOccurrence:v39];
    objc_msgSend(*(id *)(a1 + 32), "_popOccurrencesInPartition:endingBeforeTime:", *(void *)(a1 + 40));
    [*(id *)(a1 + 40) setTopBoundaryTime:v26];
    [*(id *)(a1 + 40) setEndBoundary:v32];
    [*(id *)(a1 + 40) pushOccurrence:v39];
  }
}

- (void)_findCollidingOccurrences
{
  id v22 = self->_currentOccurrence;
  [(NSMutableArray *)self->_collidingOccurrences removeAllObjects];
  [(NSMutableArray *)self->_collidingOccurrences addObject:v22];
  [(CUIKSingleDayTimelineLayout *)self _adjustedStartTimeForOccurrence:v22];
  double v4 = v3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_geometryDelegate);
  [WeakRetained pointForDate:v4];
  double v7 = v6;

  [(CUIKSingleDayTimelineLayout *)self _endOfCollisionZoneForY:v22 occurrence:v7];
  double v9 = v8;
  unint64_t v10 = [(NSArray *)self->_occurrences count];
  if (self->_currentOccurrenceIndex + 1 < v10)
  {
    unint64_t v11 = v10;
    uint64_t v12 = 1;
    while (1)
    {
      double v13 = -[NSArray objectAtIndex:](self->_occurrences, "objectAtIndex:");
      [(CUIKSingleDayTimelineLayout *)self _adjustedStartTimeForOccurrence:v13];
      double v15 = v14;
      id v16 = objc_loadWeakRetained((id *)&self->_geometryDelegate);
      [v16 pointForDate:v15];
      double v18 = v17;

      id v19 = objc_loadWeakRetained((id *)&self->_geometryDelegate);
      if ([v19 originIsUpperLeft])
      {
        if (v18 > v9) {
          break;
        }
      }
      id v20 = objc_loadWeakRetained((id *)&self->_geometryDelegate);
      char v21 = [v20 originIsUpperLeft];

      if ((v21 & 1) == 0 && v18 < v9) {
        goto LABEL_10;
      }
      -[NSMutableArray insertObject:atIndex:](self->_collidingOccurrences, "insertObject:atIndex:", v13, -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](self->_collidingOccurrences, "indexOfObject:inSortedRange:options:usingComparator:", v13, 0, v12++, 1280, &__block_literal_global_12_0));
      ++self->_currentOccurrenceIndex;

      if (self->_currentOccurrenceIndex + 1 >= v11) {
        goto LABEL_11;
      }
    }

LABEL_10:
  }
LABEL_11:
}

- (double)_endOfCollisionZoneForY:(double)a3 occurrence:(id)a4
{
  id v6 = a4;
  [v6 viewMaxNaturalTextHeight];
  double v8 = v7;
  [v6 stagedFrame];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  v23.origin.CGFloat x = v10;
  v23.origin.CGFloat y = v12;
  v23.size.CGFloat width = v14;
  v23.size.CGFloat height = v16;
  double Height = CGRectGetHeight(v23);
  if (Height < v8) {
    double v8 = Height;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_geometryDelegate);
  int v19 = [WeakRetained originIsUpperLeft];
  double v20 = -1.0;
  if (v19) {
    double v20 = 1.0;
  }
  double v21 = a3 + v8 * v20;

  return v21;
}

- (void)_calculateVerticalFrameAspectsForOccurrence:(id)a3
{
  id v57 = a3;
  double v4 = [v57 startWithTravelTime];
  double v5 = 0.0;
  double v6 = 0.0;
  if ([v4 isAfterDate:self->_startOfDay])
  {
    double v7 = [(NSCalendar *)self->_calendar components:224 fromDate:v4];
    uint64_t v8 = [v7 second];
    uint64_t v9 = v8 + 60 * [v7 minute];
    double v6 = (double)(v9 + 3600 * [v7 hour]);
  }
  CGFloat v10 = [v57 start];
  if ([v10 isAfterDate:self->_startOfDay])
  {
    double v11 = [(NSCalendar *)self->_calendar components:224 fromDate:v10];
    uint64_t v12 = [v11 second];
    uint64_t v13 = v12 + 60 * [v11 minute];
    double v5 = (double)(v13 + 3600 * [v11 hour]);
  }
  CGFloat v14 = [v57 end];
  if ([v14 isBeforeDate:self->_endOfDay])
  {
    double v15 = [(NSCalendar *)self->_calendar components:224 fromDate:v14];
    uint64_t v16 = [v15 second];
    uint64_t v17 = v16 + 60 * [v15 minute];
    double v18 = (double)(v17 + 3600 * [v15 hour]);

    uint64_t v19 = (uint64_t)v18;
  }
  else
  {
    uint64_t v19 = 86400;
  }
  [(CUIKSingleDayTimelineLayout *)self _rectForStartSeconds:(uint64_t)v6 endSeconds:v19];
  double v55 = v21;
  double v56 = v20;
  double v54 = v22;
  double v24 = v23;
  [(CUIKSingleDayTimelineLayout *)self _rectForStartSeconds:(uint64_t)v5 endSeconds:v19];
  CGFloat v26 = v25;
  double v28 = v27;
  CGFloat v30 = v29;
  CGFloat v32 = v31;
  [v57 enoughHeightForOneLine];
  double v33 = v5;
  double v35 = v34;
  CGFloat v53 = v26;
  v59.origin.CGFloat x = v26;
  v59.origin.CGFloat y = v28;
  v59.size.CGFloat width = v30;
  v59.size.CGFloat height = v32;
  double Height = CGRectGetHeight(v59);
  if (Height >= v35)
  {
    double v35 = v32;
    long long v46 = v57;
    double v44 = v55;
    double v47 = v56;
    double v45 = v54;
  }
  else
  {
    double v37 = Height;
    double v38 = 0.0;
    if (v33 - v6 > 0.0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_geometryDelegate);
      [WeakRetained hourHeight];
      double v38 = (v33 - v6) / 3600.0 * v40;
    }
    double v24 = v35 + v38;
    id v41 = objc_loadWeakRetained((id *)&self->_geometryDelegate);
    int v42 = [v41 originIsUpperLeft];

    double v43 = v35 - v37;
    if (v42) {
      double v43 = 0.0;
    }
    double v44 = v55;
    double v45 = v54 - v43;
    double v28 = v28 - v43;
    long long v46 = v57;
    double v47 = v56;
  }
  [v46 setTravelTimeHeight:v24 - v35];
  char v48 = [v57 hideTravelTime];
  if (v48) {
    double v49 = v53;
  }
  else {
    double v49 = v47;
  }
  if (v48) {
    double v50 = v28;
  }
  else {
    double v50 = v45;
  }
  if (v48) {
    double v51 = v30;
  }
  else {
    double v51 = v44;
  }
  if (v48) {
    double v52 = v35;
  }
  else {
    double v52 = v24;
  }
  objc_msgSend(v57, "setStagedFrame:", v49, v50, v51, v52);
}

- (CGRect)_rectForStartSeconds:(int64_t)a3 endSeconds:(int64_t)a4
{
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  int64_t v6 = a4 - a3;
  int64_t v7 = (a4 + 100) % 3600;
  unint64_t v8 = a4 - a3 - 1679;
  if ((double)a3 / 86400.0 >= 0.0) {
    double v9 = (double)a3 / 86400.0;
  }
  else {
    double v9 = 0.0;
  }
  p_geometryDelegate = &self->_geometryDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_geometryDelegate);
  [WeakRetained hourHeight];
  double v13 = v12;

  double v14 = v13 * 24.0;
  id v15 = objc_loadWeakRetained((id *)p_geometryDelegate);
  [v15 topPadding];
  double v17 = v16;

  p_screenUtilsDelegate = &self->_screenUtilsDelegate;
  id v19 = objc_loadWeakRetained((id *)p_screenUtilsDelegate);
  [v19 RoundToScreenScale:v9 * v14];
  double v21 = v17 + v20;

  id v22 = objc_loadWeakRetained((id *)p_screenUtilsDelegate);
  [v22 RoundToScreenScale:(double)v6 / 86400.0 * v14];
  double v24 = v23;

  double v25 = v24 + -0.5 + -0.5;
  if (v7 >= 200) {
    double v25 = v24 + -0.5;
  }
  if (v8 < 0xF3) {
    double v24 = v25;
  }
  id v26 = objc_loadWeakRetained((id *)p_screenUtilsDelegate);
  id v27 = objc_loadWeakRetained((id *)p_geometryDelegate);
  [v27 timeWidth];
  objc_msgSend(v26, "RoundToScreenScale:");
  double v29 = v28;

  id v30 = objc_loadWeakRetained((id *)p_geometryDelegate);
  LOBYTE(v27) = [v30 originIsUpperLeft];

  if ((v27 & 1) == 0)
  {
    id v31 = objc_loadWeakRetained((id *)p_geometryDelegate);
    [v31 displayedRect];
    double v21 = v32 - v21 - v24;
  }
  double v33 = v29;
  double v34 = v21;
  double v35 = v5;
  double v36 = v24;
  result.size.CGFloat height = v36;
  result.size.CGFloat width = v35;
  result.origin.CGFloat y = v34;
  result.origin.CGFloat x = v33;
  return result;
}

uint64_t __48__CUIKSingleDayTimelineLayout_groupOccurrences___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  if ([v5 hideTravelTime]) {
    [v5 start];
  }
  else {
  int64_t v6 = [v5 startWithTravelTime];
  }

  if ([v4 hideTravelTime]) {
    [v4 start];
  }
  else {
  int64_t v7 = [v4 startWithTravelTime];
  }
  uint64_t v8 = [v6 compare:v7];

  return v8;
}

- (double)_adjustedStartTimeForOccurrence:(id)a3
{
  id v4 = a3;
  if ([v4 hideTravelTime]) {
    [v4 start];
  }
  else {
  id v5 = [v4 startWithTravelTime];
  }

  [v5 timeIntervalSinceReferenceDate];
  double v7 = v6;

  double result = self->_startOfDayAbsoluteTime;
  if (result < v7) {
    return v7;
  }
  return result;
}

- (double)_effectiveEndTimeForOccurrence:(id)a3
{
  id v4 = a3;
  [(CUIKSingleDayTimelineLayout *)self _adjustedEndTimeForOccurrence:v4];
  double v6 = v5;
  [v4 stagedFrame];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  v20.origin.CGFloat x = v8;
  v20.origin.CGFloat y = v10;
  v20.size.CGFloat width = v12;
  v20.size.CGFloat height = v14;
  double MaxY = CGRectGetMaxY(v20);
  id v16 = objc_loadWeakRetained((id *)&self->_geometryDelegate);
  [v16 displayedRect];
  objc_msgSend(v16, "dateForPoint:", CGRectGetMidX(v21), MaxY);
  double v18 = v17;

  if (v18 <= v6) {
    return v6;
  }
  if (v18 - v6 < 90.0) {
    return v6;
  }
  return v18;
}

- (double)_adjustedEndTimeForOccurrence:(id)a3
{
  id v4 = [a3 end];
  [v4 timeIntervalSinceReferenceDate];
  double v6 = v5;

  double result = self->_endOfDayAbsoluteTime;
  if (result >= v6) {
    return v6;
  }
  return result;
}

- (BOOL)_inputIsInvalid
{
  double width = self->_frame.size.width;
  BOOL v4 = width <= 0.0;
  if (width <= 0.0)
  {
    double v5 = +[CUIKLogSubsystem defaultCategory];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(CUIKSingleDayTimelineLayout *)v5 _inputIsInvalid];
    }
  }
  [(NSDate *)self->_endOfDay timeIntervalSinceDate:self->_startOfDay];
  if (v13 < 0.0)
  {
    CGFloat v14 = +[CUIKLogSubsystem defaultCategory];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      [(CUIKSingleDayTimelineLayout *)v14 _inputIsInvalid];
    }

    return 1;
  }
  return v4;
}

- (void)_initializeFirstGridStripe
{
  double v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  partitions = self->_partitions;
  self->_partitions = v3;

  uint64_t v11 = objc_alloc_init(CUIKSingleDayTimelineLayoutPartition);
  MEMORY[0x1C1889970](self->_startOfDay);
  -[CUIKSingleDayTimelineLayoutPartition setTopBoundaryTime:](v11, "setTopBoundaryTime:");
  BOOL v5 = [(CUIKSingleDayTimelineLayout *)self isRightToLeftLayout];
  CGFloat x = self->_frame.origin.x;
  CGFloat y = self->_frame.origin.y;
  CGFloat width = self->_frame.size.width;
  CGFloat height = self->_frame.size.height;
  if (v5)
  {
    [(CUIKSingleDayTimelineLayoutPartition *)v11 setInitialStartBoundary:CGRectGetMaxX(*(CGRect *)&x)];
    double MinX = CGRectGetMinX(self->_frame);
  }
  else
  {
    [(CUIKSingleDayTimelineLayoutPartition *)v11 setInitialStartBoundary:CGRectGetMinX(*(CGRect *)&x)];
    double MinX = CGRectGetMaxX(self->_frame);
  }
  [(CUIKSingleDayTimelineLayoutPartition *)v11 setEndBoundary:MinX];
  [(NSMutableArray *)self->_partitions addObject:v11];
}

- (void)applyLayoutToOccurrences
{
}

uint64_t __64__CUIKSingleDayTimelineLayout_applyLayoutToOccurrencesInResize___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _capVisibleTextForBucket:a2];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_screenUtilsDelegate);
  objc_destroyWeak((id *)&self->_geometryDelegate);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_endOfDay, 0);
  objc_storeStrong((id *)&self->_startOfDay, 0);
  objc_storeStrong((id *)&self->_collidingOccurrences, 0);
  objc_storeStrong((id *)&self->_occurrenceBuckets, 0);
  objc_storeStrong((id *)&self->_partitions, 0);
  objc_storeStrong((id *)&self->_currentOccurrence, 0);
  objc_storeStrong((id *)&self->_occurrences, 0);

  objc_storeStrong((id *)&self->_ungroupedOccurrences, 0);
}

- (CUIKSingleDayTimelineLayout)initWithOccurrences:(id)a3 startOfDay:(id)a4 endOfDay:(id)a5 geometryDelegate:(id)a6 screenUtilsDelegate:(id)a7 calendar:(id)a8
{
  id v33 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v34.receiver = self;
  v34.super_class = (Class)CUIKSingleDayTimelineLayout;
  uint64_t v20 = [(CUIKSingleDayTimelineLayout *)&v34 init];
  uint64_t v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_ungroupedOccurrences, a3);
    objc_storeStrong((id *)&v21->_calendar, a8);
    objc_storeStrong((id *)&v21->_startOfDay, a4);
    [v15 timeIntervalSinceReferenceDate];
    v21->_startOfDayAbsoluteTime = v22;
    objc_storeStrong((id *)&v21->_endOfDay, a5);
    [v16 timeIntervalSinceReferenceDate];
    v21->_endOfDayAbsoluteTime = v23;
    [v17 displayedRect];
    v21->_frame.origin.CGFloat x = v24;
    v21->_frame.origin.CGFloat y = v25;
    v21->_frame.size.CGFloat width = v26;
    v21->_frame.size.CGFloat height = v27;
    objc_storeWeak((id *)&v21->_geometryDelegate, v17);
    objc_storeWeak((id *)&v21->_screenUtilsDelegate, v18);
    double v28 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    occurrenceBuckets = v21->_occurrenceBuckets;
    v21->_occurrenceBuckets = v28;

    id v30 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    collidingOccurrences = v21->_collidingOccurrences;
    v21->_collidingOccurrences = v30;
  }
  return v21;
}

- (double)_topOfOccurrence:(id)a3
{
  [(CUIKSingleDayTimelineLayout *)self _adjustedStartTimeForOccurrence:a3];
  double v5 = v4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_geometryDelegate);
  [WeakRetained pointForDate:v5];
  double v8 = v7;

  return v8;
}

- (void)applyLayoutToOccurrencesInResize:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_inputIsInvalid
{
}

@end