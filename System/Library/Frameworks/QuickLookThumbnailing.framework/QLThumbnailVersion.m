@interface QLThumbnailVersion
+ (BOOL)supportsSecureCoding;
- (BOOL)isAutomaticallyGenerated;
- (BOOL)isDefaultVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldBeInvalidatedByThumbnailWithVersion:(id)a3;
- (NSData)versionIdentifier;
- (NSDate)modificationDate;
- (NSString)filenameExtension;
- (NSString)generatorID;
- (NSString)generatorVersion;
- (QLThumbnailVersion)init;
- (QLThumbnailVersion)initWithCoder:(id)a3;
- (QLThumbnailVersion)initWithDictionaryRepresentation:(id)a3;
- (QLThumbnailVersion)initWithFPItem:(id)a3 automaticallyGenerated:(BOOL)a4;
- (QLThumbnailVersion)initWithFPItem:(id)a3 generatorID:(id)a4 generatorVersion:(id)a5;
- (QLThumbnailVersion)initWithFileURL:(id)a3 automaticallyGenerated:(BOOL)a4;
- (QLThumbnailVersion)initWithFileURL:(id)a3 generatorID:(id)a4 generatorVersion:(id)a5;
- (QLThumbnailVersion)initWithModificationDate:(id)a3 fileSize:(unint64_t)a4 filenameExtension:(id)a5 versionIdentifier:(id)a6 ino:(unint64_t)a7 generatorID:(id)a8 generatorVersion:(id)a9;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)fileSize;
- (unint64_t)hash;
- (unint64_t)ino;
- (void)encodeWithCoder:(id)a3;
- (void)getGeneratorID:(id *)a3 version:(id *)a4;
- (void)setFileSize:(unint64_t)a3;
- (void)setFilenameExtension:(id)a3;
- (void)setGeneratorID:(id)a3;
- (void)setGeneratorVersion:(id)a3;
- (void)setIno:(unint64_t)a3;
- (void)setModificationDate:(id)a3;
- (void)setVersionIdentifier:(id)a3;
@end

@implementation QLThumbnailVersion

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filenameExtension, 0);
  objc_storeStrong((id *)&self->_versionIdentifier, 0);
  objc_storeStrong((id *)&self->_generatorVersion, 0);
  objc_storeStrong((id *)&self->_generatorID, 0);

  objc_storeStrong((id *)&self->_modificationDate, 0);
}

