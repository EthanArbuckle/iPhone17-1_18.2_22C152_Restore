@interface AVMediaTimelineControlLabelsConfiguration
+ (id)_defaultFont;
+ (id)_defaultTextColor;
+ (id)belowConfiguration;
+ (id)hiddenConfiguration;
+ (id)inlineConfiguration;
- (UIColor)textColor;
- (UIFont)textFont;
- (double)extendedDynamicRangeGain;
- (id)copyWithZone:(_NSZone *)a3;
- (id)textCompositingFilter;
- (unint64_t)labelsStyle;
- (void)setExtendedDynamicRangeGain:(double)a3;
- (void)setLabelsStyle:(unint64_t)a3;
- (void)setTextColor:(id)a3;
- (void)setTextCompositingFilter:(id)a3;
- (void)setTextFont:(id)a3;
@end

@implementation AVMediaTimelineControlLabelsConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textFont, 0);
  objc_storeStrong((id *)&self->_textColor, 0);

  objc_storeStrong((id *)&self->_textCompositingFilter, 0);
}

- (void)setTextFont:(id)a3
{
}

- (UIFont)textFont
{
  return self->_textFont;
}

- (void)setTextColor:(id)a3
{
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setLabelsStyle:(unint64_t)a3
{
  self->_labelsStyle = a3;
}

- (unint64_t)labelsStyle
{
  return self->_labelsStyle;
}

- (void)setExtendedDynamicRangeGain:(double)a3
{
  self->_extendedDynamicRangeGain = a3;
}

- (double)extendedDynamicRangeGain
{
  return self->_extendedDynamicRangeGain;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(AVMediaTimelineControlLabelsConfiguration);
  [(AVMediaTimelineControlLabelsConfiguration *)v4 setExtendedDynamicRangeGain:self->_extendedDynamicRangeGain];
  [(AVMediaTimelineControlLabelsConfiguration *)v4 setTextFont:self->_textFont];
  [(AVMediaTimelineControlLabelsConfiguration *)v4 setTextColor:self->_textColor];
  [(AVMediaTimelineControlLabelsConfiguration *)v4 setTextCompositingFilter:self->_textCompositingFilter];
  [(AVMediaTimelineControlLabelsConfiguration *)v4 setLabelsStyle:[(AVMediaTimelineControlLabelsConfiguration *)self labelsStyle]];
  return v4;
}

- (void)setTextCompositingFilter:(id)a3
{
  if (self->_textCompositingFilter != a3)
  {
    v4 = (NSString *)[a3 copy];
    textCompositingFilter = self->_textCompositingFilter;
    self->_textCompositingFilter = v4;
    MEMORY[0x1F41817F8](v4, textCompositingFilter);
  }
}

- (id)textCompositingFilter
{
  v2 = (void *)[(NSString *)self->_textCompositingFilter copy];

  return v2;
}

+ (id)inlineConfiguration
{
  v2 = objc_alloc_init(AVMediaTimelineControlLabelsConfiguration);
  [(AVMediaTimelineControlLabelsConfiguration *)v2 setLabelsStyle:0];
  v3 = +[AVMediaTimelineControlLabelsConfiguration _defaultFont];
  [(AVMediaTimelineControlLabelsConfiguration *)v2 setTextFont:v3];

  v4 = +[AVMediaTimelineControlLabelsConfiguration _defaultTextColor];
  [(AVMediaTimelineControlLabelsConfiguration *)v2 setTextColor:v4];

  return v2;
}

+ (id)belowConfiguration
{
  v2 = objc_alloc_init(AVMediaTimelineControlLabelsConfiguration);
  [(AVMediaTimelineControlLabelsConfiguration *)v2 setLabelsStyle:1];
  v3 = +[AVMediaTimelineControlLabelsConfiguration _defaultFont];
  [(AVMediaTimelineControlLabelsConfiguration *)v2 setTextFont:v3];

  v4 = +[AVMediaTimelineControlLabelsConfiguration _defaultTextColor];
  [(AVMediaTimelineControlLabelsConfiguration *)v2 setTextColor:v4];

  return v2;
}

+ (id)hiddenConfiguration
{
  v2 = objc_alloc_init(AVMediaTimelineControlLabelsConfiguration);
  [(AVMediaTimelineControlLabelsConfiguration *)v2 setLabelsStyle:2];
  v3 = +[AVMediaTimelineControlLabelsConfiguration _defaultFont];
  [(AVMediaTimelineControlLabelsConfiguration *)v2 setTextFont:v3];

  v4 = +[AVMediaTimelineControlLabelsConfiguration _defaultTextColor];
  [(AVMediaTimelineControlLabelsConfiguration *)v2 setTextColor:v4];

  return v2;
}

+ (id)_defaultTextColor
{
  return (id)[MEMORY[0x1E4FB1618] whiteColor];
}

+ (id)_defaultFont
{
  v2 = (void *)MEMORY[0x1E4FB08E0];
  v3 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28E0]];
  v4 = [v2 timeFontWithFont:v3];

  return v4;
}

@end