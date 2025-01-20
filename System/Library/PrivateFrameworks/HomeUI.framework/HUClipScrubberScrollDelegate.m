@interface HUClipScrubberScrollDelegate
- (BOOL)_doesPrecedingSpacerSpanMultipleDaysForEvent:(id)a3;
- (BOOL)_shouldScrollBypassPlaybackEngineUpdate;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)hasUserInteractedWithScrubber;
- (BOOL)isScrollingForward;
- (BOOL)isUserScrubbing;
- (BOOL)shouldIgnoreScrolling;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (HFCameraPlaybackEngine)playbackEngine;
- (HFCameraRecordingEvent)currentEvent;
- (HUClipScrubberDataSource)dataSource;
- (HUClipScrubberScrollDelegate)initWithDataSource:(id)a3;
- (UICollectionView)clipCollectionView;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5;
- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5;
- (double)elapsedTime;
- (double)lastContentOffset;
- (double)lastContentWidth;
- (double)targetScrollOffset;
- (float)playheadPosition;
- (id)_interpolatedDateFromEvent:(id)a3 toEvent:(id)a4 insideRect:(CGRect)a5 atTimelinePosition:(float)a6;
- (id)_selectedDateForAreaOfNoActivityAtPoint:(CGPoint)a3 inScrollView:(id)a4;
- (id)_selectedDateForEventInRect:(CGRect)a3;
- (id)_selectedDateForTodayFromEvent:(id)a3 percentDuration:(float)a4;
- (id)_selectedDateForYesterdayFromPreviousEvent:(id)a3 percentDuration:(float)a4;
- (void)_handleOutOfBoundsTimelinePosition:(float)a3;
- (void)_updateFamiliarFaceCell;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setClipCollectionView:(id)a3;
- (void)setCurrentEvent:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setElapsedTime:(double)a3;
- (void)setHasUserInteractedWithScrubber:(BOOL)a3;
- (void)setLastContentOffset:(double)a3;
- (void)setLastContentWidth:(double)a3;
- (void)setPlaybackEngine:(id)a3;
- (void)setScrollingForward:(BOOL)a3;
- (void)setShouldIgnoreScrolling:(BOOL)a3;
- (void)setTargetScrollOffset:(double)a3;
- (void)setUserScrubbing:(BOOL)a3;
- (void)updateCollectionView:(id)a3;
- (void)updatePlaybackEngineDate:(id)a3;
@end

@implementation HUClipScrubberScrollDelegate

- (HUClipScrubberScrollDelegate)initWithDataSource:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HUClipScrubberScrollDelegate;
  v5 = [(HUClipScrubberScrollDelegate *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_dataSource, v4);
  }

  return v6;
}

- (void)updatePlaybackEngineDate:(id)a3
{
  id v18 = a3;
  id v4 = [(HUClipScrubberScrollDelegate *)self dataSource];
  if ([v4 currentTimelineState] != 5)
  {
    v5 = [(HUClipScrubberScrollDelegate *)self dataSource];
    uint64_t v6 = [v5 currentTimelineState];

    if (v6 == 6) {
      goto LABEL_12;
    }
    v7 = [(HUClipScrubberScrollDelegate *)self dataSource];
    uint64_t v8 = [v7 currentTimelineState];
    v9 = [(HUClipScrubberScrollDelegate *)self playbackEngine];
    [v9 setTimelineState:v8];

    v10 = [(HUClipScrubberScrollDelegate *)self dataSource];
    uint64_t v11 = [v10 currentTimelineState];

    if (!v18 || v11 == 1)
    {
      id v4 = [MEMORY[0x1E4F68FC8] livePosition];
      v17 = [(HUClipScrubberScrollDelegate *)self playbackEngine];
      [v17 setPlaybackPosition:v4];
    }
    else
    {
      objc_opt_class();
      v12 = [(HUClipScrubberScrollDelegate *)self currentEvent];
      if (objc_opt_isKindOfClass()) {
        v13 = v12;
      }
      else {
        v13 = 0;
      }
      id v14 = v13;

      v15 = [MEMORY[0x1E4F68FE8] sharedManager];
      id v4 = objc_msgSend(v15, "timelapseClipPositionForDate:inHighQualityClip:scrubbingType:", v18, v14, -[HUClipScrubberScrollDelegate isScrollingForward](self, "isScrollingForward") ^ 1);

      v16 = [(HUClipScrubberScrollDelegate *)self playbackEngine];
      [v16 setShouldBypassHighQualityScrubbing:v4 != 0];

      v17 = [(HUClipScrubberScrollDelegate *)self playbackEngine];
      [v17 updatePlaybackPositionToDate:v18 usingClip:v14];
    }
  }

LABEL_12:
}

