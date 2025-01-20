@interface BRCDatabaseBackupRecord
- (BOOL)isDirectory;
- (BRCDatabaseBackupRecord)initWithPQLResultSet:(id)a3;
- (BRCDatabaseBackupRecord)initWithRelativePath:(id)a3 fileID:(id)a4 docID:(id)a5 genCount:(unsigned int)a6 isDirectory:(BOOL)a7;
- (NSNumber)docID;
- (NSNumber)fileID;
- (NSString)relativePath;
- (id)description;
- (unsigned)genCount;
- (void)setDocID:(id)a3;
- (void)setFileID:(id)a3;
- (void)setGenCount:(unsigned int)a3;
- (void)setIsDirectory:(BOOL)a3;
- (void)setRelativePath:(id)a3;
@end

@implementation BRCDatabaseBackupRecord

- (BRCDatabaseBackupRecord)initWithRelativePath:(id)a3 fileID:(id)a4 docID:(id)a5 genCount:(unsigned int)a6 isDirectory:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v19.receiver = self;
  v19.super_class = (Class)BRCDatabaseBackupRecord;
  v16 = [(BRCDatabaseBackupRecord *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_relativePath, a3);
    objc_storeStrong((id *)&v17->_fileID, a4);
    objc_storeStrong((id *)&v17->_docID, a5);
    v17->_genCount = a6;
    v17->_isDirectory = a7;
  }

  return v17;
}

- (BRCDatabaseBackupRecord)initWithPQLResultSet:(id)a3
{
  id v4 = a3;
  v5 = [v4 stringAtIndex:0];
  v6 = [v4 numberAtIndex:1];
  v7 = [v4 numberAtIndex:2];
  uint64_t v8 = [v4 unsignedIntAtIndex:3];
  uint64_t v9 = [v4 BOOLAtIndex:4];

  v10 = [(BRCDatabaseBackupRecord *)self initWithRelativePath:v5 fileID:v6 docID:v7 genCount:v8 isDirectory:v9];
  return v10;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)BRCDatabaseBackupRecord;
  v3 = [(BRCDatabaseBackupRecord *)&v7 description];
  id v4 = "d";
  if (!self->_isDirectory) {
    id v4 = "-";
  }
  v5 = [NSString stringWithFormat:@"%@ %s %@ - %@ - %@ - %d", v3, v4, self->_relativePath, self->_fileID, self->_docID, self->_genCount];

  return v5;
}

- (NSString)relativePath
{
  return self->_relativePath;
}

- (void)setRelativePath:(id)a3
{
}

- (NSNumber)fileID
{
  return self->_fileID;
}

- (void)setFileID:(id)a3
{
}

- (NSNumber)docID
{
  return self->_docID;
}

- (void)setDocID:(id)a3
{
}

- (unsigned)genCount
{
  return self->_genCount;
}

- (void)setGenCount:(unsigned int)a3
{
  self->_genCount = a3;
}

- (BOOL)isDirectory
{
  return self->_isDirectory;
}

- (void)setIsDirectory:(BOOL)a3
{
  self->_isDirectory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_docID, 0);
  objc_storeStrong((id *)&self->_fileID, 0);
  objc_storeStrong((id *)&self->_relativePath, 0);
}

@end