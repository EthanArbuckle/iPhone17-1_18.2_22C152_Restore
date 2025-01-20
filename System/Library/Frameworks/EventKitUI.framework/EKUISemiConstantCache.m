@interface EKUISemiConstantCache
+ (id)sharedInstance;
- (EKUISemiConstantCache)init;
- (UIFont)weekAllDayLabelFontCompact;
- (UIFont)weekAllDayLabelFontRegular;
- (UIFont)weekAllDayTodayLabelFontCompact;
- (double)minYearMonthHeaderFontSizeUsed;
- (double)weekAllDayBaselineForLargeFormatWeekView;
- (double)weekAllDayBaselineForSmallFormatWeekView;
- (double)weekAllDayOccurrenceHeight;
- (double)weekAllDayOccurrenceHeightSmallText;
- (id)inboxDisclosureImage;
- (id)statusGlyphForStatusType:(int64_t)a3;
- (int64_t)_participantStatusFromDetailAttendeesStatus:(int64_t)a3;
- (void)_localeChanged:(id)a3;
- (void)setMinYearMonthHeaderFontSizeUsed:(double)a3;
- (void)setWeekAllDayBaselineForLargeFormatWeekView:(double)a3;
- (void)setWeekAllDayBaselineForSmallFormatWeekView:(double)a3;
- (void)setWeekAllDayOccurrenceHeight:(double)a3;
- (void)setWeekAllDayOccurrenceHeightSmallText:(double)a3;
- (void)updateMetrics;
@end

@implementation EKUISemiConstantCache

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance_sharedInstance;

  return v2;
}

void __39__EKUISemiConstantCache_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = v0;
}

- (EKUISemiConstantCache)init
{
  v7.receiver = self;
  v7.super_class = (Class)EKUISemiConstantCache;
  v2 = [(EKUISemiConstantCache *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel__contentCategorySizeChanged_ name:*MEMORY[0x1E4FB27A8] object:0];

    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v2 selector:sel__localeChanged_ name:*MEMORY[0x1E4F57AB0] object:0];

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel__orientationChanged_ name:*MEMORY[0x1E4FB2828] object:0];

    [(EKUISemiConstantCache *)v2 updateMetrics];
  }
  return v2;
}

- (void)updateMetrics
{
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)&self->_weekAllDayBaselineForLargeFormatWeekView = _Q0;
  *(_OWORD *)&self->_weekAllDayOccurrenceHeight = _Q0;
  weekAllDayLabelFontCompact = self->_weekAllDayLabelFontCompact;
  self->_weekAllDayLabelFontCompact = 0;

  weekAllDayLabelFontRegular = self->_weekAllDayLabelFontRegular;
  self->_weekAllDayLabelFontRegular = 0;

  weekAllDayTodayLabelFontCompact = self->_weekAllDayTodayLabelFontCompact;
  self->_weekAllDayTodayLabelFontCompact = 0;

  inboxDisclosureImage = self->_inboxDisclosureImage;
  self->_inboxDisclosureImage = 0;

  self->_minYearMonthHeaderFontSizeUsed = 0.0;
}

- (void)_localeChanged:(id)a3
{
  self->_minYearMonthHeaderFontSizeUsed = 0.0;
}

- (id)statusGlyphForStatusType:(int64_t)a3
{
  v5 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D8]];
  [(EKUISemiConstantCache *)self _participantStatusFromDetailAttendeesStatus:a3];
  v6 = attributedStatusGlyph();

  return v6;
}

- (int64_t)_participantStatusFromDetailAttendeesStatus:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return 0;
  }
  else {
    return qword_1B413A608[a3];
  }
}

- (id)inboxDisclosureImage
{
  inboxDisclosureImage = self->_inboxDisclosureImage;
  if (!inboxDisclosureImage)
  {
    v4 = [MEMORY[0x1E4FB08E8] defaultFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28C8]];
    v5 = [v4 fontDescriptorWithSymbolicTraits:2];

    v6 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v5 size:0.0];
    objc_super v7 = [MEMORY[0x1E4FB1830] configurationWithFont:v6 scale:1];
    v8 = [MEMORY[0x1E4FB1818] systemImageNamed:@"chevron.forward" withConfiguration:v7];
    v9 = self->_inboxDisclosureImage;
    self->_inboxDisclosureImage = v8;

    inboxDisclosureImage = self->_inboxDisclosureImage;
  }

  return inboxDisclosureImage;
}

