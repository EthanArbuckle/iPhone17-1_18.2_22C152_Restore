@interface EKEventGestureController
+ (id)_captureImageOfOccurrenceView:(id)a3 withFrameOfOpaqueContent:(CGRect)a4;
- (BOOL)__timedDelegateBeginEditingSessionAtPoint:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)_beginEditingSessionAtPoint:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)_beginNewDragFromOffStateWithPoint:(CGPoint)a3;
- (BOOL)_calendarCanAcceptManagedData:(id)a3;
- (BOOL)_dragInteraction:(id)a3 sessionSupportsSystemDrag:(id)a4;
- (BOOL)_dropSessionRequiresExternalDataExtraction:(id)a3;
- (BOOL)_flingOrCancelDraggingViewIfNeeded;
- (BOOL)_isPointInCancelRegion:(CGPoint)a3;
- (BOOL)_isTouchFromDragSessionInResizeHandles:(id)a3;
- (BOOL)_setDraggingState:(int)a3 withPoint:(CGPoint)a4 event:(id)a5;
- (BOOL)_setDraggingState:(int)a3 withPoint:(CGPoint)a4 event:(id)a5 context:(id)a6;
- (BOOL)_shouldUseSystemAPIForDrag;
- (BOOL)_useNewDragAndDropAPI;
- (BOOL)canProposeNewTime:(id)a3;
- (BOOL)commitBlocked;
- (BOOL)dragGestureInProgress;
- (BOOL)dragInteraction:(id)a3 prefersFullSizePreviewsForSession:(id)a4;
- (BOOL)dragInteraction:(id)a3 sessionAllowsMoveOperation:(id)a4;
- (BOOL)dragInteraction:(id)a3 sessionIsRestrictedToDraggingApplication:(id)a4;
- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)splitMultiDays;
- (BOOL)usesHorizontalDragLocking;
- (BOOL)usesXDragOffsetInCancelRegion;
- (CGPoint)_computeOriginAtTouchPoint:(CGPoint)a3 forDate:(double)a4 isAllDay:(BOOL)a5 allowXOffset:(BOOL)a6 allowFloorAtRegionBottom:(BOOL)a7;
- (CGPoint)_estimateFinalDropOriginForTimedDelegate;
- (CGPoint)firstTouchPoint;
- (CGPoint)latestTouchPoint;
- (CGPoint)touchOffset;
- (CGRect)_calculateFrameForDraggingViewIncludingTravelTime:(BOOL)a3;
- (EKCalendarDate)occurrenceDate;
- (EKDayOccurrenceView)draggingView;
- (EKDayOccurrenceView)draggingViewSource;
- (EKEvent)event;
- (EKEventGestureController)initWithView:(id)a3;
- (EKEventGestureControllerDelegate)delegate;
- (EKEventGestureControllerUntimedDelegate)untimedDelegate;
- (EKUIEmailCompositionManager)messageSendingManager;
- (NSString)sessionIdentifierForDebug;
- (double)_Debug_HoursSinceStartOfDay:(double)a3;
- (double)_alignedYOriginForAllDayOccurrence:(id)a3 atPoint:(CGPoint)a4 floorAtAllDayRegionBottom:(BOOL)a5;
- (double)_allDayBottomPadding;
- (double)_cancelRegionMargin;
- (double)_capOccurrenceViewYOrigin:(double)a3;
- (double)_computeHeightForOccurrenceViewOfDuration:(double)a3 event:(id)a4 allDay:(BOOL)a5;
- (double)_computeWidthForOccurrenceView;
- (double)_minimumDuration;
- (id)_acceptedExternalTypes;
- (id)_acceptedFileExternalTypes;
- (id)_acceptedNonFileExternalTypes;
- (id)_acceptedTypes;
- (id)_captureImageOfDraggingView;
- (id)_clippingPathForDraggingView;
- (id)_createNewEventIfNeededAtPoint:(CGPoint)a3;
- (id)_createTemporaryView:(id)a3 animated:(BOOL)a4;
- (id)_debugStringForDraggingState:(int)a3;
- (id)_eventToUseAtInteractionStart:(CGPoint)a3 outOccurrenceView:(id *)a4;
- (id)_findFirstCalendar:(id)a3;
- (id)_findLocalDragItemInSession:(id)a3;
- (id)_getEventUsingDropSession:(id)a3;
- (id)_viewForTracking;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5;
- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5;
- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4;
- (id)originalStartDateForEvent:(id)a3 includingTravel:(BOOL)a4;
- (int)_draggingState;
- (int)currentDragSnappingType;
- (int64_t)_dragInteraction:(id)a3 dataOwnerForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5;
- (int64_t)_dragInteraction:(id)a3 dataOwnerForSession:(id)a4;
- (int64_t)_dropInteraction:(id)a3 dataOwnerForSession:(id)a4;
- (int64_t)_occurrenceDateIndexWithEvent:(id)a3 occurrenceDate:(id)a4;
- (int64_t)occurrenceDateIndex;
- (unint64_t)_dropOperationGivenDropSession:(id)a3;
- (unint64_t)numberOfDragSourcesForView:(id)a3;
- (void)_adjustNewEventDates:(id)a3 withPoint:(CGPoint)a4;
- (void)_animateInNewEvent;
- (void)_cancel;
- (void)_cleanUpAllStateWithTouchPoint:(CGPoint)a3 commit:(BOOL)a4;
- (void)_cleanUpForcedStart;
- (void)_commit;
- (void)_commitUntimed;
- (void)_createAndSetUpDraggingViewWithTouchPoint:(CGPoint)a3 event:(id)a4 ignoreOffsets:(BOOL)a5 showEditMenu:(BOOL)a6;
- (void)_disableSystemPreviewForDrag:(id)a3;
- (void)_dismissCurrentICSPreviewControllerAnimated:(BOOL)a3;
- (void)_dragFailedToStart;
- (void)_dragInteractionDidCancelLiftWithoutDragging:(id)a3;
- (void)_enableSystemPreviewForDrag:(id)a3;
- (void)_extractFileFromSession:(id)a3;
- (void)_handleImportingICSData:(id)a3 intoEventStore:(id)a4;
- (void)_handleLongPressResponseForOldAPI:(id)a3;
- (void)_handleShowingEventWithUniqueId:(id)a3 date:(id)a4 eventStore:(id)a5;
- (void)_hideEditingMenuForView:(id)a3;
- (void)_icsPreviewControllerCancelButtonPressed;
- (void)_installScrollTimer;
- (void)_longPress:(id)a3;
- (void)_manageDraggingViewInteractivityForStateChangeFrom:(int)a3 to:(int)a4;
- (void)_manageFeedbackForStateChangeFrom:(int)a3 to:(int)a4;
- (void)_multiSelect:(id)a3;
- (void)_presentICSPreviewControllerIfNeeded;
- (void)_removeScrollTimer;
- (void)_returnDraggingViewToLastCommittedPositionFromTouchPoint:(CGPoint)a3;
- (void)_scrollTimerFired:(id)a3;
- (void)_setEventCalendar:(id)a3 useManagedCalendar:(BOOL)a4;
- (void)_setLocalDraggingViewHidden:(BOOL)a3;
- (void)_setToLocalDraggingImageForDrag:(id)a3;
- (void)_setToSystemDraggingImageForDrag:(id)a3;
- (void)_setTouchOffsetsFromPoint:(CGPoint)a3 fixedToCenter:(BOOL)a4;
- (void)_setUpAfterForcedStartFromPoint:(CGPoint)a3;
- (void)_setUpInitialTouchPointsWithPoint:(CGPoint)a3;
- (void)_setupEvent:(id)a3 withImportData:(id)a4;
- (void)_tapGesture:(id)a3;
- (void)_update;
- (void)_updateFlingToCancelParameters;
- (void)_updateHorizontalDragLockForPoint:(CGPoint)a3;
- (void)_updatePositionOfEditingMenuForView:(id)a3;
- (void)_updateSnappingTypeForCurrentDrag;
- (void)_writeDraggingChangesToOccurrenceWithTouchPoint:(CGPoint)a3;
- (void)attemptDisplayReviewPrompt;
- (void)dealloc;
- (void)didCrossDragBoundary:(int)a3;
- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5;
- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4;
- (void)dropInteraction:(id)a3 concludeDrop:(id)a4;
- (void)dropInteraction:(id)a3 item:(id)a4 willAnimateDropWithAnimator:(id)a5;
- (void)dropInteraction:(id)a3 performDrop:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4;
- (void)endForcedStart:(BOOL)a3;
- (void)endForcedStartAndUndim;
- (void)forceStartWithOccurrence:(id)a3 occurrenceDate:(id)a4 shouldUpdateViewSource:(BOOL)a5 shouldUpdateOrigin:(BOOL)a6 shouldPresentEditMenu:(BOOL)a7;
- (void)icsPreviewControllerImportDidFail:(id)a3;
- (void)icsPreviewControllerImportDidImportEvents:(id)a3;
- (void)icsPreviewControllerWantsDismissal:(id)a3;
- (void)invalidate;
- (void)liftUpOccurrenceForEditingEvent:(id)a3;
- (void)promptUserForProposeNewTime:(id)a3 forEvent:(id)a4 whenFinished:(id)a5;
- (void)promptUserForRecurrenceActionOnOccurrence:(id)a3 whenFinished:(id)a4;
- (void)removeDraggedOccurrence;
- (void)setCommitBlocked:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDraggingViewSource:(id)a3;
- (void)setEvent:(id)a3;
- (void)setMessageSendingManager:(id)a3;
- (void)setSessionIdentifierForDebug:(id)a3;
- (void)setUntimedDelegate:(id)a3;
- (void)setUsesHorizontalDragLocking:(BOOL)a3;
- (void)setUsesXDragOffsetInCancelRegion:(BOOL)a3;
- (void)updateDraggingOccurrence;
- (void)updateDraggingOccurrenceForced:(BOOL)a3 animated:(BOOL)a4;
- (void)updateDraggingOccurrenceFrame;
- (void)updateDraggingOccurrenceFrameFromSource;
- (void)updateDraggingOccurrenceOrigin;
@end

@implementation EKEventGestureController

- (void)setUsesHorizontalDragLocking:(BOOL)a3
{
  self->_usesHorizontalDragLocking = a3;
}

- (void)setDelegate:(id)a3
{
}

- (EKEventGestureController)initWithView:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)EKEventGestureController;
  v5 = [(EKEventGestureController *)&v23 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_targetView, v4);
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v6 action:sel__tapGesture_];
    tapGestureRecognizer = v6->_tapGestureRecognizer;
    v6->_tapGestureRecognizer = (UITapGestureRecognizer *)v7;

    [(UITapGestureRecognizer *)v6->_tapGestureRecognizer setCancelsTouchesInView:0];
    [v4 addGestureRecognizer:v6->_tapGestureRecognizer];
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:v6 action:sel__longPress_];
    draggingGestureRecognizer = v6->_draggingGestureRecognizer;
    v6->_draggingGestureRecognizer = (UILongPressGestureRecognizer *)v9;

    [(UILongPressGestureRecognizer *)v6->_draggingGestureRecognizer setDelaysTouchesBegan:0];
    [(UILongPressGestureRecognizer *)v6->_draggingGestureRecognizer setDelegate:v6];
    [v4 addGestureRecognizer:v6->_draggingGestureRecognizer];
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4FB1738]) initWithDelegate:v6];
    dropInteraction = v6->_dropInteraction;
    v6->_dropInteraction = (UIDropInteraction *)v11;

    [v4 addInteraction:v6->_dropInteraction];
    uint64_t v13 = [objc_alloc(MEMORY[0x1E4FB1708]) initWithDelegate:v6];
    dragInteraction = v6->_dragInteraction;
    v6->_dragInteraction = (UIDragInteraction *)v13;

    [(UIDragInteraction *)v6->_dragInteraction setEnabled:1];
    [v4 addInteraction:v6->_dragInteraction];
    v6->_currentDropDataOwnerCache = 0;
    [(UIDragInteraction *)v6->_dragInteraction _setPointerLiftDelay:0.25];
    [(UIDragInteraction *)v6->_dragInteraction _setAllowsPointerDragBeforeLiftDelay:0];
    uint64_t v15 = [objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v6 action:sel__multiSelect_];
    multiSelectGestureRecognizer = v6->_multiSelectGestureRecognizer;
    v6->_multiSelectGestureRecognizer = (UITapGestureRecognizer *)v15;

    [(UITapGestureRecognizer *)v6->_multiSelectGestureRecognizer setAllowedTouchTypes:&unk_1F0D03CD0];
    [(UITapGestureRecognizer *)v6->_multiSelectGestureRecognizer setDelegate:v6];
    [v4 addGestureRecognizer:v6->_multiSelectGestureRecognizer];
    v17 = NSString;
    v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[EKEventGestureController hash](v6, "hash"));
    v19 = [v17 stringWithFormat:@"%@", v18];
    uint64_t v20 = [v19 substringToIndex:4];
    sessionIdentifierForDebug = v6->_sessionIdentifierForDebug;
    v6->_sessionIdentifierForDebug = (NSString *)v20;

    *(void *)&v6->_pendingDraggingState = -1;
    v6->_snappingTypeForCurrentDrag = 0;
  }

  return v6;
}

- (BOOL)dragGestureInProgress
{
  if ((self->_pendingDraggingState & 0xFFFFFFFD) != 0) {
    return (self->_currentDraggingState < 5u) & (0x1Au >> self->_currentDraggingState);
  }
  else {
    return 0;
  }
}

- (EKDayOccurrenceView)draggingView
{
  return self->_draggingView;
}

- (void)dealloc
{
  dragSnappingFeedback = self->_dragSnappingFeedback;
  if (dragSnappingFeedback)
  {
    [(_UIDragSnappingFeedbackGenerator *)dragSnappingFeedback userInteractionEnded];
    id v4 = self->_dragSnappingFeedback;
    self->_dragSnappingFeedback = 0;
  }
  [(EKEventGestureController *)self _removeScrollTimer];
  [(EKEventGestureController *)self removeDraggedOccurrence];
  v5.receiver = self;
  v5.super_class = (Class)EKEventGestureController;
  [(EKEventGestureController *)&v5 dealloc];
}

- (void)invalidate
{
  if (self->_draggingView) {
    [(EKEventGestureController *)self _cancel];
  }
  [(EKEventGestureController *)self _removeScrollTimer];
  v3 = [(UILongPressGestureRecognizer *)self->_draggingGestureRecognizer view];
  [v3 removeGestureRecognizer:self->_draggingGestureRecognizer];

  [(EKEventGestureController *)self setDelegate:0];
  [(EKEventGestureController *)self setUntimedDelegate:0];
  [(EKEventGestureController *)self setEvent:0];
  id v4 = [(UIDropInteraction *)self->_dropInteraction view];
  [v4 removeInteraction:self->_dropInteraction];

  dropInteraction = self->_dropInteraction;
  self->_dropInteraction = 0;

  v6 = [(UIDragInteraction *)self->_dragInteraction view];
  [v6 removeInteraction:self->_dragInteraction];

  dragInteraction = self->_dragInteraction;
  self->_dragInteraction = 0;
}

- (void)updateDraggingOccurrence
{
}

- (void)updateDraggingOccurrenceForced:(BOOL)a3 animated:(BOOL)a4
{
  draggingView = self->_draggingView;
  if (draggingView)
  {
    BOOL v6 = a4;
    id v27 = [(EKDayOccurrenceView *)draggingView occurrence];
    if (a3
      || [(UILongPressGestureRecognizer *)self->_draggingGestureRecognizer state] != 3
      && [(UILongPressGestureRecognizer *)self->_draggingGestureRecognizer state] != 5
      && [(UILongPressGestureRecognizer *)self->_draggingGestureRecognizer state])
    {
      if ([(UILongPressGestureRecognizer *)self->_draggingGestureRecognizer state] != 1
        && [(UILongPressGestureRecognizer *)self->_draggingGestureRecognizer state] != 2
        && ![(EKEventGestureController *)self dragGestureInProgress])
      {
        goto LABEL_7;
      }
      v8 = [(EKDayOccurrenceView *)self->_draggingView superview];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v10 = [WeakRetained occurrenceViewSuperviewForEventGestureController:self];

      if (v8 == v10)
      {
        [(EKEventGestureController *)self _update];
      }
      else
      {
LABEL_7:
        [(EKEventGestureController *)self _calculateFrameForDraggingViewIncludingTravelTime:1];
        double v12 = v11;
        double v14 = v13;
        double v16 = v15;
        double v18 = v17;
        int v19 = [(EKEvent *)self->_event changingAllDayPropertyIsAllowed];
        if (v19)
        {
          id v20 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(v20, "eventGestureController:adjustDraggingView:forAllDay:", self, self->_draggingView, objc_msgSend(v27, "isAllDay"));
        }
        if (v6)
        {
          -[EKDayOccurrenceView animateToFrame:isAllDay:beginFromCurrentState:whenFinished:](self->_draggingView, "animateToFrame:isAllDay:beginFromCurrentState:whenFinished:", [v27 isAllDay], 0, 0, v12, v14, v16, v18);
        }
        else
        {
          -[EKDayOccurrenceView setFrame:](self->_draggingView, "setFrame:", v12, v14, v16, v18);
          if (v19)
          {
            -[EKDayOccurrenceView setAllDay:](self->_draggingView, "setAllDay:", [v27 isAllDay]);
            [(EKDayOccurrenceView *)self->_draggingView requestContentIfNeeded:16 completion:0];
          }
          -[EKDayOccurrenceView setDrawsResizeHandles:](self->_draggingView, "setDrawsResizeHandles:", [v27 isAllDay] ^ 1);
        }
        id v21 = objc_loadWeakRetained((id *)&self->_delegate);
        v22 = [(EKDayOccurrenceView *)self->_draggingView occurrence];
        objc_super v23 = [v27 startDate];
        [v23 timeIntervalSinceReferenceDate];
        objc_msgSend(v21, "eventGestureController:didCommitOccurrence:toDate:isAllDay:span:", self, v22, objc_msgSend(v27, "isAllDay"), 0, v24);

        if ([(UILongPressGestureRecognizer *)self->_draggingGestureRecognizer state] != 1)
        {
          id v25 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(v25, "eventGestureController:addViewToScroller:isAllDay:", self, self->_draggingView, objc_msgSend(v27, "isAllDay"));

          v26 = [(EKDayOccurrenceView *)self->_draggingView superview];
          [v26 bringSubviewToFront:self->_draggingView];

          [(EKDayOccurrenceView *)self->_draggingView bringResizeHandlesToFront];
        }
      }
    }
  }
}

- (CGRect)_calculateFrameForDraggingViewIncludingTravelTime:(BOOL)a3
{
  draggingView = self->_draggingView;
  if (draggingView)
  {
    BOOL v6 = [(EKDayOccurrenceView *)draggingView occurrence];
    uint64_t v7 = v6;
    if (a3) {
      [v6 startDateIncludingTravel];
    }
    else {
    double v12 = [v6 startDate];
    }
    [v12 timeIntervalSinceReferenceDate];
    double v14 = v13;
    if ([(EKEventGestureController *)self splitMultiDays] || self->_touchOffsetDays >= 1)
    {
      [(EKCalendarDate *)self->_currentDay absoluteTime];
      double v14 = v15;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "eventGestureController:pointAtDate:isAllDay:", self, objc_msgSend(v7, "isAllDay"), v14);
    double v18 = v17;
    double v20 = v19;

    [v7 durationIncludingTravel];
    double v22 = fmin(v21, 86400.0);
    if (([v7 isAllDay] & 1) == 0)
    {
      int64_t touchOffsetDays = self->_touchOffsetDays;
      if (touchOffsetDays >= 1 && touchOffsetDays + 1 == [v7 daySpan])
      {
        double v24 = (void *)MEMORY[0x1E4F57838];
        id v25 = [v7 endDateUnadjustedForLegacyClients];
        v26 = [v7 timeZone];
        id v27 = [v24 calendarDateWithDate:v25 timeZone:v26];

        [v27 absoluteTime];
        double v29 = v28;
        v30 = [v27 calendarDateForDay];
        [v30 absoluteTime];
        double v22 = v29 - v31;
      }
    }
    [(EKEventGestureController *)self _computeWidthForOccurrenceView];
    double v10 = v32;
    -[EKEventGestureController _computeHeightForOccurrenceViewOfDuration:event:allDay:](self, "_computeHeightForOccurrenceViewOfDuration:event:allDay:", v7, [v7 isAllDay], v22);
    double v11 = v33;
    -[EKEventGestureController _computeOriginAtTouchPoint:forDate:isAllDay:allowXOffset:allowFloorAtRegionBottom:](self, "_computeOriginAtTouchPoint:forDate:isAllDay:allowXOffset:allowFloorAtRegionBottom:", [v7 isAllDay], 0, 1, v18, v20, v14);
    double v8 = v34;
    double v9 = v35;
    id v36 = objc_loadWeakRetained((id *)&self->_delegate);
    v37 = [v36 occurrenceViewSuperviewForEventGestureController:self];

    v38 = [(EKDayOccurrenceView *)self->_draggingView superview];

    if (v38 != v37)
    {
      v39 = [(EKDayOccurrenceView *)self->_draggingView superview];
      objc_msgSend(v37, "convertRect:toView:", v39, v8, v9, v10, v11);
      double v8 = v40;
      double v9 = v41;
      double v10 = v42;
      double v11 = v43;
    }
  }
  else
  {
    double v8 = *MEMORY[0x1E4F1DB28];
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  double v44 = v8;
  double v45 = v9;
  double v46 = v10;
  double v47 = v11;
  result.size.height = v47;
  result.size.width = v46;
  result.origin.y = v45;
  result.origin.x = v44;
  return result;
}

- (void)updateDraggingOccurrenceFrame
{
  if (self->_draggingView)
  {
    [(EKEventGestureController *)self _calculateFrameForDraggingViewIncludingTravelTime:1];
    -[EKDayOccurrenceView setFrame:](self->_draggingView, "setFrame:");
    draggingView = self->_draggingView;
    uint64_t v4 = [(EKEvent *)self->_event isAllDay] ^ 1;
    [(EKDayOccurrenceView *)draggingView setDrawsResizeHandles:v4];
  }
}

- (void)removeDraggedOccurrence
{
  draggingView = self->_draggingView;
  if (draggingView)
  {
    [(EKDayOccurrenceView *)draggingView removeFromSuperview];
    [(EKEventGestureController *)self _hideEditingMenuForView:self->_draggingView];
    uint64_t v4 = self->_draggingView;
    self->_draggingView = 0;
  }

  [(EKEventGestureController *)self setEvent:0];
}

- (void)promptUserForRecurrenceActionOnOccurrence:(id)a3 whenFinished:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(EKEventGestureController *)self delegate];

  if (v8)
  {
    double v9 = [(EKEventGestureController *)self delegate];
    uint64_t v10 = [v9 currentPresentationController];
LABEL_5:
    double v11 = (void *)v10;

    goto LABEL_6;
  }
  double v11 = [(EKEventGestureController *)self untimedDelegate];

  if (v11)
  {
    double v9 = [(EKEventGestureController *)self untimedDelegate];
    uint64_t v10 = [v9 eventGestureControllerCurrentPresentationController:self];
    goto LABEL_5;
  }
LABEL_6:
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __83__EKEventGestureController_promptUserForRecurrenceActionOnOccurrence_whenFinished___block_invoke;
  v15[3] = &unk_1E608B130;
  v15[4] = self;
  id v16 = v7;
  id v12 = v7;
  double v13 = +[EKUIRecurrenceAlertController presentDetachAlertWithOptions:2 viewController:v11 barButtonItem:0 forEvent:v6 withCompletionHandler:v15];
  recurrenceAlertController = self->_recurrenceAlertController;
  self->_recurrenceAlertController = v13;
}

void __83__EKEventGestureController_promptUserForRecurrenceActionOnOccurrence_whenFinished___block_invoke(uint64_t a1, uint64_t a2)
{
  switch(a2)
  {
    case 4:
    case 5:
      return;
    default:
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      uint64_t v3 = *(void *)(a1 + 32);
      uint64_t v4 = *(void **)(v3 + 272);
      *(void *)(v3 + 272) = 0;

      break;
  }
}

- (void)promptUserForProposeNewTime:(id)a3 forEvent:(id)a4 whenFinished:(id)a5
{
  id v32 = a5;
  id v7 = a4;
  id v8 = a3;
  double v35 = [v7 organizer];
  double v33 = [MEMORY[0x1E4F255C0] participantForSortingWithEKParticipant:v35];
  double v9 = EventKitUIBundle();
  uint64_t v10 = [v9 localizedStringForKey:@"Propose a new time?" value:&stru_1F0CC2140 table:0];

  double v11 = NSString;
  id v12 = EventKitUIBundle();
  double v13 = [v12 localizedStringForKey:@"Ask %@ to move “%@” to %@ at %@" value:&stru_1F0CC2140 table:0];
  double v14 = [v33 displayName];
  double v15 = [v7 title];

  id v16 = [v8 localizedRelativeDateStringShortened:0 lowercase:1];
  double v17 = [v8 timeStringAlwaysIncludeMinutes:0];

  double v18 = objc_msgSend(v11, "localizedStringWithFormat:", v13, v14, v15, v16, v17);

  double v19 = EventKitUIBundle();
  double v20 = [v19 localizedStringForKey:@"Cancel - prompt user for propose new time" value:@"Cancel" table:0];

  double v21 = EventKitUIBundle();
  double v22 = [v21 localizedStringForKey:@"Send" value:&stru_1F0CC2140 table:0];

  objc_super v23 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v10 message:v18 preferredStyle:1];
  double v24 = (void *)MEMORY[0x1E4FB1410];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __78__EKEventGestureController_promptUserForProposeNewTime_forEvent_whenFinished___block_invoke;
  v38[3] = &unk_1E608A7C0;
  id v25 = v32;
  id v39 = v25;
  v26 = [v24 actionWithTitle:v20 style:1 handler:v38];
  [v23 addAction:v26];

  id v27 = (void *)MEMORY[0x1E4FB1410];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __78__EKEventGestureController_promptUserForProposeNewTime_forEvent_whenFinished___block_invoke_2;
  v36[3] = &unk_1E608A7C0;
  id v37 = v25;
  id v28 = v25;
  double v29 = [v27 actionWithTitle:v22 style:0 handler:v36];
  [v23 addAction:v29];

  v30 = [(EKEventGestureController *)self delegate];
  double v31 = [v30 currentPresentationController];
  [v31 presentViewController:v23 animated:1 completion:0];
}

uint64_t __78__EKEventGestureController_promptUserForProposeNewTime_forEvent_whenFinished___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

