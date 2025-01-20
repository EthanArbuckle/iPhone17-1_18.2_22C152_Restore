@interface EKDayViewContentItem
+ (double)barToBarHorizontalDistanceIncludingBarWidth;
- (BOOL)hasPrecedingDuration;
- (BOOL)hasTrailingDuration;
- (BOOL)hideTravelTime;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLoadingAsync;
- (BOOL)isPinned;
- (BOOL)isProposedTime;
- (BOOL)occurrenceIsFirstVisibleDayOfEvent;
- (BOOL)usesSmallText;
- (BOOL)visibleHeightLocked;
- (CGRect)stagedFrame;
- (CGRect)unPinnedViewFrame;
- (CUIKOROccurrenceState)currentState;
- (EKCalendarDate)endDate;
- (EKCalendarDate)startDate;
- (EKCalendarDate)startDateIncludingTravelTime;
- (EKDayOccurrenceView)view;
- (EKDayViewContentItem)initWithEventIndex:(unint64_t)a3 sizeClass:(int64_t)a4;
- (EKEvent)event;
- (NSArray)events;
- (NSDate)end;
- (NSDate)start;
- (NSDate)startWithTravelTime;
- (NSString)description;
- (NSString)eventIdentifier;
- (double)bottomPinningProximity;
- (double)enoughHeightForOneLine;
- (double)topPinningProximity;
- (double)travelTime;
- (double)travelTimeHeight;
- (double)viewMaxNaturalTextHeight;
- (double)visibleHeight;
- (int64_t)occurrenceDateIndex;
- (unint64_t)eventIndex;
- (void)_requestPayloadAnimated:(BOOL)a3 drawSynchronously:(BOOL)a4;
- (void)_updateWithPayload:(id)a3;
- (void)resetVisibleHeight;
- (void)setBottomPinningProximity:(double)a3;
- (void)setEndDate:(id)a3;
- (void)setEvent:(id)a3;
- (void)setEvents:(id)a3;
- (void)setHasPrecedingDuration:(BOOL)a3;
- (void)setHasTrailingDuration:(BOOL)a3;
- (void)setIsLoadingAsync:(BOOL)a3;
- (void)setIsProposedTime:(BOOL)a3;
- (void)setOccurrenceDateIndex:(int64_t)a3;
- (void)setOccurrenceIsFirstVisibleDayOfEvent:(BOOL)a3;
- (void)setStagedFrame:(CGRect)a3;
- (void)setStartDate:(id)a3;
- (void)setTopPinningProximity:(double)a3;
- (void)setTravelTime:(double)a3;
- (void)setTravelTimeHeight:(double)a3;
- (void)setUnPinnedViewFrame:(CGRect)a3;
- (void)setUsesSmallText:(BOOL)a3;
- (void)setView:(id)a3;
- (void)setVisibleHeight:(double)a3;
@end

@implementation EKDayViewContentItem

- (BOOL)hideTravelTime
{
  return 0;
}

- (CGRect)stagedFrame
{
  double x = self->_stagedFrame.origin.x;
  double y = self->_stagedFrame.origin.y;
  double width = self->_stagedFrame.size.width;
  double height = self->_stagedFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)visibleHeight
{
  return self->_visibleHeight;
}

- (void)setUnPinnedViewFrame:(CGRect)a3
{
  self->_unPinnedViewFrame = a3;
}

- (NSDate)start
{
  v2 = [(EKDayViewContentItem *)self startDate];
  v3 = [v2 date];

  return (NSDate *)v3;
}

- (NSDate)startWithTravelTime
{
  v2 = [(EKDayViewContentItem *)self startDateIncludingTravelTime];
  v3 = [v2 date];

  return (NSDate *)v3;
}

- (EKCalendarDate)startDateIncludingTravelTime
{
  v3 = (void *)MEMORY[0x1E4F57838];
  v4 = [(EKDayViewContentItem *)self startDate];
  [v4 absoluteTime];
  double v6 = v5;
  [(EKDayViewContentItem *)self travelTime];
  double v8 = v6 - v7;
  v9 = [(EKDayViewContentItem *)self startDate];
  v10 = [v9 timeZone];
  v11 = [v3 calendarDateWithAbsoluteTime:v10 timeZone:v8];

  return (EKCalendarDate *)v11;
}

- (EKCalendarDate)startDate
{
  return self->_startDate;
}

- (double)travelTime
{
  return self->_travelTime;
}

- (NSDate)end
{
  v2 = [(EKDayViewContentItem *)self endDate];
  v3 = [v2 date];

  return (NSDate *)v3;
}

- (EKCalendarDate)endDate
{
  return self->_endDate;
}

- (void)setUsesSmallText:(BOOL)a3
{
  self->_usesSmallText = a3;
}

