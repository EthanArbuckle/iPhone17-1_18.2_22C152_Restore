@interface AWDFlagstoneCTCSNumberPreferredNetworksByBorderRouters
- (AWDHeaderInfoS)header;
- (BOOL)hasHeader;
- (BOOL)hasNumberOfPreferredNwByAppleBorderRouters;
- (BOOL)hasNumberOfPreferredNwByThirdPartyBorderRouters;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)numberOfPreferredNwByAppleBorderRouters;
- (unsigned)numberOfPreferredNwByThirdPartyBorderRouters;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasNumberOfPreferredNwByAppleBorderRouters:(BOOL)a3;
- (void)setHasNumberOfPreferredNwByThirdPartyBorderRouters:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHeader:(id)a3;
- (void)setNumberOfPreferredNwByAppleBorderRouters:(unsigned int)a3;
- (void)setNumberOfPreferredNwByThirdPartyBorderRouters:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDFlagstoneCTCSNumberPreferredNetworksByBorderRouters

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

- (void)setNumberOfPreferredNwByThirdPartyBorderRouters:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_numberOfPreferredNwByThirdPartyBorderRouters = a3;
}

- (void)setHasNumberOfPreferredNwByThirdPartyBorderRouters:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNumberOfPreferredNwByThirdPartyBorderRouters
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setNumberOfPreferredNwByAppleBorderRouters:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_numberOfPreferredNwByAppleBorderRouters = a3;
}

- (void)setHasNumberOfPreferredNwByAppleBorderRouters:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumberOfPreferredNwByAppleBorderRouters
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)AWDFlagstoneCTCSNumberPreferredNetworksByBorderRouters;
  char v3 = [(AWDFlagstoneCTCSNumberPreferredNetworksByBorderRouters *)&v7 description];
  v4 = [(AWDFlagstoneCTCSNumberPreferredNetworksByBorderRouters *)self dictionaryRepresentation];
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
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v8 = +[NSNumber numberWithUnsignedInt:self->_numberOfPreferredNwByThirdPartyBorderRouters];
    [v3 setObject:v8 forKey:@"number_of_preferred_nw_by_third_party_border_routers"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v9 = +[NSNumber numberWithUnsignedInt:self->_numberOfPreferredNwByAppleBorderRouters];
    [v3 setObject:v9 forKey:@"number_of_preferred_nw_by_Apple_border_routers"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDFlagstoneCTCSNumberPreferredNetworksByBorderRoutersReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_header) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    if ((*(unsigned char *)&self->_has & 2) == 0)
    {
LABEL_7:
      v4 = v5;
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  v4 = v5;

LABEL_9:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_timestamp;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  if (self->_header)
  {
    id v5 = v4;
    objc_msgSend(v4, "setHeader:");
    v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v4 + 7) = self->_numberOfPreferredNwByThirdPartyBorderRouters;
    *((unsigned char *)v4 + 32) |= 4u;
    if ((*(unsigned char *)&self->_has & 2) == 0)
    {
LABEL_7:
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)v4 + 6) = self->_numberOfPreferredNwByAppleBorderRouters;
  *((unsigned char *)v4 + 32) |= 2u;

LABEL_9:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    v5[1] = self->_timestamp;
    *((unsigned char *)v5 + 32) |= 1u;
  }
  id v7 = [(AWDHeaderInfoS *)self->_header copyWithZone:a3];
  v8 = (void *)v6[2];
  v6[2] = v7;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v6 + 7) = self->_numberOfPreferredNwByThirdPartyBorderRouters;
    *((unsigned char *)v6 + 32) |= 4u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return v6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    return v6;
  }
  *((_DWORD *)v6 + 6) = self->_numberOfPreferredNwByAppleBorderRouters;
  *((unsigned char *)v6 + 32) |= 2u;
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_19;
  }
  header = self->_header;
  if ((unint64_t)header | *((void *)v4 + 2))
  {
    if (!-[AWDHeaderInfoS isEqual:](header, "isEqual:"))
    {
LABEL_19:
      BOOL v7 = 0;
      goto LABEL_20;
    }
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_numberOfPreferredNwByThirdPartyBorderRouters != *((_DWORD *)v4 + 7)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
    goto LABEL_19;
  }
  BOOL v7 = (*((unsigned char *)v4 + 32) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_numberOfPreferredNwByAppleBorderRouters != *((_DWORD *)v4 + 6)) {
      goto LABEL_19;
    }
    BOOL v7 = 1;
  }
LABEL_20:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    unint64_t v3 = 0;
    unint64_t v4 = [(AWDHeaderInfoS *)self->_header hash];
    char has = (char)self->_has;
    if ((has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v6 = 0;
    if ((has & 2) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v6 ^ v7;
  }
  unint64_t v3 = 2654435761u * self->_timestamp;
  unint64_t v4 = [(AWDHeaderInfoS *)self->_header hash];
  char has = (char)self->_has;
  if ((has & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_numberOfPreferredNwByThirdPartyBorderRouters;
  if ((has & 2) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v7 = 2654435761 * self->_numberOfPreferredNwByAppleBorderRouters;
  return v4 ^ v3 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  id v5 = v4;
  if (v4[4])
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
    -[AWDFlagstoneCTCSNumberPreferredNetworksByBorderRouters setHeader:](self, "setHeader:");
  }
  id v5 = v8;
LABEL_9:
  if ((*((unsigned char *)v5 + 32) & 4) != 0)
  {
    self->_numberOfPreferredNwByThirdPartyBorderRouters = *((_DWORD *)v5 + 7);
    *(unsigned char *)&self->_has |= 4u;
    if ((*((unsigned char *)v5 + 32) & 2) == 0)
    {
LABEL_11:
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v5 + 32) & 2) == 0)
  {
    goto LABEL_11;
  }
  self->_numberOfPreferredNwByAppleBorderRouters = *((_DWORD *)v5 + 6);
  *(unsigned char *)&self->_has |= 2u;

LABEL_13:
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

- (unsigned)numberOfPreferredNwByThirdPartyBorderRouters
{
  return self->_numberOfPreferredNwByThirdPartyBorderRouters;
}

- (unsigned)numberOfPreferredNwByAppleBorderRouters
{
  return self->_numberOfPreferredNwByAppleBorderRouters;
}

- (void).cxx_destruct
{
}

@end