@interface CLPhotosSharedAlbum
- (NSString)cloudIdentifier;
- (NSString)localIdentifier;
- (NSString)title;
- (void)setCloudIdentifier:(id)a3;
- (void)setLocalIdentifier:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation CLPhotosSharedAlbum

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)localIdentifier
{
  return self->_localIdentifier;
}

- (void)setLocalIdentifier:(id)a3
{
}

- (NSString)cloudIdentifier
{
  return self->_cloudIdentifier;
}

- (void)setCloudIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudIdentifier, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end