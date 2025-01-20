@interface EKDayOccurrenceView
+ (CGRect)contentStretchRectForFrame:(CGRect)a3;
+ (EKDayOccurrenceView)occurrenceViewWithFrame:(CGRect)a3;
+ (UIEdgeInsets)defaultMargin;
+ (UIEdgeInsets)defaultPadding;
+ (double)barToBarGapWidth;
+ (double)barToBarHorizontalDistanceIncludingBarWidth;
+ (double)bottomShadowMargin;
+ (double)enoughHeightForOneLineForEvents:(id)a3 usingSmallText:(BOOL)a4 sizeClass:(int64_t)a5;
+ (double)heightForAllDayOccurrenceForSizeClass:(int64_t)a3 usesSmallText:(BOOL)a4;
+ (double)minNaturalTextHeightForEvent:(id)a3 usingSmallText:(BOOL)a4 sizeClass:(int64_t)a5;
+ (double)minimumHeightForSizeClass:(int64_t)a3 orientation:(int64_t)a4;
+ (double)minimumHeightForSizeClass:(int64_t)a3 orientation:(int64_t)a4 isAllDay:(BOOL)a5;
+ (double)minimumHeightForSizeClass:(int64_t)a3 orientation:(int64_t)a4 isAllDay:(BOOL)a5 usesSmallText:(BOOL)a6;
+ (id)_viewCache;
+ (id)viewForExternalDragOperationFromEvent:(id)a3 visiblePath:(id *)a4;
+ (void)_clearViewCache;
+ (void)clearCaches;
- (BOOL)_contentViewHasContent;
- (BOOL)_isAboveAllDayOccurrenceView:(id)a3;
- (BOOL)_isAboveOccurrenceView:(id)a3 overlapToIgnore:(double)a4;
- (BOOL)_isBelowAllDayOccurrenceView:(id)a3;
- (BOOL)_isBelowOccurrenceView:(id)a3 overlapToIgnore:(double)a4;
- (BOOL)_isTimedOccurrenceDrawingStyle;
- (BOOL)_shouldActuallyAnnotateAppEntities;
- (BOOL)allDayDrawingStyle;
- (BOOL)dimmed;
- (BOOL)drawsResizeHandles;
- (BOOL)hasPrecedingDuration;
- (BOOL)hasTrailingDuration;
- (BOOL)hideText;
- (BOOL)isAllDay;
- (BOOL)isBirthday;
- (BOOL)isCancelled;
- (BOOL)isCompleted;
- (BOOL)isDeclined;
- (BOOL)isMiniPreviewInEventDetail;
- (BOOL)isPinned;
- (BOOL)isProposedTime;
- (BOOL)isReminder;
- (BOOL)isReminderStack;
- (BOOL)isSelectedCopyView;
- (BOOL)isTentative;
- (BOOL)multiAllDayRoundCorners;
- (BOOL)needsReply;
- (BOOL)occurrenceIsFirstVisibleDayOfEvent;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)pointInsideReminderCheckbox:(CGPoint)a3;
- (BOOL)pointerInteractionDisabled;
- (BOOL)reduceLayoutProcessingForAnimation;
- (BOOL)resetContentViewToOriginalState:(BOOL)a3;
- (BOOL)selected;
- (BOOL)shouldAnnotateAppEntities;
- (BOOL)showsTravelTime;
- (BOOL)touchesAreBeingTracked;
- (BOOL)usesSmallText;
- (BOOL)visibleHeightLocked;
- (CGRect)_frameForText;
- (CGRect)_frameMutatedForProximityToHourLine:(CGRect)a3;
- (CGRect)frameOfOpaqueContent;
- (CGSize)_contentViewContentSize;
- (CUIKOROccurrenceState)currentImageState;
- (EKCalendarDate)occurrenceDate;
- (EKDayOccurrenceView)initWithFrame:(CGRect)a3;
- (EKDayOccurrenceView)selectedCopy;
- (EKDayOccurrenceViewDelegate)delegate;
- (EKEvent)occurrence;
- (NSArray)occurrences;
- (NSNumber)allDayOverride;
- (NSString)description;
- (UIEdgeInsets)margin;
- (UIEdgeInsets)padding;
- (double)_verticalContentInset;
- (double)bottomPinningProximity;
- (double)cappedColorBarHeight;
- (double)enoughHeightForOneLine;
- (double)topPinningProximity;
- (double)travelTime;
- (double)travelTimeSubviewHeightInPoints;
- (double)viewMaxNaturalTextHeight;
- (double)visibleHeight;
- (id)_newResizeHandleView;
- (id)arrayOfResizeHandles;
- (id)copyWithZone:(_NSZone *)a3;
- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (id)sortOccurrences:(id)a3;
- (int)dragTypeFromPoint:(CGPoint)a3;
- (int64_t)_compareOccurrenceViewForSelectedCopyOrdering:(id)a3;
- (int64_t)_compareOccurrenceViewLeftToRight:(id)a3;
- (int64_t)_compareOccurrenceViewTopToBottom:(id)a3;
- (int64_t)_compareOccurrenceViewTopToBottomLeftToRight:(id)a3;
- (int64_t)birthdayCount;
- (int64_t)compareOccurrenceViewForTabOrdering:(id)a3;
- (int64_t)horizontalSizeClass;
- (int64_t)occurrenceDateIndex;
- (int64_t)routingMode;
- (int64_t)userInterfaceStyle;
- (void)_addEditMenuInteractionIfNeeded;
- (void)_addTravelTimeSubviews;
- (void)_invalidateAllImages;
- (void)_invalidateBackgroundImage;
- (void)_invalidateContentBounds;
- (void)_invalidateCurrentRequest;
- (void)_invalidateTextImage;
- (void)_invalidateTravelTimeImage;
- (void)_removeEditMenuInteractionIfNeeded;
- (void)_removeTravelTimeSubviews;
- (void)_resetContentViewPosition;
- (void)_setEditingMenuEnabled:(BOOL)a3;
- (void)_setUpInteractions;
- (void)_updateAppEntityAnnotationIfNeeded;
- (void)_updateAppEntityAnnotationState;
- (void)_updateColorBarFrame;
- (void)_updateColors;
- (void)_updateContentImageViewIfNeeded;
- (void)_updateContentWithPayload:(id)a3;
- (void)_updateCornerRadius;
- (void)_updateResizeHandleLocations;
- (void)animateToFrame:(CGRect)a3 isAllDay:(BOOL)a4 beginFromCurrentState:(BOOL)a5 whenFinished:(id)a6;
- (void)bringResizeHandlesToFront;
- (void)dealloc;
- (void)didMoveToSuperview;
- (void)dismissEditingMenu;
- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)fadeInContentViewAt:(double)a3 minWidth:(double)a4 animated:(BOOL)a5;
- (void)forceUpdateColors;
- (void)forceUpdateContentWithPayload:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)presentEditingMenuFromGestureController:(id)a3;
- (void)removeFromSuperview;
- (void)requestContentIfNeeded:(unint64_t)a3 completion:(id)a4;
- (void)setAllDay:(BOOL)a3;
- (void)setAllDayDrawingStyle:(BOOL)a3;
- (void)setAllDayDrawingStyle:(BOOL)a3 animated:(BOOL)a4;
- (void)setBirthday:(BOOL)a3;
- (void)setBirthdayCount:(int64_t)a3;
- (void)setBottomPinningProximity:(double)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setCappedColorBarHeight:(double)a3;
- (void)setDeclined:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDimmed:(BOOL)a3;
- (void)setDrawsResizeHandles:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHasPrecedingDuration:(BOOL)a3;
- (void)setHasTrailingDuration:(BOOL)a3;
- (void)setHideText:(BOOL)a3;
- (void)setHideText:(BOOL)a3 animate:(BOOL)a4;
- (void)setIsCompleted:(BOOL)a3;
- (void)setIsMiniPreviewInEventDetail:(BOOL)a3;
- (void)setIsProposedTime:(BOOL)a3;
- (void)setIsReminder:(BOOL)a3;
- (void)setIsSelectedCopyView:(BOOL)a3;
- (void)setMargin:(UIEdgeInsets)a3;
- (void)setMultiAllDayRoundCorners:(BOOL)a3;
- (void)setNeedsReply:(BOOL)a3;
- (void)setOccurrence:(id)a3;
- (void)setOccurrenceDateIndex:(int64_t)a3;
- (void)setOccurrenceIsFirstVisibleDayOfEvent:(BOOL)a3;
- (void)setOccurrences:(id)a3;
- (void)setPadding:(UIEdgeInsets)a3;
- (void)setPointerInteractionDisabled:(BOOL)a3;
- (void)setReduceLayoutProcessingForAnimation:(BOOL)a3;
- (void)setRoutingMode:(int64_t)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelectedCopy:(id)a3;
- (void)setShouldAnnotateAppEntities:(BOOL)a3;
- (void)setShowsTravelTime:(BOOL)a3;
- (void)setTentative:(BOOL)a3;
- (void)setTopPinningProximity:(double)a3;
- (void)setTouchesAreBeingTracked:(BOOL)a3;
- (void)setTravelTime:(double)a3;
- (void)setTravelTimeSubviewHeightInPoints:(double)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
- (void)setUsesSmallText:(BOOL)a3;
- (void)setVisibleHeight:(double)a3;
- (void)setupWithOccurrence:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)updateAlpha;
@end

@implementation EKDayOccurrenceView

- (double)visibleHeight
{
  return self->_visibleHeight;
}

- (BOOL)usesSmallText
{
  return self->_usesSmallText;
}

- (double)travelTime
{
  return self->_travelTime;
}

- (BOOL)occurrenceIsFirstVisibleDayOfEvent
{
  return self->_occurrenceIsFirstVisibleDayOfEvent;
}

- (BOOL)isProposedTime
{
  return self->_isProposedTime;
}

- (BOOL)isMiniPreviewInEventDetail
{
  return self->_isMiniPreviewInEventDetail;
}

- (BOOL)dimmed
{
  return self->_dimmed;
}

- (int64_t)birthdayCount
{
  return self->_birthdayCount;
}

- (NSNumber)allDayOverride
{
  return (NSNumber *)[NSNumber numberWithBool:self->_allDay];
}

- (void)_updateCornerRadius
{
  BOOL v3 = [(EKDayOccurrenceView *)self isAllDay];
  BOOL v4 = [(EKDayOccurrenceView *)self hasPrecedingDuration];
  BOOL v5 = v4;
  if (v3)
  {
    BOOL v6 = !v4 || [(EKDayOccurrenceView *)self multiAllDayRoundCorners];
    if ([(EKDayOccurrenceView *)self hasTrailingDuration]) {
      BOOL v16 = [(EKDayOccurrenceView *)self multiAllDayRoundCorners];
    }
    else {
      BOOL v16 = 1;
    }
    int IsLeftToRight = CalTimeDirectionIsLeftToRight();
    uint64_t v18 = 10;
    if (!v6) {
      uint64_t v18 = 0;
    }
    if (v16) {
      v18 |= 5uLL;
    }
    uint64_t v19 = 5;
    if (!v6) {
      uint64_t v19 = 0;
    }
    if (v16) {
      v19 |= 0xAuLL;
    }
    if (IsLeftToRight) {
      uint64_t v20 = v19;
    }
    else {
      uint64_t v20 = v18;
    }
    v21 = [(EKDayOccurrenceView *)self layer];
    [v21 setMasksToBounds:1];

    v22 = [(EKDayOccurrenceView *)self layer];
    [v22 setMaskedCorners:v20];

    [(EKDayOccurrenceView *)self bounds];
    double v24 = v23 * 0.5;
    v25 = [(EKDayOccurrenceView *)self layer];
    [v25 setCornerRadius:v24];

    v26 = [(UIImageView *)self->_eventBackgroundView layer];
    [v26 setMaskedCorners:v20];

    [(EKDayOccurrenceView *)self bounds];
    double v28 = v27 * 0.5;
    v15 = [(UIImageView *)self->_eventBackgroundView layer];
    [v15 setCornerRadius:v28];
  }
  else
  {
    BOOL v7 = [(EKDayOccurrenceView *)self hasTrailingDuration];
    BOOL v8 = [(EKDayOccurrenceView *)self showsTravelTime];
    uint64_t v9 = 3;
    if (v8 || v5) {
      uint64_t v9 = 0;
    }
    if (v7) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = v9 | 0xC;
    }
    v11 = [(EKDayOccurrenceView *)self layer];
    [v11 setMaskedCorners:v10];

    v12 = [(EKDayOccurrenceView *)self layer];
    [v12 setCornerRadius:4.0];

    v13 = [(UIImageView *)self->_eventBackgroundView layer];
    [v13 setMaskedCorners:v10];

    v14 = [(UIImageView *)self->_eventBackgroundView layer];
    [v14 setCornerRadius:4.0];

    v15 = [(EKDayOccurrenceView *)self layer];
    [v15 setMasksToBounds:0];
  }

  [(EKDayOccurrenceView *)self setNeedsDisplay];
}

- (BOOL)showsTravelTime
{
  return self->_showsTravelTime;
}

- (BOOL)isAllDay
{
  return self->_allDay;
}

- (BOOL)hasTrailingDuration
{
  return self->_hasTrailingDuration;
}

- (BOOL)hasPrecedingDuration
{
  return self->_hasPrecedingDuration;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  int IsLeftToRight = CalInterfaceIsLeftToRight();
  if (IsLeftToRight) {
    double v9 = left;
  }
  else {
    double v9 = right;
  }
  if (IsLeftToRight) {
    double v10 = right;
  }
  else {
    double v10 = left;
  }
  if (v9 != self->_padding.left
    || top != self->_padding.top
    || v10 != self->_padding.right
    || bottom != self->_padding.bottom)
  {
    self->_padding.double top = top;
    self->_padding.double left = v9;
    self->_padding.double bottom = bottom;
    self->_padding.double right = v10;
    [(EKDayOccurrenceTravelTimeView *)self->_travelTimeContentView setNeedsLayout];
    [(EKDayOccurrenceView *)self setNeedsLayout];
  }
}

- (BOOL)selected
{
  return self->_selected;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(EKDayOccurrenceView *)self bounds];
  if (width != v9 || height != v8)
  {
    [(EKDayOccurrenceView *)self frame];
    if (vabdd_f64(height, v11) >= 2.22044605e-16)
    {
      self->_visibleHeight = 1.79769313e308;
      self->_visibleHeightLocked = 0;
    }
    self->_needsContentCalc = 1;
    self->_needsBackgroundImageUpdate = 1;
    [(EKDayOccurrenceView *)self _invalidateCurrentRequest];
    [(EKDayOccurrenceView *)self _invalidateAllImages];
    [(EKDayOccurrenceView *)self setNeedsLayout];
  }
  v14.receiver = self;
  v14.super_class = (Class)EKDayOccurrenceView;
  -[EKDayOccurrenceView setFrame:](&v14, sel_setFrame_, x, y, width, height);
  v12 = [(EKDayOccurrenceView *)self selectedCopy];

  if (v12)
  {
    v13 = [(EKDayOccurrenceView *)self selectedCopy];
    objc_msgSend(v13, "setFrame:", x, y, width, height);
  }
  [(EKDayOccurrenceView *)self _updateResizeHandleLocations];
}

- (EKDayOccurrenceView)selectedCopy
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectedCopy);

  return (EKDayOccurrenceView *)WeakRetained;
}

- (void)_updateResizeHandleLocations
{
  [(UIView *)self->_startResizeHandle frame];
  double v4 = v3;
  double v5 = (v3 + -12.0) * 0.5;
  [(EKDayOccurrenceView *)self frame];
  double v7 = v6;
  double v9 = v8;
  [(EKDayOccurrenceView *)self frame];
  double v11 = v10;
  double v13 = v12;
  [(EKDayOccurrenceView *)self bounds];
  double height = v28.size.height;
  double v14 = v5 + CGRectGetWidth(v28) - v4 + -10.0;
  if (self->_startResizeHandle)
  {
    double v25 = v11;
    if (CalInterfaceIsLeftToRight()) {
      double v15 = v14;
    }
    else {
      double v15 = 10.0 - v5;
    }
    [(EKDayOccurrenceView *)self travelTimeSubviewHeightInPoints];
    double v17 = v9 + -6.0 - v5 + v16;
    [(UIView *)self->_startResizeHandle frame];
    double v18 = CalRoundPointToScreenScale(v7 + v15, v17);
    double v11 = v25;
    [(UIView *)self->_startResizeHandle setFrame:v18];
  }
  if (self->_endResizeHandle)
  {
    if (CalInterfaceIsLeftToRight()) {
      double v19 = 10.0 - v5;
    }
    else {
      double v19 = v14;
    }
    double v20 = v5 + height - v4 + 6.0;
    double v21 = v11 + v19;
    double v22 = v13 + v20;
    [(UIView *)self->_endResizeHandle frame];
    double v23 = CalRoundPointToScreenScale(v21, v22);
    endResizeHandle = self->_endResizeHandle;
    [(UIView *)endResizeHandle setFrame:v23];
  }
}

