@interface EKEventDetailTitleCell
+ (id)_locationFont;
+ (id)_scaledLocationFont;
+ (id)_scaledTitleFont;
+ (id)_titleFont;
+ (void)_invalidateCachedFonts;
+ (void)_registerForInvalidation;
- (BOOL)_shouldShowConferenceCell;
- (BOOL)conferenceCellShouldPresentShareSheet:(id)a3;
- (BOOL)hasMapItemLaunchOptionFromTimeToLeaveNotification;
- (BOOL)nonInteractivePlatterMode;
- (BOOL)showingInlineDayView;
- (BOOL)update;
- (EKEventDetailTitleCell)initWithEvent:(id)a3 editable:(BOOL)a4 style:(int64_t)a5;
- (EKEventDetailTitleCellDelegate)delegate;
- (UIView)sourceViewForPopover;
- (double)_layoutForWidth:(double)a3;
- (double)titleHeight;
- (id)_conferenceDetailView;
- (id)_dateTimeViewForLine:(unint64_t)a3;
- (id)_editButton;
- (id)_recurrenceButton;
- (id)_recurrenceView;
- (id)_statusView;
- (id)_suggestedLocationCell;
- (id)_titleView;
- (id)_travelTimeView;
- (id)owningViewController;
- (unint64_t)numberOfTitleLines;
- (void)_promptForSpanWithSourceView:(id)a3 completionBlock:(id)a4;
- (void)_saveEventWithSpan:(int64_t)a3;
- (void)_setDateTimeString:(id)a3 line:(unint64_t)a4;
- (void)_updateSeparatorStyle;
- (void)addLocation:(id)a3;
- (void)conferenceCell:(id)a3 requestPresentShareSheetWithActivityItems:(id)a4 withPopoverSourceView:(id)a5;
- (void)conferenceCellUpdated:(id)a3;
- (void)contentSizeCategoryChanged:(id)a3;
- (void)dealloc;
- (void)didTapAddSuggestedLocationCell:(id)a3 disambiguatedLocation:(id)a4;
- (void)didTapDismissSuggestedLocationCell:(id)a3;
- (void)editButtonTapped;
- (void)handleTapOnLabel:(id)a3;
- (void)layoutForWidth:(double)a3 position:(int)a4;
- (void)layoutMarginsDidChange;
- (void)layoutSubviews;
- (void)nextButtonTapped;
- (void)previousButtonTapped;
- (void)setDelegate:(id)a3;
- (void)setHasMapItemLaunchOptionFromTimeToLeaveNotification:(BOOL)a3;
- (void)setHideBottomCellSeparator:(BOOL)a3;
- (void)setHideTopCellSeparator:(BOOL)a3;
- (void)setNonInteractivePlatterMode:(BOOL)a3;
- (void)setNumberOfTitleLines:(unint64_t)a3;
- (void)setPrimaryTextColor:(id)a3;
- (void)setRecurrenceString:(id)a3;
- (void)setShowingInlineDayView:(BOOL)a3;
- (void)setStatusString:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTravelTimeString:(id)a3;
- (void)showRecurrenceDiff:(id)a3;
@end

@implementation EKEventDetailTitleCell

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)EKEventDetailTitleCell;
  [(EKEventDetailTitleCell *)&v4 dealloc];
}

+ (void)_registerForInvalidation
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__EKEventDetailTitleCell__registerForInvalidation__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_registerForInvalidation_onceToken != -1) {
    dispatch_once(&_registerForInvalidation_onceToken, block);
  }
}

void __50__EKEventDetailTitleCell__registerForInvalidation__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 addObserver:*(void *)(a1 + 32) selector:sel__invalidateCachedFonts name:*MEMORY[0x1E4FB27A8] object:0];
}

- (EKEventDetailTitleCell)initWithEvent:(id)a3 editable:(BOOL)a4 style:(int64_t)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)EKEventDetailTitleCell;
  v9 = [(EKEventDetailCell *)&v12 initWithEvent:v8 editable:v6 style:a5];
  if (v9)
  {
    [MEMORY[0x1E4F25580] geocodeEventIfNeeded:v8];
    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v9 selector:sel_contentSizeCategoryChanged_ name:*MEMORY[0x1E4FB27A8] object:0];
  }
  return v9;
}

- (void)layoutMarginsDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)EKEventDetailTitleCell;
  [(EKEventDetailCell *)&v4 layoutMarginsDidChange];
  [(EKEventDetailTitleCell *)self frame];
  [(EKEventDetailTitleCell *)self layoutForWidth:self->_lastPosition position:v3];
}

- (void)contentSizeCategoryChanged:(id)a3
{
  id v5 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  objc_super v4 = [(UIButton *)self->_editButton titleLabel];
  [v4 setFont:v5];
}

- (UIView)sourceViewForPopover
{
  editButton = self->_editButton;
  if (!editButton)
  {
    editButton = self->_titleView;
    if (!editButton) {
      editButton = self;
    }
  }
  return (UIView *)editButton;
}

- (void)setTitle:(id)a3
{
  id v17 = a3;
  uint64_t v4 = [v17 length];
  id v5 = [(EKEventDetailTitleCell *)self _titleView];
  BOOL v6 = v5;
  if (v4)
  {
    [v5 setText:v17];

    if ([(EKEventDetailTitleCell *)self nonInteractivePlatterMode]) {
      char v7 = CUIKCurrentLocaleRequiresIndianLanguageAdjustments();
    }
    else {
      char v7 = 0;
    }
    if ([(EKEvent *)self->super._event status] != EKEventStatusCanceled) {
      goto LABEL_12;
    }
    v10 = objc_opt_class();
    if (v7) {
      [v10 _scaledTitleFont];
    }
    else {
    BOOL v6 = [v10 _titleFont];
    }
    v11 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v12 = *MEMORY[0x1E4FB06F8];
    v13 = [MEMORY[0x1E4FB1618] labelColor];
    uint64_t v14 = *MEMORY[0x1E4FB0700];
    v15 = [NSNumber numberWithBool:1];
    id v8 = objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", v6, v12, v13, v14, v15, *MEMORY[0x1E4FB0768], 0);

    v9 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v17 attributes:v8];
    v16 = [(EKEventDetailTitleCell *)self _titleView];
    [v16 setAttributedText:v9];
  }
  else
  {
    id v8 = EventKitUIBundle();
    v9 = [v8 localizedStringForKey:@"Untitled event" value:@"New Event" table:0];
    [v6 setText:v9];
  }

LABEL_12:
  self->_visibleItems |= 1u;
}

- (void)_setDateTimeString:(id)a3 line:(unint64_t)a4
{
  id v7 = a3;
  if (-[NSMutableArray count](self->_dateTimeViews, "count") > a4 || [v7 length])
  {
    BOOL v6 = [(EKEventDetailTitleCell *)self _dateTimeViewForLine:a4];
    [v6 setText:v7];
  }
}

- (void)setTravelTimeString:(id)a3
{
  id v6 = a3;
  if ([v6 length])
  {
    uint64_t v4 = [(EKEventDetailTitleCell *)self _travelTimeView];
    [v4 setText:v6];

    unsigned int v5 = self->_visibleItems | 0x10;
  }
  else
  {
    unsigned int v5 = self->_visibleItems & 0xFFFFFFEF;
  }
  self->_visibleItems = v5;
}

- (void)setRecurrenceString:(id)a3
{
  id v7 = a3;
  if ([v7 length])
  {
    uint64_t v4 = [(EKEventDetailTitleCell *)self _recurrenceView];
    [v4 setText:v7];

    unsigned int v5 = [(EKEventDetailTitleCell *)self _recurrenceButton];
    [v5 setTitle:v7 forState:0];

    unsigned int v6 = self->_visibleItems | 0x20;
  }
  else
  {
    unsigned int v6 = self->_visibleItems & 0xFFFFFFDF;
  }
  self->_visibleItems = v6;
}

- (void)setStatusString:(id)a3
{
  id v6 = a3;
  if ([v6 length])
  {
    uint64_t v4 = [(EKEventDetailTitleCell *)self _statusView];
    [v4 setText:v6];

    unsigned int v5 = self->_visibleItems | 0x40;
  }
  else
  {
    unsigned int v5 = self->_visibleItems & 0xFFFFFFBF;
  }
  self->_visibleItems = v5;
}

- (void)setPrimaryTextColor:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(UILabel *)self->_titleView setTextColor:v4];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unsigned int v5 = self->_locationItems;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9), "locationView", (void)v11);
        [v10 setTextColor:v4];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)setNumberOfTitleLines:(unint64_t)a3
{
  if (self->_numberOfTitleLines != a3)
  {
    self->_numberOfTitleLines = a3;
    -[UILabel setNumberOfLines:](self->_titleView, "setNumberOfLines:");
  }
}

+ (void)_invalidateCachedFonts
{
  _fontUpdateTokenBody = 0;
  _fontUpdateTokenFootnote = 0;
}

+ (id)_titleFont
{
  [a1 _registerForInvalidation];
  if (_fontUpdateTokenBody != -1) {
    dispatch_once(&_fontUpdateTokenBody, &__block_literal_global_210);
  }
  id v2 = (void *)_titleFont_font;

  return v2;
}

void __36__EKEventDetailTitleCell__titleFont__block_invoke()
{
  id v2 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2990] addingSymbolicTraits:32770 options:0];
  uint64_t v0 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v2 size:0.0];
  v1 = (void *)_titleFont_font;
  _titleFont_font = v0;
}

