@interface DEDAttachmentGroup
+ (id)archivedClasses;
+ (id)groupWithDEGroup:(id)a3 identifier:(id)a4;
+ (id)groupWithDictionary:(id)a3;
- (BOOL)isLocal;
- (DEDBugSession)fromBugSession;
- (DEDExtensionIdentifier)dedExtensionIdentifier;
- (NSArray)attachmentItems;
- (NSString)description;
- (NSString)deviceID;
- (NSString)displayName;
- (NSString)extensionID;
- (NSURL)rootURL;
- (id)archiveName;
- (id)serialize;
- (id)totalFileSize;
- (void)isLocal;
- (void)setAttachmentItems:(id)a3;
- (void)setDedExtensionIdentifier:(id)a3;
- (void)setDeviceID:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setExtensionID:(id)a3;
- (void)setFromBugSession:(id)a3;
- (void)setRootURL:(id)a3;
@end

@implementation DEDAttachmentGroup

+ (id)groupWithDictionary:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = objc_opt_new();
  if (v4)
  {
    v5 = NSURL;
    v6 = [v3 objectForKeyedSubscript:@"rootURL"];
    v7 = [v5 fileURLWithPath:v6];
    [v4 setRootURL:v7];

    v8 = [v3 objectForKeyedSubscript:@"displayName"];
    v9 = stringIfNil(v8);
    [v4 setDisplayName:v9];

    v10 = [v3 objectForKeyedSubscript:@"extensionID"];
    v11 = stringIfNil(v10);
    [v4 setExtensionID:v11];

    v12 = [v3 objectForKeyedSubscript:@"deviceID"];
    v13 = stringIfNil(v12);
    [v4 setDeviceID:v13];

    v14 = [v3 objectForKeyedSubscript:@"attachmentItems"];
    if (v14)
    {
      v15 = [v3 objectForKeyedSubscript:@"attachmentItems"];
    }
    else
    {
      v15 = &unk_26D1AF368;
    }

    v16 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v15, "count"));
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v17 = v15;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v26 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = +[DEDAttachmentItem itemWithDictionary:](DEDAttachmentItem, "itemWithDictionary:", *(void *)(*((void *)&v25 + 1) + 8 * i), (void)v25);
          [v16 addObject:v22];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v19);
    }

    v23 = [MEMORY[0x263EFF8C0] arrayWithArray:v16];
    [v4 setAttachmentItems:v23];
  }
  return v4;
}

+ (id)groupWithDEGroup:(id)a3 identifier:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  if (v7)
  {
    v8 = [v5 rootURL];
    [v7 setRootURL:v8];

    v9 = [v5 displayName];
    if (v9)
    {
      v10 = [v5 displayName];
      [v7 setDisplayName:v10];
    }
    else
    {
      v10 = [v7 rootURL];
      v11 = [v10 lastPathComponent];
      [v7 setDisplayName:v11];
    }
    [v7 setExtensionID:v6];
    v12 = +[DEDDevice currentDevice];
    v13 = [v12 identifier];
    [v7 setDeviceID:v13];

    v14 = (void *)MEMORY[0x263EFF980];
    v15 = [v5 attachmentItems];
    v16 = objc_msgSend(v14, "arrayWithCapacity:", objc_msgSend(v15, "count"));

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v17 = objc_msgSend(v5, "attachmentItems", 0);
    uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v26 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = +[DEDAttachmentItem itemWithDEItem:*(void *)(*((void *)&v25 + 1) + 8 * i)];
          [v16 addObject:v22];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v19);
    }

    v23 = [MEMORY[0x263EFF8C0] arrayWithArray:v16];
    [v7 setAttachmentItems:v23];
  }
  return v7;
}

- (id)totalFileSize
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [(DEDAttachmentGroup *)self attachmentItems];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        v8 = [*(id *)(*((void *)&v11 + 1) + 8 * i) fileSize];
        v5 += [v8 integerValue];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t v5 = 0;
  }

  v9 = [NSNumber numberWithInteger:v5];
  return v9;
}

- (id)archiveName
{
  uint64_t v3 = [(DEDAttachmentGroup *)self extensionID];

  if (v3)
  {
    uint64_t v4 = NSString;
    uint64_t v5 = [(DEDAttachmentGroup *)self extensionID];
    [v4 stringWithFormat:@"%@.tar.gz", v5];
  }
  else
  {
    uint64_t v6 = [(DEDAttachmentGroup *)self attachmentItems];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      v8 = [(DEDAttachmentGroup *)self attachmentItems];
      v9 = [v8 firstObject];
      v10 = [v9 attachedPath];
      uint64_t v5 = [v10 lastPathComponent];
    }
    else
    {
      v8 = [MEMORY[0x263F08C38] UUID];
      uint64_t v5 = [v8 UUIDString];
    }

    [NSString stringWithFormat:@"%@.tar.gz", v5];
  long long v11 = };

  return v11;
}

