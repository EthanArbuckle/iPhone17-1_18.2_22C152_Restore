@interface BRCDesiredVersion
+ (BOOL)supportsSecureCoding;
+ (id)newFromSqliteStatement:(sqlite3_stmt *)a3 atIndex:(int)a4;
+ (id)newFromSqliteValue:(sqlite3_value *)a3;
- (BOOL)isFault;
- (BOOL)isStillValidForEtag:(id)a3;
- (BOOL)userInitiated;
- (BOOL)wantsContent;
- (BOOL)wantsContentForThumbnail;
- (BOOL)wantsThumbnail;
- (BRCDesiredVersion)initWithCoder:(id)a3;
- (BRCDesiredVersion)initWithDesiredVersion:(id)a3;
- (BRCDesiredVersion)initWithServerVersion:(id)a3 serverName:(id)a4;
- (NSError)downloadError;
- (NSString)serverName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithContext:(id)a3;
- (unsigned)options;
- (void)encodeWithCoder:(id)a3;
- (void)markLiveAsFault;
- (void)setDownloadError:(id)a3;
- (void)setOptions:(unsigned int)a3;
- (void)sqliteBind:(sqlite3_stmt *)a3 index:(int)a4;
- (void)wantsContentForThumbnail;
@end

@implementation BRCDesiredVersion

- (BOOL)isFault
{
  return self->_flags.value & 1;
}

- (BOOL)wantsContent
{
  return (LOBYTE(self->_flags.value) >> 1) & 1;
}

- (BOOL)wantsThumbnail
{
  return (LOBYTE(self->_flags.value) >> 2) & 1;
}

- (BOOL)userInitiated
{
  return (LOBYTE(self->_flags.value) >> 3) & 1;
}

- (BOOL)wantsContentForThumbnail
{
  if ((self->_flags.value & 0x10) != 0 && ![(BRCDesiredVersion *)self wantsContent])
  {
    v4 = brc_bread_crumbs();
    v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[BRCDesiredVersion wantsContentForThumbnail]();
    }
  }
  return (LOBYTE(self->_flags.value) >> 4) & 1;
}

- (unsigned)options
{
  return self->_flags.value & 0x1F;
}

- (void)setOptions:(unsigned int)a3
{
  char value = self->_flags.value & 0xE0 | a3 & 0x1F;
  LOBYTE(self->_flags.value) = value;
  if ((a3 & 0x12) == 0x10)
  {
    v7 = brc_bread_crumbs();
    v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[BRCDesiredVersion setOptions:]();
    }

    char value = self->_flags.value;
  }
  if ((value & 3) == 0)
  {
    v4 = brc_bread_crumbs();
    v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[BRCDesiredVersion setOptions:]();
    }
  }
}

- (void)markLiveAsFault
{
  if (![(BRCDesiredVersion *)self isFault])
  {
    v3 = brc_bread_crumbs();
    v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath logicalName]();
    }
  }
  if ([(BRCDesiredVersion *)self isFault])
  {
    if ([(BRCDesiredVersion *)self wantsContent]) {
      [(BRCDesiredVersion *)self setOptions:[(BRCDesiredVersion *)self options] & 0xFFFFFFFELL];
    }
  }
}

- (BRCDesiredVersion)initWithDesiredVersion:(id)a3
{
  id v4 = a3;
  v5 = [(BRCVersion *)self initWithVersion:v4];
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_downloadError, *((id *)v4 + 16));
    objc_storeStrong((id *)&v6->_serverName, *((id *)v4 + 17));
    v6->_flags.char value = *((_DWORD *)v4 + 30);
  }

  return v6;
}

- (BRCDesiredVersion)initWithServerVersion:(id)a3 serverName:(id)a4
{
  id v7 = a4;
  v8 = [(BRCVersion *)self initWithVersion:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_serverName, a4);
  }

  return v9;
}

