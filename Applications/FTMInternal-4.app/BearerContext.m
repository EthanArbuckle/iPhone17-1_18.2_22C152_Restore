@interface BearerContext
- (BOOL)hasApn;
- (BOOL)hasCid;
- (BOOL)hasIsAddrIratMobile;
- (BOOL)hasNsapi;
- (BOOL)hasPdpAddr;
- (BOOL)hasPdpType;
- (BOOL)hasPrimaryDnsAddr;
- (BOOL)hasPrimaryDnsType;
- (BOOL)hasSecondaryDnsAddr;
- (BOOL)hasSecondaryDnsType;
- (BOOL)isAddrIratMobile;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)pdpAddr;
- (NSData)primaryDnsAddr;
- (NSData)secondaryDnsAddr;
- (NSString)apn;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)pdpTypeAsString:(int)a3;
- (id)primaryDnsTypeAsString:(int)a3;
- (id)secondaryDnsTypeAsString:(int)a3;
- (int)StringAsPdpType:(id)a3;
- (int)StringAsPrimaryDnsType:(id)a3;
- (int)StringAsSecondaryDnsType:(id)a3;
- (int)pdpType;
- (int)primaryDnsType;
- (int)secondaryDnsType;
- (unint64_t)hash;
- (unsigned)cid;
- (unsigned)nsapi;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setApn:(id)a3;
- (void)setCid:(unsigned int)a3;
- (void)setHasCid:(BOOL)a3;
- (void)setHasIsAddrIratMobile:(BOOL)a3;
- (void)setHasNsapi:(BOOL)a3;
- (void)setHasPdpType:(BOOL)a3;
- (void)setHasPrimaryDnsType:(BOOL)a3;
- (void)setHasSecondaryDnsType:(BOOL)a3;
- (void)setIsAddrIratMobile:(BOOL)a3;
- (void)setNsapi:(unsigned int)a3;
- (void)setPdpAddr:(id)a3;
- (void)setPdpType:(int)a3;
- (void)setPrimaryDnsAddr:(id)a3;
- (void)setPrimaryDnsType:(int)a3;
- (void)setSecondaryDnsAddr:(id)a3;
- (void)setSecondaryDnsType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation BearerContext

- (void)setCid:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_cid = a3;
}

- (void)setHasCid:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCid
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setNsapi:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_nsapi = a3;
}

- (void)setHasNsapi:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNsapi
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasApn
{
  return self->_apn != 0;
}

- (int)pdpType
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_pdpType;
  }
  else {
    return 0;
  }
}

- (void)setPdpType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_pdpType = a3;
}

- (void)setHasPdpType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPdpType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)pdpTypeAsString:(int)a3
{
  if (a3 >= 8)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = off_100288620[a3];
  }

  return v3;
}

- (int)StringAsPdpType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PDP_TYPE_IPv4"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PDP_TYPE_IPv6"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PDP_TYPE_IPv4v6"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"PDP_TYPE_IPv4_PDN"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"PDP_TYPE_IPv6_PDN"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"PDP_TYPE_IPv4v6_PDN"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"PDP_TYPE_PPP"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"PDP_TYPE_NONE"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasPdpAddr
{
  return self->_pdpAddr != 0;
}

- (int)primaryDnsType
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_primaryDnsType;
  }
  else {
    return 0;
  }
}

- (void)setPrimaryDnsType:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_primaryDnsType = a3;
}

- (void)setHasPrimaryDnsType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPrimaryDnsType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)primaryDnsTypeAsString:(int)a3
{
  if (a3 >= 8)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = off_100288620[a3];
  }

  return v3;
}

- (int)StringAsPrimaryDnsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PDP_TYPE_IPv4"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PDP_TYPE_IPv6"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PDP_TYPE_IPv4v6"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"PDP_TYPE_IPv4_PDN"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"PDP_TYPE_IPv6_PDN"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"PDP_TYPE_IPv4v6_PDN"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"PDP_TYPE_PPP"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"PDP_TYPE_NONE"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasPrimaryDnsAddr
{
  return self->_primaryDnsAddr != 0;
}

