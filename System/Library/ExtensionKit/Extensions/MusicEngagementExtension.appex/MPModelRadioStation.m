@interface MPModelRadioStation
- (NSString)shortDescription;
@end

@implementation MPModelRadioStation

- (NSString)shortDescription
{
  return (NSString *)@objc MPModelSong.shortDescription.getter(self, (uint64_t)a2, (void (*)(void))MPModelRadioStation.shortDescription.getter);
}

@end