- (BOOL)isDefaultVersion
{
  v3 = [(QLThumbnailVersion *)self generatorID];
  char v4 = [v3 isEqualToString:@"com.apple.MobileQuickLook"];
  v5 = [(QLThumbnailVersion *)self generatorVersion];
  char v6 = v4 & [v5 isEqualToString:@"1"];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (QLThumbnailVersion *)a3;
  if (v5 == self)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v6 = v5;
      generatorID = self->_generatorID;
      v8 = [(QLThumbnailVersion *)v6 generatorID];
      if (generatorID != v8)
      {
        v9 = self->_generatorID;
        v10 = [(QLThumbnailVersion *)v6 generatorID];
        if (![(NSString *)v9 isEqual:v10])
        {
          BOOL v11 = 0;
          goto LABEL_35;
        }
        v37 = v10;
      }
      generatorVersion = self->_generatorVersion;
      v13 = [(QLThumbnailVersion *)v6 generatorVersion];
      if (generatorVersion != v13)
      {
        v14 = self->_generatorVersion;
        v3 = [(QLThumbnailVersion *)v6 generatorVersion];
        if (![(NSString *)v14 isEqual:v3])
        {
          BOOL v11 = 0;
LABEL_33:

LABEL_34:
          v10 = v37;
          if (generatorID == v8)
          {
LABEL_36:

            goto LABEL_37;
          }
LABEL_35:

          goto LABEL_36;
        }
      }
      modificationDate = self->_modificationDate;
      v16 = [(QLThumbnailVersion *)v6 modificationDate];
      v36 = modificationDate;
      if (modificationDate == v16)
      {
        v34 = v3;
      }
      else
      {
        v17 = self->_modificationDate;
        v35 = [(QLThumbnailVersion *)v6 modificationDate];
        if (!-[NSDate isEqual:](v17, "isEqual:"))
        {
          BOOL v11 = 0;
LABEL_31:

LABEL_32:
          if (generatorVersion == v13) {
            goto LABEL_34;
          }
          goto LABEL_33;
        }
        v34 = v3;
      }
      versionIdentifier = self->_versionIdentifier;
      v19 = [(QLThumbnailVersion *)v6 versionIdentifier];
      v33 = versionIdentifier;
      if (versionIdentifier == v19)
      {
        unint64_t fileSize = self->_fileSize;
        if (fileSize != [(QLThumbnailVersion *)v6 fileSize])
        {
          BOOL v11 = 0;
          goto LABEL_30;
        }
      }
      else
      {
        v20 = self->_versionIdentifier;
        v32 = [(QLThumbnailVersion *)v6 versionIdentifier];
        if ((-[NSData isEqual:](v20, "isEqual:") & 1) == 0
          || (unint64_t v21 = self->_fileSize, v21 != [(QLThumbnailVersion *)v6 fileSize]))
        {
          BOOL v11 = 0;
          goto LABEL_29;
        }
      }
      filenameExtension = self->_filenameExtension;
      uint64_t v24 = [(QLThumbnailVersion *)v6 filenameExtension];
      if (filenameExtension == (NSString *)v24)
      {
        unint64_t ino = self->_ino;
        BOOL v11 = ino == [(QLThumbnailVersion *)v6 ino];
      }
      else
      {
        v29 = self->_filenameExtension;
        v31 = (void *)v24;
        v25 = [(QLThumbnailVersion *)v6 filenameExtension];
        if ([(NSString *)v29 isEqual:v25])
        {
          v30 = v25;
          unint64_t v26 = self->_ino;
          BOOL v11 = v26 == [(QLThumbnailVersion *)v6 ino];
        }
        else
        {

          BOOL v11 = 0;
        }
      }
      if (v33 == v19)
      {
LABEL_30:

        v3 = v34;
        if (v36 == v16) {
          goto LABEL_32;
        }
        goto LABEL_31;
      }
LABEL_29:

      goto LABEL_30;
    }
    BOOL v11 = 0;
  }
LABEL_37:

  return v11;
}

- (NSString)generatorID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSData)versionIdentifier
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)generatorVersion
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSDate)modificationDate
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)ino
{
  return self->_ino;
}

- (NSString)filenameExtension
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (unint64_t)fileSize
{
  return self->_fileSize;
}

- (QLThumbnailVersion)initWithFPItem:(id)a3 generatorID:(id)a4 generatorVersion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  BOOL v11 = [v10 contentModificationDate];
  v12 = [v10 documentSize];
  uint64_t v13 = [v12 unsignedIntegerValue];
  v14 = [v10 filename];
  v15 = [v14 pathExtension];
  v16 = [v10 itemVersion];

  v17 = [v16 contentVersion];
  v18 = [(QLThumbnailVersion *)self initWithModificationDate:v11 fileSize:v13 filenameExtension:v15 versionIdentifier:v17 ino:0 generatorID:v9 generatorVersion:v8];

  return v18;
}

- (QLThumbnailVersion)initWithModificationDate:(id)a3 fileSize:(unint64_t)a4 filenameExtension:(id)a5 versionIdentifier:(id)a6 ino:(unint64_t)a7 generatorID:(id)a8 generatorVersion:(id)a9
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  id v19 = a9;
  v23.receiver = self;
  v23.super_class = (Class)QLThumbnailVersion;
  v20 = [(QLThumbnailVersion *)&v23 init];
  unint64_t v21 = v20;
  if (v20)
  {
    [(QLThumbnailVersion *)v20 setModificationDate:v15];
    [(QLThumbnailVersion *)v21 setFileSize:a4];
    [(QLThumbnailVersion *)v21 setFilenameExtension:v16];
    [(QLThumbnailVersion *)v21 setVersionIdentifier:v17];
    [(QLThumbnailVersion *)v21 setGeneratorID:v18];
    [(QLThumbnailVersion *)v21 setGeneratorVersion:v19];
    [(QLThumbnailVersion *)v21 setIno:a7];
  }

  return v21;
}

- (void)setGeneratorVersion:(id)a3
{
}

- (void)setGeneratorID:(id)a3
{
}

