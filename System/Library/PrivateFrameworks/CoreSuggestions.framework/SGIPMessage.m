@interface SGIPMessage
+ (BOOL)supportsSecureCoding;
+ (id)messageWithIPMessage:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMessage:(id)a3;
- (BOOL)isGroupConversation;
- (BOOL)isSenderSignificant;
- (BOOL)isSent;
- (NSArray)messageUnits;
- (NSArray)recipients;
- (NSDate)dateSent;
- (NSString)messageId;
- (NSString)subject;
- (NSString)type;
- (SGIPMessage)initWithCoder:(id)a3;
- (SGIPPerson)sender;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDateSent:(id)a3;
- (void)setIsGroupConversation:(BOOL)a3;
- (void)setIsSenderSignificant:(BOOL)a3;
- (void)setIsSent:(BOOL)a3;
- (void)setMessageId:(id)a3;
- (void)setMessageUnits:(id)a3;
- (void)setRecipients:(id)a3;
- (void)setSender:(id)a3;
- (void)setSubject:(id)a3;
- (void)setType:(id)a3;
@end

@implementation SGIPMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_messageUnits, 0);
  objc_storeStrong((id *)&self->_dateSent, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_sender, 0);

  objc_storeStrong((id *)&self->_messageId, 0);
}

- (void)setType:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setMessageUnits:(id)a3
{
}

- (NSArray)messageUnits
{
  return self->_messageUnits;
}

- (void)setIsSenderSignificant:(BOOL)a3
{
  self->_isSenderSignificant = a3;
}

- (BOOL)isSenderSignificant
{
  return self->_isSenderSignificant;
}

- (void)setIsGroupConversation:(BOOL)a3
{
  self->_isGroupConversation = a3;
}

- (BOOL)isGroupConversation
{
  return self->_isGroupConversation;
}

- (void)setIsSent:(BOOL)a3
{
  self->_isSent = a3;
}

- (BOOL)isSent
{
  return self->_isSent;
}

- (void)setDateSent:(id)a3
{
}

- (NSDate)dateSent
{
  return self->_dateSent;
}

- (void)setSubject:(id)a3
{
}

- (NSString)subject
{
  return self->_subject;
}

- (void)setRecipients:(id)a3
{
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void)setSender:(id)a3
{
}

- (SGIPPerson)sender
{
  return self->_sender;
}

- (void)setMessageId:(id)a3
{
}

- (NSString)messageId
{
  return self->_messageId;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SGIPMessage *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGIPMessage *)self isEqualToMessage:v5];

  return v6;
}

- (BOOL)isEqualToMessage:(id)a3
{
  v4 = (id *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_27;
  }
  messageId = self->_messageId;
  v7 = (NSString *)v4[2];
  if (messageId == v7)
  {
  }
  else
  {
    v8 = v7;
    v9 = messageId;
    char v10 = [(NSString *)v9 isEqual:v8];

    if ((v10 & 1) == 0) {
      goto LABEL_27;
    }
  }
  sender = self->_sender;
  v12 = (SGIPPerson *)v5[3];
  if (sender == v12)
  {
  }
  else
  {
    v13 = v12;
    v14 = sender;
    BOOL v15 = [(SGIPPerson *)v14 isEqual:v13];

    if (!v15) {
      goto LABEL_27;
    }
  }
  recipients = self->_recipients;
  v17 = (NSArray *)v5[4];
  if (recipients == v17)
  {
  }
  else
  {
    v18 = v17;
    v19 = recipients;
    char v20 = [(NSArray *)v19 isEqual:v18];

    if ((v20 & 1) == 0) {
      goto LABEL_27;
    }
  }
  subject = self->_subject;
  v22 = (NSString *)v5[5];
  if (subject == v22)
  {
  }
  else
  {
    v23 = v22;
    v24 = subject;
    char v25 = [(NSString *)v24 isEqual:v23];

    if ((v25 & 1) == 0) {
      goto LABEL_27;
    }
  }
  dateSent = self->_dateSent;
  v27 = (NSDate *)v5[6];
  if (dateSent == v27)
  {
  }
  else
  {
    v28 = v27;
    v29 = dateSent;
    char v30 = [(NSDate *)v29 isEqual:v28];

    if ((v30 & 1) == 0) {
      goto LABEL_27;
    }
  }
  if (self->_isSent != *((unsigned __int8 *)v5 + 8)
    || self->_isGroupConversation != *((unsigned __int8 *)v5 + 9)
    || self->_isSenderSignificant != *((unsigned __int8 *)v5 + 10))
  {
    goto LABEL_27;
  }
  messageUnits = self->_messageUnits;
  v32 = (NSArray *)v5[7];
  if (messageUnits == v32)
  {
  }
  else
  {
    v33 = v32;
    v34 = messageUnits;
    char v35 = [(NSArray *)v34 isEqual:v33];

    if ((v35 & 1) == 0)
    {
LABEL_27:
      char v36 = 0;
      goto LABEL_28;
    }
  }
  v38 = self->_type;
  v39 = v38;
  if (v38 == v5[8]) {
    char v36 = 1;
  }
  else {
    char v36 = -[NSString isEqual:](v38, "isEqual:");
  }

LABEL_28:
  return v36;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  uint64_t v5 = objc_opt_new();
  if (v5)
  {
    uint64_t v6 = [(NSString *)self->_messageId copyWithZone:a3];
    v7 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v6;

    id v8 = [(SGIPPerson *)self->_sender copyWithZone:a3];
    v9 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v8;

    uint64_t v10 = [(NSArray *)self->_recipients copyWithZone:a3];
    v11 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v10;

    uint64_t v12 = [(NSString *)self->_subject copyWithZone:a3];
    v13 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v12;

    uint64_t v14 = [(NSDate *)self->_dateSent copyWithZone:a3];
    BOOL v15 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v14;

    *(unsigned char *)(v5 + 8) = self->_isSent;
    *(unsigned char *)(v5 + 9) = self->_isGroupConversation;
    *(unsigned char *)(v5 + 10) = self->_isSenderSignificant;
    uint64_t v16 = [(NSArray *)self->_messageUnits copyWithZone:a3];
    v17 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v16;

    uint64_t v18 = [(NSString *)self->_type copyWithZone:a3];
    v19 = *(void **)(v5 + 64);
    *(void *)(v5 + 64) = v18;
  }
  return (id)v5;
}

