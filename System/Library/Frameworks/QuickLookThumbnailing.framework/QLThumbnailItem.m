@interface QLThumbnailItem
+ (BOOL)supportsSecureCoding;
- (BOOL)needStopAccessing;
- (BOOL)needStopAccessingParent;
- (FPSandboxingURLWrapper)parentDirectoryWrapper;
- (FPSandboxingURLWrapper)urlWrapper;
- (NSData)data;
- (NSDictionary)attachments;
- (NSURL)temporaryURL;
- (QLThumbnailItem)initWithCoder:(id)a3;
- (QLThumbnailItem)initWithData:(id)a3 contentType:(id)a4;
- (QLThumbnailItem)initWithURL:(id)a3;
- (QLThumbnailItem)initWithURL:(id)a3 contentType:(id)a4;
- (QLThumbnailItem)initWithURLWrapper:(id)a3 parentDirectoryWrapper:(id)a4 contentType:(id)a5;
- (UTType)contentType;
- (id)fileData;
- (id)fileURL;
- (void)cleanup;
- (void)encodeWithCoder:(id)a3;
- (void)setAttachments:(id)a3;
- (void)setContentType:(id)a3;
- (void)setData:(id)a3;
- (void)setNeedStopAccessing:(BOOL)a3;
- (void)setNeedStopAccessingParent:(BOOL)a3;
- (void)setParentDirectoryWrapper:(id)a3;
- (void)setTemporaryURL:(id)a3;
- (void)setUrlWrapper:(id)a3;
- (void)startAccessingIfNeeded;
@end

@implementation QLThumbnailItem

- (QLThumbnailItem)initWithURL:(id)a3
{
  id v4 = a3;
  v5 = +[QLUTIAnalyzer contentTypeForURL:v4];
  v6 = [(QLThumbnailItem *)self initWithURL:v4 contentType:v5];

  return v6;
}

- (QLThumbnailItem)initWithURL:(id)a3 contentType:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [getFPSandboxingURLWrapperClass() wrapperWithURL:v7 readonly:1 error:0];

  v9 = [(QLThumbnailItem *)self initWithURLWrapper:v8 parentDirectoryWrapper:0 contentType:v6];
  return v9;
}

- (QLThumbnailItem)initWithURLWrapper:(id)a3 parentDirectoryWrapper:(id)a4 contentType:(id)a5
{
  v8 = (FPSandboxingURLWrapper *)a3;
  v9 = (FPSandboxingURLWrapper *)a4;
  v10 = (UTType *)a5;
  v18.receiver = self;
  v18.super_class = (Class)QLThumbnailItem;
  v11 = [(QLThumbnailItem *)&v18 init];
  contentType = v11->_contentType;
  v11->_contentType = v10;
  v13 = v10;

  urlWrapper = v11->_urlWrapper;
  v11->_urlWrapper = v8;
  v15 = v8;

  parentDirectoryWrapper = v11->_parentDirectoryWrapper;
  v11->_parentDirectoryWrapper = v9;

  return v11;
}

- (QLThumbnailItem)initWithData:(id)a3 contentType:(id)a4
{
  id v6 = (NSData *)a3;
  id v7 = (UTType *)a4;
  v13.receiver = self;
  v13.super_class = (Class)QLThumbnailItem;
  v8 = [(QLThumbnailItem *)&v13 init];
  data = v8->_data;
  v8->_data = v6;
  v10 = v6;

  contentType = v8->_contentType;
  v8->_contentType = v7;

  return v8;
}

- (void)startAccessingIfNeeded
{
  if (![(QLThumbnailItem *)self needStopAccessing])
  {
    v3 = [(QLThumbnailItem *)self urlWrapper];
    id v4 = [v3 url];
    -[QLThumbnailItem setNeedStopAccessing:](self, "setNeedStopAccessing:", [v4 startAccessingSecurityScopedResource]);
  }
  if (![(QLThumbnailItem *)self needStopAccessingParent])
  {
    id v6 = [(QLThumbnailItem *)self parentDirectoryWrapper];
    v5 = [v6 url];
    -[QLThumbnailItem setNeedStopAccessingParent:](self, "setNeedStopAccessingParent:", [v5 startAccessingSecurityScopedResource]);
  }
}

- (void)cleanup
{
  if ([(QLThumbnailItem *)self needStopAccessing])
  {
    v3 = [(QLThumbnailItem *)self urlWrapper];
    id v4 = [v3 url];
    [v4 stopAccessingSecurityScopedResource];

    [(QLThumbnailItem *)self setNeedStopAccessing:0];
  }
  if ([(QLThumbnailItem *)self needStopAccessingParent])
  {
    v5 = [(QLThumbnailItem *)self parentDirectoryWrapper];
    id v6 = [v5 url];
    [v6 stopAccessingSecurityScopedResource];

    [(QLThumbnailItem *)self setNeedStopAccessingParent:0];
  }
  id v7 = [(QLThumbnailItem *)self temporaryURL];

  if (v7)
  {
    v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    v9 = [(QLThumbnailItem *)self temporaryURL];
    [v8 removeItemAtURL:v9 error:0];

    [(QLThumbnailItem *)self setTemporaryURL:0];
  }
}

