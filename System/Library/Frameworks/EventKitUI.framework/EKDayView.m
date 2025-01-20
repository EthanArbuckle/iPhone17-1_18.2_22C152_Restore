@interface EKDayView
- (BOOL)_isTimeMarkerFullyUnobstructed;
- (BOOL)_showingAllDaySection;
- (BOOL)_viewContentShouldDrawSynchronously;
- (BOOL)alignsMidnightToTop;
- (BOOL)allDayViewShouldAnnotateAppEntities:(id)a3;
- (BOOL)allowPinchingHourHeights;
- (BOOL)allowsOccurrenceSelection;
- (BOOL)allowsScrolling;
- (BOOL)animatesTimeMarker;
- (BOOL)containsOccurrences;
- (BOOL)dayViewContentShouldAnnotateAppEntities:(id)a3 onDayStarting:(id)a4;
- (BOOL)eventOccursOnThisDay:(id)a3;
- (BOOL)eventsFillGrid;
- (BOOL)isAllDayLabelHighlighted;
- (BOOL)isNowVisible;
- (BOOL)scrollEventsInToViewIgnoresVisibility;
- (BOOL)scrollTowardPoint:(CGPoint)a3;
- (BOOL)shouldEverShowTimeIndicators;
- (BOOL)showOnlyAllDayArea;
- (BOOL)showsLeftBorder;
- (BOOL)showsTimeLabel;
- (BOOL)showsTimeLine;
- (BOOL)showsTimeMarker;
- (BOOL)sizeTimeViewUsingOnlyHourText;
- (CGPoint)normalizedContentOffset;
- (CGPoint)pointAtDate:(double)a3 isAllDay:(BOOL)a4;
- (CGRect)currentTimeRectInView:(id)a3;
- (CGRect)currentTimeRectInView:(id)a3 requireThumb:(BOOL)a4;
- (CGRect)rectForEvent:(id)a3;
- (EKDayAllDayView)allDayView;
- (EKDayTimeView)timeView;
- (EKDayView)initWithFrame:(CGRect)a3 sizeClass:(int64_t)a4 orientation:(int64_t)a5 displayDate:(id)a6 backgroundColor:(id)a7 opaque:(BOOL)a8 scrollbarShowsInside:(BOOL)a9 isMiniPreviewInEventDetail:(BOOL)a10 rightClickDelegate:(id)a11;
- (EKDayViewContent)dayContent;
- (EKDayViewDataSource)dataSource;
- (EKDayViewDelegate)delegate;
- (EKEvent)dimmedOccurrence;
- (NSArray)allOccurrenceViews;
- (NSArray)occurrenceViews;
- (NSCalendar)calendar;
- (NSDateComponents)displayDate;
- (NSString)description;
- (UIColor)gridLineColor;
- (UIColor)occurrenceLocationColor;
- (UIColor)occurrenceTextBackgroundColor;
- (UIColor)occurrenceTimeColor;
- (UIColor)occurrenceTitleColor;
- (UIColor)timeViewTextColor;
- (UIVisualEffect)gridVisualEffect;
- (UIVisualEffect)timeViewVisualEffect;
- (_NSRange)hoursToRender;
- (double)_adjustSecondBackwardForDSTHole:(double)result;
- (double)_adjustSecondForwardForDSTHole:(double)result;
- (double)_positionOfSecond:(int)a3;
- (double)_scrollRate;
- (double)_scrollZoneTop;
- (double)_verticalOffset;
- (double)additionalLeftPadding;
- (double)bottomContentInset;
- (double)dateAtPoint:(CGPoint)a3 isAllDay:(BOOL *)a4;
- (double)dateAtPoint:(CGPoint)a3 isAllDay:(BOOL *)a4 requireAllDayRegionInsistence:(BOOL)a5;
- (double)dayEnd;
- (double)dayStart;
- (double)highlightedHour;
- (double)hourScale;
- (double)leftContentInset;
- (double)maximumHourScale;
- (double)minimumHourScale;
- (double)scaledHourHeight;
- (double)scrollAnimationDurationOverride;
- (double)scrollBarOffset;
- (double)scrollOffset;
- (double)timedRegionYOrigin;
- (double)todayScrollSecondBuffer;
- (double)topContentInset;
- (double)yPositionPerhapsMatchingAllDayOccurrence:(id)a3;
- (id)_generateVerticalGridExtensionImage;
- (id)allDayViewRequestsCurrentDisplayDate:(id)a3;
- (id)contentDidChangeCallback;
- (id)dayViewContent:(id)a3 selectedCopyViewForOccurrenceView:(id)a4;
- (id)displayDateDidChangeCallback;
- (id)occurrenceViewAtPoint:(CGPoint)a3;
- (id)occurrenceViewForEvent:(id)a3;
- (id)presentationControllerForEditMenu;
- (id)selectedEvent;
- (id)selectedEventsForEditMenu;
- (id)verticalScrollView;
- (int)_secondAtPosition:(double)a3;
- (int)firstVisibleSecond;
- (int)outlineStyle;
- (int64_t)_sizeClass;
- (int64_t)orientation;
- (void)_adjustForDateOrCalendarChange;
- (void)_clearVerticalGridExtensionImageCache;
- (void)_createAllDayViewWithSizeClass:(int64_t)a3 rightClickDelegate:(id)a4;
- (void)_dayViewPinched:(id)a3;
- (void)_disposeAllDayView;
- (void)_doubleTap:(id)a3;
- (void)_invalidateMarkerTimer;
- (void)_localeChanged;
- (void)_notifyDelegateOfFinishedScrollingToOccurrence;
- (void)_scrollToSecond:(int)a3 animated:(BOOL)a4 whenFinished:(id)a5;
- (void)_scrollToSecond:(int)a3 offset:(double)a4 animated:(BOOL)a5 whenFinished:(id)a6;
- (void)_scrollViewWillBeginDragging:(id)a3;
- (void)_startMarkerTimer;
- (void)_timeViewTapped:(id)a3;
- (void)_updateContentForSizeCategoryChange:(id)a3;
- (void)addViewToScroller:(id)a3 isAllDay:(BOOL)a4;
- (void)adjustForTimeZoneChanged;
- (void)adjustFrameToSpanToMidnightFromStartDate:(id)a3;
- (void)allDayView:(id)a3 didSelectEvent:(id)a4 userInitiated:(BOOL)a5;
- (void)allDayViewDidLayoutSubviews:(id)a3;
- (void)attemptDisplayReviewPrompt;
- (void)bringEventToFront:(id)a3;
- (void)configureOccurrenceViewForGestureController:(id)a3;
- (void)dayViewContent:(id)a3 didCreateOccurrenceViews:(id)a4;
- (void)dayViewContent:(id)a3 didSelectEvent:(id)a4 userInitiated:(BOOL)a5 dateSelected:(id)a6;
- (void)dayViewContent:(id)a3 didSelectEvents:(id)a4 userInitiated:(BOOL)a5;
- (void)dayViewContent:(id)a3 didTapInEmptySpaceOnDay:(double)a4;
- (void)dayViewContent:(id)a3 didTapPinnedOccurrence:(id)a4;
- (void)dayViewContentDidCompleteAsyncLoadAndLayout:(id)a3;
- (void)dealloc;
- (void)firstVisibleSecondChanged;
- (void)highlightHour:(double)a3;
- (void)insertViewForEvent:(id)a3 belowViewForOtherEvent:(id)a4;
- (void)layoutSubviews;
- (void)loadData:(BOOL)a3 withCompletion:(id)a4;
- (void)relayoutExistingTimedOccurrences;
- (void)reloadData;
- (void)reloadDataSynchronously;
- (void)removeFromSuperview;
- (void)resetOccurrenceViewColors;
- (void)scrollEventsIntoViewAnimated:(BOOL)a3;
- (void)scrollToDate:(id)a3 animated:(BOOL)a4 whenFinished:(id)a5;
- (void)scrollToDate:(id)a3 offset:(double)a4 animated:(BOOL)a5 whenFinished:(id)a6;
- (void)scrollToEvent:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5;
- (void)scrollToNowAnimated:(BOOL)a3 whenFinished:(id)a4;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)selectEvent:(id)a3;
- (void)setAdditionalLeftPadding:(double)a3;
- (void)setAlignsMidnightToTop:(BOOL)a3;
- (void)setAllDayLabelHighlighted:(BOOL)a3;
- (void)setAllowPinchingHourHeights:(BOOL)a3;
- (void)setAllowsOccurrenceSelection:(BOOL)a3;
- (void)setAllowsScrolling:(BOOL)a3;
- (void)setAnimatesTimeMarker:(BOOL)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBottomContentInset:(double)a3;
- (void)setCalendar:(id)a3;
- (void)setContentDidChangeCallback:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDimmedOccurrence:(id)a3;
- (void)setDisplayDate:(id)a3;
- (void)setDisplayDateDidChangeCallback:(id)a3;
- (void)setEventsFillGrid:(BOOL)a3;
- (void)setFirstVisibleSecond:(int)a3;
- (void)setGridLineColor:(id)a3;
- (void)setGridVisualEffect:(id)a3;
- (void)setHourScale:(double)a3;
- (void)setHoursToRender:(_NSRange)a3;
- (void)setIsNowVisible:(BOOL)a3;
- (void)setNormalizedContentOffset:(CGPoint)a3;
- (void)setOccurrenceLocationColor:(id)a3;
- (void)setOccurrenceTextBackgroundColor:(id)a3;
- (void)setOccurrenceTimeColor:(id)a3;
- (void)setOccurrenceTitleColor:(id)a3;
- (void)setOpaque:(BOOL)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setOutlineStyle:(int)a3;
- (void)setScrollAnimationDurationOverride:(double)a3;
- (void)setScrollEventsInToViewIgnoresVisibility:(BOOL)a3;
- (void)setScrollerYInset:(double)a3 keepingYPointVisible:(double)a4;
- (void)setShouldEverShowTimeIndicators:(BOOL)a3;
- (void)setShowOnlyAllDayArea:(BOOL)a3;
- (void)setShowsLeftBorder:(BOOL)a3;
- (void)setShowsTimeLabel:(BOOL)a3;
- (void)setShowsTimeLine:(BOOL)a3;
- (void)setShowsTimeMarker:(BOOL)a3;
- (void)setSizeTimeViewUsingOnlyHourText:(BOOL)a3;
- (void)setTimeViewTextColor:(id)a3;
- (void)setTimeViewVisualEffect:(id)a3;
- (void)setTimeZone:(id)a3;
- (void)setTodayScrollSecondBuffer:(double)a3;
- (void)setTopContentInset:(double)a3;
- (void)shouldAnnotateAppEntitiesChanged;
- (void)stopScrolling;
- (void)updateMarkerPosition;
- (void)willMoveToSuperview:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation EKDayView

uint64_t __37__EKDayView_loadData_withCompletion___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsLayout];
  if (*(unsigned char *)(a1 + 48)) {
    [*(id *)(*(void *)(a1 + 32) + 504) clearTemporaryViews];
  }
  v2 = *(unsigned char **)(a1 + 32);
  if (v2[444])
  {
    [v2 scrollEventsIntoViewAnimated:1];
    *(unsigned char *)(*(void *)(a1 + 32) + 444) = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__EKDayView_loadData_withCompletion___block_invoke_4;
  block[3] = &unk_1E6087570;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
  v3 = [*(id *)(a1 + 32) contentDidChangeCallback];

  if (v3)
  {
    v4 = [*(id *)(a1 + 32) contentDidChangeCallback];
    v5 = [*(id *)(*(void *)(a1 + 32) + 496) occurrenceViews];
    v4[2](v4, [v5 count]);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    uint64_t result = (*(uint64_t (**)(void))(result + 16))();
  }
  if (!*(unsigned char *)(a1 + 49)) {
    return [*(id *)(*(void *)(a1 + 32) + 504) setNeedsLayout];
  }
  return result;
}

- (id)contentDidChangeCallback
{
  return self->_contentDidChangeCallback;
}

