@interface HUClipScrubberDataSource
- (BOOL)isEditing;
- (BOOL)isSpacerAtIndexPath:(id)a3;
- (BOOL)isUpdating;
- (BOOL)isValidEventAtIndexPath:(id)a3;
- (BOOL)isValidRecordingEventAtIndexPath:(id)a3;
- (BOOL)isZoomingIn:(double)a3;
- (BOOL)selectionViewHidden;
- (HFCameraPlaybackEngine)playbackEngine;
- (HFCameraRecordingEvent)currentEvent;
- (HFCameraRecordingEvent)lastUpdatedEvent;
- (HUClipScrubberDataSource)initWithPlaybackEngine:(id)a3;
- (HUClipScrubberSelectionView)selectionView;
- (HUClipScrubberTimeController)timeController;
- (NSArray)currentEvents;
- (NSDate)currentDate;
- (OS_dispatch_queue)snapshotQueue;
- (UICollectionView)clipCollectionView;
- (UICollectionViewDiffableDataSource)diffableDataSource;
- (double)lastGestureScale;
- (double)offsetForEvent:(id)a3;
- (double)posterFrameWidth;
- (double)scrubbingResolutionForClip:(id)a3;
- (double)startingPinchDeltaX;
- (id)_snapshotForEvents:(id)a3 updatedIdentifiers:(id)a4 replacedIdentifiers:(id)a5;
- (id)eventForSection:(unint64_t)a3;
- (id)indexPathsForClip:(id)a3;
- (id)previousEventForSection:(unint64_t)a3;
- (id)reachabilitySectionCellForCollectionView:(id)a3 forEvent:(id)a4 atIndexPath:(id)a5;
- (id)recordingSectionCellForCollectionView:(id)a3 forEvent:(id)a4 atIndexPath:(id)a5;
- (id)selectedDateFromCell:(id)a3 atCurrentOffset:(double)a4;
- (id)spacerCellForCollectionView:(id)a3 forEvent:(id)a4 atIndexPath:(id)a5;
- (id)startDateFromCell:(id)a3;
- (int64_t)lastSelectedClipIndex;
- (unint64_t)currentTimelineState;
- (unint64_t)displayMode;
- (unint64_t)mostRecentClipIndex;
- (void)_addDiffableDataSource;
- (void)_updateSnapshot;
- (void)_updateSnapshotForEditing;
- (void)_updateSnapshotForEditingFor:(id)a3;
- (void)_updateSnapshotWithUpdatedIdentifiers:(id)a3 replacedIdentifiers:(id)a4;
- (void)_updateSnapshotWithUpdatedIdentifiers:(id)a3 replacedIdentifiers:(id)a4 forEvents:(id)a5;
- (void)beginTimeScaleTrackingForPinchGesture:(id)a3;
- (void)changeTimeScaleForNewScale:(double)a3;
- (void)changeTimeScaleForPinchGesture:(id)a3;
- (void)expandToMaximumZoom;
- (void)playbackEngine:(id)a3 didUpdateEventsIncludingUpdatedIdentifiers:(id)a4 replacedIdentifiers:(id)a5 removedIdentifiers:(id)a6;
- (void)reloadEvents;
- (void)setClipCollectionView:(id)a3;
- (void)setCurrentDate:(id)a3;
- (void)setCurrentEvent:(id)a3;
- (void)setCurrentTimelineState:(unint64_t)a3;
- (void)setDiffableDataSource:(id)a3;
- (void)setDisplayMode:(unint64_t)a3;
- (void)setEditing:(BOOL)a3;
- (void)setIsUpdating:(BOOL)a3;
- (void)setLastGestureScale:(double)a3;
- (void)setLastSelectedClipIndex:(int64_t)a3;
- (void)setLastUpdatedEvent:(id)a3;
- (void)setPlaybackEngine:(id)a3;
- (void)setPosterFrameWidth:(double)a3;
- (void)setSelectionView:(id)a3;
- (void)setSelectionViewHidden:(BOOL)a3;
- (void)setSnapshotQueue:(id)a3;
- (void)setStartingPinchDeltaX:(double)a3;
- (void)setTimeController:(id)a3;
- (void)shrinkToMinimumZoom;
- (void)toggleSelectionStateForItemAtIndexPath:(id)a3;
- (void)updateMostRecentClipIndex;
- (void)updateSelectionViewIfNeeded;
- (void)updateToClipAtIndexPath:(id)a3;
@end

@implementation HUClipScrubberDataSource

- (NSArray)currentEvents
{
  BOOL v3 = [(HUClipScrubberDataSource *)self isEditing];
  v4 = [(HUClipScrubberDataSource *)self playbackEngine];
  v5 = v4;
  if (v3) {
    [v4 cameraClips];
  }
  else {
  v6 = [v4 cameraEvents];
  }

  return (NSArray *)v6;
}

- (HUClipScrubberDataSource)initWithPlaybackEngine:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HUClipScrubberDataSource;
  v5 = [(HUClipScrubberDataSource *)&v18 init];
  v6 = v5;
  if (v5)
  {
    [(HUClipScrubberDataSource *)v5 setPlaybackEngine:v4];
    v7 = objc_alloc_init(HUClipScrubberTimeController);
    timeController = v6->_timeController;
    v6->_timeController = v7;

    v6->_lastSelectedClipIndex = -1;
    v9 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.Home.HUClipScrubberDataSource.snapshotQueue", v9);
    snapshotQueue = v6->_snapshotQueue;
    v6->_snapshotQueue = (OS_dispatch_queue *)v10;

    [(HUClipScrubberDataSource *)v6 reloadEvents];
    v12 = [v4 cameraEvents];
    v13 = [v12 lastObject];
    objc_storeWeak((id *)&v6->_currentEvent, v13);

    id WeakRetained = objc_loadWeakRetained((id *)&v6->_currentEvent);
    uint64_t v15 = [WeakRetained dateOfOccurrence];
    currentDate = v6->_currentDate;
    v6->_currentDate = (NSDate *)v15;
  }
  return v6;
}

