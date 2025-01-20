@interface EDSearchableIndexAttachmentItemMetadatum
- (BOOL)canReadAttachmentFile;
- (EDSearchableIndexAttachmentItemMetadatum)initWithAttachmentFileURL:(id)a3 name:(id)a4 domainIdentifier:(id)a5 accountIdentifier:(id)a6 mailboxIdentifiers:(id)a7 messageIDHeader:(id)a8 senderAddress:(id)a9 recipientAddresses:(id)a10 dateReceived:(id)a11 dateSent:(id)a12;
- (NSArray)mailboxIdentifiers;
- (NSArray)recipientAddresses;
- (NSDate)dateReceived;
- (NSDate)dateSent;
- (NSString)accountIdentifier;
- (NSString)domainIdentifier;
- (NSString)messageIDHeader;
- (NSString)name;
- (NSString)senderAddress;
- (NSURL)attachmentFileURL;
- (UTType)contentType;
- (void)setContentType:(id)a3;
@end

@implementation EDSearchableIndexAttachmentItemMetadatum

- (EDSearchableIndexAttachmentItemMetadatum)initWithAttachmentFileURL:(id)a3 name:(id)a4 domainIdentifier:(id)a5 accountIdentifier:(id)a6 mailboxIdentifiers:(id)a7 messageIDHeader:(id)a8 senderAddress:(id)a9 recipientAddresses:(id)a10 dateReceived:(id)a11 dateSent:(id)a12
{
  id v44 = a3;
  id v46 = a4;
  id v18 = a5;
  id v45 = a6;
  id v19 = a7;
  id v20 = a8;
  v21 = v18;
  id v22 = a9;
  id v23 = a10;
  id v43 = a11;
  id v24 = a12;
  v47.receiver = self;
  v47.super_class = (Class)EDSearchableIndexAttachmentItemMetadatum;
  v25 = [(EDSearchableIndexAttachmentItemMetadatum *)&v47 init];
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_attachmentFileURL, a3);
    uint64_t v27 = [v46 copy];
    name = v26->_name;
    v26->_name = (NSString *)v27;

    uint64_t v29 = [v21 copy];
    domainIdentifier = v26->_domainIdentifier;
    v26->_domainIdentifier = (NSString *)v29;

    uint64_t v31 = [v45 copy];
    accountIdentifier = v26->_accountIdentifier;
    v26->_accountIdentifier = (NSString *)v31;

    uint64_t v33 = [v19 copy];
    mailboxIdentifiers = v26->_mailboxIdentifiers;
    v26->_mailboxIdentifiers = (NSArray *)v33;

    uint64_t v35 = [v20 copy];
    messageIDHeader = v26->_messageIDHeader;
    v26->_messageIDHeader = (NSString *)v35;

    uint64_t v37 = [v22 copy];
    senderAddress = v26->_senderAddress;
    v26->_senderAddress = (NSString *)v37;

    uint64_t v39 = [v23 copy];
    recipientAddresses = v26->_recipientAddresses;
    v26->_recipientAddresses = (NSArray *)v39;

    objc_storeStrong((id *)&v26->_dateReceived, a11);
    objc_storeStrong((id *)&v26->_dateSent, a12);
  }

  return v26;
}

- (BOOL)canReadAttachmentFile
{
  v2 = [(EDSearchableIndexAttachmentItemMetadatum *)self attachmentFileURL];
  if ([v2 isFileURL])
  {
    v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    v4 = [v2 path];
    char v5 = [v3 isReadableFileAtPath:v4];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (UTType)contentType
{
  contentType = self->_contentType;
  if (!contentType)
  {
    v4 = (void *)MEMORY[0x1E4F442D8];
    char v5 = [(EDSearchableIndexAttachmentItemMetadatum *)self name];
    v6 = [(EDSearchableIndexAttachmentItemMetadatum *)self attachmentFileURL];
    objc_msgSend(v4, "em_contentTypeForFilename:fileURL:", v5, v6);
    v7 = (UTType *)objc_claimAutoreleasedReturnValue();
    v8 = self->_contentType;
    self->_contentType = v7;

    contentType = self->_contentType;
  }

  return contentType;
}

- (NSURL)attachmentFileURL
{
  return self->_attachmentFileURL;
}

- (NSString)name
{
  return self->_name;
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

- (NSString)messageIDHeader
{
  return self->_messageIDHeader;
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

- (void)setContentType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_dateSent, 0);
  objc_storeStrong((id *)&self->_dateReceived, 0);
  objc_storeStrong((id *)&self->_recipientAddresses, 0);
  objc_storeStrong((id *)&self->_senderAddress, 0);
  objc_storeStrong((id *)&self->_messageIDHeader, 0);
  objc_storeStrong((id *)&self->_mailboxIdentifiers, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_domainIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_attachmentFileURL, 0);
}

@end