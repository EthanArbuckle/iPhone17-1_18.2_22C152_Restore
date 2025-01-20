@interface EKDayAllDayView
+ (BOOL)allDayContainSpaces;
+ (BOOL)shouldAllDayTextUseTwoLines;
+ (BOOL)shouldTimeBarWidthMatchAllDayTextWithResultWidth:(double *)a3;
+ (double)allDay1LineWidth;
+ (double)maxAllowableAllDayTextTwoLineHeight;
+ (double)maxAllowableAllDayTextWidth;
+ (id)allDayLabelBoldFont;
+ (id)allDayLabelFont;
+ (id)localizedAllDayString;
+ (id)unscaledAllDayFont;
+ (void)clearStaticCache;
- (BOOL)allowsOccurrenceSelection;
- (BOOL)containsEvent:(id)a3;
- (BOOL)forceSingleColumnLayout;
- (BOOL)isAllDayLabelHighlighted;
- (BOOL)showBirthdayCountInsteadOfEvents;
- (BOOL)showsBorderLines;
- (BOOL)showsLabel;
- (BOOL)showsSelection;
- (CGSize)sizeThatFits:(CGSize)a3;
- (EKDayAllDayView)initWithFrame:(CGRect)a3;
- (EKDayAllDayView)initWithFrame:(CGRect)a3 sizeClass:(int64_t)a4;
- (EKDayAllDayViewDelegate)delegate;
- (EKEvent)dimmedOccurrence;
- (double)_allDayAreaHeightForEventCount:(int64_t)a3;
- (double)_height;
- (double)_languageAwareAllDayEventHeight:(id)a3;
- (double)firstEventYOffset;
- (double)fixedHeight;
- (double)naturalHeight;
- (double)nextAvailableOccurrenceViewYOrigin;
- (id)_findSelectedCopySubviewOfView:(id)a3;
- (id)_selectedCopyView;
- (id)occurrenceViewForEvent:(id)a3;
- (id)occurrenceViews;
- (id)presentationControllerForEditMenu;
- (id)selectedEvent;
- (id)selectedEventsForEditMenu;
- (int)maxVisibleRows;
- (int64_t)_sizeClass;
- (void)_clearTemporaryViews;
- (void)_configureOccurrenceViewMarginAndPadding:(id)a3;
- (void)_localeChanged:(id)a3;
- (void)_saveTemporaryViews;
- (void)_setUpBirthdayCountViewIfNeeded;
- (void)_smallTextSettingChanged;
- (void)addViewToScroller:(id)a3;
- (void)attemptDisplayReviewPrompt;
- (void)configureOccurrenceViewForGestureController:(id)a3;
- (void)dayOccurrenceViewSelected:(id)a3 source:(unint64_t)a4;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)lockUseOfSmallTextToState:(BOOL)a3;
- (void)reAdjustAllDayLabelLayout;
- (void)removeAllOccurrenceViews;
- (void)selectEvent:(id)a3;
- (void)setAllDayLabelColor:(id)a3;
- (void)setAllDayLabelHighlighted:(BOOL)a3;
- (void)setAllowsOccurrenceSelection:(BOOL)a3;
- (void)setBorderColor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDimmedOccurrence:(id)a3;
- (void)setDividerLineVisualEffect:(id)a3;
- (void)setFixedHeight:(double)a3;
- (void)setForceSingleColumnLayout:(BOOL)a3;
- (void)setMaxVisibleRows:(int)a3;
- (void)setOccurrenceInset:(double)a3 labelInset:(double)a4;
- (void)setOccurrences:(id)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setShowBirthdayCountInsteadOfEvents:(BOOL)a3;
- (void)setShowsBorderLines:(BOOL)a3;
- (void)setShowsLabel:(BOOL)a3;
- (void)setShowsSelection:(BOOL)a3;
- (void)setTopBorderLineHidden:(BOOL)a3;
- (void)shouldAnnotateAppEntitiesChanged;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)updateLabelFont;
- (void)viewTintColorDidChangeForView:(id)a3 toColor:(id)a4;
@end

@implementation EKDayAllDayView

- (id)occurrenceViews
{
  return self->_occurrenceViews;
}

