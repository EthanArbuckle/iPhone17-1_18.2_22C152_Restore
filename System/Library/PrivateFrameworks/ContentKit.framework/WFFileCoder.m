@interface WFFileCoder
+ (BOOL)supportsSecureCoding;
- (NSURL)sharedDirectory;
- (NSURL)sharedTemporaryDirectory;
- (WFFileCoder)initWithCoder:(id)a3;
- (id)decodeFileWithCoder:(id)a3 fileShouldBeDeletedOnDeallocation:(BOOL *)a4 fileIsSecurityScoped:(BOOL *)a5;
- (int64_t)deletionResponsibility;
- (int64_t)targetPlatform;
- (void)archiveFileAtURL:(id)a3 fileShouldBeDeletedOnDeallocation:(BOOL)a4 withCoder:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)setDeletionResponsibility:(int64_t)a3;
- (void)setSharedDirectory:(id)a3;
- (void)setSharedTemporaryDirectory:(id)a3;
- (void)setTargetPlatform:(int64_t)a3;
- (void)waitForFileAvailabilityWithCompletionHandler:(id)a3;
@end

@implementation WFFileCoder

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedTemporaryDirectory, 0);
  objc_storeStrong((id *)&self->_sharedDirectory, 0);
}

- (void)setTargetPlatform:(int64_t)a3
{
  self->_targetPlatform = a3;
}

- (int64_t)targetPlatform
{
  return self->_targetPlatform;
}

- (void)setDeletionResponsibility:(int64_t)a3
{
  self->_deletionResponsibility = a3;
}

- (int64_t)deletionResponsibility
{
  return self->_deletionResponsibility;
}

- (void)setSharedTemporaryDirectory:(id)a3
{
}

- (NSURL)sharedTemporaryDirectory
{
  return self->_sharedTemporaryDirectory;
}

- (void)setSharedDirectory:(id)a3
{
}

- (NSURL)sharedDirectory
{
  return self->_sharedDirectory;
}

- (WFFileCoder)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFFileCoder *)self init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deletionResponsibility"];
    v5->_deletionResponsibility = [v6 BOOLValue];

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharedDirectory"];
    sharedDirectory = v5->_sharedDirectory;
    v5->_sharedDirectory = (NSURL *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharedTemporaryDirectory"];
    sharedTemporaryDirectory = v5->_sharedTemporaryDirectory;
    v5->_sharedTemporaryDirectory = (NSURL *)v9;

    v11 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [NSNumber numberWithInteger:self->_deletionResponsibility];
  [v7 encodeObject:v4 forKey:@"deletionResponsibility"];

  sharedDirectory = self->_sharedDirectory;
  if (sharedDirectory) {
    [v7 encodeObject:sharedDirectory forKey:@"sharedDirectory"];
  }
  sharedTemporaryDirectory = self->_sharedTemporaryDirectory;
  if (sharedTemporaryDirectory) {
    [v7 encodeObject:sharedTemporaryDirectory forKey:@"sharedTemporaryDirectory"];
  }
}

- (void)waitForFileAvailabilityWithCompletionHandler:(id)a3
{
}

- (id)decodeFileWithCoder:(id)a3 fileShouldBeDeletedOnDeallocation:(BOOL *)a4 fileIsSecurityScoped:(BOOL *)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"fileShouldBeDeletedOnDeallocation"];
  *a4 = [v7 BOOLValue];

  v8 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"fileURL"];
  if (!v8)
  {
    uint64_t v9 = getWFWorkflowExecutionLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = [v6 error];
      int v12 = 136315394;
      v13 = "-[WFFileCoder decodeFileWithCoder:fileShouldBeDeletedOnDeallocation:fileIsSecurityScoped:]";
      __int16 v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_216505000, v9, OS_LOG_TYPE_ERROR, "%s Failed to decode file with error: %@", (uint8_t *)&v12, 0x16u);
    }
  }

  return v8;
}

- (void)archiveFileAtURL:(id)a3 fileShouldBeDeletedOnDeallocation:(BOOL)a4 withCoder:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  [v7 encodeObject:a3 forKey:@"fileURL"];
  id v8 = [NSNumber numberWithBool:v5];
  [v7 encodeObject:v8 forKey:@"fileShouldBeDeletedOnDeallocation"];
}

@end