@interface DRFlockItemLayout
- (BOOL)constrainSize;
- (BOOL)isInPreviewTransition;
- (BOOL)isNewItem;
- (BOOL)needsImmediateTracking;
- (BOOL)startingPreviewTransition;
- (CGPoint)center;
- (DRFlockAnimatable)position;
- (DRFlockAnimatable)preview;
- (DRFlockAnimatable)size;
- (void)setCenter:(CGPoint)a3;
- (void)setConstrainSize:(BOOL)a3;
- (void)setInPreviewTransition:(BOOL)a3;
- (void)setNeedsImmediateTracking:(BOOL)a3;
- (void)setNewItem:(BOOL)a3;
- (void)setPosition:(id)a3;
- (void)setPreview:(id)a3;
- (void)setSize:(id)a3;
- (void)setStartingPreviewTransition:(BOOL)a3;
@end

@implementation DRFlockItemLayout

- (DRFlockAnimatable)position
{
  return self->_position;
}

- (void)setPosition:(id)a3
{
}

- (DRFlockAnimatable)size
{
  return self->_size;
}

- (void)setSize:(id)a3
{
}

- (DRFlockAnimatable)preview
{
  return self->_preview;
}

- (void)setPreview:(id)a3
{
}

- (CGPoint)center
{
  double x = self->_center.x;
  double y = self->_center.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCenter:(CGPoint)a3
{
  self->_center = a3;
}

- (BOOL)needsImmediateTracking
{
  return self->_needsImmediateTracking;
}

- (void)setNeedsImmediateTracking:(BOOL)a3
{
  self->_needsImmediateTracking = a3;
}

- (BOOL)constrainSize
{
  return self->_constrainSize;
}

- (void)setConstrainSize:(BOOL)a3
{
  self->_constrainSize = a3;
}

- (BOOL)isNewItem
{
  return self->_newItem;
}

- (void)setNewItem:(BOOL)a3
{
  self->_newItem = a3;
}

- (BOOL)startingPreviewTransition
{
  return self->_startingPreviewTransition;
}

- (void)setStartingPreviewTransition:(BOOL)a3
{
  self->_startingPreviewTransition = a3;
}

- (BOOL)isInPreviewTransition
{
  return self->_inPreviewTransition;
}

- (void)setInPreviewTransition:(BOOL)a3
{
  self->_inPreviewTransition = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preview, 0);
  objc_storeStrong((id *)&self->_size, 0);
  objc_storeStrong((id *)&self->_position, 0);
}

@end