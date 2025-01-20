@interface EDSearchableIndexPersistenceRichLinkDatum
- (EDPersistedMessageID)messageID;
- (EDPersistedRichLinkID)richLinkID;
- (EDSearchableIndexPersistenceRichLinkDatum)initWithMessageID:(id)a3 richLinkID:(id)a4 mailboxID:(int64_t)a5 title:(id)a6 url:(id)a7;
- (NSString)title;
- (NSString)url;
- (int64_t)mailboxID;
@end

@implementation EDSearchableIndexPersistenceRichLinkDatum

- (EDSearchableIndexPersistenceRichLinkDatum)initWithMessageID:(id)a3 richLinkID:(id)a4 mailboxID:(int64_t)a5 title:(id)a6 url:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v26.receiver = self;
  v26.super_class = (Class)EDSearchableIndexPersistenceRichLinkDatum;
  v16 = [(EDSearchableIndexPersistenceRichLinkDatum *)&v26 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    messageID = v16->_messageID;
    v16->_messageID = (EDPersistedMessageID *)v17;

    uint64_t v19 = [v13 copy];
    richLinkID = v16->_richLinkID;
    v16->_richLinkID = (EDPersistedRichLinkID *)v19;

    v16->_mailboxID = a5;
    uint64_t v21 = [v14 copy];
    title = v16->_title;
    v16->_title = (NSString *)v21;

    uint64_t v23 = [v15 copy];
    url = v16->_url;
    v16->_url = (NSString *)v23;
  }
  return v16;
}

- (EDPersistedMessageID)messageID
{
  return self->_messageID;
}

- (EDPersistedRichLinkID)richLinkID
{
  return self->_richLinkID;
}

- (int64_t)mailboxID
{
  return self->_mailboxID;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_richLinkID, 0);

  objc_storeStrong((id *)&self->_messageID, 0);
}

@end