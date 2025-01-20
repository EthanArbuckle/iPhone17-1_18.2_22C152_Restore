@interface MPPrepareForSetPlaybackQueueCommandEvent
- (BOOL)isProactive;
- (MPPrepareForSetPlaybackQueueCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5;
- (NSString)proactiveReason;
@end

@implementation MPPrepareForSetPlaybackQueueCommandEvent

- (void).cxx_destruct
{
}

- (NSString)proactiveReason
{
  return self->_proactiveReason;
}

- (BOOL)isProactive
{
  return self->_isProactive;
}

- (MPPrepareForSetPlaybackQueueCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MPPrepareForSetPlaybackQueueCommandEvent;
  v9 = [(MPRemoteCommandEvent *)&v14 initWithCommand:a3 mediaRemoteType:v5 options:v8];
  if (v9)
  {
    v10 = [v8 objectForKey:*MEMORY[0x1E4F77740]];
    v9->_isProactive = [v10 BOOLValue];

    uint64_t v11 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F77748]];
    proactiveReason = v9->_proactiveReason;
    v9->_proactiveReason = (NSString *)v11;
  }
  return v9;
}

@end