- (void)setupWithOccurrence:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    double v5 = [v4 calendar];
    uint64_t v6 = [v4 travelRoutingMode];
    -[EKDayOccurrenceView setAllDay:](self, "setAllDay:", [v4 isAllDay]);
    -[EKDayOccurrenceView setIsReminder:](self, "setIsReminder:", [v4 isIntegrationEvent]);
    -[EKDayOccurrenceView setIsCompleted:](self, "setIsCompleted:", [v4 completed]);
    -[EKDayOccurrenceView setCancelled:](self, "setCancelled:", [v4 status] == 3);
    [(EKDayOccurrenceView *)self setTentative:CUIKEventDisplaysAsTentative()];
    [(EKDayOccurrenceView *)self setDeclined:CUIKEventDisplaysAsDeclined()];
    [(EKDayOccurrenceView *)self setNeedsReply:CUIKEventDisplaysAsNeedsReply()];
    -[EKDayOccurrenceView setBirthday:](self, "setBirthday:", [v5 type] == 4);
    [v4 travelTime];
    double v8 = v7;

    [(EKDayOccurrenceView *)self setTravelTime:v8];
    [(EKDayOccurrenceView *)self setRoutingMode:v6];
    [(CUIKOROccurrenceState *)self->_currentImageState performChangesWithState:self];
    [(EKDayOccurrenceView *)self _invalidateAllImages];
    stagedBackgroundColor = self->_stagedBackgroundColor;
    self->_stagedBackgroundColor = 0;
  }

  [(EKDayOccurrenceView *)self _updateAppEntityAnnotationIfNeeded];
}

- (void)_invalidateTravelTimeImage
{
  if (self->_showsTravelTime) {
    self->_invalidatedRequestOptions |= 4uLL;
  }
}

- (void)_invalidateAllImages
{
  [(EKDayOccurrenceView *)self _invalidateBackgroundImage];
  [(EKDayOccurrenceView *)self _invalidateTextImage];

  [(EKDayOccurrenceView *)self _invalidateTravelTimeImage];
}

- (void)_invalidateTextImage
{
  self->_invalidatedRequestOptions |= 2uLL;
}

- (void)_invalidateBackgroundImage
{
  self->_invalidatedRequestOptions |= 1uLL;
}

- (void)setIsReminder:(BOOL)a3
{
  if (self->_isReminder != a3) {
    self->_isReminder = a3;
  }
}

- (void)setIsCompleted:(BOOL)a3
{
  self->_isCompleted = a3;
}

- (void)setBirthday:(BOOL)a3
{
  self->_birthdadouble y = a3;
}

- (void)didMoveToSuperview
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  double v3 = [(EKDayOccurrenceView *)self arrayOfResizeHandles];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v31;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v31 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v30 + 1) + 8 * v7);
        double v9 = [(EKDayOccurrenceView *)self superview];

        if (v9)
        {
          double v10 = [v8 superview];
          [v8 frame];
          double v12 = v11;
          double v14 = v13;
          double v16 = v15;
          double v18 = v17;
          double v19 = [(EKDayOccurrenceView *)self superview];
          objc_msgSend(v10, "convertRect:toView:", v19, v12, v14, v16, v18);
          double v21 = v20;
          double v23 = v22;
          double v25 = v24;
          double v27 = v26;

          CGRect v28 = [(EKDayOccurrenceView *)self superview];
          [v28 addSubview:v8];

          v29 = [(EKDayOccurrenceView *)self superview];
          [v29 bringSubviewToFront:v8];

          objc_msgSend(v8, "setFrame:", v21, v23, v25, v27);
        }
        else
        {
          [v8 removeFromSuperview];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v5);
  }
}

- (id)arrayOfResizeHandles
{
  if (self->_startResizeHandle)
  {
    v2 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", self->_endResizeHandle, 0);
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

+ (EKDayOccurrenceView)occurrenceViewWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [a1 _viewCache];
  if ([v8 count])
  {
    double v9 = [v8 objectAtIndex:0];
    [v8 removeObjectAtIndex:0];
    v12.origin.double x = x;
    v12.origin.double y = y;
    v12.size.double width = width;
    v12.size.double height = height;
    if (!CGRectIsEmpty(v12)) {
      objc_msgSend(v9, "setFrame:", x, y, width, height);
    }
  }
  else
  {
    double v9 = objc_msgSend(objc_alloc((Class)a1), "initWithFrame:", x, y, width, height);
  }
  [v9 prepareForReuse];

  return (EKDayOccurrenceView *)v9;
}

- (void)_addEditMenuInteractionIfNeeded
{
  double v3 = [(EKDayOccurrenceView *)self interactions];
  char v4 = [v3 containsObject:self->_editMenuInteraction];

  if ((v4 & 1) == 0)
  {
    editMenuInteraction = self->_editMenuInteraction;
    [(EKDayOccurrenceView *)self addInteraction:editMenuInteraction];
  }
}

+ (id)_viewCache
{
  v2 = (void *)_viewCache___NormalOccurrenceViewCache;
  if (!_viewCache___NormalOccurrenceViewCache)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    char v4 = (void *)_viewCache___NormalOccurrenceViewCache;
    _viewCache___NormalOccurrenceViewCache = (uint64_t)v3;

    v2 = (void *)_viewCache___NormalOccurrenceViewCache;
  }

  return v2;
}

- (void)setDelegate:(id)a3
{
}

- (void)_updateAppEntityAnnotationIfNeeded
{
  if (CalendarLinkLibraryCore())
  {
    if (self->_occurrence
      && [(EKDayOccurrenceView *)self _shouldActuallyAnnotateAppEntities])
    {
      [(EKDayOccurrenceView *)self Cal_annotateWithEvent:self->_occurrence];
      *((unsigned char *)self + 488) |= 0x10u;
      [(EKDayOccurrenceView *)self _updateAppEntityAnnotationState];
    }
    else if ((*((unsigned char *)self + 488) & 0x10) != 0)
    {
      [(EKDayOccurrenceView *)self Cal_annotateWithEvent:0];
      *((unsigned char *)self + 488) &= ~0x10u;
    }
  }
}

- (BOOL)_shouldActuallyAnnotateAppEntities
{
  if ((*((unsigned char *)self + 488) & 8) != 0) {
    return ![(EKDayOccurrenceView *)self isBirthday];
  }
  else {
    return 0;
  }
}

- (void)setShouldAnnotateAppEntities:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 488);
  if (((((v3 & 8) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v4 = 8;
    }
    else {
      char v4 = 0;
    }
    *((unsigned char *)self + 488) = v3 & 0xF7 | v4;
    [(EKDayOccurrenceView *)self _updateAppEntityAnnotationIfNeeded];
  }
}

- (void)setOccurrences:(id)a3
{
  char v4 = [(EKDayOccurrenceView *)self sortOccurrences:a3];
  occurrences = self->_occurrences;
  self->_occurrences = v4;

  uint64_t v6 = [(NSArray *)self->_occurrences firstObject];
  occurrence = self->_occurrence;
  self->_occurrence = v6;

  double v8 = self->_occurrence;

  [(EKDayOccurrenceView *)self setupWithOccurrence:v8];
}

- (id)sortOccurrences:(id)a3
{
  return (id)[a3 sortedArrayUsingFunction:MEMORY[0x1E4F57A80] context:0];
}

- (void)setOccurrenceDateIndex:(int64_t)a3
{
  self->_occurrenceDateIndedouble x = a3;
}

- (void)setMultiAllDayRoundCorners:(BOOL)a3
{
  self->_multiAllDayRoundCorners = a3;
}

- (void)prepareForReuse
{
  occurrence = self->_occurrence;
  self->_occurrence = 0;

  -[EKDayOccurrenceView setFrame:](self, "setFrame:", *MEMORY[0x1E4F28AD8], *(double *)(MEMORY[0x1E4F28AD8] + 8), *(double *)(MEMORY[0x1E4F28AD8] + 16), *(double *)(MEMORY[0x1E4F28AD8] + 24));
  [(EKDayOccurrenceView *)self setAlpha:1.0];
  [(EKDayOccurrenceView *)self setSelected:0];
  [(EKDayOccurrenceView *)self setDimmed:0];
  [(EKDayOccurrenceView *)self setTentative:0];
  [(EKDayOccurrenceView *)self setDeclined:0];
  [(EKDayOccurrenceView *)self setNeedsReply:0];
  [(EKDayOccurrenceView *)self setCancelled:0];
  [(EKDayOccurrenceView *)self setUsesSmallText:0];
  [(EKDayOccurrenceView *)self setOccurrenceIsFirstVisibleDayOfEvent:0];
  [(EKDayOccurrenceView *)self setDrawsResizeHandles:0];
  [(EKDayOccurrenceView *)self setAllDay:0];
  [(EKDayOccurrenceView *)self setAllDayDrawingStyle:0];
  if ([(EKDayOccurrenceView *)self isHidden]) {
    [(EKDayOccurrenceView *)self setHidden:0];
  }
  [(EKDayOccurrenceView *)self setContentMode:0];
  char v4 = [(EKDayOccurrenceView *)self layer];
  [v4 setShadowOpacity:0.0];

  [(EKDayOccurrenceView *)self setCappedColorBarHeight:-1.0];
  [(id)objc_opt_class() defaultMargin];
  -[EKDayOccurrenceView setMargin:](self, "setMargin:");
  [(id)objc_opt_class() defaultPadding];
  -[EKDayOccurrenceView setPadding:](self, "setPadding:");
  [(EKDayOccurrenceView *)self setTravelTime:0.0];
  [(EKDayOccurrenceView *)self setRoutingMode:0];
  [(EKDayOccurrenceView *)self setIsSelectedCopyView:0];
  [(EKDayOccurrenceView *)self setIsProposedTime:0];
  [(EKDayOccurrenceView *)self setBirthdayCount:0];
  [(EKDayOccurrenceView *)self setSelectedCopy:0];
  [(EKDayOccurrenceView *)self setUserInteractionEnabled:1];
  [(EKDayOccurrenceView *)self setHideText:0];
  [(EKDayOccurrenceView *)self setPointerInteractionDisabled:0];
  [(EKDayOccurrenceView *)self setHasPrecedingDuration:0];
  [(EKDayOccurrenceView *)self setHasTrailingDuration:0];
  self->_visibleHeight = 1.79769313e308;
  self->_needsBackgroundImageUpdate = 1;
  self->_needsContentCalc = 1;
  [(UIImageView *)self->_contentView setAlpha:1.0];
  stagedBackgroundColor = self->_stagedBackgroundColor;
  self->_stagedBackgroundColor = 0;

  uint64_t v6 = [(UIImageView *)self->_eventBackgroundView layer];
  [v6 setMasksToBounds:1];

  uint64_t v7 = [(EKDayOccurrenceView *)self layer];
  [v7 setMasksToBounds:0];

  [(CUIKOROccurrenceState *)self->_currentImageState performChangesWithState:self];
  [(UIImageView *)self->_contentView setImage:0];
  [(UIImageView *)self->_eventBackgroundView setImage:0];
  [(UIView *)self->_eventBackgroundColorBar setHidden:1];
  [(EKDayOccurrenceView *)self setBackgroundColor:0];
  [(EKDayOccurrenceView *)self _invalidateCurrentRequest];
  if (self->_editMenuInteraction)
  {
    [(EKDayOccurrenceView *)self _addEditMenuInteractionIfNeeded];
  }
}

- (void)setUsesSmallText:(BOOL)a3
{
  self->_usesSmallText = a3;
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)EKDayOccurrenceView;
  -[EKDayOccurrenceView setUserInteractionEnabled:](&v5, sel_setUserInteractionEnabled_);
  [(UIView *)self->_startResizeHandle setUserInteractionEnabled:v3];
  [(UIView *)self->_endResizeHandle setUserInteractionEnabled:v3];
}

- (void)setTravelTime:(double)a3
{
  if (self->_travelTime != a3)
  {
    self->_travelTime = a3;
    [(EKDayOccurrenceView *)self setShowsTravelTime:a3 > 0.0];
  }
}

- (void)setTentative:(BOOL)a3
{
  if (self->_tentative != a3)
  {
    self->_tentative = a3;
    self->_needsBackgroundImageUpdate = 1;
    [(EKDayOccurrenceView *)self _invalidateContentBounds];
  }
}

- (void)setRoutingMode:(int64_t)a3
{
}

- (void)setOccurrenceIsFirstVisibleDayOfEvent:(BOOL)a3
{
  self->_occurrenceIsFirstVisibleDayOfEvent = a3;
}

- (void)setNeedsReply:(BOOL)a3
{
  if (self->_needsReply != a3)
  {
    self->_needsRepldouble y = a3;
    self->_needsBackgroundImageUpdate = 1;
    [(EKDayOccurrenceView *)self _invalidateContentBounds];
  }
}

- (void)setIsSelectedCopyView:(BOOL)a3
{
  self->_isSelectedCopyView = a3;
}

- (void)setIsProposedTime:(BOOL)a3
{
  if (self->_isProposedTime != a3)
  {
    self->_isProposedTime = a3;
    [(EKDayOccurrenceView *)self _invalidateAllImages];
  }
}

- (void)setHasTrailingDuration:(BOOL)a3
{
  self->_hasTrailingDuration = a3;
}

- (void)setHasPrecedingDuration:(BOOL)a3
{
  self->_hasPrecedingDuration = a3;
}

- (void)setDimmed:(BOOL)a3
{
  if (self->_dimmed != a3)
  {
    self->_dimmed = a3;
    [(EKDayOccurrenceView *)self updateAlpha];
  }
}

- (void)setDeclined:(BOOL)a3
{
  if (self->_declined != a3)
  {
    self->_declined = a3;
    [(EKDayOccurrenceView *)self _invalidateContentBounds];
  }
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void)setAllDay:(BOOL)a3
{
  if (self->_allDay != a3)
  {
    self->_allDadouble y = a3;
    [(EKDayOccurrenceView *)self _invalidateContentBounds];
    [(EKDayOccurrenceView *)self _updateCornerRadius];
  }
}

- (void)_invalidateCurrentRequest
{
  if ((self->_currentRequestId & 0x8000000000000000) == 0)
  {
    BOOL v3 = [MEMORY[0x1E4F57BC8] sharedProvider];
    [v3 cancelRequest:self->_currentRequestId];

    self->_currentRequestId = -1;
  }
}

+ (double)minNaturalTextHeightForEvent:(id)a3 usingSmallText:(BOOL)a4 sizeClass:(int64_t)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  [(id)objc_opt_class() defaultMargin];
  double v9 = v8;
  double v11 = v10;
  [(id)objc_opt_class() defaultPadding];
  double v13 = v12;
  double v15 = v14;
  [MEMORY[0x1E4F57BD0] minNaturalTextHeightForEvent:v7 usingSmallText:v6 sizeClass:a5];
  double v17 = v16;

  return v17 + v15 + v9 + v11 + v13;
}

+ (UIEdgeInsets)defaultPadding
{
  double v2 = 3.5;
  double v3 = 5.0;
  double v4 = 0.0;
  double v5 = 2.0;
  result.double right = v5;
  result.double bottom = v4;
  result.double left = v3;
  result.double top = v2;
  return result;
}

+ (UIEdgeInsets)defaultMargin
{
  double v2 = 1.0;
  double v3 = 0.0;
  double v4 = 1.0;
  double v5 = 1.0;
  result.double right = v5;
  result.double bottom = v4;
  result.double left = v3;
  result.double top = v2;
  return result;
}

- (void)setSelectedCopy:(id)a3
{
}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
  {
    self->_selected = a3;
    [(EKDayOccurrenceView *)self _updateColors];
    [(EKDayOccurrenceView *)self updateAlpha];
    self->_needsBackgroundImageUpdate = 1;
    [(EKDayOccurrenceView *)self _invalidateAllImages];
    [(EKDayOccurrenceView *)self setNeedsDisplay];
    [(EKDayOccurrenceView *)self setNeedsLayout];
    if (!a3 && self->_occurrence)
    {
      double v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v5 postNotificationName:@"EKDayOccurrenceViewDidEndSelectionNotification" object:self];
    }
    [(EKDayOccurrenceView *)self _updateAppEntityAnnotationState];
  }
}