- (void)shouldAnnotateAppEntitiesChanged
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    uint64_t v7 = [v6 allDayViewShouldAnnotateAppEntities:self];
  }
  else
  {
    uint64_t v7 = 0;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v8 = self->_occurrenceViews;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
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
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "setShouldAnnotateAppEntities:", v7, (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)setOccurrences:(id)a3
{
  id v45 = a3;
  [(EKDayAllDayView *)self _saveTemporaryViews];
  [(EKDayAllDayView *)self removeAllOccurrenceViews];
  uint64_t v4 = [v45 count];
  self->_birthdayCount = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v6 = [WeakRetained allDayViewRequestsCurrentDisplayDate:self];

  uint64_t v7 = [v6 calendarDateForDay];
  [v7 absoluteTime];
  double v9 = v8;

  uint64_t v10 = [v6 calendarDateForEndOfDay];
  [v10 absoluteTime];
  double v12 = v11;

  id v13 = objc_loadWeakRetained((id *)&self->_delegate);
  char v14 = objc_opt_respondsToSelector();

  v43 = v6;
  if (v14)
  {
    id v15 = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v16 = [v15 allDayViewShouldAnnotateAppEntities:self];

    if (!v4) {
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v16 = 0;
    if (!v4) {
      goto LABEL_16;
    }
  }
  uint64_t v17 = 0;
  double v18 = v12 + 1.0;
  double v19 = *MEMORY[0x1E4F1DB28];
  double v20 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v22 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  do
  {
    v23 = objc_msgSend(v45, "objectAtIndexedSubscript:", v17, v43);
    v24 = [v23 calendarItemIdentifier];
    uint64_t v25 = [(NSMutableDictionary *)self->_temporaryViewCache objectForKeyedSubscript:v24];
    if (v25)
    {
      v26 = (void *)v25;
      [(NSMutableDictionary *)self->_temporaryViewCache removeObjectForKey:v24];
    }
    else
    {
      v26 = +[EKDayOccurrenceView occurrenceViewWithFrame:](EKDayOccurrenceView, "occurrenceViewWithFrame:", v19, v20, v21, v22);
    }
    [v26 setOccurrence:v23];
    [v26 setUsesSmallText:self->_usesSmallText];
    [v26 setAllDayDrawingStyle:1];
    [v26 setDelegate:self];
    [v26 setIsSelectedCopyView:0];
    v27 = [v23 startDate];
    [v27 timeIntervalSinceReferenceDate];
    [v26 setHasPrecedingDuration:v28 < v9];

    v29 = [v23 endDateUnadjustedForLegacyClients];
    [v29 timeIntervalSinceReferenceDate];
    [v26 setHasTrailingDuration:v30 > v18];

    [v26 setMultiAllDayRoundCorners:1];
    [v26 setShouldAnnotateAppEntities:v16];
    [v26 setOpaque:1];
    [(EKDayAllDayView *)self _configureOccurrenceViewMarginAndPadding:v26];
    if (!self->_showBirthdayCount) {
      [(EKDayAllDayView *)self addSubview:v26];
    }
    occurrenceViews = self->_occurrenceViews;
    if (!occurrenceViews)
    {
      v32 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v33 = self->_occurrenceViews;
      self->_occurrenceViews = v32;

      occurrenceViews = self->_occurrenceViews;
    }
    [(NSMutableArray *)occurrenceViews addObject:v26];
    if ([v26 isBirthday]) {
      ++self->_birthdayCount;
    }

    ++v17;
  }
  while (v4 != v17);
LABEL_16:
  [(EKDayAllDayView *)self _clearTemporaryViews];
  [(EKDayAllDayView *)self frame];
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;
  [(EKDayAllDayView *)self _height];
  -[EKDayAllDayView setFrame:](self, "setFrame:", v35, v37, v39, v40);
  [(UIScrollView *)self->_scroller setShowsHorizontalScrollIndicator:0];
  if (self->_selectedEvent && !-[EKDayAllDayView containsEvent:](self, "containsEvent:"))
  {
    selectedEvent = self->_selectedEvent;
    self->_selectedEvent = 0;
  }
  if (v4) {
    BOOL v42 = !self->_showsLabel;
  }
  else {
    BOOL v42 = 1;
  }
  [(UILabel *)self->_allDay setHidden:v42];
  [(EKDayAllDayView *)self setNeedsLayout];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  [(EKDayAllDayView *)self _height];
  double v5 = v4;
  double v6 = width;
  result.height = v5;
  result.CGFloat width = v6;
  return result;
}

- (double)_height
{
  [(EKDayAllDayView *)self fixedHeight];
  if (v3 >= 0.0)
  {
    [(EKDayAllDayView *)self fixedHeight];
  }
  else
  {
    [(EKDayAllDayView *)self naturalHeight];
  }
  return result;
}

- (double)fixedHeight
{
  return self->_fixedHeight;
}

- (double)naturalHeight
{
  if (self->_showBirthdayCount) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [(NSMutableArray *)self->_occurrenceViews count];
  }

  [(EKDayAllDayView *)self _allDayAreaHeightForEventCount:v3];
  return result;
}

- (double)_allDayAreaHeightForEventCount:(int64_t)a3
{
  if (a3 < 1) {
    return 0.0;
  }
  +[EKDayOccurrenceView minimumHeightForSizeClass:[(EKDayAllDayView *)self _sizeClass] orientation:self->_orientation isAllDay:1];
  double v6 = v5;
  if ([(EKDayAllDayView *)self forceSingleColumnLayout]) {
    uint64_t v7 = a3;
  }
  else {
    uint64_t v7 = (unint64_t)(a3 + 1) >> 1;
  }
  BOOL v8 = [(EKDayAllDayView *)self forceSingleColumnLayout];
  uint64_t v9 = 0;
  if (a3 >= 4) {
    int64_t v10 = 4;
  }
  else {
    int64_t v10 = a3;
  }
  double v11 = 0.0;
  do
  {
    double v12 = [(NSMutableArray *)self->_occurrenceViews objectAtIndex:v9];
    if ([(EKDayAllDayView *)self forceSingleColumnLayout])
    {
LABEL_10:
      [(EKDayAllDayView *)self _languageAwareAllDayEventHeight:v12];
      double v11 = v11 + v13;
      goto LABEL_24;
    }
    if (v9)
    {
      uint64_t v16 = [(NSMutableArray *)self->_occurrenceViews objectAtIndex:v9 - 1];
      [(EKDayAllDayView *)self _languageAwareAllDayEventHeight:v12];
      double v18 = v17;
      [(EKDayAllDayView *)self _languageAwareAllDayEventHeight:v16];
      if (v18 >= v19) {
        double v19 = v18;
      }
      double v11 = v11 + v19;
    }
    else
    {
      BOOL v15 = a3 == 3 && v9 == 2;
      if (a3 == 1 || v15) {
        goto LABEL_10;
      }
    }
LABEL_24:

    ++v9;
  }
  while (v10 != v9);
  uint64_t v20 = 2;
  if ((unint64_t)(a3 + 1) >> 1 < 2) {
    uint64_t v20 = (unint64_t)(a3 + 1) >> 1;
  }
  if (v8) {
    uint64_t v20 = a3;
  }
  double v21 = floor(v11) + 4.0 + (double)(v20 - 1) * 2.0;
  double v22 = v21 + 4.0;
  double v23 = floor(v6 * 0.5) + 2.0 + v21;
  if (v7 >= 3) {
    double v24 = v23;
  }
  else {
    double v24 = v22;
  }
  if ([(EKDayAllDayView *)self showsBorderLines]) {
    return v24 + EKUISeparatorLineThickness();
  }
  return v24;
}

- (void)setOccurrenceInset:(double)a3 labelInset:(double)a4
{
  self->_occurrenceInset = a3;
  [(UILabel *)self->_allDay frame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  if (CalInterfaceIsLeftToRight())
  {
    double v12 = a4 - v9 + -1.0;
    if (v12 < 0.0)
    {
      double v9 = v9 + v12;
      double v12 = 0.0;
    }
  }
  else
  {
    [(EKDayAllDayView *)self bounds];
    double v12 = CGRectGetWidth(v17) - a4 + 1.0;
    v18.origin.x = v12;
    v18.origin.y = v7;
    v18.size.CGFloat width = v9;
    v18.size.height = v11;
    double MaxX = CGRectGetMaxX(v18);
    [(EKDayAllDayView *)self bounds];
    if (MaxX > CGRectGetMaxX(v19))
    {
      v20.origin.x = v12;
      v20.origin.y = v7;
      v20.size.CGFloat width = v9;
      v20.size.height = v11;
      double v14 = CGRectGetMaxX(v20);
      [(EKDayAllDayView *)self bounds];
      double v9 = v9 - (v14 - CGRectGetMaxX(v21));
    }
  }
  allDay = self->_allDay;

  -[UILabel setFrame:](allDay, "setFrame:", v12, v7, v9, v11);
}

+ (id)allDayLabelFont
{
  v2 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28E0]];
  uint64_t v3 = [v2 fontDescriptor];
  [v3 pointSize];
  double v5 = v4;

  CalRoundToScreenScale(v5);
  double v7 = fmin(v6, 22.0);
  double v8 = (void *)MEMORY[0x1E4FB08E0];

  return (id)[v8 systemFontOfSize:v7];
}