- (void)setTravelTime:(double)a3
{
  self->_travelTime = a3;
}

- (void)setStartDate:(id)a3
{
}

- (void)setOccurrenceIsFirstVisibleDayOfEvent:(BOOL)a3
{
  self->_occurrenceIsFirstVisibleDayOfEvent = a3;
}

- (void)setOccurrenceDateIndex:(int64_t)a3
{
  self->_occurrenceDateIndedouble x = a3;
}

- (void)setIsProposedTime:(BOOL)a3
{
  self->_isProposedTime = a3;
}

- (void)setHasTrailingDuration:(BOOL)a3
{
  self->_hasTrailingDuration = a3;
}

- (void)setHasPrecedingDuration:(BOOL)a3
{
  self->_hasPrecedingDuration = a3;
}

- (void)setEvent:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_event, a3);
  if (v5)
  {
    v8[0] = v5;
    double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    events = self->_events;
    self->_events = v6;
  }
  else
  {
    events = self->_events;
    self->_events = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
}

- (void)setEndDate:(id)a3
{
}

- (EKDayViewContentItem)initWithEventIndex:(unint64_t)a3 sizeClass:(int64_t)a4
{
  v13.receiver = self;
  v13.super_class = (Class)EKDayViewContentItem;
  double v6 = [(EKDayViewContentItem *)&v13 init];
  double v7 = (EKDayViewContentItem *)v6;
  if (v6)
  {
    long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    *(_OWORD *)(v6 + 40) = *MEMORY[0x1E4F1DB20];
    *(_OWORD *)(v6 + 56) = v8;
    long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
    *(_OWORD *)(v6 + 8) = *MEMORY[0x1E4F1DB28];
    *((void *)v6 + 19) = a3;
    *(_OWORD *)(v6 + 24) = v9;
    *((void *)v6 + 9) = 0x7FEFFFFFFFFFFFFFLL;
    *((void *)v6 + 12) = a4;
    *((void *)v6 + 13) = -1;
    v10 = (CUIKOROccurrenceState *)objc_alloc_init(MEMORY[0x1E4F57BC0]);
    currentState = v7->_currentState;
    v7->_currentState = v10;
  }
  return v7;
}

- (CGRect)unPinnedViewFrame
{
  double x = self->_unPinnedViewFrame.origin.x;
  double y = self->_unPinnedViewFrame.origin.y;
  double width = self->_unPinnedViewFrame.size.width;
  double height = self->_unPinnedViewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setIsLoadingAsync:(BOOL)a3
{
  self->_isLoadingAsync = a3;
}

- (double)enoughHeightForOneLine
{
  v3 = [(EKDayViewContentItem *)self events];
  +[EKDayOccurrenceView enoughHeightForOneLineForEvents:v3 usingSmallText:[(EKDayViewContentItem *)self usesSmallText] sizeClass:self->_sizeClass];
  double v5 = v4;

  double v6 = [(EKDayViewContentItem *)self currentState];
  int v7 = [v6 reminderStackDepth];

  return v5 + (double)(v7 - 1) * 2.0;
}

- (CUIKOROccurrenceState)currentState
{
  return self->_currentState;
}

- (void)_requestPayloadAnimated:(BOOL)a3 drawSynchronously:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  int v7 = [MEMORY[0x1E4F57BC8] sharedProvider];
  long long v8 = v7;
  if ((self->_currentRequestId & 0x8000000000000000) == 0)
  {
    objc_msgSend(v7, "cancelRequest:");
    self->_currentRequestId = -1;
  }
  long long v9 = [(EKDayViewContentItem *)self currentState];
  [v9 travelTime];
  uint64_t v10 = 3;
  if (v11 > 0.0) {
    uint64_t v10 = 7;
  }
  if (v5) {
    v10 |= 8uLL;
  }
  if (v4) {
    uint64_t v12 = v10 | 0x10;
  }
  else {
    uint64_t v12 = v10;
  }
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__EKDayViewContentItem__requestPayloadAnimated_drawSynchronously___block_invoke;
  v14[3] = &unk_1E6087648;
  objc_copyWeak(&v15, &location);
  int64_t v13 = [v8 requestPayloadForState:v9 requestOptions:v12 resultHandler:v14];
  if ((v13 & 0x8000000000000000) == 0) {
    self->_currentRequestId = v13;
  }
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (BOOL)isProposedTime
{
  return self->_isProposedTime;
}

- (NSArray)events
{
  return self->_events;
}

- (BOOL)occurrenceIsFirstVisibleDayOfEvent
{
  return self->_occurrenceIsFirstVisibleDayOfEvent;
}

- (BOOL)hasPrecedingDuration
{
  return self->_hasPrecedingDuration;
}

- (double)viewMaxNaturalTextHeight
{
  if ([(EKDayViewContentItem *)self isLoadingAsync]
    || ([(EKDayViewContentItem *)self view],
        v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        !v3))
  {
    BOOL v4 = [(EKDayViewContentItem *)self event];
    +[EKDayOccurrenceView minNaturalTextHeightForEvent:v4 usingSmallText:[(EKDayViewContentItem *)self usesSmallText] sizeClass:self->_sizeClass];
    double v6 = v7 + self->_travelTimeHeight;
  }
  else
  {
    BOOL v4 = [(EKDayViewContentItem *)self view];
    [v4 viewMaxNaturalTextHeight];
    double v6 = v5;
  }

  return v6;
}

- (EKEvent)event
{
  return self->_event;
}

- (BOOL)usesSmallText
{
  return self->_usesSmallText;
}

- (int64_t)occurrenceDateIndex
{
  return self->_occurrenceDateIndex;
}

- (BOOL)hasTrailingDuration
{
  return self->_hasTrailingDuration;
}

- (void)setTopPinningProximity:(double)a3
{
  self->_topPinningProximitdouble y = a3;
  if (![(EKDayViewContentItem *)self isLoadingAsync])
  {
    BOOL v4 = [(EKDayViewContentItem *)self view];

    if (v4)
    {
      topPinningProximitdouble y = self->_topPinningProximity;
      id v6 = [(EKDayViewContentItem *)self view];
      [v6 setTopPinningProximity:topPinningProximity];
    }
  }
}

- (void)setView:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_view, a3);
  [v7 setTopPinningProximity:self->_topPinningProximity];
  [v7 setBottomPinningProximity:self->_bottomPinningProximity];
  if (!CGRectIsEmpty(self->_stagedFrame)) {
    objc_msgSend(v7, "setFrame:", self->_stagedFrame.origin.x, self->_stagedFrame.origin.y, self->_stagedFrame.size.width, self->_stagedFrame.size.height);
  }
  [v7 setVisibleHeight:self->_visibleHeight];
  [v7 setTravelTimeSubviewHeightInPoints:self->_travelTimeHeight];
  if (self->_stagedPayload)
  {
    double v5 = [v7 currentImageState];
    [v5 performChangesWithState:self->_currentState];

    [v7 forceUpdateContentWithPayload:self->_stagedPayload];
    stagedPayload = self->_stagedPayload;
    self->_stagedPayload = 0;
  }
}

