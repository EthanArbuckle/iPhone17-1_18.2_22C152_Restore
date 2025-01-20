@interface BRNonLocalVersion
+ (id)listVersionsOfDocumentAtURL:(id)a3;
- (BOOL)hasThumbnail;
- (BOOL)isLatestVersion;
- (BRNonLocalVersion)initWithURL:(id)a3 physicalURL:(id)a4 size:(id)a5 extension:(id)a6 etag:(id)a7 hasThumbnail:(BOOL)a8 displayName:(id)a9 lastEditorDeviceName:(id)a10 lastEditorNameComponents:(id)a11 modificationDate:(id)a12 versionsStore:(id)a13;
- (NSCopying)persistentIdentifier;
- (NSDate)modificationDate;
- (NSPersonNameComponents)lastEditorNameComponents;
- (NSString)displayName;
- (NSString)etag;
- (NSString)lastEditorDeviceName;
- (NSString)lastEditorFormattedName;
- (NSURL)url;
- (id)description;
- (unint64_t)size;
- (void)dealloc;
- (void)setHasThumbnail:(BOOL)a3;
@end

@implementation BRNonLocalVersion

- (NSString)lastEditorFormattedName
{
  return (NSString *)[(NSPersonNameComponents *)self->_lastEditorNameComponents br_formattedName];
}

- (BOOL)isLatestVersion
{
  return 0;
}

- (BRNonLocalVersion)initWithURL:(id)a3 physicalURL:(id)a4 size:(id)a5 extension:(id)a6 etag:(id)a7 hasThumbnail:(BOOL)a8 displayName:(id)a9 lastEditorDeviceName:(id)a10 lastEditorNameComponents:(id)a11 modificationDate:(id)a12 versionsStore:(id)a13
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v37 = a3;
  id v36 = a4;
  id v18 = a5;
  id v19 = a6;
  id v35 = a7;
  id v34 = a9;
  id v33 = a10;
  id v32 = a11;
  id v20 = a12;
  id v31 = a13;
  v38.receiver = self;
  v38.super_class = (Class)BRNonLocalVersion;
  v21 = [(BRNonLocalVersion *)&v38 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_etag, a7);
    objc_storeStrong((id *)&v22->_url, a3);
    objc_storeStrong((id *)&v22->_physicalURL, a4);
    objc_storeStrong((id *)&v22->_lastEditorDeviceName, a10);
    objc_storeStrong((id *)&v22->_lastEditorNameComponents, a11);
    v22->_hasThumbnail = a8;
    objc_storeStrong((id *)&v22->_versionsStore, a13);
    v22->_size = [v18 unsignedLongLongValue];
    objc_storeStrong((id *)&v22->_displayName, a9);
    if ([v19 length])
    {
      id v23 = v19;
      [v23 bytes];
      uint64_t v24 = sandbox_extension_consume();
      v22->_sandboxHandle = v24;
      if (v24 < 0)
      {
        int v25 = *__error();
        v26 = brc_bread_crumbs((uint64_t)"-[BRNonLocalVersion initWithURL:physicalURL:size:extension:etag:hasThumbnail:displayName:lastEditorDeviceName:lastEditorNameComponents:modificationDate:versionsStore:]", 72);
        v27 = brc_default_log(0);
        if (os_log_type_enabled(v27, (os_log_type_t)0x90u))
        {
          *(_DWORD *)buf = 138412802;
          id v40 = v23;
          __int16 v41 = 1024;
          int v42 = v25;
          __int16 v43 = 2112;
          v44 = v26;
          _os_log_error_impl(&dword_19ED3F000, v27, (os_log_type_t)0x90u, "[ERROR] Failed to consume extension %@ %{errno}d%@", buf, 0x1Cu);
        }

        *__error() = v25;
      }
    }
    else
    {
      v22->_sandboxHandle = -1;
    }
    objc_storeStrong((id *)&v22->_modificationDate, a12);
  }

  return v22;
}

- (void)dealloc
{
  if ((self->_sandboxHandle & 0x8000000000000000) == 0) {
    sandbox_extension_release();
  }
  v3.receiver = self;
  v3.super_class = (Class)BRNonLocalVersion;
  [(BRNonLocalVersion *)&v3 dealloc];
}

- (NSCopying)persistentIdentifier
{
  objc_super v3 = [MEMORY[0x1E4F63BE8] manager];
  versionsStore = self->_versionsStore;
  v5 = [(NSURL *)self->_url lastPathComponent];
  v6 = [v3 persistentIdentifierInStorage:versionsStore forAdditionNamed:v5 inNameSpace:*MEMORY[0x1E4F63BB8]];

  return (NSCopying *)v6;
}

+ (id)listVersionsOfDocumentAtURL:(id)a3
{
  id v3 = a3;
  v4 = [[BRListNonLocalVersionsOperation alloc] initWithDocumentURL:v3];

  return v4;
}

- (id)description
{
  id v3 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v4 = objc_opt_class();
  displayName = self->_displayName;
  lastEditorDeviceName = self->_lastEditorDeviceName;
  uint64_t v7 = [(BRNonLocalVersion *)self lastEditorFormattedName];
  v8 = (void *)v7;
  if (v7) {
    v9 = (__CFString *)v7;
  }
  else {
    v9 = @"You";
  }
  long long v16 = *(_OWORD *)&self->_size;
  etag = self->_etag;
  v11 = [(NSURL *)self->_url path];
  v12 = [v3 stringWithFormat:@"<%@ name:'%@' device:'%@' owner:'%@' size:%llu mtime:%@ etag:%@ url:'%@'", v4, displayName, lastEditorDeviceName, v9, v16, etag, v11];

  physicalURL = self->_physicalURL;
  if (physicalURL && self->_url != physicalURL)
  {
    v14 = [(NSURL *)physicalURL path];
    [v12 appendFormat:@" physical:'%@'", v14];
  }
  [v12 appendString:@">"];

  return v12;
}

- (NSString)etag
{
  return self->_etag;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (unint64_t)size
{
  return self->_size;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (NSString)lastEditorDeviceName
{
  return self->_lastEditorDeviceName;
}

- (NSPersonNameComponents)lastEditorNameComponents
{
  return self->_lastEditorNameComponents;
}

- (BOOL)hasThumbnail
{
  return self->_hasThumbnail;
}

- (void)setHasThumbnail:(BOOL)a3
{
  self->_hasThumbnail = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_physicalURL, 0);
  objc_storeStrong((id *)&self->_versionsStore, 0);
  objc_storeStrong((id *)&self->_lastEditorNameComponents, 0);
  objc_storeStrong((id *)&self->_lastEditorDeviceName, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_etag, 0);
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end