- (void)setVersionIdentifier:(id)a3
{
}

- (void)setModificationDate:(id)a3
{
}

- (void)setIno:(unint64_t)a3
{
  self->_unint64_t ino = a3;
}

- (void)setFilenameExtension:(id)a3
{
}

- (void)setFileSize:(unint64_t)a3
{
  self->_unint64_t fileSize = a3;
}

- (QLThumbnailVersion)initWithFPItem:(id)a3 automaticallyGenerated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    id v11 = 0;
    id v12 = 0;
    [(QLThumbnailVersion *)self getGeneratorID:&v12 version:&v11];
    id v7 = v12;
    id v8 = v11;
  }
  else
  {
    id v7 = 0;
    id v8 = 0;
  }
  id v9 = [(QLThumbnailVersion *)self initWithFPItem:v6 generatorID:v7 generatorVersion:v8];

  return v9;
}

- (void)getGeneratorID:(id *)a3 version:(id *)a4
{
  *a3 = @"com.apple.MobileQuickLook";
  *a4 = @"1";
}

- (QLThumbnailVersion)initWithCoder:(id)a3
{
  id v3 = a3;
  id v16 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"g"];
  BOOL v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"v"];
  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"m"];
  uint64_t v6 = [v3 decodeIntegerForKey:@"s"];
  id v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"e"];
  uint64_t v8 = [v3 decodeInt64ForKey:@"i"];
  id v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  id v12 = objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
  uint64_t v13 = [v3 decodeObjectOfClasses:v12 forKey:@"vi"];

  v14 = [(QLThumbnailVersion *)self initWithModificationDate:v5 fileSize:v6 filenameExtension:v7 versionIdentifier:v13 ino:v8 generatorID:v16 generatorVersion:v4];
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  generatorID = self->_generatorID;
  id v6 = a3;
  [v6 encodeObject:generatorID forKey:@"g"];
  [v6 encodeObject:self->_generatorVersion forKey:@"v"];
  v5 = (void *)[(NSData *)self->_versionIdentifier copy];
  [v6 encodeObject:v5 forKey:@"vi"];

  [v6 encodeObject:self->_modificationDate forKey:@"m"];
  [v6 encodeInteger:self->_fileSize forKey:@"s"];
  [v6 encodeObject:self->_filenameExtension forKey:@"e"];
  [v6 encodeInt64:self->_ino forKey:@"i"];
}

- (QLThumbnailVersion)init
{
  return 0;
}

- (QLThumbnailVersion)initWithFileURL:(id)a3 generatorID:(id)a4 generatorVersion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (initWithFileURL_generatorID_generatorVersion__once != -1) {
    dispatch_once(&initWithFileURL_generatorID_generatorVersion__once, &__block_literal_global_3);
  }
  int v11 = [v8 startAccessingSecurityScopedResource];
  uint64_t v12 = _CFURLPromiseCopyPhysicalURL();
  uint64_t v13 = (void *)v12;
  if (v12) {
    v14 = (void *)v12;
  }
  else {
    v14 = v8;
  }
  id v15 = v14;

  v34[0] = 0;
  id v16 = [v15 resourceValuesForKeys:initWithFileURL_generatorID_generatorVersion__propKeys error:v34];
  id v17 = v34[0];
  memset(&v33, 0, sizeof(v33));
  id v18 = v15;
  if (stat((const char *)[v18 fileSystemRepresentation], &v33))
  {
    id v19 = _log_0();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[QLThumbnailVersion initWithFileURL:generatorID:generatorVersion:]();
    }
  }
  if (v11) {
    [v8 stopAccessingSecurityScopedResource];
  }
  if (v16)
  {
    v20 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F1C530]];
    unint64_t v21 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F1C5F8]];
    id v22 = v9;
    uint64_t v23 = [v21 unsignedIntegerValue];

    uint64_t v24 = [v8 pathExtension];
    uint64_t v25 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F1C600]];
    unint64_t v26 = self;
    id v27 = v17;
    v28 = (void *)v25;
    uint64_t v29 = v23;
    id v9 = v22;
    v30 = [(QLThumbnailVersion *)v26 initWithModificationDate:v20 fileSize:v29 filenameExtension:v24 versionIdentifier:v25 ino:v33.st_ino generatorID:v22 generatorVersion:v10];

    id v17 = v27;
    self = v30;

    v31 = v30;
  }
  else
  {
    v20 = _log_0();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[QLThumbnailVersion initWithFileURL:generatorID:generatorVersion:]();
    }
    v31 = 0;
  }

  return v31;
}