- (UIFont)weekAllDayLabelFontCompact
{
  weekAllDayLabelFontCompact = self->_weekAllDayLabelFontCompact;
  if (!weekAllDayLabelFontCompact)
  {
    int v4 = EKUIUsesRoundedRectsInsteadOfCircles(0, a2);
    double v5 = 13.0;
    if (v4) {
      +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:0 maximumValue:13.0 shouldScaleForSmallerSizes:24.0];
    }
    v6 = [MEMORY[0x1E4FB08E0] systemFontOfSize:v5];
    objc_super v7 = self->_weekAllDayLabelFontCompact;
    self->_weekAllDayLabelFontCompact = v6;

    weekAllDayLabelFontCompact = self->_weekAllDayLabelFontCompact;
  }

  return weekAllDayLabelFontCompact;
}

- (UIFont)weekAllDayLabelFontRegular
{
  weekAllDayLabelFontRegular = self->_weekAllDayLabelFontRegular;
  if (!weekAllDayLabelFontRegular)
  {
    int v4 = EKUIUsesRoundedRectsInsteadOfCircles(0, a2);
    double v5 = 17.0;
    if (v4) {
      +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:0 maximumValue:17.0 shouldScaleForSmallerSizes:24.0];
    }
    v6 = [MEMORY[0x1E4FB08E0] systemFontOfSize:v5];
    objc_super v7 = self->_weekAllDayLabelFontRegular;
    self->_weekAllDayLabelFontRegular = v6;

    weekAllDayLabelFontRegular = self->_weekAllDayLabelFontRegular;
  }

  return weekAllDayLabelFontRegular;
}

- (UIFont)weekAllDayTodayLabelFontCompact
{
  weekAllDayTodayLabelFontCompact = self->_weekAllDayTodayLabelFontCompact;
  if (!weekAllDayTodayLabelFontCompact)
  {
    int v4 = EKUIUsesRoundedRectsInsteadOfCircles(0, a2);
    double v5 = 13.0;
    if (v4) {
      +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:0 maximumValue:13.0 shouldScaleForSmallerSizes:24.0];
    }
    v6 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:v5];
    objc_super v7 = self->_weekAllDayTodayLabelFontCompact;
    self->_weekAllDayTodayLabelFontCompact = v6;

    weekAllDayTodayLabelFontCompact = self->_weekAllDayTodayLabelFontCompact;
  }

  return weekAllDayTodayLabelFontCompact;
}

- (double)weekAllDayBaselineForLargeFormatWeekView
{
  return self->_weekAllDayBaselineForLargeFormatWeekView;
}

- (void)setWeekAllDayBaselineForLargeFormatWeekView:(double)a3
{
  self->_weekAllDayBaselineForLargeFormatWeekView = a3;
}

- (double)weekAllDayBaselineForSmallFormatWeekView
{
  return self->_weekAllDayBaselineForSmallFormatWeekView;
}

- (void)setWeekAllDayBaselineForSmallFormatWeekView:(double)a3
{
  self->_weekAllDayBaselineForSmallFormatWeekView = a3;
}

- (double)weekAllDayOccurrenceHeight
{
  return self->_weekAllDayOccurrenceHeight;
}

- (void)setWeekAllDayOccurrenceHeight:(double)a3
{
  self->_weekAllDayOccurrenceHeight = a3;
}

- (double)weekAllDayOccurrenceHeightSmallText
{
  return self->_weekAllDayOccurrenceHeightSmallText;
}

- (void)setWeekAllDayOccurrenceHeightSmallText:(double)a3
{
  self->_weekAllDayOccurrenceHeightSmallText = a3;
}

- (double)minYearMonthHeaderFontSizeUsed
{
  return self->_minYearMonthHeaderFontSizeUsed;
}

- (void)setMinYearMonthHeaderFontSizeUsed:(double)a3
{
  self->_minYearMonthHeaderFontSizeUsed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inboxDisclosureImage, 0);
  objc_storeStrong((id *)&self->_weekAllDayTodayLabelFontCompact, 0);
  objc_storeStrong((id *)&self->_weekAllDayLabelFontRegular, 0);

  objc_storeStrong((id *)&self->_weekAllDayLabelFontCompact, 0);
}

@end