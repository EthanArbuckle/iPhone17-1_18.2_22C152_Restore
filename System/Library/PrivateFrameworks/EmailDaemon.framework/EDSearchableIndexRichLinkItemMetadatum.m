@interface EDSearchableIndexRichLinkItemMetadatum
- (EDPersistedRichLinkID)richLinkID;
- (EDSearchableIndexRichLinkItemMetadatum)initWithDomainIdentifier:(id)a3 accountIdentifier:(id)a4 mailboxIdentifiers:(id)a5 senderAddress:(id)a6 recipientAddresses:(id)a7 dateReceived:(id)a8 dateSent:(id)a9 url:(id)a10 richLinkID:(id)a11 title:(id)a12;
- (NSArray)mailboxIdentifiers;
- (NSArray)recipientAddresses;
- (NSDate)dateReceived;
- (NSDate)dateSent;
- (NSString)accountIdentifier;
- (NSString)domainIdentifier;
- (NSString)senderAddress;
- (NSString)title;
- (NSString)url;
@end

@implementation EDSearchableIndexRichLinkItemMetadatum

- (EDSearchableIndexRichLinkItemMetadatum)initWithDomainIdentifier:(id)a3 accountIdentifier:(id)a4 mailboxIdentifiers:(id)a5 senderAddress:(id)a6 recipientAddresses:(id)a7 dateReceived:(id)a8 dateSent:(id)a9 url:(id)a10 richLinkID:(id)a11 title:(id)a12
{
  id v45 = a3;
  id v44 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v43 = a8;
  id v42 = a9;
  id v21 = a10;
  id v22 = a11;
  id v23 = a12;
  v46.receiver = self;
  v46.super_class = (Class)EDSearchableIndexRichLinkItemMetadatum;
  v24 = [(EDSearchableIndexRichLinkItemMetadatum *)&v46 init];
  if (v24)
  {
    uint64_t v25 = objc_msgSend(v45, "copy", v42, v43);
    domainIdentifier = v24->_domainIdentifier;
    v24->_domainIdentifier = (NSString *)v25;

    uint64_t v27 = [v44 copy];
    accountIdentifier = v24->_accountIdentifier;
    v24->_accountIdentifier = (NSString *)v27;

    uint64_t v29 = [v18 copy];
    mailboxIdentifiers = v24->_mailboxIdentifiers;
    v24->_mailboxIdentifiers = (NSArray *)v29;

    uint64_t v31 = [v19 copy];
    senderAddress = v24->_senderAddress;
    v24->_senderAddress = (NSString *)v31;

    uint64_t v33 = [v20 copy];
    recipientAddresses = v24->_recipientAddresses;
    v24->_recipientAddresses = (NSArray *)v33;

    objc_storeStrong((id *)&v24->_dateReceived, a8);
    objc_storeStrong((id *)&v24->_dateSent, a9);
    uint64_t v35 = [v21 copy];
    url = v24->_url;
    v24->_url = (NSString *)v35;

    uint64_t v37 = [v22 copy];
    richLinkID = v24->_richLinkID;
    v24->_richLinkID = (EDPersistedRichLinkID *)v37;

    uint64_t v39 = [v23 copy];
    title = v24->_title;
    v24->_title = (NSString *)v39;
  }
  return v24;
}

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (NSArray)mailboxIdentifiers
{
  return self->_mailboxIdentifiers;
}

- (NSString)senderAddress
{
  return self->_senderAddress;
}

- (NSArray)recipientAddresses
{
  return self->_recipientAddresses;
}

- (NSDate)dateReceived
{
  return self->_dateReceived;
}

- (NSDate)dateSent
{
  return self->_dateSent;
}

- (NSString)title
{
  return self->_title;
}

- (EDPersistedRichLinkID)richLinkID
{
  return self->_richLinkID;
}

- (NSString)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_richLinkID, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_dateSent, 0);
  objc_storeStrong((id *)&self->_dateReceived, 0);
  objc_storeStrong((id *)&self->_recipientAddresses, 0);
  objc_storeStrong((id *)&self->_senderAddress, 0);
  objc_storeStrong((id *)&self->_mailboxIdentifiers, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);

  objc_storeStrong((id *)&self->_domainIdentifier, 0);
}

@end