@interface AXVoiceOverPunctuationShareSource
- (AXVoiceOverPunctuationShareSource)initWithData:(id)a3 fileName:(id)a4;
- (NSString)path;
- (NSURL)fileURL;
- (id)activityViewControllerPlaceholderItem:(id)a3;
- (void)dealloc;
- (void)setPath:(id)a3;
@end

@implementation AXVoiceOverPunctuationShareSource

- (AXVoiceOverPunctuationShareSource)initWithData:(id)a3 fileName:(id)a4
{
  v31.receiver = self;
  v31.super_class = (Class)AXVoiceOverPunctuationShareSource;
  id v5 = a4;
  id v6 = a3;
  v7 = [(AXVoiceOverPunctuationShareSource *)&v31 init];
  v8 = NSTemporaryDirectory();
  v9 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  v10 = [v5 stringByReplacingCharactersInSet:v9 withString:&stru_20F6B8];

  v11 = +[NSString stringWithFormat:@"%@", v10];
  v12 = [v11 stringByAppendingPathExtension:AXSSPunctutionGroupFileExtension];

  v13 = [v8 stringByAppendingPathComponent:v12];
  [(AXVoiceOverPunctuationShareSource *)v7 setPath:v13];

  v14 = +[NSFileManager defaultManager];
  v15 = [(AXVoiceOverPunctuationShareSource *)v7 path];
  unsigned int v16 = [v14 fileExistsAtPath:v15];

  if (v16)
  {
    v17 = +[NSFileManager defaultManager];
    v18 = [(AXVoiceOverPunctuationShareSource *)v7 fileURL];
    id v30 = 0;
    [v17 removeItemAtURL:v18 error:&v30];
    id v19 = v30;

    if (v19)
    {
      v20 = AXLogPunctuationStorage();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[AXVoiceOverPunctuationShareSource initWithData:fileName:]((uint64_t)v19, v20);
      }
    }
  }
  v21 = AXLogPunctuationStorage();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v22 = [(AXVoiceOverPunctuationShareSource *)v7 path];
    *(_DWORD *)buf = 138412290;
    v35 = v22;
    _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "Creating share file at: %@", buf, 0xCu);
  }
  v23 = +[NSFileManager defaultManager];
  v24 = [(AXVoiceOverPunctuationShareSource *)v7 path];
  NSFileAttributeKey v32 = NSFilePosixPermissions;
  v33 = &off_229DF8;
  v25 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
  unsigned __int8 v26 = [v23 createFileAtPath:v24 contents:v6 attributes:v25];

  if (v26)
  {
    v27 = v7;
  }
  else
  {
    v28 = AXLogPunctuationStorage();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[AXVoiceOverPunctuationShareSource initWithData:fileName:](v7, v28);
    }

    v27 = 0;
  }

  return v27;
}

- (NSURL)fileURL
{
  v2 = [(AXVoiceOverPunctuationShareSource *)self path];
  v3 = +[NSURL fileURLWithPath:v2];

  return (NSURL *)v3;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  v3 = [(AXVoiceOverPunctuationShareSource *)self path];
  v4 = +[NSURL fileURLWithPath:v3];

  return v4;
}

- (void)dealloc
{
  v3 = +[NSFileManager defaultManager];
  v4 = [(AXVoiceOverPunctuationShareSource *)self fileURL];
  [v3 removeItemAtURL:v4 error:0];

  v5.receiver = self;
  v5.super_class = (Class)AXVoiceOverPunctuationShareSource;
  [(AXVoiceOverPunctuationShareSource *)&v5 dealloc];
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initWithData:(void *)a1 fileName:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  v3 = [a1 path];
  int v4 = 138412290;
  objc_super v5 = v3;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Err creating share: %@", (uint8_t *)&v4, 0xCu);
}

- (void)initWithData:(uint64_t)a1 fileName:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Err deleting old share: %@", (uint8_t *)&v2, 0xCu);
}

@end