+ (id)_scaledTitleFont
{
  [a1 _registerForInvalidation];
  if (_fontUpdateTokenBody != -1) {
    dispatch_once(&_fontUpdateTokenBody, &__block_literal_global_213);
  }
  id v2 = (void *)_scaledTitleFont_font;

  return v2;
}

void __42__EKEventDetailTitleCell__scaledTitleFont__block_invoke()
{
  id v7 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2998] addingSymbolicTraits:32770 options:0];
  uint64_t v0 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v7 size:0.0];
  v1 = (void *)_scaledTitleFont_font;
  _scaledTitleFont_font = v0;

  id v2 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  double v3 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  [v3 lineHeight];
  CalRoundToScreenScale(v4 * 1.5);
  uint64_t v5 = objc_msgSend(v2, "fontWithSize:");
  uint64_t v6 = (void *)_scaledTitleFont_font;
  _scaledTitleFont_font = v5;
}

+ (id)_locationFont
{
  [a1 _registerForInvalidation];
  if (_fontUpdateTokenFootnote != -1) {
    dispatch_once(&_fontUpdateTokenFootnote, &__block_literal_global_215);
  }
  id v2 = (void *)_locationFont_font;

  return v2;
}

void __39__EKEventDetailTitleCell__locationFont__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  v1 = (void *)_locationFont_font;
  _locationFont_font = v0;
}

+ (id)_scaledLocationFont
{
  [a1 _registerForInvalidation];
  if (_fontUpdateTokenFootnote != -1) {
    dispatch_once(&_fontUpdateTokenFootnote, &__block_literal_global_217);
  }
  id v2 = (void *)_scaledLocationFont_font;

  return v2;
}

void __45__EKEventDetailTitleCell__scaledLocationFont__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
  v1 = (void *)_scaledLocationFont_font;
  _scaledLocationFont_font = v0;
}

- (void)addLocation:(id)a3
{
  id v7 = a3;
  if ([v7 length]
    && +[EKEventDetailLocationItem isValidLocation:v7 event:self->super._event])
  {
    if (!self->_locationItems)
    {
      double v4 = [MEMORY[0x1E4F1CA48] array];
      locationItems = self->_locationItems;
      self->_locationItems = v4;
    }
    uint64_t v6 = [[EKEventDetailLocationItem alloc] initWithLocationName:v7 forEvent:self->super._event];
    [(EKEventDetailLocationItem *)v6 setHasMapItemLaunchOptionFromTimeToLeaveNotification:[(EKEventDetailTitleCell *)self hasMapItemLaunchOptionFromTimeToLeaveNotification]];
    [(EKEventDetailLocationItem *)v6 updateAttributedString];
    [(NSMutableArray *)self->_locationItems addObject:v6];
    self->_visibleItems |= 2u;
  }
}

- (BOOL)update
{
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F25580] geocodeEventIfNeeded:self->super._event];
  self->_visibleItems = 0;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  double v3 = self->_locationItems;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v108 objects:v116 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v109;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v109 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(*((void *)&v108 + 1) + 8 * i) locationView];
        [v8 removeFromSuperview];
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v108 objects:v116 count:16];
    }
    while (v5);
  }

  locationItems = self->_locationItems;
  self->_locationItems = 0;

  EKEventStatus v92 = [(EKEvent *)self->super._event status];
  v10 = [(EKEvent *)self->super._event title];
  [(EKEventDetailTitleCell *)self setTitle:v10];

  long long v11 = [(EKEvent *)self->super._event locationsWithoutPrediction];
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v104 objects:v115 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v105;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v105 != v14) {
          objc_enumerationMutation(v11);
        }
        [(EKEventDetailTitleCell *)self addLocation:*(void *)(*((void *)&v104 + 1) + 8 * j)];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v104 objects:v115 count:16];
    }
    while (v13);
  }
  uint64_t v16 = [(EKEvent *)self->super._event attendees];
  v103[0] = MEMORY[0x1E4F143A8];
  v103[1] = 3221225472;
  v103[2] = __32__EKEventDetailTitleCell_update__block_invoke;
  v103[3] = &unk_1E6089990;
  v103[4] = self;
  [v16 enumerateObjectsUsingBlock:v103];

  id v17 = [(EKEvent *)self->super._event preferredLocation];
  if ([v17 isStructured] && objc_msgSend(v17, "isPrediction"))
  {
    v18 = [(EKEventDetailTitleCell *)self delegate];
    v19 = [v18 proposedTime];
    if (v19)
    {
    }
    else
    {
      v20 = [(EKEventDetailTitleCell *)self delegate];
      char v21 = [v20 minimalMode];

      if ((v21 & 1) == 0)
      {
        v22 = [(EKEventDetailTitleCell *)self _suggestedLocationCell];
        [v22 setEvent:self->super._event];

        self->_visibleItems |= 0x100u;
      }
    }
  }
  if ([(EKEventDetailTitleCell *)self _shouldShowConferenceCell])
  {
    v23 = [(EKEventDetailTitleCell *)self _conferenceDetailView];
    [v23 update];

    self->_visibleItems |= 0x200u;
  }
  uint64_t v24 = [(EKEvent *)self->super._event calendar];
  v90 = (void *)v24;
  if (EKUICurrentWidthSizeClassIsRegularInViewHierarchy(self))
  {
    [(EKEventDetailTitleCell *)self setColor:0];
  }
  else
  {
    v25 = [(EKEvent *)self->super._event eventStore];
    v26 = [v25 colorForCalendar:v24];
    [(EKEventDetailTitleCell *)self setColor:v26];
  }
  uint64_t v27 = EKUIWidthSizeClassForViewHierarchy(self);
  if (!v27)
  {
    v28 = [(EKEventDetailTitleCell *)self traitCollection];
    uint64_t v27 = [v28 horizontalSizeClass];

    v29 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v114 = v27;
      _os_log_impl(&dword_1B3F4C000, v29, OS_LOG_TYPE_ERROR, "Size class from EKUIWidthSizeClassForViewHierarchy was unspecified, so fall back to getting size class from view's trait collection [%ld]", buf, 0xCu);
    }
    if (!v27)
    {
      v30 = kEKUILogHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v27 = 1;
        uint64_t v114 = 1;
        _os_log_impl(&dword_1B3F4C000, v30, OS_LOG_TYPE_ERROR, "Size class from view's trait collection was unspecified, so fall back to default size class [%ld]", buf, 0xCu);
      }
      else
      {
        uint64_t v27 = 1;
      }
    }
  }
  v31 = v17;
  event = self->super._event;
  id v101 = 0;
  id v102 = 0;
  id v99 = 0;
  id v100 = 0;
  v33 = [(EKEventDetailTitleCell *)self delegate];
  v34 = [v33 proposedTime];
  CalDetailStringsForCalendarEvent(event, v27, &v102, &v101, &v100, &v99, v34, 0);
  id v35 = v102;
  id v36 = v101;
  id v37 = v100;
  id v38 = v99;

  v89 = v35;
  [(EKEventDetailTitleCell *)self _setDateTimeString:v35 line:0];
  v88 = v36;
  [(EKEventDetailTitleCell *)self _setDateTimeString:v36 line:1];
  v87 = v37;
  [(EKEventDetailTitleCell *)self _setDateTimeString:v37 line:2];
  v86 = v38;
  [(EKEventDetailTitleCell *)self _setDateTimeString:v38 line:3];
  [(EKEvent *)self->super._event travelTime];
  if (v39 == 0.0)
  {
    [(EKEventDetailTitleCell *)self setTravelTimeString:0];
  }
  else
  {
    [(EKEvent *)self->super._event travelTime];
    v40 = CUIKDisplayStringTravelTimeAndDuration();
    [(EKEventDetailTitleCell *)self setTravelTimeString:v40];
  }
  if ([(EKEvent *)self->super._event isOrWasPartOfRecurringSeries])
  {
    v41 = [(EKEvent *)self->super._event singleRecurrenceRule];
    if (v41)
    {
      v42 = [(EKEvent *)self->super._event startDate];
      v43 = [(EKEvent *)self->super._event eventStore];
      v44 = [v43 timeZone];
      CUIKStringForRecurrenceRule();
      v45 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v46 = NSString;
      v47 = EventKitUIBundle();
      v48 = [v47 localizedStringForKey:@"Repeats %@" value:&stru_1F0CC2140 table:0];
      if (v45) {
        v49 = v45;
      }
      else {
        v49 = &stru_1F0CC2140;
      }
      uint64_t v50 = objc_msgSend(v46, "localizedStringWithFormat:", v48, v49);
    }
    else
    {
      uint64_t v50 = 0;
    }
  }
  else
  {
    v41 = 0;
    uint64_t v50 = 0;
  }
  if (v92 == EKEventStatusCanceled)
  {
    v51 = EventKitUIBundle();
    uint64_t v52 = [v51 localizedStringForKey:@"Event has been canceled" value:&stru_1F0CC2140 table:0];
  }
  else
  {
    uint64_t v52 = 0;
  }
  [(EKEventDetailTitleCell *)self setRecurrenceString:v50];
  v84 = (void *)v52;
  [(EKEventDetailTitleCell *)self setStatusString:v52];
  if (!self->_observingLocaleChanges)
  {
    v53 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v53 addObserver:self selector:sel_update name:*MEMORY[0x1E4F57AB0] object:0];

    self->_observingLocaleChanges = 1;
  }
  v85 = (void *)v50;
  if ([(EKEventDetailTitleCell *)self nonInteractivePlatterMode]
    && (CUIKCurrentLocaleRequiresIndianLanguageAdjustments() & 1) != 0)
  {
    v54 = [(id)objc_opt_class() _scaledTitleFont];
    char v55 = 1;
  }
  else
  {
    v54 = [(id)objc_opt_class() _titleFont];
    char v55 = 0;
  }
  [(UILabel *)self->_titleView setFont:v54];
  titleView = self->_titleView;
  v57 = [MEMORY[0x1E4FB1618] labelColor];
  [(UILabel *)titleView setTextColor:v57];

  v58 = objc_opt_class();
  v91 = v31;
  if (v55) {
    [v58 _scaledLocationFont];
  }
  else {
  v59 = [v58 _locationFont];
  }
  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  v60 = self->_locationItems;
  uint64_t v61 = [(NSMutableArray *)v60 countByEnumeratingWithState:&v95 objects:v112 count:16];
  if (v61)
  {
    uint64_t v62 = v61;
    uint64_t v63 = *(void *)v96;
    do
    {
      for (uint64_t k = 0; k != v62; ++k)
      {
        if (*(void *)v96 != v63) {
          objc_enumerationMutation(v60);
        }
        v65 = [*(id *)(*((void *)&v95 + 1) + 8 * k) locationView];
        [v65 setFont:v59];
      }
      uint64_t v62 = [(NSMutableArray *)v60 countByEnumeratingWithState:&v95 objects:v112 count:16];
    }
    while (v62);
  }

  travelTimeView = self->_travelTimeView;
  v67 = [(id)objc_opt_class() _locationFont];
  [(UILabel *)travelTimeView setFont:v67];

  v68 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(UILabel *)self->_travelTimeView setTextColor:v68];

  dateTimeViews = self->_dateTimeViews;
  v93[0] = MEMORY[0x1E4F143A8];
  v93[1] = 3221225472;
  v93[2] = __32__EKEventDetailTitleCell_update__block_invoke_229;
  v93[3] = &unk_1E608A200;
  id v70 = v59;
  id v94 = v70;
  [(NSMutableArray *)dateTimeViews enumerateObjectsUsingBlock:v93];
  recurrenceView = self->_recurrenceView;
  v72 = [(id)objc_opt_class() _locationFont];
  [(UILabel *)recurrenceView setFont:v72];

  v73 = self->_recurrenceView;
  v74 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(UILabel *)v73 setTextColor:v74];

  statusView = self->_statusView;
  v76 = [(id)objc_opt_class() _locationFont];
  [(UILabel *)statusView setFont:v76];

  v77 = self->_statusView;
  if (v92 == EKEventStatusCanceled) {
    [MEMORY[0x1E4FB1618] labelColor];
  }
  else {
  v78 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  }
  [(UILabel *)v77 setTextColor:v78];

  [(UILabel *)self->_travelTimeView setLineBreakMode:0];
  v79 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v79 pointSize];
  double v81 = v80;

  if (v81 >= 18.5)
  {
    [(UILabel *)self->_recurrenceView setLineBreakMode:0];
    [(UILabel *)self->_statusView setLineBreakMode:0];
    uint64_t v82 = 0;
  }
  else
  {
    uint64_t v82 = 1;
  }
  [(UILabel *)self->_statusView setNumberOfLines:v82];

  return 1;
}

