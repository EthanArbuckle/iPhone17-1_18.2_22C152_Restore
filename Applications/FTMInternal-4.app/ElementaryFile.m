@interface ElementaryFile
- (BOOL)hasContent;
- (BOOL)hasEfId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)content;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)efId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContent:(id)a3;
- (void)setEfId:(unsigned int)a3;
- (void)setHasEfId:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ElementaryFile

- (void)setEfId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_efId = a3;
}

- (void)setHasEfId:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEfId
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
  v7.super_class = (Class)ElementaryFile;
  v3 = [(ElementaryFile *)&v7 description];
  v4 = [(ElementaryFile *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = +[NSNumber numberWithUnsignedInt:self->_efId];
    [v3 setObject:v4 forKey:@"ef_id"];
  }
  content = self->_content;
  if (content) {
    [v3 setObject:content forKey:@"content"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000996EC((uint64_t)self, (uint64_t)a3);
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
    v4[4] = self->_efId;
    *((unsigned char *)v4 + 20) |= 1u;
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
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 4) = self->_efId;
    *((unsigned char *)v5 + 20) |= 1u;
  }
  id v7 = [(NSData *)self->_content copyWithZone:a3];
  v8 = (void *)v6[1];
  v6[1] = v7;

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
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_efId != *((_DWORD *)v4 + 4)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
LABEL_9:
    unsigned __int8 v6 = 0;
    goto LABEL_10;
  }
  content = self->_content;
  if ((unint64_t)content | *((void *)v4 + 1)) {
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
    uint64_t v2 = 2654435761 * self->_efId;
  }
  else {
    uint64_t v2 = 0;
  }
  return (unint64_t)[(NSData *)self->_content hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (v4[5])
  {
    self->_efId = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1))
  {
    id v5 = v4;
    -[ElementaryFile setContent:](self, "setContent:");
    id v4 = v5;
  }
}

- (unsigned)efId
{
  return self->_efId;
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