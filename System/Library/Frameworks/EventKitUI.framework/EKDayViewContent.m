@interface EKDayViewContent
- (BOOL)_doOffscreenOccurrences;
- (BOOL)_getBottomPinRegion:(double *)a3 dayIndex:(unint64_t *)a4 forPoint:(CGPoint)a5;
- (BOOL)_layoutDayIfNeeded:(int64_t)a3 isLoadingAsync:(BOOL)a4;
- (BOOL)_layoutNeededForDay:(int64_t)a3 isLoadingAsync:(BOOL)a4;
- (BOOL)_shouldAnnotateAppEntitiesForDayAtIndex:(unint64_t)a3;
- (BOOL)allowsOccurrenceSelection;
- (BOOL)containsVisibleOccurrenceViews;
- (BOOL)darkensWeekends;
- (BOOL)eventsFillGrid;
- (BOOL)eventsIntersectRect:(CGRect)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)isMiniPreviewInEventDetail;
- (BOOL)itemIsEligibleForGrouping:(id)a3;
- (BOOL)offscreenOccurrencePinningEnabled;
- (BOOL)reduceLayoutProcessingForAnimation;
- (BOOL)showsLeftBorder;
- (BOOL)useMultiDayStyle;
- (BOOL)usesSmallText;
- (CGPoint)pointForDate:(double)a3;
- (CGRect)_occurrencePaddingBetweenDays:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (EKCalendarDate)endDate;
- (EKCalendarDate)startDate;
- (EKDayViewContent)initWithFrame:(CGRect)a3 sizeClass:(int64_t)a4 orientation:(int64_t)a5;
- (EKDayViewContent)initWithFrame:(CGRect)a3 sizeClass:(int64_t)a4 orientation:(int64_t)a5 backgroundColor:(id)a6 opaque:(BOOL)a7 isMiniPreviewInEventDetail:(BOOL)a8 numberOfDaysToDisplay:(unint64_t)a9;
- (EKDayViewContentDelegate)delegate;
- (EKEvent)dimmedOccurrence;
- (EKEvent)selectedEvent;
- (NSCalendar)calendar;
- (NSTimeZone)timeZone;
- (UIColor)occurrenceLocationColor;
- (UIColor)occurrenceTextBackgroundColor;
- (UIColor)occurrenceTimeColor;
- (UIColor)occurrenceTitleColor;
- (UIEdgeInsets)insetsForInterfaceLayout:(UIEdgeInsets)a3;
- (UIEdgeInsets)occurrencePadding;
- (_NSRange)_dayRangeForEvent:(id)a3 useProposedTime:(BOOL)a4;
- (_NSRange)_dayRangeForEventWithStartDate:(id)a3 endDate:(id)a4;
- (double)_dayWidth;
- (double)dateForPoint:(CGPoint)a3;
- (double)firstEventSecond;
- (double)fixedDayWidth;
- (id)allVisibleItems;
- (id)dayStarts;
- (id)grid;
- (id)groupItem:(id)a3 withItem:(id)a4;
- (id)lastDisplayedSecond;
- (id)occurrenceViewForEvent:(id)a3;
- (id)occurrenceViewForEvent:(id)a3 onDate:(double)a4;
- (id)occurrenceViews;
- (id)presentationControllerForEditMenu;
- (id)selectedCopyViewForDayOccurrenceView:(id)a3;
- (id)selectedEventsForEditMenu;
- (id)singleItemsByDay;
- (id)singleItemsForPreloadByDay;
- (id)visibleItemsByDay;
- (unint64_t)_dayIndexForAllIndex:(unint64_t)a3;
- (void)_adjustViewsForPinning;
- (void)_computeDayStartsAndEnds;
- (void)_configureOccurrenceViewMarginAndPadding:(id)a3;
- (void)_layoutDay:(unint64_t)a3 isLoadingAsync:(BOOL)a4;
- (void)_layoutDaysIfVisible;
- (void)_tapRecognized:(id)a3;
- (void)_updateShouldAnnotateAppEntitiesByDay;
- (void)applyContentItem:(id)a3 toView:(id)a4 shouldAnnotate:(BOOL)a5;
- (void)applyLoadedOccurrenceBatchStartingAtIndex:(int64_t)a3 batchSize:(int64_t)a4 fromArray:(id)a5 withStartDate:(id)a6 animated:(BOOL)a7 reverse:(BOOL)a8 completion:(id)a9;
- (void)applyLoadedOccurrencesWithBatching:(BOOL)a3 animated:(BOOL)a4 reverse:(BOOL)a5 completion:(id)a6;
- (void)attemptDisplayReviewPrompt;
- (void)clearTemporaryViews;
- (void)dayOccurrenceViewSelected:(id)a3 source:(unint64_t)a4;
- (void)dealloc;
- (void)layoutSubviews;
- (void)loadAndLayoutOccurrences:(id)a3 reverse:(BOOL)a4;
- (void)loadOccurrences:(id)a3;
- (void)movePreloadedItemsToVisible;
- (void)prepareForReuseIsReload:(BOOL)a3;
- (void)rectBecameVisible:(CGRect)a3;
- (void)saveTemporaryViews;
- (void)selectEvent:(id)a3;
- (void)setAllowsOccurrenceSelection:(BOOL)a3;
- (void)setCalendar:(id)a3;
- (void)setDarkensWeekends:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDimmedOccurrence:(id)a3;
- (void)setEventsFillGrid:(BOOL)a3;
- (void)setFixedDayWidth:(double)a3;
- (void)setHoursToPadTop:(double)a3;
- (void)setIsMiniPreviewInEventDetail:(BOOL)a3;
- (void)setNeedsLayout;
- (void)setOccurrenceLocationColor:(id)a3;
- (void)setOccurrencePadding:(UIEdgeInsets)a3;
- (void)setOccurrenceTextBackgroundColor:(id)a3;
- (void)setOccurrenceTimeColor:(id)a3;
- (void)setOccurrenceTitleColor:(id)a3;
- (void)setOccurrences:(id)a3;
- (void)setOffscreenOccurrencePinningEnabled:(BOOL)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setReduceLayoutProcessingForAnimation:(BOOL)a3;
- (void)setShowsLeftBorder:(BOOL)a3;
- (void)setStartDateWithDateComponents:(id)a3;
- (void)setTimeZone:(id)a3;
- (void)setUseMultiDayStyle:(BOOL)a3;
- (void)setUsesSmallText:(BOOL)a3;
- (void)setViewsDimmed:(BOOL)a3 forEvent:(id)a4;
@end

@implementation EKDayViewContent

uint64_t __46__EKDayViewContent__layoutDay_isLoadingAsync___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIsLoadingAsync:1];
}

- (BOOL)isMiniPreviewInEventDetail
{
  return self->_isMiniPreviewInEventDetail;
}

void __42__EKDayViewContent__adjustViewsForPinning__block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v34 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        v10 = [v9 view];
        [v10 frame];
        double v12 = v11;
        CGFloat v14 = v13;
        double v16 = v15;
        double v18 = v17;

        double v19 = *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
        v20 = [v9 view];
        if ([v20 isHidden])
        {
          v39.origin.x = v12;
          v39.origin.y = v19;
          v39.size.width = v16;
          v39.size.height = v18;
          BOOL v21 = CGRectIntersectsRect(v39, *(CGRect *)(*(void *)(a1 + 32) + 528));

          if (!v21) {
            continue;
          }
        }
        else
        {
        }
        v40.origin.x = v12;
        v40.origin.y = v14;
        v40.size.width = v16;
        v40.size.height = v18;
        if (!CGRectIntersectsRect(v40, *(CGRect *)(*(void *)(a1 + 32) + 528)))
        {
          v41.origin.x = v12;
          v41.origin.y = v19;
          v41.size.width = v16;
          v41.size.height = v18;
          if (!CGRectIntersectsRect(v41, *(CGRect *)(*(void *)(a1 + 32) + 528))) {
            continue;
          }
        }
        v22 = [v9 view];
        objc_msgSend(v22, "setFrame:", v12, v19, v16, v18);

        v23 = [v9 view];
        if ([v23 isHidden])
        {
          v42.origin.x = v12;
          v42.origin.y = v19;
          v42.size.width = v16;
          v42.size.height = v18;
          BOOL v24 = CGRectIntersectsRect(v42, *(CGRect *)(*(void *)(a1 + 32) + 528));

          if (!v24) {
            continue;
          }
          v23 = [v9 view];
          [v23 setHidden:0];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v6);
  }
  CalRoundToScreenScale(3.5);
  double v26 = v25;
  if (a3 + 1 < (unint64_t)[*(id *)(a1 + 40) count])
  {
    v27 = [v4 objectAtIndex:0];
    v28 = [*(id *)(a1 + 40) objectAtIndex:a3 + 1];
    v29 = [v28 objectAtIndex:0];

    [v27 unPinnedViewFrame];
    double MinY = CGRectGetMinY(v43);
    [v29 unPinnedViewFrame];
    double v31 = MinY - CGRectGetMinY(v44);
    if (v26 >= v31) {
      double v26 = v31;
    }
  }
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                          + 24)
                                                              - v26;
}

- (double)dateForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(EKDayViewContent *)self _dayWidth];
  [(EKDayGridView *)self->_grid secondAtPosition:y];
  if (x >= 0.0) {
    CalTimeDirectionIsLeftToRight();
  }
  uint64_t v6 = [(NSCalendar *)self->_calendar timeZone];
  [(EKCalendarDate *)self->_startDate absoluteTime];
  CalAbsoluteTimeAddGregorianUnits();
  double v8 = v7;
  if (v6) {
    CFRelease(v6);
  }
  return v8;
}

- (CGPoint)pointForDate:(double)a3
{
  uint64_t v5 = (void *)MEMORY[0x1E4F57838];
  uint64_t v6 = [(NSCalendar *)self->_calendar timeZone];
  double v7 = [v5 calendarDateWithAbsoluteTime:v6 timeZone:a3];

  double v8 = [v7 calendarDateForDay];
  double v9 = (double)[v8 secondsFromGMT];
  double v10 = (double)[v7 secondsFromGMT];
  [v8 absoluteTime];
  [(EKDayGridView *)self->_grid positionOfSecond:(uint64_t)(a3 - v11 - (v9 - v10))];
  double v13 = v12;
  CGFloat v14 = [(EKDayViewContent *)self dayStarts];
  double v15 = [v14 objectAtIndex:0];
  double v16 = [v15 objectForKey:@"startDate"];

  uint64_t v17 = [v7 differenceInDays:v16];
  [(EKDayViewContent *)self _dayWidth];
  double v19 = v18 * 0.5 + v18 * (double)v17;
  if ((CalInterfaceIsLeftToRight() & 1) == 0)
  {
    [(EKDayGridView *)self->_grid widthForOccurrences];
    double v19 = v20 - v19;
  }

  double v21 = v19;
  double v22 = v13;
  result.double y = v22;
  result.double x = v21;
  return result;
}

- (double)_dayWidth
{
  double result = self->_fixedDayWidth;
  daysToDispladouble y = self->_daysToDisplay;
  if (result <= 0.0)
  {
    if (!daysToDisplay) {
      return 0.0;
    }
    [(EKDayGridView *)self->_grid widthForOccurrences];
    daysToDispladouble y = self->_daysToDisplay;
    double result = (double)((unint64_t)v5 / daysToDisplay);
  }
  if (daysToDisplay == 1 && self->_eventsFillGrid) {
    return result + 1.0;
  }
  return result;
}

- (id)dayStarts
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)[(NSMutableArray *)v2->_dayStarts copy];
  objc_sync_exit(v2);

  return v3;
}

- (id)grid
{
  return self->_grid;
}

- (CGRect)_occurrencePaddingBetweenDays:(CGRect)a3
{
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  CalTimeDirectionIsLeftToRight();
  double v7 = x + 2.0;
  double v8 = y + 0.0;
  double v9 = width + -4.0;
  double v10 = height;
  result.size.CGFloat height = v10;
  result.size.double width = v9;
  result.origin.double y = v8;
  result.origin.double x = v7;
  return result;
}

void __36__EKDayViewContent_loadOccurrences___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned int a4)
{
  id v52 = a2;
  unsigned int v51 = a4;
  unint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "_dayRangeForEvent:useProposedTime:");
  unint64_t v8 = v6 + v7;
  uint64_t v45 = 432;
  if (v6 + v7 >= *(void *)(*(void *)(a1 + 32) + 432)) {
    unint64_t v8 = *(void *)(*(void *)(a1 + 32) + 432);
  }
  unint64_t v48 = v8;
  unint64_t v49 = v6;
  if (v6 < v8)
  {
    unint64_t v9 = v6;
    unint64_t v46 = v8 - 1;
    unint64_t v10 = ~v6;
    do
    {
      unint64_t v11 = v9;
      if ((CalTimeDirectionIsLeftToRight() & 1) == 0) {
        unint64_t v11 = v10 + *(void *)(*(void *)(a1 + 32) + v45);
      }
      double v12 = [[EKDayViewContentItem alloc] initWithEventIndex:a3 sizeClass:*(void *)(*(void *)(a1 + 32) + 600)];
      double v13 = [*(id *)(a1 + 40) objectAtIndex:v11];
      [v13 addObject:v12];
      [(EKDayViewContentItem *)v12 setEvent:v52];
      v50 = v13;
      if (v51)
      {
        CGFloat v14 = [v52 endDateUnadjustedForLegacyClients];
        double v15 = [v52 startDate];
        [v14 timeIntervalSinceDate:v15];
        double v17 = v16;

        double v18 = [v52 proposedStartDate];
        double v19 = [v18 dateByAddingTimeInterval:v17];

        double v20 = (void *)MEMORY[0x1E4F57838];
        double v21 = [v52 proposedStartDate];
        double v22 = [*(id *)(*(void *)(a1 + 32) + 664) timeZone];
        v23 = [v20 calendarDateWithDate:v21 timeZone:v22];
        [(EKDayViewContentItem *)v12 setStartDate:v23];

        BOOL v24 = (void *)MEMORY[0x1E4F57838];
      }
      else
      {
        double v25 = (void *)MEMORY[0x1E4F57838];
        double v26 = [v52 startDate];
        v27 = [*(id *)(*(void *)(a1 + 32) + 664) timeZone];
        v28 = [v25 calendarDateWithDate:v26 timeZone:v27];
        [(EKDayViewContentItem *)v12 setStartDate:v28];

        BOOL v24 = (void *)MEMORY[0x1E4F57838];
        double v19 = [v52 endDateUnadjustedForLegacyClients];
      }
      v29 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 664), "timeZone", v45);
      v30 = [v24 calendarDateWithDate:v19 timeZone:v29];
      [(EKDayViewContentItem *)v12 setEndDate:v30];

      [v52 travelTime];
      -[EKDayViewContentItem setTravelTime:](v12, "setTravelTime:");
      [(EKDayViewContentItem *)v12 setUsesSmallText:*(unsigned __int8 *)(*(void *)(a1 + 32) + 638)];
      [(EKDayViewContentItem *)v12 setIsProposedTime:v51];
      id v31 = *(id *)(a1 + 32);
      objc_sync_enter(v31);
      id v32 = *(id *)(*(void *)(a1 + 32) + 648);
      id v33 = *(id *)(*(void *)(a1 + 32) + 656);
      objc_sync_exit(v31);

      long long v34 = [v52 startCalendarDate];
      long long v35 = [v34 calendarDateForDay];

      -[EKDayViewContentItem setOccurrenceDateIndex:](v12, "setOccurrenceDateIndex:", [v32 differenceInDays:v35] + v9);
      if (v9 <= v49)
      {
        long long v36 = [(EKDayViewContentItem *)v12 startDate];
        [v36 absoluteTime];
        double v38 = v37;
        [v32 absoluteTime];
        [(EKDayViewContentItem *)v12 setHasPrecedingDuration:v38 < v39];
      }
      else
      {
        [(EKDayViewContentItem *)v12 setHasPrecedingDuration:1];
      }
      if (v9 >= v46)
      {
        CGRect v40 = [(EKDayViewContentItem *)v12 endDate];
        [v40 absoluteTime];
        double v42 = v41;
        CGRect v43 = [v33 calendarDateForEndOfDay];
        [v43 absoluteTime];
        [(EKDayViewContentItem *)v12 setHasTrailingDuration:v42 > v44 + 1.0];
      }
      else
      {
        [(EKDayViewContentItem *)v12 setHasTrailingDuration:1];
      }
      [(EKDayViewContentItem *)v12 setOccurrenceIsFirstVisibleDayOfEvent:[(EKDayViewContentItem *)v12 hasPrecedingDuration] ^ 1];

      ++v9;
      --v10;
    }
    while (v48 != v9);
  }
}

