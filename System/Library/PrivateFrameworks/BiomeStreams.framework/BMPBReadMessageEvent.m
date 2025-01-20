@interface BMPBReadMessageEvent
- (BOOL)hasIdsHandle;
- (BOOL)hasMarkedUnread;
- (BOOL)isEqual:(id)a3;
- (BOOL)markedUnread;
- (BOOL)readFrom:(id)a3;
- (NSString)idsHandle;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasMarkedUnread:(BOOL)a3;
- (void)setIdsHandle:(id)a3;
- (void)setMarkedUnread:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBReadMessageEvent

- (BOOL)hasIdsHandle
{
  return self->_idsHandle != 0;
}

- (void)setMarkedUnread:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_markedUnread = a3;
}

- (void)setHasMarkedUnread:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMarkedUnread
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBReadMessageEvent;
  v4 = [(BMPBReadMessageEvent *)&v8 description];
  v5 = [(BMPBReadMessageEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  idsHandle = self->_idsHandle;
  if (idsHandle) {
    [v3 setObject:idsHandle forKey:@"idsHandle"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithBool:self->_markedUnread];
    [v4 setObject:v6 forKey:@"markedUnread"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBReadMessageEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_idsHandle)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_idsHandle)
  {
    id v5 = v4;
    objc_msgSend(v4, "setIdsHandle:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[16] = self->_markedUnread;
    v4[20] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_idsHandle copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 16) = self->_markedUnread;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  idsHandle = self->_idsHandle;
  if ((unint64_t)idsHandle | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](idsHandle, "isEqual:")) {
      goto LABEL_6;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0)
    {
LABEL_6:
      BOOL v6 = 0;
      goto LABEL_7;
    }
    if (self->_markedUnread)
    {
      if (!*((unsigned char *)v4 + 16)) {
        goto LABEL_6;
      }
    }
    else if (*((unsigned char *)v4 + 16))
    {
      goto LABEL_6;
    }
    BOOL v6 = 1;
  }
LABEL_7:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_idsHandle hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_markedUnread;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (BOOL *)a3;
  if (*((void *)v4 + 1))
  {
    uint64_t v5 = v4;
    -[BMPBReadMessageEvent setIdsHandle:](self, "setIdsHandle:");
    uint64_t v4 = v5;
  }
  if (v4[20])
  {
    self->_markedUnread = v4[16];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)idsHandle
{
  return self->_idsHandle;
}

- (void)setIdsHandle:(id)a3
{
}

- (BOOL)markedUnread
{
  return self->_markedUnread;
}

- (void).cxx_destruct
{
}

@end