- (void)removeAllOccurrenceViews
{
  uint64_t v3 = [(NSMutableArray *)self->_occurrenceViews count];
  if (v3)
  {
    uint64_t v4 = v3;
    for (uint64_t i = 0; i != v4; ++i)
    {
      double v6 = [(NSMutableArray *)self->_occurrenceViews objectAtIndex:i];
      double v7 = [v6 occurrence];
      double v8 = [v7 calendarItemIdentifier];

      if (!v8
        || ([(NSMutableDictionary *)self->_temporaryViewCache objectForKeyedSubscript:v8],
            double v9 = objc_claimAutoreleasedReturnValue(),
            v9,
            !v9))
      {
        [v6 removeFromSuperview];
      }
    }
  }
  occurrenceViews = self->_occurrenceViews;
  self->_occurrenceViews = 0;
}

- (void)_saveTemporaryViews
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = self->_occurrenceViews;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        double v9 = objc_msgSend(v8, "occurrence", (void)v11);
        double v10 = [v9 calendarItemIdentifier];

        if (v10) {
          [(NSMutableDictionary *)self->_temporaryViewCache setObject:v8 forKeyedSubscript:v10];
        }
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)_clearTemporaryViews
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = [(NSMutableDictionary *)self->_temporaryViewCache allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) removeFromSuperview];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(NSMutableDictionary *)self->_temporaryViewCache removeAllObjects];
}

- (EKDayAllDayView)initWithFrame:(CGRect)a3 sizeClass:(int64_t)a4
{
  v19.receiver = self;
  v19.super_class = (Class)EKDayAllDayView;
  uint64_t v5 = -[EKDayAllDayView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    if (a4 == 1) {
      [MEMORY[0x1E4FB1618] systemBackgroundColor];
    }
    else {
    uint64_t v6 = CUIKAllDayBackgroundColor();
    }
    [(EKDayAllDayView *)v5 setBackgroundColor:v6];

    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", 0.0, 0.0, 100.0, 50.0);
    allDay = v5->_allDay;
    v5->_allDay = (UILabel *)v7;

    long long v9 = v5->_allDay;
    long long v10 = [(id)objc_opt_class() allDayLabelFont];
    [(UILabel *)v9 setFont:v10];

    long long v11 = v5->_allDay;
    long long v12 = [(id)objc_opt_class() localizedAllDayString];
    [(UILabel *)v11 setText:v12];

    [(UILabel *)v5->_allDay setTextAlignment:2];
    uint64_t v13 = v5->_allDay;
    long long v14 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v13 setTextColor:v14];

    [(EKDayAllDayView *)v5 reAdjustAllDayLabelLayout];
    [(EKDayAllDayView *)v5 addSubview:v5->_allDay];
    v5->_allowSelection = 1;
    v5->_maxVisibleRows = 2;
    v5->_showsLabel = 1;
    v5->_fixedHeight = -1.0;
    v5->_targetSizeClass = a4;
    [(EKDayAllDayView *)v5 setClipsToBounds:1];
    uint64_t v15 = objc_opt_new();
    temporaryViewCache = v5->_temporaryViewCache;
    v5->_temporaryViewCache = (NSMutableDictionary *)v15;

    CGRect v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:v5 selector:sel__localeChanged_ name:*MEMORY[0x1E4F1C370] object:0];
  }
  return v5;
}

- (void)didMoveToWindow
{
}