- (void)setBottomPinningProximity:(double)a3
{
  self->_bottomPinningProximitdouble y = a3;
  if (![(EKDayViewContentItem *)self isLoadingAsync])
  {
    double v5 = [(EKDayViewContentItem *)self view];

    if (v5)
    {
      id v6 = [(EKDayViewContentItem *)self view];
      [v6 setBottomPinningProximity:a3];
    }
  }
}

- (void)setStagedFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(EKDayViewContentItem *)self resetVisibleHeight];
  self->_stagedFrame.origin.double x = x;
  self->_stagedFrame.origin.double y = y;
  self->_stagedFrame.size.double width = width;
  self->_stagedFrame.size.double height = height;
  uint64_t v10 = [(EKDayViewContentItem *)self view];
  BOOL v8 = [(EKDayViewContentItem *)self isLoadingAsync];
  long long v9 = v10;
  if (!v8 && v10)
  {
    objc_msgSend(v10, "setFrame:", x, y, width, height);
    long long v9 = v10;
  }
}

- (EKDayOccurrenceView)view
{
  return self->_view;
}

- (BOOL)isLoadingAsync
{
  return self->_isLoadingAsync;
}

- (void)resetVisibleHeight
{
  self->_visibleHeight = 1.79769313e308;
  self->_visibleHeightLocked = 0;
}

void __66__EKDayViewContentItem__requestPayloadAnimated_drawSynchronously___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _updateWithPayload:v3];
}

- (void)_updateWithPayload:(id)a3
{
  id v11 = a3;
  char v5 = [v11 requestOptions];
  int64_t currentRequestId = self->_currentRequestId;
  uint64_t v7 = [v11 requestId];
  if ((v5 & 0x10) != 0 || currentRequestId == v7)
  {
    BOOL v8 = [(EKDayViewContentItem *)self view];
    long long v9 = v8;
    if (v8)
    {
      uint64_t v10 = [v8 currentImageState];
      [v10 performChangesWithState:self->_currentState];

      [v9 forceUpdateContentWithPayload:v11];
    }
    else
    {
      objc_storeStrong((id *)&self->_stagedPayload, a3);
    }
    self->_int64_t currentRequestId = -1;
  }
}

