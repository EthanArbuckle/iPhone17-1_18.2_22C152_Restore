@interface GKGridLayoutInvalidationContext
- (BOOL)invalidateBoundsChange;
- (BOOL)invalidateIncrementalReveal;
- (BOOL)invalidatePinnableAreas;
- (BOOL)invalidatePlaceholderVisibility;
- (void)setInvalidateBoundsChange:(BOOL)a3;
- (void)setInvalidateIncrementalReveal:(BOOL)a3;
- (void)setInvalidatePinnableAreas:(BOOL)a3;
- (void)setInvalidatePlaceholderVisibility:(BOOL)a3;
@end

@implementation GKGridLayoutInvalidationContext

- (BOOL)invalidateIncrementalReveal
{
  return self->_invalidateIncrementalReveal;
}

- (void)setInvalidateIncrementalReveal:(BOOL)a3
{
  self->_invalidateIncrementalReveal = a3;
}

- (BOOL)invalidateBoundsChange
{
  return self->_invalidateBoundsChange;
}

- (void)setInvalidateBoundsChange:(BOOL)a3
{
  self->_invalidateBoundsChange = a3;
}

- (BOOL)invalidatePlaceholderVisibility
{
  return self->_invalidatePlaceholderVisibility;
}

- (void)setInvalidatePlaceholderVisibility:(BOOL)a3
{
  self->_invalidatePlaceholderVisibility = a3;
}

- (BOOL)invalidatePinnableAreas
{
  return self->_invalidatePinnableAreas;
}

- (void)setInvalidatePinnableAreas:(BOOL)a3
{
  self->_invalidatePinnableAreas = a3;
}

@end