- (void)encodeWithCoder:(id)a3
{
  messageId = self->_messageId;
  id v5 = a3;
  [v5 encodeObject:messageId forKey:@"mid"];
  [v5 encodeObject:self->_sender forKey:@"sen"];
  [v5 encodeObject:self->_recipients forKey:@"rec"];
  [v5 encodeObject:self->_subject forKey:@"sbj"];
  [v5 encodeObject:self->_dateSent forKey:@"dat"];
  [v5 encodeBool:self->_isSent forKey:@"snt"];
  [v5 encodeBool:self->_isGroupConversation forKey:@"igc"];
  [v5 encodeBool:self->_isSenderSignificant forKey:@"iss"];
  [v5 encodeObject:self->_messageUnits forKey:@"mun"];
  [v5 encodeObject:self->_type forKey:@"typ"];
}

- (SGIPMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (SGIPMessage *)objc_opt_new();
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mid"];
  [(SGIPMessage *)v5 setMessageId:v6];

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sen"];
  [(SGIPMessage *)v5 setSender:v7];

  id v8 = (void *)MEMORY[0x1A6265250]();
  id v9 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v9, "initWithObjects:", v10, objc_opt_class(), 0);
  uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"rec"];
  [(SGIPMessage *)v5 setRecipients:v12];

  v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sbj"];
  [(SGIPMessage *)v5 setSubject:v13];

  uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dat"];
  [(SGIPMessage *)v5 setDateSent:v14];

  -[SGIPMessage setIsSent:](v5, "setIsSent:", [v4 decodeBoolForKey:@"snt"]);
  -[SGIPMessage setIsGroupConversation:](v5, "setIsGroupConversation:", [v4 decodeBoolForKey:@"igc"]);
  BOOL v15 = (void *)MEMORY[0x1A6265250](-[SGIPMessage setIsSenderSignificant:](v5, "setIsSenderSignificant:", [v4 decodeBoolForKey:@"iss"]));
  id v16 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_msgSend(v16, "initWithObjects:", v17, objc_opt_class(), 0);
  v19 = [v4 decodeObjectOfClasses:v18 forKey:@"mun"];
  [(SGIPMessage *)v5 setMessageUnits:v19];

  char v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"typ"];
  [(SGIPMessage *)v5 setType:v20];

  return v5;
}

- (unint64_t)hash
{
  return [(NSString *)self->_messageId hash];
}

- (id)description
{
  id v3 = [NSString alloc];
  messageId = self->_messageId;
  id v5 = [(SGIPPerson *)self->_sender handle];
  uint64_t v6 = (void *)[v3 initWithFormat:@"<SGIPMessage id:%@ s:%@ sbj:'%@' d:%@>", messageId, v5, self->_subject, self->_dateSent];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)messageWithIPMessage:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = [v3 identifier];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setMessageId:v6];

  v7 = [v3 sender];
  id v8 = +[SGIPPerson personWithIPPerson:v7];
  char v35 = v4;
  [v4 setSender:v8];

  id v9 = objc_opt_new();
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v10 = [v3 recipients];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v41 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v40 + 1) + 8 * i);
        id v16 = (void *)MEMORY[0x1A6265250]();
        uint64_t v17 = +[SGIPPerson personWithIPPerson:v15];
        [v9 addObject:v17];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v12);
  }

  [v35 setRecipients:v9];
  uint64_t v18 = [v3 subject];
  v19 = (void *)[v18 copy];
  [v35 setSubject:v19];

  char v20 = [v3 dateSent];
  v21 = (void *)[v20 copy];
  [v35 setDateSent:v21];

  objc_msgSend(v35, "setIsSent:", objc_msgSend(v3, "isSent"));
  objc_msgSend(v35, "setIsGroupConversation:", objc_msgSend(v3, "isGroupConversation"));
  objc_msgSend(v35, "setIsSenderSignificant:", objc_msgSend(v3, "isSenderSignificant"));
  v22 = objc_opt_new();
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v23 = [v3 messageUnits];
  uint64_t v24 = [v23 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v37 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = *(void **)(*((void *)&v36 + 1) + 8 * j);
        v29 = (void *)MEMORY[0x1A6265250]();
        char v30 = [v28 text];

        if (v30)
        {
          v31 = [v28 text];
          [v22 addObject:v31];
        }
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v25);
  }

  [v35 setMessageUnits:v22];
  v32 = [v3 type];
  v33 = (void *)[v32 copy];
  [v35 setType:v33];

  return v35;
}

@end