@interface MPChangeQueueEndActionCommandEvent
- (BOOL)preservesQueueEndAction;
- (MPChangeQueueEndActionCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5;
- (int64_t)queueEndAction;
@end

@implementation MPChangeQueueEndActionCommandEvent

- (BOOL)preservesQueueEndAction
{
  return self->_preservesQueueEndAction;
}

- (int64_t)queueEndAction
{
  return self->_queueEndAction;
}

- (MPChangeQueueEndActionCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)MPChangeQueueEndActionCommandEvent;
  v9 = [(MPRemoteCommandEvent *)&v13 initWithCommand:a3 mediaRemoteType:v5 options:v8];
  if (v9)
  {
    v10 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F772B8]];
    v9->_preservesQueueEndAction = [v10 BOOLValue];

    v11 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F77758]];
    v9->_queueEndAction = [v11 integerValue];
  }
  return v9;
}

@end