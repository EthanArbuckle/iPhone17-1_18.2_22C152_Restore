@interface MUPlaceTileCellConfiguration
- (BOOL)showCuratedPhoto;
- (BOOL)showIcon;
- (BOOL)showSelectionControlWhileEditing;
- (int64_t)variant;
- (void)setShowCuratedPhoto:(BOOL)a3;
- (void)setShowIcon:(BOOL)a3;
- (void)setShowSelectionControlWhileEditing:(BOOL)a3;
- (void)setVariant:(int64_t)a3;
@end

@implementation MUPlaceTileCellConfiguration

- (BOOL)showIcon
{
  return self->_showIcon;
}

- (void)setShowIcon:(BOOL)a3
{
  self->_showIcon = a3;
}

- (BOOL)showCuratedPhoto
{
  return self->_showCuratedPhoto;
}

- (void)setShowCuratedPhoto:(BOOL)a3
{
  self->_showCuratedPhoto = a3;
}

- (BOOL)showSelectionControlWhileEditing
{
  return self->_showSelectionControlWhileEditing;
}

- (void)setShowSelectionControlWhileEditing:(BOOL)a3
{
  self->_showSelectionControlWhileEditing = a3;
}

- (int64_t)variant
{
  return self->_variant;
}

- (void)setVariant:(int64_t)a3
{
  self->_variant = a3;
}

@end