- (id)fileURL
{
  v3 = [(QLThumbnailItem *)self temporaryURL];

  if (v3) {
    goto LABEL_2;
  }
  v5 = [(QLThumbnailItem *)self urlWrapper];

  if (v5)
  {
    id v6 = [(QLThumbnailItem *)self urlWrapper];
    id v4 = [v6 url];
  }
  else
  {
    v8 = [(QLThumbnailItem *)self data];

    if (v8)
    {
      v9 = [MEMORY[0x1E4F28CB8] defaultManager];
      v10 = [v9 temporaryDirectory];
      v11 = [MEMORY[0x1E4F29128] UUID];
      v12 = [v11 UUIDString];
      objc_super v13 = [(QLThumbnailItem *)self contentType];
      v14 = [v10 URLByAppendingPathComponent:v12 conformingToType:v13];
      [(QLThumbnailItem *)self setTemporaryURL:v14];

      v15 = [(QLThumbnailItem *)self data];
      v16 = [(QLThumbnailItem *)self temporaryURL];
      [v15 writeToURL:v16 atomically:1];

      v17 = [(QLThumbnailItem *)self temporaryURL];
      NSLog(&cfstr_WritingTempora.isa, v17);

LABEL_2:
      id v4 = [(QLThumbnailItem *)self temporaryURL];
      goto LABEL_5;
    }
    id v4 = 0;
  }
LABEL_5:

  return v4;
}

- (id)fileData
{
  v3 = [(QLThumbnailItem *)self data];

  if (v3)
  {
    id v4 = [(QLThumbnailItem *)self data];
  }
  else
  {
    v5 = [(QLThumbnailItem *)self urlWrapper];

    if (v5)
    {
      id v6 = (void *)MEMORY[0x1E4F1C9B8];
      id v7 = [(QLThumbnailItem *)self urlWrapper];
      v8 = [v7 url];
      id v4 = [v6 dataWithContentsOfURL:v8 options:1 error:0];
    }
    else
    {
      id v4 = 0;
    }
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  data = self->_data;
  id v5 = a3;
  [v5 encodeObject:data forKey:@"d"];
  [v5 encodeObject:self->_urlWrapper forKey:@"u"];
  [v5 encodeObject:self->_parentDirectoryWrapper forKey:@"p"];
  [v5 encodeObject:self->_contentType forKey:@"c"];
  [v5 encodeObject:self->_attachments forKey:@"a"];
}

- (QLThumbnailItem)initWithCoder:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)QLThumbnailItem;
  id v3 = a3;
  id v4 = [(QLThumbnailItem *)&v22 init];
  uint64_t v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"d"];
  data = v4->_data;
  v4->_data = (NSData *)v5;

  uint64_t v7 = [v3 decodeObjectOfClass:getFPSandboxingURLWrapperClass() forKey:@"u"];
  urlWrapper = v4->_urlWrapper;
  v4->_urlWrapper = (FPSandboxingURLWrapper *)v7;

  uint64_t v9 = [v3 decodeObjectOfClass:getFPSandboxingURLWrapperClass() forKey:@"p"];
  parentDirectoryWrapper = v4->_parentDirectoryWrapper;
  v4->_parentDirectoryWrapper = (FPSandboxingURLWrapper *)v9;

  uint64_t v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"c"];
  contentType = v4->_contentType;
  v4->_contentType = (UTType *)v11;

  objc_super v13 = (void *)MEMORY[0x1E4F1CAD0];
  v24[0] = objc_opt_class();
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  v15 = [v13 setWithArray:v14];
  v16 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v23 = objc_opt_class();
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  objc_super v18 = [v16 setWithArray:v17];
  uint64_t v19 = [v3 decodeDictionaryWithKeysOfClasses:v15 objectsOfClasses:v18 forKey:@"a"];

  attachments = v4->_attachments;
  v4->_attachments = (NSDictionary *)v19;

  return v4;
}

- (UTType)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSDictionary)attachments
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAttachments:(id)a3
{
}

- (FPSandboxingURLWrapper)urlWrapper
{
  return self->_urlWrapper;
}

- (void)setUrlWrapper:(id)a3
{
}

- (FPSandboxingURLWrapper)parentDirectoryWrapper
{
  return self->_parentDirectoryWrapper;
}

- (void)setParentDirectoryWrapper:(id)a3
{
}

- (NSURL)temporaryURL
{
  return self->_temporaryURL;
}

- (void)setTemporaryURL:(id)a3
{
}

- (BOOL)needStopAccessing
{
  return self->_needStopAccessing;
}

- (void)setNeedStopAccessing:(BOOL)a3
{
  self->_needStopAccessing = a3;
}

- (BOOL)needStopAccessingParent
{
  return self->_needStopAccessingParent;
}

- (void)setNeedStopAccessingParent:(BOOL)a3
{
  self->_needStopAccessingParent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporaryURL, 0);
  objc_storeStrong((id *)&self->_parentDirectoryWrapper, 0);
  objc_storeStrong((id *)&self->_urlWrapper, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_contentType, 0);
}

@end