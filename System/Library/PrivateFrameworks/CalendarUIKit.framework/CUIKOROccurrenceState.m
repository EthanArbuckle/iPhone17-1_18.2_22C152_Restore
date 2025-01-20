@interface CUIKOROccurrenceState
+ (NSCache)languageAwareInsetsCache;
+ (NSCache)locationCache;
+ (UIEdgeInsets)defaultMarginFromEKDayOccurrenceView;
+ (UIEdgeInsets)defaultPadding;
+ (UIEdgeInsets)defaultPaddingFromEKDayOccurrenceView;
+ (double)enoughHeightForOneLineForEvent:(id)a3 usingSmallText:(BOOL)a4 sizeClass:(int64_t)a5;
+ (id)tallCharacterSetCache;
+ (void)clearLocationCache;
- (BOOL)drawReminderAsEditable;
- (BOOL)hasNewTimeProposed;
- (BOOL)hidesTime;
- (BOOL)isAllDay;
- (BOOL)isBirthday;
- (BOOL)isCancelled;
- (BOOL)isCompleted;
- (BOOL)isDeclined;
- (BOOL)isDimmed;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMiniPreviewInEventDetail;
- (BOOL)isProposedTime;
- (BOOL)isReminder;
- (BOOL)isReminderStack;
- (BOOL)isSelected;
- (BOOL)isTentative;
- (BOOL)isValid;
- (BOOL)needsReply;
- (BOOL)occurrenceIsFirstVisibleDayOfEvent;
- (BOOL)requiresLanguageAwarePadding;
- (BOOL)usesSmallText;
- (CGRect)backgroundRect;
- (CGRect)estimatedTextFrame;
- (CGSize)textSpace;
- (CUIKOROccurrenceState)init;
- (EKEvent)occurrence;
- (NSArray)occurrences;
- (NSArray)trailingIcons;
- (NSAttributedString)location;
- (NSNumber)allDayOverride;
- (NSString)description;
- (NSString)locationImageName;
- (NSString)moreText;
- (NSString)title;
- (UIColor)baseColor;
- (UIColor)colorBarColor;
- (UIColor)displayColor;
- (UIColor)moreTextColor;
- (UIColor)strikethroughColor;
- (UIColor)titleTextColor;
- (UIEdgeInsets)languageAwareInsets;
- (UIEdgeInsets)padding;
- (UIFont)primaryTextFont;
- (UIFont)secondaryTextFont;
- (UIImage)leadingIcon;
- (UITraitCollection)traitCollection;
- (double)enoughHeightForOneLine;
- (double)minimumNaturalHeightAllText;
- (double)totalLanguageAwareHeightPadding;
- (double)travelTime;
- (double)travelTimeHeight;
- (double)visibleHeight;
- (id)_leadingSymbolSizeConfigurationForReminder:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)primaryTextFontBold:(BOOL)a3;
- (id)primaryTextFontNonBold;
- (id)reminderIcon;
- (id)secondaryTitleTextColor;
- (id)status;
- (id)trailingIconsColor;
- (int)reminderStackDepth;
- (int64_t)birthdayCount;
- (int64_t)horizontalSizeClass;
- (int64_t)userInterfaceStyle;
- (unint64_t)fontCompressionDegree;
- (unint64_t)hash;
- (void)_location:(id *)a3 locationImageName:(id *)a4;
- (void)performChanges:(id)a3;
- (void)performChangesWithState:(id)a3;
- (void)setAllDayOverride:(id)a3;
- (void)setBackgroundRect:(CGRect)a3;
- (void)setBirthdayCount:(int64_t)a3;
- (void)setDisplayColor:(id)a3;
- (void)setEstimatedTextFrame:(CGRect)a3;
- (void)setHorizontalSizeClass:(int64_t)a3;
- (void)setIsDimmed:(BOOL)a3;
- (void)setIsMiniPreviewInEventDetail:(BOOL)a3;
- (void)setIsProposedTime:(BOOL)a3;
- (void)setIsSelected:(BOOL)a3;
- (void)setOccurrence:(id)a3;
- (void)setOccurrenceIsFirstVisibleDayOfEvent:(BOOL)a3;
- (void)setOccurrences:(id)a3;
- (void)setPadding:(UIEdgeInsets)a3;
- (void)setTraitCollection:(id)a3;
- (void)setTravelTime:(double)a3;
- (void)setTravelTimeHeight:(double)a3;
- (void)setUserInterfaceStyle:(int64_t)a3;
- (void)setUsesSmallText:(BOOL)a3;
- (void)setVisibleHeight:(double)a3;
@end

@implementation CUIKOROccurrenceState

- (EKEvent)occurrence
{
  return self->_occurrence;
}

- (UIColor)colorBarColor
{
  v3 = [(CUIKOROccurrenceState *)self displayColor];
  v4 = CUIKColorBarColor(v3, [(CUIKOROccurrenceState *)self userInterfaceStyle], [(CUIKOROccurrenceState *)self needsReply], [(CUIKOROccurrenceState *)self isDeclined], [(CUIKOROccurrenceState *)self isReminder], [(CUIKOROccurrenceState *)self isSelected], [(CUIKOROccurrenceState *)self isCancelled]);

  return (UIColor *)v4;
}

- (id)secondaryTitleTextColor
{
  v7 = [(CUIKOROccurrenceState *)self occurrence];
  v3 = [v7 calendar];
  v4 = [v3 displayColor];
  v5 = CUIKOccurrenceSecondaryTextColor(v4, [(CUIKOROccurrenceState *)self isCancelled], [(CUIKOROccurrenceState *)self isDeclined], [(CUIKOROccurrenceState *)self isSelected], [(CUIKOROccurrenceState *)self needsReply], [(CUIKOROccurrenceState *)self isReminder], [(CUIKOROccurrenceState *)self isCompleted], [(CUIKOROccurrenceState *)self drawReminderAsEditable], [(CUIKOROccurrenceState *)self isBirthday], [(CUIKOROccurrenceState *)self userInterfaceStyle]);

  return v5;
}

- (BOOL)isReminder
{
  return [(EKEvent *)self->_occurrence isIntegrationEvent];
}

