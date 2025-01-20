@interface WFSendEmailContent
+ (BOOL)supportsSecureCoding;
- (BOOL)isHTML;
- (NSArray)attachments;
- (NSArray)bccRecipients;
- (NSArray)ccRecipients;
- (NSArray)toRecipients;
- (NSString)body;
- (NSString)subject;
- (WFSendEmailContent)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAttachments:(id)a3;
- (void)setBccRecipients:(id)a3;
- (void)setBody:(id)a3;
- (void)setCcRecipients:(id)a3;
- (void)setIsHTML:(BOOL)a3;
- (void)setSubject:(id)a3;
- (void)setToRecipients:(id)a3;
@end

@implementation WFSendEmailContent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_bccRecipients, 0);
  objc_storeStrong((id *)&self->_ccRecipients, 0);
  objc_storeStrong((id *)&self->_toRecipients, 0);
}

- (void)setAttachments:(id)a3
{
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (void)setIsHTML:(BOOL)a3
{
  self->_isHTML = a3;
}

- (BOOL)isHTML
{
  return self->_isHTML;
}

- (void)setBody:(id)a3
{
}

- (NSString)body
{
  return self->_body;
}

- (void)setSubject:(id)a3
{
}

- (NSString)subject
{
  return self->_subject;
}

- (void)setBccRecipients:(id)a3
{
}

- (NSArray)bccRecipients
{
  return self->_bccRecipients;
}

- (void)setCcRecipients:(id)a3
{
}

- (NSArray)ccRecipients
{
  return self->_ccRecipients;
}

- (void)setToRecipients:(id)a3
{
}

- (NSArray)toRecipients
{
  return self->_toRecipients;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFSendEmailContent *)self toRecipients];
  [v4 encodeObject:v5 forKey:@"toRecipients"];

  v6 = [(WFSendEmailContent *)self ccRecipients];
  [v4 encodeObject:v6 forKey:@"ccRecipients"];

  v7 = [(WFSendEmailContent *)self bccRecipients];
  [v4 encodeObject:v7 forKey:@"bccRecipients"];

  v8 = [(WFSendEmailContent *)self subject];
  [v4 encodeObject:v8 forKey:@"subject"];

  v9 = [(WFSendEmailContent *)self body];
  [v4 encodeObject:v9 forKey:@"body"];

  objc_msgSend(v4, "encodeBool:forKey:", -[WFSendEmailContent isHTML](self, "isHTML"), @"isHTML");
  id v10 = [(WFSendEmailContent *)self attachments];
  [v4 encodeObject:v10 forKey:@"attachments"];
}

- (WFSendEmailContent)initWithCoder:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)WFSendEmailContent;
  v5 = [(WFSendEmailContent *)&v32 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"toRecipients"];
    toRecipients = v5->_toRecipients;
    v5->_toRecipients = (NSArray *)v9;

    v11 = (void *)MEMORY[0x263EFFA08];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"ccRecipients"];
    ccRecipients = v5->_ccRecipients;
    v5->_ccRecipients = (NSArray *)v14;

    v16 = (void *)MEMORY[0x263EFFA08];
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"bccRecipients"];
    bccRecipients = v5->_bccRecipients;
    v5->_bccRecipients = (NSArray *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subject"];
    subject = v5->_subject;
    v5->_subject = (NSString *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"body"];
    body = v5->_body;
    v5->_body = (NSString *)v23;

    v5->_isHTML = [v4 decodeBoolForKey:@"isHTML"];
    v25 = (void *)MEMORY[0x263EFFA08];
    uint64_t v26 = objc_opt_class();
    v27 = objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
    uint64_t v28 = [v4 decodeObjectOfClasses:v27 forKey:@"attachments"];
    attachments = v5->_attachments;
    v5->_attachments = (NSArray *)v28;

    v30 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end