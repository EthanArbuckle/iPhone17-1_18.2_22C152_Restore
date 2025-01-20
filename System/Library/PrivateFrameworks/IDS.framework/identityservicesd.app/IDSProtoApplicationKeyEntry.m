@interface IDSProtoApplicationKeyEntry
- (BOOL)hasKeyIndex;
- (BOOL)hasPublicIdentity;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)publicIdentity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)keyIndexAsString:(int)a3;
- (int)StringAsKeyIndex:(id)a3;
- (int)keyIndex;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasKeyIndex:(BOOL)a3;
- (void)setKeyIndex:(int)a3;
- (void)setPublicIdentity:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDSProtoApplicationKeyEntry

- (int)keyIndex
{
  if (*(unsigned char *)&self->_has) {
    return self->_keyIndex;
  }
  else {
    return 0;
  }
}

- (void)setKeyIndex:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_keyIndex = a3;
}

- (void)setHasKeyIndex:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasKeyIndex
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)keyIndexAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v4 = @"Gelato";
    }
    else
    {
      v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
    }
  }
  else
  {
    v4 = @"None";
  }
  return v4;
}

- (int)StringAsKeyIndex:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"None"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"Gelato"];
  }

  return v4;
}

- (BOOL)hasPublicIdentity
{
  return self->_publicIdentity != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)IDSProtoApplicationKeyEntry;
  id v3 = [(IDSProtoApplicationKeyEntry *)&v7 description];
  int v4 = [(IDSProtoApplicationKeyEntry *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    int keyIndex = self->_keyIndex;
    if (keyIndex)
    {
      if (keyIndex == 1)
      {
        v5 = @"Gelato";
      }
      else
      {
        v5 = +[NSString stringWithFormat:@"(unknown: %i)", self->_keyIndex];
      }
    }
    else
    {
      v5 = @"None";
    }
    [v3 setObject:v5 forKey:@"key_index"];
  }
  publicIdentity = self->_publicIdentity;
  if (publicIdentity) {
    [v3 setObject:publicIdentity forKey:@"public_identity"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return IDSProtoApplicationKeyEntryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_publicIdentity)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[2] = self->_keyIndex;
    *((unsigned char *)v4 + 24) |= 1u;
  }
  if (self->_publicIdentity)
  {
    id v5 = v4;
    objc_msgSend(v4, "setPublicIdentity:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 2) = self->_keyIndex;
    *((unsigned char *)v5 + 24) |= 1u;
  }
  id v7 = [(NSData *)self->_publicIdentity copyWithZone:a3];
  v8 = (void *)v6[2];
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
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_keyIndex != *((_DWORD *)v4 + 2)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_9:
    unsigned __int8 v6 = 0;
    goto LABEL_10;
  }
  publicIdentity = self->_publicIdentity;
  if ((unint64_t)publicIdentity | *((void *)v4 + 2)) {
    unsigned __int8 v6 = -[NSData isEqual:](publicIdentity, "isEqual:");
  }
  else {
    unsigned __int8 v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_keyIndex;
  }
  else {
    uint64_t v2 = 0;
  }
  return (unint64_t)[(NSData *)self->_publicIdentity hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (v4[6])
  {
    self->_int keyIndex = v4[2];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2))
  {
    id v5 = v4;
    -[IDSProtoApplicationKeyEntry setPublicIdentity:](self, "setPublicIdentity:");
    id v4 = v5;
  }
}

- (NSData)publicIdentity
{
  return self->_publicIdentity;
}

- (void)setPublicIdentity:(id)a3
{
}

- (void).cxx_destruct
{
}

@end