- (void)setPointerInteractionDisabled:(BOOL)a3
{
  if (self->_pointerInteractionDisabled != a3)
  {
    self->_pointerInteractionDisabled = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __53__EKDayOccurrenceView_setPointerInteractionDisabled___block_invoke;
    v3[3] = &unk_1E6087570;
    v3[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v3];
  }
}

- (void)setMargin:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  int IsLeftToRight = CalInterfaceIsLeftToRight();
  if (IsLeftToRight) {
    double v9 = left;
  }
  else {
    double v9 = right;
  }
  if (IsLeftToRight) {
    double v10 = right;
  }
  else {
    double v10 = left;
  }
  if (v9 != self->_margin.left
    || top != self->_margin.top
    || v10 != self->_margin.right
    || bottom != self->_margin.bottom)
  {
    self->_margin.double top = top;
    self->_margin.double left = v9;
    self->_margin.double bottom = bottom;
    self->_margin.double right = v10;
    self->_needsBackgroundImageUpdate = 1;
    [(EKDayOccurrenceView *)self _invalidateBackgroundImage];
    [(EKDayOccurrenceView *)self setNeedsLayout];
  }
}

- (void)setHideText:(BOOL)a3
{
  self->_hideText = a3;
}

- (void)setDrawsResizeHandles:(BOOL)a3
{
  if (self->_drawsResizeHandles != a3)
  {
    self->_drawsResizeHandles = a3;
    if (a3)
    {
      if ([(EKDayOccurrenceView *)self isAllDay] || [(EKDayOccurrenceView *)self isReminder])
      {
        self->_drawsResizeHandles = 0;
      }
      else
      {
        if (!self->_startResizeHandle)
        {
          double v26 = [(EKDayOccurrenceView *)self _newResizeHandleView];
          startResizeHandle = self->_startResizeHandle;
          self->_startResizeHandle = v26;

          CGRect v28 = [(EKDayOccurrenceView *)self superview];
          [v28 addSubview:self->_startResizeHandle];
        }
        if (!self->_endResizeHandle)
        {
          v29 = [(EKDayOccurrenceView *)self _newResizeHandleView];
          endResizeHandle = self->_endResizeHandle;
          self->_endResizeHandle = v29;

          long long v31 = [(EKDayOccurrenceView *)self superview];
          [v31 addSubview:self->_endResizeHandle];
        }
        [(EKDayOccurrenceView *)self _updateResizeHandleLocations];
        long long v32 = self->_startResizeHandle;
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __45__EKDayOccurrenceView_setDrawsResizeHandles___block_invoke;
        v39[3] = &unk_1E6087570;
        v39[4] = self;
        CalPopViewIn(v32, v39);
        long long v33 = self->_endResizeHandle;
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __45__EKDayOccurrenceView_setDrawsResizeHandles___block_invoke_2;
        v38[3] = &unk_1E6087570;
        v38[4] = self;
        CalPopViewIn(v33, v38);
      }
    }
    else
    {
      double v4 = self->_startResizeHandle;
      double v5 = self->_endResizeHandle;
      [(UIView *)v4 frame];
      double v7 = v6;
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __45__EKDayOccurrenceView_setDrawsResizeHandles___block_invoke_3;
      v36[3] = &unk_1E6087570;
      v37 = v4;
      double v14 = v4;
      CalScaleViewOut(v14, v36, v7, v9, v11, v13);
      [(UIView *)v5 frame];
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __45__EKDayOccurrenceView_setDrawsResizeHandles___block_invoke_4;
      v34[3] = &unk_1E6087570;
      uint64_t v35 = v5;
      double v23 = v5;
      CalScaleViewOut(v23, v34, v16, v18, v20, v22);
      double v24 = self->_startResizeHandle;
      self->_startResizeHandle = 0;

      double v25 = self->_endResizeHandle;
      self->_endResizeHandle = 0;
    }
  }
}

- (void)setCappedColorBarHeight:(double)a3
{
  self->_cappedColorBarHeight = a3;
}

- (void)setBirthdayCount:(int64_t)a3
{
  self->_birthdayCount = a3;
}

- (void)setAllDayDrawingStyle:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_allDayDrawingStyle != a3)
  {
    self->_allDayDrawingStyle = a3;
    if (a4)
    {
      if (a3)
      {
        uint64_t v17 = MEMORY[0x1E4F143A8];
        uint64_t v18 = 3221225472;
        double v19 = __54__EKDayOccurrenceView_setAllDayDrawingStyle_animated___block_invoke;
        double v20 = &unk_1E6087570;
        double v21 = self;
        double v5 = &v17;
        double v6 = self;
        uint64_t v7 = 5242880;
      }
      else
      {
        uint64_t v12 = MEMORY[0x1E4F143A8];
        uint64_t v13 = 3221225472;
        double v14 = __54__EKDayOccurrenceView_setAllDayDrawingStyle_animated___block_invoke_2;
        double v15 = &unk_1E6087570;
        double v16 = self;
        double v5 = &v12;
        double v6 = self;
        uint64_t v7 = 5242881;
      }
      objc_msgSend(MEMORY[0x1E4FB1EB0], "transitionWithView:duration:options:animations:completion:", v6, v7, v5, 0, 0.2, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21);
    }
    else
    {
      [(EKDayOccurrenceView *)self setShowsTravelTime:0];
      if (self->_allDayDrawingStyle)
      {
        [(UIImageView *)self->_eventBackgroundView removeFromSuperview];
        eventBackgroundView = self->_eventBackgroundView;
        self->_eventBackgroundView = 0;

        [(EKDayOccurrenceView *)self _removeTravelTimeSubviews];
      }
      else
      {
        double v9 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
        double v10 = self->_eventBackgroundView;
        self->_eventBackgroundView = v9;

        [(UIImageView *)self->_eventBackgroundView setAutoresizingMask:16];
        double v11 = [(UIImageView *)self->_eventBackgroundView layer];
        [v11 setMasksToBounds:1];

        [(EKDayOccurrenceView *)self insertSubview:self->_eventBackgroundView atIndex:0];
        if (self->_showsTravelTime) {
          [(EKDayOccurrenceView *)self _addTravelTimeSubviews];
        }
      }
      self->_needsBackgroundImageUpdate = 1;
      [(EKDayOccurrenceView *)self _invalidateBackgroundImage];
      [(EKDayOccurrenceView *)self setNeedsLayout];
    }
  }
}

- (void)setAllDayDrawingStyle:(BOOL)a3
{
}

+ (double)enoughHeightForOneLineForEvents:(id)a3 usingSmallText:(BOOL)a4 sizeClass:(int64_t)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  double v8 = [v7 firstObject];
  if ([v8 isIntegrationEvent])
  {
    [MEMORY[0x1E4F57BD0] naturalHeightForPrimaryTextUsingSmallText:v6 sizeClass:a5];
    double v10 = v9 * 1.43;
    unint64_t v11 = [v7 count];
    uint64_t v12 = 3;
    if (v11 < 3) {
      uint64_t v12 = v11;
    }
    double v13 = v10 + (double)(unint64_t)(v12 - 1) * 2.0;
  }
  else
  {
    [MEMORY[0x1E4F57BD0] minimumNaturalHeightForPrimaryTextUsingSmallText:v6 sizeClass:a5];
    double v13 = v14;
  }
  if (([v8 isAllDay] & 1) == 0)
  {
    double v15 = [v8 startCalendarDate];
    uint64_t v16 = [v15 minute];

    if (v16)
    {
      CalRoundToScreenScale(0.5);
      double v13 = v13 - v17;
    }
  }
  [(id)objc_opt_class() defaultMargin];
  double v19 = v18;
  double v21 = v20;
  [(id)objc_opt_class() defaultPadding];
  CalRoundToScreenScale(v13 + v23 + v19 + v21 + v22);
  double v25 = v24;

  return v25;
}

- (void)setTopPinningProximity:(double)a3
{
  topPinningProximitdouble y = self->_topPinningProximity;
  if (a3 >= 1.0 && topPinningProximity < 1.0)
  {
    double v9 = [(UIImageView *)self->_eventBackgroundView layer];
    [v9 setMasksToBounds:0];
  }
  else if (a3 < 1.0 && topPinningProximity >= 1.0)
  {
    double v8 = [(UIImageView *)self->_eventBackgroundView layer];
    [v8 setMasksToBounds:1];

    [(EKDayOccurrenceView *)self _updateCornerRadius];
  }
  if (a3 >= 1.0 || a3 <= 0.0)
  {
    double v10 = [(UIImageView *)self->_eventBackgroundView layer];
    unint64_t v11 = v10;
    double v12 = 4.0;
  }
  else
  {
    double v10 = [(UIImageView *)self->_eventBackgroundView layer];
    unint64_t v11 = v10;
    double v12 = (1.0 - a3) * 4.0;
  }
  [v10 setCornerRadius:v12];

  self->_topPinningProximitdouble y = a3;
}

- (void)setBottomPinningProximity:(double)a3
{
  double v4 = fmin(fmax(a3, 0.0), 1.0);
  unint64_t bottomPinningState = self->_bottomPinningState;
  BOOL v6 = v4 > 0.0;
  if (v4 <= 0.0)
  {
    uint64_t v8 = 0;
    goto LABEL_8;
  }
  if (v4 < 1.0)
  {
    BOOL v7 = bottomPinningState == 1;
    if (bottomPinningState == 1) {
      goto LABEL_22;
    }
    if ([(EKDayOccurrenceView *)self isSelectedCopyView])
    {
      pinFadeView = self->_pinFadeView;
      if (pinFadeView)
      {
        [(UIView *)pinFadeView removeFromSuperview];
        double v13 = self->_pinFadeView;
        self->_pinFadeView = 0;
      }
      goto LABEL_22;
    }
    double v14 = (UIView *)objc_opt_new();
    double v15 = self->_pinFadeView;
    self->_pinFadeView = v14;

    uint64_t v16 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [(UIView *)self->_pinFadeView setBackgroundColor:v16];

    if (bottomPinningState)
    {
      CGFloat x = self->_unpinnedEventBackgroundFrame.origin.x;
      double y = self->_unpinnedEventBackgroundFrame.origin.y;
      CGFloat width = self->_unpinnedEventBackgroundFrame.size.width;
      double height = self->_unpinnedEventBackgroundFrame.size.height;
      double v21 = self->_unpinnedTravelBackgroundFrame.size.height;
      if (v21 > 0.0)
      {
        CGFloat v22 = self->_unpinnedTravelBackgroundFrame.origin.x;
        CGFloat v23 = self->_unpinnedTravelBackgroundFrame.origin.y;
        CGFloat v24 = self->_unpinnedTravelBackgroundFrame.size.width;
LABEL_20:
        v61.origin.CGFloat x = x;
        v61.origin.double y = y;
        v61.size.CGFloat width = width;
        v61.size.double height = height;
        CGRect v62 = CGRectUnion(v61, *(CGRect *)(&v21 - 3));
        CGFloat x = v62.origin.x;
        double y = v62.origin.y;
        CGFloat width = v62.size.width;
        double height = v62.size.height;
      }
    }
    else
    {
      [(UIImageView *)self->_eventBackgroundView frame];
      CGFloat x = v25;
      double y = v26;
      CGFloat width = v27;
      double height = v28;
      [(UIImageView *)self->_travelBackgroundView frame];
      if (v29 > 0.0)
      {
        [(UIImageView *)self->_travelBackgroundView frame];
        CGFloat v22 = v30;
        CGFloat v23 = v31;
        CGFloat v24 = v32;
        double v21 = v33;
        goto LABEL_20;
      }
    }
    v60[1] = 3221225472;
    v60[0] = MEMORY[0x1E4F143A8];
    v60[2] = __49__EKDayOccurrenceView_setBottomPinningProximity___block_invoke;
    v60[3] = &unk_1E60896F8;
    v60[4] = self;
    *(CGFloat *)&v60[5] = x;
    *(double *)&v60[6] = y + 2.0;
    *(CGFloat *)&v60[7] = width;
    *(double *)&v60[8] = height + -2.0;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v60];
    BOOL v7 = bottomPinningState == 1;
LABEL_22:
    [(UIView *)self->_pinFadeView setAlpha:v4];
    double v10 = 1.0 - v4;
    v34 = [(UIImageView *)self->_travelBackgroundView layer];
    [v34 setCornerRadius:(1.0 - v4) * 4.0];

    uint64_t v35 = [(UIImageView *)self->_eventBackgroundView layer];
    [v35 setCornerRadius:(1.0 - v4) * 4.0];

    BOOL v6 = 0;
    char v58 = 1;
    uint64_t v8 = 1;
    goto LABEL_23;
  }
  uint64_t v8 = 2;
LABEL_8:
  if (bottomPinningState == 1)
  {
    [(UIView *)self->_pinFadeView removeFromSuperview];
    double v9 = self->_pinFadeView;
    self->_pinFadeView = 0;
  }
  if (v8 != bottomPinningState)
  {
    BOOL v7 = 0;
    char v58 = 0;
    double v10 = 1.0 - v4;
LABEL_23:
    [(UIImageView *)self->_contentView setAlpha:v10];
    v36 = [MEMORY[0x1E4FB1E20] _currentTraitCollection];
    v37 = [(EKDayOccurrenceView *)self traitCollection];
    [MEMORY[0x1E4FB1E20] _setCurrentTraitCollection:v37];

    if (![(EKDayOccurrenceView *)self isSelectedCopyView])
    {
      BOOL v38 = v7;
      v39 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
      double v59 = 0.0;
      [v39 getWhite:&v59 alpha:0];
      v40 = [MEMORY[0x1E4FB1618] colorWithWhite:v59 alpha:v4 * 0.75];
      [(EKDayOccurrenceView *)self setBackgroundColor:v40];

      BOOL v7 = v38;
    }
    [MEMORY[0x1E4FB1E20] _setCurrentTraitCollection:v36];

    if (!v7)
    {
      if (v6)
      {
        [(EKDayOccurrenceView *)self layoutIfNeeded];
        [(UIImageView *)self->_eventBackgroundView frame];
        self->_unpinnedEventBackgroundFrame.origin.CGFloat x = v41;
        self->_unpinnedEventBackgroundFrame.origin.double y = v42;
        self->_unpinnedEventBackgroundFrame.size.CGFloat width = v43;
        self->_unpinnedEventBackgroundFrame.size.double height = v44;
        [(UIImageView *)self->_travelBackgroundView frame];
        self->_unpinnedTravelBackgroundFrame.origin.CGFloat x = v45;
        self->_unpinnedTravelBackgroundFrame.origin.double y = v46;
        self->_unpinnedTravelBackgroundFrame.size.CGFloat width = v47;
        self->_unpinnedTravelBackgroundFrame.size.double height = v48;
        [(UIImageView *)self->_travelBackgroundView frame];
        if (v49 <= 2.0)
        {
          [(UIImageView *)self->_eventBackgroundView frame];
          -[UIImageView setFrame:](self->_eventBackgroundView, "setFrame:");
          [(EKDayOccurrenceView *)self _updateColorBarFrame];
        }
        else
        {
          [(UIImageView *)self->_travelBackgroundView frame];
          -[UIImageView setFrame:](self->_travelBackgroundView, "setFrame:");
        }
        char v51 = v58;
        v54 = [(UIImageView *)self->_eventBackgroundView layer];
        [v54 setMasksToBounds:0];

        v55 = [(UIImageView *)self->_travelBackgroundView layer];
        [v55 setMasksToBounds:0];
      }
      else
      {
        BOOL v50 = bottomPinningState == 2;
        char v51 = v58;
        if (v50)
        {
          v52 = [(UIImageView *)self->_eventBackgroundView layer];
          [v52 setMasksToBounds:1];

          v53 = [(UIImageView *)self->_travelBackgroundView layer];
          [v53 setMasksToBounds:1];

          -[UIImageView setFrame:](self->_eventBackgroundView, "setFrame:", self->_unpinnedEventBackgroundFrame.origin.x, self->_unpinnedEventBackgroundFrame.origin.y, self->_unpinnedEventBackgroundFrame.size.width, self->_unpinnedEventBackgroundFrame.size.height);
          [(EKDayOccurrenceView *)self _updateColorBarFrame];
          -[UIImageView setFrame:](self->_travelBackgroundView, "setFrame:", self->_unpinnedTravelBackgroundFrame.origin.x, self->_unpinnedTravelBackgroundFrame.origin.y, self->_unpinnedTravelBackgroundFrame.size.width, self->_unpinnedTravelBackgroundFrame.size.height);
          [(EKDayOccurrenceView *)self _updateCornerRadius];
        }
      }
      if ((v51 & 1) == 0)
      {
        v56 = [(UIImageView *)self->_travelBackgroundView layer];
        [v56 setCornerRadius:4.0];

        v57 = [(UIImageView *)self->_eventBackgroundView layer];
        [v57 setCornerRadius:4.0];
      }
    }
    unint64_t bottomPinningState = v8;
  }
  self->_bottomPinningProximitdouble y = v4;
  self->_unint64_t bottomPinningState = bottomPinningState;
}