void __32__EKEventDetailTitleCell_update__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 participantType] == 2)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = *(id *)(*(void *)(a1 + 32) + 1120);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
LABEL_4:
      uint64_t v8 = 0;
      while (1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v8), "locationTitle", (void)v13);
        v10 = [v3 name];
        char v11 = [v9 isEqualToString:v10];

        if (v11) {
          break;
        }
        if (v6 == ++v8)
        {
          uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
          if (v6) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:

      uint64_t v12 = *(void **)(a1 + 32);
      id v4 = [v3 name];
      [v12 addLocation:v4];
    }
  }
}

void __32__EKEventDetailTitleCell_update__block_invoke_229(uint64_t a1, void *a2)
{
  id v8 = a2;
  [v8 setFont:*(void *)(a1 + 32)];
  id v3 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v8 setTextColor:v3];

  id v4 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v4 pointSize];
  double v6 = v5;

  if (v6 >= 18.5)
  {
    [v8 setLineBreakMode:0];
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 1;
  }
  [v8 setNumberOfLines:v7];
}

- (BOOL)_shouldShowConferenceCell
{
  id v3 = [(EKEventDetailTitleCell *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    double v5 = [(EKEventDetailTitleCell *)self delegate];
    char v6 = [v5 showsDetectedConferenceItem];
  }
  else
  {
    char v6 = 0;
  }
  uint64_t v7 = [(EKEvent *)self->super._event virtualConference];
  if (v7)
  {
    BOOL v8 = 1;
  }
  else
  {
    uint64_t v9 = [(EKEvent *)self->super._event conferenceURLForDisplay];
    if (v9) {
      BOOL v8 = v6;
    }
    else {
      BOOL v8 = 0;
    }
  }
  return v8;
}

- (void)editButtonTapped
{
  id v3 = [(EKEventDetailTitleCell *)self delegate];

  if (v3)
  {
    id v4 = [(EKEventDetailTitleCell *)self delegate];
    [v4 editButtonPressed];
  }
}

- (void)nextButtonTapped
{
  id v3 = [(EKEventDetailTitleCell *)self delegate];

  if (v3)
  {
    id v4 = [(EKEventDetailTitleCell *)self delegate];
    [v4 nextButtonPressed];
  }
}

- (void)previousButtonTapped
{
  id v3 = [(EKEventDetailTitleCell *)self delegate];

  if (v3)
  {
    id v4 = [(EKEventDetailTitleCell *)self delegate];
    [v4 previousButtonPressed];
  }
}

- (void)showRecurrenceDiff:(id)a3
{
  id v4 = a3;
  double v5 = [EKUIRecurrenceDifferenceViewController alloc];
  char v6 = [(EKEventDetailCell *)self event];
  v10 = [(EKUIRecurrenceDifferenceViewController *)v5 initWithEvent:v6 andSummary:v4];

  uint64_t v7 = [(EKEventDetailTitleCell *)self delegate];
  BOOL v8 = [v7 owningViewController];
  uint64_t v9 = [v8 navigationController];
  [v9 pushViewController:v10 animated:1];
}

- (void)setHideTopCellSeparator:(BOOL)a3
{
  if (self->_hideTopCellSeparator != a3)
  {
    self->_hideTopCellSeparator = a3;
    [(EKEventDetailTitleCell *)self _updateSeparatorStyle];
  }
}

- (void)setHideBottomCellSeparator:(BOOL)a3
{
  if (self->_hideBottomCellSeparator != a3)
  {
    self->_hideBottomCellSeparator = a3;
    [(EKEventDetailTitleCell *)self _updateSeparatorStyle];
  }
}

- (void)_updateSeparatorStyle
{
  if (self->_hideBottomCellSeparator || self->_hideTopCellSeparator)
  {
    [(EKEventDetailTitleCell *)self setSeparatorStyle:0];
    if (!self->_hideBottomCellSeparator || !self->_hideTopCellSeparator)
    {
      [(EKUITableViewCell *)self setDrawsOwnRowSeparators:1];
      if (self->_hideBottomCellSeparator) {
        uint64_t v3 = 1;
      }
      else {
        uint64_t v3 = 4;
      }
      [(EKUITableViewCell *)self setSeparatorEdges:v3];
      return;
    }
  }
  else
  {
    [(EKEventDetailTitleCell *)self setSeparatorStyle:1];
  }

  [(EKUITableViewCell *)self setDrawsOwnRowSeparators:0];
}

- (id)_titleView
{
  titleView = self->_titleView;
  if (!titleView)
  {
    id v4 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
    double v5 = self->_titleView;
    self->_titleView = v4;

    [(UILabel *)self->_titleView setLineBreakMode:0];
    [(UILabel *)self->_titleView setNumberOfLines:[(EKEventDetailTitleCell *)self numberOfTitleLines]];
    [(UILabel *)self->_titleView setLineBreakMode:4];
    char v6 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)self->_titleView setBackgroundColor:v6];

    titleView = self->_titleView;
  }

  return titleView;
}

- (void)handleTapOnLabel:(id)a3
{
  if (!self->_showAllLocation)
  {
    id v4 = a3;
    id v30 = [v4 view];
    [v4 locationInView:v30];
    double v6 = v5;
    double v8 = v7;

    [v30 bounds];
    double v10 = v9;
    double v12 = v11;
    long long v13 = [v30 layoutManager];
    long long v14 = [v30 textContainer];
    [v13 usedRectForTextContainer:v14];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;

    v23 = [v30 layoutManager];
    uint64_t v24 = [v30 textContainer];
    unint64_t v25 = objc_msgSend(v23, "characterIndexForPoint:inTextContainer:fractionOfDistanceBetweenInsertionPoints:", v24, 0, v6 - -(v16 - (v10 - v20) * 0.5), v8 - -(v18 - (v12 - v22) * 0.5));

    NSUInteger location = self->_showLocationRange.location;
    BOOL v28 = v25 >= location;
    NSUInteger v27 = v25 - location;
    BOOL v28 = !v28 || v27 >= self->_showLocationRange.length;
    if (!v28)
    {
      self->_showAllLocation = 1;
      v29 = [(EKEventDetailTitleCell *)self delegate];
      [v29 refreshForHeightChange];
    }
  }
}

