@interface GTReplayShaderDebugFragment
+ (BOOL)supportsSecureCoding;
- (GTPoint2D)maxPixelPosition;
- (GTPoint2D)minPixelPosition;
- (GTReplayShaderDebugFragment)initWithCoder:(id)a3;
- (unsigned)maxSampleID;
- (unsigned)minSampleID;
- (unsigned)renderTargetArrayIndex;
- (void)encodeWithCoder:(id)a3;
- (void)setMaxPixelPosition:(GTPoint2D)a3;
- (void)setMaxSampleID:(unsigned int)a3;
- (void)setMinPixelPosition:(GTPoint2D)a3;
- (void)setMinSampleID:(unsigned int)a3;
- (void)setRenderTargetArrayIndex:(unsigned int)a3;
@end

@implementation GTReplayShaderDebugFragment

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTReplayShaderDebugFragment)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GTReplayShaderDebugFragment;
  v5 = [(GTReplayShaderDebugRequest *)&v11 initWithCoder:v4];
  v6 = v5;
  if (v5)
  {
    v5->_minPixelPosition.x = GTPoint2DDecode(v4, @"MinPixelPosition");
    v6->_minPixelPosition.y = v7;
    v6->_maxPixelPosition.x = GTPoint2DDecode(v4, @"MaxPixelPosition");
    v6->_maxPixelPosition.y = v8;
    v6->_minSampleID = [v4 decodeInt32ForKey:@"MinSampleID"];
    v6->_maxSampleID = [v4 decodeInt32ForKey:@"MaxSampleID"];
    v6->_renderTargetArrayIndex = [v4 decodeInt32ForKey:@"RenderTargetArrayIndex"];
    v9 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GTReplayShaderDebugFragment;
  id v4 = a3;
  [(GTReplayShaderDebugRequest *)&v5 encodeWithCoder:v4];
  GTPoint2DEncode(v4, self->_minPixelPosition.x, self->_minPixelPosition.y, @"MinPixelPosition");
  GTPoint2DEncode(v4, self->_maxPixelPosition.x, self->_maxPixelPosition.y, @"MaxPixelPosition");
  objc_msgSend(v4, "encodeInt32:forKey:", self->_minSampleID, @"MinSampleID", v5.receiver, v5.super_class);
  [v4 encodeInt32:self->_maxSampleID forKey:@"MaxSampleID"];
  [v4 encodeInt32:self->_renderTargetArrayIndex forKey:@"RenderTargetArrayIndex"];
}

- (GTPoint2D)minPixelPosition
{
  p_minPixelPosition = &self->_minPixelPosition;
  unint64_t x = self->_minPixelPosition.x;
  unint64_t y = p_minPixelPosition->y;
  result.unint64_t y = y;
  result.unint64_t x = x;
  return result;
}

- (void)setMinPixelPosition:(GTPoint2D)a3
{
  self->_minPixelPosition = a3;
}

- (GTPoint2D)maxPixelPosition
{
  p_maxPixelPosition = &self->_maxPixelPosition;
  unint64_t x = self->_maxPixelPosition.x;
  unint64_t y = p_maxPixelPosition->y;
  result.unint64_t y = y;
  result.unint64_t x = x;
  return result;
}

- (void)setMaxPixelPosition:(GTPoint2D)a3
{
  self->_maxPixelPosition = a3;
}

- (unsigned)minSampleID
{
  return self->_minSampleID;
}

- (void)setMinSampleID:(unsigned int)a3
{
  self->_minSampleID = a3;
}

- (unsigned)maxSampleID
{
  return self->_maxSampleID;
}

- (void)setMaxSampleID:(unsigned int)a3
{
  self->_maxSampleID = a3;
}

- (unsigned)renderTargetArrayIndex
{
  return self->_renderTargetArrayIndex;
}

- (void)setRenderTargetArrayIndex:(unsigned int)a3
{
  self->_renderTargetArrayIndeunint64_t x = a3;
}

@end