- (void)setVisibleHeight:(double)a3
{
  if (self->_visibleHeight != a3)
  {
    self->_visibleHeight = a3;
    [(EKDayOccurrenceView *)self _invalidateContentBounds];
  }
}

- (void)setTravelTimeSubviewHeightInPoints:(double)a3
{
  self->_travelTimeSubviewHeightInPoints = a3;
}

- (EKDayOccurrenceView)initWithFrame:(CGRect)a3
{
  v29.receiver = self;
  v29.super_class = (Class)EKDayOccurrenceView;
  double v3 = -[EKDayOccurrenceView initWithFrame:](&v29, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    v3->_visibleHeight = 1.79769313e308;
    [(EKDayOccurrenceView *)v3 setAutoresizingMask:2];
    [(EKDayOccurrenceView *)v4 setOpaque:0];
    v4->_isMiniPreviewInEventDetail = 0;
    double v5 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    eventBackgroundView = v4->_eventBackgroundView;
    v4->_eventBackgroundView = v5;

    [(UIImageView *)v4->_eventBackgroundView setAccessibilityIdentifier:@"_eventBackgroundView"];
    [(EKDayOccurrenceView *)v4 addSubview:v4->_eventBackgroundView];
    BOOL v7 = [(UIImageView *)v4->_eventBackgroundView layer];
    [v7 setCornerRadius:4.0];

    uint64_t v8 = [(UIImageView *)v4->_eventBackgroundView layer];
    [v8 setMasksToBounds:1];

    uint64_t v9 = *MEMORY[0x1E4F3A238];
    double v10 = [(UIImageView *)v4->_eventBackgroundView layer];
    [v10 setMinificationFilter:v9];

    v4->_needsBackgroundImageUpdate = 1;
    unint64_t v11 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    eventBackgroundColorBar = v4->_eventBackgroundColorBar;
    v4->_eventBackgroundColorBar = v11;

    [(UIView *)v4->_eventBackgroundColorBar setAccessibilityIdentifier:@"_eventBackgroundColorBar"];
    [MEMORY[0x1E4F57BB8] colorBarThickness];
    double v14 = v13 * 0.5;
    double v15 = [(UIView *)v4->_eventBackgroundColorBar layer];
    [v15 setCornerRadius:v14];

    [(UIView *)v4->_eventBackgroundColorBar setHidden:1];
    [(EKDayOccurrenceView *)v4 addSubview:v4->_eventBackgroundColorBar];
    uint64_t v16 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    contentView = v4->_contentView;
    v4->_contentView = v16;

    [(UIImageView *)v4->_contentView setContentMode:9];
    [(UIImageView *)v4->_contentView setClipsToBounds:1];
    [(UIImageView *)v4->_contentView setAccessibilityIdentifier:@"_contentView"];
    [(EKDayOccurrenceView *)v4 addSubview:v4->_contentView];
    v4->_needsContentCalc = 1;
    v4->_cappedColorBarHeight = -1.0;
    v4->_originalXBeforeOffset = -1.0;
    [(id)objc_opt_class() defaultMargin];
    v4->_margin.double top = v18;
    v4->_margin.double left = v19;
    v4->_margin.double bottom = v20;
    v4->_margin.double right = v21;
    [(id)objc_opt_class() defaultPadding];
    v4->_padding.double top = v22;
    v4->_padding.double left = v23;
    v4->_padding.double bottom = v24;
    v4->_padding.double right = v25;
    v4->_currentRequestId = -1;
    double v26 = (CUIKOROccurrenceState *)objc_alloc_init(MEMORY[0x1E4F57BC0]);
    currentImageState = v4->_currentImageState;
    v4->_currentImageState = v26;

    v4->_contentLocationDuringReducedProcessing = (CGPoint)*MEMORY[0x1E4F1DAD8];
    [(EKDayOccurrenceView *)v4 _setUpInteractions];
  }
  return v4;
}

- (void)_setUpInteractions
{
  double v3 = (UIPointerInteraction *)[objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:self];
  [(EKDayOccurrenceView *)self addInteraction:v3];
  pointerInteraction = self->_pointerInteraction;
  self->_pointerInteraction = v3;
  double v5 = v3;

  BOOL v6 = (UIEditMenuInteraction *)[objc_alloc(MEMORY[0x1E4FB1758]) initWithDelegate:self];
  editMenuInteraction = self->_editMenuInteraction;
  self->_editMenuInteraction = v6;

  [(EKDayOccurrenceView *)self _addEditMenuInteractionIfNeeded];
}

- (CUIKOROccurrenceState)currentImageState
{
  return self->_currentImageState;
}

- (void)_updateColorBarFrame
{
  [(UIImageView *)self->_eventBackgroundView frame];
  CGFloat x = v31.origin.x;
  CGFloat y = v31.origin.y;
  CGFloat width = v31.size.width;
  CGFloat height = v31.size.height;
  double v7 = CGRectGetHeight(v31);
  [MEMORY[0x1E4F57BB8] occurrencePadding];
  double v9 = v8;
  [MEMORY[0x1E4F57BB8] colorBarThickness];
  double v11 = v10 + v10;
  int IsLeftToRight = CalInterfaceIsLeftToRight();
  CGFloat v13 = x;
  CGFloat v14 = y;
  CGFloat v15 = width;
  CGFloat v16 = height;
  if (IsLeftToRight)
  {
    double MinX = CGRectGetMinX(*(CGRect *)&v13);
    [MEMORY[0x1E4F57BB8] occurrencePadding];
    double v19 = MinX + v18;
  }
  else
  {
    double MaxX = CGRectGetMaxX(*(CGRect *)&v13);
    [MEMORY[0x1E4F57BB8] occurrencePadding];
    double v22 = MaxX - v21;
    [MEMORY[0x1E4F57BB8] colorBarThickness];
    double v19 = v22 - v23;
  }
  if (v7 <= v11)
  {
    v33.origin.CGFloat x = x;
    v33.origin.CGFloat y = y;
    v33.size.CGFloat width = width;
    v33.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v33);
    double v11 = v7;
  }
  else
  {
    double v24 = v7 + v9 * -2.0;
    v32.origin.CGFloat x = x;
    v32.origin.CGFloat y = y;
    v32.size.CGFloat width = width;
    v32.size.CGFloat height = height;
    double v25 = CGRectGetMinY(v32);
    if (v24 >= v11)
    {
      [MEMORY[0x1E4F57BB8] occurrencePadding];
      double MinY = v25 + v27;
      double v11 = v24;
    }
    else
    {
      double MinY = (v7 - v11) * 0.5 + v25;
    }
  }
  [MEMORY[0x1E4F57BB8] colorBarThickness];
  eventBackgroundColorBar = self->_eventBackgroundColorBar;

  -[UIView setFrame:](eventBackgroundColorBar, "setFrame:", v19, MinY, v28, v11);
}

- (void)layoutSubviews
{
  v60.receiver = self;
  v60.super_class = (Class)EKDayOccurrenceView;
  [(EKDayOccurrenceView *)&v60 layoutSubviews];
  [(CUIKOROccurrenceState *)self->_currentImageState performChangesWithState:self];
  if (!self->_needsBackgroundImageUpdate)
  {
    if (!self->_needsContentCalc) {
      return;
    }
    [(EKDayOccurrenceView *)self _updateColors];
    goto LABEL_13;
  }
  [(EKDayOccurrenceView *)self _updateColors];
  if ([(EKDayOccurrenceView *)self _isTimedOccurrenceDrawingStyle])
  {
    [(EKDayOccurrenceView *)self bounds];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    [(EKDayOccurrenceView *)self margin];
    -[EKDayOccurrenceView _frameMutatedForProximityToHourLine:](self, "_frameMutatedForProximityToHourLine:", v4 + v14, v6 + v11, v8 - (v14 + v12), v10 - (v11 + v13));
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    [(EKDayOccurrenceView *)self travelTimeSubviewHeightInPoints];
    double v24 = v23 + v18;
    [(EKDayOccurrenceView *)self travelTimeSubviewHeightInPoints];
    double v26 = v22 - v25;
    [(UIImageView *)self->_eventBackgroundView setFrame:CalRoundRectToScreenScale(v16, v24, v20, v22 - v25)];
    [(EKDayOccurrenceView *)self _updateColorBarFrame];
    if (self->_showsTravelTime)
    {
      [(EKDayOccurrenceView *)self travelTimeSubviewHeightInPoints];
      if (v27 > 0.0)
      {
        [(EKDayOccurrenceView *)self bounds];
        double v29 = v28;
        double v31 = v30;
        double v33 = v32;
        double v35 = v34;
        [(EKDayOccurrenceView *)self margin];
        -[EKDayOccurrenceView _frameMutatedForProximityToHourLine:](self, "_frameMutatedForProximityToHourLine:", v29 + v39, v31 + v36, v33 - (v39 + v37), v35 - (v36 + v38));
        double v41 = v40;
        double v43 = v42;
        double v45 = v44;
        [(EKDayOccurrenceView *)self travelTimeSubviewHeightInPoints];
        double v47 = v46;
        [(EKDayOccurrenceView *)self margin];
        double v49 = fmax(v47 - v48, 0.0);
        [(UIImageView *)self->_travelBackgroundView setFrame:CalRoundRectToScreenScale(v41, v43, v45, v49)];
        v61.origin.CGFloat x = v41;
        v61.origin.CGFloat y = v43;
        v61.size.CGFloat width = v45;
        v61.size.CGFloat height = v49;
        double MaxY = CGRectGetMaxY(v61);
        [(UIImageView *)self->_eventBackgroundView setFrame:CalRoundRectToScreenScale(v16, MaxY, v20, v26)];
        [(EKDayOccurrenceView *)self _updateColorBarFrame];
      }
    }
    if (self->_bottomPinningState == 2)
    {
      [(UIImageView *)self->_eventBackgroundView frame];
      self->_unpinnedEventBackgroundFrame.origin.CGFloat x = v51;
      self->_unpinnedEventBackgroundFrame.origin.CGFloat y = v52;
      self->_unpinnedEventBackgroundFrame.size.CGFloat width = v53;
      self->_unpinnedEventBackgroundFrame.size.CGFloat height = v54;
      [(UIImageView *)self->_travelBackgroundView frame];
      self->_unpinnedTravelBackgroundFrame.origin.CGFloat x = v55;
      self->_unpinnedTravelBackgroundFrame.origin.CGFloat y = v56;
      self->_unpinnedTravelBackgroundFrame.size.CGFloat width = v57;
      self->_unpinnedTravelBackgroundFrame.size.CGFloat height = v58;
      [(UIImageView *)self->_travelBackgroundView frame];
      if (v59 <= 2.0)
      {
        [(UIImageView *)self->_eventBackgroundView frame];
        -[UIImageView setFrame:](self->_eventBackgroundView, "setFrame:");
        [(EKDayOccurrenceView *)self _updateColorBarFrame];
      }
      else
      {
        [(UIImageView *)self->_travelBackgroundView frame];
        -[UIImageView setFrame:](self->_travelBackgroundView, "setFrame:");
      }
    }
  }
  self->_needsBackgroundImageUpdate = 0;
  if (self->_needsContentCalc) {
LABEL_13:
  }
    [(EKDayOccurrenceView *)self _updateContentImageViewIfNeeded];
}

- (double)travelTimeSubviewHeightInPoints
{
  return self->_travelTimeSubviewHeightInPoints;
}