uint64_t __78__EKEventGestureController_promptUserForProposeNewTime_forEvent_whenFinished___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  uint64_t v4 = (UITapGestureRecognizer *)a3;
  objc_super v5 = v4;
  BOOL v6 = self->_multiSelectGestureRecognizer != v4
    || ([(UITapGestureRecognizer *)v4 modifierFlags] & 0x120000) != 0;

  return v6;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (![a3 state])
  {
    p_untimedDelegate = &self->_untimedDelegate;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_untimedDelegate);

    if (WeakRetained
      || (p_untimedDelegate = &self->_delegate,
          id v10 = objc_loadWeakRetained((id *)&self->_delegate),
          v10,
          v10))
    {
      id v11 = objc_loadWeakRetained((id *)p_untimedDelegate);
      id v12 = [v11 touchTrackingViewForEventGestureController:self];

      if (v12)
      {
        [v12 bounds];
        CGFloat v14 = v13;
        CGFloat v16 = v15;
        CGFloat v18 = v17;
        CGFloat v20 = v19;
        [v6 locationInView:v12];
        v57.x = v21;
        v57.y = v22;
        v60.origin.x = v14;
        v60.origin.y = v16;
        v60.size.width = v18;
        v60.size.height = v20;
        if (!CGRectContainsPoint(v60, v57)) {
          goto LABEL_22;
        }
      }
    }
    else
    {
      id v12 = 0;
    }
    if (!self->_forcedStart) {
      goto LABEL_21;
    }
    [(EKDayOccurrenceView *)self->_draggingView bounds];
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    CGFloat v30 = v29;
    [v6 locationInView:self->_draggingView];
    v58.x = v31;
    v58.y = v32;
    v61.origin.x = v24;
    v61.origin.y = v26;
    v61.size.width = v28;
    v61.size.height = v30;
    BOOL v33 = CGRectContainsPoint(v61, v58);
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    double v34 = [(EKDayOccurrenceView *)self->_draggingView arrayOfResizeHandles];
    uint64_t v35 = [v34 countByEnumeratingWithState:&v51 objects:v55 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v52 != v37) {
            objc_enumerationMutation(v34);
          }
          if (v33)
          {
            BOOL v33 = 1;
          }
          else
          {
            id v39 = *(void **)(*((void *)&v51 + 1) + 8 * i);
            [v39 bounds];
            CGFloat v41 = v40;
            CGFloat v43 = v42;
            CGFloat v45 = v44;
            CGFloat v47 = v46;
            [v6 locationInView:v39];
            v59.x = v48;
            v59.y = v49;
            v62.origin.x = v41;
            v62.origin.y = v43;
            v62.size.width = v45;
            v62.size.height = v47;
            BOOL v33 = CGRectContainsPoint(v62, v59);
          }
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v51 objects:v55 count:16];
      }
      while (v36);
    }

    if (v33)
    {
LABEL_21:
      BOOL v7 = 1;
LABEL_23:

      goto LABEL_24;
    }
LABEL_22:
    BOOL v7 = 0;
    goto LABEL_23;
  }
  BOOL v7 = 1;
LABEL_24:

  return v7;
}

- (void)updateDraggingOccurrenceOrigin
{
  [(EKEventGestureController *)self _calculateFrameForDraggingViewIncludingTravelTime:1];
  double v4 = v3;
  double v6 = v5;
  BOOL v7 = [(EKEventGestureController *)self draggingView];
  [v7 frame];
  double v9 = v8;
  double v11 = v10;

  draggingView = self->_draggingView;

  -[EKDayOccurrenceView setFrame:](draggingView, "setFrame:", v4, v6, v9, v11);
}

- (void)updateDraggingOccurrenceFrameFromSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v4 = [(EKEventGestureController *)self draggingViewSource];
  double v5 = [v4 occurrence];
  double v6 = [(EKEventGestureController *)self draggingViewSource];
  BOOL v7 = [v6 occurrenceDate];
  id v27 = [WeakRetained eventGestureController:self occurrenceViewForOccurrence:v5 occurrenceDate:v7];

  double v8 = v27;
  if (v27)
  {
    [(EKEventGestureController *)self setDraggingViewSource:v27];
    double v9 = [(EKEventGestureController *)self draggingViewSource];
    [v9 frame];
    double v11 = v10;
    double v13 = v12;

    CGFloat v14 = [(EKEventGestureController *)self draggingViewSource];
    double v15 = [v14 superview];
    CGFloat v16 = [(EKEventGestureController *)self draggingViewSource];
    [v16 frame];
    double v18 = v17;
    double v20 = v19;
    CGFloat v21 = [(EKDayOccurrenceView *)self->_draggingView superview];
    objc_msgSend(v15, "convertPoint:toView:", v21, v18, v20);
    double v23 = v22;
    double v25 = v24;

    CGFloat v26 = [(EKEventGestureController *)self draggingView];
    objc_msgSend(v26, "setFrame:", v23, v25, v11, v13);

    double v8 = v27;
  }
}

- (int64_t)_occurrenceDateIndexWithEvent:(id)a3 occurrenceDate:(id)a4
{
  id v5 = a4;
  double v6 = [a3 startCalendarDate];
  int64_t v7 = [v5 differenceInDays:v6];

  return v7;
}

- (void)forceStartWithOccurrence:(id)a3 occurrenceDate:(id)a4 shouldUpdateViewSource:(BOOL)a5 shouldUpdateOrigin:(BOOL)a6 shouldPresentEditMenu:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  if (!self->_isDragging
    && ![(EKEventGestureController *)self dragGestureInProgress]
    && !self->_forcedStart)
  {
    double v15 = (void *)MEMORY[0x1E4FB1EB0];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __132__EKEventGestureController_forceStartWithOccurrence_occurrenceDate_shouldUpdateViewSource_shouldUpdateOrigin_shouldPresentEditMenu___block_invoke;
    v16[3] = &unk_1E608B158;
    SEL v20 = a2;
    id v17 = v13;
    double v18 = self;
    id v19 = v14;
    BOOL v21 = a5;
    BOOL v22 = a7;
    BOOL v23 = a6;
    [v15 performWithoutAnimation:v16];
  }
}

void __132__EKEventGestureController_forceStartWithOccurrence_occurrenceDate_shouldUpdateViewSource_shouldUpdateOrigin_shouldPresentEditMenu___block_invoke(uint64_t a1)
{
  if (!*(void *)(a1 + 32))
  {
    CGRect v62 = [MEMORY[0x1E4F28B00] currentHandler];
    [v62 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 40) file:@"CalendarEventGestures.m" lineNumber:584 description:@"Attempted to force start a drag with a nil occurrence"];
  }
  *(unsigned char *)(*(void *)(a1 + 40) + 264) = 1;
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v2 + 45) && *(void *)(v2 + 56))
  {
    int v3 = [*(id *)(v2 + 56) isHidden];
    uint64_t v2 = *(void *)(a1 + 40);
  }
  else
  {
    int v3 = 0;
  }
  [(id)v2 removeDraggedOccurrence];
  [*(id *)(a1 + 40) setEvent:*(void *)(a1 + 32)];
  *(void *)(*(void *)(a1 + 40) + 72) = [*(id *)(a1 + 40) _occurrenceDateIndexWithEvent:*(void *)(a1 + 32) occurrenceDate:*(void *)(a1 + 48)];
  [*(id *)(*(void *)(a1 + 40) + 8) setMinimumPressDuration:0.0];
  double v4 = [*(id *)(a1 + 40) delegate];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [*(id *)(a1 + 40) delegate];
    char v6 = [v5 eventGestureController:*(void *)(a1 + 40) shouldAllowShortLiftDelay:*(void *)(a1 + 32)];

    if ((v6 & 1) == 0)
    {
      double v7 = 0.25;
      _UIDragInteractionDefaultLiftDelay();
      goto LABEL_12;
    }
  }
  else
  {
  }
  double v7 = 0.04;
  double v8 = 0.04;
LABEL_12:
  [*(id *)(*(void *)(a1 + 40) + 304) _setLiftDelay:v8];
  [*(id *)(*(void *)(a1 + 40) + 304) _setPointerLiftDelay:v7];
  double v9 = [*(id *)(a1 + 32) startCalendarDate];
  double v10 = [v9 calendarDateByAddingDays:*(void *)(*(void *)(a1 + 40) + 176)];
  id v63 = [v10 calendarDateForDay];

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 344));
  uint64_t v12 = *(void *)(a1 + 40);
  [v63 absoluteTime];
  objc_msgSend(WeakRetained, "eventGestureController:pointAtDate:isAllDay:", v12, objc_msgSend(*(id *)(a1 + 32), "isAllDay"), v13);
  double v15 = v14;
  double v17 = v16;

  id v18 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 344));
  [v18 timedRegionOriginForEventGestureController:*(void *)(a1 + 40)];
  double v20 = v19;

  int v21 = [*(id *)(a1 + 32) isAllDay];
  if (v17 >= v20) {
    int v22 = 1;
  }
  else {
    int v22 = v21;
  }
  if (!v22) {
    double v17 = v20;
  }
  if (*(unsigned char *)(a1 + 64))
  {
    id v23 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 344));
    double v24 = [v23 eventGestureController:*(void *)(a1 + 40) occurrenceViewForOccurrence:*(void *)(a1 + 32) occurrenceDate:*(void *)(a1 + 48)];
    [*(id *)(a1 + 40) setDraggingViewSource:v24];
  }
  uint64_t v25 = *(void *)(a1 + 40);
  *(double *)(v25 + 88) = v15;
  *(double *)(v25 + 96) = v17;
  *(unsigned char *)(*(void *)(a1 + 40) + 217) = 1;
  id v26 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 336));

  uint64_t v27 = *(void *)(a1 + 40);
  if (v26)
  {
    id v28 = objc_loadWeakRetained((id *)(v27 + 336));
    uint64_t v29 = objc_msgSend(v28, "eventGestureController:setUpAtPoint:withOccurrence:forceNewEvent:", *(void *)(a1 + 40), 0, 0, v15, v17);
    uint64_t v30 = *(void *)(a1 + 40);
    CGFloat v31 = *(void **)(v30 + 64);
    *(void *)(v30 + 64) = v29;
  }
  else
  {
    id v35 = objc_loadWeakRetained((id *)(v27 + 344));

    if (v35)
    {
      uint64_t v36 = [*(id *)(a1 + 40) _createTemporaryView:*(void *)(a1 + 32) animated:1];
      uint64_t v37 = *(void *)(a1 + 40);
      v38 = *(void **)(v37 + 56);
      *(void *)(v37 + 56) = v36;

      if (*(unsigned char *)(a1 + 65)) {
        [*(id *)(a1 + 40) _updatePositionOfEditingMenuForView:*(void *)(*(void *)(a1 + 40) + 56)];
      }
      if (v3) {
        [*(id *)(a1 + 40) _setLocalDraggingViewHidden:1];
      }
      if (([*(id *)(a1 + 32) isNew] & 1) == 0)
      {
        id v39 = [*(id *)(a1 + 40) draggingViewSource];

        if (v39)
        {
          double v40 = [*(id *)(a1 + 40) draggingViewSource];
          [v40 travelTimeSubviewHeightInPoints];
          objc_msgSend(*(id *)(*(void *)(a1 + 40) + 56), "setTravelTimeSubviewHeightInPoints:");

          CGFloat v41 = [*(id *)(a1 + 40) draggingViewSource];
          [v41 frame];
          BOOL IsEmpty = CGRectIsEmpty(v65);

          if (!IsEmpty)
          {
            [*(id *)(*(void *)(a1 + 40) + 56) frame];
            double v44 = v43;
            double v46 = v45;
            CGFloat v47 = [*(id *)(a1 + 40) draggingViewSource];
            [v47 frame];

            CGFloat v48 = [*(id *)(a1 + 40) draggingViewSource];
            CGFloat v49 = [v48 superview];
            v50 = [*(id *)(a1 + 40) draggingViewSource];
            [v50 frame];
            double v52 = v51;
            double v54 = v53;
            v55 = [*(id *)(*(void *)(a1 + 40) + 56) superview];
            objc_msgSend(v49, "convertPoint:toView:", v55, v52, v54);
            double v57 = v56;

            if (*(unsigned char *)(a1 + 66)) {
              double v46 = v57;
            }
            [*(id *)(a1 + 40) _computeWidthForOccurrenceView];
            double v59 = v58;
            [*(id *)(a1 + 32) durationIncludingTravel];
            objc_msgSend(*(id *)(a1 + 40), "_computeHeightForOccurrenceViewOfDuration:event:allDay:", *(void *)(*(void *)(a1 + 40) + 64), objc_msgSend(*(id *)(*(void *)(a1 + 40) + 64), "isAllDay"), fmin(v60, 86400.0));
            objc_msgSend(*(id *)(*(void *)(a1 + 40) + 56), "setFrame:", v44, v46, v59, v61);
          }
        }
      }
    }
  }
  uint64_t v32 = *(void *)(a1 + 40);
  if (!*(unsigned char *)(v32 + 202) || !*(void *)(v32 + 176))
  {
    if (!v3 || (v33 = [*(id *)(v32 + 56) isHidden], uint64_t v32 = *(void *)(a1 + 40), (v33 & 1) == 0))
    {
      [*(id *)(v32 + 56) setDrawsResizeHandles:1];
      uint64_t v32 = *(void *)(a1 + 40);
    }
  }
  id v34 = objc_loadWeakRetained((id *)(v32 + 344));
  objc_msgSend(v34, "eventGestureController:addViewToScroller:isAllDay:", *(void *)(a1 + 40), *(void *)(*(void *)(a1 + 40) + 56), objc_msgSend(*(id *)(a1 + 32), "isAllDay"));
}

- (void)endForcedStartAndUndim
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained eventGestureController:self didCancelEditingOccurrence:self->_event fadedOut:1];

  [(EKEventGestureController *)self endForcedStart:0];
}

- (void)endForcedStart:(BOOL)a3
{
  if ((a3
     || [(UILongPressGestureRecognizer *)self->_draggingGestureRecognizer state] != 1
     && [(UILongPressGestureRecognizer *)self->_draggingGestureRecognizer state] != 2)
    && (self->_forcedStart || self->_currentDraggingState || self->_pendingDraggingState != 3))
  {
    [(EKEventGestureController *)self _cleanUpForcedStart];
    [(EKEventGestureController *)self removeDraggedOccurrence];
    double v4 = *MEMORY[0x1E4F1DAD8];
    double v5 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    -[EKEventGestureController _setDraggingState:withPoint:event:](self, "_setDraggingState:withPoint:event:", 0, 0, v4, v5);
  }
}

- (void)liftUpOccurrenceForEditingEvent:(id)a3
{
  id v4 = a3;
  if ((self->_currentDraggingState | 2) == 2)
  {
    id v5 = v4;
    [(EKEventGestureController *)self forceStartWithOccurrence:v4 occurrenceDate:0 shouldUpdateViewSource:0 shouldUpdateOrigin:0 shouldPresentEditMenu:0];
    id v4 = v5;
    self->_currentDraggingState = 2;
  }
}

- (void)_cleanUpForcedStart
{
  self->_dragInitiationLocked = 1;
  if (self->_forcedStart)
  {
    self->_forcedStart = 0;
    [(UILongPressGestureRecognizer *)self->_draggingGestureRecognizer setMinimumPressDuration:0.4];
    _UIDragInteractionDefaultLiftDelay();
    -[UIDragInteraction _setLiftDelay:](self->_dragInteraction, "_setLiftDelay:");
    [(UIDragInteraction *)self->_dragInteraction _setPointerLiftDelay:0.25];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__EKEventGestureController__cleanUpForcedStart__block_invoke;
  block[3] = &unk_1E6087570;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
  self->_int64_t touchOffsetDays = 0;
  self->_commitOffsetDays = 0;
}

uint64_t __47__EKEventGestureController__cleanUpForcedStart__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 48) = 0;
  return result;
}

- (void)_tapGesture:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  double v7 = [WeakRetained touchTrackingViewForEventGestureController:self];
  [v5 locationInView:v7];
  double v9 = v8;
  double v11 = v10;

  id v12 = objc_loadWeakRetained((id *)p_delegate);
  double v13 = objc_msgSend(v12, "eventGestureController:occurrenceViewAtPoint:ignoreSelectedCopyView:", self, 0, v9, v11);

  if (([v13 isAllDay] & 1) == 0)
  {
    id v14 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [v13 frameOfOpaqueContent];
    double v15 = objc_msgSend(v14, "initWithFrame:");
    double v16 = [v15 layer];
    [v16 setCornerRadius:4.0];

    double v17 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.1];
    [v15 setBackgroundColor:v17];

    [v15 setUserInteractionEnabled:0];
    [v13 insertSubview:v15 atIndex:0];
    id v18 = (void *)MEMORY[0x1E4FB1EB0];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __40__EKEventGestureController__tapGesture___block_invoke;
    v22[3] = &unk_1E6087570;
    id v23 = v15;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __40__EKEventGestureController__tapGesture___block_invoke_2;
    v20[3] = &unk_1E6087520;
    id v21 = v23;
    id v19 = v23;
    [v18 animateWithDuration:2 delay:v22 usingSpringWithDamping:v20 initialSpringVelocity:0.5 options:0.5 animations:1.0 completion:0.0];
  }
}

void __40__EKEventGestureController__tapGesture___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4FB1618] clearColor];
  [*(id *)(a1 + 32) setBackgroundColor:v2];
}

uint64_t __40__EKEventGestureController__tapGesture___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)_multiSelect:(id)a3
{
  p_untimedDelegate = &self->_untimedDelegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_untimedDelegate);

  if (WeakRetained)
  {
    id v7 = objc_loadWeakRetained((id *)p_untimedDelegate);
    double v8 = [(EKEventGestureController *)self _viewForTracking];
    [v5 locationInView:v8];
    double v10 = v9;
    double v12 = v11;

    objc_msgSend(v7, "eventGestureController:eventToStartInteractionWithAtPoint:", self, v10, v12);
    id v22 = (id)objc_claimAutoreleasedReturnValue();

    double v13 = v22;
    if (!v22) {
      goto LABEL_6;
    }
    id v14 = objc_loadWeakRetained((id *)p_untimedDelegate);
    [v14 eventGestureController:self toggleSelectionOfEvent:v22];
  }
  else
  {
    id v15 = objc_loadWeakRetained((id *)&self->_delegate);
    double v16 = [v15 touchTrackingViewForEventGestureController:self];
    [v5 locationInView:v16];
    double v18 = v17;
    double v20 = v19;

    objc_msgSend(v15, "eventGestureController:occurrenceViewAtPoint:ignoreSelectedCopyView:", self, 0, v18, v20);
    id v22 = (id)objc_claimAutoreleasedReturnValue();

    id v14 = [(EKEventGestureController *)self delegate];
    id v21 = [v22 occurrence];
    [v14 eventGestureController:self didSingleTapOccurrence:v21 shouldExtendSelection:1];
  }
  double v13 = v22;
LABEL_6:
}

- (void)_longPress:(id)a3
{
  id v18 = a3;
  if (![(EKEventGestureController *)self _shouldUseSystemAPIForDrag]
    || self->_currentDraggingState == 2 && (id v4 = objc_loadWeakRetained((id *)&self->_delegate), v4, v4))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained
      && (char v6 = WeakRetained,
          id v7 = objc_loadWeakRetained((id *)&self->_delegate),
          char v8 = objc_opt_respondsToSelector(),
          v7,
          v6,
          (v8 & 1) != 0))
    {
      id v9 = objc_loadWeakRetained((id *)&self->_delegate);
      char v10 = [v9 eventGestureControllerShouldAllowLongPress:self];

      if ((v10 & 1) == 0) {
        goto LABEL_20;
      }
    }
    else
    {
      id v11 = objc_loadWeakRetained((id *)&self->_untimedDelegate);

      if (v11)
      {
        id v12 = objc_loadWeakRetained((id *)&self->_untimedDelegate);
        int v13 = [v12 eventGestureControllerShouldAllowLongPress:self];

        if (!v13) {
          goto LABEL_20;
        }
      }
    }
    id v14 = [(EKEventGestureController *)self _viewForTracking];
    if ([v18 state] == 1
      && (id v15 = objc_loadWeakRetained((id *)&self->_delegate)) != 0
      && (int currentDraggingState = self->_currentDraggingState, v15, currentDraggingState == 2))
    {
      [v18 locationInView:self->_draggingView];
      unsigned int v17 = -[EKDayOccurrenceView dragTypeFromPoint:](self->_draggingView, "dragTypeFromPoint:") & 0xFFFFFFFD;
      [v18 locationInView:v14];
      if (v17)
      {
        -[EKEventGestureController _setTouchOffsetsFromPoint:fixedToCenter:](self, "_setTouchOffsetsFromPoint:fixedToCenter:", 0);
      }
      else
      {
        -[EKEventGestureController _setDraggingState:withPoint:event:](self, "_setDraggingState:withPoint:event:", 3, 0);
        [(EKEventGestureController *)self _updateFlingToCancelParameters];
        self->_waitingForDragToInitialize = 0;
      }
    }
    else if (![(EKEventGestureController *)self _shouldUseSystemAPIForDrag] {
           && (self->_currentDraggingState & 0xFFFFFFFE) == 2)
    }
    {
      [(EKEventGestureController *)self _handleLongPressResponseForOldAPI:v18];
    }
  }
LABEL_20:
}

- (BOOL)_useNewDragAndDropAPI
{
  return 1;
}

- (BOOL)_shouldUseSystemAPIForDrag
{
  return (self->_currentDragType | 2) != 2
      && [(EKEventGestureController *)self _useNewDragAndDropAPI];
}

- (void)_handleLongPressResponseForOldAPI:(id)a3
{
  id v15 = a3;
  id v4 = [(EKEventGestureController *)self _viewForTracking];
  [v15 locationInView:v4];
  double v6 = v5;
  double v8 = v7;
  uint64_t v9 = [v15 state];
  if ((unint64_t)(v9 - 4) < 2)
  {
    -[EKEventGestureController _setDraggingState:withPoint:event:](self, "_setDraggingState:withPoint:event:", 4, self->_event, v6, v8);
    goto LABEL_7;
  }
  if (v9 == 3)
  {
LABEL_7:
    -[EKEventGestureController _setDraggingState:withPoint:event:](self, "_setDraggingState:withPoint:event:", 2, self->_event, v6, v8);
    goto LABEL_8;
  }
  if (v9 == 2)
  {
    [(EKEventGestureController *)self _installScrollTimer];
    self->_previousTouchPoint = self->_latestTouchPoint;
    [v15 locationInView:v4];
    self->_latestTouchPoint.x = v10;
    self->_latestTouchPoint.y = v11;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_untimedDelegate);

    if (WeakRetained)
    {
      id v13 = objc_loadWeakRetained((id *)&self->_untimedDelegate);
      objc_msgSend(v13, "eventGestureController:updateToPoint:", self, self->_latestTouchPoint.x, self->_latestTouchPoint.y);
    }
    else
    {
      id v14 = objc_loadWeakRetained((id *)&self->_delegate);

      if (v14) {
        [(EKEventGestureController *)self _update];
      }
    }
  }
LABEL_8:
  [(EKEventGestureController *)self _updateFlingToCancelParameters];
}

- (void)_commitUntimed
{
  if ([(EKEventGestureController *)self commitBlocked])
  {
    self->_needsCommit = 1;
  }
  else
  {
    self->_needsCommit = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_untimedDelegate);
    objc_msgSend(WeakRetained, "eventGestureController:commitToPoint:", self, self->_latestTouchPoint.x, self->_latestTouchPoint.y);
  }
}

- (void)setCommitBlocked:(BOOL)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (self->_commitBlocked != a3)
  {
    self->_commitBlocked = a3;
    if (!a3 && self->_needsCommit)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_untimedDelegate);

      if (WeakRetained)
      {
        [(EKEventGestureController *)self _commitUntimed];
      }
      else
      {
        id v5 = objc_loadWeakRetained((id *)&self->_delegate);

        if (v5)
        {
          double v6 = (void *)kEKUILogHandle;
          if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_INFO))
          {
            draggingView = self->_draggingView;
            event = self->_event;
            uint64_t v9 = v6;
            id v10 = objc_loadWeakRetained((id *)&self->_delegate);
            int v15 = 138412802;
            double v16 = draggingView;
            __int16 v17 = 2112;
            id v18 = event;
            __int16 v19 = 2112;
            id v20 = v10;
            _os_log_impl(&dword_1B3F4C000, v9, OS_LOG_TYPE_INFO, "Delaying event gesture commit: view = %@ event = %@ delegate = %@", (uint8_t *)&v15, 0x20u);
          }
          CGFloat v11 = (void *)kEKUILogHandle;
          if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_INFO))
          {
            id v12 = (void *)MEMORY[0x1E4F29060];
            id v13 = v11;
            id v14 = [v12 callStackSymbols];
            int v15 = 138412290;
            double v16 = v14;
            _os_log_impl(&dword_1B3F4C000, v13, OS_LOG_TYPE_INFO, "Callstack: %@", (uint8_t *)&v15, 0xCu);
          }
          [(EKEventGestureController *)self performSelectorOnMainThread:sel__commit withObject:0 waitUntilDone:0];
        }
      }
    }
  }
}

- (void)_installScrollTimer
{
  if (![(EKEventGestureController *)self _shouldUseSystemAPIForDrag]
    && !self->_scrollTimer)
  {
    self->_timeSinceEnteredPageMargin = -1.0;
    int v3 = [MEMORY[0x1E4F1CB00] timerWithTimeInterval:self target:sel__scrollTimerFired_ selector:0 userInfo:1 repeats:0.0333333333];
    scrollTimer = self->_scrollTimer;
    self->_scrollTimer = v3;

    id v5 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    [v5 addTimer:self->_scrollTimer forMode:*MEMORY[0x1E4F1C3A0]];

    self->_firstContactOfDraggingViewTop = -1.0;
    self->_hasStartedScrolling = 0;
  }
}

- (void)_removeScrollTimer
{
  [(NSTimer *)self->_scrollTimer invalidate];
  scrollTimer = self->_scrollTimer;
  self->_scrollTimer = 0;

  self->_timeSinceEnteredPageMargin = 0.0;
  self->_consecutivePageTurnCount = 0;
}