uint64_t __46__EKDayViewContent__layoutDay_isLoadingAsync___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 end];
  uint64_t v7 = [v5 end];
  uint64_t v8 = [v6 compare:v7];

  if (!v8)
  {
    unint64_t v9 = [v4 start];
    unint64_t v10 = [v5 start];
    uint64_t v8 = [v9 compare:v10];
  }
  return v8;
}

uint64_t __42__EKDayViewContent__adjustViewsForPinning__block_invoke(uint64_t a1, void *a2, void *a3, char a4)
{
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = [v7 lastObject];
  unint64_t v9 = [v8 lastObject];
  unint64_t v10 = v9;
  if (v9
    && (([v9 unPinnedViewFrame], (a4 & 1) == 0)
      ? (double MinY = CGRectGetMinY(*(CGRect *)&v11), [v6 unPinnedViewFrame], MaxY = CGRectGetMinY(v21))
      : (double MinY = CGRectGetMaxY(*(CGRect *)&v11), [v6 unPinnedViewFrame], MaxY = CGRectGetMaxY(v20)),
        MinY == MaxY))
  {
    uint64_t v18 = 0;
  }
  else
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA48] array];

    [v7 addObject:v17];
    uint64_t v18 = 1;
    uint64_t v8 = (void *)v17;
  }
  [v8 addObject:v6];

  return v18;
}

- (_NSRange)_dayRangeForEventWithStartDate:(id)a3 endDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1E4F57838];
  unint64_t v9 = [(NSCalendar *)self->_calendar timeZone];
  unint64_t v10 = [v8 calendarDateWithDate:v6 timeZone:v9];

  uint64_t v11 = (void *)MEMORY[0x1E4F57838];
  double v12 = [(NSCalendar *)self->_calendar timeZone];
  double v13 = [v11 calendarDateWithDate:v7 timeZone:v12];

  [v10 absoluteTime];
  double v15 = v14;
  [(EKCalendarDate *)self->_startDate absoluteTime];
  if (v15 < v16)
  {
    uint64_t v17 = self->_startDate;

    unint64_t v10 = v17;
  }
  uint64_t v18 = [v10 differenceInDays:self->_startDate];
  double v19 = [v10 calendarDateForDay];
  uint64_t v20 = [v13 differenceInDays:v19];
  if (([v6 isEqualToDate:v7] & 1) == 0 && !objc_msgSend(v13, "hour") && !objc_msgSend(v13, "minute")) {
    uint64_t v20 = (__PAIR128__(v20, [v13 second]) - 1) >> 64;
  }

  NSUInteger v21 = v18;
  NSUInteger v22 = v20 + 1;
  result.length = v22;
  result.location = v21;
  return result;
}

- (_NSRange)_dayRangeForEvent:(id)a3 useProposedTime:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = v6;
  if (v4)
  {
    uint64_t v8 = [v6 proposedStartDate];
    [v7 duration];
    unint64_t v9 = objc_msgSend(v8, "dateByAddingTimeInterval:");

    unint64_t v10 = [v7 proposedStartDate];

    uint64_t v11 = self;
    double v12 = v10;
    double v13 = v9;
  }
  else
  {
    unint64_t v9 = [v6 startDate];
    unint64_t v10 = [v7 endDateUnadjustedForLegacyClients];

    uint64_t v11 = self;
    double v12 = v9;
    double v13 = v10;
  }
  uint64_t v14 = [(EKDayViewContent *)v11 _dayRangeForEventWithStartDate:v12 endDate:v13];
  NSUInteger v16 = v15;

  NSUInteger v17 = v14;
  NSUInteger v18 = v16;
  result.length = v18;
  result.location = v17;
  return result;
}

- (void)loadOccurrences:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  uint64_t v42 = [v36 count];
  BOOL v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:self->_daysToDisplay];
  if (self->_daysToDisplay)
  {
    unint64_t v5 = 0;
    do
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [v4 addObject:v6];

      ++v5;
    }
    while (v5 < self->_daysToDisplay);
  }
  long long v35 = v4;
  if (v42)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __36__EKDayViewContent_loadOccurrences___block_invoke;
    aBlock[3] = &unk_1E6087728;
    aBlock[4] = self;
    obuint64_t j = v4;
    id v53 = obj;
    CGRect v40 = _Block_copy(aBlock);
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    while (1)
    {
      unint64_t v9 = objc_msgSend(v36, "objectAtIndex:", v8, v35);
      int v10 = [v9 isProposedTimeEvent];
      uint64_t v11 = (void *)MEMORY[0x1E4F576D0];
      if (v10)
      {
        double v12 = [v9 proposedStartDate];
        [v9 duration];
        double v13 = objc_msgSend(v11, "rangeWithStartDate:duration:", v12);
      }
      else
      {
        double v12 = [v9 startDate];
        uint64_t v14 = [v9 endDateUnadjustedForLegacyClients];
        double v13 = [v11 rangeWithStartDate:v12 endDate:v14];
      }
      NSUInteger v15 = [(EKDayViewContent *)self endDate];
      NSUInteger v16 = [v15 calendarDateByAddingDays:1];

      NSUInteger v17 = (void *)MEMORY[0x1E4F576D0];
      NSUInteger v18 = [(EKDayViewContent *)self startDate];
      double v19 = [v18 date];
      uint64_t v20 = [v16 date];
      NSUInteger v21 = [v17 rangeWithStartDate:v19 endDate:v20];

      if (![v13 intersectsRange:v21]) {
        goto LABEL_15;
      }
      if ([v9 isProposedTimeEvent]) {
        goto LABEL_14;
      }
      NSUInteger v22 = [v9 eventStore];
      if ([v22 showDeclinedEvents]) {
        break;
      }
      BOOL v23 = [v9 participationStatus] == 3;

      if (!v23) {
        goto LABEL_14;
      }
LABEL_15:

      if (v42 == ++v8)
      {
        BOOL v24 = self->_singleItemsForPreloadByDay;
        objc_sync_enter(v24);
        [(NSMutableArray *)self->_singleItemsForPreloadByDay removeAllObjects];
        [(NSMutableArray *)self->_singleItemsForPreloadByDay addObjectsFromArray:obj];
        objc_sync_exit(v24);

        goto LABEL_17;
      }
    }

LABEL_14:
    (*((void (**)(void *, void *, uint64_t, uint64_t))v40 + 2))(v40, v9, v7++, [v9 isProposedTimeEvent]);
    goto LABEL_15;
  }
LABEL_17:
  if (self->_selectedEvent)
  {
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id obja = v35;
    uint64_t v43 = [obja countByEnumeratingWithState:&v48 objects:v55 count:16];
    if (v43)
    {
      char v39 = 0;
      uint64_t v41 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v43; ++i)
        {
          if (*(void *)v49 != v41) {
            objc_enumerationMutation(obja);
          }
          double v26 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          long long v44 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          id v27 = v26;
          uint64_t v28 = [v27 countByEnumeratingWithState:&v44 objects:v54 count:16];
          if (v28)
          {
            uint64_t v29 = *(void *)v45;
            while (2)
            {
              for (uint64_t j = 0; j != v28; ++j)
              {
                if (*(void *)v45 != v29) {
                  objc_enumerationMutation(v27);
                }
                id v31 = objc_msgSend(*(id *)(*((void *)&v44 + 1) + 8 * j), "view", v35);
                id v32 = [v31 occurrence];
                char v33 = [v32 isEqual:self->_selectedEvent];

                if (v33)
                {
                  char v39 = 1;
                  goto LABEL_33;
                }
              }
              uint64_t v28 = [v27 countByEnumeratingWithState:&v44 objects:v54 count:16];
              if (v28) {
                continue;
              }
              break;
            }
          }
LABEL_33:
        }
        uint64_t v43 = [obja countByEnumeratingWithState:&v48 objects:v55 count:16];
      }
      while (v43);

      if (v39) {
        goto LABEL_39;
      }
    }
    else
    {
    }
    selectedEvent = self->_selectedEvent;
    self->_selectedEvent = 0;
  }
LABEL_39:
  self->_dataLoaded = 1;
}

- (EKCalendarDate)startDate
{
  return self->_startDate;
}

- (EKCalendarDate)endDate
{
  return self->_endDate;
}

- (void)applyLoadedOccurrenceBatchStartingAtIndex:(int64_t)a3 batchSize:(int64_t)a4 fromArray:(id)a5 withStartDate:(id)a6 animated:(BOOL)a7 reverse:(BOOL)a8 completion:(id)a9
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v15 = a5;
  id v16 = a6;
  NSUInteger v17 = (void (**)(void))a9;
  uint64_t v18 = [v15 count];
  if (self->_dataLoaded)
  {
    int64_t v19 = v18;
    id v50 = v15;
    if (!v16) {
      goto LABEL_4;
    }
    [(EKDayViewContent *)self startDate];
    int64_t v20 = v19;
    BOOL v21 = a8;
    int64_t v22 = a4;
    BOOL v23 = a7;
    BOOL v24 = v17;
    v26 = double v25 = v16;
    char v27 = [v25 isEqual:v26];

    id v16 = v25;
    NSUInteger v17 = v24;
    a7 = v23;
    a4 = v22;
    a8 = v21;
    int64_t v19 = v20;
    id v15 = v50;
    if (v27)
    {
LABEL_4:
      long long v49 = v17;
      self->_shouldLayoutInReverse = a8;
      BOOL v47 = a7;
      self->_shouldAnimateLayout = a7;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __124__EKDayViewContent_applyLoadedOccurrenceBatchStartingAtIndex_batchSize_fromArray_withStartDate_animated_reverse_completion___block_invoke;
      aBlock[3] = &unk_1E60876B0;
      id v28 = v15;
      id v64 = v28;
      v65 = self;
      BOOL v66 = a8;
      uint64_t v29 = (void (**)(void *, int64_t))_Block_copy(aBlock);
      if (a8)
      {
        if (a3 < a4) {
          int64_t v30 = -1;
        }
        else {
          int64_t v30 = a3 - a4;
        }
        for (; a3 > v30; --a3)
          v29[2](v29, a3);
        if ((a3 & 0x8000000000000000) == 0)
        {
LABEL_11:
          dispatch_time_t v31 = dispatch_time(0, 0);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __124__EKDayViewContent_applyLoadedOccurrenceBatchStartingAtIndex_batchSize_fromArray_withStartDate_animated_reverse_completion___block_invoke_2;
          block[3] = &unk_1E60876D8;
          block[4] = self;
          int64_t v55 = a3;
          int64_t v56 = a4;
          id v52 = v28;
          id v53 = v16;
          BOOL v57 = v47;
          BOOL v58 = a8;
          NSUInteger v17 = v49;
          v54 = v49;
          dispatch_after(v31, MEMORY[0x1E4F14428], block);

LABEL_32:
          goto LABEL_33;
        }
      }
      else
      {
        if (a4 + a3 >= v19) {
          int64_t v32 = v19;
        }
        else {
          int64_t v32 = a4 + a3;
        }
        if (v32 > a3)
        {
          do
            v29[2](v29, a3++);
          while (v32 != a3);
          a3 = v32;
        }
        if (a3 != v19) {
          goto LABEL_11;
        }
      }
      id v46 = v16;
      long long v48 = v29;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      id v33 = v28;
      uint64_t v34 = [v33 countByEnumeratingWithState:&v59 objects:v67 count:16];
      if (v34)
      {
        uint64_t v35 = v34;
        uint64_t v36 = *(void *)v60;
        do
        {
          for (uint64_t i = 0; i != v35; ++i)
          {
            if (*(void *)v60 != v36) {
              objc_enumerationMutation(v33);
            }
            double v38 = *(void **)(*((void *)&v59 + 1) + 8 * i);
            char v39 = objc_msgSend(v38, "view", v46);
            CGRect v40 = [v39 selectedCopy];

            if (v40)
            {
              [v40 requestContentIfNeeded:16 completion:0];
              uint64_t v41 = [(EKDayGridView *)self->_grid occurrenceContainerView];
              [v41 bringSubviewToFront:v40];
            }
            uint64_t v42 = [v38 view];
            int v43 = [v42 selected];

            if (v43)
            {
              long long v44 = [v38 currentState];
              long long v45 = +[EKDayViewContentItemStateWrapper wrapperWithContentItem:v38 viewContent:self];
              [v44 performChangesWithState:v45];

              [v38 _requestPayloadAnimated:self->_shouldAnimateLayout drawSynchronously:1];
            }
          }
          uint64_t v35 = [v33 countByEnumeratingWithState:&v59 objects:v67 count:16];
        }
        while (v35);
      }

      NSUInteger v17 = v49;
      v49[2](v49);
      id v15 = v50;
      id v16 = v46;
      uint64_t v29 = v48;
      goto LABEL_32;
    }
  }
  v17[2](v17);
LABEL_33:
}

