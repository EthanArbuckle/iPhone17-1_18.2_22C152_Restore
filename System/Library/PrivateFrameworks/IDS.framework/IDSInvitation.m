@interface IDSInvitation
- (IDSInvitation)initWithState:(int64_t)a3 expirationDate:(id)a4 uniqueID:(id)a5 context:(id)a6;
- (IDSInvitationContext)context;
- (NSDate)expirationDate;
- (NSString)selfHandle;
- (NSString)senderMergeID;
- (NSUUID)uniqueID;
- (int64_t)state;
@end

@implementation IDSInvitation

- (IDSInvitation)initWithState:(int64_t)a3 expirationDate:(id)a4 uniqueID:(id)a5 context:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)IDSInvitation;
  v14 = [(IDSInvitation *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_context, a6);
    objc_storeStrong((id *)&v15->_expirationDate, a4);
    if (v12)
    {
      v16 = (NSUUID *)v12;
    }
    else
    {
      v16 = [MEMORY[0x1E4F29128] UUID];
    }
    uniqueID = v15->_uniqueID;
    v15->_uniqueID = v16;

    v15->_state = a3;
  }

  return v15;
}

- (NSUUID)uniqueID
{
  return self->_uniqueID;
}

- (NSString)senderMergeID
{
  return self->_senderMergeID;
}

- (NSString)selfHandle
{
  return self->_selfHandle;
}

- (int64_t)state
{
  return self->_state;
}

- (IDSInvitationContext)context
{
  return self->_context;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_selfHandle, 0);

  objc_storeStrong((id *)&self->_senderMergeID, 0);
}

@end