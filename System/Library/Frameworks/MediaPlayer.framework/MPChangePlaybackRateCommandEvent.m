@interface MPChangePlaybackRateCommandEvent
- (MPChangePlaybackRateCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5;
- (float)playbackRate;
@end

@implementation MPChangePlaybackRateCommandEvent

- (float)playbackRate
{
  return self->_playbackRate;
}

- (MPChangePlaybackRateCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)MPChangePlaybackRateCommandEvent;
  v9 = [(MPRemoteCommandEvent *)&v13 initWithCommand:a3 mediaRemoteType:v5 options:v8];
  if (v9)
  {
    v10 = [v8 objectForKey:*MEMORY[0x1E4F776F8]];
    [v10 floatValue];
    v9->_playbackRate = v11;
  }
  return v9;
}

@end