- (void)_scrollTimerFired:(id)a3
{
  p_untimedDelegate = &self->_untimedDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_untimedDelegate);

  if (WeakRetained)
  {
    id v72 = objc_loadWeakRetained((id *)p_untimedDelegate);
    [v72 eventGestureControllerScrollTimerFired:self];
  }
  else
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)&self->_delegate);
      [v8 pageChangeMarginsForEventGestureController:self];
      double v10 = v9;
      double v68 = v11;
    }
    else
    {
      double v10 = 44.0;
      double v68 = 44.0;
    }
    id v12 = objc_loadWeakRetained((id *)&self->_delegate);
    id v72 = [v12 touchTrackingViewForEventGestureController:self];

    double y = self->_firstTouchPoint.y;
    double v70 = self->_latestTouchPoint.y;
    double v13 = self->_latestTouchPoint.x - self->_firstTouchPoint.x;
    id v14 = objc_loadWeakRetained((id *)&self->_delegate);
    char v15 = objc_opt_respondsToSelector();

    double v16 = 0.0;
    if (v15)
    {
      id v17 = objc_loadWeakRetained((id *)&self->_delegate);
      [v17 horizontalOffsetForPagingForEventGestureController:self];
      double v16 = v18;
    }
    double v71 = v13;
    double v19 = fabs(v13);
    BOOL v20 = v19 > v16 && v16 > 0.0;
    double x = self->_latestTouchPoint.x;
    id v22 = objc_loadWeakRetained((id *)&self->_delegate);
    char v23 = objc_opt_respondsToSelector();

    if (v23)
    {
      id v24 = objc_loadWeakRetained((id *)&self->_delegate);
      [v24 eventGestureController:self convertXForMargin:x];
      double x = v25;
    }
    [v72 frame];
    CGFloat v27 = v26;
    CGFloat v29 = v28;
    CGFloat v31 = v30;
    CGFloat v33 = v32;
    id v34 = objc_loadWeakRetained((id *)&self->_delegate);
    char v35 = objc_opt_respondsToSelector();

    if (v35)
    {
      id v36 = objc_loadWeakRetained((id *)&self->_delegate);
      [v36 marginFrameForEventGestureController:self];
      CGFloat v27 = v37;
      CGFloat v29 = v38;
      CGFloat v31 = v39;
      CGFloat v33 = v40;
    }
    if (v10 <= 0.0)
    {
      BOOL v41 = 0;
    }
    else if (x >= v10)
    {
      v74.origin.double x = v27;
      v74.origin.double y = v29;
      v74.size.width = v31;
      v74.size.height = v33;
      BOOL v41 = x > CGRectGetMaxX(v74) - v68;
    }
    else
    {
      BOOL v41 = 1;
    }
    BOOL v42 = v19 > 6.0 && v41;
    if (v20 || v42)
    {
      double timeSinceEnteredPageMargin = self->_timeSinceEnteredPageMargin;
      if (timeSinceEnteredPageMargin == -1.0)
      {
        self->_double timeSinceEnteredPageMargin = 0.8;
        double v44 = 0.8;
      }
      else
      {
        double v44 = timeSinceEnteredPageMargin + 0.0333333333;
        self->_double timeSinceEnteredPageMargin = v44;
      }
    }
    else
    {
      self->_double timeSinceEnteredPageMargin = -1.0;
      self->_int64_t consecutivePageTurnCount = 0;
      double v44 = -1.0;
    }
    int currentDragType = self->_currentDragType;
    if (currentDragType != 1) {
      goto LABEL_45;
    }
    if (v44 > 0.8)
    {
      int64_t consecutivePageTurnCount = self->_consecutivePageTurnCount;
      if (consecutivePageTurnCount < 2 && v41) {
        goto LABEL_38;
      }
    }
    if (v44 <= 0.6) {
      goto LABEL_45;
    }
    int64_t consecutivePageTurnCount = self->_consecutivePageTurnCount;
    if (consecutivePageTurnCount <= 1) {
      BOOL v41 = 0;
    }
    if (v41)
    {
LABEL_38:
      BOOL v48 = v71 < 0.0 - v16 && v20;
      uint64_t v49 = x < v10 || v48;
      uint64_t v50 = v49 ^ 1;
      self->_double timeSinceEnteredPageMargin = 0.0;
      self->_int64_t consecutivePageTurnCount = consecutivePageTurnCount + 1;
    }
    else
    {
LABEL_45:
      uint64_t v50 = 0;
      uint64_t v49 = 0;
    }
    if (self->_hasStartedScrolling || (float v51 = (v70 - y) * (v70 - y) + v71 * v71, sqrtf(v51) >= 3.0))
    {
      if (currentDragType == 2) {
        BOOL v53 = self->_latestTouchPoint.y <= self->_firstTouchPoint.y;
      }
      else {
        BOOL v53 = !currentDragType && self->_latestTouchPoint.y >= self->_firstTouchPoint.y;
      }
      id v54 = objc_loadWeakRetained((id *)&self->_delegate);
      int v55 = objc_msgSend(v54, "eventGestureController:isAllDayAtPoint:requireInsistence:", self, -[EKDayOccurrenceView isAllDay](self->_draggingView, "isAllDay") ^ 1, self->_latestTouchPoint.x, self->_latestTouchPoint.y);

      BOOL v52 = !v53;
      if (!v53 && v55) {
        BOOL v52 = self->_currentDragType != 1;
      }
    }
    else
    {
      BOOL v52 = 0;
    }
    if (((v49 | v50) & 1) != 0 || v52)
    {
      double v56 = self->_latestTouchPoint.y;
      if (self->_currentDragType == 1 && self->_previousTouchPoint.y > v56)
      {
        id v57 = objc_loadWeakRetained((id *)&self->_delegate);
        double v58 = [v57 touchTrackingViewForEventGestureController:self];

        double v59 = [(EKDayOccurrenceView *)self->_draggingView superview];
        [(EKDayOccurrenceView *)self->_draggingView frame];
        objc_msgSend(v59, "convertRect:toView:", v58);
        double v56 = v60;

        id v61 = objc_loadWeakRetained((id *)&self->_delegate);
        [v61 timedRegionOriginForEventGestureController:self];
        double v63 = v62;

        if (v56 < v63)
        {
          CGFloat firstContactOfDraggingViewTop = self->_firstContactOfDraggingViewTop;
          if (firstContactOfDraggingViewTop < 0.0)
          {
            CGFloat firstContactOfDraggingViewTop = v63;
            if (self->_previousTouchPoint.y - self->_touchOffset.y >= 0.0) {
              CGFloat firstContactOfDraggingViewTop = self->_latestTouchPoint.y;
            }
            self->_CGFloat firstContactOfDraggingViewTop = firstContactOfDraggingViewTop;
          }
          double v56 = v63 + self->_latestTouchPoint.y - firstContactOfDraggingViewTop;
        }
        double v65 = self->_latestTouchPoint.x;
      }
      else
      {
        double v65 = self->_latestTouchPoint.x;
      }
      id v66 = objc_loadWeakRetained((id *)&self->_delegate);
      int v67 = objc_msgSend(v66, "didScrollWhenEventGestureController:scrollTimerFiredToMoveLeft:right:vertically:towardPoint:", self, v49, v50, v52, v65, v56);

      if (v67)
      {
        self->_hasStartedScrolling = 1;
        [(EKEventGestureController *)self _update];
      }
    }
  }
}

- (BOOL)_setDraggingState:(int)a3 withPoint:(CGPoint)a4 event:(id)a5
{
  return -[EKEventGestureController _setDraggingState:withPoint:event:context:](self, "_setDraggingState:withPoint:event:context:", *(void *)&a3, a5, 0, a4.x, a4.y);
}

- (BOOL)_setDraggingState:(int)a3 withPoint:(CGPoint)a4 event:(id)a5 context:(id)a6
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v9 = *(void *)&a3;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  id v12 = a6;
  int currentDraggingState = self->_currentDraggingState;
  if (currentDraggingState == v9)
  {
    BOOL v14 = 1;
    goto LABEL_44;
  }
  if (self->_pendingDraggingState != -1)
  {
    BOOL v14 = 0;
    self->_uint64_t queuedDraggingState = v9;
    goto LABEL_44;
  }
  self->_pendingDraggingState = v9;
  switch((int)v9)
  {
    case 0:
      if (self->_forcedStart)
      {
        [(EKEventGestureController *)self _cleanUpForcedStart];
        int currentDraggingState = self->_currentDraggingState;
      }
      if (currentDraggingState == 1 || currentDraggingState == 2)
      {
        -[EKEventGestureController _cleanUpAllStateWithTouchPoint:commit:](self, "_cleanUpAllStateWithTouchPoint:commit:", 0, x, y);
        goto LABEL_38;
      }
      -[EKEventGestureController _cleanUpAllStateWithTouchPoint:commit:](self, "_cleanUpAllStateWithTouchPoint:commit:", 0, x, y);
      [(EKEventGestureController *)self _manageDraggingViewInteractivityForStateChangeFrom:self->_currentDraggingState to:0];
      double v30 = (void *)kEKUILogHandle;
      BOOL v14 = 0;
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
      {
        uint64_t v31 = self->_currentDraggingState;
        double v32 = v30;
        CGFloat v33 = [(EKEventGestureController *)self _debugStringForDraggingState:v31];
        id v34 = [(EKEventGestureController *)self _debugStringForDraggingState:0];
        int v39 = 138412546;
        double v40 = v33;
        __int16 v41 = 2112;
        BOOL v42 = v34;
        _os_log_impl(&dword_1B3F4C000, v32, OS_LOG_TYPE_ERROR, "Invalid dragging state transition requested, but executed anyway: [%@] -> [%@]", (uint8_t *)&v39, 0x16u);

        BOOL v14 = 0;
      }
      goto LABEL_41;
    case 1:
      if (currentDraggingState) {
        goto LABEL_28;
      }
      -[EKEventGestureController _setUpInitialTouchPointsWithPoint:](self, "_setUpInitialTouchPointsWithPoint:", x, y);
      id WeakRetained = objc_loadWeakRetained((id *)&self->_untimedDelegate);

      if (WeakRetained)
      {
        id v20 = objc_loadWeakRetained((id *)&self->_untimedDelegate);
        objc_msgSend(v20, "eventGestureController:setUpAtPoint:withOccurrence:forceNewEvent:", self, v11, 1, x, y);
        uint64_t v21 = (EKEvent *)objc_claimAutoreleasedReturnValue();
        event = self->_event;
        self->_event = v21;

        int v23 = [(EKEvent *)self->_event isNew];
        if (v12 && v23 && [v12 isManaged])
        {
          [(EKEventGestureController *)self _setEventCalendar:self->_event useManagedCalendar:1];
          id v24 = objc_loadWeakRetained((id *)&self->_untimedDelegate);
          [v24 eventGestureControllerRequestsUpdateOfDraggingView:self];
        }
      }
      else
      {
        id v35 = objc_loadWeakRetained((id *)&self->_delegate);

        if (v35) {
          -[EKEventGestureController _createAndSetUpDraggingViewWithTouchPoint:event:ignoreOffsets:showEditMenu:](self, "_createAndSetUpDraggingViewWithTouchPoint:event:ignoreOffsets:showEditMenu:", v11, 1, 0, x, y);
        }
      }
      goto LABEL_38;
    case 2:
      switch(currentDraggingState)
      {
        case 0:
          -[EKEventGestureController _beginEditingSessionAtPoint:withEvent:](self, "_beginEditingSessionAtPoint:withEvent:", v11, x, y);
          if (!self->_draggingView)
          {
            id v15 = objc_loadWeakRetained((id *)&self->_untimedDelegate);

            if (v15)
            {
              id v16 = objc_loadWeakRetained((id *)&self->_untimedDelegate);
              objc_msgSend(v16, "eventGestureController:setUpAtPoint:withOccurrence:forceNewEvent:", self, v11, 0, x, y);
              id v17 = (EKEvent *)objc_claimAutoreleasedReturnValue();
              double v18 = self->_event;
              self->_event = v17;
            }
            else
            {
              id v38 = objc_loadWeakRetained((id *)&self->_delegate);

              if (v38) {
                -[EKEventGestureController _createAndSetUpDraggingViewWithTouchPoint:event:ignoreOffsets:showEditMenu:](self, "_createAndSetUpDraggingViewWithTouchPoint:event:ignoreOffsets:showEditMenu:", v11, 1, 1, x, y);
              }
            }
          }
          break;
        case 1:
          -[EKEventGestureController _beginEditingSessionAtPoint:withEvent:](self, "_beginEditingSessionAtPoint:withEvent:", v11, x, y);
          break;
        case 3:
          break;
        case 4:
          -[EKEventGestureController _returnDraggingViewToLastCommittedPositionFromTouchPoint:](self, "_returnDraggingViewToLastCommittedPositionFromTouchPoint:", x, y);
          goto LABEL_38;
        default:
          goto LABEL_28;
      }
      -[EKEventGestureController _writeDraggingChangesToOccurrenceWithTouchPoint:](self, "_writeDraggingChangesToOccurrenceWithTouchPoint:", x, y);
      goto LABEL_38;
    case 3:
      if (!currentDraggingState || currentDraggingState == 2)
      {
        self->_waitingForDragToInitialize = 1;
        if (-[EKEventGestureController _beginNewDragFromOffStateWithPoint:](self, "_beginNewDragFromOffStateWithPoint:", x, y))
        {
          goto LABEL_38;
        }
LABEL_28:
        double v25 = (void *)kEKUILogHandle;
        if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
        {
          uint64_t v26 = self->_currentDraggingState;
          CGFloat v27 = v25;
          double v28 = [(EKEventGestureController *)self _debugStringForDraggingState:v26];
          CGFloat v29 = [(EKEventGestureController *)self _debugStringForDraggingState:v9];
          int v39 = 138412546;
          double v40 = v28;
          __int16 v41 = 2112;
          BOOL v42 = v29;
          _os_log_impl(&dword_1B3F4C000, v27, OS_LOG_TYPE_ERROR, "Dragging state transition requested, but refused: [%@] -> [%@]", (uint8_t *)&v39, 0x16u);
        }
        BOOL v14 = 0;
        goto LABEL_42;
      }
      if (currentDraggingState != 4) {
        goto LABEL_28;
      }
      [(EKEventGestureController *)self _resumePreviousDrag];
LABEL_38:
      if (!self->_dragInteractionCancellingWithoutDragging) {
        [(EKEventGestureController *)self _manageFeedbackForStateChangeFrom:self->_currentDraggingState to:v9];
      }
      [(EKEventGestureController *)self _manageDraggingViewInteractivityForStateChangeFrom:self->_currentDraggingState to:v9];
      BOOL v14 = 1;
LABEL_41:
      self->_int currentDraggingState = v9;
LABEL_42:
      self->_pendingDraggingState = -1;
      uint64_t queuedDraggingState = self->_queuedDraggingState;
      if (queuedDraggingState != -1)
      {
        self->_uint64_t queuedDraggingState = -1;
        BOOL v14 = -[EKEventGestureController _setDraggingState:withPoint:event:](self, "_setDraggingState:withPoint:event:", queuedDraggingState, v11, x, y);
      }
LABEL_44:

      return v14;
    case 4:
      if (currentDraggingState != 3) {
        goto LABEL_28;
      }
      [(EKEventGestureController *)self _suspendCurrentDrag];
      goto LABEL_38;
    default:
      goto LABEL_28;
  }
}

- (int)_draggingState
{
  return self->_currentDraggingState;
}

- (id)_debugStringForDraggingState:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Dragging state UNKNOWN (%d)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E608B410[a3];
  }

  return v3;
}

- (void)_manageFeedbackForStateChangeFrom:(int)a3 to:(int)a4
{
  if ((a3 & 0xFFFFFFFD) != 0 || a4 != 3)
  {
    if ((a3 & 0xFFFFFFFD) == 1 && a4 == 2)
    {
      [(_UIDragSnappingFeedbackGenerator *)self->_dragSnappingFeedback draggedObjectLanded];
      [(_UIDragSnappingFeedbackGenerator *)self->_dragSnappingFeedback userInteractionEnded];
      dragSnappingFeedback = self->_dragSnappingFeedback;
      self->_dragSnappingFeedback = 0;
    }
  }
  else
  {
    id v5 = self->_dragSnappingFeedback;
    if (v5)
    {
      [(_UIDragSnappingFeedbackGenerator *)v5 userInteractionEnded];
      id v6 = self->_dragSnappingFeedback;
      self->_dragSnappingFeedback = 0;
    }
    char v7 = (_UIDragSnappingFeedbackGenerator *)[objc_alloc(MEMORY[0x1E4FB20C0]) initWithView:self->_draggingView];
    id v8 = self->_dragSnappingFeedback;
    self->_dragSnappingFeedback = v7;

    [(_UIDragSnappingFeedbackGenerator *)self->_dragSnappingFeedback userInteractionStarted];
    uint64_t v9 = self->_dragSnappingFeedback;
    [(_UIDragSnappingFeedbackGenerator *)v9 draggedObjectLifted];
  }
}

- (void)didCrossDragBoundary:(int)a3
{
  if (a3 == 2) {
    [(_UIDragSnappingFeedbackGenerator *)self->_dragSnappingFeedback dropTargetUpdated];
  }
}

- (void)_manageDraggingViewInteractivityForStateChangeFrom:(int)a3 to:(int)a4
{
}

- (BOOL)_beginNewDragFromOffStateWithPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  -[EKEventGestureController _setUpInitialTouchPointsWithPoint:](self, "_setUpInitialTouchPointsWithPoint:");
  if (!self->_forcedStart)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_untimedDelegate);

    if (WeakRetained)
    {
      BOOL v6 = 1;
      self->_int currentDragType = 1;
      id v8 = objc_loadWeakRetained((id *)&self->_untimedDelegate);
      objc_msgSend(v8, "eventGestureController:setUpAtPoint:withOccurrence:forceNewEvent:", self, 0, 0, self->_latestTouchPoint.x, self->_latestTouchPoint.y);
      uint64_t v9 = (EKEvent *)objc_claimAutoreleasedReturnValue();
      event = self->_event;
      self->_event = v9;
    }
    else
    {
      id v11 = objc_loadWeakRetained((id *)&self->_delegate);

      if (!v11) {
        goto LABEL_3;
      }
      id v8 = -[EKEventGestureController _createNewEventIfNeededAtPoint:](self, "_createNewEventIfNeededAtPoint:", x, y);
      -[EKEventGestureController _createAndSetUpDraggingViewWithTouchPoint:event:ignoreOffsets:showEditMenu:](self, "_createAndSetUpDraggingViewWithTouchPoint:event:ignoreOffsets:showEditMenu:", v8, 0, 1, x, y);
      BOOL v6 = -[EKEventGestureController _beginEditingSessionAtPoint:withEvent:](self, "_beginEditingSessionAtPoint:withEvent:", v8, x, y);
    }

    goto LABEL_9;
  }
  -[EKEventGestureController _setUpAfterForcedStartFromPoint:](self, "_setUpAfterForcedStartFromPoint:", self->_latestTouchPoint.x, self->_latestTouchPoint.y);
LABEL_3:
  BOOL v6 = 1;
LABEL_9:
  [(EKEventGestureController *)self _updateFlingToCancelParameters];
  return v6;
}

- (void)_setUpInitialTouchPointsWithPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  self->_firstTouchTime = CFAbsoluteTimeGetCurrent();
  self->_latestTouchPoint.CGFloat x = x;
  self->_latestTouchPoint.CGFloat y = y;
  CGPoint latestTouchPoint = self->_latestTouchPoint;
  self->_previousTouchPoint = latestTouchPoint;
  self->_firstTouchPoint = latestTouchPoint;
  self->_dragLockDisabled = ![(EKEventGestureController *)self usesHorizontalDragLocking];
  self->_isDragging = 1;

  [(EKEventGestureController *)self _updateSnappingTypeForCurrentDrag];
}

- (void)_cleanUpAllStateWithTouchPoint:(CGPoint)a3 commit:(BOOL)a4
{
  BOOL v4 = a4;
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(EKEventGestureController *)self _removeScrollTimer];
  self->_isDragging = 0;
  self->_latestTouchPoint.CGFloat x = x;
  self->_latestTouchPoint.CGFloat y = y;
  self->_needToSetSystemDragPreview = 0;
  self->_snappingTypeForCurrentDrag = 0;
  event = self->_event;
  self->_event = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_untimedDelegate);
  if (!v4)
  {
    if (WeakRetained)
    {
      id v10 = objc_loadWeakRetained((id *)&self->_untimedDelegate);
      [v10 eventGestureControllerCancelled:self];
    }
    else
    {
      id v12 = objc_loadWeakRetained((id *)&self->_delegate);

      if (!v12) {
        goto LABEL_12;
      }
      id v13 = objc_loadWeakRetained((id *)&self->_delegate);
      char v14 = objc_opt_respondsToSelector();

      if ((v14 & 1) == 0) {
        goto LABEL_12;
      }
      id v10 = objc_loadWeakRetained((id *)&self->_delegate);
      [v10 eventGestureControllerDidEndDragSession:self];
    }

    goto LABEL_12;
  }
  if (WeakRetained)
  {
    [(EKEventGestureController *)self _commitUntimed];
  }
  else
  {
    id v11 = objc_loadWeakRetained((id *)&self->_delegate);

    if (v11) {
      [(EKEventGestureController *)self _commit];
    }
  }
LABEL_12:

  [(EKEventGestureController *)self removeDraggedOccurrence];
}

- (id)_createNewEventIfNeededAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v8 = objc_msgSend(WeakRetained, "eventGestureController:occurrenceViewAtPoint:ignoreSelectedCopyView:", self, 1, x, y);
  [(EKEventGestureController *)self setDraggingViewSource:v8];

  event = self->_event;
  if (event) {
    goto LABEL_4;
  }
  id v10 = [(EKEventGestureController *)self draggingViewSource];

  if (v10)
  {
    event = self->_event;
LABEL_4:
    self->_isNewEvent = [(EKEvent *)event isNew];
    id v11 = self->_event;
    goto LABEL_5;
  }
  id v13 = objc_loadWeakRetained((id *)p_delegate);
  id v11 = (EKEvent *)[v13 createEventForEventGestureController:self];

  id v14 = objc_loadWeakRetained((id *)p_delegate);
  -[EKEvent setAllDay:](v11, "setAllDay:", objc_msgSend(v14, "eventGestureController:isAllDayAtPoint:requireInsistence:", self, 0, self->_firstTouchPoint.x, self->_firstTouchPoint.y));

  -[EKEventGestureController _adjustNewEventDates:withPoint:](self, "_adjustNewEventDates:withPoint:", v11, x, y);
  self->_isNewEvent = [(EKEvent *)v11 isNew];
LABEL_5:

  return v11;
}

- (void)_adjustNewEventDates:(id)a3 withPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  double v8 = 1.0;
  if (([v7 isAllDay] & 1) == 0)
  {
    uint64_t v9 = [MEMORY[0x1E4F57710] shared];
    [v9 defaultEventDuration];
    double v8 = v10;
  }
  -[EKEventGestureController _computeHeightForOccurrenceViewOfDuration:event:allDay:](self, "_computeHeightForOccurrenceViewOfDuration:event:allDay:", v7, [v7 isAllDay], v8);
  double v12 = y + v11 * -0.5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ([v7 isAllDay]) {
    double v14 = y;
  }
  else {
    double v14 = v12;
  }
  objc_msgSend(WeakRetained, "eventGestureController:dateAtPoint:", self, x, v14);
  double v16 = v15;

  id v18 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v16];
  [v7 setStartDate:v18];
  id v17 = [v18 dateByAddingTimeInterval:v8];
  [v7 setEndDateUnadjustedForLegacyClients:v17];
}

- (void)_createAndSetUpDraggingViewWithTouchPoint:(CGPoint)a3 event:(id)a4 ignoreOffsets:(BOOL)a5 showEditMenu:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  double y = a3.y;
  double x = a3.x;
  id v45 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v12 = objc_msgSend(WeakRetained, "eventGestureController:occurrenceViewAtPoint:ignoreSelectedCopyView:", self, 1, x, y);
  if (v45)
  {

    if (v12)
    {
      [(EKEventGestureController *)self setDraggingViewSource:v12];
    }
    else
    {
      id v13 = objc_loadWeakRetained((id *)&self->_delegate);
      double v14 = [v13 eventGestureController:self occurrenceViewForOccurrence:v45 occurrenceDate:0];
      [(EKEventGestureController *)self setDraggingViewSource:v14];
    }
  }
  else
  {
    [(EKEventGestureController *)self setDraggingViewSource:v12];

    double v12 = [(EKEventGestureController *)self draggingViewSource];
    id v45 = [v12 occurrence];
  }

  if (!self->_draggingView)
  {
    double v15 = [(EKEventGestureController *)self _createTemporaryView:v45 animated:0];
    draggingView = self->_draggingView;
    self->_draggingView = v15;

    if (v6) {
      [(EKEventGestureController *)self _updatePositionOfEditingMenuForView:self->_draggingView];
    }
  }
  -[EKEventGestureController _setTouchOffsetsFromPoint:fixedToCenter:](self, "_setTouchOffsetsFromPoint:fixedToCenter:", v7, x, y);
  id v17 = [(EKEventGestureController *)self draggingViewSource];
  id v18 = [v17 occurrence];

  if (v18)
  {
    double v19 = [(EKEventGestureController *)self draggingViewSource];
    [v19 travelTimeSubviewHeightInPoints];
    -[EKDayOccurrenceView setTravelTimeSubviewHeightInPoints:](self->_draggingView, "setTravelTimeSubviewHeightInPoints:");

    [(EKDayOccurrenceView *)self->_draggingView frame];
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    uint64_t v26 = [(EKEventGestureController *)self draggingViewSource];
    [v26 frame];
    double v28 = v27;

    if (self->_pendingDraggingState != 1)
    {
      CGFloat v29 = [(EKEventGestureController *)self draggingViewSource];
      double v30 = [v29 superview];
      uint64_t v31 = [(EKEventGestureController *)self draggingViewSource];
      [v31 frame];
      double v33 = v32;
      double v35 = v34;
      id v36 = [(EKDayOccurrenceView *)self->_draggingView superview];
      objc_msgSend(v30, "convertPoint:toView:", v36, v33, v35);
      double v23 = v37;
    }
LABEL_16:
    -[EKDayOccurrenceView setFrame:](self->_draggingView, "setFrame:", v21, v23, v25, v28);
    goto LABEL_17;
  }
  if (([v45 isAllDay] & 1) == 0)
  {
    [v45 travelTime];
    if (v38 > 0.01)
    {
      [v45 travelTime];
      -[EKEventGestureController _computeHeightForOccurrenceViewOfDuration:event:allDay:](self, "_computeHeightForOccurrenceViewOfDuration:event:allDay:", 0, 0);
      -[EKDayOccurrenceView setTravelTimeSubviewHeightInPoints:](self->_draggingView, "setTravelTimeSubviewHeightInPoints:");
    }
    [v45 duration];
    -[EKEventGestureController _computeHeightForOccurrenceViewOfDuration:event:allDay:](self, "_computeHeightForOccurrenceViewOfDuration:event:allDay:", 0, 0);
    double v40 = v39;
    [(EKDayOccurrenceView *)self->_draggingView frame];
    double v21 = v41;
    double v23 = v42;
    double v25 = v43;
    [(EKDayOccurrenceView *)self->_draggingView travelTimeSubviewHeightInPoints];
    double v28 = v40 + v44;
    goto LABEL_16;
  }
LABEL_17:
  [(EKEventGestureController *)self _animateInNewEvent];
  if (!self->_isNewEvent && (!self->_isMultiDayTimedEvent || !self->_touchOffsetDays)) {
    [(EKDayOccurrenceView *)self->_draggingView setDrawsResizeHandles:1];
  }
}

- (BOOL)_beginEditingSessionAtPoint:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if (!self->_currentDraggingState) {
    -[EKEventGestureController _setUpInitialTouchPointsWithPoint:](self, "_setUpInitialTouchPointsWithPoint:", x, y);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_untimedDelegate);

  if (WeakRetained)
  {
    if (self->_currentDraggingState != 1)
    {
      id v9 = objc_loadWeakRetained((id *)&self->_untimedDelegate);
      objc_msgSend(v9, "eventGestureController:setUpAtPoint:withOccurrence:forceNewEvent:", self, v7, 0, self->_latestTouchPoint.x, self->_latestTouchPoint.y);
      double v10 = (EKEvent *)objc_claimAutoreleasedReturnValue();
      event = self->_event;
      self->_event = v10;
    }
    BOOL v12 = 1;
  }
  else
  {
    id v13 = objc_loadWeakRetained((id *)&self->_delegate);

    if (v13) {
      BOOL v12 = -[EKEventGestureController __timedDelegateBeginEditingSessionAtPoint:withEvent:](self, "__timedDelegateBeginEditingSessionAtPoint:withEvent:", v7, self->_latestTouchPoint.x, self->_latestTouchPoint.y);
    }
    else {
      BOOL v12 = 0;
    }
  }

  return v12;
}

