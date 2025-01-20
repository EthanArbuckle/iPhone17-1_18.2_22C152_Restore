@interface EKDayViewController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
- (BOOL)_canScrollToNow;
- (BOOL)_canShowNowAfterScrollViewDidEndDecelerating:(id)a3;
- (BOOL)_delegateRespondsToDisplayedOccurrencesChangedMethod;
- (BOOL)_isCalendarDate:(id)a3 sameDayAsComponents:(id)a4;
- (BOOL)_isCurrentDayToday;
- (BOOL)_isResizing;
- (BOOL)_isViewInVisibleRect:(id)a3;
- (BOOL)_shouldEndGestureEditingOnTap;
- (BOOL)_shouldRespondToApplicationDidBecomeActiveStateChange;
- (BOOL)allowsDaySwitching;
- (BOOL)allowsSelection;
- (BOOL)alwaysAnimate;
- (BOOL)animateAllDayAreaHeight;
- (BOOL)blockableScrollViewShouldAllowScrolling;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)currentDayContainsOccurrences;
- (BOOL)dayViewShouldAnnotateAppEntities:(id)a3 onDayStarting:(id)a4;
- (BOOL)dayViewShouldDrawSynchronously:(id)a3;
- (BOOL)didScrollWhenEventGestureController:(id)a3 scrollTimerFiredToMoveLeft:(BOOL)a4 right:(BOOL)a5 vertically:(BOOL)a6 towardPoint:(CGPoint)a7;
- (BOOL)disableGestureDayChange;
- (BOOL)disableNotifyDateChangeDuringTracking;
- (BOOL)eventEditorPopoverActiveWhileDraggingForEventGestureController:(id)a3;
- (BOOL)eventGestureController:(id)a3 didCommitOccurrence:(id)a4 toDate:(double)a5 isAllDay:(BOOL)a6 span:(int64_t)a7;
- (BOOL)eventGestureController:(id)a3 isAllDayAtPoint:(CGPoint)a4 requireInsistence:(BOOL)a5;
- (BOOL)eventGestureControllerShouldAllowLongPress:(id)a3;
- (BOOL)interaction:(id)a3 canCreateEventAtPoint:(CGPoint)a4 inView:(id)a5;
- (BOOL)interaction:(id)a3 canCreateReminderAtPoint:(CGPoint)a4 inView:(id)a5;
- (BOOL)interaction:(id)a3 canPasteEventAtPoint:(CGPoint)a4 inView:(id)a5;
- (BOOL)interaction:(id)a3 shouldShowMenuAtPoint:(CGPoint)a4 inView:(id)a5;
- (BOOL)notifyWhenTapOtherEventDuringDragging;
- (BOOL)preloadExtraDays;
- (BOOL)scrollEventsInToViewIgnoresVisibility;
- (BOOL)shouldAutoscrollAfterAppearance;
- (BOOL)shouldLogVisibleEvents;
- (BOOL)showWeekNumberLabel;
- (BOOL)showWeekdayLabel;
- (BOOL)showsBanner;
- (BOOL)transitionedToSameDay;
- (CGPoint)eventGestureController:(id)a3 pointAtDate:(double)a4 isAllDay:(BOOL)a5;
- (CGPoint)normalizedContentOffset;
- (CGPoint)pointAtDate:(double)a3 isAllDay:(BOOL)a4;
- (EKDayView)currentDayView;
- (EKDayViewController)init;
- (EKDayViewController)initWithTargetSizeClass:(int64_t)a3;
- (EKDayViewControllerDataSource)dataSource;
- (EKDayViewControllerDelegate)delegate;
- (EKEventOrIntegrationEditView)currentEditor;
- (NSArray)currentDayContentGridViewSubviews;
- (NSCalendar)calendar;
- (NSDateComponents)displayDate;
- (NSDateComponents)pendingNextDate;
- (NSDateComponents)pendingPreviousDate;
- (NSTimer)showNowTimer;
- (UIView)currentAllDayView;
- (UIView)currentTopLabelsContainer;
- (UIView)gestureOccurrenceSuperview;
- (double)_showNowDelay;
- (double)_weightedAllDayHeightForView:(id)a3 visibleRect:(CGRect)a4;
- (double)eventGestureController:(id)a3 dateAtPoint:(CGPoint)a4;
- (double)eventGestureController:(id)a3 heightForAllDayOccurrenceView:(id)a4;
- (double)eventGestureController:(id)a3 heightForOccurrenceViewOfDuration:(double)a4;
- (double)eventGestureController:(id)a3 widthForOccurrenceViewOfDays:(unint64_t)a4;
- (double)eventGestureController:(id)a3 yPositionPerhapsMatchingAllDayOccurrence:(id)a4 atPoint:(CGPoint)a5;
- (double)gutterWidth;
- (double)horizontalOffsetForPagingForEventGestureController:(id)a3;
- (double)timedRegionOriginForEventGestureController:(id)a3;
- (id)_createGutterDayViewWithDayView:(id)a3;
- (id)_eventGestureSuperview;
- (id)_eventsForCutOrCopy;
- (id)_eventsForDay:(id)a3;
- (id)_occurrencesForDayView:(id)a3;
- (id)createEventForEventGestureController:(id)a3;
- (id)createOccurrenceViewForEventGestureController:(id)a3;
- (id)createOccurrenceViewForEventGestures;
- (id)dayView:(id)a3 selectedCopyViewForOccurrence:(id)a4;
- (id)eventGestureController:(id)a3 occurrenceViewAtPoint:(CGPoint)a4 ignoreSelectedCopyView:(BOOL)a5;
- (id)eventGestureController:(id)a3 occurrenceViewForOccurrence:(id)a4;
- (id)eventGestureController:(id)a3 occurrenceViewForOccurrence:(id)a4 occurrenceDate:(id)a5;
- (id)eventsForStartDate:(id)a3 endDate:(id)a4;
- (id)gestureController;
- (id)horizontalScrollView;
- (id)interaction:(id)a3 subtitleForPasteActionAtPoint:(CGPoint)a4 inView:(id)a5;
- (id)interaction:(id)a3 titleForPasteActionAtPoint:(CGPoint)a4 inView:(id)a5;
- (id)occurrenceViewForEvent:(id)a3;
- (id)occurrenceViewForEvent:(id)a3 includeNextAndPreviousDays:(BOOL)a4;
- (id)occurrenceViewForEvent:(id)a3 occurrenceDate:(id)a4;
- (id)preferredEventsToSelectOnDate:(id)a3;
- (id)presentationControllerForEditMenu;
- (id)selectedEventsForEditMenu;
- (id)verticalScrollView;
- (int)startingFirstVisibleSecond;
- (int64_t)_effectiveInterfaceOrientationForSize:(CGSize)a3;
- (unint64_t)_dateModeForAllDay:(BOOL)a3;
- (unint64_t)firstVisibleSecond;
- (void)__cutLongTailCallbackForScrollAnimationFromExternalSource;
- (void)_cancelAllLongTailCuttingCallbacks;
- (void)_cleanUpTargetDateComponents;
- (void)_completeDecelerationIfNeeded;
- (void)_completeScrollingAnimationIfNeeded;
- (void)_cutAnimationTailAfterDelayForDecelerationFromUserInput;
- (void)_cutAnimationTailAfterDelayForScrollAnimationFromExternalSource;
- (void)_didRespondToApplicationDidBecomeActiveStateChange;
- (void)_highlightEvent:(id)a3 dayViewDate:(double)a4 isAllDay:(BOOL)a5;
- (void)_localeChanged:(id)a3;
- (void)_logUserStateDiagnostics:(id)a3;
- (void)_notifyDelegateOfSelectedDateChange;
- (void)_performDisplayedOccurrencesChangedDelegateMethodWithTrigger:(int)a3;
- (void)_relayoutDays;
- (void)_relayoutDaysDuringScrolling;
- (void)_relayoutDaysDuringScrollingAndPerformDayChanges:(BOOL)a3;
- (void)_scrollDayViewAfterRelayoutDays;
- (void)_scrollToNowOnScrollViewDidEndScrollingAnimation:(id)a3;
- (void)_scrollViewDidEndDecelerating:(id)a3;
- (void)_setDayView:(id)a3 toDate:(id)a4;
- (void)_setDisplayDate:(id)a3 forRepeat:(BOOL)a4;
- (void)_setDisplayDate:(id)a3 forRepeat:(BOOL)a4 animate:(BOOL)a5;
- (void)_setDisplayDateInternal:(id)a3;
- (void)_setHorizontalContentOffsetUsingSpringAnimation:(CGPoint)a3;
- (void)_setNextAndPreviousFirstVisibleSecondToCurrent;
- (void)_showNowAfterScrollViewDidEndDecelerating:(id)a3;
- (void)_showNowTimerFired:(id)a3;
- (void)_showWeekNumbersPreferenceChanged:(id)a3;
- (void)_stopShowNowTimer;
- (void)_updateAllDayAreaHeight;
- (void)applicationDidBecomeActive;
- (void)attemptDisplayReviewPrompt;
- (void)blockableScrollViewDidChangeFrameSize;
- (void)bringEventToFront:(id)a3;
- (void)cleanUpAfterGestureFailureForEventGestureController:(id)a3;
- (void)copy:(id)a3;
- (void)createEvent:(BOOL)a3 atPoint:(CGPoint)a4 inView:(id)a5;
- (void)cut:(id)a3;
- (void)dayOccurrenceViewSelected:(id)a3 source:(unint64_t)a4;
- (void)dayView:(id)a3 didCreateOccurrenceViews:(id)a4;
- (void)dayView:(id)a3 didScaleDayViewWithScale:(double)a4;
- (void)dayView:(id)a3 didSelectEvent:(id)a4 userInitiated:(BOOL)a5;
- (void)dayView:(id)a3 didSelectEvents:(id)a4 userInitiated:(BOOL)a5;
- (void)dayView:(id)a3 didUpdateScrollPosition:(CGPoint)a4;
- (void)dayView:(id)a3 firstVisibleSecondChanged:(unint64_t)a4;
- (void)dayView:(id)a3 isPinchingDayViewWithScale:(double)a4;
- (void)dayViewDidCompleteAsyncLoadAndLayout:(id)a3;
- (void)dayViewDidTapEmptySpace:(id)a3 onDate:(id)a4;
- (void)dealloc;
- (void)editorDidCancelEditingEvent:(id)a3;
- (void)editorDidDeleteEvent:(id)a3;
- (void)editorDidSaveEvent:(id)a3;
- (void)eventGestureController:(id)a3 addViewToScroller:(id)a4 isAllDay:(BOOL)a5;
- (void)eventGestureController:(id)a3 adjustDraggingView:(id)a4 forAllDay:(BOOL)a5;
- (void)eventGestureController:(id)a3 didCancelEditingOccurrence:(id)a4 fadedOut:(BOOL)a5;
- (void)eventGestureController:(id)a3 didMoveToDate:(double)a4 isAllDay:(BOOL)a5;
- (void)eventGestureController:(id)a3 didSetUpAtDate:(double)a4 isAllDay:(BOOL)a5;
- (void)eventGestureController:(id)a3 didSingleTapOccurrence:(id)a4 shouldExtendSelection:(BOOL)a5;
- (void)eventGestureController:(id)a3 requestsPresentationOfViewController:(id)a4;
- (void)eventGestureController:(id)a3 requestsShowEvent:(id)a4;
- (void)eventGestureControllerDidEndDragSession:(id)a3;
- (void)externallyEndedGestureDragging;
- (void)hideTimelineHighlight;
- (void)insertViewForEvent:(id)a3 belowViewForOtherEvent:(id)a4;
- (void)interaction:(id)a3 createEventAtPoint:(CGPoint)a4 inView:(id)a5;
- (void)interaction:(id)a3 createReminderAtPoint:(CGPoint)a4 inView:(id)a5;
- (void)interaction:(id)a3 pasteEventAtPoint:(CGPoint)a4 inView:(id)a5;
- (void)layoutContainerView:(id)a3;
- (void)loadData:(BOOL)a3 withTrigger:(int)a4 withCompletion:(id)a5;
- (void)loadDataBetweenStart:(id)a3 end:(id)a4 withTrigger:(int)a5 generation:(int)a6 completionForCurrentDayReload:(id)a7;
- (void)loadView;
- (void)paste:(id)a3;
- (void)pasteboardManager:(id)a3 beginEditingEvent:(id)a4;
- (void)pasteboardManager:(id)a3 didFinishPasteWithResult:(unint64_t)a4 willOpenEditor:(BOOL)a5;
- (void)pasteboardManager:(id)a3 presentAlert:(id)a4;
- (void)preferredContentSizeDidChanged:(id)a3;
- (void)reloadData;
- (void)reloadDataForOccurrenceChangeWithGeneration:(int)a3;
- (void)reloadDataIfNeeded;
- (void)scrollDayViewAppropriatelyWithAnimation:(BOOL)a3;
- (void)scrollEventIntoView:(id)a3 animated:(BOOL)a4;
- (void)scrollEventsIntoViewAnimated:(BOOL)a3;
- (void)scrollToDate:(id)a3 animated:(BOOL)a4;
- (void)scrollToNow:(BOOL)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDecelerating:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)setAllowsDaySwitching:(BOOL)a3;
- (void)setAllowsSelection:(BOOL)a3;
- (void)setAlwaysAnimate:(BOOL)a3;
- (void)setAnimateAllDayAreaHeight:(BOOL)a3;
- (void)setCalendar:(id)a3;
- (void)setCurrentEditor:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisableGestureDayChange:(BOOL)a3;
- (void)setDisableNotifyDateChangeDuringTracking:(BOOL)a3;
- (void)setDisplayDate:(id)a3;
- (void)setFrame:(CGRect)a3 gutterWidth:(double)a4;
- (void)setGestureOccurrenceSuperview:(id)a3;
- (void)setGutterWidth:(double)a3;
- (void)setNeedsReload;
- (void)setNormalizedContentOffset:(CGPoint)a3;
- (void)setNotifyWhenTapOtherEventDuringDragging:(BOOL)a3;
- (void)setPendingNextDate:(id)a3;
- (void)setPendingPreviousDate:(id)a3;
- (void)setPreloadExtraDays:(BOOL)a3;
- (void)setScrollEventsInToViewIgnoresVisibility:(BOOL)a3;
- (void)setShouldAutoscrollAfterAppearance:(BOOL)a3;
- (void)setShouldLogVisibleEvents:(BOOL)a3;
- (void)setShowNowTimer:(id)a3;
- (void)setShowWeekdayLabel:(BOOL)a3;
- (void)setShowsBanner:(BOOL)a3;
- (void)setStartingFirstVisibleSecond:(int)a3;
- (void)setTimeZone:(id)a3;
- (void)setTransitionedToSameDay:(BOOL)a3;
- (void)showTimelineHighlightForTime:(id)a3;
- (void)significantTimeChangeOccurred;
- (void)timeZoneChanged;
- (void)updateGutterTopLabelsAppearance;
- (void)validateInterfaceOrientationWithFutureOrientation:(int64_t)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation EKDayViewController

void __101__EKDayViewController_loadDataBetweenStart_end_withTrigger_generation_completionForCurrentDayReload___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _delegateRespondsToDisplayedOccurrencesChangedMethod])
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __101__EKDayViewController_loadDataBetweenStart_end_withTrigger_generation_completionForCurrentDayReload___block_invoke_2;
    v2[3] = &unk_1E6088890;
    v2[4] = *(void *)(a1 + 32);
    int v3 = *(_DWORD *)(a1 + 40);
    dispatch_async(MEMORY[0x1E4F14428], v2);
  }
}

- (BOOL)_delegateRespondsToDisplayedOccurrencesChangedMethod
{
  int v3 = [(EKDayViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    char v4 = 1;
  }
  else
  {
    v5 = [(EKDayViewController *)self delegate];
    char v4 = objc_opt_respondsToSelector();
  }
  return v4 & 1;
}

void __59__EKDayViewController_loadData_withTrigger_withCompletion___block_invoke_5(uint64_t a1)
{
}

void __59__EKDayViewController_loadData_withTrigger_withCompletion___block_invoke_4(uint64_t a1)
{
}

void __59__EKDayViewController_loadData_withTrigger_withCompletion___block_invoke_3(uint64_t a1)
{
}

uint64_t __59__EKDayViewController_loadData_withTrigger_withCompletion___block_invoke_6(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    char v4 = [*(id *)(a1 + 32) delegate];
    [v4 dayViewControllerDidReloadData:*(void *)(a1 + 32)];
  }
  [*(id *)(a1 + 32) _performDisplayedOccurrencesChangedDelegateMethodWithTrigger:*(unsigned int *)(a1 + 48)];
  [*(id *)(a1 + 32) _updateAllDayAreaHeight];
  [*(id *)(a1 + 32) updateGutterTopLabelsAppearance];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

- (void)_updateAllDayAreaHeight
{
  if ([(EKDayViewController *)self animateAllDayAreaHeight])
  {
    horizontalScrollingView = self->_horizontalScrollingView;
    [(UIScrollView *)horizontalScrollingView frame];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    v12 = [(UIScrollView *)self->_horizontalScrollingView superview];
    -[UIScrollView convertRect:fromView:](horizontalScrollingView, "convertRect:fromView:", v12, v5, v7, v9, v11);
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;

    -[EKDayViewController _weightedAllDayHeightForView:visibleRect:](self, "_weightedAllDayHeightForView:visibleRect:", self->_previousDayWithGutter, v14, v16, v18, v20);
    double v22 = v21 + 0.0;
    -[EKDayViewController _weightedAllDayHeightForView:visibleRect:](self, "_weightedAllDayHeightForView:visibleRect:", self->_currentDayWithGutter, v14, v16, v18, v20);
    double v24 = v22 + v23;
    -[EKDayViewController _weightedAllDayHeightForView:visibleRect:](self, "_weightedAllDayHeightForView:visibleRect:", self->_nextDayWithGutter, v14, v16, v18, v20);
    double v26 = v24 + v25;
    [(EKDayViewWithGutters *)self->_previousDayWithGutter setAllDayHeight:v24 + v25];
    [(EKDayViewWithGutters *)self->_currentDayWithGutter setAllDayHeight:v26];
    [(EKDayViewWithGutters *)self->_nextDayWithGutter setAllDayHeight:v26];
    v27 = [(EKDayViewWithGutters *)self->_previousDayWithGutter dayView];
    v28 = [v27 allDayView];
    [v28 setFixedHeight:v26];

    v29 = [(EKDayViewWithGutters *)self->_currentDayWithGutter dayView];
    v30 = [v29 allDayView];
    [v30 setFixedHeight:v26];

    id v32 = [(EKDayViewWithGutters *)self->_nextDayWithGutter dayView];
    v31 = [v32 allDayView];
    [v31 setFixedHeight:v26];
  }
}

- (BOOL)animateAllDayAreaHeight
{
  return self->_animateAllDayAreaHeight;
}

- (void)viewDidLayoutSubviews
{
  char v3 = [(EKDayViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(EKDayViewController *)self delegate];
    [v5 updateSelectedOccurrenceView];
  }
}

- (void)_performDisplayedOccurrencesChangedDelegateMethodWithTrigger:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(EKDayViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  double v7 = [(EKDayViewController *)self delegate];
  id v9 = v7;
  if (v6)
  {
    [v7 dayViewController:self didChangeDisplayedOccurrencesDueToTrigger:v3];
  }
  else
  {
    char v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) == 0) {
      return;
    }
    id v9 = [(EKDayViewController *)self delegate];
    [v9 dayViewControllerDidChangeDisplayedOccurrences:self];
  }
}

- (EKDayViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EKDayViewControllerDelegate *)WeakRetained;
}

- (void)dayView:(id)a3 didUpdateScrollPosition:(CGPoint)a4
{
  id v5 = [(EKDayViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(EKDayViewController *)self delegate];
    [v7 dayViewControllerDidUpdateScrollPosition:self];
  }
}