- (void)_updateColors
{
  double v3 = [(EKDayOccurrenceView *)self traitCollection];
  [MEMORY[0x1E4FB1E20] _setCurrentTraitCollection:v3];

  if (![(EKDayOccurrenceView *)self _isTimedOccurrenceDrawingStyle])
  {
    if (_updateColors_onceToken != -1) {
      dispatch_once(&_updateColors_onceToken, &__block_literal_global_66);
    }
    BOOL v10 = self->_selected && !self->_dimmed;
    uint64_t v11 = [(CUIKOROccurrenceState *)self->_currentImageState userInterfaceStyle];
    double v12 = @"dark";
    if (v11 == 1) {
      double v12 = @"light";
    }
    double v13 = v12;
    if (v10)
    {
      double v44 = v13;
      uint64_t v14 = [(__CFString *)v13 stringByAppendingString:@"Selected"];

      double v13 = (__CFString *)v14;
    }
    if (self->_tentative)
    {
      double v45 = v13;
      uint64_t v15 = [(__CFString *)v13 stringByAppendingString:@"Tentative"];

      double v13 = (__CFString *)v15;
    }
    if (self->_needsReply)
    {
      double v46 = v13;
      uint64_t v16 = [(__CFString *)v13 stringByAppendingString:@"NeedsReply"];

      double v13 = (__CFString *)v16;
    }
    id v43 = v13;
    if (self->_declined)
    {
      uint64_t v17 = [(__CFString *)v13 stringByAppendingString:@"Declined"];

      id v43 = (id)v17;
    }
    if ([(EKDayOccurrenceView *)self isCancelled])
    {
      uint64_t v18 = [v43 stringByAppendingString:@"Canceled"];

      id v43 = (id)v18;
    }
    double v8 = [(CUIKOROccurrenceState *)self->_currentImageState displayColor];

    if (v8)
    {
      double v19 = (void *)_updateColors___backgroundColorCache;
      double v20 = [(CUIKOROccurrenceState *)self->_currentImageState displayColor];
      double v8 = [v19 objectForKeyedSubscript:v20];

      if (!v8)
      {
        double v8 = objc_opt_new();
        double v21 = (void *)_updateColors___backgroundColorCache;
        double v22 = [(CUIKOROccurrenceState *)self->_currentImageState displayColor];
        [v21 setObject:v8 forKeyedSubscript:v22];
      }
    }
    double v23 = [v8 objectForKeyedSubscript:v43];
    if (v23) {
      goto LABEL_32;
    }
    double v24 = [(CUIKOROccurrenceState *)self->_currentImageState baseColor];
    if (self->_isReminder)
    {
      uint64_t v25 = [MEMORY[0x1E4F57BD8] reminderBackgroundColor:v10 style:v11 miniPreview:self->_isMiniPreviewInEventDetail completed:self->_isCompleted];
LABEL_29:
      id v26 = (id)v25;
LABEL_30:
      id v26 = v26;
      double v23 = v26;
LABEL_31:
      [v8 setObject:v23 forKeyedSubscript:v43];

LABEL_32:
      if (([(UIColor *)self->_stagedBackgroundColor isEqual:v23] & 1) == 0)
      {
        objc_storeStrong((id *)&self->_stagedBackgroundColor, v23);
        [(EKDayOccurrenceView *)self _invalidateAllImages];
      }
      goto LABEL_45;
    }
    if (v10)
    {
      if (self->_needsReply && ![(EKDayOccurrenceView *)self isCancelled])
      {
        CUIKSelectedNeedsReplyBackgroundColor();
        id v26 = (id)objc_claimAutoreleasedReturnValue();
        double v34 = (double *)MEMORY[0x1E4F57AF8];
        uint64_t v35 = CUIKSelectedNeedsReplyStripeColor();
      }
      else
      {
        if ([(EKDayOccurrenceView *)self isCancelled] || self->_declined)
        {
          uint64_t v25 = CUIKSelectedDeclinedBackgroundColor();
          goto LABEL_29;
        }
        if (!self->_tentative)
        {
          uint64_t v25 = [v24 colorWithAlphaComponent:*MEMORY[0x1E4F57AF8]];
          goto LABEL_29;
        }
        id v26 = [v24 colorWithAlphaComponent:1.0];
        double v34 = (double *)MEMORY[0x1E4F57AF8];
        uint64_t v35 = CUIKSelectedTentativeStripeColor();
      }
    }
    else
    {
      if (!self->_needsReply || [(EKDayOccurrenceView *)self isCancelled])
      {
        if ([(EKDayOccurrenceView *)self isCancelled] || self->_declined)
        {
          uint64_t v25 = CUIKDeclinedEventBackgroundColor();
          goto LABEL_29;
        }
        if (!self->_tentative)
        {
          uint64_t v25 = CUIKBackgroundColorForCalendarColorWithOpaqueForStyle();
          goto LABEL_29;
        }
        double v36 = CUIKLightStripeColorForColor();
        if (v11 != 1)
        {
          uint64_t v40 = CUIKColorDarkenedToPercentageWithFinalAlpha();

          double v36 = (void *)v40;
        }
        CUIKBackgroundColorForCalendarColorWithOpaqueForStyle();
        id v26 = (id)objc_claimAutoreleasedReturnValue();
        double v34 = (double *)MEMORY[0x1E4F57AE0];
        if (!v36) {
          goto LABEL_30;
        }
LABEL_64:
        double v37 = *v34;
        EKUIScaleFactor();
        double v38 = CUIKCreateStripedUIImage();
        double v39 = [MEMORY[0x1E4FB1618] colorWithPatternImage:v38];
        double v23 = [v39 colorWithAlphaComponent:v37];

        goto LABEL_31;
      }
      CUIKNeedsReplyBackgroundColor();
      id v26 = (id)objc_claimAutoreleasedReturnValue();
      double v34 = (double *)MEMORY[0x1E4F57AE0];
      uint64_t v35 = CUIKNeedsReplyStripeColor();
    }
    double v36 = (void *)v35;
    if (!v35) {
      goto LABEL_30;
    }
    goto LABEL_64;
  }
  [(EKDayOccurrenceView *)self setBackgroundColor:0];
  if (!self->_showsTravelTime) {
    return;
  }
  double v4 = [(EKDayOccurrenceView *)self traitCollection];
  uint64_t v5 = [v4 userInterfaceStyle];

  double v6 = [(CUIKOROccurrenceState *)self->_currentImageState displayColor];
  CUIKColorBarColor();
  id v43 = (id)objc_claimAutoreleasedReturnValue();

  double v7 = [(CUIKOROccurrenceState *)self->_currentImageState displayColor];
  uint64_t v42 = v5;
  LOBYTE(v41) = self->_birthday;
  double v8 = CUIKOccurrenceSecondaryTextColor();

  if (self->_selected)
  {
    id v9 = v8;
  }
  else
  {
    objc_msgSend(v43, "cuik_colorWithAlphaScaled:", 0.5, v41, v42);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  double v23 = v9;
  double v27 = [(EKDayOccurrenceTravelTimeView *)self->_travelTimeContentView colorBarColor];
  int v28 = [v27 isEqual:v43];

  if ((v28 & 1) == 0) {
    [(EKDayOccurrenceTravelTimeView *)self->_travelTimeContentView setColorBarColor:v43];
  }
  double v29 = [(EKDayOccurrenceTravelTimeView *)self->_travelTimeContentView lineColor];
  char v30 = [v29 isEqual:v23];

  if (v30)
  {
    int v31 = v28 ^ 1;
  }
  else
  {
    [(EKDayOccurrenceTravelTimeView *)self->_travelTimeContentView setLineColor:v23];
    int v31 = 1;
  }
  double v32 = [(EKDayOccurrenceTravelTimeView *)self->_travelTimeContentView elementColor];
  char v33 = [v32 isEqual:v8];

  if (v33)
  {
    if (!v31) {
      goto LABEL_45;
    }
  }
  else
  {
    [(EKDayOccurrenceTravelTimeView *)self->_travelTimeContentView setElementColor:v8];
  }
  [(EKDayOccurrenceView *)self _invalidateTravelTimeImage];
LABEL_45:
}

- (BOOL)_isTimedOccurrenceDrawingStyle
{
  return !self->_allDayDrawingStyle;
}

- (void)forceUpdateContentWithPayload:(id)a3
{
  id v4 = a3;
  [v4 requestOptions];
  if (!_bitmaskContainsOption()) {
    goto LABEL_5;
  }
  uint64_t v5 = [(UIImageView *)self->_eventBackgroundView image];
  if (v5)
  {

LABEL_5:
    int v6 = 0;
    goto LABEL_6;
  }
  if ([(EKDayOccurrenceView *)self _contentViewHasContent]) {
    goto LABEL_5;
  }
  [(EKDayOccurrenceView *)self setAlpha:0.0];
  int v6 = 1;
LABEL_6:
  if (_bitmaskContainsOption())
  {
    double v7 = [v4 backgroundImage];
    [(UIImageView *)self->_eventBackgroundView setImage:v7];

    double v8 = [(CUIKOROccurrenceState *)self->_currentImageState colorBarColor];
    p_eventBackgroundColorBar = &self->_eventBackgroundColorBar;
    [(UIView *)self->_eventBackgroundColorBar setBackgroundColor:v8];

    if (([(CUIKOROccurrenceState *)self->_currentImageState isReminder] & 1) == 0)
    {
      uint64_t v10 = [(CUIKOROccurrenceState *)self->_currentImageState isAllDay];
      goto LABEL_11;
    }
  }
  else
  {
    [(UIImageView *)self->_eventBackgroundView setImage:0];
    p_eventBackgroundColorBar = &self->_eventBackgroundColorBar;
  }
  uint64_t v10 = 1;
LABEL_11:
  [(UIView *)*p_eventBackgroundColorBar setHidden:v10];
  if (_bitmaskContainsOption())
  {
    uint64_t v11 = [v4 textImage];
    [(UIImageView *)self->_contentView setImage:v11];
  }
  else
  {
    [(UIImageView *)self->_contentView setImage:0];
  }
  if (_bitmaskContainsOption())
  {
    double v12 = [v4 travelTimeImage];
    [(UIImageView *)self->_travelBackgroundView setImage:v12];

    double v13 = [v4 travelTimeString];
    [(EKDayOccurrenceTravelTimeView *)self->_travelTimeContentView setTravelTimeString:v13];
  }
  stagedBackgroundColor = self->_stagedBackgroundColor;
  if (!stagedBackgroundColor)
  {
    [(EKDayOccurrenceView *)self _updateColors];
    stagedBackgroundColor = self->_stagedBackgroundColor;
  }
  [(EKDayOccurrenceView *)self setBackgroundColor:stagedBackgroundColor];
  if (v6)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __53__EKDayOccurrenceView_forceUpdateContentWithPayload___block_invoke;
    v15[3] = &unk_1E6087570;
    v15[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:2 delay:v15 options:0 animations:0.300000012 completion:0.0];
  }
  self->_needsContentCalc = 1;
  [(EKDayOccurrenceView *)self _updateContentImageViewIfNeeded];
}

- (void)_updateContentImageViewIfNeeded
{
  if (!self->_needsContentCalc) {
    return;
  }
  if (self->_allDayDrawingStyle)
  {
    [(UIImageView *)self->_contentView frame];
    CGFloat v4 = v3;
    CGFloat v6 = v5;
    [(EKDayOccurrenceView *)self _contentViewContentSize];
    double v8 = v7;
    double v10 = v9;
    [(EKDayOccurrenceView *)self bounds];
    double Height = CGRectGetHeight(v18);
    v19.origin.CGFloat x = v4;
    v19.origin.CGFloat y = v6;
    v19.size.CGFloat width = v8;
    v19.size.CGFloat height = v10;
    double v12 = (Height - CGRectGetHeight(v19)) * 0.5;
    [(EKDayOccurrenceView *)self _frameForText];
    double MinX = CGRectGetMinX(v20);
LABEL_4:
    -[UIImageView setFrame:](self->_contentView, "setFrame:", MinX, v12, v8, v10);
    if (self->_showsTravelTime)
    {
      [(UIImageView *)self->_travelBackgroundView frame];
      -[EKDayOccurrenceTravelTimeView setFrame:](self->_travelTimeContentView, "setFrame:");
      [(EKDayOccurrenceView *)self bringSubviewToFront:self->_travelTimeContentView];
      [(EKDayOccurrenceTravelTimeView *)self->_travelTimeContentView setNeedsLayout];
    }
    self->_needsContentCalc = 0;
    [(EKDayOccurrenceView *)self _updateCornerRadius];
    return;
  }
  if (!self->_needsBackgroundImageUpdate)
  {
    [(EKDayOccurrenceView *)self _frameForText];
    double v12 = v14;
    double v8 = v15;
    double v10 = v16;
    goto LABEL_4;
  }

  [(EKDayOccurrenceView *)self setNeedsLayout];
}

- (UIEdgeInsets)margin
{
  double top = self->_margin.top;
  double left = self->_margin.left;
  double bottom = self->_margin.bottom;
  double right = self->_margin.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)isBirthday
{
  return self->_birthday;
}

- (void)_updateAppEntityAnnotationState
{
  if (CalendarLinkLibraryCore() && (*((unsigned char *)self + 488) & 0x10) != 0)
  {
    BOOL v3 = [(EKDayOccurrenceView *)self isSelected];
    [(EKDayOccurrenceView *)self Cal_updateEntityAnnotationStateIsSelected:v3 isHighlighted:0 isFocused:0 isDisabled:0 isEditing:0 isPrimary:0];
  }
}

- (CGRect)_frameMutatedForProximityToHourLine:(CGRect)a3
{
  double height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CalRoundToScreenScale(0.5);
  double v8 = y + v7;
  CalRoundToScreenScale(0.5);
  double v10 = height - v9;
  double v11 = x;
  double v12 = v8;
  double v13 = width;
  result.size.double height = v10;
  result.size.CGFloat width = v13;
  result.origin.double y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (BOOL)isSelectedCopyView
{
  return self->_isSelectedCopyView;
}

+ (double)barToBarGapWidth
{
  [MEMORY[0x1E4F57BB8] occurrencePadding];
  return result;
}

- (int64_t)userInterfaceStyle
{
  double v2 = [(EKDayOccurrenceView *)self traitCollection];
  int64_t v3 = [v2 userInterfaceStyle];

  return v3;
}

- (int64_t)horizontalSizeClass
{
  double v2 = [(EKDayOccurrenceView *)self traitCollection];
  int64_t v3 = [v2 horizontalSizeClass];

  return v3;
}

- (CGRect)_frameForText
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  [(CUIKOROccurrenceState *)self->_currentImageState estimatedTextFrame];
  CGFloat x = v3;
  double y = v5;
  double v8 = v7;
  double v10 = v9;
  if (self->_bottomPinningState)
  {
    double height = self->_unpinnedEventBackgroundFrame.size.height;
  }
  else
  {
    [(UIImageView *)self->_eventBackgroundView frame];
    double height = v12;
  }
  if ([(EKDayOccurrenceView *)self _contentViewHasContent])
  {
    [(EKDayOccurrenceView *)self _contentViewContentSize];
    if (v13 >= 3.0 && height >= 3.0)
    {
      if (self->_reduceLayoutProcessingForAnimation)
      {
        CGFloat x = self->_contentLocationDuringReducedProcessing.x;
        double y = self->_contentLocationDuringReducedProcessing.y;
        double v10 = height - y;
      }
      else
      {
        [(EKDayOccurrenceView *)self _contentViewContentSize];
        double v16 = v15;
        uint64_t v17 = [(EKDayOccurrenceView *)self occurrences];
        unint64_t v18 = [v17 count];

        uint64_t v19 = 3;
        if (v18 < 3) {
          uint64_t v19 = v18;
        }
        double v20 = CalFloorToScreenScale((height - ((double)(unint64_t)(v19 - 1) + (double)(unint64_t)(v19 - 1)))
                                  * 0.5 - v16 * 0.5);
        [(UIImageView *)self->_eventBackgroundView frame];
        if (y >= v20 + v21) {
          double y = v20 + v21;
        }
        if (y <= -5.0)
        {
          double v22 = (void *)kEKUILogHandle;
          if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
          {
            double v23 = v22;
            double v24 = [(EKDayOccurrenceView *)self occurrence];
            int v29 = 134218498;
            double v30 = y;
            __int16 v31 = 2048;
            double v32 = height;
            __int16 v33 = 2112;
            double v34 = v24;
            _os_log_impl(&dword_1B3F4C000, v23, OS_LOG_TYPE_DEBUG, "Origin value is negative: %f, Background height: %f, Occurence: %@", (uint8_t *)&v29, 0x20u);
          }
        }
        if (v10 < v16) {
          double v10 = v16;
        }
      }
    }
  }
  double v25 = x;
  double v26 = y;
  double v27 = v8;
  double v28 = v10;
  result.size.double height = v28;
  result.size.CGFloat width = v27;
  result.origin.double y = v26;
  result.origin.CGFloat x = v25;
  return result;
}

- (NSArray)occurrences
{
  return self->_occurrences;
}

- (CGSize)_contentViewContentSize
{
  double v2 = [(UIImageView *)self->_contentView image];
  [v2 size];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.CGFloat width = v7;
  return result;
}

- (BOOL)_contentViewHasContent
{
  double v2 = [(UIImageView *)self->_contentView image];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (double)minimumHeightForSizeClass:(int64_t)a3 orientation:(int64_t)a4 isAllDay:(BOOL)a5 usesSmallText:(BOOL)a6
{
  if (a5)
  {
    [a1 heightForAllDayOccurrenceForSizeClass:a3 usesSmallText:a6];
  }
  else
  {
    +[EKDayTimeView hourHeightForSizeClass:orientation:](EKDayTimeView, "hourHeightForSizeClass:orientation:", a3, a4, a5, a6);
    double v9 = round(v8 * 0.5);
    +[EKDayOccurrenceView bottomShadowMargin];
    return v9 + v10;
  }
  return result;
}

+ (double)minimumHeightForSizeClass:(int64_t)a3 orientation:(int64_t)a4 isAllDay:(BOOL)a5
{
  BOOL v5 = a5;
  double v8 = objc_opt_class();

  [v8 minimumHeightForSizeClass:a3 orientation:a4 isAllDay:v5 usesSmallText:0];
  return result;
}

+ (double)heightForAllDayOccurrenceForSizeClass:(int64_t)a3 usesSmallText:(BOOL)a4
{
  if (a3 == 2) {
    double v6 = 22.0;
  }
  else {
    double v6 = 17.0;
  }
  if (a3 != 2 && !a4)
  {
    CalRoundToScreenScale(23.5);
    double v6 = v7;
  }
  if (a4) {
    [MEMORY[0x1E4F57BB0] defaultOccurrenceSmallPrimaryTextFontForSizeClass:a3];
  }
  else {
  double v8 = [MEMORY[0x1E4F57BB0] defaultOccurrencePrimaryTextFontForSizeClass:a3];
  }
  [v8 lineHeight];
  double v10 = v9;
  [MEMORY[0x1E4F57BB8] occurrencePadding];
  CalRoundToScreenScale(v10 + v11 * 2.0);
  if (v6 < v12) {
    double v6 = v12;
  }

  return v6;
}

uint64_t __49__EKDayOccurrenceView_setBottomPinningProximity___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 600) setAlpha:0.0];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 600), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  double v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[75];

  return [v2 addSubview:v3];
}

+ (void)_clearViewCache
{
  id v2 = [a1 _viewCache];
  [v2 removeAllObjects];
}

