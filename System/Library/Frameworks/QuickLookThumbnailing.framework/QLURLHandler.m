@interface QLURLHandler
+ (BOOL)supportsSecureCoding;
- (BOOL)needsAccessToExternalResources;
- (NSString)externalResourcesToken;
- (NSString)fileExtensionToken;
- (NSString)physicalFileExtensionToken;
- (NSURL)fileURL;
- (QLURLHandler)initWithCoder:(id)a3;
- (QLURLHandler)initWithURL:(id)a3 sandboxType:(const char *)a4;
- (char)sandboxExtensionIssueFileWithClass:(const char *)a3 path:(const char *)a4 flags:(unsigned int)a5;
- (id)_issueFileExtensionForURL:(id)a3;
- (int64_t)externalResourcesHandle;
- (int64_t)fileExtensionHandle;
- (int64_t)physicalFileExtensionHandle;
- (int64_t)sandboxExtensionConsume:(const char *)a3;
- (void)_consumeFileExtension;
- (void)_issueExternalResourcesExtensionForURL:(id)a3;
- (void)_issueFileExtension;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)sandboxExtensionRelease:(int64_t)a3;
- (void)setExternalResourcesHandle:(int64_t)a3;
- (void)setExternalResourcesToken:(id)a3;
- (void)setFileExtensionHandle:(int64_t)a3;
- (void)setFileExtensionToken:(id)a3;
- (void)setFileURL:(id)a3;
- (void)setNeedsAccessToExternalResources:(BOOL)a3;
- (void)setPhysicalFileExtensionHandle:(int64_t)a3;
- (void)setPhysicalFileExtensionToken:(id)a3;
@end

@implementation QLURLHandler

- (QLURLHandler)initWithURL:(id)a3 sandboxType:(const char *)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)QLURLHandler;
  v7 = [(QLURLHandler *)&v11 init];
  v8 = v7;
  if (v7)
  {
    [(QLURLHandler *)v7 setFileURL:v6];
    v8->_sandboxType = a4;
    v8->_isAccessingSecurityScope = [v6 startAccessingSecurityScopedResource];
    v9 = v8;
  }

  return v8;
}

- (void)dealloc
{
  if (self->_fileExtensionHandle) {
    -[QLURLHandler sandboxExtensionRelease:](self, "sandboxExtensionRelease:");
  }
  if (self->_isAccessingSecurityScope)
  {
    v3 = [(QLURLHandler *)self fileURL];
    [v3 stopAccessingSecurityScopedResource];
  }
  if (self->_physicalFileExtensionHandle) {
    -[QLURLHandler sandboxExtensionRelease:](self, "sandboxExtensionRelease:");
  }
  if (self->_externalResourcesHandle) {
    -[QLURLHandler sandboxExtensionRelease:](self, "sandboxExtensionRelease:");
  }
  v4.receiver = self;
  v4.super_class = (Class)QLURLHandler;
  [(QLURLHandler *)&v4 dealloc];
}

- (void)_issueFileExtension
{
  v3 = [(QLURLHandler *)self fileURL];

  if (v3)
  {
    objc_super v4 = [(QLURLHandler *)self fileURL];
    v5 = [(QLURLHandler *)self _issueFileExtensionForURL:v4];
    fileExtensionToken = self->_fileExtensionToken;
    self->_fileExtensionToken = v5;

    v7 = [(QLURLHandler *)self fileURL];
    id v11 = (id)_CFURLPromiseCopyPhysicalURL();

    if (v11)
    {
      v8 = [(QLURLHandler *)self _issueFileExtensionForURL:v11];
      physicalFileExtensionToken = self->_physicalFileExtensionToken;
      self->_physicalFileExtensionToken = v8;
    }
    if ([(QLURLHandler *)self needsAccessToExternalResources])
    {
      v10 = [(QLURLHandler *)self fileURL];
      [(QLURLHandler *)self _issueExternalResourcesExtensionForURL:v10];
    }
  }
}

- (void)_issueExternalResourcesExtensionForURL:(id)a3
{
  id v4 = a3;
  if ([(QLURLHandler *)self needsAccessToExternalResources]
    && [v4 isFileURL])
  {
    id v12 = 0;
    uint64_t v5 = *MEMORY[0x1E4F1C6F8];
    id v11 = 0;
    [v4 getResourceValue:&v12 forKey:v5 error:&v11];
    id v6 = v12;
    id v7 = v11;
    if (v7)
    {
      v8 = _log_0();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[QLURLHandler _issueExternalResourcesExtensionForURL:]((uint64_t)v4, v8);
      }

      v9 = 0;
    }
    else
    {
      v9 = [(QLURLHandler *)self _issueFileExtensionForURL:v6];
    }
  }
  else
  {
    v9 = 0;
  }
  externalResourcesToken = self->_externalResourcesToken;
  self->_externalResourcesToken = v9;
}

- (void)_consumeFileExtension
{
  fileExtensionToken = self->_fileExtensionToken;
  if (fileExtensionToken)
  {
    int64_t v4 = [(QLURLHandler *)self sandboxExtensionConsume:[(NSString *)fileExtensionToken UTF8String]];
    uint64_t v5 = self->_fileExtensionToken;
    self->_fileExtensionToken = 0;
    self->_fileExtensionHandle = v4;
  }
  physicalFileExtensionToken = self->_physicalFileExtensionToken;
  if (physicalFileExtensionToken)
  {
    int64_t v7 = [(QLURLHandler *)self sandboxExtensionConsume:[(NSString *)physicalFileExtensionToken UTF8String]];
    v8 = self->_physicalFileExtensionToken;
    self->_physicalFileExtensionToken = 0;
    self->_physicalFileExtensionHandle = v7;
  }
  externalResourcesToken = self->_externalResourcesToken;
  if (externalResourcesToken)
  {
    [(QLURLHandler *)self setExternalResourcesHandle:[(QLURLHandler *)self sandboxExtensionConsume:[(NSString *)externalResourcesToken UTF8String]]];
    [(QLURLHandler *)self setExternalResourcesToken:0];
  }
}

