@interface ATXNowPlayingEvent
- (ATXNowPlayingEvent)initWithContextInfo:(id)a3;
- (BOOL)isTVExperienceAppNowPlaying;
- (NSString)bundleId;
- (int64_t)nowPlayingState;
@end

@implementation ATXNowPlayingEvent

- (ATXNowPlayingEvent)initWithContextInfo:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXNowPlayingEvent;
  v5 = [(ATXNowPlayingEvent *)&v13 init];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F5B6B8] nowPlayingBundleIdKey];
    uint64_t v7 = [v4 objectForKeyedSubscript:v6];
    v8 = (void *)v7;
    if (v7) {
      v9 = (__CFString *)v7;
    }
    else {
      v9 = &stru_1EFD9B408;
    }
    objc_storeStrong((id *)&v5->_bundleId, v9);

    v10 = [MEMORY[0x1E4F5B6B8] nowPlayingStatusKey];
    v11 = [v4 objectForKeyedSubscript:v10];
    v5->_nowPlayingState = [v11 integerValue];
  }
  return v5;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (int64_t)nowPlayingState
{
  return self->_nowPlayingState;
}

- (void).cxx_destruct
{
}

- (BOOL)isTVExperienceAppNowPlaying
{
  if ([(ATXNowPlayingEvent *)self nowPlayingState] != 1) {
    return 0;
  }
  v3 = [(ATXNowPlayingEvent *)self bundleId];
  BOOL v4 = +[ATXAVRoutingUtils isTVExperienceAppWithBundleId:v3];

  return v4;
}

@end