- (void)loadView
{
  EKUIMultiwindowAssert(self->_targetSizeClass != 0, @"Target size class was not specified.", v2, v3, v4, v5, v6, v7, v72);
  int64_t targetSizeClass = self->_targetSizeClass;
  double v10 = (OS_dispatch_queue *)dispatch_queue_create("dayControllerReload", 0);
  reloadQueue = self->_reloadQueue;
  self->_reloadQueue = v10;

  v12 = (OS_dispatch_queue *)dispatch_queue_create("dayControllerProtection", 0);
  protectionQueue = self->_protectionQueue;
  self->_protectionQueue = v12;

  double v14 = 0.0;
  v80 = -[EKLayoutContainerView initWithFrame:]([EKLayoutContainerView alloc], "initWithFrame:", 0.0, 0.0, 400.0, 600.0);
  [(EKLayoutContainerView *)v80 setAutoresizingMask:18];
  [(EKLayoutContainerView *)v80 setDelegate:self];
  [(EKDayViewController *)self setView:v80];
  double v15 = [MEMORY[0x1E4FB1618] whiteColor];
  [(EKLayoutContainerView *)v80 setBackgroundColor:v15];

  if (!self->_eventGestureController)
  {
    double v16 = [[EKEventGestureController alloc] initWithView:v80];
    eventGestureController = self->_eventGestureController;
    self->_eventGestureController = v16;

    [(EKEventGestureController *)self->_eventGestureController setDelegate:self];
    [(EKEventGestureController *)self->_eventGestureController setUsesHorizontalDragLocking:1];
  }
  double v18 = [(EKDayViewController *)self view];
  [v18 bounds];
  double Width = CGRectGetWidth(v82);

  double v20 = [(EKDayViewController *)self view];
  [v20 bounds];
  double Height = CGRectGetHeight(v83);

  if ([(EKDayViewController *)self showWeekdayLabel])
  {
    +[EKDayViewWithGutters defaultTopLabelContainerHeight];
    double v14 = v22;
  }
  if (targetSizeClass != 2) {
    double Height = Height + -88.0;
  }
  double v23 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", 0.0, 0.0, Width, Height);
  clipView = self->_clipView;
  self->_clipView = v23;

  [(UIView *)self->_clipView setAutoresizingMask:18];
  [(UIView *)self->_clipView setClipsToBounds:1];
  BOOL v25 = targetSizeClass == 2;
  BOOL v26 = targetSizeClass != 2;
  gutterdouble Width = self->_gutterWidth;
  if (v25) {
    double v28 = self->_gutterWidth;
  }
  else {
    double v28 = -gutterWidth;
  }
  if (v25) {
    double Width = Width + gutterWidth * -4.0;
  }
  v29 = -[BlockableScrollView initWithFrame:]([BlockableScrollView alloc], "initWithFrame:", v28, 0.0, Width + gutterWidth * 2.0, Height);
  [(BlockableScrollView *)v29 setBlockableDelegate:self];
  v79 = v29;
  objc_storeStrong((id *)&self->_horizontalScrollingView, v29);
  v30 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [(UIScrollView *)self->_horizontalScrollingView setBackgroundColor:v30];

  [(UIScrollView *)self->_horizontalScrollingView setBounces:1];
  [(UIScrollView *)self->_horizontalScrollingView setPagingEnabled:1];
  [(UIScrollView *)self->_horizontalScrollingView setOpaque:1];
  [(UIScrollView *)self->_horizontalScrollingView setDelegate:self];
  [(UIScrollView *)self->_horizontalScrollingView setScrollsToTop:0];
  -[UIScrollView setContentSize:](self->_horizontalScrollingView, "setContentSize:", self->_gutterWidth + self->_gutterWidth + Width * 3.0, 0.0);
  [(UIScrollView *)self->_horizontalScrollingView setAutoresizingMask:18];
  [(UIScrollView *)self->_horizontalScrollingView setShowsHorizontalScrollIndicator:0];
  [(UIScrollView *)self->_horizontalScrollingView setShowsVerticalScrollIndicator:0];
  [(UIScrollView *)self->_horizontalScrollingView setDecelerationRate:*MEMORY[0x1E4FB2EE8]];
  [(UIScrollView *)self->_horizontalScrollingView setDirectionalLockEnabled:1];
  [(UIScrollView *)self->_horizontalScrollingView setScrollEnabled:[(EKDayViewController *)self allowsDaySwitching]];
  [(UIScrollView *)self->_horizontalScrollingView setClipsToBounds:v26];
  [(UIScrollView *)self->_horizontalScrollingView setContentInsetAdjustmentBehavior:2];
  [(UIView *)self->_clipView addSubview:self->_horizontalScrollingView];
  [(EKLayoutContainerView *)v80 addSubview:self->_clipView];
  double v31 = self->_gutterWidth;
  double v32 = Height - v14;
  uint64_t v76 = [(EKDayViewController *)self interfaceOrientation];
  uint64_t v33 = [(NSDateComponents *)self->_displayDate dateComponents:30 byAddingDays:0xFFFFFFFFLL calendar:self->_calendar];
  v34 = [EKDayView alloc];
  int64_t v35 = self->_targetSizeClass;
  v36 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  LOBYTE(v73) = 0;
  v78 = (void *)v33;
  v37 = -[EKDayView initWithFrame:sizeClass:orientation:displayDate:backgroundColor:opaque:scrollbarShowsInside:isMiniPreviewInEventDetail:rightClickDelegate:](v34, "initWithFrame:sizeClass:orientation:displayDate:backgroundColor:opaque:scrollbarShowsInside:isMiniPreviewInEventDetail:rightClickDelegate:", v35, v76, v33, v36, 1, 1, v31, v14, Width, v32, v73, self);
  previousDay = self->_previousDay;
  self->_previousDay = v37;

  v39 = [EKDayView alloc];
  int64_t v40 = self->_targetSizeClass;
  displayDate = self->_displayDate;
  v42 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  LOBYTE(v74) = 0;
  uint64_t v43 = v76;
  v44 = -[EKDayView initWithFrame:sizeClass:orientation:displayDate:backgroundColor:opaque:scrollbarShowsInside:isMiniPreviewInEventDetail:rightClickDelegate:](v39, "initWithFrame:sizeClass:orientation:displayDate:backgroundColor:opaque:scrollbarShowsInside:isMiniPreviewInEventDetail:rightClickDelegate:", v40, v76, displayDate, v42, 1, 1, v31, v14, Width, v32, v74, self);
  currentDay = self->_currentDay;
  self->_currentDay = v44;

  uint64_t v46 = [(NSDateComponents *)self->_displayDate dateComponents:30 byAddingDays:1 calendar:self->_calendar];
  v47 = [EKDayView alloc];
  int64_t v48 = self->_targetSizeClass;
  v49 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  LOBYTE(v75) = 0;
  v77 = (void *)v46;
  v50 = -[EKDayView initWithFrame:sizeClass:orientation:displayDate:backgroundColor:opaque:scrollbarShowsInside:isMiniPreviewInEventDetail:rightClickDelegate:](v47, "initWithFrame:sizeClass:orientation:displayDate:backgroundColor:opaque:scrollbarShowsInside:isMiniPreviewInEventDetail:rightClickDelegate:", v48, v43, v46, v49, 1, 1, v31, v14, Width, v32, v75, self);
  nextDay = self->_nextDay;
  self->_nextDay = v50;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v48) = objc_opt_respondsToSelector();

  if ((v48 & 1) != 0
    && (id v53 = objc_loadWeakRetained((id *)&self->_delegate),
        [v53 dayViewControllerPersistedHourScalePreference:self],
        double v55 = v54,
        v53,
        v55 > 0.0))
  {
    [(EKDayView *)self->_currentDay setHourScale:v55];
    [(EKDayView *)self->_previousDay setHourScale:v55];
    [(EKDayView *)self->_nextDay setHourScale:v55];
  }
  else
  {
    v56 = [MEMORY[0x1E4F57C00] sharedPreferences];
    v57 = [v56 dayViewHourScale];

    if (v57)
    {
      [v57 floatValue];
      double v59 = v58;
      [(EKDayView *)self->_currentDay setHourScale:v58];
      [(EKDayView *)self->_previousDay setHourScale:v59];
      [(EKDayView *)self->_nextDay setHourScale:v59];
    }
  }
  v60 = [(EKDayViewController *)self _createGutterDayViewWithDayView:self->_previousDay];
  previousDayWithGutter = self->_previousDayWithGutter;
  self->_previousDayWithGutter = v60;

  v62 = [(EKDayViewController *)self _createGutterDayViewWithDayView:self->_currentDay];
  currentDayWithGutter = self->_currentDayWithGutter;
  self->_currentDayWithGutter = v62;

  v64 = [(EKDayViewController *)self _createGutterDayViewWithDayView:self->_nextDay];
  nextDayWithGutter = self->_nextDayWithGutter;
  self->_nextDayWithGutter = v64;

  [(UIScrollView *)self->_horizontalScrollingView addSubview:self->_currentDayWithGutter];
  [(EKDayView *)self->_currentDay setCalendar:self->_calendar];
  v66 = [(NSCalendar *)self->_calendar timeZone];
  [(EKDayView *)self->_currentDay setTimeZone:v66];

  [(EKDayView *)self->_currentDay setDelegate:self];
  [(EKDayView *)self->_currentDay setDataSource:self];
  [(EKDayView *)self->_currentDay setAllowsOccurrenceSelection:self->_allowsSelection];
  v67 = self->_nextDay;
  if (v67)
  {
    [(EKDayView *)v67 setCalendar:self->_calendar];
    v68 = [(NSCalendar *)self->_calendar timeZone];
    [(EKDayView *)self->_nextDay setTimeZone:v68];

    [(EKDayView *)self->_nextDay setDelegate:self];
    [(EKDayView *)self->_nextDay setDataSource:self];
    [(EKDayView *)self->_nextDay setAllowsOccurrenceSelection:self->_allowsSelection];
  }
  v69 = self->_previousDay;
  if (v69)
  {
    [(EKDayView *)v69 setCalendar:self->_calendar];
    v70 = [(NSCalendar *)self->_calendar timeZone];
    [(EKDayView *)self->_previousDay setTimeZone:v70];

    [(EKDayView *)self->_previousDay setDelegate:self];
    [(EKDayView *)self->_previousDay setDataSource:self];
    [(EKDayView *)self->_previousDay setAllowsOccurrenceSelection:self->_allowsSelection];
  }
  v71 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v71 addObserver:self selector:sel__localeChanged_ name:*MEMORY[0x1E4F57AB0] object:0];
  [v71 addObserver:self selector:sel__showWeekNumbersPreferenceChanged_ name:*MEMORY[0x1E4F57AF0] object:0];
  [v71 addObserver:self selector:sel_preferredContentSizeDidChanged_ name:*MEMORY[0x1E4FB27A8] object:0];
}

- (BOOL)allowsDaySwitching
{
  return self->_allowsDaySwitching;
}

- (NSDateComponents)displayDate
{
  return self->_displayDate;
}

- (void)setFrame:(CGRect)a3 gutterWidth:(double)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ++self->_sizeTransitionsInProgress;
  double v10 = [(EKDayViewController *)self view];
  objc_msgSend(v10, "setFrame:", x, y, width, height);

  double v11 = [(EKDayViewController *)self view];
  [v11 layoutSubviews];

  [(EKDayViewController *)self setGutterWidth:a4];
  [(EKDayViewController *)self scrollDayViewAppropriatelyWithAnimation:0];
  if ((*((unsigned char *)self + 1040) & 1) == 0) {
    [(EKDayViewController *)self _relayoutDays];
  }
  --self->_sizeTransitionsInProgress;
}

- (void)layoutContainerView:(id)a3
{
  self->_requiresFullDayRelayout = 0;
  [a3 bounds];
  CGFloat v7 = v4;
  CGFloat v8 = v5;
  CGFloat v9 = v6;
  clipView = self->_clipView;
  if (clipView)
  {
    -[UIView setFrame:](clipView, "setFrame:", v4, 0.0, v5, v6);
    gutterdouble Width = self->_gutterWidth;
    v20.origin.double y = 0.0;
    v20.origin.double x = v7;
    v20.size.double width = v8;
    v20.size.double height = v9;
    double v12 = CGRectGetWidth(v20) + gutterWidth * 2.0;
    double v13 = [(EKDayViewController *)self view];
    IsRegularInViewHierarchdouble y = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v13);

    if (IsRegularInViewHierarchy)
    {
      double v15 = self->_gutterWidth;
      double v12 = v12 + v15 * -4.0;
    }
    else
    {
      double v15 = -gutterWidth;
    }
    v21.origin.double y = 0.0;
    v21.origin.double x = v7;
    v21.size.double width = v8;
    v21.size.double height = v9;
    double Height = CGRectGetHeight(v21);
    -[UIScrollView setFrame:](self->_horizontalScrollingView, "setFrame:", v15, 0.0, v12, Height);
    v22.origin.double y = 0.0;
    v22.origin.double x = v15;
    v22.size.double width = v12;
    v22.size.double height = Height;
    -[UIScrollView setContentSize:](self->_horizontalScrollingView, "setContentSize:", CGRectGetWidth(v22) * 3.0, 0.0);
  }
  else
  {
    -[EKDayView setFrame:](self->_currentDay, "setFrame:", v4, 0.0, v5, v6);
  }
  if ([(EKEventGestureController *)self->_eventGestureController dragGestureInProgress]) {
    char v17 = [(UIScrollView *)self->_horizontalScrollingView isScrollAnimating];
  }
  else {
    char v17 = 0;
  }
  if ((*((unsigned char *)self + 1040) & 1) == 0 && ![(UIScrollView *)self->_horizontalScrollingView isTracking])
  {
    char v18 = self->_springAnimatedDecelerationsInProgress > 0 ? 1 : v17;
    if ((v18 & 1) == 0)
    {
      [(EKDayViewController *)self _relayoutDays];
    }
  }
}

- (void)blockableScrollViewDidChangeFrameSize
{
  self->_requiresFullDayRelayout = 1;
  id v2 = [(EKDayViewController *)self view];
  [v2 setNeedsLayout];
}

- (void)_relayoutDays
{
  int IsLeftToRight = CalTimeDirectionIsLeftToRight();
  [(UIScrollView *)self->_horizontalScrollingView bounds];
  double v5 = v4;
  double v7 = v6;
  if (IsLeftToRight) {
    CGFloat v8 = &OBJC_IVAR___EKDayViewController__previousDayWithGutter;
  }
  else {
    CGFloat v8 = &OBJC_IVAR___EKDayViewController__nextDayWithGutter;
  }
  if (IsLeftToRight) {
    CGFloat v9 = &OBJC_IVAR___EKDayViewController__nextDayWithGutter;
  }
  else {
    CGFloat v9 = &OBJC_IVAR___EKDayViewController__previousDayWithGutter;
  }
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v8), "setFrame:", 0.0, 0.0);
  -[EKDayViewWithGutters setFrame:](self->_currentDayWithGutter, "setFrame:", v5, 0.0, v5, v7);
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v9), "setFrame:", v5 + v5, 0.0, v5, v7);
  -[UIScrollView setContentSize:](self->_horizontalScrollingView, "setContentSize:", v5 * 3.0, v7);
  [(EKDayViewWithGutters *)self->_currentDayWithGutter frame];
  -[UIScrollView setContentOffset:](self->_horizontalScrollingView, "setContentOffset:");

  [(EKDayViewController *)self _setNextAndPreviousFirstVisibleSecondToCurrent];
}

- (void)_setNextAndPreviousFirstVisibleSecondToCurrent
{
  uint64_t v3 = [(EKDayViewWithGutters *)self->_previousDayWithGutter superview];
  if (v3
    && (double v4 = (void *)v3,
        [(EKDayViewWithGutters *)self->_nextDayWithGutter superview],
        double v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    int v6 = 0;
  }
  else
  {
    double v7 = [(EKDayViewController *)self navigationController];
    CGFloat v8 = [v7 view];
    CGFloat v9 = [v8 window];
    EKUIPushFallbackSizingContextWithViewHierarchy(v9);

    int v6 = 1;
  }
  [(EKDayView *)self->_previousDay setFirstVisibleSecond:[(EKDayView *)self->_currentDay firstVisibleSecond]];
  [(EKDayView *)self->_nextDay setFirstVisibleSecond:[(EKDayView *)self->_currentDay firstVisibleSecond]];
  if (v6)
  {
    id v12 = [(EKDayViewController *)self navigationController];
    double v10 = [v12 view];
    double v11 = [v10 window];
    EKUIPopFallbackSizingContextWithViewHierarchy(v11);
  }
}

- (BOOL)dayViewShouldAnnotateAppEntities:(id)a3 onDayStarting:(id)a4
{
  return self->_currentDay == a3;
}

- (void)scrollDayViewAppropriatelyWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  displayDate = self->_displayDate;
  int v6 = CUIKTodayComponents();
  LODWORD(displayDate) = [(NSDateComponents *)displayDate isEqual:v6];

  if (displayDate)
  {
    [(EKDayViewController *)self scrollToNow:v3];
  }
  else
  {
    [(EKDayViewController *)self scrollEventsIntoViewAnimated:v3];
  }
}

void __101__EKDayViewController_loadDataBetweenStart_end_withTrigger_generation_completionForCurrentDayReload___block_invoke_8(uint64_t a1)
{
  int v2 = [*(id *)(*(void *)(a1 + 32) + 1088) generation];
  if (v2) {
    BOOL v3 = v2 < *(_DWORD *)(a1 + 48);
  }
  else {
    BOOL v3 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v7 = [*(id *)(a1 + 32) _eventsForDay:*(void *)(*(void *)(a1 + 32) + 992)];
    uint64_t v4 = [v7 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = *(void **)(v5 + 1088);
    *(void *)(v5 + 1088) = v4;
  }
}

void __101__EKDayViewController_loadDataBetweenStart_end_withTrigger_generation_completionForCurrentDayReload___block_invoke_10(uint64_t a1)
{
  int v2 = [*(id *)(*(void *)(a1 + 32) + 1096) generation];
  if (v2) {
    BOOL v3 = v2 < *(_DWORD *)(a1 + 48);
  }
  else {
    BOOL v3 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v7 = [*(id *)(a1 + 32) _eventsForDay:*(void *)(*(void *)(a1 + 32) + 1008)];
    uint64_t v4 = [v7 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = *(void **)(v5 + 1096);
    *(void *)(v5 + 1096) = v4;
  }
}

void __59__EKDayViewController_loadData_withTrigger_withCompletion___block_invoke_2(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 40) != 3)
  {
    int v2 = [*(id *)(a1 + 32) _eventsForDay:*(void *)(*(void *)(a1 + 32) + 1000)];
    uint64_t v3 = [v2 copy];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 1080);
    *(void *)(v4 + 1080) = v3;
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v6 + 1217))
  {
    id v7 = [(id)v6 _eventsForDay:*(void *)(v6 + 1008)];
    uint64_t v8 = [v7 copy];
    uint64_t v9 = *(void *)(a1 + 32);
    double v10 = *(void **)(v9 + 1096);
    *(void *)(v9 + 1096) = v8;

    id v14 = [*(id *)(a1 + 32) _eventsForDay:*(void *)(*(void *)(a1 + 32) + 992)];
    uint64_t v11 = [v14 copy];
    uint64_t v12 = *(void *)(a1 + 32);
    double v13 = *(void **)(v12 + 1088);
    *(void *)(v12 + 1088) = v11;
  }
}

void __101__EKDayViewController_loadDataBetweenStart_end_withTrigger_generation_completionForCurrentDayReload___block_invoke_6(uint64_t a1)
{
  int v2 = [*(id *)(*(void *)(a1 + 32) + 1080) generation];
  if (v2) {
    BOOL v3 = v2 < *(_DWORD *)(a1 + 48);
  }
  else {
    BOOL v3 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v7 = [*(id *)(a1 + 32) _eventsForDay:*(void *)(*(void *)(a1 + 32) + 1000)];
    uint64_t v4 = [v7 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 1080);
    *(void *)(v5 + 1080) = v4;
  }
}

- (void)scrollToNow:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(EKDayViewController *)self _shouldScrollToNow])
  {
    currentDadouble y = self->_currentDay;
    [(EKDayView *)currentDay scrollToNowAnimated:v3 whenFinished:0];
  }
}

- (BOOL)_canScrollToNow
{
  BOOL v3 = [(EKDayViewController *)self _isCurrentDayToday];
  return v3 & ![(EKDayView *)self->_currentDay isNowVisible];
}

- (BOOL)_isCurrentDayToday
{
  int v2 = [(EKDayView *)self->_currentDay displayDate];
  BOOL v3 = CUIKTodayComponents();
  char v4 = [v2 isEqual:v3];

  return v4;
}

- (void)updateGutterTopLabelsAppearance
{
  [(EKDayViewWithGutters *)self->_previousDayWithGutter setShowWeekNumberLabel:[(EKDayViewController *)self showWeekNumberLabel]];
  [(EKDayViewWithGutters *)self->_previousDayWithGutter setShowWeekDayLabel:[(EKDayViewController *)self showWeekdayLabel]];
  [(EKDayViewWithGutters *)self->_previousDayWithGutter updateLabelTexts];
  [(EKDayViewWithGutters *)self->_previousDayWithGutter updateDividerLineVisibility];
  [(EKDayViewWithGutters *)self->_previousDayWithGutter setNeedsLayout];
  [(EKDayViewWithGutters *)self->_currentDayWithGutter setShowWeekNumberLabel:[(EKDayViewController *)self showWeekNumberLabel]];
  [(EKDayViewWithGutters *)self->_currentDayWithGutter setShowWeekDayLabel:[(EKDayViewController *)self showWeekdayLabel]];
  [(EKDayViewWithGutters *)self->_currentDayWithGutter updateLabelTexts];
  [(EKDayViewWithGutters *)self->_currentDayWithGutter updateDividerLineVisibility];
  [(EKDayViewWithGutters *)self->_currentDayWithGutter setNeedsLayout];
  [(EKDayViewWithGutters *)self->_nextDayWithGutter setShowWeekNumberLabel:[(EKDayViewController *)self showWeekNumberLabel]];
  [(EKDayViewWithGutters *)self->_nextDayWithGutter setShowWeekDayLabel:[(EKDayViewController *)self showWeekdayLabel]];
  [(EKDayViewWithGutters *)self->_nextDayWithGutter updateLabelTexts];
  [(EKDayViewWithGutters *)self->_nextDayWithGutter updateDividerLineVisibility];
  nextDayWithGutter = self->_nextDayWithGutter;

  [(EKDayViewWithGutters *)nextDayWithGutter setNeedsLayout];
}

- (BOOL)showWeekdayLabel
{
  return self->_showWeekdayLabel;
}

- (BOOL)showWeekNumberLabel
{
  int v2 = [MEMORY[0x1E4F57C00] sharedPreferences];
  char v3 = [v2 showWeekNumbers];

  return v3;
}