- (BOOL)isDeclined
{
  return CUIKEventDisplaysAsDeclined(self->_occurrence);
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (BOOL)isCancelled
{
  return [(EKEvent *)self->_occurrence status] == EKEventStatusCanceled;
}

- (BOOL)needsReply
{
  return CUIKEventDisplaysAsNeedsReply(self->_occurrence);
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (unint64_t)fontCompressionDegree
{
  int64_t v3 = [(CUIKOROccurrenceState *)self horizontalSizeClass];
  [(CUIKOROccurrenceState *)self textSpace];
  double v5 = v4;
  if ([(CUIKOROccurrenceState *)self isAllDay] || [(CUIKOROccurrenceState *)self isBirthday]) {
    return 0;
  }
  if ([(CUIKOROccurrenceState *)self usesSmallText]) {
    +[CUIKORFontUtils defaultOccurrenceSmallPrimaryTextFontForSizeClass:v3];
  }
  else {
  v7 = +[CUIKORFontUtils defaultOccurrencePrimaryTextFontForSizeClass:v3];
  }
  double v9 = [(UIFont *)v7 cuik_lineHeight];

  if (v5 >= v9 * 0.75) {
    return v5 < v9;
  }
  else {
    return 2;
  }
}

- (BOOL)isAllDay
{
  int64_t v3 = [(CUIKOROccurrenceState *)self allDayOverride];

  if (v3)
  {
    double v4 = [(CUIKOROccurrenceState *)self allDayOverride];
    char v5 = [v4 BOOLValue];

    return v5;
  }
  else
  {
    occurrence = self->_occurrence;
    return [(EKEvent *)occurrence isAllDay];
  }
}

- (NSNumber)allDayOverride
{
  return self->_allDayOverride;
}

- (UIEdgeInsets)languageAwareInsets
{
  int64_t v3 = [(id)objc_opt_class() languageAwareInsetsCache];
  int64_t v4 = [(CUIKOROccurrenceState *)self horizontalSizeClass];
  char v5 = [NSNumber numberWithInteger:v4];
  v6 = [v3 objectForKey:v5];
  if (v6)
  {
    v7 = v6;
    [v6 CUIKEdgeInsetsValue];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
  }
  else
  {
    v16 = (double *)MEMORY[0x1E4FB2848];
    double v11 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v15 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    v17 = +[CUIKORFontUtils defaultOccurrencePrimaryTextFontForSizeClass:v4];
    if (CTFontGetLanguageAwareOutsets())
    {
      double v9 = CUIKCeilToScreenScale(0.0);
      double v13 = CUIKCeilToScreenScale(0.0);
    }
    else
    {
      double v13 = v16[2];
      double v9 = *v16;
    }
    v7 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCUIKEdgeInsets:", v9, v11, v13, v15, 0);
    [v3 setObject:v7 forKey:v5];
  }
  v18 = [(CUIKOROccurrenceState *)self title];
  v19 = [(id)objc_opt_class() tallCharacterSetCache];
  uint64_t v20 = [v18 rangeOfCharacterFromSet:v19];

  if (v20 != 0x7FFFFFFFFFFFFFFFLL)
  {
    double v13 = v13 + 8.0;
    double v9 = v9 + 8.0;
  }

  double v21 = v9;
  double v22 = v11;
  double v23 = v13;
  double v24 = v15;
  result.right = v24;
  result.bottom = v23;
  result.left = v22;
  result.top = v21;
  return result;
}

- (BOOL)usesSmallText
{
  return [(CUIKOROccurrenceState *)self horizontalSizeClass] != 2 && self->_usesSmallText;
}

- (int64_t)horizontalSizeClass
{
  return self->_horizontalSizeClass;
}

- (BOOL)isBirthday
{
  int64_t v3 = [(EKEvent *)self->_occurrence calendar];
  BOOL v4 = [v3 type] == 4 || -[CUIKOROccurrenceState birthdayCount](self, "birthdayCount") > 0;

  return v4;
}

- (NSString)title
{
  if ([(CUIKOROccurrenceState *)self birthdayCount] < 2)
  {
    double v8 = CUIKBundle();
    double v9 = [v8 localizedStringForKey:@"New Event" value:&stru_1F187C430 table:0];

    occurrence = self->_occurrence;
    if (occurrence)
    {
      double v11 = [(EKEvent *)occurrence title];
      if ([v11 length])
      {
        uint64_t v12 = CUIKDisplayedTitleForEvent(self->_occurrence);

        double v9 = (void *)v12;
      }
      id v4 = v9;

      v7 = v4;
    }
    else
    {
      id v4 = v9;
      v7 = v4;
    }
  }
  else
  {
    int64_t v3 = NSString;
    CUIKBundle();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    char v5 = [v4 localizedStringForKey:@"%@ birthdays" value:&stru_1F187C430 table:0];
    v6 = CUIKLocalizedStringForInteger(self->_birthdayCount);
    v7 = objc_msgSend(v3, "localizedStringWithFormat:", v5, v6);
  }

  return (NSString *)v7;
}

- (int64_t)birthdayCount
{
  return self->_birthdayCount;
}

+ (id)tallCharacterSetCache
{
  if (tallCharacterSetCache_onceToken[0] != -1) {
    dispatch_once(tallCharacterSetCache_onceToken, &__block_literal_global_47);
  }
  v2 = (void *)tallCharacterSetCache_cache;

  return v2;
}

+ (NSCache)languageAwareInsetsCache
{
  if (languageAwareInsetsCache_onceToken != -1) {
    dispatch_once(&languageAwareInsetsCache_onceToken, &__block_literal_global_24);
  }
  v2 = (void *)languageAwareInsetsCache_cache;

  return (NSCache *)v2;
}

- (CGSize)textSpace
{
  [(CUIKOROccurrenceState *)self languageAwareInsets];
  double v4 = v3;
  double v6 = v5;
  [(CUIKOROccurrenceState *)self estimatedTextFrame];
  double v8 = v7;
  double v10 = v9 - (v4 + v6);
  result.height = v10;
  result.width = v8;
  return result;
}

- (CGRect)estimatedTextFrame
{
  CGFloat x = self->_estimatedTextFrame.origin.x;
  CGFloat y = self->_estimatedTextFrame.origin.y;
  double width = self->_estimatedTextFrame.size.width;
  CGFloat height = self->_estimatedTextFrame.size.height;
  v60.origin.CGFloat x = x;
  v60.origin.CGFloat y = y;
  v60.size.double width = width;
  v60.size.CGFloat height = height;
  if (CGRectEqualToRect(v60, *MEMORY[0x1E4F1DB20]))
  {
    [(CUIKOROccurrenceState *)self backgroundRect];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    [(CUIKOROccurrenceState *)self travelTime];
    double v16 = v15;
    BOOL v17 = [(CUIKOROccurrenceState *)self isAllDay];
    if (v16 > 0.0 && !v17)
    {
      [(CUIKOROccurrenceState *)self travelTimeHeight];
      double v10 = v18;
      double v14 = v14 - v18;
    }
    [(CUIKOROccurrenceState *)self padding];
    double v20 = v19;
    double v22 = v10 + v21;
    double v24 = v19 + v23;
    double v26 = v14 - (v21 + v25);
    if ([(CUIKOROccurrenceState *)self isReminder])
    {
      +[CUIKORStringGenerator naturalHeightForPrimaryTextUsingSmallText:self->_usesSmallText sizeClass:self->_horizontalSizeClass];
      double v28 = v26 - v27;
      double v29 = v28 * 0.5;
      double v26 = v26 - fmax(v28, 0.0);
      BOOL v30 = v28 <= 0.0;
      double v31 = -0.0;
      if (!v30) {
        double v31 = v29;
      }
      double v22 = v22 + v31;
    }
    double v32 = v8 + v20;
    double v59 = v12 - v24;
    double v33 = 0.0;
    if (![(CUIKOROccurrenceState *)self isAllDay]
      && ![(CUIKOROccurrenceState *)self isReminder])
    {
      +[CUIKORImageUtils occurrencePadding];
      double v35 = v34;
      +[CUIKORImageUtils colorBarThickness];
      double v33 = v35 + v36 + 0.0;
    }
    double v37 = *MEMORY[0x1E4FB2848];
    double v38 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v40 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v39 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    v41 = +[CUIKInterface shared];
    int v42 = [v41 interfaceIsLeftToRight];

    if (v42) {
      double v43 = v33;
    }
    else {
      double v43 = v38;
    }
    if (v42) {
      double v44 = v39;
    }
    else {
      double v44 = v33;
    }
    double v45 = v32 + v43;
    double v46 = v22 + v37;
    double v47 = v59 - (v43 + v44);
    double v48 = v26 - (v37 + v40);
    [(CUIKOROccurrenceState *)self visibleHeight];
    if (v49 < v48) {
      double v48 = v49;
    }
    [(CUIKOROccurrenceState *)self languageAwareInsets];
    CGFloat x = CUIKRoundRectToScreenScale(v45, v46 - v50, v47, v48 + v50 + v51);
    CGFloat y = v52;
    CGFloat height = v53;
    self->_estimatedTextFrame.origin.CGFloat x = x;
    self->_estimatedTextFrame.origin.CGFloat y = v52;
    double width = fmax(v54, 0.0);
    self->_estimatedTextFrame.size.double width = width;
    self->_estimatedTextFrame.size.CGFloat height = v53;
  }
  double v55 = x;
  double v56 = y;
  double v57 = width;
  double v58 = height;
  result.size.CGFloat height = v58;
  result.size.double width = v57;
  result.origin.CGFloat y = v56;
  result.origin.CGFloat x = v55;
  return result;
}

- (BOOL)isCompleted
{
  return [(EKEvent *)self->_occurrence completed];
}

- (BOOL)drawReminderAsEditable
{
  return [(EKEvent *)self->_occurrence CUIK_reminderShouldBeEditable];
}

void __49__CUIKOROccurrenceState_performChangesWithState___block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(void **)(a1 + 32);
  id v4 = a2;
  double v5 = [v3 occurrences];
  [v4 setOccurrences:v5];

  objc_msgSend(v4, "setOccurrenceIsFirstVisibleDayOfEvent:", objc_msgSend(*(id *)(a1 + 32), "occurrenceIsFirstVisibleDayOfEvent"));
  objc_msgSend(v4, "setIsProposedTime:", objc_msgSend(*(id *)(a1 + 32), "isProposedTime"));
  objc_msgSend(v4, "setIsSelected:", objc_msgSend(*(id *)(a1 + 32), "isSelected"));
  objc_msgSend(v4, "setIsDimmed:", objc_msgSend(*(id *)(a1 + 32), "isDimmed"));
  objc_msgSend(v4, "setUsesSmallText:", objc_msgSend(*(id *)(a1 + 32), "usesSmallText"));
  [*(id *)(a1 + 32) travelTime];
  objc_msgSend(v4, "setTravelTime:");
  [*(id *)(a1 + 32) backgroundRect];
  objc_msgSend(v4, "setBackgroundRect:");
  [*(id *)(a1 + 32) travelTimeHeight];
  objc_msgSend(v4, "setTravelTimeHeight:");
  [*(id *)(a1 + 32) visibleHeight];
  objc_msgSend(v4, "setVisibleHeight:");
  objc_msgSend(v4, "setUserInterfaceStyle:", objc_msgSend(*(id *)(a1 + 32), "userInterfaceStyle"));
  objc_msgSend(v4, "setHorizontalSizeClass:", objc_msgSend(*(id *)(a1 + 32), "horizontalSizeClass"));
  objc_msgSend(v4, "setBirthdayCount:", objc_msgSend(*(id *)(a1 + 32), "birthdayCount"));
  objc_msgSend(v4, "setIsMiniPreviewInEventDetail:", objc_msgSend(*(id *)(a1 + 32), "isMiniPreviewInEventDetail"));
  double v6 = [*(id *)(a1 + 32) allDayOverride];
  [v4 setAllDayOverride:v6];

  id v8 = [*(id *)(a1 + 32) traitCollection];
  double v7 = (void *)[v8 copy];
  [v4 setTraitCollection:v7];
}

- (void)setVisibleHeight:(double)a3
{
  if (vabdd_f64(a3, self->_visibleHeight) >= 2.22044605e-16)
  {
    self->_visibleHeight = a3;
    CGSize v3 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    self->_estimatedTextFrame.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    self->_estimatedTextFrame.size = v3;
  }
}

- (void)setUsesSmallText:(BOOL)a3
{
  self->_usesSmallText = a3;
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  self->_userInterfaceStyle = a3;
}

- (void)setTravelTimeHeight:(double)a3
{
  self->_travelTimeHeight = a3;
}

- (void)setTravelTime:(double)a3
{
  self->_travelTime = a3;
}

- (void)setTraitCollection:(id)a3
{
  objc_storeStrong((id *)&self->_traitCollection, a3);
  CGSize v4 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  self->_estimatedTextFrame.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  self->_estimatedTextFrame.size = v4;
}

- (void)setOccurrences:(id)a3
{
  CGSize v4 = (NSArray *)a3;
  double v5 = [(NSArray *)v4 firstObject];
  occurrence = self->_occurrence;
  self->_occurrence = v5;

  occurrences = self->_occurrences;
  self->_occurrences = v4;
}

- (void)setOccurrenceIsFirstVisibleDayOfEvent:(BOOL)a3
{
  self->_occurrenceIsFirstVisibleDayOfEvent = a3;
}

- (void)setIsSelected:(BOOL)a3
{
  self->_isSelected = a3;
}

- (void)setIsProposedTime:(BOOL)a3
{
  self->_isProposedTime = a3;
}

- (void)setIsMiniPreviewInEventDetail:(BOOL)a3
{
  self->_isMiniPreviewInEventDetail = a3;
}

- (void)setIsDimmed:(BOOL)a3
{
  self->_isDimmed = a3;
}

- (void)setHorizontalSizeClass:(int64_t)a3
{
  self->_horizontalSizeClass = a3;
}

- (void)setBirthdayCount:(int64_t)a3
{
  self->_birthdayCount = a3;
}

- (void)setBackgroundRect:(CGRect)a3
{
  if (a3.size.width != self->_backgroundRect.size.width || a3.size.height != self->_backgroundRect.size.height)
  {
    self->_backgroundRect = a3;
    CGSize v4 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    self->_estimatedTextFrame.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    self->_estimatedTextFrame.size = v4;
  }
}

- (void)setAllDayOverride:(id)a3
{
}

- (UIFont)secondaryTextFont
{
  unint64_t v2 = [(CUIKOROccurrenceState *)self fontCompressionDegree];
  double v3 = 0.0;
  if (v2 <= 2) {
    double v3 = dbl_1BE079518[v2];
  }
  double v4 = v3 / 11.0;
  double v5 = objc_msgSend(MEMORY[0x1E4FB08E0], "cuik_preferredTightLeadingFontForTextStyle:", *MEMORY[0x1E4FB28E0]);
  double v6 = [v5 fontDescriptor];
  [v6 pointSize];
  double v8 = v7;

  CUIKRoundToScreenScale(v4 * v8);
  double v9 = objc_msgSend(v5, "fontWithSize:");

  return (UIFont *)v9;
}

- (id)primaryTextFontBold:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(CUIKOROccurrenceState *)self fontCompressionDegree];
  int64_t v6 = [(CUIKOROccurrenceState *)self horizontalSizeClass];
  BOOL v7 = [(CUIKOROccurrenceState *)self usesSmallText];
  BOOL v8 = v7;
  if (v6 == 2)
  {
    id v9 = (id)*MEMORY[0x1E4FB28F0];
    double v10 = 0.0;
    double v11 = 11.0;
    double v12 = 12.0;
  }
  else
  {
    if (v7)
    {
      id v9 = (id)*MEMORY[0x1E4FB28E0];
      double v10 = 0.0;
      double v11 = 6.5;
      double v12 = 8.5;
      double v13 = 11.0;
      goto LABEL_7;
    }
    id v9 = (id)*MEMORY[0x1E4FB28F0];
    double v10 = 0.0;
    double v11 = 7.5;
    double v12 = 10.0;
  }
  double v13 = 13.0;
