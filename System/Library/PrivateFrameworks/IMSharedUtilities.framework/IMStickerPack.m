@interface IMStickerPack
- (IMStickerPack)initWithDictionary:(id)a3;
- (IMStickerPack)initWithGUID:(id)a3 name:(id)a4 displayAssetURL:(id)a5 fileURL:(id)a6 appBundleIdentifier:(id)a7 appVersion:(id)a8;
- (IMStickerPack)initWithStickerPackProperties:(id)a3 stickerPackBundleURL:(id)a4 appBundleIdentifier:(id)a5 appVersion:(id)a6;
- (NSDictionary)dictionaryRepresentation;
- (NSSet)stickers;
- (NSString)GUID;
- (NSString)appBundleIdentifier;
- (NSString)appVersion;
- (NSString)name;
- (NSURL)displayAssetURL;
- (NSURL)fileURL;
- (id)_generatePackGUIDWithPackID:(id)a3 appBundleID:(id)a4 appVersion:(id)a5;
- (id)description;
- (void)addSticker:(id)a3;
- (void)setAppBundleIdentifier:(id)a3;
- (void)setAppVersion:(id)a3;
- (void)setDisplayAssetURL:(id)a3;
- (void)setFileURL:(id)a3;
- (void)setGUID:(id)a3;
- (void)setName:(id)a3;
@end

@implementation IMStickerPack

- (IMStickerPack)initWithGUID:(id)a3 name:(id)a4 displayAssetURL:(id)a5 fileURL:(id)a6 appBundleIdentifier:(id)a7 appVersion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v36.receiver = self;
  v36.super_class = (Class)IMStickerPack;
  v20 = [(IMStickerPack *)&v36 init];
  if (v20)
  {
    uint64_t v21 = [v14 copy];
    GUID = v20->_GUID;
    v20->_GUID = (NSString *)v21;

    v23 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    stickers = v20->_stickers;
    v20->_stickers = v23;

    uint64_t v25 = [v15 copy];
    name = v20->_name;
    v20->_name = (NSString *)v25;

    uint64_t v27 = [v16 copy];
    displayAssetURL = v20->_displayAssetURL;
    v20->_displayAssetURL = (NSURL *)v27;

    uint64_t v29 = [v17 copy];
    fileURL = v20->_fileURL;
    v20->_fileURL = (NSURL *)v29;

    uint64_t v31 = [v18 copy];
    appBundleIdentifier = v20->_appBundleIdentifier;
    v20->_appBundleIdentifier = (NSString *)v31;

    uint64_t v33 = [v19 copy];
    appVersion = v20->_appVersion;
    v20->_appVersion = (NSString *)v33;
  }
  return v20;
}

- (NSSet)stickers
{
  v2 = (void *)[(NSMutableSet *)self->_stickers copy];

  return (NSSet *)v2;
}

- (void)addSticker:(id)a3
{
  if (a3)
  {
    stickers = self->_stickers;
    -[NSMutableSet addObject:](stickers, "addObject:");
  }
  else
  {
    v4 = IMLogHandleForCategory("IMStickerPack");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1A09F0690(v4);
    }
  }
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = (void *)MEMORY[0x1E4F1C9E8];
  v4 = &stru_1EF2CAD28;
  if (self->_GUID) {
    GUID = (__CFString *)self->_GUID;
  }
  else {
    GUID = &stru_1EF2CAD28;
  }
  if (self->_name) {
    name = (__CFString *)self->_name;
  }
  else {
    name = &stru_1EF2CAD28;
  }
  displayAssetURL = self->_displayAssetURL;
  if (displayAssetURL)
  {
    v4 = [(NSURL *)self->_displayAssetURL path];
  }
  fileURL = self->_fileURL;
  if (fileURL)
  {
    v9 = [(NSURL *)self->_fileURL path];
  }
  else
  {
    v9 = &stru_1EF2CAD28;
  }
  v10 = objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", GUID, @"s", name, @"n", v4, @"a", v9, @"f", self->_appVersion, @"appversion", self->_appBundleIdentifier, @"appid", 0);
  if (fileURL) {

  }
  if (displayAssetURL) {

  }
  return (NSDictionary *)v10;
}

