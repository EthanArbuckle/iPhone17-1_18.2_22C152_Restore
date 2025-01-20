@interface MPCSharedListeningQueueEventPlaybackModeChanged
- (MPCSharedListeningQueueEventPlaybackModeChanged)initWithUpdatedAutoPlayEnabled:(BOOL)a3;
- (MPCSharedListeningQueueEventPlaybackModeChanged)initWithUpdatedRepeatType:(int64_t)a3;
- (MPCSharedListeningQueueEventPlaybackModeChanged)initWithUpdatedShuffleType:(int64_t)a3;
- (id)autoPlayEnabled;
- (id)description;
- (id)repeatType;
- (id)shuffleType;
- (int64_t)kind;
@end

@implementation MPCSharedListeningQueueEventPlaybackModeChanged

- (void).cxx_destruct
{
  objc_storeStrong(&self->_autoPlayEnabled, 0);
  objc_storeStrong(&self->_repeatType, 0);

  objc_storeStrong(&self->_shuffleType, 0);
}

- (id)autoPlayEnabled
{
  return self->_autoPlayEnabled;
}

- (id)repeatType
{
  return self->_repeatType;
}

- (id)shuffleType
{
  return self->_shuffleType;
}

- (int64_t)kind
{
  return self->_kind;
}

- (id)description
{
  int64_t kind = self->_kind;
  switch(kind)
  {
    case 0:
      objc_msgSend(NSString, "stringWithFormat:", @"<MPCSharedListeningQueueEventPlaybackModeChanged: %p unknown/invalid>", self, v12);
      goto LABEL_10;
    case 1:
      v4 = NSString;
      (*((void (**)(void))self->_shuffleType + 2))();
      v5 = MPNSStringFromShuffleType();
      [v4 stringWithFormat:@"<MPCSharedListeningQueueEventPlaybackModeChanged: %p shuffleType=%@>", self, v5];
      goto LABEL_6;
    case 2:
      v6 = NSString;
      (*((void (**)(void))self->_repeatType + 2))();
      v5 = MPNSStringFromRepeatType();
      [v6 stringWithFormat:@"<MPCSharedListeningQueueEventPlaybackModeChanged: %p repeatType=%@>", self, v5];
      v7 = LABEL_6:;

      goto LABEL_11;
    case 3:
      v8 = NSString;
      int v9 = (*((uint64_t (**)(void))self->_autoPlayEnabled + 2))();
      v10 = @"NO";
      if (v9) {
        v10 = @"YES";
      }
      [v8 stringWithFormat:@"<MPCSharedListeningQueueEventPlaybackModeChanged: %p autoPlayEnabled=%@>", self, v10];
      goto LABEL_10;
    default:
      objc_msgSend(NSString, "stringWithFormat:", @"<MPCSharedListeningQueueEventPlaybackModeChanged: %p unknown/kind=%ld>", self, kind);
      v7 = LABEL_10:;
LABEL_11:
      return v7;
  }
}

- (MPCSharedListeningQueueEventPlaybackModeChanged)initWithUpdatedAutoPlayEnabled:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)MPCSharedListeningQueueEventPlaybackModeChanged;
  v4 = [(MPCSharedListeningQueueEventPlaybackModeChanged *)&v11 init];
  v5 = v4;
  if (v4)
  {
    v4->_int64_t kind = 3;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __82__MPCSharedListeningQueueEventPlaybackModeChanged_initWithUpdatedAutoPlayEnabled___block_invoke;
    v9[3] = &__block_descriptor_33_e5_B8__0l;
    BOOL v10 = a3;
    uint64_t v6 = [v9 copy];
    id autoPlayEnabled = v5->_autoPlayEnabled;
    v5->_id autoPlayEnabled = (id)v6;
  }
  return v5;
}

uint64_t __82__MPCSharedListeningQueueEventPlaybackModeChanged_initWithUpdatedAutoPlayEnabled___block_invoke(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32);
}

- (MPCSharedListeningQueueEventPlaybackModeChanged)initWithUpdatedRepeatType:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)MPCSharedListeningQueueEventPlaybackModeChanged;
  v4 = [(MPCSharedListeningQueueEventPlaybackModeChanged *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v4->_int64_t kind = 2;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __77__MPCSharedListeningQueueEventPlaybackModeChanged_initWithUpdatedRepeatType___block_invoke;
    v9[3] = &__block_descriptor_40_e5_q8__0l;
    void v9[4] = a3;
    uint64_t v6 = [v9 copy];
    id repeatType = v5->_repeatType;
    v5->_id repeatType = (id)v6;
  }
  return v5;
}

uint64_t __77__MPCSharedListeningQueueEventPlaybackModeChanged_initWithUpdatedRepeatType___block_invoke(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

- (MPCSharedListeningQueueEventPlaybackModeChanged)initWithUpdatedShuffleType:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)MPCSharedListeningQueueEventPlaybackModeChanged;
  v4 = [(MPCSharedListeningQueueEventPlaybackModeChanged *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v4->_int64_t kind = 1;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __78__MPCSharedListeningQueueEventPlaybackModeChanged_initWithUpdatedShuffleType___block_invoke;
    v9[3] = &__block_descriptor_40_e5_q8__0l;
    void v9[4] = a3;
    uint64_t v6 = [v9 copy];
    id shuffleType = v5->_shuffleType;
    v5->_id shuffleType = (id)v6;
  }
  return v5;
}

uint64_t __78__MPCSharedListeningQueueEventPlaybackModeChanged_initWithUpdatedShuffleType___block_invoke(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

@end