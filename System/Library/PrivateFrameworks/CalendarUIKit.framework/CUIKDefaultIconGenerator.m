@interface CUIKDefaultIconGenerator
+ (BOOL)_isNonRedDayOfWeekRequiredForLocale:(id)a3;
+ (id)_countriesRequiringNonRedDayOfWeek;
+ (id)_dateNameFromDateComponents:(id)a3 calendar:(id)a4 type:(int64_t)a5 forceAbbreviated:(BOOL)a6;
+ (id)_dayNumberStringFromDateComponents:(id)a3 calendar:(id)a4;
- (CGImage)iconImageWithDateComponents:(id)a3 calendar:(id)a4 format:(int64_t)a5 size:(CGSize)a6 scale:(double)a7 appearance:(int64_t)a8;
- (CGSize)canvasSize;
- (CUIKDefaultIconGenerator)initWithForceNoTextEffects:(BOOL)a3;
- (NSCalendar)calendar;
- (NSDateComponents)dateComponents;
- (double)_roundSpecToActual:(double)a3;
- (double)canvasScale;
- (id)_colorForDayNumberWithAppearance:(int64_t)a3;
- (id)_colorForDayOfWeekWithAppearance:(int64_t)a3;
- (id)_dateNameFont;
- (id)_dayNumberFont;
- (id)_iconBlackColor;
- (int64_t)appearance;
- (int64_t)iconFormat;
- (void)_drawBackground;
- (void)_drawDateName;
- (void)_drawDayNumber;
@end

@implementation CUIKDefaultIconGenerator

- (CUIKDefaultIconGenerator)initWithForceNoTextEffects:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CUIKDefaultIconGenerator;
  return [(CUIKDefaultIconGenerator *)&v4 init];
}

- (CGImage)iconImageWithDateComponents:(id)a3 calendar:(id)a4 format:(int64_t)a5 size:(CGSize)a6 scale:(double)a7 appearance:(int64_t)a8
{
  double height = a6.height;
  double width = a6.width;
  id v16 = a3;
  id v17 = a4;
  self->_canvasSize.double width = width;
  self->_canvasSize.double height = height;
  self->_canvasScale = a7;
  self->_iconFormat = a5;
  self->_appearance = a8;
  if (!v16)
  {
    v18 = +[CUIKLogSubsystem defaultCategory];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[CUIKDefaultIconGenerator iconImageWithDateComponents:calendar:format:size:scale:appearance:]();
    }
    goto LABEL_10;
  }
  objc_storeStrong((id *)&self->_dateComponents, a3);
  if (!v17)
  {
    v18 = +[CUIKLogSubsystem defaultCategory];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[CUIKDefaultIconGenerator iconImageWithDateComponents:calendar:format:size:scale:appearance:]();
    }
LABEL_10:
    v22 = 0;
    goto LABEL_11;
  }
  objc_storeStrong((id *)&self->_calendar, a4);
  v18 = objc_alloc_init(MEMORY[0x1E4FB17E0]);
  [v18 setScale:a7];
  [v18 setOpaque:1];
  v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithBounds:format:", v18, 0.0, 0.0, width, height);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __94__CUIKDefaultIconGenerator_iconImageWithDateComponents_calendar_format_size_scale_appearance___block_invoke;
  v24[3] = &unk_1E636AF68;
  v24[4] = self;
  id v20 = [v19 imageWithActions:v24];
  v21 = (CGImage *)[v20 CGImage];
  v22 = v21;
  if (v21) {
    CFRetain(v21);
  }

LABEL_11:
  return v22;
}

uint64_t __94__CUIKDefaultIconGenerator_iconImageWithDateComponents_calendar_format_size_scale_appearance___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _drawBackground];
  [*(id *)(a1 + 32) _drawDayNumber];
  v2 = *(void **)(a1 + 32);

  return [v2 _drawDateName];
}

- (void)_drawBackground
{
  v19[2] = *MEMORY[0x1E4F143B8];
  CurrentContext = UIGraphicsGetCurrentContext();
  CGFloat width = self->_canvasSize.width;
  CGFloat height = self->_canvasSize.height;
  int64_t appearance = self->_appearance;
  if (appearance == 1)
  {
    v12 = [MEMORY[0x1E4FB1618] colorWithRed:0.192156863 green:0.192156863 blue:0.192156863 alpha:1.0];
    v13 = [MEMORY[0x1E4FB1618] colorWithRed:0.0784313725 green:0.0784313725 blue:0.0784313725 alpha:1.0];
    id v14 = v12;
    v19[0] = [v14 CGColor];
    id v15 = v13;
    v19[1] = [v15 CGColor];
    CFArrayRef v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    id v17 = CGGradientCreateWithColors(0, v16, 0);
    v23.origin.x = 0.0;
    v23.origin.y = 0.0;
    v23.size.CGFloat width = width;
    v23.size.CGFloat height = height;
    CGFloat MinY = CGRectGetMinY(v23);
    v24.origin.x = 0.0;
    v24.origin.y = 0.0;
    v24.size.CGFloat width = width;
    v24.size.CGFloat height = height;
    v22.y = CGRectGetMaxY(v24);
    v21.x = 0.0;
    v22.x = 0.0;
    v21.y = MinY;
    CGContextDrawLinearGradient(CurrentContext, v17, v21, v22, 0);
    CGGradientRelease(v17);
  }
  else if (!appearance)
  {
    v7 = [MEMORY[0x1E4FB1618] systemWhiteColor];
    [v7 setFill];

    uint64_t v8 = 0;
    uint64_t v9 = 0;
    CGFloat v10 = width;
    CGFloat v11 = height;
    CGContextFillRect(CurrentContext, *(CGRect *)&v8);
  }
}

