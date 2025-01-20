@interface CADisplayProperties
- (BOOL)dmrrEnabled;
- (BOOL)forceFixedRateLinks;
- (BOOL)needsUpdateForField:(unsigned int)a3;
- (CADisplayMode)currentMode;
- (CADisplayProperties)init;
- (CGSize)logicalScale;
- (NSString)overscanAdjustment;
- (unint64_t)pointScale;
- (unsigned)connectionSeed;
- (unsigned)updateMask;
- (void)clearUpdateMask;
- (void)dealloc;
- (void)setConnectionSeed:(unsigned int)a3;
- (void)setCurrentMode:(id)a3;
- (void)setDmrrEnabled:(BOOL)a3;
- (void)setForceFixedRateLinks:(BOOL)a3;
- (void)setLogicalScale:(CGSize)a3;
- (void)setOverscanAdjustment:(id)a3;
- (void)setPointScale:(unint64_t)a3;
- (void)setUpdateMask:(unsigned int)a3;
@end

@implementation CADisplayProperties

- (void)setPointScale:(unint64_t)a3
{
  self->_pointScale = a3;
  self->_mask |= 0x20u;
}

- (unint64_t)pointScale
{
  return self->_pointScale;
}

- (void)setLogicalScale:(CGSize)a3
{
  self->_logicalScale = a3;
  self->_mask |= 0x10u;
}

- (CGSize)logicalScale
{
  double width = self->_logicalScale.width;
  double height = self->_logicalScale.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setConnectionSeed:(unsigned int)a3
{
  self->_connectionSeed = a3;
  self->_mask |= 8u;
}

- (unsigned)connectionSeed
{
  return self->_connectionSeed;
}

- (void)setForceFixedRateLinks:(BOOL)a3
{
  self->_forceFixedRateLinks = a3;
  self->_mask |= 0x80u;
}

- (BOOL)forceFixedRateLinks
{
  return self->_forceFixedRateLinks;
}

- (void)setDmrrEnabled:(BOOL)a3
{
  self->_dmrrEnabled = a3;
  self->_mask |= 4u;
}

- (BOOL)dmrrEnabled
{
  return self->_dmrrEnabled;
}

- (void)setOverscanAdjustment:(id)a3
{
  self->_overscanAdjustment = (NSString *)[a3 copy];
  self->_mask |= 2u;
}

- (NSString)overscanAdjustment
{
  return self->_overscanAdjustment;
}

- (void)setCurrentMode:(id)a3
{
  self->_currentMode = (CADisplayMode *)a3;
  self->_mask |= 1u;
}

- (CADisplayMode)currentMode
{
  return self->_currentMode;
}

- (BOOL)needsUpdateForField:(unsigned int)a3
{
  return (self->_mask & a3) != 0;
}

- (void)clearUpdateMask
{
  self->_mask = 0;
}

- (void)setUpdateMask:(unsigned int)a3
{
  self->_mask = a3;
}

- (unsigned)updateMask
{
  return self->_mask;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)CADisplayProperties;
  [(CADisplayProperties *)&v3 dealloc];
}

- (CADisplayProperties)init
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)CADisplayProperties;
  CGSize result = [(CADisplayProperties *)&v8 init];
  if (result)
  {
    result->_connectionSeed = 0;
    result->_currentMode = 0;
    result->_overscanAdjustment = 0;
    result->_dmrrEnabled = 0;
    __asm { FMOV            V0.2D, #1.0 }
    result->_logicalScale = _Q0;
    result->_pointScale = 1;
    result->_forceFixedRateLinks = 0;
    result->_mask = 0;
  }
  return result;
}

@end