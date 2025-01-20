@interface DRFlockBadgeLayout
- (BOOL)isVisible;
- (BOOL)justBecameVisible;
- (DRFlockAnimatable)alpha;
- (DRFlockAnimatable)offset;
- (DRFlockAnimatable)offsetAdjustment;
- (DRFlockAnimatable)position;
- (DRFlockAnimatable)size;
- (int64_t)style;
- (void)setAlpha:(id)a3;
- (void)setJustBecameVisible:(BOOL)a3;
- (void)setOffset:(id)a3;
- (void)setOffsetAdjustment:(id)a3;
- (void)setPosition:(id)a3;
- (void)setSize:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setVisible:(BOOL)a3;
@end

@implementation DRFlockBadgeLayout

- (DRFlockAnimatable)position
{
  return self->_position;
}

- (void)setPosition:(id)a3
{
}

- (DRFlockAnimatable)offset
{
  return self->_offset;
}

- (void)setOffset:(id)a3
{
}

- (DRFlockAnimatable)size
{
  return self->_size;
}

- (void)setSize:(id)a3
{
}

- (DRFlockAnimatable)alpha
{
  return self->_alpha;
}

- (void)setAlpha:(id)a3
{
}

- (DRFlockAnimatable)offsetAdjustment
{
  return self->_offsetAdjustment;
}

- (void)setOffsetAdjustment:(id)a3
{
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (BOOL)justBecameVisible
{
  return self->_justBecameVisible;
}

- (void)setJustBecameVisible:(BOOL)a3
{
  self->_justBecameVisible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offsetAdjustment, 0);
  objc_storeStrong((id *)&self->_alpha, 0);
  objc_storeStrong((id *)&self->_size, 0);
  objc_storeStrong((id *)&self->_offset, 0);
  objc_storeStrong((id *)&self->_position, 0);
}

@end