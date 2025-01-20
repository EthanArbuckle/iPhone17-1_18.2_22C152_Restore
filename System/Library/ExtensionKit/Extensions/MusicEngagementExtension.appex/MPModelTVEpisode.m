@interface MPModelTVEpisode
- (NSString)shortDescription;
@end

@implementation MPModelTVEpisode

- (NSString)shortDescription
{
  return (NSString *)@objc MPModelSong.shortDescription.getter(self, (uint64_t)a2, (void (*)(void))MPModelTVEpisode.shortDescription.getter);
}

@end