LABEL_7:
  if (!v5) {
    double v10 = v13;
  }
  if (v5 == 1) {
    double v10 = v12;
  }
  if (v5 == 2) {
    double v14 = v11;
  }
  else {
    double v14 = v10;
  }
  if (v3) {
    objc_msgSend(MEMORY[0x1E4FB08E0], "cuik_preferredTightLeadingBoldFontForTextStyle:", v9, v10);
  }
  else {
  double v15 = objc_msgSend(MEMORY[0x1E4FB08E0], "cuik_preferredTightLeadingFontForTextStyle:", v9, v10);
  }
  double v16 = v15;
  double v17 = 13.0;
  if (v6 == 1 && v8) {
    double v17 = 11.0;
  }
  double v18 = v14 / v17;
  double v19 = [v15 fontDescriptor];
  [v19 pointSize];
  double v21 = v20;

  CUIKRoundToScreenScale(v18 * v21);
  double v22 = objc_msgSend(v16, "fontWithSize:");

  return v22;
}

- (double)travelTime
{
  return self->_travelTime;
}

- (CGRect)backgroundRect
{
  double x = self->_backgroundRect.origin.x;
  double y = self->_backgroundRect.origin.y;
  double width = self->_backgroundRect.size.width;
  double height = self->_backgroundRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (UIColor)displayColor
{
  unint64_t v2 = [(EKEvent *)self->_occurrence calendar];
  BOOL v3 = [v2 displayColor];

  return (UIColor *)v3;
}

- (double)visibleHeight
{
  return self->_visibleHeight;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

+ (UIEdgeInsets)defaultPadding
{
  unint64_t v2 = +[CUIKInterface shared];
  int v3 = [v2 interfaceIsLeftToRight];

  double v4 = 4.0;
  if (v3) {
    double v5 = 4.0;
  }
  else {
    double v5 = 6.0;
  }
  if (v3) {
    double v6 = 6.0;
  }
  else {
    double v6 = 4.0;
  }
  double v7 = 4.0;
  result.right = v6;
  result.bottom = v4;
  result.left = v5;
  result.top = v7;
  return result;
}

- (double)travelTimeHeight
{
  return self->_travelTimeHeight;
}

- (BOOL)isReminderStack
{
  return [(CUIKOROccurrenceState *)self reminderStackDepth] > 1;
}

- (UIEdgeInsets)padding
{
  [(id)objc_opt_class() defaultPadding];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if ([(CUIKOROccurrenceState *)self usesSmallText]
    && ![(CUIKOROccurrenceState *)self isMiniPreviewInEventDetail])
  {
    double v11 = +[CUIKInterface shared];
    int v12 = [v11 interfaceIsLeftToRight];

    if (v12) {
      double v10 = 0.0;
    }
    else {
      double v10 = 2.0;
    }
    if (v12) {
      double v6 = 2.0;
    }
    else {
      double v6 = 0.0;
    }
    CUIKRoundToScreenScale(4.0);
    double v4 = v13;
  }
  if ([(CUIKOROccurrenceState *)self requiresLanguageAwarePadding]) {
    double v4 = v4 + -4.0;
  }
  double v14 = v8 + (double)([(CUIKOROccurrenceState *)self reminderStackDepth] - 1) * 2.0;
  double v15 = v4;
  double v16 = v6;
  double v17 = v10;
  result.right = v17;
  result.bottom = v14;
  result.left = v16;
  result.top = v15;
  return result;
}

- (int)reminderStackDepth
{
  NSUInteger v2 = [(NSArray *)self->_occurrences count];
  if (v2 >= 3) {
    LODWORD(v2) = 3;
  }
  return v2;
}

- (BOOL)isProposedTime
{
  return self->_isProposedTime;
}

- (BOOL)isMiniPreviewInEventDetail
{
  return self->_isMiniPreviewInEventDetail;
}

- (BOOL)isDimmed
{
  return self->_isDimmed;
}

- (BOOL)hidesTime
{
  if ([(EKEvent *)self->_occurrence isAllDay]
    || ([(EKEvent *)self->_occurrence isReminderIntegrationEvent] & 1) != 0)
  {
    return 1;
  }
  else
  {
    return ![(CUIKOROccurrenceState *)self occurrenceIsFirstVisibleDayOfEvent];
  }
}

- (BOOL)occurrenceIsFirstVisibleDayOfEvent
{
  return self->_occurrenceIsFirstVisibleDayOfEvent;
}

- (void)performChangesWithState:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__CUIKOROccurrenceState_performChangesWithState___block_invoke;
  v6[3] = &unk_1E636AF40;
  id v7 = v4;
  id v5 = v4;
  [(CUIKOROccurrenceState *)self performChanges:v6];
}

- (void)performChanges:(id)a3
{
  id v5 = a3;
  BOOL isPerformingChanges = self->_isPerformingChanges;
  id v8 = v5;
  if (isPerformingChanges)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"CUIKOROccurrenceState.m" lineNumber:955 description:@"Re-entry not currently supported"];

    id v5 = v8;
  }
  (*((void (**)(id, CUIKOROccurrenceState *))v5 + 2))(v5, self);
  self->_BOOL isPerformingChanges = isPerformingChanges;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    int v32 = *((unsigned __int8 *)v4 + 12);
    int isSelected = self->_isSelected;
    BOOL v34 = self->_isDimmed == *((unsigned __int8 *)v4 + 13);
    occurrence = self->_occurrence;
    uint64_t v6 = v4[2];
    id v7 = v4;
    char v35 = [(EKEvent *)occurrence isEqual:v6];
    int occurrenceIsFirstVisibleDayOfEvent = self->_occurrenceIsFirstVisibleDayOfEvent;
    int v8 = v7[15];
    char v31 = [(UIColor *)self->_displayColor isEqual:*((void *)v7 + 4)];
    int usesSmallText = self->_usesSmallText;
    int v10 = v7[14];
    CGSize size = self->_backgroundRect.size;
    int8x16_t v27 = *(int8x16_t *)(v7 + 120);
    CGSize v24 = self->_estimatedTextFrame.size;
    int8x16_t v25 = *(int8x16_t *)(v7 + 152);
    float64x2_t v28 = *((float64x2_t *)v7 + 4);
    float64x2_t v29 = *(float64x2_t *)&self->_travelTimeHeight;
    int64_t userInterfaceStyle = self->_userInterfaceStyle;
    uint64_t v12 = *((void *)v7 + 10);
    BOOL v13 = self->_horizontalSizeClass == *((void *)v7 + 11);
    traitCollection = self->_traitCollection;
    uint64_t v15 = *((void *)v7 + 12);

    char v16 = [(UITraitCollection *)traitCollection isEqual:v15];
    char v17 = v34 & ~vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_f64((float64x2_t)vextq_s8((int8x16_t)v24, (int8x16_t)v24, 8uLL), (float64x2_t)vextq_s8(v25, v25, 8uLL)), (int32x4_t)vceqq_f64((float64x2_t)vextq_s8((int8x16_t)size, (int8x16_t)size, 8uLL), (float64x2_t)vextq_s8(v27, v27, 8uLL))))));
    if (isSelected != v32 || occurrenceIsFirstVisibleDayOfEvent != v8) {
      char v17 = 0;
    }
    int32x2_t v19 = vmovn_s64(vcgeq_f64((float64x2_t)vdupq_n_s64(0x3F50624DD2F1A9FCuLL), vabdq_f64(v29, v28)));
    BOOL v20 = usesSmallText == v10 && userInterfaceStyle == v12;
    char v21 = v13 & v19.i8[0];
    if (!v20) {
      char v21 = 0;
    }
    char v22 = v17 & v21 & v19.i8[4] & v16 & v31 & v35;
  }
  else
  {
    char v22 = 0;
  }

  return v22;
}