- (void)scrollViewDidScroll:(id)a3
{
  [a3 contentOffset];
  double v5 = v4;
  [(EKDayView *)self _verticalOffset];
  double v7 = v6;
  topVerticalGridExtension = self->_topVerticalGridExtension;
  if (v5 >= -v6)
  {
    if (topVerticalGridExtension)
    {
      [(UIImageView *)self->_topVerticalGridExtension removeFromSuperview];
      v12 = self->_topVerticalGridExtension;
      self->_topVerticalGridExtension = 0;
    }
  }
  else
  {
    if (!topVerticalGridExtension)
    {
      v9 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
      v10 = self->_topVerticalGridExtension;
      self->_topVerticalGridExtension = v9;

      v11 = [(EKDayView *)self _generateVerticalGridExtensionImage];
      [(UIImageView *)self->_topVerticalGridExtension setImage:v11];

      [(UIImageView *)self->_topVerticalGridExtension setOpaque:[(EKDayView *)self isOpaque]];
      [(UIScrollView *)self->_scroller insertSubview:self->_topVerticalGridExtension atIndex:0];
      topVerticalGridExtension = self->_topVerticalGridExtension;
    }
    [(EKDayView *)self bounds];
    -[UIImageView setFrame:](topVerticalGridExtension, "setFrame:", 0.0, v5 - v7);
  }
  [(EKDayViewContent *)self->_dayContent bounds];
  double v14 = v13;
  [(UIScrollView *)self->_scroller bounds];
  bottomVerticalGridExtension = self->_bottomVerticalGridExtension;
  if (v5 <= v14 - v15 - v7)
  {
    if (bottomVerticalGridExtension)
    {
      [(UIImageView *)self->_bottomVerticalGridExtension removeFromSuperview];
      v22 = self->_bottomVerticalGridExtension;
      self->_bottomVerticalGridExtension = 0;
    }
  }
  else
  {
    if (!bottomVerticalGridExtension)
    {
      v17 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
      v18 = self->_bottomVerticalGridExtension;
      self->_bottomVerticalGridExtension = v17;

      v19 = [(EKDayView *)self _generateVerticalGridExtensionImage];
      [(UIImageView *)self->_bottomVerticalGridExtension setImage:v19];

      [(UIImageView *)self->_bottomVerticalGridExtension setOpaque:1];
      [(UIScrollView *)self->_scroller insertSubview:self->_bottomVerticalGridExtension atIndex:0];
      bottomVerticalGridExtension = self->_bottomVerticalGridExtension;
    }
    [(EKDayViewContent *)self->_dayContent bounds];
    double v21 = v20 - v7;
    [(EKDayView *)self bounds];
    -[UIImageView setFrame:](bottomVerticalGridExtension, "setFrame:", 0.0, v21);
  }
  v23 = [(EKDayView *)self superview];

  if (v23)
  {
    dayContent = self->_dayContent;
    [(UIScrollView *)self->_scroller bounds];
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    CGFloat v30 = v29;
    CGFloat v32 = v31;
    [(EKDayViewContent *)self->_dayContent frame];
    CGFloat v34 = -v33;
    v39.origin.x = v26;
    v39.origin.y = v28;
    v39.size.width = v30;
    v39.size.height = v32;
    CGRect v40 = CGRectOffset(v39, 0.0, v34);
    -[EKDayViewContent rectBecameVisible:](dayContent, "rectBecameVisible:", v40.origin.x, v40.origin.y, v40.size.width, v40.size.height);
  }
  v35 = [(EKDayView *)self delegate];
  char v36 = objc_opt_respondsToSelector();

  if (v36)
  {
    id v37 = [(EKDayView *)self delegate];
    [(UIScrollView *)self->_scroller contentOffset];
    objc_msgSend(v37, "dayView:didUpdateScrollPosition:", self);
  }
}

- (BOOL)dayViewContentShouldAnnotateAppEntities:(id)a3 onDayStarting:(id)a4
{
  id v5 = a4;
  double v6 = [(EKDayView *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    v8 = [(EKDayView *)self delegate];
    char v9 = [v8 dayViewShouldAnnotateAppEntities:self onDayStarting:v5];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (EKDayViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EKDayViewDelegate *)WeakRetained;
}

- (id)_generateVerticalGridExtensionImage
{
  [(EKDayView *)self bounds];
  double v4 = v3;
  if (__verticalGridExtensionImageCache)
  {
    [(id)__verticalGridExtensionImageCache size];
    id v5 = (void *)__verticalGridExtensionImageCache;
    if (v6 == v4)
    {
      id v7 = (id)__verticalGridExtensionImageCache;
      goto LABEL_12;
    }
    if (__verticalGridExtensionImageCache)
    {
      __verticalGridExtensionImageCache = 0;
    }
  }
  v8 = [MEMORY[0x1E4FB1E20] _currentTraitCollection];
  char v9 = [(EKDayView *)self traitCollection];
  [MEMORY[0x1E4FB1E20] _setCurrentTraitCollection:v9];

  char v10 = [(EKDayView *)self isOpaque];
  v25.height = 1.0;
  v25.width = v4;
  UIGraphicsBeginImageContextWithOptions(v25, v10, 0.0);
  if ([(EKDayView *)self isOpaque])
  {
    id v11 = [(UIScrollView *)self->_scroller backgroundColor];
    [v11 CGColor];
    UISetColor();

    v26.origin.CGFloat x = 0.0;
    v26.origin.y = 0.0;
    v26.size.height = 1.0;
    v26.size.width = v4;
    UIRectFill(v26);
  }
  if (self->_outlineStyle)
  {
    id v12 = [MEMORY[0x1E4FB1618] separatorColor];
    [v12 CGColor];

    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSetShouldAntialias(CurrentContext, 0);
    UISetColor();
    [(EKDayViewContent *)self->_dayContent frame];
    CGFloat x = v27.origin.x;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    v27.origin.y = 0.0;
    v27.size.width = 1.0;
    v27.size.height = 1.0;
    UIRectFill(v27);
    v28.origin.CGFloat x = x;
    v28.origin.y = v16;
    v28.size.width = v18;
    v28.size.height = v20;
    v29.origin.CGFloat x = CGRectGetMaxX(v28) + -1.0;
    v29.origin.y = 0.0;
    v29.size.width = 1.0;
    v29.size.height = 1.0;
    UIRectFill(v29);
    if (self->_outlineStyle == 1)
    {
      v30.origin.CGFloat x = 0.0;
      v30.origin.y = 0.0;
      v30.size.width = 1.0;
      v30.size.height = 1.0;
      UIRectFill(v30);
    }
  }
  uint64_t v21 = UIGraphicsGetImageFromCurrentImageContext();
  v22 = (void *)__verticalGridExtensionImageCache;
  __verticalGridExtensionImageCache = v21;

  UIGraphicsEndImageContext();
  [MEMORY[0x1E4FB1E20] _setCurrentTraitCollection:v8];
  [(EKDayView *)self performSelector:sel__clearVerticalGridExtensionImageCache withObject:0 afterDelay:1.0];
  id v7 = (id)__verticalGridExtensionImageCache;

LABEL_12:

  return v7;
}

- (void)shouldAnnotateAppEntitiesChanged
{
  [(EKDayViewContent *)self->_dayContent shouldAnnotateAppEntitiesChanged];
  allDayView = self->_allDayView;

  [(EKDayAllDayView *)allDayView shouldAnnotateAppEntitiesChanged];
}

- (void)willMoveToWindow:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(EKDayView *)self window];
  id v5 = v8;
  double v6 = (void *)v4;
  if (!v8 || v4)
  {
    if (v8) {
      goto LABEL_8;
    }
    [(EKDayView *)self _invalidateMarkerTimer];
  }
  else
  {
    BOOL v7 = [(EKDayView *)self showsTimeLine];
    id v5 = v8;
    if (!v7) {
      goto LABEL_8;
    }
    [(EKDayView *)self _startMarkerTimer];
  }
  id v5 = v8;
LABEL_8:
  if (self->_layoutWhenJoiningViewHierarchy)
  {
    EKUIPushFallbackSizingContextWithViewHierarchy(v5);
    [(EKDayView *)self layoutSubviews];
    EKUIPopFallbackSizingContextWithViewHierarchy(v8);
    id v5 = v8;
    self->_layoutWhenJoiningViewHierarchy = 0;
  }
  if (v5) {
    [(EKDayView *)self shouldAnnotateAppEntitiesChanged];
  }
}

- (BOOL)showsTimeLine
{
  v2 = [(EKDayViewContent *)self->_dayContent grid];
  char v3 = [v2 showsTimeLine];

  return v3;
}

- (void)_startMarkerTimer
{
  if (!self->_timeMarkerTimer)
  {
    CUIKCalendar();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    char v3 = CUIKCalendar();
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
    id v5 = [v3 components:126 fromDate:v4];

    double v6 = [v12 dateFromComponents:v5];
    id v7 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    [v7 setMinute:1];
    id v8 = [v12 dateByAddingComponents:v7 toDate:v6 options:0];
    char v9 = (NSTimer *)[objc_alloc(MEMORY[0x1E4F1CB00]) initWithFireDate:v8 interval:self target:sel_updateMarkerPosition selector:0 userInfo:1 repeats:60.0];
    timeMarkerTimer = self->_timeMarkerTimer;
    self->_timeMarkerTimer = v9;

    id v11 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    [v11 addTimer:self->_timeMarkerTimer forMode:*MEMORY[0x1E4F1C3A0]];
  }
}

- (void)setTimeZone:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(NSCalendar *)self->_calendar timeZone];
  char v5 = [v6 isEqualToTimeZone:v4];

  if ((v5 & 1) == 0)
  {
    [(NSCalendar *)self->_calendar setTimeZone:v6];
    [(EKDayView *)self _adjustForDateOrCalendarChange];
    [(EKDayViewContent *)self->_dayContent setTimeZone:v6];
  }
}

- (void)setDelegate:(id)a3
{
}

- (void)setDataSource:(id)a3
{
}

- (void)setCalendar:(id)a3
{
  id v6 = a3;
  if (([v6 isEqual:self->_calendar] & 1) == 0)
  {
    uint64_t v4 = (NSCalendar *)[v6 copy];
    calendar = self->_calendar;
    self->_calendar = v4;

    [(EKDayView *)self _adjustForDateOrCalendarChange];
    [(EKDayViewContent *)self->_dayContent setCalendar:v6];
  }
}

- (void)setAllowsOccurrenceSelection:(BOOL)a3
{
  if (self->_allowsOccurrenceSelection != a3)
  {
    BOOL v3 = a3;
    self->_allowsOccurrenceSelection = a3;
    -[EKDayAllDayView setAllowsOccurrenceSelection:](self->_allDayView, "setAllowsOccurrenceSelection:");
    dayContent = self->_dayContent;
    [(EKDayViewContent *)dayContent setAllowsOccurrenceSelection:v3];
  }
}

- (void)layoutSubviews
{
  v78.receiver = self;
  v78.super_class = (Class)EKDayView;
  [(EKDayView *)&v78 layoutSubviews];
  [(UIScrollView *)self->_scroller contentInset];
  double v4 = v3;
  allDayView = self->_allDayView;
  if (allDayView)
  {
    [(EKDayAllDayView *)allDayView frame];
    double v7 = v6;
    [(EKDayView *)self bounds];
    double v9 = v8;
    [(EKDayAllDayView *)self->_allDayView naturalHeight];
    -[EKDayAllDayView setFrame:](self->_allDayView, "setFrame:", v7, v4, v9, v10);
    [(EKDayAllDayView *)self->_allDayView sizeToFit];
    [(EKDayAllDayView *)self->_allDayView naturalHeight];
    double v4 = v11;
  }
  [(EKDayView *)self bounds];
  CGFloat v13 = v12;
  double v15 = v14;
  double v17 = v16;
  [(EKDayView *)self scrollBarOffset];
  double v19 = v18;
  [(EKDayTimeView *)self->_timeView updateHourHeight];
  CGFloat v20 = [(EKDayViewContent *)self->_dayContent grid];
  [v20 updateHourHeight];

  +[EKDayTimeView defaultHeightForSizeClass:[(EKDayView *)self _sizeClass] orientation:self->_orientation withHourScale:self->_hourScale];
  double v77 = v21;
  +[EKDayTimeView timeWidthForOrientation:self->_orientation inViewHierarchy:self];
  double v23 = v22;
  v24 = [(EKDayView *)self window];

  if (!v24) {
    self->_layoutWhenJoiningViewHierarchy = 1;
  }
  double v25 = v17 - v4;
  double v26 = v19 + v15;
  double v27 = v23;
  double v28 = v23;
  if ([(EKDayView *)self sizeTimeViewUsingOnlyHourText])
  {
    +[EKDayTimeView hourWidthForSizeClass:[(EKDayView *)self _sizeClass] orientation:self->_orientation];
    double v30 = v29;
    if (CalInterfaceIsLeftToRight())
    {
      [(EKDayView *)self additionalLeftPadding];
      double v32 = v30 + v31;
      double v33 = v32;
    }
    else
    {
      +[EKDayTimeView timeInsetForSizeClass:[(EKDayView *)self _sizeClass] orientation:self->_orientation];
      double v35 = v34;
      [(EKDayView *)self layoutMargins];
      double v33 = v30 + v35 + v36;
      [(EKDayView *)self layoutMargins];
      double v32 = v33 - v37;
    }
    double v27 = CalFloorToScreenScale(v32);
    CalRoundToScreenScale(v33);
    double v28 = v38;
  }
  double v75 = v27;
  double v76 = v23;
  v79.origin.CGFloat x = v13;
  v79.origin.y = v4;
  v79.size.width = v26;
  v79.size.height = v25;
  CGRectGetWidth(v79);
  [(EKDayView *)self scrollBarOffset];
  [(EKDayView *)self _verticalOffset];
  double v39 = v26;
  double v40 = v4;
  double v41 = v13;
  double v43 = v42;
  int IsLeftToRight = CalInterfaceIsLeftToRight();
  double v45 = 0.0;
  if (IsLeftToRight) {
    double v45 = v28;
  }
  [(EKDayViewContent *)self->_dayContent setFrame:v45];
  [(UIScrollView *)self->_scroller contentOffset];
  double v47 = v46;
  double v49 = v48;
  v80.origin.CGFloat x = v41;
  v80.origin.y = v40;
  v80.size.width = v39;
  v80.size.height = v25;
  -[UIScrollView setContentSize:](self->_scroller, "setContentSize:", CGRectGetWidth(v80), v77 + v43 * -2.0);
  -[UIScrollView setContentOffset:](self->_scroller, "setContentOffset:", v47, v49);
  v50 = self->_allDayView;
  +[EKDayTimeView timeInsetForSizeClass:[(EKDayView *)self _sizeClass] orientation:self->_orientation];
  [(EKDayAllDayView *)v50 setOccurrenceInset:v75 labelInset:v75 - v51];
  [(UIScrollView *)self->_scroller frame];
  v86.origin.CGFloat x = v41;
  v86.origin.y = v40;
  v86.size.width = v39;
  v86.size.height = v25;
  if (!CGRectEqualToRect(v81, v86)) {
    -[UIScrollView setFrame:](self->_scroller, "setFrame:", v41, v40, v39, v25);
  }
  if (CalInterfaceIsLeftToRight())
  {
    double v52 = v76;
    double v53 = v28 - v76;
  }
  else
  {
    [(EKDayViewContent *)self->_dayContent frame];
    double v55 = v54;
    [(EKDayViewContent *)self->_dayContent frame];
    double v53 = v55 + v56;
    double v52 = v76;
  }
  -[EKDayTimeView setFrame:](self->_timeView, "setFrame:", v53, -v43, v52, v77);
  int outlineStyle = self->_outlineStyle;
  if (outlineStyle == 2)
  {
    bottomLine = self->_bottomLine;
    v83.origin.CGFloat x = v41;
    v83.origin.y = v40;
    v83.size.width = v39;
    v83.size.height = v25;
    double MaxY = CGRectGetMaxY(v83);
    [(EKDayView *)self scrollBarOffset];
    double v61 = v39 - v28 - v62;
    goto LABEL_21;
  }
  if (outlineStyle == 1)
  {
    bottomLine = self->_bottomLine;
    v82.origin.CGFloat x = v41;
    v82.origin.y = v40;
    v82.size.width = v39;
    v82.size.height = v25;
    double MaxY = CGRectGetMaxY(v82);
    [(EKDayView *)self scrollBarOffset];
    double v61 = v39 - v60;
    double v28 = 0.0;
LABEL_21:
    -[UIView setFrame:](bottomLine, "setFrame:", v28, MaxY, v61, 1.0);
  }
  dayContent = self->_dayContent;
  [(UIScrollView *)self->_scroller bounds];
  CGFloat v65 = v64;
  CGFloat v67 = v66;
  CGFloat v69 = v68;
  CGFloat v71 = v70;
  [(EKDayViewContent *)self->_dayContent frame];
  CGFloat v73 = -v72;
  v84.origin.CGFloat x = v65;
  v84.origin.y = v67;
  v84.size.width = v69;
  v84.size.height = v71;
  CGRect v85 = CGRectOffset(v84, 0.0, v73);
  -[EKDayViewContent rectBecameVisible:](dayContent, "rectBecameVisible:", v85.origin.x, v85.origin.y, v85.size.width, v85.size.height);
  v74 = [(EKDayViewContent *)self->_dayContent grid];
  [v74 updateMarkerPosition];
}