- (void)reloadEvents
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HUClipScrubberDataSource *)self playbackEngine];
  uint64_t v4 = [v3 isCameraPortraitMode];
  v5 = [(HUClipScrubberDataSource *)self timeController];
  [v5 setPortraitMode:v4];

  [(HUClipScrubberDataSource *)self updateMostRecentClipIndex];
  v6 = [(HUClipScrubberDataSource *)self timeController];
  v7 = [(HUClipScrubberDataSource *)self playbackEngine];
  v8 = [v7 clipWithLongestDuration];
  [v6 recalculateMaximumPosterFrameDuration:v8];

  v9 = HFLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_queue_t v10 = [(HUClipScrubberDataSource *)self playbackEngine];
    v11 = [v10 cameraEvents];
    int v12 = 134217984;
    uint64_t v13 = [v11 count];
    _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "Reloaded clip data source with %lu clips.", (uint8_t *)&v12, 0xCu);
  }
  [(HUClipScrubberDataSource *)self _updateSnapshot];
}

- (void)setPlaybackEngine:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);

  if (WeakRetained != obj)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_playbackEngine);
    [v5 removeObserver:self];

    id v6 = objc_storeWeak((id *)&self->_playbackEngine, obj);
    v7 = [MEMORY[0x1E4F68FC0] defaultOptions];
    [obj addObserver:self withOptions:v7];
  }
}

- (void)setEditing:(BOOL)a3
{
  if (self->_editing != a3)
  {
    BOOL v3 = a3;
    self->_editing = a3;
    [(HUClipScrubberDataSource *)self setDisplayMode:a3];
    [(HUClipScrubberDataSource *)self updateMostRecentClipIndex];
    if (v3)
    {
      [(HUClipScrubberDataSource *)self _updateSnapshotForEditing];
    }
    else
    {
      [(HUClipScrubberDataSource *)self _updateSnapshot];
      [(HUClipScrubberDataSource *)self setSelectionViewHidden:1];
    }
  }
}

- (void)toggleSelectionStateForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HUClipScrubberDataSource *)self isEditing];
  id v6 = [(HUClipScrubberDataSource *)self clipCollectionView];
  id v7 = v6;
  if (v5) {
    [v6 selectItemAtIndexPath:v4 animated:0 scrollPosition:0];
  }
  else {
    [v6 deselectItemAtIndexPath:v4 animated:0];
  }
}

- (void)updateToClipAtIndexPath:(id)a3
{
  id v11 = a3;
  -[HUClipScrubberDataSource setLastSelectedClipIndex:](self, "setLastSelectedClipIndex:", [v11 section]);
  id v4 = [(HUClipScrubberDataSource *)self currentEvents];
  BOOL v5 = objc_msgSend(v4, "objectAtIndexedSubscript:", objc_msgSend(v11, "section"));
  [(HUClipScrubberDataSource *)self setCurrentEvent:v5];

  [(HUClipScrubberDataSource *)self setCurrentTimelineState:2];
  if ([v11 section])
  {
    objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", 1, objc_msgSend(v11, "section"));
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = v11;
  }
  id v7 = v6;
  v8 = [(HUClipScrubberDataSource *)self clipCollectionView];
  v9 = [v8 cellForItemAtIndexPath:v7];

  if (v9)
  {
    dispatch_queue_t v10 = [(HUClipScrubberDataSource *)self selectionView];
    [v10 updateFrameToMatchView:v9];
  }
}

- (void)setCurrentEvent:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentEvent);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_currentEvent, v4);
    id v6 = [(HUClipScrubberDataSource *)self currentEvents];
    uint64_t v7 = [v6 indexOfObject:v4];

    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      [(HUClipScrubberDataSource *)self isEditing];
    }
    else
    {
      v8 = HFLogForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412290;
        id v14 = v4;
        _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "Updating last selected index after current clip change to %@", (uint8_t *)&v13, 0xCu);
      }

      [(HUClipScrubberDataSource *)self setLastSelectedClipIndex:v7];
      if ([(HUClipScrubberDataSource *)self isEditing])
      {
        [(HUClipScrubberDataSource *)self setLastSelectedClipIndex:v7];
        [(HUClipScrubberDataSource *)self updateSelectionViewIfNeeded];
        v9 = [(HUClipScrubberDataSource *)self clipCollectionView];
        dispatch_queue_t v10 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", 1, -[HUClipScrubberDataSource lastSelectedClipIndex](self, "lastSelectedClipIndex"));
        id v11 = [v9 cellForItemAtIndexPath:v10];

        int v12 = [(HUClipScrubberDataSource *)self selectionView];
        [v12 updateFrameToMatchView:v11];
      }
    }
  }
}

- (BOOL)isSpacerAtIndexPath:(id)a3
{
  id v3 = a3;
  if ([v3 section]) {
    BOOL v4 = [v3 row] != 1;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (double)posterFrameWidth
{
  v2 = [(HUClipScrubberDataSource *)self playbackEngine];
  id v3 = [v2 liveCameraSource];
  [v3 aspectRatio];
  if (v4 >= 1.0) {
    double v5 = 58.0;
  }
  else {
    double v5 = 33.0;
  }

  return v5;
}

- (void)setClipCollectionView:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clipCollectionView);
  char v5 = [WeakRetained isEqual:obj];

  if ((v5 & 1) == 0)
  {
    objc_storeWeak((id *)&self->_clipCollectionView, obj);
    [(HUClipScrubberDataSource *)self _addDiffableDataSource];
    [(HUClipScrubberDataSource *)self _updateSnapshot];
  }
}