- (id)descriptionWithContext:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  if ([(BRCDesiredVersion *)self isFault])
  {
    v6 = +[BRCDumpContext highlightedString:@"fault " type:1 context:v4];
    [v5 appendString:v6];
  }
  if ([(BRCDesiredVersion *)self wantsContent])
  {
    id v7 = +[BRCDumpContext highlightedString:@"contents " type:1 context:v4];
    [v5 appendString:v7];
  }
  if ([(BRCDesiredVersion *)self wantsContentForThumbnail])
  {
    v8 = +[BRCDumpContext highlightedString:@"for-thumb " type:1 context:v4];
    [v5 appendString:v8];
  }
  if ([(BRCDesiredVersion *)self wantsThumbnail])
  {
    v9 = +[BRCDumpContext highlightedString:@"thumbnail " type:1 context:v4];
    [v5 appendString:v9];
  }
  if ([(BRCDesiredVersion *)self userInitiated])
  {
    v10 = +[BRCDumpContext highlightedString:@"user-qos " type:1 context:v4];
    [v5 appendString:v10];
  }
  v15.receiver = self;
  v15.super_class = (Class)BRCDesiredVersion;
  v11 = [(BRCVersion *)&v15 descriptionWithContext:v4];
  [v5 appendString:v11];

  downloadError = self->_downloadError;
  if (downloadError)
  {
    v13 = +[BRCDumpContext stringFromError:downloadError context:v4];
    [v5 appendFormat:@" error:%@", v13];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BRCDesiredVersion)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BRCDesiredVersion;
  id v5 = [(BRCVersion *)&v12 initWithCoder:v4];
  if (v5)
  {
    if (_allowedClassesForErrors_once_0 != -1) {
      dispatch_once(&_allowedClassesForErrors_once_0, &__block_literal_global_56);
    }
    id v6 = (id)_allowedClassesForErrors_allowedClasses_0;
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"downError"];
    downloadError = v5->_downloadError;
    v5->_downloadError = (NSError *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serverName"];
    serverName = v5->_serverName;
    v5->_serverName = (NSString *)v9;

    v5->_flags.char value = [v4 decodeInt32ForKey:@"flags"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  downloadError = self->_downloadError;
  id v5 = a3;
  [v5 encodeObject:downloadError forKey:@"downError"];
  [v5 encodeObject:self->_serverName forKey:@"serverName"];
  [v5 encodeInt32:self->_flags.value forKey:@"flags"];
  v6.receiver = self;
  v6.super_class = (Class)BRCDesiredVersion;
  [(BRCVersion *)&v6 encodeWithCoder:v5];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v4 initWithDesiredVersion:self];
}

- (void)sqliteBind:(sqlite3_stmt *)a3 index:(int)a4
{
  id v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
  sqlite3_bind_blob(a3, a4, (const void *)[v6 bytes], objc_msgSend(v6, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

+ (id)newFromSqliteValue:(sqlite3_value *)a3
{
  if (sqlite3_value_type(a3) == 4)
  {
    id v4 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v5 = objc_opt_class();
    id v6 = (void *)MEMORY[0x1E4F1C9B8];
    uint64_t v7 = sqlite3_value_blob(a3);
    v8 = [v6 dataWithBytes:v7 length:sqlite3_value_bytes(a3)];
    uint64_t v9 = [v4 unarchivedObjectOfClass:v5 fromData:v8 error:0];
  }
  else
  {
    if (sqlite3_value_type(a3) != 5)
    {
      v11 = brc_bread_crumbs();
      objc_super v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        +[CKRecordID(BRCItemAdditions) newFromSqliteValue:]();
      }
    }
    return 0;
  }
  return v9;
}

+ (id)newFromSqliteStatement:(sqlite3_stmt *)a3 atIndex:(int)a4
{
  if (sqlite3_column_type(a3, a4) == 4)
  {
    id v6 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v7 = objc_opt_class();
    v8 = (void *)MEMORY[0x1E4F1C9B8];
    uint64_t v9 = sqlite3_column_blob(a3, a4);
    v10 = objc_msgSend(v8, "dataWithBytes:length:", v9, sqlite3_column_bytes(a3, a4));
    v11 = [v6 unarchivedObjectOfClass:v7 fromData:v10 error:0];
  }
  else
  {
    if (sqlite3_column_type(a3, a4) != 5)
    {
      v13 = brc_bread_crumbs();
      v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        +[CKRecordID(BRCItemAdditions) newFromSqliteStatement:atIndex:]();
      }
    }
    return 0;
  }
  return v11;
}

- (BOOL)isStillValidForEtag:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BRCDesiredVersion *)self downloadError];

  if (v5)
  {
    char v6 = 0;
  }
  else
  {
    uint64_t v7 = [(BRCVersion *)self ckInfo];
    v8 = [v7 etag];
    char v6 = [v8 isEqualToString:v4];
  }
  return v6;
}

- (NSError)downloadError
{
  return self->_downloadError;
}

- (void)setDownloadError:(id)a3
{
}

- (NSString)serverName
{
  return self->_serverName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverName, 0);
  objc_storeStrong((id *)&self->_downloadError, 0);
}

- (void)wantsContentForThumbnail
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: self.wantsContent%@", v2, v3, v4, v5, v6);
}

- (void)setOptions:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _flags.isFault || _flags.startDownload%@", v2, v3, v4, v5, v6);
}

- (void)setOptions:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _flags.startDownload%@", v2, v3, v4, v5, v6);
}

@end