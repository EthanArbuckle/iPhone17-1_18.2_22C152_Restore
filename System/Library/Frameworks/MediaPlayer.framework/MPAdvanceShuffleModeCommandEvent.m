@interface MPAdvanceShuffleModeCommandEvent
- (BOOL)preservesShuffleMode;
- (MPAdvanceShuffleModeCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5;
@end

@implementation MPAdvanceShuffleModeCommandEvent

- (BOOL)preservesShuffleMode
{
  return self->_preservesShuffleMode;
}

- (MPAdvanceShuffleModeCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)MPAdvanceShuffleModeCommandEvent;
  v9 = [(MPRemoteCommandEvent *)&v12 initWithCommand:a3 mediaRemoteType:v5 options:v8];
  if (v9)
  {
    v10 = [v8 objectForKey:*MEMORY[0x1E4F772C8]];
    v9->_preservesShuffleMode = [v10 BOOLValue];
  }
  return v9;
}

@end