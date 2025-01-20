@interface EDSearchableIndexPersistenceAttachmentDatum
- (EDPersistedAttachmentID)attachmentPersistentID;
- (EDPersistedMessageID)messagePersistentID;
- (EDSearchableIndexPersistenceAttachmentDatum)initWithAttachmentPersistentID:(id)a3 messagePersistentID:(id)a4 attachmentID:(id)a5 name:(id)a6 mailboxID:(int64_t)a7;
- (NSString)attachmentID;
- (NSString)name;
- (int64_t)mailboxID;
@end

@implementation EDSearchableIndexPersistenceAttachmentDatum

- (EDSearchableIndexPersistenceAttachmentDatum)initWithAttachmentPersistentID:(id)a3 messagePersistentID:(id)a4 attachmentID:(id)a5 name:(id)a6 mailboxID:(int64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v26.receiver = self;
  v26.super_class = (Class)EDSearchableIndexPersistenceAttachmentDatum;
  v16 = [(EDSearchableIndexPersistenceAttachmentDatum *)&v26 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    attachmentPersistentID = v16->_attachmentPersistentID;
    v16->_attachmentPersistentID = (EDPersistedAttachmentID *)v17;

    uint64_t v19 = [v13 copy];
    messagePersistentID = v16->_messagePersistentID;
    v16->_messagePersistentID = (EDPersistedMessageID *)v19;

    uint64_t v21 = [v14 copy];
    attachmentID = v16->_attachmentID;
    v16->_attachmentID = (NSString *)v21;

    uint64_t v23 = [v15 copy];
    name = v16->_name;
    v16->_name = (NSString *)v23;

    v16->_mailboxID = a7;
  }

  return v16;
}

- (EDPersistedAttachmentID)attachmentPersistentID
{
  return self->_attachmentPersistentID;
}

- (EDPersistedMessageID)messagePersistentID
{
  return self->_messagePersistentID;
}

- (NSString)attachmentID
{
  return self->_attachmentID;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)mailboxID
{
  return self->_mailboxID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_attachmentID, 0);
  objc_storeStrong((id *)&self->_messagePersistentID, 0);

  objc_storeStrong((id *)&self->_attachmentPersistentID, 0);
}

@end