@interface MPChangeShuffleModeCommandEvent
- (BOOL)preservesShuffleMode;
- (MPChangeShuffleModeCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5;
- (MPShuffleType)shuffleType;
@end

@implementation MPChangeShuffleModeCommandEvent

- (BOOL)preservesShuffleMode
{
  return self->_preservesShuffleMode;
}

- (MPShuffleType)shuffleType
{
  return self->_shuffleType;
}

- (MPChangeShuffleModeCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MPChangeShuffleModeCommandEvent;
  v9 = [(MPRemoteCommandEvent *)&v15 initWithCommand:a3 mediaRemoteType:v5 options:v8];
  if (v9)
  {
    v10 = [v8 objectForKey:*MEMORY[0x1E4F77798]];
    unsigned int v11 = [v10 intValue];

    if (v11 > 3) {
      int64_t v12 = 0;
    }
    else {
      int64_t v12 = qword_19568C4B8[v11];
    }
    v9->_shuffleType = v12;
    v13 = [v8 objectForKey:*MEMORY[0x1E4F772C8]];
    v9->_preservesShuffleMode = [v13 BOOLValue];
  }
  return v9;
}

@end