@interface STSiriMessage
+ (BOOL)supportsSecureCoding;
- (BOOL)isOutbound;
- (STSiriMessage)init;
- (STSiriMessage)initWithCoder:(id)a3;
- (id)_aceContextObjectValue;
- (id)attachmentURL;
- (id)bodyText;
- (id)chatIdentifier;
- (id)effect;
- (id)groupName;
- (id)groupNameId;
- (id)recipientAddresses;
- (id)sendDate;
- (id)senderAddress;
- (id)senderInternalGUID;
- (id)subjectText;
- (void)_setSenderInternalGUID:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAttachmentURL:(id)a3;
- (void)setBodyText:(id)a3;
- (void)setChatIdentifier:(id)a3;
- (void)setEffect:(id)a3;
- (void)setGroupName:(id)a3;
- (void)setGroupNameId:(id)a3;
- (void)setOutbound:(BOOL)a3;
- (void)setRecipientAddresses:(id)a3;
- (void)setSendDate:(id)a3;
- (void)setSenderAddress:(id)a3;
- (void)setSubjectText:(id)a3;
@end

@implementation STSiriMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chatIdentifier, 0);
  objc_storeStrong((id *)&self->_sendDate, 0);
  objc_storeStrong((id *)&self->_attachmentURL, 0);
  objc_storeStrong((id *)&self->_effect, 0);
  objc_storeStrong((id *)&self->_bodyText, 0);
  objc_storeStrong((id *)&self->_subjectText, 0);
  objc_storeStrong((id *)&self->_groupNameId, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_recipientAddresses, 0);
  objc_storeStrong((id *)&self->_senderInternalGUID, 0);
  objc_storeStrong((id *)&self->_senderAddress, 0);
}

- (STSiriMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)STSiriMessage;
  v5 = [(STSiriModelObject *)&v38 initWithCoder:v4];
  if (v5)
  {
    v5->_outbound = [v4 decodeBoolForKey:@"Outbound"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SenderAddress"];
    senderAddress = v5->_senderAddress;
    v5->_senderAddress = (STContactAddress *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SenderInternalGUID"];
    senderInternalGUID = v5->_senderInternalGUID;
    v5->_senderInternalGUID = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"RecipientAddresses"];
    recipientAddresses = v5->_recipientAddresses;
    v5->_recipientAddresses = (NSArray *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"GroupName"];
    groupName = v5->_groupName;
    v5->_groupName = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"GroupNameId"];
    groupNameId = v5->_groupNameId;
    v5->_groupNameId = (NSString *)v17;

    v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SubjectText"];
    uint64_t v20 = [v19 copy];
    subjectText = v5->_subjectText;
    v5->_subjectText = (NSString *)v20;

    v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BodyText"];
    uint64_t v23 = [v22 copy];
    bodyText = v5->_bodyText;
    v5->_bodyText = (NSString *)v23;

    v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AttachmentURL"];
    uint64_t v26 = [v25 copy];
    attachmentURL = v5->_attachmentURL;
    v5->_attachmentURL = (NSURL *)v26;

    v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SendDate"];
    uint64_t v29 = [v28 copy];
    sendDate = v5->_sendDate;
    v5->_sendDate = (NSDate *)v29;

    v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ChatIdentifier"];
    uint64_t v32 = [v31 copy];
    chatIdentifier = v5->_chatIdentifier;
    v5->_chatIdentifier = (NSString *)v32;

    v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Effect"];
    uint64_t v35 = [v34 copy];
    effect = v5->_effect;
    v5->_effect = (NSString *)v35;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STSiriMessage;
  id v4 = a3;
  [(STSiriModelObject *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", self->_outbound, @"Outbound", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_senderAddress forKey:@"SenderAddress"];
  [v4 encodeObject:self->_senderInternalGUID forKey:@"SenderInternalGUID"];
  [v4 encodeObject:self->_recipientAddresses forKey:@"RecipientAddresses"];
  [v4 encodeObject:self->_groupName forKey:@"GroupName"];
  [v4 encodeObject:self->_groupNameId forKey:@"GroupNameId"];
  [v4 encodeObject:self->_subjectText forKey:@"SubjectText"];
  [v4 encodeObject:self->_bodyText forKey:@"BodyText"];
  [v4 encodeObject:self->_attachmentURL forKey:@"AttachmentURL"];
  [v4 encodeObject:self->_sendDate forKey:@"SendDate"];
  [v4 encodeObject:self->_chatIdentifier forKey:@"ChatIdentifier"];
  [v4 encodeObject:self->_effect forKey:@"Effect"];
}

- (id)_aceContextObjectValue
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F96A60]);
  id v4 = (void *)MEMORY[0x1E4F1CB10];
  objc_super v5 = [(STSiriModelObject *)self identifier];
  uint64_t v6 = objc_msgSend(v4, "_af_URLWithMessageIdentifier:", v5);
  [v3 setIdentifier:v6];

  v7 = [(STSiriMessage *)self attachmentURL];
  if (v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F96550]);
    [v8 setIdentifier:v7];
    v35[0] = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
    [v3 setAttachments:v9];
  }
  v10 = [(STSiriMessage *)self sendDate];
  [v3 setDateSent:v10];

  uint64_t v11 = [(STSiriMessage *)self bodyText];
  [v3 setMessage:v11];

  v12 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[STSiriMessage isOutbound](self, "isOutbound"));
  [v3 setOutgoing:v12];

  uint64_t v13 = [(STSiriMessage *)self subjectText];
  [v3 setSubject:v13];

  v14 = [(STSiriMessage *)self chatIdentifier];
  [v3 setChatIdentifier:v14];

  uint64_t v15 = [(STSiriMessage *)self groupName];
  [v3 setGroupName:v15];

  v16 = [(STSiriMessage *)self groupNameId];
  [v3 setGroupNameId:v16];

  uint64_t v17 = [(STSiriMessage *)self senderAddress];
  v18 = [v17 _aceContextObjectValue];
  [v3 setMsgSender:v18];

  id v19 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v20 = [(STSiriMessage *)self recipientAddresses];
  v21 = objc_msgSend(v19, "initWithCapacity:", objc_msgSend(v20, "count"));

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v22 = [(STSiriMessage *)self recipientAddresses];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v31 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = [*(id *)(*((void *)&v30 + 1) + 8 * i) _aceContextObjectValue];
        [v21 addObject:v27];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v24);
  }

  [v3 setMsgRecipients:v21];
  v28 = [(STSiriMessage *)self effect];
  [v3 setEffect:v28];

  return v3;
}