- (void)layoutSubviews
{
  double occurrenceInset = self->_occurrenceInset;
  +[EKDayOccurrenceView minimumHeightForSizeClass:[(EKDayAllDayView *)self _sizeClass] orientation:self->_orientation isAllDay:1];
  double v5 = v4;
  [(EKDayAllDayView *)self bounds];
  double v7 = v6;
  long long v8 = self;
  long long v9 = v8;
  if (v8->_showBirthdayCount && v8->_birthdayCountOccurrenceView)
  {
    objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:");
    long long v10 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    long long v10 = v8->_occurrenceViews;
  }
  long long v11 = v10;
  double v12 = v7 - occurrenceInset;
  uint64_t v13 = [(NSMutableArray *)v10 count];
  [(EKDayAllDayView *)v9 bounds];
  scroller = v9->_scroller;
  unint64_t v116 = v13 + 1;
  unint64_t v117 = (unint64_t)(v13 + 1) >> 1;
  uint64_t v124 = v13;
  if (v117 <= v9->_maxVisibleRows)
  {
    if (!scroller)
    {
      v127 = (UIScrollView *)v9;
      goto LABEL_17;
    }
    [(UIScrollView *)scroller removeFromSuperview];
    double v24 = v9->_scroller;
    v9->_scroller = 0;
    v127 = (UIScrollView *)v9;
  }
  else
  {
    double v17 = v15;
    if (scroller)
    {
      [(UIScrollView *)scroller frame];
      double v19 = v18;
      double v21 = v20;
      double v22 = v17 - self->_occurrenceInset;
      double v23 = 0.0;
      if (CalInterfaceIsLeftToRight()) {
        double v23 = self->_occurrenceInset;
      }
      -[UIScrollView setFrame:](v9->_scroller, "setFrame:", v23, v19, v22, v21);
    }
    else
    {
      [(EKDayAllDayView *)v9 _allDayAreaHeightForEventCount:v13];
      double v26 = v25;
      id v27 = objc_alloc(MEMORY[0x1E4FB1BE0]);
      int IsLeftToRight = CalInterfaceIsLeftToRight();
      double v29 = 0.0;
      if (IsLeftToRight) {
        double v29 = self->_occurrenceInset;
      }
      uint64_t v30 = objc_msgSend(v27, "initWithFrame:", v29, 0.0, v17 - self->_occurrenceInset, v26);
      v31 = v9->_scroller;
      v9->_scroller = (UIScrollView *)v30;

      v32 = v9->_scroller;
      v33 = [(EKDayAllDayView *)v9 backgroundColor];
      [(UIScrollView *)v32 setBackgroundColor:v33];
    }
    [(EKDayAllDayView *)v9 addSubview:v9->_scroller];
    v127 = v9->_scroller;
    double occurrenceInset = 0.0;
    double v24 = v9;
  }

LABEL_17:
  float v34 = v5;
  *(float *)&double v14 = v34;
  double v35 = [NSNumber numberWithFloat:v14];
  double v36 = objc_opt_new();
  CalRoundToScreenScale(v12 * 0.5);
  double v38 = v37;
  uint64_t v39 = [(EKDayAllDayView *)v9 _selectedCopyView];
  double v40 = (void *)v39;
  v126 = v11;
  if (!v13)
  {
    v93 = 0;
    if (!v39) {
      goto LABEL_84;
    }
    goto LABEL_81;
  }
  v125 = (void *)v39;
  uint64_t v41 = 0;
  double v121 = v38 + -5.5;
  do
  {
    BOOL v42 = [(NSMutableArray *)v11 objectAtIndex:v41];
    v43 = [v42 currentImageState];
    int v44 = [v43 requiresLanguageAwarePadding];

    if (v44)
    {
      v46 = NSNumber;
      [(EKDayAllDayView *)v9 _languageAwareAllDayEventHeight:v42];
      *(float *)&double v47 = v47;
      uint64_t v48 = [v46 numberWithFloat:v47];

      [v36 addObject:v48];
      if (v41) {
        [v36 replaceObjectAtIndex:v41 - 1 withObject:v48];
      }
      double v35 = (void *)v48;
    }
    else
    {
      if ((v41 & 1) == 0)
      {
        *(float *)&double v45 = v34;
        uint64_t v49 = [NSNumber numberWithFloat:v45];

        double v35 = (void *)v49;
      }
      [v36 addObject:v35];
    }

    ++v41;
  }
  while (v13 != v41);
  v123 = 0;
  uint64_t v50 = 0;
  double v119 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v120 = occurrenceInset + 5.5;
  double v118 = v12 + -7.5;
  uint64_t v122 = v13 - 1;
  double v51 = 4.0;
  do
  {
    v52 = [(NSMutableArray *)v11 objectAtIndex:v50];
    v53 = [v52 superview];

    if (v53 != v127) {
      [(UIScrollView *)v127 addSubview:v52];
    }
    BOOL v54 = [(EKDayAllDayView *)v9 forceSingleColumnLayout];
    BOOL v55 = v54;
    BOOL v56 = (v50 & 1) == 0 && v122 == v50;
    char v57 = (v50 & 1) == 0 || v54;
    if (CalInterfaceIsLeftToRight())
    {
      if (v50) {
        double v58 = v121;
      }
      else {
        double v58 = 0.0;
      }
      BOOL v59 = [(EKDayAllDayView *)v9 forceSingleColumnLayout];
      double v60 = -0.0;
      if (!v59) {
        double v60 = v58;
      }
      double v61 = v120 + v60;
    }
    else
    {
      int v62 = [(EKDayAllDayView *)v9 forceSingleColumnLayout];
      if (v50) {
        int v63 = v62;
      }
      else {
        int v63 = 1;
      }
      if (v63) {
        double v61 = 2.0;
      }
      else {
        double v61 = v121 + 2.0;
      }
    }
    v64 = [v36 objectAtIndex:v50];
    [v64 floatValue];
    float v66 = v65;

    double v67 = 0.0;
    if (EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v9)) {
      double v67 = CalFloorToScreenScale(-0.5);
    }
    double v68 = v66;
    double v69 = v121 + -1.0;
    if ((((v50 & 1) == 0) ^ v56) & ~v55) {
      goto LABEL_56;
    }
    if (v57)
    {
      if (v55 || v56) {
        double v69 = v118;
      }
      else {
        double v69 = v119;
      }
LABEL_56:
      if ((v50 & 1) == 0)
      {
        double v70 = v51;
        if (![(EKDayAllDayView *)v9 forceSingleColumnLayout]) {
          goto LABEL_63;
        }
      }
      goto LABEL_62;
    }
    BOOL IsRegularInViewHierarchy = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v9);
    double v72 = 0.0;
    if (IsRegularInViewHierarchy) {
      double v72 = 1.0;
    }
    double v61 = v61 + v72;
    double v69 = v121 + -1.0 + v67;
LABEL_62:
    double v70 = v51 + v68 + 2.0;
LABEL_63:
    objc_msgSend(v52, "setFrame:", v61, v51, v69, v68);
    id WeakRetained = objc_loadWeakRetained((id *)&v9->_delegate);
    if (objc_opt_respondsToSelector())
    {
      id v74 = objc_loadWeakRetained((id *)&v9->_delegate);
      int v75 = [v74 allDayViewContentShouldDrawSynchronously:v9];

      if (v75) {
        uint64_t v76 = 16;
      }
      else {
        uint64_t v76 = 0;
      }
    }
    else
    {

      uint64_t v76 = 0;
    }
    [v52 requestContentIfNeeded:v76 completion:0];
    if (!v50)
    {
      [(UILabel *)v9->_allDay frame];
      double v78 = v77;
      double v80 = v79;
      double v82 = v81;
      v83 = v9->_scroller;
      if (v83) {
        [(UIScrollView *)v83 frame];
      }
      else {
        double v84 = 0.0;
      }
      CalRoundToScreenScale(v51 + (v68 - v82) * 0.5 + v84 + 0.5);
      -[UILabel setFrame:](v9->_allDay, "setFrame:", v78, v85, v80, v82);
      [(EKDayAllDayView *)v9 reAdjustAllDayLabelLayout];
    }
    v86 = [v52 occurrence];
    int v87 = [v86 isEqual:v9->_dimmedOccurrence];

    if (v87)
    {
      v88 = [(EKDayAllDayView *)v9 occurrenceViewForEvent:v9->_dimmedOccurrence];
      [v88 setDimmed:1];
    }
    v89 = [v52 occurrence];
    v90 = [v125 occurrence];
    int v91 = [v89 isEqual:v90];

    if (v91)
    {
      id v92 = v52;

      v123 = v92;
    }

    ++v50;
    double v51 = v70;
  }
  while (v124 != v50);
  double v40 = v125;
  v93 = v123;
  if (!v125) {
    goto LABEL_84;
  }
LABEL_81:
  v94 = [v40 superview];

  if (v94 != v127)
  {
    [(UIScrollView *)v127 addSubview:v40];
    if (!v93) {
      goto LABEL_84;
    }
    goto LABEL_83;
  }
  [(UIScrollView *)v127 bringSubviewToFront:v40];
  if (v93)
  {
LABEL_83:
    [v93 frame];
    objc_msgSend(v40, "setFrame:");
  }