- (void)setUserScrubbing:(BOOL)a3
{
  if (self->_userScrubbing != a3)
  {
    BOOL v3 = a3;
    self->_userScrubbing = a3;
    v5 = [(HUClipScrubberScrollDelegate *)self playbackEngine];
    id v7 = v5;
    if (v3)
    {
      [v5 beginScrubbing];
    }
    else
    {
      [v5 endScrubbing];

      id v7 = [(HUClipScrubberScrollDelegate *)self dataSource];
      uint64_t v6 = [v7 currentDate];
      [(HUClipScrubberScrollDelegate *)self updatePlaybackEngineDate:v6];
    }
  }
}

- (BOOL)_doesPrecedingSpacerSpanMultipleDaysForEvent:(id)a3
{
  id v4 = a3;
  v5 = [(HUClipScrubberScrollDelegate *)self dataSource];
  uint64_t v6 = [v5 playbackEngine];
  if ([v6 isFirstEventOfTheDay:v4])
  {
    id v7 = [v4 dateOfOccurrence];
    int v8 = objc_msgSend(v7, "hf_isMidnight") ^ 1;
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v5 = *MEMORY[0x1E4F437F8];
  double v6 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v7 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v8 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  return 0.0;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  return 0.0;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  if (a5)
  {
    double v5 = *MEMORY[0x1E4F1DB30];
    double v6 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  else
  {
    [a3 bounds];
    double v5 = v7 * 0.5;
    double v6 = 0.0;
  }
  result.height = v6;
  result.width = v5;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5
{
  id v7 = a3;
  double v8 = [(HUClipScrubberScrollDelegate *)self dataSource];
  if ([v8 mostRecentClipIndex] + 1 != a5)
  {
    v12 = [(HUClipScrubberScrollDelegate *)self dataSource];
    if ([v12 isEditing])
    {
      v13 = [(HUClipScrubberScrollDelegate *)self dataSource];
      uint64_t v14 = [v13 mostRecentClipIndex];

      if (v14 == a5) {
        goto LABEL_3;
      }
    }
    else
    {
    }
    v15 = [(HUClipScrubberScrollDelegate *)self dataSource];
    if ([v15 isEditing])
    {
      v16 = [(HUClipScrubberScrollDelegate *)self dataSource];
      uint64_t v17 = [v16 mostRecentClipIndex];

      if (v17 == a5) {
        goto LABEL_3;
      }
    }
    else
    {
    }
    double v10 = *MEMORY[0x1E4F1DB30];
    double v11 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    goto LABEL_13;
  }

LABEL_3:
  [v7 bounds];
  double v10 = v9 * 0.5;
  double v11 = 0.0;
LABEL_13:

  double v18 = v10;
  double v19 = v11;
  result.height = v19;
  result.width = v18;
  return result;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v4 = [(HUClipScrubberScrollDelegate *)self dataSource];
  char v5 = [v4 isEditing];

  return v5;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6 = a5;
  uint64_t v7 = [v6 section];
  double v8 = [(HUClipScrubberScrollDelegate *)self dataSource];
  double v9 = [v8 currentEvents];
  uint64_t v10 = [v9 count];

  double v11 = 30.0;
  if (v7 != v10)
  {
    v12 = [(HUClipScrubberScrollDelegate *)self dataSource];
    v13 = objc_msgSend(v12, "eventForSection:", objc_msgSend(v6, "section"));

    uint64_t v14 = [(HUClipScrubberScrollDelegate *)self dataSource];
    int v15 = [v14 isValidEventAtIndexPath:v6];

    if (!v15) {
      goto LABEL_6;
    }
    uint64_t v16 = [v13 containerType];
    if (v16 == 2)
    {
      double v11 = 60.0;
      goto LABEL_15;
    }
    if (v16 == 1)
    {
      uint64_t v17 = [(HUClipScrubberScrollDelegate *)self dataSource];
      double v18 = [v17 timeController];
      [v18 timelineWidthForEvent:v13];
      double v11 = v19;
    }
    else
    {
LABEL_6:
      v20 = [(HUClipScrubberScrollDelegate *)self dataSource];
      v21 = [v20 playbackEngine];
      if ([v21 isFirstEventOfTheDay:v13])
      {
        v22 = [v13 dateOfOccurrence];
        int v23 = objc_msgSend(v22, "hf_isMidnight");

        if (!v23) {
          goto LABEL_15;
        }
      }
      else
      {
      }
      v24 = [(HUClipScrubberScrollDelegate *)self dataSource];
      uint64_t v17 = objc_msgSend(v24, "previousEventForSection:", objc_msgSend(v6, "section"));

      if (v17)
      {
        objc_msgSend(v17, "hf_duration");
        if (v25 < 0.00000011920929) {
          double v11 = 60.0;
        }
      }
    }

LABEL_15:
  }

  double v26 = 47.0;
  double v27 = v11;
  result.height = v26;
  result.width = v27;
  return result;
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  [(HUClipScrubberScrollDelegate *)self setShouldIgnoreScrolling:0];
  char v5 = [v4 isDragging];

  if ((v5 & 1) == 0)
  {
    [(HUClipScrubberScrollDelegate *)self setUserScrubbing:0];
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  [(HUClipScrubberScrollDelegate *)self setShouldIgnoreScrolling:0];
  [(HUClipScrubberScrollDelegate *)self setUserScrubbing:1];
  id v4 = [(HUClipScrubberScrollDelegate *)self playbackEngine];
  [v4 setUserScrubbing:1];

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];

  -[HUClipScrubberScrollDelegate setElapsedTime:](self, "setElapsedTime:");
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x = a4.x;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (x == 0.0)
  {
    v12 = [(HUClipScrubberScrollDelegate *)self playbackEngine];
    v13 = v12;
    uint64_t v14 = 0;
  }
  else
  {
    double v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      CGFloat v10 = a5->x;
      [v8 contentOffset];
      int v15 = 134218496;
      CGFloat v16 = v10;
      __int16 v17 = 2048;
      double v18 = x;
      __int16 v19 = 2048;
      uint64_t v20 = v11;
      _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "Will end scrolling at offset:%.2f with velocity:%.2f vs current offset %.2f", (uint8_t *)&v15, 0x20u);
    }

    [(HUClipScrubberScrollDelegate *)self setTargetScrollOffset:a5->x];
    v12 = [(HUClipScrubberScrollDelegate *)self playbackEngine];
    v13 = v12;
    uint64_t v14 = 1;
  }
  [v12 setShouldBypassVideoFetchRequest:v14];
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v6 = [(HUClipScrubberScrollDelegate *)self playbackEngine];
  [v6 setUserScrubbing:0];

  if (!a4)
  {
    [(HUClipScrubberScrollDelegate *)self setUserScrubbing:0];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v6 = v5;
  [(HUClipScrubberScrollDelegate *)self lastContentOffset];
  double v8 = v7;
  [v4 contentOffset];
  double v10 = vabdd_f64(v8, v9);
  [(HUClipScrubberScrollDelegate *)self elapsedTime];
  double v12 = v10 / (v6 - v11);
  [(HUClipScrubberScrollDelegate *)self setElapsedTime:v6];
  if (v12 >= 100.0)
  {
    v13 = [(HUClipScrubberScrollDelegate *)self playbackEngine];
    uint64_t v14 = v13;
    if (v12 >= 500.0) {
      uint64_t v15 = 2;
    }
    else {
      uint64_t v15 = 1;
    }
  }
  else
  {
    v13 = [(HUClipScrubberScrollDelegate *)self playbackEngine];
    uint64_t v14 = v13;
    uint64_t v15 = 0;
  }
  [v13 setScrubbingSpeed:v15];

  CGFloat v16 = HFLogForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v17 = [(HUClipScrubberScrollDelegate *)self playbackEngine];
    int v66 = 134218240;
    double v67 = v12;
    __int16 v68 = 2048;
    uint64_t v69 = [v17 scrubbingSpeed];
    _os_log_impl(&dword_1BE345000, v16, OS_LOG_TYPE_DEFAULT, "Scrubbing speed %.3f engineSpeed:%ld", (uint8_t *)&v66, 0x16u);
  }
  double v18 = [(HUClipScrubberScrollDelegate *)self playbackEngine];
  int v19 = [v18 shouldBypassVideoFetchRequest];

  if (v19)
  {
    [v4 contentOffset];
    double v21 = v20;
    [(HUClipScrubberScrollDelegate *)self targetScrollOffset];
    if (vabdd_f64(v21, v22) < 100.0)
    {
      int v23 = HFLogForCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        [v4 contentOffset];
        int v66 = 134217984;
        double v67 = v24;
        _os_log_impl(&dword_1BE345000, v23, OS_LOG_TYPE_DEFAULT, "Scrollview did scroll and stopping at %.f", (uint8_t *)&v66, 0xCu);
      }

      double v25 = [(HUClipScrubberScrollDelegate *)self playbackEngine];
      [v25 setShouldBypassVideoFetchRequest:0];
    }
  }
  [v4 contentOffset];
  double v27 = v26;
  [(HUClipScrubberScrollDelegate *)self lastContentOffset];
  [(HUClipScrubberScrollDelegate *)self setScrollingForward:v27 >= v28];
  [v4 contentOffset];
  -[HUClipScrubberScrollDelegate setLastContentOffset:](self, "setLastContentOffset:");
  BOOL v29 = [(HUClipScrubberScrollDelegate *)self _shouldScrollBypassPlaybackEngineUpdate];
  BOOL v30 = v29;
  int v31 = !v29;
  [v4 contentOffset];
  double v33 = v32;
  double v35 = v34;
  [(HUClipScrubberScrollDelegate *)self playheadPosition];
  double v37 = v33 + v36;
  v38 = [(HUClipScrubberScrollDelegate *)self clipCollectionView];
  objc_msgSend(v38, "indexPathForItemAtPoint:", v37, v35);
  double v39 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());

  if (v39 == 0.0)
  {
    *(float *)&double v40 = v37;
    [(HUClipScrubberScrollDelegate *)self _handleOutOfBoundsTimelinePosition:v40];
    goto LABEL_17;
  }
  uint64_t v41 = [*(id *)&v39 section];
  v42 = [(HUClipScrubberScrollDelegate *)self dataSource];
  v43 = [v42 currentEvents];
  uint64_t v44 = [v43 count];

  v45 = [(HUClipScrubberScrollDelegate *)self dataSource];
  v46 = v45;
  if (v41 == v44)
  {
    [v45 setCurrentTimelineState:1];

LABEL_17:
    v47 = 0;
    goto LABEL_18;
  }
  int v52 = [v45 isValidEventAtIndexPath:*(void *)&v39];

  if (v52)
  {
    v53 = [(HUClipScrubberScrollDelegate *)self clipCollectionView];
    v54 = [v53 cellForItemAtIndexPath:*(void *)&v39];

    if (!v54)
    {
      v55 = HFLogForCategory();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        v63 = [(HUClipScrubberScrollDelegate *)self dataSource];
        v64 = [v63 currentEvents];
        uint64_t v65 = [v64 count];
        int v66 = 138412546;
        double v67 = v39;
        __int16 v68 = 2048;
        uint64_t v69 = v65;
        _os_log_error_impl(&dword_1BE345000, v55, OS_LOG_TYPE_ERROR, "Unable to scroll to find cell for valid indexPath %@ for clip count = %lu!", (uint8_t *)&v66, 0x16u);
      }
      int v31 = 0;
    }
    v56 = [(HUClipScrubberScrollDelegate *)self dataSource];
    v57 = objc_msgSend(v56, "eventForSection:", objc_msgSend(*(id *)&v39, "section"));

    uint64_t v58 = [v57 containerType];
    v59 = [(HUClipScrubberScrollDelegate *)self dataSource];
    v60 = v59;
    if (v58 == 1) {
      uint64_t v61 = 2;
    }
    else {
      uint64_t v61 = 3;
    }
    [v59 setCurrentTimelineState:v61];

    [(HUClipScrubberScrollDelegate *)self setCurrentEvent:v57];
    if (v31)
    {
      [v54 frame];
      v47 = -[HUClipScrubberScrollDelegate _selectedDateForEventInRect:](self, "_selectedDateForEventInRect:");
    }
    else
    {
      v47 = 0;
    }
  }
  else
  {
    v62 = [(HUClipScrubberScrollDelegate *)self dataSource];
    [v62 setCurrentTimelineState:4];

    if (v30)
    {
      v47 = 0;
      int v31 = 0;
    }
    else
    {
      v47 = -[HUClipScrubberScrollDelegate _selectedDateForAreaOfNoActivityAtPoint:inScrollView:](self, "_selectedDateForAreaOfNoActivityAtPoint:inScrollView:", v4, v37, v35);
      int v31 = 1;
    }
  }