+ (void)clearCaches
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  [(EKDayOccurrenceView *)self frame];
  BOOL v5 = objc_msgSend(v4, "initWithFrame:");
  double v6 = [(EKDayOccurrenceView *)self delegate];
  [v5 setDelegate:v6];

  double v7 = [(EKDayOccurrenceView *)self occurrences];
  [v5 setOccurrences:v7];

  objc_msgSend(v5, "setOccurrenceDateIndex:", -[EKDayOccurrenceView occurrenceDateIndex](self, "occurrenceDateIndex"));
  objc_msgSend(v5, "setDimmed:", -[EKDayOccurrenceView dimmed](self, "dimmed"));
  objc_msgSend(v5, "setHideText:", -[EKDayOccurrenceView hideText](self, "hideText"));
  objc_msgSend(v5, "setHidden:", -[EKDayOccurrenceView isHidden](self, "isHidden"));
  [(EKDayOccurrenceView *)self alpha];
  objc_msgSend(v5, "setAlpha:");
  objc_msgSend(v5, "setSelected:", -[EKDayOccurrenceView selected](self, "selected"));
  objc_msgSend(v5, "setTentative:", -[EKDayOccurrenceView isTentative](self, "isTentative"));
  objc_msgSend(v5, "setDeclined:", -[EKDayOccurrenceView isDeclined](self, "isDeclined"));
  objc_msgSend(v5, "setNeedsReply:", -[EKDayOccurrenceView needsReply](self, "needsReply"));
  objc_msgSend(v5, "setCancelled:", -[EKDayOccurrenceView isCancelled](self, "isCancelled"));
  objc_msgSend(v5, "setUsesSmallText:", -[EKDayOccurrenceView usesSmallText](self, "usesSmallText"));
  objc_msgSend(v5, "setOccurrenceIsFirstVisibleDayOfEvent:", -[EKDayOccurrenceView occurrenceIsFirstVisibleDayOfEvent](self, "occurrenceIsFirstVisibleDayOfEvent"));
  objc_msgSend(v5, "setDrawsResizeHandles:", -[EKDayOccurrenceView drawsResizeHandles](self, "drawsResizeHandles"));
  [(EKDayOccurrenceView *)self margin];
  objc_msgSend(v5, "setMargin:");
  [(EKDayOccurrenceView *)self padding];
  objc_msgSend(v5, "setPadding:");
  objc_msgSend(v5, "setAllDay:", -[EKDayOccurrenceView isAllDay](self, "isAllDay"));
  objc_msgSend(v5, "setAllDayDrawingStyle:", -[EKDayOccurrenceView allDayDrawingStyle](self, "allDayDrawingStyle"));
  objc_msgSend(v5, "setIsProposedTime:", -[EKDayOccurrenceView isProposedTime](self, "isProposedTime"));
  objc_msgSend(v5, "setContentMode:", -[EKDayOccurrenceView contentMode](self, "contentMode"));
  objc_msgSend(v5, "setBirthday:", -[EKDayOccurrenceView isBirthday](self, "isBirthday"));
  objc_msgSend(v5, "setShowsTravelTime:", -[EKDayOccurrenceView showsTravelTime](self, "showsTravelTime"));
  [(EKDayOccurrenceView *)self travelTime];
  objc_msgSend(v5, "setTravelTime:");
  [(EKDayOccurrenceView *)self travelTimeSubviewHeightInPoints];
  objc_msgSend(v5, "setTravelTimeSubviewHeightInPoints:");
  objc_msgSend(v5, "setRoutingMode:", -[EKDayOccurrenceView routingMode](self, "routingMode"));
  objc_msgSend(v5, "setIsSelectedCopyView:", -[EKDayOccurrenceView isSelectedCopyView](self, "isSelectedCopyView"));
  double v8 = [(EKDayOccurrenceView *)self selectedCopy];
  [v5 setSelectedCopy:v8];

  objc_msgSend(v5, "setHasPrecedingDuration:", -[EKDayOccurrenceView hasPrecedingDuration](self, "hasPrecedingDuration"));
  objc_msgSend(v5, "setHasTrailingDuration:", -[EKDayOccurrenceView hasTrailingDuration](self, "hasTrailingDuration"));
  objc_msgSend(v5, "setMultiAllDayRoundCorners:", -[EKDayOccurrenceView multiAllDayRoundCorners](self, "multiAllDayRoundCorners"));
  return v5;
}

+ (double)minimumHeightForSizeClass:(int64_t)a3 orientation:(int64_t)a4
{
  double v6 = objc_opt_class();

  [v6 minimumHeightForSizeClass:a3 orientation:a4 isAllDay:0];
  return result;
}

+ (double)bottomShadowMargin
{
  return 0.0;
}

+ (CGRect)contentStretchRectForFrame:(CGRect)a3
{
  double v3 = 2.0 / a3.size.height;
  double v4 = (a3.size.height + -4.0) / a3.size.height;
  double v5 = 0.0;
  double v6 = 1.0;
  result.size.double height = v4;
  result.size.CGFloat width = v6;
  result.origin.double y = v3;
  result.origin.CGFloat x = v5;
  return result;
}

+ (id)viewForExternalDragOperationFromEvent:(id)a3 visiblePath:(id *)a4
{
  id v5 = a3;
  if ([v5 isReminderIntegrationEvent])
  {
    double v6 = EKUIListViewReminderCell;
LABEL_5:
    id v7 = (id)[[v6 alloc] initForDragPreview];
    [v7 updateWithEvent:v5 dimmed:0];
    goto LABEL_7;
  }
  if ([v5 isAllDay])
  {
    double v6 = EKUIListViewAllDayEventCell;
    goto LABEL_5;
  }
  id v7 = [[EKUIListViewTimedEventCell alloc] initForDragPreview];
  double v10 = [v5 startDate];
  [v7 updateWithEvent:v5 isMultiday:0 occurrenceStartDate:v10 dimmed:0];

LABEL_7:
  LODWORD(v8) = 1148846080;
  LODWORD(v9) = 1.0;
  objc_msgSend(v7, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", 300.0, 200.0, v8, v9);
  objc_msgSend(v7, "setBounds:", 0.0, 0.0, v11, v12);
  double v13 = objc_opt_class();
  [v7 bounds];
  objc_msgSend(v13, "pathForBackgroundForRect:allDay:", objc_msgSend(v5, "isAllDay"), v14, v15, v16, v17);
  *a4 = (id)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)dealloc
{
  [(UIView *)self->_startResizeHandle removeFromSuperview];
  [(UIView *)self->_endResizeHandle removeFromSuperview];
  v3.receiver = self;
  v3.super_class = (Class)EKDayOccurrenceView;
  [(EKDayOccurrenceView *)&v3 dealloc];
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v21.receiver = self;
  v21.super_class = (Class)EKDayOccurrenceView;
  double v4 = [(EKDayOccurrenceView *)&v21 description];
  [v3 appendString:v4];

  id v5 = [(EKDayOccurrenceView *)self occurrence];
  double v6 = [v5 title];
  [v3 appendFormat:@"title:     %@\n", v6];

  id v7 = [(EKDayOccurrenceView *)self occurrence];
  double v8 = [v7 location];
  [v3 appendFormat:@"location:  %@\n", v8];

  double v9 = [(EKDayOccurrenceView *)self occurrence];
  double v10 = [v9 calendar];
  double v11 = [v10 title];
  [v3 appendFormat:@"calendar:  %@\n", v11];

  double v12 = [(EKDayOccurrenceView *)self occurrence];
  double v13 = [v12 startCalendarDate];
  [v3 appendFormat:@"startDate: %@\n", v13];

  double v14 = [(EKDayOccurrenceView *)self occurrence];
  double v15 = [v14 endCalendarDate];
  [v3 appendFormat:@"endDate:   %@\n", v15];

  [(EKDayOccurrenceView *)self frame];
  double v16 = NSStringFromRect(v23);
  [v3 appendFormat:@"frame:     %@\n", v16];

  double v17 = objc_msgSend(NSNumber, "numberWithBool:", -[EKDayOccurrenceView isSelectedCopyView](self, "isSelectedCopyView"));
  [v3 appendFormat:@"isSelectedCopyView:     %@\n", v17];

  unint64_t v18 = [(EKDayOccurrenceView *)self selectedCopy];
  [v3 appendFormat:@"selectedCopy:     %@\n", v18];

  uint64_t v19 = [NSString stringWithString:v3];

  return (NSString *)v19;
}

- (void)forceUpdateColors
{
  self->_needsContentCalc = 1;
  self->_needsBackgroundImageUpdate = 1;
  [(EKDayOccurrenceView *)self _invalidateAllImages];
  [(CUIKOROccurrenceState *)self->_currentImageState performChangesWithState:self];
  [(EKDayOccurrenceView *)self _updateColors];
  [(EKDayOccurrenceView *)self requestContentIfNeeded:16 completion:0];
  [(EKDayOccurrenceView *)self setNeedsLayout];

  [(EKDayOccurrenceView *)self updateAlpha];
}

- (BOOL)shouldAnnotateAppEntities
{
  return (*((unsigned __int8 *)self + 488) >> 3) & 1;
}

- (void)_addTravelTimeSubviews
{
  travelTimeContentView = self->_travelTimeContentView;
  BOOL v4 = travelTimeContentView == 0;
  if (!travelTimeContentView)
  {
    id v5 = objc_alloc_init(EKDayOccurrenceTravelTimeView);
    double v6 = self->_travelTimeContentView;
    self->_travelTimeContentView = v5;
  }
  if (!self->_travelBackgroundView)
  {
    id v7 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    travelBackgroundView = self->_travelBackgroundView;
    self->_travelBackgroundView = v7;

    double v9 = [(UIImageView *)self->_travelBackgroundView layer];
    [v9 setCornerRadius:4.0];

    double v10 = [(UIImageView *)self->_travelBackgroundView layer];
    BOOL v4 = 1;
    [v10 setMasksToBounds:1];

    double v11 = [(UIImageView *)self->_travelBackgroundView layer];
    [v11 setMaskedCorners:3];
  }
  double v12 = [(EKDayOccurrenceTravelTimeView *)self->_travelTimeContentView superview];

  if (!v12)
  {
    [(EKDayOccurrenceTravelTimeView *)self->_travelTimeContentView setAccessibilityIdentifier:@"_travelTimeContentView"];
    [(EKDayOccurrenceView *)self addSubview:self->_travelTimeContentView];
    BOOL v4 = 1;
  }
  double v13 = [(UIImageView *)self->_travelBackgroundView superview];

  if (v13)
  {
    if (!v4) {
      return;
    }
  }
  else
  {
    [(EKDayOccurrenceTravelTimeView *)self->_travelTimeContentView setAccessibilityIdentifier:@"_travelBackgroundView"];
    [(EKDayOccurrenceView *)self addSubview:self->_travelBackgroundView];
  }
  self->_needsContentCalc = 1;
  self->_needsBackgroundImageUpdate = 1;

  [(EKDayOccurrenceView *)self _updateColors];
}

- (void)_removeTravelTimeSubviews
{
  self->_needsContentCalc = 1;
  self->_needsBackgroundImageUpdate = 1;
}

- (void)setShowsTravelTime:(BOOL)a3
{
  if (self->_showsTravelTime != a3)
  {
    self->_showsTravelTime = a3;
    if (a3) {
      [(EKDayOccurrenceView *)self _addTravelTimeSubviews];
    }
    else {
      [(EKDayOccurrenceView *)self _removeTravelTimeSubviews];
    }
    [(EKDayOccurrenceView *)self _invalidateTravelTimeImage];
    [(EKDayOccurrenceView *)self setNeedsLayout];
    [(EKDayOccurrenceView *)self _updateCornerRadius];
  }
}

- (UIEdgeInsets)padding
{
  double top = self->_padding.top;
  double left = self->_padding.left;
  double bottom = self->_padding.bottom;
  double right = self->_padding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (int64_t)routingMode
{
  return [(EKDayOccurrenceTravelTimeView *)self->_travelTimeContentView routingMode];
}

- (void)setOccurrence:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v5 = (EKEvent *)a3;
  double v6 = v5;
  if (v5)
  {
    v9[0] = v5;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    occurrences = self->_occurrences;
    self->_occurrences = v7;
  }
  else
  {
    occurrences = self->_occurrences;
    self->_occurrences = (NSArray *)MEMORY[0x1E4F1CBF0];
  }

  if (self->_occurrence != v6)
  {
    objc_storeStrong((id *)&self->_occurrence, a3);
    [(EKDayOccurrenceView *)self setupWithOccurrence:v6];
  }
}

- (EKCalendarDate)occurrenceDate
{
  id v3 = [(EKDayOccurrenceView *)self occurrence];
  BOOL v4 = [v3 startCalendarDate];
  id v5 = objc_msgSend(v4, "calendarDateByAddingDays:", -[EKDayOccurrenceView occurrenceDateIndex](self, "occurrenceDateIndex"));

  return (EKCalendarDate *)v5;
}

- (void)_invalidateContentBounds
{
  self->_needsContentCalc = 1;
  [(EKDayOccurrenceView *)self _invalidateCurrentRequest];
  [(EKDayOccurrenceView *)self _invalidateTextImage];

  [(EKDayOccurrenceView *)self setNeedsLayout];
}

- (BOOL)isReminderStack
{
  return [(NSArray *)self->_occurrences count] > 1;
}

uint64_t __54__EKDayOccurrenceView_setAllDayDrawingStyle_animated___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 416) removeFromSuperview];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 416);
  *(void *)(v2 + 416) = 0;

  uint64_t result = [*(id *)(a1 + 32) _removeTravelTimeSubviews];
  *(unsigned char *)(*(void *)(a1 + 32) + 457) = 1;
  return result;
}

uint64_t __54__EKDayOccurrenceView_setAllDayDrawingStyle_animated___block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4FB1838]);
  [*(id *)(a1 + 32) bounds];
  uint64_t v3 = objc_msgSend(v2, "initWithFrame:");
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 416);
  *(void *)(v4 + 416) = v3;

  [*(id *)(*(void *)(a1 + 32) + 416) setAutoresizingMask:16];
  double v6 = [*(id *)(*(void *)(a1 + 32) + 416) layer];
  [v6 setMasksToBounds:1];

  [*(id *)(a1 + 32) insertSubview:*(void *)(*(void *)(a1 + 32) + 416) atIndex:0];
  id v7 = *(unsigned char **)(a1 + 32);
  if (v7[708])
  {
    [v7 _addTravelTimeSubviews];
    id v7 = *(unsigned char **)(a1 + 32);
  }
  v7[457] = 1;
  double v8 = *(void **)(a1 + 32);

  return [v8 _invalidateBackgroundImage];
}

void __36__EKDayOccurrenceView__updateColors__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)_updateColors___backgroundColorCache;
  _updateColors___backgroundColorCache = v0;
}

- (void)removeFromSuperview
{
  uint64_t v3 = [(id)objc_opt_class() _viewCache];
  uint64_t v4 = v3;
  if (v3)
  {
    if ((unint64_t)[v3 count] <= 9)
    {
      id v5 = [(EKDayOccurrenceView *)self superview];

      if (v5) {
        [v4 addObject:self];
      }
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)EKDayOccurrenceView;
  [(EKDayOccurrenceView *)&v6 removeFromSuperview];
}

- (void)animateToFrame:(CGRect)a3 isAllDay:(BOOL)a4 beginFromCurrentState:(BOOL)a5 whenFinished:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v13 = a6;
  [(EKDayOccurrenceView *)self frame];
  v28.origin.CGFloat x = v14;
  v28.origin.CGFloat y = v15;
  v28.size.CGFloat width = v16;
  v28.size.CGFloat height = v17;
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  if (!CGRectEqualToRect(v27, v28))
  {
    BOOL v18 = [(EKDayOccurrenceView *)self drawsResizeHandles];
    if (v7) {
      [(EKDayOccurrenceView *)self setDrawsResizeHandles:0];
    }
    uint64_t v19 = (void *)MEMORY[0x1E4FB1EB0];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __82__EKDayOccurrenceView_animateToFrame_isAllDay_beginFromCurrentState_whenFinished___block_invoke;
    v25[3] = &unk_1E608AFF8;
    if (v6) {
      uint64_t v20 = 4;
    }
    else {
      uint64_t v20 = 0;
    }
    v25[4] = self;
    *(CGFloat *)&v25[5] = x;
    *(CGFloat *)&v25[6] = y;
    *(CGFloat *)&v25[7] = width;
    *(CGFloat *)&v25[8] = height;
    BOOL v26 = v7;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __82__EKDayOccurrenceView_animateToFrame_isAllDay_beginFromCurrentState_whenFinished___block_invoke_2;
    v21[3] = &unk_1E608B020;
    BOOL v23 = v7;
    v21[4] = self;
    BOOL v24 = v18;
    id v22 = v13;
    [v19 animateWithDuration:v20 delay:v25 options:v21 animations:0.2 completion:0.0];
  }
}

uint64_t __82__EKDayOccurrenceView_animateToFrame_isAllDay_beginFromCurrentState_whenFinished___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  [*(id *)(a1 + 32) setAllDay:*(unsigned __int8 *)(a1 + 72)];
  id v2 = *(void **)(a1 + 32);

  return [v2 requestContentIfNeeded:16 completion:0];
}

uint64_t __82__EKDayOccurrenceView_animateToFrame_isAllDay_beginFromCurrentState_whenFinished___block_invoke_2(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 48))
  {
    [*(id *)(a1 + 32) alpha];
    if (v2 > 0.0 && ([*(id *)(a1 + 32) isHidden] & 1) == 0) {
      [*(id *)(a1 + 32) setDrawsResizeHandles:*(unsigned __int8 *)(a1 + 49)];
    }
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (id)_newResizeHandleView
{
  uint64_t v3 = -[EKDayOccurrenceResizeHandleView initWithFrame:occurrenceView:]([EKDayOccurrenceResizeHandleView alloc], "initWithFrame:occurrenceView:", self, 0.0, 0.0, 61.0, 61.0);
  [(EKDayOccurrenceResizeHandleView *)v3 setUserInteractionEnabled:[(EKDayOccurrenceView *)self isUserInteractionEnabled]];
  return v3;
}

uint64_t __45__EKDayOccurrenceView_setDrawsResizeHandles___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 464) frame];
  double v6 = CalRoundRectToScreenScale(v2, v3, v4, v5);
  BOOL v7 = *(void **)(*(void *)(a1 + 32) + 464);

  return [v7 setFrame:v6];
}

