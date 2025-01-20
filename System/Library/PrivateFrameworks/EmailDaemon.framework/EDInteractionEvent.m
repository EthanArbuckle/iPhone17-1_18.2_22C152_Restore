@interface EDInteractionEvent
- (NSDate)date;
- (NSDictionary)data;
- (NSString)accountID;
- (NSString)name;
- (id)debugDescription;
- (int64_t)conversationID;
- (int64_t)eventID;
- (int64_t)mailboxID;
- (int64_t)messageIDHash;
- (int64_t)messagePersistentID;
- (int64_t)version;
- (void)setAccountID:(id)a3;
- (void)setConversationID:(int64_t)a3;
- (void)setData:(id)a3;
- (void)setDate:(id)a3;
- (void)setEventID:(int64_t)a3;
- (void)setMailboxID:(int64_t)a3;
- (void)setMessageIDHash:(int64_t)a3;
- (void)setMessagePersistentID:(int64_t)a3;
- (void)setName:(id)a3;
- (void)setVersion:(int64_t)a3;
@end

@implementation EDInteractionEvent

- (id)debugDescription
{
  v3 = objc_opt_new();
  [v3 appendFormat:@"<%@ %p", objc_opt_class(), self];
  int64_t v4 = [(EDInteractionEvent *)self eventID];
  BOOL v5 = v4 == 0;
  if (v4) {
    objc_msgSend(v3, "appendFormat:", @" eventID=%lld", -[EDInteractionEvent eventID](self, "eventID"));
  }
  if ([(EDInteractionEvent *)self version])
  {
    if (v4) {
      [v3 appendString:@","];
    }
    objc_msgSend(v3, "appendFormat:", @" version=%ld", -[EDInteractionEvent version](self, "version"));
    BOOL v5 = 0;
  }
  v6 = [(EDInteractionEvent *)self name];

  if (v6)
  {
    if (!v5) {
      [v3 appendString:@","];
    }
    v7 = [(EDInteractionEvent *)self name];
    [v3 appendFormat:@" name=%@", v7];

    BOOL v5 = 0;
  }
  v8 = [(EDInteractionEvent *)self date];

  if (v8)
  {
    if (!v5) {
      [v3 appendString:@","];
    }
    v9 = [(EDInteractionEvent *)self date];
    [v3 appendFormat:@" date=%@", v9];

    BOOL v5 = 0;
  }
  v10 = [(EDInteractionEvent *)self accountID];

  if (v10)
  {
    if (!v5) {
      [v3 appendString:@","];
    }
    v11 = [(EDInteractionEvent *)self accountID];
    [v3 appendFormat:@" accountID=%@", v11];

    BOOL v5 = 0;
  }
  if ([(EDInteractionEvent *)self mailboxID])
  {
    if (!v5) {
      [v3 appendString:@","];
    }
    objc_msgSend(v3, "appendFormat:", @" mailboxID=%lld", -[EDInteractionEvent mailboxID](self, "mailboxID"));
    BOOL v5 = 0;
  }
  if ([(EDInteractionEvent *)self conversationID])
  {
    if (!v5) {
      [v3 appendString:@","];
    }
    objc_msgSend(v3, "appendFormat:", @" conversationID=%lld", -[EDInteractionEvent conversationID](self, "conversationID"));
    BOOL v5 = 0;
  }
  if ([(EDInteractionEvent *)self messageIDHash])
  {
    if (!v5) {
      [v3 appendString:@","];
    }
    objc_msgSend(v3, "appendFormat:", @" messageIDHash=%lld", -[EDInteractionEvent messageIDHash](self, "messageIDHash"));
    BOOL v5 = 0;
  }
  if ([(EDInteractionEvent *)self messagePersistentID])
  {
    if (!v5) {
      [v3 appendString:@","];
    }
    objc_msgSend(v3, "appendFormat:", @" messagePersistentID=%lld", -[EDInteractionEvent messagePersistentID](self, "messagePersistentID"));
    BOOL v5 = 0;
  }
  v12 = [(EDInteractionEvent *)self data];

  if (v12)
  {
    if (!v5) {
      [v3 appendString:@","];
    }
    v13 = [(EDInteractionEvent *)self data];
    [v3 appendFormat:@" data=%@", v13];
  }
  [v3 appendString:@">"];

  return v3;
}

- (int64_t)eventID
{
  return self->_eventID;
}

- (void)setEventID:(int64_t)a3
{
  self->_eventID = a3;
}

- (int64_t)version
{
  return self->_version;
}

- (void)setVersion:(int64_t)a3
{
  self->_version = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (NSString)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(id)a3
{
}

- (int64_t)mailboxID
{
  return self->_mailboxID;
}

- (void)setMailboxID:(int64_t)a3
{
  self->_mailboxID = a3;
}

- (int64_t)conversationID
{
  return self->_conversationID;
}

- (void)setConversationID:(int64_t)a3
{
  self->_conversationID = a3;
}

- (int64_t)messageIDHash
{
  return self->_messageIDHash;
}

- (void)setMessageIDHash:(int64_t)a3
{
  self->_messageIDHash = a3;
}

- (int64_t)messagePersistentID
{
  return self->_messagePersistentID;
}

- (void)setMessagePersistentID:(int64_t)a3
{
  self->_messagePersistentID = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSDictionary)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_accountID, 0);

  objc_storeStrong((id *)&self->_date, 0);
}

@end