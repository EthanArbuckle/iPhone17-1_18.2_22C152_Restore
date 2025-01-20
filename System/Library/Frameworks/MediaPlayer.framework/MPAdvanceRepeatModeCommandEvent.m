@interface MPAdvanceRepeatModeCommandEvent
- (BOOL)preservesRepeatMode;
- (MPAdvanceRepeatModeCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5;
@end

@implementation MPAdvanceRepeatModeCommandEvent

- (BOOL)preservesRepeatMode
{
  return self->_preservesRepeatMode;
}

- (MPAdvanceRepeatModeCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)MPAdvanceRepeatModeCommandEvent;
  v9 = [(MPRemoteCommandEvent *)&v12 initWithCommand:a3 mediaRemoteType:v5 options:v8];
  if (v9)
  {
    v10 = [v8 objectForKey:*MEMORY[0x1E4F772C0]];
    v9->_preservesRepeatMode = [v10 BOOLValue];
  }
  return v9;
}

@end