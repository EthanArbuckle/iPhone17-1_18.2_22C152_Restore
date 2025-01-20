@interface VCPBackupEntryHeader
+ (id)header;
- (BOOL)isCompressed;
- (int)readFromStream:(id)a3;
- (int)writeToStream:(id)a3;
- (unsigned)dataLength;
- (void)setDataLength:(unsigned int)a3;
- (void)setIsCompressed:(BOOL)a3;
@end

@implementation VCPBackupEntryHeader

+ (id)header
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

- (int)readFromStream:(id)a3
{
  int v6 = 0;
  int result = objc_msgSend(a3, "vcp_readUint32:", &v6);
  if (!result)
  {
    char v5 = HIBYTE(v6);
    self->_dataLength = v6 & 0xFFFFFF;
    self->_isCompressed = v5 & 1;
  }
  return result;
}

- (int)writeToStream:(id)a3
{
  id v4 = a3;
  char v5 = v4;
  unsigned int dataLength = self->_dataLength;
  if (dataLength <= 0x200000) {
    int v7 = objc_msgSend(v4, "vcp_writeUint32:", dataLength | (self->_isCompressed << 24));
  }
  else {
    int v7 = -50;
  }

  return v7;
}

- (unsigned)dataLength
{
  return self->_dataLength;
}

- (void)setDataLength:(unsigned int)a3
{
  self->_unsigned int dataLength = a3;
}

- (BOOL)isCompressed
{
  return self->_isCompressed;
}

- (void)setIsCompressed:(BOOL)a3
{
  self->_isCompressed = a3;
}

@end