- (void)_addDiffableDataSource
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc(MEMORY[0x1E4F42880]);
  double v4 = [(HUClipScrubberDataSource *)self clipCollectionView];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  v9 = __50__HUClipScrubberDataSource__addDiffableDataSource__block_invoke;
  dispatch_queue_t v10 = &unk_1E638A0F0;
  objc_copyWeak(&v11, &location);
  char v5 = (void *)[v3 initWithCollectionView:v4 cellProvider:&v7];
  -[HUClipScrubberDataSource setDiffableDataSource:](self, "setDiffableDataSource:", v5, v7, v8, v9, v10);

  id v6 = [(HUClipScrubberDataSource *)self diffableDataSource];
  [v6 setSupplementaryViewProvider:&__block_literal_global_97];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

id __50__HUClipScrubberDataSource__addDiffableDataSource__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v11 = HFLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412546;
      id v16 = v8;
      __int16 v17 = 2112;
      id v18 = v9;
      _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "Requesting cell for ip:%@ ii:%@", (uint8_t *)&v15, 0x16u);
    }

    if ([v9 isEqual:@"Live"] && (objc_msgSend(WeakRetained, "isEditing") & 1) == 0)
    {
      int v13 = [v7 dequeueReusableCellWithReuseIdentifier:@"liveSpacer" forIndexPath:v8];
    }
    else
    {
      int v12 = objc_msgSend(WeakRetained, "eventForSection:", objc_msgSend(v8, "section"));
      if ([v12 containerType] == 2) {
        [WeakRetained reachabilitySectionCellForCollectionView:v7 forEvent:v12 atIndexPath:v8];
      }
      else {
      int v13 = [WeakRetained recordingSectionCellForCollectionView:v7 forEvent:v12 atIndexPath:v8];
      }
    }
  }
  else
  {
    int v13 = 0;
  }

  return v13;
}

id __50__HUClipScrubberDataSource__addDiffableDataSource__block_invoke_18(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = a2;
  id v9 = HFLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v7;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "Requesting supplementary cell for ip:%@ ii:%@", (uint8_t *)&v13, 0x16u);
  }

  if ((id)*MEMORY[0x1E4F43750] == v6) {
    dispatch_queue_t v10 = @"footer";
  }
  else {
    dispatch_queue_t v10 = @"header";
  }
  id v11 = [v8 dequeueReusableSupplementaryViewOfKind:v6 withReuseIdentifier:v10 forIndexPath:v7];

  return v11;
}

- (void)_updateSnapshot
{
}

- (void)_updateSnapshotWithUpdatedIdentifiers:(id)a3 replacedIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(HUClipScrubberDataSource *)self setIsUpdating:1];
  id v8 = [(HUClipScrubberDataSource *)self currentEvents];
  if ([MEMORY[0x1E4F69758] isInternalTest])
  {
    [(HUClipScrubberDataSource *)self _updateSnapshotWithUpdatedIdentifiers:v6 replacedIdentifiers:v7 forEvents:v8];
  }
  else
  {
    objc_initWeak(&location, self);
    id v9 = [(HUClipScrubberDataSource *)self snapshotQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __86__HUClipScrubberDataSource__updateSnapshotWithUpdatedIdentifiers_replacedIdentifiers___block_invoke;
    block[3] = &unk_1E638A138;
    objc_copyWeak(&v14, &location);
    id v11 = v6;
    id v12 = v7;
    id v13 = v8;
    dispatch_async(v9, block);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __86__HUClipScrubberDataSource__updateSnapshotWithUpdatedIdentifiers_replacedIdentifiers___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _updateSnapshotWithUpdatedIdentifiers:*(void *)(a1 + 32) replacedIdentifiers:*(void *)(a1 + 40) forEvents:*(void *)(a1 + 48)];
}

- (id)_snapshotForEvents:(id)a3 updatedIdentifiers:(id)a4 replacedIdentifiers:(id)a5
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F42650]);
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__11;
  v30 = __Block_byref_object_dispose__11;
  id v31 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __86__HUClipScrubberDataSource__snapshotForEvents_updatedIdentifiers_replacedIdentifiers___block_invoke;
  v22 = &unk_1E638A160;
  v25 = &v26;
  id v11 = v10;
  id v23 = v11;
  id v12 = v7;
  id v24 = v12;
  [v12 enumerateObjectsUsingBlock:&v19];
  v33[0] = @"Live";
  id v13 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v33, 1, v19, v20, v21, v22);
  [v11 appendSectionsWithIdentifiers:v13];

  v32 = @"Live";
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
  [v11 appendItemsWithIdentifiers:v14 intoSectionWithIdentifier:@"Live"];

  __int16 v15 = __86__HUClipScrubberDataSource__snapshotForEvents_updatedIdentifiers_replacedIdentifiers___block_invoke_30((void *)v27[5], v8);
  [v11 reconfigureItemsWithIdentifiers:v15];
  id v16 = __86__HUClipScrubberDataSource__snapshotForEvents_updatedIdentifiers_replacedIdentifiers___block_invoke_30((void *)v27[5], v9);
  [v11 reloadItemsWithIdentifiers:v16];
  id v17 = v11;

  _Block_object_dispose(&v26, 8);

  return v17;
}

