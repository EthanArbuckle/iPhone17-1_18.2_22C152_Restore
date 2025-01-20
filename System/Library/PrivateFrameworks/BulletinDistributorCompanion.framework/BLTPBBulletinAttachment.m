@interface BLTPBBulletinAttachment
- (BOOL)hasIdentifier;
- (BOOL)hasIsUpdated;
- (BOOL)hasType;
- (BOOL)hasURL;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUpdated;
- (BOOL)readFrom:(id)a3;
- (NSString)identifier;
- (NSString)uRL;
- (id)attachmentURLURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)type;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsUpdated:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsUpdated:(BOOL)a3;
- (void)setType:(unsigned int)a3;
- (void)setURL:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BLTPBBulletinAttachment

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasURL
{
  return self->_uRL != 0;
}

- (void)setIsUpdated:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_isUpdated = a3;
}

- (void)setHasIsUpdated:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsUpdated
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BLTPBBulletinAttachment;
  v4 = [(BLTPBBulletinAttachment *)&v8 description];
  v5 = [(BLTPBBulletinAttachment *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithUnsignedInt:self->_type];
    [v4 setObject:v6 forKey:@"type"];
  }
  uRL = self->_uRL;
  if (uRL) {
    [v4 setObject:uRL forKey:@"URL"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    objc_super v8 = [NSNumber numberWithBool:self->_isUpdated];
    [v4 setObject:v8 forKey:@"isUpdated"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBBulletinAttachmentReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_uRL)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 4) = self->_type;
    *((unsigned char *)v4 + 36) |= 1u;
  }
  if (self->_uRL)
  {
    objc_msgSend(v5, "setURL:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((unsigned char *)v4 + 32) = self->_isUpdated;
    *((unsigned char *)v4 + 36) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_type;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_uRL copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v5 + 32) = self->_isUpdated;
    *(unsigned char *)(v5 + 36) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_14;
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_type != *((_DWORD *)v4 + 4)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_14;
  }
  uRL = self->_uRL;
  if ((unint64_t)uRL | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](uRL, "isEqual:")) {
      goto LABEL_14;
    }
    char has = (char)self->_has;
  }
  BOOL v8 = (*((unsigned char *)v4 + 36) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) != 0)
    {
      if (self->_isUpdated)
      {
        if (!*((unsigned char *)v4 + 32)) {
          goto LABEL_14;
        }
      }
      else if (*((unsigned char *)v4 + 32))
      {
        goto LABEL_14;
      }
      BOOL v8 = 1;
      goto LABEL_15;
    }
LABEL_14:
    BOOL v8 = 0;
  }
LABEL_15:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_type;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = [(NSString *)self->_uRL hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_isUpdated;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*((void *)v4 + 1))
  {
    -[BLTPBBulletinAttachment setIdentifier:](self, "setIdentifier:");
    id v4 = v5;
  }
  if (*((unsigned char *)v4 + 36))
  {
    self->_type = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 3))
  {
    -[BLTPBBulletinAttachment setURL:](self, "setURL:");
    id v4 = v5;
  }
  if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    self->_isUpdated = *((unsigned char *)v4 + 32);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (unsigned)type
{
  return self->_type;
}

- (NSString)uRL
{
  return self->_uRL;
}

- (void)setURL:(id)a3
{
}

- (BOOL)isUpdated
{
  return self->_isUpdated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uRL, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (id)attachmentURLURL
{
  NSUInteger v3 = [(BLTPBBulletinAttachment *)self uRL];
  if (v3)
  {
    id v4 = NSURL;
    id v5 = [(BLTPBBulletinAttachment *)self uRL];
    uint64_t v6 = [v4 URLWithString:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

@end