- (UIFont)primaryTextFont
{
  return (UIFont *)[(CUIKOROccurrenceState *)self primaryTextFontBold:1];
}

- (UIColor)titleTextColor
{
  id v7 = [(CUIKOROccurrenceState *)self occurrence];
  double v3 = [v7 calendar];
  id v4 = [v3 displayColor];
  id v5 = CUIKOccurrenceTextColor(v4, [(CUIKOROccurrenceState *)self isCancelled], [(CUIKOROccurrenceState *)self isDeclined], [(CUIKOROccurrenceState *)self isSelected], [(CUIKOROccurrenceState *)self needsReply], [(CUIKOROccurrenceState *)self isReminder], [(CUIKOROccurrenceState *)self isCompleted], [(CUIKOROccurrenceState *)self drawReminderAsEditable], [(CUIKOROccurrenceState *)self isBirthday], [(CUIKOROccurrenceState *)self userInterfaceStyle]);

  return (UIColor *)v5;
}

- (UIImage)leadingIcon
{
  v15[2] = *MEMORY[0x1E4F143B8];
  if ([(CUIKOROccurrenceState *)self isReminder])
  {
    double v3 = [(CUIKOROccurrenceState *)self reminderIcon];
  }
  else
  {
    if ([(CUIKOROccurrenceState *)self isSelected]) {
      [(CUIKOROccurrenceState *)self titleTextColor];
    }
    else {
    id v4 = objc_msgSend(MEMORY[0x1E4FB1618], "cuik_systemBackgroundColor");
    }
    id v5 = (void *)MEMORY[0x1E4FB1830];
    v15[0] = v4;
    uint64_t v6 = [(CUIKOROccurrenceState *)self colorBarColor];
    v15[1] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    int v8 = [v5 configurationWithPaletteColors:v7];

    double v9 = [(CUIKOROccurrenceState *)self _leadingSymbolSizeConfigurationForReminder:0];
    int v10 = [v8 configurationByApplyingConfiguration:v9];

    double v11 = [(CUIKOROccurrenceState *)self occurrence];
    uint64_t v12 = [(CUIKOROccurrenceState *)self occurrence];
    objc_msgSend(v11, "CUIK_symbolName:", objc_msgSend(v12, "isAllDay"));
    BOOL v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v13 || ![(CUIKOROccurrenceState *)self isAllDay])
    {
      if (v13 == @"calendar.circle.fill" && ![(CUIKOROccurrenceState *)self isAllDay])
      {

        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = @"calendar.circle.fill";
    }
    double v3 = objc_msgSend(MEMORY[0x1E4FB1818], "cuik_systemImageNamed:withConfiguration:", v13, v10);
  }

  return (UIImage *)v3;
}

