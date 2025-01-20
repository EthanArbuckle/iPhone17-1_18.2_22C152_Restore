@interface BWStillImageSmartStyle
- (BWStillImageSmartStyle)initWithSmartStyle:(id)a3;
- (NSString)cast;
- (float)colorBias;
- (float)intensity;
- (float)toneBias;
- (void)dealloc;
- (void)setCast:(id)a3;
- (void)setColorBias:(float)a3;
- (void)setIntensity:(float)a3;
- (void)setToneBias:(float)a3;
@end

@implementation BWStillImageSmartStyle

- (BWStillImageSmartStyle)initWithSmartStyle:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)BWStillImageSmartStyle;
  v4 = [(BWStillImageSmartStyle *)&v9 init];
  if (v4)
  {
    v4->_cast = (NSString *)objc_msgSend((id)objc_msgSend(a3, "cast"), "copy");
    [a3 intensity];
    v4->_intensity = v5;
    [a3 toneBias];
    v4->_toneBias = v6;
    [a3 colorBias];
    v4->_colorBias = v7;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWStillImageSmartStyle;
  [(BWStillImageSmartStyle *)&v3 dealloc];
}

- (NSString)cast
{
  return self->_cast;
}

- (void)setCast:(id)a3
{
}

- (float)intensity
{
  return self->_intensity;
}

- (void)setIntensity:(float)a3
{
  self->_intensity = a3;
}

- (float)toneBias
{
  return self->_toneBias;
}

- (void)setToneBias:(float)a3
{
  self->_toneBias = a3;
}

- (float)colorBias
{
  return self->_colorBias;
}

- (void)setColorBias:(float)a3
{
  self->_colorBias = a3;
}

@end