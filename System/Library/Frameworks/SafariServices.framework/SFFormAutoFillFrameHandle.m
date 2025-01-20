@interface SFFormAutoFillFrameHandle
+ (BOOL)supportsSecureCoding;
+ (id)frameHandleFromSerializedData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSData)serializedData;
- (NSNumber)pageID;
- (NSString)description;
- (NSURL)webui_URL;
- (SFFormAutoFillFrameHandle)initWithCoder:(id)a3;
- (SFFormAutoFillFrameHandle)initWithFrameHandle:(id)a3 URL:(id)a4 serverTrust:(__SecTrust *)a5 pageID:(id)a6;
- (SFFormAutoFillFrameHandle)initWithWebProcessPlugInFrame:(id)a3;
- (WBSGlobalFrameIdentifier)webFrameIdentifier;
- (_WKFrameHandle)frameHandle;
- (__SecTrust)webui_serverTrust;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)serializedData;
@end

@implementation SFFormAutoFillFrameHandle

- (SFFormAutoFillFrameHandle)initWithFrameHandle:(id)a3 URL:(id)a4 serverTrust:(__SecTrust *)a5 pageID:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SFFormAutoFillFrameHandle;
  v14 = [(SFFormAutoFillFrameHandle *)&v18 init];
  v15 = v14;
  v16 = 0;
  if (v14 && v11 && v12)
  {
    objc_storeStrong((id *)&v14->_frameHandle, a3);
    objc_storeStrong((id *)&v15->_URL, a4);
    if (a5) {
      v15->_serverTrust = (__SecTrust *)CFRetain(a5);
    }
    objc_storeStrong((id *)&v15->_pageID, a6);
    v16 = v15;
  }

  return v16;
}

- (WBSGlobalFrameIdentifier)webFrameIdentifier
{
  id v3 = objc_alloc(MEMORY[0x1E4F98B78]);
  pageID = self->_pageID;
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[_WKFrameHandle frameID](self->_frameHandle, "frameID"));
  v6 = (void *)[v3 initWithPageID:pageID frameID:v5];

  return (WBSGlobalFrameIdentifier *)v6;
}

- (void)dealloc
{
  serverTrust = self->_serverTrust;
  if (serverTrust) {
    CFRelease(serverTrust);
  }
  v4.receiver = self;
  v4.super_class = (Class)SFFormAutoFillFrameHandle;
  [(SFFormAutoFillFrameHandle *)&v4 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4 = (SFFormAutoFillFrameHandle *)a3;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else
  {
    v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v7 = v4;
      if ([(_WKFrameHandle *)self->_frameHandle isEqual:v7->_frameHandle]
        && [(NSURL *)self->_URL isEqual:v7->_URL])
      {
        pageID = self->_pageID;
        v9 = [(SFFormAutoFillFrameHandle *)v7 pageID];
        char v10 = [(NSNumber *)pageID isEqualToNumber:v9];
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3 = [(_WKFrameHandle *)self->_frameHandle hash];
  uint64_t v4 = [(NSURL *)self->_URL hash] ^ v3;
  return v4 ^ [(NSNumber *)self->_pageID hash];
}

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; URL = \"%@\"; frameID: %llu, pageID: %llu>",
    v5,
    self,
    self->_URL,
    [(_WKFrameHandle *)self->_frameHandle frameID],
  v6 = [(NSNumber *)self->_pageID unsignedLongLongValue]);

  return (NSString *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFFormAutoFillFrameHandle)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SFFormAutoFillFrameHandle;
  v5 = [(SFFormAutoFillFrameHandle *)&v13 init];
  if (v5)
  {
    v6 = v5;
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serverTrust"];
    if (v7)
    {
      v8 = (SFFormAutoFillFrameHandle *)SecTrustDeserialize();
      if (!v8)
      {
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
      v8 = 0;
    }
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"frameHandle"];
    char v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"URL"];
    id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pageID"];
    v6 = [(SFFormAutoFillFrameHandle *)v6 initWithFrameHandle:v9 URL:v10 serverTrust:v8 pageID:v11];

    if (v8) {
      CFRelease(v8);
    }
    v8 = v6;
    goto LABEL_10;
  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [v6 encodeObject:self->_frameHandle forKey:@"frameHandle"];
  [v6 encodeObject:self->_URL forKey:@"URL"];
  [v6 encodeObject:self->_pageID forKey:@"pageID"];
  if (self->_serverTrust)
  {
    id v4 = (void *)SecTrustSerialize();
    if (v4)
    {
      v5 = [MEMORY[0x1E4F1C9B8] dataWithData:v4];
      [v6 encodeObject:v5 forKey:@"serverTrust"];
    }
  }
}

- (NSData)serializedData
{
  id v6 = 0;
  v2 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v6];
  id v3 = v6;
  if (v3)
  {
    id v4 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      [(SFFormAutoFillFrameHandle *)v4 serializedData];
    }
  }

  return (NSData *)v2;
}

+ (id)frameHandleFromSerializedData:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v16 = 0;
    goto LABEL_10;
  }
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  id v12 = objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  id v18 = 0;
  objc_super v13 = [MEMORY[0x1E4F28DC0] _strictlyUnarchivedObjectOfClasses:v12 fromData:v3 error:&v18];
  id v14 = v18;
  if (v14)
  {
    v15 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      +[SFFormAutoFillFrameHandle frameHandleFromSerializedData:](v15, v14);
    }
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_8:
    id v16 = 0;
    goto LABEL_9;
  }
  id v16 = v13;
LABEL_9:

LABEL_10:

  return v16;
}

- (NSURL)webui_URL
{
  return self->_URL;
}

- (__SecTrust)webui_serverTrust
{
  return self->_serverTrust;
}

- (_WKFrameHandle)frameHandle
{
  return self->_frameHandle;
}

- (NSNumber)pageID
{
  return self->_pageID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageID, 0);
  objc_storeStrong((id *)&self->_frameHandle, 0);

  objc_storeStrong((id *)&self->_URL, 0);
}

- (SFFormAutoFillFrameHandle)initWithWebProcessPlugInFrame:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 _browserContextController];
  uint64_t v6 = [v5 handle];

  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v6, "_webPageID"));
  uint64_t v8 = [v4 handle];
  uint64_t v9 = [v4 URL];
  uint64_t v10 = [v4 _serverTrust];

  uint64_t v11 = [(SFFormAutoFillFrameHandle *)self initWithFrameHandle:v8 URL:v9 serverTrust:v10 pageID:v7];
  return v11;
}

- (void)serializedData
{
  id v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_0(&dword_1A690B000, v5, v6, "Failed to archive SFFormAutoFillFrameHandle: %{public}@", v7, v8, v9, v10, 2u);
}

+ (void)frameHandleFromSerializedData:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_0(&dword_1A690B000, v5, v6, "Failed to read from SFFormAutoFillFrameHandle data with exception: %{public}@", v7, v8, v9, v10, 2u);
}

@end