LABEL_18:
  v48 = [(HUClipScrubberScrollDelegate *)self dataSource];
  uint64_t v49 = [v48 currentTimelineState];
  v50 = [(HUClipScrubberScrollDelegate *)self playbackEngine];
  [v50 setTimelineState:v49];

  if (v31)
  {
    v51 = [(HUClipScrubberScrollDelegate *)self dataSource];
    [v51 setCurrentDate:v47];

    [(HUClipScrubberScrollDelegate *)self updatePlaybackEngineDate:v47];
  }
  [(HUClipScrubberScrollDelegate *)self _updateFamiliarFaceCell];
}

- (void)updateCollectionView:(id)a3
{
  id v7 = a3;
  id v4 = [(HUClipScrubberScrollDelegate *)self clipCollectionView];

  if (v4 != v7)
  {
    double v5 = [(HUClipScrubberScrollDelegate *)self clipCollectionView];
    [v5 removeObserver:self forKeyPath:@"contentSize"];
  }
  [(HUClipScrubberScrollDelegate *)self setClipCollectionView:v7];
  double v6 = [(HUClipScrubberScrollDelegate *)self clipCollectionView];
  [v6 addObserver:self forKeyPath:@"contentSize" options:0 context:0];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 isEqualToString:@"contentSize"]
    && ([(HUClipScrubberScrollDelegate *)self clipCollectionView],
        id v13 = (id)objc_claimAutoreleasedReturnValue(),
        v13,
        v13 == v11))
  {
    [(HUClipScrubberScrollDelegate *)self lastContentWidth];
    double v15 = v14;
    CGFloat v16 = [(HUClipScrubberScrollDelegate *)self clipCollectionView];
    [v16 contentSize];
    double v18 = v17;

    if (v15 != v18)
    {
      int v19 = [(HUClipScrubberScrollDelegate *)self clipCollectionView];
      [v19 contentSize];
      -[HUClipScrubberScrollDelegate setLastContentWidth:](self, "setLastContentWidth:");

      double v20 = HFLogForCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        [(HUClipScrubberScrollDelegate *)self lastContentWidth];
        *(_DWORD *)buf = 134217984;
        uint64_t v52 = v21;
        _os_log_impl(&dword_1BE345000, v20, OS_LOG_TYPE_DEFAULT, "Updating clip scrubber to lastContentWidth:%.0f", buf, 0xCu);
      }

      double v22 = [(HUClipScrubberScrollDelegate *)self dataSource];
      char v23 = [v22 isUpdating];

      if ((v23 & 1) == 0)
      {
        double v24 = [(HUClipScrubberScrollDelegate *)self dataSource];
        double v25 = [(HUClipScrubberScrollDelegate *)self dataSource];
        double v26 = [v25 currentEvent];
        [v24 offsetForEvent:v26];
        double v28 = v27;

        BOOL v29 = [(HUClipScrubberScrollDelegate *)self clipCollectionView];
        [v29 contentOffset];
        double v31 = v30;

        double v32 = [(HUClipScrubberScrollDelegate *)self playbackEngine];
        double v33 = [v32 playbackPosition];
        uint64_t v34 = [v33 contentType];

        double v35 = [(HUClipScrubberScrollDelegate *)self clipCollectionView];
        float v36 = v35;
        if (v34)
        {
          [v35 bounds];
          double v38 = v37;
          double v39 = [(HUClipScrubberScrollDelegate *)self dataSource];
          [v39 posterFrameWidth];
          double v41 = v40;

          if (v38 <= v41) {
            goto LABEL_4;
          }
          v42 = [(HUClipScrubberScrollDelegate *)self clipCollectionView];
          [v42 bounds];
          double v44 = v28 + v43 * -0.5;

          [(HUClipScrubberScrollDelegate *)self setShouldIgnoreScrolling:1];
        }
        else
        {
          [v35 contentSize];
          double v46 = v45;
          v47 = [(HUClipScrubberScrollDelegate *)self clipCollectionView];
          [v47 bounds];
          double v44 = v46 - v48;
        }
        uint64_t v49 = [(HUClipScrubberScrollDelegate *)self clipCollectionView];
        objc_msgSend(v49, "setContentOffset:animated:", 0, v44, v31);
      }
    }
  }
  else
  {
    v50.receiver = self;
    v50.super_class = (Class)HUClipScrubberScrollDelegate;
    [(HUClipScrubberScrollDelegate *)&v50 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
LABEL_4:
}

- (BOOL)_shouldScrollBypassPlaybackEngineUpdate
{
  if ([(HUClipScrubberScrollDelegate *)self shouldIgnoreScrolling]) {
    return 1;
  }
  BOOL v3 = [(HUClipScrubberScrollDelegate *)self dataSource];
  id v4 = [v3 currentEvents];
  uint64_t v5 = [v4 count];

  if (!v5) {
    return 1;
  }
  else {
    return ![(HUClipScrubberScrollDelegate *)self isUserScrubbing];
  }
}

- (void)_handleOutOfBoundsTimelinePosition:(float)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [(HUClipScrubberScrollDelegate *)self playheadPosition];
  if (v5 < a3)
  {
    double v6 = [(HUClipScrubberScrollDelegate *)self dataSource];
    char v7 = [v6 isEditing];

    double v8 = [(HUClipScrubberScrollDelegate *)self dataSource];
    id v14 = v8;
    if (v7) {
      uint64_t v9 = 6;
    }
    else {
      uint64_t v9 = 1;
    }
LABEL_7:
    [v8 setCurrentTimelineState:v9];

    return;
  }
  [(HUClipScrubberScrollDelegate *)self playheadPosition];
  if (v10 > a3)
  {
    double v8 = [(HUClipScrubberScrollDelegate *)self dataSource];
    id v14 = v8;
    uint64_t v9 = 5;
    goto LABEL_7;
  }
  id v11 = HFLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    [(HUClipScrubberScrollDelegate *)self playheadPosition];
    *(_DWORD *)buf = 134218240;
    double v16 = a3;
    __int16 v17 = 2048;
    double v18 = v13;
    _os_log_error_impl(&dword_1BE345000, v11, OS_LOG_TYPE_ERROR, "invalid _handleOutOfBoundsTimelinePosition: call. timelinePosition:%.2f playheadPosition:%.2f", buf, 0x16u);
  }

  id v12 = [(HUClipScrubberScrollDelegate *)self dataSource];
  [v12 setCurrentTimelineState:4];
}