- (id)_dateTimeViewForLine:(unint64_t)a3
{
  if (a3 <= 3)
  {
    uint64_t v23 = v4;
    uint64_t v24 = v3;
    dateTimeViews = self->_dateTimeViews;
    if (!dateTimeViews)
    {
      double v18 = (NSMutableArray *)objc_opt_new();
      double v19 = self->_dateTimeViews;
      self->_dateTimeViews = v18;

      dateTimeViews = self->_dateTimeViews;
    }
    if ([(NSMutableArray *)dateTimeViews count] <= a3)
    {
      do
      {
        double v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
        double v21 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
        [v20 setTextColor:v21];

        double v22 = [MEMORY[0x1E4FB1618] clearColor];
        [v20 setBackgroundColor:v22];

        [(NSMutableArray *)self->_dateTimeViews addObject:v20];
      }
      while ([(NSMutableArray *)self->_dateTimeViews count] <= a3);
    }
    long long v13 = [(NSMutableArray *)self->_dateTimeViews objectAtIndexedSubscript:a3];
  }
  else
  {
    long long v13 = 0;
  }
  return v13;
}

- (id)_travelTimeView
{
  travelTimeView = self->_travelTimeView;
  if (!travelTimeView)
  {
    uint64_t v4 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
    uint64_t v5 = self->_travelTimeView;
    self->_travelTimeView = v4;

    uint64_t v6 = self->_travelTimeView;
    uint64_t v7 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v6 setTextColor:v7];

    uint64_t v8 = self->_travelTimeView;
    uint64_t v9 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)v8 setBackgroundColor:v9];

    [(UILabel *)self->_travelTimeView setNumberOfLines:0];
    travelTimeView = self->_travelTimeView;
  }

  return travelTimeView;
}

- (id)_recurrenceView
{
  recurrenceView = self->_recurrenceView;
  if (!recurrenceView)
  {
    uint64_t v4 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
    uint64_t v5 = self->_recurrenceView;
    self->_recurrenceView = v4;

    uint64_t v6 = self->_recurrenceView;
    uint64_t v7 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v6 setTextColor:v7];

    uint64_t v8 = self->_recurrenceView;
    uint64_t v9 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)v8 setBackgroundColor:v9];

    [(UILabel *)self->_recurrenceView setNumberOfLines:0];
    recurrenceView = self->_recurrenceView;
  }

  return recurrenceView;
}

- (id)_recurrenceButton
{
  v51[3] = *MEMORY[0x1E4F143B8];
  if (!self->_recurrenceButton)
  {
    uint64_t v3 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
    [v3 setTitleLineBreakMode:4];
    [v3 setTitleLineBreakMode:0];
    [v3 setTitleTextAttributesTransformer:&__block_literal_global_238];
    objc_msgSend(v3, "setContentInsets:", 0.0, 0.0, 0.0, 0.0);
    uint64_t v4 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v3 primaryAction:0];
    recurrenceButton = self->_recurrenceButton;
    self->_recurrenceButton = v4;

    [(UILabel *)self->_recurrenceView frame];
    -[UIButton setFrame:](self->_recurrenceButton, "setFrame:");
  }
  objc_initWeak(&location, self);
  uint64_t v6 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v7 = EventKitUIBundle();
  uint64_t v8 = [v7 localizedStringForKey:@"Go to Next Occurrence" value:&stru_1F0CC2140 table:0];
  uint64_t v9 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrow.forward.circle"];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __43__EKEventDetailTitleCell__recurrenceButton__block_invoke_2;
  v47[3] = &unk_1E6088B78;
  objc_copyWeak(&v48, &location);
  uint64_t v10 = [v6 actionWithTitle:v8 image:v9 identifier:0 handler:v47];

  uint64_t v11 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v12 = EventKitUIBundle();
  long long v13 = [(id)v12 localizedStringForKey:@"Go to Previous Occurrence" value:&stru_1F0CC2140 table:0];
  long long v14 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrow.backward.circle"];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __43__EKEventDetailTitleCell__recurrenceButton__block_invoke_3;
  v45[3] = &unk_1E6088B78;
  objc_copyWeak(&v46, &location);
  double v15 = [v11 actionWithTitle:v13 image:v14 identifier:0 handler:v45];

  double v16 = [(EKEventDetailTitleCell *)self delegate];
  LOBYTE(v12) = [v16 shouldShowNextButton];

  if ((v12 & 1) == 0) {
    [v10 setAttributes:1];
  }
  double v17 = [(EKEventDetailTitleCell *)self delegate];
  char v18 = [v17 shouldShowPreviousButton];

  if ((v18 & 1) == 0) {
    [v15 setAttributes:1];
  }
  double v19 = [(EKEventDetailCell *)self event];
  int v20 = [v19 isDetached];

  unint64_t v21 = 0x1E4FB1000;
  unint64_t v22 = 0x1E4F1C000;
  if (v20)
  {
    uint64_t v23 = (void *)MEMORY[0x1E4F25590];
    uint64_t v24 = [(EKEventDetailCell *)self event];
    unint64_t v25 = [v24 originalItem];
    v26 = [(EKEventDetailCell *)self event];
    NSUInteger v27 = [v23 diffSummaryBetweenObject:v25 andObject:v26];

    if (+[EKUIRecurrenceDifferenceViewController shouldShowRecurrenceDiff:v27])
    {
      BOOL v28 = (void *)MEMORY[0x1E4FB13F0];
      v29 = EventKitUIBundle();
      id v30 = [v29 localizedStringForKey:@"Show Event Changes" value:&stru_1F0CC2140 table:0];
      v31 = [MEMORY[0x1E4FB1818] systemImageNamed:@"slider.horizontal.2.gobackward"];
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __43__EKEventDetailTitleCell__recurrenceButton__block_invoke_4;
      v42[3] = &unk_1E6088218;
      v41 = &v44;
      objc_copyWeak(&v44, &location);
      id v43 = v27;
      v32 = [v28 actionWithTitle:v30 image:v31 identifier:0 handler:v42];

      v33 = (void *)MEMORY[0x1E4FB1970];
      v51[0] = v10;
      v51[1] = v15;
      v51[2] = v32;
      v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:3];
      id v35 = [v33 menuWithChildren:v34];
      [(UIButton *)self->_recurrenceButton setMenu:v35];

      objc_destroyWeak(&v44);
    }

    unint64_t v22 = 0x1E4F1C000uLL;
    unint64_t v21 = 0x1E4FB1000uLL;
  }
  id v36 = *(void **)(v21 + 2416);
  v50[0] = v10;
  v50[1] = v15;
  id v37 = objc_msgSend(*(id *)(v22 + 2424), "arrayWithObjects:count:", v50, 2, v41);
  id v38 = [v36 menuWithChildren:v37];
  [(UIButton *)self->_recurrenceButton setMenu:v38];

  [(UIButton *)self->_recurrenceButton setShowsMenuAsPrimaryAction:1];
  double v39 = self->_recurrenceButton;

  objc_destroyWeak(&v46);
  objc_destroyWeak(&v48);
  objc_destroyWeak(&location);

  return v39;
}

id __43__EKEventDetailTitleCell__recurrenceButton__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)[a2 mutableCopy];
  uint64_t v3 = CalendarAppTintColor();
  [v2 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4FB0700]];

  uint64_t v4 = +[EKEventDetailTitleCell _locationFont];
  [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4FB06F8]];

  return v2;
}

void __43__EKEventDetailTitleCell__recurrenceButton__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained nextButtonTapped];
}

void __43__EKEventDetailTitleCell__recurrenceButton__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained previousButtonTapped];
}

void __43__EKEventDetailTitleCell__recurrenceButton__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained showRecurrenceDiff:*(void *)(a1 + 32)];
}

- (id)_statusView
{
  statusView = self->_statusView;
  if (!statusView)
  {
    uint64_t v4 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
    uint64_t v5 = self->_statusView;
    self->_statusView = v4;

    uint64_t v6 = self->_statusView;
    uint64_t v7 = [MEMORY[0x1E4FB1618] colorWithRed:0.917647059 green:0.0 blue:0.0 alpha:1.0];
    [(UILabel *)v6 setTextColor:v7];

    uint64_t v8 = self->_statusView;
    uint64_t v9 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)v8 setBackgroundColor:v9];

    statusView = self->_statusView;
  }

  return statusView;
}

- (id)_editButton
{
  editButton = self->_editButton;
  if (!editButton)
  {
    uint64_t v4 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
    uint64_t v5 = self->_editButton;
    self->_editButton = v4;

    uint64_t v6 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    uint64_t v7 = [(UIButton *)self->_editButton titleLabel];
    [v7 setFont:v6];

    uint64_t v8 = self->_editButton;
    uint64_t v9 = EventKitUIBundle();
    uint64_t v10 = [v9 localizedStringForKey:@"Edit" value:&stru_1F0CC2140 table:0];
    [(UIButton *)v8 setTitle:v10 forState:0];

    [(UIButton *)self->_editButton addTarget:self action:sel_editButtonTapped forControlEvents:64];
    editButton = self->_editButton;
  }

  return editButton;
}

