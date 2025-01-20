@interface ECServerMessage
- (BOOL)isEqual:(id)a3;
- (ECMessageFlags)serverFlags;
- (ECServerMessage)init;
- (ECServerMessage)initWithIMAPServerMessageBuilder:(id)a3;
- (ECServerMessage)initWithServerMessageBuilder:(id)a3;
- (NSSet)labels;
- (NSString)messagePersistentID;
- (NSString)persistentID;
- (NSString)remoteID;
- (id)remoteIDObject;
- (unint64_t)hash;
- (unsigned)imapUID;
- (void)setImapUID:(unsigned int)a3;
- (void)setLabels:(id)a3;
- (void)setMessagePersistentID:(id)a3;
- (void)setPersistentID:(id)a3;
- (void)setRemoteID:(id)a3;
- (void)setServerFlags:(id)a3;
@end

@implementation ECServerMessage

- (ECServerMessage)initWithServerMessageBuilder:(id)a3
{
  v4 = (void (**)(id, ECServerMessage *))a3;
  v7.receiver = self;
  v7.super_class = (Class)ECServerMessage;
  v5 = [(ECServerMessage *)&v7 init];
  if (v5) {
    v4[2](v4, v5);
  }

  return v5;
}

- (ECServerMessage)initWithIMAPServerMessageBuilder:(id)a3
{
  v4 = (void (**)(id, ECServerMessage *))a3;
  v7.receiver = self;
  v7.super_class = (Class)ECServerMessage;
  v5 = [(ECServerMessage *)&v7 init];
  if (v5) {
    v4[2](v4, v5);
  }

  return v5;
}

- (ECServerMessage)init
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(ECServerMessage *)self remoteID];
    objc_super v7 = [v5 remoteID];
    char v8 = [v6 isEqualToString:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(ECServerMessage *)self remoteID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (unsigned)imapUID
{
  imapUID = self->_imapUID;
  if (!imapUID)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"ECServerMessage.m" lineNumber:62 description:@"Trying to get an IMAP UID from a server message with a string remote_id"];

    imapUID = self->_imapUID;
  }
  return [(NSNumber *)imapUID unsignedIntValue];
}

- (void)setImapUID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  objc_msgSend(NSNumber, "numberWithUnsignedInt:");
  id v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  imapUID = self->_imapUID;
  self->_imapUID = v5;

  objc_msgSend(NSString, "stringWithFormat:", @"%u", v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  -[ECServerMessage setRemoteID:](self, "setRemoteID:");
}

- (id)remoteIDObject
{
  imapUID = self->_imapUID;
  if (!imapUID) {
    imapUID = (NSNumber *)self->_remoteID;
  }
  return imapUID;
}

- (NSString)persistentID
{
  return self->_persistentID;
}

- (void)setPersistentID:(id)a3
{
}

- (NSString)messagePersistentID
{
  return self->_messagePersistentID;
}

- (void)setMessagePersistentID:(id)a3
{
}

- (ECMessageFlags)serverFlags
{
  return self->_serverFlags;
}

- (void)setServerFlags:(id)a3
{
}

- (NSString)remoteID
{
  return self->_remoteID;
}

- (void)setRemoteID:(id)a3
{
}

- (NSSet)labels
{
  return self->_labels;
}

- (void)setLabels:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_remoteID, 0);
  objc_storeStrong((id *)&self->_serverFlags, 0);
  objc_storeStrong((id *)&self->_messagePersistentID, 0);
  objc_storeStrong((id *)&self->_persistentID, 0);
  objc_storeStrong((id *)&self->_imapUID, 0);
}

@end