void __124__EKDayViewContent_applyLoadedOccurrenceBatchStartingAtIndex_batchSize_fromArray_withStartDate_animated_reverse_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v24 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  unint64_t v4 = [*(id *)(a1 + 40) _dayIndexForAllIndex:a2];
  if (v4 >= [*(id *)(*(void *)(a1 + 40) + 616) count])
  {
    id v10 = 0;
  }
  else
  {
    unint64_t v5 = [v24 event];
    id v6 = [v5 calendarItemIdentifier];

    uint64_t v7 = [*(id *)(*(void *)(a1 + 40) + 616) objectAtIndexedSubscript:v4];
    uint64_t v8 = v7;
    if (v6
      && ([v7 objectForKeyedSubscript:v6], (unint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v10 = v9;
      uint64_t v11 = *(void *)(a1 + 40);
      if (*(void *)(v11 + 624) == 1)
      {
        [v8 setObject:0 forKeyedSubscript:v6];
        uint64_t v11 = *(void *)(a1 + 40);
      }
      [*(id *)(v11 + 584) removeObject:v10];
    }
    else
    {
      id v10 = 0;
    }
  }
  id v12 = *(id *)(a1 + 40);
  objc_sync_enter(v12);
  if (!v10)
  {
    id v10 = [*(id *)(*(void *)(a1 + 40) + 584) firstObject];
    [v10 prepareForReuse];
  }
  uint64_t v13 = [*(id *)(a1 + 40) _shouldAnnotateAppEntitiesForDayAtIndex:v4];
  uint64_t v14 = [v24 view];

  if (v14)
  {
    id v15 = [v24 view];
    [v15 prepareForReuse];

    id v16 = *(void **)(*(void *)(a1 + 40) + 584);
    NSUInteger v17 = [v24 view];
    [v16 removeObject:v17];

    uint64_t v18 = *(void **)(a1 + 40);
    int64_t v19 = [v24 view];
    [v18 applyContentItem:v24 toView:v19 shouldAnnotate:v13];

    uint64_t v20 = [v24 view];

    id v10 = (id)v20;
  }
  else
  {
    if (v10)
    {
      [*(id *)(*(void *)(a1 + 40) + 584) removeObject:v10];
    }
    else
    {
      +[EKDayOccurrenceView occurrenceViewWithFrame:](EKDayOccurrenceView, "occurrenceViewWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v21 = [*(id *)(*(void *)(a1 + 40) + 408) occurrenceContainerView];
      [v21 addSubview:v10];
    }
    [*(id *)(a1 + 40) applyContentItem:v24 toView:v10 shouldAnnotate:v13];
  }
  int64_t v22 = *(void **)(*(void *)(a1 + 40) + 408);
  if (*(unsigned char *)(a1 + 48))
  {
    BOOL v23 = [v22 occurrenceContainerView];
    [v23 sendSubviewToBack:v10];
  }
  else
  {
    BOOL v23 = [v22 occurrenceContainerView];
    [v23 bringSubviewToFront:v10];
  }

  objc_sync_exit(v12);
}

- (BOOL)_shouldAnnotateAppEntitiesForDayAtIndex:(unint64_t)a3
{
  shouldAnnotateAppEntitiesByDadouble y = self->_shouldAnnotateAppEntitiesByDay;
  if (!shouldAnnotateAppEntitiesByDay)
  {
    [(EKDayViewContent *)self _updateShouldAnnotateAppEntitiesByDay];
    shouldAnnotateAppEntitiesByDadouble y = self->_shouldAnnotateAppEntitiesByDay;
  }
  if ([(NSMutableArray *)shouldAnnotateAppEntitiesByDay count] <= a3) {
    return 0;
  }
  id v6 = [(NSMutableArray *)self->_shouldAnnotateAppEntitiesByDay objectAtIndexedSubscript:a3];
  char v7 = [v6 BOOLValue];

  return v7;
}

- (unint64_t)_dayIndexForAllIndex:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = self->_itemsByDay;
  objc_sync_enter(v5);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = self->_itemsByDay;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    unint64_t v8 = 0;
    unint64_t v9 = 0;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      uint64_t v11 = 0;
      unint64_t v12 = v9 + v7;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v6);
        }
        v8 += objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11), "count", (void)v14);
        if (v8 > a3)
        {
          unint64_t v12 = v9 + v11;
          goto LABEL_12;
        }
        ++v11;
      }
      while (v7 != v11);
      uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      unint64_t v9 = v12;
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    unint64_t v12 = 0;
  }
LABEL_12:

  objc_sync_exit(v5);
  return v12;
}

uint64_t __42__EKDayViewContent__adjustViewsForPinning__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v32 = a2;
  [v32 unPinnedViewFrame];
  if (!CGRectIsNull(v34))
  {
    double v5 = *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    if (v5 >= *(double *)(a1 + 96)) {
      double v5 = *(double *)(a1 + 96);
    }
    double v6 = *(double *)(a1 + 88) - v5;
    [v32 unPinnedViewFrame];
    double MinY = CGRectGetMinY(v35);
    CalRoundToScreenScale(3.5);
    double v9 = v6 - v8;
    double v10 = *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    if (v10 >= *(double *)(a1 + 96)) {
      double v10 = *(double *)(a1 + 96);
    }
    double v11 = *(double *)(a1 + 88) - v10;
    CalRoundToScreenScale(3.5);
    double v13 = v11 - v12;
    [v32 unPinnedViewFrame];
    [v32 setBottomPinningProximity:(CGRectGetMinY(v36) - v13 + 20.0) / 20.0];
    if (!(*(unsigned int (**)(void))(*(void *)(a1 + 56) + 16))())
    {
      id v30 = v32;
      if (MinY <= v9) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
    CalRoundToScreenScale(3.5);
    double v15 = v14;
    unint64_t v16 = a3 + 1;
    if (v16 < [*(id *)(a1 + 40) count])
    {
      long long v17 = [*(id *)(a1 + 40) objectAtIndex:v16];
      id v18 = v32;
      [v17 unPinnedViewFrame];
      double v19 = CGRectGetMinY(v37);
      [v18 unPinnedViewFrame];
      CGFloat v21 = v20;
      CGFloat v23 = v22;
      CGFloat v25 = v24;
      CGFloat v27 = v26;

      v38.origin.double x = v21;
      v38.origin.double y = v23;
      v38.size.double width = v25;
      v38.size.CGFloat height = v27;
      double v15 = v19 - CGRectGetMinY(v38);
      CalRoundToScreenScale(3.5);
      if (v28 < v15) {
        double v15 = v28;
      }
    }
    *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v15
                                                                + *(double *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                            + 24);
    if (MinY > v9)
    {
      *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v15
                                                                  + *(double *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                              + 24);
      uint64_t v29 = objc_msgSend(*(id *)(a1 + 32), "count", v32);
      id v30 = v32;
      *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v29;
LABEL_14:
      [*(id *)(a1 + 48) removeObject:v30];
    }
  }
LABEL_15:

  return MEMORY[0x1F4181820]();
}

uint64_t __42__EKDayViewContent__adjustViewsForPinning__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v22 = a2;
  [v22 unPinnedViewFrame];
  if (!CGRectIsNull(v24))
  {
    double v5 = *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    if (v5 >= *(double *)(a1 + 96)) {
      double v5 = *(double *)(a1 + 96);
    }
    double v6 = *(double *)(a1 + 88) + v5;
    [v22 unPinnedViewFrame];
    double MaxY = CGRectGetMaxY(v25);
    CalRoundToScreenScale(3.5);
    double v9 = v6 + v8;
    double v10 = *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    if (v10 >= *(double *)(a1 + 96)) {
      double v10 = *(double *)(a1 + 96);
    }
    double v11 = *(double *)(a1 + 88) + v10;
    [v22 unPinnedViewFrame];
    double v12 = CGRectGetMaxY(v26);
    CalRoundToScreenScale(3.5);
    [v22 setTopPinningProximity:(v11 + v13 - v12 + 20.0) / 20.0];
    if ((*(unsigned int (**)(void))(*(void *)(a1 + 56) + 16))())
    {
      CalRoundToScreenScale(3.5);
      if (a3)
      {
        double v15 = [*(id *)(a1 + 40) objectAtIndex:a3 - 1];
        [v22 unPinnedViewFrame];
        double v16 = CGRectGetMaxY(v27);
        [v15 unPinnedViewFrame];
        double v17 = v16 - CGRectGetMaxY(v28);
        CalRoundToScreenScale(3.5);
        if (v18 < v17) {
          double v17 = v18;
        }
      }
      else
      {
        double v17 = v14;
      }
      *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v17
                                                                  + *(double *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                              + 24);
      if (MaxY < v9)
      {
        *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v17
                                                                    + *(double *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                                + 24);
        uint64_t v20 = objc_msgSend(*(id *)(a1 + 32), "count", v22);
        id v19 = v22;
        *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v20;
        goto LABEL_16;
      }
    }
    else
    {
      id v19 = v22;
      if (MaxY < v9) {
LABEL_16:
      }
        [*(id *)(a1 + 48) removeObject:v19];
    }
  }

  return MEMORY[0x1F4181820]();
}

void __83__EKDayViewContent_applyLoadedOccurrencesWithBatching_animated_reverse_completion___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(*(void *)(a1 + 32) + 584);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        double v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        objc_msgSend(v8, "setHidden:", 1, (void)v9);
        [v8 setOccurrence:0];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  objc_sync_exit(v3);
}

- (void)clearTemporaryViews
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_saveTemporaryViewsEntryCount - 1;
  v2->_saveTemporaryViewsEntryCount = v3;
  if (!v3)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    obuint64_t j = v2->_temporaryViewCacheByDay;
    uint64_t v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v4)
    {
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v6 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          long long v14 = 0u;
          long long v15 = 0u;
          long long v16 = 0u;
          long long v17 = 0u;
          uint64_t v7 = [v6 allValues];
          uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v22 count:16];
          if (v8)
          {
            uint64_t v9 = *(void *)v15;
            do
            {
              for (uint64_t j = 0; j != v8; ++j)
              {
                if (*(void *)v15 != v9) {
                  objc_enumerationMutation(v7);
                }
                long long v11 = *(void **)(*((void *)&v14 + 1) + 8 * j);
                [v11 setHidden:1];
                [v11 setOccurrence:0];
                [(NSMutableArray *)v2->_reusableViews addObject:v11];
              }
              uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v22 count:16];
            }
            while (v8);
          }

          [v6 removeAllObjects];
        }
        uint64_t v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v4);
    }
  }
  objc_sync_exit(v2);
}

- (BOOL)itemIsEligibleForGrouping:(id)a3
{
  uint64_t v3 = [a3 event];
  char v4 = [v3 isReminderIntegrationEvent];

  return v4;
}

- (void)_layoutDay:(unint64_t)a3 isLoadingAsync:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  [(EKDayViewContent *)self _dayWidth];
  double v7 = v6;
  BOOL v57 = self;
  if (v4)
  {
    uint64_t v8 = [(EKDayViewContent *)self singleItemsForPreloadByDay];
    uint64_t v9 = [v8 objectAtIndex:a3];

    if (![v9 count]) {
      goto LABEL_35;
    }
    [v9 enumerateObjectsUsingBlock:&__block_literal_global_1];
  }
  else
  {
    long long v10 = [(EKDayViewContent *)self singleItemsByDay];
    uint64_t v9 = [v10 objectAtIndex:a3];

    if (![v9 count]) {
      goto LABEL_35;
    }
  }
  v54 = v9;
  long long v11 = [(NSMutableArray *)v57->_dayStarts objectAtIndexedSubscript:a3];
  id v53 = [v11 objectForKey:@"startDate"];

  long long v12 = [(NSMutableArray *)v57->_dayStarts objectAtIndexedSubscript:a3];
  id v52 = [v12 objectForKey:@"endDate"];

  int64_t v55 = [(NSMutableArray *)v57->_geometryDelegates objectAtIndexedSubscript:a3];
  [v55 frame];
  double v14 = v13;
  double v16 = v15;
  double v17 = 0.5;
  if (v57->_daysToDisplay <= 1) {
    +[EKDayOccurrenceView barToBarGapWidth];
  }
  objc_msgSend(v55, "setFrame:", v7 * (double)a3 + v17, v14, v7 - v17, v16);
  id v18 = objc_alloc(MEMORY[0x1E4F57C20]);
  long long v19 = [v53 date];
  long long v20 = [v52 date];
  long long v21 = CUIKCalendar();
  id v22 = (void *)[v18 initWithOccurrences:v9 startOfDay:v19 endOfDay:v20 geometryDelegate:v55 screenUtilsDelegate:v57 calendar:v21];

  id v50 = v22;
  CGFloat v23 = [v22 groupOccurrences:v57];
  long long v51 = [v23 sortedArrayUsingComparator:&__block_literal_global_263];
  if (v4)
  {
    uint64_t v24 = v57->_displayItemsForPreloadByDay;
    objc_sync_enter(v24);
    [(NSMutableArray *)v57->_displayItemsForPreloadByDay setObject:v23 atIndexedSubscript:a3];
    objc_sync_exit(v24);

    CGRect v25 = v57->_displayItemsForPreloadByDayByEndDate;
    objc_sync_enter(v25);
    [(NSMutableArray *)v57->_displayItemsForPreloadByDayByEndDate setObject:v51 atIndexedSubscript:a3];
    objc_sync_exit(v25);

    [v22 applyLayoutToOccurrences];
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v26 = v9;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v66 objects:v72 count:16];
    if (v27)
    {
      uint64_t v28 = *(void *)v67;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v67 != v28) {
            objc_enumerationMutation(v26);
          }
          [*(id *)(*((void *)&v66 + 1) + 8 * i) setIsLoadingAsync:0];
        }
        uint64_t v27 = [v26 countByEnumeratingWithState:&v66 objects:v72 count:16];
      }
      while (v27);
    }

    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v30 = v23;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v62 objects:v71 count:16];
    if (v31)
    {
      uint64_t v32 = *(void *)v63;
      do
      {
        for (uint64_t j = 0; j != v31; ++j)
        {
          if (*(void *)v63 != v32) {
            objc_enumerationMutation(v30);
          }
          [*(id *)(*((void *)&v62 + 1) + 8 * j) setIsLoadingAsync:0];
        }
        uint64_t v31 = [v30 countByEnumeratingWithState:&v62 objects:v71 count:16];
      }
      while (v31);
    }

    CGRect v34 = v57;
  }
  else
  {
    CGRect v34 = v57;
    CGRect v35 = v57->_itemsByDay;
    objc_sync_enter(v35);
    [(NSMutableArray *)v57->_itemsByDay setObject:v23 atIndexedSubscript:a3];
    objc_sync_exit(v35);

    CGRect v36 = v57->_itemsByDayByEndDate;
    objc_sync_enter(v36);
    [(NSMutableArray *)v57->_itemsByDayByEndDate setObject:v51 atIndexedSubscript:a3];
    objc_sync_exit(v36);

    [v22 applyLayoutToOccurrences];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&v34->_delegate);
  if (objc_opt_respondsToSelector())
  {
    id v38 = objc_loadWeakRetained((id *)&v34->_delegate);
    uint64_t v39 = [v38 dayViewContentShouldDrawSynchronously:v57];
  }
  else
  {
    uint64_t v39 = 0;
  }

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v40 = v23;
  uint64_t v41 = [v40 countByEnumeratingWithState:&v58 objects:v70 count:16];
  if (v41)
  {
    uint64_t v42 = *(void *)v59;
    do
    {
      for (uint64_t k = 0; k != v41; ++k)
      {
        if (*(void *)v59 != v42) {
          objc_enumerationMutation(v40);
        }
        long long v44 = *(void **)(*((void *)&v58 + 1) + 8 * k);
        long long v45 = [v44 currentState];
        id v46 = +[EKDayViewContentItemStateWrapper wrapperWithContentItem:v44 viewContent:v57];
        [v45 performChangesWithState:v46];

        [v44 _requestPayloadAnimated:v57->_shouldAnimateLayout drawSynchronously:v39];
      }
      uint64_t v41 = [v40 countByEnumeratingWithState:&v58 objects:v70 count:16];
    }
    while (v41);
  }

  BOOL v47 = NSNumber;
  [(EKDayViewContent *)v57 frame];
  long long v49 = [v47 numberWithDouble:v48];
  [(NSMutableArray *)v57->_lastLayoutWidthForDay setObject:v49 atIndexedSubscript:a3];

  uint64_t v9 = v54;