- (IMStickerPack)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKey:@"a"];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5];
  }
  else
  {
    v6 = 0;
  }
  v7 = [v4 objectForKey:@"f"];
  if (v7)
  {
    v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7];
  }
  else
  {
    v8 = 0;
  }
  v9 = [v4 objectForKey:@"s"];
  v10 = [v4 objectForKey:@"n"];
  v11 = [v4 objectForKey:@"appid"];
  v12 = [v4 objectForKey:@"appversion"];
  v13 = [(IMStickerPack *)self initWithGUID:v9 name:v10 displayAssetURL:v6 fileURL:v8 appBundleIdentifier:v11 appVersion:v12];

  return v13;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<IMDStickerPack name:%@ GUID %@ displayAssetURL %@ fileURL %@ stickers %@>", self->_name, self->_GUID, self->_displayAssetURL, self->_fileURL, self->_stickers];
}

- (id)_generatePackGUIDWithPackID:(id)a3 appBundleID:(id)a4 appVersion:(id)a5
{
  return (id)[NSString stringWithFormat:@"%@_%@_%@", a4, a5, a3];
}

- (IMStickerPack)initWithStickerPackProperties:(id)a3 stickerPackBundleURL:(id)a4 appBundleIdentifier:(id)a5 appVersion:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v10 && v11 && v12)
  {
    id v14 = [v10 objectForKey:@"CFBundleIconFile"];
    if (v14)
    {
      id v15 = [v11 path];
      id v16 = [v15 stringByAppendingPathComponent:v14];

      id v14 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v16];
    }
    else
    {
      id v16 = 0;
    }
    id v18 = [v10 objectForKey:@"CFBundleIdentifier"];

    if (v18)
    {
      id v19 = [v10 objectForKey:@"CFBundleIdentifier"];
      v20 = [(IMStickerPack *)self _generatePackGUIDWithPackID:v19 appBundleID:v12 appVersion:v13];
      uint64_t v21 = (void *)[v20 copy];

      v22 = [v10 objectForKey:@"CFBundleName"];
      self = [(IMStickerPack *)self initWithGUID:v21 name:v22 displayAssetURL:v14 fileURL:v11 appBundleIdentifier:v12 appVersion:v13];

      id v17 = self;
    }
    else
    {
      v23 = IMLogHandleForCategory("IMStickerPack");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_1A09F06D4(v23);
      }

      id v17 = 0;
    }
  }
  else
  {
    id v16 = IMLogHandleForCategory("IMStickerPack");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v25 = 138413058;
      id v26 = v10;
      __int16 v27 = 2112;
      id v28 = v12;
      __int16 v29 = 2112;
      id v30 = v11;
      __int16 v31 = 2112;
      id v32 = v13;
      _os_log_error_impl(&dword_1A0772000, v16, OS_LOG_TYPE_ERROR, "IMStickerPack invalid parameters passed to initializer stickerProperties %@, appBundlerID %@, bundleURL %@, appVersion %@", (uint8_t *)&v25, 0x2Au);
    }
    id v17 = 0;
  }

  return v17;
}

- (NSString)GUID
{
  return self->_GUID;
}

- (void)setGUID:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSURL)displayAssetURL
{
  return self->_displayAssetURL;
}

- (void)setDisplayAssetURL:(id)a3
{
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (void)setAppBundleIdentifier:(id)a3
{
}

- (NSString)appVersion
{
  return self->_appVersion;
}

- (void)setAppVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appVersion, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_displayAssetURL, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_GUID, 0);

  objc_storeStrong((id *)&self->_stickers, 0);
}

@end