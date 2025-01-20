@interface MPChangePlaybackPositionCommandEvent
- (MPChangePlaybackPositionCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5;
- (NSNumber)referenceTime;
- (NSTimeInterval)positionTime;
@end

@implementation MPChangePlaybackPositionCommandEvent

- (void).cxx_destruct
{
}

- (NSNumber)referenceTime
{
  return self->_referenceTime;
}

- (NSTimeInterval)positionTime
{
  return self->_positionTime;
}

- (MPChangePlaybackPositionCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MPChangePlaybackPositionCommandEvent;
  v9 = [(MPRemoteCommandEvent *)&v15 initWithCommand:a3 mediaRemoteType:v5 options:v8];
  if (v9)
  {
    v10 = [v8 objectForKey:*MEMORY[0x1E4F776D8]];
    [v10 doubleValue];
    v9->_positionTime = v11;

    uint64_t v12 = [v8 objectForKey:*MEMORY[0x1E4F77768]];
    referenceTime = v9->_referenceTime;
    v9->_referenceTime = (NSNumber *)v12;
  }
  return v9;
}

@end