void __86__HUClipScrubberDataSource__snapshotForEvents_updatedIdentifiers_replacedIdentifiers___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [v5 uniqueIdentifier];
  if (v6)
  {
    if (([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) containsObject:v6] & 1) == 0)
    {
      id v7 = *(void **)(a1 + 32);
      id v16 = v6;
      id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
      [v7 appendSectionsWithIdentifiers:v8];

      if (a3 && [*(id *)(a1 + 40) count] != a3)
      {
        id v10 = [NSString stringWithFormat:@"spacer-%@", v6];
        id v12 = *(void **)(a1 + 32);
        v14[0] = v10;
        v14[1] = v6;
        id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
        [v12 appendItemsWithIdentifiers:v13 intoSectionWithIdentifier:v6];
      }
      else
      {
        id v9 = *(void **)(a1 + 32);
        __int16 v15 = v6;
        id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
        [v9 appendItemsWithIdentifiers:v10 intoSectionWithIdentifier:v6];
      }

      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v6];
    }
  }
  else
  {
    id v11 = HFLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v18 = "-[HUClipScrubberDataSource _snapshotForEvents:updatedIdentifiers:replacedIdentifiers:]_block_invoke";
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_error_impl(&dword_1BE345000, v11, OS_LOG_TYPE_ERROR, "%s event's uniqueIdentifier is nil: %@", buf, 0x16u);
    }
  }
}

id __86__HUClipScrubberDataSource__snapshotForEvents_updatedIdentifiers_replacedIdentifiers___block_invoke_30(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v4 count])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __86__HUClipScrubberDataSource__snapshotForEvents_updatedIdentifiers_replacedIdentifiers___block_invoke_2;
    v7[3] = &unk_1E638A188;
    id v8 = v3;
    objc_msgSend(v4, "na_filter:", v7);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = v4;
  }

  return v5;
}

uint64_t __86__HUClipScrubberDataSource__snapshotForEvents_updatedIdentifiers_replacedIdentifiers___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) containsObject:v3];
  if ((v4 & 1) == 0)
  {
    id v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_error_impl(&dword_1BE345000, v5, OS_LOG_TYPE_ERROR, "identifier not present in exitingIdentifiers: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  return v4;
}

- (void)_updateSnapshotWithUpdatedIdentifiers:(id)a3 replacedIdentifiers:(id)a4 forEvents:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HUClipScrubberDataSource *)self _snapshotForEvents:v10 updatedIdentifiers:v8 replacedIdentifiers:v9];
  id v12 = HFLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v17 = "-[HUClipScrubberDataSource _updateSnapshotWithUpdatedIdentifiers:replacedIdentifiers:forEvents:]";
    __int16 v18 = 2048;
    uint64_t v19 = [v11 numberOfSections];
    _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, "%s, applying snapshot with (%ld) sections", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  id v13 = [(HUClipScrubberDataSource *)self diffableDataSource];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __96__HUClipScrubberDataSource__updateSnapshotWithUpdatedIdentifiers_replacedIdentifiers_forEvents___block_invoke;
  v14[3] = &unk_1E63862A0;
  objc_copyWeak(&v15, (id *)buf);
  [v13 applySnapshot:v11 animatingDifferences:0 completion:v14];

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __96__HUClipScrubberDataSource__updateSnapshotWithUpdatedIdentifiers_replacedIdentifiers_forEvents___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setIsUpdating:0];
}

- (void)_updateSnapshotForEditing
{
  id v3 = [(HUClipScrubberDataSource *)self playbackEngine];
  uint64_t v4 = [v3 cameraClips];

  [(HUClipScrubberDataSource *)self updateMostRecentClipIndex];
  if ([MEMORY[0x1E4F69758] isInternalTest])
  {
    [(HUClipScrubberDataSource *)self _updateSnapshotForEditingFor:v4];
  }
  else
  {
    objc_initWeak(&location, self);
    id v5 = [(HUClipScrubberDataSource *)self snapshotQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__HUClipScrubberDataSource__updateSnapshotForEditing__block_invoke;
    block[3] = &unk_1E63882F0;
    objc_copyWeak(&v8, &location);
    id v7 = v4;
    dispatch_async(v5, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __53__HUClipScrubberDataSource__updateSnapshotForEditing__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _updateSnapshotForEditingFor:*(void *)(a1 + 32)];
}

- (void)_updateSnapshotForEditingFor:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F42650]);
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v19[3] = -1;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__11;
  v17[4] = __Block_byref_object_dispose__11;
  id v18 = [MEMORY[0x1E4F1CA80] set];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__HUClipScrubberDataSource__updateSnapshotForEditingFor___block_invoke;
  v12[3] = &unk_1E638A1B0;
  id v15 = v17;
  id v16 = v19;
  id v6 = v5;
  id v13 = v6;
  id v7 = v4;
  id v14 = v7;
  objc_msgSend(v7, "na_each:", v12);
  objc_initWeak(&location, self);
  id v8 = [(HUClipScrubberDataSource *)self diffableDataSource];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__HUClipScrubberDataSource__updateSnapshotForEditingFor___block_invoke_2;
  v9[3] = &unk_1E63862A0;
  objc_copyWeak(&v10, &location);
  [v8 applySnapshot:v6 animatingDifferences:0 completion:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);
}

void __57__HUClipScrubberDataSource__updateSnapshotForEditingFor___block_invoke(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = [a2 uniqueIdentifier];
  if (([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) containsObject:v3] & 1) == 0)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    id v4 = *(void **)(a1 + 32);
    v13[0] = v3;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    [v4 appendSectionsWithIdentifiers:v5];

    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    if (v6 && v6 != [*(id *)(a1 + 40) count])
    {
      id v8 = [NSString stringWithFormat:@"spacer-%@", v3];
      id v9 = *(void **)(a1 + 32);
      v11[0] = v8;
      v11[1] = v3;
      id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
      [v9 appendItemsWithIdentifiers:v10 intoSectionWithIdentifier:v3];
    }
    else
    {
      id v7 = *(void **)(a1 + 32);
      id v12 = v3;
      id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
      [v7 appendItemsWithIdentifiers:v8 intoSectionWithIdentifier:v3];
    }

    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v3];
  }
}

