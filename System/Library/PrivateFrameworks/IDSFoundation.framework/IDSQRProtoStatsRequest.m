@interface IDSQRProtoStatsRequest
- (BOOL)hasClientLatencyMs;
- (BOOL)hasReceivedPackets;
- (BOOL)hasSentPackets;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)clientLatencyMs;
- (unsigned)clientTimestampNtp;
- (unsigned)receivedPackets;
- (unsigned)sentPackets;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setClientLatencyMs:(unsigned int)a3;
- (void)setClientTimestampNtp:(unsigned int)a3;
- (void)setHasClientLatencyMs:(BOOL)a3;
- (void)setHasReceivedPackets:(BOOL)a3;
- (void)setHasSentPackets:(BOOL)a3;
- (void)setReceivedPackets:(unsigned int)a3;
- (void)setSentPackets:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDSQRProtoStatsRequest

- (void)setClientLatencyMs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_clientLatencyMs = a3;
}

- (void)setHasClientLatencyMs:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasClientLatencyMs
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

- (id)description
{
  char v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)IDSQRProtoStatsRequest;
  v4 = [(IDSQRProtoStatsRequest *)&v13 description];
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
    v18 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v11, self->_clientLatencyMs, v12);
    objc_msgSend_setObject_forKey_(v5, v19, (uint64_t)v18, v20, @"client_latency_ms");

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v21 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v11, self->_sentPackets, v12);
  objc_msgSend_setObject_forKey_(v5, v22, (uint64_t)v21, v23, @"sent_packets");

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    v14 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v11, self->_receivedPackets, v12);
    objc_msgSend_setObject_forKey_(v5, v15, (uint64_t)v14, v16, @"received_packets");
  }
LABEL_5:
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoStatsRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_4:
  }
    PBDataWriterWriteUint32Field();
LABEL_5:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  v4[3] = self->_clientTimestampNtp;
  char has = (char)self->_has;
  if (has)
  {
    v4[2] = self->_clientLatencyMs;
    *((unsigned char *)v4 + 24) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[5] = self->_sentPackets;
  *((unsigned char *)v4 + 24) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    v4[4] = self->_receivedPackets;
    *((unsigned char *)v4 + 24) |= 2u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  id result = (id)objc_msgSend_init(v8, v9, v10, v11);
  *((_DWORD *)result + 3) = self->_clientTimestampNtp;
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)result + 2) = self->_clientLatencyMs;
    *((unsigned char *)result + 24) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 5) = self->_sentPackets;
  *((unsigned char *)result + 24) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_4:
  *((_DWORD *)result + 4) = self->_receivedPackets;
  *((unsigned char *)result + 24) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7) || self->_clientTimestampNtp != *((_DWORD *)v4 + 3)) {
    goto LABEL_17;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_clientLatencyMs != *((_DWORD *)v4 + 2)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_17:
    BOOL v8 = 0;
    goto LABEL_18;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 4) == 0 || self->_sentPackets != *((_DWORD *)v4 + 5)) {
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 4) != 0)
  {
    goto LABEL_17;
  }
  BOOL v8 = (*((unsigned char *)v4 + 24) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_receivedPackets != *((_DWORD *)v4 + 4)) {
      goto LABEL_17;
    }
    BOOL v8 = 1;
  }
LABEL_18:

  return v8;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_clientLatencyMs;
  }
  else {
    uint64_t v2 = 0;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v3 = 2654435761 * self->_sentPackets;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v4 = 0;
    return v2 ^ v3 ^ v4 ^ (2654435761 * self->_clientTimestampNtp);
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v4 = 2654435761 * self->_receivedPackets;
  return v2 ^ v3 ^ v4 ^ (2654435761 * self->_clientTimestampNtp);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  self->_clientTimestampNtp = v4[3];
  char v5 = *((unsigned char *)v4 + 24);
  if (v5)
  {
    self->_clientLatencyMs = v4[2];
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 24);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v4[6] & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_sentPackets = v4[5];
  *(unsigned char *)&self->_has |= 4u;
  if ((v4[6] & 2) != 0)
  {
LABEL_4:
    self->_receivedPackets = v4[4];
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_5:
}

- (unsigned)clientTimestampNtp
{
  return self->_clientTimestampNtp;
}

- (void)setClientTimestampNtp:(unsigned int)a3
{
  self->_clientTimestampNtp = a3;
}

- (unsigned)clientLatencyMs
{
  return self->_clientLatencyMs;
}

- (unsigned)sentPackets
{
  return self->_sentPackets;
}

- (unsigned)receivedPackets
{
  return self->_receivedPackets;
}

@end