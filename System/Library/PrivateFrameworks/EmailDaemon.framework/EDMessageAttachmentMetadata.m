@interface EDMessageAttachmentMetadata
- (BOOL)isEqual:(id)a3;
- (EDMessageAttachmentMetadata)initWithGlobalMessageID:(int64_t)a3 attachmentID:(id)a4;
- (EDMessageAttachmentMetadata)initWithGlobalMessageID:(int64_t)a3 name:(id)a4 mimePart:(id)a5 attachmentID:(id)a6 remoteURL:(id)a7;
- (NSNumber)attachmentID;
- (NSString)ef_publicDescription;
- (NSString)mimePartNumber;
- (NSString)name;
- (NSURL)remoteURL;
- (int64_t)globalMessageID;
- (void)setAttachmentID:(id)a3;
- (void)setMimePartNumber:(id)a3;
@end

@implementation EDMessageAttachmentMetadata

- (EDMessageAttachmentMetadata)initWithGlobalMessageID:(int64_t)a3 name:(id)a4 mimePart:(id)a5 attachmentID:(id)a6 remoteURL:(id)a7
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  v14 = (__CFString *)a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)EDMessageAttachmentMetadata;
  v17 = [(EDMessageAttachmentMetadata *)&v21 init];
  v18 = v17;
  if (v17)
  {
    v17->_globalMessageID = a3;
    objc_storeStrong((id *)&v17->_name, a4);
    if ([(__CFString *)v14 isEqualToString:&stru_1F3583658])
    {
      v19 = EDAttachmentsLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        int64_t v23 = a3;
        _os_log_impl(&dword_1DB39C000, v19, OS_LOG_TYPE_DEFAULT, "Updating MIME part number to 1 for globalMessageID: %lld", buf, 0xCu);
      }

      v14 = @"1";
    }
    objc_storeStrong((id *)&v18->_mimePartNumber, v14);
    objc_storeStrong((id *)&v18->_attachmentID, a6);
    objc_storeStrong((id *)&v18->_remoteURL, a7);
  }

  return v18;
}

- (EDMessageAttachmentMetadata)initWithGlobalMessageID:(int64_t)a3 attachmentID:(id)a4
{
  return [(EDMessageAttachmentMetadata *)self initWithGlobalMessageID:a3 name:0 mimePart:0 attachmentID:a4 remoteURL:0];
}

- (NSString)ef_publicDescription
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"globalMessageID: %lld@", -[EDMessageAttachmentMetadata globalMessageID](self, "globalMessageID"));
  [v3 addObject:v4];

  v5 = NSString;
  v6 = [(EDMessageAttachmentMetadata *)self mimePartNumber];
  v7 = [v5 stringWithFormat:@"mimePartNumber: %@", v6];
  [v3 addObject:v7];

  v8 = NSString;
  v9 = [(EDMessageAttachmentMetadata *)self attachmentID];
  v10 = [v8 stringWithFormat:@"attachmentID: %@", v9];
  [v3 addObject:v10];

  v11 = [MEMORY[0x1E4F60D58] currentDevice];
  LODWORD(v10) = [v11 isInternal];

  if (v10)
  {
    v12 = NSString;
    id v13 = [(EDMessageAttachmentMetadata *)self name];
    v14 = [v12 stringWithFormat:@"name: %@", v13];
    [v3 addObject:v14];

    id v15 = NSString;
    id v16 = [(EDMessageAttachmentMetadata *)self remoteURL];
    v17 = [v15 stringWithFormat:@"remoteURL: %@", v16];
    [v3 addObject:v17];
  }
  v18 = [v3 componentsJoinedByString:@"\n"];

  return (NSString *)v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [v5 globalMessageID];
    if (v6 == [(EDMessageAttachmentMetadata *)self globalMessageID])
    {
      v7 = [v5 name];
      v8 = [(EDMessageAttachmentMetadata *)self name];
      if (EFStringsAreEqual())
      {
        v9 = [v5 mimePartNumber];
        v10 = [(EDMessageAttachmentMetadata *)self mimePartNumber];
        if (EFStringsAreEqual())
        {
          id v16 = [v5 attachmentID];
          v11 = [(EDMessageAttachmentMetadata *)self attachmentID];
          if (EFObjectsAreEqual())
          {
            id v15 = [v5 remoteURL];
            v12 = [(EDMessageAttachmentMetadata *)self remoteURL];
            char v13 = EFObjectsAreEqual();
          }
          else
          {
            char v13 = 0;
          }
        }
        else
        {
          char v13 = 0;
        }
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (void)setMimePartNumber:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = (__CFString *)a3;
  if ([(__CFString *)v4 isEqualToString:&stru_1F3583658])
  {
    id v5 = EDAttachmentsLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      int64_t v8 = [(EDMessageAttachmentMetadata *)self globalMessageID];
      _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_DEFAULT, "Updating MIME part number to 1 for globalMessageID: %lld", (uint8_t *)&v7, 0xCu);
    }

    id v4 = @"1";
  }
  mimePartNumber = self->_mimePartNumber;
  self->_mimePartNumber = &v4->isa;
}

- (NSString)mimePartNumber
{
  return self->_mimePartNumber;
}

- (int64_t)globalMessageID
{
  return self->_globalMessageID;
}

- (NSString)name
{
  return self->_name;
}

- (NSNumber)attachmentID
{
  return self->_attachmentID;
}

- (void)setAttachmentID:(id)a3
{
}

- (NSURL)remoteURL
{
  return self->_remoteURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteURL, 0);
  objc_storeStrong((id *)&self->_attachmentID, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_mimePartNumber, 0);
}

@end