LABEL_84:
  v95 = v9->_scroller;
  if (v95)
  {
    [(UIScrollView *)v95 bounds];
    double v97 = v96;
    double v98 = 0.0;
    if (v116 >= 2)
    {
      uint64_t v99 = 0;
      if (v117 <= 1) {
        uint64_t v100 = 1;
      }
      else {
        uint64_t v100 = v117;
      }
      do
      {
        v101 = [v36 objectAtIndex:v99];
        [v101 floatValue];
        double v98 = v98 + v102;

        v99 += 2;
        --v100;
      }
      while (v100);
    }
    -[UIScrollView setContentSize:](v9->_scroller, "setContentSize:", v97, v98 + (double)(v117 - 1) * 2.0 + 4.0 + 4.0);
  }
  id v103 = objc_loadWeakRetained((id *)&v9->_delegate);
  char v104 = objc_opt_respondsToSelector();

  if (v104)
  {
    id v105 = objc_loadWeakRetained((id *)&v9->_delegate);
    [v105 allDayViewDidLayoutSubviews:v9];
  }
  double v106 = EKUISeparatorLineThickness();
  dividerLineSuperview = v9->_dividerLineSuperview;
  if (dividerLineSuperview)
  {
    v108 = [(EKUIVisualEffectView *)dividerLineSuperview contentView];
  }
  else
  {
    v108 = v9;
  }
  v109 = v108;
  v110 = [(UIView *)v9->_dividerLineViewTop superview];

  if (!v110)
  {
    [(EKDayAllDayView *)v109 addSubview:v9->_dividerLineViewTop];
    [(UIView *)v9->_dividerLineViewTop setAutoresizingMask:34];
    dividerLineViewTop = v9->_dividerLineViewTop;
    [(EKDayAllDayView *)v9 frame];
    -[UIView setFrame:](dividerLineViewTop, "setFrame:", 0.0, 0.0);
  }
  v112 = [(UIView *)v9->_dividerLineViewBottom superview];

  if (!v112)
  {
    [(EKDayAllDayView *)v109 addSubview:v9->_dividerLineViewBottom];
    [(UIView *)v9->_dividerLineViewBottom setAutoresizingMask:10];
    dividerLineViewBottom = v9->_dividerLineViewBottom;
    [(EKDayAllDayView *)v9 bounds];
    CGFloat v114 = CGRectGetMaxY(v129) - v106;
    [(EKDayAllDayView *)v9 frame];
    -[UIView setFrame:](dividerLineViewBottom, "setFrame:", 0.0, v114);
  }
  v115 = v9->_dividerLineSuperview;
  if (!v115)
  {
    [(EKDayAllDayView *)v9 bringSubviewToFront:v9->_dividerLineViewTop];
    v115 = (EKUIVisualEffectView *)v9->_dividerLineViewBottom;
  }
  [(EKDayAllDayView *)v9 bringSubviewToFront:v115];
}

- (int64_t)_sizeClass
{
  uint64_t v3 = [(EKDayAllDayView *)self window];

  if (!v3) {
    return self->_targetSizeClass;
  }

  return EKUIWidthSizeClassForViewHierarchy(self);
}

- (id)_selectedCopyView
{
  uint64_t v3 = [(EKDayAllDayView *)self _findSelectedCopySubviewOfView:self];
  if (!v3)
  {
    uint64_t v3 = [(EKDayAllDayView *)self _findSelectedCopySubviewOfView:self->_scroller];
  }

  return v3;
}

- (id)_findSelectedCopySubviewOfView:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = objc_msgSend(a3, "subviews", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v9 = v8;
          if ([v9 isSelectedCopyView]) {
            goto LABEL_12;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  id v9 = 0;
LABEL_12:

  return v9;
}

+ (id)allDayLabelBoldFont
{
  v2 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28E0]];
  uint64_t v3 = [v2 fontDescriptor];
  [v3 pointSize];
  double v5 = v4;

  CalRoundToScreenScale(v5);
  double v7 = fmin(v6, 22.0);
  long long v8 = (void *)MEMORY[0x1E4FB08E0];

  return (id)[v8 systemFontOfSize:v7];
}

- (void)setShowsBorderLines:(BOOL)a3
{
  if (self->_showsBorderLines != a3)
  {
    BOOL v3 = a3;
    self->_showsBorderLines = a3;
    [(UIView *)self->_dividerLineViewTop setHidden:1];
    dividerLineViewBottom = self->_dividerLineViewBottom;
    if (v3)
    {
      if (!dividerLineViewBottom)
      {
        double v6 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
        double v7 = self->_dividerLineViewBottom;
        self->_dividerLineViewBottom = v6;

        if (self->_dividerLineVisualEffectColor)
        {
          long long v8 = self->_dividerLineViewBottom;
          -[UIView setBackgroundColor:](v8, "setBackgroundColor:");
        }
        else
        {
          id v9 = [MEMORY[0x1E4FB1618] separatorColor];
          [(UIView *)self->_dividerLineViewBottom setBackgroundColor:v9];
        }
      }
    }
    else
    {
      [(UIView *)dividerLineViewBottom setHidden:1];
    }
  }
}

- (void)setShowsLabel:(BOOL)a3
{
  if (self->_showsLabel != a3)
  {
    self->_showsLabel = a3;
    [(UILabel *)self->_allDay setHidden:!a3];
  }
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
  if (!self->_smallTextSettingLocked)
  {
    self->_usesSmallText = (unint64_t)(a3 - 3) < 2;
    [(EKDayAllDayView *)self _smallTextSettingChanged];
  }
}

- (void)_smallTextSettingChanged
{
  uint64_t v3 = [(NSMutableArray *)self->_occurrenceViews count];
  if (v3)
  {
    uint64_t v4 = v3;
    for (uint64_t i = 0; i != v4; ++i)
    {
      double v6 = [(NSMutableArray *)self->_occurrenceViews objectAtIndex:i];
      [v6 setUsesSmallText:self->_usesSmallText];
    }
  }

  [(EKDayAllDayView *)self setNeedsLayout];
}

- (void)setDelegate:(id)a3
{
}

- (void)setAllowsOccurrenceSelection:(BOOL)a3
{
  if (self->_allowSelection != a3)
  {
    BOOL v3 = a3;
    self->_allowSelection = a3;
    uint64_t v5 = [(NSMutableArray *)self->_occurrenceViews count];
    if (v5)
    {
      uint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        long long v8 = [(NSMutableArray *)self->_occurrenceViews objectAtIndex:i];
        [v8 setEnabled:v3];
      }
    }
  }
}

- (void)setDimmedOccurrence:(id)a3
{
  uint64_t v5 = (EKEvent *)a3;
  dimmedOccurrence = self->_dimmedOccurrence;
  id v9 = v5;
  if (dimmedOccurrence != v5)
  {
    if (dimmedOccurrence)
    {
      double v7 = -[EKDayAllDayView occurrenceViewForEvent:](self, "occurrenceViewForEvent:");
      [v7 setDimmed:0];
    }
    objc_storeStrong((id *)&self->_dimmedOccurrence, a3);
    if (self->_dimmedOccurrence)
    {
      long long v8 = -[EKDayAllDayView occurrenceViewForEvent:](self, "occurrenceViewForEvent:");
      [v8 setDimmed:1];
    }
  }
}

