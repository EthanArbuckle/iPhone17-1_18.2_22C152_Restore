@interface ATXNowPlayingDataProvider
- (ATXNowPlayingDataProvider)init;
- (BOOL)isTVExperienceAppNowPlaying;
- (id)currentNowPlayingEvent;
@end

@implementation ATXNowPlayingDataProvider

- (ATXNowPlayingDataProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATXNowPlayingDataProvider;
  v2 = [(ATXNowPlayingDataProvider *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    coreDuetContextHelper = v2->_coreDuetContextHelper;
    v2->_coreDuetContextHelper = (ATXCoreDuetContextHelper *)v3;
  }
  return v2;
}

- (id)currentNowPlayingEvent
{
  coreDuetContextHelper = self->_coreDuetContextHelper;
  uint64_t v3 = [MEMORY[0x1E4F5B6B8] keyPathForNowPlayingDataDictionary];
  v4 = [(ATXCoreDuetContextHelper *)coreDuetContextHelper fetchDataDictionaryForKeyPath:v3];

  v5 = [[ATXNowPlayingEvent alloc] initWithContextInfo:v4];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastNowPlayingEvent, 0);

  objc_storeStrong((id *)&self->_coreDuetContextHelper, 0);
}

- (BOOL)isTVExperienceAppNowPlaying
{
  lastNowPlayingEvent = self->_lastNowPlayingEvent;
  if (!lastNowPlayingEvent)
  {
    v4 = [(ATXNowPlayingDataProvider *)self currentNowPlayingEvent];
    v5 = self->_lastNowPlayingEvent;
    self->_lastNowPlayingEvent = v4;

    lastNowPlayingEvent = self->_lastNowPlayingEvent;
  }

  return [(ATXNowPlayingEvent *)lastNowPlayingEvent isTVExperienceAppNowPlaying];
}

@end