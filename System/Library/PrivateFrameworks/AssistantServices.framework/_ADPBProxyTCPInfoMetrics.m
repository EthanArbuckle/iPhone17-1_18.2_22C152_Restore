@interface _ADPBProxyTCPInfoMetrics
- (BOOL)hasInterfaceName;
- (BOOL)hasRttBest;
- (BOOL)hasRttCurrent;
- (BOOL)hasRttSmoothed;
- (BOOL)hasRttVariance;
- (BOOL)hasRxBytes;
- (BOOL)hasRxDuplicateBytes;
- (BOOL)hasRxOooBytes;
- (BOOL)hasRxPackets;
- (BOOL)hasSndBandwidth;
- (BOOL)hasSynRetransmits;
- (BOOL)hasTfoSynDataAcked;
- (BOOL)hasTxBytes;
- (BOOL)hasTxPackets;
- (BOOL)hasTxRetransmitBytes;
- (BOOL)hasTxUnacked;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)interfaceName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)rxBytes;
- (unint64_t)rxDuplicateBytes;
- (unint64_t)rxOooBytes;
- (unint64_t)rxPackets;
- (unint64_t)sndBandwidth;
- (unint64_t)txBytes;
- (unint64_t)txPackets;
- (unint64_t)txRetransmitBytes;
- (unint64_t)txUnacked;
- (unsigned)rttBest;
- (unsigned)rttCurrent;
- (unsigned)rttSmoothed;
- (unsigned)rttVariance;
- (unsigned)synRetransmits;
- (unsigned)tfoSynDataAcked;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasRttBest:(BOOL)a3;
- (void)setHasRttCurrent:(BOOL)a3;
- (void)setHasRttSmoothed:(BOOL)a3;
- (void)setHasRttVariance:(BOOL)a3;
- (void)setHasRxBytes:(BOOL)a3;
- (void)setHasRxDuplicateBytes:(BOOL)a3;
- (void)setHasRxOooBytes:(BOOL)a3;
- (void)setHasRxPackets:(BOOL)a3;
- (void)setHasSndBandwidth:(BOOL)a3;
- (void)setHasSynRetransmits:(BOOL)a3;
- (void)setHasTfoSynDataAcked:(BOOL)a3;
- (void)setHasTxBytes:(BOOL)a3;
- (void)setHasTxPackets:(BOOL)a3;
- (void)setHasTxRetransmitBytes:(BOOL)a3;
- (void)setHasTxUnacked:(BOOL)a3;
- (void)setInterfaceName:(id)a3;
- (void)setRttBest:(unsigned int)a3;
- (void)setRttCurrent:(unsigned int)a3;
- (void)setRttSmoothed:(unsigned int)a3;
- (void)setRttVariance:(unsigned int)a3;
- (void)setRxBytes:(unint64_t)a3;
- (void)setRxDuplicateBytes:(unint64_t)a3;
- (void)setRxOooBytes:(unint64_t)a3;
- (void)setRxPackets:(unint64_t)a3;
- (void)setSndBandwidth:(unint64_t)a3;
- (void)setSynRetransmits:(unsigned int)a3;
- (void)setTfoSynDataAcked:(unsigned int)a3;
- (void)setTxBytes:(unint64_t)a3;
- (void)setTxPackets:(unint64_t)a3;
- (void)setTxRetransmitBytes:(unint64_t)a3;
- (void)setTxUnacked:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation _ADPBProxyTCPInfoMetrics

- (void).cxx_destruct
{
}

- (unsigned)tfoSynDataAcked
{
  return self->_tfoSynDataAcked;
}

- (unsigned)synRetransmits
{
  return self->_synRetransmits;
}

- (unint64_t)sndBandwidth
{
  return self->_sndBandwidth;
}

- (unint64_t)rxOooBytes
{
  return self->_rxOooBytes;
}

- (unint64_t)rxDuplicateBytes
{
  return self->_rxDuplicateBytes;
}

- (unint64_t)rxBytes
{
  return self->_rxBytes;
}

- (unint64_t)rxPackets
{
  return self->_rxPackets;
}

- (unint64_t)txUnacked
{
  return self->_txUnacked;
}