- (int)secondaryDnsType
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_secondaryDnsType;
  }
  else {
    return 0;
  }
}

- (void)setSecondaryDnsType:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_secondaryDnsType = a3;
}

- (void)setHasSecondaryDnsType:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSecondaryDnsType
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)secondaryDnsTypeAsString:(int)a3
{
  if (a3 >= 8)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = off_100288620[a3];
  }

  return v3;
}

- (int)StringAsSecondaryDnsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PDP_TYPE_IPv4"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PDP_TYPE_IPv6"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PDP_TYPE_IPv4v6"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"PDP_TYPE_IPv4_PDN"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"PDP_TYPE_IPv6_PDN"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"PDP_TYPE_IPv4v6_PDN"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"PDP_TYPE_PPP"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"PDP_TYPE_NONE"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasSecondaryDnsAddr
{
  return self->_secondaryDnsAddr != 0;
}

- (void)setIsAddrIratMobile:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_isAddrIratMobile = a3;
}

- (void)setHasIsAddrIratMobile:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIsAddrIratMobile
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)BearerContext;
  char v3 = [(BearerContext *)&v7 description];
  int v4 = [(BearerContext *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = +[NSNumber numberWithUnsignedInt:self->_cid];
    [v3 setObject:v5 forKey:@"cid"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = +[NSNumber numberWithUnsignedInt:self->_nsapi];
    [v3 setObject:v6 forKey:@"nsapi"];
  }
  apn = self->_apn;
  if (apn) {
    [v3 setObject:apn forKey:@"apn"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t pdpType = self->_pdpType;
    if (pdpType >= 8)
    {
      v9 = +[NSString stringWithFormat:@"(unknown: %i)", self->_pdpType];
    }
    else
    {
      v9 = off_100288620[pdpType];
    }
    [v3 setObject:v9 forKey:@"pdp_type"];
  }
  pdpAddr = self->_pdpAddr;
  if (pdpAddr) {
    [v3 setObject:pdpAddr forKey:@"pdp_addr"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t primaryDnsType = self->_primaryDnsType;
    if (primaryDnsType >= 8)
    {
      v12 = +[NSString stringWithFormat:@"(unknown: %i)", self->_primaryDnsType];
    }
    else
    {
      v12 = off_100288620[primaryDnsType];
    }
    [v3 setObject:v12 forKey:@"primary_dns_type"];
  }
  primaryDnsAddr = self->_primaryDnsAddr;
  if (primaryDnsAddr) {
    [v3 setObject:primaryDnsAddr forKey:@"primary_dns_addr"];
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    uint64_t secondaryDnsType = self->_secondaryDnsType;
    if (secondaryDnsType >= 8)
    {
      v15 = +[NSString stringWithFormat:@"(unknown: %i)", self->_secondaryDnsType];
    }
    else
    {
      v15 = off_100288620[secondaryDnsType];
    }
    [v3 setObject:v15 forKey:@"secondary_dns_type"];
  }
  secondaryDnsAddr = self->_secondaryDnsAddr;
  if (secondaryDnsAddr) {
    [v3 setObject:secondaryDnsAddr forKey:@"secondary_dns_addr"];
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    v17 = +[NSNumber numberWithBool:self->_isAddrIratMobile];
    [v3 setObject:v17 forKey:@"is_addr_irat_mobile"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100146D20((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_apn) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_pdpAddr) {
    PBDataWriterWriteDataField();
  }
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_primaryDnsAddr) {
    PBDataWriterWriteDataField();
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_secondaryDnsAddr) {
    PBDataWriterWriteDataField();
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[4] = self->_cid;
    *((unsigned char *)v4 + 72) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[5] = self->_nsapi;
    *((unsigned char *)v4 + 72) |= 2u;
  }
  v6 = v4;
  if (self->_apn)
  {
    [v4 setApn:];
    int v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v4[8] = self->_pdpType;
    *((unsigned char *)v4 + 72) |= 4u;
  }
  if (self->_pdpAddr)
  {
    [v6 setPdpAddr:];
    int v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v4[12] = self->_primaryDnsType;
    *((unsigned char *)v4 + 72) |= 8u;
  }
  if (self->_primaryDnsAddr)
  {
    [v6 setPrimaryDnsAddr:];
    int v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    v4[16] = self->_secondaryDnsType;
    *((unsigned char *)v4 + 72) |= 0x10u;
  }
  if (self->_secondaryDnsAddr)
  {
    [v6 setSecondaryDnsAddr:];
    int v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    *((unsigned char *)v4 + 68) = self->_isAddrIratMobile;
    *((unsigned char *)v4 + 72) |= 0x20u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  v6 = v5;
  char has = (char)self->_has;
  if (has)
  {
    v5[4] = self->_cid;
    *((unsigned char *)v5 + 72) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v5[5] = self->_nsapi;
    *((unsigned char *)v5 + 72) |= 2u;
  }
  id v8 = [(NSString *)self->_apn copyWithZone:a3];
  v9 = (void *)v6[1];
  v6[1] = v8;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v6 + 8) = self->_pdpType;
    *((unsigned char *)v6 + 72) |= 4u;
  }
  id v10 = [(NSData *)self->_pdpAddr copyWithZone:a3];
  v11 = (void *)v6[3];
  v6[3] = v10;

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((_DWORD *)v6 + 12) = self->_primaryDnsType;
    *((unsigned char *)v6 + 72) |= 8u;
  }
  id v12 = [(NSData *)self->_primaryDnsAddr copyWithZone:a3];
  v13 = (void *)v6[5];
  v6[5] = v12;

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *((_DWORD *)v6 + 16) = self->_secondaryDnsType;
    *((unsigned char *)v6 + 72) |= 0x10u;
  }
  id v14 = [(NSData *)self->_secondaryDnsAddr copyWithZone:a3];
  v15 = (void *)v6[7];
  v6[7] = v14;

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    *((unsigned char *)v6 + 68) = self->_isAddrIratMobile;
    *((unsigned char *)v6 + 72) |= 0x20u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_41;
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 72) & 1) == 0 || self->_cid != *((_DWORD *)v4 + 4)) {
      goto LABEL_41;
    }
  }
  else if (*((unsigned char *)v4 + 72))
  {
    goto LABEL_41;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 2) == 0 || self->_nsapi != *((_DWORD *)v4 + 5)) {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 2) != 0)
  {
    goto LABEL_41;
  }
  apn = self->_apn;
  if ((unint64_t)apn | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](apn, "isEqual:")) {
      goto LABEL_41;
    }
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 4) == 0 || self->_pdpType != *((_DWORD *)v4 + 8)) {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 4) != 0)
  {
    goto LABEL_41;
  }
  pdpAddr = self->_pdpAddr;
  if ((unint64_t)pdpAddr | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](pdpAddr, "isEqual:")) {
      goto LABEL_41;
    }
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 8) == 0 || self->_primaryDnsType != *((_DWORD *)v4 + 12)) {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 8) != 0)
  {
    goto LABEL_41;
  }
  primaryDnsAddr = self->_primaryDnsAddr;
  if ((unint64_t)primaryDnsAddr | *((void *)v4 + 5))
  {
    if (!-[NSData isEqual:](primaryDnsAddr, "isEqual:")) {
      goto LABEL_41;
    }
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 0x10) == 0 || self->_secondaryDnsType != *((_DWORD *)v4 + 16)) {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 0x10) != 0)
  {
    goto LABEL_41;
  }
  secondaryDnsAddr = self->_secondaryDnsAddr;
  if ((unint64_t)secondaryDnsAddr | *((void *)v4 + 7))
  {
    if (!-[NSData isEqual:](secondaryDnsAddr, "isEqual:")) {
      goto LABEL_41;
    }
    char has = (char)self->_has;
  }
  BOOL v10 = (*((unsigned char *)v4 + 72) & 0x20) == 0;
  if ((has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 0x20) != 0)
    {
      if (self->_isAddrIratMobile)
      {
        if (!*((unsigned char *)v4 + 68)) {
          goto LABEL_41;
        }
      }
      else if (*((unsigned char *)v4 + 68))
      {
        goto LABEL_41;
      }
      BOOL v10 = 1;
      goto LABEL_42;
    }
