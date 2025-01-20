@interface MRNowPlayingAudioFormatApplication(FaceTime)
- (uint64_t)isFaceTime;
@end

@implementation MRNowPlayingAudioFormatApplication(FaceTime)

- (uint64_t)isFaceTime
{
  v1 = (void *)MEMORY[0x1E4F28B50];
  v2 = [a1 bundleID];
  uint64_t v3 = objc_msgSend(v1, "mru_isFaceTimeBundleIdentifier:", v2);

  return v3;
}

@end