- (int)_secondAtPosition:(double)a3
{
  char v5 = [(EKDayViewContent *)self->_dayContent grid];
  [(EKDayView *)self _verticalOffset];
  int v7 = [v5 secondAtPosition:v6 + a3];

  if (v7 >= (int)(self->_dayEnd - self->_dayStart)) {
    int v8 = (int)(self->_dayEnd - self->_dayStart);
  }
  else {
    int v8 = v7;
  }
  if (v7 >= 0) {
    return v8;
  }
  else {
    return (int)(self->_dayEnd - self->_dayStart);
  }
}

- (double)_verticalOffset
{
  BOOL v2 = [(EKDayView *)self alignsMidnightToTop];
  double result = 0.0;
  if (v2)
  {
    +[EKDayTimeView verticalPadding];
    return v4 + 1.0;
  }
  return result;
}

- (BOOL)alignsMidnightToTop
{
  return self->_alignsMidnightToTop;
}

- (double)scrollBarOffset
{
  double result = 0.0;
  if (!self->_scrollbarShowsInside) {
    return 10.0;
  }
  return result;
}

- (int64_t)_sizeClass
{
  double v3 = [(EKDayView *)self window];

  if (!v3) {
    return self->_targetSizeClass;
  }

  return EKUIWidthSizeClassForViewHierarchy(self);
}

- (BOOL)sizeTimeViewUsingOnlyHourText
{
  return self->_sizeTimeViewUsingOnlyHourText;
}

- (int)firstVisibleSecond
{
  [(UIScrollView *)self->_scroller contentOffset];

  return [(EKDayView *)self _secondAtPosition:v3];
}

- (void)setFirstVisibleSecond:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  p_scrolledToFirstVisibleSecondForSize = &self->_scrolledToFirstVisibleSecondForSize;
  [(UIScrollView *)self->_scroller bounds];
  double width = p_scrolledToFirstVisibleSecondForSize->width;
  double height = p_scrolledToFirstVisibleSecondForSize->height;
  BOOL v10 = p_scrolledToFirstVisibleSecondForSize->width == v9 && height == v6;
  if (!v10 || [(EKDayView *)self firstVisibleSecond] != v3)
  {
    [(UIScrollView *)self->_scroller contentSize];
    double v12 = v11;
    [(UIScrollView *)self->_scroller bounds];
    double v14 = v13;
    if (v3)
    {
      if (v3 == 86399)
      {
        double v15 = v12 - v13;
      }
      else
      {
        [(EKDayView *)self _positionOfSecond:v3];
        double v15 = v16;
      }
    }
    else
    {
      double v15 = 0.0;
    }
    scroller = self->_scroller;
    [(UIScrollView *)scroller contentInset];
    if (v15 >= v12 + v18 - v14) {
      double v19 = v12 + v18 - v14;
    }
    else {
      double v19 = v15;
    }
    -[UIScrollView setContentOffset:](scroller, "setContentOffset:", 0.0, v19);
    [(UIScrollView *)self->_scroller bounds];
    p_scrolledToFirstVisibleSecondForSize->double width = v20;
    p_scrolledToFirstVisibleSecondForSize->double height = v21;
    [(EKDayView *)self firstVisibleSecondChanged];
  }
}

- (BOOL)allDayViewShouldAnnotateAppEntities:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0) {
    return 0;
  }
  int v7 = (void *)MEMORY[0x1E4F57838];
  double dayStart = self->_dayStart;
  double v9 = [(NSCalendar *)self->_calendar timeZone];
  BOOL v10 = [v7 calendarDateWithAbsoluteTime:v9 timeZone:dayStart];

  id v11 = objc_loadWeakRetained((id *)p_delegate);
  char v12 = [v11 dayViewShouldAnnotateAppEntities:self onDayStarting:v10];

  return v12;
}

- (id)allDayViewRequestsCurrentDisplayDate:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F57838];
  double dayStart = self->_dayStart;
  char v5 = [(NSCalendar *)self->_calendar timeZone];
  char v6 = [v3 calendarDateWithAbsoluteTime:v5 timeZone:dayStart];

  return v6;
}

- (BOOL)isNowVisible
{
  BOOL result = [(EKDayView *)self _isTimeMarkerFullyUnobstructed];
  self->_isNowVisible = result;
  return result;
}

- (BOOL)_showingAllDaySection
{
  allDayView = self->_allDayView;
  if (allDayView)
  {
    [(EKDayAllDayView *)allDayView frame];
    LOBYTE(allDayView) = v3 > 0.0;
  }
  return (char)allDayView;
}

- (void)setDisplayDateDidChangeCallback:(id)a3
{
}

- (void)setContentDidChangeCallback:(id)a3
{
}

- (NSDateComponents)displayDate
{
  return self->_displayDate;
}

- (BOOL)_isTimeMarkerFullyUnobstructed
{
  [(EKDayView *)self currentTimeRectInView:self];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  [(EKDayView *)self bounds];
  uint64_t v15 = v4;
  uint64_t v16 = v6;
  uint64_t v17 = v8;
  uint64_t v18 = v10;

  return CGRectContainsRect(*(CGRect *)&v11, *(CGRect *)&v15);
}

- (CGRect)currentTimeRectInView:(id)a3 requireThumb:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = *MEMORY[0x1E4F1DB20];
  double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v9 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  if ([(EKDayView *)self showsTimeMarker])
  {
    uint64_t v11 = [(EKDayViewContent *)self->_dayContent grid];
    char v12 = [v11 timeMarker];

    if (v12 && (!v4 || [v12 showsThumb]))
    {
      [v12 currentTimeFrame];
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;
      CGFloat v21 = [v12 superview];
      objc_msgSend(v6, "convertRect:fromView:", v21, v14, v16, v18, v20);
      double v7 = v22;
      double v8 = v23;
      double v9 = v24;
      double v10 = v25;
    }
  }

  double v26 = v7;
  double v27 = v8;
  double v28 = v9;
  double v29 = v10;
  result.size.double height = v29;
  result.size.double width = v28;
  result.origin.y = v27;
  result.origin.CGFloat x = v26;
  return result;
}

- (BOOL)showsTimeMarker
{
  BOOL v2 = [(EKDayViewContent *)self->_dayContent grid];
  char v3 = [v2 showsTimeMarker];

  return v3;
}

- (CGRect)currentTimeRectInView:(id)a3
{
  [(EKDayView *)self currentTimeRectInView:a3 requireThumb:1];
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (void)allDayViewDidLayoutSubviews:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 dayView:self didCreateOccurrenceViews:0];
  }
}

- (void)willMoveToSuperview:(id)a3
{
  id v5 = a3;
  if (v5 && ([v5 window], double v4 = objc_claimAutoreleasedReturnValue(), v4, v4))
  {
    if ([(EKDayView *)self showsTimeLine]) {
      [(EKDayView *)self _startMarkerTimer];
    }
  }
  else
  {
    [(EKDayView *)self _invalidateMarkerTimer];
  }
}

- (void)_createAllDayViewWithSizeClass:(int64_t)a3 rightClickDelegate:(id)a4
{
  id v6 = a4;
  if (!self->_allDayView)
  {
    id v12 = v6;
    id v7 = [EKDayAllDayView alloc];
    [(EKDayView *)self bounds];
    double v8 = -[EKDayAllDayView initWithFrame:sizeClass:](v7, "initWithFrame:sizeClass:", a3);
    allDayView = self->_allDayView;
    self->_allDayView = v8;

    [(EKDayAllDayView *)self->_allDayView setDelegate:self];
    [(EKDayAllDayView *)self->_allDayView setAllowsOccurrenceSelection:self->_allowsOccurrenceSelection];
    [(EKDayAllDayView *)self->_allDayView setOrientation:self->_orientation];
    [(EKDayAllDayView *)self->_allDayView setShowsBorderLines:1];
    [(EKDayView *)self addSubview:self->_allDayView];
    id v6 = v12;
    if (v12)
    {
      double v10 = self->_allDayView;
      uint64_t v11 = [[EKUIRightClickEmptySpaceInteraction alloc] initWithDelegate:v12];
      [(EKDayAllDayView *)v10 addInteraction:v11];

      id v6 = v12;
    }
  }
}

- (void)setOrientation:(int64_t)a3
{
  [(EKDayView *)self bounds];
  if (v5 > 0.0 && v5 < EKUIWidthForWindowSizeParadigm(4)) {
    a3 = 4;
  }
  self->_orientation = a3;
  [(EKDayViewContent *)self->_dayContent setOrientation:a3];
  [(EKDayTimeView *)self->_timeView setOrientation:a3];
  [(EKDayAllDayView *)self->_allDayView setOrientation:a3];

  [(EKDayView *)self setNeedsLayout];
}