- (id)_suggestedLocationCell
{
  suggestedLocationCell = self->_suggestedLocationCell;
  if (!suggestedLocationCell)
  {
    uint64_t v4 = [[EKEventDetailSuggestedLocationCell alloc] initWithInlineStyle:0];
    uint64_t v5 = self->_suggestedLocationCell;
    self->_suggestedLocationCell = v4;

    [(EKEventDetailSuggestedLocationCell *)self->_suggestedLocationCell setDelegate:self];
    suggestedLocationCell = self->_suggestedLocationCell;
  }

  return suggestedLocationCell;
}

- (id)_conferenceDetailView
{
  conferenceDetailView = self->_conferenceDetailView;
  if (!conferenceDetailView)
  {
    uint64_t v4 = [[EKEventDetailConferenceCell alloc] initWithEvent:self->super._event editable:0];
    uint64_t v5 = self->_conferenceDetailView;
    self->_conferenceDetailView = v4;

    [(EKEventDetailConferenceCell *)self->_conferenceDetailView setDelegate:self];
    conferenceDetailView = self->_conferenceDetailView;
  }

  return conferenceDetailView;
}

- (double)titleHeight
{
  [(UILabel *)self->_titleView frame];

  return CGRectGetMaxY(*(CGRect *)&v2);
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)EKEventDetailTitleCell;
  [(EKUITableViewCell *)&v4 layoutSubviews];
  [(EKEventDetailTitleCell *)self bounds];
  [(EKEventDetailTitleCell *)self _layoutForWidth:v3];
}

