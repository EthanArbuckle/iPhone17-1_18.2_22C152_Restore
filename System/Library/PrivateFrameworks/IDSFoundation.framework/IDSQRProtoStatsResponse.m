@interface IDSQRProtoStatsResponse
- (BOOL)hasReceivedPackets;
- (BOOL)hasSentPackets;
- (BOOL)hasServerTimestampMs;
- (BOOL)hasUplinkBandwidth;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)serverTimestampMs;
- (unsigned)clientTimestampNtp;
- (unsigned)receivedPackets;
- (unsigned)sentPackets;
- (unsigned)uplinkBandwidth;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setClientTimestampNtp:(unsigned int)a3;
- (void)setHasReceivedPackets:(BOOL)a3;
- (void)setHasSentPackets:(BOOL)a3;
- (void)setHasServerTimestampMs:(BOOL)a3;
- (void)setHasUplinkBandwidth:(BOOL)a3;
- (void)setReceivedPackets:(unsigned int)a3;
- (void)setSentPackets:(unsigned int)a3;
- (void)setServerTimestampMs:(unint64_t)a3;
- (void)setUplinkBandwidth:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDSQRProtoStatsResponse

- (void)setServerTimestampMs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_serverTimestampMs = a3;
}

- (void)setHasServerTimestampMs:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasServerTimestampMs
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSentPackets:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_sentPackets = a3;
}

- (void)setHasSentPackets:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSentPackets
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setReceivedPackets:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_receivedPackets = a3;
}

- (void)setHasReceivedPackets:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasReceivedPackets
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setUplinkBandwidth:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_uplinkBandwidth = a3;
}

- (void)setHasUplinkBandwidth:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasUplinkBandwidth
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)description
{
  char v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)IDSQRProtoStatsResponse;
  v4 = [(IDSQRProtoStatsResponse *)&v13 description];
  v8 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ %@", v10, v4, v8);

  return v11;
}

- (id)dictionaryRepresentation
{
  v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  v8 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v6, self->_clientTimestampNtp, v7);
  objc_msgSend_setObject_forKey_(v5, v9, (uint64_t)v8, v10, @"client_timestamp_ntp");

  char has = (char)self->_has;
  if (has)
  {
    v18 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v11, self->_serverTimestampMs, v12);
    objc_msgSend_setObject_forKey_(v5, v19, (uint64_t)v18, v20, @"server_timestamp_ms");

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v21 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v11, self->_sentPackets, v12);
  objc_msgSend_setObject_forKey_(v5, v22, (uint64_t)v21, v23, @"sent_packets");

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v24 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v11, self->_receivedPackets, v12);
  objc_msgSend_setObject_forKey_(v5, v25, (uint64_t)v24, v26, @"received_packets");

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    v14 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v11, self->_uplinkBandwidth, v12);
    objc_msgSend_setObject_forKey_(v5, v15, (uint64_t)v14, v16, @"uplink_bandwidth");
  }
LABEL_6:
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoStatsResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_5:
  }
    PBDataWriterWriteUint32Field();
LABEL_6:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  v4[4] = self->_clientTimestampNtp;
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = self->_serverTimestampMs;
    *((unsigned char *)v4 + 32) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[6] = self->_sentPackets;
  *((unsigned char *)v4 + 32) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v4[5] = self->_receivedPackets;
  *((unsigned char *)v4 + 32) |= 2u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    v4[7] = self->_uplinkBandwidth;
    *((unsigned char *)v4 + 32) |= 8u;
  }
LABEL_6:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  id result = (id)objc_msgSend_init(v8, v9, v10, v11);
  *((_DWORD *)result + 4) = self->_clientTimestampNtp;
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_serverTimestampMs;
    *((unsigned char *)result + 32) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 6) = self->_sentPackets;
  *((unsigned char *)result + 32) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      return result;
    }
    goto LABEL_5;
  }
LABEL_9:
  *((_DWORD *)result + 5) = self->_receivedPackets;
  *((unsigned char *)result + 32) |= 2u;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    return result;
  }
LABEL_5:
  *((_DWORD *)result + 7) = self->_uplinkBandwidth;
  *((unsigned char *)result + 32) |= 8u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7) || self->_clientTimestampNtp != *((_DWORD *)v4 + 4)) {
    goto LABEL_22;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_serverTimestampMs != *((void *)v4 + 1)) {
      goto LABEL_22;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_22:
    BOOL v8 = 0;
    goto LABEL_23;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_sentPackets != *((_DWORD *)v4 + 6)) {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_receivedPackets != *((_DWORD *)v4 + 5)) {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    goto LABEL_22;
  }
  BOOL v8 = (*((unsigned char *)v4 + 32) & 8) == 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 8) == 0 || self->_uplinkBandwidth != *((_DWORD *)v4 + 7)) {
      goto LABEL_22;
    }
    BOOL v8 = 1;
  }
LABEL_23:

  return v8;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v2 = 2654435761u * self->_serverTimestampMs;
  }
  else {
    unint64_t v2 = 0;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v3 = 2654435761 * self->_sentPackets;
  }
  else {
    uint64_t v3 = 0;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_receivedPackets;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_9;
    }
LABEL_11:
    uint64_t v5 = 0;
    return v2 ^ v3 ^ v4 ^ v5 ^ (2654435761 * self->_clientTimestampNtp);
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_11;
  }
LABEL_9:
  uint64_t v5 = 2654435761 * self->_uplinkBandwidth;
  return v2 ^ v3 ^ v4 ^ v5 ^ (2654435761 * self->_clientTimestampNtp);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  self->_clientTimestampNtp = *((_DWORD *)v4 + 4);
  char v5 = *((unsigned char *)v4 + 32);
  if (v5)
  {
    self->_serverTimestampMs = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 32);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_sentPackets = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  self->_receivedPackets = *((_DWORD *)v4 + 5);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 32) & 8) != 0)
  {
LABEL_5:
    self->_uplinkBandwidth = *((_DWORD *)v4 + 7);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_6:
}

- (unsigned)clientTimestampNtp
{
  return self->_clientTimestampNtp;
}

- (void)setClientTimestampNtp:(unsigned int)a3
{
  self->_clientTimestampNtp = a3;
}

- (unint64_t)serverTimestampMs
{
  return self->_serverTimestampMs;
}

- (unsigned)sentPackets
{
  return self->_sentPackets;
}

- (unsigned)receivedPackets
{
  return self->_receivedPackets;
}

- (unsigned)uplinkBandwidth
{
  return self->_uplinkBandwidth;
}

@end