LABEL_35:
}

- (void)applyContentItem:(id)a3 toView:(id)a4 shouldAnnotate:(BOOL)a5
{
  BOOL v5 = a5;
  id v12 = a4;
  id v8 = a3;
  uint64_t v9 = [v8 event];
  objc_msgSend(v12, "setIsProposedTime:", objc_msgSend(v8, "isProposedTime"));
  long long v10 = [v8 events];
  [v12 setOccurrences:v10];

  [v8 setView:v12];
  [v12 setDelegate:self];
  [v12 setUsesSmallText:self->_usesSmallText];
  [v12 setUserInteractionEnabled:self->_allowsOccurrenceSelection];
  [v12 setTag:2423];
  [v12 setDelegate:self];
  objc_msgSend(v12, "setDimmed:", objc_msgSend(v8, "isProposedTime"));
  objc_msgSend(v12, "setHasPrecedingDuration:", objc_msgSend(v8, "hasPrecedingDuration"));
  objc_msgSend(v12, "setHasTrailingDuration:", objc_msgSend(v8, "hasTrailingDuration"));
  [v12 setMultiAllDayRoundCorners:1];
  objc_msgSend(v12, "setOccurrenceIsFirstVisibleDayOfEvent:", objc_msgSend(v8, "occurrenceIsFirstVisibleDayOfEvent"));
  uint64_t v11 = [v8 occurrenceDateIndex];

  [v12 setOccurrenceDateIndex:v11];
  [v12 setIsSelectedCopyView:0];
  [v12 setShouldAnnotateAppEntities:v5];
  [(EKDayViewContent *)self _configureOccurrenceViewMarginAndPadding:v12];
  if (self->_hasCustomOccurrencePadding)
  {
    [(EKDayViewContent *)self occurrencePadding];
    objc_msgSend(v12, "setPadding:");
  }
  if ([v9 isEqual:self->_dimmedOccurrence]) {
    [v12 setDimmed:1];
  }
}

- (EKEvent)dimmedOccurrence
{
  return self->_dimmedOccurrence;
}

- (void)_configureOccurrenceViewMarginAndPadding:(id)a3
{
  id v4 = a3;
  [(id)objc_opt_class() defaultPadding];
  if (self->_usesSmallText) {
    CalRoundToScreenScale(0.5);
  }
  objc_msgSend(v4, "setPadding:");
}

- (id)singleItemsForPreloadByDay
{
  uint64_t v3 = self->_singleItemsForPreloadByDay;
  objc_sync_enter(v3);
  id v4 = (void *)[(NSMutableArray *)self->_singleItemsForPreloadByDay copy];
  objc_sync_exit(v3);

  return v4;
}

- (void)_updateShouldAnnotateAppEntitiesByDay
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(EKDayViewContent *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    uint64_t v5 = 520;
    shouldAnnotateAppEntitiesByDadouble y = self->_shouldAnnotateAppEntitiesByDay;
    if (shouldAnnotateAppEntitiesByDay)
    {
      [(NSMutableArray *)shouldAnnotateAppEntitiesByDay removeAllObjects];
      uint64_t v7 = 432;
    }
    else
    {
      uint64_t v7 = 432;
      id v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:self->_daysToDisplay];
      uint64_t v9 = self->_shouldAnnotateAppEntitiesByDay;
      self->_shouldAnnotateAppEntitiesByDadouble y = v8;
    }
    if (self->_daysToDisplay)
    {
      long long v10 = 0;
      uint64_t v23 = 432;
      uint64_t v24 = 520;
      do
      {
        if ((unint64_t)v10 >= [(NSMutableArray *)self->_dayStarts count]) {
          break;
        }
        uint64_t v11 = [(NSMutableArray *)self->_dayStarts objectAtIndexedSubscript:v10];
        id v12 = [v11 objectForKey:@"startDate"];

        double v13 = [(EKDayViewContent *)self delegate];
        uint64_t v14 = [v13 dayViewContentShouldAnnotateAppEntities:self onDayStarting:v12];

        double v15 = *(Class *)((char *)&self->super.super.super.isa + v5);
        double v16 = [NSNumber numberWithBool:v14];
        [v15 addObject:v16];

        if ((unint64_t)v10 < [(NSMutableArray *)self->_itemsByDay count])
        {
          double v17 = [(NSMutableArray *)self->_itemsByDay objectAtIndexedSubscript:v10];
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v26;
            do
            {
              uint64_t v21 = 0;
              do
              {
                if (*(void *)v26 != v20) {
                  objc_enumerationMutation(v17);
                }
                id v22 = [*(id *)(*((void *)&v25 + 1) + 8 * v21) view];
                [v22 setShouldAnnotateAppEntities:v14];

                ++v21;
              }
              while (v19 != v21);
              uint64_t v19 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
            }
            while (v19);
          }

          uint64_t v7 = v23;
          uint64_t v5 = v24;
        }

        long long v10 = (objc_class *)((char *)v10 + 1);
      }
      while (v10 != *(objc_class **)((char *)&self->super.super.super.isa + v7));
    }
  }
}

- (EKDayViewContentDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EKDayViewContentDelegate *)WeakRetained;
}

- (void)rectBecameVisible:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  self->_latestVisibleRect = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = [(EKDayViewContent *)self allVisibleItems];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v9) {
    goto LABEL_13;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v20;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v20 != v11) {
        objc_enumerationMutation(v8);
      }
      double v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
      uint64_t v14 = [v13 view];
      if (![v14 isHidden]) {
        goto LABEL_10;
      }
      double v15 = [v13 view];
      [v15 frame];
      IsEmptCGFloat y = CGRectIsEmpty(v25);

      if (!IsEmpty)
      {
        double v17 = [v13 view];
        [v17 frame];
        v27.origin.CGFloat x = x;
        v27.origin.CGFloat y = y;
        v27.size.CGFloat width = width;
        v27.size.CGFloat height = height;
        BOOL v18 = CGRectIntersectsRect(v26, v27);

        if (v18)
        {
          uint64_t v14 = [v13 view];
          [v14 setHidden:0];
LABEL_10:

          continue;
        }
      }
    }
    uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  }
  while (v10);
LABEL_13:

  if ([(EKDayViewContent *)self offscreenOccurrencePinningEnabled]) {
    [(EKDayViewContent *)self _adjustViewsForPinning];
  }
}

- (id)allVisibleItems
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  char v4 = [(EKDayViewContent *)self visibleItemsByDay];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 addObjectsFromArray:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)_adjustViewsForPinning
{
  uint64_t v136 = *MEMORY[0x1E4F143B8];
  p_latestVisibleRect = &self->_latestVisibleRect;
  if (!CGRectIsNull(self->_latestVisibleRect))
  {
    v77 = self;
    uint64_t v3 = [(EKDayViewContent *)self visibleItemsByDay];

    if (v3)
    {
      if ([(EKDayViewContent *)self _doOffscreenOccurrences])
      {
        id v71 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v70 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        v75 = [(EKDayViewContent *)self visibleItemsByDay];
        if (self->_daysToDisplay)
        {
          unint64_t v5 = 0;
          do
          {
            if (v5 >= [v75 count]) {
              break;
            }
            v76 = [v75 objectAtIndex:v5];
            if ([v76 count])
            {
              [(EKDayViewContent *)v77 _dayWidth];
              double v7 = v6;
              uint64_t v8 = v5;
              if ((CalTimeDirectionIsLeftToRight() & 1) == 0) {
                uint64_t v8 = v77->_daysToDisplay + ~v5;
              }
              [(EKDayViewContent *)v77 frame];
              v137.origin.CGFloat x = v7 * (double)v8;
              v137.origin.CGFloat y = 0.0;
              v137.size.CGFloat width = v7;
              if (CGRectIntersectsRect(v137, *p_latestVisibleRect))
              {
                id v9 = v76;
                long long v10 = v77->_itemsByDayByEndDate;
                objc_sync_enter(v10);
                long long v11 = [(NSMutableArray *)v77->_itemsByDayByEndDate objectAtIndex:v5];
                objc_sync_exit(v10);

                long long v132 = 0u;
                long long v133 = 0u;
                long long v130 = 0u;
                long long v131 = 0u;
                id v12 = v9;
                uint64_t v13 = [v12 countByEnumeratingWithState:&v130 objects:v135 count:16];
                if (v13)
                {
                  uint64_t v14 = *(void *)v131;
                  do
                  {
                    for (uint64_t i = 0; i != v13; ++i)
                    {
                      if (*(void *)v131 != v14) {
                        objc_enumerationMutation(v12);
                      }
                      double v16 = *(void **)(*((void *)&v130 + 1) + 8 * i);
                      if ([v16 isPinned]) {
                        [v4 addObject:v16];
                      }
                    }
                    uint64_t v13 = [v12 countByEnumeratingWithState:&v130 objects:v135 count:16];
                  }
                  while (v13);
                }

                CalRoundToScreenScale(3.5);
                double v18 = v17;
                CalRoundToScreenScale(3.5);
                double v20 = v19;
                double MinY = CGRectGetMinY(*p_latestVisibleRect);
                double MaxY = CGRectGetMaxY(*p_latestVisibleRect);
                CalRoundToScreenScale(0.5);
                double v24 = v23;
                uint64_t v126 = 0;
                v127 = &v126;
                uint64_t v128 = 0x2020000000;
                uint64_t v129 = 0;
                uint64_t v122 = 0;
                v123 = &v122;
                uint64_t v124 = 0x2020000000;
                uint64_t v125 = 0;
                uint64_t v118 = 0;
                v119 = (double *)&v118;
                uint64_t v120 = 0x2020000000;
                uint64_t v121 = 0;
                uint64_t v114 = 0;
                v115 = (double *)&v114;
                uint64_t v116 = 0x2020000000;
                uint64_t v117 = 0;
                v113[0] = 0;
                v113[1] = v113;
                v113[2] = 0x2020000000;
                v113[3] = 0;
                v112[0] = 0;
                v112[1] = v112;
                v112[2] = 0x2020000000;
                v112[3] = 0;
                v102[0] = MEMORY[0x1E4F143A8];
                v102[1] = 3221225472;
                v102[2] = __42__EKDayViewContent__adjustViewsForPinning__block_invoke_2;
                v102[3] = &unk_1E6087770;
                double v110 = MinY;
                double v111 = v18;
                v108 = v113;
                v107 = &v118;
                id v106 = &__block_literal_global_276;
                id v25 = v71;
                id v103 = v25;
                id v26 = v11;
                id v104 = v26;
                v109 = &v126;
                id v27 = v4;
                id v105 = v27;
                uint64_t v73 = v26;
                [v26 enumerateObjectsWithOptions:0 usingBlock:v102];
                uint64_t v28 = v127[3];
                uint64_t v29 = [v25 count];
                objc_msgSend(v25, "removeObjectsInRange:", v28, v29 - v127[3]);
                double v30 = v20 * 3.0;
                v92[0] = MEMORY[0x1E4F143A8];
                v92[1] = 3221225472;
                double v31 = MaxY - v24;
                v92[2] = __42__EKDayViewContent__adjustViewsForPinning__block_invoke_3;
                v92[3] = &unk_1E6087770;
                double v100 = v31;
                double v101 = v20 * 3.0;
                v98 = v112;
                v97 = &v114;
                id v96 = &__block_literal_global_276;
                id v32 = v70;
                id v93 = v32;
                id v33 = v12;
                id v94 = v33;
                v99 = &v122;
                id v34 = v27;
                id v95 = v34;
                v72 = v33;
                [v33 enumerateObjectsWithOptions:2 usingBlock:v92];
                uint64_t v35 = v123[3];
                uint64_t v36 = [v32 count];
                objc_msgSend(v32, "removeObjectsInRange:", v35, v36 - v123[3]);
                double v37 = v119[3];
                if (v37 >= v18) {
                  double v37 = v18;
                }
                v77->_visiblePinnedStackHeightAbove[v5] = v37;
                double v38 = v115[3];
                if (v38 >= v30) {
                  double v38 = v20 * 3.0;
                }
                v77->_visiblePinnedStackHeightBelow[v5] = v38;
                if ([v25 count])
                {
                  uint64_t v39 = [v25 lastObject];
                  id v40 = [v39 objectAtIndex:0];
                  [v40 unPinnedViewFrame];
                  double v41 = CGRectGetMaxY(v138);
                }
                else
                {
                  double v41 = 0.0;
                }
                if ([v32 count])
                {
                  uint64_t v42 = [v32 lastObject];
                  int v43 = [v42 objectAtIndex:0];
                  [v43 unPinnedViewFrame];
                  double v44 = CGRectGetMinY(v139);
                }
                else
                {
                  double v44 = 0.0;
                }
                double v45 = v119[3];
                if (MinY + v45 > v18 + MinY)
                {
                  double v46 = MinY + v45 - v41;
                  double v47 = v45 - v18;
                  if (v46 < v47) {
                    double v47 = v46;
                  }
                  double MinY = MinY - v47;
                }
                double v48 = v115[3];
                if (v31 - v48 < v31 - v30)
                {
                  double v49 = v44 + v48 - v31;
                  double v50 = v48 - v30;
                  if (v49 < v50) {
                    double v50 = v49;
                  }
                  double v31 = v31 + v50;
                }
                v90[0] = 0;
                v90[1] = v90;
                v90[2] = 0x2020000000;
                double v91 = 0.0;
                CalRoundToScreenScale(3.5);
                double v91 = MinY + v51;
                v88[0] = 0;
                v88[1] = v88;
                v88[2] = 0x2020000000;
                double v89 = 0.0;
                CalRoundToScreenScale(3.5);
                double v89 = v31 - v52;
                v85[0] = MEMORY[0x1E4F143A8];
                v85[1] = 3221225472;
                v85[2] = __42__EKDayViewContent__adjustViewsForPinning__block_invoke_4;
                v85[3] = &unk_1E6087798;
                v87 = v90;
                v85[4] = v77;
                id v53 = v25;
                id v86 = v53;
                [v53 enumerateObjectsUsingBlock:v85];
                v82[0] = MEMORY[0x1E4F143A8];
                v82[1] = 3221225472;
                v82[2] = __42__EKDayViewContent__adjustViewsForPinning__block_invoke_5;
                v82[3] = &unk_1E6087798;
                v84 = v88;
                v82[4] = v77;
                id v54 = v32;
                id v83 = v54;
                [v54 enumerateObjectsUsingBlock:v82];
                long long v80 = 0u;
                long long v81 = 0u;
                long long v78 = 0u;
                long long v79 = 0u;
                id v55 = v34;
                uint64_t v56 = [v55 countByEnumeratingWithState:&v78 objects:v134 count:16];
                if (v56)
                {
                  uint64_t v57 = *(void *)v79;
                  do
                  {
                    for (uint64_t j = 0; j != v56; ++j)
                    {
                      if (*(void *)v79 != v57) {
                        objc_enumerationMutation(v55);
                      }
                      long long v59 = *(void **)(*((void *)&v78 + 1) + 8 * j);
                      long long v60 = [v59 view];
                      [v60 frame];
                      double v62 = v61;
                      double v64 = v63;
                      double v66 = v65;

                      [v59 unPinnedViewFrame];
                      double v68 = v67;
                      long long v69 = [v59 view];
                      objc_msgSend(v69, "setFrame:", v62, v68, v64, v66);
                    }
                    uint64_t v56 = [v55 countByEnumeratingWithState:&v78 objects:v134 count:16];
                  }
                  while (v56);
                }

                [v53 removeAllObjects];
                [v54 removeAllObjects];
                [v55 removeAllObjects];

                _Block_object_dispose(v88, 8);
                _Block_object_dispose(v90, 8);

                _Block_object_dispose(v112, 8);
                _Block_object_dispose(v113, 8);
                _Block_object_dispose(&v114, 8);
                _Block_object_dispose(&v118, 8);
                _Block_object_dispose(&v122, 8);
                _Block_object_dispose(&v126, 8);
              }
            }

            ++v5;
          }
          while (v5 < v77->_daysToDisplay);
        }
      }
    }
  }
}