- (id)_createGutterDayViewWithDayView:(id)a3
{
  id v4 = a3;
  [v4 frame];
  CGFloat x = v17.origin.x;
  CGFloat y = v17.origin.y;
  CGFloat width = v17.size.width;
  CGFloat height = v17.size.height;
  double v9 = CGRectGetWidth(v17);
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  double v10 = CGRectGetHeight(v18);
  gutterdouble Width = self->_gutterWidth;
  if ([(EKDayViewController *)self showWeekdayLabel])
  {
    +[EKDayViewWithGutters defaultTopLabelContainerHeight];
    double v10 = v10 + v12;
  }
  double v13 = -[EKDayViewWithGutters initWithFrame:dayView:sizeClass:showWeekDayLabel:showWeekNumberLabel:]([EKDayViewWithGutters alloc], "initWithFrame:dayView:sizeClass:showWeekDayLabel:showWeekNumberLabel:", v4, self->_targetSizeClass, [(EKDayViewController *)self showWeekdayLabel], [(EKDayViewController *)self showWeekNumberLabel], 0.0, 0.0, v9 + gutterWidth * 2.0, v10);
  [(EKDayViewWithGutters *)v13 setAutoresizingMask:18];
  int v14 = [v4 hasAllDaySection];

  [(EKDayViewWithGutters *)v13 setShowDividerLine:v14 ^ 1u];

  return v13;
}

- (id)_eventsForDay:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 displayDate];
  uint64_t v6 = (void *)[v5 copy];

  [v6 setHour:23];
  [v6 setMinute:59];
  [v6 setSecond:59];
  calendar = self->_calendar;
  uint64_t v8 = [v4 displayDate];

  double v9 = [(NSCalendar *)calendar dateFromComponents:v8];

  double v10 = [(NSCalendar *)self->_calendar dateFromComponents:v6];
  uint64_t v11 = [(EKDayViewController *)self eventsForStartDate:v9 endDate:v10];

  return v11;
}

- (id)eventsForStartDate:(id)a3 endDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  if (WeakRetained)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_dataSource);
    double v10 = [v9 dayViewController:self eventsForStartDate:v6 endDate:v7];
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

- (EKDayViewController)initWithTargetSizeClass:(int64_t)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)EKDayViewController;
  id v4 = [(EKDayViewController *)&v18 init];
  uint64_t v5 = v4;
  if (v4)
  {
    v4->_shouldScrollToNowOnViewWillAppear = 1;
    v4->_allowsDaySwitching = 1;
    v4->_allowsSelection = 1;
    uint64_t v6 = CUIKTodayComponents();
    displayDate = v5->_displayDate;
    v5->_displayDate = (NSDateComponents *)v6;

    uint64_t v8 = CUIKCalendar();
    calendar = v5->_calendar;
    v5->_calendar = (NSCalendar *)v8;

    v5->_gutterdouble Width = 0.0;
    uint64_t v10 = objc_opt_new();
    decelerationSpringFactorCGFloat y = v5->_decelerationSpringFactory;
    v5->_decelerationSpringFactorCGFloat y = (ScrollSpringFactory *)v10;

    v5->_preloadExtraDays = 1;
    v5->_int64_t targetSizeClass = a3;
    v5->_needsReload = 1;
    [(EKDayViewController *)v5 _setDisplayDateInternal:v5->_displayDate];
    objc_initWeak(&location, v5);
    v19[0] = objc_opt_class();
    double v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __47__EKDayViewController_initWithTargetSizeClass___block_invoke;
    v15[3] = &unk_1E60874F8;
    objc_copyWeak(&v16, &location);
    id v13 = (id)[(EKDayViewController *)v5 registerForTraitChanges:v12 withHandler:v15];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return v5;
}

- (void)_setDisplayDateInternal:(id)a3
{
  id v4 = a3;
  id v10 = (id)[v4 copy];
  [v10 setHour:0];
  [v10 setMinute:0];
  [v10 setSecond:0];
  uint64_t v5 = (void *)[v4 copy];

  [v5 setHour:23];
  [v5 setMinute:59];
  [v5 setSecond:59];
  uint64_t v6 = [(NSCalendar *)self->_calendar dateFromComponents:v10];
  [v6 timeIntervalSinceReferenceDate];
  self->_dayStart = v7;

  uint64_t v8 = [(NSCalendar *)self->_calendar dateFromComponents:v10];
  [v8 timeIntervalSinceReferenceDate];
  self->_dayEnd = v9;
}

- (void)dayView:(id)a3 didCreateOccurrenceViews:(id)a4
{
  uint64_t v5 = [(EKEventGestureController *)self->_eventGestureController draggingView];

  if (v5)
  {
    uint64_t v6 = [(EKEventGestureController *)self->_eventGestureController draggingView];
    double v7 = [v6 layer];
    uint64_t v8 = [v7 animationKeys];
    uint64_t v9 = [v8 count];

    if (!v9)
    {
      eventGestureController = self->_eventGestureController;
      [(EKEventGestureController *)eventGestureController updateDraggingOccurrence];
    }
  }
}

uint64_t __101__EKDayViewController_loadDataBetweenStart_end_withTrigger_generation_completionForCurrentDayReload___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performDisplayedOccurrencesChangedDelegateMethodWithTrigger:*(unsigned int *)(a1 + 40)];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EKDayViewController;
  [(EKDayViewController *)&v8 viewDidMoveToWindow:v6 shouldAppearOrDisappear:v4];
  if ([(EKDayViewController *)self isViewLoaded])
  {
    int64_t v7 = [(EKDayViewController *)self _effectiveInterfaceOrientationForSize:EKUICurrentWindowSize(v6)];
    [(EKDayView *)self->_previousDay setOrientation:v7];
    [(EKDayView *)self->_currentDay setOrientation:v7];
    [(EKDayView *)self->_nextDay setOrientation:v7];
  }
}

- (void)setDisplayDate:(id)a3
{
  id v4 = a3;
  if ((*((unsigned char *)self + 1040) & 1) == 0
    && ([v4 isEqual:self->_displayDate] & 1) == 0
    && ![(EKEventGestureController *)self->_eventGestureController dragGestureInProgress])
  {
    [(EKEventGestureController *)self->_eventGestureController endForcedStart:0];
  }
  [(EKDayView *)self->_currentDay setDimmedOccurrence:0];
  [(EKDayViewController *)self _setDisplayDate:v4 forRepeat:0];
}

- (void)_setDisplayDate:(id)a3 forRepeat:(BOOL)a4 animate:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  [(EKDayViewController *)self _completeScrollingAnimationIfNeeded];
  [(EKDayViewController *)self _completeDecelerationIfNeeded];
  id obj = [v8 dateComponentsForDateOnly];

  if (!self->_instigatedDateChange && ([obj isEqual:self->_displayDate] & 1) == 0)
  {
    uint64_t v9 = (NSDateComponents *)[obj copy];
    displayDate = self->_displayDate;
    self->_displayDate = v9;

    double dayStart = self->_dayStart;
    [(EKDayViewController *)self _setDisplayDateInternal:obj];
    [(EKDayView *)self->_currentDay stopScrolling];
    if ((*((unsigned char *)self + 1072) & 2) != 0)
    {
LABEL_40:
      [(EKDayViewController *)self _performDisplayedOccurrencesChangedDelegateMethodWithTrigger:0];
      goto LABEL_41;
    }
    if (!self->_horizontalScrollingView)
    {
      char v14 = 0;
      goto LABEL_34;
    }
    if (a4 || !self->_viewAppeared) {
      goto LABEL_31;
    }
    double v12 = [(EKDayView *)self->_previousDay displayDate];
    int v13 = [v12 isEqual:obj];

    if (v13 && v5)
    {
      [(EKDayViewController *)self _setNextAndPreviousFirstVisibleSecondToCurrent];
      *((unsigned char *)self + 1040) |= 1u;
      char v14 = 1;
      [(EKEventGestureController *)self->_eventGestureController setCommitBlocked:1];
      uint64_t v15 = 1016;
      goto LABEL_15;
    }
    if (!self->_viewAppeared) {
      goto LABEL_31;
    }
    id v16 = [(EKDayView *)self->_nextDay displayDate];
    int v17 = [v16 isEqual:obj];

    if (v17 && v5)
    {
      [(EKDayViewController *)self _setNextAndPreviousFirstVisibleSecondToCurrent];
      *((unsigned char *)self + 1040) |= 1u;
      char v14 = 1;
      [(EKEventGestureController *)self->_eventGestureController setCommitBlocked:1];
      uint64_t v15 = 1032;
LABEL_15:
      [*(id *)((char *)&self->super.super.super.isa + v15) frame];
      -[EKDayViewController _setHorizontalContentOffsetUsingSpringAnimation:](self, "_setHorizontalContentOffsetUsingSpringAnimation:");
      objc_super v18 = [*(id *)((char *)&self->super.super.super.isa + v15) superview];

      if (!v18) {
        [(UIScrollView *)self->_horizontalScrollingView addSubview:*(Class *)((char *)&self->super.super.super.isa + v15)];
      }
      goto LABEL_34;
    }
    if (!self->_viewAppeared) {
      goto LABEL_31;
    }
    double v19 = [(EKDayView *)self->_currentDay displayDate];
    if ([v19 isEqual:obj] && v5)
    {
      [(EKDayViewWithGutters *)self->_currentDayWithGutter frame];
      double v21 = v20;
      double v23 = v22;
      [(UIScrollView *)self->_horizontalScrollingView contentOffset];
      double v25 = v24;
      double v27 = v26;

      if (v21 != v25 || v23 != v27)
      {
        [(EKDayViewController *)self _setNextAndPreviousFirstVisibleSecondToCurrent];
        *((unsigned char *)self + 1040) |= 1u;
        char v14 = 1;
        [(EKEventGestureController *)self->_eventGestureController setCommitBlocked:1];
        [(EKDayViewWithGutters *)self->_currentDayWithGutter frame];
        -[EKDayViewController _setHorizontalContentOffsetUsingSpringAnimation:](self, "_setHorizontalContentOffsetUsingSpringAnimation:");
        goto LABEL_34;
      }
    }
    else
    {
    }
    if (!self->_viewAppeared || !self->_alwaysAnimate || !v5)
    {
LABEL_31:
      v37 = [obj dateComponents:30 byAddingDays:0xFFFFFFFFLL calendar:self->_calendar];
      v38 = [obj dateComponents:30 byAddingDays:1 calendar:self->_calendar];
      [(EKDayViewController *)self _setDayView:self->_previousDay toDate:v37];
      [(EKDayViewController *)self _setDayView:self->_currentDay toDate:obj];
      [(EKDayViewController *)self _setDayView:self->_nextDay toDate:v38];
      [(EKDayViewController *)self _setNextAndPreviousFirstVisibleSecondToCurrent];
      if ((*((unsigned char *)self + 1040) & 1) == 0) {
        [(EKDayViewController *)self _relayoutDays];
      }

      char v14 = 0;
      goto LABEL_34;
    }
    double v28 = [(EKDayViewController *)self calendar];
    v29 = [(EKDayView *)self->_currentDay displayDate];
    v30 = [v28 dateFromComponents:v29];

    double v31 = [(EKDayViewController *)self calendar];
    double v32 = [v31 dateFromComponents:obj];

    uint64_t v33 = [v30 compare:v32];
    [(EKDayViewController *)self _setNextAndPreviousFirstVisibleSecondToCurrent];
    *((unsigned char *)self + 1040) |= 1u;
    [(EKEventGestureController *)self->_eventGestureController setCommitBlocked:1];
    self->_correctAfterScroll = 1;
    objc_storeStrong((id *)&self->_targetDateComponents, obj);
    if (v33 == 1)
    {
      p_previousDayWithGutter = &self->_previousDayWithGutter;
      v39 = [(EKDayViewWithGutters *)self->_previousDayWithGutter superview];

      v36 = &OBJC_IVAR___EKDayViewController__previousDay;
      if (!v39) {
LABEL_45:
      }
        [(UIScrollView *)self->_horizontalScrollingView addSubview:*p_previousDayWithGutter];
    }
    else
    {
      if (v33 != -1)
      {
        char v14 = 0;
        goto LABEL_48;
      }
      p_previousDayWithGutter = &self->_nextDayWithGutter;
      int64_t v35 = [(EKDayViewWithGutters *)self->_nextDayWithGutter superview];

      v36 = &OBJC_IVAR___EKDayViewController__nextDay;
      if (!v35) {
        goto LABEL_45;
      }
    }
    [(EKDayViewController *)self _setDayView:*(Class *)((char *)&self->super.super.super.isa + *v36) toDate:obj];
    [(EKDayViewWithGutters *)*p_previousDayWithGutter frame];
    -[EKDayViewController _setHorizontalContentOffsetUsingSpringAnimation:](self, "_setHorizontalContentOffsetUsingSpringAnimation:");
    char v14 = 1;
LABEL_48:

LABEL_34:
    if ((*((unsigned char *)self + 1040) & 1) == 0
      && dayStart != self->_dayStart
      && [(EKDayViewController *)self isViewLoaded])
    {
      [(EKDayView *)self->_currentDay setDisplayDate:obj];
      [(EKDayViewController *)self reloadData];
    }
    if ((v14 & 1) == 0) {
      [(EKDayViewController *)self scrollToNow:0];
    }
    goto LABEL_40;
  }
LABEL_41:
}

- (void)_setDisplayDate:(id)a3 forRepeat:(BOOL)a4
{
}

- (void)_completeScrollingAnimationIfNeeded
{
  if (self->_needToCompleteScrollingAnimation)
  {
    self->_needToCompleteScrollingAnimation = 0;
    [(EKDayViewController *)self _relayoutDaysDuringScrollingAndPerformDayChanges:0];
    [(EKDayViewController *)self _cleanUpTargetDateComponents];
  }
}

- (void)_completeDecelerationIfNeeded
{
  if (self->_needToCompleteDeceleration)
  {
    self->_needToCompleteDeceleration = 0;
    [(EKDayViewController *)self _scrollViewDidEndDecelerating:self->_horizontalScrollingView];
  }
}

- (int64_t)_effectiveInterfaceOrientationForSize:(CGSize)a3
{
  if (a3.height > a3.width) {
    return 1;
  }
  else {
    return 4;
  }
}

- (BOOL)dayViewShouldDrawSynchronously:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0) {
    return 0;
  }
  id v7 = objc_loadWeakRetained((id *)p_delegate);
  char v8 = [v7 dayViewControllerShouldDrawSynchronously:self];

  return v8;
}

- (id)_occurrencesForDayView:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  char v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__12;
  protectionQueue = self->_protectionQueue;
  int v17 = __Block_byref_object_dispose__12;
  id v18 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__EKDayViewController__occurrencesForDayView___block_invoke;
  block[3] = &unk_1E6089CC8;
  id v10 = v4;
  uint64_t v11 = self;
  double v12 = &v13;
  id v6 = v4;
  dispatch_sync(protectionQueue, block);
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v7;
}

- (void)dayViewDidCompleteAsyncLoadAndLayout:(id)a3
{
  if (self->_currentDay == a3)
  {
    id v4 = [(EKEventGestureController *)self->_eventGestureController draggingView];

    if (v4) {
      [(EKEventGestureController *)self->_eventGestureController updateDraggingOccurrenceForced:1 animated:1];
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = objc_loadWeakRetained((id *)&self->_delegate);
      [v7 dayViewControllerCurrentDayDidCompleteAsyncLoadAndLayout:self];
    }
  }
}

- (void)setGutterWidth:(double)a3
{
  self->_gutterdouble Width = a3;
  -[EKDayViewWithGutters setGutterWidth:](self->_nextDayWithGutter, "setGutterWidth:");
  [(EKDayViewWithGutters *)self->_previousDayWithGutter setGutterWidth:a3];
  currentDayWithGutter = self->_currentDayWithGutter;

  [(EKDayViewWithGutters *)currentDayWithGutter setGutterWidth:a3];
}

- (void)loadDataBetweenStart:(id)a3 end:(id)a4 withTrigger:(int)a5 generation:(int)a6 completionForCurrentDayReload:(id)a7
{
  id v12 = a7;
  id v13 = a4;
  [a3 timeIntervalSinceReferenceDate];
  double v15 = v14;
  [v13 timeIntervalSinceReferenceDate];
  double v17 = v16;

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __101__EKDayViewController_loadDataBetweenStart_end_withTrigger_generation_completionForCurrentDayReload___block_invoke;
  aBlock[3] = &unk_1E6088890;
  aBlock[4] = self;
  int v43 = a5;
  id v18 = _Block_copy(aBlock);
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __101__EKDayViewController_loadDataBetweenStart_end_withTrigger_generation_completionForCurrentDayReload___block_invoke_3;
  v39[3] = &unk_1E6089C78;
  v39[4] = self;
  int v41 = a5;
  id v19 = v12;
  id v40 = v19;
  double v20 = _Block_copy(v39);
  [(EKDayView *)self->_currentDay dayEnd];
  if (v15 < v21)
  {
    [(EKDayView *)self->_currentDay dayStart];
    if (v17 >= v22)
    {
      reloadQueue = self->_reloadQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __101__EKDayViewController_loadDataBetweenStart_end_withTrigger_generation_completionForCurrentDayReload___block_invoke_5;
      block[3] = &unk_1E6089C78;
      void block[4] = self;
      int v38 = a6;
      id v37 = v20;
      dispatch_async(reloadQueue, block);
    }
  }
  if (self->_preloadExtraDays)
  {
    [(EKDayView *)self->_previousDay dayEnd];
    if (v15 < v24)
    {
      [(EKDayView *)self->_previousDay dayStart];
      if (v17 >= v25)
      {
        double v26 = self->_reloadQueue;
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __101__EKDayViewController_loadDataBetweenStart_end_withTrigger_generation_completionForCurrentDayReload___block_invoke_7;
        v33[3] = &unk_1E6089C78;
        v33[4] = self;
        int v35 = a6;
        id v34 = v18;
        dispatch_async(v26, v33);
      }
    }
    [(EKDayView *)self->_nextDay dayEnd];
    if (v15 < v27)
    {
      [(EKDayView *)self->_nextDay dayStart];
      if (v17 >= v28)
      {
        v29 = self->_reloadQueue;
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __101__EKDayViewController_loadDataBetweenStart_end_withTrigger_generation_completionForCurrentDayReload___block_invoke_9;
        v30[3] = &unk_1E6089C78;
        v30[4] = self;
        int v32 = a6;
        id v31 = v18;
        dispatch_async(v29, v30);
      }
    }
  }
}

- (void)setStartingFirstVisibleSecond:(int)a3
{
  self->_startingFirstVisibleSecond = a3;
}

- (void)setShowsBanner:(BOOL)a3
{
  self->_showsBanner = a3;
}

- (void)setShowWeekdayLabel:(BOOL)a3
{
  self->_showWeekdayLabel = a3;
  [(EKDayViewController *)self updateGutterTopLabelsAppearance];
}

- (void)setShouldLogVisibleEvents:(BOOL)a3
{
  self->_shouldLogVisibleEvents = a3;
}

- (void)setShouldAutoscrollAfterAppearance:(BOOL)a3
{
  self->_shouldAutoscrollAfterAppearance = a3;
}

- (void)setDisableNotifyDateChangeDuringTracking:(BOOL)a3
{
  self->_disableNotifyDateChangeDuringTracking = a3;
}

- (void)setAlwaysAnimate:(BOOL)a3
{
  self->_alwaysAnimate = a3;
}

- (double)gutterWidth
{
  return self->_gutterWidth;
}

void __46__EKDayViewController__occurrencesForDayView___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  v1 = (void *)a1[5];
  if (v2 == v1[126])
  {
    BOOL v5 = (void *)v1[137];
    char v3 = (void **)(*(void *)(a1[6] + 8) + 40);
  }
  else
  {
    char v3 = (void **)(*(void *)(a1[6] + 8) + 40);
    if (v2 == v1[124]) {
      uint64_t v4 = 136;
    }
    else {
      uint64_t v4 = 135;
    }
    BOOL v5 = (void *)v1[v4];
  }
  id v6 = v5;
  id v7 = *v3;
  *char v3 = v6;
}

- (void)setDelegate:(id)a3
{
}

- (void)setDataSource:(id)a3
{
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)EKDayViewController;
  [(EKDayViewController *)&v5 viewWillAppear:a3];
  if (self->_shouldScrollToNowOnViewWillAppear)
  {
    self->_shouldScrollToNowOnViewWillAppear = 0;
    currentDaCGFloat y = self->_currentDay;
    if (self->_startingFirstVisibleSecond < 0)
    {
      [(EKDayView *)currentDay scrollToNowAnimated:0 whenFinished:0];
    }
    else
    {
      -[EKDayView setFirstVisibleSecond:](currentDay, "setFirstVisibleSecond:");
      [(EKDayView *)self->_currentDay layoutIfNeeded];
    }
  }
  [(EKDayViewController *)self reloadDataIfNeeded];
}

- (void)reloadData
{
  self->_needsReload = 0;
  [(EKDayViewController *)self loadData:1 withTrigger:0 withCompletion:0];
}

- (void)reloadDataIfNeeded
{
  if (self->_needsReload) {
    [(EKDayViewController *)self reloadData];
  }
}

- (void)loadData:(BOOL)a3 withTrigger:(int)a4 withCompletion:(id)a5
{
  id v8 = a5;
  if ([(EKDayViewController *)self isViewLoaded])
  {
    [(EKDayView *)self->_currentDay layoutSubviews];
    [(EKDayView *)self->_previousDay layoutSubviews];
    [(EKDayView *)self->_nextDay layoutSubviews];
    reloadQueue = self->_reloadQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__EKDayViewController_loadData_withTrigger_withCompletion___block_invoke;
    block[3] = &unk_1E6089CA0;
    void block[4] = self;
    int v12 = a4;
    BOOL v13 = a3;
    id v11 = v8;
    dispatch_async(reloadQueue, block);
  }
}