- (EKDayView)initWithFrame:(CGRect)a3 sizeClass:(int64_t)a4 orientation:(int64_t)a5 displayDate:(id)a6 backgroundColor:(id)a7 opaque:(BOOL)a8 scrollbarShowsInside:(BOOL)a9 isMiniPreviewInEventDetail:(BOOL)a10 rightClickDelegate:(id)a11
{
  BOOL v12 = a8;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v22 = a6;
  id v23 = a7;
  id v24 = a11;
  v74.receiver = self;
  v74.super_class = (Class)EKDayView;
  double v25 = -[EKDayView initWithFrame:](&v74, sel_initWithFrame_, x, y, width, height);
  double v26 = v25;
  if (v25)
  {
    id v73 = v22;
    [(EKDayView *)v25 setAutoresizingMask:18];
    [(EKDayView *)v26 setOpaque:v12];
    [(EKDayView *)v26 bounds];
    CGFloat v71 = v28;
    CGFloat v72 = v27;
    double v30 = v29;
    CGFloat v32 = v31;
    v26->_int outlineStyle = 0;
    v26->_scrollbarShowsInside = a9;
    v26->_allowsOccurrenceSelection = 1;
    v26->_isMiniPreviewInEventDetail = a10;
    objc_storeStrong((id *)&v26->_displayDate, a6);
    uint64_t v33 = CUIKCalendar();
    calendar = v26->_calendar;
    v26->_calendar = (NSCalendar *)v33;

    +[EKDayTimeView defaultHeightForSizeClass:a4 orientation:a5];
    double v36 = v35;
    if (EKUIHasFallbackSizingContext())
    {
      +[EKDayTimeView timeWidthForOrientation:a5 inViewHierarchy:v26];
      double v38 = v37;
    }
    else
    {
      double v38 = 100.0;
    }
    +[EKDayTimeView defaultHourScale];
    v26->_hourScale = v39;
    v26->_shouldEverShowTimeIndicators = 1;
    v26->_targetSizeClass = a4;
    [(EKDayView *)v26 setTodayScrollSecondBuffer:3600.0];
    [(EKDayView *)v26 bounds];
    double v41 = v40;
    double v43 = v42;
    double v45 = v44;
    double v47 = v46;
    [(EKDayView *)v26 scrollBarOffset];
    uint64_t v49 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1BE0]), "initWithFrame:", v41, v43, v48 + v45, v47);
    scroller = v26->_scroller;
    v26->_scroller = (UIScrollView *)v49;

    [(UIScrollView *)v26->_scroller setBackgroundColor:v23];
    [(UIScrollView *)v26->_scroller setOpaque:v12];
    [(UIScrollView *)v26->_scroller setAutoresizingMask:18];
    [(UIScrollView *)v26->_scroller setDelegate:v26];
    [(UIScrollView *)v26->_scroller setContentInsetAdjustmentBehavior:2];
    [(EKDayView *)v26 addSubview:v26->_scroller];
    v26->_allowPinchingHourHeights = 1;
    uint64_t v51 = [objc_alloc(MEMORY[0x1E4FB1AA0]) initWithTarget:v26 action:sel__dayViewPinched_];
    pinchGestureRecognizer = v26->_pinchGestureRecognizer;
    v26->_pinchGestureRecognizer = (UIPinchGestureRecognizer *)v51;

    [(UIScrollView *)v26->_scroller addGestureRecognizer:v26->_pinchGestureRecognizer];
    uint64_t v53 = [objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v26 action:sel__doubleTap_];
    doubleTapGestureRecognizer = v26->_doubleTapGestureRecognizer;
    v26->_doubleTapGestureRecognizer = (UITapGestureRecognizer *)v53;

    [(UITapGestureRecognizer *)v26->_doubleTapGestureRecognizer setNumberOfTapsRequired:2];
    [(UIScrollView *)v26->_scroller addGestureRecognizer:v26->_doubleTapGestureRecognizer];
    double v55 = -[EKDayTimeView initWithFrame:sizeClass:]([EKDayTimeView alloc], "initWithFrame:sizeClass:", a4, 0.0, 0.0, v38, v36);
    timeView = v26->_timeView;
    v26->_timeView = v55;

    [(EKDayTimeView *)v26->_timeView setContentMode:3];
    [(EKDayTimeView *)v26->_timeView setOpaque:v12];
    [(EKDayTimeView *)v26->_timeView setBackgroundColor:v23];
    [(EKDayTimeView *)v26->_timeView setDelegate:v26];
    [(UIScrollView *)v26->_scroller addSubview:v26->_timeView];
    v57 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v26 action:sel__timeViewTapped_];
    [(EKDayTimeView *)v26->_timeView addGestureRecognizer:v57];
    v58 = [EKDayViewContent alloc];
    v75.origin.double y = v71;
    v75.origin.double x = v72;
    v75.size.double width = v30;
    v75.size.double height = v32;
    double v59 = CGRectGetWidth(v75) - v38;
    if (v59 >= 0.0) {
      double v60 = v59;
    }
    else {
      double v60 = 0.0;
    }
    uint64_t v61 = -[EKDayViewContent initWithFrame:sizeClass:orientation:backgroundColor:opaque:isMiniPreviewInEventDetail:numberOfDaysToDisplay:](v58, "initWithFrame:sizeClass:orientation:backgroundColor:opaque:isMiniPreviewInEventDetail:numberOfDaysToDisplay:", a4, a5, v23, v12, v26->_isMiniPreviewInEventDetail, 1, v38, 0.0, v60, v36);
    dayContent = v26->_dayContent;
    v26->_dayContent = (EKDayViewContent *)v61;

    if (v24)
    {
      v63 = v26->_dayContent;
      double v64 = [[EKUIRightClickEmptySpaceInteraction alloc] initWithDelegate:v24];
      [(EKDayViewContent *)v63 addInteraction:v64];
    }
    [(EKDayViewContent *)v26->_dayContent setAutoresizingMask:2];
    CGFloat v65 = [(EKDayViewContent *)v26->_dayContent grid];
    [v65 setAnimatesTimeMarker:1];

    double v66 = [(EKDayViewContent *)v26->_dayContent grid];
    [v66 setShowsTimeMarker:0];

    [(EKDayViewContent *)v26->_dayContent setDelegate:v26];
    [(UIScrollView *)v26->_scroller addSubview:v26->_dayContent];
    -[UIScrollView setContentSize:](v26->_scroller, "setContentSize:", v30, v36);
    [(UIScrollView *)v26->_scroller setBounces:1];
    [(EKDayView *)v26 _createAllDayViewWithSizeClass:a4 rightClickDelegate:v24];
    [(EKDayView *)v26 setOrientation:a5];
    [(EKDayViewContent *)v26->_dayContent setStartDateWithDateComponents:v26->_displayDate];
    [(EKDayView *)v26 _adjustForDateOrCalendarChange];
    CGFloat v67 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v67 addObserver:v26 selector:sel__localeChanged name:*MEMORY[0x1E4F57AB0] object:0];
    [v67 addObserver:v26 selector:sel__updateContentForSizeCategoryChange_ name:*MEMORY[0x1E4FB27A8] object:0];
    dispatch_queue_t v68 = dispatch_queue_create("dayReload", 0);
    reloadQueue = v26->_reloadQueue;
    v26->_reloadQueue = (OS_dispatch_queue *)v68;

    id v22 = v73;
  }

  return v26;
}

- (void)setTodayScrollSecondBuffer:(double)a3
{
  self->_todayScrollSecondBuffer = a3;
}

- (void)setOpaque:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)EKDayView;
  -[EKDayView setOpaque:](&v6, sel_setOpaque_);
  [(UIScrollView *)self->_scroller setOpaque:v3];
  [(EKDayTimeView *)self->_timeView setOpaque:v3];
  if (v3) {
    [MEMORY[0x1E4FB1618] systemBackgroundColor];
  }
  else {
  double v5 = [MEMORY[0x1E4FB1618] clearColor];
  }
  [(EKDayView *)self setBackgroundColor:v5];
}

- (void)setBackgroundColor:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)EKDayView;
  id v4 = a3;
  [(EKDayView *)&v5 setBackgroundColor:v4];
  -[UIScrollView setBackgroundColor:](self->_scroller, "setBackgroundColor:", v4, v5.receiver, v5.super_class);
  [(EKDayTimeView *)self->_timeView setBackgroundColor:v4];
}

- (void)_adjustForDateOrCalendarChange
{
  self->_settingDate = 1;
  [(EKDayView *)self stopScrolling];
  id v18 = [(NSCalendar *)self->_calendar dateFromComponents:self->_displayDate];
  [v18 timeIntervalSinceReferenceDate];
  double v4 = v3;
  if (v3 != self->_dayStart)
  {
    objc_super v5 = (void *)[(NSDateComponents *)self->_displayDate copy];
    [v5 setHour:23];
    [v5 setMinute:59];
    [v5 setSecond:59];
    objc_super v6 = [(NSCalendar *)self->_calendar dateFromComponents:v5];
    self->_double dayStart = v4;
    [v6 timeIntervalSinceReferenceDate];
    self->_dayEnd = v7;
    double v8 = [(NSCalendar *)self->_calendar timeZone];
    double v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->_dayStart + -1.0];
    double v10 = [v8 nextDaylightSavingTimeTransitionAfterDate:v9];
    [v10 timeIntervalSinceReferenceDate];
    self->_nextDSTTransition = v11;

    [(EKDayViewContent *)self->_dayContent setStartDateWithDateComponents:self->_displayDate];
  }
  BOOL v12 = CUIKTodayComponents();
  NSInteger v13 = [(NSDateComponents *)self->_displayDate era];
  BOOL v17 = 0;
  if (v13 == [v12 era])
  {
    NSInteger v14 = [(NSDateComponents *)self->_displayDate year];
    if (v14 == [v12 year])
    {
      NSInteger v15 = [(NSDateComponents *)self->_displayDate month];
      if (v15 == [v12 month])
      {
        NSInteger v16 = [(NSDateComponents *)self->_displayDate day];
        if (v16 == [v12 day] && self->_shouldEverShowTimeIndicators) {
          BOOL v17 = 1;
        }
      }
    }
  }
  [(EKDayView *)self setShowsTimeLine:v17];
  [(EKDayView *)self setShowsTimeMarker:v17];
  [(EKDayTimeView *)self->_timeView setNeedsDisplay];
  self->_settingDate = 0;
}

- (void)_invalidateMarkerTimer
{
  [(NSTimer *)self->_timeMarkerTimer invalidate];
  timeMarkerTimer = self->_timeMarkerTimer;
  self->_timeMarkerTimer = 0;
}

- (void)stopScrolling
{
  scroller = self->_scroller;
  [(UIScrollView *)scroller contentOffset];

  -[UIScrollView setContentOffset:animated:](scroller, "setContentOffset:animated:", 0);
}

- (void)setShowsTimeMarker:(BOOL)a3
{
  BOOL v3 = a3;
  -[EKDayTimeView setShowsTimeMarker:](self->_timeView, "setShowsTimeMarker:");
  objc_super v5 = [(EKDayViewContent *)self->_dayContent grid];
  [v5 setShowsTimeMarker:v3];

  if (v3
    && ([(EKDayView *)self superview], objc_super v6 = objc_claimAutoreleasedReturnValue(),
                                                   v6,
                                                   v6))
  {
    [(EKDayView *)self _startMarkerTimer];
  }
  else
  {
    [(EKDayView *)self _invalidateMarkerTimer];
  }
}

- (void)setShowsTimeLine:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(EKDayViewContent *)self->_dayContent grid];
  [v4 setShowsTimeLine:v3];
}

- (void)setDimmedOccurrence:(id)a3
{
  allDayView = self->_allDayView;
  id v5 = a3;
  [(EKDayAllDayView *)allDayView setDimmedOccurrence:v5];
  [(EKDayViewContent *)self->_dayContent setDimmedOccurrence:v5];
}

void __37__EKDayView_loadData_withCompletion___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56)) {
    [*(id *)(*(void *)(a1 + 32) + 504) loadAndLayoutOccurrences:*(void *)(*(void *)(a1 + 32) + 472) reverse:0];
  }
  [*(id *)(*(void *)(a1 + 32) + 496) setOccurrences:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 504) movePreloadedItemsToVisible];
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(v2 + 504);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__EKDayView_loadData_withCompletion___block_invoke_3;
  v4[3] = &unk_1E6089748;
  v4[4] = v2;
  char v6 = *(unsigned char *)(a1 + 57);
  id v5 = *(id *)(a1 + 48);
  char v7 = *(unsigned char *)(a1 + 56);
  [v3 applyLoadedOccurrencesWithBatching:0 animated:0 reverse:0 completion:v4];
}

void __37__EKDayView_loadData_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 48))
  {
    [*(id *)(*(void *)(a1 + 32) + 504) saveTemporaryViews];
    BOOL v2 = *(unsigned char *)(v1 + 48) != 0;
  }
  else
  {
    BOOL v2 = 0;
  }
  [*(id *)(*(void *)(v1 + 32) + 504) prepareForReuseIsReload:v2];
  BOOL v3 = (void *)MEMORY[0x1E4F57838];
  uint64_t v4 = *(void *)(v1 + 32);
  double v5 = *(double *)(v4 + 416);
  char v6 = [*(id *)(v4 + 680) timeZone];
  char v7 = [v3 calendarDateWithAbsoluteTime:v6 timeZone:v5];

  double v8 = (void *)MEMORY[0x1E4F57838];
  uint64_t v9 = *(void *)(v1 + 32);
  double v10 = *(double *)(v9 + 424);
  double v11 = [*(id *)(v9 + 680) timeZone];
  BOOL v12 = [v8 calendarDateWithAbsoluteTime:v11 timeZone:v10];

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(v1 + 32) + 648));
  NSInteger v14 = [WeakRetained dayView:*(void *)(v1 + 32) eventsForStartDate:v7 endDate:v12];

  uint64_t v15 = [v14 timedOccurrences];
  uint64_t v16 = *(void *)(v1 + 32);
  BOOL v17 = *(void **)(v16 + 472);
  *(void *)(v16 + 472) = v15;

  char v18 = [*(id *)(v1 + 32) _viewContentShouldDrawSynchronously];
  if ((v18 & 1) == 0) {
    [*(id *)(*(void *)(v1 + 32) + 504) loadAndLayoutOccurrences:*(void *)(*(void *)(v1 + 32) + 472) reverse:0];
  }
  double v19 = [v14 allDayOccurrences];
  uint64_t v20 = [v19 count];
  if (v20)
  {
    uint64_t v21 = v20;
    char v37 = v18;
    double v39 = v14;
    double v40 = v12;
    double v41 = v7;
    uint64_t v42 = v1;
    id v22 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v20];
    id v23 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v21];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    double v38 = v19;
    id obj = v19;
    uint64_t v24 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v50;
      do
      {
        uint64_t v27 = 0;
        do
        {
          if (*(void *)v50 != v26) {
            objc_enumerationMutation(obj);
          }
          double v28 = *(void **)(*((void *)&v49 + 1) + 8 * v27);
          double v29 = CUIKCalendar();
          double v30 = [v28 startDate];
          double v31 = [v28 endDate];
          int v32 = [v29 isDate:v30 inSameDayAsDate:v31];

          if (v32) {
            uint64_t v33 = v23;
          }
          else {
            uint64_t v33 = v22;
          }
          [v33 addObject:v28];
          ++v27;
        }
        while (v25 != v27);
        uint64_t v25 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
      }
      while (v25);
    }

    double v34 = [v22 arrayByAddingObjectsFromArray:v23];

    char v7 = v41;
    uint64_t v1 = v42;
    NSInteger v14 = v39;
    BOOL v12 = v40;
    double v19 = v38;
    char v18 = v37;
  }
  else
  {
    double v34 = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__EKDayView_loadData_withCompletion___block_invoke_2;
  block[3] = &unk_1E6089770;
  char v47 = v18;
  double v35 = *(void **)(v1 + 40);
  block[4] = *(void *)(v1 + 32);
  id v45 = v34;
  char v48 = *(unsigned char *)(v1 + 48);
  id v46 = v35;
  id v36 = v34;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (BOOL)_viewContentShouldDrawSynchronously
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    return 0;
  }
  id v6 = objc_loadWeakRetained((id *)p_delegate);
  char v7 = [v6 dayViewShouldDrawSynchronously:self];

  return v7;
}