- (void)setChatIdentifier:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  chatIdentifier = self->_chatIdentifier;
  self->_chatIdentifier = v4;
}

- (id)chatIdentifier
{
  return self->_chatIdentifier;
}

- (void)setSendDate:(id)a3
{
  id v4 = (NSDate *)[a3 copy];
  sendDate = self->_sendDate;
  self->_sendDate = v4;
}

- (id)sendDate
{
  return self->_sendDate;
}

- (void)setAttachmentURL:(id)a3
{
  id v4 = (NSURL *)[a3 copy];
  attachmentURL = self->_attachmentURL;
  self->_attachmentURL = v4;
}

- (id)attachmentURL
{
  return self->_attachmentURL;
}

- (void)setEffect:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  effect = self->_effect;
  self->_effect = v4;
}

- (id)effect
{
  return self->_effect;
}

- (void)setBodyText:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  bodyText = self->_bodyText;
  self->_bodyText = v4;
}

- (id)bodyText
{
  return self->_bodyText;
}

- (void)setSubjectText:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  subjectText = self->_subjectText;
  self->_subjectText = v4;
}

- (id)subjectText
{
  return self->_subjectText;
}

- (void)setGroupNameId:(id)a3
{
}

- (id)groupNameId
{
  return self->_groupNameId;
}

- (void)setGroupName:(id)a3
{
}

- (id)groupName
{
  return self->_groupName;
}

- (void)setRecipientAddresses:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4) {
    objc_super v5 = (void *)[v4 copy];
  }
  else {
    objc_super v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  objc_storeStrong((id *)&self->_recipientAddresses, v5);
  uint64_t v6 = v7;
  if (v7)
  {

    uint64_t v6 = v7;
  }
}

- (id)recipientAddresses
{
  return self->_recipientAddresses;
}

- (void)_setSenderInternalGUID:(id)a3
{
}

- (id)senderInternalGUID
{
  return self->_senderInternalGUID;
}

- (void)setSenderAddress:(id)a3
{
}

- (id)senderAddress
{
  return self->_senderAddress;
}

- (void)setOutbound:(BOOL)a3
{
  self->_outbound = a3;
}

- (BOOL)isOutbound
{
  return self->_outbound;
}

- (STSiriMessage)init
{
  v6.receiver = self;
  v6.super_class = (Class)STSiriMessage;
  v2 = [(STSiriMessage *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    recipientAddresses = v2->_recipientAddresses;
    v2->_recipientAddresses = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end