- (NSArray)trailingIcons
{
  double v3 = [MEMORY[0x1E4F1CA48] array];
  if (![(CUIKOROccurrenceState *)self isReminderStack]
    && ![(CUIKOROccurrenceState *)self fontCompressionDegree])
  {
    id v4 = [(CUIKOROccurrenceState *)self occurrence];
    id v5 = [(CUIKOROccurrenceState *)self trailingIconsColor];
    uint64_t v6 = (void *)MEMORY[0x1E4FB1830];
    id v7 = [(CUIKOROccurrenceState *)self secondaryTextFont];
    int v8 = objc_msgSend(v6, "cuik_configurationWithFont:scale:", v7, 1);

    objc_msgSend(v4, "CUIK_attendeesIconSymbolWithAttendeesIconState:myParticipantStatus:", objc_msgSend(v4, "CUIK_attendeesIconState"), objc_msgSend(v4, "selfParticipantStatus"));
    double v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    int v10 = v9;
    if (v9) {
      goto LABEL_11;
    }
    double v11 = [(CUIKOROccurrenceState *)self occurrence];
    if ([v11 isOrWasPartOfRecurringSeries])
    {
      uint64_t v12 = [(CUIKOROccurrenceState *)self occurrence];
      if (([v12 isOriginalItemPhantom] & 1) != 0
        || [(CUIKOROccurrenceState *)self isBirthday])
      {
      }
      else
      {
        double v18 = [(CUIKOROccurrenceState *)self occurrence];
        int32x2_t v19 = [v18 calendar];
        char v21 = [v19 isHolidayCalendar];

        if (v21) {
          goto LABEL_9;
        }
        BOOL v20 = objc_msgSend(MEMORY[0x1E4FB1818], "cuik_systemImageNamed:withConfiguration:", @"repeat", v8);
        double v11 = objc_msgSend(v20, "cuik_imageWithTintColor:", v5);

        [v3 addObject:v11];
      }
    }

LABEL_9:
    BOOL v13 = [(CUIKOROccurrenceState *)self occurrence];
    int v14 = [v13 hasAttachment];

    if (!v14)
    {
LABEL_12:

      goto LABEL_13;
    }
    int v10 = @"paperclip";
LABEL_11:
    uint64_t v15 = objc_msgSend(MEMORY[0x1E4FB1818], "cuik_systemImageNamed:withConfiguration:", v10, v8);
    char v16 = objc_msgSend(v15, "cuik_imageWithTintColor:", v5);

    [v3 addObject:v16];
    goto LABEL_12;
  }
LABEL_13:

  return (NSArray *)v3;
}