void __37__EKDayView_loadData_withCompletion___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 640));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 640));
    [v4 dayViewDidCompleteAsyncLoadAndLayout:*(void *)(a1 + 32)];
  }
}

- (double)dayEnd
{
  return self->_dayEnd;
}

- (double)dayStart
{
  return self->_dayStart;
}

- (void)scrollToNowAnimated:(BOOL)a3 whenFinished:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  CUIKNowDate();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(EKDayView *)self scrollToDate:v7 animated:v4 whenFinished:v6];
}

- (void)scrollToDate:(id)a3 offset:(double)a4 animated:(BOOL)a5 whenFinished:(id)a6
{
  BOOL v6 = a5;
  id v12 = a6;
  [a3 timeIntervalSinceReferenceDate];
  double dayStart = self->_dayStart;
  if (v10 >= dayStart && v10 <= self->_dayEnd) {
    [(EKDayView *)self _scrollToSecond:(int)(v10 - dayStart) offset:v6 animated:v12 whenFinished:a4];
  }
}

- (void)scrollToDate:(id)a3 animated:(BOOL)a4 whenFinished:(id)a5
{
}

- (void)_scrollToSecond:(int)a3 offset:(double)a4 animated:(BOOL)a5 whenFinished:(id)a6
{
  BOOL v6 = a5;
  double v10 = (void (**)(void))a6;
  [(EKDayView *)self layoutIfNeeded];
  [(UIScrollView *)self->_scroller bounds];
  double v12 = v11;
  [(UIScrollView *)self->_scroller contentSize];
  double v14 = v13;
  [(EKDayView *)self todayScrollSecondBuffer];
  double v16 = (double)a3 - v15;
  double v17 = 0.0;
  int v18 = (int)fmax(v16, 0.0);
  if (v18)
  {
    if (v18 < 86399) {
      -[EKDayView _positionOfSecond:](self, "_positionOfSecond:");
    }
    else {
      double v17 = v14 - v12;
    }
  }
  double v19 = v17 + a4;
  double v20 = v14 - v12;
  [(UIScrollView *)self->_scroller contentInset];
  if (v19 >= v20 + v21) {
    double v19 = v20 + v21;
  }
  if (v6)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__EKDayView__scrollToSecond_offset_animated_whenFinished___block_invoke;
    aBlock[3] = &unk_1E6087B68;
    uint64_t v25 = v10;
    id v22 = _Block_copy(aBlock);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __58__EKDayView__scrollToSecond_offset_animated_whenFinished___block_invoke_2;
    v23[3] = &unk_1E6089720;
    v23[4] = self;
    v23[5] = 0;
    *(double *)&v23[6] = v19;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v23 animations:v22 completion:0.4];
  }
  else
  {
    -[UIScrollView setContentOffset:](self->_scroller, "setContentOffset:", 0.0, v19);
    if (v10) {
      v10[2](v10);
    }
  }
  [(EKDayView *)self firstVisibleSecondChanged];
}

- (void)firstVisibleSecondChanged
{
  if (!self->_settingDate)
  {
    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      char v5 = WeakRetained;
      id v6 = objc_loadWeakRetained((id *)p_delegate);
      char v7 = objc_opt_respondsToSelector();

      if (v7)
      {
        id v8 = objc_loadWeakRetained((id *)p_delegate);
        objc_msgSend(v8, "dayView:firstVisibleSecondChanged:", self, -[EKDayView firstVisibleSecond](self, "firstVisibleSecond"));
      }
    }
  }
}

- (double)todayScrollSecondBuffer
{
  return self->_todayScrollSecondBuffer;
}

- (double)_positionOfSecond:(int)a3
{
  char v5 = [(EKDayViewContent *)self->_dayContent grid];
  [v5 positionOfSecond:a3];
  double v7 = v6;

  [(EKDayView *)self _verticalOffset];
  return v7 - v8;
}

- (void)loadData:(BOOL)a3 withCompletion:(id)a4
{
  id v6 = a4;
  reloadQueue = self->_reloadQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__EKDayView_loadData_withCompletion___block_invoke;
  block[3] = &unk_1E6089798;
  BOOL v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(reloadQueue, block);
}

- (NSString)description
{
  char v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)EKDayView;
  BOOL v4 = [(EKDayView *)&v7 description];
  char v5 = [v3 stringWithFormat:@"%@; _displayDate: [%@]", v4, self->_displayDate];

  return (NSString *)v5;
}

- (void)_localeChanged
{
  char v3 = CUIKCalendar();
  [(EKDayView *)self setCalendar:v3];

  [(EKDayView *)self _adjustForDateOrCalendarChange];

  [(EKDayView *)self setNeedsLayout];
}

- (void)removeFromSuperview
{
  [(EKDayView *)self _invalidateMarkerTimer];
  v3.receiver = self;
  v3.super_class = (Class)EKDayView;
  [(EKDayView *)&v3 removeFromSuperview];
}

- (void)dealloc
{
  objc_super v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(EKDayView *)self _disposeAllDayView];
  [(UIScrollView *)self->_scroller setDelegate:0];
  [(EKDayView *)self _invalidateMarkerTimer];
  v4.receiver = self;
  v4.super_class = (Class)EKDayView;
  [(EKDayView *)&v4 dealloc];
}

- (void)adjustFrameToSpanToMidnightFromStartDate:(id)a3
{
  id v4 = a3;
  CUIKCalendar();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  char v5 = [v9 components:32 fromDate:v4];

  uint64_t v6 = [v5 hour];
  double v7 = 24.0 - (double)[v5 hour] + 1.0 + 0.15;
  +[EKDayTimeView hourHeightForSizeClass:[(EKDayView *)self _sizeClass] orientation:self->_orientation];
  if (v7 >= 24.0)
  {
    [(EKDayTimeView *)self->_timeView defaultHeight];
    double v8 = 0.0;
  }
  else
  {
    double v8 = ((double)v6 + -0.15) * 3600.0;
  }
  [(EKDayView *)self frame];
  -[EKDayView setFrame:](self, "setFrame:");
  [(EKDayView *)self setFirstVisibleSecond:(int)v8];
}

- (void)updateMarkerPosition
{
  objc_super v3 = [(EKDayView *)self window];

  if (v3)
  {
    id v4 = [(EKDayViewContent *)self->_dayContent grid];
    [v4 updateMarkerPosition];

    timeView = self->_timeView;
    [(EKDayTimeView *)timeView updateMarkerPosition];
  }
}

- (void)setDisplayDate:(id)a3
{
  id v8 = a3;
  if (([v8 isEqual:self->_displayDate] & 1) == 0)
  {
    id v4 = [v8 dateComponentsForDateOnly];
    displayDate = self->_displayDate;
    self->_displayDate = v4;

    [(EKDayView *)self _adjustForDateOrCalendarChange];
    uint64_t v6 = [(EKDayView *)self displayDateDidChangeCallback];

    if (v6)
    {
      double v7 = [(EKDayView *)self displayDateDidChangeCallback];
      ((void (**)(void, NSDateComponents *))v7)[2](v7, self->_displayDate);
    }
  }
}

- (void)setShouldEverShowTimeIndicators:(BOOL)a3
{
  self->_shouldEverShowTimeIndicators = a3;
  if (!a3)
  {
    [(EKDayView *)self setShowsTimeLine:0];
    [(EKDayView *)self setShowsTimeMarker:0];
  }
}

- (void)adjustForTimeZoneChanged
{
  CUIKCalendar();
  objc_super v3 = (NSCalendar *)objc_claimAutoreleasedReturnValue();
  calendar = self->_calendar;
  self->_calendar = v3;

  id v5 = [(NSCalendar *)self->_calendar timeZone];
  [(EKDayView *)self _adjustForDateOrCalendarChange];
  [(EKDayViewContent *)self->_dayContent setTimeZone:v5];
  [(EKDayView *)self setNeedsLayout];
}

- (void)setShowsTimeLabel:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(EKDayViewContent *)self->_dayContent grid];
  id v4 = [v5 timeMarker];
  [v4 setShowsThumb:v3];
}

- (BOOL)showsTimeLabel
{
  BOOL v2 = [(EKDayViewContent *)self->_dayContent grid];
  BOOL v3 = [v2 timeMarker];
  char v4 = [v3 showsThumb];

  return v4;
}

- (void)setAnimatesTimeMarker:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(EKDayViewContent *)self->_dayContent grid];
  [v4 setAnimatesTimeMarker:v3];
}

- (BOOL)animatesTimeMarker
{
  BOOL v2 = [(EKDayViewContent *)self->_dayContent grid];
  char v3 = [v2 animatesTimeMarker];

  return v3;
}

- (void)setEventsFillGrid:(BOOL)a3
{
}

- (BOOL)eventsFillGrid
{
  return [(EKDayViewContent *)self->_dayContent eventsFillGrid];
}

- (void)setShowsLeftBorder:(BOOL)a3
{
}

- (BOOL)showsLeftBorder
{
  return [(EKDayViewContent *)self->_dayContent showsLeftBorder];
}

- (void)setOutlineStyle:(int)a3
{
  if (self->_outlineStyle != a3)
  {
    self->_int outlineStyle = a3;
    if (a3)
    {
      if (!self->_bottomLine)
      {
        id v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
        bottomLine = self->_bottomLine;
        self->_bottomLine = v4;

        uint64_t v6 = self->_bottomLine;
        double v7 = [MEMORY[0x1E4FB1618] separatorColor];
        [(UIView *)v6 setBackgroundColor:v7];

        [(EKDayView *)self addSubview:self->_bottomLine];
      }
      id v8 = [(EKDayViewContent *)self->_dayContent grid];
      [v8 setShowsRightBorder:1];

      [(EKDayView *)self setShowsLeftBorder:1];
      [(EKDayTimeView *)self->_timeView setShowsLeftBorder:self->_outlineStyle == 1];
    }
    else
    {
      [(EKDayView *)self setContentMode:0];
      id v9 = [(EKDayViewContent *)self->_dayContent grid];
      [v9 setShowsRightBorder:0];

      [(UIView *)self->_bottomLine removeFromSuperview];
    }
    [(EKDayView *)self needsDisplay];
  }
}

- (BOOL)allowsScrolling
{
  return [(UIScrollView *)self->_scroller isScrollEnabled];
}

- (void)setAllowsScrolling:(BOOL)a3
{
}

- (UIColor)timeViewTextColor
{
  return [(EKDayTimeView *)self->_timeView timeColor];
}

- (void)setTimeViewTextColor:(id)a3
{
}

- (_NSRange)hoursToRender
{
  NSUInteger v2 = [(EKDayTimeView *)self->_timeView hoursToRender];
  result.length = v3;
  result.location = v2;
  return result;
}

- (void)setHoursToRender:(_NSRange)a3
{
}

- (UIColor)gridLineColor
{
  NSUInteger v2 = [(EKDayViewContent *)self->_dayContent grid];
  NSUInteger v3 = [v2 lineColor];

  return (UIColor *)v3;
}

- (void)setGridLineColor:(id)a3
{
  dayContent = self->_dayContent;
  id v4 = a3;
  id v5 = [(EKDayViewContent *)dayContent grid];
  [v5 setLineColor:v4];
}

- (UIVisualEffect)gridVisualEffect
{
  NSUInteger v2 = [(EKDayViewContent *)self->_dayContent grid];
  NSUInteger v3 = [v2 gridVisualEffect];

  return (UIVisualEffect *)v3;
}

- (void)setGridVisualEffect:(id)a3
{
  dayContent = self->_dayContent;
  id v4 = a3;
  id v5 = [(EKDayViewContent *)dayContent grid];
  [v5 setGridVisualEffect:v4];
}

- (UIVisualEffect)timeViewVisualEffect
{
  return [(EKDayTimeView *)self->_timeView visualEffect];
}

- (void)setTimeViewVisualEffect:(id)a3
{
}

- (UIColor)occurrenceTitleColor
{
  return [(EKDayViewContent *)self->_dayContent occurrenceTitleColor];
}

- (void)setOccurrenceTitleColor:(id)a3
{
}

- (UIColor)occurrenceTimeColor
{
  return [(EKDayViewContent *)self->_dayContent occurrenceTimeColor];
}

- (void)setOccurrenceTimeColor:(id)a3
{
}

- (UIColor)occurrenceLocationColor
{
  return [(EKDayViewContent *)self->_dayContent occurrenceLocationColor];
}

- (void)setOccurrenceLocationColor:(id)a3
{
}