+ (BOOL)allDayContainSpaces
{
  v2 = (void *)s_allDayContainSpaces;
  if (!s_allDayContainSpaces)
  {
    BOOL v3 = NSNumber;
    uint64_t v4 = [a1 localizedAllDayString];
    uint64_t v5 = objc_msgSend(v3, "numberWithInt:", objc_msgSend(v4, "rangeOfString:", @" ") != 0x7FFFFFFFFFFFFFFFLL);
    uint64_t v6 = (void *)s_allDayContainSpaces;
    s_allDayContainSpaces = v5;

    v2 = (void *)s_allDayContainSpaces;
  }

  return [v2 BOOLValue];
}

+ (double)allDay1LineWidth
{
  v9[1] = *MEMORY[0x1E4F143B8];
  double result = *(double *)&s_allDay1LineWidth;
  if (*(double *)&s_allDay1LineWidth == 0.0)
  {
    uint64_t v8 = *MEMORY[0x1E4FB06F8];
    uint64_t v4 = objc_msgSend(a1, "allDayLabelFont", *(double *)&s_allDay1LineWidth);
    v9[0] = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];

    uint64_t v6 = [a1 localizedAllDayString];
    [v6 sizeWithAttributes:v5];
    s_allDay1LineWidth = v7;

    return *(double *)&s_allDay1LineWidth;
  }
  return result;
}

+ (id)unscaledAllDayFont
{
  return (id)[MEMORY[0x1E4FB08E0] systemFontOfSize:11.0];
}

+ (id)localizedAllDayString
{
  v2 = EventKitUIBundle();
  BOOL v3 = [v2 localizedStringForKey:@"all-day" value:&stru_1F0CC2140 table:0];

  return v3;
}

+ (double)maxAllowableAllDayTextWidth
{
  v2 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28E0]];
  BOOL v3 = [v2 fontDescriptor];
  [v3 pointSize];
  double v5 = v4;

  CalRoundToScreenScale(v5 * 3.57545455);
  return fmin(v6, 78.66);
}

+ (double)maxAllowableAllDayTextTwoLineHeight
{
  v2 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28E0]];
  BOOL v3 = [v2 fontDescriptor];
  [v3 pointSize];
  double v5 = v4;

  CalRoundToScreenScale(v5 * 2.54545455);
  return fmin(v6, 56.0);
}

+ (BOOL)shouldTimeBarWidthMatchAllDayTextWithResultWidth:(double *)a3
{
  [a1 allDay1LineWidth];
  double v6 = v5;
  if (a3) {
    *a3 = v5;
  }
  if ([a1 allDayContainSpaces]) {
    return 0;
  }
  [a1 maxAllowableAllDayTextWidth];
  return v6 > v8;
}

+ (BOOL)shouldAllDayTextUseTwoLines
{
  int v3 = [a1 allDayContainSpaces];
  if (v3)
  {
    [a1 allDay1LineWidth];
    double v5 = v4;
    [a1 maxAllowableAllDayTextWidth];
    LOBYTE(v3) = v5 > v6;
  }
  return v3;
}

+ (void)clearStaticCache
{
  v2 = (void *)s_allDayContainSpaces;
  s_allDayContainSpaces = 0;

  s_allDay1LineWidth = 0;
}

- (EKDayAllDayView)initWithFrame:(CGRect)a3
{
  return -[EKDayAllDayView initWithFrame:sizeClass:](self, "initWithFrame:sizeClass:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_localeChanged:(id)a3
{
  int v3 = objc_opt_class();

  [v3 clearStaticCache];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v9 = a3;
  if ([v9 count] == 1)
  {
    double v5 = [v9 anyObject];
    if (v5)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      char v7 = objc_opt_respondsToSelector();

      if (v7)
      {
        id v8 = objc_loadWeakRetained((id *)&self->_delegate);
        [v8 allDayView:self didSelectEvent:0 userInitiated:1];
      }
    }
  }
  else
  {
    double v5 = 0;
  }
}

- (void)reAdjustAllDayLabelLayout
{
  if ([(id)objc_opt_class() shouldAllDayTextUseTwoLines])
  {
    [(id)objc_opt_class() maxAllowableAllDayTextWidth];
    [(id)objc_opt_class() maxAllowableAllDayTextTwoLineHeight];
    [(UILabel *)self->_allDay frame];
    double v4 = v3;
    [(UILabel *)self->_allDay frame];
    [(UILabel *)self->_allDay setFrame:v4];
    uint64_t v5 = 2;
  }
  else
  {
    uint64_t v5 = 1;
  }
  [(UILabel *)self->_allDay setNumberOfLines:v5];
  allDay = self->_allDay;

  [(UILabel *)allDay sizeToFit];
}

- (double)firstEventYOffset
{
  return 4.0;
}

- (id)occurrenceViewForEvent:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = self->_occurrenceViews;
  id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        long long v10 = objc_msgSend(v9, "occurrence", (void)v13);
        char v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (double)nextAvailableOccurrenceViewYOrigin
{
  [(EKDayAllDayView *)self firstEventYOffset];
  double v4 = v3;
  if ([(NSMutableArray *)self->_occurrenceViews count])
  {
    uint64_t v5 = [(NSMutableArray *)self->_occurrenceViews objectAtIndex:[(NSMutableArray *)self->_occurrenceViews count] - 1];
    [v5 frame];
    double v4 = CGRectGetMaxY(v7) + 2.0;
  }
  return v4;
}

- (void)addViewToScroller:(id)a3
{
  id v4 = a3;
  if (self->_scroller)
  {
    id v16 = v4;
    uint64_t v5 = [v4 superview];
    scroller = self->_scroller;

    id v4 = v16;
    if (v5 != scroller)
    {
      CGRect v7 = [v16 superview];
      [v16 frame];
      objc_msgSend(v7, "convertRect:toView:", self->_scroller);
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;

      [(UIScrollView *)self->_scroller addSubview:v16];
      objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);
      id v4 = v16;
    }
  }
}

- (BOOL)containsEvent:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = self->_occurrenceViews;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        double v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "occurrence", (void)v12);
        char v10 = [v9 isEqual:v4];

        if (v10)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)selectedEvent
{
  return self->_selectedEvent;
}

- (void)selectEvent:(id)a3
{
  uint64_t v6 = (EKEvent *)a3;
  if (self->_selectedEvent != v6)
  {
    double v8 = v6;
    if (v6 && ![(EKDayAllDayView *)self containsEvent:v6])
    {
      uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2 object:self file:@"EKDayAllDayView.m" lineNumber:515 description:@"Attempt to select an event not contained by this all-day view"];
    }
    objc_storeStrong((id *)&self->_selectedEvent, a3);
    uint64_t v6 = v8;
  }
}

