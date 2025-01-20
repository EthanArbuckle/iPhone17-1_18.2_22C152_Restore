@interface DAMessageFetchAttachmentRequest
- (BOOL)isEqual:(id)a3;
- (DAMessageFetchAttachmentRequest)initWithAttachmentName:(id)a3 andMessageServerID:(id)a4;
- (NSString)attachmentName;
- (NSString)messageID;
- (id)description;
- (unint64_t)hash;
- (void)setAttachmentName:(id)a3;
- (void)setMessageID:(id)a3;
@end

@implementation DAMessageFetchAttachmentRequest

- (DAMessageFetchAttachmentRequest)initWithAttachmentName:(id)a3 andMessageServerID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DAMessageFetchAttachmentRequest;
  v8 = [(DAMessageFetchAttachmentRequest *)&v12 init];
  if (v8)
  {
    v9 = (void *)[v6 copy];
    [(DAMessageFetchAttachmentRequest *)v8 setAttachmentName:v9];

    v10 = (void *)[v7 copy];
    [(DAMessageFetchAttachmentRequest *)v8 setMessageID:v10];
  }
  return v8;
}

- (unint64_t)hash
{
  id v3 = [NSString alloc];
  v4 = [(DAMessageFetchAttachmentRequest *)self messageID];
  v5 = [(DAMessageFetchAttachmentRequest *)self attachmentName];
  id v6 = (void *)[v3 initWithFormat:@"%@\n%@", v4, v5];

  unint64_t v7 = [v6 hash];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    unint64_t v7 = [(DAMessageFetchAttachmentRequest *)self messageID];
    v8 = [v6 messageID];
    if (v7 != v8)
    {
      v9 = [(DAMessageFetchAttachmentRequest *)self messageID];
      id v3 = [v6 messageID];
      if (![v9 isEqual:v3])
      {
        char v10 = 0;
LABEL_11:

LABEL_12:
        goto LABEL_13;
      }
      v16 = v9;
    }
    v11 = [(DAMessageFetchAttachmentRequest *)self attachmentName];
    objc_super v12 = [v6 attachmentName];
    if (v11 == v12)
    {
      char v10 = 1;
    }
    else
    {
      v13 = [(DAMessageFetchAttachmentRequest *)self attachmentName];
      v14 = [v6 attachmentName];
      char v10 = [v13 isEqualToString:v14];
    }
    v9 = v16;
    if (v7 == v8) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  char v10 = 0;
LABEL_13:

  return v10;
}

- (id)description
{
  id v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)DAMessageFetchAttachmentRequest;
  v4 = [(DAMessageFetchAttachmentRequest *)&v9 description];
  id v5 = [(DAMessageFetchAttachmentRequest *)self messageID];
  id v6 = [(DAMessageFetchAttachmentRequest *)self attachmentName];
  unint64_t v7 = [v3 stringWithFormat:@"%@ messageID \"%@\", attachmentName \"%@\"", v4, v5, v6];

  return v7;
}

- (NSString)messageID
{
  return self->_messageID;
}

- (void)setMessageID:(id)a3
{
}

- (NSString)attachmentName
{
  return self->_attachmentName;
}

- (void)setAttachmentName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentName, 0);
  objc_storeStrong((id *)&self->_messageID, 0);
}

@end