- (id)visibleItemsByDay
{
  uint64_t v3 = self->_itemsByDay;
  objc_sync_enter(v3);
  id v4 = (void *)[(NSMutableArray *)self->_itemsByDay copy];
  objc_sync_exit(v3);

  return v4;
}

- (BOOL)offscreenOccurrencePinningEnabled
{
  return self->_offscreenOccurrencePinningEnabled;
}

- (BOOL)_doOffscreenOccurrences
{
  return 1;
}

- (void)setOrientation:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  -[EKDayGridView setOrientation:](self->_grid, "setOrientation:");
  unint64_t v5 = a3 - 3;
  [(EKDayViewContent *)self setUsesSmallText:(unint64_t)(a3 - 3) < 2];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v6 = [(EKDayViewContent *)self occurrenceViews];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) setUsesSmallText:v5 < 2];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  [(EKDayViewContent *)self setNeedsLayout];
}

- (void)setUsesSmallText:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_usesSmallText != a3)
  {
    self->_usesSmallText = a3;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = [(EKDayViewContent *)self occurrenceViews];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setUsesSmallText:self->_usesSmallText];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (id)occurrenceViews
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(EKDayGridView *)self->_grid occurrenceContainerView];
  uint64_t v3 = [v2 subviews];

  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v4, "addObject:", v10, (void)v12);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (EKDayViewContent)initWithFrame:(CGRect)a3 sizeClass:(int64_t)a4 orientation:(int64_t)a5 backgroundColor:(id)a6 opaque:(BOOL)a7 isMiniPreviewInEventDetail:(BOOL)a8 numberOfDaysToDisplay:(unint64_t)a9
{
  BOOL v10 = a8;
  BOOL v11 = a7;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v18 = a6;
  +[EKDayTimeView defaultHeightForSizeClass:a4 orientation:a5];
  v58.receiver = self;
  v58.super_class = (Class)EKDayViewContent;
  double v20 = -[EKDayViewContent initWithFrame:](&v58, sel_initWithFrame_, x, y, width, v19);
  long long v21 = v20;
  if (v20)
  {
    [(EKDayViewContent *)v20 setOpaque:v11];
    [(EKDayViewContent *)v21 bounds];
    if (v22 < 0.0)
    {
      double v23 = kEKUILogHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
      {
        v57[0] = 0;
        _os_log_impl(&dword_1B3F4C000, v23, OS_LOG_TYPE_ERROR, "EKDayContentView initialized with negative width", (uint8_t *)v57, 2u);
      }
    }
    double v24 = [EKDayGridView alloc];
    [(EKDayViewContent *)v21 bounds];
    uint64_t v25 = -[EKDayGridView initWithFrame:sizeClass:backgroundColor:opaque:numberOfDaysToDisplay:](v24, "initWithFrame:sizeClass:backgroundColor:opaque:numberOfDaysToDisplay:", a4, v18, v11, a9);
    grid = v21->_grid;
    v21->_grid = (EKDayGridView *)v25;

    [(EKDayGridView *)v21->_grid setAutoresizingMask:18];
    [(EKDayViewContent *)v21 addSubview:v21->_grid];
    [(EKDayViewContent *)v21 setAllowsOccurrenceSelection:1];
    [(EKDayViewContent *)v21 setEventsFillGrid:0];
    uint64_t v27 = CUIKCalendar();
    calendar = v21->_calendar;
    v21->_calendar = (NSCalendar *)v27;

    uint64_t v29 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a9];
    dayStarts = v21->_dayStarts;
    v21->_dayStarts = (NSMutableArray *)v29;

    v21->_daysToDispladouble y = a9;
    uint64_t v31 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a9];
    lastLayoutWidthForDadouble y = v21->_lastLayoutWidthForDay;
    v21->_lastLayoutWidthForDadouble y = (NSMutableArray *)v31;

    if (v21->_daysToDisplay)
    {
      unint64_t v33 = 0;
      do
        [(NSMutableArray *)v21->_lastLayoutWidthForDay setObject:&unk_1F0D03520 atIndexedSubscript:v33++];
      while (v21->_daysToDisplay > v33);
    }
    v21->_visiblePinnedStackHeightAbove = (double *)malloc_type_calloc(a9, 8uLL, 0x100004000313F17uLL);
    v21->_visiblePinnedStackHeightBelow = (double *)malloc_type_calloc(a9, 8uLL, 0x100004000313F17uLL);
    [(EKDayViewContent *)v21 setIsMiniPreviewInEventDetail:v10];
    CGSize v34 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v21->_latestVisibleRect.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v21->_latestVisibleRect.size = v34;
    uint64_t v35 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v21 action:sel__tapRecognized_];
    [v35 setDelegate:v21];
    [(EKDayViewContent *)v21 addGestureRecognizer:v35];
    v21->_offscreenOccurrencePinningEnabled = 1;
    uint64_t v36 = objc_opt_new();
    singleItemsForPreloadByDadouble y = v21->_singleItemsForPreloadByDay;
    v21->_singleItemsForPreloadByDadouble y = (NSMutableArray *)v36;

    uint64_t v38 = objc_opt_new();
    displayItemsForPreloadByDadouble y = v21->_displayItemsForPreloadByDay;
    v21->_displayItemsForPreloadByDadouble y = (NSMutableArray *)v38;

    uint64_t v40 = objc_opt_new();
    displayItemsForPreloadByDayByEndDate = v21->_displayItemsForPreloadByDayByEndDate;
    v21->_displayItemsForPreloadByDayByEndDate = (NSMutableArray *)v40;

    uint64_t v42 = objc_opt_new();
    singleItemsByDadouble y = v21->_singleItemsByDay;
    v21->_singleItemsByDadouble y = (NSMutableArray *)v42;

    uint64_t v44 = objc_opt_new();
    itemsByDadouble y = v21->_itemsByDay;
    v21->_itemsByDadouble y = (NSMutableArray *)v44;

    uint64_t v46 = objc_opt_new();
    itemsByDayByEndDate = v21->_itemsByDayByEndDate;
    v21->_itemsByDayByEndDate = (NSMutableArray *)v46;

    uint64_t v48 = objc_opt_new();
    reusableViews = v21->_reusableViews;
    v21->_reusableViews = (NSMutableArray *)v48;

    v21->_sizeClass = a4;
    uint64_t v50 = objc_opt_new();
    temporaryViewCacheByDadouble y = v21->_temporaryViewCacheByDay;
    v21->_temporaryViewCacheByDadouble y = (NSMutableArray *)v50;

    uint64_t v52 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v21->_daysToDisplay];
    geometryDelegates = v21->_geometryDelegates;
    v21->_geometryDelegates = (NSMutableArray *)v52;

    if (v21->_daysToDisplay)
    {
      unint64_t v54 = 0;
      do
      {
        id v55 = objc_alloc_init(EKDayViewContentGeometryDelegate);
        [(EKDayViewContentGeometryDelegate *)v55 setDayViewContent:v21];
        [(NSMutableArray *)v21->_geometryDelegates setObject:v55 atIndexedSubscript:v54];

        ++v54;
      }
      while (v21->_daysToDisplay > v54);
    }
  }
  return v21;
}

- (void)setStartDateWithDateComponents:(id)a3
{
  id v13 = a3;
  if (([v13 isEqual:self->_startDate] & 1) == 0)
  {
    id v4 = self;
    objc_sync_enter(v4);
    id v5 = (void *)MEMORY[0x1E4F57838];
    uint64_t v6 = [(NSCalendar *)v4->_calendar timeZone];
    uint64_t v7 = [v5 calendarDateWithDateComponents:v13 timeZone:v6];
    uint64_t v8 = [v7 calendarDateForDay];
    startDate = self->_startDate;
    self->_startDate = v8;

    BOOL v10 = self->_startDate;
    if (v4->_daysToDisplay == 1)
    {
      BOOL v11 = v10;
    }
    else
    {
      BOOL v11 = [(EKCalendarDate *)v10 calendarDateByAddingDays:LODWORD(v4->_daysToDisplay) - 1];
    }
    endDate = v4->_endDate;
    v4->_endDate = v11;

    objc_sync_exit(v4);
    [(EKDayViewContent *)v4 _computeDayStartsAndEnds];
    [(EKDayViewContent *)v4 setNeedsLayout];
  }
}

- (void)setNeedsLayout
{
  v4.receiver = self;
  v4.super_class = (Class)EKDayViewContent;
  [(EKDayViewContent *)&v4 setNeedsLayout];
  if (self->_daysToDisplay)
  {
    unint64_t v3 = 0;
    do
      [(NSMutableArray *)self->_lastLayoutWidthForDay setObject:&unk_1F0D03520 atIndexedSubscript:v3++];
    while (self->_daysToDisplay > v3);
  }
}

- (void)_computeDayStartsAndEnds
{
  obuint64_t j = self;
  objc_sync_enter(obj);
  [(NSMutableArray *)obj->_dayStarts removeAllObjects];
  uint64_t v2 = obj->_startDate;
  if (CalTimeDirectionIsLeftToRight())
  {
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v4 = [(EKCalendarDate *)v2 calendarDateByAddingDays:obj->_daysToDisplay - 1];

    uint64_t v3 = -1;
    uint64_t v2 = (EKCalendarDate *)v4;
  }
  if (obj->_daysToDisplay)
  {
    unint64_t v5 = 0;
    do
    {
      uint64_t v6 = [(EKCalendarDate *)v2 calendarDateForEndOfDay];
      uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v2, @"startDate", v6, @"endDate", 0);
      [(NSMutableArray *)obj->_dayStarts addObject:v7];
      uint64_t v8 = [(EKCalendarDate *)v2 calendarDateByAddingDays:v3];

      ++v5;
      uint64_t v2 = v8;
    }
    while (obj->_daysToDisplay > v5);
  }
  else
  {
    uint64_t v8 = v2;
  }
  [(EKDayViewContent *)obj _updateShouldAnnotateAppEntitiesByDay];

  objc_sync_exit(obj);
}

- (void)setIsMiniPreviewInEventDetail:(BOOL)a3
{
  self->_isMiniPreviewInEventDetail = a3;
}

- (void)setEventsFillGrid:(BOOL)a3
{
  self->_eventsFillGrid = a3;
}

- (void)setAllowsOccurrenceSelection:(BOOL)a3
{
  if (self->_allowsOccurrenceSelection != a3)
  {
    BOOL v3 = a3;
    self->_allowsOccurrenceSelection = a3;
    id v8 = [(EKDayViewContent *)self subviews];
    uint64_t v4 = [v8 count];
    if (v4)
    {
      uint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [v8 objectAtIndex:i];
        if ([v7 tag] == 2423) {
          [v7 setUserInteractionEnabled:v3];
        }
      }
    }
  }
}

- (void)setDelegate:(id)a3
{
}

- (void)setDimmedOccurrence:(id)a3
{
  uint64_t v5 = (EKEvent *)a3;
  dimmedOccurrence = self->_dimmedOccurrence;
  uint64_t v7 = v5;
  if (dimmedOccurrence != v5)
  {
    if (dimmedOccurrence) {
      -[EKDayViewContent setViewsDimmed:forEvent:](self, "setViewsDimmed:forEvent:", 0);
    }
    objc_storeStrong((id *)&self->_dimmedOccurrence, a3);
    if (self->_dimmedOccurrence) {
      -[EKDayViewContent setViewsDimmed:forEvent:](self, "setViewsDimmed:forEvent:", 1);
    }
  }
}