- (BOOL)canProposeNewTime:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 allowsProposedTimeModifications])
  {
    if ([v3 serverSupportedProposeNewTime])
    {
      BOOL v4 = 1;
    }
    else
    {
      id v5 = [v3 organizer];
      v8[0] = v5;
      BOOL v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
      BOOL v4 = +[EKUIEmailCompositionManager canShowViewControllerForEvent:v3 withParticipantRecipients:v6];
    }
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)__timedDelegateBeginEditingSessionAtPoint:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  self->_int currentDragType = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v9 = objc_msgSend(WeakRetained, "eventGestureController:occurrenceViewAtPoint:ignoreSelectedCopyView:", self, 1, x, y);
  if (v7)
  {

    if (v9)
    {
      [(EKEventGestureController *)self setDraggingViewSource:v9];
    }
    else
    {
      id v10 = objc_loadWeakRetained((id *)&self->_delegate);
      double v11 = [v10 eventGestureController:self occurrenceViewForOccurrence:v7 occurrenceDate:0];
      [(EKEventGestureController *)self setDraggingViewSource:v11];
    }
  }
  else
  {
    [(EKEventGestureController *)self setDraggingViewSource:v9];

    id v9 = WeakRetained;
  }

  BOOL v12 = [(EKEventGestureController *)self draggingViewSource];
  id v13 = [v12 occurrence];

  if (!v13) {
    goto LABEL_11;
  }
  BOOL v14 = [(EKEventGestureController *)self canProposeNewTime:v13];
  int v15 = [v13 isEditable] | v14;
  if (![v13 isReminderIntegrationEvent])
  {
    if ((v15 & 1) == 0) {
      goto LABEL_9;
    }
LABEL_11:
    if (v7) {
      goto LABEL_12;
    }
    id v7 = [(EKEventGestureController *)self draggingViewSource];

    if (!v7) {
      goto LABEL_16;
    }
    double v19 = [(EKEventGestureController *)self draggingViewSource];
    id v7 = [v19 occurrence];

    if (v7)
    {
LABEL_12:
      if (![v7 isNew])
      {
LABEL_31:
        [(EKEventGestureController *)self setEvent:v7];
        id v33 = objc_loadWeakRetained((id *)&self->_delegate);
        double v34 = [v7 startDate];
        [v34 timeIntervalSinceReferenceDate];
        objc_msgSend(v33, "eventGestureController:didSetUpAtDate:isAllDay:", self, -[EKDayOccurrenceView isAllDay](self->_draggingView, "isAllDay"), v35);

        BOOL v17 = 1;
        goto LABEL_32;
      }
      int v18 = 0;
    }
    else
    {
LABEL_16:
      int v18 = 1;
    }
    double v20 = [(EKEventGestureController *)self draggingViewSource];
    if (v20)
    {
      double v21 = [(EKEventGestureController *)self draggingViewSource];
      double v22 = [v21 occurrence];
      self->_isNewEvent = v22 == 0;
    }
    else
    {
      self->_isNewEvent = 1;
    }

    if (v18)
    {
      double v23 = [(EKEventGestureController *)self draggingViewSource];
      BOOL v24 = v23 == 0;
    }
    else
    {
      BOOL v24 = 0;
    }
    double v25 = [(EKEventGestureController *)self draggingViewSource];

    if (v24)
    {
      id v26 = objc_loadWeakRetained((id *)&self->_delegate);
      double v27 = (void *)[v26 createEventForEventGestureController:self];

      id v28 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v27, "setAllDay:", objc_msgSend(v28, "eventGestureController:isAllDayAtPoint:requireInsistence:", self, 0, self->_firstTouchPoint.x, self->_firstTouchPoint.y));

      id v7 = v27;
    }
    if (!v25)
    {
      -[EKEventGestureController _adjustNewEventDates:withPoint:](self, "_adjustNewEventDates:withPoint:", v7, x, y);
      if (self->_currentDraggingState != 1)
      {
        currentDadouble y = self->_currentDay;
        double v30 = [v7 startCalendarDate];
        uint64_t v31 = [(EKCalendarDate *)currentDay differenceInDays:v30];

        if ([(EKEventGestureController *)self splitMultiDays])
        {
          self->_int64_t touchOffsetDays = 0;
          p_commitOffsetDays = &self->_commitOffsetDays;
        }
        else
        {
          p_commitOffsetDays = &self->_touchOffsetDays;
        }
        int64_t *p_commitOffsetDays = v31;
      }
    }
    goto LABEL_31;
  }
  if (objc_msgSend(v13, "CUIK_reminderShouldBeEditable") & v15) {
    goto LABEL_11;
  }
LABEL_9:
  double v16 = [(EKEventGestureController *)self draggingViewSource];
  CalPlopViewWithScaleFactorAndCompletion(v16, 0, 1.0);

  [(UILongPressGestureRecognizer *)self->_draggingGestureRecognizer setState:4];
  -[EKEventGestureController _cleanUpAllStateWithTouchPoint:commit:](self, "_cleanUpAllStateWithTouchPoint:commit:", 0, x, y);
  BOOL v17 = 0;
LABEL_32:

  return v17;
}

- (void)_writeDraggingChangesToOccurrenceWithTouchPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(EKEventGestureController *)self _removeScrollTimer];
  self->_isDragging = 0;
  self->_latestTouchPoint.CGFloat x = x;
  self->_latestTouchPoint.CGFloat y = y;
  self->_needToSetSystemDragPreview = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_untimedDelegate);

  if (WeakRetained)
  {
    [(EKEventGestureController *)self _commitUntimed];
  }
  else
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);

    if (v7)
    {
      [(EKEventGestureController *)self _commit];
    }
  }
}

- (void)_returnDraggingViewToLastCommittedPositionFromTouchPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(EKEventGestureController *)self _removeScrollTimer];
  self->_isDragging = 0;
  self->_latestTouchPoint.CGFloat x = x;
  self->_latestTouchPoint.CGFloat y = y;
  self->_needToSetSystemDragPreview = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_untimedDelegate);

  if (WeakRetained)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_untimedDelegate);
    [v8 eventGestureControllerCancelled:self];
  }
  else
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);

    if (v7)
    {
      [(EKEventGestureController *)self _cancel];
    }
  }
}

- (void)_dragFailedToStart
{
  double x = self->_latestTouchPoint.x;
  double y = self->_latestTouchPoint.y;
  if (self->_currentDraggingState) {
    -[EKEventGestureController _setDraggingState:withPoint:event:](self, "_setDraggingState:withPoint:event:", 0, 0, x, y);
  }
  else {
    -[EKEventGestureController _cleanUpAllStateWithTouchPoint:commit:](self, "_cleanUpAllStateWithTouchPoint:commit:", 0, x, y);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_untimedDelegate);

  if (WeakRetained)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_untimedDelegate);
    [v8 eventGestureControllerDragFailed:self];
  }
  else
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    char v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) == 0) {
      return;
    }
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    [v8 cleanUpAfterGestureFailureForEventGestureController:self];
  }
}

- (id)_viewForTracking
{
  p_untimedDelegate = &self->_untimedDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_untimedDelegate);

  if (WeakRetained
    || (p_untimedDelegate = &self->_delegate, id v5 = objc_loadWeakRetained((id *)&self->_delegate), v5, v5))
  {
    id v6 = objc_loadWeakRetained((id *)p_untimedDelegate);
    char v7 = [v6 touchTrackingViewForEventGestureController:self];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)_updateFlingToCancelParameters
{
  double Current = CFAbsoluteTimeGetCurrent();
  double v4 = sqrt((self->_latestTouchPoint.y - self->_previousTouchPoint.y)* (self->_latestTouchPoint.y - self->_previousTouchPoint.y)+ (self->_latestTouchPoint.x - self->_previousTouchPoint.x)* (self->_latestTouchPoint.x - self->_previousTouchPoint.x))/ (Current - self->_previousTouchTime);
  self->_previousTouchTime = Current;
  self->_previousTouchVelocitdouble y = v4;
}

- (void)_setEventCalendar:(id)a3 useManagedCalendar:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = v6;
  if (v4)
  {
    id v8 = [v6 eventStore];
    id v9 = [v8 defaultCalendarForNewEvents];
    int v10 = [v9 isManaged];

    if (v10)
    {
      double v11 = [v8 defaultCalendarForNewEvents];
      if (!v11) {
        goto LABEL_16;
      }
    }
    else
    {
      BOOL v12 = [MEMORY[0x1E4F1CA48] array];
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v13 = objc_msgSend(v8, "calendarsForEntityType:", 0, 0);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v20 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v19 + 1) + 8 * i);
            if ([(EKEventGestureController *)self _calendarCanAcceptManagedData:v18]) {
              [v12 addObject:v18];
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v15);
      }

      double v11 = [(EKEventGestureController *)self _findFirstCalendar:v12];

      if (!v11) {
        goto LABEL_16;
      }
    }
    [v7 setCalendar:v11];
LABEL_16:
  }
}

- (id)_findFirstCalendar:(id)a3
{
  id v3 = [a3 sortedArrayUsingFunction:MEMORY[0x1E4F57A78] context:0];
  BOOL v4 = [v3 firstObject];

  return v4;
}

- (BOOL)_calendarCanAcceptManagedData:(id)a3
{
  id v3 = a3;
  if ([v3 isManaged] && objc_msgSend(v3, "allowsContentModifications")) {
    int v4 = [v3 isSubscribed] ^ 1;
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (id)_acceptedTypes
{
  id v3 = [MEMORY[0x1E4F1CA48] arrayWithObject:@"com.apple.eventkit.internal"];
  int v4 = [(EKEventGestureController *)self _acceptedExternalTypes];
  [v3 addObjectsFromArray:v4];

  return v3;
}

- (id)_acceptedExternalTypes
{
  id v3 = [(EKEventGestureController *)self _acceptedNonFileExternalTypes];
  int v4 = [(EKEventGestureController *)self _acceptedFileExternalTypes];
  id v5 = [v3 arrayByAddingObjectsFromArray:v4];

  return v5;
}

- (id)_acceptedNonFileExternalTypes
{
  return +[EventImportData acceptedTypeIdentifiers];
}

- (id)_acceptedFileExternalTypes
{
  v6[2] = *MEMORY[0x1E4F143B8];
  id v2 = [(id)*MEMORY[0x1E4F44378] identifier];
  v6[0] = v2;
  id v3 = [(id)*MEMORY[0x1E4F44468] identifier];
  v6[1] = v3;
  int v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

- (id)_getEventUsingDropSession:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = objc_msgSend(v4, "items", 0);
  id v6 = (void *)[v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        int v10 = [v9 localObject];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          id v6 = [v9 localObject];
          goto LABEL_11;
        }
      }
      id v6 = (void *)[v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  BOOL v12 = [(EKEventGestureController *)self _acceptedExternalTypes];
  int v13 = [v4 hasItemsConformingToTypeIdentifiers:v12];

  if (!v6 && v13)
  {
    uint64_t v14 = [(EKEventGestureController *)self delegate];

    if (v14)
    {
      uint64_t v15 = [(EKEventGestureController *)self _viewForTracking];
      [v4 locationInView:v15];
      double v17 = v16;
      double v19 = v18;

      long long v20 = [(EKEventGestureController *)self delegate];
      id v6 = (void *)[v20 createEventForEventGestureController:self];

      -[EKEventGestureController _adjustNewEventDates:withPoint:](self, "_adjustNewEventDates:withPoint:", v6, v17, v19);
      if (+[EventImportData isSessionManaged:v4]) {
        [(EKEventGestureController *)self _setEventCalendar:v6 useManagedCalendar:1];
      }
    }
    else
    {
      id v6 = 0;
    }
    self->_isNewEvent = 1;
  }

  return v6;
}

- (unint64_t)_dropOperationGivenDropSession:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = objc_msgSend(v4, "items", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = [*(id *)(*((void *)&v16 + 1) + 8 * v9) localObject];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {

          unint64_t v14 = 3;
          goto LABEL_13;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  BOOL v12 = [(EKEventGestureController *)self _acceptedExternalTypes];
  int v13 = [v4 hasItemsConformingToTypeIdentifiers:v12];

  if (v13) {
    unint64_t v14 = 2;
  }
  else {
    unint64_t v14 = 0;
  }
LABEL_13:

  return v14;
}

- (BOOL)_dropSessionRequiresExternalDataExtraction:(id)a3
{
  return [(EKEventGestureController *)self _dropOperationGivenDropSession:a3] == 2;
}

- (void)_setupEvent:(id)a3 withImportData:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 title];
  [v12 setTitle:v7];

  uint64_t v8 = [v6 URL];
  [v12 setURL:v8];

  uint64_t v9 = [v6 notes];
  [v12 setNotes:v9];

  -[EKEventGestureController _setEventCalendar:useManagedCalendar:](self, "_setEventCalendar:useManagedCalendar:", v12, [v6 prefersManagedCalendar]);
  int v10 = [v6 structuredLocation];

  if (v10)
  {
    double v11 = [v6 structuredLocation];
    [v12 setStructuredLocation:v11];
  }
}

- (void)_handleShowingEventWithUniqueId:(id)a3 date:(id)a4 eventStore:(id)a5
{
  id v13 = [a5 eventWithUniqueId:a3 occurrenceDate:a4];
  if (v13)
  {
    p_untimedDelegate = &self->_untimedDelegate;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_untimedDelegate);

    if (WeakRetained
      || (p_untimedDelegate = &self->_delegate, (id v9 = objc_loadWeakRetained((id *)&self->_delegate)) != 0)
      && (int v10 = v9,
          id v11 = objc_loadWeakRetained((id *)&self->_delegate),
          char v12 = objc_opt_respondsToSelector(),
          v11,
          v10,
          (v12 & 1) != 0))
    {
      id v8 = objc_loadWeakRetained((id *)p_untimedDelegate);
      [v8 eventGestureController:self requestsShowEvent:v13];
    }
  }
}

- (void)_handleImportingICSData:(id)a3 intoEventStore:(id)a4
{
  id v9 = a4;
  id v6 = a3;
  uint64_t v7 = [[EKICSPreviewController alloc] initWithData:v6 eventStore:v9];

  [(EKICSPreviewController *)v7 setAllowsImport:1];
  [(EKICSPreviewController *)v7 setPreviewDelegate:self];
  [(EKICSPreviewController *)v7 setCancelButtonWithTarget:self action:sel__icsPreviewControllerCancelButtonPressed];
  id v8 = [(EKICSPreviewController *)v7 singleExistingEventUniqueID];
  if (v8)
  {
    [(EKEventGestureController *)self _handleShowingEventWithUniqueId:v8 date:0 eventStore:v9];
  }
  else
  {
    objc_storeStrong((id *)&self->_currentICSPreviewController, v7);
    [(EKEventGestureController *)self _presentICSPreviewControllerIfNeeded];
  }
}

- (void)_presentICSPreviewControllerIfNeeded
{
  currentICSPreviewController = self->_currentICSPreviewController;
  if (currentICSPreviewController)
  {
    id v4 = [(EKICSPreviewController *)currentICSPreviewController viewController];
    id v5 = [v4 view];
    id v6 = [v5 superview];

    if (!v6)
    {
      p_untimedDelegate = &self->_untimedDelegate;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_untimedDelegate);

      if (WeakRetained
        || (p_untimedDelegate = &self->_delegate,
            id v9 = objc_loadWeakRetained((id *)&self->_delegate),
            v9,
            v9))
      {
        id v11 = objc_loadWeakRetained((id *)p_untimedDelegate);
        int v10 = [(EKICSPreviewController *)self->_currentICSPreviewController viewController];
        [v11 eventGestureController:self requestsPresentationOfViewController:v10];
      }
    }
  }
}

- (void)icsPreviewControllerWantsDismissal:(id)a3
{
  if (self->_currentICSPreviewController == a3) {
    [(EKEventGestureController *)self _dismissCurrentICSPreviewControllerAnimated:1];
  }
}

- (void)icsPreviewControllerImportDidFail:(id)a3
{
  if (self->_currentICSPreviewController == a3) {
    [(EKEventGestureController *)self _dismissCurrentICSPreviewControllerAnimated:1];
  }
}

- (void)icsPreviewControllerImportDidImportEvents:(id)a3
{
  if (self->_currentICSPreviewController == a3) {
    [(EKEventGestureController *)self _dismissCurrentICSPreviewControllerAnimated:1];
  }
}

- (void)_icsPreviewControllerCancelButtonPressed
{
}

- (void)_dismissCurrentICSPreviewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(EKICSPreviewController *)self->_currentICSPreviewController viewController];
  id v6 = [v5 presentingViewController];
  [v6 dismissViewControllerAnimated:v3 completion:0];

  currentICSPreviewController = self->_currentICSPreviewController;
  self->_currentICSPreviewController = 0;
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

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  id v5 = a4;
  id v6 = [(EKEventGestureController *)self _acceptedTypes];
  char v7 = [v5 hasItemsConformingToTypeIdentifiers:v6];

  return v7;
}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  self->_waitingForDragToInitialize = 0;
  int currentDraggingState = self->_currentDraggingState;
  if (currentDraggingState == 4)
  {
    long long v16 = [(EKEventGestureController *)self _viewForTracking];
    [v7 locationInView:v16];
    -[EKEventGestureController _setDraggingState:withPoint:event:](self, "_setDraggingState:withPoint:event:", 3, self->_event);
    [(EKEventGestureController *)self _updateFlingToCancelParameters];

    goto LABEL_12;
  }
  if (currentDraggingState) {
    goto LABEL_12;
  }
  if (([(EKEventGestureController *)self _dropOperationGivenDropSession:v7] & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    long long v17 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl(&dword_1B3F4C000, v17, OS_LOG_TYPE_ERROR, "Received view:draggingEntered:, but no event data available to be extracted. Not starting drag.", v21, 2u);
    }
    goto LABEL_12;
  }
  id v9 = [(EKEventGestureController *)self _getEventUsingDropSession:v7];
  int v10 = [(EKEventGestureController *)self _viewForTracking];
  [v7 locationInView:v10];
  double v12 = v11;
  double v14 = v13;
  objc_storeStrong((id *)&self->_event, v9);
  if (+[EventImportData isSessionManaged:v7])
  {
    uint64_t v15 = objc_alloc_init(DraggingContext);
    [(DraggingContext *)v15 setIsManaged:1];
  }
  else
  {
    uint64_t v15 = 0;
  }
  -[EKEventGestureController _setDraggingState:withPoint:event:context:](self, "_setDraggingState:withPoint:event:context:", 1, v9, v15, v12, v14);
  [(EKEventGestureController *)self _updateFlingToCancelParameters];
  BOOL v18 = [(EKEventGestureController *)self _dropSessionRequiresExternalDataExtraction:v7];

  if (!v18)
  {
LABEL_12:
    [(EKEventGestureController *)self _disableSystemPreviewForDrag:v7];
    long long v19 = self;
    uint64_t v20 = 0;
    goto LABEL_13;
  }
  long long v19 = self;
  uint64_t v20 = 1;
LABEL_13:
  [(EKEventGestureController *)v19 _setLocalDraggingViewHidden:v20];
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ((self->_currentDraggingState | 2) == 3)
  {
    id v8 = [(EKEventGestureController *)self _viewForTracking];
    [v7 locationInView:v8];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    [(EKEventGestureController *)self _installScrollTimer];
    self->_previousTouchPoint = self->_latestTouchPoint;
    self->_latestTouchPoint.double x = v10;
    self->_latestTouchPoint.double y = v12;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_untimedDelegate);

    if (WeakRetained)
    {
      id v14 = objc_loadWeakRetained((id *)&self->_untimedDelegate);
      objc_msgSend(v14, "eventGestureController:updateToPoint:", self, self->_latestTouchPoint.x, self->_latestTouchPoint.y);
    }
    else
    {
      id v20 = objc_loadWeakRetained((id *)&self->_delegate);

      if (v20) {
        [(EKEventGestureController *)self _update];
      }
    }
    [(EKEventGestureController *)self _updateFlingToCancelParameters];
    if (self->_isNewEvent)
    {
      unint64_t v19 = [(EKEventGestureController *)self _dropOperationGivenDropSession:v7];

      if (v19 != 3) {
        goto LABEL_16;
      }
    }
    else
    {
    }
    if ([v7 allowsMoveOperation]) {
      unint64_t v19 = 3;
    }
    else {
      unint64_t v19 = 2;
    }
  }
  else
  {
    uint64_t v15 = (void *)kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      uint64_t currentDraggingState = self->_currentDraggingState;
      long long v17 = v15;
      BOOL v18 = [(EKEventGestureController *)self _debugStringForDraggingState:currentDraggingState];
      int v23 = 138412290;
      long long v24 = v18;
      _os_log_impl(&dword_1B3F4C000, v17, OS_LOG_TYPE_ERROR, "Received unexpected call to view:draggingUpdated: while in state: %@", (uint8_t *)&v23, 0xCu);
    }
    unint64_t v19 = 1;
  }
LABEL_16:
  if (self->_currentDraggingState == 3) {
    [(EKEventGestureController *)self _setToSystemDraggingImageForDrag:v7];
  }
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4FB1740]) initWithDropOperation:v19];
  [v21 setPrefersFullSizePreview:1];
  [v21 setPrecise:0];

  return v21;
}

- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4
{
  id v6 = a4;
  id v5 = [(EKEventGestureController *)self _viewForTracking];
  [v6 locationInView:v5];
  -[EKEventGestureController _setDraggingState:withPoint:event:](self, "_setDraggingState:withPoint:event:", 4 * (self->_currentDraggingState != 1), 0);
  [(EKEventGestureController *)self _updateFlingToCancelParameters];
  [(EKEventGestureController *)self _enableSystemPreviewForDrag:v6];
  [(EKEventGestureController *)self _setLocalDraggingViewHidden:1];
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  id v5 = a4;
  id v6 = [(EKEventGestureController *)self _viewForTracking];
  [v5 locationInView:v6];
  self->_latestTouchPoint.double x = v7;
  self->_latestTouchPoint.double y = v8;
  if (self->_currentDraggingState != 1)
  {
LABEL_9:
    -[EKEventGestureController _setDraggingState:withPoint:event:](self, "_setDraggingState:withPoint:event:", 2, self->_event, self->_latestTouchPoint.x, self->_latestTouchPoint.y);
    [(EKEventGestureController *)self _updateFlingToCancelParameters];
    goto LABEL_10;
  }
  BOOL v9 = [(EKEventGestureController *)self _dropSessionRequiresExternalDataExtraction:v5];
  event = self->_event;
  if (!v9)
  {
    if (!event)
    {
      uint64_t v15 = [(EKEventGestureController *)self _getEventUsingDropSession:v5];
      long long v16 = self->_event;
      self->_event = v15;
    }
    goto LABEL_9;
  }
  if (!event)
  {
    double v11 = [(EKEventGestureController *)self _getEventUsingDropSession:v5];
    CGFloat v12 = self->_event;
    self->_event = v11;
  }
  double v13 = [(EKEventGestureController *)self _acceptedNonFileExternalTypes];
  int v14 = [v5 hasItemsConformingToTypeIdentifiers:v13];

  if (v14)
  {
    self->_dragCompletionPending = 1;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __56__EKEventGestureController_dropInteraction_performDrop___block_invoke;
    v19[3] = &unk_1E608B180;
    v19[4] = self;
    +[EventImportData extractEventImportDataFromDropSession:v5 completionBlock:v19];
  }
  else
  {
    long long v17 = [(EKEventGestureController *)self _acceptedFileExternalTypes];
    int v18 = [v5 hasItemsConformingToTypeIdentifiers:v17];

    if (v18) {
      [(EKEventGestureController *)self _extractFileFromSession:v5];
    }
  }
LABEL_10:
}

void __56__EKEventGestureController_dropInteraction_performDrop___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__EKEventGestureController_dropInteraction_performDrop___block_invoke_2;
  v5[3] = &unk_1E6087D68;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __56__EKEventGestureController_dropInteraction_performDrop___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 44) = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 288))
  {
    [(id)v2 _dismissCurrentICSPreviewControllerAnimated:0];
    uint64_t v2 = *(void *)(a1 + 32);
  }
  id v13 = [*(id *)(v2 + 64) eventStore];
  id v3 = *(void **)(a1 + 40);
  if (v3)
  {
    if ([v3 requestedAction] == 2)
    {
      objc_msgSend(*(id *)(a1 + 32), "_setDraggingState:withPoint:event:", 0, *(void *)(*(void *)(a1 + 32) + 64), *(double *)(*(void *)(a1 + 32) + 112), *(double *)(*(void *)(a1 + 32) + 120));
      id v4 = [*(id *)(a1 + 40) uniqueId];

      if (v4)
      {
        id v5 = *(void **)(a1 + 32);
        id v6 = [*(id *)(a1 + 40) uniqueId];
        CGFloat v7 = [*(id *)(a1 + 40) startDate];
        [v5 _handleShowingEventWithUniqueId:v6 date:v7 eventStore:v13];
      }
    }
    else
    {
      int v8 = [*(id *)(a1 + 40) requestedAction];
      uint64_t v9 = *(void *)(a1 + 32);
      if (v8 == 1)
      {
        objc_msgSend((id)v9, "_setDraggingState:withPoint:event:", 0, *(void *)(v9 + 64), *(double *)(v9 + 112), *(double *)(v9 + 120));
        CGFloat v10 = [*(id *)(a1 + 40) icsData];

        if (v10)
        {
          double v11 = *(void **)(a1 + 32);
          CGFloat v12 = [*(id *)(a1 + 40) icsData];
          [v11 _handleImportingICSData:v12 intoEventStore:v13];
        }
      }
      else
      {
        [(id)v9 _setupEvent:*(void *)(v9 + 64) withImportData:*(void *)(a1 + 40)];
        objc_msgSend(*(id *)(a1 + 32), "_setDraggingState:withPoint:event:", 2, *(void *)(*(void *)(a1 + 32) + 64), *(double *)(*(void *)(a1 + 32) + 112), *(double *)(*(void *)(a1 + 32) + 120));
        [*(id *)(a1 + 32) _updateFlingToCancelParameters];
      }
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_setDraggingState:withPoint:event:", 0, 0, *(double *)(*(void *)(a1 + 32) + 112), *(double *)(*(void *)(a1 + 32) + 120));
  }
}

- (void)_extractFileFromSession:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_dragCompletionPending = 1;
  uint64_t v25 = self;
  double v30 = [(EKEventGestureController *)self _acceptedFileExternalTypes];
  id v28 = [MEMORY[0x1E4F1CA48] array];
  id v5 = [MEMORY[0x1E4F1CA48] array];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v26 = v4;
  obuint64_t j = [v4 items];
  uint64_t v31 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v31)
  {
    uint64_t v29 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v42 != v29) {
          objc_enumerationMutation(obj);
        }
        CGFloat v7 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v8 = v30;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v37 objects:v45 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v38;
          while (2)
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v38 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v37 + 1) + 8 * j);
              int v14 = [v7 itemProvider];
              int v15 = [v14 hasItemConformingToTypeIdentifier:v13];

              if (v15)
              {
                [v28 addObject:v7];
                [v5 addObject:v13];
                goto LABEL_16;
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v37 objects:v45 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }
LABEL_16:
      }
      uint64_t v31 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v31);
  }

  long long v16 = dispatch_group_create();
  long long v17 = v28;
  int v18 = v5;
  if ([v28 count])
  {
    unint64_t v19 = 0;
    do
    {
      id v20 = [v17 objectAtIndexedSubscript:v19];
      uint64_t v21 = [v18 objectAtIndexedSubscript:v19];
      dispatch_group_enter(v16);
      long long v22 = [v20 itemProvider];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __52__EKEventGestureController__extractFileFromSession___block_invoke;
      v34[3] = &unk_1E608B1A8;
      v34[4] = v25;
      id v35 = v21;
      id v36 = v16;
      id v23 = v21;
      id v24 = (id)[v22 loadFileRepresentationForTypeIdentifier:v23 completionHandler:v34];

      long long v17 = v28;
      ++v19;
    }
    while (v19 < [v28 count]);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__EKEventGestureController__extractFileFromSession___block_invoke_137;
  block[3] = &unk_1E6088CA8;
  block[4] = v25;
  char v33 = 0;
  dispatch_group_notify(v16, MEMORY[0x1E4F14428], block);
}

