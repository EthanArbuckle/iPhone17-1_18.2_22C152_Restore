@interface NMSFTPFile
+ (id)fileWithName:(id)a3;
- (BOOL)isDirectory;
- (BOOL)isEqual:(id)a3;
- (NMSFTPFile)initWithFilename:(id)a3;
- (NSDate)lastAccess;
- (NSDate)modificationDate;
- (NSNumber)fileSize;
- (NSString)filename;
- (NSString)permissions;
- (char)filetypeletter:(unint64_t)a3;
- (id)convertPermissionToSymbolicNotation:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)compare:(id)a3;
- (unint64_t)flags;
- (unint64_t)ownerGroupID;
- (unint64_t)ownerUserID;
- (void)populateValuesFromSFTPAttributes:(_LIBSSH2_SFTP_ATTRIBUTES *)a3;
- (void)setFileSize:(id)a3;
- (void)setFilename:(id)a3;
- (void)setFlags:(unint64_t)a3;
- (void)setIsDirectory:(BOOL)a3;
- (void)setLastAccess:(id)a3;
- (void)setModificationDate:(id)a3;
- (void)setOwnerGroupID:(unint64_t)a3;
- (void)setOwnerUserID:(unint64_t)a3;
- (void)setPermissions:(id)a3;
@end

@implementation NMSFTPFile

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_permissions, 0);
  objc_storeStrong((id *)&self->_fileSize, 0);
  objc_storeStrong((id *)&self->_lastAccess, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_filename, 0);
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setPermissions:(id)a3
{
}

- (NSString)permissions
{
  return self->_permissions;
}

- (void)setOwnerGroupID:(unint64_t)a3
{
  self->_ownerGroupID = a3;
}

- (unint64_t)ownerGroupID
{
  return self->_ownerGroupID;
}

- (void)setOwnerUserID:(unint64_t)a3
{
  self->_ownerUserID = a3;
}

- (unint64_t)ownerUserID
{
  return self->_ownerUserID;
}

- (void)setFileSize:(id)a3
{
}

- (NSNumber)fileSize
{
  return self->_fileSize;
}

- (void)setLastAccess:(id)a3
{
}

- (NSDate)lastAccess
{
  return self->_lastAccess;
}

- (void)setModificationDate:(id)a3
{
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void)setIsDirectory:(BOOL)a3
{
  self->_isDirectory = a3;
}

- (BOOL)isDirectory
{
  return self->_isDirectory;
}

- (void)setFilename:(id)a3
{
}

- (NSString)filename
{
  return self->_filename;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    v6 = [(NMSFTPFile *)self filename];
    v7 = (void *)[v6 copyWithZone:a3];
    [v5 setFilename:v7];

    v8 = [(NMSFTPFile *)self modificationDate];
    v9 = (void *)[v8 copyWithZone:a3];
    [v5 setModificationDate:v9];

    v10 = [(NMSFTPFile *)self lastAccess];
    v11 = (void *)[v10 copyWithZone:a3];
    [v5 setLastAccess:v11];

    v12 = [(NMSFTPFile *)self fileSize];
    v13 = (void *)[v12 copyWithZone:a3];
    [v5 setFileSize:v13];

    v14 = [(NMSFTPFile *)self permissions];
    v15 = (void *)[v14 copyWithZone:a3];
    [v5 setPermissions:v15];

    objc_msgSend(v5, "setIsDirectory:", -[NMSFTPFile isDirectory](self, "isDirectory"));
    objc_msgSend(v5, "setOwnerUserID:", -[NMSFTPFile ownerUserID](self, "ownerUserID"));
    objc_msgSend(v5, "setOwnerGroupID:", -[NMSFTPFile ownerGroupID](self, "ownerGroupID"));
    objc_msgSend(v5, "setFlags:", -[NMSFTPFile flags](self, "flags"));
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(NMSFTPFile *)self filename];
  v7 = [v3 stringWithFormat:@"<%@: %p> Filename: %@", v5, self, v6];

  return v7;
}

- (char)filetypeletter:(unint64_t)a3
{
  unint64_t v3 = ((unsigned __int16)a3 & 0xF000) - 4096;
  if (v3 >> 14 > 2) {
    return 63;
  }
  else {
    return aPcDBLS[v3 >> 12];
  }
}

- (id)convertPermissionToSymbolicNotation:(unint64_t)a3
{
  __int16 v3 = a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  v9[0] = -[NMSFTPFile filetypeletter:](self, "filetypeletter:");
  __strcpy_chk();
  __strcpy_chk();
  __strcpy_chk();
  if ((v3 & 0x800) == 0)
  {
    if ((v3 & 0x400) == 0) {
      goto LABEL_3;
    }
LABEL_15:
    if ((v3 & 8) != 0) {
      char v8 = 115;
    }
    else {
      char v8 = 108;
    }
    v9[6] = v8;
    if ((v3 & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_4;
  }
  if ((v3 & 0x40) != 0) {
    char v7 = 115;
  }
  else {
    char v7 = 83;
  }
  v9[3] = v7;
  if ((v3 & 0x400) != 0) {
    goto LABEL_15;
  }
LABEL_3:
  if ((v3 & 0x200) != 0)
  {
LABEL_4:
    if ((v3 & 0x40) != 0) {
      char v4 = 116;
    }
    else {
      char v4 = 84;
    }
    v9[9] = v4;
  }
LABEL_8:
  v9[10] = 0;
  v5 = [NSString stringWithCString:v9 encoding:4];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(NMSFTPFile *)self filename];
    v6 = [v4 filename];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  v5 = [(NMSFTPFile *)self filename];
  v6 = [v4 filename];

  int64_t v7 = [v5 localizedCaseInsensitiveCompare:v6];
  return v7;
}

- (void)populateValuesFromSFTPAttributes:(_LIBSSH2_SFTP_ATTRIBUTES *)a3
{
  v5 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)a3->var6];
  [(NMSFTPFile *)self setModificationDate:v5];

  v6 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:(double)a3->var5];
  [(NMSFTPFile *)self setLastAccess:v6];

  int64_t v7 = [NSNumber numberWithUnsignedLongLong:a3->var1];
  [(NMSFTPFile *)self setFileSize:v7];

  [(NMSFTPFile *)self setOwnerUserID:a3->var2];
  [(NMSFTPFile *)self setOwnerGroupID:a3->var3];
  char v8 = [(NMSFTPFile *)self convertPermissionToSymbolicNotation:a3->var4];
  [(NMSFTPFile *)self setPermissions:v8];

  [(NMSFTPFile *)self setIsDirectory:(a3->var4 & 0xF000) == 0x4000];
  unint64_t var0 = a3->var0;
  [(NMSFTPFile *)self setFlags:var0];
}

- (NMSFTPFile)initWithFilename:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NMSFTPFile;
  v5 = [(NMSFTPFile *)&v8 init];
  v6 = v5;
  if (v5) {
    [(NMSFTPFile *)v5 setFilename:v4];
  }

  return v6;
}

+ (id)fileWithName:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithFilename:v4];

  return v5;
}

@end