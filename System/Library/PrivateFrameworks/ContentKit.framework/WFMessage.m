@interface WFMessage
+ (BOOL)supportsSecureCoding;
- (NSArray)recipientContactIDs;
- (NSArray)recipients;
- (NSArray)senderHandles;
- (NSString)content;
- (NSString)conversationID;
- (NSString)senderContactID;
- (WFMessage)initWithCoder:(id)a3;
- (WFMessage)initWithContent:(id)a3 conversationID:(id)a4 recipientContactIDs:(id)a5 recipients:(id)a6 senderContactID:(id)a7 senderHandles:(id)a8;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderHandles, 0);
  objc_storeStrong((id *)&self->_senderContactID, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_recipientContactIDs, 0);
  objc_storeStrong((id *)&self->_conversationID, 0);
  objc_storeStrong((id *)&self->_content, 0);
}

- (NSArray)senderHandles
{
  return self->_senderHandles;
}

- (NSString)senderContactID
{
  return self->_senderContactID;
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (NSArray)recipientContactIDs
{
  return self->_recipientContactIDs;
}

- (NSString)conversationID
{
  return self->_conversationID;
}

- (NSString)content
{
  return self->_content;
}

- (WFMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFMessage *)self init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"content"];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"conversationID"];
    v8 = (void *)MEMORY[0x263EFFA08];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v11 = [v4 decodeObjectOfClasses:v10 forKey:@"recipientContactIDs"];

    v12 = (void *)MEMORY[0x263EFFA08];
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v15 = [v4 decodeObjectOfClasses:v14 forKey:@"recipients"];

    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"senderContactID"];
    v17 = (void *)MEMORY[0x263EFFA08];
    uint64_t v18 = objc_opt_class();
    v19 = objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    v20 = [v4 decodeObjectOfClasses:v19 forKey:@"senderHandles"];

    v5 = [(WFMessage *)v5 initWithContent:v6 conversationID:v7 recipientContactIDs:v11 recipients:v15 senderContactID:v16 senderHandles:v20];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFMessage *)self content];
  [v4 encodeObject:v5 forKey:@"content"];

  v6 = [(WFMessage *)self conversationID];
  [v4 encodeObject:v6 forKey:@"conversationID"];

  v7 = [(WFMessage *)self recipientContactIDs];
  [v4 encodeObject:v7 forKey:@"recipientContactIDs"];

  v8 = [(WFMessage *)self recipients];
  [v4 encodeObject:v8 forKey:@"recipients"];

  uint64_t v9 = [(WFMessage *)self senderContactID];
  [v4 encodeObject:v9 forKey:@"senderContactID"];

  id v10 = [(WFMessage *)self senderHandles];
  [v4 encodeObject:v10 forKey:@"senderHandles"];
}

- (WFMessage)initWithContent:(id)a3 conversationID:(id)a4 recipientContactIDs:(id)a5 recipients:(id)a6 senderContactID:(id)a7 senderHandles:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v35.receiver = self;
  v35.super_class = (Class)WFMessage;
  v20 = [(WFMessage *)&v35 init];
  if (v20)
  {
    uint64_t v21 = [v14 copy];
    content = v20->_content;
    v20->_content = (NSString *)v21;

    uint64_t v23 = [v15 copy];
    conversationID = v20->_conversationID;
    v20->_conversationID = (NSString *)v23;

    uint64_t v25 = [v16 copy];
    recipientContactIDs = v20->_recipientContactIDs;
    v20->_recipientContactIDs = (NSArray *)v25;

    uint64_t v27 = [v17 copy];
    recipients = v20->_recipients;
    v20->_recipients = (NSArray *)v27;

    uint64_t v29 = [v18 copy];
    senderContactID = v20->_senderContactID;
    v20->_senderContactID = (NSString *)v29;

    uint64_t v31 = [v19 copy];
    senderHandles = v20->_senderHandles;
    v20->_senderHandles = (NSArray *)v31;

    v33 = v20;
  }

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end