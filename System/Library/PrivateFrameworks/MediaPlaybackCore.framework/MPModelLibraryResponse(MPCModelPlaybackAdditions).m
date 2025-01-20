@interface MPModelLibraryResponse(MPCModelPlaybackAdditions)
- (uint64_t)isFinalResponse;
@end

@implementation MPModelLibraryResponse(MPCModelPlaybackAdditions)

- (uint64_t)isFinalResponse
{
  return 1;
}

@end