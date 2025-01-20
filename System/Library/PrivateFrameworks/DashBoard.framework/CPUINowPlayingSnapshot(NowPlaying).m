@interface CPUINowPlayingSnapshot(NowPlaying)
- (uint64_t)artworkImageWithMaxDimension:()NowPlaying inTraitCollection:;
- (uint64_t)multicast;
@end

@implementation CPUINowPlayingSnapshot(NowPlaying)

- (uint64_t)artworkImageWithMaxDimension:()NowPlaying inTraitCollection:
{
  return 0;
}

- (uint64_t)multicast
{
  return 0;
}

@end