- (void)lockUseOfSmallTextToState:(BOOL)a3
{
  self->_usesSmallText = a3;
  self->_smallTextSettingLocked = 1;
  [(EKDayAllDayView *)self _smallTextSettingChanged];
}

- (double)_languageAwareAllDayEventHeight:(id)a3
{
  id v4 = a3;
  +[EKDayOccurrenceView minimumHeightForSizeClass:[(EKDayAllDayView *)self _sizeClass] orientation:self->_orientation isAllDay:1];
  double v6 = v5;
  uint64_t v7 = [v4 currentImageState];
  int v8 = [v7 requiresLanguageAwarePadding];

  if (v8)
  {
    double v9 = [v4 currentImageState];
    [v9 totalLanguageAwareHeightPadding];
    double v6 = v6 + v10;
  }
  return v6;
}

- (void)configureOccurrenceViewForGestureController:(id)a3
{
  id v19 = a3;
  [(EKDayAllDayView *)self _configureOccurrenceViewMarginAndPadding:v19];
  id v4 = [v19 occurrence];

  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    double v6 = [WeakRetained allDayViewRequestsCurrentDisplayDate:self];

    uint64_t v7 = [v6 calendarDateForDay];
    [v7 absoluteTime];
    double v9 = v8;

    double v10 = [v6 calendarDateForEndOfDay];
    [v10 absoluteTime];
    double v12 = v11 + 1.0;

    long long v13 = [v19 occurrence];
    long long v14 = [v13 startDate];
    [v14 timeIntervalSinceReferenceDate];
    [v19 setHasPrecedingDuration:v15 < v9];

    id v16 = [v19 occurrence];
    uint64_t v17 = [v16 endDateUnadjustedForLegacyClients];
    [v17 timeIntervalSinceReferenceDate];
    [v19 setHasTrailingDuration:v18 > v12];
  }
}

- (void)_configureOccurrenceViewMarginAndPadding:(id)a3
{
  id v14 = a3;
  +[EKDayOccurrenceView defaultPadding];
  double v5 = v4;
  double v7 = v6;
  int v8 = [v14 hasIcon];
  double v9 = [(EKDayAllDayView *)self window];

  if (v9)
  {
    if (EKUICurrentWidthSizeClassIsRegularInViewHierarchy(self))
    {
LABEL_3:
      BOOL v10 = (unint64_t)(self->_orientation - 3) >= 2;
      double v11 = 2.0;
      double v12 = 3.0;
      goto LABEL_6;
    }
  }
  else if (self->_targetSizeClass == 2)
  {
    goto LABEL_3;
  }
  BOOL v10 = (unint64_t)(self->_orientation - 3) >= 2;
  double v11 = 1.5;
  double v12 = 1.0;
LABEL_6:
  if (!v10) {
    double v11 = v12;
  }
  double v13 = 0.5;
  if (v8) {
    double v13 = 1.5;
  }
  objc_msgSend(v14, "setPadding:", v11, v13, v5, v7);
}

- (void)_setUpBirthdayCountViewIfNeeded
{
  birthdayCountOccurrenceView = self->_birthdayCountOccurrenceView;
  if (!birthdayCountOccurrenceView)
  {
    if ([(NSMutableArray *)self->_occurrenceViews count])
    {
      double v4 = [(NSMutableArray *)self->_occurrenceViews firstObject];
      [v4 frame];
      double v6 = v5;
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
    }
    else
    {
      double v6 = *MEMORY[0x1E4F1DB28];
      double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    }
    double v13 = -[EKDayOccurrenceView initWithFrame:]([EKDayOccurrenceView alloc], "initWithFrame:", v6, v8, v10, v12);
    [(EKDayOccurrenceView *)v13 setUsesSmallText:self->_usesSmallText];
    [(EKDayOccurrenceView *)v13 setAllDayDrawingStyle:1];
    [(EKDayOccurrenceView *)v13 setDelegate:self];
    [(EKDayOccurrenceView *)v13 setIsSelectedCopyView:0];
    [(EKDayOccurrenceView *)v13 setOpaque:1];
    [(EKDayAllDayView *)self _configureOccurrenceViewMarginAndPadding:v13];
    [(EKDayOccurrenceView *)v13 setBirthday:1];
    id v14 = self->_birthdayCountOccurrenceView;
    self->_birthdayCountOccurrenceView = v13;
    double v15 = v13;

    [(EKDayAllDayView *)self addSubview:self->_birthdayCountOccurrenceView];
    birthdayCountOccurrenceView = self->_birthdayCountOccurrenceView;
  }
  int64_t birthdayCount = self->_birthdayCount;

  [(EKDayOccurrenceView *)birthdayCountOccurrenceView setBirthdayCount:birthdayCount];
}

- (void)setShowBirthdayCountInsteadOfEvents:(BOOL)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (self->_showBirthdayCount != a3)
  {
    BOOL v3 = a3;
    self->_showBirthdayCount = a3;
    if (a3)
    {
      long long v21 = 0uLL;
      long long v22 = 0uLL;
      long long v19 = 0uLL;
      long long v20 = 0uLL;
      double v5 = self->_occurrenceViews;
      uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v20 != v8) {
              objc_enumerationMutation(v5);
            }
            [*(id *)(*((void *)&v19 + 1) + 8 * i) setHidden:1];
          }
          uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
        }
        while (v7);
      }

      [(EKDayAllDayView *)self _setUpBirthdayCountViewIfNeeded];
    }
    else
    {
      long long v17 = 0uLL;
      long long v18 = 0uLL;
      long long v15 = 0uLL;
      long long v16 = 0uLL;
      double v10 = self->_occurrenceViews;
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v16;
        do
        {
          for (uint64_t j = 0; j != v12; ++j)
          {
            if (*(void *)v16 != v13) {
              objc_enumerationMutation(v10);
            }
            objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * j), "setHidden:", 0, (void)v15);
          }
          uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
        }
        while (v12);
      }
    }
    -[EKDayOccurrenceView setHidden:](self->_birthdayCountOccurrenceView, "setHidden:", !v3, (void)v15);
    [(EKDayAllDayView *)self setNeedsLayout];
  }
}

- (BOOL)showBirthdayCountInsteadOfEvents
{
  return self->_showBirthdayCount;
}

- (BOOL)allowsOccurrenceSelection
{
  return self->_allowSelection;
}

- (void)setShowsSelection:(BOOL)a3
{
  if (self->_showSelection != a3) {
    self->_showSelection = a3;
  }
}

- (BOOL)showsSelection
{
  return self->_showSelection;
}

- (void)dayOccurrenceViewSelected:(id)a3 source:(unint64_t)a4
{
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    double v9 = [v10 occurrence];
    [v8 allDayView:self didSelectEvent:v9 userInitiated:a4 == 0];
  }
}

