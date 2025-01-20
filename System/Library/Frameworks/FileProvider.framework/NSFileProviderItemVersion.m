@interface NSFileProviderItemVersion
+ (BOOL)supportsSecureCoding;
+ (NSData)beforeFirstSyncComponent;
- (BOOL)conflictResolved;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (NSArray)equivalentContentVersions;
- (NSArray)equivalentMetadataVersions;
- (NSData)contentVersion;
- (NSData)metadataVersion;
- (NSFileProviderItemVersion)init;
- (NSFileProviderItemVersion)initWithCoder:(id)a3;
- (NSFileProviderItemVersion)initWithContentVersion:(NSData *)contentVersion metadataVersion:(NSData *)metadataVersion;
- (NSFileProviderItemVersion)initWithContentVersion:(id)a3 metadataVersion:(id)a4 lastEditorDeviceName:(id)a5;
- (NSFileProviderItemVersion)initWithMainContentVersion:(id)a3 equivalentContentVersions:(id)a4 mainMetadataVersion:(id)a5 equivalentMetadataVersions:(id)a6 lastEditorDeviceName:(id)a7;
- (NSFileProviderItemVersion)initWithMainContentVersion:(id)a3 equivalentContentVersions:(id)a4 mainMetadataVersion:(id)a5 equivalentMetadataVersions:(id)a6 lastEditorDeviceName:(id)a7 conflictResolved:(BOOL)a8;
- (NSString)lastEditorDeviceName;
- (id)description;
- (id)etagHash;
- (id)versionRewritingBeforeFirstSync;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setConflictResolved:(BOOL)a3;
@end

@implementation NSFileProviderItemVersion

- (NSData)contentVersion
{
  return self->_contentVersion;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_contentVersion forKey:@"c"];
  if ([(NSArray *)self->_equivalentContentVersions count]) {
    [v4 encodeObject:self->_equivalentContentVersions forKey:@"ec"];
  }
  [v4 encodeObject:self->_metadataVersion forKey:@"m"];
  if ([(NSArray *)self->_equivalentMetadataVersions count]) {
    [v4 encodeObject:self->_equivalentMetadataVersions forKey:@"em"];
  }
  [v4 encodeObject:self->_lastEditorDeviceName forKey:@"ledn"];
  [v4 encodeBool:self->_conflictResolved forKey:@"cr"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSFileProviderItemVersion)initWithMainContentVersion:(id)a3 equivalentContentVersions:(id)a4 mainMetadataVersion:(id)a5 equivalentMetadataVersions:(id)a6 lastEditorDeviceName:(id)a7 conflictResolved:(BOOL)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  if ((unint64_t)[v16 count] >= 0x10)
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, self, @"NSFileProviderItemVersion.m", 83, @"Invalid parameter not satisfying: %@", @"equivalentContentVersions.count < 16" object file lineNumber description];
  }
  if ((unint64_t)[v18 count] >= 0x10)
  {
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"NSFileProviderItemVersion.m", 84, @"Invalid parameter not satisfying: %@", @"equivalentMetadataVersions.count < 16" object file lineNumber description];
  }
  v34.receiver = self;
  v34.super_class = (Class)NSFileProviderItemVersion;
  v20 = [(NSFileProviderItemVersion *)&v34 init];
  if (v20)
  {
    uint64_t v21 = [v15 copy];
    contentVersion = v20->_contentVersion;
    v20->_contentVersion = (NSData *)v21;

    uint64_t v23 = [v16 copy];
    equivalentContentVersions = v20->_equivalentContentVersions;
    v20->_equivalentContentVersions = (NSArray *)v23;

    uint64_t v25 = [v17 copy];
    metadataVersion = v20->_metadataVersion;
    v20->_metadataVersion = (NSData *)v25;

    uint64_t v27 = [v18 copy];
    equivalentMetadataVersions = v20->_equivalentMetadataVersions;
    v20->_equivalentMetadataVersions = (NSArray *)v27;

    uint64_t v29 = [v19 copy];
    lastEditorDeviceName = v20->_lastEditorDeviceName;
    v20->_lastEditorDeviceName = (NSString *)v29;

    v20->_conflictResolved = a8;
  }

  return v20;
}

- (NSFileProviderItemVersion)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"c"];
  uint64_t v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"ec"];
  v7 = (void *)v6;
  v8 = (void *)MEMORY[0x1E4F1CBF0];
  if (v6) {
    v9 = (void *)v6;
  }
  else {
    v9 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v10 = v9;

  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"m"];
  uint64_t v12 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"em"];
  v13 = (void *)v12;
  if (v12) {
    v14 = (void *)v12;
  }
  else {
    v14 = v8;
  }
  id v15 = v14;

  id v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ledn"];
  uint64_t v17 = [v4 decodeBoolForKey:@"cr"];

  id v18 = [(NSFileProviderItemVersion *)self initWithMainContentVersion:v5 equivalentContentVersions:v10 mainMetadataVersion:v11 equivalentMetadataVersions:v15 lastEditorDeviceName:v16 conflictResolved:v17];
  return v18;
}

- (NSFileProviderItemVersion)initWithContentVersion:(NSData *)contentVersion metadataVersion:(NSData *)metadataVersion
{
  return [(NSFileProviderItemVersion *)self initWithMainContentVersion:contentVersion equivalentContentVersions:MEMORY[0x1E4F1CBF0] mainMetadataVersion:metadataVersion equivalentMetadataVersions:MEMORY[0x1E4F1CBF0] lastEditorDeviceName:0 conflictResolved:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastEditorDeviceName, 0);
  objc_storeStrong((id *)&self->_metadataVersion, 0);
  objc_storeStrong((id *)&self->_contentVersion, 0);
  objc_storeStrong((id *)&self->_equivalentMetadataVersions, 0);

  objc_storeStrong((id *)&self->_equivalentContentVersions, 0);
}

