@interface CSLUICalendarIconLayoutItem
+ (id)calendarIconLayoutModelForIconDiameter:(double)a3;
- (CGSize)size;
- (UIFont)dateFont;
- (UIFont)dayFont;
- (double)dateBaselineFromOriginY;
- (double)dayBaselineFromOriginY;
- (double)dayHorizontalOffset;
- (void)setDateBaselineFromOriginY:(double)a3;
- (void)setDateFont:(id)a3;
- (void)setDayBaselineFromOriginY:(double)a3;
- (void)setDayFont:(id)a3;
- (void)setDayHorizontalOffset:(double)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation CSLUICalendarIconLayoutItem

+ (id)calendarIconLayoutModelForIconDiameter:(double)a3
{
  v4 = +[NSLocale currentLocale];
  v5 = [v4 objectForKey:NSLocaleLanguageCode];
  if ([v5 isEqualToString:@"ar"])
  {
    double v6 = UIFontWeightRegular;
    double v7 = -3.0;
    double v8 = 30.5;
    double v9 = 36.0;
  }
  else
  {
    unsigned int v10 = [v5 isEqualToString:@"th"];
    if (v10) {
      double v6 = UIFontWeightRegular;
    }
    else {
      double v6 = UIFontWeightMedium;
    }
    if (v10) {
      double v8 = 29.0;
    }
    else {
      double v8 = 22.0;
    }
    double v9 = 31.0;
    double v7 = 0.0;
  }
  if (a3 <= 0.0)
  {
    double v13 = 108.0;
    double v14 = 63.0;
    double v15 = 53.5;
  }
  else
  {
    double v11 = a3 / 108.0;
    UIRoundToScreenScale();
    double v13 = v12;
    double v8 = a3 / 108.0 * v8;
    double v14 = a3 / 108.0 * 63.0;
    double v9 = v11 * v9;
    double v15 = v11 * 53.5;
    double v7 = v11 * v7;
  }
  v16 = objc_opt_new();
  objc_msgSend(v16, "setSize:", v13, v13);
  v17 = +[UIFont systemFontOfSize:v8 weight:v6];
  [v16 setDayFont:v17];

  v18 = +[UIFont systemFontOfSize:v14 weight:UIFontWeightLight];
  v19 = [v18 fontDescriptor];

  UIFontDescriptorAttributeName v29 = UIFontDescriptorFeatureSettingsAttribute;
  v26[0] = UIFontFeatureTypeIdentifierKey;
  v26[1] = UIFontFeatureSelectorIdentifierKey;
  v27[0] = &off_3E130;
  v27[1] = &off_3E148;
  v20 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
  v28 = v20;
  v21 = +[NSArray arrayWithObjects:&v28 count:1];
  v30 = v21;
  v22 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];

  v23 = [v19 fontDescriptorByAddingAttributes:v22];
  v24 = +[UIFont fontWithDescriptor:v23 size:0.0];

  [v16 setDateFont:v24];
  [v16 setDayBaselineFromOriginY:v9];
  [v16 setDateBaselineFromOriginY:v15 + v9];
  [v16 setDayHorizontalOffset:v7];

  return v16;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (UIFont)dayFont
{
  return self->_dayFont;
}

- (void)setDayFont:(id)a3
{
}

- (UIFont)dateFont
{
  return self->_dateFont;
}

- (void)setDateFont:(id)a3
{
}

- (double)dayBaselineFromOriginY
{
  return self->_dayBaselineFromOriginY;
}

- (void)setDayBaselineFromOriginY:(double)a3
{
  self->_dayBaselineFromOriginY = a3;
}

- (double)dateBaselineFromOriginY
{
  return self->_dateBaselineFromOriginY;
}

- (void)setDateBaselineFromOriginY:(double)a3
{
  self->_dateBaselineFromOriginY = a3;
}

- (double)dayHorizontalOffset
{
  return self->_dayHorizontalOffset;
}

- (void)setDayHorizontalOffset:(double)a3
{
  self->_dayHorizontalOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFont, 0);

  objc_storeStrong((id *)&self->_dayFont, 0);
}

@end