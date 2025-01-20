@interface MPPlaybackArchiveConfiguration
+ (BOOL)supportsSecureCoding;
- (CGSize)preferredArtworkSize;
- (MPPlaybackArchiveConfiguration)initWithCoder:(id)a3;
- (MPPlaybackArchiveConfiguration)initWithPreferredArtworkSize:(CGSize)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setPreferredArtworkSize:(CGSize)a3;
@end

@implementation MPPlaybackArchiveConfiguration

- (void)setPreferredArtworkSize:(CGSize)a3
{
  self->_preferredArtworkSize = a3;
}

- (CGSize)preferredArtworkSize
{
  double width = self->_preferredArtworkSize.width;
  double height = self->_preferredArtworkSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (MPPlaybackArchiveConfiguration)initWithCoder:(id)a3
{
  [a3 decodeCGSizeForKey:@"s"];

  return -[MPPlaybackArchiveConfiguration initWithPreferredArtworkSize:](self, "initWithPreferredArtworkSize:");
}

- (void)encodeWithCoder:(id)a3
{
}

- (MPPlaybackArchiveConfiguration)initWithPreferredArtworkSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)MPPlaybackArchiveConfiguration;
  CGSize result = [(MPPlaybackArchiveConfiguration *)&v6 init];
  if (result)
  {
    result->_preferredArtworkSize.CGFloat width = width;
    result->_preferredArtworkSize.CGFloat height = height;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end