uint64_t __45__EKDayOccurrenceView_setDrawsResizeHandles___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 472) frame];
  double v6 = CalRoundRectToScreenScale(v2, v3, v4, v5);
  BOOL v7 = *(void **)(*(void *)(a1 + 32) + 472);

  return [v7 setFrame:v6];
}

uint64_t __45__EKDayOccurrenceView_setDrawsResizeHandles___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

uint64_t __45__EKDayOccurrenceView_setDrawsResizeHandles___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (CGRect)frameOfOpaqueContent
{
  eventBackgroundView = self->_eventBackgroundView;
  if (eventBackgroundView
    && ([(UIImageView *)eventBackgroundView superview],
        double v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    [(UIImageView *)self->_eventBackgroundView bounds];
    -[EKDayOccurrenceView convertRect:fromView:](self, "convertRect:fromView:", self->_eventBackgroundView);
  }
  else
  {
    [(EKDayOccurrenceView *)self frame];
  }
  result.size.CGFloat height = v8;
  result.size.CGFloat width = v7;
  result.origin.CGFloat y = v6;
  result.origin.CGFloat x = v5;
  return result;
}

- (void)requestContentIfNeeded:(unint64_t)a3 completion:(id)a4
{
  char v4 = a3;
  id v6 = a4;
  if (self->_invalidatedRequestOptions)
  {
    [(CUIKOROccurrenceState *)self->_currentImageState performChangesWithState:self];
    [(EKDayOccurrenceView *)self _updateContentImageViewIfNeeded];
    unint64_t invalidatedRequestOptions = self->_invalidatedRequestOptions;
    BOOL drawsResizeHandles = self->_drawsResizeHandles;
    objc_initWeak(&location, self);
    double v9 = [MEMORY[0x1E4F57BC8] sharedProvider];
    if (drawsResizeHandles) {
      uint64_t v10 = invalidatedRequestOptions | v4 & 0x18 | 0x20;
    }
    else {
      uint64_t v10 = invalidatedRequestOptions | v4 & 0x18;
    }
    currentImageState = self->_currentImageState;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __57__EKDayOccurrenceView_requestContentIfNeeded_completion___block_invoke;
    v13[3] = &unk_1E608B048;
    objc_copyWeak(&v15, &location);
    id v14 = v6;
    int64_t v12 = [v9 requestPayloadForState:currentImageState requestOptions:v10 resultHandler:v13];

    if ((v12 & 0x8000000000000000) == 0)
    {
      self->_currentRequestId = v12;
      self->_unint64_t invalidatedRequestOptions = 0;
    }

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

uint64_t __57__EKDayOccurrenceView_requestContentIfNeeded_completion___block_invoke(uint64_t a1, void *a2)
{
  double v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _updateContentWithPayload:v4];

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    double v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

- (void)_updateContentWithPayload:(id)a3
{
  id v7 = a3;
  char v4 = [v7 requestOptions];
  int64_t currentRequestId = self->_currentRequestId;
  uint64_t v6 = [v7 requestId];
  if ((v4 & 0x10) != 0 || currentRequestId == v6) {
    [(EKDayOccurrenceView *)self forceUpdateContentWithPayload:v7];
  }
}

uint64_t __53__EKDayOccurrenceView_forceUpdateContentWithPayload___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)EKDayOccurrenceView;
  BOOL v9 = 1;
  if (!-[EKDayOccurrenceView pointInside:withEvent:](&v11, sel_pointInside_withEvent_, v7, x, y))
  {
    startResizeHandle = self->_startResizeHandle;
    if (!startResizeHandle
      || !-[UIView pointInside:withEvent:](startResizeHandle, "pointInside:withEvent:", v7, x, y)
      && !-[UIView pointInside:withEvent:](self->_endResizeHandle, "pointInside:withEvent:", v7, x, y))
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(EKDayOccurrenceView *)self setTouchesAreBeingTracked:1];
  if ([v6 count] == 1)
  {
    double v8 = [v6 anyObject];
  }
  else
  {
    double v8 = 0;
  }
  v14.receiver = self;
  v14.super_class = (Class)EKDayOccurrenceView;
  [(EKDayOccurrenceView *)&v14 touchesBegan:v6 withEvent:v7];
  if (v8)
  {
    [v8 locationInView:self];
    double v10 = v9;
    double v12 = v11;
    if (-[EKDayOccurrenceView pointInside:withEvent:](self, "pointInside:withEvent:", v7))
    {
      if ([(EKDayOccurrenceView *)self isReminder])
      {
        if (-[EKDayOccurrenceView pointInsideReminderCheckbox:](self, "pointInsideReminderCheckbox:", v10, v12)) {
          char v13 = 2;
        }
        else {
          char v13 = 0;
        }
      }
      else
      {
        char v13 = 0;
      }
      *((unsigned char *)self + 488) = *((unsigned char *)self + 488) & 0xFD | v13;
      *((unsigned char *)self + 488) |= 1u;
    }
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count] == 1)
  {
    double v8 = [v6 anyObject];
  }
  else
  {
    double v8 = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)EKDayOccurrenceView;
  [(EKDayOccurrenceView *)&v9 touchesMoved:v6 withEvent:v7];
  if (v8)
  {
    [v8 locationInView:self];
    if (!-[EKDayOccurrenceView pointInside:withEvent:](self, "pointInside:withEvent:", v7)) {
      *((unsigned char *)self + 488) &= ~1u;
    }
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count] == 1)
  {
    double v8 = [v6 anyObject];
  }
  else
  {
    double v8 = 0;
  }
  v27.receiver = self;
  v27.super_class = (Class)EKDayOccurrenceView;
  [(EKDayOccurrenceView *)&v27 touchesEnded:v6 withEvent:v7];
  if ([(EKDayOccurrenceView *)self touchesAreBeingTracked])
  {
    if (v8)
    {
      [v8 locationInView:self];
      double v10 = v9;
      double v12 = v11;
      if (![(EKDayOccurrenceView *)self isReminder]
        || (*((unsigned char *)self + 488) & 2) == 0
        || [(EKDayOccurrenceView *)self isReminderStack])
      {
        if (!-[EKDayOccurrenceView pointInside:withEvent:](self, "pointInside:withEvent:", v7, v10, v12)) {
          goto LABEL_23;
        }
        if ((*((unsigned char *)self + 488) & 1) == 0) {
          goto LABEL_23;
        }
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        char v14 = objc_opt_respondsToSelector();

        if ((v14 & 1) == 0) {
          goto LABEL_23;
        }
        id v15 = objc_loadWeakRetained((id *)&self->_delegate);
        [v15 dayOccurrenceViewSelected:self source:0];
        goto LABEL_22;
      }
      if (-[EKDayOccurrenceView pointInsideReminderCheckbox:](self, "pointInsideReminderCheckbox:", v10, v12))
      {
        CGFloat v16 = [(EKDayOccurrenceView *)self occurrence];
        int v17 = objc_msgSend(v16, "CUIK_reminderShouldBeEditable");

        if (v17)
        {
          id v15 = [(EKDayOccurrenceView *)self occurrence];
          [v15 setCompleted:[v15 completed] ^ 1];
          BOOL v18 = [(UIResponder *)self EKUI_editor];
          id v26 = 0;
          char v19 = [v18 saveEvent:v15 span:0 error:&v26];
          id v20 = v26;

          if (v19) {
            goto LABEL_21;
          }
          uint64_t v21 = kEKUILogHandle;
          if (!os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR)) {
            goto LABEL_21;
          }
          *(_DWORD *)buf = 138412290;
          id v29 = v20;
          id v22 = "Error saving completion state: %@";
          BOOL v23 = v21;
          os_log_type_t v24 = OS_LOG_TYPE_ERROR;
LABEL_20:
          _os_log_impl(&dword_1B3F4C000, v23, v24, v22, buf, 0xCu);
LABEL_21:

LABEL_22:
          goto LABEL_23;
        }
        double v25 = (void *)kEKUILogHandle;
        if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
        {
          id v15 = v25;
          id v20 = [(EKDayOccurrenceView *)self occurrence];
          *(_DWORD *)buf = 138412290;
          id v29 = v20;
          id v22 = "Tapped reminder isn't editable: %@";
          BOOL v23 = v15;
          os_log_type_t v24 = OS_LOG_TYPE_DEBUG;
          goto LABEL_20;
        }
      }
    }
LABEL_23:
    [(EKDayOccurrenceView *)self setTouchesAreBeingTracked:0];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  *((unsigned char *)self + 488) &= ~1u;
  id v6 = a4;
  id v7 = a3;
  [(EKDayOccurrenceView *)self setTouchesAreBeingTracked:0];
  v8.receiver = self;
  v8.super_class = (Class)EKDayOccurrenceView;
  [(EKDayOccurrenceView *)&v8 touchesCancelled:v7 withEvent:v6];
}

- (BOOL)pointInsideReminderCheckbox:(CGPoint)a3
{
  double x = a3.x;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  double v5 = [(CUIKOROccurrenceState *)self->_currentImageState trailingIcons];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v7 = [(CUIKOROccurrenceState *)self->_currentImageState trailingIcons];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v44 objects:v48 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v45;
      double v11 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v45 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v44 + 1) + 8 * i) size];
          double v14 = v11 + v13;
          [MEMORY[0x1E4F57BB8] occurrencePadding];
          double v11 = v14 + v15;
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v44 objects:v48 count:16];
      }
      while (v9);
    }
    else
    {
      double v11 = 0.0;
    }
  }
  else
  {
    double v11 = 0.0;
  }
  [(CUIKOROccurrenceState *)self->_currentImageState textSpace];
  double v17 = v16;
  BOOL v18 = [(CUIKOROccurrenceState *)self->_currentImageState leadingIcon];
  [v18 size];
  double v20 = v17 - (v11 + v19);
  [MEMORY[0x1E4F57BB8] hideIconBreakpoint];
  double v22 = v21;

  if (v20 < v22) {
    return 0;
  }
  os_log_type_t v24 = [(CUIKOROccurrenceState *)self->_currentImageState leadingIcon];
  [(UIImageView *)self->_contentView frame];
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  __int16 v33 = [MEMORY[0x1E4F57B90] shared];
  int v34 = [v33 interfaceIsLeftToRight];

  uint64_t v35 = v26;
  uint64_t v36 = v28;
  uint64_t v37 = v30;
  uint64_t v38 = v32;
  if (v34)
  {
    double MinX = CGRectGetMinX(*(CGRect *)&v35);
    [v24 size];
    BOOL v23 = x < MinX + v40 + 5.0;
  }
  else
  {
    double MaxX = CGRectGetMaxX(*(CGRect *)&v35);
    [v24 size];
    BOOL v23 = x > MaxX - v42 + -5.0;
  }

  return v23;
}

- (void)updateAlpha
{
  double v3 = 1.0;
  if (self->_dimmed && !self->_selected)
  {
    char v4 = [(EKDayOccurrenceView *)self currentImageState];
    uint64_t v5 = [v4 userInterfaceStyle];

    double v3 = 0.65;
    if (v5 != 2) {
      double v3 = 0.5;
    }
  }

  [(EKDayOccurrenceView *)self setAlpha:v3];
}

- (int)dragTypeFromPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(EKDayOccurrenceView *)self bounds];
  double v7 = v6;
  double v9 = v8;
  int IsLeftToRight = CalInterfaceIsLeftToRight();
  if (IsLeftToRight) {
    double v11 = v7 + -40.0;
  }
  else {
    double v11 = 0.0;
  }
  if (IsLeftToRight) {
    double v12 = v7;
  }
  else {
    double v12 = 40.0;
  }
  if (IsLeftToRight) {
    double v13 = 0.0;
  }
  else {
    double v13 = v7 + -40.0;
  }
  if (IsLeftToRight) {
    double v7 = 40.0;
  }
  if (!self->_startResizeHandle && !self->_endResizeHandle) {
    return 1;
  }
  [(EKDayOccurrenceView *)self travelTime];
  BOOL v16 = v14 <= 0.0 || v11 >= x || x > v12;
  if (v16
    || ([(EKDayOccurrenceView *)self travelTimeSubviewHeightInPoints], y >= v17 + 40.0)
    || ([(EKDayOccurrenceView *)self travelTimeSubviewHeightInPoints], y <= v18 + -40.0))
  {
    BOOL v19 = v11 >= x || x > v12;
    if (v19 || y >= 40.0)
    {
      if (v13 <= x && x < v7 && y > v9 + -40.0) {
        return 2;
      }
      return 1;
    }
  }
  return 0;
}

- (void)bringResizeHandlesToFront
{
  if ([(EKDayOccurrenceView *)self drawsResizeHandles])
  {
    double v3 = [(EKDayOccurrenceView *)self superview];
    [v3 bringSubviewToFront:self->_startResizeHandle];

    id v4 = [(EKDayOccurrenceView *)self superview];
    [v4 bringSubviewToFront:self->_endResizeHandle];
  }
}

- (double)viewMaxNaturalTextHeight
{
  [(CUIKOROccurrenceState *)self->_currentImageState minimumNaturalHeightAllText];
  double v4 = v3;
  [(EKDayOccurrenceView *)self margin];
  double v6 = v5;
  [(EKDayOccurrenceView *)self _verticalContentInset];
  double v8 = v4 + v6 + v7;
  if (self->_showsTravelTime)
  {
    [(EKDayOccurrenceView *)self travelTimeSubviewHeightInPoints];
    return v8 + v9;
  }
  return v8;
}

- (double)enoughHeightForOneLine
{
  double v3 = objc_opt_class();
  double v4 = [(EKDayOccurrenceView *)self occurrences];
  objc_msgSend(v3, "enoughHeightForOneLineForEvents:usingSmallText:sizeClass:", v4, -[EKDayOccurrenceView usesSmallText](self, "usesSmallText"), EKUIWidthSizeClassForViewHierarchy(self));
  double v6 = v5;

  return v6;
}

- (double)_verticalContentInset
{
  double v3 = 0.0;
  if ([(EKDayOccurrenceView *)self _isTimedOccurrenceDrawingStyle])
  {
    double v4 = [(EKDayOccurrenceView *)self occurrence];
    double v5 = [v4 startCalendarDate];
    uint64_t v6 = [v5 minute];

    if (v6)
    {
      CalRoundToScreenScale(0.5);
      return 0.0 - v7;
    }
  }
  return v3;
}

+ (double)barToBarHorizontalDistanceIncludingBarWidth
{
  [a1 barToBarGapWidth];
  double v4 = v3;
  [MEMORY[0x1E4F57BB8] colorBarThickness];
  double v6 = v4 + v5;
  [a1 barToBarGapWidth];
  return v6 + v7;
}

- (void)fadeInContentViewAt:(double)a3 minWidth:(double)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  [(UIImageView *)self->_contentView frame];
  if (v10 - (a3 - v9) >= a4 - (self->_margin.right + self->_padding.right))
  {
    if ((*((unsigned char *)self + 488) & 4) == 0)
    {
      self->_originalXBeforeOffset = v9;
      *((unsigned char *)self + 488) |= 4u;
    }
    [(UIImageView *)self->_contentView setFrame:self->_originalXBeforeOffset + a3];
    [(UIImageView *)self->_contentView setHidden:0];
    [(UIImageView *)self->_contentView setNeedsDisplay];
    contentView = self->_contentView;
    if (v5)
    {
      [(UIImageView *)contentView setAlpha:0.0];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __61__EKDayOccurrenceView_fadeInContentViewAt_minWidth_animated___block_invoke;
      v12[3] = &unk_1E6087570;
      v12[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v12 animations:0.15];
    }
    else
    {
      [(UIImageView *)contentView setAlpha:1.0];
    }
  }
}

uint64_t __61__EKDayOccurrenceView_fadeInContentViewAt_minWidth_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 432) setAlpha:1.0];
}

- (BOOL)resetContentViewToOriginalState:(BOOL)a3
{
  if ((*((unsigned char *)self + 488) & 4) != 0)
  {
    if (a3)
    {
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __55__EKDayOccurrenceView_resetContentViewToOriginalState___block_invoke;
      v5[3] = &unk_1E6087570;
      v5[4] = self;
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __55__EKDayOccurrenceView_resetContentViewToOriginalState___block_invoke_2;
      v4[3] = &unk_1E6087520;
      v4[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v5 animations:v4 completion:0.2];
      return 1;
    }
    [(EKDayOccurrenceView *)self _resetContentViewPosition];
  }
  return 0;
}

