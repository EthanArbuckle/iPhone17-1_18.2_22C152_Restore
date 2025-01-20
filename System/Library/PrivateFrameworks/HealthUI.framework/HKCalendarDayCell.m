@interface HKCalendarDayCell
+ (void)clearImageCache;
- (BOOL)isSelected;
- (BOOL)representsToday;
- (CALayer)circle;
- (CALayer)dayLabel;
- (CGSize)_roundedRectSizeForDayNumberString:(id)a3;
- (CGSize)circleSize;
- (HKCalendarDayCell)init;
- (HKCalendarDayCell)initWithDateCache:(id)a3;
- (HKDateCache)dateCache;
- (NSDate)date;
- (UIColor)textColor;
- (UIFont)boldFont;
- (UIFont)font;
- (double)_roundedRectCornerRadius;
- (double)dayDiameter;
- (id)_integerNumberFormatter;
- (id)_reusedImageForDateIndex:(int64_t)a3 color:(id)a4;
- (id)debugDescription;
- (int64_t)dayOfMonth;
- (void)layoutOnce;
- (void)setBoldFont:(id)a3;
- (void)setDayDiameter:(double)a3;
- (void)setFont:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setTextColor:(id)a3;
- (void)updateDateTextForDayNumber:(int64_t)a3 textColor:(id)a4;
- (void)updateWithDate:(id)a3 dayOfMonth:(int64_t)a4;
@end

@implementation HKCalendarDayCell

- (HKCalendarDayCell)initWithDateCache:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKCalendarDayCell;
  v6 = [(HKCalendarDayCell *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dateCache, a3);
    uint64_t v8 = [MEMORY[0x1E4F39BE8] layer];
    circle = v7->_circle;
    v7->_circle = (CALayer *)v8;

    [(CALayer *)v7->_circle setHidden:1];
    [(HKCalendarDayCell *)v7 addSublayer:v7->_circle];
    uint64_t v10 = [MEMORY[0x1E4F39BE8] layer];
    dayLabel = v7->_dayLabel;
    v7->_dayLabel = (CALayer *)v10;

    [(HKCalendarDayCell *)v7 addSublayer:v7->_dayLabel];
  }

  return v7;
}

- (HKCalendarDayCell)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  id v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

+ (void)clearImageCache
{
  v2 = _BoldImageCache();
  [v2 removeAllObjects];

  _NormalImageCache();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 removeAllObjects];
}

- (id)_integerNumberFormatter
{
  v2 = (void *)_integerNumberFormatter___integerNumberFormatter;
  if (!_integerNumberFormatter___integerNumberFormatter)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    uint64_t v4 = (void *)_integerNumberFormatter___integerNumberFormatter;
    _integerNumberFormatter___integerNumberFormatter = (uint64_t)v3;

    [(id)_integerNumberFormatter___integerNumberFormatter setRoundingMode:2];
    [(id)_integerNumberFormatter___integerNumberFormatter setMaximumFractionDigits:0];
    v2 = (void *)_integerNumberFormatter___integerNumberFormatter;
  }
  return v2;
}

- (id)_reusedImageForDateIndex:(int64_t)a3 color:(id)a4
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ([(HKCalendarDayCell *)self isSelected]) {
    _BoldImageCache();
  }
  else {
  v7 = _NormalImageCache();
  }
  uint64_t v8 = [MEMORY[0x1E4FB1E20] currentTraitCollection];
  v9 = [v6 resolvedColorWithTraitCollection:v8];

  uint64_t v10 = +[_HKCalendarDayCellIconConfiguration configurationWithDateIndex:color:style:](_HKCalendarDayCellIconConfiguration, "configurationWithDateIndex:color:style:", a3, v9, [v8 userInterfaceStyle]);
  v11 = [v7 objectForKey:v10];
  v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    v14 = [(HKCalendarDayCell *)self _integerNumberFormatter];
    v15 = [NSNumber numberWithInteger:a3];
    v32 = [v14 stringFromNumber:v15];

    if ([(HKCalendarDayCell *)self isSelected]) {
      [(HKCalendarDayCell *)self boldFont];
    }
    else {
    v31 = [(HKCalendarDayCell *)self font];
    }
    [(HKCalendarDayCell *)self dayDiameter];
    CGFloat v17 = v16;
    [(HKCalendarDayCell *)self dayDiameter];
    CGFloat v19 = v18;
    id v20 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v35 = *MEMORY[0x1E4FB06F8];
    uint64_t v21 = v35;
    v36[0] = v31;
    v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
    v23 = (void *)[v20 initWithString:v32 attributes:v22];

    [(HKCalendarDayCell *)self dayDiameter];
    objc_msgSend(v23, "boundingRectWithSize:options:context:", 0, 0);
    v38.width = v17;
    v38.height = v19;
    UIGraphicsBeginImageContextWithOptions(v38, 0, 0.0);
    [(HKCalendarDayCell *)self dayDiameter];
    UIRoundToViewScale();
    double v25 = v24;
    [(HKCalendarDayCell *)self dayDiameter];
    UIRoundToViewScale();
    double v27 = v26;
    uint64_t v28 = *MEMORY[0x1E4FB0700];
    v33[0] = v21;
    v33[1] = v28;
    v34[0] = v31;
    v34[1] = v9;
    v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];
    objc_msgSend(v32, "drawAtPoint:withAttributes:", v29, v25, v27);

    UIGraphicsGetImageFromCurrentImageContext();
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    [v7 setObject:v13 forKey:v10];
  }
  return v13;
}