- (id)_issueFileExtensionForURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
    int64_t v7 = -[QLURLHandler sandboxExtensionIssueFileWithClass:path:flags:](self, "sandboxExtensionIssueFileWithClass:path:flags:", self->_sandboxType, [v6 fileSystemRepresentation], 0);
    if (v7)
    {
      v8 = v7;
      v9 = (void *)[[NSString alloc] initWithCString:v7 encoding:4];
      free(v8);
      goto LABEL_11;
    }
    id v11 = _log_0();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[QLURLHandler _issueFileExtensionForURL:]((uint64_t)v6, v11);
    }
  }
  else
  {
    v10 = _log_0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[QLURLHandler _issueFileExtensionForURL:](v10);
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  [(QLURLHandler *)self _issueFileExtension];
  id v4 = [(QLURLHandler *)self fileURL];
  [v11 encodeObject:v4 forKey:@"url"];

  uint64_t v5 = [(QLURLHandler *)self fileURL];
  id v6 = (void *)_CFURLPromiseCopyPhysicalURL();

  if (v6) {
    [v11 encodeObject:v6 forKey:@"promiseSetPhysicalURL"];
  }
  fileExtensionToken = self->_fileExtensionToken;
  if (fileExtensionToken) {
    [v11 encodeObject:fileExtensionToken forKey:@"fileExtensionToken"];
  }
  physicalFileExtensionToken = self->_physicalFileExtensionToken;
  if (physicalFileExtensionToken) {
    [v11 encodeObject:physicalFileExtensionToken forKey:@"physicalFileExtensionToken"];
  }
  v9 = [(QLURLHandler *)self externalResourcesToken];

  if (v9)
  {
    v10 = [(QLURLHandler *)self externalResourcesToken];
    [v11 encodeObject:v10 forKey:@"externalResourcesToken"];
  }
}

- (QLURLHandler)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)QLURLHandler;
  uint64_t v5 = [(QLURLHandler *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
    fileURL = v5->_fileURL;
    v5->_fileURL = (NSURL *)v6;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"promiseSetPhysicalURL"];
    if (v8) {
      _CFURLPromiseSetPhysicalURL();
    }
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fileExtensionToken"];
    fileExtensionToken = v5->_fileExtensionToken;
    v5->_fileExtensionToken = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"physicalFileExtensionToken"];
    physicalFileExtensionToken = v5->_physicalFileExtensionToken;
    v5->_physicalFileExtensionToken = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"externalResourcesToken"];
    externalResourcesToken = v5->_externalResourcesToken;
    v5->_externalResourcesToken = (NSString *)v13;

    [(QLURLHandler *)v5 _consumeFileExtension];
    v15 = v5;
  }
  return v5;
}

- (void)sandboxExtensionRelease:(int64_t)a3
{
}

- (int64_t)sandboxExtensionConsume:(const char *)a3
{
  return sandbox_extension_consume();
}

- (char)sandboxExtensionIssueFileWithClass:(const char *)a3 path:(const char *)a4 flags:(unsigned int)a5
{
  return (char *)sandbox_extension_issue_file();
}

- (int64_t)fileExtensionHandle
{
  return self->_fileExtensionHandle;
}

- (void)setFileExtensionHandle:(int64_t)a3
{
  self->_fileExtensionHandle = a3;
}

- (int64_t)physicalFileExtensionHandle
{
  return self->_physicalFileExtensionHandle;
}

- (void)setPhysicalFileExtensionHandle:(int64_t)a3
{
  self->_physicalFileExtensionHandle = a3;
}

- (NSString)fileExtensionToken
{
  return self->_fileExtensionToken;
}

- (void)setFileExtensionToken:(id)a3
{
}

- (NSString)physicalFileExtensionToken
{
  return self->_physicalFileExtensionToken;
}

- (void)setPhysicalFileExtensionToken:(id)a3
{
}

- (NSURL)fileURL
{
  return (NSURL *)objc_getProperty(self, a2, 72, 1);
}

- (void)setFileURL:(id)a3
{
}

- (NSString)externalResourcesToken
{
  return self->_externalResourcesToken;
}

- (void)setExternalResourcesToken:(id)a3
{
}

- (int64_t)externalResourcesHandle
{
  return self->_externalResourcesHandle;
}

- (void)setExternalResourcesHandle:(int64_t)a3
{
  self->_externalResourcesHandle = a3;
}

- (BOOL)needsAccessToExternalResources
{
  return self->_needsAccessToExternalResources;
}

- (void)setNeedsAccessToExternalResources:(BOOL)a3
{
  self->_needsAccessToExternalResources = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_externalResourcesToken, 0);
  objc_storeStrong((id *)&self->_physicalFileExtensionToken, 0);

  objc_storeStrong((id *)&self->_fileExtensionToken, 0);
}

- (void)_issueExternalResourcesExtensionForURL:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B281E000, a2, OS_LOG_TYPE_ERROR, "Couldn't obtain directory for additional resources for %@", (uint8_t *)&v2, 0xCu);
}

- (void)_issueFileExtensionForURL:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B281E000, log, OS_LOG_TYPE_ERROR, "Can't issue a file extension token for a nil path.", v1, 2u);
}

- (void)_issueFileExtensionForURL:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B281E000, a2, OS_LOG_TYPE_ERROR, "Couldn't issue file extension for url: %@", (uint8_t *)&v2, 0xCu);
}

@end