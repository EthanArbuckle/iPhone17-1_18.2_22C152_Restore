@interface ATXMailMessage
+ (BOOL)supportsSecureCoding;
- (ATXMailMessage)initWithCoder:(id)a3;
- (ATXMailMessage)initWithMailID:(id)a3 bundleID:(id)a4 dateReceived:(id)a5 sender:(id)a6 recipients:(id)a7 subject:(id)a8 body:(id)a9;
- (ATXNamedHandle)sender;
- (NSArray)recipients;
- (NSDate)dateReceived;
- (NSString)body;
- (NSString)bundleID;
- (NSString)mailID;
- (NSString)subject;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXMailMessage

- (ATXMailMessage)initWithMailID:(id)a3 bundleID:(id)a4 dateReceived:(id)a5 sender:(id)a6 recipients:(id)a7 subject:(id)a8 body:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v33 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v34.receiver = self;
  v34.super_class = (Class)ATXMailMessage;
  v21 = [(ATXMailMessage *)&v34 init];
  if (v21)
  {
    uint64_t v22 = [v15 copy];
    mailID = v21->_mailID;
    v21->_mailID = (NSString *)v22;

    uint64_t v24 = [v16 copy];
    bundleID = v21->_bundleID;
    v21->_bundleID = (NSString *)v24;

    objc_storeStrong((id *)&v21->_dateReceived, a5);
    objc_storeStrong((id *)&v21->_sender, a6);
    uint64_t v26 = [v18 copy];
    recipients = v21->_recipients;
    v21->_recipients = (NSArray *)v26;

    uint64_t v28 = [v19 copy];
    subject = v21->_subject;
    v21->_subject = (NSString *)v28;

    uint64_t v30 = [v20 copy];
    body = v21->_body;
    v21->_body = (NSString *)v30;
  }
  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ATXMailMessage *)self mailID];
  [v4 encodeObject:v5 forKey:@"mailID"];

  v6 = [(ATXMailMessage *)self bundleID];
  [v4 encodeObject:v6 forKey:@"bundleID"];

  v7 = [(ATXMailMessage *)self dateReceived];
  [v4 encodeObject:v7 forKey:@"dateReceived"];

  v8 = [(ATXMailMessage *)self sender];
  [v4 encodeObject:v8 forKey:@"sender"];

  v9 = [(ATXMailMessage *)self recipients];
  [v4 encodeObject:v9 forKey:@"recipients"];

  v10 = [(ATXMailMessage *)self subject];
  [v4 encodeObject:v10 forKey:@"subject"];

  id v11 = [(ATXMailMessage *)self body];
  [v4 encodeObject:v11 forKey:@"body"];
}

- (ATXMailMessage)initWithCoder:(id)a3
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)ATXMailMessage;
  v5 = [(ATXMailMessage *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mailID"];
    mailID = v5->_mailID;
    v5->_mailID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateReceived"];
    dateReceived = v5->_dateReceived;
    v5->_dateReceived = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sender"];
    sender = v5->_sender;
    v5->_sender = (ATXNamedHandle *)v12;

    v14 = (void *)MEMORY[0x1E4F1CAD0];
    v26[0] = objc_opt_class();
    v26[1] = objc_opt_class();
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
    id v16 = [v14 setWithArray:v15];
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"recipients"];
    recipients = v5->_recipients;
    v5->_recipients = (NSArray *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subject"];
    subject = v5->_subject;
    v5->_subject = (NSString *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"body"];
    body = v5->_body;
    v5->_body = (NSString *)v21;

    v23 = v5;
  }

  return v5;
}

- (NSString)mailID
{
  return self->_mailID;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSDate)dateReceived
{
  return self->_dateReceived;
}

- (ATXNamedHandle)sender
{
  return self->_sender;
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (NSString)subject
{
  return self->_subject;
}

- (NSString)body
{
  return self->_body;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_dateReceived, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_mailID, 0);
}

@end