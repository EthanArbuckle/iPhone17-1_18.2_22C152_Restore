@interface MPModelRequest(MPCSiriPlaybackAdditions)
+ (uint64_t)MPC_consumeSiriAssetInfo:()MPCSiriPlaybackAdditions playActivityFeatureName:userIdentity:completion:;
@end

@implementation MPModelRequest(MPCSiriPlaybackAdditions)

+ (uint64_t)MPC_consumeSiriAssetInfo:()MPCSiriPlaybackAdditions playActivityFeatureName:userIdentity:completion:
{
  if (a6) {
    return (*(uint64_t (**)(uint64_t, void))(a6 + 16))(a6, 0);
  }
  return result;
}

@end