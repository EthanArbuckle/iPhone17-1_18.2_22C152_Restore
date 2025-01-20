@interface SKGConfig
- (NSString)resourcePath;
- (SKGConfig)initWithConfigPath:(id)a3;
- (SKGConfig)initWithConfigPath:(id)a3 resourceDirectoryPath:(id)a4 resourceVersion:(int64_t)a5;
- (int64_t)releaseVersion;
- (int64_t)resourceVersion;
- (void)readConfig;
- (void)updateConfig;
@end

@implementation SKGConfig

- (SKGConfig)initWithConfigPath:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKGConfig;
  v5 = [(SKGConfig *)&v9 init];
  if (v5)
  {
    uint64_t v6 = +[NSURL fileURLWithPath:v4];
    v7 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v6;

    *(int64x2_t *)(v5 + 24) = vdupq_n_s64(0x7FFFFFFFuLL);
    [v5 readConfig];
  }

  return (SKGConfig *)v5;
}

- (void)readConfig
{
  if (!self->_configURL) {
    return;
  }
  v3 = +[NSFileManager defaultManager];
  id v4 = [(NSURL *)self->_configURL path];
  unsigned int v5 = [v3 fileExistsAtPath:v4];

  if (!v5) {
    return;
  }
  uint64_t v6 = [(NSURL *)self->_configURL path];
  v7 = +[NSData dataWithContentsOfFile:v6];

  id v19 = v7;
  [v19 bytes];
  [v19 length];
  uint64_t v8 = _MDPlistContainerCreateWithBytes();
  if (v8)
  {
    objc_super v9 = (const void *)v8;
    v10 = (void *)_MDPlistContainerCopyRootObject();
    uint64_t v11 = [v10 objectForKeyedSubscript:@"ReleaseVersion"];
    if (v11)
    {
      resourcePath = (NSString *)v11;
      uint64_t v13 = [v10 objectForKeyedSubscript:@"ResourceVersion"];
      if (!v13)
      {
LABEL_8:

        goto LABEL_9;
      }
      v14 = (void *)v13;
      v15 = [v10 objectForKeyedSubscript:@"ResourcePath"];

      if (v15)
      {
        v16 = [v10 objectForKey:@"ReleaseVersion"];
        self->_currentReleaseVersion = (int)[v16 intValue];

        v17 = [v10 objectForKey:@"ResourceVersion"];
        self->_currentResourceVersion = (int)[v17 intValue];

        v18 = [v10 objectForKey:@"ResourcePath"];
        resourcePath = self->_resourcePath;
        self->_resourcePath = v18;
        goto LABEL_8;
      }
    }
LABEL_9:
    CFRelease(v9);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configURL, 0);

  objc_storeStrong((id *)&self->_resourcePath, 0);
}

- (SKGConfig)initWithConfigPath:(id)a3 resourceDirectoryPath:(id)a4 resourceVersion:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SKGConfig;
  v10 = [(SKGConfig *)&v14 init];
  if (v10)
  {
    uint64_t v11 = +[NSURL fileURLWithPath:v8];
    configURL = v10->_configURL;
    v10->_configURL = (NSURL *)v11;

    objc_storeStrong((id *)&v10->_resourcePath, a4);
    v10->_currentResourceVersion = a5;
    v10->_currentReleaseVersion = 3;
    [(SKGConfig *)v10 updateConfig];
  }

  return v10;
}

- (NSString)resourcePath
{
  return self->_resourcePath;
}

- (int64_t)resourceVersion
{
  return self->_currentResourceVersion;
}

- (int64_t)releaseVersion
{
  return self->_currentReleaseVersion;
}

- (void)updateConfig
{
  if (self->_configURL)
  {
    v15[0] = @"ReleaseVersion";
    v3 = +[NSNumber numberWithInteger:self->_currentReleaseVersion];
    v16[0] = v3;
    v15[1] = @"ResourceVersion";
    id v4 = +[NSNumber numberWithInteger:self->_currentResourceVersion];
    v15[2] = @"ResourcePath";
    resourcePath = self->_resourcePath;
    v16[1] = v4;
    v16[2] = resourcePath;
    uint64_t v6 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];

    uint64_t v7 = _MDPlistContainerCreateWithObject();
    if (v7)
    {
      id v8 = (const void *)v7;
      uint64_t Bytes = _MDPlistContainerGetBytes();
      uint64_t Length = _MDPlistContainerGetLength();
      if (Bytes) {
        BOOL v11 = Length == 0;
      }
      else {
        BOOL v11 = 1;
      }
      if (!v11)
      {
        v12 = +[NSData dataWithBytes:Bytes length:Length];
        uint64_t v13 = +[NSFileManager defaultManager];
        objc_super v14 = [(NSURL *)self->_configURL path];
        [v13 createFileAtPath:v14 contents:v12 attributes:0];
      }
      CFRelease(v8);
    }
  }
}

@end