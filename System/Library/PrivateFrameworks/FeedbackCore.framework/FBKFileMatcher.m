@interface FBKFileMatcher
+ (id)assetNameForFile:(id)a3;
+ (id)entityName;
+ (id)iconForFileName:(id)a3;
- (BOOL)hasPlatform;
- (BOOL)matchesFilename:(id)a3;
- (NSRegularExpression)regularExpression;
- (id)description;
- (id)iconForRequirement;
- (void)regularExpression;
- (void)setPropertiesFromJSONObject:(id)a3;
- (void)setRegularExpression:(id)a3;
@end

@implementation FBKFileMatcher

+ (id)entityName
{
  return @"FileMatcher";
}

- (void)setPropertiesFromJSONObject:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"description"];
  v6 = FBKNilIfNSNull(v5);
  [(FBKFileMatcher *)self setName:v6];

  v7 = [v4 objectForKeyedSubscript:@"fba_plugin"];
  v8 = FBKStringIfNSNull(v7);
  [(FBKFileMatcher *)self setOperationName:v8];

  v9 = [v4 objectForKeyedSubscript:@"ios_fba_plugin"];
  v10 = FBKStringIfNSNull(v9);
  [(FBKFileMatcher *)self setDeBundleIdentifier:v10];

  v11 = [v4 objectForKeyedSubscript:@"instructions"];
  v12 = FBKStringIfNSNull(v11);
  [(FBKFileMatcher *)self setInstructionsAsHTML:v12];

  v13 = [v4 objectForKeyedSubscript:@"regex"];
  v14 = FBKNilIfNSNull(v13);
  [(FBKFileMatcher *)self setRegularExpressionPattern:v14];

  v15 = [v4 objectForKeyedSubscript:@"platform"];

  uint64_t v16 = FBKNilIfNSNull(v15);
  v17 = (void *)v16;
  uint64_t v18 = *MEMORY[0x263F3A100];
  if (v16) {
    uint64_t v19 = v16;
  }
  else {
    uint64_t v19 = *MEMORY[0x263F3A100];
  }
  [(FBKFileMatcher *)self setPlatform:v19];

  v20 = [(FBKFileMatcher *)self platform];
  int v21 = [v20 isEqualToString:v18];

  if (v21)
  {
    id v22 = +[FBKGroupedDevice currentDevicePlatform];
    [(FBKFileMatcher *)self setPlatform:v22];
  }
}

- (BOOL)hasPlatform
{
  v2 = [(FBKFileMatcher *)self platform];
  char v3 = [v2 isEqualToString:*MEMORY[0x263F3A100]] ^ 1;

  return v3;
}

- (id)description
{
  char v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)FBKFileMatcher;
  id v4 = [(FBKFileMatcher *)&v9 description];
  v5 = [(FBKFileMatcher *)self name];
  v6 = [(FBKManagedFeedbackObject *)self ID];
  v7 = [v3 stringWithFormat:@"%@ %@ (%@)", v4, v5, v6];

  return v7;
}

- (BOOL)matchesFilename:(id)a3
{
  id v4 = a3;
  v5 = [(FBKFileMatcher *)self regularExpression];
  v6 = objc_msgSend(v5, "firstMatchInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));

  return v6 != 0;
}

- (NSRegularExpression)regularExpression
{
  [(FBKFileMatcher *)self willAccessValueForKey:@"regularExpression"];
  if (!self->_regularExpression)
  {
    char v3 = [(FBKFileMatcher *)self regularExpressionPattern];
    if (v3)
    {
      id v12 = 0;
      id v4 = (void *)[objc_alloc(MEMORY[0x263F08AE8]) initWithPattern:v3 options:0 error:&v12];
      id v5 = v12;
      v6 = v5;
      if (v4) {
        BOOL v7 = v5 == 0;
      }
      else {
        BOOL v7 = 0;
      }
      if (v7)
      {
        objc_super v9 = v4;
        p_super = &self->_regularExpression->super;
        self->_regularExpression = v9;
      }
      else
      {
        p_super = +[FBKLog appHandle];
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
          [(FBKFileMatcher *)(uint64_t)v3 regularExpression];
        }
      }
    }
    else
    {
      v6 = 0;
    }
  }
  [(FBKFileMatcher *)self didAccessValueForKey:@"regularExpression"];
  regularExpression = self->_regularExpression;

  return regularExpression;
}

- (void)setRegularExpression:(id)a3
{
  id v4 = (NSRegularExpression *)a3;
  [(FBKFileMatcher *)self willChangeValueForKey:@"regularExpression"];
  regularExpression = self->_regularExpression;
  self->_regularExpression = v4;

  [(FBKFileMatcher *)self didChangeValueForKey:@"regularExpression"];
}

- (id)iconForRequirement
{
  return (id)[MEMORY[0x263F827E8] systemImageNamed:@"doc"];
}

+ (id)iconForFileName:(id)a3
{
  char v3 = (void *)MEMORY[0x263F827E8];
  id v4 = [a1 assetNameForFile:a3];
  id v5 = [v3 systemImageNamed:v4];

  return v5;
}

+ (id)assetNameForFile:(id)a3
{
  id v3 = a3;
  id v4 = [v3 pathExtension];
  id v5 = [v4 lowercaseString];

  v6 = FBKSystemImageNamePaper;
  if (v5)
  {
    if ([v3 isImageFile])
    {
      v6 = FBKSystemImageNamePhoto;
    }
    else if ([v3 isVideoFile])
    {
      v6 = FBKSystemImageNameVideo;
    }
  }
  BOOL v7 = *v6;

  return v7;
}

- (void).cxx_destruct
{
}

- (void)regularExpression
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_22A36D000, log, OS_LOG_TYPE_ERROR, "Error parsing incoming regex /%{public}@/: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end