void __52__EKEventGestureController__extractFileFromSession___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    CGFloat v7 = (void *)[objc_alloc(MEMORY[0x1E4F25498]) initWithFilepath:v5];
    [*(id *)(*(void *)(a1 + 32) + 64) addAttachment:v7];
  }
  else
  {
    id v8 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      int v10 = 138543618;
      uint64_t v11 = v9;
      __int16 v12 = 2112;
      id v13 = v6;
      _os_log_impl(&dword_1B3F4C000, v8, OS_LOG_TYPE_ERROR, "Unable to load file representation for type identifier [%{public}@]: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __52__EKEventGestureController__extractFileFromSession___block_invoke_137(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 44) = 0;
  [*(id *)(a1 + 32) _setEventCalendar:*(void *)(*(void *)(a1 + 32) + 64) useManagedCalendar:*(unsigned __int8 *)(a1 + 40)];
  objc_msgSend(*(id *)(a1 + 32), "_setDraggingState:withPoint:event:", 2, *(void *)(*(void *)(a1 + 32) + 64), *(double *)(*(void *)(a1 + 32) + 112), *(double *)(*(void *)(a1 + 32) + 120));
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _updateFlingToCancelParameters];
}

- (void)dropInteraction:(id)a3 concludeDrop:(id)a4
{
  self->_dropAnimationInProgress = 0;
  -[EKEventGestureController _setLocalDraggingViewHidden:](self, "_setLocalDraggingViewHidden:", 0, a4);
}

- (void)dropInteraction:(id)a3 item:(id)a4 willAnimateDropWithAnimator:(id)a5
{
  self->_dropAnimationInProgress = 1;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__EKEventGestureController_dropInteraction_item_willAnimateDropWithAnimator___block_invoke;
  v5[3] = &unk_1E6087D40;
  v5[4] = self;
  objc_msgSend(a5, "addCompletion:", v5, a4);
}

uint64_t __77__EKEventGestureController_dropInteraction_item_willAnimateDropWithAnimator___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 45) = 0;
  return [*(id *)(a1 + 32) _setLocalDraggingViewHidden:0];
}

- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5
{
  id v7 = a5;
  if (+[EventImportData itemContainsCalendarICSData:a4])
  {
    id v8 = 0;
    goto LABEL_14;
  }
  uint64_t v9 = [(EKEventGestureController *)self _captureImageOfDraggingView];
  int v10 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v9];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_untimedDelegate);

  if (WeakRetained)
  {
    id v12 = objc_loadWeakRetained((id *)&self->_untimedDelegate);
    id v13 = [v12 eventGestureControllerGetCurrentDraggingView:self];

    if (!v13) {
      goto LABEL_10;
    }
  }
  else
  {
    id v13 = self->_draggingView;
    if (!v13) {
      goto LABEL_10;
    }
  }
  if (v10)
  {
    uint64_t v14 = [(EKDayOccurrenceView *)v13 superview];
    id v15 = objc_loadWeakRetained((id *)&self->_untimedDelegate);

    if (v15)
    {
      id v16 = objc_loadWeakRetained((id *)&self->_untimedDelegate);
      objc_msgSend(v16, "eventGestureController:finalFrameAfterCommitAtPoint:", self, self->_latestTouchPoint.x, self->_latestTouchPoint.y);
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;

      uint64_t v25 = [(EKEventGestureController *)self _viewForTracking];
      objc_msgSend(v14, "convertRect:fromView:", v25, v18, v20, v22, v24);
      double v27 = v26;
      double v29 = v28;
      double v31 = v30;
      double v33 = v32;
    }
    else
    {
      [(EKDayOccurrenceView *)v13 frame];
      double v31 = v34;
      double v33 = v35;
      [(EKEventGestureController *)self _estimateFinalDropOriginForTimedDelegate];
      double v27 = v36;
      double v29 = v37;
    }
    long long v38 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1728]), "initWithContainer:center:", v14, v27 + v31 * 0.5, v29 + v33 * 0.5);
    id v39 = objc_alloc(MEMORY[0x1E4FB1D40]);
    id v40 = objc_alloc_init(MEMORY[0x1E4FB1720]);
    id v8 = (id)[v39 initWithView:v10 parameters:v40 target:v38];

    goto LABEL_13;
  }
LABEL_10:
  id v8 = v7;
LABEL_13:

LABEL_14:

  return v8;
}

- (CGPoint)_estimateFinalDropOriginForTimedDelegate
{
  uint64_t v3 = 88;
  if (self->_currentDragType == 1) {
    uint64_t v3 = 112;
  }
  double v4 = *(double *)((char *)&self->super.isa + v3);
  CGFloat v5 = self->_latestTouchPoint.y - self->_touchOffset.y;
  [(EKDayOccurrenceView *)self->_draggingView travelTimeSubviewHeightInPoints];
  double v7 = v5 + v6;
  if (self->_currentDragType == 1 && !self->_dragLockDisabled && self->_horizontalDragLocked)
  {
    [(EKDayOccurrenceView *)self->_draggingView frame];
    double v9 = v8;
    [(EKDayOccurrenceView *)self->_draggingView travelTimeSubviewHeightInPoints];
    double v7 = v9 + v10;
  }
  [(EKEventGestureController *)self _capOccurrenceViewYOrigin:v7];
  double v12 = v11;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v14 = objc_msgSend(WeakRetained, "eventGestureController:isAllDayAtPoint:requireInsistence:", self, -[EKDayOccurrenceView isAllDay](self->_draggingView, "isAllDay") ^ 1, self->_latestTouchPoint.x, self->_latestTouchPoint.y);

  id v15 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v15, "eventGestureController:dateAtPoint:", self, v4, v12);
  double v17 = v16;

  [(EKEvent *)self->_event travelTime];
  double v19 = CalSnapDateTo15MinuteOr5MinuteInterval(self->_event, [(EKEventGestureController *)self currentDragSnappingType], v17 - v18);
  double x = self->_latestTouchPoint.x;
  double y = self->_latestTouchPoint.y;

  -[EKEventGestureController _computeOriginAtTouchPoint:forDate:isAllDay:allowXOffset:allowFloorAtRegionBottom:](self, "_computeOriginAtTouchPoint:forDate:isAllDay:allowXOffset:allowFloorAtRegionBottom:", v14, 0, 1, x, y, v19);
  result.double y = v23;
  result.double x = v22;
  return result;
}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  self->_currentDropDataOwnerCache = 0;
  if (!self->_dragCompletionPending)
  {
    int currentDraggingState = self->_currentDraggingState;
    if (currentDraggingState == 1)
    {
LABEL_5:
      double v8 = [(EKEventGestureController *)self _viewForTracking];
      [v6 locationInView:v8];
      double v10 = v9;
      double v12 = v11;
      [(EKEventGestureController *)self _updateFlingToCancelParameters];
      -[EKEventGestureController _setDraggingState:withPoint:event:](self, "_setDraggingState:withPoint:event:", 0, self->_event, v10, v12);

      goto LABEL_7;
    }
    if (currentDraggingState != 4)
    {
      if (currentDraggingState != 3) {
        goto LABEL_7;
      }
      goto LABEL_5;
    }
    -[EKEventGestureController _setDraggingState:withPoint:event:](self, "_setDraggingState:withPoint:event:", 0, self->_event, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  }
LABEL_7:
}

- (int64_t)_dropInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int64_t result = self->_currentDropDataOwnerCache;
  if (!result)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F25550]);
    self->_currentDropDataOwnerCache = 1;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    double v7 = objc_msgSend(v6, "calendarsForEntityType:", 0, 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          if ([(EKEventGestureController *)self _calendarCanAcceptManagedData:*(void *)(*((void *)&v12 + 1) + 8 * i)])
          {
            self->_currentDropDataOwnerCache = 3;
            goto LABEL_12;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    return self->_currentDropDataOwnerCache;
  }
  return result;
}

- (void)_disableSystemPreviewForDrag:(id)a3
{
  id v3 = [(EKEventGestureController *)self _findLocalDragItemInSession:a3];
  [v3 setPreviewProvider:&__block_literal_global_68];
}

uint64_t __57__EKEventGestureController__disableSystemPreviewForDrag___block_invoke()
{
  return 0;
}

- (void)_enableSystemPreviewForDrag:(id)a3
{
  id v3 = [(EKEventGestureController *)self _findLocalDragItemInSession:a3];
  [v3 setPreviewProvider:0];
}

- (void)_setToSystemDraggingImageForDrag:(id)a3
{
  id v4 = a3;
  CGFloat v5 = v4;
  id v6 = v4;
  if (self->_needToSetSystemDragPreview)
  {
    id v6 = [v4 localDragSession];

    double v7 = [(EKEventGestureController *)self _findLocalDragItemInSession:v6];
    uint64_t v8 = self->_event;
    if (v8
      || ([v7 localObject],
          long long v13 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char isKindOfClass = objc_opt_isKindOfClass(),
          v13,
          (isKindOfClass & 1) != 0)
      && ([v7 localObject], (uint64_t v8 = (EKEvent *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v20 = 0;
      uint64_t v9 = +[EKDayOccurrenceView viewForExternalDragOperationFromEvent:v8 visiblePath:&v20];
      id v10 = v20;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __61__EKEventGestureController__setToSystemDraggingImageForDrag___block_invoke;
      v17[3] = &unk_1E608B1F0;
      id v18 = v10;
      id v19 = v9;
      id v11 = v9;
      id v12 = v10;
      [v7 setPreviewProvider:v17];
    }
    else
    {
      long long v15 = kEKUILogHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)double v16 = 0;
        _os_log_impl(&dword_1B3F4C000, v15, OS_LOG_TYPE_ERROR, "Unable to create preview for dragging info: EKEvent was not found or generated", v16, 2u);
      }
      [v7 setPreviewProvider:0];
    }
    self->_needToSetSystemDragPreview = 0;
  }
}

id __61__EKEventGestureController__setToSystemDraggingImageForDrag___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB1720]);
  [v2 setVisiblePath:*(void *)(a1 + 32)];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1718]) initWithView:*(void *)(a1 + 40) parameters:v2];

  return v3;
}

- (void)_setLocalDraggingViewHidden:(BOOL)a3
{
  BOOL v3 = a3;
  draggingView = self->_draggingView;
  if (draggingView)
  {
    [(EKDayOccurrenceView *)draggingView setHidden:a3];
    [(EKDayOccurrenceView *)self->_draggingView setDrawsResizeHandles:v3 ^ 1];
  }
  id v6 = [(EKEventGestureController *)self untimedDelegate];

  if (v6)
  {
    id v7 = [(EKEventGestureController *)self untimedDelegate];
    [v7 eventGestureController:self setDraggingViewHidden:v3];
  }
}

- (void)_setToLocalDraggingImageForDrag:(id)a3
{
  id v4 = a3;
  if (self->_currentDragType == 1
    || (id WeakRetained = objc_loadWeakRetained((id *)&self->_untimedDelegate), WeakRetained, WeakRetained))
  {
    id v6 = [(EKEventGestureController *)self _findLocalDragItemInSession:v4];
    id v7 = [(EKEventGestureController *)self _captureImageOfDraggingView];
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v7];
    uint64_t v9 = [(EKEventGestureController *)self _clippingPathForDraggingView];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __60__EKEventGestureController__setToLocalDraggingImageForDrag___block_invoke;
    v12[3] = &unk_1E608B1F0;
    id v13 = v9;
    id v14 = v8;
    id v10 = v8;
    id v11 = v9;
    [v6 setPreviewProvider:v12];
  }
}

id __60__EKEventGestureController__setToLocalDraggingImageForDrag___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB1720]);
  [v2 setVisiblePath:*(void *)(a1 + 32)];
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1718]) initWithView:*(void *)(a1 + 40) parameters:v2];

  return v3;
}

- (id)_captureImageOfDraggingView
{
  p_untimedDelegate = &self->_untimedDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_untimedDelegate);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_untimedDelegate);
    id v6 = [v5 eventGestureControllerGetCurrentDraggingView:self];

    id v7 = objc_opt_class();
    [v6 bounds];
    uint64_t v8 = objc_msgSend(v7, "_captureImageOfOccurrenceView:withFrameOfOpaqueContent:", v6);
  }
  else
  {
    [(EKDayOccurrenceView *)self->_draggingView frameOfOpaqueContent];
    uint64_t v8 = objc_msgSend((id)objc_opt_class(), "_captureImageOfOccurrenceView:withFrameOfOpaqueContent:", self->_draggingView, v9, v10, v11, v12);
  }

  return v8;
}

- (id)_clippingPathForDraggingView
{
  draggingView = self->_draggingView;
  if (draggingView)
  {
    [draggingView frameOfOpaqueContent];
    draggingView = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:");
  }

  return draggingView;
}

+ (id)_captureImageOfOccurrenceView:(id)a3 withFrameOfOpaqueContent:(CGRect)a4
{
  id v4 = a3;
  [v4 frame];
  double v6 = v5;
  double v8 = v7;
  uint64_t v9 = [v4 isHidden];
  [v4 setNeedsDisplay];
  [v4 setHidden:0];
  [v4 layoutIfNeeded];
  double v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:", v6, v8);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __83__EKEventGestureController__captureImageOfOccurrenceView_withFrameOfOpaqueContent___block_invoke;
  v14[3] = &unk_1E608B218;
  id v15 = v4;
  id v11 = v4;
  double v12 = [v10 imageWithActions:v14];
  [v11 setHidden:v9];

  return v12;
}

void __83__EKEventGestureController__captureImageOfOccurrenceView_withFrameOfOpaqueContent___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 layer];
  uint64_t v4 = [v3 CGContext];

  [v5 renderInContext:v4];
}

- (id)_findLocalDragItemInSession:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v4 = objc_msgSend(a3, "items", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        double v10 = [v9 localObject];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          double v12 = [v9 localObject];
          id v13 = [(EKDayOccurrenceView *)self->_draggingView occurrence];
          id v14 = [(EKDayOccurrenceView *)self->_draggingView occurrence];

          if (!v14)
          {
            id v15 = self->_event;

            id v13 = v15;
          }
          if (([v12 isEqual:v13] & 1) != 0 || !v13)
          {
            id v16 = v9;

            goto LABEL_16;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v16 = 0;
LABEL_16:

  return v16;
}

- (unint64_t)numberOfDragSourcesForView:(id)a3
{
  return 1;
}

- (BOOL)_isTouchFromDragSessionInResizeHandles:(id)a3
{
  return (-[EKDayOccurrenceView dragTypeFromPoint:](self->_draggingView, "dragTypeFromPoint:") & 0xFFFFFFFD) == 0;
}

- (id)_eventToUseAtInteractionStart:(CGPoint)a3 outOccurrenceView:(id *)a4
{
  double y = a3.y;
  double x = a3.x;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    if (self->_currentDraggingState == 2 && (draggingView = self->_draggingView) != 0 && self->_event) {
      id v11 = draggingView;
    }
    else {
      id v11 = 0;
    }
    id v12 = objc_loadWeakRetained((id *)p_delegate);
    id v13 = objc_msgSend(v12, "eventGestureController:occurrenceViewAtPoint:ignoreSelectedCopyView:", self, 0, x, y);

    if (!v11
      || ([(EKDayOccurrenceView *)v11 occurrence],
          id v14 = objc_claimAutoreleasedReturnValue(),
          [v13 occurrence],
          id v15 = objc_claimAutoreleasedReturnValue(),
          int v16 = [v14 isEqual:v15],
          v15,
          v14,
          v16))
    {
      if (!v13)
      {
        long long v19 = -[EKEventGestureController _createNewEventIfNeededAtPoint:](self, "_createNewEventIfNeededAtPoint:", x, y);
        goto LABEL_19;
      }
      uint64_t v17 = [v13 occurrences];
      unint64_t v18 = [v17 count];

      if (v18 < 2)
      {
        id v21 = v13;
        *a4 = v21;
        long long v19 = [v21 occurrence];
        if (self->_currentDraggingState != 2) {
          goto LABEL_19;
        }
        double v22 = [(EKEventGestureController *)self _viewForTracking];
        objc_msgSend(v21, "convertPoint:fromView:", v22, x, y);
        double v24 = v23;
        double v26 = v25;

        if ((objc_msgSend(v21, "dragTypeFromPoint:", v24, v26) & 0xFFFFFFFD) != 0) {
          goto LABEL_19;
        }
      }
      else
      {
        CalPlopViewWithScaleFactorAndCompletion(v13, 0, 1.0);
      }
    }
    long long v19 = 0;
LABEL_19:

    goto LABEL_20;
  }
  id v20 = objc_loadWeakRetained((id *)&self->_untimedDelegate);

  if (!v20)
  {
    long long v19 = 0;
    goto LABEL_21;
  }
  id v11 = (EKDayOccurrenceView *)objc_loadWeakRetained((id *)&self->_untimedDelegate);
  long long v19 = -[EKDayOccurrenceView eventGestureController:eventToStartInteractionWithAtPoint:](v11, "eventGestureController:eventToStartInteractionWithAtPoint:", self, x, y);
LABEL_20:

LABEL_21:

  return v19;
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v5 = a4;
  if ([(EKEventGestureController *)self dragGestureInProgress] || self->_dragInitiationLocked) {
    goto LABEL_3;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    uint64_t v9 = WeakRetained;
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = objc_loadWeakRetained((id *)&self->_delegate);
      char v13 = [v12 eventGestureControllerShouldAllowLongPress:self];

      if (v13) {
        goto LABEL_13;
      }
LABEL_3:
      uint64_t v6 = (void *)MEMORY[0x1E4F1CBF0];
      goto LABEL_4;
    }
  }
  id v14 = objc_loadWeakRetained((id *)&self->_untimedDelegate);

  if (v14)
  {
    id v15 = objc_loadWeakRetained((id *)&self->_untimedDelegate);
    int v16 = [v15 eventGestureControllerShouldAllowLongPress:self];

    if (!v16) {
      goto LABEL_3;
    }
  }
LABEL_13:
  uint64_t v17 = [(EKEventGestureController *)self _viewForTracking];
  [v5 locationInView:v17];
  double v19 = v18;
  double v21 = v20;

  -[EKEventGestureController _setUpInitialTouchPointsWithPoint:](self, "_setUpInitialTouchPointsWithPoint:", v19, v21);
  id v63 = 0;
  double v22 = -[EKEventGestureController _eventToUseAtInteractionStart:outOccurrenceView:](self, "_eventToUseAtInteractionStart:outOccurrenceView:", &v63, v19, v21);
  id v23 = v63;
  if (!v22) {
    goto LABEL_42;
  }
  if ([v22 isNew]) {
    goto LABEL_21;
  }
  BOOL v24 = [(EKEventGestureController *)self canProposeNewTime:v22];
  int v25 = [v22 isEditable] | v24;
  if ([v22 isReminderIntegrationEvent])
  {
    if ((objc_msgSend(v22, "CUIK_reminderShouldBeEditable") & v25 & 1) == 0) {
      goto LABEL_17;
    }
LABEL_21:
    id v29 = objc_alloc_init(MEMORY[0x1E4F28D78]);
    [v29 registerDataRepresentationForTypeIdentifier:@"com.apple.eventkit.internal" visibility:3 loadHandler:&__block_literal_global_153];
    if (([v22 isNew] & 1) == 0 && (objc_msgSend(v22, "isReminderIntegrationEvent") & 1) == 0)
    {
      id v30 = v22;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __69__EKEventGestureController_dragInteraction_itemsForBeginningSession___block_invoke_2;
      aBlock[3] = &unk_1E608B260;
      id v31 = v30;
      id v62 = v31;
      double v32 = _Block_copy(aBlock);
      [v29 registerDataRepresentationForTypeIdentifier:@"com.apple.calendar.ics" visibility:0 loadHandler:v32];
      [v29 registerDataRepresentationForTypeIdentifier:@"com.apple.ical.ics" visibility:0 loadHandler:v32];
      uint64_t v33 = *MEMORY[0x1E4FB3388];
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __69__EKEventGestureController_dragInteraction_itemsForBeginningSession___block_invoke_3;
      v59[3] = &unk_1E608B260;
      id v60 = v31;
      id v34 = v31;
      [v29 registerDataRepresentationForTypeIdentifier:v33 visibility:0 loadHandler:v59];
    }
    if (([v22 isNew] & 1) == 0)
    {
      double v35 = [v22 title];
      uint64_t v36 = [v35 length];

      if (v36)
      {
        double v37 = [MEMORY[0x1E4F57B70] sharedGenerator];
        long long v38 = [v37 textRepresentationForEvent:v22 withTextFormat:0 showURI:0];

        id v39 = [(id)*MEMORY[0x1E4F44510] identifier];
        v57[0] = MEMORY[0x1E4F143A8];
        v57[1] = 3221225472;
        v57[2] = __69__EKEventGestureController_dragInteraction_itemsForBeginningSession___block_invoke_4;
        v57[3] = &unk_1E608B260;
        id v40 = v38;
        id v58 = v40;
        [v29 registerDataRepresentationForTypeIdentifier:v39 visibility:0 loadHandler:v57];

        long long v41 = [(id)*MEMORY[0x1E4F44508] identifier];
        v55[0] = MEMORY[0x1E4F143A8];
        v55[1] = 3221225472;
        v55[2] = __69__EKEventGestureController_dragInteraction_itemsForBeginningSession___block_invoke_5;
        v55[3] = &unk_1E608B260;
        id v56 = v40;
        id v42 = v40;
        [v29 registerDataRepresentationForTypeIdentifier:v41 visibility:0 loadHandler:v55];
      }
    }
    long long v43 = [v22 title];
    uint64_t v44 = [v43 length];

    if (v44)
    {
      uint64_t v45 = [v22 title];
    }
    else
    {
      if (![v22 isNew]) {
        goto LABEL_32;
      }
      uint64_t v45 = +[EKEventEditor defaultTitleForCalendarItem];
    }
    double v46 = (void *)v45;
    [v29 setSuggestedName:v45];

LABEL_32:
    uint64_t v47 = (void *)[objc_alloc(MEMORY[0x1E4FB1710]) initWithItemProvider:v29];
    [v47 setLocalObject:v22];
    if ([v22 isNew]) {
      goto LABEL_36;
    }
    uint64_t v48 = [v22 calendar];
    if (!v48) {
      goto LABEL_36;
    }
    uint64_t v49 = (void *)v48;
    uint64_t v50 = [v22 calendar];
    char v51 = [v50 isManaged];

    if (v51) {
      uint64_t v52 = 1;
    }
    else {
LABEL_36:
    }
      uint64_t v52 = 2;
    objc_msgSend(v47, "set_managementState:", v52);
    objc_storeStrong((id *)&self->_event, v22);
    BOOL v53 = [v23 occurrenceDate];
    self->_occurrenceDateIndedouble x = [(EKEventGestureController *)self _occurrenceDateIndexWithEvent:v22 occurrenceDate:v53];

    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObject:v47];

    goto LABEL_38;
  }
  if (v25) {
    goto LABEL_21;
  }
LABEL_17:
  id v26 = objc_loadWeakRetained((id *)&self->_delegate);

  if (!v26)
  {
    id v54 = objc_loadWeakRetained((id *)&self->_untimedDelegate);

    if (v54)
    {
      id v29 = objc_loadWeakRetained((id *)&self->_untimedDelegate);
      objc_msgSend(v29, "eventGestureController:requestedCancellationAnimationAtPoint:withOccurrence:", self, v22, v19, v21);
      goto LABEL_41;
    }
LABEL_42:
    uint64_t v6 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_43;
  }
  id v27 = objc_loadWeakRetained((id *)&self->_delegate);
  double v28 = [v23 occurrenceDate];
  id v29 = [v27 eventGestureController:self occurrenceViewForOccurrence:v22 occurrenceDate:v28];

  if (!v29) {
    goto LABEL_42;
  }
  [(EKEventGestureController *)self _updatePositionOfEditingMenuForView:v29];
LABEL_41:
  uint64_t v6 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_38:

LABEL_43:
LABEL_4:

  return v6;
}

id __69__EKEventGestureController_dragInteraction_itemsForBeginningSession___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F28F90];
  id v3 = a2;
  uint64_t v4 = [v2 progressWithTotalUnitCount:1];
  [v4 setCompletedUnitCount:1];
  (*((void (**)(id, void, void))v3 + 2))(v3, 0, 0);

  return v4;
}

id __69__EKEventGestureController_dragInteraction_itemsForBeginningSession___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F28F90];
  uint64_t v4 = a2;
  id v5 = [v3 progressWithTotalUnitCount:1];
  [v5 setCompletedUnitCount:1];
  uint64_t v6 = [*(id *)(a1 + 32) exportToICS];
  v4[2](v4, v6, 0);

  return v5;
}

id __69__EKEventGestureController_dragInteraction_itemsForBeginningSession___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F29230];
  id v4 = a2;
  id v5 = (void *)[[v3 alloc] initWithActivityType:@"com.apple.calendar.continuity.event_selection"];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F57C60]) initWithEvent:*(void *)(a1 + 32) view:0];
  [v6 updateActivity:v5];
  uint64_t v7 = [v5 loadDataWithTypeIdentifier:*MEMORY[0x1E4FB3388] forItemProviderCompletionHandler:v4];

  return v7;
}

id __69__EKEventGestureController_dragInteraction_itemsForBeginningSession___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F28F90];
  id v4 = a2;
  id v5 = [v3 progressWithTotalUnitCount:1];
  [v5 setCompletedUnitCount:1];
  uint64_t v6 = [*(id *)(a1 + 32) dataUsingEncoding:4];
  v4[2](v4, v6, 0);

  return v5;
}

id __69__EKEventGestureController_dragInteraction_itemsForBeginningSession___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F28F90];
  id v4 = a2;
  id v5 = [v3 progressWithTotalUnitCount:1];
  [v5 setCompletedUnitCount:1];
  uint64_t v6 = [*(id *)(a1 + 32) dataUsingEncoding:10];
  v4[2](v4, v6, 0);

  return v5;
}

- (EKCalendarDate)occurrenceDate
{
  id v3 = [(EKEvent *)self->_event startCalendarDate];
  id v4 = [v3 calendarDateByAddingDays:self->_occurrenceDateIndex];

  return (EKCalendarDate *)v4;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!self->_draggingView
    || ![(EKEventGestureController *)self _isTouchFromDragSessionInResizeHandles:v10])
  {
    char v11 = [(EKEventGestureController *)self _viewForTracking];
    [v10 locationInView:v11];
    -[EKEventGestureController _setDraggingState:withPoint:event:](self, "_setDraggingState:withPoint:event:", 3, 0);
    [(EKEventGestureController *)self _updateFlingToCancelParameters];
  }
  self->_needToSetSystemDragPreview = 1;

  return 0;
}

