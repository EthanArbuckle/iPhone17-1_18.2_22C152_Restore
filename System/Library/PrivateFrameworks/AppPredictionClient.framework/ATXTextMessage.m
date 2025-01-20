@interface ATXTextMessage
+ (BOOL)supportsSecureCoding;
- (ATXNamedHandle)sender;
- (ATXTextMessage)initWithCoder:(id)a3;
- (ATXTextMessage)initWithMessageID:(id)a3 bundleID:(id)a4 dateReceived:(id)a5 threadID:(id)a6 sender:(id)a7 recipients:(id)a8 subject:(id)a9 body:(id)a10;
- (NSArray)recipients;
- (NSDate)dateReceived;
- (NSString)body;
- (NSString)bundleID;
- (NSString)messageID;
- (NSString)subject;
- (NSString)threadID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXTextMessage

- (ATXTextMessage)initWithMessageID:(id)a3 bundleID:(id)a4 dateReceived:(id)a5 threadID:(id)a6 sender:(id)a7 recipients:(id)a8 subject:(id)a9 body:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v37 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  v38.receiver = self;
  v38.super_class = (Class)ATXTextMessage;
  v23 = [(ATXTextMessage *)&v38 init];
  if (v23)
  {
    uint64_t v24 = [v16 copy];
    messageID = v23->_messageID;
    v23->_messageID = (NSString *)v24;

    uint64_t v26 = [v17 copy];
    bundleID = v23->_bundleID;
    v23->_bundleID = (NSString *)v26;

    objc_storeStrong((id *)&v23->_dateReceived, a5);
    uint64_t v28 = [v18 copy];
    threadID = v23->_threadID;
    v23->_threadID = (NSString *)v28;

    objc_storeStrong((id *)&v23->_sender, a7);
    uint64_t v30 = [v20 copy];
    recipients = v23->_recipients;
    v23->_recipients = (NSArray *)v30;

    uint64_t v32 = [v21 copy];
    subject = v23->_subject;
    v23->_subject = (NSString *)v32;

    uint64_t v34 = [v22 copy];
    body = v23->_body;
    v23->_body = (NSString *)v34;
  }
  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ATXTextMessage *)self messageID];
  [v4 encodeObject:v5 forKey:@"messageID"];

  v6 = [(ATXTextMessage *)self bundleID];
  [v4 encodeObject:v6 forKey:@"bundleID"];

  v7 = [(ATXTextMessage *)self dateReceived];
  [v4 encodeObject:v7 forKey:@"dateReceived"];

  v8 = [(ATXTextMessage *)self threadID];
  [v4 encodeObject:v8 forKey:@"threadID"];

  v9 = [(ATXTextMessage *)self sender];
  [v4 encodeObject:v9 forKey:@"sender"];

  v10 = [(ATXTextMessage *)self recipients];
  [v4 encodeObject:v10 forKey:@"recipients"];

  v11 = [(ATXTextMessage *)self subject];
  [v4 encodeObject:v11 forKey:@"subject"];

  id v12 = [(ATXTextMessage *)self body];
  [v4 encodeObject:v12 forKey:@"body"];
}

- (ATXTextMessage)initWithCoder:(id)a3
{
  v28[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)ATXTextMessage;
  v5 = [(ATXTextMessage *)&v27 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"messageID"];
    messageID = v5->_messageID;
    v5->_messageID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateReceived"];
    dateReceived = v5->_dateReceived;
    v5->_dateReceived = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"threadID"];
    threadID = v5->_threadID;
    v5->_threadID = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sender"];
    sender = v5->_sender;
    v5->_sender = (ATXNamedHandle *)v14;

    id v16 = (void *)MEMORY[0x1E4F1CAD0];
    v28[0] = objc_opt_class();
    v28[1] = objc_opt_class();
    id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
    id v18 = [v16 setWithArray:v17];
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"recipients"];
    recipients = v5->_recipients;
    v5->_recipients = (NSArray *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subject"];
    subject = v5->_subject;
    v5->_subject = (NSString *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"body"];
    body = v5->_body;
    v5->_body = (NSString *)v23;

    v25 = v5;
  }

  return v5;
}

- (NSString)messageID
{
  return self->_messageID;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSDate)dateReceived
{
  return self->_dateReceived;
}

- (NSString)threadID
{
  return self->_threadID;
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
  objc_storeStrong((id *)&self->_threadID, 0);
  objc_storeStrong((id *)&self->_dateReceived, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_messageID, 0);
}

@end