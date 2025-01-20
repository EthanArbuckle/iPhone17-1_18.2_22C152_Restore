@interface ABCPbSummaryAttachmentRequest
- (BOOL)hasFileName;
- (BOOL)hasFileSize;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)fileName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)fileSize;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFileName:(id)a3;
- (void)setFileSize:(unsigned int)a3;
- (void)setHasFileSize:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ABCPbSummaryAttachmentRequest

- (BOOL)hasFileName
{
  return self->_fileName != 0;
}

- (void)setFileSize:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_fileSize = a3;
}

- (void)setHasFileSize:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFileSize
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ABCPbSummaryAttachmentRequest;
  v4 = [(ABCPbSummaryAttachmentRequest *)&v8 description];
  v5 = [(ABCPbSummaryAttachmentRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  fileName = self->_fileName;
  if (fileName) {
    [v3 setObject:fileName forKey:@"file_name"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithUnsignedInt:self->_fileSize];
    [v4 setObject:v6 forKey:@"file_size"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ABCPbSummaryAttachmentRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_fileName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_fileName)
  {
    id v5 = v4;
    objc_msgSend(v4, "setFileName:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 4) = self->_fileSize;
    *((unsigned char *)v4 + 20) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_fileName copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_fileSize;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  fileName = self->_fileName;
  if ((unint64_t)fileName | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](fileName, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) != 0 && self->_fileSize == *((_DWORD *)v4 + 4))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_fileName hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_fileSize;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (unsigned int *)a3;
  if (*((void *)v4 + 1))
  {
    uint64_t v5 = v4;
    -[ABCPbSummaryAttachmentRequest setFileName:](self, "setFileName:");
    uint64_t v4 = v5;
  }
  if (v4[5])
  {
    self->_fileSize = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)fileName
{
  return self->_fileName;
}

- (void)setFileName:(id)a3
{
}

- (unsigned)fileSize
{
  return self->_fileSize;
}

- (void).cxx_destruct
{
}

@end