void __57__HUClipScrubberDataSource__updateSnapshotForEditingFor___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateMostRecentClipIndex];
  v1 = [WeakRetained selectionView];

  if (!v1)
  {
    v2 = +[HUClipScrubberSelectionView selectionView];
    [WeakRetained setSelectionView:v2];

    id v3 = [WeakRetained clipCollectionView];
    id v4 = [WeakRetained selectionView];
    [v3 addSubview:v4];
  }
  [WeakRetained setSelectionViewHidden:1];
  id v5 = [WeakRetained currentEvent];

  if (v5)
  {
    objc_opt_class();
    uint64_t v6 = [WeakRetained currentEvent];
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
    id v8 = v7;

    if (v8)
    {
      id v9 = [WeakRetained diffableDataSource];
      id v10 = [v8 uniqueIdentifier];
      uint64_t v11 = [v9 indexForSectionIdentifier:v10];

      if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v11 = [WeakRetained mostRecentClipIndex];
      }
      [WeakRetained setLastSelectedClipIndex:v11];
    }
  }
  [WeakRetained updateSelectionViewIfNeeded];
}

- (id)recordingSectionCellForCollectionView:(id)a3 forEvent:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_opt_class();
  id v12 = v9;
  if (!v12) {
    goto LABEL_7;
  }
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }
  id v14 = v12;
  if (!v13)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    id v16 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v15 handleFailureInFunction:v16, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v11, objc_opt_class() file lineNumber description];

LABEL_7:
    id v14 = 0;
  }

  if ([(HUClipScrubberDataSource *)self isSpacerAtIndexPath:v10])
  {
    id v17 = [(HUClipScrubberDataSource *)self spacerCellForCollectionView:v8 forEvent:v12 atIndexPath:v10];
  }
  else
  {
    id v17 = [v8 dequeueReusableCellWithReuseIdentifier:@"HUCameraEventRecordingCellIdentifier" forIndexPath:v10];
    unint64_t v18 = [(HUClipScrubberDataSource *)self displayMode];
    uint64_t v19 = [(HUClipScrubberDataSource *)self playbackEngine];
    uint64_t v20 = [v19 isCameraPortraitMode];
    uint64_t v21 = [(HUClipScrubberDataSource *)self timeController];
    [v17 updateWithCameraClipEvent:v14 mode:v18 portraitMode:v20 timeController:v21];

    int64_t v22 = [(HUClipScrubberDataSource *)self lastSelectedClipIndex];
    if (v22 == [v10 section])
    {
      id v23 = [(HUClipScrubberDataSource *)self selectionView];
      [v23 updateFrameToMatchView:v17];
    }
  }

  return v17;
}

- (id)reachabilitySectionCellForCollectionView:(id)a3 forEvent:(id)a4 atIndexPath:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  objc_opt_class();
  id v11 = v8;
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  if ([(HUClipScrubberDataSource *)self isSpacerAtIndexPath:v9])
  {
    id v14 = [(HUClipScrubberDataSource *)self spacerCellForCollectionView:v10 forEvent:v11 atIndexPath:v9];
  }
  else
  {
    id v14 = [v10 dequeueReusableCellWithReuseIdentifier:@"HUCameraEventReachabilityCellIdentifier" forIndexPath:v9];

    objc_msgSend(v14, "updateWithReachabilityEventContainer:mode:", v13, -[HUClipScrubberDataSource displayMode](self, "displayMode"));
    int64_t v15 = [(HUClipScrubberDataSource *)self lastSelectedClipIndex];
    if (v15 != [v9 section]) {
      goto LABEL_9;
    }
    id v10 = [(HUClipScrubberDataSource *)self selectionView];
    [v10 updateFrameToMatchView:v14];
  }

LABEL_9:

  return v14;
}

- (id)spacerCellForCollectionView:(id)a3 forEvent:(id)a4 atIndexPath:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [a3 dequeueReusableCellWithReuseIdentifier:@"HUCameraEventSpacerCellIdentifier" forIndexPath:v9];
  id v11 = [(HUClipScrubberDataSource *)self playbackEngine];
  if ([v11 isFirstEventOfTheDay:v8])
  {
    id v12 = [v8 dateOfOccurrence];
    uint64_t v13 = objc_msgSend(v12, "hf_isMidnight") ^ 1;
  }
  else
  {
    uint64_t v13 = 0;
  }

  if ([v9 section] < 1)
  {
    id v14 = 0;
  }
  else
  {
    id v14 = -[HUClipScrubberDataSource previousEventForSection:](self, "previousEventForSection:", [v9 section]);
  }
  [v10 updateWithRecordingEvent:v8 previousEvent:v14 spanningMultipleDays:v13];

  return v10;
}

- (void)beginTimeScaleTrackingForPinchGesture:(id)a3
{
  id v5 = a3;
  [(HUClipScrubberDataSource *)self lastGestureScale];
  if (v4 < 1.0) {
    [(HUClipScrubberDataSource *)self setLastGestureScale:1.0];
  }
  [(HUClipScrubberDataSource *)self lastGestureScale];
  objc_msgSend(v5, "setScale:");
}

- (BOOL)isZoomingIn:(double)a3
{
  [(HUClipScrubberDataSource *)self lastGestureScale];
  return v4 - a3 < 0.0;
}

- (void)changeTimeScaleForPinchGesture:(id)a3
{
  id v6 = a3;
  double v4 = [(HUClipScrubberDataSource *)self currentEvent];

  if (v4)
  {
    id v5 = [(HUClipScrubberDataSource *)self timeController];
    [v6 scale];
    objc_msgSend(v5, "clampGestureScale:");
    objc_msgSend(v6, "setScale:");

    [v6 scale];
    -[HUClipScrubberDataSource changeTimeScaleForNewScale:](self, "changeTimeScaleForNewScale:");
  }
}