- (id)_selectedDateForAreaOfNoActivityAtPoint:(CGPoint)a3 inScrollView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = [(HUClipScrubberScrollDelegate *)self clipCollectionView];
  uint64_t v9 = objc_msgSend(v8, "indexPathForItemAtPoint:", x, y);

  float v10 = [(HUClipScrubberScrollDelegate *)self clipCollectionView];
  id v11 = [v10 cellForItemAtIndexPath:v9];

  id v12 = [(HUClipScrubberScrollDelegate *)self dataSource];
  float v13 = objc_msgSend(v12, "eventForSection:", objc_msgSend(v9, "section"));

  id v14 = [(HUClipScrubberScrollDelegate *)self dataSource];
  double v15 = objc_msgSend(v14, "previousEventForSection:", objc_msgSend(v9, "section"));

  if ([(HUClipScrubberScrollDelegate *)self _doesPrecedingSpacerSpanMultipleDaysForEvent:v13])
  {
    float v16 = x;
    [v11 frame];
    float MidX = CGRectGetMidX(v34);
    [v11 frame];
    double v19 = (float)(v16 - MidX) / (v18 * 0.5);
    *(float *)&double v19 = v19;
    if (v16 >= MidX) {
      [(HUClipScrubberScrollDelegate *)self _selectedDateForTodayFromEvent:v13 percentDuration:v19];
    }
    else {
    uint64_t v20 = [(HUClipScrubberScrollDelegate *)self _selectedDateForYesterdayFromPreviousEvent:v15 percentDuration:v19];
    }
  }
  else
  {
    [v11 frame];
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    [v7 contentOffset];
    *(float *)&double v30 = v29;
    uint64_t v20 = -[HUClipScrubberScrollDelegate _interpolatedDateFromEvent:toEvent:insideRect:atTimelinePosition:](self, "_interpolatedDateFromEvent:toEvent:insideRect:atTimelinePosition:", v15, v13, v22, v24, v26, v28, v30);
  }
  double v31 = (void *)v20;

  return v31;
}

