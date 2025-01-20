@interface MUPhotoTileOverlay
- (BOOL)shouldBeShown;
- (NSString)attributionTitle;
- (NSString)badgeTitle;
- (NSString)tileTitle;
- (void)setAttributionTitle:(id)a3;
- (void)setBadgeTitle:(id)a3;
- (void)setTileTitle:(id)a3;
@end

@implementation MUPhotoTileOverlay

- (BOOL)shouldBeShown
{
  v3 = [(MUPhotoTileOverlay *)self attributionTitle];
  if ([v3 length])
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(MUPhotoTileOverlay *)self badgeTitle];
    if ([v5 length])
    {
      BOOL v4 = 1;
    }
    else
    {
      v6 = [(MUPhotoTileOverlay *)self tileTitle];
      BOOL v4 = [v6 length] != 0;
    }
  }

  return v4;
}

- (NSString)tileTitle
{
  return self->_tileTitle;
}

- (void)setTileTitle:(id)a3
{
}

- (NSString)attributionTitle
{
  return self->_attributionTitle;
}

- (void)setAttributionTitle:(id)a3
{
}

- (NSString)badgeTitle
{
  return self->_badgeTitle;
}

- (void)setBadgeTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeTitle, 0);
  objc_storeStrong((id *)&self->_attributionTitle, 0);
  objc_storeStrong((id *)&self->_tileTitle, 0);
}

@end