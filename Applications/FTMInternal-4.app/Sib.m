@interface Sib
- (BOOL)hasBitMask;
- (BOOL)hasContent;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)content;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)bitMask;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBitMask:(unsigned int)a3;
- (void)setContent:(id)a3;
- (void)setHasBitMask:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation Sib

- (void)setBitMask:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_bitMask = a3;
}

- (void)setHasBitMask:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBitMask
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasContent
{
  return self->_content != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)Sib;
  v3 = [(Sib *)&v7 description];
  v4 = [(Sib *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = +[NSNumber numberWithUnsignedInt:self->_bitMask];
    [v3 setObject:v4 forKey:@"bit_mask"];
  }
  content = self->_content;
  if (content) {
    [v3 setObject:content forKey:@"content"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100012570((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_content)
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
    v4[2] = self->_bitMask;
    *((unsigned char *)v4 + 24) |= 1u;
  }
  if (self->_content)
  {
    id v5 = v4;
    [v4 setContent:];
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 2) = self->_bitMask;
    *((unsigned char *)v5 + 24) |= 1u;
  }
  id v7 = [(NSData *)self->_content copyWithZone:a3];
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
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_bitMask != *((_DWORD *)v4 + 2)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_9:
    unsigned __int8 v6 = 0;
    goto LABEL_10;
  }
  content = self->_content;
  if ((unint64_t)content | *((void *)v4 + 2)) {
    unsigned __int8 v6 = -[NSData isEqual:](content, "isEqual:");
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
    uint64_t v2 = 2654435761 * self->_bitMask;
  }
  else {
    uint64_t v2 = 0;
  }
  return (unint64_t)[(NSData *)self->_content hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (v4[6])
  {
    self->_bitMask = v4[2];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2))
  {
    id v5 = v4;
    -[Sib setContent:](self, "setContent:");
    id v4 = v5;
  }
}

- (unsigned)bitMask
{
  return self->_bitMask;
}

- (NSData)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
}

- (void).cxx_destruct
{
}

@end