- (id)presentationControllerForEditMenu
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  BOOL v3 = [WeakRetained presentationControllerForEditMenu];

  return v3;
}

- (id)selectedEventsForEditMenu
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  BOOL v3 = [WeakRetained selectedEventsForEditMenu];

  return v3;
}

- (void)attemptDisplayReviewPrompt
{
  BOOL v3 = [(EKDayAllDayView *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(EKDayAllDayView *)self delegate];
    [v5 attemptDisplayReviewPrompt];
  }
}

- (void)setFixedHeight:(double)a3
{
  self->_fixedHeight = a3;
  [(EKDayAllDayView *)self frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  [(EKDayAllDayView *)self _height];

  -[EKDayAllDayView setFrame:](self, "setFrame:", v5, v7, v9, v10);
}

- (void)setAllDayLabelHighlighted:(BOOL)a3
{
  if (self->_allDayLabelHighlighted != a3)
  {
    BOOL v3 = a3;
    self->_allDayLabelHighlighted = a3;
    double v5 = objc_opt_class();
    if (v3)
    {
      double v6 = [v5 allDayLabelBoldFont];
      p_allDay = &self->_allDay;
      [(UILabel *)*p_allDay setFont:v6];

      [(UILabel *)*p_allDay frame];
      CGRect v12 = CGRectOffset(v11, -1.0, 0.0);
      CGRect v13 = CGRectInset(v12, -1.0, 0.0);
    }
    else
    {
      double v8 = [v5 allDayLabelFont];
      p_allDay = &self->_allDay;
      [(UILabel *)*p_allDay setFont:v8];

      [(UILabel *)*p_allDay frame];
      CGRect v15 = CGRectInset(v14, 1.0, 0.0);
      CGRect v13 = CGRectOffset(v15, 1.0, 0.0);
    }
    double v9 = *p_allDay;
    -[UILabel setFrame:](v9, "setFrame:", v13.origin.x, v13.origin.y, v13.size.width, v13.size.height);
  }
}

- (BOOL)isAllDayLabelHighlighted
{
  return self->_allDayLabelHighlighted;
}

- (void)setAllDayLabelColor:(id)a3
{
}

- (void)setBorderColor:(id)a3
{
  dividerLineViewTop = self->_dividerLineViewTop;
  id v5 = a3;
  [(UIView *)dividerLineViewTop setBackgroundColor:v5];
  [(UIView *)self->_dividerLineViewBottom setBackgroundColor:v5];
}

- (void)setTopBorderLineHidden:(BOOL)a3
{
}

- (void)updateLabelFont
{
  allDay = self->_allDay;
  double v4 = [(id)objc_opt_class() allDayLabelFont];
  [(UILabel *)allDay setFont:v4];

  [(UILabel *)self->_allDay sizeToFit];

  [(EKDayAllDayView *)self setNeedsLayout];
}

- (void)setDividerLineVisualEffect:(id)a3
{
  id v11 = a3;
  [(UIView *)self->_dividerLineViewTop removeFromSuperview];
  [(UIView *)self->_dividerLineViewBottom removeFromSuperview];
  [(EKDayAllDayView *)self setNeedsLayout];
  dividerLineSuperview = self->_dividerLineSuperview;
  if (v11)
  {
    if (!dividerLineSuperview)
    {
      id v5 = [EKUIVisualEffectView alloc];
      [(EKDayAllDayView *)self bounds];
      double v6 = -[EKUIVisualEffectView initWithFrame:](v5, "initWithFrame:");
      double v7 = self->_dividerLineSuperview;
      self->_dividerLineSuperview = v6;

      double v8 = [MEMORY[0x1E4FB1618] clearColor];
      [(EKUIVisualEffectView *)self->_dividerLineSuperview setBackgroundColor:v8];

      [(EKUIVisualEffectView *)self->_dividerLineSuperview setUserInteractionEnabled:0];
      [(EKUIVisualEffectView *)self->_dividerLineSuperview setAutoresizingMask:18];
      [(EKUIVisualEffectView *)self->_dividerLineSuperview setTintColorDelegate:self];
      [(EKDayAllDayView *)self addSubview:self->_dividerLineSuperview];
      dividerLineSuperview = self->_dividerLineSuperview;
    }
    [(EKUIVisualEffectView *)dividerLineSuperview setEffect:v11];
    if (self->_dividerLineVisualEffectColor) {
      -[EKDayAllDayView setBorderColor:](self, "setBorderColor:");
    }
  }
  else if (dividerLineSuperview)
  {
    [(EKUIVisualEffectView *)dividerLineSuperview removeFromSuperview];
    double v9 = self->_dividerLineSuperview;
    self->_dividerLineSuperview = 0;

    dividerLineVisualEffectColor = self->_dividerLineVisualEffectColor;
    self->_dividerLineVisualEffectColor = 0;
  }
}

- (void)viewTintColorDidChangeForView:(id)a3 toColor:(id)a4
{
  objc_storeStrong((id *)&self->_dividerLineVisualEffectColor, a4);
  id v6 = a4;
  [(EKDayAllDayView *)self setBorderColor:v6];
}

- (EKDayAllDayViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EKDayAllDayViewDelegate *)WeakRetained;
}

- (BOOL)showsBorderLines
{
  return self->_showsBorderLines;
}

- (BOOL)showsLabel
{
  return self->_showsLabel;
}

- (BOOL)forceSingleColumnLayout
{
  return self->_forceSingleColumnLayout;
}

- (void)setForceSingleColumnLayout:(BOOL)a3
{
  self->_forceSingleColumnLayout = a3;
}

- (int)maxVisibleRows
{
  return self->_maxVisibleRows;
}

- (void)setMaxVisibleRows:(int)a3
{
  self->_maxVisibleRows = a3;
}

- (EKEvent)dimmedOccurrence
{
  return self->_dimmedOccurrence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimmedOccurrence, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_temporaryViewCache, 0);
  objc_storeStrong((id *)&self->_birthdayCountOccurrenceView, 0);
  objc_storeStrong((id *)&self->_dividerLineVisualEffectColor, 0);
  objc_storeStrong((id *)&self->_dividerLineSuperview, 0);
  objc_storeStrong((id *)&self->_dividerLineViewBottom, 0);
  objc_storeStrong((id *)&self->_dividerLineViewTop, 0);
  objc_storeStrong((id *)&self->_selectedEvent, 0);
  objc_storeStrong((id *)&self->_scroller, 0);
  objc_storeStrong((id *)&self->_allDay, 0);

  objc_storeStrong((id *)&self->_occurrenceViews, 0);
}

@end