- (void)changeTimeScaleForNewScale:(double)a3
{
  [(HUClipScrubberDataSource *)self lastGestureScale];
  if (vabdd_f64(v5, a3) >= 0.011)
  {
    id v6 = [(HUClipScrubberDataSource *)self timeController];
    [v6 updateTimeScaleForGestureScale:a3];

    id v7 = [(HUClipScrubberDataSource *)self clipCollectionView];
    [v7 reloadData];

    [(HUClipScrubberDataSource *)self setLastGestureScale:a3];
  }
}

- (double)offsetForEvent:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(HUClipScrubberDataSource *)self diffableDataSource];
  id v6 = [v4 uniqueIdentifier];
  uint64_t v7 = [v5 indexForSectionIdentifier:v6];

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = [(HUClipScrubberDataSource *)self currentEvents];
    if (![v8 count])
    {
LABEL_23:

LABEL_24:
      id v8 = HFLogForCategory();
      double v32 = 0.0;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v43 = 138412290;
        uint64_t v44 = (uint64_t)v4;
        _os_log_error_impl(&dword_1BE345000, v8, OS_LOG_TYPE_ERROR, "Offset not found for displayableEvent:%@.", (uint8_t *)&v43, 0xCu);
      }
      goto LABEL_26;
    }
    int v9 = [v4 isComplete];

    if (!v9) {
      goto LABEL_24;
    }
    id v10 = [(HUClipScrubberDataSource *)self playbackEngine];
    id v11 = [v10 cameraClips];
    id v8 = [v11 lastObject];

    id v12 = [(HUClipScrubberDataSource *)self diffableDataSource];
    uint64_t v13 = [v8 uniqueIdentifier];
    uint64_t v7 = [v12 indexForSectionIdentifier:v13];

    id v14 = HFLogForCategory();
    int64_t v15 = v14;
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        int v43 = 138412290;
        uint64_t v44 = (uint64_t)v4;
        _os_log_error_impl(&dword_1BE345000, v15, OS_LOG_TYPE_ERROR, "Clip:%@ not found in current clips.", (uint8_t *)&v43, 0xCu);
      }

      goto LABEL_23;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v43 = 138412546;
      uint64_t v44 = (uint64_t)v8;
      __int16 v45 = 2112;
      double v46 = *(double *)&v4;
      _os_log_impl(&dword_1BE345000, v15, OS_LOG_TYPE_DEFAULT, "Jumping to the most recent clip in the timeline:%@ for requested event:%@", (uint8_t *)&v43, 0x16u);
    }

    id v16 = (void *)MEMORY[0x1E4F68FC8];
    id v17 = [v8 dateOfOccurrence];
    unint64_t v18 = [v16 clipPositionWithDate:v17 inClip:v8];
    uint64_t v19 = [(HUClipScrubberDataSource *)self playbackEngine];
    [v19 setPlaybackPosition:v18];

    uint64_t v20 = [(HUClipScrubberDataSource *)self playbackEngine];
    [v20 play];
  }
  id v8 = [MEMORY[0x1E4F28D58] indexPathForRow:v7 != 0 inSection:v7];
  uint64_t v21 = [(HUClipScrubberDataSource *)self clipCollectionView];
  int64_t v22 = [v21 cellForItemAtIndexPath:v8];

  if (!v22)
  {
    uint64_t v23 = [v4 containerType];
    id v24 = [(HUClipScrubberDataSource *)self clipCollectionView];
    v25 = v24;
    uint64_t v26 = &HUCameraEventRecordingCellIdentifier;
    if (v23 != 1) {
      uint64_t v26 = HUCameraEventReachabilityCellIdentifier;
    }
    int64_t v22 = [v24 dequeueReusableCellWithReuseIdentifier:*v26 forIndexPath:v8];

    if (!v22) {
      goto LABEL_23;
    }
  }
  v27 = [(HUClipScrubberDataSource *)self currentDate];
  uint64_t v28 = [v4 dateOfOccurrence];
  [v27 timeIntervalSinceDate:v28];
  double v30 = v29;

  [v22 frame];
  double v32 = v31;
  v33 = [(HUClipScrubberDataSource *)self clipCollectionView];
  v34 = [v33 layoutAttributesForItemAtIndexPath:v8];

  if (v34)
  {
    [v34 frame];
    double v32 = v35;
  }
  if (v30 >= 1.0)
  {
    objc_msgSend(v4, "hf_duration");
    float v37 = fmin(v30 / v36, 1.0);
    [v22 frame];
    double v38 = v37;
    double v32 = v32 + v39 * v38;
    if (v32 == INFINITY)
    {
      v40 = HFLogForCategory();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "hf_duration");
        int v43 = 134218752;
        uint64_t v44 = 0x7FF0000000000000;
        __int16 v45 = 2048;
        double v46 = v30;
        __int16 v47 = 2048;
        uint64_t v48 = v42;
        __int16 v49 = 2048;
        double v50 = v38;
        _os_log_error_impl(&dword_1BE345000, v40, OS_LOG_TYPE_ERROR, "Offset is invalid: %lf, elapsed: %lf, duration: %lf, percentWidth: %lf", (uint8_t *)&v43, 0x2Au);
      }

      double v32 = INFINITY;
    }
  }

LABEL_26:
  return v32;
}

- (BOOL)isValidEventAtIndexPath:(id)a3
{
  return ![(HUClipScrubberDataSource *)self isSpacerAtIndexPath:a3];
}

- (BOOL)isValidRecordingEventAtIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 section];
  id v6 = [(HUClipScrubberDataSource *)self currentEvents];
  unint64_t v7 = [v6 count];

  BOOL v8 = 0;
  if (v4 && v5 < v7)
  {
    int v9 = -[HUClipScrubberDataSource eventForSection:](self, "eventForSection:", [v4 section]);
    BOOL v8 = [v9 containerType] == 1;
  }
  return v8;
}

