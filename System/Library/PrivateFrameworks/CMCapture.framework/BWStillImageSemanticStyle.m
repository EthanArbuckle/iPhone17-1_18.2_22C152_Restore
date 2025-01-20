@interface BWStillImageSemanticStyle
- (BWStillImageSemanticStyle)initWithSemanticStyle:(id)a3;
- (float)toneBias;
- (float)warmthBias;
- (void)setToneBias:(float)a3;
- (void)setWarmthBias:(float)a3;
@end

@implementation BWStillImageSemanticStyle

- (BWStillImageSemanticStyle)initWithSemanticStyle:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BWStillImageSemanticStyle;
  v4 = [(BWStillImageSemanticStyle *)&v8 init];
  if (v4)
  {
    [a3 mappedToneBias];
    v4->_toneBias = v5;
    [a3 mappedWarmthBias];
    v4->_warmthBias = v6;
  }
  return v4;
}

- (float)toneBias
{
  return self->_toneBias;
}

- (void)setToneBias:(float)a3
{
  self->_toneBias = a3;
}

- (float)warmthBias
{
  return self->_warmthBias;
}

- (void)setWarmthBias:(float)a3
{
  self->_warmthBias = a3;
}

@end