LABEL_41:
    BOOL v10 = 0;
  }
LABEL_42:

  return v10;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v13 = 2654435761 * self->_cid;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v13 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_nsapi;
      goto LABEL_6;
    }
  }
  uint64_t v3 = 0;
LABEL_6:
  NSUInteger v4 = [(NSString *)self->_apn hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v5 = 2654435761 * self->_pdpType;
  }
  else {
    uint64_t v5 = 0;
  }
  unint64_t v6 = (unint64_t)[(NSData *)self->_pdpAddr hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v7 = 2654435761 * self->_primaryDnsType;
  }
  else {
    uint64_t v7 = 0;
  }
  unint64_t v8 = (unint64_t)[(NSData *)self->_primaryDnsAddr hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v9 = 2654435761 * self->_secondaryDnsType;
  }
  else {
    uint64_t v9 = 0;
  }
  unint64_t v10 = (unint64_t)[(NSData *)self->_secondaryDnsAddr hash];
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    uint64_t v11 = 2654435761 * self->_isAddrIratMobile;
  }
  else {
    uint64_t v11 = 0;
  }
  return v3 ^ v13 ^ v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 72);
  if (v5)
  {
    self->_cid = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 72);
  }
  if ((v5 & 2) != 0)
  {
    self->_nsapi = *((_DWORD *)v4 + 5);
    *(unsigned char *)&self->_has |= 2u;
  }
  id v6 = v4;
  if (*((void *)v4 + 1))
  {
    -[BearerContext setApn:](self, "setApn:");
    id v4 = v6;
  }
  if ((*((unsigned char *)v4 + 72) & 4) != 0)
  {
    self->_uint64_t pdpType = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 3))
  {
    -[BearerContext setPdpAddr:](self, "setPdpAddr:");
    id v4 = v6;
  }
  if ((*((unsigned char *)v4 + 72) & 8) != 0)
  {
    self->_uint64_t primaryDnsType = *((_DWORD *)v4 + 12);
    *(unsigned char *)&self->_has |= 8u;
  }
  if (*((void *)v4 + 5))
  {
    -[BearerContext setPrimaryDnsAddr:](self, "setPrimaryDnsAddr:");
    id v4 = v6;
  }
  if ((*((unsigned char *)v4 + 72) & 0x10) != 0)
  {
    self->_uint64_t secondaryDnsType = *((_DWORD *)v4 + 16);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  if (*((void *)v4 + 7))
  {
    -[BearerContext setSecondaryDnsAddr:](self, "setSecondaryDnsAddr:");
    id v4 = v6;
  }
  if ((*((unsigned char *)v4 + 72) & 0x20) != 0)
  {
    self->_isAddrIratMobile = *((unsigned char *)v4 + 68);
    *(unsigned char *)&self->_has |= 0x20u;
  }
}

- (unsigned)cid
{
  return self->_cid;
}

- (unsigned)nsapi
{
  return self->_nsapi;
}

- (NSString)apn
{
  return self->_apn;
}

- (void)setApn:(id)a3
{
}

- (NSData)pdpAddr
{
  return self->_pdpAddr;
}

- (void)setPdpAddr:(id)a3
{
}

- (NSData)primaryDnsAddr
{
  return self->_primaryDnsAddr;
}

- (void)setPrimaryDnsAddr:(id)a3
{
}

- (NSData)secondaryDnsAddr
{
  return self->_secondaryDnsAddr;
}

- (void)setSecondaryDnsAddr:(id)a3
{
}

- (BOOL)isAddrIratMobile
{
  return self->_isAddrIratMobile;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryDnsAddr, 0);
  objc_storeStrong((id *)&self->_primaryDnsAddr, 0);
  objc_storeStrong((id *)&self->_pdpAddr, 0);

  objc_storeStrong((id *)&self->_apn, 0);
}

@end