- (void)dayView:(id)a3 firstVisibleSecondChanged:(unint64_t)a4
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v9 = objc_loadWeakRetained((id *)p_delegate);
    id v8 = [(EKDayViewController *)self currentDayView];
    objc_msgSend(v9, "dayViewController:requestsSaveFirstVisibleSecondPreference:", self, objc_msgSend(v8, "firstVisibleSecond"));
  }
}

- (EKDayView)currentDayView
{
  return self->_currentDay;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)EKDayViewController;
  [(EKDayViewController *)&v4 viewDidLoad];
  if ([(EKDayViewController *)self shouldLogVisibleEvents])
  {
    char v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:self selector:sel__logUserStateDiagnostics_ name:*MEMORY[0x1E4F57B10] object:0];
  }
}

- (BOOL)shouldLogVisibleEvents
{
  return self->_shouldLogVisibleEvents;
}

void __101__EKDayViewController_loadDataBetweenStart_end_withTrigger_generation_completionForCurrentDayReload___block_invoke_7(uint64_t a1)
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(NSObject **)(v2 + 1192);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __101__EKDayViewController_loadDataBetweenStart_end_withTrigger_generation_completionForCurrentDayReload___block_invoke_8;
  block[3] = &unk_1E6089C50;
  void block[4] = v2;
  void block[5] = &v6;
  int v5 = *(_DWORD *)(a1 + 48);
  dispatch_sync(v3, block);
  if (*((unsigned char *)v7 + 24)) {
    [*(id *)(*(void *)(a1 + 32) + 992) loadData:1 withCompletion:*(void *)(a1 + 40)];
  }
  _Block_object_dispose(&v6, 8);
}

void __101__EKDayViewController_loadDataBetweenStart_end_withTrigger_generation_completionForCurrentDayReload___block_invoke_9(uint64_t a1)
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(NSObject **)(v2 + 1192);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __101__EKDayViewController_loadDataBetweenStart_end_withTrigger_generation_completionForCurrentDayReload___block_invoke_10;
  block[3] = &unk_1E6089C50;
  void block[4] = v2;
  void block[5] = &v6;
  int v5 = *(_DWORD *)(a1 + 48);
  dispatch_sync(v3, block);
  if (*((unsigned char *)v7 + 24)) {
    [*(id *)(*(void *)(a1 + 32) + 1008) loadData:1 withCompletion:*(void *)(a1 + 40)];
  }
  _Block_object_dispose(&v6, 8);
}

void __59__EKDayViewController_loadData_withTrigger_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(NSObject **)(v2 + 1192);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__EKDayViewController_loadData_withTrigger_withCompletion___block_invoke_2;
  block[3] = &unk_1E6088890;
  int v25 = *(_DWORD *)(a1 + 48);
  void block[4] = v2;
  dispatch_sync(v3, block);
  objc_super v4 = dispatch_group_create();
  int v5 = v4;
  if (*(_DWORD *)(a1 + 48) != 3)
  {
    dispatch_group_enter(v4);
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 1000);
    uint64_t v7 = *(unsigned __int8 *)(a1 + 52);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __59__EKDayViewController_loadData_withTrigger_withCompletion___block_invoke_3;
    v22[3] = &unk_1E6087570;
    double v23 = v5;
    [v6 loadData:v7 withCompletion:v22];
  }
  if (*(unsigned char *)(*(void *)(a1 + 32) + 1217))
  {
    dispatch_group_enter(v5);
    uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 992);
    uint64_t v9 = *(unsigned __int8 *)(a1 + 52);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __59__EKDayViewController_loadData_withTrigger_withCompletion___block_invoke_4;
    v20[3] = &unk_1E6087570;
    id v10 = v5;
    double v21 = v10;
    [v8 loadData:v9 withCompletion:v20];
    dispatch_group_enter(v10);
    id v11 = *(void **)(*(void *)(a1 + 32) + 1008);
    uint64_t v12 = *(unsigned __int8 *)(a1 + 52);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __59__EKDayViewController_loadData_withTrigger_withCompletion___block_invoke_5;
    v18[3] = &unk_1E6087570;
    id v19 = v10;
    [v11 loadData:v12 withCompletion:v18];
  }
  dispatch_time_t v13 = dispatch_time(0, 10000000000);
  dispatch_group_wait(v5, v13);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __59__EKDayViewController_loadData_withTrigger_withCompletion___block_invoke_6;
  v15[3] = &unk_1E6089C78;
  double v14 = *(void **)(a1 + 40);
  void v15[4] = *(void *)(a1 + 32);
  int v17 = *(_DWORD *)(a1 + 48);
  id v16 = v14;
  dispatch_async(MEMORY[0x1E4F14428], v15);
}

- (void)setPreloadExtraDays:(BOOL)a3
{
  if (self->_preloadExtraDays != a3)
  {
    self->_preloadExtraDays = a3;
    if (a3)
    {
      if (self->_needsReload) {
        [(EKDayViewController *)self reloadData];
      }
      else {
        [(EKDayViewController *)self loadData:1 withTrigger:3 withCompletion:0];
      }
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)EKDayViewController;
  [(EKDayViewController *)&v4 viewDidAppear:a3];
  self->_viewAppeared = 1;
}

void __101__EKDayViewController_loadDataBetweenStart_end_withTrigger_generation_completionForCurrentDayReload___block_invoke_5(uint64_t a1)
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(NSObject **)(v2 + 1192);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __101__EKDayViewController_loadDataBetweenStart_end_withTrigger_generation_completionForCurrentDayReload___block_invoke_6;
  block[3] = &unk_1E6089C50;
  void block[4] = v2;
  void block[5] = &v6;
  int v5 = *(_DWORD *)(a1 + 48);
  dispatch_sync(v3, block);
  if (*((unsigned char *)v7 + 24)) {
    [*(id *)(*(void *)(a1 + 32) + 1000) loadData:1 withCompletion:*(void *)(a1 + 40)];
  }
  _Block_object_dispose(&v6, 8);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v38 = a3;
  if (![(EKDayViewController *)self _isResizing] && !self->_adjustingForDeceleration)
  {
    objc_super v4 = [v38 panGestureRecognizer];
    [v4 velocityInView:v38];
    double v6 = v5;

    int IsLeftToRight = CalTimeDirectionIsLeftToRight();
    BOOL v8 = v6 < 0.0;
    if (!IsLeftToRight) {
      BOOL v8 = v6 > 0.0;
    }
    if (v8)
    {
      p_nextDayWithGutter = &self->_nextDayWithGutter;
      id v10 = [(EKDayViewWithGutters *)self->_nextDayWithGutter superview];

      if (!v10) {
        goto LABEL_8;
      }
    }
    p_nextDayWithGutter = &self->_previousDayWithGutter;
    id v11 = [(EKDayViewWithGutters *)self->_previousDayWithGutter superview];

    if (!v11) {
LABEL_8:
    }
      [(UIScrollView *)self->_horizontalScrollingView addSubview:*p_nextDayWithGutter];
    uint64_t v12 = [(EKDayViewWithGutters *)self->_nextDayWithGutter superview];
    if (v12)
    {
    }
    else
    {
      [(UIScrollView *)self->_horizontalScrollingView bounds];
      CGFloat v14 = v13;
      CGFloat v16 = v15;
      CGFloat v18 = v17;
      CGFloat v20 = v19;
      [(EKDayViewWithGutters *)self->_nextDayWithGutter frame];
      v42.origin.CGFloat x = v21;
      v42.origin.CGFloat y = v22;
      v42.size.CGFloat width = v23;
      v42.size.CGFloat height = v24;
      v40.origin.CGFloat x = v14;
      v40.origin.CGFloat y = v16;
      v40.size.CGFloat width = v18;
      v40.size.CGFloat height = v20;
      if (CGRectIntersectsRect(v40, v42)) {
        [(UIScrollView *)self->_horizontalScrollingView addSubview:self->_nextDayWithGutter];
      }
    }
    int v25 = [(EKDayViewWithGutters *)self->_previousDayWithGutter superview];
    if (v25)
    {
    }
    else
    {
      [(UIScrollView *)self->_horizontalScrollingView bounds];
      CGFloat v27 = v26;
      CGFloat v29 = v28;
      CGFloat v31 = v30;
      CGFloat v33 = v32;
      [(EKDayViewWithGutters *)self->_previousDayWithGutter frame];
      v43.origin.CGFloat x = v34;
      v43.origin.CGFloat y = v35;
      v43.size.CGFloat width = v36;
      v43.size.CGFloat height = v37;
      v41.origin.CGFloat x = v27;
      v41.origin.CGFloat y = v29;
      v41.size.CGFloat width = v31;
      v41.size.CGFloat height = v33;
      if (CGRectIntersectsRect(v41, v43)) {
        [(UIScrollView *)self->_horizontalScrollingView addSubview:self->_previousDayWithGutter];
      }
    }
    if ((*((unsigned char *)self + 1040) & 1) == 0 && self->_viewAppeared) {
      [(EKDayViewController *)self _relayoutDaysDuringScrolling];
    }
    if ((*((unsigned char *)self + 1072) & 1) != 0 && [(UIScrollView *)self->_horizontalScrollingView isTracking])
    {
      *((unsigned char *)self + 1072) &= ~1u;
      if ((*((unsigned char *)self + 1040) & 2) != 0)
      {
        [(EKDayViewController *)self _setDayView:self->_nextDay toDate:self->_pendingNextDate];
        *((unsigned char *)self + 1040) &= ~2u;
      }
      if (*((unsigned char *)self + 1056))
      {
        [(EKDayViewController *)self _setDayView:self->_previousDay toDate:self->_pendingPreviousDate];
        *((unsigned char *)self + 1056) &= ~1u;
      }
    }
    [(EKDayViewController *)self _updateAllDayAreaHeight];
  }
}

- (BOOL)_isResizing
{
  if (self->_sizeTransitionsInProgress > 0 || self->_requiresFullDayRelayout) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  horizontalScrollingView = self->_horizontalScrollingView;

  return [(UIScrollView *)horizontalScrollingView isResizing];
}

- (EKDayViewController)init
{
  return [(EKDayViewController *)self initWithTargetSizeClass:1];
}

void __47__EKDayViewController_initWithTargetSizeClass___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = WeakRetained;
    [WeakRetained[125] resetOccurrenceViewColors];
    [v2[126] resetOccurrenceViewColors];
    [v2[124] resetOccurrenceViewColors];
    id WeakRetained = v2;
  }
}

- (void)dealloc
{
  [(UIScrollView *)self->_horizontalScrollingView setDelegate:0];
  char v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(EKEventGestureController *)self->_eventGestureController invalidate];
  [(EKDayViewController *)self _stopShowNowTimer];
  v4.receiver = self;
  v4.super_class = (Class)EKDayViewController;
  [(EKDayViewController *)&v4 dealloc];
}

- (void)setScrollEventsInToViewIgnoresVisibility:(BOOL)a3
{
}

- (BOOL)scrollEventsInToViewIgnoresVisibility
{
  return [(EKDayView *)self->_currentDay scrollEventsInToViewIgnoresVisibility];
}

- (void)_scrollDayViewAfterRelayoutDays
{
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)EKDayViewController;
  [(EKDayViewController *)&v4 viewWillDisappear:a3];
  self->_viewAppeared = 0;
  [(EKDayViewController *)self _stopShowNowTimer];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)EKDayViewController;
  [(EKDayViewController *)&v4 viewDidDisappear:a3];
  [(EKEventGestureController *)self->_eventGestureController endForcedStart:0];
  [(EKDayView *)self->_currentDay setDimmedOccurrence:0];
}

- (void)setAllowsDaySwitching:(BOOL)a3
{
  if (self->_allowsDaySwitching != a3)
  {
    self->_allowsDaySwitching = a3;
    -[UIScrollView setScrollEnabled:](self->_horizontalScrollingView, "setScrollEnabled:");
  }
}

- (void)setAllowsSelection:(BOOL)a3
{
  if (self->_allowsSelection != a3)
  {
    self->_allowsSelection = a3;
    -[EKDayView setAllowsOccurrenceSelection:](self->_currentDay, "setAllowsOccurrenceSelection:");
  }
}

- (unint64_t)firstVisibleSecond
{
  return [(EKDayView *)self->_currentDay firstVisibleSecond];
}

- (id)occurrenceViewForEvent:(id)a3
{
  return [(EKDayViewController *)self occurrenceViewForEvent:a3 occurrenceDate:0];
}

- (id)occurrenceViewForEvent:(id)a3 occurrenceDate:(id)a4
{
  return [(EKDayViewController *)self occurrenceViewForEvent:a3 includeNextAndPreviousDays:0];
}

- (id)occurrenceViewForEvent:(id)a3 includeNextAndPreviousDays:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = self->_currentDay;
  uint64_t v8 = [(EKDayView *)self->_currentDay occurrenceViewForEvent:v6];
  if (v8) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = !v4;
  }
  if (v9)
  {
    id v11 = (void *)v8;
  }
  else
  {
    id v10 = self->_nextDay;

    id v11 = [(EKDayView *)self->_nextDay occurrenceViewForEvent:v6];
    uint64_t v7 = v10;
  }
  if (v11) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = !v4;
  }
  if (!v12)
  {
    double v13 = self->_previousDay;

    id v11 = [(EKDayView *)self->_previousDay occurrenceViewForEvent:v6];
    uint64_t v7 = v13;
  }
  if (v11)
  {
    CGFloat v14 = [(EKDayViewController *)self view];
    double v15 = [v14 window];
    EKUIPushFallbackSizingContextWithViewHierarchy(v15);

    [(EKDayView *)v7 layoutIfNeeded];
    CGFloat v16 = [(EKDayViewController *)self view];
    double v17 = [v16 window];
    EKUIPopFallbackSizingContextWithViewHierarchy(v17);
  }

  return v11;
}

- (id)gestureController
{
  return self->_eventGestureController;
}

- (UIView)currentAllDayView
{
  return (UIView *)[(EKDayView *)self->_currentDay allDayView];
}

- (UIView)currentTopLabelsContainer
{
  return [(EKDayViewWithGutters *)self->_currentDayWithGutter topLabelsContainer];
}

- (NSArray)currentDayContentGridViewSubviews
{
  uint64_t v2 = [(EKDayView *)self->_currentDay dayContent];
  char v3 = [v2 grid];
  BOOL v4 = [v3 occurrenceContainerView];
  double v5 = [v4 subviews];

  return (NSArray *)v5;
}

- (BOOL)currentDayContainsOccurrences
{
  return [(EKDayView *)self->_currentDay containsOccurrences];
}

- (void)setAnimateAllDayAreaHeight:(BOOL)a3
{
  if (self->_animateAllDayAreaHeight != a3)
  {
    self->_animateAllDayAreadouble Height = a3;
    if (a3)
    {
      [(EKDayViewController *)self _updateAllDayAreaHeight];
    }
    else
    {
      BOOL v4 = [(EKDayViewWithGutters *)self->_currentDayWithGutter dayView];
      double v5 = [v4 allDayView];
      [v5 setFixedHeight:-1.0];

      id v6 = [(EKDayViewWithGutters *)self->_previousDayWithGutter dayView];
      uint64_t v7 = [v6 allDayView];
      [v7 setFixedHeight:-1.0];

      id v9 = [(EKDayViewWithGutters *)self->_nextDayWithGutter dayView];
      uint64_t v8 = [v9 allDayView];
      [v8 setFixedHeight:-1.0];
    }
  }
}

- (BOOL)_isCalendarDate:(id)a3 sameDayAsComponents:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 era];
  if (v7 == [v6 era]
    && (uint64_t v8 = [v5 year], v8 == objc_msgSend(v6, "year"))
    && (uint64_t v9 = [v5 month], v9 == objc_msgSend(v6, "month")))
  {
    uint64_t v10 = [v5 day];
    BOOL v11 = v10 == [v6 day];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)preferredEventsToSelectOnDate:(id)a3
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_currentDaCGFloat y = &self->_currentDay;
  id v6 = [(EKDayView *)self->_currentDay displayDate];
  BOOL v7 = [(EKDayViewController *)self _isCalendarDate:v4 sameDayAsComponents:v6];

  if (v7) {
    goto LABEL_4;
  }
  p_currentDaCGFloat y = &self->_previousDay;
  uint64_t v8 = [(EKDayView *)self->_previousDay displayDate];
  BOOL v9 = [(EKDayViewController *)self _isCalendarDate:v4 sameDayAsComponents:v8];

  if (v9
    || (p_currentDaCGFloat y = &self->_nextDay,
        [(EKDayView *)self->_nextDay displayDate],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        BOOL v11 = [(EKDayViewController *)self _isCalendarDate:v4 sameDayAsComponents:v10], v10, v11))
  {
LABEL_4:
    BOOL v12 = *p_currentDay;
  }
  else
  {
    BOOL v12 = 0;
  }
  double v13 = CUIKTodayComponents();
  CGFloat v14 = [(EKDayView *)v12 displayDate];
  uint64_t v15 = [v14 era];
  if (v15 == [v13 era])
  {
    CGFloat v16 = [(EKDayView *)v12 displayDate];
    uint64_t v17 = [v16 year];
    if (v17 == [v13 year])
    {
      CGFloat v18 = [(EKDayView *)v12 displayDate];
      uint64_t v19 = [v18 month];
      if (v19 == [v13 month])
      {
        CGFloat v20 = [(EKDayView *)v12 displayDate];
        CGFloat v21 = v12;
        id v22 = v4;
        uint64_t v23 = [v20 day];
        BOOL v24 = v23 == [v13 day];
        id v4 = v22;
        BOOL v12 = v21;
        int v25 = v24;
        int v68 = v25;
      }
      else
      {
        int v68 = 0;
      }
    }
    else
    {
      int v68 = 0;
    }
  }
  else
  {
    int v68 = 0;
  }

  v65 = CUIKNowDate();
  double v26 = [(EKDayView *)v12 occurrenceViews];
  CGFloat v27 = v26;
  if (v26 && [v26 count])
  {
    v63 = v27;
    v64 = v13;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id v28 = v27;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v72 objects:v76 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      v62 = v12;
      v69 = 0;
      v70 = v4;
      id v66 = 0;
      v67 = self;
      uint64_t v71 = *(void *)v73;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v73 != v71) {
            objc_enumerationMutation(v28);
          }
          double v32 = v28;
          CGFloat v33 = *(void **)(*((void *)&v72 + 1) + 8 * i);
          CGFloat v34 = objc_msgSend(v33, "occurrence", v62);
          CGFloat v35 = [v34 startCalendarDate];
          CGFloat v36 = [v34 endCalendarDate];
          CGFloat v37 = [v36 dayComponents];
          BOOL v38 = [(EKDayViewController *)self _isCalendarDate:v35 sameDayAsComponents:v37];

          if (v38
            || ([v34 startDate],
                v39 = objc_claimAutoreleasedReturnValue(),
                [v70 date],
                CGRect v40 = objc_claimAutoreleasedReturnValue(),
                uint64_t v41 = [v39 compare:v40],
                v40,
                v39,
                v41 != -1))
          {
            if ([v34 status] != 3
              && (CUIKEventDisplaysAsDeclined() & 1) == 0
              && [v34 existsInStore])
            {
              if (v69)
              {
                CGRect v42 = [v69 occurrence];
                CGRect v43 = [v42 startDate];
                v44 = [v34 startDate];
                uint64_t v45 = [v43 compare:v44];

                if (v45 == 1)
                {
                  id v46 = v33;

                  id v47 = v46;
                }
                else
                {
                  id v47 = v69;
                }
              }
              else
              {
                id v47 = v33;
              }
              v69 = v47;
              self = v67;
              if (v68)
              {
                int64_t v48 = [v34 endDateUnadjustedForLegacyClients];
                uint64_t v49 = [v48 compare:v65];

                if (v49 == 1)
                {
                  if (v66)
                  {
                    v50 = [v66 occurrence];
                    v51 = [v50 startDate];
                    v52 = [v34 startDate];
                    uint64_t v53 = [v51 compare:v52];

                    if (v53 == 1)
                    {
                      id v54 = v33;

                      id v66 = v54;
                    }
                  }
                  else
                  {
                    id v66 = v33;
                  }
                }
              }
            }
          }

          id v28 = v32;
        }
        uint64_t v30 = [v32 countByEnumeratingWithState:&v72 objects:v76 count:16];
      }
      while (v30);

      BOOL v12 = v62;
      if (v66)
      {
        double v55 = [v66 occurrences];

        v56 = v69;
        id v4 = v70;
        CGFloat v27 = v63;
        double v13 = v64;
        goto LABEL_53;
      }
      id v4 = v70;
      CGFloat v27 = v63;
      double v13 = v64;
      if (v69)
      {
        double v55 = [v69 occurrences];
        v56 = v69;
        goto LABEL_53;
      }
    }
    else
    {
    }
  }
  v57 = [(EKDayView *)v12 allDayView];
  double v55 = [v57 occurrenceViews];

  v56 = v55;
  if (v55)
  {
    if ([v55 count])
    {
      float v58 = v55;
      double v59 = [v55 firstObject];
      v60 = [v59 occurrence];

      if (v60)
      {
        double v55 = [v59 occurrences];
      }
      else
      {
        double v55 = 0;
      }

      v56 = v58;
    }
    else
    {
      double v55 = 0;
    }
  }