- (void)_dragInteractionDidCancelLiftWithoutDragging:(id)a3
{
  id v4 = a3;
  if (self->_waitingForDragToInitialize)
  {
    id v7 = v4;
    if (!self->_draggingView
      || self->_currentDragType == 1
      || ([(EKEventGestureController *)self _viewForTracking],
          id v5 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v5, "convertPoint:toView:", self->_draggingView, self->_latestTouchPoint.x, self->_latestTouchPoint.y), v6 = -[EKDayOccurrenceView dragTypeFromPoint:](self->_draggingView, "dragTypeFromPoint:") & 0xFFFFFFFD, v5, id v4 = v7, v6))
    {
      if (self->_currentDraggingState == 3)
      {
        [(EKEventGestureController *)self _setLocalDraggingViewHidden:0];
        self->_dragInteractionCancellingWithoutDragging = 1;
        -[EKEventGestureController _setDraggingState:withPoint:event:](self, "_setDraggingState:withPoint:event:", 2, self->_event, self->_latestTouchPoint.x, self->_latestTouchPoint.y);
        self->_dragInteractionCancellingWithoutDragging = 0;
      }
      else
      {
        [(EKEventGestureController *)self _dragFailedToStart];
      }
      id v4 = v7;
    }
    self->_waitingForDragToInitialize = 0;
  }
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
}

- (BOOL)dragInteraction:(id)a3 sessionAllowsMoveOperation:(id)a4
{
  return 1;
}

- (BOOL)dragInteraction:(id)a3 sessionIsRestrictedToDraggingApplication:(id)a4
{
  return 0;
}

- (BOOL)dragInteraction:(id)a3 prefersFullSizePreviewsForSession:(id)a4
{
  return 1;
}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
  id v8 = a3;
  id v7 = a4;
  if (self->_waitingForDragToInitialize
    && (!self->_draggingView
     || ![(EKEventGestureController *)self _isTouchFromDragSessionInResizeHandles:v7]))
  {
    [(EKEventGestureController *)self _setLocalDraggingViewHidden:0];
    -[EKEventGestureController _setDraggingState:withPoint:event:](self, "_setDraggingState:withPoint:event:", 2, 0, self->_latestTouchPoint.x, self->_latestTouchPoint.y);
  }
}

- (int64_t)_dragInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  id v4 = [(EKEventGestureController *)self _findLocalDragItemInSession:a4];
  id v5 = [v4 localObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_6;
  }
  id v7 = [v4 localObject];
  uint64_t v8 = [v7 calendar];
  if (!v8)
  {

    goto LABEL_6;
  }
  id v9 = (void *)v8;
  id v10 = [v7 calendar];
  char v11 = [v10 isManaged];

  if ((v11 & 1) == 0)
  {
LABEL_6:
    int64_t v12 = 1;
    goto LABEL_7;
  }
  int64_t v12 = 2;
LABEL_7:

  return v12;
}

- (int64_t)_dragInteraction:(id)a3 dataOwnerForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  return 1;
}

- (BOOL)_dragInteraction:(id)a3 sessionSupportsSystemDrag:(id)a4
{
  return 0;
}

- (id)originalStartDateForEvent:(id)a3 includingTravel:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(EKEventGestureController *)self draggingViewSource];
  int v8 = [v7 isProposedTime];

  if (v8)
  {
    uint64_t v9 = [v6 proposedStartDate];
  }
  else
  {
    if (v4) {
      [v6 startDateIncludingTravel];
    }
    else {
    uint64_t v9 = [v6 startDate];
    }
  }
  id v10 = (void *)v9;

  return v10;
}

- (BOOL)splitMultiDays
{
  if (![(EKEvent *)self->_event isAllDay]) {
    return 0;
  }
  id v3 = [(EKEventGestureController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    BOOL v4 = [(EKEventGestureController *)self delegate];
    char v5 = [v4 eventGestureControllerShouldSplitMultiDayAllDayEvents:self];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)_createTemporaryView:(id)a3 animated:(BOOL)a4
{
  BOOL v67 = a4;
  id v5 = a3;
  id v6 = [(EKEventGestureController *)self originalStartDateForEvent:v5 includingTravel:1];
  [v6 timeIntervalSinceReferenceDate];
  double v8 = v7;

  uint64_t v9 = [v5 isAllDay];
  id v10 = (void *)MEMORY[0x1E4F57838];
  char v11 = [v5 eventStore];
  int64_t v12 = [v11 timeZone];
  char v13 = [v10 calendarDateWithAbsoluteTime:v12 timeZone:v8];
  id v14 = [v13 calendarDateForDay];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "eventGestureController:dateAtPoint:", self, self->_firstTouchPoint.x, self->_firstTouchPoint.y);
  double v17 = v16;

  double v18 = (void *)MEMORY[0x1E4F57838];
  double v19 = [v5 eventStore];
  double v20 = [v19 timeZone];
  double v21 = [v18 calendarDateWithAbsoluteTime:v20 timeZone:v17];
  double v22 = [v21 calendarDateForDay];
  currentDadouble y = self->_currentDay;
  self->_currentDadouble y = v22;

  if (self->_currentDraggingState == 1 || self->_pendingDraggingState == 1)
  {
    self->_int64_t touchOffsetDays = 0;
    self->_commitOffsetDays = 0;
    double v8 = v17;
  }
  else if ([(EKEventGestureController *)self splitMultiDays] {
         && [v5 isAllDay])
  }
  {
    id v57 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v57, "eventGestureController:dateAtPoint:", self, self->_latestTouchPoint.x, self->_latestTouchPoint.y);
    double v59 = v58;

    id v60 = (void *)MEMORY[0x1E4F57838];
    id v61 = [v5 eventStore];
    id v62 = [v61 timeZone];
    id v63 = [v60 calendarDateWithAbsoluteTime:v62 timeZone:v59];
    v64 = [v63 calendarDateForDay];

    [v64 absoluteTime];
    double v8 = v65;
    self->_int64_t touchOffsetDays = 0;
    self->_commitOffsetDays = [v64 differenceInDays:v14];
  }
  else
  {
    self->_int64_t touchOffsetDays = [(EKCalendarDate *)self->_currentDay differenceInDays:v14];
    self->_commitOffsetDays = 0;
    if ([(EKEvent *)self->_event isAllDay])
    {
      [(EKCalendarDate *)self->_currentDay absoluteTime];
      double v8 = v66;
    }
  }
  id v24 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v24, "eventGestureController:pointAtDate:isAllDay:", self, objc_msgSend(v5, "isAllDay"), v8);
  double v26 = v25;
  double v28 = v27;

  [v5 durationIncludingTravel];
  double v30 = fmin(v29, 86400.0);
  if (([v5 isAllDay] & 1) == 0)
  {
    int64_t touchOffsetDays = self->_touchOffsetDays;
    if (touchOffsetDays >= 1 && touchOffsetDays + 1 == [v5 daySpan])
    {
      double v32 = (void *)MEMORY[0x1E4F57838];
      uint64_t v33 = [v5 endDateUnadjustedForLegacyClients];
      id v34 = [v5 timeZone];
      double v35 = [v32 calendarDateWithDate:v33 timeZone:v34];

      [v35 absoluteTime];
      double v37 = v36;
      long long v38 = [v35 calendarDateForDay];
      [v38 absoluteTime];
      double v30 = v37 - v39;
    }
  }
  id v40 = objc_loadWeakRetained((id *)&self->_delegate);
  long long v41 = (void *)[v40 createOccurrenceViewForEventGestureController:self];

  [v41 setSelected:1];
  id v42 = [(EKEventGestureController *)self draggingViewSource];
  objc_msgSend(v41, "setIsProposedTime:", objc_msgSend(v42, "isProposedTime"));

  [v41 setOccurrence:v5];
  long long v43 = [(EKEventGestureController *)self draggingViewSource];
  uint64_t v44 = [v43 occurrenceDate];
  uint64_t v45 = [v5 startCalendarDate];
  objc_msgSend(v41, "setOccurrenceDateIndex:", objc_msgSend(v44, "differenceInDays:", v45));

  [v41 setPointerInteractionDisabled:1];
  [(EKDayOccurrenceView *)self->_draggingViewSource margin];
  objc_msgSend(v41, "setMargin:");
  [(EKDayOccurrenceView *)self->_draggingViewSource padding];
  objc_msgSend(v41, "setPadding:");
  [(EKEventGestureController *)self _computeWidthForOccurrenceView];
  [(EKEventGestureController *)self _computeHeightForOccurrenceViewOfDuration:self->_event event:v9 allDay:v30];
  -[EKEventGestureController _computeOriginAtTouchPoint:forDate:isAllDay:allowXOffset:allowFloorAtRegionBottom:](self, "_computeOriginAtTouchPoint:forDate:isAllDay:allowXOffset:allowFloorAtRegionBottom:", v9, 0, 1, v26, v28, v8);
  objc_msgSend(v41, "setFrame:");
  id v46 = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v47 = [v46 occurrenceViewSuperviewForEventGestureController:self];

  [v47 addSubview:v41];
  [v41 setAllDay:v9];
  objc_msgSend(v41, "setHasPrecedingDuration:", -[EKDayOccurrenceView hasPrecedingDuration](self->_draggingViewSource, "hasPrecedingDuration"));
  objc_msgSend(v41, "setHasTrailingDuration:", -[EKDayOccurrenceView hasTrailingDuration](self->_draggingViewSource, "hasTrailingDuration"));
  [v41 setMultiAllDayRoundCorners:1];
  uint64_t v48 = DraggedEventShadowColor();
  uint64_t v49 = [v41 layer];
  [v49 setShadowColor:v48];

  uint64_t v50 = [v41 layer];
  LODWORD(v51) = 1043878380;
  [v50 setShadowOpacity:v51];

  uint64_t v52 = [v41 layer];
  [v52 setShadowRadius:10.0];

  BOOL v53 = [v41 layer];
  objc_msgSend(v53, "setShadowOffset:", 0.0, 9.0);

  id v54 = objc_loadWeakRetained((id *)&self->_delegate);
  int v55 = [(EKEventGestureController *)self event];
  objc_msgSend(v54, "eventGestureController:adjustDraggingView:forAllDay:", self, v41, objc_msgSend(v55, "isAllDay"));

  [v41 requestContentIfNeeded:16 completion:0];
  if (v67) {
    [(EKEventGestureController *)self _animateInNewEvent];
  }
  else {
    [(EKEventGestureController *)self setCommitBlocked:0];
  }

  return v41;
}

- (void)_updatePositionOfEditingMenuForView:(id)a3
{
  if (!self->_isNewEvent) {
    [a3 presentEditingMenuFromGestureController:self];
  }
}

- (void)_hideEditingMenuForView:(id)a3
{
}

- (void)_animateInNewEvent
{
  [(EKDayOccurrenceView *)self->_draggingView frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(EKEventGestureController *)self setCommitBlocked:1];
  if (self->_isNewEvent && !self->_forcedStart)
  {
    draggingView = self->_draggingView;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __46__EKEventGestureController__animateInNewEvent__block_invoke;
    v14[3] = &unk_1E6087570;
    void v14[4] = self;
    CalPopViewIn(draggingView, v14);
  }
  else
  {
    char v11 = self->_draggingView;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __46__EKEventGestureController__animateInNewEvent__block_invoke_2;
    v13[3] = &unk_1E6087570;
    v13[4] = self;
    CalScaleViewIn(v11, v13, v4, v6, v8, v10);
  }
}

uint64_t __46__EKEventGestureController__animateInNewEvent__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCommitBlocked:0];
}

uint64_t __46__EKEventGestureController__animateInNewEvent__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCommitBlocked:0];
}

- (void)_setTouchOffsetsFromPoint:(CGPoint)a3 fixedToCenter:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  id v34 = [(EKDayOccurrenceView *)self->_draggingView occurrence];
  double v8 = [(EKDayOccurrenceView *)self->_draggingView occurrenceDate];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v10 = [WeakRetained touchTrackingViewForEventGestureController:self];

  objc_msgSend(v10, "convertPoint:toView:", self->_draggingView, x, y);
  if (v4)
  {
    [(EKDayOccurrenceView *)self->_draggingView bounds];
    double v14 = v13 * 0.5;
    [(EKDayOccurrenceView *)self->_draggingView bounds];
    double v16 = v15 * 0.5;
  }
  else
  {
    double v14 = v11;
    double v16 = v12;
  }
  [(EKDayOccurrenceView *)self->_draggingView margin];
  CGFloat v18 = v14 + v17;
  [(EKDayOccurrenceView *)self->_draggingView margin];
  CGFloat v20 = v16 + v19;
  self->_int currentDragType = -[EKDayOccurrenceView dragTypeFromPoint:](self->_draggingView, "dragTypeFromPoint:", v18, v20);
  self->_touchOffset.double x = v18;
  self->_touchOffset.double y = v20;
  double v21 = [v34 startCalendarDate];
  double v22 = [v21 calendarDateForDay];

  if (v4)
  {
    id v23 = 0;
  }
  else
  {
    if ([(EKEventGestureController *)self splitMultiDays])
    {
      id v23 = (objc_class *)[v8 differenceInDays:v22];
      self->_int64_t touchOffsetDays = 0;
      uint64_t v24 = 184;
      goto LABEL_10;
    }
    id v23 = (objc_class *)[(EKCalendarDate *)self->_currentDay differenceInDays:v22];
  }
  uint64_t v24 = 176;
LABEL_10:
  *(Class *)((char *)&self->super.isa + v24) = v23;
  id v25 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v25, "eventGestureController:dateAtPoint:", self, self->_firstTouchPoint.x, self->_firstTouchPoint.y);
  self->_dateAtFirstTouchPoint = v26;

  double v27 = (void *)MEMORY[0x1E4F57838];
  double v28 = [v34 endDateUnadjustedForLegacyClients];
  double v29 = [v34 eventStore];
  double v30 = [v29 timeZone];
  id v31 = [v27 calendarDateWithDate:v28 timeZone:v30];
  double v32 = [v31 calendarDateForDay];

  if ([v34 isAllDay]) {
    LOBYTE(v33) = 0;
  }
  else {
    int v33 = [v22 isEqual:v32] ^ 1;
  }
  self->_isMultiDayTimedEvent = v33;
  [(EKEventGestureController *)self _updateSnappingTypeForCurrentDrag];
}

- (void)_setUpAfterForcedStartFromPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  draggingView = self->_draggingView;
  if (!draggingView || !self->_event)
  {
    uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"CalendarEventGestures.m", 2796, @"Gesture controller tried to set up after a forced start, but with no view and/or event to drag" object file lineNumber description];

    draggingView = self->_draggingView;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v9 = [WeakRetained occurrenceViewSuperviewForEventGestureController:self];
  CalSwitchViewToSuperview(draggingView, v9);

  -[EKEventGestureController _setTouchOffsetsFromPoint:fixedToCenter:](self, "_setTouchOffsetsFromPoint:fixedToCenter:", 0, x, y);
  self->_isNewEvent = [(EKEvent *)self->_event isNew];
  if (self->_currentDragType != 1)
  {
    double v10 = objc_opt_class();
    [(EKDayOccurrenceView *)self->_draggingView bounds];
    objc_msgSend(v10, "contentStretchRectForFrame:");
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v19 = [(EKDayOccurrenceView *)self->_draggingView layer];
    objc_msgSend(v19, "setContentsCenter:", v12, v14, v16, v18);
  }
  if (!self->_isMultiDayTimedEvent || !self->_touchOffsetDays) {
    [(EKDayOccurrenceView *)self->_draggingView setDrawsResizeHandles:1];
  }
  event = self->_event;
  if (self->_currentDragType == 2) {
    [(EKEvent *)event endDateUnadjustedForLegacyClients];
  }
  else {
  double v21 = [(EKEvent *)event startDateIncludingTravel];
  }
  [v21 timeIntervalSinceReferenceDate];
  double v23 = v22;

  id v25 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v25, "eventGestureController:didSetUpAtDate:isAllDay:", self, -[EKDayOccurrenceView isAllDay](self->_draggingView, "isAllDay"), v23);
}

- (double)_minimumDuration
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetView);
  IsRegularInViewHierarchdouble y = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(WeakRetained);

  double result = 1800.0;
  if (IsRegularInViewHierarchy) {
    return 900.0;
  }
  return result;
}

- (void)_update
{
  if (!self->_draggingView)
  {
    v85 = [MEMORY[0x1E4F28B00] currentHandler];
    [v85 handleFailureInMethod:a2, self, @"CalendarEventGestures.m", 2825, @"Gesture controller tried to update, but with no view to drag" object file lineNumber description];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int v4 = objc_msgSend(WeakRetained, "eventGestureController:isAllDayAtPoint:requireInsistence:", self, -[EKDayOccurrenceView isAllDay](self->_draggingView, "isAllDay") ^ 1, self->_latestTouchPoint.x, self->_latestTouchPoint.y);

  if (v4) {
    uint64_t v5 = self->_currentDragType == 1;
  }
  else {
    uint64_t v5 = 0;
  }
  if ([(EKEvent *)self->_event hasRecurrenceRules]
    && v5 != [(EKEvent *)self->_event isAllDay])
  {
    uint64_t v5 = [(EKEvent *)self->_event isAllDay] & v5;
  }
  id v86 = [(EKDayOccurrenceView *)self->_draggingView occurrence];
  double v6 = [v86 startDate];
  [v6 timeIntervalSinceReferenceDate];
  double v8 = v7;

  double v9 = [v86 endDateUnadjustedForLegacyClients];
  [v9 timeIntervalSinceReferenceDate];
  double v11 = v10;

  [v86 duration];
  double v13 = v12;
  CGFloat v14 = self->_latestTouchPoint.y - self->_touchOffset.y;
  [(EKDayOccurrenceView *)self->_draggingView travelTimeSubviewHeightInPoints];
  [(EKEventGestureController *)self _capOccurrenceViewYOrigin:v14 + v15];
  double v17 = v16;
  if (self->_currentDragType == 1)
  {
    if (([v86 isAllDay] ^ 1 | v5) == 1)
    {
      if (([v86 isAllDay] & 1) == 0 && ((v5 ^ 1) & 1) == 0)
      {
        [v86 setTravelTime:0.0];
        double v13 = 86399.0;
      }
    }
    else
    {
      double v13 = 3600.0;
    }
    id v40 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v40, "eventGestureController:dateAtPoint:", self, self->_latestTouchPoint.x, v17);
    double v38 = v41;

    goto LABEL_29;
  }
  id v18 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v18, "eventGestureController:dateAtPoint:", self, self->_firstTouchPoint.x, v17);
  double v20 = v19;

  if (!self->_currentDragType)
  {
    [(EKEventGestureController *)self _minimumDuration];
    double v43 = v11 - v42;
    if (v20 <= v43) {
      double v38 = v20;
    }
    else {
      double v38 = v43;
    }
    double v13 = v11 - v38;
LABEL_29:
    double v39 = v38;
    goto LABEL_30;
  }
  [v86 travelTime];
  double v22 = fmin(v13 + v21, 86400.0);
  double v23 = (void *)MEMORY[0x1E4F57838];
  uint64_t v24 = [(EKEvent *)self->_event eventStore];
  id v25 = [v24 timeZone];
  double v26 = [v23 calendarDateWithAbsoluteTime:v25 timeZone:v20];

  if (![(EKEvent *)self->_event isAllDay])
  {
    int64_t touchOffsetDays = self->_touchOffsetDays;
    if (touchOffsetDays >= 1 && touchOffsetDays + 1 == [v86 daySpan])
    {
      [v26 absoluteTime];
      double v29 = v28;
      double v30 = [v26 calendarDateForDay];
      [v30 absoluteTime];
      double v22 = v29 - v31;
    }
  }
  [(EKEventGestureController *)self _computeHeightForOccurrenceViewOfDuration:0 event:0 allDay:v22];
  double v33 = round(v32) + self->_latestTouchPoint.y - self->_touchOffset.y;
  id v34 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v34, "eventGestureController:dateAtPoint:", self, self->_firstTouchPoint.x, v33);
  double v36 = v35;

  [(EKEventGestureController *)self _minimumDuration];
  if (v13 + v36 - v11 >= v37) {
    double v13 = v13 + v36 - v11;
  }
  else {
    double v13 = v37;
  }
  double v38 = v8 + v13;

  double v39 = v8;
LABEL_30:
  if (self->_touchOffsetDays < 1 || ([v86 isAllDay] & 1) != 0)
  {
    double v44 = v39;
  }
  else
  {
    double v44 = v39;
    if (self->_currentDragType != 2)
    {
      id v76 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v76, "eventGestureController:dateAtPoint:", self, self->_latestTouchPoint.x, self->_latestTouchPoint.y);
      double v78 = v77;

      double v44 = v8 + v78 - self->_dateAtFirstTouchPoint;
      double v38 = v44;
    }
  }
  [(EKEventGestureController *)self _computeWidthForOccurrenceView];
  double v46 = v45;
  [(EKEventGestureController *)self _computeHeightForOccurrenceViewOfDuration:v86 event:v5 allDay:v13];
  double v48 = v47;
  [(EKDayOccurrenceView *)self->_draggingViewSource enoughHeightForOneLine];
  if (v48 >= v49) {
    double v50 = v48;
  }
  else {
    double v50 = v49;
  }
  [v86 travelTime];
  double v51 = 0.0;
  if (v52 > 0.0)
  {
    [v86 travelTime];
    -[EKEventGestureController _computeHeightForOccurrenceViewOfDuration:event:allDay:](self, "_computeHeightForOccurrenceViewOfDuration:event:allDay:", v86, 0);
    double v51 = v53;
  }
  if (self->_touchOffsetDays < 1 || (int v54 = [v86 isAllDay], v55 = v39, v54))
  {
    [v86 travelTime];
    double v55 = v44 - v56;
  }
  double v57 = v50 + v51;
  -[EKEventGestureController _computeOriginAtTouchPoint:forDate:isAllDay:allowXOffset:allowFloorAtRegionBottom:](self, "_computeOriginAtTouchPoint:forDate:isAllDay:allowXOffset:allowFloorAtRegionBottom:", v5, self->_currentDragType == 1, 1, self->_latestTouchPoint.x, self->_latestTouchPoint.y, v55);
  double v59 = v58;
  double v61 = v60;
  BOOL v62 = -[EKEventGestureController _isPointInCancelRegion:](self, "_isPointInCancelRegion:", self->_latestTouchPoint.x, self->_latestTouchPoint.y);
  id v63 = (void *)MEMORY[0x1E4F57838];
  v64 = [v86 eventStore];
  double v65 = [v64 timeZone];
  double v66 = [v63 calendarDateWithAbsoluteTime:v65 timeZone:v39];
  BOOL v67 = [v66 calendarDateForDay];

  if ([v67 isEqual:self->_currentDay]
    && v5 == [(EKDayOccurrenceView *)self->_draggingView isAllDay]
    && (self->_isInCancelRegion == v62 || v5 == [(EKDayOccurrenceView *)self->_draggingView isAllDay]))
  {
    v79 = [(EKEventGestureController *)self draggingViewSource];
    int v80 = [v79 isProposedTime];
    draggingView = self->_draggingView;
    if (v80)
    {
      [(EKDayOccurrenceView *)draggingView setIsProposedTime:1];
    }
    else
    {
      v82 = [(EKDayOccurrenceView *)draggingView occurrence];
      [(EKDayOccurrenceView *)self->_draggingView setIsProposedTime:[(EKEventGestureController *)self canProposeNewTime:v82]];
    }
    v83 = [(EKEventGestureController *)self draggingViewSource];
    [v83 travelTimeSubviewHeightInPoints];
    -[EKDayOccurrenceView setTravelTimeSubviewHeightInPoints:](self->_draggingView, "setTravelTimeSubviewHeightInPoints:");

    -[EKDayOccurrenceView setFrame:](self->_draggingView, "setFrame:", v59, v61, v46, v57);
    [(EKDayOccurrenceView *)self->_draggingView requestContentIfNeeded:16 completion:0];
    [(EKDayOccurrenceView *)self->_draggingView setNeedsLayout];
  }
  else
  {
    id v68 = objc_loadWeakRetained((id *)&self->_delegate);
    [v68 eventGestureController:self adjustDraggingView:self->_draggingView forAllDay:v5];

    -[EKDayOccurrenceView animateToFrame:isAllDay:beginFromCurrentState:whenFinished:](self->_draggingView, "animateToFrame:isAllDay:beginFromCurrentState:whenFinished:", v5, 1, 0, v59, v61, v46, v57);
  }
  v69 = (void *)MEMORY[0x1E4F57838];
  double v70 = [v86 eventStore];
  double v71 = [v70 timeZone];
  id v72 = [v69 calendarDateWithAbsoluteTime:v71 timeZone:v39];
  v73 = [v72 calendarDateForDay];
  currentDadouble y = self->_currentDay;
  self->_currentDadouble y = v73;

  self->_isInCancelRegion = v62;
  id v75 = objc_loadWeakRetained((id *)&self->_delegate);
  [v75 eventGestureController:self didMoveToDate:v5 isAllDay:v38];
}

- (void)_commit
{
  if ([(EKEventGestureController *)self _flingOrCancelDraggingViewIfNeeded])
  {
    id v128 = [(EKCalendarDate *)self->_currentDay timeZone];
    int v4 = [MEMORY[0x1E4F57838] calendarDateWithAbsoluteTime:v128 timeZone:self->_dateAtFirstTouchPoint];
    uint64_t v5 = [v4 calendarDateForDay];
    currentDadouble y = self->_currentDay;
    self->_currentDadouble y = v5;

    [(UILongPressGestureRecognizer *)self->_draggingGestureRecognizer setState:3];
LABEL_3:

    return;
  }
  if (self->_draggingView)
  {
    if ([(EKEventGestureController *)self commitBlocked])
    {
      self->_needsCommit = 1;
      return;
    }
    self->_needsCommit = 0;
    if (self->_currentDraggingState != 3 && CFAbsoluteTimeGetCurrent() - self->_firstTouchTime < 0.2)
    {
      [(UILongPressGestureRecognizer *)self->_draggingGestureRecognizer setState:0];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      draggingView = self->_draggingView;
      double v57 = [(EKEventGestureController *)self event];
      objc_msgSend(WeakRetained, "eventGestureController:addViewToScroller:isAllDay:", self, draggingView, objc_msgSend(v57, "isAllDay"));

      id v128 = objc_loadWeakRetained((id *)&self->_delegate);
      double v58 = [(EKEventGestureController *)self event];
      [v128 eventGestureController:self didSingleTapOccurrence:v58 shouldExtendSelection:0];

      goto LABEL_3;
    }
    double v8 = [(EKDayOccurrenceView *)self->_draggingView occurrence];
    uint64_t v9 = 88;
    if (self->_currentDragType == 1) {
      uint64_t v9 = 112;
    }
    double v10 = *(double *)((char *)&self->super.isa + v9);
    CGFloat v11 = self->_latestTouchPoint.y - self->_touchOffset.y;
    [(EKDayOccurrenceView *)self->_draggingView travelTimeSubviewHeightInPoints];
    double v13 = v11 + v12;
    if (self->_currentDragType == 1 && !self->_dragLockDisabled && self->_horizontalDragLocked)
    {
      [(EKDayOccurrenceView *)self->_draggingView frame];
      double v15 = v14;
      [(EKDayOccurrenceView *)self->_draggingView travelTimeSubviewHeightInPoints];
      double v13 = v15 + v16;
    }
    [(EKEventGestureController *)self _capOccurrenceViewYOrigin:v13];
    double v18 = v17;
    id v19 = objc_loadWeakRetained((id *)&self->_delegate);
    int v20 = objc_msgSend(v19, "eventGestureController:isAllDayAtPoint:requireInsistence:", self, -[EKDayOccurrenceView isAllDay](self->_draggingView, "isAllDay") ^ 1, self->_latestTouchPoint.x, self->_latestTouchPoint.y);

    if (v20) {
      BOOL v21 = self->_currentDragType == 1;
    }
    else {
      BOOL v21 = 0;
    }
    id v22 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v22, "eventGestureController:dateAtPoint:", self, v10, v18);
    double v24 = v23;

    [(EKEvent *)self->_event travelTime];
    double v26 = v25;
    int64_t touchOffsetDays = self->_touchOffsetDays;
    if (touchOffsetDays <= 0 && self->_commitOffsetDays < 1)
    {
      double v32 = v24;
      double v45 = v24;
      if (v21) {
        goto LABEL_27;
      }
    }
    else
    {
      if (v21)
      {
        int v28 = -(LODWORD(self->_commitOffsetDays) + touchOffsetDays);
        uint64_t v144 = 0;
        uint64_t v143 = 0;
        int v145 = 0;
        double v29 = [v8 eventStore];
        double v30 = [v29 timeZone];
        uint64_t v141 = 0;
        int v142 = v28;
        CalAbsoluteTimeAddGregorianUnits();
        double v32 = v31;

LABEL_27:
        double v33 = (void *)MEMORY[0x1E4F57838];
        id v34 = [v8 eventStore];
        double v35 = [v34 timeZone];
        double v36 = [v33 calendarDateWithAbsoluteTime:v35 timeZone:v32];
        double v37 = [v36 calendarDateForDay];
        [v37 absoluteTime];
        double v39 = v38;

        goto LABEL_30;
      }
      id v40 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v40, "eventGestureController:dateAtPoint:", self, self->_latestTouchPoint.x, self->_latestTouchPoint.y);
      double v42 = v41;

      double v43 = [v8 startDate];
      [v43 timeIntervalSinceReferenceDate];
      double v45 = v44 + v42 - self->_dateAtFirstTouchPoint;
    }
    double v39 = CalSnapDateTo15MinuteOr5MinuteInterval(v8, [(EKEventGestureController *)self currentDragSnappingType], v45);