- (void)_updateFamiliarFaceCell
{
  BOOL v3 = [(HUClipScrubberScrollDelegate *)self dataSource];
  id v4 = [v3 clipCollectionView];
  [v4 contentOffset];
  double v6 = v5;
  uint64_t v8 = v7;

  [(HUClipScrubberScrollDelegate *)self playheadPosition];
  double v10 = v6 + v9;
  id v11 = [(HUClipScrubberScrollDelegate *)self dataSource];
  id v12 = [v11 clipCollectionView];
  float v13 = [v12 visibleCells];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __55__HUClipScrubberScrollDelegate__updateFamiliarFaceCell__block_invoke;
  v14[3] = &unk_1E638F340;
  *(double *)&v14[5] = v10;
  v14[6] = v8;
  v14[4] = self;
  [v13 enumerateObjectsUsingBlock:v14];
}

void __55__HUClipScrubberScrollDelegate__updateFamiliarFaceCell__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v17 = v3;
  if (objc_opt_isKindOfClass()) {
    id v4 = v17;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    [v5 frame];
    if (!CGRectContainsPoint(v19, *(CGPoint *)(a1 + 40))) {
      goto LABEL_8;
    }
    double v6 = [*(id *)(a1 + 32) dataSource];
    char v7 = [v6 isEditing];

    if ((v7 & 1) == 0
      && ([*(id *)(a1 + 32) playheadPosition],
          double v9 = (float)(v8 + -40.0),
          [v5 frame],
          v10 + v9 >= *(double *)(a1 + 40)))
    {
      [*(id *)(a1 + 32) playheadPosition];
      double v14 = (float)(v13 + -5.0);
      double v15 = *(double *)(a1 + 40);
      [v5 frame];
      objc_msgSend(v5, "showFamiliarFacesWithMaxWidth:", fmax(v15 - v16 + v14 + 40.0, 118.0));
    }
    else
    {
LABEL_8:
      [v5 hideFamiliarFaces];
    }
    if ([MEMORY[0x1E4F68FF8] markCachedVideoAsGreenInTimeline])
    {
      id v11 = [*(id *)(a1 + 32) dataSource];
      char v12 = [v11 isEditing];

      if ((v12 & 1) == 0) {
        [v5 updateVideoCacheMarker];
      }
    }
  }
}

