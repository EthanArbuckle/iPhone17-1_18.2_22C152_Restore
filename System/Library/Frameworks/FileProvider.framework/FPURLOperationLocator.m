@interface FPURLOperationLocator
+ (BOOL)supportsSecureCoding;
- (BOOL)isDownloaded;
- (BOOL)isExternalURL;
- (BOOL)isFolder;
- (BOOL)requiresCrossDeviceCopy;
- (FPURLOperationLocator)initWithCoder:(id)a3;
- (FPURLOperationLocator)initWithObject:(id)a3;
- (id)description;
- (id)filename;
- (id)identifier;
- (id)parentIdentifier;
- (unint64_t)size;
- (void)attachSandboxExtensionOnXPCEncoding;
- (void)encodeWithCoder:(id)a3;
- (void)isDownloaded;
- (void)size;
@end

@implementation FPURLOperationLocator

- (FPURLOperationLocator)initWithObject:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FPURLOperationLocator;
  result = [(FPActionOperationLocator *)&v4 initWithObject:a3];
  if (result) {
    result->_size = -1;
  }
  return result;
}

- (id)description
{
  v2 = [(FPActionOperationLocator *)self asURL];
  v3 = [v2 path];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isExternalURL
{
  return 1;
}

- (id)identifier
{
  v2 = [(FPActionOperationLocator *)self asURL];
  v3 = comparablePathFromURL(v2);

  return v3;
}

- (id)parentIdentifier
{
  v2 = [(FPActionOperationLocator *)self asURL];
  v3 = [v2 URLByDeletingLastPathComponent];
  objc_super v4 = comparablePathFromURL(v3);

  return v4;
}

- (id)filename
{
  v2 = [(FPActionOperationLocator *)self asURL];
  v3 = [v2 lastPathComponent];

  return v3;
}

- (unint64_t)size
{
  unint64_t result = self->_size;
  if (result == -1)
  {
    int64_t v10 = 0;
    objc_super v4 = [(FPActionOperationLocator *)self asURL];
    int v5 = [v4 startAccessingSecurityScopedResource];
    id v9 = 0;
    char v6 = objc_msgSend(v4, "fp_getSize:error:", &v10, &v9);
    id v7 = v9;
    if ((v6 & 1) == 0)
    {
      v8 = fp_current_or_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        [(FPURLOperationLocator *)v4 size];
      }
    }
    if (v5) {
      [v4 stopAccessingSecurityScopedResource];
    }
    self->_size = v10;

    return self->_size;
  }
  return result;
}

- (BOOL)isDownloaded
{
  v2 = [(FPActionOperationLocator *)self asURL];
  int v3 = [v2 startAccessingSecurityScopedResource];
  id v9 = 0;
  objc_super v4 = objc_msgSend(v2, "fp_isDatalessWithError:", &v9);
  id v5 = v9;
  if (v4)
  {
    if (v3) {
LABEL_3:
    }
      [v2 stopAccessingSecurityScopedResource];
  }
  else
  {
    v8 = fp_current_or_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      [(FPURLOperationLocator *)v2 isDownloaded];
    }

    if (v3) {
      goto LABEL_3;
    }
  }
  int v6 = [v4 BOOLValue] ^ 1;

  return v6;
}

- (BOOL)isFolder
{
  v2 = [(FPActionOperationLocator *)self asURL];
  char v3 = objc_msgSend(v2, "fp_isFolder");

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FPURLOperationLocator;
  [(FPActionOperationLocator *)&v11 encodeWithCoder:v4];
  if (self->_attachSandboxExtensionOnXPCEncoding)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
      int v6 = [(FPActionOperationLocator *)self asURL];
      id v7 = [v6 path];
      int v8 = [v5 isWritableFileAtPath:v7];

      id v9 = [(FPActionOperationLocator *)self asURL];
      int64_t v10 = +[FPSandboxingURLWrapper wrapperWithURL:v9 readonly:v8 ^ 1u error:0];
      [v4 encodeObject:v10 forKey:@"sburl"];
    }
  }
}

- (FPURLOperationLocator)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FPURLOperationLocator;
  id v5 = [(FPActionOperationLocator *)&v10 initWithCoder:v4];
  if (v5)
  {
    int v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sburl"];
    id v7 = v6;
    if (v6)
    {
      int v8 = [v6 url];
      [(FPActionOperationLocator *)v5 _setObject:v8];
    }
  }

  return v5;
}

- (void)attachSandboxExtensionOnXPCEncoding
{
  self->_attachSandboxExtensionOnXPCEncoding = 1;
}

- (BOOL)requiresCrossDeviceCopy
{
  uint64_t v2 = [(FPActionOperationLocator *)self asURL];
  id v5 = 0;
  [(id)v2 getResourceValue:&v5 forKey:*MEMORY[0x1E4F1C848] error:0];
  id v3 = v5;

  LOBYTE(v2) = [v3 BOOLValue];
  return v2 ^ 1;
}

- (void)size
{
  id v3 = objc_msgSend(a1, "fp_shortDescription");
  id v4 = objc_msgSend(a2, "fp_prettyDescription");
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_17_0(&dword_1A33AE000, v5, v6, "[DEBUG] Failed to determine size of item at %@ (%@)", v7, v8, v9, v10, v11);
}

- (void)isDownloaded
{
  id v3 = objc_msgSend(a1, "fp_shortDescription");
  id v4 = objc_msgSend(a2, "fp_prettyDescription");
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_17_0(&dword_1A33AE000, v5, v6, "[DEBUG] Failed to determine dataless status of item at %@ (%@)", v7, v8, v9, v10, v11);
}

@end