LABEL_53:

  return v55;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (id)_eventsForCutOrCopy
{
  char v3 = [(EKEventGestureController *)self->_eventGestureController event];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F1CAD0];
    id v5 = [(EKEventGestureController *)self->_eventGestureController event];
    uint64_t v6 = [v4 setWithObject:v5];
    goto LABEL_3;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = objc_loadWeakRetained((id *)&self->_delegate);
    id v5 = [v11 selectedOccurrencesForDayViewController:self];

    if (![v5 count])
    {
      BOOL v7 = 0;
      goto LABEL_4;
    }
    uint64_t v6 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
LABEL_3:
    BOOL v7 = (void *)v6;
LABEL_4:

    goto LABEL_5;
  }
  BOOL v7 = 0;
LABEL_5:

  return v7;
}

- (void)copy:(id)a3
{
  id v6 = [(EKDayViewController *)self _eventsForCutOrCopy];
  if ([v6 count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    id v5 = [WeakRetained pasteboardManagerForDayViewController:self];

    [v5 copyEvents:v6 delegate:self];
    [(EKEventGestureController *)self->_eventGestureController endForcedStart:0];
  }
}

- (void)cut:(id)a3
{
  id v6 = [(EKDayViewController *)self _eventsForCutOrCopy];
  if ([v6 count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    id v5 = [WeakRetained pasteboardManagerForDayViewController:self];

    [v5 cutEvents:v6 delegate:self];
    [(EKEventGestureController *)self->_eventGestureController endForcedStart:0];
  }
}

- (void)paste:(id)a3
{
  id v8 = [(EKDayViewController *)self _eventsForCutOrCopy];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v5 = [WeakRetained pasteboardManagerForDayViewController:self];

  if ([v8 count] == 1)
  {
    id v6 = [v8 anyObject];
    BOOL v7 = [v6 startDate];
    [v5 setDateForPaste:v7];
  }
  else
  {
    id v6 = [(NSCalendar *)self->_calendar dateFromComponents:self->_displayDate];
    [v5 setDateForPaste:v6];
  }

  [v5 pasteEventsWithDateMode:0 delegate:self];
  [(EKEventGestureController *)self->_eventGestureController endForcedStart:0];
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if (([MEMORY[0x1E4F57BF0] declinesToPerformCutCopyPasteAction:a3 withSender:v6] & 1) == 0)
  {
    if (sel_paste_ == a3)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
      BOOL v9 = [WeakRetained pasteboardManagerForDayViewController:self];

      char v10 = [v9 canPerformPaste];
    }
    else
    {
      if (sel_copy_ == a3)
      {
        id v11 = (void *)MEMORY[0x1E4F57BF0];
        BOOL v9 = [(EKDayViewController *)self _eventsForCutOrCopy];
        BOOL v12 = v11;
        uint64_t v13 = 1;
      }
      else
      {
        if (sel_cut_ != a3)
        {
          v16.receiver = self;
          v16.super_class = (Class)EKDayViewController;
          BOOL v7 = [(EKDayViewController *)&v16 canPerformAction:a3 withSender:v6];
          goto LABEL_12;
        }
        CGFloat v14 = (void *)MEMORY[0x1E4F57BF0];
        BOOL v9 = [(EKDayViewController *)self _eventsForCutOrCopy];
        BOOL v12 = v14;
        uint64_t v13 = 0;
      }
      char v10 = [v12 allEventsValidForAction:v13 fromEvents:v9];
    }
    BOOL v7 = v10;

    goto LABEL_12;
  }
  BOOL v7 = 0;
LABEL_12:

  return v7;
}

- (void)dayView:(id)a3 didSelectEvent:(id)a4 userInitiated:(BOOL)a5
{
  BOOL v5 = a5;
  id v13 = a4;
  BOOL v7 = [(EKEventGestureController *)self->_eventGestureController event];

  if (!v7)
  {
    if (!v13) {
      goto LABEL_11;
    }
    goto LABEL_8;
  }
  [(EKDayView *)self->_currentDay setDimmedOccurrence:0];
  if ([(EKDayViewController *)self _shouldEndGestureEditingOnTap]
    && ![(EKEventGestureController *)self->_eventGestureController dragGestureInProgress])
  {
    [(EKEventGestureController *)self->_eventGestureController endForcedStart:0];
  }
  if ([(EKDayViewController *)self notifyWhenTapOtherEventDuringDragging])
  {
LABEL_8:
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      BOOL v9 = WeakRetained;
      id v10 = objc_loadWeakRetained((id *)&self->_delegate);
      char v11 = objc_opt_respondsToSelector();

      if (v11)
      {
        id v12 = objc_loadWeakRetained((id *)&self->_delegate);
        [v12 dayViewController:self didSelectEvent:v13 animated:1 userInitiated:v5];
      }
    }
  }
LABEL_11:
}

- (void)dayView:(id)a3 didSelectEvents:(id)a4 userInitiated:(BOOL)a5
{
  BOOL v5 = a5;
  id v12 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = objc_loadWeakRetained((id *)&self->_delegate);
      [v11 dayViewController:self didSelectEvents:v12 animated:1 userInitiated:v5];
    }
  }
}

- (void)dayView:(id)a3 didScaleDayViewWithScale:(double)a4
{
  [(EKDayView *)self->_previousDay setHourScale:a3];
  [(EKDayView *)self->_previousDay setNeedsLayout];
  [(EKDayView *)self->_nextDay setHourScale:a4];
  [(EKDayView *)self->_nextDay setNeedsLayout];
  id v6 = [MEMORY[0x1E4F57C00] sharedPreferences];
  *(float *)&double v7 = a4;
  id v8 = [NSNumber numberWithFloat:v7];
  [v6 setDayViewHourScale:v8];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = objc_loadWeakRetained((id *)&self->_delegate);
    [v11 dayViewController:self requestsSaveHourScalePreference:a4];
  }
  id v12 = objc_loadWeakRetained((id *)&self->_delegate);
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    id v14 = objc_loadWeakRetained((id *)&self->_delegate);
    [v14 dayViewControllerDidFinishPinchingDayView:self];
  }
  eventGestureController = self->_eventGestureController;

  [(EKEventGestureController *)eventGestureController updateDraggingOccurrenceFrame];
}

- (void)dayView:(id)a3 isPinchingDayViewWithScale:(double)a4
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    [v8 dayViewControllerIsPinchingDayView:self];
  }
  eventGestureController = self->_eventGestureController;

  [(EKEventGestureController *)eventGestureController updateDraggingOccurrenceFrame];
}

- (id)dayView:(id)a3 selectedCopyViewForOccurrence:(id)a4
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    id v9 = [v8 dayViewController:self selectedCopyViewForView:v5];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)presentationControllerForEditMenu
{
  uint64_t v2 = [(EKDayViewController *)self currentPresentationController];
  char v3 = [v2 presentedViewController];

  if (v3)
  {
    id v4 = [v2 presentedViewController];
  }
  else
  {
    id v4 = v2;
  }
  id v5 = v4;

  return v5;
}

- (id)selectedEventsForEditMenu
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v3 = [WeakRetained selectedEventsForEditMenu];

  return v3;
}

- (void)setCalendar:(id)a3
{
  id v9 = a3;
  if (([v9 isEqual:self->_calendar] & 1) == 0)
  {
    id v4 = [(NSCalendar *)self->_calendar dateFromComponents:self->_displayDate];
    id v5 = [(NSCalendar *)self->_calendar timeZone];
    id v6 = (NSCalendar *)[v9 copy];
    calendar = self->_calendar;
    self->_calendar = v6;

    [(NSCalendar *)self->_calendar setTimeZone:v5];
    [(EKDayViewController *)self _setDisplayDateInternal:self->_displayDate];
    id v8 = [(NSCalendar *)self->_calendar components:30 fromDate:v4];
    [(EKDayViewController *)self setDisplayDate:v8];
  }
}

- (void)setTimeZone:(id)a3
{
  id v6 = a3;
  id v4 = [(NSCalendar *)self->_calendar timeZone];
  char v5 = [v6 isEqualToTimeZone:v4];

  if ((v5 & 1) == 0)
  {
    [(NSCalendar *)self->_calendar setTimeZone:v6];
    [(EKDayViewController *)self _setDisplayDateInternal:self->_displayDate];
    [(EKDayView *)self->_currentDay setTimeZone:v6];
    [(EKDayView *)self->_previousDay setTimeZone:v6];
    [(EKDayView *)self->_nextDay setTimeZone:v6];
  }
}

- (void)setGestureOccurrenceSuperview:(id)a3
{
  id v8 = (UIView *)a3;
  if (self->_gestureOccurrenceSuperview != v8)
  {
    objc_storeStrong((id *)&self->_gestureOccurrenceSuperview, a3);
    char v5 = [(EKEventGestureController *)self->_eventGestureController draggingView];

    if (v5)
    {
      id v6 = [(EKEventGestureController *)self->_eventGestureController draggingView];
      char v7 = [(EKDayViewController *)self _eventGestureSuperview];
      CalSwitchViewToSuperview(v6, v7);
    }
  }
}

- (void)scrollToDate:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  currentDaCGFloat y = self->_currentDay;
  id v6 = [a3 date];
  [(EKDayView *)currentDay scrollToDate:v6 animated:v4 whenFinished:0];
}

- (void)scrollEventIntoView:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  previousDaCGFloat y = self->_previousDay;
  id v7 = a3;
  [(EKDayView *)previousDay scrollToEvent:v7 animated:v4 completionBlock:0];
  [(EKDayView *)self->_nextDay scrollToEvent:v7 animated:v4 completionBlock:0];
  currentDaCGFloat y = self->_currentDay;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__EKDayViewController_scrollEventIntoView_animated___block_invoke;
  v9[3] = &unk_1E6087570;
  v9[4] = self;
  [(EKDayView *)currentDay scrollToEvent:v7 animated:v4 completionBlock:v9];
}

void __52__EKDayViewController_scrollEventIntoView_animated___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) gestureController];
  [v1 updateDraggingOccurrenceOrigin];
}

- (void)scrollEventsIntoViewAnimated:(BOOL)a3
{
}

- (void)bringEventToFront:(id)a3
{
}

- (void)insertViewForEvent:(id)a3 belowViewForOtherEvent:(id)a4
{
}

- (void)editorDidSaveEvent:(id)a3
{
  id v7 = a3;
  [(EKEventGestureController *)self->_eventGestureController endForcedStart:0];
  [(EKDayView *)self->_currentDay setDimmedOccurrence:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 dayViewController:self awaitsRefreshingOccurrence:v7];
  }
  [(EKDayViewController *)self reloadData];
}

- (void)editorDidDeleteEvent:(id)a3
{
  id v7 = a3;
  [(EKEventGestureController *)self->_eventGestureController endForcedStart:0];
  [(EKDayView *)self->_currentDay setDimmedOccurrence:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 dayViewController:self awaitsDeletingOccurrence:v7];
  }
  [(EKDayViewController *)self reloadData];
}

- (void)editorDidCancelEditingEvent:(id)a3
{
  [(EKEventGestureController *)self->_eventGestureController endForcedStart:1];
  currentDaCGFloat y = self->_currentDay;

  [(EKDayView *)currentDay setDimmedOccurrence:0];
}

- (void)setNeedsReload
{
  self->_needsReload = 1;
}

- (void)reloadDataForOccurrenceChangeWithGeneration:(int)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  protectionQueue = self->_protectionQueue;
  char v10 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__EKDayViewController_reloadDataForOccurrenceChangeWithGeneration___block_invoke;
  block[3] = &unk_1E6089C50;
  void block[4] = self;
  void block[5] = &v7;
  int v6 = a3;
  dispatch_sync(protectionQueue, block);
  if (*((unsigned char *)v8 + 24)) {
    [(EKDayViewController *)self reloadData];
  }
  _Block_object_dispose(&v7, 8);
}

uint64_t __67__EKDayViewController_reloadDataForOccurrenceChangeWithGeneration___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(*(void *)(a1 + 32) + 1088) generation];
  int v3 = [*(id *)(*(void *)(a1 + 32) + 1080) generation];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 1096) generation];
  if (v2 && v2 < *(_DWORD *)(a1 + 48) || v3 && v3 < *(_DWORD *)(a1 + 48))
  {
    BOOL v5 = 1;
  }
  else if (result)
  {
    BOOL v5 = (int)result < *(_DWORD *)(a1 + 48);
  }
  else
  {
    BOOL v5 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5;
  return result;
}

void __101__EKDayViewController_loadDataBetweenStart_end_withTrigger_generation_completionForCurrentDayReload___block_invoke_3(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _delegateRespondsToDisplayedOccurrencesChangedMethod])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __101__EKDayViewController_loadDataBetweenStart_end_withTrigger_generation_completionForCurrentDayReload___block_invoke_4;
    block[3] = &unk_1E6089C78;
    int v2 = *(void **)(a1 + 40);
    void block[4] = *(void *)(a1 + 32);
    int v5 = *(_DWORD *)(a1 + 48);
    id v4 = v2;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __101__EKDayViewController_loadDataBetweenStart_end_withTrigger_generation_completionForCurrentDayReload___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) _performDisplayedOccurrencesChangedDelegateMethodWithTrigger:*(unsigned int *)(a1 + 48)];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    int v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)significantTimeChangeOccurred
{
  [(EKDayView *)self->_nextDay adjustForSignificantTimeChange];
  [(EKDayView *)self->_currentDay adjustForSignificantTimeChange];
  previousDaCGFloat y = self->_previousDay;

  [(EKDayView *)previousDay adjustForSignificantTimeChange];
}

- (void)timeZoneChanged
{
  int v3 = [(EKDayViewController *)self calendar];
  id v8 = [v3 dateFromComponents:self->_displayDate];

  id v4 = [(EKDayViewController *)self calendar];
  int v5 = [v8 dateByAddingDays:1 inCalendar:v4];

  int v6 = [(EKDayViewController *)self calendar];
  uint64_t v7 = [v8 dateByAddingDays:-1 inCalendar:v6];

  [(EKDayViewWithGutters *)self->_nextDayWithGutter timeZoneChangedWithNewDate:v5];
  [(EKDayViewWithGutters *)self->_currentDayWithGutter timeZoneChangedWithNewDate:v8];
  [(EKDayViewWithGutters *)self->_previousDayWithGutter timeZoneChangedWithNewDate:v7];
  [(EKDayView *)self->_nextDay adjustForTimeZoneChanged];
  [(EKDayView *)self->_currentDay adjustForTimeZoneChanged];
  [(EKDayView *)self->_previousDay adjustForTimeZoneChanged];
}

- (void)_localeChanged:(id)a3
{
  id v4 = [(EKDayViewController *)self view];
  [v4 setNeedsLayout];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__EKDayViewController__localeChanged___block_invoke;
  block[3] = &unk_1E6087570;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __38__EKDayViewController__localeChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateGutterTopLabelsAppearance];
}

- (void)_showWeekNumbersPreferenceChanged:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__EKDayViewController__showWeekNumbersPreferenceChanged___block_invoke;
  block[3] = &unk_1E6087570;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __57__EKDayViewController__showWeekNumbersPreferenceChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateGutterTopLabelsAppearance];
}

- (void)preferredContentSizeDidChanged:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__EKDayViewController_preferredContentSizeDidChanged___block_invoke;
  block[3] = &unk_1E6087570;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __54__EKDayViewController_preferredContentSizeDidChanged___block_invoke(uint64_t a1)
{
  +[EKUILargeTextUtilities clearCache];
  int v2 = *(void **)(a1 + 32);

  return [v2 updateGutterTopLabelsAppearance];
}

- (void)_highlightEvent:(id)a3 dayViewDate:(double)a4 isAllDay:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  uint64_t v9 = [(EKDayViewController *)self gestureController];
  int v10 = [v9 currentDragSnappingType];

  double v11 = CalSnapDateTo15MinuteOr5MinuteInterval(v8, v10, a4 - self->_dayStart);
  double v12 = v11 / 3600.0;
  if (v5) {
    double v12 = -1.0;
  }
  [(EKDayView *)self->_currentDay highlightHour:v12];
  currentDaCGFloat y = self->_currentDay;

  [(EKDayView *)currentDay setAllDayLabelHighlighted:v5];
}

- (void)dayViewDidTapEmptySpace:(id)a3 onDate:(id)a4
{
  id v6 = a4;
  if (self->_currentDay == a3)
  {
    uint64_t v7 = dispatch_group_create();
    if ([(EKDayViewController *)self _shouldEndGestureEditingOnTap])
    {
      [(EKEventGestureController *)self->_eventGestureController endForcedStart:0];
      [(EKDayView *)self->_currentDay setDimmedOccurrence:0];
      dispatch_group_enter(v7);
      currentDaCGFloat y = self->_currentDay;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __54__EKDayViewController_dayViewDidTapEmptySpace_onDate___block_invoke;
      v11[3] = &unk_1E6087570;
      double v12 = v7;
      [(EKDayView *)currentDay loadData:1 withCompletion:v11];
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__EKDayViewController_dayViewDidTapEmptySpace_onDate___block_invoke_2;
    block[3] = &unk_1E6087D68;
    void block[4] = self;
    id v10 = v6;
    dispatch_group_notify(v7, MEMORY[0x1E4F14428], block);
  }
}

void __54__EKDayViewController_dayViewDidTapEmptySpace_onDate___block_invoke(uint64_t a1)
{
}

uint64_t __54__EKDayViewController_dayViewDidTapEmptySpace_onDate___block_invoke_2(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 dayViewControllerDidTapEmptySpace:*(void *)(a1 + 32) onDate:*(void *)(a1 + 40)];
  }
  BOOL v5 = *(void **)(a1 + 32);

  return [v5 _performDisplayedOccurrencesChangedDelegateMethodWithTrigger:0];
}

- (id)_eventGestureSuperview
{
  char v3 = [(EKDayViewController *)self gestureOccurrenceSuperview];
  if (v3)
  {
    id v4 = [(EKDayViewController *)self gestureOccurrenceSuperview];
  }
  else
  {
    id v4 = self->_clipView;
  }
  BOOL v5 = v4;

  return v5;
}

- (double)horizontalOffsetForPagingForEventGestureController:(id)a3
{
  id v4 = [(EKDayViewController *)self view];
  IsRegularInViewHierarchCGFloat y = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v4);

  if (IsRegularInViewHierarchy) {
    return self->_gutterWidth * 2.0 + 80.0;
  }
  else {
    return 80.0;
  }
}

- (id)createOccurrenceViewForEventGestures
{
  char v3 = [EKDayOccurrenceView alloc];
  id v4 = -[EKDayOccurrenceView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(EKDayOccurrenceView *)v4 setDelegate:self];

  return v4;
}

- (id)createOccurrenceViewForEventGestureController:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)eventGestureController:(id)a3 adjustDraggingView:(id)a4 forAllDay:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a4;
  [v9 setAllDayDrawingStyle:v5];
  currentDaCGFloat y = self->_currentDay;
  if (v5)
  {
    id v8 = [(EKDayView *)currentDay allDayView];
    [v8 configureOccurrenceViewForGestureController:v9];
  }
  else
  {
    [(EKDayView *)currentDay configureOccurrenceViewForGestureController:v9];
  }
}

- (id)createEventForEventGestureController:(id)a3
{
  id v4 = [(NSCalendar *)self->_calendar dateFromComponents:self->_displayDate];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v6 = (void *)[WeakRetained dayViewController:self createEventAtDate:v4 allDay:0];

  return v6;
}

- (void)showTimelineHighlightForTime:(id)a3
{
  [a3 timeIntervalSinceReferenceDate];

  -[EKDayViewController _highlightEvent:dayViewDate:isAllDay:](self, "_highlightEvent:dayViewDate:isAllDay:", 0, 0);
}

- (void)hideTimelineHighlight
{
  [(EKDayView *)self->_currentDay highlightHour:-1.0];
  [(EKDayView *)self->_currentDay setAllDayLabelHighlighted:0];
  [(EKDayView *)self->_previousDay highlightHour:-1.0];
  [(EKDayView *)self->_previousDay setAllDayLabelHighlighted:0];
  [(EKDayView *)self->_nextDay highlightHour:-1.0];
  nextDaCGFloat y = self->_nextDay;

  [(EKDayView *)nextDay setAllDayLabelHighlighted:0];
}

- (double)eventGestureController:(id)a3 yPositionPerhapsMatchingAllDayOccurrence:(id)a4 atPoint:(CGPoint)a5
{
  id v7 = a4;
  id v8 = [(EKDayViewController *)self touchTrackingViewForEventGestureController:a3];
  [(EKDayView *)self->_currentDay yPositionPerhapsMatchingAllDayOccurrence:v7];
  double v10 = v9;

  objc_msgSend(v8, "convertPoint:fromView:", self->_currentDay, 0.0, v10);
  double v12 = v11;

  return v12;
}

- (void)eventGestureController:(id)a3 addViewToScroller:(id)a4 isAllDay:(BOOL)a5
{
  BOOL v5 = a5;
  id v13 = a3;
  id v8 = a4;
  uint64_t v9 = [(EKDayViewController *)self gestureOccurrenceSuperview];
  if (v9
    && (double v10 = (void *)v9,
        [v13 draggingView],
        id v11 = (id)objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v11 == v8))
  {
    double v12 = [(EKDayViewController *)self gestureOccurrenceSuperview];
    CalSwitchViewToSuperview(v8, v12);
  }
  else
  {
    [(EKDayView *)self->_currentDay addViewToScroller:v8 isAllDay:v5];
  }
}

