@interface MPChangePlaybackPositionCommand
- (BOOL)canBeControlledByScrubbing;
- (BOOL)supportsReferencePosition;
- (MPChangePlaybackPositionCommand)initWithMediaRemoteCommandType:(unsigned int)a3;
- (id)_mediaRemoteCommandInfoOptions;
- (id)newCommandEventWithPositionTime:(double)a3;
- (void)setCanBeControlledByScrubbing:(BOOL)a3;
- (void)setSupportsReferencePosition:(BOOL)a3;
@end

@implementation MPChangePlaybackPositionCommand

- (MPChangePlaybackPositionCommand)initWithMediaRemoteCommandType:(unsigned int)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MPChangePlaybackPositionCommand;
  result = [(MPRemoteCommand *)&v4 initWithMediaRemoteCommandType:*(void *)&a3];
  if (result)
  {
    result->_canBeControlledByScrubbing = 0;
    result->_supportsReferencePosition = 0;
  }
  return result;
}

- (id)_mediaRemoteCommandInfoOptions
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = *MEMORY[0x1E4F77230];
  v3 = [NSNumber numberWithBool:self->_canBeControlledByScrubbing];
  v8[0] = v3;
  v7[1] = *MEMORY[0x1E4F77350];
  objc_super v4 = [NSNumber numberWithBool:self->_supportsReferencePosition];
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (void)setCanBeControlledByScrubbing:(BOOL)a3
{
  if (self->_canBeControlledByScrubbing != a3)
  {
    self->_canBeControlledByScrubbing = a3;
    [(MPRemoteCommand *)self notifyPropagatablePropertyChanged];
  }
}

- (void)setSupportsReferencePosition:(BOOL)a3
{
  if (self->_supportsReferencePosition != a3)
  {
    self->_supportsReferencePosition = a3;
    [(MPRemoteCommand *)self notifyPropagatablePropertyChanged];
  }
}

- (BOOL)supportsReferencePosition
{
  return self->_supportsReferencePosition;
}

- (BOOL)canBeControlledByScrubbing
{
  return self->_canBeControlledByScrubbing;
}

- (id)newCommandEventWithPositionTime:(double)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(MPRemoteCommand *)self mediaRemoteCommandType];
  uint64_t v10 = *MEMORY[0x1E4F776D8];
  v6 = [NSNumber numberWithDouble:a3];
  v11[0] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  id v8 = [(MPRemoteCommand *)self newCommandEventWithCommandType:v5 options:v7];

  return v8;
}

@end