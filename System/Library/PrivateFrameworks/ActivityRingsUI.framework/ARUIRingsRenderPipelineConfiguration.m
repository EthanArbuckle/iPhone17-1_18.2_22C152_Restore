@interface ARUIRingsRenderPipelineConfiguration
- (BOOL)hasEmptyRing;
- (BOOL)hasFilledRing;
- (BOOL)hasOverlappingRing;
- (BOOL)hasVisibleRings;
- (BOOL)needsAlphaReductionPass;
- (void)setHasEmptyRing:(BOOL)a3;
- (void)setHasFilledRing:(BOOL)a3;
- (void)setHasOverlappingRing:(BOOL)a3;
- (void)setHasVisibleRings:(BOOL)a3;
- (void)setNeedsAlphaReductionPass:(BOOL)a3;
@end

@implementation ARUIRingsRenderPipelineConfiguration

- (void)setNeedsAlphaReductionPass:(BOOL)a3
{
  self->_needsAlphaReductionPass = a3;
}

- (void)setHasVisibleRings:(BOOL)a3
{
  self->_hasVisibleRings = a3;
}

- (void)setHasOverlappingRing:(BOOL)a3
{
  self->_hasOverlappingRing = a3;
}

- (void)setHasFilledRing:(BOOL)a3
{
  self->_hasFilledRing = a3;
}

- (void)setHasEmptyRing:(BOOL)a3
{
  self->_hasEmptyRing = a3;
}

- (BOOL)hasVisibleRings
{
  return self->_hasVisibleRings;
}

- (BOOL)needsAlphaReductionPass
{
  return self->_needsAlphaReductionPass;
}

- (BOOL)hasOverlappingRing
{
  return self->_hasOverlappingRing;
}

- (BOOL)hasFilledRing
{
  return self->_hasFilledRing;
}

- (BOOL)hasEmptyRing
{
  return self->_hasEmptyRing;
}

@end