- (id)eventGestureController:(id)a3 occurrenceViewAtPoint:(CGPoint)a4 ignoreSelectedCopyView:(BOOL)a5
{
  double y = a4.y;
  double x = a4.x;
  currentDadouble y = self->_currentDay;
  uint64_t v9 = [(EKDayViewController *)self _eventGestureSuperview];
  -[EKDayView convertPoint:fromView:](currentDay, "convertPoint:fromView:", v9, x, y);
  double v11 = v10;
  double v13 = v12;

  id v14 = self->_currentDay;

  return -[EKDayView occurrenceViewAtPoint:](v14, "occurrenceViewAtPoint:", v11, v13);
}

- (id)eventGestureController:(id)a3 occurrenceViewForOccurrence:(id)a4 occurrenceDate:(id)a5
{
  return [(EKDayViewController *)self occurrenceViewForEvent:a4];
}

- (id)eventGestureController:(id)a3 occurrenceViewForOccurrence:(id)a4
{
  return [(EKDayViewController *)self occurrenceViewForEvent:a4];
}

- (BOOL)eventGestureController:(id)a3 isAllDayAtPoint:(CGPoint)a4 requireInsistence:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a4.y;
  double x = a4.x;
  currentDayWithGutter = self->_currentDayWithGutter;
  double v10 = [(EKDayViewController *)self _eventGestureSuperview];
  -[EKDayViewWithGutters convertPoint:fromView:](currentDayWithGutter, "convertPoint:fromView:", v10, x, y);
  double v12 = v11;
  double v14 = v13;

  uint64_t v15 = self->_currentDayWithGutter;

  return -[EKDayViewWithGutters isPointAllDay:requireAllDayRegionInsistence:](v15, "isPointAllDay:requireAllDayRegionInsistence:", v5, v12, v14);
}

- (double)eventGestureController:(id)a3 dateAtPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  currentDadouble y = self->_currentDay;
  id v8 = [(EKDayViewController *)self _eventGestureSuperview];
  -[EKDayView convertPoint:fromView:](currentDay, "convertPoint:fromView:", v8, x, y);
  double v10 = v9;
  double v12 = v11;

  double v13 = self->_currentDay;

  -[EKDayView dateAtPoint:isAllDay:](v13, "dateAtPoint:isAllDay:", 0, v10, v12);
  return result;
}

- (CGPoint)pointAtDate:(double)a3 isAllDay:(BOOL)a4
{
  [(EKDayView *)self->_currentDay pointAtDate:a4 isAllDay:a3];
  double v6 = v5;
  double v8 = v7;
  CalRoundToScreenScale(0.5);
  double v10 = v9;
  CalTimeDirectionIsLeftToRight();
  double v11 = [(EKDayViewController *)self _eventGestureSuperview];
  objc_msgSend(v11, "convertPoint:fromView:", self->_currentDay, v6 + 2.0, v8 - v10);
  double v13 = v12;
  double v15 = v14;

  double v16 = v13;
  double v17 = v15;
  result.double y = v17;
  result.double x = v16;
  return result;
}

- (CGPoint)eventGestureController:(id)a3 pointAtDate:(double)a4 isAllDay:(BOOL)a5
{
  [(EKDayViewController *)self pointAtDate:a5 isAllDay:a4];
  result.double y = v6;
  result.double x = v5;
  return result;
}

- (double)eventGestureController:(id)a3 widthForOccurrenceViewOfDays:(unint64_t)a4
{
  [(EKDayView *)self->_currentDay frame];
  double v6 = v5;
  [(EKDayView *)self->_currentDay leftContentInset];
  return v6 - v7 + -4.0;
}

- (double)eventGestureController:(id)a3 heightForOccurrenceViewOfDuration:(double)a4
{
  uint64_t v6 = [(EKDayViewController *)self interfaceOrientation];
  double v7 = [(EKDayViewController *)self view];
  +[EKDayTimeView hourHeightForSizeClass:EKUIWidthSizeClassForViewHierarchy(v7) orientation:v6];
  double v9 = v8;
  [(EKDayView *)self->_currentDay hourScale];
  double v11 = v9 * v10 * a4 / 3600.0;
  +[EKDayOccurrenceView bottomShadowMargin];
  double v13 = v12 + v11;

  CalRoundToScreenScale(0.5);
  double v15 = v13 + v14;
  double v16 = [(EKDayViewController *)self view];
  +[EKDayOccurrenceView minimumHeightForSizeClass:EKUIWidthSizeClassForViewHierarchy(v16) orientation:v6];
  double v18 = v17;

  if (v15 >= v18) {
    return v15;
  }
  else {
    return v18;
  }
}

- (double)eventGestureController:(id)a3 heightForAllDayOccurrenceView:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(EKDayViewController *)self interfaceOrientation];
  double v7 = [(EKDayViewController *)self view];
  +[EKDayOccurrenceView minimumHeightForSizeClass:EKUIWidthSizeClassForViewHierarchy(v7) orientation:v6 isAllDay:1];
  double v9 = v8;

  double v10 = [v5 currentImageState];
  LODWORD(v6) = [v10 requiresLanguageAwarePadding];

  if (v6)
  {
    double v11 = [v5 currentImageState];
    [v11 totalLanguageAwareHeightPadding];
    double v9 = v9 + v12;
  }
  return v9;
}

- (double)timedRegionOriginForEventGestureController:(id)a3
{
  id v4 = [(EKDayViewController *)self touchTrackingViewForEventGestureController:a3];
  [(EKDayView *)self->_currentDay timedRegionYOrigin];
  objc_msgSend(v4, "convertPoint:fromView:", self->_currentDay, 0.0, v5);
  double v7 = v6;

  return v7;
}

- (void)eventGestureController:(id)a3 requestsPresentationOfViewController:(id)a4
{
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    [v7 dayViewController:self requestsPresentationOfViewControllerForGestures:v8];
  }
}

- (void)eventGestureController:(id)a3 requestsShowEvent:(id)a4
{
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    [v7 dayViewController:self requestsShowEvent:v8 showDetails:1];
  }
}

- (BOOL)eventGestureControllerShouldAllowLongPress:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0) {
    return 0;
  }
  id v7 = objc_loadWeakRetained((id *)p_delegate);
  char v8 = [v7 dayViewControllerShouldAllowLongPress:self];

  return v8;
}

- (void)eventGestureController:(id)a3 didSetUpAtDate:(double)a4 isAllDay:(BOOL)a5
{
  BOOL v5 = a5;
  id v18 = a3;
  char v8 = [v18 event];
  [(EKDayViewController *)self _highlightEvent:v8 dayViewDate:v5 isAllDay:a4];

  double v9 = [v18 event];
  [(EKDayView *)self->_currentDay setDimmedOccurrence:v9];

  double v10 = (NSDateComponents *)[(NSDateComponents *)self->_displayDate copy];
  originalDisplayDate = self->_originalDisplayDate;
  self->_originalDisplayDate = v10;

  double v12 = [v18 draggingView];
  uint64_t v13 = [(EKDayViewController *)self _eventGestureSuperview];
  CalSwitchViewToSuperview(v12, (void *)v13);

  double v14 = [(EKDayViewController *)self delegate];
  LOBYTE(v13) = objc_opt_respondsToSelector();

  if (v13)
  {
    double v15 = [(EKDayViewController *)self delegate];
    [v15 dayViewcontrollerDidBeginMovingEventWithGesture:self];
  }
  double v16 = [MEMORY[0x1E4F25540] sharedInstance];
  double v17 = [v18 event];
  [v16 prepareForEventUpdate:v17];
}

- (void)eventGestureController:(id)a3 didMoveToDate:(double)a4 isAllDay:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = [a3 event];
  [(EKDayViewController *)self _highlightEvent:v8 dayViewDate:v5 isAllDay:a4];
}

- (BOOL)eventGestureController:(id)a3 didCommitOccurrence:(id)a4 toDate:(double)a5 isAllDay:(BOOL)a6 span:(int64_t)a7
{
  id v10 = a3;
  id v11 = a4;
  [(EKDayView *)self->_currentDay highlightHour:-1.0];
  [(EKDayView *)self->_currentDay setAllDayLabelHighlighted:0];
  if (![v11 isNew])
  {
    uint64_t v19 = [(EKDayViewController *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      CGFloat v20 = [(EKDayViewController *)self delegate];
      char v21 = [v20 dayViewController:self willDuplicateOccurrence:v11];

      if (v21) {
        goto LABEL_32;
      }
    }
    else
    {
    }
    id v22 = [(EKDayViewController *)self currentEditor];

    if (v22)
    {
      uint64_t v13 = [(EKDayViewController *)self currentEditor];
      [v13 refreshStartAndEndDates];
LABEL_13:

      goto LABEL_32;
    }
    uint64_t v23 = [(EKDayViewController *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      BOOL v24 = [(EKDayViewController *)self delegate];
      if ([v24 delegateWantsToHandleDayViewController:self gestureCommittingOccurrence:v11])
      {
        int v25 = [(EKDayViewController *)self delegate];
        char v26 = objc_opt_respondsToSelector();

        if (v26)
        {
          uint64_t v13 = [(EKDayViewController *)self delegate];
          [v13 dayViewController:self handleGestureCommittingOccurrence:v11];
          goto LABEL_13;
        }
LABEL_20:
        int v27 = [v11 isNew];
        id v28 = [MEMORY[0x1E4F25540] sharedInstance];
        uint64_t v29 = v28;
        if (v27) {
          [v28 handleEventCreation:v11];
        }
        else {
          [v28 handleEventUpdate:v11];
        }

        uint64_t v30 = [(UIResponder *)self EKUI_editor];
        if ([v30 saveEvent:v11 span:a7 error:0])
        {
          if (([(NSDateComponents *)self->_originalDisplayDate isEqual:self->_displayDate] & 1) == 0)
          {
            id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
            [WeakRetained dayViewController:self didChangeDisplayDate:self->_displayDate];
          }
        }
        else
        {
          double v32 = kEKUILogHandle;
          if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)CGRect v40 = 0;
            _os_log_impl(&dword_1B3F4C000, v32, OS_LOG_TYPE_ERROR, "Error moving event", v40, 2u);
          }
        }
        id v33 = [v10 event];

        if (v33 == v11)
        {
          CGFloat v34 = [v10 occurrenceDate];
          [v10 forceStartWithOccurrence:v11 occurrenceDate:v34 shouldUpdateViewSource:0 shouldUpdateOrigin:0 shouldPresentEditMenu:0];

          id v35 = objc_loadWeakRetained((id *)&self->_delegate);
          char v36 = objc_opt_respondsToSelector();

          if (v36)
          {
            id v37 = objc_loadWeakRetained((id *)&self->_delegate);
            [v37 dayViewController:self awaitsRefreshingOccurrence:v11];
          }
        }

        goto LABEL_32;
      }
    }
    goto LABEL_20;
  }
  double v12 = [(EKDayViewController *)self currentEditor];

  if (!v12)
  {
    uint64_t v13 = +[EKEventEditor defaultTitleForCalendarItem];
    double v14 = [v11 title];
    int v15 = [v13 isEqualToString:v14];

    if (v15) {
      [v11 setTitle:&stru_1F0CC2140];
    }
    id v16 = objc_loadWeakRetained((id *)&self->_delegate);
    char v17 = objc_opt_respondsToSelector();

    if (v17)
    {
      id v18 = objc_loadWeakRetained((id *)&self->_delegate);
      [v18 dayViewController:self beginEditingOccurrence:v11 creationMethod:1];
    }
    goto LABEL_13;
  }
LABEL_32:
  originalDisplayDate = self->_originalDisplayDate;
  self->_originalDisplayDate = 0;

  return 1;
}

- (void)eventGestureController:(id)a3 didCancelEditingOccurrence:(id)a4 fadedOut:(BOOL)a5
{
  id v11 = a3;
  id v8 = a4;
  [(EKDayView *)self->_currentDay highlightHour:-1.0];
  [(EKDayView *)self->_currentDay setAllDayLabelHighlighted:0];
  if (a5)
  {
    if (([v8 isNew] & 1) == 0)
    {
      [(EKDayView *)self->_currentDay setDimmedOccurrence:0];
      [(EKDayView *)self->_previousDay setDimmedOccurrence:0];
      [(EKDayView *)self->_nextDay setDimmedOccurrence:0];
      [v11 endForcedStart:0];
    }
  }
  else
  {
    double v9 = [v11 occurrenceDate];
    [v11 forceStartWithOccurrence:v8 occurrenceDate:v9 shouldUpdateViewSource:0 shouldUpdateOrigin:1 shouldPresentEditMenu:1];

    [(EKDayView *)self->_currentDay setDimmedOccurrence:v8];
  }
  originalDisplayDate = self->_originalDisplayDate;
  self->_originalDisplayDate = 0;
}

- (void)eventGestureControllerDidEndDragSession:(id)a3
{
  -[EKDayView highlightHour:](self->_currentDay, "highlightHour:", a3, -1.0);
  [(EKDayView *)self->_currentDay setAllDayLabelHighlighted:0];
  [(EKDayView *)self->_currentDay setDimmedOccurrence:0];
  [(EKDayView *)self->_previousDay setDimmedOccurrence:0];
  [(EKDayView *)self->_nextDay setDimmedOccurrence:0];
  originalDisplayDate = self->_originalDisplayDate;
  self->_originalDisplayDate = 0;
}

- (void)eventGestureController:(id)a3 didSingleTapOccurrence:(id)a4 shouldExtendSelection:(BOOL)a5
{
  id v14 = a3;
  id v8 = a4;
  [(EKDayView *)self->_currentDay highlightHour:-1.0];
  [(EKDayView *)self->_currentDay setAllDayLabelHighlighted:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (a5)
  {
    char v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) == 0) {
      goto LABEL_7;
    }
    id v11 = objc_loadWeakRetained((id *)&self->_delegate);
    [v11 dayViewController:self modifySelection:v8];
  }
  else
  {
    char v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) == 0) {
      goto LABEL_7;
    }
    id v11 = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v13 = [(EKEventGestureController *)self->_eventGestureController event];
    [v11 dayViewController:self didSelectEvent:v13 animated:1 userInitiated:1];
  }
LABEL_7:
  [(EKDayView *)self->_currentDay setDimmedOccurrence:0];
  [(EKDayView *)self->_previousDay setDimmedOccurrence:0];
  [(EKDayView *)self->_nextDay setDimmedOccurrence:0];
  if ([(EKDayViewController *)self _shouldEndGestureEditingOnTap]) {
    [v14 endForcedStart:0];
  }
}

- (BOOL)didScrollWhenEventGestureController:(id)a3 scrollTimerFiredToMoveLeft:(BOOL)a4 right:(BOOL)a5 vertically:(BOOL)a6 towardPoint:(CGPoint)a7
{
  double y = a7.y;
  double x = a7.x;
  BOOL v9 = a6;
  int v10 = a5;
  int v11 = a4;
  id v13 = a3;
  if (((v11 & 1) != 0 || v10) && ![(EKDayViewController *)self disableGestureDayChange])
  {
    int IsLeftToRight = CalTimeDirectionIsLeftToRight();
    if (IsLeftToRight) {
      int v15 = -v11;
    }
    else {
      int v15 = v11;
    }
    if (IsLeftToRight) {
      int v16 = v10;
    }
    else {
      int v16 = -v10;
    }
    char v17 = [(NSDateComponents *)self->_displayDate dateComponents:30 byAddingDays:(v15 + v16) calendar:self->_calendar];
    [(EKDayViewController *)self _setDisplayDate:v17 forRepeat:0];
    [v13 didCrossDragBoundary:2];
  }
  BOOL v18 = v9 && -[EKDayView scrollTowardPoint:](self->_currentDay, "scrollTowardPoint:", x, y);

  return v18;
}

- (void)externallyEndedGestureDragging
{
  [(EKDayView *)self->_currentDay highlightHour:-1.0];
  [(EKDayView *)self->_currentDay setAllDayLabelHighlighted:0];
  [(EKDayView *)self->_currentDay setDimmedOccurrence:0];
  [(EKDayView *)self->_previousDay setDimmedOccurrence:0];
  [(EKDayView *)self->_nextDay setDimmedOccurrence:0];
  originalDisplayDate = self->_originalDisplayDate;
  self->_originalDisplayDate = 0;
}

- (void)validateInterfaceOrientationWithFutureOrientation:(int64_t)a3
{
  if ([(EKDayViewController *)self isViewLoaded])
  {
    unint64_t v5 = a3 - 1;
    if (v5 < 2 != (unint64_t)([(EKDayView *)self->_currentDay orientation] - 1) < 2)
    {
      if (v5 < 2) {
        uint64_t v6 = 1;
      }
      else {
        uint64_t v6 = 4;
      }
      [(EKDayView *)self->_previousDay setOrientation:v6];
      [(EKDayView *)self->_currentDay setOrientation:v6];
      nextDadouble y = self->_nextDay;
      [(EKDayView *)nextDay setOrientation:v6];
    }
  }
}

- (BOOL)eventEditorPopoverActiveWhileDraggingForEventGestureController:(id)a3
{
  id v4 = [(EKDayViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    return 0;
  }
  uint64_t v6 = [(EKDayViewController *)self delegate];
  char v7 = [v6 dayViewControllerShouldShowDetachDialogOnGestureDraggingEnd:self];

  return v7 ^ 1;
}

- (BOOL)_shouldEndGestureEditingOnTap
{
  if ([(EKEventGestureController *)self->_eventGestureController dragGestureInProgress]) {
    return 0;
  }
  id v4 = [(EKDayViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    return 1;
  }
  uint64_t v6 = [(EKDayViewController *)self delegate];
  char v7 = [v6 dayViewControllerShouldEndGestureEditingOnTap:self];

  return v7;
}

- (void)cleanUpAfterGestureFailureForEventGestureController:(id)a3
{
  -[EKDayView highlightHour:](self->_currentDay, "highlightHour:", a3, -1.0);
  currentDadouble y = self->_currentDay;

  [(EKDayView *)currentDay setAllDayLabelHighlighted:0];
}

- (void)_notifyDelegateOfSelectedDateChange
{
  if (![(EKDayViewController *)self disableNotifyDateChangeDuringTracking]
    || !self->_fingerDown)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      id v4 = WeakRetained;
      id v5 = objc_loadWeakRetained((id *)&self->_delegate);
      char v6 = objc_opt_respondsToSelector();

      if (v6)
      {
        id v7 = objc_loadWeakRetained((id *)&self->_delegate);
        [v7 dayViewController:self didChangeDisplayDate:self->_displayDate];
      }
    }
  }
}

- (void)_relayoutDaysDuringScrolling
{
}

