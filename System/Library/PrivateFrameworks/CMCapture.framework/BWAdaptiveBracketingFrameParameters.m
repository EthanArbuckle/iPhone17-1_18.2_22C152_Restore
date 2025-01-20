@interface BWAdaptiveBracketingFrameParameters
+ (id)frameParametersWithIntegrationTimeInMicroseconds:(int)a3 gain:(float)a4 maxAGC:(int)a5;
+ (id)frameParametersWithIntegrationTimeInSeconds:(double)a3 gain:(float)a4 maxAGC:(int)a5;
- (double)integrationTimeInSeconds;
- (float)gain;
- (int)integrationTimeInMiroseconds;
- (int)maxAGC;
@end

@implementation BWAdaptiveBracketingFrameParameters

+ (id)frameParametersWithIntegrationTimeInSeconds:(double)a3 gain:(float)a4 maxAGC:(int)a5
{
  v8 = [BWAdaptiveBracketingFrameParameters alloc];
  if (v8)
  {
    v10.receiver = v8;
    v10.super_class = (Class)BWAdaptiveBracketingFrameParameters;
    v8 = objc_msgSendSuper2(&v10, sel_init);
    if (v8)
    {
      v8->_integrationTimeInMicroseconds = (int)(a3 * 1000000.0);
      v8->_gain = a4;
      v8->_maxAGC = a5;
    }
  }
  return v8;
}

+ (id)frameParametersWithIntegrationTimeInMicroseconds:(int)a3 gain:(float)a4 maxAGC:(int)a5
{
  v8 = [BWAdaptiveBracketingFrameParameters alloc];
  if (v8)
  {
    v10.receiver = v8;
    v10.super_class = (Class)BWAdaptiveBracketingFrameParameters;
    v8 = objc_msgSendSuper2(&v10, sel_init);
    if (v8)
    {
      v8->_integrationTimeInMicroseconds = a3;
      v8->_gain = a4;
      v8->_maxAGC = a5;
    }
  }
  return v8;
}

- (int)integrationTimeInMiroseconds
{
  return self->_integrationTimeInMicroseconds;
}

- (double)integrationTimeInSeconds
{
  return (double)self->_integrationTimeInMicroseconds / 1000000.0;
}

- (float)gain
{
  return self->_gain;
}

- (int)maxAGC
{
  return self->_maxAGC;
}

@end