void __67__QLThumbnailVersion_initWithFileURL_generatorID_generatorVersion___block_invoke()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F1C5F8];
  v3[0] = *MEMORY[0x1E4F1C530];
  v3[1] = v0;
  v3[2] = *MEMORY[0x1E4F1C600];
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:3];
  v2 = (void *)initWithFileURL_generatorID_generatorVersion__propKeys;
  initWithFileURL_generatorID_generatorVersion__propKeys = v1;
}

- (QLThumbnailVersion)initWithFileURL:(id)a3 automaticallyGenerated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    id v11 = 0;
    id v12 = 0;
    [(QLThumbnailVersion *)self getGeneratorID:&v12 version:&v11];
    id v7 = v12;
    id v8 = v11;
  }
  else
  {
    id v7 = 0;
    id v8 = 0;
  }
  id v9 = [(QLThumbnailVersion *)self initWithFileURL:v6 generatorID:v7 generatorVersion:v8];

  return v9;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  BOOL v4 = v3;
  generatorID = self->_generatorID;
  if (generatorID) {
    [v3 setObject:generatorID forKeyedSubscript:@"g"];
  }
  generatorVersion = self->_generatorVersion;
  if (generatorVersion) {
    [v4 setObject:generatorVersion forKeyedSubscript:@"gV"];
  }
  modificationDate = self->_modificationDate;
  if (modificationDate) {
    [v4 setObject:modificationDate forKeyedSubscript:@"mD"];
  }
  versionIdentifier = self->_versionIdentifier;
  if (versionIdentifier)
  {
    uint64_t v14 = 0;
    id v9 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:versionIdentifier requiringSecureCoding:1 error:&v14];
    [v4 setObject:v9 forKeyedSubscript:@"vI"];
  }
  if (self->_fileSize)
  {
    id v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    [v4 setObject:v10 forKeyedSubscript:@"s"];
  }
  filenameExtension = self->_filenameExtension;
  if (filenameExtension) {
    [v4 setObject:filenameExtension forKeyedSubscript:@"e"];
  }
  if (self->_ino)
  {
    id v12 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
    [v4 setObject:v12 forKeyedSubscript:@"i"];
  }

  return v4;
}

- (QLThumbnailVersion)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"g"];
  id v6 = [v4 objectForKeyedSubscript:@"gV"];
  id v7 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v8 = objc_opt_class();
  id v9 = [v4 objectForKeyedSubscript:@"vI"];
  id v23 = 0;
  id v10 = [v7 unarchivedObjectOfClass:v8 fromData:v9 error:&v23];
  id v11 = v23;

  if (!v10)
  {
    id v12 = _log_0();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[QLThumbnailVersion initWithDictionaryRepresentation:](v4);
    }
  }
  uint64_t v13 = [v4 objectForKeyedSubscript:@"mD"];
  [v4 objectForKeyedSubscript:@"s"];
  id v22 = v11;
  id v15 = v14 = self;
  uint64_t v16 = [v15 integerValue];

  id v17 = [v4 objectForKeyedSubscript:@"e"];
  id v18 = [v4 objectForKeyedSubscript:@"i"];
  uint64_t v19 = [v18 unsignedLongLongValue];

  v20 = [(QLThumbnailVersion *)v14 initWithModificationDate:v13 fileSize:v16 filenameExtension:v17 versionIdentifier:v10 ino:v19 generatorID:v5 generatorVersion:v6];
  return v20;
}

