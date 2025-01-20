@interface DoseContent
- (BOOL)isEnabled;
- (NSString)classificationImageName;
- (NSString)classifierContent;
- (NSString)levelContentLong;
- (NSString)levelContentShort;
- (UIColor)imageTintColor;
- (UIColor)tintColor;
- (float)fastLeq;
- (float)gaugeFillValue;
- (float)slowLeq;
- (void)setClassificationImageName:(id)a3;
- (void)setClassifierContent:(id)a3;
- (void)setFastLeq:(float)a3;
- (void)setGaugeFillValue:(float)a3;
- (void)setImageTintColor:(id)a3;
- (void)setIsEnabled:(BOOL)a3;
- (void)setLevelContentLong:(id)a3;
- (void)setLevelContentShort:(id)a3;
- (void)setSlowLeq:(float)a3;
- (void)setTintColor:(id)a3;
@end

@implementation DoseContent

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
}

- (float)slowLeq
{
  return self->_slowLeq;
}

- (void)setSlowLeq:(float)a3
{
  self->_slowLeq = a3;
}

- (float)fastLeq
{
  return self->_fastLeq;
}

- (void)setFastLeq:(float)a3
{
  self->_fastLeq = a3;
}

- (float)gaugeFillValue
{
  return self->_gaugeFillValue;
}

- (void)setGaugeFillValue:(float)a3
{
  self->_gaugeFillValue = a3;
}

- (NSString)levelContentShort
{
  return self->_levelContentShort;
}

- (void)setLevelContentShort:(id)a3
{
}

- (NSString)levelContentLong
{
  return self->_levelContentLong;
}

- (void)setLevelContentLong:(id)a3
{
}

- (NSString)classifierContent
{
  return self->_classifierContent;
}

- (void)setClassifierContent:(id)a3
{
}

- (NSString)classificationImageName
{
  return self->_classificationImageName;
}

- (void)setClassificationImageName:(id)a3
{
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
}

- (UIColor)imageTintColor
{
  return self->_imageTintColor;
}

- (void)setImageTintColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageTintColor, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_classificationImageName, 0);
  objc_storeStrong((id *)&self->_classifierContent, 0);
  objc_storeStrong((id *)&self->_levelContentLong, 0);

  objc_storeStrong((id *)&self->_levelContentShort, 0);
}

@end