- (double)travelTimeHeight
{
  if ([(EKDayViewContentItem *)self isLoadingAsync]) {
    return self->_travelTimeHeight;
  }
  BOOL v4 = [(EKDayViewContentItem *)self view];
  if (v4)
  {
    char v5 = [(EKDayViewContentItem *)self view];
    [v5 travelTimeSubviewHeightInPoints];
    double travelTimeHeight = v6;
  }
  else
  {
    double travelTimeHeight = self->_travelTimeHeight;
  }

  return travelTimeHeight;
}

- (void)setTravelTimeHeight:(double)a3
{
  if ([(EKDayViewContentItem *)self isLoadingAsync]
    || ([(EKDayViewContentItem *)self view],
        char v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    self->_double travelTimeHeight = a3;
  }
  else
  {
    id v6 = [(EKDayViewContentItem *)self view];
    [v6 setTravelTimeSubviewHeightInPoints:a3];
  }
}

- (BOOL)isPinned
{
  return self->_topPinningProximity >= 1.0 || self->_bottomPinningProximity >= 1.0;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (EKDayViewContentItem *)a3;
  if (self == v4)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v5 = v4;
      if (self->_eventIndex == v5->_eventIndex
        && (NSUInteger v6 = [(NSArray *)self->_events count], v6 == [(NSArray *)v5->_events count]))
      {
        if ([(NSArray *)self->_events count] < 2)
        {
          event = self->_event;
          if ((unint64_t)event | (unint64_t)v5->_event) {
            char v13 = -[EKEvent isEqual:](event, "isEqual:");
          }
          else {
            char v13 = 1;
          }
        }
        else
        {
          uint64_t v7 = [MEMORY[0x1E4F1CAD0] setWithArray:self->_events];
          long long v16 = 0u;
          long long v17 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          BOOL v8 = v5->_events;
          uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v9)
          {
            uint64_t v10 = v9;
            uint64_t v11 = *(void *)v17;
            while (2)
            {
              for (uint64_t i = 0; i != v10; ++i)
              {
                if (*(void *)v17 != v11) {
                  objc_enumerationMutation(v8);
                }
                if (!objc_msgSend(v7, "containsObject:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16))
                {
                  char v13 = 0;
                  goto LABEL_23;
                }
              }
              uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
              if (v10) {
                continue;
              }
              break;
            }
          }
          char v13 = 1;
LABEL_23:
        }
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }

  return v13;
}

- (void)setEvents:(id)a3
{
  BOOL v4 = [a3 sortedArrayUsingFunction:MEMORY[0x1E4F57A80] context:0];
  events = self->_events;
  self->_events = v4;

  NSUInteger v6 = [(NSArray *)self->_events firstObject];
  event = self->_event;
  self->_event = v6;
}

- (NSString)description
{
  v12.receiver = self;
  v12.super_class = (Class)EKDayViewContentItem;
  id v3 = [(EKDayViewContentItem *)&v12 description];
  BOOL v4 = NSString;
  char v5 = [(EKDayViewContentItem *)self event];
  NSUInteger v6 = [v5 title];
  uint64_t v7 = [(EKDayViewContentItem *)self startDate];
  BOOL v8 = [(EKDayViewContentItem *)self endDate];
  [(EKDayViewContentItem *)self travelTime];
  uint64_t v9 = CUIKDisplayStringForTravelTimeUsingShortFormat();
  uint64_t v10 = [v4 stringWithFormat:@"%@ title: [%@], start date: [%@], end date: [%@], travelTime: [%@]", v3, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (NSString)eventIdentifier
{
  v2 = [(EKDayViewContentItem *)self event];
  id v3 = [v2 eventIdentifier];

  return (NSString *)v3;
}

- (BOOL)visibleHeightLocked
{
  return self->_visibleHeightLocked;
}

- (void)setVisibleHeight:(double)a3
{
  if (!self->_visibleHeightLocked && self->_visibleHeight != a3)
  {
    self->_visibleHeight = a3;
    self->_visibleHeightLocked = 1;
    if (![(EKDayViewContentItem *)self isLoadingAsync])
    {
      char v5 = [(EKDayViewContentItem *)self view];

      if (v5)
      {
        id v6 = [(EKDayViewContentItem *)self view];
        [v6 setVisibleHeight:a3];
      }
    }
  }
}

+ (double)barToBarHorizontalDistanceIncludingBarWidth
{
  +[EKDayOccurrenceView barToBarHorizontalDistanceIncludingBarWidth];
  return result;
}

- (unint64_t)eventIndex
{
  return self->_eventIndex;
}

- (double)topPinningProximity
{
  return self->_topPinningProximity;
}

- (double)bottomPinningProximity
{
  return self->_bottomPinningProximity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_event, 0);

  objc_storeStrong((id *)&self->_stagedPayload, 0);
}

@end