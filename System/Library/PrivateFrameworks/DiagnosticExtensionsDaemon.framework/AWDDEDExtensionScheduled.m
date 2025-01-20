@interface AWDDEDExtensionScheduled
- (BOOL)hasDelay;
- (BOOL)hasExtension;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)extension;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)delay;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDelay:(unint64_t)a3;
- (void)setExtension:(id)a3;
- (void)setHasDelay:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDDEDExtensionScheduled

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasExtension
{
  return self->_extension != 0;
}

- (void)setDelay:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_delay = a3;
}

- (void)setHasDelay:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDelay
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AWDDEDExtensionScheduled;
  v4 = [(AWDDEDExtensionScheduled *)&v8 description];
  v5 = [(AWDDEDExtensionScheduled *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v4 forKey:@"timestamp"];
  }
  extension = self->_extension;
  if (extension) {
    [v3 setObject:extension forKey:@"extension"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithUnsignedLongLong:self->_delay];
    [v3 setObject:v6 forKey:@"delay"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDDEDExtensionScheduledReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
  if (self->_extension)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[2] = self->_timestamp;
    *((unsigned char *)v4 + 32) |= 2u;
  }
  if (self->_extension)
  {
    id v5 = v4;
    objc_msgSend(v4, "setExtension:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_delay;
    *((unsigned char *)v4 + 32) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_timestamp;
    *(unsigned char *)(v5 + 32) |= 2u;
  }
  uint64_t v7 = [(NSString *)self->_extension copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v7;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v6 + 8) = self->_delay;
    *(unsigned char *)(v6 + 32) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_timestamp != *((void *)v4 + 2)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    goto LABEL_14;
  }
  extension = self->_extension;
  if ((unint64_t)extension | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](extension, "isEqual:"))
    {
LABEL_14:
      BOOL v7 = 0;
      goto LABEL_15;
    }
    char has = (char)self->_has;
  }
  BOOL v7 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_delay != *((void *)v4 + 1)) {
      goto LABEL_14;
    }
    BOOL v7 = 1;
  }
LABEL_15:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_extension hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v5 = 2654435761u * self->_delay;
  }
  else {
    unint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if ((v4[4] & 2) != 0)
  {
    self->_timestamp = v4[2];
    *(unsigned char *)&self->_has |= 2u;
  }
  if (v4[3])
  {
    unint64_t v5 = v4;
    -[AWDDEDExtensionScheduled setExtension:](self, "setExtension:");
    NSUInteger v4 = v5;
  }
  if (v4[4])
  {
    self->_delay = v4[1];
    *(unsigned char *)&self->_has |= 1u;
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

- (unint64_t)delay
{
  return self->_delay;
}

- (void).cxx_destruct
{
}

@end