+ (id)_dayNumberStringFromDateComponents:(id)a3 calendar:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 day] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = +[CUIKLogSubsystem defaultCategory];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[CUIKDefaultIconGenerator _dayNumberStringFromDateComponents:calendar:]();
    }

    uint64_t v8 = 0;
  }
  else
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    CGFloat v10 = [v6 locale];
    [v9 setLocale:v10];

    uint64_t v11 = [v5 day];
    v12 = [NSNumber numberWithInteger:v11];
    uint64_t v8 = [v9 stringFromNumber:v12];
  }

  return v8;
}

- (void)_drawDayNumber
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  objc_super v4 = [a1 dateComponents];
  id v5 = [a1 calendar];
  int v6 = 138412546;
  v7 = v4;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl(&dword_1BDF08000, a2, OS_LOG_TYPE_ERROR, "Day number string is nil or empty from date components: %@, calendar: %@.", (uint8_t *)&v6, 0x16u);
}

+ (id)_dateNameFromDateComponents:(id)a3 calendar:(id)a4 type:(int64_t)a5 forceAbbreviated:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = +[CUIKApplicationIconUtilities dateFormatterWithCalendar:v10];
  [v11 setFormattingContext:2];
  if (a5 == 1)
  {
    if ([v9 month] == 0x7FFFFFFFFFFFFFFFLL)
    {
      v12 = +[CUIKLogSubsystem defaultCategory];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        +[CUIKDefaultIconGenerator _dateNameFromDateComponents:calendar:type:forceAbbreviated:]();
      }
LABEL_8:

      v13 = 0;
      goto LABEL_17;
    }
    id v14 = [v11 shortStandaloneMonthSymbols];
    id v15 = objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v9, "month") - 1);
    CFArrayRef v16 = [v10 locale];
    v13 = [v15 uppercaseStringWithLocale:v16];
  }
  else
  {
    if ([v9 weekday] == 0x7FFFFFFFFFFFFFFFLL)
    {
      v12 = +[CUIKLogSubsystem defaultCategory];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        +[CUIKDefaultIconGenerator _dateNameFromDateComponents:calendar:type:forceAbbreviated:]();
      }
      goto LABEL_8;
    }
    id v17 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v14 = [v17 localizedStringForKey:@"ccc" value:&stru_1F187C430 table:0];

    if (([v14 isEqualToString:@"ccc"] & 1) != 0 || v6)
    {
      v18 = [v11 shortStandaloneWeekdaySymbols];
    }
    else
    {
      v18 = [v11 standaloneWeekdaySymbols];
    }
    CFArrayRef v16 = v18;
    v13 = objc_msgSend(v18, "objectAtIndexedSubscript:", objc_msgSend(v9, "weekday") - 1);
    v19 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v15 = [v19 localizedStringForKey:@"icon_weekday_force_uppercase" value:@"1" table:0];

    if ([v15 isEqualToString:@"1"])
    {
      id v20 = [v10 locale];
      uint64_t v21 = [v13 uppercaseStringWithLocale:v20];

      v13 = (void *)v21;
    }
  }

LABEL_17:

  return v13;
}

- (void)_drawDateName
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  objc_super v4 = [a1 dateComponents];
  id v5 = [a1 calendar];
  BOOL v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "iconFormat"));
  int v7 = 138412802;
  __int16 v8 = v4;
  __int16 v9 = 2112;
  id v10 = v5;
  __int16 v11 = 2112;
  v12 = v6;
  _os_log_error_impl(&dword_1BDF08000, a2, OS_LOG_TYPE_ERROR, "Date name string is nil or empty from date components: %@, calendar: %@, type: %@", (uint8_t *)&v7, 0x20u);
}

- (double)_roundSpecToActual:(double)a3
{
  [(CUIKDefaultIconGenerator *)self canvasSize];
  return v4 * 0.0009765625 * a3;
}

- (id)_dateNameFont
{
  v2 = (void *)MEMORY[0x1E4FB08E0];
  [(CUIKDefaultIconGenerator *)self _roundSpecToActual:200.0];

  return (id)objc_msgSend(v2, "systemFontOfSize:weight:");
}