- (unint64_t)txRetransmitBytes
{
  return self->_txRetransmitBytes;
}

- (unint64_t)txBytes
{
  return self->_txBytes;
}

- (unint64_t)txPackets
{
  return self->_txPackets;
}

- (unsigned)rttBest
{
  return self->_rttBest;
}

- (unsigned)rttVariance
{
  return self->_rttVariance;
}

- (unsigned)rttSmoothed
{
  return self->_rttSmoothed;
}

- (unsigned)rttCurrent
{
  return self->_rttCurrent;
}

- (void)setInterfaceName:(id)a3
{
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 10))
  {
    id v6 = v4;
    -[_ADPBProxyTCPInfoMetrics setInterfaceName:](self, "setInterfaceName:");
    id v4 = v6;
  }
  __int16 v5 = *((_WORD *)v4 + 56);
  if ((v5 & 0x400) != 0)
  {
    self->_rttCurrent = *((_DWORD *)v4 + 23);
    *(_WORD *)&self->_has |= 0x400u;
    __int16 v5 = *((_WORD *)v4 + 56);
    if ((v5 & 0x800) == 0)
    {
LABEL_5:
      if ((v5 & 0x1000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_24;
    }
  }
  else if ((*((_WORD *)v4 + 56) & 0x800) == 0)
  {
    goto LABEL_5;
  }
  self->_rttSmoothed = *((_DWORD *)v4 + 24);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v5 = *((_WORD *)v4 + 56);
  if ((v5 & 0x1000) == 0)
  {
LABEL_6:
    if ((v5 & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_rttVariance = *((_DWORD *)v4 + 25);
  *(_WORD *)&self->_has |= 0x1000u;
  __int16 v5 = *((_WORD *)v4 + 56);
  if ((v5 & 0x200) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_rttBest = *((_DWORD *)v4 + 22);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v5 = *((_WORD *)v4 + 56);
  if ((v5 & 0x40) == 0)
  {
LABEL_8:
    if ((v5 & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_txPackets = *((void *)v4 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)v4 + 56);
  if ((v5 & 0x20) == 0)
  {
LABEL_9:
    if ((v5 & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_txBytes = *((void *)v4 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 56);
  if ((v5 & 0x80) == 0)
  {
LABEL_10:
    if ((v5 & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_txRetransmitBytes = *((void *)v4 + 8);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)v4 + 56);
  if ((v5 & 0x100) == 0)
  {
LABEL_11:
    if ((v5 & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_txUnacked = *((void *)v4 + 9);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)v4 + 56);
  if ((v5 & 8) == 0)
  {
LABEL_12:
    if ((v5 & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_rxPackets = *((void *)v4 + 4);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)v4 + 56);
  if ((v5 & 1) == 0)
  {
LABEL_13:
    if ((v5 & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_rxBytes = *((void *)v4 + 1);
  *(_WORD *)&self->_has |= 1u;
  __int16 v5 = *((_WORD *)v4 + 56);
  if ((v5 & 2) == 0)
  {
LABEL_14:
    if ((v5 & 4) == 0) {
      goto LABEL_15;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_rxDuplicateBytes = *((void *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)v4 + 56);
  if ((v5 & 4) == 0)
  {
LABEL_15:
    if ((v5 & 0x10) == 0) {
      goto LABEL_16;
    }
    goto LABEL_34;
  }
LABEL_33:
  self->_rxOooBytes = *((void *)v4 + 3);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)v4 + 56);
  if ((v5 & 0x10) == 0)
  {
LABEL_16:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_sndBandwidth = *((void *)v4 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)v4 + 56);
  if ((v5 & 0x2000) == 0)
  {
LABEL_17:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_35:
  self->_synRetransmits = *((_DWORD *)v4 + 26);
  *(_WORD *)&self->_has |= 0x2000u;
  if ((*((_WORD *)v4 + 56) & 0x4000) != 0)
  {
LABEL_18:
    self->_tfoSynDataAcked = *((_DWORD *)v4 + 27);
    *(_WORD *)&self->_has |= 0x4000u;
  }
LABEL_19:
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_interfaceName hash];
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    uint64_t v5 = 2654435761 * self->_rttCurrent;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
LABEL_3:
      uint64_t v6 = 2654435761 * self->_rttSmoothed;
      if ((*(_WORD *)&self->_has & 0x1000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v6 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_4:
    uint64_t v7 = 2654435761 * self->_rttVariance;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v7 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_5:
    uint64_t v8 = 2654435761 * self->_rttBest;
    if ((has & 0x40) != 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v8 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_6:
    unint64_t v9 = 2654435761u * self->_txPackets;
    if ((has & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  unint64_t v9 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    unint64_t v10 = 2654435761u * self->_txBytes;
    if ((has & 0x80) != 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  unint64_t v10 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_8:
    unint64_t v11 = 2654435761u * self->_txRetransmitBytes;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  unint64_t v11 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_9:
    unint64_t v12 = 2654435761u * self->_txUnacked;
    if ((has & 8) != 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  unint64_t v12 = 0;
  if ((has & 8) != 0)
  {
LABEL_10:
    unint64_t v13 = 2654435761u * self->_rxPackets;
    if (has) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  unint64_t v13 = 0;
  if (has)
  {
LABEL_11:
    unint64_t v14 = 2654435761u * self->_rxBytes;
    if ((has & 2) != 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  unint64_t v14 = 0;
  if ((has & 2) != 0)
  {
LABEL_12:
    unint64_t v15 = 2654435761u * self->_rxDuplicateBytes;
    if ((has & 4) != 0) {
      goto LABEL_13;
    }
    goto LABEL_28;
  }
LABEL_27:
  unint64_t v15 = 0;
  if ((has & 4) != 0)
  {
LABEL_13:
    unint64_t v16 = 2654435761u * self->_rxOooBytes;
    if ((has & 0x10) != 0) {
      goto LABEL_14;
    }
    goto LABEL_29;
  }
LABEL_28:
  unint64_t v16 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_14:
    unint64_t v17 = 2654435761u * self->_sndBandwidth;
    if ((*(_WORD *)&self->_has & 0x2000) != 0) {
      goto LABEL_15;
    }
LABEL_30:
    uint64_t v18 = 0;
    if ((*(_WORD *)&self->_has & 0x4000) != 0) {
      goto LABEL_16;
    }
LABEL_31:
    uint64_t v19 = 0;
    return v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
  }
LABEL_29:
  unint64_t v17 = 0;
  if ((*(_WORD *)&self->_has & 0x2000) == 0) {
    goto LABEL_30;
  }
LABEL_15:
  uint64_t v18 = 2654435761 * self->_synRetransmits;
  if ((*(_WORD *)&self->_has & 0x4000) == 0) {
    goto LABEL_31;
  }
LABEL_16:
  uint64_t v19 = 2654435761 * self->_tfoSynDataAcked;
  return v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_79;
  }
  interfaceName = self->_interfaceName;
  if ((unint64_t)interfaceName | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](interfaceName, "isEqual:")) {
      goto LABEL_79;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v7 = *((_WORD *)v4 + 56);
  if ((has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 56) & 0x400) == 0 || self->_rttCurrent != *((_DWORD *)v4 + 23)) {
      goto LABEL_79;
    }
  }
  else if ((*((_WORD *)v4 + 56) & 0x400) != 0)
  {
LABEL_79:
    BOOL v8 = 0;
    goto LABEL_80;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 56) & 0x800) == 0 || self->_rttSmoothed != *((_DWORD *)v4 + 24)) {
      goto LABEL_79;
    }
  }
  else if ((*((_WORD *)v4 + 56) & 0x800) != 0)
  {
    goto LABEL_79;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 56) & 0x1000) == 0 || self->_rttVariance != *((_DWORD *)v4 + 25)) {
      goto LABEL_79;
    }
  }
  else if ((*((_WORD *)v4 + 56) & 0x1000) != 0)
  {
    goto LABEL_79;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 56) & 0x200) == 0 || self->_rttBest != *((_DWORD *)v4 + 22)) {
      goto LABEL_79;
    }
  }
  else if ((*((_WORD *)v4 + 56) & 0x200) != 0)
  {
    goto LABEL_79;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_txPackets != *((void *)v4 + 7)) {
      goto LABEL_79;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_79;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_txBytes != *((void *)v4 + 6)) {
      goto LABEL_79;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_79;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_txRetransmitBytes != *((void *)v4 + 8)) {
      goto LABEL_79;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_79;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 56) & 0x100) == 0 || self->_txUnacked != *((void *)v4 + 9)) {
      goto LABEL_79;
    }
  }
  else if ((*((_WORD *)v4 + 56) & 0x100) != 0)
  {
    goto LABEL_79;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_rxPackets != *((void *)v4 + 4)) {
      goto LABEL_79;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_79;
  }
  if (has)
  {
    if ((v7 & 1) == 0 || self->_rxBytes != *((void *)v4 + 1)) {
      goto LABEL_79;
    }
  }
  else if (v7)
  {
    goto LABEL_79;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_rxDuplicateBytes != *((void *)v4 + 2)) {
      goto LABEL_79;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_79;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_rxOooBytes != *((void *)v4 + 3)) {
      goto LABEL_79;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_79;
  }
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_sndBandwidth != *((void *)v4 + 5)) {
      goto LABEL_79;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_79;
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 56) & 0x2000) == 0 || self->_synRetransmits != *((_DWORD *)v4 + 26)) {
      goto LABEL_79;
    }
  }
  else if ((*((_WORD *)v4 + 56) & 0x2000) != 0)
  {
    goto LABEL_79;
  }
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    if ((*((_WORD *)v4 + 56) & 0x4000) == 0 || self->_tfoSynDataAcked != *((_DWORD *)v4 + 27)) {
      goto LABEL_79;
    }
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = (v7 & 0x4000) == 0;
  }
LABEL_80:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_interfaceName copyWithZone:a3];
  __int16 v7 = (void *)v5[10];
  v5[10] = v6;

  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    *((_DWORD *)v5 + 23) = self->_rttCurrent;
    *((_WORD *)v5 + 56) |= 0x400u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_3:
      if ((has & 0x1000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 24) = self->_rttSmoothed;
  *((_WORD *)v5 + 56) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)v5 + 25) = self->_rttVariance;
  *((_WORD *)v5 + 56) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v5 + 22) = self->_rttBest;
  *((_WORD *)v5 + 56) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  v5[7] = self->_txPackets;
  *((_WORD *)v5 + 56) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  v5[6] = self->_txBytes;
  *((_WORD *)v5 + 56) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  v5[8] = self->_txRetransmitBytes;
  *((_WORD *)v5 + 56) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_9:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_25:
  v5[9] = self->_txUnacked;
  *((_WORD *)v5 + 56) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_27;
  }
LABEL_26:
  v5[4] = self->_rxPackets;
  *((_WORD *)v5 + 56) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_11:
    if ((has & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_28;
  }
LABEL_27:
  v5[1] = self->_rxBytes;
  *((_WORD *)v5 + 56) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_29;
  }
LABEL_28:
  v5[2] = self->_rxDuplicateBytes;
  *((_WORD *)v5 + 56) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_13:
    if ((has & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_30;
  }
LABEL_29:
  v5[3] = self->_rxOooBytes;
  *((_WORD *)v5 + 56) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_14:
    if ((has & 0x2000) == 0) {
      goto LABEL_15;
    }
LABEL_31:
    *((_DWORD *)v5 + 26) = self->_synRetransmits;
    *((_WORD *)v5 + 56) |= 0x2000u;
    if ((*(_WORD *)&self->_has & 0x4000) == 0) {
      return v5;
    }
    goto LABEL_16;
  }
LABEL_30:
  v5[5] = self->_sndBandwidth;
  *((_WORD *)v5 + 56) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) != 0) {
    goto LABEL_31;
  }