LABEL_30:
    [v8 duration];
    double v47 = v46;
    double v48 = [v8 endDateUnadjustedForLegacyClients];
    [v48 timeIntervalSinceReferenceDate];
    double v50 = v49;

    int currentDragType = self->_currentDragType;
    if (currentDragType)
    {
      if (currentDragType == 1)
      {
        double v52 = v24 - v26;
        if ([v8 isAllDay] ^ 1 | v21)
        {
          int v53 = [v8 isAllDay];
          double v54 = 86399.0;
          if (!v21) {
            double v54 = v47;
          }
          if (!v53) {
            double v47 = v54;
          }
        }
        else
        {
          double v47 = 3600.0;
        }
        double v61 = v39;
      }
      else
      {
        [(EKEventGestureController *)self _computeHeightForOccurrenceViewOfDuration:0 event:0 allDay:fmin(v47, 86400.0)];
        double v64 = round(v63);
        CGFloat v65 = self->_latestTouchPoint.y - self->_touchOffset.y;
        [(EKDayOccurrenceView *)self->_draggingView travelTimeSubviewHeightInPoints];
        double v67 = v64 + v65 + v66;
        id v68 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v68, "eventGestureController:dateAtPoint:", self, self->_firstTouchPoint.x, v67);
        double v70 = v69;

        double v71 = CalSnapDateTo15MinuteOr5MinuteInterval(v8, [(EKEventGestureController *)self currentDragSnappingType], v70);
        if (v71 > v39)
        {
          double v47 = v47 + v71 - v50;
          [(EKEventGestureController *)self _minimumDuration];
          if (v47 < v72)
          {
            [(EKEventGestureController *)self _minimumDuration];
            double v47 = v73;
          }
        }
        CGRect v74 = [v8 startDate];
        [v74 timeIntervalSinceReferenceDate];
        double v61 = v75;

        [(EKEvent *)self->_event travelTime];
        double v52 = v61 - v76;
      }
    }
    else
    {
      [(EKEventGestureController *)self _minimumDuration];
      double v60 = v50 - v59;
      if (v39 <= v60) {
        double v61 = v39;
      }
      else {
        double v61 = v60;
      }
      [(EKEvent *)self->_event travelTime];
      double v52 = v61 - v62;
      double v47 = v50 - v61;
      double v39 = v61;
    }
    if (self->_currentDragType != 1)
    {
      double v77 = objc_opt_class();
      [(EKDayOccurrenceView *)self->_draggingView bounds];
      objc_msgSend(v77, "contentStretchRectForFrame:");
      double v79 = v78;
      double v81 = v80;
      double v83 = v82;
      double v85 = v84;
      id v86 = [(EKDayOccurrenceView *)self->_draggingView layer];
      objc_msgSend(v86, "setContentsCenter:", v79, v81, v83, v85);

      [(EKDayOccurrenceView *)self->_draggingView setNeedsDisplay];
    }
    double v87 = fmin(v47, 86400.0);
    if (![(EKEvent *)self->_event isAllDay])
    {
      int64_t v88 = self->_touchOffsetDays;
      if (v88 >= 1 && v88 + 1 == [v8 daySpan])
      {
        v89 = (void *)MEMORY[0x1E4F57838];
        v90 = [(EKEvent *)self->_event endDateUnadjustedForLegacyClients];
        v91 = [(EKEvent *)self->_event timeZone];
        v92 = [v89 calendarDateWithDate:v90 timeZone:v91];

        [v92 absoluteTime];
        double v94 = v93;
        v95 = [v92 calendarDateForDay];
        [v95 absoluteTime];
        double v87 = v94 - v96;
      }
    }
    [(EKEventGestureController *)self _computeWidthForOccurrenceView];
    uint64_t v98 = v97;
    [v8 travelTime];
    double v99 = 0.0;
    if (v100 > 0.0)
    {
      [(EKEvent *)self->_event travelTime];
      -[EKEventGestureController _computeHeightForOccurrenceViewOfDuration:event:allDay:](self, "_computeHeightForOccurrenceViewOfDuration:event:allDay:", v8, v21);
      double v99 = v101;
    }
    [(EKEventGestureController *)self _computeHeightForOccurrenceViewOfDuration:v8 event:v21 allDay:v87];
    double v103 = v102;
    [(EKDayOccurrenceView *)self->_draggingViewSource enoughHeightForOneLine];
    if (v103 >= v104) {
      double v105 = v103;
    }
    else {
      double v105 = v104;
    }
    -[EKEventGestureController _computeOriginAtTouchPoint:forDate:isAllDay:allowXOffset:allowFloorAtRegionBottom:](self, "_computeOriginAtTouchPoint:forDate:isAllDay:allowXOffset:allowFloorAtRegionBottom:", v21, 0, 1, self->_latestTouchPoint.x, self->_latestTouchPoint.y, CalSnapDateTo15MinuteOr5MinuteInterval(self->_event, [(EKEventGestureController *)self currentDragSnappingType], v52));
    uint64_t v107 = v106;
    uint64_t v109 = v108;
    v110 = [(EKEventGestureController *)self draggingViewSource];
    [v110 travelTimeSubviewHeightInPoints];
    -[EKDayOccurrenceView setTravelTimeSubviewHeightInPoints:](self->_draggingView, "setTravelTimeSubviewHeightInPoints:");

    [v8 setAllDay:v21];
    v111 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v61];
    v112 = [v8 startDate];
    if ([v111 isEqualToDate:v112])
    {

      v113 = [(EKEventGestureController *)self draggingViewSource];
      -[EKDayOccurrenceView setIsProposedTime:](self->_draggingView, "setIsProposedTime:", [v113 isProposedTime]);

      [(EKDayOccurrenceView *)self->_draggingView requestContentIfNeeded:16 completion:0];
    }
    else
    {
      int v114 = [v8 isEditable];
      char v115 = v114;
      int v116 = v114 ^ 1;

      v117 = [(EKEventGestureController *)self draggingViewSource];
      -[EKDayOccurrenceView setIsProposedTime:](self->_draggingView, "setIsProposedTime:", [v117 isProposedTime] | v116);

      [(EKDayOccurrenceView *)self->_draggingView requestContentIfNeeded:16 completion:0];
      if ((v115 & 1) == 0)
      {
        char v127 = [v8 serverSupportedProposeNewTime];
        v137[0] = MEMORY[0x1E4F143A8];
        v137[1] = 3221225472;
        v137[2] = __35__EKEventGestureController__commit__block_invoke;
        v137[3] = &unk_1E608B2B0;
        v137[4] = self;
        id v138 = v8;
        id v139 = v111;
        char v140 = v127;
        [(EKEventGestureController *)self promptUserForProposeNewTime:v139 forEvent:v8 whenFinished:v137];

        goto LABEL_65;
      }
    }
    v118 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v61];
    [v8 setStartDate:v118];

    v119 = [v8 startDate];
    v120 = [v119 dateByAddingTimeInterval:v47];
    [v8 setEndDateUnadjustedForLegacyClients:v120];

    v121 = self->_dragSnappingFeedback;
    dragSnappingFeedback = self->_dragSnappingFeedback;
    self->_dragSnappingFeedback = 0;

    BOOL v123 = !self->_dragInteractionCancellingWithoutDragging;
    v124 = (void *)MEMORY[0x1E4FB1EB0];
    v136[0] = MEMORY[0x1E4F143A8];
    v136[1] = 3221225472;
    v136[2] = __35__EKEventGestureController__commit__block_invoke_184;
    v136[3] = &unk_1E60896F8;
    v136[5] = v107;
    v136[6] = v109;
    v136[7] = v98;
    *(double *)&v136[8] = v99 + v105;
    v136[4] = self;
    v129[0] = MEMORY[0x1E4F143A8];
    v129[1] = 3221225472;
    v129[2] = __35__EKEventGestureController__commit__block_invoke_2;
    v129[3] = &unk_1E608B300;
    BOOL v134 = v123;
    v130 = v121;
    v131 = self;
    id v132 = v8;
    double v133 = v39;
    BOOL v135 = v21;
    id v125 = v8;
    v126 = v121;
    [v124 animateWithDuration:4 delay:v136 options:v129 animations:0.1 completion:0.0];

LABEL_65:
    return;
  }
  double v7 = [MEMORY[0x1E4F28B00] currentHandler];
  [v7 handleFailureInMethod:a2, self, @"CalendarEventGestures.m", 3004, @"Gesture controller tried to commit, but with no view to drag. Cancelling instead." object file lineNumber description];

  [(EKEventGestureController *)self _cancel];
}

void __35__EKEventGestureController__commit__block_invoke(uint64_t a1, char a2)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 344));
  [WeakRetained eventGestureController:*(void *)(a1 + 32) didCancelEditingOccurrence:*(void *)(a1 + 40) fadedOut:1];

  [*(id *)(a1 + 32) removeDraggedOccurrence];
  if ((a2 & 1) == 0)
  {
    [*(id *)(a1 + 32) setEvent:0];
    if ([*(id *)(a1 + 40) participationStatus] != 2
      && [*(id *)(a1 + 40) participationStatus] != 4)
    {
      [*(id *)(a1 + 40) setInvitationStatus:0];
      [*(id *)(a1 + 40) setParticipationStatus:4];
    }
    [*(id *)(a1 + 40) setProposedStartDate:*(void *)(a1 + 48)];
    uint64_t v5 = [*(id *)(a1 + 32) delegate];
    double v6 = [v5 editorForEventGestureController:*(void *)(a1 + 32)];

    if (*(unsigned char *)(a1 + 56))
    {
      double v7 = (void *)MEMORY[0x1E4F57BA8];
      uint64_t v9 = *(void **)(a1 + 40);
      double v8 = (id *)(a1 + 40);
      double v10 = [v9 responseComment];
      CGFloat v11 = [*v8 proposedStartDate];
      double v12 = [*v8 timeZone];
      double v13 = [v7 comment:v10 withInsertedAutoCommentForDate:v11 timeZone:v12];
      [*v8 setResponseComment:v13];

      id v14 = *v8;
      id v43 = 0;
      LOBYTE(v8) = [v6 saveEvent:v14 span:0 error:&v43];
      id v15 = v43;
      if ((v8 & 1) == 0)
      {
        double v16 = kEKUILogHandle;
        if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v46 = v15;
          _os_log_impl(&dword_1B3F4C000, v16, OS_LOG_TYPE_ERROR, "Failed to save proposed time with response comment: %@", buf, 0xCu);
        }
      }
    }
    else
    {
      double v17 = EventKitUIBundle();
      id v15 = [v17 localizedStringForKey:@"NEW TIME PROPOSAL:" value:&stru_1F0CC2140 table:0];

      double v18 = NSString;
      id v19 = EventKitUIBundle();
      int v20 = [v19 localizedStringForKey:@"Can we move this event to <b>%@</b>?" value:&stru_1F0CC2140 table:0];
      BOOL v21 = (void *)MEMORY[0x1E4F576C8];
      uint64_t v22 = *(void *)(a1 + 48);
      double v23 = [*(id *)(a1 + 40) timeZone];
      double v24 = [v21 longStringForDateAndTime:v22 inTimeZone:v23];
      double v25 = objc_msgSend(v18, "localizedStringWithFormat:", v20, v24);

      double v26 = [EKUIEmailCompositionManager alloc];
      double v27 = *(void **)(a1 + 40);
      int v28 = [v27 organizer];
      double v44 = v28;
      double v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
      double v30 = [(EKUIEmailCompositionManager *)v26 initWithEvent:v27 participantRecipients:v29 subjectPrefix:v15 bodyPrefix:v25];
      [*(id *)(a1 + 32) setMessageSendingManager:v30];

      double v31 = [*(id *)(a1 + 32) messageSendingManager];
      objc_initWeak((id *)buf, v31);

      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __35__EKEventGestureController__commit__block_invoke_182;
      v39[3] = &unk_1E608B288;
      objc_copyWeak(&v42, (id *)buf);
      id v40 = *(id *)(a1 + 40);
      id v41 = v6;
      double v32 = [*(id *)(a1 + 32) messageSendingManager];
      [v32 setMessageSendingComplete:v39];

      double v33 = [*(id *)(a1 + 32) messageSendingManager];
      id v34 = [v33 viewController];
      [v34 setModalPresentationStyle:2];

      double v35 = [*(id *)(a1 + 32) delegate];
      double v36 = [v35 currentPresentationController];
      double v37 = [*(id *)(a1 + 32) messageSendingManager];
      double v38 = [v37 viewController];
      [v36 presentViewController:v38 animated:1 completion:0];

      objc_destroyWeak(&v42);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __35__EKEventGestureController__commit__block_invoke_182(uint64_t a1, char a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (a2)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v5 = *(void **)(a1 + 40);
      id v13 = 0;
      char v7 = [v5 saveEvent:v6 span:0 error:&v13];
      id v8 = v13;
      if ((v7 & 1) == 0)
      {
        uint64_t v9 = kEKUILogHandle;
        if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v15 = v8;
          _os_log_impl(&dword_1B3F4C000, v9, OS_LOG_TYPE_ERROR, "Failed to save proposed time: %@", buf, 0xCu);
        }
      }
    }
    else
    {
      double v10 = kEKUILogHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B3F4C000, v10, OS_LOG_TYPE_ERROR, "Failed to send email", buf, 2u);
      }
      [*(id *)(a1 + 32) rollback];
    }
    CGFloat v11 = [WeakRetained viewController];
    double v12 = [v11 presentingViewController];
    [v12 dismissViewControllerAnimated:1 completion:0];
  }
}

void __35__EKEventGestureController__commit__block_invoke_184(double *a1)
{
  double v2 = a1[5];
  double v3 = a1[6];
  double v4 = a1[7];
  double v5 = a1[8];
  uint64_t v6 = [*(id *)(*((void *)a1 + 4) + 56) superview];

  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*((void *)a1 + 4) + 344));
    id v8 = [WeakRetained occurrenceViewSuperviewForEventGestureController:*((void *)a1 + 4)];

    uint64_t v9 = [*(id *)(*((void *)a1 + 4) + 56) superview];
    objc_msgSend(v9, "convertRect:fromView:", v8, a1[5], a1[6], a1[7], a1[8]);
    double v2 = v10;
    double v3 = v11;
    double v4 = v12;
    double v5 = v13;
  }
  id v14 = *(void **)(*((void *)a1 + 4) + 56);
  long long v15 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v21[0] = *MEMORY[0x1E4F1DAB8];
  v21[1] = v15;
  v21[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v14 setTransform:v21];
  objc_msgSend(*(id *)(*((void *)a1 + 4) + 56), "setFrame:", v2, v3, v4, v5);
  uint64_t v16 = *((void *)a1 + 4);
  if (!*(unsigned char *)(v16 + 264))
  {
    double v17 = *MEMORY[0x1E4F1DB30];
    double v18 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    id v19 = [*(id *)(v16 + 56) layer];
    objc_msgSend(v19, "setShadowOffset:", v17, v18);

    int v20 = [*(id *)(*((void *)a1 + 4) + 56) layer];
    [v20 setShadowRadius:0.0];
  }
}

void __35__EKEventGestureController__commit__block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64)) {
    [*(id *)(a1 + 32) draggedObjectLanded];
  }
  [*(id *)(a1 + 32) userInteractionEnded];
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v2 + 200)
    || (char v3 = [*(id *)(a1 + 48) hasChanges], v2 = *(void *)(a1 + 40), (v3 & 1) != 0)
    || *(unsigned char *)(v2 + 264))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 344));
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 344));
      int v7 = [v6 eventEditorPopoverActiveWhileDraggingForEventGestureController:*(void *)(a1 + 40)] ^ 1;
    }
    else
    {
      int v7 = 1;
    }
    if ([*(id *)(a1 + 48) hasRecurrenceRules]
      && [*(id *)(a1 + 48) isAllDayDirty])
    {
      [*(id *)(a1 + 48) rollback];
      [*(id *)(a1 + 40) updateDraggingOccurrenceForced:1 animated:0];
    }
    else
    {
      id v8 = [*(id *)(a1 + 48) singleRecurrenceRule];
      if (!v8) {
        int v7 = 0;
      }

      uint64_t v9 = *(_OWORD **)(a1 + 40);
      if (v7 == 1)
      {
        double v10 = *(void **)(a1 + 48);
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __35__EKEventGestureController__commit__block_invoke_3;
        _OWORD v21[3] = &unk_1E608B2D8;
        id v11 = v10;
        uint64_t v12 = *(void *)(a1 + 40);
        id v22 = v11;
        uint64_t v23 = v12;
        uint64_t v24 = *(void *)(a1 + 56);
        char v25 = *(unsigned char *)(a1 + 65);
        [v9 promptUserForRecurrenceActionOnOccurrence:v11 whenFinished:v21];

        return;
      }
      *(_OWORD *)((char *)v9 + 88) = v9[7];
      id v13 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 344));
      char v14 = [v13 eventGestureController:*(void *)(a1 + 40) didCommitOccurrence:*(void *)(a1 + 48) toDate:*(unsigned __int8 *)(a1 + 65) isAllDay:0 span:*(double *)(a1 + 56)];

      id v15 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 344));
      objc_msgSend(v15, "eventGestureController:addViewToScroller:isAllDay:", *(void *)(a1 + 40), *(void *)(*(void *)(a1 + 40) + 56), objc_msgSend(*(id *)(a1 + 48), "isAllDay"));

      uint64_t v16 = *(void *)(a1 + 40);
      if (*(unsigned char *)(v16 + 202) && *(void *)(v16 + 176)
        || (IsCompactInViewHierarchdouble y = EKUICurrentWidthSizeClassIsCompactInViewHierarchy(*(void **)(v16 + 56)),
            uint64_t v18 = *(void *)(a1 + 40),
            IsCompactInViewHierarchy)
        && *(unsigned char *)(v18 + 200)
        || (v19 = [*(id *)(v18 + 56) isHidden], uint64_t v20 = *(void *)(a1 + 40), v19) && *(unsigned char *)(v20 + 45))
      {
        if (v14) {
          return;
        }
      }
      else
      {
        [*(id *)(v20 + 56) setDrawsResizeHandles:1];
        if (v14) {
          return;
        }
      }
    }
    uint64_t v2 = *(void *)(a1 + 40);
  }

  [(id)v2 _cancel];
}

void __35__EKEventGestureController__commit__block_invoke_3(uint64_t a1, char a2, uint64_t a3)
{
  if ((a2 & 1) == 0)
  {
    if (a3
      && [*(id *)(a1 + 32) hasRecurrenceRules]
      && [*(id *)(a1 + 32) isMainOccurrence])
    {
      char v5 = [*(id *)(a1 + 32) recurrenceRules];
      id v6 = [v5 firstObject];

      int v7 = [v6 recurrenceEnd];
      id v8 = [v7 endDate];

      if (v8)
      {
        uint64_t v9 = [*(id *)(a1 + 32) committedValueForKey:@"startDate"];
        [v9 timeIntervalSinceReferenceDate];
        double v11 = v10;

        uint64_t v12 = [*(id *)(a1 + 32) startDate];
        [v12 timeIntervalSinceReferenceDate];
        double v14 = v13;

        id v15 = [v8 dateByAddingTimeInterval:v14 - v11];
        uint64_t v16 = [MEMORY[0x1E4F255E0] recurrenceEndWithEndDate:v15];
        [v6 setRecurrenceEnd:v16];
      }
    }
    *(_OWORD *)(*(void *)(a1 + 40) + 88) = *(_OWORD *)(*(void *)(a1 + 40) + 112);
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 344));
    char v18 = [WeakRetained eventGestureController:*(void *)(a1 + 40) didCommitOccurrence:*(void *)(a1 + 32) toDate:*(unsigned __int8 *)(a1 + 56) isAllDay:a3 span:*(double *)(a1 + 48)];

    id v19 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 344));
    objc_msgSend(v19, "eventGestureController:addViewToScroller:isAllDay:", *(void *)(a1 + 40), *(void *)(*(void *)(a1 + 40) + 56), objc_msgSend(*(id *)(a1 + 32), "isAllDay"));

    uint64_t v20 = *(void *)(a1 + 40);
    if (*(unsigned char *)(v20 + 202) && *(void *)(v20 + 176))
    {
      if (v18) {
        return;
      }
    }
    else
    {
      [*(id *)(v20 + 56) setDrawsResizeHandles:1];
      if (v18) {
        return;
      }
    }
  }
  [*(id *)(a1 + 32) rollback];
  [*(id *)(a1 + 40) updateDraggingOccurrenceForced:1 animated:0];
  BOOL v21 = *(void **)(a1 + 40);

  [v21 _cancel];
}

- (void)_cancel
{
  uint64_t v9 = self->_event;
  [(EKDayOccurrenceView *)self->_draggingView alpha];
  double v4 = v3;
  if (v3 == 0.0)
  {
    char v5 = [(EKEventGestureController *)self event];
    int v6 = [v5 isNew];

    if (v6) {
      [(EKEventGestureController *)self removeDraggedOccurrence];
    }
    [(EKEventGestureController *)self setEvent:0];
  }
  else if (self->_draggingView)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "eventGestureController:addViewToScroller:isAllDay:", self, self->_draggingView, -[EKEvent isAllDay](v9, "isAllDay"));
  }
  id v8 = objc_loadWeakRetained((id *)&self->_delegate);
  [v8 eventGestureController:self didCancelEditingOccurrence:v9 fadedOut:v4 == 0.0];
}

