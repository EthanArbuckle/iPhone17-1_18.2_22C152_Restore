@interface VCPBackupFileHeader
+ (id)headerForTask:(unint64_t)a3;
+ (id)headerFromStream:(id)a3;
- (NSData)data;
- (VCPBackupFileHeader)initWithIdentifier:(unsigned int)a3 andVersion:(unsigned int)a4;
- (int)writeToStream:(id)a3;
- (unsigned)identifier;
- (unsigned)version;
@end

@implementation VCPBackupFileHeader

- (VCPBackupFileHeader)initWithIdentifier:(unsigned int)a3 andVersion:(unsigned int)a4
{
  v7.receiver = self;
  v7.super_class = (Class)VCPBackupFileHeader;
  result = [(VCPBackupFileHeader *)&v7 init];
  if (result)
  {
    result->_identifier = a3;
    result->_version = a4;
  }
  return result;
}

+ (id)headerForTask:(unint64_t)a3
{
  unint64_t v4 = a3 - 1;
  if (a3 - 1 <= 9 && ((0x207u >> v4) & 1) != 0)
  {
    id v5 = [objc_alloc((Class)objc_opt_class()) initWithIdentifier:*(unsigned int *)*(&off_10021C7F8 + v4) andVersion:*(unsigned int *)*(&off_10021C848 + v4)];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (NSData)data
{
  int8x8_t v4 = vrev32_s8(*(int8x8_t *)&self->_identifier);
  v2 = +[NSData dataWithBytes:&v4 length:8];
  return (NSData *)v2;
}

+ (id)headerFromStream:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  if (objc_msgSend(v3, "vcp_readUint32:", (char *)&v7 + 4)
    || objc_msgSend(v3, "vcp_readUint32:", &v7))
  {
    id v4 = 0;
  }
  else
  {
    id v6 = objc_alloc((Class)objc_opt_class());
    id v4 = [v6 initWithIdentifier:HIDWORD(v7) andVersion:v7];
  }

  return v4;
}

- (int)writeToStream:(id)a3
{
  id v4 = a3;
  int v5 = objc_msgSend(v4, "vcp_writeUint32:", self->_identifier);
  if (!v5) {
    int v5 = objc_msgSend(v4, "vcp_writeUint32:", self->_version);
  }

  return v5;
}

- (unsigned)identifier
{
  return self->_identifier;
}

- (unsigned)version
{
  return self->_version;
}

@end