- (id)serialize
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x263EFF980];
  uint64_t v4 = [(DEDAttachmentGroup *)self attachmentItems];
  uint64_t v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v6 = [(DEDAttachmentGroup *)self attachmentItems];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = [*(id *)(*((void *)&v29 + 1) + 8 * i) serialize];
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v8);
  }

  long long v12 = [MEMORY[0x263EFF8C0] arrayWithArray:v5];
  v33[0] = @"rootURL";
  long long v28 = [(DEDAttachmentGroup *)self rootURL];
  long long v27 = [v28 path];
  long long v26 = stringIfNil(v27);
  v34[0] = v26;
  v33[1] = @"displayName";
  long long v25 = [(DEDAttachmentGroup *)self displayName];
  long long v13 = stringIfNil(v25);
  v34[1] = v13;
  v33[2] = @"extensionID";
  long long v14 = [(DEDAttachmentGroup *)self extensionID];
  v15 = stringIfNil(v14);
  v34[2] = v15;
  v33[3] = @"deviceID";
  uint64_t v16 = [(DEDAttachmentGroup *)self deviceID];
  id v17 = stringIfNil(v16);
  v34[3] = v17;
  v33[4] = @"DEDExtensionID";
  uint64_t v18 = [(DEDAttachmentGroup *)self dedExtensionIdentifier];
  uint64_t v19 = [v18 stringValue];
  uint64_t v20 = stringIfNil(v19);
  v21 = (void *)v20;
  v33[5] = @"attachmentItems";
  v22 = (void *)MEMORY[0x263EFFA68];
  if (v12) {
    v22 = v12;
  }
  v34[4] = v20;
  v34[5] = v22;
  id v24 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:6];

  return v24;
}

- (DEDExtensionIdentifier)dedExtensionIdentifier
{
  dedExtensionIdentifier = self->_dedExtensionIdentifier;
  if (!dedExtensionIdentifier)
  {
    uint64_t v4 = [DEDExtensionIdentifier alloc];
    uint64_t v5 = [(DEDAttachmentGroup *)self rootURL];
    uint64_t v6 = [v5 lastPathComponent];
    uint64_t v7 = [(DEDExtensionIdentifier *)v4 initWithString:v6];
    uint64_t v8 = self->_dedExtensionIdentifier;
    self->_dedExtensionIdentifier = v7;

    dedExtensionIdentifier = self->_dedExtensionIdentifier;
  }
  return dedExtensionIdentifier;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [(DEDAttachmentGroup *)self serialize];
  uint64_t v7 = [v3 stringWithFormat:@"%@: %@", v5, v6];

  return (NSString *)v7;
}

- (BOOL)isLocal
{
  uint64_t v3 = [(DEDAttachmentGroup *)self deviceID];

  if (!v3)
  {
    uint64_t v4 = +[DEDUtils sharedLog];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[DEDAttachmentGroup isLocal](v4);
    }
  }
  uint64_t v5 = +[DEDDevice currentDevice];
  uint64_t v6 = [v5 identifier];

  uint64_t v7 = [(DEDAttachmentGroup *)self deviceID];
  LOBYTE(v5) = [v7 isEqualToString:v6];

  return (char)v5;
}

+ (id)archivedClasses
{
  if (archivedClasses_onceToken != -1) {
    dispatch_once(&archivedClasses_onceToken, &__block_literal_global);
  }
  v2 = (void *)archivedClasses__outboundClasses;
  return v2;
}

void __37__DEDAttachmentGroup_archivedClasses__block_invoke()
{
  v0 = (void *)MEMORY[0x263EFF9C0];
  uint64_t v1 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, objc_opt_class(), 0);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = +[DEDAttachmentItem archivedClasses];
  [v6 unionSet:v2];

  uint64_t v3 = +[DEDExtensionIdentifier archivedClasses];
  [v6 unionSet:v3];

  uint64_t v4 = [MEMORY[0x263EFFA08] setWithSet:v6];
  uint64_t v5 = (void *)archivedClasses__outboundClasses;
  archivedClasses__outboundClasses = v4;
}

- (DEDBugSession)fromBugSession
{
  return (DEDBugSession *)objc_getProperty(self, a2, 8, 1);
}

- (void)setFromBugSession:(id)a3
{
}

- (NSString)deviceID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDeviceID:(id)a3
{
}

- (NSURL)rootURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRootURL:(id)a3
{
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)extensionID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setExtensionID:(id)a3
{
}

- (NSArray)attachmentItems
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAttachmentItems:(id)a3
{
}

- (void)setDedExtensionIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dedExtensionIdentifier, 0);
  objc_storeStrong((id *)&self->_attachmentItems, 0);
  objc_storeStrong((id *)&self->_extensionID, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_rootURL, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_fromBugSession, 0);
}

- (void)isLocal
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21FE04000, log, OS_LOG_TYPE_ERROR, "could not determine isLocal because device ID is nil", v1, 2u);
}

@end