- (BOOL)_flingOrCancelDraggingViewIfNeeded
{
  double v3 = self->_latestTouchPoint.x - self->_previousTouchPoint.x;
  double v4 = self->_latestTouchPoint.y - self->_previousTouchPoint.y;
  double v5 = sqrt(v4 * v4 + v3 * v3);
  double v6 = v5 * 0.7 / (CFAbsoluteTimeGetCurrent() - self->_previousTouchTime) + self->_previousTouchVelocity * 0.3;
  if (v6 <= 6000.0) {
    double v7 = v6;
  }
  else {
    double v7 = 6000.0;
  }
  BOOL v8 = -[EKEventGestureController _isPointInCancelRegion:](self, "_isPointInCancelRegion:", self->_latestTouchPoint.x, self->_latestTouchPoint.y);
  BOOL v9 = v8;
  if (v7 <= 1000.0)
  {
    if (!v8) {
      return 0;
    }
  }
  else if (self->_currentDragType != 1 && !v8)
  {
    return 0;
  }
  double v11 = [(EKDayOccurrenceView *)self->_draggingView occurrence];
  [(EKEvent *)self->_event duration];
  double v13 = v12;
  double v14 = (void *)MEMORY[0x1E4F57838];
  double dateAtFirstTouchPoint = self->_dateAtFirstTouchPoint;
  uint64_t v16 = [v11 eventStore];
  double v17 = [v16 timeZone];
  char v18 = [v14 calendarDateWithAbsoluteTime:v17 timeZone:dateAtFirstTouchPoint];

  if (self->_touchOffsetDays <= 0)
  {
    id v19 = [v11 startDate];
    [v19 timeIntervalSinceReferenceDate];
  }
  else
  {
    id v19 = [v18 calendarDateForDay];
    [v19 absoluteTime];
  }
  double v21 = v20;
  double v22 = fmin(v13, 86400.0);

  -[EKEventGestureController _computeOriginAtTouchPoint:forDate:isAllDay:allowXOffset:allowFloorAtRegionBottom:](self, "_computeOriginAtTouchPoint:forDate:isAllDay:allowXOffset:allowFloorAtRegionBottom:", [v11 isAllDay], 0, 0, self->_firstTouchPoint.x, self->_firstTouchPoint.y, v21);
  double v24 = v23;
  double v26 = v25;
  if (self->_currentDragType == 1)
  {
    double v27 = acos(v3 / v5);
    uint64_t v122 = 0;
    BOOL v123 = (double *)&v122;
    uint64_t v124 = 0x4010000000;
    id v125 = "";
    long long v126 = 0u;
    long long v127 = 0u;
    [(EKDayOccurrenceView *)self->_draggingView frame];
    *(void *)&long long v126 = v28;
    *((void *)&v126 + 1) = v29;
    *(void *)&long long v127 = v30;
    *((void *)&v127 + 1) = v31;
    double v32 = v7 / 20.0;
    __double2 v33 = __sincos_stret(v27);
    id v34 = v123;
    double v35 = v123[5];
    double v36 = -1.0;
    if (v4 > 0.0) {
      double v36 = 1.0;
    }
    v123[4] = v123[4] + v32 * v33.__cosval;
    void v34[5] = v35 + v32 * v33.__sinval * v36;
    double v37 = (void *)MEMORY[0x1E4F57838];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "eventGestureController:dateAtPoint:", self, self->_firstTouchPoint.x, self->_firstTouchPoint.y);
    double v40 = v39;
    id v41 = [v11 eventStore];
    id v42 = [v41 timeZone];
    id v43 = [v37 calendarDateWithAbsoluteTime:v42 timeZone:v40];

    double v44 = [v18 calendarDateForDay];
    uint64_t v45 = [v43 calendarDateForDay];
    int v46 = [v44 isEqual:v45];

    id v47 = objc_loadWeakRetained((id *)&self->_delegate);
    LOBYTE(v45) = objc_opt_respondsToSelector();

    if (v45)
    {
      id v48 = objc_loadWeakRetained((id *)&self->_delegate);
      int v49 = [v48 eventGestureController:self shouldFadeOccurrenceAfterFling:v11];
    }
    else if (v46)
    {
      if ([v11 isNew]) {
        int v49 = !self->_forcedStart;
      }
      else {
        int v49 = 0;
      }
    }
    else
    {
      int v49 = 1;
    }
    double v56 = self->_dragSnappingFeedback;
    dragSnappingFeedback = self->_dragSnappingFeedback;
    self->_dragSnappingFeedback = 0;

    if (v49)
    {
      [(EKDayOccurrenceView *)self->_draggingView setDrawsResizeHandles:0];
      double v58 = (void *)MEMORY[0x1E4FB1EB0];
      v121[0] = MEMORY[0x1E4F143A8];
      v121[1] = 3221225472;
      v121[2] = __62__EKEventGestureController__flingOrCancelDraggingViewIfNeeded__block_invoke_2;
      v121[3] = &unk_1E6089660;
      v121[4] = self;
      v121[5] = &v122;
      v119[0] = MEMORY[0x1E4F143A8];
      v119[1] = 3221225472;
      v119[2] = __62__EKEventGestureController__flingOrCancelDraggingViewIfNeeded__block_invoke_3;
      v119[3] = &unk_1E608B328;
      v119[4] = self;
      v120 = v56;
      [v58 animateWithDuration:0x20000 delay:v121 options:v119 animations:0.16 completion:0.0];
      double v59 = (id *)&v120;
    }
    else
    {
      double v60 = v123;
      double v61 = v123[4];
      double v101 = v123[5];
      double v62 = sqrt((v101 - v26) * (v101 - v26) + (v61 - v24) * (v61 - v24));
      double v63 = acos((v61 - v24) / v62);
      uint64_t v103 = *((void *)v60 + 7);
      uint64_t v104 = *((void *)v60 + 6);
      __double2 v64 = __sincos_stret(v63);
      if (v101 - v26 <= 0.0) {
        double v65 = -1.0;
      }
      else {
        double v65 = 1.0;
      }
      if (![(EKEvent *)self->_event isAllDay])
      {
        int64_t touchOffsetDays = self->_touchOffsetDays;
        if (touchOffsetDays >= 1 && touchOffsetDays + 1 == [v11 daySpan])
        {
          double v67 = (void *)MEMORY[0x1E4F57838];
          id v68 = [(EKEvent *)self->_event endDateUnadjustedForLegacyClients];
          double v69 = [(EKEvent *)self->_event timeZone];
          double v70 = [v67 calendarDateWithDate:v68 timeZone:v69];

          [v70 absoluteTime];
          double v72 = v71;
          double v73 = [v70 calendarDateForDay];
          [v73 absoluteTime];
          double v22 = v72 - v74;
        }
      }
      -[EKEventGestureController _computeHeightForOccurrenceViewOfDuration:event:allDay:](self, "_computeHeightForOccurrenceViewOfDuration:event:allDay:", v11, [v11 isAllDay], v22);
      uint64_t v76 = v75;
      double v77 = v123;
      double v78 = v123[5] + v64.__sinval * (v62 * -0.2) * v65;
      v123[4] = v123[4] + v62 * -0.2 * v64.__cosval;
      v77[5] = v78;
      id v79 = objc_loadWeakRetained((id *)&self->_delegate);
      char v80 = objc_opt_respondsToSelector();
      double v81 = v62 * -1.08;
      double v82 = v61 + v62 * -1.08 * v64.__cosval;

      if ((v80 & 1) != 0
        && (id v83 = objc_loadWeakRetained((id *)&self->_delegate),
            [v83 pageChangeMarginsForEventGestureController:self],
            double v85 = v84,
            double v87 = v86,
            v83,
            fabs(v85) < 2.22044605e-16))
      {
        uint64_t v89 = v103;
        uint64_t v88 = v104;
        double v90 = v102;
        if (fabs(v87) < 2.22044605e-16)
        {
          v123[4] = v24;
          double v82 = v24;
        }
      }
      else
      {
        uint64_t v89 = v103;
        uint64_t v88 = v104;
        double v90 = v102;
      }
      double v91 = v90 + v64.__sinval * v81 * v65;
      if (v9)
      {
        uint64_t v92 = v89;
        uint64_t v89 = v76;
        uint64_t v93 = *(void *)(MEMORY[0x1E4F1DB28] + 16);
        uint64_t v76 = *(void *)(MEMORY[0x1E4F1DB28] + 24);
        double v94 = v82;
        double v82 = v24;
        double v24 = *MEMORY[0x1E4F1DB28];
        double v95 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
        uint64_t v96 = 0x3FBEB851EB851EB8;
        double v97 = 0.192;
        double v98 = v91;
        uint64_t v99 = v88;
      }
      else
      {
        double v94 = v123[4];
        double v98 = v123[5];
        uint64_t v99 = *((void *)v123 + 6);
        uint64_t v92 = *((void *)v123 + 7);
        uint64_t v96 = 0x3FC89374BC6A7EFALL;
        double v97 = 0.16;
        double v95 = v26;
        uint64_t v93 = v88;
        double v26 = v91;
      }
      double v100 = (void *)MEMORY[0x1E4FB1EB0];
      v118[0] = MEMORY[0x1E4F143A8];
      v118[1] = 3221225472;
      v118[2] = __62__EKEventGestureController__flingOrCancelDraggingViewIfNeeded__block_invoke_4;
      v118[3] = &unk_1E60896F8;
      v118[4] = self;
      *(double *)&v118[5] = v94;
      *(double *)&v118[6] = v98;
      v118[7] = v99;
      v118[8] = v92;
      v105[0] = MEMORY[0x1E4F143A8];
      v105[1] = 3221225472;
      v105[2] = __62__EKEventGestureController__flingOrCancelDraggingViewIfNeeded__block_invoke_5;
      v105[3] = &unk_1E608B378;
      v105[4] = self;
      uint64_t v108 = v96;
      double v109 = v82;
      double v110 = v26;
      uint64_t v111 = v88;
      uint64_t v112 = v89;
      BOOL v117 = v9;
      id v106 = v11;
      double v113 = v24;
      double v114 = v95;
      uint64_t v115 = v93;
      uint64_t v116 = v76;
      uint64_t v107 = v56;
      [v100 animateWithDuration:0x20000 delay:v118 options:v105 animations:v97 completion:0.0];
      double v59 = &v106;
    }
    _Block_object_dispose(&v122, 8);
  }
  else
  {
    [(EKDayOccurrenceView *)self->_draggingView frame];
    double v51 = v50;
    -[EKEventGestureController _computeHeightForOccurrenceViewOfDuration:event:allDay:](self, "_computeHeightForOccurrenceViewOfDuration:event:allDay:", v11, [v11 isAllDay], v22);
    double v53 = v52;
    draggingView = self->_draggingView;
    uint64_t v55 = [v11 isAllDay];
    v128[0] = MEMORY[0x1E4F143A8];
    v128[1] = 3221225472;
    v128[2] = __62__EKEventGestureController__flingOrCancelDraggingViewIfNeeded__block_invoke;
    v128[3] = &unk_1E6087570;
    v128[4] = self;
    -[EKDayOccurrenceView animateToFrame:isAllDay:beginFromCurrentState:whenFinished:](draggingView, "animateToFrame:isAllDay:beginFromCurrentState:whenFinished:", v55, 0, v128, v24, v26, v51, v53);
  }

  return 1;
}

uint64_t __62__EKEventGestureController__flingOrCancelDraggingViewIfNeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancel];
}

uint64_t __62__EKEventGestureController__flingOrCancelDraggingViewIfNeeded__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "setFrame:", *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 56));
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 56);

  return [v2 setAlpha:0.0];
}

uint64_t __62__EKEventGestureController__flingOrCancelDraggingViewIfNeeded__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _cancel];
  [*(id *)(a1 + 40) draggedObjectLanded];
  uint64_t v2 = *(void **)(a1 + 40);

  return [v2 userInteractionEnded];
}

uint64_t __62__EKEventGestureController__flingOrCancelDraggingViewIfNeeded__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

void __62__EKEventGestureController__flingOrCancelDraggingViewIfNeeded__block_invoke_5(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4FB1EB0];
  double v3 = *(double *)(a1 + 56);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  long long v4 = *(_OWORD *)(a1 + 80);
  long long v14 = *(_OWORD *)(a1 + 64);
  v12[2] = __62__EKEventGestureController__flingOrCancelDraggingViewIfNeeded__block_invoke_6;
  v12[3] = &unk_1E60896F8;
  uint64_t v13 = *(void *)(a1 + 32);
  long long v15 = v4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__EKEventGestureController__flingOrCancelDraggingViewIfNeeded__block_invoke_7;
  void v6[3] = &unk_1E608B350;
  char v11 = *(unsigned char *)(a1 + 128);
  v6[4] = v13;
  id v7 = *(id *)(a1 + 40);
  long long v5 = *(_OWORD *)(a1 + 112);
  long long v9 = *(_OWORD *)(a1 + 96);
  long long v10 = v5;
  id v8 = *(id *)(a1 + 48);
  [v2 animateWithDuration:0 delay:v12 options:v6 animations:v3 completion:0.0];
}

uint64_t __62__EKEventGestureController__flingOrCancelDraggingViewIfNeeded__block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

void __62__EKEventGestureController__flingOrCancelDraggingViewIfNeeded__block_invoke_7(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 88);
  uint64_t v3 = *(void *)(a1 + 32);
  if (v2)
  {
    if (!*(unsigned char *)(v3 + 202) || !*(void *)(v3 + 176))
    {
      [*(id *)(v3 + 56) setDrawsResizeHandles:1];
      uint64_t v3 = *(void *)(a1 + 32);
    }
    [(id)v3 _cancel];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v3 + 344));
    objc_msgSend(WeakRetained, "eventGestureController:adjustDraggingView:forAllDay:", *(void *)(a1 + 32), *(void *)(*(void *)(a1 + 32) + 56), objc_msgSend(*(id *)(a1 + 40), "isAllDay"));

    long long v5 = *(void **)(*(void *)(a1 + 32) + 56);
    uint64_t v6 = [*(id *)(a1 + 40) isAllDay];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __62__EKEventGestureController__flingOrCancelDraggingViewIfNeeded__block_invoke_8;
    v7[3] = &unk_1E6087D68;
    v7[4] = *(void *)(a1 + 32);
    id v8 = *(id *)(a1 + 48);
    objc_msgSend(v5, "animateToFrame:isAllDay:beginFromCurrentState:whenFinished:", v6, 0, v7, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  }
}

uint64_t __62__EKEventGestureController__flingOrCancelDraggingViewIfNeeded__block_invoke_8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 202) || !*(void *)(v2 + 176))
  {
    [*(id *)(v2 + 56) setDrawsResizeHandles:1];
    uint64_t v2 = *(void *)(a1 + 32);
  }
  [(id)v2 _cancel];
  [*(id *)(a1 + 40) draggedObjectLanded];
  uint64_t v3 = *(void **)(a1 + 40);

  return [v3 userInteractionEnded];
}

- (double)_allDayBottomPadding
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetView);
  IsRegularInViewHierarchdouble y = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(WeakRetained);

  double result = 3.0;
  if (IsRegularInViewHierarchy) {
    return 4.0;
  }
  return result;
}

- (double)_alignedYOriginForAllDayOccurrence:(id)a3 atPoint:(CGPoint)a4 floorAtAllDayRegionBottom:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a4.y;
  double x = a4.x;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "eventGestureController:yPositionPerhapsMatchingAllDayOccurrence:atPoint:", self, v9, x, y);
  double v12 = v11;

  if (v5)
  {
    id v13 = objc_loadWeakRetained((id *)&self->_delegate);
    [v13 timedRegionOriginForEventGestureController:self];
    double v15 = v14;

    [(EKEventGestureController *)self _computeHeightForOccurrenceViewOfDuration:v9 event:1 allDay:3600.0];
    double v17 = v16;
    double v18 = v12 + v16;
    [(EKEventGestureController *)self _allDayBottomPadding];
    if (v18 + v19 >= v15)
    {
      [(EKEventGestureController *)self _allDayBottomPadding];
      double v12 = v15 - v17 - v20;
    }
  }

  return v12;
}

- (double)_capOccurrenceViewYOrigin:(double)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v6 = [WeakRetained touchTrackingViewForEventGestureController:self];

  [(EKEventGestureController *)self _minimumDuration];
  -[EKEventGestureController _computeHeightForOccurrenceViewOfDuration:event:allDay:](self, "_computeHeightForOccurrenceViewOfDuration:event:allDay:", 0, 0);
  double v8 = v7;
  [v6 frame];
  double v10 = round(v9 - v8);
  if (v10 <= a3) {
    a3 = v10;
  }

  return a3;
}

- (void)_updateHorizontalDragLockForPoint:(CGPoint)a3
{
  double y = self->_firstTouchPoint.y;
  if (vabdd_f64(a3.y, y) <= 20.0)
  {
    if (!self->_dragLockDisabled) {
      self->_horizontalDragLocked = atan(fabs((a3.y - y) / (a3.x - self->_firstTouchPoint.x))) < 0.174532925;
    }
  }
  else
  {
    *(_WORD *)&self->_horizontalDragLocked = 256;
  }
}

- (double)_computeWidthForOccurrenceView
{
  if ([(EKEvent *)self->_event isAllDay]
    && ![(EKEventGestureController *)self splitMultiDays])
  {
    int64_t v3 = [(EKEvent *)self->_event daySpan];
  }
  else
  {
    int64_t v3 = 1;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained eventGestureController:self widthForOccurrenceViewOfDays:v3];
  double v6 = v5;

  [(EKDayOccurrenceView *)self->_draggingView margin];
  double v8 = v6 - v7;
  [(EKDayOccurrenceView *)self->_draggingView margin];
  return v8 - v9;
}

- (double)_computeHeightForOccurrenceViewOfDuration:(double)a3 event:(id)a4 allDay:(BOOL)a5
{
  BOOL v5 = a5;
  v25[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  double v9 = v8;
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    double v11 = [WeakRetained eventGestureController:self occurrenceViewForOccurrence:v9 occurrenceDate:0];

    id v12 = objc_loadWeakRetained((id *)&self->_delegate);
    [v12 eventGestureController:self heightForAllDayOccurrenceView:v11];
    double v14 = v13;
  }
  else if ([v8 isIntegrationEvent])
  {
    v25[0] = v9;
    double v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    id v16 = objc_loadWeakRetained((id *)&self->_targetView);
    +[EKDayOccurrenceView enoughHeightForOneLineForEvents:v15 usingSmallText:0 sizeClass:EKUIWidthSizeClassForViewHierarchy(v16)];
    double v14 = v17;
  }
  else
  {
    id v18 = objc_loadWeakRetained((id *)&self->_delegate);
    [v18 eventGestureController:self heightForOccurrenceViewOfDuration:a3];
    double v20 = v19;

    [(EKDayOccurrenceView *)self->_draggingView margin];
    double v22 = v20 - v21;
    [(EKDayOccurrenceView *)self->_draggingView margin];
    double v14 = v22 - v23;
  }

  return v14;
}

- (CGPoint)_computeOriginAtTouchPoint:(CGPoint)a3 forDate:(double)a4 isAllDay:(BOOL)a5 allowXOffset:(BOOL)a6 allowFloorAtRegionBottom:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  double y = a3.y;
  double x = a3.x;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v16 = [WeakRetained occurrenceViewSuperviewForEventGestureController:self];

  id v17 = objc_loadWeakRetained((id *)p_delegate);
  id v18 = [v17 touchTrackingViewForEventGestureController:self];

  id v19 = objc_loadWeakRetained((id *)p_delegate);
  [v19 eventGestureController:self widthForOccurrenceViewOfDays:1];
  double v21 = v20;

  id v22 = objc_loadWeakRetained((id *)p_delegate);
  [v22 eventGestureController:self pointAtDate:v9 isAllDay:a4];
  double v25 = CalRoundPointToScreenScale(v23, v24);
  double v27 = v26;

  id v28 = objc_loadWeakRetained((id *)p_delegate);
  if (objc_opt_respondsToSelector())
  {
    id v29 = objc_loadWeakRetained((id *)p_delegate);
    int v30 = [v29 moreThanOneDayVisibleForEventGestureController:self];
  }
  else
  {
    int v30 = 0;
  }

  uint64_t v31 = [(EKDayOccurrenceView *)self->_draggingView occurrence];
  if (!v9)
  {
    -[EKEventGestureController _updateHorizontalDragLockForPoint:](self, "_updateHorizontalDragLockForPoint:", self->_latestTouchPoint.x, self->_latestTouchPoint.y);
    if (self->_horizontalDragLocked && !self->_dragLockDisabled)
    {
      double v27 = self->_firstTouchPoint.y - self->_touchOffset.y;
      if (!v7) {
        goto LABEL_12;
      }
    }
    else if (!v7)
    {
LABEL_12:
      if (self->_touchOffsetDays >= 1 && ([v31 isAllDay] & 1) == 0)
      {
        id v35 = objc_loadWeakRetained((id *)p_delegate);
        objc_msgSend(v35, "eventGestureController:dateAtPoint:", self, x, y);
        double v37 = v36;

        double v38 = (void *)MEMORY[0x1E4F57838];
        double v39 = [(EKEvent *)self->_event eventStore];
        double v40 = [v39 timeZone];
        id v41 = [v38 calendarDateWithAbsoluteTime:v40 timeZone:v37];
        [v41 calendarDateForDay];
        uint64_t v88 = v18;
        id v42 = v16;
        v44 = BOOL v43 = v8;

        id v45 = objc_loadWeakRetained((id *)p_delegate);
        [v44 absoluteTime];
        objc_msgSend(v45, "eventGestureController:pointAtDate:isAllDay:", self, 0);
        double v25 = CalRoundPointToScreenScale(v46, v47);

        BOOL v8 = v43;
        id v16 = v42;
        id v18 = v88;
      }
      goto LABEL_23;
    }
    [(EKEventGestureController *)self _capOccurrenceViewYOrigin:v27];
    double v27 = v34;
    goto LABEL_12;
  }
  -[EKEventGestureController _alignedYOriginForAllDayOccurrence:atPoint:floorAtAllDayRegionBottom:](self, "_alignedYOriginForAllDayOccurrence:atPoint:floorAtAllDayRegionBottom:", self->_event, v7, x, y);
  double v27 = v32;
  if (v8 && ([v31 isAllDay] & v30) == 1)
  {
    double touchOffsetDays = (double)self->_touchOffsetDays;
  }
  else
  {
    int64_t v48 = self->_touchOffsetDays;
    if (v48 > 0) {
      int v49 = v30;
    }
    else {
      int v49 = 0;
    }
    if (v49 != 1) {
      goto LABEL_23;
    }
    double touchOffsetDays = (double)v48;
  }
  double v50 = v21 * touchOffsetDays;
  int IsLeftToRight = CalTimeDirectionIsLeftToRight();
  double v52 = 1.0;
  if (IsLeftToRight) {
    double v52 = -1.0;
  }
  double v25 = v25 + v50 * v52;
LABEL_23:
  if (-[EKEventGestureController _isPointInCancelRegion:](self, "_isPointInCancelRegion:", x, y)
    && self->_currentDragType == 1)
  {
    if (self->_draggingView && [(UILongPressGestureRecognizer *)self->_draggingGestureRecognizer state])
    {
      BOOL v53 = v8;
      double v54 = self->_touchOffset.y;
      id v55 = objc_loadWeakRetained((id *)p_delegate);
      uint64_t v56 = objc_msgSend(v55, "eventGestureController:isAllDayAtPoint:requireInsistence:", self, -[EKDayOccurrenceView isAllDay](self->_draggingView, "isAllDay") ^ 1, self->_firstTouchPoint.x, self->_firstTouchPoint.y);

      if (v56 == v9)
      {
        BOOL v8 = v53;
      }
      else
      {
        [(EKEvent *)self->_event duration];
        double v58 = fmin(v57, 86400.0);
        if (![(EKEvent *)self->_event isAllDay])
        {
          int64_t v59 = self->_touchOffsetDays;
          if (v59 >= 1 && v59 + 1 == [(EKEvent *)self->_event daySpan])
          {
            uint64_t v89 = (void *)MEMORY[0x1E4F57838];
            double v87 = [(EKEvent *)self->_event endDateUnadjustedForLegacyClients];
            double v60 = [(EKEvent *)self->_event timeZone];
            double v61 = [v89 calendarDateWithDate:v87 timeZone:v60];

            [v61 absoluteTime];
            double v63 = v62;
            __double2 v64 = [v61 calendarDateForDay];
            [v64 absoluteTime];
            double v58 = v63 - v65;
          }
        }
        [(EKEventGestureController *)self _computeHeightForOccurrenceViewOfDuration:self->_event event:v56 allDay:fmin(v58, 86400.0)];
        double v67 = v66;
        if (v56) {
          double v68 = 3600.0;
        }
        else {
          [(EKEvent *)self->_event duration];
        }
        BOOL v8 = v53;
        [(EKEventGestureController *)self _computeHeightForOccurrenceViewOfDuration:self->_event event:v9 allDay:v68];
        double v54 = v54 * (v86 / v67);
      }
      int v69 = 0;
      double v27 = y - v54;
    }
    else
    {
      int v69 = 0;
    }
  }
  else
  {
    int v69 = 1;
  }
  if (v8)
  {
    id v70 = objc_loadWeakRetained((id *)p_delegate);
    int v71 = objc_opt_respondsToSelector();

    BOOL v72 = ((v69 | v71 ^ 1) & 1) == 0
       && [(EKEventGestureController *)self usesXDragOffsetInCancelRegion];
    if (((v71 ^ 1 | v72) & 1) == 0)
    {
      id v81 = objc_loadWeakRetained((id *)p_delegate);
      [v81 computeXDragOffsetForEventGestureController:self currentX:x startX:self->_firstTouchPoint.x];
      double v83 = v82;
      int v84 = CalTimeDirectionIsLeftToRight();
      double v85 = -1.0;
      if (v84) {
        double v85 = 1.0;
      }
      double v25 = v25 + v83 * v85;

      if (!v9) {
        goto LABEL_42;
      }
      goto LABEL_43;
    }
    double v25 = x - self->_touchOffset.x;
  }
  if (!v9)
  {
LABEL_42:
    [(EKDayOccurrenceView *)self->_draggingView margin];
    double v25 = v25 + v73;
    [(EKDayOccurrenceView *)self->_draggingView margin];
    double v27 = v27 + v74;
  }
LABEL_43:
  objc_msgSend(v18, "convertPoint:toView:", v16, v25, v27);
  double v76 = v75;
  double v78 = v77;

  double v79 = v76;
  double v80 = v78;
  result.double y = v80;
  result.double x = v79;
  return result;
}

- (double)_cancelRegionMargin
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetView);
  IsRegularInViewHierarchdouble y = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(WeakRetained);

  double result = 5.0;
  if (IsRegularInViewHierarchy) {
    return 4.0;
  }
  return result;
}

- (BOOL)_isPointInCancelRegion:(CGPoint)a3
{
  double y = a3.y;
  long long v4 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v6 = [WeakRetained touchTrackingViewForEventGestureController:v4];

  [v6 frame];
  double v8 = v7;
  [(EKEventGestureController *)v4 _cancelRegionMargin];
  LOBYTE(v4) = y > v9 + v8;

  return (char)v4;
}

- (double)_Debug_HoursSinceStartOfDay:(double)a3
{
  long long v4 = (void *)MEMORY[0x1E4F57838];
  BOOL v5 = [(EKEvent *)self->_event eventStore];
  double v6 = [v5 timeZone];
  double v7 = [v4 calendarDateWithAbsoluteTime:v6 timeZone:a3];
  double v8 = [v7 calendarDateForDay];
  [v8 absoluteTime];
  double v10 = (a3 - v9) / 3600.0;

  return v10;
}

- (int)currentDragSnappingType
{
  return self->_snappingTypeForCurrentDrag;
}

- (void)_updateSnappingTypeForCurrentDrag
{
  self->_snappingTypeForCurrentDrag = 0;
  int64_t v3 = [MEMORY[0x1E4F57710] shared];
  [v3 defaultEventDuration];
  double v5 = v4;

  if (fabs(v5 + -3300.0) >= 2.22044605e-16 && fabs(v5 + -3000.0) >= 2.22044605e-16)
  {
    if (fabs(v5 + -1500.0) >= 2.22044605e-16) {
      return;
    }
    int v6 = 2;
  }
  else
  {
    int v6 = 1;
  }
  if (self->_currentDragType == 2) {
    int v6 = 3;
  }
  self->_snappingTypeForCurrentDrag = v6;
}

- (EKEventGestureControllerUntimedDelegate)untimedDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_untimedDelegate);

  return (EKEventGestureControllerUntimedDelegate *)WeakRetained;
}

- (void)setUntimedDelegate:(id)a3
{
}

- (EKEventGestureControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EKEventGestureControllerDelegate *)WeakRetained;
}

- (BOOL)usesXDragOffsetInCancelRegion
{
  return self->_usesXDragOffsetInCancelRegion;
}

- (void)setUsesXDragOffsetInCancelRegion:(BOOL)a3
{
  self->_usesXDragOffsetInCancelRegion = a3;
}

- (BOOL)usesHorizontalDragLocking
{
  return self->_usesHorizontalDragLocking;
}

- (BOOL)commitBlocked
{
  return self->_commitBlocked;
}

- (EKEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
}

- (int64_t)occurrenceDateIndex
{
  return self->_occurrenceDateIndex;
}

- (CGPoint)firstTouchPoint
{
  double x = self->_firstTouchPoint.x;
  double y = self->_firstTouchPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)latestTouchPoint
{
  double x = self->_latestTouchPoint.x;
  double y = self->_latestTouchPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)touchOffset
{
  double x = self->_touchOffset.x;
  double y = self->_touchOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (NSString)sessionIdentifierForDebug
{
  return self->_sessionIdentifierForDebug;
}

- (void)setSessionIdentifierForDebug:(id)a3
{
}

- (EKDayOccurrenceView)draggingViewSource
{
  return self->_draggingViewSource;
}

- (void)setDraggingViewSource:(id)a3
{
}

- (EKUIEmailCompositionManager)messageSendingManager
{
  return self->_messageSendingManager;
}

- (void)setMessageSendingManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageSendingManager, 0);
  objc_storeStrong((id *)&self->_draggingViewSource, 0);
  objc_storeStrong((id *)&self->_sessionIdentifierForDebug, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_untimedDelegate);
  objc_storeStrong((id *)&self->_multiSelectGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_dragInteraction, 0);
  objc_storeStrong((id *)&self->_dropInteraction, 0);
  objc_storeStrong((id *)&self->_currentICSPreviewController, 0);
  objc_storeStrong((id *)&self->_dragSnappingFeedback, 0);
  objc_storeStrong((id *)&self->_recurrenceAlertController, 0);
  objc_storeStrong((id *)&self->_scrollTimer, 0);
  objc_storeStrong((id *)&self->_currentDay, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_draggingView, 0);
  objc_destroyWeak((id *)&self->_targetView);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);

  objc_storeStrong((id *)&self->_draggingGestureRecognizer, 0);
}

@end