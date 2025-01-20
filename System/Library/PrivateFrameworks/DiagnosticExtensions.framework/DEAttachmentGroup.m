@interface DEAttachmentGroup
+ (BOOL)supportsSecureCoding;
+ (id)createWithName:(id)a3 rootURL:(id)a4;
+ (id)createWithName:(id)a3 rootURL:(id)a4 attachmentItems:(id)a5;
- (DEAttachmentGroup)initWithCoder:(id)a3;
- (NSArray)attachmentItems;
- (NSURL)rootURL;
- (id)attachToDestinationDir:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAttachmentItems:(id)a3;
- (void)setRootURL:(id)a3;
@end

@implementation DEAttachmentGroup

+ (id)createWithName:(id)a3 rootURL:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = objc_alloc_init(DEAttachmentGroup);
  [(DEAttachmentItem *)v7 setDisplayName:v5];
  [(DEAttachmentGroup *)v7 setRootURL:v6];
  v8 = +[DEUtils lsDir:v6];
  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        v16 = [DEAttachmentItem alloc];
        v17 = -[DEAttachmentItem initWithPathURL:](v16, "initWithPathURL:", v15, (void)v22);
        [v9 addObject:v17];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v12);
  }

  v18 = [MEMORY[0x1E4F1C978] arrayWithArray:v9];
  [(DEAttachmentGroup *)v7 setAttachmentItems:v18];

  [(DEAttachmentItem *)v7 setAttachmentType:@"DEAttachmentTypeGroup"];
  v19 = [(DEAttachmentItem *)v7 displayName];
  v20 = [v6 URLByAppendingPathComponent:v19];
  [(DEAttachmentItem *)v7 setPath:v20];

  return v7;
}

+ (id)createWithName:(id)a3 rootURL:(id)a4 attachmentItems:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init(DEAttachmentGroup);
  [(DEAttachmentItem *)v10 setDisplayName:v9];

  [(DEAttachmentGroup *)v10 setRootURL:v8];
  [(DEAttachmentGroup *)v10 setAttachmentItems:v7];

  [(DEAttachmentItem *)v10 setAttachmentType:@"DEAttachmentTypeGroup"];
  uint64_t v11 = [(DEAttachmentItem *)v10 displayName];
  uint64_t v12 = [v8 URLByAppendingPathComponent:v11];

  [(DEAttachmentItem *)v10 setPath:v12];
  return v10;
}

- (DEAttachmentGroup)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)DEAttachmentGroup;
  id v3 = a3;
  v4 = [(DEAttachmentItem *)&v10 initWithCoder:v3];
  uint64_t v5 = objc_msgSend(v3, "decodeObjectForKey:", @"RootURL", v10.receiver, v10.super_class);
  rootURL = v4->_rootURL;
  v4->_rootURL = (NSURL *)v5;

  uint64_t v7 = [v3 decodeObjectForKey:@"AttachmentItems"];

  attachmentItems = v4->_attachmentItems;
  v4->_attachmentItems = (NSArray *)v7;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DEAttachmentGroup;
  id v4 = a3;
  [(DEAttachmentItem *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_rootURL, @"RootURL", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_attachmentItems forKey:@"AttachmentItems"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)attachToDestinationDir:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = +[DELogging fwHandle];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v36 = v4;
    _os_log_impl(&dword_1A7E51000, v5, OS_LOG_TYPE_INFO, "Log destination directory: %{public}@", buf, 0xCu);
  }

  id v6 = [(DEAttachmentItem *)self displayName];
  if (v6)
  {
    uint64_t v7 = [(DEAttachmentItem *)self displayName];
  }
  else
  {
    id v8 = [(DEAttachmentGroup *)self rootURL];
    uint64_t v7 = [v8 lastPathComponent];
  }
  id v9 = [v4 URLByAppendingPathComponent:v7];
  objc_super v10 = +[DEUtils createDirectoryWithClassCDataProtection:v9];
  if (v10)
  {
    uint64_t v11 = +[DELogging fwHandle];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      [(DEAttachmentGroup *)(uint64_t)v9 attachToDestinationDir:v11];
    }
  }
  else
  {
    [(DEAttachmentItem *)self setAttachedPath:v9];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v11 = [(DEAttachmentGroup *)self attachmentItems];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v31 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = (id)[*(id *)(*((void *)&v30 + 1) + 8 * i) attachToDestinationDir:v9];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v13);
    }
  }

  uint64_t v17 = [(DEAttachmentItem *)self attachedPath];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(DEAttachmentItem *)self deleteOnAttach];
    int v20 = [v19 BOOLValue];

    if (v20)
    {
      v21 = +[DELogging fwHandle];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        -[DEAttachmentGroup attachToDestinationDir:](v21);
      }

      long long v22 = [(DEAttachmentGroup *)self rootURL];
      +[DEUtils removeFile:v22];
    }
  }
  long long v23 = [(DEAttachmentItem *)self shouldCompress];
  int v24 = [v23 BOOLValue];

  if (v24)
  {
    long long v25 = +[DELogging fwHandle];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      -[DEAttachmentGroup attachToDestinationDir:](v25);
    }

    v26 = [(DEAttachmentItem *)self attachedPath];
    uint64_t v27 = +[DEArchiver archiveDirectoryAt:v26];
    [(DEAttachmentItem *)self setAttachedPath:v27];
  }
  v28 = [(DEAttachmentItem *)self attachedPath];

  return v28;
}

- (NSURL)rootURL
{
  return self->_rootURL;
}

- (void)setRootURL:(id)a3
{
}

- (NSArray)attachmentItems
{
  return self->_attachmentItems;
}

- (void)setAttachmentItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentItems, 0);
  objc_storeStrong((id *)&self->_rootURL, 0);
}

- (void)attachToDestinationDir:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A7E51000, log, OS_LOG_TYPE_DEBUG, "will compress group", v1, 2u);
}

- (void)attachToDestinationDir:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A7E51000, log, OS_LOG_TYPE_DEBUG, "will delete group after attaching", v1, 2u);
}

- (void)attachToDestinationDir:(NSObject *)a3 .cold.3(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  objc_super v5 = [a2 localizedDescription];
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  id v9 = v5;
  _os_log_error_impl(&dword_1A7E51000, a3, OS_LOG_TYPE_ERROR, "error creating group directory [%{public}@] with error [%{public}@]", (uint8_t *)&v6, 0x16u);
}

@end