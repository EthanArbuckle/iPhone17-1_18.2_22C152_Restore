@interface Mib
- (BOOL)hasMibContent;
- (BOOL)hasSsbSubCarrierOffset;
- (BOOL)hasSubCarrierSpacing;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)mibContent;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)ssbSubCarrierOffset;
- (unsigned)subCarrierSpacing;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasSsbSubCarrierOffset:(BOOL)a3;
- (void)setHasSubCarrierSpacing:(BOOL)a3;
- (void)setMibContent:(id)a3;
- (void)setSsbSubCarrierOffset:(unsigned int)a3;
- (void)setSubCarrierSpacing:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation Mib

- (void)setSubCarrierSpacing:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_subCarrierSpacing = a3;
}

- (void)setHasSubCarrierSpacing:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSubCarrierSpacing
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSsbSubCarrierOffset:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_ssbSubCarrierOffset = a3;
}

- (void)setHasSsbSubCarrierOffset:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSsbSubCarrierOffset
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasMibContent
{
  return self->_mibContent != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)Mib;
  char v3 = [(Mib *)&v7 description];
  v4 = [(Mib *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = +[NSNumber numberWithUnsignedInt:self->_subCarrierSpacing];
    [v3 setObject:v5 forKey:@"sub_carrier_spacing"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v6 = +[NSNumber numberWithUnsignedInt:self->_ssbSubCarrierOffset];
    [v3 setObject:v6 forKey:@"ssb_sub_carrier_offset"];
  }
  mibContent = self->_mibContent;
  if (mibContent) {
    [v3 setObject:mibContent forKey:@"mib_content"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10009F808((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
  if (self->_mibContent)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[5] = self->_subCarrierSpacing;
    *((unsigned char *)v4 + 24) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[4] = self->_ssbSubCarrierOffset;
    *((unsigned char *)v4 + 24) |= 1u;
  }
  if (self->_mibContent)
  {
    id v6 = v4;
    [v4 setMibContent:];
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 5) = self->_subCarrierSpacing;
    *((unsigned char *)v5 + 24) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v5 + 4) = self->_ssbSubCarrierOffset;
    *((unsigned char *)v5 + 24) |= 1u;
  }
  id v8 = [(NSData *)self->_mibContent copyWithZone:a3];
  v9 = (void *)v6[1];
  v6[1] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_subCarrierSpacing != *((_DWORD *)v4 + 5)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
LABEL_14:
    unsigned __int8 v6 = 0;
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_ssbSubCarrierOffset != *((_DWORD *)v4 + 4)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
    goto LABEL_14;
  }
  mibContent = self->_mibContent;
  if ((unint64_t)mibContent | *((void *)v4 + 1)) {
    unsigned __int8 v6 = -[NSData isEqual:](mibContent, "isEqual:");
  }
  else {
    unsigned __int8 v6 = 1;
  }
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761 * self->_subCarrierSpacing;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2 ^ (unint64_t)[(NSData *)self->_mibContent hash];
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_ssbSubCarrierOffset;
  return v3 ^ v2 ^ (unint64_t)[(NSData *)self->_mibContent hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 24);
  if ((v5 & 2) != 0)
  {
    self->_subCarrierSpacing = *((_DWORD *)v4 + 5);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 24);
  }
  if (v5)
  {
    self->_ssbSubCarrierOffset = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1))
  {
    id v6 = v4;
    -[Mib setMibContent:](self, "setMibContent:");
    id v4 = v6;
  }
}

- (unsigned)subCarrierSpacing
{
  return self->_subCarrierSpacing;
}

- (unsigned)ssbSubCarrierOffset
{
  return self->_ssbSubCarrierOffset;
}

- (NSData)mibContent
{
  return self->_mibContent;
}

- (void)setMibContent:(id)a3
{
}

- (void).cxx_destruct
{
}

@end