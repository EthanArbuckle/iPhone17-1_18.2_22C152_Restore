@interface MPSkipIntervalCommand
- (MPSkipIntervalCommand)initWithMediaRemoteCommandType:(unsigned int)a3;
- (NSArray)preferredIntervals;
- (id)_mediaRemoteCommandInfoOptions;
- (id)newCommandEventWithInterval:(double)a3;
- (void)setPreferredIntervals:(NSArray *)preferredIntervals;
@end

@implementation MPSkipIntervalCommand

- (MPSkipIntervalCommand)initWithMediaRemoteCommandType:(unsigned int)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MPSkipIntervalCommand;
  v3 = [(MPRemoteCommand *)&v7 initWithMediaRemoteCommandType:*(void *)&a3];
  v4 = v3;
  if (v3)
  {
    preferredIntervals = v3->_preferredIntervals;
    v3->_preferredIntervals = (NSArray *)&unk_1EE6EE2D0;
  }
  return v4;
}

- (id)_mediaRemoteCommandInfoOptions
{
  v6[1] = *MEMORY[0x1E4F143B8];
  preferredIntervals = self->_preferredIntervals;
  if (preferredIntervals)
  {
    uint64_t v5 = *MEMORY[0x1E4F772A0];
    v6[0] = preferredIntervals;
    v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)setPreferredIntervals:(NSArray *)preferredIntervals
{
  v6 = preferredIntervals;
  if (!-[NSArray isEqualToArray:](self->_preferredIntervals, "isEqualToArray:"))
  {
    v4 = (NSArray *)[(NSArray *)v6 copy];
    uint64_t v5 = self->_preferredIntervals;
    self->_preferredIntervals = v4;

    [(MPRemoteCommand *)self notifyPropagatablePropertyChanged];
  }
}

- (void).cxx_destruct
{
}

- (NSArray)preferredIntervals
{
  return self->_preferredIntervals;
}

- (id)newCommandEventWithInterval:(double)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(MPRemoteCommand *)self mediaRemoteCommandType];
  uint64_t v10 = *MEMORY[0x1E4F777A0];
  v6 = [NSNumber numberWithDouble:a3];
  v11[0] = v6;
  objc_super v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  id v8 = [(MPRemoteCommand *)self newCommandEventWithCommandType:v5 options:v7];

  return v8;
}

@end