- (void)applyLoadedOccurrencesWithBatching:(BOOL)a3 animated:(BOOL)a4 reverse:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v10 = a6;
  BOOL v11 = v10;
  if (self->_dataLoaded)
  {
    long long v12 = [(EKDayViewContent *)self allVisibleItems];
    id v13 = v12;
    if (v8)
    {
      uint64_t v14 = 1;
      if (!v6) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v14 = [v12 count];
      if (!v6)
      {
LABEL_4:
        uint64_t v15 = 0;
        if (!v8)
        {
LABEL_5:
          uint64_t v16 = 0;
LABEL_11:
          v17[0] = MEMORY[0x1E4F143A8];
          v17[1] = 3221225472;
          v17[2] = __83__EKDayViewContent_applyLoadedOccurrencesWithBatching_animated_reverse_completion___block_invoke;
          v17[3] = &unk_1E6087700;
          v17[4] = self;
          id v18 = v11;
          [(EKDayViewContent *)self applyLoadedOccurrenceBatchStartingAtIndex:v15 batchSize:v14 fromArray:v13 withStartDate:v16 animated:v7 reverse:v6 completion:v17];

          goto LABEL_12;
        }
LABEL_10:
        uint64_t v16 = [(EKDayViewContent *)self startDate];
        goto LABEL_11;
      }
    }
    uint64_t v15 = [v13 count] - 1;
    if (!v8) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }
  if (v10) {
    (*((void (**)(id))v10 + 2))(v10);
  }
LABEL_12:
}

- (void)saveTemporaryViews
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  ++v2->_saveTemporaryViewsEntryCount;
  objc_sync_exit(v2);

  obuint64_t j = v2->_itemsByDay;
  objc_sync_enter(obj);
  uint64_t v3 = [(NSMutableArray *)v2->_itemsByDay count];
  if (v3 >= 1)
  {
    unint64_t v4 = 0;
    uint64_t v17 = v2;
    do
    {
      [(NSMutableArray *)v2->_itemsByDay objectAtIndexedSubscript:v4];
      v6 = uint64_t v5 = v2;
      if (v4 >= [(NSMutableArray *)v5->_temporaryViewCacheByDay count])
      {
        BOOL v7 = objc_opt_new();
        [(NSMutableArray *)v17->_temporaryViewCacheByDay addObject:v7];
      }
      BOOL v8 = [(NSMutableArray *)v17->_temporaryViewCacheByDay objectAtIndexedSubscript:v4];
      uint64_t v9 = [v6 count];
      if (v9 >= 1)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          BOOL v11 = [v6 objectAtIndexedSubscript:i];
          long long v12 = [v11 view];
          id v13 = [v11 event];
          uint64_t v14 = [v13 calendarItemIdentifier];

          if (v12)
          {
            if (v14)
            {
              uint64_t v15 = [v8 objectForKeyedSubscript:v14];

              if (!v15)
              {
                [v8 setObject:v12 forKeyedSubscript:v14];
                [v11 setView:0];
              }
            }
          }
        }
      }

      ++v4;
      uint64_t v2 = v17;
    }
    while (v4 != v3);
  }
  objc_sync_exit(obj);
}

- (void)prepareForReuseIsReload:(BOOL)a3
{
  self->_dataLoaded = 0;
  uint64_t v5 = self->_singleItemsForPreloadByDay;
  objc_sync_enter(v5);
  [(NSMutableArray *)self->_singleItemsForPreloadByDay removeAllObjects];
  if (self->_daysToDisplay)
  {
    unint64_t v6 = 0;
    uint64_t v7 = MEMORY[0x1E4F1CBF0];
    do
    {
      [(NSMutableArray *)self->_singleItemsForPreloadByDay addObject:v7];
      ++v6;
    }
    while (v6 < self->_daysToDisplay);
  }
  objc_sync_exit(v5);

  BOOL v8 = self->_displayItemsForPreloadByDay;
  objc_sync_enter(v8);
  [(NSMutableArray *)self->_displayItemsForPreloadByDay removeAllObjects];
  if (self->_daysToDisplay)
  {
    unint64_t v9 = 0;
    uint64_t v10 = MEMORY[0x1E4F1CBF0];
    do
    {
      [(NSMutableArray *)self->_displayItemsForPreloadByDay addObject:v10];
      ++v9;
    }
    while (v9 < self->_daysToDisplay);
  }
  objc_sync_exit(v8);

  BOOL v11 = self->_displayItemsForPreloadByDayByEndDate;
  objc_sync_enter(v11);
  [(NSMutableArray *)self->_displayItemsForPreloadByDayByEndDate removeAllObjects];
  if (self->_daysToDisplay)
  {
    unint64_t v12 = 0;
    uint64_t v13 = MEMORY[0x1E4F1CBF0];
    do
    {
      [(NSMutableArray *)self->_displayItemsForPreloadByDayByEndDate addObject:v13];
      ++v12;
    }
    while (v12 < self->_daysToDisplay);
  }
  objc_sync_exit(v11);

  if (!a3)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __44__EKDayViewContent_prepareForReuseIsReload___block_invoke;
    aBlock[3] = &unk_1E6087570;
    void aBlock[4] = self;
    uint64_t v14 = (void (**)(void))_Block_copy(aBlock);
    if ([MEMORY[0x1E4F29060] isMainThread])
    {
      v14[2](v14);
    }
    else
    {
      uint64_t v15 = dispatch_group_create();
      dispatch_group_enter(v15);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __44__EKDayViewContent_prepareForReuseIsReload___block_invoke_2;
      block[3] = &unk_1E6087700;
      double v19 = v15;
      double v20 = v14;
      uint64_t v16 = v15;
      dispatch_async(MEMORY[0x1E4F14428], block);
      dispatch_time_t v17 = dispatch_time(0, 200000000);
      dispatch_group_wait(v16, v17);
    }
  }
}

- (void)movePreloadedItemsToVisible
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v32 = self->_itemsByDay;
  objc_sync_enter(v32);
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  obuint64_t j = self->_itemsByDay;
  uint64_t v3 = [(NSMutableArray *)obj countByEnumeratingWithState:&v58 objects:v66 count:16];
  if (v3)
  {
    uint64_t v40 = *(void *)v59;
    do
    {
      uint64_t v41 = v3;
      for (uint64_t i = 0; i != v41; ++i)
      {
        if (*(void *)v59 != v40) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        long long v54 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        id v6 = v5;
        uint64_t v7 = [v6 countByEnumeratingWithState:&v54 objects:v65 count:16];
        if (v7)
        {
          uint64_t v8 = *(void *)v55;
          do
          {
            for (uint64_t j = 0; j != v7; ++j)
            {
              if (*(void *)v55 != v8) {
                objc_enumerationMutation(v6);
              }
              uint64_t v10 = *(void **)(*((void *)&v54 + 1) + 8 * j);
              BOOL v11 = [v10 view];
              if (v11)
              {
                reusableViews = self->_reusableViews;
                uint64_t v13 = [v10 view];
                [(NSMutableArray *)reusableViews addObject:v13];
              }
            }
            uint64_t v7 = [v6 countByEnumeratingWithState:&v54 objects:v65 count:16];
          }
          while (v7);
        }
      }
      uint64_t v3 = [(NSMutableArray *)obj countByEnumeratingWithState:&v58 objects:v66 count:16];
    }
    while (v3);
  }

  [(NSMutableArray *)self->_itemsByDay removeAllObjects];
  objc_sync_exit(v32);

  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v33 = self->_singleItemsForPreloadByDay;
  objc_sync_enter(v33);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  uint64_t v15 = self->_singleItemsForPreloadByDay;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v50 objects:v64 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v51;
    do
    {
      for (uint64_t k = 0; k != v16; ++k)
      {
        if (*(void *)v51 != v17) {
          objc_enumerationMutation(v15);
        }
        double v19 = (void *)[*(id *)(*((void *)&v50 + 1) + 8 * k) copy];
        [v14 addObject:v19];
      }
      uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v50 objects:v64 count:16];
    }
    while (v16);
  }

  objc_sync_exit(v33);
  CGSize v34 = self->_singleItemsByDay;
  objc_sync_enter(v34);
  [(NSMutableArray *)self->_singleItemsByDay removeAllObjects];
  [(NSMutableArray *)self->_singleItemsByDay addObjectsFromArray:v14];
  objc_sync_exit(v34);

  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v35 = self->_displayItemsForPreloadByDay;
  objc_sync_enter(v35);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v21 = self->_displayItemsForPreloadByDay;
  uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v46 objects:v63 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v47;
    do
    {
      for (uint64_t m = 0; m != v22; ++m)
      {
        if (*(void *)v47 != v23) {
          objc_enumerationMutation(v21);
        }
        uint64_t v25 = (void *)[*(id *)(*((void *)&v46 + 1) + 8 * m) copy];
        [v20 addObject:v25];
      }
      uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v46 objects:v63 count:16];
    }
    while (v22);
  }

  objc_sync_exit(v35);
  uint64_t v36 = self->_itemsByDay;
  objc_sync_enter(v36);
  [(NSMutableArray *)self->_itemsByDay removeAllObjects];
  [(NSMutableArray *)self->_itemsByDay addObjectsFromArray:v20];
  objc_sync_exit(v36);

  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  double v37 = self->_displayItemsForPreloadByDayByEndDate;
  objc_sync_enter(v37);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v27 = self->_displayItemsForPreloadByDayByEndDate;
  uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v42 objects:v62 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v43;
    do
    {
      for (uint64_t n = 0; n != v28; ++n)
      {
        if (*(void *)v43 != v29) {
          objc_enumerationMutation(v27);
        }
        uint64_t v31 = (void *)[*(id *)(*((void *)&v42 + 1) + 8 * n) copy];
        [v26 addObject:v31];
      }
      uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v42 objects:v62 count:16];
    }
    while (v28);
  }

  objc_sync_exit(v37);
  uint64_t v38 = self->_itemsByDayByEndDate;
  objc_sync_enter(v38);
  [(NSMutableArray *)self->_itemsByDayByEndDate removeAllObjects];
  [(NSMutableArray *)self->_itemsByDayByEndDate addObjectsFromArray:v26];
  objc_sync_exit(v38);
}

- (void)loadAndLayoutOccurrences:(id)a3 reverse:(BOOL)a4
{
  [(EKDayViewContent *)self loadOccurrences:a3];
  daysToDispladouble y = self->_daysToDisplay;
  if (a4)
  {
    unint64_t v7 = daysToDisplay - 1;
    if ((uint64_t)(daysToDisplay - 1) >= 0)
    {
      do
        [(EKDayViewContent *)self _layoutDay:v7-- isLoadingAsync:1];
      while (v7 != -1);
    }
  }
  else if (daysToDisplay)
  {
    unint64_t v8 = 0;
    do
      [(EKDayViewContent *)self _layoutDay:v8++ isLoadingAsync:1];
    while (v8 < self->_daysToDisplay);
  }
}

- (void)layoutSubviews
{
  if ([(NSMutableArray *)self->_geometryDelegates count])
  {
    unint64_t v3 = 0;
    do
    {
      [(EKDayViewContent *)self bounds];
      double v5 = v4;
      double v7 = v6;
      double v9 = v8;
      double v11 = v10;
      unint64_t v12 = [(NSMutableArray *)self->_geometryDelegates objectAtIndexedSubscript:v3];
      objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

      ++v3;
    }
    while ([(NSMutableArray *)self->_geometryDelegates count] > v3);
  }
  [(EKDayViewContent *)self _layoutDaysIfVisible];
  -[EKDayViewContent rectBecameVisible:](self, "rectBecameVisible:", self->_latestVisibleRect.origin.x, self->_latestVisibleRect.origin.y, self->_latestVisibleRect.size.width, self->_latestVisibleRect.size.height);
  if (self->_darkensWeekends)
  {
    [(EKDayViewContent *)self _dayWidth];
    double v14 = v13;
    uint64_t v15 = self->_startDate;
    uint64_t v16 = v15;
    if (self->_daysToDisplay)
    {
      unint64_t v17 = 0;
      while (1)
      {
        uint64_t v18 = [v16 dayOfWeek];
        if (v18 == 1) {
          break;
        }
        if (v18 == 7)
        {
          double v19 = &OBJC_IVAR___EKDayViewContent__saturdayDarkeningView;
LABEL_11:
          [(EKDayGridView *)self->_grid bounds];
          objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v19), "setFrame:", v14 * (double)(int)v17, 0.0, v14);
        }
        uint64_t v20 = [v16 calendarDateByAddingDays:1];

        uint64_t v15 = (EKCalendarDate *)v20;
        ++v17;
        uint64_t v16 = (void *)v20;
        if (self->_daysToDisplay <= v17) {
          goto LABEL_15;
        }
      }
      double v19 = &OBJC_IVAR___EKDayViewContent__sundayDarkeningView;
      goto LABEL_11;
    }
LABEL_15:
  }
}

- (void)_layoutDaysIfVisible
{
  if (!self->_dataLoaded) {
    return;
  }
  daysToDispladouble y = self->_daysToDisplay;
  double v4 = [(EKDayViewContent *)self singleItemsByDay];
  unint64_t v5 = [v4 count];

  if (daysToDisplay >= v5) {
    daysToDispladouble y = v5;
  }
  if (!self->_waitingForSynchronousLayoutToReapplyViews)
  {
    if (!daysToDisplay) {
      return;
    }
    uint64_t v8 = 0;
    while (![(EKDayViewContent *)self _layoutNeededForDay:v8 isLoadingAsync:0])
    {
      if (daysToDisplay == ++v8) {
        return;
      }
    }
    [(EKDayViewContent *)self saveTemporaryViews];
  }
  if (self->_shouldLayoutInReverse)
  {
    unint64_t v6 = daysToDisplay - 1;
    if ((uint64_t)(daysToDisplay - 1) >= 0)
    {
      int v7 = 0;
      do
        v7 |= [(EKDayViewContent *)self _layoutDayIfNeeded:v6-- isLoadingAsync:0];
      while (v6 != -1);
      goto LABEL_20;
    }
LABEL_19:
    LOBYTE(v7) = 0;
    goto LABEL_20;
  }
  if (!daysToDisplay) {
    goto LABEL_19;
  }
  uint64_t v9 = 0;
  int v7 = 0;
  do
    v7 |= [(EKDayViewContent *)self _layoutDayIfNeeded:v9++ isLoadingAsync:0];
  while (daysToDisplay != v9);
LABEL_20:
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __40__EKDayViewContent__layoutDaysIfVisible__block_invoke;
  v13[3] = &unk_1E6087570;
  v13[4] = self;
  [(EKDayViewContent *)self applyLoadedOccurrencesWithBatching:0 animated:0 reverse:0 completion:v13];
  self->_shouldAnimateLayout = 0;
  if (v7)
  {
    double v10 = [(EKDayViewContent *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      unint64_t v12 = [(EKDayViewContent *)self delegate];
      [v12 dayViewContentDidLayout:self];
    }
  }
}

- (EKDayViewContent)initWithFrame:(CGRect)a3 sizeClass:(int64_t)a4 orientation:(int64_t)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  unint64_t v12 = [MEMORY[0x1E4FB1618] whiteColor];
  double v13 = -[EKDayViewContent initWithFrame:sizeClass:orientation:backgroundColor:opaque:isMiniPreviewInEventDetail:numberOfDaysToDisplay:](self, "initWithFrame:sizeClass:orientation:backgroundColor:opaque:isMiniPreviewInEventDetail:numberOfDaysToDisplay:", a4, a5, v12, 1, 0, 1, x, y, width, height);

  return v13;
}