- (double)_layoutForWidth:(double)a3
{
  uint64_t v299 = *MEMORY[0x1E4F143B8];
  unsigned int v252 = [MEMORY[0x1E4FB1EB0] areAnimationsEnabled];
  [MEMORY[0x1E4FB1EB0] setAnimationsEnabled:0];
  v272 = self;
  objc_super v4 = [(EKEventDetailTitleCell *)self delegate];

  if (v4)
  {
    uint64_t v5 = [(EKEventDetailTitleCell *)self delegate];
    LODWORD(v4) = [v5 shouldShowEditButtonInline];

    uint64_t v6 = [(EKEventDetailTitleCell *)v272 delegate];
    if ([v6 shouldShowNextButton])
    {
      int v250 = 1;
    }
    else
    {
      uint64_t v8 = [(EKEventDetailTitleCell *)v272 delegate];
      int v250 = [v8 shouldShowPreviousButton];
    }
    uint64_t v7 = v272;
  }
  else
  {
    int v250 = 0;
    uint64_t v7 = self;
  }
  [(EKEventDetailTitleCell *)v7 layoutMargins];
  double v270 = v9;
  [(EKEventDetailTitleCell *)v7 layoutMargins];
  double v268 = v10;
  [(EKEventDetailTitleCell *)v7 safeAreaInsets];
  double v267 = v11;
  [(EKEventDetailTitleCell *)v7 safeAreaInsets];
  double v266 = v12;
  if ([(EKEventDetailTitleCell *)v7 nonInteractivePlatterMode]
    && (CUIKCurrentLocaleRequiresIndianLanguageAdjustments() & 1) != 0)
  {
    v254 = [(id)objc_opt_class() _scaledTitleFont];
    int v13 = 1;
  }
  else
  {
    v254 = [(id)objc_opt_class() _titleFont];
    int v13 = 0;
  }
  uint64_t v289 = 0;
  v290 = (double *)&v289;
  uint64_t v291 = 0x3010000000;
  double v294 = 0.0;
  v292 = "";
  uint64_t v293 = 0;
  [(EKEventDetailCell *)v272 detailsLeftInset];
  uint64_t v15 = v14;
  [v254 _scaledValueForValue:30.0];
  double v17 = v16;
  [(UILabel *)v272->_titleView _firstBaselineOffsetFromTop];
  uint64_t v293 = v15;
  double v294 = v17 - v18;
  uint64_t v19 = *((void *)v290 + 5);
  uint64_t v285 = 0;
  v286 = (double *)&v285;
  uint64_t v287 = 0x2020000000;
  uint64_t v288 = v19;
  if (!v4)
  {
    [(UIButton *)v272->_editButton removeFromSuperview];
    goto LABEL_29;
  }
  int v20 = [(EKEventDetailTitleCell *)v272 _editButton];
  [v20 sizeToFit];

  [(UIButton *)v272->_editButton layoutIfNeeded];
  [(UIButton *)v272->_editButton frame];
  double rect = v21;
  double v23 = v22;
  double v24 = v290[4];
  double v25 = v290[5];
  v26 = [(UIButton *)v272->_editButton titleLabel];
  [v26 frame];
  double v28 = v27;
  v29 = [(UIButton *)v272->_editButton titleLabel];
  [v29 frame];
  double v31 = v30;

  v32 = [(EKEventDetailTitleCell *)v272 traitCollection];
  if (!EKUIUsesLargeTextLayout(v32))
  {

    goto LABEL_17;
  }
  char IsLeftToRight = CalInterfaceIsLeftToRight();

  if ((IsLeftToRight & 1) == 0)
  {
LABEL_17:
    [(EKEventDetailTitleCell *)v272 layoutMargins];
    double v24 = v23 - v28 - v31 + a3 - v34 - v23;
  }
  if (v272->_visibleItems)
  {
    id v35 = [(EKEventDetailTitleCell *)v272 traitCollection];
    BOOL v36 = EKUIUsesLargeTextLayout(v35);

    if (!v36)
    {
      id v37 = [(UILabel *)v272->_titleView font];
      id v38 = [(UIButton *)v272->_editButton titleLabel];
      double v39 = [v38 font];

      [v37 ascender];
      double v41 = v40;
      [v37 capHeight];
      double v43 = v42;
      [v39 ascender];
      double v45 = v44;
      [v37 capHeight];
      double v47 = v46;
      id v48 = [(UIButton *)v272->_editButton titleLabel];
      [v48 frame];
      double v50 = v49;

      CalRoundToScreenScale(v41 + v43 - (v45 + v47) - v50);
      double v52 = v51;

      double v25 = v25 + v52;
    }
  }
  if ((CalInterfaceIsLeftToRight() & 1) != 0
    || ([(EKEventDetailTitleCell *)v272 traitCollection],
        v53 = objc_claimAutoreleasedReturnValue(),
        BOOL v54 = EKUIUsesLargeTextLayout(v53),
        v53,
        v54))
  {
    if (CalInterfaceIsLeftToRight())
    {
      char v55 = [(EKEventDetailTitleCell *)v272 traitCollection];
      BOOL v56 = EKUIUsesLargeTextLayout(v55);

      if (v56)
      {
        [(EKEventDetailTitleCell *)v272 safeAreaInsets];
        double v24 = v24 + v57;
      }
    }
  }
  else
  {
    [(EKEventDetailTitleCell *)v272 layoutMargins];
    double v24 = v58;
  }
  v59 = [(EKEventDetailTitleCell *)v272 contentView];
  objc_msgSend(v59, "convertRect:fromView:", v272, v24, v25, v23, rect);
  -[UIButton setFrame:](v272->_editButton, "setFrame:");

  v60 = [(EKEventDetailTitleCell *)v272 contentView];
  [v60 addSubview:v272->_editButton];

  uint64_t v61 = [(EKEventDetailTitleCell *)v272 traitCollection];
  BOOL v62 = EKUIUsesLargeTextLayout(v61);

  if (v62)
  {
    v300.origin.double x = v24;
    v300.origin.double y = v25;
    v300.size.double width = v23;
    v300.size.double height = rect;
    v290[5] = CGRectGetMaxY(v300);
  }
LABEL_29:
  double v63 = a3 - v270 - v268;
  double v257 = v267 + v266;
  titleView = v272->_titleView;
  if (v272->_visibleItems)
  {
    [(UILabel *)titleView frame];
    double v66 = v65;
    double v67 = v290[4];
    double v68 = v290[5];
    v69 = [(EKEventDetailTitleCell *)v272 traitCollection];
    BOOL v70 = EKUIUsesLargeTextLayout(v69);

    double v71 = a3 - v270 - v268;
    if (!v70)
    {
      [(UIButton *)v272->_editButton frame];
      double v71 = v63 - v72;
    }
    [(UILabel *)v272->_titleView setFrame:CalRoundRectToScreenScale(v67, v68, v71, v66)];
    [(UILabel *)v272->_titleView sizeToFit];
    if ((CalInterfaceIsLeftToRight() & 1) == 0)
    {
      [(UILabel *)v272->_titleView frame];
      [(UILabel *)v272->_titleView setFrame:a3 - v257 - v73 - v74];
    }
    [(UILabel *)v272->_titleView frame];
    double v76 = v75;
    v77 = [(EKEventDetailTitleCell *)v272 contentView];
    [v77 addSubview:v272->_titleView];

    [(UILabel *)v272->_titleView _lastLineBaseline];
    v286[3] = v76 + v78;
  }
  else
  {
    [(UILabel *)titleView removeFromSuperview];
  }
  if (CalInterfaceIsLeftToRight())
  {
    double v79 = EKUIScaleFactor();
    double v80 = -1.0;
  }
  else
  {
    double v79 = EKUIScaleFactor();
    double v80 = 1.0;
  }
  v290[4] = v80 / v79 + v290[4];
  unsigned int visibleItems = v272->_visibleItems;
  if (v13) {
    [(id)objc_opt_class() _scaledLocationFont];
  }
  else {
  v253 = [(id)objc_opt_class() _locationFont];
  }
  [v253 _scaledValueForValue:37.0];
  double v251 = v81;
  [v253 _scaledValueForValue:22.0];
  double v256 = v82;
  if ((visibleItems & 2) != 0)
  {
    long long v283 = 0u;
    long long v284 = 0u;
    long long v281 = 0u;
    long long v282 = 0u;
    obuint64_t j = v272->_locationItems;
    uint64_t v88 = [(NSMutableArray *)obj countByEnumeratingWithState:&v281 objects:v298 count:16];
    if (v88)
    {
      uint64_t v259 = *MEMORY[0x1E4FB0700];
      uint64_t v269 = *(void *)v282;
      do
      {
        uint64_t v271 = v88;
        for (uint64_t i = 0; i != v271; ++i)
        {
          if (*(void *)v282 != v269) {
            objc_enumerationMutation(obj);
          }
          v90 = *(void **)(*((void *)&v281 + 1) + 8 * i);
          v91 = [v90 locationView];
          [v91 frame];
          double v93 = v92;
          double v95 = v94;
          [v90 updateAttributedString];
          objc_msgSend(v91, "setFrame:", v93, v95, v63, 0.0);
          [v91 sizeToFit];
          long long v96 = [v91 font];
          [v96 _scaledValueForValue:22.0];
          double v98 = v97;

          [v91 frame];
          if (v99 > v98 * 8.0 && !v272->_showAllLocation)
          {
            [v91 frame];
            double v101 = v100;
            [v91 frame];
            [v91 setFrame:v101];
            uint64_t v296 = v259;
            id v102 = [MEMORY[0x1E4FB1618] labelColor];
            v297 = v102;
            v103 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v297 forKeys:&v296 count:1];
            [v91 setLinkTextAttributes:v103];

            long long v104 = [v91 layoutManager];
            long long v105 = [v91 textContainer];
            uint64_t v106 = [v104 glyphRangeForTextContainer:v105];
            uint64_t v108 = v107;

            long long v109 = [v91 attributedText];
            recta = [v109 attributesAtIndex:0 effectiveRange:0];

            id v110 = objc_alloc(MEMORY[0x1E4F28E48]);
            long long v111 = [NSString ellipsisString];
            v112 = (void *)[v110 initWithString:v111 attributes:recta];

            v113 = EventKitUIBundle();
            v262 = [v113 localizedStringForKey:@"ShowMoreLocation" value:@"   Show More" table:0];

            v263 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:recta];
            uint64_t v114 = CalendarAppTintColor();
            [v263 setObject:v114 forKeyedSubscript:v259];

            v115 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v262 attributes:v263];
            [v112 appendAttributedString:v115];

            id v116 = objc_alloc(MEMORY[0x1E4FB0880]);
            uint64_t v117 = [v91 textContainer];
            [v117 size];
            v118 = objc_msgSend(v116, "initWithSize:");

            v261 = (void *)[objc_alloc(MEMORY[0x1E4FB08B8]) initWithAttributedString:v112];
            v119 = objc_opt_new();
            [v119 addTextContainer:v118];
            [v261 addLayoutManager:v119];
            uint64_t v120 = v106;
            objc_msgSend(v119, "boundingRectForGlyphRange:inTextContainer:", 0, objc_msgSend(v112, "length"), v118);
            double v122 = v121;
            v123 = [v91 layoutManager];
            v124 = [v91 textContainer];
            objc_msgSend(v123, "boundingRectForGlyphRange:inTextContainer:", v108 + v120 - 1, 1, v124);
            double v126 = v125;

            v127 = [v91 textContainer];
            [v127 size];
            double v129 = v128;

            v130 = [v91 layoutManager];
            v131 = [v91 textContainer];
            uint64_t v132 = objc_msgSend(v130, "glyphIndexForPoint:inTextContainer:", v131, v129 - v122, v126);

            v133 = [v91 layoutManager];
            uint64_t v134 = [v133 characterIndexForGlyphAtIndex:v132];

            v135 = [v91 textStorage];
            v136 = [v135 string];
            uint64_t v137 = [v136 length];
            v272->_showLocationRange.id location = v134 - 1;
            v272->_showLocationRange.length = v137 - (v134 - 1);

            v138 = [v91 textStorage];
            objc_msgSend(v138, "replaceCharactersInRange:withAttributedString:", v272->_showLocationRange.location, v272->_showLocationRange.length, v112);

            v139 = [v90 tapRecognizer];
            BOOL v140 = v139 == 0;

            if (v140)
            {
              v141 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v272 action:sel_handleTapOnLabel_];
              [v91 addGestureRecognizer:v141];
            }
          }
          [v91 frame];
          double v143 = v142;
          double v145 = v144;
          double v146 = v286[3];
          v147 = [v91 font];
          [v147 _scaledValueForValue:23.0];
          double v149 = v148;
          v150 = [v91 font];
          [v150 ascender];
          v290[5] = v146 + v149 - v151 + -4.0;

          double v152 = v290[4];
          double v153 = v290[5];
          int v154 = CalInterfaceIsLeftToRight();
          double v155 = a3 - v257 - v143 - v152;
          if (v154) {
            double v155 = v152;
          }
          objc_msgSend(v91, "setFrame:", CalRoundRectToScreenScale(v155, v153, v143, v145));
          v156 = [(EKEventDetailTitleCell *)v272 contentView];
          [v156 addSubview:v91];

          v301.origin.double x = v152;
          v301.origin.double y = v153;
          v301.size.double width = v143;
          v301.size.double height = v145;
          double MaxY = CGRectGetMaxY(v301);
          v158 = [v91 font];
          [v158 descender];
          v286[3] = MaxY + v159 + -8.0;

          v290[5] = v286[3];
        }
        uint64_t v88 = [(NSMutableArray *)obj countByEnumeratingWithState:&v281 objects:v298 count:16];
      }
      while (v88);
    }
  }
  else
  {
    long long v279 = 0u;
    long long v280 = 0u;
    long long v277 = 0u;
    long long v278 = 0u;
    v83 = v272->_locationItems;
    uint64_t v84 = [(NSMutableArray *)v83 countByEnumeratingWithState:&v277 objects:v295 count:16];
    if (v84)
    {
      uint64_t v85 = *(void *)v278;
      do
      {
        for (uint64_t j = 0; j != v84; ++j)
        {
          if (*(void *)v278 != v85) {
            objc_enumerationMutation(v83);
          }
          v87 = [*(id *)(*((void *)&v277 + 1) + 8 * j) locationView];
          [v87 removeFromSuperview];
        }
        uint64_t v84 = [(NSMutableArray *)v83 countByEnumeratingWithState:&v277 objects:v295 count:16];
      }
      while (v84);
    }

    v290[5] = v286[3];
  }
  p_isa = (id *)&v272->super.super.super.super.super.super.isa;
  if (CalInterfaceIsLeftToRight())
  {
    double v161 = EKUIScaleFactor();
    double v162 = -1.0;
  }
  else
  {
    double v161 = EKUIScaleFactor();
    double v162 = 1.0;
  }
  v163 = v290;
  v290[4] = v290[4] - v162 / v161;
  if ((visibleItems & 0x100) != 0)
  {
    if ((visibleItems & 2) != 0) {
      double v167 = v163[5] + 5.5;
    }
    else {
      double v167 = v163[5] + 5.5 + 8.0;
    }
    v163[5] = v167;
    v168 = [(EKEventDetailTitleCell *)v272 _suggestedLocationCell];
    LODWORD(v169) = 1148846080;
    LODWORD(v170) = 1112014848;
    objc_msgSend(v168, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3 - v257, 0.0, v169, v170);
    double v172 = v171;
    double v174 = v173;

    v302.origin.double x = CalRoundRectToScreenScale(0.0, v167, v172, v174);
    double x = v302.origin.x;
    double y = v302.origin.y;
    double width = v302.size.width;
    double height = v302.size.height;
    CGFloat v179 = CGRectGetMaxY(v302);
    v286[3] = v179;
    v290[5] = v179 + -8.0;
    -[EKEventDetailSuggestedLocationCell setFrame:](v272->_suggestedLocationCell, "setFrame:", x, y, width, height);
    v180 = [(EKEventDetailTitleCell *)v272 contentView];
    [v180 addSubview:v272->_suggestedLocationCell];

    p_isa = (id *)&v272->super.super.super.super.super.super.isa;
    if ((v272->_visibleItems & 0x200) != 0)
    {
      v165 = v290;
      double v164 = v290[5];
      double v166 = 23.5;
LABEL_80:
      double v183 = v164 + v166;
      v165[5] = v164 + v166;
      v184 = [p_isa _conferenceDetailView];
      LODWORD(v185) = 1148846080;
      LODWORD(v186) = 1112014848;
      objc_msgSend(v184, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3 - v257, 0.0, v185, v186);
      double v188 = v187;
      double v190 = v189;

      v303.origin.double x = CalRoundRectToScreenScale(0.0, v183, v188, v190);
      double v191 = v303.origin.x;
      double v192 = v303.origin.y;
      double v193 = v303.size.width;
      double v194 = v303.size.height;
      CGFloat v195 = CGRectGetMaxY(v303);
      v286[3] = v195;
      v290[5] = v195 + -8.0;
      -[EKEventDetailConferenceCell setFrame:](v272->_conferenceDetailView, "setFrame:", v191, v192, v193, v194);
      v196 = [(EKEventDetailTitleCell *)v272 contentView];
      [v196 addSubview:v272->_conferenceDetailView];

      v182 = v290;
      double v181 = v290[5];
      p_isa = (id *)&v272->super.super.super.super.super.super.isa;
      goto LABEL_81;
    }
  }
  else
  {
    [(EKEventDetailSuggestedLocationCell *)v272->_suggestedLocationCell removeFromSuperview];
    double v164 = v286[3];
    v165 = v290;
    v290[5] = v164;
    if ((v272->_visibleItems & 0x200) != 0)
    {
      if ((visibleItems & 2) != 0) {
        double v166 = 8.0;
      }
      else {
        double v166 = 13.5;
      }
      goto LABEL_80;
    }
  }
  [p_isa[145] removeFromSuperview];
  double v181 = v286[3];
  v182 = v290;
  v290[5] = v181;