- (float)playheadPosition
{
  v2 = [(HUClipScrubberScrollDelegate *)self clipCollectionView];
  [v2 bounds];
  float v4 = v3 * 0.5;

  return v4;
}

- (id)_selectedDateForEventInRect:(CGRect)a3
{
  double width = a3.size.width;
  CGFloat MaxX = CGRectGetMaxX(a3);
  [(HUClipScrubberScrollDelegate *)self playheadPosition];
  *(float *)&CGFloat MaxX = MaxX - v6;
  char v7 = [(HUClipScrubberScrollDelegate *)self clipCollectionView];
  [v7 contentOffset];
  float v9 = v8;

  float v10 = 1.0 - (float)(*(float *)&MaxX - v9) / width;
  double v11 = v10;
  char v12 = [(HUClipScrubberScrollDelegate *)self currentEvent];
  objc_msgSend(v12, "hf_duration");
  *(float *)&double v11 = v13 * v11;

  double v14 = [(HUClipScrubberScrollDelegate *)self currentEvent];
  double v15 = [v14 dateOfOccurrence];
  double v16 = [v15 dateByAddingTimeInterval:*(float *)&v11];

  return v16;
}

- (id)_selectedDateForTodayFromEvent:(id)a3 percentDuration:(float)a4
{
  id v5 = a3;
  float v6 = [v5 dateOfOccurrence];
  char v7 = objc_msgSend(v6, "hf_startOfDay");

  double v8 = [v5 dateOfOccurrence];

  [v8 timeIntervalSinceDate:v7];
  double v10 = v9;

  float v11 = v10 * a4;
  char v12 = [v7 dateByAddingTimeInterval:v11];

  return v12;
}

