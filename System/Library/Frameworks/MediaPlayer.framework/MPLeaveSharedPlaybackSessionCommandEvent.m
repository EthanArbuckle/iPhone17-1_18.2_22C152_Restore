@interface MPLeaveSharedPlaybackSessionCommandEvent
- (MPLeaveSharedPlaybackSessionCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5;
- (NSString)sessionIdentifier;
@end

@implementation MPLeaveSharedPlaybackSessionCommandEvent

- (void).cxx_destruct
{
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (MPLeaveSharedPlaybackSessionCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)MPLeaveSharedPlaybackSessionCommandEvent;
  v9 = [(MPRemoteCommandEvent *)&v13 initWithCommand:a3 mediaRemoteType:v5 options:v8];
  if (v9)
  {
    uint64_t v10 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F77788]];
    sessionIdentifier = v9->_sessionIdentifier;
    v9->_sessionIdentifier = (NSString *)v10;
  }
  return v9;
}

@end