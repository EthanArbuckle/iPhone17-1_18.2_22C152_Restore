@interface MUPlaceCoverPhotoOptions
- (BOOL)insetsCoverPhoto;
- (BOOL)showShareButton;
- (void)setInsetsCoverPhoto:(BOOL)a3;
- (void)setShowShareButton:(BOOL)a3;
@end

@implementation MUPlaceCoverPhotoOptions

- (BOOL)insetsCoverPhoto
{
  return self->_insetsCoverPhoto;
}

- (void)setInsetsCoverPhoto:(BOOL)a3
{
  self->_insetsCoverPhoto = a3;
}

- (BOOL)showShareButton
{
  return self->_showShareButton;
}

- (void)setShowShareButton:(BOOL)a3
{
  self->_showShareButton = a3;
}

@end