- (UIColor)occurrenceTextBackgroundColor
{
  return [(EKDayViewContent *)self->_dayContent occurrenceTextBackgroundColor];
}

- (void)setOccurrenceTextBackgroundColor:(id)a3
{
}

- (void)setAllowPinchingHourHeights:(BOOL)a3
{
  if (self->_allowPinchingHourHeights != a3)
  {
    self->_allowPinchingHourHeights = a3;
    scroller = self->_scroller;
    if (a3)
    {
      [(UIScrollView *)scroller addGestureRecognizer:self->_pinchGestureRecognizer];
      id v5 = self->_scroller;
      doubleTapGestureRecognizer = self->_doubleTapGestureRecognizer;
      [(UIScrollView *)v5 addGestureRecognizer:doubleTapGestureRecognizer];
    }
    else
    {
      [(UIScrollView *)scroller removeGestureRecognizer:self->_pinchGestureRecognizer];
      double v7 = self->_scroller;
      id v8 = self->_doubleTapGestureRecognizer;
      [(UIScrollView *)v7 removeGestureRecognizer:v8];
    }
  }
}

- (EKDayAllDayView)allDayView
{
  return self->_allDayView;
}

- (EKDayViewContent)dayContent
{
  return self->_dayContent;
}

- (EKDayTimeView)timeView
{
  return self->_timeView;
}

- (double)scrollOffset
{
  [(UIScrollView *)self->_scroller contentOffset];
  double v4 = v3;
  [(EKDayView *)self _verticalOffset];
  double v6 = v4 - v5;
  [(UIScrollView *)self->_scroller frame];
  return v6 - v7;
}

- (CGPoint)normalizedContentOffset
{
  [(UIScrollView *)self->_scroller contentOffset];
  double v4 = v3;
  double v6 = v5;
  [(UIScrollView *)self->_scroller contentSize];
  double v8 = v6 / v7;
  double v9 = v4;
  result.double y = v8;
  result.double x = v9;
  return result;
}

- (void)setNormalizedContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(UIScrollView *)self->_scroller contentSize];
  double v7 = y * v6;
  [(EKDayView *)self _verticalOffset];
  double v9 = v8;
  [(UIScrollView *)self->_scroller frame];
  double v11 = v7 + v9 + v10;
  scroller = self->_scroller;

  -[UIScrollView setContentOffset:animated:](scroller, "setContentOffset:animated:", 0, x, v11);
}

- (id)verticalScrollView
{
  return self->_scroller;
}

- (void)scrollToEvent:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  double v10 = [(EKDayViewContent *)self->_dayContent occurrenceViewForEvent:v8];
  double v11 = v10;
  if (v10)
  {
    [v10 frame];
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __52__EKDayView_scrollToEvent_animated_completionBlock___block_invoke;
    aBlock[3] = &unk_1E6087B68;
    id v42 = v9;
    double v20 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
    if (([v8 isAllDay] & 1) == 0)
    {
      scroller = self->_scroller;
      [v11 frame];
      double v23 = v22;
      double v25 = v24;
      double v27 = v26;
      double v29 = v28;
      double v30 = [v11 superview];
      -[UIScrollView convertRect:fromView:](scroller, "convertRect:fromView:", v30, v23, v25, v27, v29);
      CGFloat v13 = v31;
      CGFloat v17 = v32;
      CGFloat v19 = v33;

      double v34 = (void *)MEMORY[0x1E4F57838];
      double v35 = [v8 startDate];
      id v36 = [(NSCalendar *)self->_calendar timeZone];
      char v37 = [v34 calendarDateWithDate:v35 timeZone:v36];

      -[EKDayView _positionOfSecond:](self, "_positionOfSecond:", 3600 * [v37 hour]+ 60 * objc_msgSend(v37, "minute")+ objc_msgSend(v37, "second"));
      CGFloat v15 = v38;
    }
    v43.origin.double x = v13;
    v43.origin.double y = v15;
    v43.size.double width = v17;
    v43.size.double height = v19;
    CGRect v44 = CGRectInset(v43, 0.0, -20.0);
    if (v6)
    {
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __52__EKDayView_scrollToEvent_animated_completionBlock___block_invoke_2;
      v39[3] = &unk_1E60896F8;
      v39[4] = self;
      CGRect v40 = v44;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v39 animations:v20 completion:0.4];
    }
    else
    {
      -[UIScrollView scrollRectToVisible:animated:](self->_scroller, "scrollRectToVisible:animated:", 0, v44.origin.x, v44.origin.y, v44.size.width, v44.size.height);
      v20[2](v20, 1);
    }
  }
  [(EKDayView *)self firstVisibleSecondChanged];
}

uint64_t __52__EKDayView_scrollToEvent_animated_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __52__EKDayView_scrollToEvent_animated_completionBlock___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 520), "scrollRectToVisible:animated:", 0, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)_scrollToSecond:(int)a3 animated:(BOOL)a4 whenFinished:(id)a5
{
}

uint64_t __58__EKDayView__scrollToSecond_offset_animated_whenFinished___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __58__EKDayView__scrollToSecond_offset_animated_whenFinished___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 520), "setContentOffset:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (id)presentationControllerForEditMenu
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v3 = [WeakRetained presentationControllerForEditMenu];

  return v3;
}

- (id)selectedEventsForEditMenu
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v3 = [WeakRetained selectedEventsForEditMenu];

  return v3;
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

- (NSArray)occurrenceViews
{
  return (NSArray *)[(EKDayViewContent *)self->_dayContent occurrenceViews];
}

- (NSArray)allOccurrenceViews
{
  double v3 = [MEMORY[0x1E4F1CA48] array];
  char v4 = [(EKDayAllDayView *)self->_allDayView occurrenceViews];
  [v3 addObjectsFromArray:v4];

  id v5 = [(EKDayViewContent *)self->_dayContent occurrenceViews];
  [v3 addObjectsFromArray:v5];

  BOOL v6 = (void *)[v3 copy];

  return (NSArray *)v6;
}

- (void)bringEventToFront:(id)a3
{
  id v6 = a3;
  char v4 = -[EKDayView occurrenceViewForEvent:](self, "occurrenceViewForEvent:");
  if (v4
    || ([(EKDayViewContent *)self->_dayContent occurrenceViewForEvent:v6],
        (char v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v5 = [v4 superview];
    [v5 bringSubviewToFront:v4];
  }
}

- (void)insertViewForEvent:(id)a3 belowViewForOtherEvent:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  double v7 = [(EKDayView *)self occurrenceViewForEvent:v16];
  uint64_t v8 = [(EKDayView *)self occurrenceViewForEvent:v6];
  id v9 = (void *)v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    double v7 = [(EKDayViewContent *)self->_dayContent occurrenceViewForEvent:v16];
    if (v9)
    {
LABEL_3:
      if (!v7) {
        goto LABEL_14;
      }
      goto LABEL_7;
    }
  }
  id v9 = [(EKDayViewContent *)self->_dayContent occurrenceViewForEvent:v6];
  if (!v7) {
    goto LABEL_14;
  }
LABEL_7:
  if (v9)
  {
    double v10 = [v7 superview];
    double v11 = v10;
    double v12 = v7;
    CGFloat v13 = v9;
  }
  else
  {
    int v14 = [v16 isAllDay];
    double v10 = [v7 superview];
    double v11 = v10;
    if (v14) {
      uint64_t v15 = 496;
    }
    else {
      uint64_t v15 = 504;
    }
    CGFloat v13 = *(Class *)((char *)&self->super.super.super.isa + v15);
    double v12 = v7;
  }
  [v10 insertSubview:v12 aboveSubview:v13];

LABEL_14:
}

- (void)setTopContentInset:(double)a3
{
  self->_topContentInset = a3;
  [(UIScrollView *)self->_scroller contentInset];
  scroller = self->_scroller;
  double v7 = v6 + a3;

  [(UIScrollView *)scroller setContentInset:v7];
}

- (void)setBottomContentInset:(double)a3
{
  self->_bottomContentInset = a3;
  [(UIScrollView *)self->_scroller contentInset];
  scroller = self->_scroller;

  -[UIScrollView setContentInset:](scroller, "setContentInset:");
}

- (double)leftContentInset
{
  if (CalInterfaceIsLeftToRight())
  {
    [(EKDayViewContent *)self->_dayContent frame];
    double v4 = v3;
  }
  else
  {
    [(EKDayView *)self bounds];
    double Width = CGRectGetWidth(v8);
    [(EKDayViewContent *)self->_dayContent frame];
    double v4 = Width - CGRectGetMaxX(v9);
  }
  +[EKDayOccurrenceView barToBarGapWidth];
  return v4 + v6;
}

- (void)setAlignsMidnightToTop:(BOOL)a3
{
  if (self->_alignsMidnightToTop != a3)
  {
    self->_alignsMidnightToTop = a3;
    [(EKDayView *)self setNeedsLayout];
  }
}

- (void)setShowOnlyAllDayArea:(BOOL)a3
{
  if (self->_showOnlyAllDayArea != a3)
  {
    self->_showOnlyAllDayArea = a3;
    -[UIScrollView setHidden:](self->_scroller, "setHidden:");
    BOOL v4 = !self->_showOnlyAllDayArea;
    allDayView = self->_allDayView;
    [(EKDayAllDayView *)allDayView setShowsBorderLines:v4];
  }
}

- (void)_clearVerticalGridExtensionImageCache
{
  NSUInteger v2 = (void *)__verticalGridExtensionImageCache;
  __verticalGridExtensionImageCache = 0;
}

- (BOOL)eventOccursOnThisDay:(id)a3
{
  if (!a3) {
    return 0;
  }
  double v3 = -[EKDayView occurrenceViewForEvent:](self, "occurrenceViewForEvent:");
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)occurrenceViewForEvent:(id)a3
{
  id v4 = a3;
  int v5 = [v4 isAllDay];
  double v6 = &OBJC_IVAR___EKDayView__dayContent;
  if (v5) {
    double v6 = &OBJC_IVAR___EKDayView__allDayView;
  }
  double v7 = [*(id *)((char *)&self->super.super.super.isa + *v6) occurrenceViewForEvent:v4];

  return v7;
}

- (double)yPositionPerhapsMatchingAllDayOccurrence:(id)a3
{
  id v4 = [(EKDayView *)self occurrenceViewForEvent:a3];
  int v5 = v4;
  if (v4 && [(EKDayAllDayView *)v4 isAllDay])
  {
    [(EKDayAllDayView *)v5 bounds];
    CGRect v8 = self;
    CGRect v9 = v5;
  }
  else
  {
    allDayView = self->_allDayView;
    if (!allDayView)
    {
      double v13 = 0.0;
      goto LABEL_8;
    }
    [(EKDayAllDayView *)allDayView nextAvailableOccurrenceViewYOrigin];
    double v7 = v11;
    CGRect v9 = self->_allDayView;
    double v6 = 0.0;
    CGRect v8 = self;
  }
  -[EKDayView convertPoint:fromView:](v8, "convertPoint:fromView:", v9, v6, v7);
  double v13 = v12;
LABEL_8:

  return v13;
}

- (CGRect)rectForEvent:(id)a3
{
  id v4 = [(EKDayView *)self occurrenceViewForEvent:a3];
  int v5 = v4;
  if (v4)
  {
    [v4 bounds];
    -[EKDayView convertRect:fromView:](self, "convertRect:fromView:", v5);
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    double v7 = *MEMORY[0x1E4F1DB28];
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (void)selectEvent:(id)a3
{
  id v9 = a3;
  id v4 = [(EKDayView *)self selectedEvent];
  int v5 = v4;
  if (v4 != v9)
  {
    if (!v9 || (int v6 = [v4 isAllDay], v6 != objc_msgSend(v9, "isAllDay")))
    {
      if ([v5 isAllDay])
      {
        allDayView = self->_allDayView;
        if (!allDayView) {
          goto LABEL_9;
        }
      }
      else
      {
        allDayView = self->_dayContent;
      }
      [allDayView selectEvent:0];
    }
LABEL_9:
    if ([v9 isAllDay])
    {
      dayContent = self->_allDayView;
      if (!dayContent) {
        goto LABEL_14;
      }
    }
    else
    {
      dayContent = self->_dayContent;
    }
    [dayContent selectEvent:v9];
  }
LABEL_14:
}

- (id)selectedEvent
{
  double v3 = [(EKDayViewContent *)self->_dayContent selectedEvent];
  if (!v3)
  {
    double v3 = [(EKDayAllDayView *)self->_allDayView selectedEvent];
  }

  return v3;
}

- (EKEvent)dimmedOccurrence
{
  double v3 = [(EKDayAllDayView *)self->_allDayView dimmedOccurrence];
  if (!v3)
  {
    double v3 = [(EKDayViewContent *)self->_dayContent dimmedOccurrence];
  }

  return (EKEvent *)v3;
}

- (BOOL)containsOccurrences
{
  double v3 = [(EKDayAllDayView *)self->_allDayView occurrenceViews];
  uint64_t v4 = [v3 count];

  if (v4 > 0) {
    return 1;
  }
  dayContent = self->_dayContent;

  return [(EKDayViewContent *)dayContent containsVisibleOccurrenceViews];
}

- (void)_notifyDelegateOfFinishedScrollingToOccurrence
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    int v5 = WeakRetained;
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)p_delegate);
      [v8 dayViewDidFinishScrollingToOccurrence:self];
    }
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  self->_userScrolling = 1;
  [(EKDayView *)self _scrollViewWillBeginDragging:a3];
}

