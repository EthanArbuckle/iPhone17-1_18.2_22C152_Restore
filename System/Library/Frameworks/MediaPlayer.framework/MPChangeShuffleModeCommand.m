@interface MPChangeShuffleModeCommand
- (MPShuffleType)currentShuffleType;
- (id)_mediaRemoteCommandInfoOptions;
- (id)newCommandEventWithType:(int64_t)a3;
- (id)newCommandEventWithType:(int64_t)a3 preservesShuffleMode:(BOOL)a4;
- (void)setCurrentShuffleType:(MPShuffleType)currentShuffleType;
- (void)setSupportedShuffleTypes:(id)a3;
@end

@implementation MPChangeShuffleModeCommand

- (id)_mediaRemoteCommandInfoOptions
{
  v26[1] = *MEMORY[0x1E4F143B8];
  int64_t currentShuffleType = self->_currentShuffleType;
  if (currentShuffleType == 1) {
    unsigned int v4 = 3;
  }
  else {
    unsigned int v4 = 1;
  }
  if (currentShuffleType == 2) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = v4;
  }
  uint64_t v25 = *MEMORY[0x1E4F772E0];
  v6 = [NSNumber numberWithInt:v5];
  v26[0] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
  v8 = (void *)[v7 mutableCopy];

  if (self->_supportedShuffleTypes)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v10 = self->_supportedShuffleTypes;
    uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "integerValue", (void)v20);
          if (v15 == 1) {
            unsigned int v16 = 3;
          }
          else {
            unsigned int v16 = 1;
          }
          if (v15 == 2) {
            uint64_t v17 = 2;
          }
          else {
            uint64_t v17 = v16;
          }
          v18 = [NSNumber numberWithInt:v17];
          [v9 addObject:v18];
        }
        uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v12);
    }

    [v8 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F77348]];
  }

  return v8;
}

- (void)setCurrentShuffleType:(MPShuffleType)currentShuffleType
{
  if (self->_currentShuffleType != currentShuffleType)
  {
    self->_int64_t currentShuffleType = currentShuffleType;
    [(MPRemoteCommand *)self notifyPropagatablePropertyChanged];
  }
}

- (void).cxx_destruct
{
}

- (MPShuffleType)currentShuffleType
{
  return self->_currentShuffleType;
}

- (id)newCommandEventWithType:(int64_t)a3 preservesShuffleMode:(BOOL)a4
{
  BOOL v4 = a4;
  v16[2] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [(MPRemoteCommand *)self mediaRemoteCommandType];
  v15[0] = *MEMORY[0x1E4F77798];
  if (a3 == 1) {
    unsigned int v8 = 3;
  }
  else {
    unsigned int v8 = 1;
  }
  if (a3 == 2) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = v8;
  }
  v10 = [NSNumber numberWithInt:v9];
  v16[0] = v10;
  v15[1] = *MEMORY[0x1E4F772C8];
  uint64_t v11 = [NSNumber numberWithBool:v4];
  v16[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  id v13 = [(MPRemoteCommand *)self newCommandEventWithCommandType:v7 options:v12];

  return v13;
}

- (id)newCommandEventWithType:(int64_t)a3
{
  return [(MPChangeShuffleModeCommand *)self newCommandEventWithType:a3 preservesShuffleMode:0];
}

- (void)setSupportedShuffleTypes:(id)a3
{
  id v6 = a3;
  if (!-[NSArray isEqualToArray:](self->_supportedShuffleTypes, "isEqualToArray:"))
  {
    BOOL v4 = (NSArray *)[v6 copy];
    supportedShuffleTypes = self->_supportedShuffleTypes;
    self->_supportedShuffleTypes = v4;

    [(MPRemoteCommand *)self notifyPropagatablePropertyChanged];
  }
}

@end