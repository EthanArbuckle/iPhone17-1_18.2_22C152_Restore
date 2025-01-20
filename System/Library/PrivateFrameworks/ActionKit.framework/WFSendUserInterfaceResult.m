@interface WFSendUserInterfaceResult
+ (BOOL)supportsSecureCoding;
- (NSArray)attachments;
- (NSArray)recipients;
- (NSString)content;
- (NSString)subject;
- (WFSendUserInterfaceResult)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAttachments:(id)a3;
- (void)setContent:(id)a3;
- (void)setRecipients:(id)a3;
- (void)setSubject:(id)a3;
@end

@implementation WFSendUserInterfaceResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
}

- (void)setAttachments:(id)a3
{
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (void)setContent:(id)a3
{
}

- (NSString)content
{
  return self->_content;
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

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFSendUserInterfaceResult *)self recipients];
  [v4 encodeObject:v5 forKey:@"recipients"];

  v6 = [(WFSendUserInterfaceResult *)self subject];
  [v4 encodeObject:v6 forKey:@"subject"];

  v7 = [(WFSendUserInterfaceResult *)self content];
  [v4 encodeObject:v7 forKey:@"content"];

  id v8 = [(WFSendUserInterfaceResult *)self attachments];
  [v4 encodeObject:v8 forKey:@"attachments"];
}

- (WFSendUserInterfaceResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)WFSendUserInterfaceResult;
  v5 = [(WFSendUserInterfaceResult *)&v22 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"recipients"];
    recipients = v5->_recipients;
    v5->_recipients = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subject"];
    subject = v5->_subject;
    v5->_subject = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"content"];
    content = v5->_content;
    v5->_content = (NSString *)v13;

    v15 = (void *)MEMORY[0x263EFFA08];
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"attachments"];
    attachments = v5->_attachments;
    v5->_attachments = (NSArray *)v18;

    v20 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end