- (id)eventForSection:(unint64_t)a3
{
  unint64_t v5 = [(HUClipScrubberDataSource *)self currentEvents];
  unint64_t v6 = [v5 count];

  unint64_t v7 = [(HUClipScrubberDataSource *)self currentEvents];
  BOOL v8 = v7;
  if (v6 <= a3) {
    [v7 lastObject];
  }
  else {
  int v9 = [v7 objectAtIndexedSubscript:a3];
  }

  return v9;
}

- (id)previousEventForSection:(unint64_t)a3
{
  if (a3)
  {
    id v4 = [(HUClipScrubberDataSource *)self eventForSection:a3 - 1];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)startDateFromCell:(id)a3
{
  id v4 = a3;
  [v4 frame];
  unint64_t v5 = -[HUClipScrubberDataSource selectedDateFromCell:atCurrentOffset:](self, "selectedDateFromCell:atCurrentOffset:", v4);

  return v5;
}

- (id)selectedDateFromCell:(id)a3 atCurrentOffset:(double)a4
{
  id v6 = a3;
  [v6 frame];
  float MaxX = CGRectGetMaxX(v21);
  float v8 = a4;
  double v9 = (float)(MaxX - v8);
  [v6 frame];
  double v11 = v10;

  float v12 = 1.0 - v9 / v11;
  double v13 = v12;
  id v14 = [(HUClipScrubberDataSource *)self currentEvent];
  objc_msgSend(v14, "hf_duration");
  *(float *)&double v13 = v15 * v13;

  id v16 = [(HUClipScrubberDataSource *)self currentEvent];
  id v17 = [v16 dateOfOccurrence];
  unint64_t v18 = [v17 dateByAddingTimeInterval:*(float *)&v13];

  [(HUClipScrubberDataSource *)self setCurrentDate:v18];

  return v18;
}

- (double)scrubbingResolutionForClip:(id)a3
{
  if (!a3) {
    return 0.0;
  }
  id v4 = -[HUClipScrubberDataSource indexPathsForClip:](self, "indexPathsForClip:");
  if (v4)
  {
    unint64_t v5 = [(HUClipScrubberDataSource *)self clipCollectionView];
    id v6 = [v5 cellForItemAtIndexPath:v4];

    [v6 bounds];
    double v8 = v7;
    [v6 contentScaleFactor];
    double v10 = v9 * v8;
  }
  else
  {
    double v10 = 0.0;
  }

  return v10;
}

- (void)playbackEngine:(id)a3 didUpdateEventsIncludingUpdatedIdentifiers:(id)a4 replacedIdentifiers:(id)a5 removedIdentifiers:(id)a6
{
  id v24 = a4;
  id v9 = a5;
  uint64_t v10 = [a6 count];
  BOOL v11 = [(HUClipScrubberDataSource *)self isEditing];
  if (!v10)
  {
    if (v11) {
      goto LABEL_11;
    }
    unint64_t v18 = [(HUClipScrubberDataSource *)self playbackEngine];
    uint64_t v19 = [v18 isCameraPortraitMode];
    uint64_t v20 = [(HUClipScrubberDataSource *)self timeController];
    [v20 setPortraitMode:v19];

    [(HUClipScrubberDataSource *)self updateMostRecentClipIndex];
    CGRect v21 = [(HUClipScrubberDataSource *)self timeController];
    int64_t v22 = [(HUClipScrubberDataSource *)self playbackEngine];
    uint64_t v23 = [v22 clipWithLongestDuration];
    [v21 recalculateMaximumPosterFrameDuration:v23];

    goto LABEL_10;
  }
  if (!v11)
  {
LABEL_10:
    [(HUClipScrubberDataSource *)self _updateSnapshotWithUpdatedIdentifiers:v24 replacedIdentifiers:v9];
    goto LABEL_11;
  }
  float v12 = [(HUClipScrubberDataSource *)self playbackEngine];
  double v13 = [v12 cameraClips];
  unint64_t v14 = [v13 count];

  if (v14)
  {
    if ([(HUClipScrubberDataSource *)self lastSelectedClipIndex] >= v14) {
      [(HUClipScrubberDataSource *)self setLastSelectedClipIndex:v14 - 1];
    }
    double v15 = [(HUClipScrubberDataSource *)self playbackEngine];
    id v16 = [v15 cameraClips];
    id v17 = objc_msgSend(v16, "objectAtIndexedSubscript:", -[HUClipScrubberDataSource lastSelectedClipIndex](self, "lastSelectedClipIndex"));
    [(HUClipScrubberDataSource *)self setCurrentEvent:v17];
  }
  [(HUClipScrubberDataSource *)self _updateSnapshotForEditing];
LABEL_11:
}

- (id)indexPathsForClip:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(HUClipScrubberDataSource *)self diffableDataSource];
  id v6 = [v4 uniqueIdentifier];

  double v7 = [v5 indexPathForItemIdentifier:v6];

  return v7;
}

- (void)updateMostRecentClipIndex
{
  id v3 = [(HUClipScrubberDataSource *)self currentEvents];
  self->_mostRecentClipIndex = [v3 count] - 1;
}

- (void)setSelectionViewHidden:(BOOL)a3
{
  float v3 = (float)!a3;
  id v6 = [(HUClipScrubberDataSource *)self selectionView];
  id v4 = [v6 layer];
  *(float *)&double v5 = v3;
  [v4 setOpacity:v5];
}