uint64_t __55__EKDayOccurrenceView_resetContentViewToOriginalState___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 432) setAlpha:0.0];
}

uint64_t __55__EKDayOccurrenceView_resetContentViewToOriginalState___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _resetContentViewPosition];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55__EKDayOccurrenceView_resetContentViewToOriginalState___block_invoke_3;
  v3[3] = &unk_1E6087570;
  v3[4] = *(void *)(a1 + 32);
  return [MEMORY[0x1E4FB1EB0] animateWithDuration:v3 animations:0.2];
}

uint64_t __55__EKDayOccurrenceView_resetContentViewToOriginalState___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 432) setAlpha:1.0];
}

- (void)_resetContentViewPosition
{
  if ((*((unsigned char *)self + 488) & 4) != 0)
  {
    [(UIImageView *)self->_contentView frame];
    [(UIImageView *)self->_contentView setFrame:v3 + self->_originalXBeforeOffset - v3];
    *((unsigned char *)self + 488) &= ~4u;
    self->_originalXBeforeOffset = -1.0;
    contentView = self->_contentView;
    [(UIImageView *)contentView setNeedsDisplay];
  }
}

- (void)setHideText:(BOOL)a3 animate:(BOOL)a4
{
  if (self->_hideText != a3)
  {
    double v6 = 1.0;
    if (a3) {
      double v7 = 0.0;
    }
    else {
      double v7 = 1.0;
    }
    if (a4)
    {
      if (!a3) {
        double v6 = 0.0;
      }
      [(UIImageView *)self->_contentView setAlpha:v6];
      [(EKDayOccurrenceView *)self setHideText:0];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __43__EKDayOccurrenceView_setHideText_animate___block_invoke;
      v10[3] = &unk_1E6087E70;
      v10[4] = self;
      *(double *)&v10[5] = v7;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __43__EKDayOccurrenceView_setHideText_animate___block_invoke_2;
      v8[3] = &unk_1E608B070;
      v8[4] = self;
      BOOL v9 = a3;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v10 animations:v8 completion:0.3];
    }
    else
    {
      [(UIImageView *)self->_contentView setAlpha:v7];
      self->_hideText = a3;
    }
  }
}

uint64_t __43__EKDayOccurrenceView_setHideText_animate___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 432) setAlpha:*(double *)(a1 + 40)];
}

uint64_t __43__EKDayOccurrenceView_setHideText_animate___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 695) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)isPinned
{
  return self->_bottomPinningProximity >= 1.0;
}

- (int64_t)compareOccurrenceViewForTabOrdering:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(EKDayOccurrenceView *)self _compareOccurrenceViewTopToBottomLeftToRight:v4];
  if (!v5) {
    int64_t v5 = [(EKDayOccurrenceView *)self _compareOccurrenceViewForSelectedCopyOrdering:v4];
  }

  return v5;
}

- (int64_t)_compareOccurrenceViewForSelectedCopyOrdering:(id)a3
{
  id v4 = a3;
  if ([(EKDayOccurrenceView *)self isSelectedCopyView]) {
    int64_t v5 = 1;
  }
  else {
    int64_t v5 = [v4 isSelectedCopyView] << 63 >> 63;
  }

  return v5;
}

- (int64_t)_compareOccurrenceViewTopToBottomLeftToRight:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(EKDayOccurrenceView *)self _compareOccurrenceViewTopToBottom:v4];
  if (!v5) {
    int64_t v5 = [(EKDayOccurrenceView *)self _compareOccurrenceViewLeftToRight:v4];
  }

  return v5;
}

- (int64_t)_compareOccurrenceViewTopToBottom:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(EKDayOccurrenceView *)self occurrence];
  [v5 duration];
  double v7 = v6 * 0.25;

  double v8 = [v4 occurrence];
  [v8 duration];
  double v10 = v9 * 0.25;

  if (v7 >= v10) {
    double v11 = v10;
  }
  else {
    double v11 = v7;
  }
  if (v11 <= 300.0) {
    double v12 = v11;
  }
  else {
    double v12 = 300.0;
  }
  if ([(EKDayOccurrenceView *)self _isBelowOccurrenceView:v4 overlapToIgnore:v12])
  {
    int64_t v13 = 1;
  }
  else
  {
    int64_t v13 = [(EKDayOccurrenceView *)self _isAboveOccurrenceView:v4 overlapToIgnore:v12] << 63 >> 63;
  }

  return v13;
}

- (BOOL)_isAboveOccurrenceView:(id)a3 overlapToIgnore:(double)a4
{
  id v6 = a3;
  double v7 = [v6 occurrence];
  int v8 = [v7 isAllDay];

  if (v8)
  {
    BOOL v9 = [(EKDayOccurrenceView *)self _isAboveAllDayOccurrenceView:v6];
  }
  else
  {
    double v10 = [v6 occurrence];

    double v11 = [v10 startDate];
    double v12 = [(EKDayOccurrenceView *)self occurrence];
    int64_t v13 = [v12 endDateUnadjustedForLegacyClients];
    [v11 timeIntervalSinceDate:v13];
    BOOL v9 = v14 >= -a4;

    id v6 = v10;
  }

  return v9;
}

- (BOOL)_isAboveAllDayOccurrenceView:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(EKDayOccurrenceView *)self occurrence];
  id v6 = [v5 startDate];
  double v7 = [v4 occurrence];
  int v8 = [v7 startDate];
  BOOL v9 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v10 = [v6 compareDateIgnoringTimeComponents:v8 inCalendar:v9];

  if (v10 == -1)
  {
    BOOL v11 = 1;
  }
  else if (v10 == 1)
  {
    BOOL v11 = 0;
  }
  else
  {
    [(EKDayOccurrenceView *)self frame];
    double v13 = v12;
    [v4 frame];
    BOOL v11 = v13 < v14;
  }

  return v11;
}

- (BOOL)_isBelowOccurrenceView:(id)a3 overlapToIgnore:(double)a4
{
  id v6 = a3;
  double v7 = [v6 occurrence];
  int v8 = [v7 isAllDay];

  if (v8)
  {
    BOOL v9 = [(EKDayOccurrenceView *)self _isBelowAllDayOccurrenceView:v6];
  }
  else
  {
    uint64_t v10 = [(EKDayOccurrenceView *)self occurrence];
    BOOL v11 = [v10 startDate];
    double v12 = [v6 occurrence];
    double v13 = [v12 endDateUnadjustedForLegacyClients];
    [v11 timeIntervalSinceDate:v13];
    BOOL v9 = v14 >= -a4;
  }
  return v9;
}

- (BOOL)_isBelowAllDayOccurrenceView:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(EKDayOccurrenceView *)self occurrence];
  id v6 = [v5 startDate];
  double v7 = [v4 occurrence];
  int v8 = [v7 startDate];
  BOOL v9 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v10 = [v6 compareDateIgnoringTimeComponents:v8 inCalendar:v9];

  if (v10 == -1)
  {
    BOOL v11 = 0;
  }
  else if (v10 == 1)
  {
    BOOL v11 = 1;
  }
  else
  {
    [(EKDayOccurrenceView *)self frame];
    double v13 = v12;
    [v4 frame];
    BOOL v11 = v13 > v14;
  }

  return v11;
}

- (int64_t)_compareOccurrenceViewLeftToRight:(id)a3
{
  id v4 = a3;
  [(EKDayOccurrenceView *)self frame];
  double v6 = v5;
  [v4 frame];
  if (v6 >= v7)
  {
    [(EKDayOccurrenceView *)self frame];
    double v10 = v9;
    [v4 frame];
    int64_t v8 = v10 > v11;
  }
  else
  {
    int64_t v8 = -1;
  }

  return v8;
}

- (void)setReduceLayoutProcessingForAnimation:(BOOL)a3
{
  if (self->_reduceLayoutProcessingForAnimation != a3)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __61__EKDayOccurrenceView_setReduceLayoutProcessingForAnimation___block_invoke;
    v7[3] = &unk_1E6088CA8;
    v7[4] = self;
    BOOL v8 = a3;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v7];
    self->_reduceLayoutProcessingForAnimation = a3;
    [(UIImageView *)self->_contentView frame];
    self->_contentLocationDuringReducedProcessing.double x = v5;
    self->_contentLocationDuringReducedProcessing.double y = v6;
  }
}

uint64_t __61__EKDayOccurrenceView_setReduceLayoutProcessingForAnimation___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 40)) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = *(unsigned char *)(v2 + 710) == 0;
  }
  [*(id *)(v2 + 672) setEnabled:v3];
  id v4 = *(void **)(*(void *)(a1 + 32) + 672);

  return [v4 invalidate];
}

uint64_t __53__EKDayOccurrenceView_setPointerInteractionDisabled___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 709)) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = *(unsigned char *)(v2 + 710) == 0;
  }
  [*(id *)(v2 + 672) setEnabled:v3];
  id v4 = *(void **)(*(void *)(a1 + 32) + 672);

  return [v4 invalidate];
}

- (void)_removeEditMenuInteractionIfNeeded
{
  BOOL v3 = [(EKDayOccurrenceView *)self interactions];
  int v4 = [v3 containsObject:self->_editMenuInteraction];

  if (v4)
  {
    editMenuInteraction = self->_editMenuInteraction;
    [(EKDayOccurrenceView *)self removeInteraction:editMenuInteraction];
  }
}

- (void)_setEditingMenuEnabled:(BOOL)a3
{
  if (a3) {
    [(EKDayOccurrenceView *)self _addEditMenuInteractionIfNeeded];
  }
  else {
    [(EKDayOccurrenceView *)self _removeEditMenuInteractionIfNeeded];
  }
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6 = a4;
  [(EKDayOccurrenceView *)self bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  if (![(EKDayOccurrenceView *)self isAllDay])
  {
    double top = self->_margin.top;
    double left = self->_margin.left;
    double bottom = self->_margin.bottom;
    double right = self->_margin.right;
    double v19 = top + CalOnePixelInPoints();
    double v8 = v8 + left;
    double v10 = v10 + v19;
    double v12 = v12 - (left + right);
    double v14 = v14 - (bottom + v19);
  }
  [v6 location];
  v25.double x = v20;
  v25.double y = v21;
  v26.origin.double x = v8;
  v26.origin.double y = v10;
  v26.size.CGFloat width = v12;
  v26.size.CGFloat height = v14;
  if (CGRectContainsPoint(v26, v25))
  {
    double v22 = objc_msgSend(MEMORY[0x1E4FB1AD8], "regionWithRect:identifier:", 0, v8, v10, v12, v14);
  }
  else
  {
    double v22 = 0;
  }

  return v22;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  CGFloat v5 = self;
  id v6 = a4;
  double v7 = [(EKDayOccurrenceView *)v5 delegate];
  char v8 = objc_opt_respondsToSelector();

  double v9 = v5;
  if (v8)
  {
    double v10 = [(EKDayOccurrenceView *)v5 delegate];
    double v11 = [v10 selectedCopyViewForDayOccurrenceView:v5];

    double v9 = v5;
    if (v11)
    {
      double v9 = v11;
    }
  }
  id v12 = objc_alloc_init(MEMORY[0x1E4FB1B28]);
  [v6 rect];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  -[EKDayOccurrenceView convertRect:fromView:](v9, "convertRect:fromView:", v5, v14, v16, v18, v20);
  CGFloat v21 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:");
  [v12 setVisiblePath:v21];

  double v22 = [MEMORY[0x1E4FB1618] clearColor];
  [v12 setBackgroundColor:v22];

  BOOL v23 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v9 parameters:v12];
  os_log_type_t v24 = [MEMORY[0x1E4FB1AC0] effectWithPreview:v23];
  [v24 setPreferredTintMode:1];
  [v24 setPrefersShadow:0];
  [v24 setPrefersScaledContent:0];
  CGPoint v25 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v24 shape:0];

  return v25;
}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  p_delegate = &self->_delegate;
  id v7 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained dayOccurrenceViewSelected:self source:1];

  id v9 = objc_loadWeakRetained((id *)p_delegate);
  double v10 = [v9 selectedEventsForEditMenu];
  id v11 = objc_loadWeakRetained((id *)p_delegate);
  id v12 = [v11 presentationControllerForEditMenu];
  BOOL editMenuPresented = self->_editMenuPresented;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __81__EKDayOccurrenceView_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke;
  v18[3] = &unk_1E608B098;
  v18[4] = self;
  double v14 = +[EKUIContextMenuActions menuForEvents:v10 presentationController:v12 isEditMenu:editMenuPresented overrideActionBlock:v18 completionBlock:0];

  double v15 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count") + 1);
  [v15 addObjectsFromArray:v7];

  [v15 addObject:v14];
  double v16 = [MEMORY[0x1E4FB1970] menuWithChildren:v15];

  return v16;
}

uint64_t __81__EKDayOccurrenceView_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 664));
  [WeakRetained endForcedStartAndUndim];

  objc_storeWeak((id *)(*(void *)(a1 + 32) + 664), 0);
  return 0;
}

- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5
{
  self->_BOOL editMenuPresented = 0;
}

- (void)presentEditingMenuFromGestureController:(id)a3
{
  id obj = a3;
  int v4 = [(EKDayOccurrenceView *)self superview];

  if (v4)
  {
    objc_storeWeak((id *)&self->_gestureController, obj);
    self->_BOOL editMenuPresented = 1;
    [(EKDayOccurrenceView *)self _setEditingMenuEnabled:1];
    [(EKDayOccurrenceView *)self bounds];
    double MidX = CGRectGetMidX(v9);
    [(EKDayOccurrenceView *)self bounds];
    id v6 = objc_msgSend(MEMORY[0x1E4FB1750], "configurationWithIdentifier:sourcePoint:", 0, MidX, CGRectGetMinY(v10));
    [(UIEditMenuInteraction *)self->_editMenuInteraction presentEditMenuWithConfiguration:v6];
  }
}

- (void)dismissEditingMenu
{
  self->_BOOL editMenuPresented = 0;
}

- (EKDayOccurrenceViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EKDayOccurrenceViewDelegate *)WeakRetained;
}

- (BOOL)visibleHeightLocked
{
  return self->_visibleHeightLocked;
}

- (EKEvent)occurrence
{
  return self->_occurrence;
}

- (int64_t)occurrenceDateIndex
{
  return self->_occurrenceDateIndex;
}

- (BOOL)allDayDrawingStyle
{
  return self->_allDayDrawingStyle;
}

- (BOOL)drawsResizeHandles
{
  return self->_drawsResizeHandles;
}

- (BOOL)hideText
{
  return self->_hideText;
}

- (void)setIsMiniPreviewInEventDetail:(BOOL)a3
{
  self->_isMiniPreviewInEventDetail = a3;
}

- (BOOL)multiAllDayRoundCorners
{
  return self->_multiAllDayRoundCorners;
}

- (BOOL)isTentative
{
  return self->_tentative;
}

- (BOOL)isDeclined
{
  return self->_declined;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (BOOL)needsReply
{
  return self->_needsReply;
}

- (BOOL)isReminder
{
  return self->_isReminder;
}

- (BOOL)isCompleted
{
  return self->_isCompleted;
}

- (double)cappedColorBarHeight
{
  return self->_cappedColorBarHeight;
}

- (BOOL)reduceLayoutProcessingForAnimation
{
  return self->_reduceLayoutProcessingForAnimation;
}

- (double)topPinningProximity
{
  return self->_topPinningProximity;
}

- (double)bottomPinningProximity
{
  return self->_bottomPinningProximity;
}

- (BOOL)pointerInteractionDisabled
{
  return self->_pointerInteractionDisabled;
}

- (BOOL)touchesAreBeingTracked
{
  return self->_touchesAreBeingTracked;
}

- (void)setTouchesAreBeingTracked:(BOOL)a3
{
  self->_touchesAreBeingTracked = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_occurrences, 0);
  objc_storeStrong((id *)&self->_occurrence, 0);
  objc_destroyWeak((id *)&self->_selectedCopy);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_editMenuInteraction, 0);
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_destroyWeak((id *)&self->_gestureController);
  objc_storeStrong((id *)&self->_stagedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_currentImageState, 0);
  objc_storeStrong((id *)&self->_pinFadeView, 0);
  objc_storeStrong((id *)&self->_endResizeHandle, 0);
  objc_storeStrong((id *)&self->_startResizeHandle, 0);
  objc_storeStrong((id *)&self->_travelTimeContentView, 0);
  objc_storeStrong((id *)&self->_travelBackgroundView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_eventBackgroundColorBar, 0);

  objc_storeStrong((id *)&self->_eventBackgroundView, 0);
}

@end