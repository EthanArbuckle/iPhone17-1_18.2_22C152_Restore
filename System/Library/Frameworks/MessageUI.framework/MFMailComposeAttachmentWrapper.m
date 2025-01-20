@interface MFMailComposeAttachmentWrapper
+ (BOOL)supportsSecureCoding;
+ (id)wrapperWithData:(id)a3 mimeType:(id)a4 fileName:(id)a5;
+ (id)wrapperWithFileURL:(id)a3 mimeType:(id)a4;
+ (id)wrapperWithItemProvider:(id)a3 mimeType:(id)a4 fileName:(id)a5;
- (EFSandboxedURLWrapper)fileURLWrapper;
- (MFMailComposeAttachmentWrapper)initWithCoder:(id)a3;
- (MFMailComposeAttachmentWrapper)initWithData:(id)a3 mimeType:(id)a4 fileName:(id)a5;
- (MFMailComposeAttachmentWrapper)initWithFileURL:(id)a3 mimeType:(id)a4;
- (MFMailComposeAttachmentWrapper)initWithItemProvider:(id)a3 mimeType:(id)a4 fileName:(id)a5;
- (NSData)data;
- (NSItemProvider)itemProvider;
- (NSString)fileName;
- (NSString)identifier;
- (NSString)mimeType;
- (NSURL)fileURL;
- (id)description;
- (unint64_t)fileSize;
- (void)encodeWithCoder:(id)a3;
- (void)setData:(id)a3;
- (void)setFileName:(id)a3;
- (void)setFileURLWrapper:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setItemProvider:(id)a3;
- (void)setMimeType:(id)a3;
@end

@implementation MFMailComposeAttachmentWrapper

+ (id)wrapperWithFileURL:(id)a3 mimeType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)[objc_alloc((Class)a1) initWithFileURL:v6 mimeType:v7];

  return v8;
}

+ (id)wrapperWithData:(id)a3 mimeType:(id)a4 fileName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)[objc_alloc((Class)a1) initWithData:v8 mimeType:v9 fileName:v10];

  return v11;
}

+ (id)wrapperWithItemProvider:(id)a3 mimeType:(id)a4 fileName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)[objc_alloc((Class)a1) initWithItemProvider:v8 mimeType:v9 fileName:v10];

  return v11;
}

- (MFMailComposeAttachmentWrapper)initWithFileURL:(id)a3 mimeType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)MFMailComposeAttachmentWrapper;
  id v8 = [(MFMailComposeAttachmentWrapper *)&v20 init];
  if (v8)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F60F20]) initWithFileURL:v6 readOnly:1];
    fileURLWrapper = v8->_fileURLWrapper;
    v8->_fileURLWrapper = (EFSandboxedURLWrapper *)v9;

    uint64_t v11 = [v7 copy];
    mimeType = v8->_mimeType;
    v8->_mimeType = (NSString *)v11;

    v13 = [v6 lastPathComponent];
    uint64_t v14 = [v13 copy];
    fileName = v8->_fileName;
    v8->_fileName = (NSString *)v14;

    v16 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v17 = [v16 UUIDString];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v17;
  }
  return v8;
}

- (MFMailComposeAttachmentWrapper)initWithData:(id)a3 mimeType:(id)a4 fileName:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)MFMailComposeAttachmentWrapper;
  v12 = [(MFMailComposeAttachmentWrapper *)&v22 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_data, a3);
    uint64_t v14 = [v10 copy];
    mimeType = v13->_mimeType;
    v13->_mimeType = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    fileName = v13->_fileName;
    v13->_fileName = (NSString *)v16;

    v18 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v19 = [v18 UUIDString];
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v19;
  }
  return v13;
}

- (MFMailComposeAttachmentWrapper)initWithItemProvider:(id)a3 mimeType:(id)a4 fileName:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)MFMailComposeAttachmentWrapper;
  v12 = [(MFMailComposeAttachmentWrapper *)&v22 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_itemProvider, a3);
    uint64_t v14 = [v10 copy];
    mimeType = v13->_mimeType;
    v13->_mimeType = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    fileName = v13->_fileName;
    v13->_fileName = (NSString *)v16;

    v18 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v19 = [v18 UUIDString];
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v19;
  }
  return v13;
}

