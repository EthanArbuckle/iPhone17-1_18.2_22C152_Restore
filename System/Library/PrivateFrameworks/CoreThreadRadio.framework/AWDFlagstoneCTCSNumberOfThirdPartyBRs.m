@interface AWDFlagstoneCTCSNumberOfThirdPartyBRs
- (AWDHeaderInfoS)header;
- (BOOL)hasHeader;
- (BOOL)hasNumberOfThirdPartyBorderRouters;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)numberOfThirdPartyBorderRouters;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasNumberOfThirdPartyBorderRouters:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHeader:(id)a3;
- (void)setNumberOfThirdPartyBorderRouters:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDFlagstoneCTCSNumberOfThirdPartyBRs

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

- (BOOL)hasHeader
{
  return self->_header != 0;
}

- (void)setNumberOfThirdPartyBorderRouters:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_numberOfThirdPartyBorderRouters = a3;
}

- (void)setHasNumberOfThirdPartyBorderRouters:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumberOfThirdPartyBorderRouters
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)AWDFlagstoneCTCSNumberOfThirdPartyBRs;
  char v3 = [(AWDFlagstoneCTCSNumberOfThirdPartyBRs *)&v7 description];
  v4 = [(AWDFlagstoneCTCSNumberOfThirdPartyBRs *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v4 forKey:@"timestamp"];
  }
  header = self->_header;
  if (header)
  {
    v6 = [(AWDHeaderInfoS *)header dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"header"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    objc_super v7 = +[NSNumber numberWithUnsignedInt:self->_numberOfThirdPartyBorderRouters];
    [v3 setObject:v7 forKey:@"number_of_third_party_border_routers"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDFlagstoneCTCSNumberOfThirdPartyBRsReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_header)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_timestamp;
    *((unsigned char *)v4 + 28) |= 1u;
  }
  if (self->_header)
  {
    id v5 = v4;
    objc_msgSend(v4, "setHeader:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_numberOfThirdPartyBorderRouters;
    *((unsigned char *)v4 + 28) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    v5[1] = self->_timestamp;
    *((unsigned char *)v5 + 28) |= 1u;
  }
  id v7 = [(AWDHeaderInfoS *)self->_header copyWithZone:a3];
  v8 = (void *)v6[2];
  v6[2] = v7;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v6 + 6) = self->_numberOfThirdPartyBorderRouters;
    *((unsigned char *)v6 + 28) |= 2u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
    goto LABEL_14;
  }
  header = self->_header;
  if ((unint64_t)header | *((void *)v4 + 2))
  {
    if (!-[AWDHeaderInfoS isEqual:](header, "isEqual:"))
    {
LABEL_14:
      BOOL v7 = 0;
      goto LABEL_15;
    }
    char has = (char)self->_has;
  }
  BOOL v7 = (*((unsigned char *)v4 + 28) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_numberOfThirdPartyBorderRouters != *((_DWORD *)v4 + 6)) {
      goto LABEL_14;
    }
    BOOL v7 = 1;
  }
LABEL_15:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    unint64_t v4 = [(AWDHeaderInfoS *)self->_header hash];
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      return v4 ^ v3 ^ (2654435761 * self->_numberOfThirdPartyBorderRouters);
    }
  }
  else
  {
    unint64_t v3 = 0;
    unint64_t v4 = [(AWDHeaderInfoS *)self->_header hash];
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      return v4 ^ v3 ^ (2654435761 * self->_numberOfThirdPartyBorderRouters);
    }
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  id v5 = v4;
  if (*((unsigned char *)v4 + 28))
  {
    self->_timestamp = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  header = self->_header;
  uint64_t v7 = *((void *)v5 + 2);
  if (header)
  {
    if (!v7) {
      goto LABEL_9;
    }
    id v8 = v5;
    -[AWDHeaderInfoS mergeFrom:](header, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    id v8 = v5;
    -[AWDFlagstoneCTCSNumberOfThirdPartyBRs setHeader:](self, "setHeader:");
  }
  id v5 = v8;
LABEL_9:
  if ((*((unsigned char *)v5 + 28) & 2) != 0)
  {
    self->_numberOfThirdPartyBorderRouters = *((_DWORD *)v5 + 6);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (AWDHeaderInfoS)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
}

- (unsigned)numberOfThirdPartyBorderRouters
{
  return self->_numberOfThirdPartyBorderRouters;
}

- (void).cxx_destruct
{
}

@end