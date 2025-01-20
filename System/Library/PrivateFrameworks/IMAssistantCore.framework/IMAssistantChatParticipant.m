@interface IMAssistantChatParticipant
- (IMAssistantChatParticipant)initWithIMHandle:(id)a3 handleFromContact:(id)a4;
- (IMAssistantHandleFromContact)handleFromContact;
- (IMHandle)imHandle;
- (id)description;
@end

@implementation IMAssistantChatParticipant

- (IMAssistantChatParticipant)initWithIMHandle:(id)a3 handleFromContact:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IMAssistantChatParticipant;
  v9 = [(IMAssistantChatParticipant *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_imHandle, a3);
    objc_storeStrong((id *)&v10->_handleFromContact, a4);
  }

  return v10;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<IMAssistantChatParticipant %p> {IMHandle: %@, handleFromContact: %@}", self, self->_imHandle, self->_handleFromContact];
}

- (IMHandle)imHandle
{
  return self->_imHandle;
}

- (IMAssistantHandleFromContact)handleFromContact
{
  return self->_handleFromContact;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handleFromContact, 0);

  objc_storeStrong((id *)&self->_imHandle, 0);
}

@end