- (void)_relayoutDaysDuringScrollingAndPerformDayChanges:(BOOL)a3
{
  BOOL v3 = a3;
  [(UIScrollView *)self->_horizontalScrollingView bounds];
  double v6 = v5;
  double v8 = v7;
  [(UIScrollView *)self->_horizontalScrollingView contentOffset];
  double v10 = v9;
  BOOL v11 = v9 < v6 * 0.5;
  BOOL v12 = v9 > v6 * 1.5;
  BOOL v13 = [(EKDayViewController *)self _isResizing];
  int IsLeftToRight = CalTimeDirectionIsLeftToRight();
  int v60 = IsLeftToRight;
  if (IsLeftToRight) {
    BOOL v15 = v12;
  }
  else {
    BOOL v15 = v11;
  }
  if (!IsLeftToRight) {
    BOOL v11 = v12;
  }
  BOOL v16 = [(EKDayViewController *)self allowsDaySwitching];
  int v17 = v16 && v11;
  int v18 = v16 && v15;
  BOOL v61 = v3;
  if (v3 && !v13)
  {
    if (v18)
    {
      uint64_t v19 = [(EKDayView *)self->_nextDay displayDate];
      if (!v17)
      {
LABEL_13:
        if (v19 && ([(NSDateComponents *)self->_displayDate isEqual:v19] & 1) == 0)
        {
          *((unsigned char *)self + 1072) |= 2u;
          [(EKDayViewController *)self setDisplayDate:v19];
          [(EKDayViewController *)self _notifyDelegateOfSelectedDateChange];
          *((unsigned char *)self + 1072) &= ~2u;
        }

        goto LABEL_17;
      }
    }
    else
    {
      uint64_t v19 = 0;
      if (!v17) {
        goto LABEL_13;
      }
    }
    uint64_t v20 = [(EKDayView *)self->_previousDay displayDate];

    uint64_t v19 = (void *)v20;
    goto LABEL_13;
  }
LABEL_17:
  p_previousDadouble y = &self->_previousDay;
  previousDadouble y = self->_previousDay;
  p_currentDadouble y = &self->_currentDay;
  [(EKDayView *)self->_currentDay highlightedHour];
  -[EKDayView highlightHour:](previousDay, "highlightHour:");
  [(EKDayView *)self->_previousDay setAllDayLabelHighlighted:[(EKDayView *)self->_currentDay isAllDayLabelHighlighted]];
  BOOL v24 = self->_previousDay;
  int v25 = [(EKEventGestureController *)self->_eventGestureController event];
  [(EKDayView *)v24 setDimmedOccurrence:v25];

  p_nextDadouble y = (id *)&self->_nextDay;
  nextDadouble y = self->_nextDay;
  [(EKDayView *)self->_currentDay highlightedHour];
  -[EKDayView highlightHour:](nextDay, "highlightHour:");
  [(EKDayView *)self->_nextDay setAllDayLabelHighlighted:[(EKDayView *)self->_currentDay isAllDayLabelHighlighted]];
  id v28 = self->_nextDay;
  uint64_t v29 = [(EKEventGestureController *)self->_eventGestureController event];
  [(EKDayView *)v28 setDimmedOccurrence:v29];

  if ([(UIScrollView *)self->_horizontalScrollingView isTracking])
  {
    if ((v18 | v17) != 1) {
      goto LABEL_55;
    }
  }
  else if ([(UIScrollView *)self->_horizontalScrollingView isDecelerating] || ((v18 | v17) & 1) == 0)
  {
    goto LABEL_55;
  }
  if (v17)
  {
    nextDayWithGutter = self->_nextDayWithGutter;
    double v59 = nextDayWithGutter;
    objc_storeStrong((id *)&self->_nextDayWithGutter, self->_currentDayWithGutter);
    objc_storeStrong((id *)&self->_currentDayWithGutter, self->_previousDayWithGutter);
    objc_storeStrong((id *)&self->_previousDayWithGutter, nextDayWithGutter);
    id v31 = *p_nextDay;
    double v32 = (EKDayView *)*p_nextDay;
    objc_storeStrong(p_nextDay, *p_currentDay);
    objc_storeStrong((id *)&self->_currentDay, *p_previousDay);
    objc_storeStrong((id *)p_previousDay, v31);
    id v33 = [(EKDayView *)*p_previousDay dayContent];
    [v33 prepareForReuseIsReload:0];

    protectionQueue = self->_protectionQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__EKDayViewController__relayoutDaysDuringScrollingAndPerformDayChanges___block_invoke;
    block[3] = &unk_1E6087570;
    void block[4] = self;
    dispatch_sync(protectionQueue, block);
    uint64_t v35 = 1040;
    if ((*((unsigned char *)self + 1040) & 2) == 0)
    {
      char v36 = [(NSDateComponents *)self->_displayDate dateComponents:30 byAddingDays:0xFFFFFFFFLL calendar:self->_calendar];
      int v37 = v60;
      if ([(UIScrollView *)self->_horizontalScrollingView isTracking])
      {
        *((unsigned char *)self + 1056) |= 1u;
        [(EKDayViewController *)self setPendingPreviousDate:v36];
LABEL_35:

        BOOL v43 = v61;
        goto LABEL_36;
      }
      id v44 = *p_previousDay;
      goto LABEL_34;
    }
    char v42 = *((unsigned char *)self + 1040) & 0xFD;
  }
  else
  {
    previousDayWithGutter = self->_previousDayWithGutter;
    double v59 = previousDayWithGutter;
    objc_storeStrong((id *)&self->_previousDayWithGutter, self->_currentDayWithGutter);
    objc_storeStrong((id *)&self->_currentDayWithGutter, self->_nextDayWithGutter);
    objc_storeStrong((id *)&self->_nextDayWithGutter, previousDayWithGutter);
    v39 = *p_previousDay;
    double v32 = *p_previousDay;
    objc_storeStrong((id *)p_previousDay, *p_currentDay);
    objc_storeStrong((id *)&self->_currentDay, *p_nextDay);
    objc_storeStrong(p_nextDay, v39);
    CGRect v40 = [*p_nextDay dayContent];
    [v40 prepareForReuseIsReload:0];

    uint64_t v41 = self->_protectionQueue;
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __72__EKDayViewController__relayoutDaysDuringScrollingAndPerformDayChanges___block_invoke_2;
    v62[3] = &unk_1E6087570;
    v62[4] = self;
    dispatch_sync(v41, v62);
    uint64_t v35 = 1056;
    if ((*((unsigned char *)self + 1056) & 1) == 0)
    {
      char v36 = [(NSDateComponents *)self->_displayDate dateComponents:30 byAddingDays:1 calendar:self->_calendar];
      int v37 = v60;
      if ([(UIScrollView *)self->_horizontalScrollingView isTracking])
      {
        *((unsigned char *)self + 1040) |= 2u;
        [(EKDayViewController *)self setPendingNextDate:v36];
        goto LABEL_35;
      }
      id v44 = *p_nextDay;
LABEL_34:
      [(EKDayViewController *)self _setDayView:v44 toDate:v36];
      goto LABEL_35;
    }
    char v42 = *((unsigned char *)self + 1056) & 0xFE;
  }
  *((unsigned char *)&self->super.super.super.isa + v35) = v42;
  int v37 = v60;
  BOOL v43 = v61;
LABEL_36:

  uint64_t v45 = [(EKDayViewWithGutters *)self->_currentDayWithGutter superview];

  if (!v45) {
    [(UIScrollView *)self->_horizontalScrollingView addSubview:self->_currentDayWithGutter];
  }
  double v46 = -v6;
  if (v10 < v6 * 0.5) {
    double v46 = v6;
  }
  -[UIScrollView setContentOffset:](self->_horizontalScrollingView, "setContentOffset:", v10 + v46, 0.0);
  if ((*((unsigned char *)self + 1040) & 2) != 0
    && [(EKDayViewController *)self _isViewInVisibleRect:*p_nextDay])
  {
    [(EKDayViewController *)self _setDayView:*p_nextDay toDate:self->_pendingNextDate];
    *((unsigned char *)self + 1040) &= ~2u;
  }
  if ((*((unsigned char *)self + 1056) & 1) != 0
    && [(EKDayViewController *)self _isViewInVisibleRect:*p_previousDay])
  {
    [(EKDayViewController *)self _setDayView:*p_previousDay toDate:self->_pendingPreviousDate];
    *((unsigned char *)self + 1056) &= ~1u;
  }
  if (v43)
  {
    id v47 = [(EKDayView *)*p_currentDay displayDate];
    [(EKDayViewController *)self setDisplayDate:v47];
  }
  double v48 = CalRoundRectToScreenScale(0.0, 0.0, v6, v8);
  double v50 = v49;
  double v52 = v51;
  double v54 = v53;
  if (v37) {
    int v55 = 1016;
  }
  else {
    int v55 = 1032;
  }
  if (v37) {
    int v56 = 1032;
  }
  else {
    int v56 = 1016;
  }
  [*(id *)((char *)&self->super.super.super.isa + v55) setFrame:v48];
  -[EKDayViewWithGutters setFrame:](self->_currentDayWithGutter, "setFrame:", v6, v50, v52, v54);
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v56), "setFrame:", v6 + v6, v50, v52, v54);
  [(EKDayViewController *)self _updateAllDayAreaHeight];
  [(EKDayView *)*p_previousDay shouldAnnotateAppEntitiesChanged];
  [(EKDayView *)*p_currentDay shouldAnnotateAppEntitiesChanged];
  [*p_nextDay shouldAnnotateAppEntitiesChanged];
LABEL_55:
  v57 = [(EKDayViewController *)self view];
  if (EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v57))
  {
    float v58 = [(EKEventGestureController *)self->_eventGestureController draggingView];

    if (!v58)
    {
      [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__scrollDayViewAfterRelayoutDays object:0];
      [(EKDayViewController *)self performSelector:sel__scrollDayViewAfterRelayoutDays withObject:0 afterDelay:0.0];
    }
  }
  else
  {
  }
}

void __72__EKDayViewController__relayoutDaysDuringScrollingAndPerformDayChanges___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 1096);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1096), *(id *)(*(void *)(a1 + 32) + 1080));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1080), *(id *)(*(void *)(a1 + 32) + 1088));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 1088);
  *(void *)(v3 + 1088) = v2;
}

void __72__EKDayViewController__relayoutDaysDuringScrollingAndPerformDayChanges___block_invoke_2(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 1088);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1088), *(id *)(*(void *)(a1 + 32) + 1080));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1080), *(id *)(*(void *)(a1 + 32) + 1096));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 1096);
  *(void *)(v3 + 1096) = v2;
}

- (void)_setDayView:(id)a3 toDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [v6 displayDate];
  char v9 = [v8 isEqual:v7];

  if ((v9 & 1) == 0)
  {
    [v6 setDisplayDate:v7];
    reloadQueue = self->_reloadQueue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __42__EKDayViewController__setDayView_toDate___block_invoke;
    v11[3] = &unk_1E6087D68;
    void v11[4] = self;
    id v12 = v6;
    dispatch_async(reloadQueue, v11);
  }
}

void __42__EKDayViewController__setDayView_toDate___block_invoke(uint64_t a1)
{
  id v2 = *(NSObject **)(*(void *)(a1 + 32) + 1192);
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  id v7 = __42__EKDayViewController__setDayView_toDate___block_invoke_2;
  double v8 = &unk_1E6087D68;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v4;
  dispatch_sync(v2, &v5);
  objc_msgSend(*(id *)(a1 + 40), "loadData:withCompletion:", 0, 0, v5, v6, v7, v8);
}

void __42__EKDayViewController__setDayView_toDate___block_invoke_2(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  if (v3 == v2[125])
  {
    id v7 = objc_msgSend(v2, "_eventsForDay:");
    uint64_t v8 = [v7 copy];
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(void **)(v9 + 1080);
    *(void *)(v9 + 1080) = v8;

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__EKDayViewController__setDayView_toDate___block_invoke_3;
    block[3] = &unk_1E6087570;
    void block[4] = *(void *)(a1 + 40);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    if (v3 == v2[124])
    {
      objc_msgSend(v2, "_eventsForDay:");
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v4 = [v12 copy];
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = 1088;
    }
    else
    {
      if (v3 != v2[126]) {
        return;
      }
      objc_msgSend(v2, "_eventsForDay:");
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v4 = [v12 copy];
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = 1096;
    }
    BOOL v11 = *(void **)(v5 + v6);
    *(void *)(v5 + v6) = v4;
  }
}

uint64_t __42__EKDayViewController__setDayView_toDate___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyDelegateOfSelectedDateChange];
}

- (id)horizontalScrollView
{
  return self->_horizontalScrollingView;
}

- (id)verticalScrollView
{
  return [(EKDayView *)self->_currentDay verticalScrollView];
}

- (BOOL)_isViewInVisibleRect:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(EKDayViewController *)self view];
  [v4 frame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  id v14 = [v4 superview];

  objc_msgSend(v5, "convertRect:fromView:", v14, v7, v9, v11, v13);
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  uint64_t v22 = v21;

  [(UIScrollView *)self->_horizontalScrollingView frame];
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  uint64_t v31 = v16;
  uint64_t v32 = v18;
  uint64_t v33 = v20;
  uint64_t v34 = v22;

  return CGRectIntersectsRect(*(CGRect *)&v31, *(CGRect *)&v24);
}

- (double)_weightedAllDayHeightForView:(id)a3 visibleRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v8 = a3;
  [v8 frame];
  v28.origin.CGFloat x = v9;
  v28.origin.CGFloat y = v10;
  v28.size.CGFloat width = v11;
  v28.size.CGFloat height = v12;
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  double v13 = 0.0;
  if (CGRectIntersectsRect(v25, v28))
  {
    [v8 frame];
    v29.origin.CGFloat x = v14;
    v29.origin.CGFloat y = v15;
    v29.size.CGFloat width = v16;
    v29.size.CGFloat height = v17;
    v26.origin.CGFloat x = x;
    v26.origin.CGFloat y = y;
    v26.size.CGFloat width = width;
    v26.size.CGFloat height = height;
    CGRect v27 = CGRectIntersection(v26, v29);
    double v18 = v27.size.width;
    objc_msgSend(v8, "frame", v27.origin.x, v27.origin.y);
    double v20 = v18 / v19;
    uint64_t v21 = [v8 dayView];
    uint64_t v22 = [v21 allDayView];
    [v22 naturalHeight];
    double v13 = v20 * v23 + 0.0;
  }
  return v13;
}

- (void)scrollViewWillBeginDecelerating:(id)a3
{
  id v4 = a3;
  *((unsigned char *)self + 1072) |= 1u;
  self->_fingerDown = 0;
  [(EKDayViewController *)self setTransitionedToSameDay:0];
  uint64_t v5 = [(EKDayViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0) {
    goto LABEL_29;
  }
  [(UIScrollView *)self->_horizontalScrollingView _pageDecelerationTarget];
  double v8 = v7;
  [(EKDayViewWithGutters *)self->_currentDayWithGutter frame];
  double MinX = CGRectGetMinX(v46);
  [(EKDayViewWithGutters *)self->_currentDayWithGutter frame];
  double MaxX = CGRectGetMaxX(v47);
  int IsLeftToRight = CalTimeDirectionIsLeftToRight();
  if (IsLeftToRight && v8 >= MaxX) {
    goto LABEL_19;
  }
  if (v8 >= MinX) {
    char v12 = 1;
  }
  else {
    char v12 = IsLeftToRight;
  }
  if (v8 < MinX) {
    char v13 = IsLeftToRight;
  }
  else {
    char v13 = 0;
  }
  if (v13)
  {
    if ((v12 & 1) == 0) {
      goto LABEL_19;
    }
    goto LABEL_22;
  }
  if ((v12 & 1) == 0)
  {
LABEL_19:
    if ((*((unsigned char *)self + 1040) & 2) == 0)
    {
      uint64_t v16 = 1008;
LABEL_24:
      id v18 = [*(id *)((char *)&self->super.super.super.isa + v16) displayDate];
LABEL_27:
      CGFloat v15 = v18;
      goto LABEL_28;
    }
    uint64_t v17 = 1048;
    goto LABEL_26;
  }
  if (v8 < MaxX) {
    char v14 = 1;
  }
  else {
    char v14 = IsLeftToRight;
  }
  if ((v14 & 1) == 0)
  {
LABEL_22:
    if ((*((unsigned char *)self + 1056) & 1) == 0)
    {
      uint64_t v16 = 992;
      goto LABEL_24;
    }
    uint64_t v17 = 1064;
LABEL_26:
    id v18 = *(id *)((char *)&self->super.super.super.isa + v17);
    goto LABEL_27;
  }
  CGFloat v15 = [(EKDayView *)self->_currentDay displayDate];
  [(EKDayViewController *)self setTransitionedToSameDay:1];
LABEL_28:
  CalAnalyticsSendEventLazy();
  double v19 = [(EKDayViewController *)self delegate];
  [v19 dayViewController:self didStartDeceleratingTargettingDate:v15];

LABEL_29:
  self->_adjustingForDeceleration = 1;
  [v4 _pageDecelerationTarget];
  double v22 = CalRoundPointToScreenScale(v20, v21);
  uint64_t v24 = v23;
  [v4 contentOffset];
  double v27 = CalRoundPointToScreenScale(v25, v26);
  double v29 = v28;
  [v4 _horizontalVelocity];
  if (v30 >= 0.0) {
    double v31 = v30;
  }
  else {
    double v31 = -v30;
  }
  [v4 stopScrollingAndZooming];
  objc_msgSend(v4, "setContentOffset:animated:", 0, v27, v29);
  self->_adjustingForDeceleration = 0;
  char v32 = *((unsigned char *)self + 1040);
  *((unsigned char *)self + 1040) = v32 | 1;
  char v33 = v32 & 1;
  double v34 = v27 - v22;
  if (v27 - v22 < 0.0) {
    double v34 = -(v27 - v22);
  }
  [(ScrollSpringFactory *)self->_decelerationSpringFactory setInitialVelocity:v31 / v34 * EKUIScaleFactor() * 1000.0];
  self->_needToCompleteDeceleration = 0;
  uint64_t v35 = (void *)MEMORY[0x1E4FB1EB0];
  double v36 = springAnimationDuration();
  decelerationSpringFactorCGFloat y = self->_decelerationSpringFactory;
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __55__EKDayViewController_scrollViewWillBeginDecelerating___block_invoke_2;
  v41[3] = &unk_1E6089D10;
  v41[4] = self;
  id v42 = v4;
  double v43 = v22;
  uint64_t v44 = v24;
  char v45 = v33;
  id v38 = v4;
  v39 = dayViewScrollAnimationsPreferringFRR(v41);
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __55__EKDayViewController_scrollViewWillBeginDecelerating___block_invoke_4;
  v40[3] = &unk_1E6087520;
  v40[4] = self;
  [v35 _animateWithDuration:393222 delay:decelerationSpringFactory options:v39 factory:v40 animations:v36 completion:0.0];

  [(EKDayViewController *)self _cutAnimationTailAfterDelayForDecelerationFromUserInput];
}

uint64_t __55__EKDayViewController_scrollViewWillBeginDecelerating___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setObject:@"SwipedOnDayViewCanvas" forKeyedSubscript:@"method"];
}

void __55__EKDayViewController_scrollViewWillBeginDecelerating___block_invoke_2(uint64_t a1)
{
  ++*(_DWORD *)(*(void *)(a1 + 32) + 1152);
  objc_msgSend(*(id *)(a1 + 40), "setContentOffset:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  *(unsigned char *)(*(void *)(a1 + 32) + 1177) = 1;
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __55__EKDayViewController_scrollViewWillBeginDecelerating___block_invoke_3;
  v2[3] = &unk_1E6088CA8;
  v2[4] = *(void *)(a1 + 32);
  char v3 = *(unsigned char *)(a1 + 64);
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

uint64_t __55__EKDayViewController_scrollViewWillBeginDecelerating___block_invoke_3(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1040) = *(unsigned char *)(*(void *)(result + 32) + 1040) & 0xFE | *(unsigned char *)(result + 40);
  return result;
}

uint64_t __55__EKDayViewController_scrollViewWillBeginDecelerating___block_invoke_4(uint64_t result)
{
  return result;
}

- (void)_scrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  if (!self->_adjustingForDeceleration)
  {
    id v8 = v4;
    *((unsigned char *)self + 1072) &= ~1u;
    if ((*((unsigned char *)self + 1040) & 1) == 0) {
      [(EKDayViewController *)self _relayoutDaysDuringScrolling];
    }
    if ((*((unsigned char *)self + 1040) & 2) != 0)
    {
      [(EKDayViewController *)self _setDayView:self->_nextDay toDate:self->_pendingNextDate];
      *((unsigned char *)self + 1040) &= ~2u;
    }
    if (*((unsigned char *)self + 1056))
    {
      [(EKDayViewController *)self _setDayView:self->_previousDay toDate:self->_pendingPreviousDate];
      *((unsigned char *)self + 1056) &= ~1u;
    }
    uint64_t v5 = [(EKDayViewController *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      double v7 = [(EKDayViewController *)self delegate];
      [v7 dayViewControllerDidEndDecelerating:self];
    }
    [(EKDayViewController *)self _showNowAfterScrollViewDidEndDecelerating:v8];
    id v4 = v8;
  }
}

- (void)_showNowAfterScrollViewDidEndDecelerating:(id)a3
{
  if ([(EKDayViewController *)self _canShowNowAfterScrollViewDidEndDecelerating:a3])
  {
    [(EKDayViewController *)self _showNowDelay];
    objc_msgSend(MEMORY[0x1E4F1CB00], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__showNowTimerFired_, 0, 0);
    id v4 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    showNowTimer = self->_showNowTimer;
    self->_showNowTimer = v4;
  }
  else
  {
    [(EKDayViewController *)self _stopShowNowTimer];
  }
}

- (double)_showNowDelay
{
  return 0.4;
}

- (BOOL)_canShowNowAfterScrollViewDidEndDecelerating:(id)a3
{
  BOOL v4 = [(EKDayViewController *)self _isCurrentDayToday];
  return v4 & ![(EKDayViewController *)self transitionedToSameDay];
}

- (void)_showNowTimerFired:(id)a3
{
  if ([(EKDayViewController *)self _isCurrentDayToday]) {
    [(EKDayViewController *)self scrollToNow:1];
  }

  [(EKDayViewController *)self setShowNowTimer:0];
}

- (void)_cleanUpTargetDateComponents
{
  if (self->_correctAfterScroll)
  {
    targetDateComponents = self->_targetDateComponents;
    if (targetDateComponents)
    {
      calendar = self->_calendar;
      uint64_t v5 = targetDateComponents;
      id v8 = [(NSDateComponents *)v5 dateComponents:30 byAddingDays:0xFFFFFFFFLL calendar:calendar];
      char v6 = [(NSDateComponents *)v5 dateComponents:30 byAddingDays:1 calendar:self->_calendar];
      [(EKDayViewController *)self _setDayView:self->_previousDay toDate:v8];
      [(EKDayViewController *)self _setDayView:self->_currentDay toDate:v5];
      [(EKDayViewController *)self _setDayView:self->_nextDay toDate:v6];
      self->_correctAfterScroll = 0;
      double v7 = self->_targetDateComponents;
      self->_targetDateComponents = 0;
    }
  }
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v8 = a3;
  [(EKDayViewController *)self _relayoutDaysDuringScrolling];
  [(EKDayViewController *)self _cleanUpTargetDateComponents];
  [(EKDayViewController *)self _setNextAndPreviousFirstVisibleSecondToCurrent];
  *((unsigned char *)self + 1040) &= ~1u;
  [(EKDayViewController *)self reloadData];
  [(EKEventGestureController *)self->_eventGestureController updateDraggingOccurrence];
  [(EKEventGestureController *)self->_eventGestureController setCommitBlocked:0];
  BOOL v4 = [(EKDayViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(EKDayViewController *)self delegate];
    [v6 dayViewControllerDidEndScrolling:self];
  }
  [(EKDayViewController *)self _scrollToNowOnScrollViewDidEndScrollingAnimation:v8];
  double v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:@"EKDayViewController_ScrollDidEndAnimationNotification" object:0];
}

- (void)_scrollToNowOnScrollViewDidEndScrollingAnimation:(id)a3
{
  [(EKDayViewController *)self scrollToNow:[(EKDayViewController *)self _shouldRespondToApplicationDidBecomeActiveStateChange] ^ 1];
  if ([(EKDayViewController *)self _shouldRespondToApplicationDidBecomeActiveStateChange])
  {
    [(EKDayViewController *)self _didRespondToApplicationDidBecomeActiveStateChange];
  }
}