LABEL_15:
  if ((has & 0x4000) != 0)
  {
LABEL_16:
    *((_DWORD *)v5 + 27) = self->_tfoSynDataAcked;
    *((_WORD *)v5 + 56) |= 0x4000u;
  }
  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_interfaceName)
  {
    id v6 = v4;
    objc_msgSend(v4, "setInterfaceName:");
    id v4 = v6;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    *((_DWORD *)v4 + 23) = self->_rttCurrent;
    *((_WORD *)v4 + 56) |= 0x400u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_5:
      if ((has & 0x1000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_24;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v4 + 24) = self->_rttSmoothed;
  *((_WORD *)v4 + 56) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v4 + 25) = self->_rttVariance;
  *((_WORD *)v4 + 56) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)v4 + 22) = self->_rttBest;
  *((_WORD *)v4 + 56) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((void *)v4 + 7) = self->_txPackets;
  *((_WORD *)v4 + 56) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((void *)v4 + 6) = self->_txBytes;
  *((_WORD *)v4 + 56) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((void *)v4 + 8) = self->_txRetransmitBytes;
  *((_WORD *)v4 + 56) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((void *)v4 + 9) = self->_txUnacked;
  *((_WORD *)v4 + 56) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_12:
    if ((has & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((void *)v4 + 4) = self->_rxPackets;
  *((_WORD *)v4 + 56) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_13:
    if ((has & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((void *)v4 + 1) = self->_rxBytes;
  *((_WORD *)v4 + 56) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_14:
    if ((has & 4) == 0) {
      goto LABEL_15;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((void *)v4 + 2) = self->_rxDuplicateBytes;
  *((_WORD *)v4 + 56) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_15:
    if ((has & 0x10) == 0) {
      goto LABEL_16;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((void *)v4 + 3) = self->_rxOooBytes;
  *((_WORD *)v4 + 56) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_16:
    if ((has & 0x2000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((void *)v4 + 5) = self->_sndBandwidth;
  *((_WORD *)v4 + 56) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_17:
    if ((has & 0x4000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_35:
  *((_DWORD *)v4 + 26) = self->_synRetransmits;
  *((_WORD *)v4 + 56) |= 0x2000u;
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
LABEL_18:
    *((_DWORD *)v4 + 27) = self->_tfoSynDataAcked;
    *((_WORD *)v4 + 56) |= 0x4000u;
  }
LABEL_19:
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_interfaceName)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    __int16 has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_5:
      if ((has & 0x1000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_24;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint64Field();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint64Field();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint64Field();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint64Field();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_12:
    if ((has & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint64Field();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_13:
    if ((has & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint64Field();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_14:
    if ((has & 4) == 0) {
      goto LABEL_15;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint64Field();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_15:
    if ((has & 0x10) == 0) {
      goto LABEL_16;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint64Field();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_16:
    if ((has & 0x2000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint64Field();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_17:
    if ((has & 0x4000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_35:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
LABEL_18:
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
LABEL_19:
}

- (BOOL)readFrom:(id)a3
{
  return sub_10007270C((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  interfaceName = self->_interfaceName;
  if (interfaceName) {
    [v3 setObject:interfaceName forKey:@"interface_name"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    unint64_t v9 = +[NSNumber numberWithUnsignedInt:self->_rttCurrent];
    [v4 setObject:v9 forKey:@"rtt_current"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_5:
      if ((has & 0x1000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_24;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_5;
  }
  unint64_t v10 = +[NSNumber numberWithUnsignedInt:self->_rttSmoothed];
  [v4 setObject:v10 forKey:@"rtt_smoothed"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_25;
  }
LABEL_24:
  unint64_t v11 = +[NSNumber numberWithUnsignedInt:self->_rttVariance];
  [v4 setObject:v11 forKey:@"rtt_variance"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_26;
  }
LABEL_25:
  unint64_t v12 = +[NSNumber numberWithUnsignedInt:self->_rttBest];
  [v4 setObject:v12 forKey:@"rtt_best"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_27;
  }
LABEL_26:
  unint64_t v13 = +[NSNumber numberWithUnsignedLongLong:self->_txPackets];
  [v4 setObject:v13 forKey:@"tx_packets"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_28;
  }
LABEL_27:
  unint64_t v14 = +[NSNumber numberWithUnsignedLongLong:self->_txBytes];
  [v4 setObject:v14 forKey:@"tx_bytes"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }
LABEL_28:
  unint64_t v15 = +[NSNumber numberWithUnsignedLongLong:self->_txRetransmitBytes];
  [v4 setObject:v15 forKey:@"tx_retransmit_bytes"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_30;
  }
LABEL_29:
  unint64_t v16 = +[NSNumber numberWithUnsignedLongLong:self->_txUnacked];
  [v4 setObject:v16 forKey:@"tx_unacked"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_12:
    if ((has & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_31;
  }
LABEL_30:
  unint64_t v17 = +[NSNumber numberWithUnsignedLongLong:self->_rxPackets];
  [v4 setObject:v17 forKey:@"rx_packets"];

  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_13:
    if ((has & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_32;
  }
LABEL_31:
  uint64_t v18 = +[NSNumber numberWithUnsignedLongLong:self->_rxBytes];
  [v4 setObject:v18 forKey:@"rx_bytes"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_14:
    if ((has & 4) == 0) {
      goto LABEL_15;
    }
    goto LABEL_33;
  }
LABEL_32:
  uint64_t v19 = +[NSNumber numberWithUnsignedLongLong:self->_rxDuplicateBytes];
  [v4 setObject:v19 forKey:@"rx_duplicate_bytes"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_15:
    if ((has & 0x10) == 0) {
      goto LABEL_16;
    }
    goto LABEL_34;
  }
LABEL_33:
  v20 = +[NSNumber numberWithUnsignedLongLong:self->_rxOooBytes];
  [v4 setObject:v20 forKey:@"rx_ooo_bytes"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_16:
    if ((has & 0x2000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_35;
  }
LABEL_34:
  v21 = +[NSNumber numberWithUnsignedLongLong:self->_sndBandwidth];
  [v4 setObject:v21 forKey:@"snd_bandwidth"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_17:
    if ((has & 0x4000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_35:
  v22 = +[NSNumber numberWithUnsignedInt:self->_synRetransmits];
  [v4 setObject:v22 forKey:@"syn_retransmits"];

  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
LABEL_18:
    __int16 v7 = +[NSNumber numberWithUnsignedInt:self->_tfoSynDataAcked];
    [v4 setObject:v7 forKey:@"tfo_syn_data_acked"];
  }
LABEL_19:
  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)_ADPBProxyTCPInfoMetrics;
  NSUInteger v3 = [(_ADPBProxyTCPInfoMetrics *)&v7 description];
  id v4 = [(_ADPBProxyTCPInfoMetrics *)self dictionaryRepresentation];
  uint64_t v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasTfoSynDataAcked
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setHasTfoSynDataAcked:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (void)setTfoSynDataAcked:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_tfoSynDataAcked = a3;
}

- (BOOL)hasSynRetransmits
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setHasSynRetransmits:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (void)setSynRetransmits:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_synRetransmits = a3;
}

- (BOOL)hasSndBandwidth
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasSndBandwidth:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)setSndBandwidth:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_sndBandwidth = a3;
}

- (BOOL)hasRxOooBytes
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasRxOooBytes:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)setRxOooBytes:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_rxOooBytes = a3;
}

- (BOOL)hasRxDuplicateBytes
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasRxDuplicateBytes:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)setRxDuplicateBytes:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_rxDuplicateBytes = a3;
}

- (BOOL)hasRxBytes
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasRxBytes:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)setRxBytes:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_rxBytes = a3;
}

- (BOOL)hasRxPackets
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasRxPackets:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)setRxPackets:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_rxPackets = a3;
}

- (BOOL)hasTxUnacked
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasTxUnacked:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)setTxUnacked:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_txUnacked = a3;
}

- (BOOL)hasTxRetransmitBytes
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasTxRetransmitBytes:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)setTxRetransmitBytes:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_txRetransmitBytes = a3;
}

- (BOOL)hasTxBytes
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasTxBytes:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)setTxBytes:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_txBytes = a3;
}

- (BOOL)hasTxPackets
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasTxPackets:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)setTxPackets:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_txPackets = a3;
}

- (BOOL)hasRttBest
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasRttBest:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (void)setRttBest:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_rttBest = a3;
}

- (BOOL)hasRttVariance
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setHasRttVariance:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (void)setRttVariance:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_rttVariance = a3;
}

- (BOOL)hasRttSmoothed
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setHasRttSmoothed:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (void)setRttSmoothed:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_rttSmoothed = a3;
}

- (BOOL)hasRttCurrent
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setHasRttCurrent:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (void)setRttCurrent:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_rttCurrent = a3;
}

- (BOOL)hasInterfaceName
{
  return self->_interfaceName != 0;
}

@end