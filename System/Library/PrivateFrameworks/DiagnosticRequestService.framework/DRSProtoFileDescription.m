@interface DRSProtoFileDescription
- (BOOL)hasFileName;
- (BOOL)hasLogSize;
- (BOOL)hasLogType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)fileName;
- (NSString)logType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)logSize;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFileName:(id)a3;
- (void)setHasLogSize:(BOOL)a3;
- (void)setLogSize:(unint64_t)a3;
- (void)setLogType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation DRSProtoFileDescription

- (BOOL)hasLogType
{
  return self->_logType != 0;
}

- (void)setLogSize:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_logSize = a3;
}

- (void)setHasLogSize:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLogSize
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasFileName
{
  return self->_fileName != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)DRSProtoFileDescription;
  v4 = [(DRSProtoFileDescription *)&v8 description];
  v5 = [(DRSProtoFileDescription *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  logType = self->_logType;
  if (logType) {
    [v3 setObject:logType forKey:@"log_type"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithUnsignedLongLong:self->_logSize];
    [v4 setObject:v6 forKey:@"log_size"];
  }
  fileName = self->_fileName;
  if (fileName) {
    [v4 setObject:fileName forKey:@"file_name"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return DRSProtoFileDescriptionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_logType)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
  if (self->_fileName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_logType)
  {
    objc_msgSend(v4, "setLogType:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_logSize;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  if (self->_fileName)
  {
    objc_msgSend(v5, "setFileName:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_logType copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_logSize;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_fileName copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  logType = self->_logType;
  if ((unint64_t)logType | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](logType, "isEqual:")) {
      goto LABEL_11;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_logSize != *((void *)v4 + 1)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  fileName = self->_fileName;
  if ((unint64_t)fileName | *((void *)v4 + 2)) {
    char v7 = -[NSString isEqual:](fileName, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_logType hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v4 = 2654435761u * self->_logSize;
  }
  else {
    unint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(NSString *)self->_fileName hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (unint64_t *)a3;
  uint64_t v5 = v4;
  if (v4[3])
  {
    -[DRSProtoFileDescription setLogType:](self, "setLogType:");
    unint64_t v4 = v5;
  }
  if (v4[4])
  {
    self->_logSize = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (v4[2])
  {
    -[DRSProtoFileDescription setFileName:](self, "setFileName:");
    unint64_t v4 = v5;
  }
}

- (NSString)logType
{
  return self->_logType;
}

- (void)setLogType:(id)a3
{
}

- (unint64_t)logSize
{
  return self->_logSize;
}

- (NSString)fileName
{
  return self->_fileName;
}

- (void)setFileName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logType, 0);

  objc_storeStrong((id *)&self->_fileName, 0);
}

@end