- (void)_scrollViewWillBeginDragging:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(EKDayView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(EKDayView *)self delegate];
    [v6 dayView:self scrollViewWillBeginDragging:v7];
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4 && self->_userScrolling)
  {
    [(EKDayView *)self firstVisibleSecondChanged];
    self->_userScrolling = 0;
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  if (self->_userScrolling)
  {
    [(EKDayView *)self firstVisibleSecondChanged];
    self->_userScrolling = 0;
  }
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  if (self->_scrollingToOccurrence)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained dayViewDidFinishScrollingToOccurrence:self];

    self->_scrollingToOccurrence = 0;
  }
}

- (void)_updateContentForSizeCategoryChange:(id)a3
{
  [(EKDayAllDayView *)self->_allDayView updateLabelFont];
  uint64_t v4 = [(EKDayTimeView *)self->_timeView timeMarker];
  [v4 invalidateFonts];

  char v5 = [(EKDayViewContent *)self->_dayContent grid];
  id v6 = [v5 timeMarker];
  [v6 invalidateFonts];

  +[EKDayTimeView defaultHourScale];
  -[EKDayView setHourScale:](self, "setHourScale:");
  [(EKDayView *)self reloadData];
  [(EKDayView *)self setNeedsLayout];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v9 dayView:self didScaleDayViewWithScale:self->_hourScale];
  }
}

- (void)_disposeAllDayView
{
  allDayView = self->_allDayView;
  if (allDayView)
  {
    [(EKDayAllDayView *)allDayView removeFromSuperview];
    uint64_t v4 = self->_allDayView;
    self->_allDayView = 0;
  }
}

- (void)scrollEventsIntoViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(EKDayView *)self layoutIfNeeded];
  if ([(EKDayView *)self scrollEventsInToViewIgnoresVisibility]
    || (dayContent = self->_dayContent,
        [(EKDayView *)self bounds],
        -[EKDayView convertRect:toView:](self, "convertRect:toView:", self->_dayContent),
        !-[EKDayViewContent eventsIntersectRect:](dayContent, "eventsIntersectRect:")))
  {
    [(EKDayView *)self setScrollEventsInToViewIgnoresVisibility:0];
    [(EKDayViewContent *)self->_dayContent firstEventSecond];
    if (v6 == -1.0)
    {
      self->_scrollToOccurrencesOnNextReload = 1;
    }
    else
    {
      [(EKDayView *)self _scrollToSecond:(int)v6 animated:v3 whenFinished:0];
    }
  }
}

- (void)setScrollerYInset:(double)a3 keepingYPointVisible:(double)a4
{
  [(UIScrollView *)self->_scroller frame];
  double MaxY = CGRectGetMaxY(v13);
  if (a3 + a4 > MaxY)
  {
    [(UIScrollView *)self->_scroller contentInset];
    double v9 = v8 - a3;
    scroller = self->_scroller;
    [(UIScrollView *)scroller contentOffset];
    -[UIScrollView setContentOffset:animated:](scroller, "setContentOffset:animated:", 1, 0.0, v11 - v9 - MaxY + a4);
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__EKDayView_setScrollerYInset_keepingYPointVisible___block_invoke;
  v12[3] = &unk_1E6087E70;
  v12[4] = self;
  *(double *)&v12[5] = a3;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v12 animations:0.3];
}

uint64_t __52__EKDayView_setScrollerYInset_keepingYPointVisible___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 520) contentInset];
  NSUInteger v2 = *(void **)(*(void *)(a1 + 32) + 520);

  return objc_msgSend(v2, "setContentInset:");
}

- (void)relayoutExistingTimedOccurrences
{
}

- (void)reloadData
{
}

- (void)reloadDataSynchronously
{
  BOOL v3 = (void *)MEMORY[0x1E4F57838];
  double dayStart = self->_dayStart;
  char v5 = [(NSCalendar *)self->_calendar timeZone];
  id v18 = [v3 calendarDateWithAbsoluteTime:v5 timeZone:dayStart];

  double v6 = (void *)MEMORY[0x1E4F57838];
  double dayEnd = self->_dayEnd;
  double v8 = [(NSCalendar *)self->_calendar timeZone];
  double v9 = [v6 calendarDateWithAbsoluteTime:v8 timeZone:dayEnd];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  double v11 = [WeakRetained dayView:self eventsForStartDate:v18 endDate:v9];

  double v12 = [v11 allDayOccurrences];
  uint64_t v13 = [v12 count];

  allDayView = self->_allDayView;
  if (v13)
  {
    double v15 = [v11 allDayOccurrences];
    [(EKDayAllDayView *)allDayView setOccurrences:v15];
  }
  else
  {
    [(EKDayAllDayView *)self->_allDayView setOccurrences:0];
  }
  double v16 = [v11 timedOccurrences];
  existingTimedOcurrences = self->_existingTimedOcurrences;
  self->_existingTimedOcurrences = v16;

  [(EKDayViewContent *)self->_dayContent setOccurrences:self->_existingTimedOcurrences];
  [(EKDayView *)self setNeedsLayout];
  [(EKDayView *)self layoutIfNeeded];
  if (self->_scrollToOccurrencesOnNextReload)
  {
    [(EKDayView *)self scrollEventsIntoViewAnimated:1];
    self->_scrollToOccurrencesOnNextReload = 0;
  }
}

- (void)resetOccurrenceViewColors
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(EKDayViewContent *)self->_dayContent occurrenceViews];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * v7++) forceUpdateColors];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v5);
  }
  double v8 = [(EKDayAllDayView *)self->_allDayView occurrenceViews];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v12++) forceUpdateColors];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v10);
  }
}

- (void)allDayView:(id)a3 didSelectEvent:(id)a4 userInitiated:(BOOL)a5
{
  BOOL v5 = a5;
  id v10 = a4;
  -[EKDayView selectEvent:](self, "selectEvent:");
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v9 dayView:self didSelectEvent:v10 userInitiated:v5];
  }
}

- (void)dayViewContent:(id)a3 didCreateOccurrenceViews:(id)a4
{
  id v10 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained;
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = objc_loadWeakRetained((id *)&self->_delegate);
      [v9 dayView:self didCreateOccurrenceViews:v10];
    }
  }
}

- (void)dayViewContent:(id)a3 didSelectEvent:(id)a4 userInitiated:(BOOL)a5 dateSelected:(id)a6
{
  BOOL v6 = a5;
  id v13 = a4;
  if ([(EKDayView *)self _sizeClass] == 1) {
    [(EKDayView *)self selectEvent:v13];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = objc_loadWeakRetained((id *)&self->_delegate);
      [v12 dayView:self didSelectEvent:v13 userInitiated:v6];
    }
  }
}

- (void)dayViewContent:(id)a3 didSelectEvents:(id)a4 userInitiated:(BOOL)a5
{
  BOOL v5 = a5;
  id v12 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    char v8 = WeakRetained;
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = objc_loadWeakRetained((id *)&self->_delegate);
      [v11 dayView:self didSelectEvents:v12 userInitiated:v5];
    }
  }
}

- (void)dayViewContent:(id)a3 didTapInEmptySpaceOnDay:(double)a4
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = (void *)MEMORY[0x1E4F57838];
    char v10 = [(NSCalendar *)self->_calendar timeZone];
    id v12 = [v9 calendarDateWithAbsoluteTime:v10 timeZone:a4];

    id v11 = objc_loadWeakRetained((id *)p_delegate);
    [v11 dayViewDidTapEmptySpace:self onDate:v12];
  }
}

- (void)dayViewContent:(id)a3 didTapPinnedOccurrence:(id)a4
{
}

- (void)dayViewContentDidCompleteAsyncLoadAndLayout:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 dayViewDidCompleteAsyncLoadAndLayout:self];
  }
}

- (void)_timeViewTapped:(id)a3
{
  if ([a3 state] == 3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = objc_loadWeakRetained((id *)&self->_delegate);
      [v6 dayViewDidTapEmptySpace:self onDate:0];
    }
  }
}

- (id)dayViewContent:(id)a3 selectedCopyViewForOccurrenceView:(id)a4
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    id v9 = [v8 dayView:self selectedCopyViewForOccurrence:v5];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)_doubleTap:(id)a3
{
  id v4 = a3;
  [v4 locationInView:self];
  double v6 = v5;
  char v7 = [(EKDayViewContent *)self->_dayContent grid];
  [v4 locationInView:v7];
  double v9 = v8;
  double v11 = v10;

  +[EKDayTimeView defaultHourScale];
  double v13 = v12;
  double v14 = v12 / self->_hourScale;
  [(EKDayView *)self setHourScale:v12];
  long long v15 = [(EKDayViewContent *)self->_dayContent grid];
  -[EKDayView convertPoint:fromView:](self, "convertPoint:fromView:", v15, v9, v11 * v14);
  double v17 = v16;

  double v18 = v17 - v6;
  [(UIScrollView *)self->_scroller contentOffset];
  double v20 = v19;
  double v22 = v18 + v21;
  +[EKDayTimeView defaultHeightForSizeClass:[(EKDayView *)self _sizeClass] orientation:self->_orientation withHourScale:self->_hourScale];
  double v24 = v23;
  [(UIScrollView *)self->_scroller frame];
  double v26 = 0.0;
  if (v22 >= 0.0) {
    double v26 = v22;
  }
  if (v26 >= v24 - v25) {
    double v26 = v24 - v25;
  }
  -[UIScrollView setContentOffset:animated:](self->_scroller, "setContentOffset:animated:", 0, v20, v26);
  [(EKDayView *)self layoutIfNeeded];
  [(EKDayViewContent *)self->_dayContent layoutIfNeeded];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v28 = objc_opt_respondsToSelector();

  if (v28)
  {
    id v29 = objc_loadWeakRetained((id *)&self->_delegate);
    [v29 dayView:self didScaleDayViewWithScale:v13];
  }
}

- (double)minimumHourScale
{
  [(EKDayView *)self frame];
  double v4 = v3;
  if ([(EKDayView *)self _sizeClass] == 2) {
    int64_t orientation = 1;
  }
  else {
    int64_t orientation = self->_orientation;
  }
  +[EKDayTimeView defaultHeightForSizeClass:[(EKDayView *)self _sizeClass] orientation:orientation];
  return fmax(v4 / v6, 0.7);
}

- (double)maximumHourScale
{
  return 1.8;
}

- (void)setHourScale:(double)a3
{
  [(EKDayView *)self maximumHourScale];
  if (v5 <= a3) {
    a3 = v5;
  }
  [(EKDayView *)self minimumHourScale];
  if (a3 < v6) {
    a3 = v6;
  }
  self->_hourScale = a3;
  [(EKDayTimeView *)self->_timeView setHourHeightScale:a3];
  char v7 = [(EKDayViewContent *)self->_dayContent grid];
  [v7 setGridHeightScale:a3];

  +[EKDayTimeView defaultHeightForSizeClass:[(EKDayView *)self _sizeClass] orientation:self->_orientation withHourScale:self->_hourScale];
  [(UIScrollView *)self->_scroller contentSize];
  -[UIScrollView setContentSize:](self->_scroller, "setContentSize:");
  [(EKDayView *)self setNeedsLayout];
  dayContent = self->_dayContent;

  [(EKDayViewContent *)dayContent setNeedsLayout];
}

- (double)scaledHourHeight
{
  [(EKDayTimeView *)self->_timeView scaledHourHeight];
  return result;
}