- (void)dealloc
{
  unint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  free(self->_visiblePinnedStackHeightAbove);
  free(self->_visiblePinnedStackHeightBelow);
  v4.receiver = self;
  v4.super_class = (Class)EKDayViewContent;
  [(EKDayViewContent *)&v4 dealloc];
}

- (void)setUseMultiDayStyle:(BOOL)a3
{
  self->_useMultiDayStyle = a3;
  -[EKDayGridView setUseMultiDayStyle:](self->_grid, "setUseMultiDayStyle:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[EKDayGridView sizeThatFits:](self->_grid, "sizeThatFits:", a3.width, a3.height);
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (id)singleItemsByDay
{
  double v3 = self->_singleItemsByDay;
  objc_sync_enter(v3);
  double v4 = (void *)[(NSMutableArray *)self->_singleItemsByDay copy];
  objc_sync_exit(v3);

  return v4;
}

- (EKEvent)selectedEvent
{
  return self->_selectedEvent;
}

- (void)selectEvent:(id)a3
{
  unint64_t v5 = (EKEvent *)a3;
  if (self->_selectedEvent != v5)
  {
    unint64_t v6 = v5;
    objc_storeStrong((id *)&self->_selectedEvent, a3);
    unint64_t v5 = v6;
  }
}

- (void)setShowsLeftBorder:(BOOL)a3
{
}

- (BOOL)showsLeftBorder
{
  return [(EKDayGridView *)self->_grid showsLeftBorder];
}

- (void)setFixedDayWidth:(double)a3
{
  if (self->_fixedDayWidth != a3)
  {
    self->_fixedDayWidth = a3;
    unint64_t v5 = [(EKDayViewContent *)self grid];
    [v5 setFixedDayWidth:a3];

    [(EKDayViewContent *)self setNeedsLayout];
  }
}

- (void)setHoursToPadTop:(double)a3
{
}

- (void)setReduceLayoutProcessingForAnimation:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_reduceLayoutProcessingForAnimation != a3)
  {
    BOOL v3 = a3;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    unint64_t v5 = [(EKDayViewContent *)self occurrenceViews];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setReduceLayoutProcessingForAnimation:v3];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }

    self->_reduceLayoutProcessingForAnimatiouint64_t n = v3;
  }
}

- (void)setCalendar:(id)a3
{
  id v17 = a3;
  char v4 = [v17 isEqual:self->_calendar];
  unint64_t v5 = v17;
  if ((v4 & 1) == 0)
  {
    uint64_t v6 = (NSCalendar *)[v17 copy];
    calendar = self->_calendar;
    self->_calendar = v6;

    uint64_t v8 = self;
    objc_sync_enter(v8);
    startDate = v8->_startDate;
    long long v10 = [(NSCalendar *)self->_calendar timeZone];
    uint64_t v11 = [(EKCalendarDate *)startDate calendarDateInTimeZone:v10];
    long long v12 = v8->_startDate;
    v8->_startDate = (EKCalendarDate *)v11;

    endDate = v8->_endDate;
    double v14 = [(NSCalendar *)self->_calendar timeZone];
    uint64_t v15 = [(EKCalendarDate *)endDate calendarDateInTimeZone:v14];
    uint64_t v16 = v8->_endDate;
    v8->_endDate = (EKCalendarDate *)v15;

    objc_sync_exit(v8);
    [(EKDayViewContent *)v8 _computeDayStartsAndEnds];
    unint64_t v5 = v17;
  }
}

- (void)setTimeZone:(id)a3
{
  id v11 = a3;
  char v4 = [(NSCalendar *)self->_calendar timeZone];
  char v5 = [v11 isEqualToTimeZone:v4];

  if ((v5 & 1) == 0)
  {
    [(NSCalendar *)self->_calendar setTimeZone:v11];
    uint64_t v6 = self;
    objc_sync_enter(v6);
    uint64_t v7 = [(EKCalendarDate *)v6->_startDate calendarDateInTimeZone:v11];
    startDate = v6->_startDate;
    v6->_startDate = (EKCalendarDate *)v7;

    uint64_t v9 = [(EKCalendarDate *)v6->_endDate calendarDateInTimeZone:v11];
    endDate = v6->_endDate;
    v6->_endDate = (EKCalendarDate *)v9;

    objc_sync_exit(v6);
    [(EKDayViewContent *)v6 _computeDayStartsAndEnds];
  }
}

- (NSTimeZone)timeZone
{
  return [(NSCalendar *)self->_calendar timeZone];
}

- (void)setOccurrenceTitleColor:(id)a3
{
  char v5 = (UIColor *)a3;
  if (self->_occurrenceTitleColor != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_occurrenceTitleColor, a3);
    [(EKDayViewContent *)self setNeedsLayout];
    char v5 = v6;
  }
}

- (void)setOccurrenceTimeColor:(id)a3
{
  char v5 = (UIColor *)a3;
  if (self->_occurrenceTimeColor != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_occurrenceTimeColor, a3);
    [(EKDayViewContent *)self setNeedsLayout];
    char v5 = v6;
  }
}

- (void)setOccurrenceLocationColor:(id)a3
{
  char v5 = (UIColor *)a3;
  if (self->_occurrenceLocationColor != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_occurrenceLocationColor, a3);
    [(EKDayViewContent *)self setNeedsLayout];
    char v5 = v6;
  }
}

- (void)setOccurrenceTextBackgroundColor:(id)a3
{
  char v5 = (UIColor *)a3;
  if (self->_occurrenceTextBackgroundColor != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_occurrenceTextBackgroundColor, a3);
    [(EKDayViewContent *)self setNeedsLayout];
    char v5 = v6;
  }
}

- (UIEdgeInsets)insetsForInterfaceLayout:(UIEdgeInsets)a3
{
  double right = a3.right;
  bottouint64_t m = a3.bottom;
  double left = a3.left;
  CGFloat top = a3.top;
  int IsLeftToRight = CalInterfaceIsLeftToRight();
  if (IsLeftToRight) {
    double v8 = left;
  }
  else {
    double v8 = right;
  }
  if (IsLeftToRight) {
    double v9 = right;
  }
  else {
    double v9 = left;
  }
  double v10 = top;
  double v11 = bottom;
  result.double right = v9;
  result.bottouint64_t m = v11;
  result.double left = v8;
  result.CGFloat top = v10;
  return result;
}

- (void)setOccurrencePadding:(UIEdgeInsets)a3
{
  -[EKDayViewContent insetsForInterfaceLayout:](self, "insetsForInterfaceLayout:", a3.top, a3.left, a3.bottom, a3.right);
  if (!self->_hasCustomOccurrencePadding
    || (v5 == self->_occurrencePadding.left ? (BOOL v8 = v4 == self->_occurrencePadding.top) : (BOOL v8 = 0),
        v8 ? (BOOL v9 = v7 == self->_occurrencePadding.right) : (BOOL v9 = 0),
        v9 ? (BOOL v10 = v6 == self->_occurrencePadding.bottom) : (BOOL v10 = 0),
        !v10))
  {
    self->_occurrencePadding.CGFloat top = v4;
    self->_occurrencePadding.double left = v5;
    self->_occurrencePadding.bottouint64_t m = v6;
    self->_occurrencePadding.double right = v7;
    self->_hasCustomOccurrencePadding = 1;
    [(EKDayViewContent *)self setNeedsLayout];
  }
}

- (BOOL)containsVisibleOccurrenceViews
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = [(EKDayViewContent *)self occurrenceViews];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (![*(id *)(*((void *)&v7 + 1) + 8 * i) isHidden])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)dayOccurrenceViewSelected:(id)a3 source:(unint64_t)a4
{
  id v13 = a3;
  if ([v13 isReminderStack]
    && (id v6 = objc_loadWeakRetained((id *)&self->_delegate),
        char v7 = objc_opt_respondsToSelector(),
        v6,
        (v7 & 1) != 0))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    long long v9 = [v13 occurrences];
    [WeakRetained dayViewContent:self didSelectEvents:v9 userInitiated:a4 == 0];
  }
  else
  {
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    char v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) == 0) {
      goto LABEL_7;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    long long v9 = [v13 occurrence];
    uint64_t v12 = [v13 occurrenceDate];
    [WeakRetained dayViewContent:self didSelectEvent:v9 userInitiated:a4 == 0 dateSelected:v12];
  }
LABEL_7:
}

- (id)presentationControllerForEditMenu
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v3 = [WeakRetained presentationControllerForEditMenu];

  return v3;
}

- (id)selectedEventsForEditMenu
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v3 = [WeakRetained selectedEventsForEditMenu];

  return v3;
}

- (id)selectedCopyViewForDayOccurrenceView:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    long long v8 = [v7 dayViewContent:self selectedCopyViewForOccurrenceView:v4];
  }
  else
  {
    long long v8 = 0;
  }

  return v8;
}

- (void)attemptDisplayReviewPrompt
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)p_delegate);
    [v5 attemptDisplayReviewPrompt];
  }
}

- (void)setViewsDimmed:(BOOL)a3 forEvent:(id)a4
{
  BOOL v4 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = [(EKDayViewContent *)self allVisibleItems];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v13 = [v12 view];
        double v14 = [v13 occurrence];
        int v15 = [v14 isEqual:v6];

        if (v15)
        {
          uint64_t v16 = [v12 view];
          [v16 setDimmed:v4];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
}

- (id)occurrenceViewForEvent:(id)a3 onDate:(double)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(EKDayGridView *)self->_grid occurrenceContainerView];
  uint64_t v8 = [v7 subviews];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    id v12 = 0;
    uint64_t v13 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v9);
        }
        int v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (objc_msgSend(v15, "tag", (void)v24) == 2423)
        {
          uint64_t v16 = [v15 occurrences];
          int v17 = [v16 containsObject:v6];

          if (v17)
          {
            if (!v12) {
              id v12 = v15;
            }
            if (a4 != 0.0)
            {
              [(EKDayViewContent *)self pointForDate:a4];
              -[EKDayViewContent convertPoint:toView:](self, "convertPoint:toView:", v15);
              CGFloat v19 = v18;
              CGFloat v21 = v20;
              [v15 bounds];
              v31.double x = v19;
              v31.double y = v21;
              if (CGRectContainsPoint(v32, v31))
              {
                id v22 = v15;

                goto LABEL_18;
              }
            }
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v12 = 0;
  }

  id v12 = v12;
  id v22 = v12;
LABEL_18:

  return v22;
}

- (id)occurrenceViewForEvent:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(EKDayGridView *)self->_grid occurrenceContainerView];
    id v6 = [v5 subviews];

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = v6;
    id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v11, "tag", (void)v15) == 2423)
          {
            id v12 = [v11 occurrences];
            char v13 = [v12 containsObject:v4];

            if (v13)
            {
              id v8 = v11;
              goto LABEL_14;
            }
          }
        }
        id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)setDarkensWeekends:(BOOL)a3
{
  if (self->_darkensWeekends != a3)
  {
    self->_darkensWeekends = a3;
    if (a3)
    {
      if (!self->_sundayDarkeningView)
      {
        id v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
        sundayDarkeningView = self->_sundayDarkeningView;
        self->_sundayDarkeningView = v4;

        id v6 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.05];
        [(UIView *)self->_sundayDarkeningView setBackgroundColor:v6];

        [(EKDayGridView *)self->_grid insertSubview:self->_sundayDarkeningView atIndex:0];
      }
      if (!self->_saturdayDarkeningView)
      {
        id v7 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
        saturdayDarkeningView = self->_saturdayDarkeningView;
        self->_saturdayDarkeningView = v7;

        uint64_t v9 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.05];
        [(UIView *)self->_saturdayDarkeningView setBackgroundColor:v9];

        [(EKDayGridView *)self->_grid insertSubview:self->_saturdayDarkeningView atIndex:0];
      }
      [(EKDayViewContent *)self setNeedsLayout];
    }
    else
    {
      [(UIView *)self->_saturdayDarkeningView removeFromSuperview];
      [(UIView *)self->_sundayDarkeningView removeFromSuperview];
      uint64_t v10 = self->_saturdayDarkeningView;
      self->_saturdayDarkeningView = 0;

      uint64_t v11 = self->_sundayDarkeningView;
      self->_sundayDarkeningView = 0;
    }
  }
}

uint64_t __40__EKDayViewContent__layoutDaysIfVisible__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) clearTemporaryViews];
  *(unsigned char *)(*(void *)(a1 + 32) + 632) = 0;
  return result;
}

- (BOOL)_layoutNeededForDay:(int64_t)a3 isLoadingAsync:(BOOL)a4
{
  id v7 = -[NSMutableArray objectAtIndexedSubscript:](self->_lastLayoutWidthForDay, "objectAtIndexedSubscript:");
  [v7 doubleValue];
  double v9 = v8;
  [(EKDayViewContent *)self frame];
  double v11 = vabdd_f64(v9, v10);

  if (v11 < 2.22044605e-16) {
    return 0;
  }
  [(EKDayViewContent *)self _dayWidth];
  double v13 = v12;
  [(EKDayViewContent *)self frame];
  v18.origin.double y = 0.0;
  v18.origin.double x = v13 * (double)a3;
  v18.size.double width = v13;
  if (!CGRectIntersectsRect(v18, self->_latestVisibleRect)) {
    return 0;
  }
  if (a4) {
    [(EKDayViewContent *)self singleItemsForPreloadByDay];
  }
  else {
  long long v15 = [(EKDayViewContent *)self singleItemsByDay];
  }
  long long v16 = [v15 objectAtIndex:a3];

  BOOL v14 = [v16 count] != 0;
  return v14;
}

- (BOOL)_layoutDayIfNeeded:(int64_t)a3 isLoadingAsync:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v7 = -[EKDayViewContent _layoutNeededForDay:isLoadingAsync:](self, "_layoutNeededForDay:isLoadingAsync:");
  if (v7) {
    [(EKDayViewContent *)self _layoutDay:a3 isLoadingAsync:v4];
  }
  return v7;
}

- (double)firstEventSecond
{
  double v2 = -1.0;
  if (self->_daysToDisplay == 1)
  {
    BOOL v4 = [(EKDayViewContent *)self singleItemsByDay];
    uint64_t v5 = [v4 count];

    if (v5)
    {
      char IsLeftToRight = CalTimeDirectionIsLeftToRight();
      BOOL v7 = [(EKDayViewContent *)self singleItemsByDay];
      double v8 = v7;
      if (IsLeftToRight) {
        [v7 firstObject];
      }
      else {
      double v9 = [v7 lastObject];
      }

      if (v9 && [v9 count])
      {
        double v10 = [v9 objectAtIndex:0];
        double v11 = [v10 startDate];
        [v11 absoluteTime];
        double v13 = v12;
        [(EKCalendarDate *)self->_startDate absoluteTime];
        if (v13 < v14)
        {
          long long v15 = self->_startDate;

          double v11 = v15;
        }
        uint64_t v16 = 3600 * [v11 hour];
        uint64_t v17 = v16 + 60 * [v11 minute];
        double v2 = (double)(v17 + [v11 second]);
      }
    }
  }
  return v2;
}

