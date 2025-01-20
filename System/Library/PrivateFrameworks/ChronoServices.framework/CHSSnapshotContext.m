@interface CHSSnapshotContext
- (BOOL)fileExists;
- (BOOL)needsCAPackage;
- (CHSScreenshotPresentationAttributes)attributes;
- (CHSSnapshotContext)initWithURL:(id)a3 attributes:(id)a4 fileManager:(id)a5;
- (NSString)contentIdentifier;
- (NSString)typeIdentifier;
- (NSURL)url;
@end

@implementation CHSSnapshotContext

- (CHSSnapshotContext)initWithURL:(id)a3 attributes:(id)a4 fileManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CHSSnapshotContext;
  v12 = [(CHSSnapshotContext *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_url, a3);
    objc_storeStrong((id *)&v13->_attributes, a4);
    objc_storeStrong((id *)&v13->_fileManager, a5);
  }

  return v13;
}

- (NSString)typeIdentifier
{
  ssize_t v3 = getxattr([(NSURL *)self->_url fileSystemRepresentation], "FormatType", 0, 0, 0, 0);
  size_t v4 = v3;
  if (v3 >= 1)
  {
    v5 = malloc_type_malloc(v3, 0x1326343FuLL);
    ssize_t v6 = getxattr([(NSURL *)self->_url fileSystemRepresentation], "FormatType", v5, v4, 0, 0);
    if (v6 == -1)
    {
      free(v5);
    }
    else
    {
      v7 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v5 length:v6 freeWhenDone:1];
      if (v7)
      {
        v8 = (void *)[[NSString alloc] initWithData:v7 encoding:4];

        goto LABEL_7;
      }
    }
  }
  v8 = 0;
LABEL_7:
  return (NSString *)v8;
}

- (BOOL)needsCAPackage
{
  if (self->_checkedContentType) {
    return self->_usesCAPackage;
  }
  size_t v4 = [(CHSSnapshotContext *)self typeIdentifier];
  char v3 = [v4 hasPrefix:@"com.apple.coreanimation"];
  self->_usesCAPackage = v3;
  self->_checkedContentType = 1;

  return v3;
}

- (NSString)contentIdentifier
{
  ssize_t v3 = getxattr([(NSURL *)self->_url fileSystemRepresentation], "ContentIdentifier", 0, 0, 0, 0);
  if (v3 < 1) {
    goto LABEL_6;
  }
  size_t v4 = v3;
  v5 = malloc_type_malloc(v3, 0xDCB77E4EuLL);
  ssize_t v6 = getxattr([(NSURL *)self->_url fileSystemRepresentation], "ContentIdentifier", v5, v4, 0, 0);
  if (v6 == -1)
  {
    free(v5);
LABEL_6:
    v8 = 0;
    v7 = 0;
    goto LABEL_7;
  }
  v7 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v5 length:v6 freeWhenDone:1];
  if (v7) {
    v8 = (void *)[[NSString alloc] initWithData:v7 encoding:4];
  }
  else {
    v8 = 0;
  }
LABEL_7:

  return (NSString *)v8;
}

- (BOOL)fileExists
{
  if (self->_checkedFileExists)
  {
    p_fileExists = &self->_fileExists;
  }
  else
  {
    fileManager = self->_fileManager;
    v5 = [(NSURL *)self->_url path];
    self->_fileExists = [(NSFileManager *)fileManager fileExistsAtPath:v5];
    p_fileExists = &self->_fileExists;

    p_fileExists[1] = 1;
    ssize_t v6 = *(void **)(p_fileExists + 14);
    *(void *)(p_fileExists + 14) = 0;
  }
  return *p_fileExists;
}

- (CHSScreenshotPresentationAttributes)attributes
{
  return self->_attributes;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end