- (void)updateWithDate:(id)a3 dayOfMonth:(int64_t)a4
{
  id v6 = (NSDate *)a3;
  [(HKCalendarDayCell *)self setHidden:0];
  date = self->_date;
  self->_date = v6;
  uint64_t v8 = v6;

  self->_dayOfMonth = a4;
  LOBYTE(a4) = [(HKDateCache *)self->_dateCache isDateInToday:v8];

  self->_representsToday = a4;
}

- (void)updateDateTextForDayNumber:(int64_t)a3 textColor:(id)a4
{
  id v5 = [(HKCalendarDayCell *)self _reusedImageForDateIndex:a3 color:a4];
  dayLabel = self->_dayLabel;
  id v7 = v5;
  -[CALayer setContents:](dayLabel, "setContents:", [v7 CGImage]);
}

- (void)setDayDiameter:(double)a3
{
  self->_dayDiameter = a3;
  [(HKCalendarDayCell *)self layoutOnce];
}

- (void)layoutOnce
{
  [(HKCalendarDayCell *)self dayDiameter];
  double v4 = v3;
  double v5 = v3 + -1.0;
  [(HKCalendarDayCell *)self dayDiameter];
  UIRoundToViewScale();
  double v7 = v6;
  BOOL IsLargerThanSizeCategory = HKUIApplicationContentSizeCategoryIsLargerThanSizeCategory((void *)*MEMORY[0x1E4FB27D0]);
  circle = self->_circle;
  if (IsLargerThanSizeCategory) {
    [(HKCalendarDayCell *)self _roundedRectCornerRadius];
  }
  else {
    double v10 = v5 * 0.5;
  }
  [(CALayer *)circle setCornerRadius:v10];
  -[CALayer setFrame:](self->_circle, "setFrame:", 0.0, 0.0, v4 + -1.0, v4 + -1.0);
  -[CALayer setPosition:](self->_circle, "setPosition:", v7, v7);
  dayLabel = self->_dayLabel;
  -[CALayer setFrame:](dayLabel, "setFrame:", 0.0, 0.0, v4, v4);
}

- (double)_roundedRectCornerRadius
{
  [(HKCalendarDayCell *)self dayDiameter];
  v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v2 scale];
  UIRoundToScale();
  double v4 = v3;

  return v4;
}

- (CGSize)circleSize
{
  if (HKUIApplicationContentSizeCategoryIsLargerThanSizeCategory((void *)*MEMORY[0x1E4FB27D0]))
  {
    double v3 = objc_msgSend(NSNumber, "numberWithInteger:", -[HKCalendarDayCell dayOfMonth](self, "dayOfMonth"));
    double v4 = [v3 stringValue];
    [(HKCalendarDayCell *)self _roundedRectSizeForDayNumberString:v4];
    double v6 = v5;
    double v8 = v7;

    double v9 = v6;
    double v10 = v8;
  }
  else
  {
    [(HKCalendarDayCell *)self dayDiameter];
    double v12 = v11 + -1.0;
    [(HKCalendarDayCell *)self dayDiameter];
    double v10 = v13 + -1.0;
    double v9 = v12;
  }
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGSize)_roundedRectSizeForDayNumberString:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(HKCalendarDayCell *)self dayDiameter];
  double v6 = v5 + -1.0;
  [(HKCalendarDayCell *)self dayDiameter];
  double v8 = v7;
  uint64_t v16 = *MEMORY[0x1E4FB06F8];
  double v9 = [(HKCalendarDayCell *)self boldFont];
  v17[0] = v9;
  double v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  [v4 sizeWithAttributes:v10];
  double v12 = v11;

  double v13 = v12 + 4.0;
  if (v6 >= v13) {
    double v14 = v6;
  }
  else {
    double v14 = v13;
  }
  double v15 = v8 + -1.0;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
  {
    self->_selected = a3;
    BOOL v5 = !a3;
    double v6 = [(HKCalendarDayCell *)self circle];
    [v6 setHidden:v5];

    if (a3) {
      [MEMORY[0x1E4FB1618] whiteColor];
    }
    else {
    id v7 = [(HKCalendarDayCell *)self textColor];
    }
    [(HKCalendarDayCell *)self updateDateTextForDayNumber:[(HKCalendarDayCell *)self dayOfMonth] textColor:v7];
  }
}

- (id)debugDescription
{
  v8.receiver = self;
  v8.super_class = (Class)HKCalendarDayCell;
  double v3 = [(HKCalendarDayCell *)&v8 debugDescription];
  id v4 = (void *)MEMORY[0x1E4F28C10];
  BOOL v5 = [(HKCalendarDayCell *)self date];
  double v6 = [v4 localizedStringFromDate:v5 dateStyle:2 timeStyle:0];

  objc_msgSend(v3, "deleteCharactersInRange:", objc_msgSend(v3, "length") - 1, 1);
  [v3 appendFormat:@"date: %@; > ", v6];

  return v3;
}

- (HKDateCache)dateCache
{
  return self->_dateCache;
}

- (CALayer)circle
{
  return self->_circle;
}

- (CALayer)dayLabel
{
  return self->_dayLabel;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
}

- (UIFont)boldFont
{
  return self->_boldFont;
}

- (void)setBoldFont:(id)a3
{
}

- (double)dayDiameter
{
  return self->_dayDiameter;
}

- (NSDate)date
{
  return self->_date;
}

- (int64_t)dayOfMonth
{
  return self->_dayOfMonth;
}

- (BOOL)representsToday
{
  return self->_representsToday;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_boldFont, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_dayLabel, 0);
  objc_storeStrong((id *)&self->_circle, 0);
  objc_storeStrong((id *)&self->_dateCache, 0);
}

@end