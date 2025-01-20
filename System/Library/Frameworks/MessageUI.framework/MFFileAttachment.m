@interface MFFileAttachment
- (BOOL)isEqual:(id)a3;
- (NSString)attachmentName;
- (NSURL)attachmentContentIDURL;
- (int)attachmentType;
- (unint64_t)hash;
- (void)setAttachmentContentIDURL:(id)a3;
- (void)setAttachmentName:(id)a3;
- (void)setAttachmentType:(int)a3;
@end

@implementation MFFileAttachment

- (BOOL)isEqual:(id)a3
{
  v4 = (MFFileAttachment *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = v5;
      if (v5)
      {
        v7 = [(MFFileAttachment *)v5 attachmentContentIDURL];
        if ([v7 isEqual:self->_attachmentContentIDURL])
        {
          v8 = [(MFFileAttachment *)v6 attachmentName];
          if ([v8 isEqual:self->_attachmentName]) {
            BOOL v9 = [(MFFileAttachment *)v6 attachmentType] == self->_attachmentType;
          }
          else {
            BOOL v9 = 0;
          }
        }
        else
        {
          BOOL v9 = 0;
        }
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_attachmentName hash];
  return [(NSURL *)self->_attachmentContentIDURL hash] ^ v3 ^ self->_attachmentType;
}

- (NSString)attachmentName
{
  return self->_attachmentName;
}

- (void)setAttachmentName:(id)a3
{
}

- (NSURL)attachmentContentIDURL
{
  return self->_attachmentContentIDURL;
}

- (void)setAttachmentContentIDURL:(id)a3
{
}

- (int)attachmentType
{
  return self->_attachmentType;
}

- (void)setAttachmentType:(int)a3
{
  self->_attachmentType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentContentIDURL, 0);

  objc_storeStrong((id *)&self->_attachmentName, 0);
}

@end