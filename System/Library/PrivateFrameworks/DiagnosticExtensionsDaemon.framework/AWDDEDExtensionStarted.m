@interface AWDDEDExtensionStarted
- (BOOL)hasExtension;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)extension;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setExtension:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDDEDExtensionStarted

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasExtension
{
  return self->_extension != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AWDDEDExtensionStarted;
  v4 = [(AWDDEDExtensionStarted *)&v8 description];
  v5 = [(AWDDEDExtensionStarted *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v4 forKey:@"timestamp"];
  }
  extension = self->_extension;
  if (extension) {
    [v3 setObject:extension forKey:@"extension"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDDEDExtensionStartedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
  if (self->_extension)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_timestamp;
    *((unsigned char *)v4 + 24) |= 1u;
  }
  if (self->_extension)
  {
    id v5 = v4;
    objc_msgSend(v4, "setExtension:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_extension copyWithZone:a3];
  objc_super v8 = (void *)v6[2];
  v6[2] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  extension = self->_extension;
  if ((unint64_t)extension | *((void *)v4 + 2)) {
    char v6 = -[NSString isEqual:](extension, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v2 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v2 = 0;
  }
  return [(NSString *)self->_extension hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (v4[3])
  {
    self->_timestamp = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (v4[2])
  {
    uint64_t v5 = v4;
    -[AWDDEDExtensionStarted setExtension:](self, "setExtension:");
    id v4 = v5;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
}

- (void).cxx_destruct
{
}

@end