LABEL_81:
  v182[5] = v251 + v181;
  v197 = [p_isa[135] startCalendarDate];
  v198 = [v197 dayComponents];

  v199 = [(EKEvent *)v272->super._event endCalendarDate];
  v200 = [v199 dayComponents];

  v201 = v272;
  uint64_t v202 = [v198 day];
  if (v202 == [v200 day] && (uint64_t v203 = objc_msgSend(v198, "month"), v203 == objc_msgSend(v200, "month")))
  {
    uint64_t v204 = [v198 year];
    BOOL v205 = v204 != [v200 year];
  }
  else
  {
    BOOL v205 = 1;
  }
  v275[0] = 0;
  v275[1] = v275;
  v275[2] = 0x2020000000;
  char v276 = 0;
  dateTimeViews = v272->_dateTimeViews;
  v273[0] = MEMORY[0x1E4F143A8];
  v273[1] = 3221225472;
  v273[2] = __42__EKEventDetailTitleCell__layoutForWidth___block_invoke;
  v273[3] = &unk_1E608A248;
  *(double *)&v273[8] = a3;
  v273[9] = 0;
  v273[4] = v272;
  v273[5] = v275;
  v273[6] = &v289;
  v273[7] = &v285;
  *(double *)&v273[10] = v63;
  *(double *)&v273[11] = v256;
  BOOL v274 = v205;
  [(NSMutableArray *)dateTimeViews enumerateObjectsUsingBlock:v273];
  if ((v272->_visibleItems & 0x20) != 0)
  {
    v207 = &OBJC_IVAR___EKEventDetailTitleCell__recurrenceButton;
    if (!v250) {
      v207 = &OBJC_IVAR___EKEventDetailTitleCell__recurrenceView;
    }
    id v208 = *(id *)((char *)&v272->super.super.super.super.super.super.isa + *v207);
    v209 = v272->_recurrenceView;
    [v208 frame];
    objc_msgSend(v208, "sizeThatFits:", v63, 0.0);
    double v212 = v211;
    if (v63 >= v210) {
      double v213 = v210;
    }
    else {
      double v213 = v63;
    }
    [(UILabel *)v209 _firstLineBaseline];
    double v214 = v290[4];
    double v216 = v290[5] - v215;
    v290[5] = v216;
    [v208 sizeToFit];
    [(UILabel *)v272->_recurrenceView sizeToFit];
    if (CalInterfaceIsLeftToRight()) {
      double v217 = v214;
    }
    else {
      double v217 = a3 - v257 - v213 - v214;
    }
    objc_msgSend(v208, "setFrame:", CalRoundRectToScreenScale(v217, v216, v213, v212));
    [(UILabel *)v272->_recurrenceView setFrame:CalRoundRectToScreenScale(v217, v216, v213, v212)];
    double v218 = v290[5];
    [(UILabel *)v209 _lastLineBaseline];
    double v220 = v218 + v219;
    v286[3] = v220;
    v290[5] = v256 + v220;
    v221 = [(EKEventDetailTitleCell *)v272 contentView];
    [v221 addSubview:v208];

    v201 = v272;
  }
  else
  {
    [(UILabel *)v272->_recurrenceView removeFromSuperview];
    [(UIButton *)v272->_recurrenceButton removeFromSuperview];
  }
  travelTimeView = v201->_travelTimeView;
  if ((v201->_visibleItems & 0x10) != 0)
  {
    [(UILabel *)travelTimeView sizeToFit];
    [(UILabel *)v201->_travelTimeView frame];
    double v224 = v223;
    [(UILabel *)v201->_travelTimeView sizeToFit];
    [(UILabel *)v201->_travelTimeView _firstLineBaseline];
    double v225 = v290[4];
    double v227 = v290[5] - v226;
    v290[5] = v227;
    int v228 = CalInterfaceIsLeftToRight();
    double v229 = a3 - v257 - v63 - v225;
    if (v228) {
      double v229 = v225;
    }
    [(UILabel *)v201->_travelTimeView setFrame:CalRoundRectToScreenScale(v229, v227, v63, v224)];
    v230 = [(EKEventDetailTitleCell *)v201 contentView];
    [v230 addSubview:v201->_travelTimeView];

    double v231 = v290[5];
    v201 = v272;
    [(UILabel *)v272->_travelTimeView _lastLineBaseline];
    double v233 = v231 + v232;
    v286[3] = v233;
    v290[5] = v256 + v233;
  }
  else
  {
    [(UILabel *)travelTimeView removeFromSuperview];
  }
  statusView = v201->_statusView;
  if ((v201->_visibleItems & 0x40) != 0)
  {
    [(UILabel *)statusView frame];
    -[UILabel sizeThatFits:](v201->_statusView, "sizeThatFits:", v63, 0.0);
    double v236 = v235;
    double v238 = v237;
    [(UILabel *)v201->_statusView _firstLineBaseline];
    double v239 = v290[4];
    double v241 = v290[5] - v240;
    v290[5] = v241;
    [(UILabel *)v201->_statusView sizeToFit];
    int v242 = CalInterfaceIsLeftToRight();
    double v243 = a3 - v257 - v236 - v239;
    if (v242) {
      double v243 = v239;
    }
    [(UILabel *)v201->_statusView setFrame:CalRoundRectToScreenScale(v243, v241, v236, v238)];
    v244 = [(EKEventDetailTitleCell *)v201 contentView];
    [v244 addSubview:v201->_statusView];

    double v245 = v290[5];
    v201 = v272;
    [(UILabel *)v272->_statusView _lastLineBaseline];
    double v247 = v245 + v246;
    v286[3] = v247;
    v290[5] = v256 + v247;
  }
  else
  {
    [(UILabel *)statusView removeFromSuperview];
  }
  if (v201->_hideTopCellSeparator || v201->_hideBottomCellSeparator) {
    [(EKEventDetailTitleCell *)v201 _updateSeparatorStyle];
  }
  [MEMORY[0x1E4FB1EB0] setAnimationsEnabled:v252];
  double v248 = v286[3];
  _Block_object_dispose(v275, 8);

  _Block_object_dispose(&v285, 8);
  _Block_object_dispose(&v289, 8);

  return v248;
}

void __42__EKEventDetailTitleCell__layoutForWidth___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 text];
  uint64_t v7 = [v6 length];

  if (!v7)
  {
    [v5 removeFromSuperview];
    goto LABEL_24;
  }
  double v8 = *MEMORY[0x1E4F1DB28];
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v11 = *(double *)(a1 + 64);
  [*(id *)(a1 + 32) detailsLeftInset];
  double v13 = v11 - v12;
  [*(id *)(a1 + 32) detailsRightInset];
  objc_msgSend(v5, "setFrame:", v8, v9, v13 - v14 - *(double *)(a1 + 72), v10);
  [v5 sizeToFit];
  [v5 frame];
  double v16 = v15;
  double v18 = v17;
  if (!a3)
  {
    uint64_t v19 = 0;
    goto LABEL_14;
  }
  uint64_t v19 = [*(id *)(a1 + 32) _dateTimeViewForLine:a3 - 1];
  int v20 = [*(id *)(a1 + 32) window];
  if (v20)
  {
  }
  else if ((EKUIHasFallbackSizingContext() & 1) == 0)
  {
    double v25 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)double v42 = 0;
      _os_log_impl(&dword_1B3F4C000, v25, OS_LOG_TYPE_DEBUG, "Unable to determine size class for event detail title cell", v42, 2u);
    }
    goto LABEL_14;
  }
  IsRegularInViewHierarchdouble y = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(*(void **)(a1 + 32));
  if ((a3 & 1) == 0
    || !IsRegularInViewHierarchy
    || ([v19 bounds], v16 + CGRectGetWidth(v43) >= *(double *)(a1 + 80)))
  {
LABEL_14:
    v26 = [v5 font];
    [v26 ascender];
    *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 40)
                                                                - v27;

    uint64_t v28 = *(void *)(*(void *)(a1 + 48) + 8);
    double v22 = *(double *)(v28 + 32);
    double v24 = *(double *)(v28 + 40);
    v44.origin.double x = v22;
    v44.origin.double y = v24;
    v44.size.double width = v16;
    v44.size.double height = v18;
    double MaxY = CGRectGetMaxY(v44);
    double v30 = [v5 font];
    [v30 descender];
    *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = MaxY + v31;

    *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = *(double *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                            + 24)
                                                                + *(double *)(a1 + 88);
    goto LABEL_15;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  double v22 = *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 32);
  [v19 frame];
  double v24 = v23;