- (id)description
{
  v3 = NSString;
  NSUInteger v4 = [(NSData *)self->_data length];
  mimeType = self->_mimeType;
  fileName = self->_fileName;
  id v7 = [(EFSandboxedURLWrapper *)self->_fileURLWrapper url];
  id v8 = [v3 stringWithFormat:@"Data Len:%lu\nMIME Type:%@\nFile Name:%@\nFile URL:%@\nID:%@", v4, mimeType, fileName, v7, self->_identifier];

  return v8;
}

- (NSURL)fileURL
{
  return (NSURL *)[(EFSandboxedURLWrapper *)self->_fileURLWrapper url];
}

- (unint64_t)fileSize
{
  fileURLWrapper = self->_fileURLWrapper;
  if (fileURLWrapper)
  {
    NSUInteger v4 = [(EFSandboxedURLWrapper *)fileURLWrapper url];
    int v5 = [v4 startAccessingSecurityScopedResource];
    id v17 = 0;
    uint64_t v6 = *MEMORY[0x1E4F1C5F8];
    id v16 = 0;
    [v4 getResourceValue:&v17 forKey:v6 error:&v16];
    id v7 = v17;
    id v8 = v16;
    unint64_t v9 = [v7 integerValue];
    if (v9)
    {
      if (!v5) {
        goto LABEL_10;
      }
    }
    else
    {
      v12 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v15 = v8;
      uint64_t v13 = objc_msgSend(v12, "mf_sizeForDirectoryAtURL:error:", v4, &v15);
      id v14 = v15;

      unint64_t v9 = v13 & ~(v13 >> 63);
      id v8 = v14;
      if (!v5)
      {
LABEL_10:

        return v9;
      }
    }
    [v4 stopAccessingSecurityScopedResource];
    goto LABEL_10;
  }
  data = self->_data;

  return [(NSData *)data length];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  NSUInteger v4 = [(MFMailComposeAttachmentWrapper *)self data];
  [v9 encodeObject:v4 forKey:@"EFPropertyKey_data"];

  int v5 = [(MFMailComposeAttachmentWrapper *)self mimeType];
  [v9 encodeObject:v5 forKey:@"EFPropertyKey_mimeType"];

  uint64_t v6 = [(MFMailComposeAttachmentWrapper *)self fileName];
  [v9 encodeObject:v6 forKey:@"EFPropertyKey_fileName"];

  id v7 = [(MFMailComposeAttachmentWrapper *)self identifier];
  [v9 encodeObject:v7 forKey:@"EFPropertyKey_identifier"];

  id v8 = [(MFMailComposeAttachmentWrapper *)self fileURLWrapper];
  [v9 encodeObject:v8 forKey:@"EFPropertyKey_fileURLWrapper"];
}

- (MFMailComposeAttachmentWrapper)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MFMailComposeAttachmentWrapper;
  int v5 = [(MFMailComposeAttachmentWrapper *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_data"];
    data = v5->_data;
    v5->_data = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_mimeType"];
    mimeType = v5->_mimeType;
    v5->_mimeType = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_fileName"];
    fileName = v5->_fileName;
    v5->_fileName = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_fileURLWrapper"];
    fileURLWrapper = v5->_fileURLWrapper;
    v5->_fileURLWrapper = (EFSandboxedURLWrapper *)v14;
  }
  return v5;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSString)mimeType
{
  return self->_mimeType;
}

- (void)setMimeType:(id)a3
{
}

- (NSString)fileName
{
  return self->_fileName;
}

- (void)setFileName:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSItemProvider)itemProvider
{
  return self->_itemProvider;
}

- (void)setItemProvider:(id)a3
{
}

- (EFSandboxedURLWrapper)fileURLWrapper
{
  return self->_fileURLWrapper;
}

- (void)setFileURLWrapper:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURLWrapper, 0);
  objc_storeStrong((id *)&self->_itemProvider, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_mimeType, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end