- (id)_dayNumberFont
{
  v3 = [MEMORY[0x1E4F1CA20] currentLocale];
  double v4 = [v3 objectForKey:*MEMORY[0x1E4F1C438]];

  if ([v4 isEqual:@"ml"])
  {
    id v5 = CUIKLocalizedStringForInteger(1uLL);
    int v6 = [v5 isEqual:@"൧"];

    double v7 = 642.0;
    if (v6) {
      double v7 = 500.0;
    }
  }
  else
  {
    double v7 = 642.0;
  }
  __int16 v8 = (void *)MEMORY[0x1E4FB08E0];
  [(CUIKDefaultIconGenerator *)self _roundSpecToActual:v7];
  __int16 v9 = objc_msgSend(v8, "systemFontOfSize:weight:");

  return v9;
}

- (id)_iconBlackColor
{
  return (id)[MEMORY[0x1E4FB1618] colorWithRed:0.149019608 green:0.149019608 blue:0.149019608 alpha:1.0];
}

- (id)_colorForDayOfWeekWithAppearance:(int64_t)a3
{
  id v5 = [(CUIKDefaultIconGenerator *)self calendar];
  int v6 = [v5 locale];

  int v7 = [(id)objc_opt_class() _isNonRedDayOfWeekRequiredForLocale:v6];
  if (a3 == 2)
  {
    uint64_t v8 = [MEMORY[0x1E4FB1618] colorWithRed:0.819607843 green:0.819607843 blue:0.819607843 alpha:1.0];
    goto LABEL_13;
  }
  if (a3 == 1)
  {
    if (v7)
    {
      uint64_t v8 = [MEMORY[0x1E4FB1618] systemWhiteColor];
      goto LABEL_13;
    }
    id v10 = (void *)MEMORY[0x1E4FB1618];
LABEL_12:
    uint64_t v8 = [v10 systemRedColor];
    goto LABEL_13;
  }
  if (a3)
  {
    __int16 v9 = 0;
    goto LABEL_14;
  }
  if (!v7)
  {
    id v10 = (void *)MEMORY[0x1E4FB1618];
    goto LABEL_12;
  }
  uint64_t v8 = [(CUIKDefaultIconGenerator *)self _iconBlackColor];
LABEL_13:
  __int16 v9 = (void *)v8;
LABEL_14:

  return v9;
}

- (id)_colorForDayNumberWithAppearance:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 2)
  {
    if (a3)
    {
      v3 = 0;
    }
    else
    {
      v3 = [(CUIKDefaultIconGenerator *)self _iconBlackColor];
    }
  }
  else
  {
    v3 = [MEMORY[0x1E4FB1618] systemWhiteColor];
  }

  return v3;
}

+ (id)_countriesRequiringNonRedDayOfWeek
{
  if (_countriesRequiringNonRedDayOfWeek_onceToken != -1) {
    dispatch_once(&_countriesRequiringNonRedDayOfWeek_onceToken, &__block_literal_global_26);
  }
  v2 = (void *)_countriesRequiringNonRedDayOfWeek_countries;

  return v2;
}

void __62__CUIKDefaultIconGenerator__countriesRequiringNonRedDayOfWeek__block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"JP", @"KR", 0);
  v1 = (void *)_countriesRequiringNonRedDayOfWeek_countries;
  _countriesRequiringNonRedDayOfWeek_countries = v0;
}

+ (BOOL)_isNonRedDayOfWeekRequiredForLocale:(id)a3
{
  v3 = [a3 objectForKey:*MEMORY[0x1E4F1C400]];
  double v4 = [(id)objc_opt_class() _countriesRequiringNonRedDayOfWeek];
  char v5 = [v4 containsObject:v3];

  return v5;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (NSDateComponents)dateComponents
{
  return self->_dateComponents;
}

- (int64_t)iconFormat
{
  return self->_iconFormat;
}

- (int64_t)appearance
{
  return self->_appearance;
}

- (CGSize)canvasSize
{
  double width = self->_canvasSize.width;
  double height = self->_canvasSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)canvasScale
{
  return self->_canvasScale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateComponents, 0);

  objc_storeStrong((id *)&self->_calendar, 0);
}

- (void)iconImageWithDateComponents:calendar:format:size:scale:appearance:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1BDF08000, v0, v1, "Error: expects a nonnull dateComponents", v2, v3, v4, v5, v6);
}

- (void)iconImageWithDateComponents:calendar:format:size:scale:appearance:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1BDF08000, v0, v1, "Error: expects a nonnull calendar", v2, v3, v4, v5, v6);
}

+ (void)_dayNumberStringFromDateComponents:calendar:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1BDF08000, v0, v1, "Error: dateComponents has not been provided a day value to generate dayNumberString", v2, v3, v4, v5, v6);
}

+ (void)_dateNameFromDateComponents:calendar:type:forceAbbreviated:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1BDF08000, v0, v1, "Error: dateComponents has not been provided a month value to generate a string representation", v2, v3, v4, v5, v6);
}

+ (void)_dateNameFromDateComponents:calendar:type:forceAbbreviated:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1BDF08000, v0, v1, "Error: dateComponents has not been provided a weekday value to generate a string representation", v2, v3, v4, v5, v6);
}

@end