- (id)_selectedDateForYesterdayFromPreviousEvent:(id)a3 percentDuration:(float)a4
{
  id v5 = a3;
  float v6 = [v5 dateOfOccurrence];
  char v7 = objc_msgSend(v6, "hf_startOfNextDay");

  double v8 = objc_msgSend(v5, "hf_endDate");

  [v7 timeIntervalSinceDate:v8];
  double v10 = v9;

  float v11 = v10 * a4;
  char v12 = [v7 dateByAddingTimeInterval:v11];

  return v12;
}

- (id)_interpolatedDateFromEvent:(id)a3 toEvent:(id)a4 insideRect:(CGRect)a5 atTimelinePosition:(float)a6
{
  CGFloat height = a5.size.height;
  double width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v13 = a3;
  double v14 = [a4 dateOfOccurrence];
  double v15 = objc_msgSend(v13, "hf_endDate");
  [v14 timeIntervalSinceDate:v15];
  double v17 = v16;

  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.double width = width;
  v27.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v27);
  [(HUClipScrubberScrollDelegate *)self playheadPosition];
  float v20 = MaxX - v19;
  float v21 = 1.0 - (float)(v20 - a6) / width;
  float v22 = v17 * v21;
  double v23 = objc_msgSend(v13, "hf_endDate");

  double v24 = [v23 dateByAddingTimeInterval:v22];

  return v24;
}