LABEL_15:
  if (CalInterfaceIsLeftToRight() && *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)
    || (CalInterfaceIsLeftToRight() & 1) == 0 && !*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    double v32 = *(double *)(a1 + 64);
    [*(id *)(a1 + 32) layoutMargins];
    double v34 = v32 - v33 - v16;
    id v35 = [*(id *)(a1 + 32) contentView];
    objc_msgSend(v35, "convertRect:fromView:", *(void *)(a1 + 32), v34, v24, v16, v18);
    double v22 = v36;
    double v24 = v37;
    double v16 = v38;
    double v18 = v39;
  }
  uint64_t v40 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v40 + 24) && *(unsigned char *)(a1 + 96)) {
    *(unsigned char *)(v40 + 24) = 0;
  }
  objc_msgSend(v5, "setFrame:", v22, v24, v16, v18);
  double v41 = [*(id *)(a1 + 32) contentView];
  [v41 addSubview:v5];

LABEL_24:
}

- (void)layoutForWidth:(double)a3 position:(int)a4
{
  v18.receiver = self;
  v18.super_class = (Class)EKEventDetailTitleCell;
  -[EKEventDetailCell layoutForWidth:position:](&v18, sel_layoutForWidth_position_);
  self->_lastPosition = a4;
  [(EKEventDetailTitleCell *)self _layoutForWidth:a3];
  double v8 = v7;
  [(EKEventDetailTitleCell *)self frame];
  double v10 = v9;
  double v12 = v11;
  double v13 = 0.0;
  double v14 = 0.0;
  if (a4)
  {
    [(id)objc_opt_class() detailsTopVerticalInset];
    double v14 = v15;
  }
  if ((a4 & 4) != 0)
  {
    [(id)objc_opt_class() detailsBottomVerticalInset];
    double v13 = v16;
  }
  CalRoundToScreenScale(v8 + v14 + v13);
  -[EKEventDetailTitleCell setFrame:](self, "setFrame:", v10, v12, a3, v17);
}

- (void)_promptForSpanWithSourceView:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(EKEvent *)self->super._event isOrWasPartOfRecurringSeries])
  {
    double v8 = [(EKEventDetailTitleCell *)self window];
    double v9 = [v8 rootViewController];

    double v10 = [v9 presentedViewController];

    if (v10)
    {
      do
      {
        double v11 = [v9 presentedViewController];

        double v12 = [v11 presentedViewController];

        double v9 = v11;
      }
      while (v12);
    }
    else
    {
      double v11 = v9;
    }
    uint64_t v36 = 0;
    double v37 = &v36;
    uint64_t v38 = 0x3032000000;
    double v39 = __Block_byref_object_copy__16;
    uint64_t v40 = __Block_byref_object_dispose__16;
    id v41 = 0;
    [v6 bannerPopoverSourceRect];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v21 = [v6 bannerView];
    objc_msgSend(v6, "convertRect:fromView:", v21, v14, v16, v18, v20);
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    event = self->super._event;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __71__EKEventDetailTitleCell__promptForSpanWithSourceView_completionBlock___block_invoke;
    v33[3] = &unk_1E608A270;
    id v34 = v7;
    id v35 = &v36;
    uint64_t v31 = +[EKUIRecurrenceAlertController presentDetachAlertWithOptions:viewController:sourceView:sourceRect:forEvent:withCompletionHandler:](EKUIRecurrenceAlertController, "presentDetachAlertWithOptions:viewController:sourceView:sourceRect:forEvent:withCompletionHandler:", 0, v11, v6, event, v33, v23, v25, v27, v29);
    double v32 = (void *)v37[5];
    v37[5] = v31;

    _Block_object_dispose(&v36, 8);
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __71__EKEventDetailTitleCell__promptForSpanWithSourceView_completionBlock___block_invoke(uint64_t a1, unint64_t a2)
{
  if (a2 <= 2) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  objc_super v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

- (void)didTapAddSuggestedLocationCell:(id)a3 disambiguatedLocation:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79__EKEventDetailTitleCell_didTapAddSuggestedLocationCell_disambiguatedLocation___block_invoke;
  v8[3] = &unk_1E608A298;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(EKEventDetailTitleCell *)self _promptForSpanWithSourceView:a3 completionBlock:v8];
}

void __79__EKEventDetailTitleCell_didTapAddSuggestedLocationCell_disambiguatedLocation___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  objc_super v4 = [MEMORY[0x1E4F1CA48] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = *(id *)(*(void *)(a1 + 32) + 1120);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v9), "locationTitle", (void)v19);
        [v4 addObject:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }

  double v11 = [*(id *)(a1 + 40) title];
  double v12 = [*(id *)(a1 + 40) address];
  char v13 = [v11 isEqualToString:v12];

  if ((v13 & 1) == 0)
  {
    double v14 = [*(id *)(a1 + 40) title];
    [v4 addObject:v14];
  }
  double v15 = objc_msgSend(MEMORY[0x1E4F25538], "_locationStringForLocations:", v4, (void)v19);
  [*(id *)(a1 + 40) setTitle:v15];

  double v16 = (void *)MEMORY[0x1E4F25638];
  double v17 = [*(id *)(*(void *)(a1 + 32) + 1080) preferredLocation];
  double v18 = [v17 predictedLOI];
  [v16 userInteractionWithPredictedLocationOfInterest:v18 interaction:7];

  [*(id *)(*(void *)(a1 + 32) + 1080) confirmPredictedLocation:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _saveEventWithSpan:a2];
}

- (void)didTapDismissSuggestedLocationCell:(id)a3
{
  objc_super v4 = (void *)MEMORY[0x1E4F25638];
  id v5 = [(EKEvent *)self->super._event preferredLocation];
  uint64_t v6 = [v5 predictedLOI];
  [v4 userInteractionWithPredictedLocationOfInterest:v6 interaction:8];

  [(EKEvent *)self->super._event rejectPredictedLocation];

  [(EKEventDetailTitleCell *)self _saveEventWithSpan:4];
}

- (void)_saveEventWithSpan:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = [(UIResponder *)self EKUI_editor];
  event = self->super._event;
  id v14 = 0;
  char v7 = [v5 saveEvent:event span:a3 error:&v14];
  id v8 = v14;
  if ((v7 & 1) == 0)
  {
    uint64_t v9 = (void *)kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      double v10 = self->super._event;
      double v11 = v9;
      double v12 = [(EKEvent *)v10 title];
      *(_DWORD *)buf = 138412546;
      double v16 = v12;
      __int16 v17 = 2112;
      id v18 = v8;
      _os_log_impl(&dword_1B3F4C000, v11, OS_LOG_TYPE_ERROR, "Error saving event %@ from the buttons detail item: %@", buf, 0x16u);
    }
  }
  char v13 = [(EKEventDetailTitleCell *)self delegate];
  [v13 predictionWasActedOn];
}

- (id)owningViewController
{
  uint64_t v2 = [(EKEventDetailTitleCell *)self delegate];
  uint64_t v3 = [v2 owningViewController];

  return v3;
}

- (void)conferenceCellUpdated:(id)a3
{
  id v3 = [(EKEventDetailTitleCell *)self delegate];
  [v3 refreshForHeightChange];
}

- (BOOL)conferenceCellShouldPresentShareSheet:(id)a3
{
  id v3 = self;
  objc_super v4 = [(EKEventDetailTitleCell *)self delegate];
  LOBYTE(v3) = [v4 titleCellShouldPresentShareSheet:v3];

  return (char)v3;
}

- (void)conferenceCell:(id)a3 requestPresentShareSheetWithActivityItems:(id)a4 withPopoverSourceView:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(EKEventDetailTitleCell *)self delegate];
  [v9 titleCell:self requestPresentShareSheetWithActivityItems:v8 withPopoverSourceView:v7];
}

- (EKEventDetailTitleCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EKEventDetailTitleCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)hasMapItemLaunchOptionFromTimeToLeaveNotification
{
  return self->_hasMapItemLaunchOptionFromTimeToLeaveNotification;
}

- (void)setHasMapItemLaunchOptionFromTimeToLeaveNotification:(BOOL)a3
{
  self->_hasMapItemLaunchOptionFromTimeToLeaveNotification = a3;
}

- (BOOL)showingInlineDayView
{
  return self->_showingInlineDayView;
}

- (void)setShowingInlineDayView:(BOOL)a3
{
  self->_showingInlineDayView = a3;
}

- (unint64_t)numberOfTitleLines
{
  return self->_numberOfTitleLines;
}

- (BOOL)nonInteractivePlatterMode
{
  return self->_nonInteractivePlatterMode;
}

- (void)setNonInteractivePlatterMode:(BOOL)a3
{
  self->_nonInteractivePlatterMode = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_recurrenceButton, 0);
  objc_storeStrong((id *)&self->_editButton, 0);
  objc_storeStrong((id *)&self->_statusView, 0);
  objc_storeStrong((id *)&self->_recurrenceView, 0);
  objc_storeStrong((id *)&self->_dateTimeViews, 0);
  objc_storeStrong((id *)&self->_travelTimeView, 0);
  objc_storeStrong((id *)&self->_conferenceDetailView, 0);
  objc_storeStrong((id *)&self->_suggestedLocationCell, 0);
  objc_storeStrong((id *)&self->_locationItems, 0);

  objc_storeStrong((id *)&self->_titleView, 0);
}

@end