- (BOOL)shouldBeInvalidatedByThumbnailWithVersion:(id)a3
{
  id v7 = a3;
  uint64_t v8 = [(QLThumbnailVersion *)self versionIdentifier];
  if (v8)
  {
    id v3 = [v7 versionIdentifier];
    if (v3)
    {
      id v4 = [(QLThumbnailVersion *)self versionIdentifier];
      v5 = [v7 versionIdentifier];
      if (([v4 isEqual:v5] & 1) == 0)
      {

        goto LABEL_25;
      }
      int v9 = 1;
    }
    else
    {
      int v9 = 0;
    }
  }
  else
  {
    int v9 = 0;
  }
  id v10 = [(QLThumbnailVersion *)self versionIdentifier];
  id v11 = [v7 versionIdentifier];
  char v12 = (v10 != 0) ^ (v11 != 0);

  if (v9)
  {
  }
  if (v8) {

  }
  if (v12) {
    goto LABEL_25;
  }
  unint64_t v13 = [(QLThumbnailVersion *)self ino];
  if (v13 != [v7 ino]) {
    goto LABEL_25;
  }
  uint64_t v14 = [(QLThumbnailVersion *)self modificationDate];
  if (!v14)
  {
LABEL_21:
    uint64_t v24 = [(QLThumbnailVersion *)self modificationDate];
    uint64_t v25 = [v7 modificationDate];
    BOOL v26 = v25 != 0;

    if ((v24 == 0) == v26) {
      goto LABEL_25;
    }
    unint64_t v27 = [(QLThumbnailVersion *)self fileSize];
    if (v27 != [v7 fileSize]
      && [(QLThumbnailVersion *)self fileSize]
      && [v7 fileSize])
    {
      goto LABEL_25;
    }
    v30 = [(QLThumbnailVersion *)self generatorID];

    if (v30)
    {
      uint64_t v31 = [v7 generatorID];
      if (v31)
      {
        v32 = (void *)v31;
        stat v33 = [(QLThumbnailVersion *)self generatorID];

        if (v33)
        {
          v34 = [(QLThumbnailVersion *)self generatorID];
          v35 = [v7 generatorID];
          int v36 = [v34 isEqual:v35];

          if (v36)
          {
            v37 = [(QLThumbnailVersion *)self generatorVersion];
            v38 = [v7 generatorVersion];
            BOOL v28 = QLCompareVersion(v37, v38) == -1;

            goto LABEL_26;
          }
        }
      }
    }
LABEL_32:
    BOOL v28 = 0;
    goto LABEL_26;
  }
  id v15 = (void *)v14;
  uint64_t v16 = [v7 modificationDate];
  if (!v16)
  {

    goto LABEL_21;
  }
  id v17 = (void *)v16;
  id v18 = [(QLThumbnailVersion *)self modificationDate];
  uint64_t v19 = [v7 modificationDate];
  char v20 = [v18 isEqual:v19];

  if (v20) {
    goto LABEL_21;
  }
  unint64_t v21 = [(QLThumbnailVersion *)self modificationDate];
  id v22 = [v7 modificationDate];
  uint64_t v23 = [v21 compare:v22];

  if (v23 != -1)
  {
    if (v23 == 1) {
      goto LABEL_32;
    }
    goto LABEL_21;
  }
LABEL_25:
  BOOL v28 = 1;
LABEL_26:

  return v28;
}

- (BOOL)isAutomaticallyGenerated
{
  v2 = [(QLThumbnailVersion *)self generatorID];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<QLThumbnailVersion m:%@ s:%lu vi:%@ ino:%llx g:%@-%@>", self->_modificationDate, self->_fileSize, self->_versionIdentifier, self->_ino, self->_generatorID, self->_generatorVersion];
}

- (unint64_t)hash
{
  unint64_t v3 = self->_fileSize ^ [(NSDate *)self->_modificationDate hash];
  NSUInteger v4 = [(NSString *)self->_filenameExtension hash];
  return v3 ^ v4 ^ [(NSData *)self->_versionIdentifier hash];
}

- (void)initWithFileURL:generatorID:generatorVersion:.cold.1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_1();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_1B281E000, v1, OS_LOG_TYPE_ERROR, "No resource properties for %@ (error %@) -> returning nil version", v2, 0x16u);
}

- (void)initWithFileURL:generatorID:generatorVersion:.cold.2()
{
  uint64_t v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_1_1(&dword_1B281E000, v1, v2, "stat on %@ failed: %s", v3, v4, v5, v6, 2u);
}

- (void)initWithDictionaryRepresentation:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 objectForKeyedSubscript:@"vI"];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1B281E000, v2, v3, "could not unarchive version identifier %@: %@", v4, v5, v6, v7, v8);
}

@end