- (id)lastDisplayedSecond
{
  uint64_t v3 = [(EKDayViewContent *)self dayStarts];

  if (!v3) {
    [(EKDayViewContent *)self _computeDayStartsAndEnds];
  }
  int IsLeftToRight = CalTimeDirectionIsLeftToRight();
  uint64_t v5 = [(EKDayViewContent *)self dayStarts];
  id v6 = v5;
  if (IsLeftToRight) {
    [v5 lastObject];
  }
  else {
  BOOL v7 = [v5 firstObject];
  }
  double v8 = [v7 objectForKey:@"endDate"];

  return v8;
}

uint64_t __124__EKDayViewContent_applyLoadedOccurrenceBatchStartingAtIndex_batchSize_fromArray_withStartDate_animated_reverse_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) applyLoadedOccurrenceBatchStartingAtIndex:*(void *)(a1 + 64) batchSize:*(void *)(a1 + 72) fromArray:*(void *)(a1 + 40) withStartDate:*(void *)(a1 + 48) animated:*(unsigned __int8 *)(a1 + 80) reverse:*(unsigned __int8 *)(a1 + 81) completion:*(void *)(a1 + 56)];
}

void __44__EKDayViewContent_prepareForReuseIsReload___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(*(void *)(a1 + 32) + 504);
  objc_sync_enter(v2);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 504);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v18;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v3);
        }
        BOOL v7 = *(void **)(*((void *)&v17 + 1) + 8 * v6);
        long long v13 = 0u;
        long long v14 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
        if (v9)
        {
          uint64_t v10 = *(void *)v14;
          do
          {
            uint64_t v11 = 0;
            do
            {
              if (*(void *)v14 != v10) {
                objc_enumerationMutation(v8);
              }
              double v12 = [*(id *)(*((void *)&v13 + 1) + 8 * v11) view];
              [v12 prepareForReuse];

              ++v11;
            }
            while (v9 != v11);
            uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
          }
          while (v9);
        }

        ++v6;
      }
      while (v6 != v4);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

void __44__EKDayViewContent_prepareForReuseIsReload___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v2);
}

- (void)setOccurrences:(id)a3
{
  id v4 = a3;
  if (!self->_waitingForSynchronousLayoutToReapplyViews)
  {
    [(EKDayViewContent *)self saveTemporaryViews];
    self->_waitingForSynchronousLayoutToReapplyViews = 1;
  }
  [(EKDayViewContent *)self prepareForReuseIsReload:1];
  [(EKDayViewContent *)self loadOccurrences:v4];
  [(EKDayViewContent *)self movePreloadedItemsToVisible];
  [(EKDayViewContent *)self setNeedsLayout];
}

void __42__EKDayViewContent__adjustViewsForPinning__block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v34 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v10 = [v9 view];
        [v10 frame];
        double v12 = v11;
        CGFloat v14 = v13;
        double v16 = v15;
        double v18 = v17;

        double v19 = *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) - v18;
        long long v20 = [v9 view];
        if ([v20 isHidden])
        {
          v39.origin.double x = v12;
          v39.origin.double y = v19;
          v39.size.double width = v16;
          v39.size.double height = v18;
          BOOL v21 = CGRectIntersectsRect(v39, *(CGRect *)(*(void *)(a1 + 32) + 528));

          if (!v21) {
            continue;
          }
        }
        else
        {
        }
        v40.origin.double x = v12;
        v40.origin.double y = v14;
        v40.size.double width = v16;
        v40.size.double height = v18;
        if (!CGRectIntersectsRect(v40, *(CGRect *)(*(void *)(a1 + 32) + 528)))
        {
          v41.origin.double x = v12;
          v41.origin.double y = v19;
          v41.size.double width = v16;
          v41.size.double height = v18;
          if (!CGRectIntersectsRect(v41, *(CGRect *)(*(void *)(a1 + 32) + 528))) {
            continue;
          }
        }
        id v22 = [v9 view];
        objc_msgSend(v22, "setFrame:", v12, v19, v16, v18);

        uint64_t v23 = [v9 view];
        if ([v23 isHidden])
        {
          v42.origin.double x = v12;
          v42.origin.double y = v19;
          v42.size.double width = v16;
          v42.size.double height = v18;
          BOOL v24 = CGRectIntersectsRect(v42, *(CGRect *)(*(void *)(a1 + 32) + 528));

          if (!v24) {
            continue;
          }
          uint64_t v23 = [v9 view];
          [v23 setHidden:0];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v6);
  }
  CalRoundToScreenScale(3.5);
  double v26 = v25;
  if (a3 + 1 < (unint64_t)[*(id *)(a1 + 40) count])
  {
    long long v27 = [v4 objectAtIndex:0];
    uint64_t v28 = [*(id *)(a1 + 40) objectAtIndex:a3 + 1];
    uint64_t v29 = [v28 objectAtIndex:0];

    [v29 unPinnedViewFrame];
    double MaxY = CGRectGetMaxY(v43);
    [v27 unPinnedViewFrame];
    double v31 = MaxY - CGRectGetMaxY(v44);
    if (v26 >= v31) {
      double v26 = v31;
    }
  }
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v26
                                                              + *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                          + 24);
}

- (BOOL)eventsIntersectRect:(CGRect)a3
{
  CGFloat width = a3.size.width;
  CGFloat r1 = a3.size.height;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  [(EKDayViewContent *)self occurrenceViews];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v24;
    CGFloat v7 = *MEMORY[0x1E4F1DB20];
    CGFloat v8 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    CGFloat v9 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    CGFloat v10 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v23 + 1) + 8 * i) frame];
        v31.origin.CGFloat x = v12;
        v31.origin.CGFloat y = v13;
        v31.size.CGFloat width = v14;
        double v16 = v15;
        v29.origin.CGFloat x = x;
        v29.origin.CGFloat y = y;
        v29.size.CGFloat width = width;
        v29.size.double height = r1;
        v31.size.double height = v16;
        CGRect v30 = CGRectIntersection(v29, v31);
        double height = v30.size.height;
        v32.origin.CGFloat x = v7;
        v32.origin.CGFloat y = v8;
        v32.size.CGFloat width = v9;
        v32.size.double height = v10;
        if (!CGRectEqualToRect(v30, v32))
        {
          double v18 = v16 + -1.0;
          if (v16 + -1.0 > 1800.0) {
            double v18 = 1800.0;
          }
          if (height > v18)
          {
            LOBYTE(v5) = 1;
            goto LABEL_14;
          }
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return v5;
}

- (BOOL)_getBottomPinRegion:(double *)a3 dayIndex:(unint64_t *)a4 forPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  [(EKDayViewContent *)self _dayWidth];
  unint64_t v11 = (unint64_t)(x / v10);
  CGFloat MaxY = CGRectGetMaxY(self->_latestVisibleRect);
  visiblePinnedStackHeightBelow = self->_visiblePinnedStackHeightBelow;
  double v14 = visiblePinnedStackHeightBelow[v11];
  double v15 = MaxY - v14;
  if (a4) {
    *a4 = v11;
  }
  double v16 = v15 + -3.0;
  if (a3)
  {
    *a3 = v16;
    double v14 = visiblePinnedStackHeightBelow[v11];
  }
  return y >= v16 && v14 > 0.0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5 = a4;
  [v5 locationInView:self];
  if (-[EKDayViewContent _getBottomPinRegion:dayIndex:forPoint:](self, "_getBottomPinRegion:dayIndex:forPoint:", 0, 0))
  {
    char v6 = 1;
  }
  else
  {
    CGFloat v7 = [v5 view];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    char v6 = isKindOfClass ^ 1;
  }

  return v6 & 1;
}

- (void)_tapRecognized:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  [a3 locationInView:self];
  double v5 = v4;
  double v7 = v6;
  uint64_t v27 = 0;
  double v28 = 0.0;
  if (!-[EKDayViewContent _getBottomPinRegion:dayIndex:forPoint:](self, "_getBottomPinRegion:dayIndex:forPoint:", &v28, &v27))
  {
    -[EKDayGridView hitTest:withEvent:](self->_grid, "hitTest:withEvent:", 0, v5, v7);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_20;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v18 = objc_opt_respondsToSelector();

    if ((v18 & 1) == 0) {
      goto LABEL_20;
    }
    CGFloat v9 = objc_loadWeakRetained((id *)&self->_delegate);
    -[EKDayViewContent dateForPoint:](self, "dateForPoint:", v5, v7);
    objc_msgSend(v9, "dayViewContent:didTapInEmptySpaceOnDay:", self);
LABEL_19:

    goto LABEL_20;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  CGFloat v8 = [(EKDayViewContent *)self visibleItemsByDay];
  CGFloat v9 = [v8 objectAtIndex:v27];

  id v10 = (id)[v9 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (!v10) {
    goto LABEL_19;
  }
  uint64_t v11 = *(void *)v24;
LABEL_4:
  uint64_t v12 = 0;
  while (1)
  {
    if (*(void *)v24 != v11) {
      objc_enumerationMutation(v9);
    }
    CGFloat v13 = *(void **)(*((void *)&v23 + 1) + 8 * v12);
    double v14 = [v13 view];
    [v14 frame];
    if (v15 >= v28) {
      break;
    }

LABEL_10:
    if (v10 == (id)++v12)
    {
      id v10 = (id)[v9 countByEnumeratingWithState:&v23 objects:v29 count:16];
      if (v10) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  char v16 = [v13 isPinned];

  if ((v16 & 1) == 0) {
    goto LABEL_10;
  }
  id v10 = v13;

  if (v10)
  {
    id v19 = objc_loadWeakRetained((id *)&self->_delegate);
    char v20 = objc_opt_respondsToSelector();

    if (v20)
    {
      CGFloat v9 = objc_loadWeakRetained((id *)&self->_delegate);
      BOOL v21 = [v10 view];
      id v22 = [v21 occurrence];
      [v9 dayViewContent:self didTapPinnedOccurrence:v22];

      goto LABEL_19;
    }
  }
LABEL_20:
}

- (id)groupItem:(id)a3 withItem:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  CGFloat v8 = [v7 events];
  CGFloat v9 = [v6 events];
  id v10 = [v8 arrayByAddingObjectsFromArray:v9];
  unint64_t v11 = [v7 eventIndex];
  unint64_t v12 = [v6 eventIndex];
  if (v11 >= v12) {
    unint64_t v11 = v12;
  }
  CGFloat v13 = [[EKDayViewContentItem alloc] initWithEventIndex:v11 sizeClass:self->_sizeClass];
  [(EKDayViewContentItem *)v13 setEvents:v10];
  -[EKDayViewContentItem setIsLoadingAsync:](v13, "setIsLoadingAsync:", [v7 isLoadingAsync]);
  -[EKDayViewContentItem setUsesSmallText:](v13, "setUsesSmallText:", [v7 usesSmallText]);
  double v14 = [v7 view];
  [v14 setHidden:1];

  double v15 = [v6 view];
  [v15 setHidden:1];

  char v16 = [v7 startDate];

  double v17 = [v6 startDate];

  char v18 = [v16 date];
  id v19 = [v17 date];
  int v20 = [v18 isBeforeDate:v19];

  if (v20) {
    BOOL v21 = v16;
  }
  else {
    BOOL v21 = v17;
  }
  id v22 = v21;
  [(EKDayViewContentItem *)v13 setStartDate:v22];
  [(EKDayViewContentItem *)v13 setEndDate:v22];

  return v13;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (BOOL)useMultiDayStyle
{
  return self->_useMultiDayStyle;
}

- (void)setOffscreenOccurrencePinningEnabled:(BOOL)a3
{
  self->_offscreenOccurrencePinningEnabled = a3;
}

- (BOOL)allowsOccurrenceSelection
{
  return self->_allowsOccurrenceSelection;
}

- (BOOL)eventsFillGrid
{
  return self->_eventsFillGrid;
}

- (BOOL)usesSmallText
{
  return self->_usesSmallText;
}

- (BOOL)darkensWeekends
{
  return self->_darkensWeekends;
}

- (BOOL)reduceLayoutProcessingForAnimation
{
  return self->_reduceLayoutProcessingForAnimation;
}

- (double)fixedDayWidth
{
  return self->_fixedDayWidth;
}

- (UIColor)occurrenceTitleColor
{
  return self->_occurrenceTitleColor;
}

- (UIColor)occurrenceTimeColor
{
  return self->_occurrenceTimeColor;
}

- (UIColor)occurrenceLocationColor
{
  return self->_occurrenceLocationColor;
}

- (UIColor)occurrenceTextBackgroundColor
{
  return self->_occurrenceTextBackgroundColor;
}

- (UIEdgeInsets)occurrencePadding
{
  double top = self->_occurrencePadding.top;
  double left = self->_occurrencePadding.left;
  bottouint64_t m = self->_occurrencePadding.bottom;
  double right = self->_occurrencePadding.right;
  result.double right = right;
  result.bottouint64_t m = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimmedOccurrence, 0);
  objc_storeStrong((id *)&self->_occurrenceTextBackgroundColor, 0);
  objc_storeStrong((id *)&self->_occurrenceLocationColor, 0);
  objc_storeStrong((id *)&self->_occurrenceTimeColor, 0);
  objc_storeStrong((id *)&self->_occurrenceTitleColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_temporaryViewCacheByDay, 0);
  objc_storeStrong((id *)&self->_reusableViews, 0);
  objc_storeStrong((id *)&self->_geometryDelegates, 0);
  objc_storeStrong((id *)&self->_shouldAnnotateAppEntitiesByDay, 0);
  objc_storeStrong((id *)&self->_itemsByDayByEndDate, 0);
  objc_storeStrong((id *)&self->_itemsByDay, 0);
  objc_storeStrong((id *)&self->_singleItemsByDay, 0);
  objc_storeStrong((id *)&self->_displayItemsForPreloadByDayByEndDate, 0);
  objc_storeStrong((id *)&self->_displayItemsForPreloadByDay, 0);
  objc_storeStrong((id *)&self->_singleItemsForPreloadByDay, 0);
  objc_storeStrong((id *)&self->_dayStarts, 0);
  objc_storeStrong((id *)&self->_selectedEvent, 0);
  objc_storeStrong((id *)&self->_lastLayoutWidthForDay, 0);
  objc_storeStrong((id *)&self->_sundayDarkeningView, 0);
  objc_storeStrong((id *)&self->_saturdayDarkeningView, 0);

  objc_storeStrong((id *)&self->_grid, 0);
}

@end