- (void)_dayViewPinched:(id)a3
{
  id v61 = a3;
  uint64_t v4 = [v61 state];
  if ((unint64_t)(v4 - 3) <= 2)
  {
    [(EKDayViewContent *)self->_dayContent setReduceLayoutProcessingForAnimation:0];
    [(EKDayViewContent *)self->_dayContent setNeedsLayout];
    [(EKDayView *)self reloadDataSynchronously];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = objc_loadWeakRetained((id *)&self->_delegate);
      [v7 dayView:self didScaleDayViewWithScale:self->_hourScale];
    }
  }
  uint64_t v8 = [v61 numberOfTouches];
  if ((v8 | 2) == 2)
  {
    uint64_t v9 = v8;
    double x = self->_lastPinchPoint1.x;
    double y = self->_lastPinchPoint1.y;
    if (v8)
    {
      [v61 locationOfTouch:0 inView:self];
      self->_lastPinchPoint1.double x = v12;
      self->_lastPinchPoint1.double y = v13;
    }
    if (v4 == 2)
    {
      if (v9)
      {
        double v15 = pinchDistanceForGestureRecognizer(v61, self);
        double v17 = self->_lastPinchDistance.y;
        double v18 = v16 / v17;
        double v19 = v15 - self->_lastPinchDistance.x;
        if (v19 < 0.0) {
          double v19 = -v19;
        }
        double v20 = v16 - v17;
        if (v20 < 0.0) {
          double v20 = -v20;
        }
        if (v19 <= v20) {
          double v21 = v18;
        }
        else {
          double v21 = 1.0;
        }
        self->_lastPinchDistance.double x = v15;
        self->_lastPinchDistance.double y = v16;
      }
      else
      {
        [v61 scale];
        double v21 = fabs(v23 / self->_lastPinchScale);
        self->_lastPinchScale = v23;
      }
      double v24 = v21 * self->_hourScale;
      [(EKDayView *)self minimumHourScale];
      BOOL v26 = v21 <= 1.0 && v24 < v25;
      if (v26 || ([(EKDayView *)self maximumHourScale], v24 > v27))
      {
        [(EKDayView *)self minimumHourScale];
        if (1.0 - v21 > 0.01 && v24 < v28) {
          goto LABEL_50;
        }
        [(EKDayView *)self maximumHourScale];
        double v31 = v21 + -1.0;
        double v21 = 1.0;
        if (v31 > 0.01 && v24 > v30) {
          goto LABEL_50;
        }
      }
      else
      {
        self->_hourScale = v24;
      }
      double v33 = [(EKDayViewContent *)self->_dayContent grid];
      double v34 = v33;
      if (v9) {
        objc_msgSend(v33, "convertPoint:fromView:", self, x, y);
      }
      else {
        [v61 locationInView:v33];
      }
      double v37 = v35;
      double v38 = v36;

      [(EKDayTimeView *)self->_timeView setHourHeightScale:self->_hourScale];
      double v39 = [(EKDayViewContent *)self->_dayContent grid];
      [v39 setGridHeightScale:self->_hourScale];

      +[EKDayTimeView defaultHeightForSizeClass:[(EKDayView *)self _sizeClass] orientation:self->_orientation withHourScale:self->_hourScale];
      double v41 = v40;
      [(UIScrollView *)self->_scroller contentSize];
      -[UIScrollView setContentSize:](self->_scroller, "setContentSize:");
      [(EKDayView *)self setNeedsLayout];
      [(EKDayViewContent *)self->_dayContent setNeedsLayout];
      [(UIScrollView *)self->_scroller contentOffset];
      double v43 = v42;
      double v45 = v44;
      double v46 = v21 * v38;
      char v47 = [(EKDayViewContent *)self->_dayContent grid];
      if (v9)
      {
        -[EKDayView convertPoint:fromView:](self, "convertPoint:fromView:", v47, v37, v46);
        double v49 = v48;

        double v50 = v49 - self->_lastPinchPoint1.y;
        [(UIScrollView *)self->_scroller contentOffset];
        double v43 = v51;
        double v53 = v50 + v52;
      }
      else
      {
        [v61 locationInView:v47];
        double v55 = v54;

        double v53 = v45 + v46 - v55;
      }
      [(UIScrollView *)self->_scroller frame];
      double v57 = 0.0;
      if (v53 >= 0.0) {
        double v57 = v53;
      }
      if (v57 >= v41 - v56) {
        double v57 = v41 - v56;
      }
      -[UIScrollView setContentOffset:animated:](self->_scroller, "setContentOffset:animated:", 0, v43, v57);
      id v58 = objc_loadWeakRetained((id *)&self->_delegate);
      char v59 = objc_opt_respondsToSelector();

      if (v59)
      {
        id v60 = objc_loadWeakRetained((id *)&self->_delegate);
        [v60 dayView:self isPinchingDayViewWithScale:self->_hourScale];
      }
    }
    else if (v4 == 1)
    {
      if (v9)
      {
        self->_lastPinchDistance.double x = pinchDistanceForGestureRecognizer(v61, self);
        self->_lastPinchDistance.double y = v14;
      }
      else
      {
        [v61 scale];
        self->_lastPinchScale = v22;
      }
      [(EKDayViewContent *)self->_dayContent setReduceLayoutProcessingForAnimation:1];
    }
  }
LABEL_50:
}

- (id)occurrenceViewAtPoint:(CGPoint)a3
{
  double v3 = -[EKDayView hitTest:withEvent:](self, "hitTest:withEvent:", 0, a3.x, a3.y);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
LABEL_5:
    double v5 = v4;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 occurrenceView];
    goto LABEL_5;
  }
  double v5 = 0;
LABEL_7:

  return v5;
}

- (double)dateAtPoint:(CGPoint)a3 isAllDay:(BOOL *)a4
{
  -[EKDayView dateAtPoint:isAllDay:requireAllDayRegionInsistence:](self, "dateAtPoint:isAllDay:requireAllDayRegionInsistence:", a4, 1, a3.x, a3.y);
  return result;
}

- (double)dateAtPoint:(CGPoint)a3 isAllDay:(BOOL *)a4 requireAllDayRegionInsistence:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a3.y;
  [(UIScrollView *)self->_scroller contentOffset];
  double v10 = y + v9;
  [(UIScrollView *)self->_scroller frame];
  double v12 = v10 - v11;
  BOOL v13 = 0;
  if ([(EKDayView *)self _showingAllDaySection])
  {
    [(EKDayAllDayView *)self->_allDayView frame];
    if (y < CGRectGetMaxY(v17) + (double)v5 * -6.0) {
      BOOL v13 = 1;
    }
  }
  [(EKDayView *)self _adjustSecondForwardForDSTHole:(double)[(EKDayView *)self _secondAtPosition:fmax(v12, 0.0)]];
  double dayStart = self->_dayStart;
  if (a4) {
    *a4 = v13;
  }
  return dayStart + (double)(int)v14;
}

- (double)_adjustSecondForwardForDSTHole:(double)result
{
  double nextDSTTransition = self->_nextDSTTransition;
  double dayStart = self->_dayStart;
  if (nextDSTTransition >= dayStart)
  {
    double dayEnd = self->_dayEnd;
    if (nextDSTTransition < dayEnd)
    {
      double v6 = dayStart - dayEnd + 86399.0;
      double v7 = dayStart + result;
      double v8 = nextDSTTransition + v6;
      if (dayStart + result >= nextDSTTransition && v7 < v8)
      {
        return nextDSTTransition - dayStart + v6;
      }
      else if (v7 >= v8)
      {
        return result - v6;
      }
    }
  }
  return result;
}

- (double)_adjustSecondBackwardForDSTHole:(double)result
{
  double nextDSTTransition = self->_nextDSTTransition;
  double dayStart = self->_dayStart;
  if (nextDSTTransition >= dayStart)
  {
    double dayEnd = self->_dayEnd;
    if (dayStart + result >= nextDSTTransition && nextDSTTransition < dayEnd) {
      return dayStart - dayEnd + 86399.0 + result;
    }
  }
  return result;
}

- (CGPoint)pointAtDate:(double)a3 isAllDay:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = 0.0;
  if (CalInterfaceIsLeftToRight())
  {
    [(EKDayView *)self leftContentInset];
    double v7 = v8;
  }
  [(EKDayView *)self _adjustSecondBackwardForDSTHole:a3 - self->_dayStart];
  if (v4)
  {
    allDayView = self->_allDayView;
    if (allDayView)
    {
      [(EKDayAllDayView *)allDayView firstEventYOffset];
      double v12 = v11;
    }
    else
    {
      double v12 = 0.0;
    }
  }
  else
  {
    double v13 = v9;
    [(UIScrollView *)self->_scroller frame];
    double v15 = v14;
    [(UIScrollView *)self->_scroller contentOffset];
    double v17 = v15 - v16;
    [(EKDayView *)self _positionOfSecond:(int)v13];
    double v12 = v18 + v17;
  }
  double v19 = v7;
  result.double y = v12;
  result.double x = v19;
  return result;
}

- (double)_scrollRate
{
  return dbl_1B413AA70[[(EKDayView *)self _sizeClass] == 2];
}

- (double)_scrollZoneTop
{
  int64_t v2 = [(EKDayView *)self _sizeClass];
  double result = 40.0;
  if (v2 != 2) {
    return 30.0;
  }
  return result;
}

- (BOOL)scrollTowardPoint:(CGPoint)a3
{
  double y = a3.y;
  [(UIScrollView *)self->_scroller frame];
  double MinY = CGRectGetMinY(v33);
  [(EKDayView *)self _scrollZoneTop];
  double v7 = MinY + v6;
  [(UIScrollView *)self->_scroller frame];
  double MaxY = CGRectGetMaxY(v34);
  [(UIScrollView *)self->_scroller contentInset];
  if (y >= v7)
  {
    double v11 = MaxY - v9 + -40.0;
    if (y <= v11) {
      return 0;
    }
    double v10 = y - v11;
  }
  else
  {
    double v10 = v7 - y;
  }
  [(EKDayView *)self _scrollRate];
  double v13 = v10 * v12;
  [(UIScrollView *)self->_scroller contentOffset];
  double v16 = v15;
  double v17 = v14;
  if (y >= v7)
  {
    [(UIScrollView *)self->_scroller bounds];
    double v21 = v17 + v20;
    [(UIScrollView *)self->_scroller contentInset];
    double v23 = v21 - v22;
    [(UIScrollView *)self->_scroller contentSize];
    if (v23 < v24)
    {
      [(UIScrollView *)self->_scroller contentSize];
      double v27 = v26;
      [(UIScrollView *)self->_scroller contentInset];
      double v29 = v27 + v28;
      [(UIScrollView *)self->_scroller bounds];
      float v31 = v29 - v30;
      float v25 = v13 + v17;
      float v19 = fminf(v25, v31);
      goto LABEL_10;
    }
  }
  else if (v14 > 0.0)
  {
    float v18 = v14 - v13;
    float v19 = fmaxf(v18, 0.0);
LABEL_10:
    -[UIScrollView setContentOffset:](self->_scroller, "setContentOffset:", v16, v19);
    return 1;
  }
  return 0;
}

- (double)timedRegionYOrigin
{
  [(UIScrollView *)self->_scroller frame];
  return v2;
}

- (void)highlightHour:(double)a3
{
  [(EKDayView *)self _adjustSecondBackwardForDSTHole:a3 * 3600.0];
  double v5 = v4 / 3600.0;
  timeView = self->_timeView;

  [(EKDayTimeView *)timeView setHighlightedHour:v5];
}

- (double)highlightedHour
{
  [(EKDayTimeView *)self->_timeView highlightedHour];
  return result;
}

- (void)setAllDayLabelHighlighted:(BOOL)a3
{
}

- (BOOL)isAllDayLabelHighlighted
{
  return [(EKDayAllDayView *)self->_allDayView isAllDayLabelHighlighted];
}

- (void)addViewToScroller:(id)a3 isAllDay:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v19 = v6;
  if (v4)
  {
    [(EKDayAllDayView *)self->_allDayView addViewToScroller:v6];
  }
  else
  {
    double v7 = [v6 superview];
    scroller = self->_scroller;

    double v9 = v19;
    if (v7 == scroller) {
      goto LABEL_6;
    }
    double v10 = [v19 superview];
    [v19 frame];
    objc_msgSend(v10, "convertRect:toView:", self->_scroller);
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;

    [(UIScrollView *)self->_scroller addSubview:v19];
    objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);
  }
  double v9 = v19;
LABEL_6:
}

- (void)configureOccurrenceViewForGestureController:(id)a3
{
}

- (EKDayViewDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (EKDayViewDataSource *)WeakRetained;
}

- (id)displayDateDidChangeCallback
{
  return self->_displayDateDidChangeCallback;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (BOOL)allowsOccurrenceSelection
{
  return self->_allowsOccurrenceSelection;
}

- (BOOL)showOnlyAllDayArea
{
  return self->_showOnlyAllDayArea;
}

- (double)additionalLeftPadding
{
  return self->_additionalLeftPadding;
}

- (void)setAdditionalLeftPadding:(double)a3
{
  self->_additionalLeftPadding = a3;
}

- (double)topContentInset
{
  return self->_topContentInset;
}

- (double)bottomContentInset
{
  return self->_bottomContentInset;
}

- (void)setIsNowVisible:(BOOL)a3
{
  self->_isNowVisible = a3;
}

- (BOOL)scrollEventsInToViewIgnoresVisibility
{
  return self->_scrollEventsInToViewIgnoresVisibility;
}

- (void)setScrollEventsInToViewIgnoresVisibility:(BOOL)a3
{
  self->_scrollEventsInToViewIgnoresVisibilitdouble y = a3;
}

- (BOOL)shouldEverShowTimeIndicators
{
  return self->_shouldEverShowTimeIndicators;
}

- (void)setSizeTimeViewUsingOnlyHourText:(BOOL)a3
{
  self->_sizeTimeViewUsingOnlyHourText = a3;
}

- (int)outlineStyle
{
  return self->_outlineStyle;
}

- (BOOL)allowPinchingHourHeights
{
  return self->_allowPinchingHourHeights;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (double)scrollAnimationDurationOverride
{
  return self->_scrollAnimationDurationOverride;
}

- (void)setScrollAnimationDurationOverride:(double)a3
{
  self->_scrollAnimationDurationOverride = a3;
}

- (double)hourScale
{
  return self->_hourScale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_displayDate, 0);
  objc_storeStrong(&self->_contentDidChangeCallback, 0);
  objc_storeStrong(&self->_displayDateDidChangeCallback, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_reloadQueue, 0);
  objc_storeStrong((id *)&self->_doubleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_pinchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_timeMarkerTimer, 0);
  objc_storeStrong((id *)&self->_scroller, 0);
  objc_storeStrong((id *)&self->_timeView, 0);
  objc_storeStrong((id *)&self->_dayContent, 0);
  objc_storeStrong((id *)&self->_allDayView, 0);
  objc_storeStrong((id *)&self->_existingTimedOcurrences, 0);
  objc_storeStrong((id *)&self->_bottomLine, 0);
  objc_storeStrong((id *)&self->_bottomVerticalGridExtension, 0);

  objc_storeStrong((id *)&self->_topVerticalGridExtension, 0);
}

@end