- (void)dealloc
{
  double v3 = [(HUClipScrubberScrollDelegate *)self clipCollectionView];
  [v3 removeObserver:self forKeyPath:@"contentSize"];

  v4.receiver = self;
  v4.super_class = (Class)HUClipScrubberScrollDelegate;
  [(HUClipScrubberScrollDelegate *)&v4 dealloc];
}

- (HUClipScrubberDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (HUClipScrubberDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (UICollectionView)clipCollectionView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clipCollectionView);

  return (UICollectionView *)WeakRetained;
}

- (void)setClipCollectionView:(id)a3
{
}

- (HFCameraPlaybackEngine)playbackEngine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);

  return (HFCameraPlaybackEngine *)WeakRetained;
}

- (void)setPlaybackEngine:(id)a3
{
}

- (BOOL)shouldIgnoreScrolling
{
  return self->_shouldIgnoreScrolling;
}

- (void)setShouldIgnoreScrolling:(BOOL)a3
{
  self->_shouldIgnoreScrolling = a3;
}

- (BOOL)isUserScrubbing
{
  return self->_userScrubbing;
}

- (BOOL)hasUserInteractedWithScrubber
{
  return self->_hasUserInteractedWithScrubber;
}

- (void)setHasUserInteractedWithScrubber:(BOOL)a3
{
  self->_hasUserInteractedWithScrubber = a3;
}

- (double)lastContentWidth
{
  return self->_lastContentWidth;
}

- (void)setLastContentWidth:(double)a3
{
  self->_lastContentWidth = a3;
}

- (double)lastContentOffset
{
  return self->_lastContentOffset;
}

- (void)setLastContentOffset:(double)a3
{
  self->_lastContentOffset = a3;
}

- (HFCameraRecordingEvent)currentEvent
{
  return self->_currentEvent;
}

- (void)setCurrentEvent:(id)a3
{
}

- (double)targetScrollOffset
{
  return self->_targetScrollOffset;
}

- (void)setTargetScrollOffset:(double)a3
{
  self->_targetScrollOffset = a3;
}

- (BOOL)isScrollingForward
{
  return self->_scrollingForward;
}

- (void)setScrollingForward:(BOOL)a3
{
  self->_scrollingForward = a3;
}

- (double)elapsedTime
{
  return self->_elapsedTime;
}

- (void)setElapsedTime:(double)a3
{
  self->_elapsedTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentEvent, 0);
  objc_destroyWeak((id *)&self->_playbackEngine);
  objc_destroyWeak((id *)&self->_clipCollectionView);

  objc_destroyWeak((id *)&self->_dataSource);
}

@end