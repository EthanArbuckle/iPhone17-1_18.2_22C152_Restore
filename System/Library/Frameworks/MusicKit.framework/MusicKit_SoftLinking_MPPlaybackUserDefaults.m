@interface MusicKit_SoftLinking_MPPlaybackUserDefaults
+ (MusicKit_SoftLinking_MPPlaybackUserDefaults)standardUserDefaults;
+ (NSString)preferredResolutionsDidChangeNotification;
- (BOOL)isCrossFadeEnabled;
- (BOOL)isPrivateListeningEnabled;
- (BOOL)prefersSpatialAudio;
- (BOOL)prefersSpatialDownloads;
- (double)crossFadeDuration;
- (id)_initWithUnderlyingPlaybackUserDefaults:(id)a3;
- (int64_t)preferredMusicLowBandwidthResolution;
- (int64_t)preferredVideoLowBandwidthResolution;
- (void)_handlePreferredResolutionsDidChangeNotification:(id)a3;
- (void)dealloc;
- (void)setCrossFadeDuration:(double)a3;
- (void)setCrossFadeEnabled:(BOOL)a3;
- (void)setPrefersSpatialAudio:(BOOL)a3;
- (void)setPrefersSpatialDownloads:(BOOL)a3;
@end

@implementation MusicKit_SoftLinking_MPPlaybackUserDefaults

+ (MusicKit_SoftLinking_MPPlaybackUserDefaults)standardUserDefaults
{
  if (standardUserDefaults_sOnceToken != -1) {
    dispatch_once(&standardUserDefaults_sOnceToken, &__block_literal_global_6);
  }
  v2 = (void *)standardUserDefaults_sStandardUserDefaults;

  return (MusicKit_SoftLinking_MPPlaybackUserDefaults *)v2;
}

- (id)_initWithUnderlyingPlaybackUserDefaults:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MusicKit_SoftLinking_MPPlaybackUserDefaults;
  v6 = [(MusicKit_SoftLinking_MPPlaybackUserDefaults *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_underlyingPlaybackUserDefaults, a3);
    v8 = [MEMORY[0x263F08A00] defaultCenter];
    v9 = getMPPlaybackUserDefaultsPreferredResolutionsDidChangeNotification();
    [v8 addObserver:v7 selector:sel__handlePreferredResolutionsDidChangeNotification_ name:v9 object:v7->_underlyingPlaybackUserDefaults];
  }
  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  v4 = getMPPlaybackUserDefaultsPreferredResolutionsDidChangeNotification();
  [v3 removeObserver:self name:v4 object:self->_underlyingPlaybackUserDefaults];

  v5.receiver = self;
  v5.super_class = (Class)MusicKit_SoftLinking_MPPlaybackUserDefaults;
  [(MusicKit_SoftLinking_MPPlaybackUserDefaults *)&v5 dealloc];
}

- (int64_t)preferredMusicLowBandwidthResolution
{
  uint64_t v2 = [(MPPlaybackUserDefaults *)self->_underlyingPlaybackUserDefaults preferredMusicLowBandwidthResolution];
  uint64_t v3 = 4;
  if (v2 != 192000) {
    uint64_t v3 = 0;
  }
  if (v2 == 48000) {
    int64_t v4 = 3;
  }
  else {
    int64_t v4 = v3;
  }
  int64_t v5 = 1;
  uint64_t v6 = 2;
  if (v2 != 256) {
    uint64_t v6 = 0;
  }
  if (v2 != 64) {
    int64_t v5 = v6;
  }
  if (v2 <= 47999) {
    return v5;
  }
  else {
    return v4;
  }
}

- (int64_t)preferredVideoLowBandwidthResolution
{
  uint64_t v2 = [(MPPlaybackUserDefaults *)self->_underlyingPlaybackUserDefaults preferredVideoLowBandwidthResolution];
  if (v2 == 1000000) {
    return 2;
  }
  else {
    return v2 == 1000;
  }
}

- (BOOL)isPrivateListeningEnabled
{
  uint64_t v2 = [(MPPlaybackUserDefaults *)self->_underlyingPlaybackUserDefaults isPrivateListeningEnabled];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)prefersSpatialAudio
{
  return [(MPPlaybackUserDefaults *)self->_underlyingPlaybackUserDefaults prefersSpatialAudio];
}

- (void)setPrefersSpatialAudio:(BOOL)a3
{
}

- (BOOL)prefersSpatialDownloads
{
  return [(MPPlaybackUserDefaults *)self->_underlyingPlaybackUserDefaults prefersSpatialDownloads];
}

- (void)setPrefersSpatialDownloads:(BOOL)a3
{
}

- (BOOL)isCrossFadeEnabled
{
  return [(MPPlaybackUserDefaults *)self->_underlyingPlaybackUserDefaults isCrossFadeEnabled];
}

- (double)crossFadeDuration
{
  [(MPPlaybackUserDefaults *)self->_underlyingPlaybackUserDefaults crossFadeDuration];
  return result;
}

+ (NSString)preferredResolutionsDidChangeNotification
{
  return (NSString *)@"MusicKit_SoftLinking_MPPlaybackUserDefaultsPreferredResolutionsDidChangeNotification";
}

- (void)_handlePreferredResolutionsDidChangeNotification:(id)a3
{
  int64_t v4 = (void *)MEMORY[0x263F08A00];
  id v5 = a3;
  id v7 = [v4 defaultCenter];
  uint64_t v6 = [v5 userInfo];

  [v7 postNotificationName:@"MusicKit_SoftLinking_MPPlaybackUserDefaultsPreferredResolutionsDidChangeNotification" object:self userInfo:v6];
}

- (void)setCrossFadeEnabled:(BOOL)a3
{
  self->_crossFadeEnabled = a3;
}

- (void)setCrossFadeDuration:(double)a3
{
  self->_crossFadeDuration = a3;
}

- (void).cxx_destruct
{
}

@end