- (NSFileProviderItemVersion)initWithContentVersion:(id)a3 metadataVersion:(id)a4 lastEditorDeviceName:(id)a5
{
  return [(NSFileProviderItemVersion *)self initWithMainContentVersion:a3 equivalentContentVersions:MEMORY[0x1E4F1CBF0] mainMetadataVersion:a4 equivalentMetadataVersions:MEMORY[0x1E4F1CBF0] lastEditorDeviceName:a5 conflictResolved:0];
}

+ (NSData)beforeFirstSyncComponent
{
  if (beforeFirstSyncComponent_onceToken != -1) {
    dispatch_once(&beforeFirstSyncComponent_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)beforeFirstSyncComponent_beforeFirstSync;

  return (NSData *)v2;
}

uint64_t __53__NSFileProviderItemVersion_beforeFirstSyncComponent__block_invoke()
{
  beforeFirstSyncComponent_beforeFirstSync = [@"NSFileProviderEmptyItemVersionBeforeFirstSyncComponent" dataUsingEncoding:4];

  return MEMORY[0x1F41817F8]();
}

- (NSFileProviderItemVersion)initWithMainContentVersion:(id)a3 equivalentContentVersions:(id)a4 mainMetadataVersion:(id)a5 equivalentMetadataVersions:(id)a6 lastEditorDeviceName:(id)a7
{
  return [(NSFileProviderItemVersion *)self initWithMainContentVersion:a3 equivalentContentVersions:a4 mainMetadataVersion:a5 equivalentMetadataVersions:a6 lastEditorDeviceName:a7 conflictResolved:0];
}

- (NSFileProviderItemVersion)init
{
  v3 = +[_NSFileProviderEmptyItemVersion emptyVersion];

  return v3;
}

- (BOOL)isEmpty
{
  return ![(NSData *)self->_contentVersion length] && [(NSData *)self->_metadataVersion length] == 0;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p (%@, %@), resolved: %hhd>", objc_opt_class(), self, self->_contentVersion, self->_metadataVersion, self->_conflictResolved];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (NSFileProviderItemVersion *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(NSFileProviderItemVersion *)v5 metadataVersion];
      v7 = [(NSFileProviderItemVersion *)self metadataVersion];
      if ([v6 isEqual:v7])
      {
        v8 = [(NSFileProviderItemVersion *)v5 contentVersion];
        v9 = [(NSFileProviderItemVersion *)self contentVersion];
        char v10 = [v8 isEqual:v9];
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = [(NSFileProviderItemVersion *)self contentVersion];
  uint64_t v4 = [v3 hash];
  v5 = [(NSFileProviderItemVersion *)self metadataVersion];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)versionRewritingBeforeFirstSync
{
  v3 = [NSFileProviderItemVersion alloc];
  uint64_t v4 = [(NSFileProviderItemVersion *)self contentVersion];
  v5 = rewriteBeforeFirstSync(v4);
  unint64_t v6 = [(NSFileProviderItemVersion *)self metadataVersion];
  v7 = rewriteBeforeFirstSync(v6);
  v8 = [(NSFileProviderItemVersion *)v3 initWithContentVersion:v5 metadataVersion:v7];

  return v8;
}

- (id)etagHash
{
  uint64_t v4 = [(NSFileProviderItemVersion *)self contentVersion];
  id v5 = (id)[[NSString alloc] initWithData:v4 encoding:1];
  if (v5)
  {
    unint64_t v6 = [MEMORY[0x1E4F28E58] characterSetWithCharactersInString:@"}{/\\%*|\"<>"];
    objc_msgSend(v6, "addCharactersInRange:", 0, 31);
    objc_msgSend(v6, "addCharactersInRange:", 127, 128);
    if ([v5 rangeOfCharacterFromSet:v6] != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_6;
    }
    if ((unint64_t)[v5 length] <= 0x50)
    {
      id v5 = v5;
LABEL_9:

      v9 = v5;
      goto LABEL_12;
    }
    if ((unint64_t)(4 * [v5 length]) <= 0xF2)
    {
LABEL_6:
      v7 = [v4 base64EncodedDataWithOptions:0];
      v8 = (void *)[[NSString alloc] initWithData:v7 encoding:1];

      if (!v8)
      {
        v11 = [MEMORY[0x1E4F28B00] currentHandler];
        [v11 handleFailureInMethod:a2 object:self file:@"NSFileProviderItemVersion.m" lineNumber:231 description:@"Can't base64 encode version"];
      }
      id v5 = v8;

      goto LABEL_9;
    }
  }
  v9 = objc_msgSend(NSString, "fp_hashForToken:", v4);
LABEL_12:

  return v9;
}

- (NSArray)equivalentContentVersions
{
  return self->_equivalentContentVersions;
}

- (NSArray)equivalentMetadataVersions
{
  return self->_equivalentMetadataVersions;
}

- (NSData)metadataVersion
{
  return self->_metadataVersion;
}

- (NSString)lastEditorDeviceName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)conflictResolved
{
  return self->_conflictResolved;
}

- (void)setConflictResolved:(BOOL)a3
{
  self->_conflictResolved = a3;
}

@end