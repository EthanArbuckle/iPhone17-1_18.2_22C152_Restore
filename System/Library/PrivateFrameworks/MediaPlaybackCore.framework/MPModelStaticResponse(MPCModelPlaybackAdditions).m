@interface MPModelStaticResponse(MPCModelPlaybackAdditions)
- (uint64_t)isFinalResponse;
@end

@implementation MPModelStaticResponse(MPCModelPlaybackAdditions)

- (uint64_t)isFinalResponse
{
  return 1;
}

@end