- (id)trailingIconsColor
{
  if ([(CUIKOROccurrenceState *)self isReminder])
  {
    if ([(CUIKOROccurrenceState *)self isSelected]) {
      [MEMORY[0x1E4FB1618] whiteColor];
    }
    else {
    double v3 = [MEMORY[0x1E4FB1618] systemGrayColor];
    }
  }
  else
  {
    double v3 = [(CUIKOROccurrenceState *)self locationTextColor];
  }

  return v3;
}

- (NSString)moreText
{
  double v3 = [(CUIKOROccurrenceState *)self occurrences];
  unint64_t v4 = [v3 count];

  if (v4 < 2)
  {
    double v9 = 0;
  }
  else
  {
    id v5 = NSString;
    uint64_t v6 = CUIKBundle();
    id v7 = [v6 localizedStringForKey:@"ReminderStackMoreFormat" value:@"%lu more" table:0];
    int v8 = [(CUIKOROccurrenceState *)self occurrences];
    double v9 = objc_msgSend(v5, "localizedStringWithFormat:", v7, objc_msgSend(v8, "count") - 1);
  }

  return (NSString *)v9;
}

- (NSArray)occurrences
{
  return self->_occurrences;
}

- (NSString)locationImageName
{
  id v6 = 0;
  id v7 = 0;
  [(CUIKOROccurrenceState *)self _location:&v7 locationImageName:&v6];
  id v2 = v7;
  double v3 = (__CFString *)v6;
  if (v3) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = @"location.pin.point.of.interest";
  }

  return (NSString *)v4;
}

- (id)_leadingSymbolSizeConfigurationForReminder:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v4 = (void *)MEMORY[0x1E4FB1830];
  id v5 = [(CUIKOROccurrenceState *)self primaryTextFont];
  [v5 pointSize];
  double v7 = 3.0;
  if (v3) {
    double v7 = 2.0;
  }
  double v8 = v7 + v6;
  if (v3) {
    uint64_t v9 = 7;
  }
  else {
    uint64_t v9 = 4;
  }
  int v10 = [v4 configurationWithPointSize:v9 weight:2 scale:v8];

  return v10;
}

- (NSAttributedString)location
{
  id v4 = 0;
  id v5 = 0;
  [(CUIKOROccurrenceState *)self _location:&v5 locationImageName:&v4];
  id v2 = v5;

  return (NSAttributedString *)v2;
}

