@interface AVMediaTimelineControlConfiguration
+ (id)defaultConfiguration;
- (AVMediaTimelineControlLabelsConfiguration)labelsConfiguration;
- (UIVisualEffect)currentValueVisualEffect;
- (UIVisualEffect)maxValueVisualEffect;
- (double)extendedDynamicRangeGain;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setCurrentValueVisualEffect:(id)a3;
- (void)setExtendedDynamicRangeGain:(double)a3;
- (void)setLabelsConfiguration:(id)a3;
- (void)setMaxValueVisualEffect:(id)a3;
@end

@implementation AVMediaTimelineControlConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxValueVisualEffect, 0);
  objc_storeStrong((id *)&self->_currentValueVisualEffect, 0);

  objc_storeStrong((id *)&self->_labelsConfiguration, 0);
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
  v4 = objc_alloc_init(AVMediaTimelineControlConfiguration);
  [(AVMediaTimelineControlConfiguration *)self extendedDynamicRangeGain];
  -[AVMediaTimelineControlConfiguration setExtendedDynamicRangeGain:](v4, "setExtendedDynamicRangeGain:");
  v5 = [(AVMediaTimelineControlConfiguration *)self labelsConfiguration];
  [(AVMediaTimelineControlConfiguration *)v4 setLabelsConfiguration:v5];

  v6 = [(AVMediaTimelineControlConfiguration *)self currentValueVisualEffect];
  [(AVMediaTimelineControlConfiguration *)v4 setCurrentValueVisualEffect:v6];

  v7 = [(AVMediaTimelineControlConfiguration *)self maxValueVisualEffect];
  [(AVMediaTimelineControlConfiguration *)v4 setMaxValueVisualEffect:v7];

  return v4;
}

- (UIVisualEffect)maxValueVisualEffect
{
  v2 = (void *)[(UIVisualEffect *)self->_maxValueVisualEffect copy];

  return (UIVisualEffect *)v2;
}

- (void)setMaxValueVisualEffect:(id)a3
{
  v5 = (UIVisualEffect *)a3;
  maxValueVisualEffect = self->_maxValueVisualEffect;
  p_maxValueVisualEffect = &self->_maxValueVisualEffect;
  if (maxValueVisualEffect != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_maxValueVisualEffect, a3);
    v5 = v8;
  }
}

- (UIVisualEffect)currentValueVisualEffect
{
  v2 = (void *)[(UIVisualEffect *)self->_currentValueVisualEffect copy];

  return (UIVisualEffect *)v2;
}

- (void)setCurrentValueVisualEffect:(id)a3
{
  v5 = (UIVisualEffect *)a3;
  currentValueVisualEffect = self->_currentValueVisualEffect;
  p_currentValueVisualEffect = &self->_currentValueVisualEffect;
  if (currentValueVisualEffect != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_currentValueVisualEffect, a3);
    v5 = v8;
  }
}

- (AVMediaTimelineControlLabelsConfiguration)labelsConfiguration
{
  v2 = (void *)[(AVMediaTimelineControlLabelsConfiguration *)self->_labelsConfiguration copy];

  return (AVMediaTimelineControlLabelsConfiguration *)v2;
}

- (void)setLabelsConfiguration:(id)a3
{
  if (self->_labelsConfiguration != a3)
  {
    v4 = (AVMediaTimelineControlLabelsConfiguration *)[a3 copy];
    labelsConfiguration = self->_labelsConfiguration;
    self->_labelsConfiguration = v4;
    MEMORY[0x1F41817F8](v4, labelsConfiguration);
  }
}

+ (id)defaultConfiguration
{
  v2 = objc_alloc_init(AVMediaTimelineControlConfiguration);
  v3 = +[AVMediaTimelineControlLabelsConfiguration inlineConfiguration];
  [(AVMediaTimelineControlConfiguration *)v2 setLabelsConfiguration:v3];
  v4 = [MEMORY[0x1E4FB14C8] effectWithStyle:11];
  [(AVMediaTimelineControlConfiguration *)v2 setCurrentValueVisualEffect:v4];

  v5 = [MEMORY[0x1E4FB14C8] effectWithStyle:14];
  [(AVMediaTimelineControlConfiguration *)v2 setMaxValueVisualEffect:v5];

  return v2;
}

@end