- (void)updateSelectionViewIfNeeded
{
  if ([(HUClipScrubberDataSource *)self isEditing])
  {
    uint64_t v9 = 0;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x2020000000;
    char v12 = 0;
    float v3 = [(HUClipScrubberDataSource *)self clipCollectionView];
    id v4 = [v3 visibleCells];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __55__HUClipScrubberDataSource_updateSelectionViewIfNeeded__block_invoke;
    v8[3] = &unk_1E638A1D8;
    v8[4] = self;
    v8[5] = &v9;
    [v4 enumerateObjectsUsingBlock:v8];

    if (!*((unsigned char *)v10 + 24))
    {
      double v5 = [(HUClipScrubberDataSource *)self currentEvents];
      uint64_t v6 = [v5 count];

      if (v6)
      {
        double v7 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:v6 - 1];
        [(HUClipScrubberDataSource *)self updateToClipAtIndexPath:v7];
      }
    }
    _Block_object_dispose(&v9, 8);
  }
}

void __55__HUClipScrubberDataSource_updateSelectionViewIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v15 = a2;
  float v3 = [*(id *)(a1 + 32) clipCollectionView];
  id v4 = [v3 indexPathForCell:v15];

  uint64_t v5 = [v4 section];
  if (v5 == [*(id *)(a1 + 32) lastSelectedClipIndex]
    && [*(id *)(a1 + 32) isValidEventAtIndexPath:v4])
  {
    [*(id *)(a1 + 32) toggleSelectionStateForItemAtIndexPath:v4];
    uint64_t v6 = [*(id *)(a1 + 32) selectionView];
    [v6 updateFrameToMatchView:v15];

    [*(id *)(a1 + 32) setSelectionViewHidden:0];
    [*(id *)(a1 + 32) updateToClipAtIndexPath:v4];
    double v7 = [*(id *)(a1 + 32) clipCollectionView];
    double v8 = [v7 cellForItemAtIndexPath:v4];

    objc_opt_class();
    uint64_t v9 = [*(id *)(a1 + 32) currentEvent];
    if (objc_opt_isKindOfClass()) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0;
    }
    id v11 = v10;

    char v12 = [*(id *)(a1 + 32) playbackEngine];
    double v13 = [*(id *)(a1 + 32) startDateFromCell:v8];
    [v12 updatePlaybackPositionToDate:v13 usingClip:v11];

    unint64_t v14 = [*(id *)(a1 + 32) clipCollectionView];
    [v14 selectItemAtIndexPath:v4 animated:0 scrollPosition:0];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (void)expandToMaximumZoom
{
  float v3 = [(HUClipScrubberDataSource *)self timeController];
  [v3 expandTimelineToMaximumZoom];

  id v4 = [(HUClipScrubberDataSource *)self clipCollectionView];
  [v4 reloadData];
}

- (void)shrinkToMinimumZoom
{
  float v3 = [(HUClipScrubberDataSource *)self timeController];
  [v3 shrinkTimelineToMinimumZoom];

  id v4 = [(HUClipScrubberDataSource *)self clipCollectionView];
  [v4 reloadData];
}

- (HUClipScrubberTimeController)timeController
{
  return self->_timeController;
}

- (void)setTimeController:(id)a3
{
}

- (HFCameraRecordingEvent)currentEvent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentEvent);

  return (HFCameraRecordingEvent *)WeakRetained;
}

- (UICollectionView)clipCollectionView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clipCollectionView);

  return (UICollectionView *)WeakRetained;
}

- (unint64_t)currentTimelineState
{
  return self->_currentTimelineState;
}

- (void)setCurrentTimelineState:(unint64_t)a3
{
  self->_currentTimelineState = a3;
}

- (unint64_t)displayMode
{
  return self->_displayMode;
}

- (void)setDisplayMode:(unint64_t)a3
{
  self->_displayMode = a3;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (NSDate)currentDate
{
  return self->_currentDate;
}

- (void)setCurrentDate:(id)a3
{
}

- (HFCameraPlaybackEngine)playbackEngine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);

  return (HFCameraPlaybackEngine *)WeakRetained;
}

- (unint64_t)mostRecentClipIndex
{
  return self->_mostRecentClipIndex;
}

- (int64_t)lastSelectedClipIndex
{
  return self->_lastSelectedClipIndex;
}

- (void)setLastSelectedClipIndex:(int64_t)a3
{
  self->_lastSelectedClipIndex = a3;
}

- (BOOL)selectionViewHidden
{
  return self->_selectionViewHidden;
}

- (void)setPosterFrameWidth:(double)a3
{
  self->_posterFrameWidth = a3;
}

- (BOOL)isUpdating
{
  return self->_isUpdating;
}

- (void)setIsUpdating:(BOOL)a3
{
  self->_isUpdating = a3;
}

- (double)startingPinchDeltaX
{
  return self->_startingPinchDeltaX;
}

- (void)setStartingPinchDeltaX:(double)a3
{
  self->_startingPinchDeltaX = a3;
}

- (HUClipScrubberSelectionView)selectionView
{
  return self->_selectionView;
}

- (void)setSelectionView:(id)a3
{
}

- (double)lastGestureScale
{
  return self->_lastGestureScale;
}

- (void)setLastGestureScale:(double)a3
{
  self->_lastGestureScale = a3;
}

- (UICollectionViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setDiffableDataSource:(id)a3
{
}

- (HFCameraRecordingEvent)lastUpdatedEvent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lastUpdatedEvent);

  return (HFCameraRecordingEvent *)WeakRetained;
}

- (void)setLastUpdatedEvent:(id)a3
{
}

- (OS_dispatch_queue)snapshotQueue
{
  return self->_snapshotQueue;
}

- (void)setSnapshotQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotQueue, 0);
  objc_destroyWeak((id *)&self->_lastUpdatedEvent);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_selectionView, 0);
  objc_destroyWeak((id *)&self->_playbackEngine);
  objc_storeStrong((id *)&self->_currentDate, 0);
  objc_destroyWeak((id *)&self->_clipCollectionView);
  objc_destroyWeak((id *)&self->_currentEvent);

  objc_storeStrong((id *)&self->_timeController, 0);
}

@end