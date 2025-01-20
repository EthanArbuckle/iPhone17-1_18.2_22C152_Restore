@interface WFSecurityScopedFileCoder
+ (BOOL)supportsSecureCoding;
- (id)decodeFileWithCoder:(id)a3 fileShouldBeDeletedOnDeallocation:(BOOL *)a4 fileIsSecurityScoped:(BOOL *)a5;
- (id)sharedDirectory;
- (id)sharedTemporaryDirectory;
- (void)archiveFileAtURL:(id)a3 fileShouldBeDeletedOnDeallocation:(BOOL)a4 withCoder:(id)a5;
- (void)waitForFileAvailabilityWithCompletionHandler:(id)a3;
@end

@implementation WFSecurityScopedFileCoder

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)sharedTemporaryDirectory
{
  return +[WFTemporaryFileManager temporaryDirectoryURL];
}

- (id)sharedDirectory
{
  return 0;
}

- (void)waitForFileAvailabilityWithCompletionHandler:(id)a3
{
}

- (id)decodeFileWithCoder:(id)a3 fileShouldBeDeletedOnDeallocation:(BOOL *)a4 fileIsSecurityScoped:(BOOL *)a5
{
  *a5 = 1;
  id v6 = a3;
  v7 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"fileShouldBeDeletedOnDeallocation"];
  *a4 = [v7 BOOLValue];

  v8 = [v6 decodeObjectOfClass:getFPSandboxingURLWrapperClass() forKey:@"wrapper"];

  v9 = [v8 url];

  return v9;
}

- (void)archiveFileAtURL:(id)a3 fileShouldBeDeletedOnDeallocation:(BOOL)a4 withCoder:(id)a5
{
  BOOL v6 = a4;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  id v13 = 0;
  v9 = [getFPSandboxingURLWrapperClass() wrapperWithURL:v7 readonly:0 error:&v13];
  id v10 = v13;
  if (!v9)
  {
    v11 = getWFFilesLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v15 = "-[WFSecurityScopedFileCoder archiveFileAtURL:fileShouldBeDeletedOnDeallocation:withCoder:]";
      __int16 v16 = 2112;
      id v17 = v7;
      __int16 v18 = 2112;
      id v19 = v10;
      _os_log_impl(&dword_216505000, v11, OS_LOG_TYPE_ERROR, "%s Failed to archive file %@ with error %@", buf, 0x20u);
    }
  }
  [v8 encodeObject:v9 forKey:@"wrapper"];
  v12 = [NSNumber numberWithBool:v6];
  [v8 encodeObject:v12 forKey:@"fileShouldBeDeletedOnDeallocation"];
}

@end