@interface SYFileTransferInfo
- (BOOL)hasEndAnchor;
- (BOOL)hasStartAnchor;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)endAnchor;
- (NSString)startAnchor;
- (SYMessageHeader)header;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)decompressedFileSize;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDecompressedFileSize:(unint64_t)a3;
- (void)setEndAnchor:(id)a3;
- (void)setHeader:(id)a3;
- (void)setStartAnchor:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SYFileTransferInfo

- (BOOL)hasStartAnchor
{
  return self->_startAnchor != 0;
}

- (BOOL)hasEndAnchor
{
  return self->_endAnchor != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SYFileTransferInfo;
  v4 = [(SYFileTransferInfo *)&v8 description];
  v5 = [(SYFileTransferInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  header = self->_header;
  if (header)
  {
    v5 = [(SYMessageHeader *)header dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"header"];
  }
  startAnchor = self->_startAnchor;
  if (startAnchor) {
    [v3 setObject:startAnchor forKey:@"startAnchor"];
  }
  endAnchor = self->_endAnchor;
  if (endAnchor) {
    [v3 setObject:endAnchor forKey:@"endAnchor"];
  }
  objc_super v8 = [NSNumber numberWithUnsignedLongLong:self->_decompressedFileSize];
  [v3 setObject:v8 forKey:@"decompressedFileSize"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SYFileTransferInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_header) {
    -[SYFileTransferInfo writeTo:]();
  }
  id v5 = v4;
  PBDataWriterWriteSubmessage();
  if (self->_startAnchor) {
    PBDataWriterWriteStringField();
  }
  if (self->_endAnchor) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [v4 setHeader:self->_header];
  if (self->_startAnchor) {
    objc_msgSend(v4, "setStartAnchor:");
  }
  if (self->_endAnchor) {
    objc_msgSend(v4, "setEndAnchor:");
  }
  v4[1] = self->_decompressedFileSize;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SYMessageHeader *)self->_header copyWithZone:a3];
  v7 = (void *)v5[3];
  v5[3] = v6;

  uint64_t v8 = [(NSString *)self->_startAnchor copyWithZone:a3];
  v9 = (void *)v5[4];
  v5[4] = v8;

  uint64_t v10 = [(NSString *)self->_endAnchor copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  v5[1] = self->_decompressedFileSize;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v8 = [v4 isMemberOfClass:objc_opt_class()]
    && ((header = self->_header, !((unint64_t)header | v4[3])) || -[SYMessageHeader isEqual:](header, "isEqual:"))
    && ((startAnchor = self->_startAnchor, !((unint64_t)startAnchor | v4[4]))
     || -[NSString isEqual:](startAnchor, "isEqual:"))
    && ((endAnchor = self->_endAnchor, !((unint64_t)endAnchor | v4[2]))
     || -[NSString isEqual:](endAnchor, "isEqual:"))
    && self->_decompressedFileSize == v4[1];

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SYMessageHeader *)self->_header hash];
  NSUInteger v4 = [(NSString *)self->_startAnchor hash] ^ v3;
  return v4 ^ [(NSString *)self->_endAnchor hash] ^ (2654435761u * self->_decompressedFileSize);
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (unint64_t *)a3;
  header = self->_header;
  unint64_t v6 = v4[3];
  v7 = v4;
  if (header)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[SYMessageHeader mergeFrom:](header, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[SYFileTransferInfo setHeader:](self, "setHeader:");
  }
  NSUInteger v4 = v7;
LABEL_7:
  if (v4[4])
  {
    -[SYFileTransferInfo setStartAnchor:](self, "setStartAnchor:");
    NSUInteger v4 = v7;
  }
  if (v4[2])
  {
    -[SYFileTransferInfo setEndAnchor:](self, "setEndAnchor:");
    NSUInteger v4 = v7;
  }
  self->_decompressedFileSize = v4[1];
  MEMORY[0x270F9A758]();
}

- (SYMessageHeader)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
}

- (NSString)startAnchor
{
  return self->_startAnchor;
}

- (void)setStartAnchor:(id)a3
{
}

- (NSString)endAnchor
{
  return self->_endAnchor;
}

- (void)setEndAnchor:(id)a3
{
}

- (unint64_t)decompressedFileSize
{
  return self->_decompressedFileSize;
}

- (void)setDecompressedFileSize:(unint64_t)a3
{
  self->_decompressedFileSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startAnchor, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_endAnchor, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SYFileTransferInfo writeTo:]", "SYFileTransferInfo.m", 123, "self->_header != nil");
}

@end