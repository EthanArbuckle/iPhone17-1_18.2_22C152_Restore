@interface HMRemoteLoginHandler(HUMediaAdditions)
- (id)hu_appleMusicInAppAuthenticationContext;
@end

@implementation HMRemoteLoginHandler(HUMediaAdditions)

- (id)hu_appleMusicInAppAuthenticationContext
{
  v2 = [a1 anisetteDataProvider];
  v3 = (void *)MEMORY[0x1E4F7A0D8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __81__HMRemoteLoginHandler_HUMediaAdditions__hu_appleMusicInAppAuthenticationContext__block_invoke;
  v7[3] = &unk_1E6385D90;
  v7[4] = a1;
  id v8 = v2;
  id v4 = v2;
  v5 = [v3 futureWithBlock:v7];

  return v5;
}

@end