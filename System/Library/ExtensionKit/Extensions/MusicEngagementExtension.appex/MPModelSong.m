@interface MPModelSong
- (NSString)shortDescription;
- (double)preferredArtworkAspectRatio;
@end

@implementation MPModelSong

- (NSString)shortDescription
{
  return (NSString *)@objc MPModelSong.shortDescription.getter(self, (uint64_t)a2, (void (*)(void))MPModelSong.shortDescription.getter);
}

- (double)preferredArtworkAspectRatio
{
  v2 = self;
  double v3 = MPModelSong.preferredArtworkAspectRatio.getter();

  return v3;
}

@end