@interface BMPBSocialHighlightContact
- (BOOL)hasHandle;
- (BOOL)hasIsMe;
- (BOOL)hasIsSignificant;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMe;
- (BOOL)isSignificant;
- (BOOL)readFrom:(id)a3;
- (NSString)handle;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHandle:(id)a3;
- (void)setHasIsMe:(BOOL)a3;
- (void)setHasIsSignificant:(BOOL)a3;
- (void)setIsMe:(BOOL)a3;
- (void)setIsSignificant:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBSocialHighlightContact

- (void)setIsSignificant:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_isSignificant = a3;
}

- (void)setHasIsSignificant:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsSignificant
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasHandle
{
  return self->_handle != 0;
}

- (void)setIsMe:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isMe = a3;
}

- (void)setHasIsMe:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsMe
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBSocialHighlightContact;
  v4 = [(BMPBSocialHighlightContact *)&v8 description];
  v5 = [(BMPBSocialHighlightContact *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4 = [NSNumber numberWithBool:self->_isSignificant];
    [v3 setObject:v4 forKey:@"isSignificant"];
  }
  handle = self->_handle;
  if (handle) {
    [v3 setObject:handle forKey:@"handle"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithBool:self->_isMe];
    [v3 setObject:v6 forKey:@"isMe"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBSocialHighlightContactReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_handle)
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
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[17] = self->_isSignificant;
    v4[20] |= 2u;
  }
  if (self->_handle)
  {
    id v5 = v4;
    objc_msgSend(v4, "setHandle:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[16] = self->_isMe;
    v4[20] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v5 + 17) = self->_isSignificant;
    *(unsigned char *)(v5 + 20) |= 2u;
  }
  uint64_t v7 = [(NSString *)self->_handle copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v7;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v6 + 16) = self->_isMe;
    *(unsigned char *)(v6 + 20) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 2) == 0) {
      goto LABEL_15;
    }
    if (self->_isSignificant)
    {
      if (!*((unsigned char *)v4 + 17)) {
        goto LABEL_15;
      }
    }
    else if (*((unsigned char *)v4 + 17))
    {
      goto LABEL_15;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 2) != 0)
  {
    goto LABEL_15;
  }
  handle = self->_handle;
  if ((unint64_t)handle | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](handle, "isEqual:")) {
      goto LABEL_15;
    }
    char has = (char)self->_has;
  }
  BOOL v7 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (has)
  {
    if (*((unsigned char *)v4 + 20))
    {
      if (self->_isMe)
      {
        if (!*((unsigned char *)v4 + 16)) {
          goto LABEL_15;
        }
      }
      else if (*((unsigned char *)v4 + 16))
      {
        goto LABEL_15;
      }
      BOOL v7 = 1;
      goto LABEL_16;
    }
LABEL_15:
    BOOL v7 = 0;
  }
LABEL_16:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_isSignificant;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_handle hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_isMe;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if ((v4[20] & 2) != 0)
  {
    self->_isSignificant = v4[17];
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 1))
  {
    uint64_t v5 = v4;
    -[BMPBSocialHighlightContact setHandle:](self, "setHandle:");
    NSUInteger v4 = v5;
  }
  if (v4[20])
  {
    self->_isMe = v4[16];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (BOOL)isSignificant
{
  return self->_isSignificant;
}

- (NSString)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
}

- (BOOL)isMe
{
  return self->_isMe;
}

- (void).cxx_destruct
{
}

@end