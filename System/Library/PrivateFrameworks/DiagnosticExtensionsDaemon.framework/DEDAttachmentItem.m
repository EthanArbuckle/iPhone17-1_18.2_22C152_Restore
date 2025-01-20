@interface DEDAttachmentItem
+ (id)archivedClasses;
+ (id)itemWithDEItem:(id)a3;
+ (id)itemWithDictionary:(id)a3;
+ (id)itemWithURL:(id)a3;
+ (id)itemWithURL:(id)a3 shouldCheckURLAttributes:(BOOL)a4;
- (BOOL)isLocal;
- (NSDate)modificationDate;
- (NSNumber)fileSize;
- (NSString)description;
- (NSString)deviceID;
- (NSString)displayName;
- (NSURL)attachedPath;
- (id)serialize;
- (void)serialize;
- (void)setAttachedPath:(id)a3;
- (void)setDeviceID:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setFileSize:(id)a3;
- (void)setModificationDate:(id)a3;
@end

@implementation DEDAttachmentItem

+ (id)itemWithURL:(id)a3 shouldCheckURLAttributes:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = (objc_class *)MEMORY[0x263F3A080];
  id v7 = a3;
  v8 = (void *)[[v6 alloc] initWithPathURL:v7 shouldCheckURLAttributes:v4];

  if (v8)
  {
    v9 = [a1 itemWithDEItem:v8];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)itemWithURL:(id)a3
{
  return (id)[a1 itemWithURL:a3 shouldCheckURLAttributes:1];
}

+ (id)itemWithDictionary:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_opt_new();
  if (v4)
  {
    v5 = [v3 objectForKeyedSubscript:@"displayName"];
    v6 = stringIfNil(v5);
    [v4 setDisplayName:v6];

    id v7 = NSURL;
    v8 = [v3 objectForKeyedSubscript:@"attachedPath"];
    v9 = [v7 fileURLWithPath:v8];
    [v4 setAttachedPath:v9];

    v10 = (void *)MEMORY[0x263EFF910];
    v11 = [v3 objectForKeyedSubscript:@"modificationDate"];
    v12 = [v10 _dateWithString:v11];
    [v4 setModificationDate:v12];

    v13 = [v3 objectForKeyedSubscript:@"fileSize"];
    [v4 setFileSize:v13];

    v14 = [v3 objectForKeyedSubscript:@"deviceID"];
    [v4 setDeviceID:v14];
  }
  return v4;
}

+ (id)itemWithDEItem:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_opt_new();
  if (v4)
  {
    v5 = [v3 displayName];
    if (v5)
    {
      v6 = [v3 displayName];
      [v4 setDisplayName:v6];
    }
    else
    {
      v6 = [v3 attachedPath];
      id v7 = [v6 lastPathComponent];
      [v4 setDisplayName:v7];
    }
    v8 = [v3 path];
    [v4 setAttachedPath:v8];

    v9 = [v3 modificationDate];
    [v4 setModificationDate:v9];

    v10 = [v3 filesize];
    [v4 setFileSize:v10];

    v11 = +[DEDDevice currentDevice];
    v12 = [v11 identifier];
    [v4 setDeviceID:v12];
  }
  return v4;
}

- (id)serialize
{
  v21[5] = *MEMORY[0x263EF8340];
  id v3 = [(DEDAttachmentItem *)self attachedPath];
  BOOL v4 = [v3 path];

  if (!v4)
  {
    v5 = +[DEDUtils sharedLog];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(DEDAttachmentItem *)self serialize];
    }
  }
  v20[0] = @"displayName";
  v19 = [(DEDAttachmentItem *)self displayName];
  v18 = stringIfNil(v19);
  v21[0] = v18;
  v20[1] = @"attachedPath";
  v17 = [(DEDAttachmentItem *)self attachedPath];
  v6 = [v17 path];
  id v7 = stringIfNil(v6);
  v21[1] = v7;
  v20[2] = @"modificationDate";
  v8 = [(DEDAttachmentItem *)self modificationDate];
  v9 = [v8 serialize];
  v10 = stringIfNil(v9);
  v21[2] = v10;
  v20[3] = @"fileSize";
  v11 = [(DEDAttachmentItem *)self fileSize];
  if (v11)
  {
    v12 = [(DEDAttachmentItem *)self fileSize];
  }
  else
  {
    v12 = &unk_26D1AF3E0;
  }
  v21[3] = v12;
  v20[4] = @"deviceID";
  v13 = [(DEDAttachmentItem *)self deviceID];
  v14 = stringIfNil(v13);
  v21[4] = v14;
  v15 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:5];

  if (v11) {
  return v15;
  }
}

- (BOOL)isLocal
{
  id v3 = [(DEDAttachmentItem *)self deviceID];

  if (!v3)
  {
    BOOL v4 = +[DEDUtils sharedLog];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[DEDAttachmentGroup isLocal](v4);
    }
  }
  v5 = +[DEDDevice currentDevice];
  v6 = [v5 identifier];

  id v7 = [(DEDAttachmentItem *)self deviceID];
  LOBYTE(v5) = [v7 isEqualToString:v6];

  return (char)v5;
}

- (NSString)description
{
  id v3 = NSString;
  BOOL v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(DEDAttachmentItem *)self serialize];
  id v7 = [v3 stringWithFormat:@"%@: %@", v5, v6];

  return (NSString *)v7;
}

+ (id)archivedClasses
{
  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
}

- (NSString)deviceID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDeviceID:(id)a3
{
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDisplayName:(id)a3
{
}

- (NSDate)modificationDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setModificationDate:(id)a3
{
}

- (NSNumber)fileSize
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFileSize:(id)a3
{
}

- (NSURL)attachedPath
{
  return (NSURL *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAttachedPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachedPath, 0);
  objc_storeStrong((id *)&self->_fileSize, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
}

- (void)serialize
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 displayName];
  int v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_21FE04000, a2, OS_LOG_TYPE_ERROR, "attachment item [%{public}@] has nil path", (uint8_t *)&v4, 0xCu);
}

@end