- (void)_location:(id *)a3 locationImageName:(id *)a4
{
  int check = 0;
  notify_check(apHiddenAppsNotifyToken, &check);
  if (check) {
    [(id)objc_opt_class() clearLocationCache];
  }
  double v7 = [(id)objc_opt_class() locationCache];
  double v8 = [(EKEvent *)self->_occurrence eventIdentifier];
  uint64_t v9 = [v7 objectForKey:v8];

  *a3 = [v9 generatedLocationString];
  *a4 = [v9 locationImageName];
  uint64_t v10 = [(EKEvent *)self->_occurrence location];
  uint64_t v11 = [(EKEvent *)self->_occurrence locationWithoutPrediction];
  uint64_t v12 = [(EKEvent *)self->_occurrence preferredLocation];
  unsigned int v41 = [v12 isPrediction];

  BOOL v13 = [(EKEvent *)self->_occurrence virtualConference];
  int v14 = [v13 joinMethods];
  uint64_t v15 = [v14 firstObject];
  char v16 = [v15 URL];

  if (!v16)
  {
    if (([(EKEvent *)self->_occurrence conferenceURLForDisplayCached] & 1) != 0
      || ([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
    {
      char v16 = [(EKEvent *)self->_occurrence conferenceURLForDisplay];
    }
    else
    {
      char v16 = 0;
    }
  }
  double v37 = a3;
  double v38 = a4;
  int v17 = [v9 originalOccurrenceLocationIsPrediction];
  double v18 = [v9 originalOccurrenceLocation];
  double v40 = (void *)v10;
  int v19 = CalEqualStrings();

  BOOL v20 = [v9 originalOccurrenceLocationWithoutPrediction];
  double v39 = (void *)v11;
  int v21 = CalEqualStrings();

  BOOL v22 = [(CUIKOROccurrenceState *)self hasNewTimeProposed];
  int v23 = [v9 originalHasNewTimeProposed];
  CGSize v24 = [v9 originalConferenceURL];
  int v25 = CalEqualObjects();

  if (v19 && v21 && ((v41 ^ v17) & 1) == 0 && ((v22 ^ v23) & 1) == 0 && v25
    || (char v42 = 0,
        +[CUIKLocationDescriptionGenerator locationStringForEvent:self->_occurrence options:422 incomplete:&v42 leadingImageName:v38], *double v37 = (id)objc_claimAutoreleasedReturnValue(), v42))
  {
    int8x16_t v27 = v39;
    double v26 = v40;
  }
  else
  {
    float64x2_t v28 = [CUIKOROccurrenceStateCachedLocation alloc];
    id v29 = *v37;
    id v30 = *v38;
    BOOL v31 = [(CUIKOROccurrenceState *)self hasNewTimeProposed];
    id v32 = v29;
    id v33 = v30;
    int8x16_t v27 = v39;
    double v26 = v40;
    uint64_t v34 = [(CUIKOROccurrenceStateCachedLocation *)v28 initWithGeneratedLocationString:v32 locationImageName:v33 originalOccurrenceLocation:v40 originalOccurrenceLocationWithoutPrediction:v39 originalOccurrenceLocationIsPrediction:v41 originalHasNewTimeProposed:v31 originalConferenceURL:v16];

    char v35 = [(id)objc_opt_class() locationCache];
    double v36 = [(EKEvent *)self->_occurrence eventIdentifier];
    [v35 setObject:v34 forKey:v36];

    uint64_t v9 = (void *)v34;
  }
}

+ (NSCache)locationCache
{
  if (locationCache_onceToken != -1) {
    dispatch_once(&locationCache_onceToken, &__block_literal_global_66);
  }
  id v2 = (void *)locationCache_cache;

  return (NSCache *)v2;
}

- (BOOL)hasNewTimeProposed
{
  return [(EKEvent *)self->_occurrence hasAttendeeProposedTimes];
}

+ (void)clearLocationCache
{
  id v2 = [a1 locationCache];
  [v2 removeAllObjects];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[CUIKOROccurrenceState allocWithZone:a3] init];
  objc_storeStrong((id *)&v4->_occurrence, self->_occurrence);
  objc_storeStrong((id *)&v4->_occurrences, self->_occurrences);
  v4->_int occurrenceIsFirstVisibleDayOfEvent = self->_occurrenceIsFirstVisibleDayOfEvent;
  v4->_isProposedTime = self->_isProposedTime;
  v4->_int isSelected = self->_isSelected;
  v4->_isDimmed = self->_isDimmed;
  v4->_int usesSmallText = self->_usesSmallText;
  v4->_travelTime = self->_travelTime;
  uint64_t v5 = [(UIColor *)self->_displayColor copy];
  displayColor = v4->_displayColor;
  v4->_displayColor = (UIColor *)v5;

  CGPoint origin = self->_backgroundRect.origin;
  v4->_backgroundRect.CGSize size = self->_backgroundRect.size;
  v4->_backgroundRect.CGPoint origin = origin;
  v4->_travelTimeHeight = self->_travelTimeHeight;
  v4->_visibleHeight = self->_visibleHeight;
  v4->_visibleHeight = self->_visibleHeight;
  v4->_int64_t userInterfaceStyle = self->_userInterfaceStyle;
  v4->_horizontalSizeClass = self->_horizontalSizeClass;
  v4->_birthdayCount = self->_birthdayCount;
  v4->_isMiniPreviewInEventDetail = self->_isMiniPreviewInEventDetail;
  objc_storeStrong((id *)&v4->_allDayOverride, self->_allDayOverride);
  uint64_t v8 = [(UITraitCollection *)self->_traitCollection copy];
  traitCollection = v4->_traitCollection;
  v4->_traitCollection = (UITraitCollection *)v8;

  return v4;
}

- (CUIKOROccurrenceState)init
{
  v4.receiver = self;
  v4.super_class = (Class)CUIKOROccurrenceState;
  UIEdgeInsets result = [(CUIKOROccurrenceState *)&v4 init];
  if (result)
  {
    CGSize v3 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    result->_estimatedTextFrame.CGPoint origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    result->_estimatedTextFrame.CGSize size = v3;
    result->_visibleHeight = 1.79769313e308;
  }
  return result;
}

- (BOOL)isValid
{
  occurrence = self->_occurrence;
  int64_t birthdayCount = self->_birthdayCount;
  [(CUIKOROccurrenceState *)self backgroundRect];
  double v6 = v5;
  double v8 = v7;
  [(CUIKOROccurrenceState *)self estimatedTextFrame];
  if (occurrence) {
    BOOL v11 = 0;
  }
  else {
    BOOL v11 = birthdayCount <= 0;
  }
  BOOL v12 = !v11;
  if (v6 < 0.0) {
    BOOL v12 = 0;
  }
  if (v8 < 0.0) {
    BOOL v12 = 0;
  }
  if (v9 <= 0.0) {
    BOOL v12 = 0;
  }
  return v10 > 0.0 && v12;
}

- (BOOL)isTentative
{
  return (CUIKEventDisplaysAsTentative(self->_occurrence) & 1) != 0 || self->_isProposedTime;
}

- (UIColor)baseColor
{
  CGSize v3 = [(CUIKOROccurrenceState *)self displayColor];
  objc_super v4 = CUIKBaseColor(v3, [(CUIKOROccurrenceState *)self userInterfaceStyle], [(CUIKOROccurrenceState *)self needsReply], [(CUIKOROccurrenceState *)self isDeclined], [(CUIKOROccurrenceState *)self isReminder]);

  return (UIColor *)v4;
}

- (unint64_t)hash
{
  unint64_t v3 = self->_isDimmed + (unint64_t)self->_isSelected;
  uint64_t v4 = [(EKEvent *)self->_occurrence hash];
  BOOL occurrenceIsFirstVisibleDayOfEvent = self->_occurrenceIsFirstVisibleDayOfEvent;
  unint64_t v6 = (unint64_t)((double)(unint64_t)((double)(unint64_t)(self->_backgroundRect.size.width
                                                                              + self->_backgroundRect.size.height
                                                                              + (double)(occurrenceIsFirstVisibleDayOfEvent
                                                                                       + self->_usesSmallText
                                                                                       + v3
                                                                                       + 13
                                                                                       * ([(UIColor *)self->_displayColor hash]+ v4)))+ self->_travelTimeHeight * 13.0)+ self->_visibleHeight * 13.0);
  int64_t userInterfaceStyle = self->_userInterfaceStyle;
  int64_t horizontalSizeClass = self->_horizontalSizeClass;
  return v6
       + 13 * (horizontalSizeClass + userInterfaceStyle + [(UITraitCollection *)self->_traitCollection hash]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_allDayOverride, 0);
  objc_storeStrong((id *)&self->_displayColor, 0);
  objc_storeStrong((id *)&self->_occurrences, 0);

  objc_storeStrong((id *)&self->_occurrence, 0);
}

uint64_t __38__CUIKOROccurrenceState_locationCache__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)locationCache_cache;
  locationCache_cache = (uint64_t)v0;

  [(id)locationCache_cache setEvictsObjectsWhenApplicationEntersBackground:0];
  [(id)locationCache_cache setCountLimit:500];
  id v2 = (const char *)*MEMORY[0x1E4F4B7A8];

  return notify_register_check(v2, &apHiddenAppsNotifyToken);
}

void __46__CUIKOROccurrenceState_tallCharacterSetCache__block_invoke()
{
  id v4 = (id)CTFontCopySystemUIFontExcessiveLineHeightCharacterSet();
  id v0 = [MEMORY[0x1E4F28B88] _emojiCharacterSet];
  v1 = (void *)[v4 mutableCopy];
  id v2 = [v0 invertedSet];
  [v1 formIntersectionWithCharacterSet:v2];

  unint64_t v3 = (void *)tallCharacterSetCache_cache;
  tallCharacterSetCache_cache = (uint64_t)v1;
}

void __49__CUIKOROccurrenceState_languageAwareInsetsCache__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)languageAwareInsetsCache_cache;
  languageAwareInsetsCache_cache = (uint64_t)v0;
}

- (void)setOccurrence:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_occurrence, a3);
  if (v5)
  {
    v8[0] = v5;
    unint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    occurrences = self->_occurrences;
    self->_occurrences = v6;
  }
  else
  {
    occurrences = self->_occurrences;
    self->_occurrences = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
}

