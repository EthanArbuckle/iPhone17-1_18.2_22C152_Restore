@interface QLCacheBasicFileIdentifier
+ (BOOL)supportsSecureCoding;
+ (Class)versionedFileIdentifierClass;
- (BOOL)isEqual:(id)a3;
- (QLCacheBasicFileIdentifier)initWithCoder:(id)a3;
- (QLCacheBasicFileIdentifier)initWithFileId:(unint64_t)a3 fsid:(fsid)a4;
- (QLCacheBasicFileIdentifier)initWithFileURL:(id)a3 error:(id *)p_isa;
- (fsid)fsid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)fileId;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation QLCacheBasicFileIdentifier

- (QLCacheBasicFileIdentifier)initWithFileId:(unint64_t)a3 fsid:(fsid)a4
{
  v7.receiver = self;
  v7.super_class = (Class)QLCacheBasicFileIdentifier;
  result = [(QLCacheBasicFileIdentifier *)&v7 init];
  if (result)
  {
    result->_fileId = a3;
    result->_fsid = a4;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  unint64_t fileId = self->_fileId;
  fsid fsid = self->_fsid;

  return (id)[v4 initWithFileId:fileId fsid:fsid];
}

- (QLCacheBasicFileIdentifier)initWithFileURL:(id)a3 error:(id *)p_isa
{
  v15[1] = *MEMORY[0x1E4F143B8];
  memset(&v13, 0, sizeof(v13));
  id v6 = a3;
  if (!stat((const char *)[v6 fileSystemRepresentation], &v13))
  {
    self = [(QLCacheBasicFileIdentifier *)self initWithFileId:v13.st_ino fsid:v13.st_dev];
    p_isa = (id *)&self->super.super.isa;
    goto LABEL_8;
  }
  uint64_t v7 = *__error();
  v8 = qword_1EB5E7D70;
  if (!qword_1EB5E7D70)
  {
    QLTInitLogging();
    v8 = qword_1EB5E7D70;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    -[QLCacheBasicFileIdentifier initWithFileURL:error:](v8, (uint64_t)self, v7);
    if (!p_isa) {
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (p_isa)
  {
LABEL_6:
    v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F28798];
    uint64_t v14 = *MEMORY[0x1E4F289D0];
    v15[0] = v6;
    v11 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1, *(void *)&v13.st_dev);
    *p_isa = [v9 errorWithDomain:v10 code:v7 userInfo:v11];

    p_isa = 0;
  }
LABEL_8:

  return (QLCacheBasicFileIdentifier *)p_isa;
}

+ (Class)versionedFileIdentifierClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t fileId = self->_fileId;
    BOOL v6 = fileId == [v4 fileId];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return self->_fileId;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (QLCacheBasicFileIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 decodeInt32ForKey:@"fsid_1"];
  uint64_t v6 = [v4 decodeInt32ForKey:@"fsid_2"];
  uint64_t v7 = [v4 decodeInt64ForKey:@"i"];

  return [(QLCacheBasicFileIdentifier *)self initWithFileId:v7 fsid:v5 | (unint64_t)(v6 << 32)];
}

- (void)encodeWithCoder:(id)a3
{
  v3 = (unsigned int *)self;
  unint64_t fileId = self->_fileId;
  id v5 = a3;
  [v5 encodeInt64:fileId forKey:@"i"];
  v3 += 4;
  [v5 encodeInt32:*v3 forKey:@"fsid_1"];
  [v5 encodeInt32:v3[1] forKey:@"fsid_2"];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p ino:%llu>", objc_opt_class(), self, self->_fileId];
}

- (unint64_t)fileId
{
  return self->_fileId;
}

- (fsid)fsid
{
  objc_copyStruct(&dest, &self->_fsid, 8, 1, 0);
  return dest;
}

- (void)initWithFileURL:(int)a3 error:.cold.1(void *a1, uint64_t a2, int a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a1;
  int v5 = 138412802;
  uint64_t v6 = objc_opt_class();
  __int16 v7 = 1024;
  int v8 = a3;
  __int16 v9 = 2080;
  uint64_t v10 = strerror(a3);
  _os_log_error_impl(&dword_1B281E000, v4, OS_LOG_TYPE_ERROR, "could not init %@: error %d (%s)", (uint8_t *)&v5, 0x1Cu);
}

@end