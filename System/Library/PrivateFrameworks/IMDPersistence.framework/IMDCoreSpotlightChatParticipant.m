@interface IMDCoreSpotlightChatParticipant
- (BOOL)isSender;
- (CNContact)contact;
- (IMDCoreSpotlightChatParticipant)initWithHandleID:(id)a3 contact:(id)a4 isSender:(BOOL)a5;
- (NSString)handleID;
@end

@implementation IMDCoreSpotlightChatParticipant

- (IMDCoreSpotlightChatParticipant)initWithHandleID:(id)a3 contact:(id)a4 isSender:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IMDCoreSpotlightChatParticipant;
  v10 = [(IMDCoreSpotlightChatParticipant *)&v14 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    handleID = v10->_handleID;
    v10->_handleID = (NSString *)v11;

    objc_storeStrong((id *)&v10->_contact, a4);
    v10->_isSender = a5;
  }

  return v10;
}

- (NSString)handleID
{
  return self->_handleID;
}

- (CNContact)contact
{
  return self->_contact;
}

- (BOOL)isSender
{
  return self->_isSender;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_handleID, 0);
}

@end