- (id)status
{
  if ([(CUIKOROccurrenceState *)self isDeclined])
  {
    unint64_t v3 = CUIKBundle();
    id v4 = v3;
    id v5 = @"DECLINED";
LABEL_5:
    unint64_t v6 = [v3 localizedStringForKey:v5 value:&stru_1F187C430 table:0];

    goto LABEL_7;
  }
  if ([(CUIKOROccurrenceState *)self isCancelled])
  {
    unint64_t v3 = CUIKBundle();
    id v4 = v3;
    id v5 = @"CANCELED";
    goto LABEL_5;
  }
  unint64_t v6 = 0;
LABEL_7:

  return v6;
}

- (UIColor)moreTextColor
{
  [(CUIKOROccurrenceState *)self isSelected];
  id v2 = [MEMORY[0x1E4FB1618] secondaryLabelColor];

  return (UIColor *)v2;
}

- (UIColor)strikethroughColor
{
  int v2 = [(CUIKOROccurrenceState *)self isSelected];

  return (UIColor *)CUIKStrikethroughColor(v2);
}

- (BOOL)requiresLanguageAwarePadding
{
  [(CUIKOROccurrenceState *)self languageAwareInsets];
  if (v3 <= 4.0) {
    return 0;
  }
  [(CUIKOROccurrenceState *)self languageAwareInsets];
  return v4 > 4.0;
}

- (double)totalLanguageAwareHeightPadding
{
  [(CUIKOROccurrenceState *)self languageAwareInsets];
  double v4 = v3;
  [(CUIKOROccurrenceState *)self languageAwareInsets];
  return (v4 + v5) * 0.5;
}

- (id)reminderIcon
{
  double v3 = [(CUIKOROccurrenceState *)self occurrence];
  double v4 = [(CUIKOROccurrenceState *)self occurrence];
  double v5 = objc_msgSend(v3, "CUIK_symbolName:", objc_msgSend(v4, "isAllDay"));

  if ([(CUIKOROccurrenceState *)self isSelected])
  {
    unint64_t v6 = [(CUIKOROccurrenceState *)self titleTextColor];
  }
  else
  {
    BOOL v7 = [(CUIKOROccurrenceState *)self drawReminderAsEditable];
    double v8 = [(CUIKOROccurrenceState *)self occurrence];
    double v9 = v8;
    if (v7) {
      objc_msgSend(v8, "CUIK_symbolColor");
    }
    else {
    unint64_t v6 = objc_msgSend(v8, "CUIK_disabledSymbolColor");
    }
  }
  if ([(CUIKOROccurrenceState *)self isReminderStack])
  {
    objc_msgSend(v6, "cuik_alphaComponent");
    uint64_t v11 = [v6 colorWithAlphaComponent:v10 * 0.2];

    unint64_t v6 = (void *)v11;
  }
  BOOL v12 = [(CUIKOROccurrenceState *)self _leadingSymbolSizeConfigurationForReminder:1];
  BOOL v13 = objc_msgSend(MEMORY[0x1E4FB1818], "cuik_systemImageNamed:withConfiguration:", v5, v12);
  int v14 = objc_msgSend(v13, "cuik_imageWithTintColor:", v6);

  return v14;
}

- (double)minimumNaturalHeightAllText
{
  +[CUIKORFontUtils minimumNaturalHeightForPrimaryTextUsingSmallText:self->_usesSmallText sizeClass:[(CUIKOROccurrenceState *)self horizontalSizeClass]];
  double v4 = v3;
  BOOL v5 = [(CUIKOROccurrenceState *)self hidesTime];
  unint64_t v6 = [(CUIKOROccurrenceState *)self location];
  uint64_t v7 = [v6 length];

  if (!v7 && v5) {
    return v4;
  }
  uint64_t v9 = 1;
  if (!v5) {
    uint64_t v9 = 2;
  }
  if (v7) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = !v5;
  }
  uint64_t v11 = [(CUIKOROccurrenceState *)self secondaryTextFont];
  double v13 = [(UIFont *)v11 cuik_lineHeight];

  return v4 + v13 * (double)v10;
}

- (double)enoughHeightForOneLine
{
  double v3 = objc_opt_class();
  double v4 = [(CUIKOROccurrenceState *)self occurrence];
  objc_msgSend(v3, "enoughHeightForOneLineForEvent:usingSmallText:sizeClass:", v4, -[CUIKOROccurrenceState usesSmallText](self, "usesSmallText"), -[CUIKOROccurrenceState horizontalSizeClass](self, "horizontalSizeClass"));
  double v6 = v5;

  return v6;
}

+ (double)enoughHeightForOneLineForEvent:(id)a3 usingSmallText:(BOOL)a4 sizeClass:(int64_t)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  +[CUIKORFontUtils minimumNaturalHeightForPrimaryTextUsingSmallText:v6 sizeClass:a5];
  double v9 = v8;
  if (([v7 isAllDay] & 1) == 0)
  {
    uint64_t v10 = [v7 startCalendarDate];
    uint64_t v11 = [v10 minute];

    if (v11)
    {
      CUIKRoundToScreenScale(0.5);
      double v9 = v9 - v12;
    }
  }
  [(id)objc_opt_class() defaultMarginFromEKDayOccurrenceView];
  double v14 = v13;
  double v16 = v15;
  [(id)objc_opt_class() defaultPaddingFromEKDayOccurrenceView];
  CUIKRoundToScreenScale(v9 + v18 + v14 + v16 + v17);
  double v20 = v19;

  return v20;
}

+ (UIEdgeInsets)defaultMarginFromEKDayOccurrenceView
{
  double v2 = 1.0;
  double v3 = 0.0;
  double v4 = 1.0;
  double v5 = 1.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

+ (UIEdgeInsets)defaultPaddingFromEKDayOccurrenceView
{
  double v2 = 3.5;
  double v3 = 5.0;
  double v4 = 0.0;
  double v5 = 2.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)primaryTextFontNonBold
{
  return [(CUIKOROccurrenceState *)self primaryTextFontBold:0];
}

- (NSString)description
{
  double v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)CUIKOROccurrenceState;
  double v4 = [(CUIKOROccurrenceState *)&v10 description];
  double v5 = [(CUIKOROccurrenceState *)self title];
  [(CUIKOROccurrenceState *)self backgroundRect];
  BOOL v6 = CUIKStringFromCGRect(v12);
  [(CUIKOROccurrenceState *)self estimatedTextFrame];
  id v7 = CUIKStringFromCGRect(v13);
  double v8 = [v3 stringWithFormat:@"%@ <title: %@, backgroundRect: %@, estimatedTextFrame: %@>", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (void)setDisplayColor:(id)a3
{
}

- (void)setEstimatedTextFrame:(CGRect)a3
{
  self->_estimatedTextFrame = a3;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

@end