- (BOOL)_shouldRespondToApplicationDidBecomeActiveStateChange
{
  char v3 = [(EKDayViewController *)self dataSource];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  char v5 = [(EKDayViewController *)self dataSource];
  char v6 = [v5 dayViewControllerShouldRespondToApplicationDidBecomeActiveStateChange:self];

  return v6;
}

- (void)_didRespondToApplicationDidBecomeActiveStateChange
{
  char v3 = [(EKDayViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(EKDayViewController *)self delegate];
    [v5 dayViewControllerDidRespondToApplicationDidBecomeActiveStateChange:self];
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  [(EKDayViewController *)self _completeScrollingAnimationIfNeeded];
  *((unsigned char *)self + 1040) &= ~1u;
  [(EKDayViewController *)self _completeDecelerationIfNeeded];
  uint64_t v4 = [(EKEventGestureController *)self->_eventGestureController event];
  if (v4)
  {
    id v5 = (void *)v4;
    BOOL v6 = [(EKEventGestureController *)self->_eventGestureController dragGestureInProgress];

    if (!v6)
    {
      [(EKEventGestureController *)self->_eventGestureController endForcedStart:0];
      [(EKDayView *)self->_currentDay setDimmedOccurrence:0];
    }
  }
  self->_fingerDown = 1;
  [(EKDayViewController *)self _setNextAndPreviousFirstVisibleSecondToCurrent];
  if ([(EKDayViewController *)self _isCurrentDayToday])
  {
    [(EKDayViewController *)self _stopShowNowTimer];
    currentDaCGFloat y = self->_currentDay;
    [(EKDayView *)currentDay stopScrolling];
  }
}

- (void)_stopShowNowTimer
{
  char v3 = [(EKDayViewController *)self showNowTimer];
  [v3 invalidate];

  [(EKDayViewController *)self setShowNowTimer:0];
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
  {
    self->_fingerDown = 0;
    [(EKDayViewController *)self _notifyDelegateOfSelectedDateChange];
  }
}

- (BOOL)blockableScrollViewShouldAllowScrolling
{
  char v3 = [(EKDayViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 1;
  }
  id v5 = [(EKDayViewController *)self delegate];
  char v6 = [v5 dayviewControllerShouldAllowSwipeToChangeDays:self];

  return v6;
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  ++self->_sizeTransitionsInProgress;
  v18.receiver = self;
  v18.super_class = (Class)EKDayViewController;
  id v7 = a4;
  -[EKDayViewController viewWillTransitionToSize:withTransitionCoordinator:](&v18, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  if ([(EKDayViewController *)self isViewLoaded])
  {
    int64_t v8 = -[EKDayViewController _effectiveInterfaceOrientationForSize:](self, "_effectiveInterfaceOrientationForSize:", width, height);
    [(EKDayView *)self->_previousDay setOrientation:v8];
    [(EKDayView *)self->_currentDay setOrientation:v8];
    [(EKDayView *)self->_nextDay setOrientation:v8];
  }
  if ([(EKDayViewController *)self isViewLoaded])
  {
    CGFloat v9 = [(EKDayViewController *)self view];
    CGFloat v10 = [v9 window];
    BOOL v11 = v10 != 0;
  }
  else
  {
    BOOL v11 = 0;
  }
  char v12 = [(EKDayViewController *)self gestureController];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __74__EKDayViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v14[3] = &unk_1E6089D38;
  BOOL v17 = v11;
  id v15 = v12;
  uint64_t v16 = self;
  id v13 = v12;
  [v7 animateAlongsideTransition:0 completion:v14];
}

uint64_t __74__EKDayViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  if (*(unsigned char *)(result + 48))
  {
    [*(id *)(result + 32) updateDraggingOccurrenceFrameFromSource];
    CGPoint result = [*(id *)(v1 + 32) updateDraggingOccurrenceOrigin];
  }
  --*(_DWORD *)(*(void *)(v1 + 40) + 1156);
  return result;
}

- (void)applicationDidBecomeActive
{
}

- (void)_setHorizontalContentOffsetUsingSpringAnimation:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  if (![(EKDayViewController *)self _isResizing])
  {
    self->_needToCompleteScrollingAnimation = 0;
    char v6 = (void *)MEMORY[0x1E4FB1EB0];
    double v7 = springAnimationDuration();
    int64_t v8 = +[SpringFactory sharedFactory];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __71__EKDayViewController__setHorizontalContentOffsetUsingSpringAnimation___block_invoke;
    v10[3] = &unk_1E6089720;
    v10[4] = self;
    *(CGFloat *)&v10[5] = x;
    *(CGFloat *)&v10[6] = y;
    CGFloat v9 = dayViewScrollAnimationsPreferringFRR(v10);
    [v6 _animateWithDuration:393222 delay:v8 options:v9 factory:0 animations:v7 completion:0.0];

    [(EKDayViewController *)self _cutAnimationTailAfterDelayForScrollAnimationFromExternalSource];
  }
}

uint64_t __71__EKDayViewController__setHorizontalContentOffsetUsingSpringAnimation___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1040) |= 1u;
  uint64_t result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 984), "setContentOffset:animated:", 0, *(double *)(a1 + 40), *(double *)(a1 + 48));
  *(unsigned char *)(*(void *)(a1 + 32) + 1176) = 1;
  return result;
}

- (void)_cutAnimationTailAfterDelayForDecelerationFromUserInput
{
  [(EKDayViewController *)self _cancelAllLongTailCuttingCallbacks];
  double v3 = springAnimationDuration() * 0.5;

  [(EKDayViewController *)self performSelector:sel___cutLongCallbackTailForDecelerationFromUserInput withObject:0 afterDelay:v3];
}

- (void)_cutAnimationTailAfterDelayForScrollAnimationFromExternalSource
{
  [(EKDayViewController *)self _cancelAllLongTailCuttingCallbacks];
  double v3 = springAnimationDuration() * 0.5;

  [(EKDayViewController *)self performSelector:sel___cutLongTailCallbackForScrollAnimationFromExternalSource withObject:0 afterDelay:v3];
}

- (void)_cancelAllLongTailCuttingCallbacks
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel___cutLongCallbackTailForDecelerationFromUserInput object:0];
  double v3 = (void *)MEMORY[0x1E4FBA8A8];

  [v3 cancelPreviousPerformRequestsWithTarget:self selector:sel___cutLongTailCallbackForScrollAnimationFromExternalSource object:0];
}

- (void)__cutLongTailCallbackForScrollAnimationFromExternalSource
{
  self->_needToCompleteScrollingAnimation = 0;
  [(EKDayViewController *)self scrollViewDidEndScrollingAnimation:self->_horizontalScrollingView];
}

- (void)pasteboardManager:(id)a3 presentAlert:(id)a4
{
  id v5 = a4;
  id v6 = [(EKDayViewController *)self currentPresentationController];
  [v5 presentFromSource:v6];
}

- (void)pasteboardManager:(id)a3 beginEditingEvent:(id)a4
{
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    [v7 dayViewController:self beginEditingOccurrence:v8 creationMethod:3];
  }
}

- (void)pasteboardManager:(id)a3 didFinishPasteWithResult:(unint64_t)a4 willOpenEditor:(BOOL)a5
{
  if (!a4 && !a5) {
    [(EKDayViewController *)self attemptDisplayReviewPrompt];
  }
}

- (void)_logUserStateDiagnostics:(id)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  id v42 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v55 = 0;
  int v56 = &v55;
  uint64_t v57 = 0x3032000000;
  float v58 = __Block_byref_object_copy__12;
  double v59 = __Block_byref_object_dispose__12;
  id v60 = 0;
  protectionQueue = self->_protectionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__EKDayViewController__logUserStateDiagnostics___block_invoke;
  block[3] = &unk_1E6089D60;
  void block[4] = self;
  void block[5] = &v55;
  dispatch_sync(protectionQueue, block);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = (id)v56[5];
  uint64_t v4 = [obj countByEnumeratingWithState:&v50 objects:v67 count:16];
  if (v4)
  {
    uint64_t v43 = *(void *)v51;
    do
    {
      uint64_t v5 = 0;
      uint64_t v44 = v4;
      do
      {
        if (*(void *)v51 != v43) {
          objc_enumerationMutation(obj);
        }
        char v6 = *(void **)(*((void *)&v50 + 1) + 8 * v5);
        id v7 = [v6 UUID];
        BOOL v8 = v7 == 0;

        if (!v8)
        {
          v65[0] = @"startDate";
          uint64_t v9 = [v6 startDate];
          double v49 = (void *)v9;
          CGFloat v10 = &stru_1F0CC2140;
          if (v9) {
            CGFloat v10 = (__CFString *)v9;
          }
          v66[0] = v10;
          v65[1] = @"duration";
          BOOL v11 = NSNumber;
          [v6 duration];
          double v48 = objc_msgSend(v11, "numberWithDouble:");
          v66[1] = v48;
          v65[2] = @"allDay";
          int v12 = [v6 isAllDay];
          id v13 = @"NO";
          if (v12) {
            id v13 = @"YES";
          }
          v66[2] = v13;
          v65[3] = @"UUID";
          uint64_t v14 = [v6 UUID];
          CGRect v47 = (void *)v14;
          id v15 = &stru_1F0CC2140;
          if (v14) {
            id v15 = (__CFString *)v14;
          }
          v66[3] = v15;
          v65[4] = @"uniqueID";
          uint64_t v16 = [v6 uniqueID];
          CGRect v46 = (void *)v16;
          BOOL v17 = &stru_1F0CC2140;
          if (v16) {
            BOOL v17 = (__CFString *)v16;
          }
          v66[4] = v17;
          v65[5] = @"externalURL";
          uint64_t v18 = [v6 externalURL];
          double v19 = (void *)v18;
          double v20 = &stru_1F0CC2140;
          if (v18) {
            double v20 = (__CFString *)v18;
          }
          v66[5] = v20;
          v65[6] = @"alarms";
          uint64_t v21 = [v6 alarms];
          double v22 = (void *)v21;
          uint64_t v23 = &stru_1F0CC2140;
          if (v21) {
            uint64_t v23 = (__CFString *)v21;
          }
          v66[6] = v23;
          v65[7] = @"hasLocation";
          uint64_t v24 = [v6 location];
          double v25 = @"NO";
          if (v24) {
            double v25 = @"YES";
          }
          v66[7] = v25;
          v65[8] = @"calendarIdentifier";
          double v26 = [v6 calendar];
          uint64_t v27 = [v26 calendarIdentifier];
          double v28 = (void *)v27;
          double v29 = &stru_1F0CC2140;
          if (v27) {
            double v29 = (__CFString *)v27;
          }
          v66[8] = v29;
          v65[9] = @"sourceIdentifier";
          double v30 = [v6 calendar];
          double v31 = [v30 source];
          uint64_t v32 = [v31 sourceIdentifier];
          char v33 = (void *)v32;
          double v34 = &stru_1F0CC2140;
          if (v32) {
            double v34 = (__CFString *)v32;
          }
          v66[9] = v34;
          char v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:v65 count:10];

          uint64_t v35 = [v6 UUID];
          [v42 setObject:v45 forKeyedSubscript:v35];
        }
        ++v5;
      }
      while (v44 != v5);
      uint64_t v4 = [obj countByEnumeratingWithState:&v50 objects:v67 count:16];
    }
    while (v4);
  }

  double v36 = (id)kEKUILogHandle;
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    int v37 = (objc_class *)objc_opt_class();
    id v38 = NSStringFromClass(v37);
    *(_DWORD *)buf = 138543618;
    v62 = v38;
    __int16 v63 = 2114;
    v64 = v42;
    _os_log_impl(&dword_1B3F4C000, v36, OS_LOG_TYPE_INFO, "[UserStateLog] State -> %{public}@ Visible Events when viewDidAppear. %{public}@", buf, 0x16u);
  }
  _Block_object_dispose(&v55, 8);
}

void __48__EKDayViewController__logUserStateDiagnostics___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 1080) occurrences];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (unint64_t)_dateModeForAllDay:(BOOL)a3
{
  return !a3;
}

- (BOOL)interaction:(id)a3 shouldShowMenuAtPoint:(CGPoint)a4 inView:(id)a5
{
  return 1;
}

- (BOOL)interaction:(id)a3 canPasteEventAtPoint:(CGPoint)a4 inView:(id)a5
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v7 = [WeakRetained pasteboardManagerForDayViewController:self];

  LOBYTE(WeakRetained) = [v7 canPerformPaste];
  return (char)WeakRetained;
}

- (BOOL)interaction:(id)a3 canCreateEventAtPoint:(CGPoint)a4 inView:(id)a5
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  char v6 = [WeakRetained defaultCalendarForNewEvents];
  BOOL v7 = v6 != 0;

  return v7;
}

- (BOOL)interaction:(id)a3 canCreateReminderAtPoint:(CGPoint)a4 inView:(id)a5
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  char v6 = [WeakRetained calendarForNewIntegrationReminders];
  BOOL v7 = v6 != 0;

  return v7;
}

- (void)interaction:(id)a3 createEventAtPoint:(CGPoint)a4 inView:(id)a5
{
}

- (void)interaction:(id)a3 createReminderAtPoint:(CGPoint)a4 inView:(id)a5
{
}

- (void)createEvent:(BOOL)a3 atPoint:(CGPoint)a4 inView:(id)a5
{
  BOOL v5 = a3;
  -[EKDayView convertPoint:fromView:](self->_currentDay, "convertPoint:fromView:", a5, a4.x, a4.y);
  unsigned __int8 v21 = 0;
  -[EKDayView dateAtPoint:isAllDay:](self->_currentDay, "dateAtPoint:isAllDay:", &v21);
  double v8 = CalSnapDateTo15MinuteInterval(0, v7);
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  BOOL v11 = WeakRetained;
  BOOL v12 = v21 != 0;
  if (v5) {
    uint64_t v13 = [WeakRetained dayViewController:self createEventAtDate:v9 allDay:v12];
  }
  else {
    uint64_t v13 = [WeakRetained dayViewController:self createReminderAtDate:v9 allDay:v12];
  }
  uint64_t v14 = (void *)v13;

  id v15 = (void *)MEMORY[0x1E4F57838];
  uint64_t v16 = [v14 eventStore];
  BOOL v17 = [v16 timeZone];
  uint64_t v18 = [v15 calendarDateWithDate:v9 timeZone:v17];

  double v19 = [(EKDayViewController *)self gestureController];
  [v19 forceStartWithOccurrence:v14 occurrenceDate:v18 shouldUpdateViewSource:1 shouldUpdateOrigin:1 shouldPresentEditMenu:0];

  double v20 = [(EKDayViewController *)self gestureController];
  [(EKDayViewController *)self eventGestureController:v20 didCommitOccurrence:v14 toDate:v21 isAllDay:0 span:v8];
}

- (void)interaction:(id)a3 pasteEventAtPoint:(CGPoint)a4 inView:(id)a5
{
  -[EKDayView convertPoint:fromView:](self->_currentDay, "convertPoint:fromView:", a5, a4.x, a4.y);
  unsigned __int8 v10 = 0;
  char v6 = (void *)MEMORY[0x1E4F1C9C8];
  -[EKDayView dateAtPoint:isAllDay:](self->_currentDay, "dateAtPoint:isAllDay:", &v10);
  double v7 = objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:");
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  uint64_t v9 = [WeakRetained pasteboardManagerForDayViewController:self];

  [v9 setDateForPaste:v7];
  objc_msgSend(v9, "pasteEventsWithDateMode:delegate:", -[EKDayViewController _dateModeForAllDay:](self, "_dateModeForAllDay:", v10), self);
}

- (id)interaction:(id)a3 titleForPasteActionAtPoint:(CGPoint)a4 inView:(id)a5
{
  -[EKDayView convertPoint:fromView:](self->_currentDay, "convertPoint:fromView:", a5, a4.x, a4.y);
  char v11 = 0;
  -[EKDayView dateAtPoint:isAllDay:](self->_currentDay, "dateAtPoint:isAllDay:", &v11);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  double v7 = [WeakRetained pasteboardManagerForDayViewController:self];

  uint64_t v8 = [v7 numberOfEventsToPaste];
  uint64_t v9 = +[EKUIRightClickEmptySpaceInteraction localizedPasteStringForEventCount:v8 includeHere:v11 == 0];

  return v9;
}

- (id)interaction:(id)a3 subtitleForPasteActionAtPoint:(CGPoint)a4 inView:(id)a5
{
  -[EKDayView convertPoint:fromView:](self->_currentDay, "convertPoint:fromView:", a5, a4.x, a4.y);
  unsigned __int8 v14 = 0;
  -[EKDayView dateAtPoint:isAllDay:](self->_currentDay, "dateAtPoint:isAllDay:", &v14);
  char v6 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
  double v7 = CUIKCalendar();
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F57BF0], "roundedDateForDate:dateMode:calendar:", v6, -[EKDayViewController _dateModeForAllDay:](self, "_dateModeForAllDay:", v14), v7);

  id v9 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v9 setCalendar:v7];
  unsigned __int8 v10 = [v7 timeZone];
  [v9 setTimeZone:v10];

  [v9 setDoesRelativeDateFormatting:1];
  BOOL v11 = v14 == 0;
  [v9 setDateStyle:1];
  [v9 setTimeStyle:v11];
  BOOL v12 = [v9 stringFromDate:v8];

  return v12;
}

- (void)dayOccurrenceViewSelected:(id)a3 source:(unint64_t)a4
{
  p_delegate = &self->_delegate;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained dayOccurrenceViewSelected:v6 source:a4];
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

- (EKDayViewControllerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (EKDayViewControllerDataSource *)WeakRetained;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (BOOL)showsBanner
{
  return self->_showsBanner;
}

- (BOOL)allowsSelection
{
  return self->_allowsSelection;
}

- (BOOL)alwaysAnimate
{
  return self->_alwaysAnimate;
}

- (BOOL)disableGestureDayChange
{
  return self->_disableGestureDayChange;
}

- (void)setDisableGestureDayChange:(BOOL)a3
{
  self->_disableGestureDayChange = a3;
}

- (BOOL)disableNotifyDateChangeDuringTracking
{
  return self->_disableNotifyDateChangeDuringTracking;
}

- (BOOL)shouldAutoscrollAfterAppearance
{
  return self->_shouldAutoscrollAfterAppearance;
}

- (BOOL)notifyWhenTapOtherEventDuringDragging
{
  return self->_notifyWhenTapOtherEventDuringDragging;
}

- (void)setNotifyWhenTapOtherEventDuringDragging:(BOOL)a3
{
  self->_notifyWhenTapOtherEventDuringDragging = a3;
}

- (BOOL)preloadExtraDays
{
  return self->_preloadExtraDays;
}

- (UIView)gestureOccurrenceSuperview
{
  return self->_gestureOccurrenceSuperview;
}

- (EKEventOrIntegrationEditView)currentEditor
{
  return self->_currentEditor;
}

- (void)setCurrentEditor:(id)a3
{
}

- (int)startingFirstVisibleSecond
{
  return self->_startingFirstVisibleSecond;
}

- (CGPoint)normalizedContentOffset
{
  double x = self->_normalizedContentOffset.x;
  double y = self->_normalizedContentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setNormalizedContentOffset:(CGPoint)a3
{
  self->_normalizedContentOffset = a3;
}

- (NSDateComponents)pendingNextDate
{
  return self->_pendingNextDate;
}

- (void)setPendingNextDate:(id)a3
{
}

- (NSDateComponents)pendingPreviousDate
{
  return self->_pendingPreviousDate;
}

- (void)setPendingPreviousDate:(id)a3
{
}

- (NSTimer)showNowTimer
{
  return self->_showNowTimer;
}

- (void)setShowNowTimer:(id)a3
{
}

- (BOOL)transitionedToSameDay
{
  return self->_transitionedToSameDay;
}

- (void)setTransitionedToSameDay:(BOOL)a3
{
  self->_transitionedToSameDadouble y = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_showNowTimer, 0);
  objc_storeStrong((id *)&self->_currentEditor, 0);
  objc_storeStrong((id *)&self->_gestureOccurrenceSuperview, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_displayDate, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_protectionQueue, 0);
  objc_storeStrong((id *)&self->_reloadQueue, 0);
  objc_storeStrong((id *)&self->_targetDateComponents, 0);
  objc_storeStrong((id *)&self->_originalDisplayDate, 0);
  objc_storeStrong((id *)&self->_decelerationSpringFactory, 0);
  objc_storeStrong((id *)&self->_eventGestureController, 0);
  objc_storeStrong((id *)&self->_nextDayOccurrences, 0);
  objc_storeStrong((id *)&self->_previousDayOccurrences, 0);
  objc_storeStrong((id *)&self->_occurrences, 0);
  objc_storeStrong((id *)&self->_pendingPreviousDate, 0);
  objc_storeStrong((id *)&self->_pendingNextDate, 0);
  objc_storeStrong((id *)&self->_nextDayWithGutter, 0);
  objc_storeStrong((id *)&self->_currentDayWithGutter, 0);
  objc_storeStrong((id *)&self->_previousDayWithGutter, 0);
  objc_storeStrong((id *)&self->_nextDay, 0);
  objc_storeStrong((id *)&self->_currentDay, 0);
  objc_storeStrong((id *)&self->_previousDay, 0);
  objc_storeStrong((id *)&self->_horizontalScrollingView, 0);

  objc_storeStrong((id *)&self->_clipView, 0);
}

@end