@interface IMAssistantRelevantChatMatchingRecipients
- (IMAssistantRelevantChatMatchingRecipients)initWithChat:(id)a3 resolvedPersons:(id)a4;
- (IMChat)chat;
- (NSArray)resolvedPersons;
- (id)description;
- (void)setChat:(id)a3;
- (void)setResolvedPersons:(id)a3;
@end

@implementation IMAssistantRelevantChatMatchingRecipients

- (IMAssistantRelevantChatMatchingRecipients)initWithChat:(id)a3 resolvedPersons:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IMAssistantRelevantChatMatchingRecipients;
  v9 = [(IMAssistantRelevantChatMatchingRecipients *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_chat, a3);
    uint64_t v11 = [v8 copy];
    resolvedPersons = v10->_resolvedPersons;
    v10->_resolvedPersons = (NSArray *)v11;
  }
  return v10;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<IMAssistantRelevantChatMatchingRecipients %p> {Chat: %@, ResolvedPersons: %@}", self, self->_chat, self->_resolvedPersons];
}

- (IMChat)chat
{
  return self->_chat;
}

- (void)setChat:(id)a3
{
}

- (NSArray)resolvedPersons
{
  return self->_resolvedPersons;
}

- (void)setResolvedPersons:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolvedPersons, 0);

  objc_storeStrong((id *)&self->_chat, 0);
}

@end