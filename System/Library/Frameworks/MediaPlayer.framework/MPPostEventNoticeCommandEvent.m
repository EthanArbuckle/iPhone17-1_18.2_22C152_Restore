@interface MPPostEventNoticeCommandEvent
- (MPPostEventNoticeCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5;
- (NSString)eventIdentifier;
- (NSString)eventType;
@end

@implementation MPPostEventNoticeCommandEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventType, 0);

  objc_storeStrong((id *)&self->_eventIdentifier, 0);
}

- (NSString)eventType
{
  return self->_eventType;
}

- (NSString)eventIdentifier
{
  return self->_eventIdentifier;
}

- (MPPostEventNoticeCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MPPostEventNoticeCommandEvent;
  v9 = [(MPRemoteCommandEvent *)&v15 initWithCommand:a3 mediaRemoteType:v5 options:v8];
  if (v9)
  {
    uint64_t v10 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F77698]];
    eventIdentifier = v9->_eventIdentifier;
    v9->_eventIdentifier = (NSString *)v10;

    uint64_t v12 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F776A0]];
    eventType = v9->_eventType;
    v9->_eventType = (NSString *)v12;
  }
  return v9;
}

@end