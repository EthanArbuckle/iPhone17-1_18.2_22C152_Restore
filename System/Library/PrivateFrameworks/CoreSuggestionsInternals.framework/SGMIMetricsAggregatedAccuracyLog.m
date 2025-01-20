@interface SGMIMetricsAggregatedAccuracyLog
- (BOOL)hasIgnorablePredictedAsIgnorable;
- (BOOL)hasIgnorablePredictedAsNeutral;
- (BOOL)hasIgnorablePredictedAsSalient;
- (BOOL)hasNeutralPredictedAsIgnorable;
- (BOOL)hasNeutralPredictedAsNeutral;
- (BOOL)hasNeutralPredictedAsSalient;
- (BOOL)hasSalientPredictedAsIgnorable;
- (BOOL)hasSalientPredictedAsNeutral;
- (BOOL)hasSalientPredictedAsSalient;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)ignorablePredictedAsIgnorable;
- (unsigned)ignorablePredictedAsNeutral;
- (unsigned)ignorablePredictedAsSalient;
- (unsigned)neutralPredictedAsIgnorable;
- (unsigned)neutralPredictedAsNeutral;
- (unsigned)neutralPredictedAsSalient;
- (unsigned)salientPredictedAsIgnorable;
- (unsigned)salientPredictedAsNeutral;
- (unsigned)salientPredictedAsSalient;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIgnorablePredictedAsIgnorable:(BOOL)a3;
- (void)setHasIgnorablePredictedAsNeutral:(BOOL)a3;
- (void)setHasIgnorablePredictedAsSalient:(BOOL)a3;
- (void)setHasNeutralPredictedAsIgnorable:(BOOL)a3;
- (void)setHasNeutralPredictedAsNeutral:(BOOL)a3;
- (void)setHasNeutralPredictedAsSalient:(BOOL)a3;
- (void)setHasSalientPredictedAsIgnorable:(BOOL)a3;
- (void)setHasSalientPredictedAsNeutral:(BOOL)a3;
- (void)setHasSalientPredictedAsSalient:(BOOL)a3;
- (void)setIgnorablePredictedAsIgnorable:(unsigned int)a3;
- (void)setIgnorablePredictedAsNeutral:(unsigned int)a3;
- (void)setIgnorablePredictedAsSalient:(unsigned int)a3;
- (void)setNeutralPredictedAsIgnorable:(unsigned int)a3;
- (void)setNeutralPredictedAsNeutral:(unsigned int)a3;
- (void)setNeutralPredictedAsSalient:(unsigned int)a3;
- (void)setSalientPredictedAsIgnorable:(unsigned int)a3;
- (void)setSalientPredictedAsNeutral:(unsigned int)a3;
- (void)setSalientPredictedAsSalient:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SGMIMetricsAggregatedAccuracyLog

- (unsigned)ignorablePredictedAsIgnorable
{
  return self->_ignorablePredictedAsIgnorable;
}

- (unsigned)ignorablePredictedAsNeutral
{
  return self->_ignorablePredictedAsNeutral;
}

- (unsigned)ignorablePredictedAsSalient
{
  return self->_ignorablePredictedAsSalient;
}

- (unsigned)neutralPredictedAsIgnorable
{
  return self->_neutralPredictedAsIgnorable;
}

- (unsigned)neutralPredictedAsNeutral
{
  return self->_neutralPredictedAsNeutral;
}

- (unsigned)neutralPredictedAsSalient
{
  return self->_neutralPredictedAsSalient;
}

- (unsigned)salientPredictedAsIgnorable
{
  return self->_salientPredictedAsIgnorable;
}

- (unsigned)salientPredictedAsNeutral
{
  return self->_salientPredictedAsNeutral;
}

- (unsigned)salientPredictedAsSalient
{
  return self->_salientPredictedAsSalient;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 22);
  if ((v5 & 0x100) != 0)
  {
    self->_salientPredictedAsSalient = *((_DWORD *)v4 + 10);
    *(_WORD *)&self->_has |= 0x100u;
    __int16 v5 = *((_WORD *)v4 + 22);
    if ((v5 & 0x80) == 0)
    {
LABEL_3:
      if ((v5 & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((v5 & 0x80) == 0)
  {
    goto LABEL_3;
  }
  self->_salientPredictedAsNeutral = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)v4 + 22);
  if ((v5 & 0x40) == 0)
  {
LABEL_4:
    if ((v5 & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_salientPredictedAsIgnorable = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)v4 + 22);
  if ((v5 & 0x20) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_neutralPredictedAsSalient = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 22);
  if ((v5 & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_neutralPredictedAsNeutral = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)v4 + 22);
  if ((v5 & 8) == 0)
  {
LABEL_7:
    if ((v5 & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_neutralPredictedAsIgnorable = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)v4 + 22);
  if ((v5 & 4) == 0)
  {
LABEL_8:
    if ((v5 & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_ignorablePredictedAsSalient = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)v4 + 22);
  if ((v5 & 2) == 0)
  {
LABEL_9:
    if ((v5 & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_21:
  self->_ignorablePredictedAsNeutral = *((_DWORD *)v4 + 3);
  *(_WORD *)&self->_has |= 2u;
  if (*((_WORD *)v4 + 22))
  {
LABEL_10:
    self->_ignorablePredictedAsIgnorable = *((_DWORD *)v4 + 2);
    *(_WORD *)&self->_has |= 1u;
  }
LABEL_11:
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    uint64_t v3 = 2654435761 * self->_salientPredictedAsSalient;
    if ((has & 0x80) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_salientPredictedAsNeutral;
      if ((has & 0x40) != 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((has & 0x80) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_salientPredictedAsIgnorable;
    if ((has & 0x20) != 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v5 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_neutralPredictedAsSalient;
    if ((has & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v6 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_neutralPredictedAsNeutral;
    if ((has & 8) != 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v7 = 0;
  if ((has & 8) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_neutralPredictedAsIgnorable;
    if ((has & 4) != 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v8 = 0;
  if ((has & 4) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_ignorablePredictedAsSalient;
    if ((has & 2) != 0) {
      goto LABEL_9;
    }
LABEL_18:
    uint64_t v10 = 0;
    if (has) {
      goto LABEL_10;
    }
LABEL_19:
    uint64_t v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }
LABEL_17:
  uint64_t v9 = 0;
  if ((has & 2) == 0) {
    goto LABEL_18;
  }
LABEL_9:
  uint64_t v10 = 2654435761 * self->_ignorablePredictedAsNeutral;
  if ((has & 1) == 0) {
    goto LABEL_19;
  }
LABEL_10:
  uint64_t v11 = 2654435761 * self->_ignorablePredictedAsIgnorable;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_47;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 22);
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 22) & 0x100) == 0 || self->_salientPredictedAsSalient != *((_DWORD *)v4 + 10)) {
      goto LABEL_47;
    }
  }
  else if ((*((_WORD *)v4 + 22) & 0x100) != 0)
  {
LABEL_47:
    BOOL v7 = 0;
    goto LABEL_48;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_salientPredictedAsNeutral != *((_DWORD *)v4 + 9)) {
      goto LABEL_47;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_salientPredictedAsIgnorable != *((_DWORD *)v4 + 8)) {
      goto LABEL_47;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_neutralPredictedAsSalient != *((_DWORD *)v4 + 7)) {
      goto LABEL_47;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_neutralPredictedAsNeutral != *((_DWORD *)v4 + 6)) {
      goto LABEL_47;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_neutralPredictedAsIgnorable != *((_DWORD *)v4 + 5)) {
      goto LABEL_47;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_ignorablePredictedAsSalient != *((_DWORD *)v4 + 4)) {
      goto LABEL_47;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_ignorablePredictedAsNeutral != *((_DWORD *)v4 + 3)) {
      goto LABEL_47;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_47;
  }
  if (has)
  {
    if ((v6 & 1) == 0 || self->_ignorablePredictedAsIgnorable != *((_DWORD *)v4 + 2)) {
      goto LABEL_47;
    }
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = (v6 & 1) == 0;
  }
LABEL_48:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *((_DWORD *)result + 10) = self->_salientPredictedAsSalient;
    *((_WORD *)result + 22) |= 0x100u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 9) = self->_salientPredictedAsNeutral;
  *((_WORD *)result + 22) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 8) = self->_salientPredictedAsIgnorable;
  *((_WORD *)result + 22) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)result + 7) = self->_neutralPredictedAsSalient;
  *((_WORD *)result + 22) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)result + 6) = self->_neutralPredictedAsNeutral;
  *((_WORD *)result + 22) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)result + 5) = self->_neutralPredictedAsIgnorable;
  *((_WORD *)result + 22) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)result + 4) = self->_ignorablePredictedAsSalient;
  *((_WORD *)result + 22) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 1) == 0) {
      return result;
    }
    goto LABEL_10;
  }
LABEL_19:
  *((_DWORD *)result + 3) = self->_ignorablePredictedAsNeutral;
  *((_WORD *)result + 22) |= 2u;
  if ((*(_WORD *)&self->_has & 1) == 0) {
    return result;
  }
LABEL_10:
  *((_DWORD *)result + 2) = self->_ignorablePredictedAsIgnorable;
  *((_WORD *)result + 22) |= 1u;
  return result;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    v4[10] = self->_salientPredictedAsSalient;
    *((_WORD *)v4 + 22) |= 0x100u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  v4[9] = self->_salientPredictedAsNeutral;
  *((_WORD *)v4 + 22) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  v4[8] = self->_salientPredictedAsIgnorable;
  *((_WORD *)v4 + 22) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  v4[7] = self->_neutralPredictedAsSalient;
  *((_WORD *)v4 + 22) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  v4[6] = self->_neutralPredictedAsNeutral;
  *((_WORD *)v4 + 22) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  v4[5] = self->_neutralPredictedAsIgnorable;
  *((_WORD *)v4 + 22) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  v4[4] = self->_ignorablePredictedAsSalient;
  *((_WORD *)v4 + 22) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_21:
  v4[3] = self->_ignorablePredictedAsNeutral;
  *((_WORD *)v4 + 22) |= 2u;
  if (*(_WORD *)&self->_has)
  {
LABEL_10:
    v4[2] = self->_ignorablePredictedAsIgnorable;
    *((_WORD *)v4 + 22) |= 1u;
  }
LABEL_11:
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  if (*(_WORD *)&self->_has) {
LABEL_10:
  }
    PBDataWriterWriteUint32Field();
LABEL_11:
}

- (BOOL)readFrom:(id)a3
{
  return SGMIMetricsAggregatedAccuracyLogReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    BOOL v7 = [NSNumber numberWithUnsignedInt:self->_salientPredictedAsSalient];
    [v3 setObject:v7 forKey:@"salientPredictedAsSalient"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  uint64_t v8 = [NSNumber numberWithUnsignedInt:self->_salientPredictedAsNeutral];
  [v3 setObject:v8 forKey:@"salientPredictedAsNeutral"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v9 = [NSNumber numberWithUnsignedInt:self->_salientPredictedAsIgnorable];
  [v3 setObject:v9 forKey:@"salientPredictedAsIgnorable"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v10 = [NSNumber numberWithUnsignedInt:self->_neutralPredictedAsSalient];
  [v3 setObject:v10 forKey:@"neutralPredictedAsSalient"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v11 = [NSNumber numberWithUnsignedInt:self->_neutralPredictedAsNeutral];
  [v3 setObject:v11 forKey:@"neutralPredictedAsNeutral"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  v12 = [NSNumber numberWithUnsignedInt:self->_neutralPredictedAsIgnorable];
  [v3 setObject:v12 forKey:@"neutralPredictedAsIgnorable"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  v13 = [NSNumber numberWithUnsignedInt:self->_ignorablePredictedAsSalient];
  [v3 setObject:v13 forKey:@"ignorablePredictedAsSalient"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_21:
  v14 = [NSNumber numberWithUnsignedInt:self->_ignorablePredictedAsNeutral];
  [v3 setObject:v14 forKey:@"ignorablePredictedAsNeutral"];

  if (*(_WORD *)&self->_has)
  {
LABEL_10:
    id v5 = [NSNumber numberWithUnsignedInt:self->_ignorablePredictedAsIgnorable];
    [v3 setObject:v5 forKey:@"ignorablePredictedAsIgnorable"];
  }
LABEL_11:
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SGMIMetricsAggregatedAccuracyLog;
  id v4 = [(SGMIMetricsAggregatedAccuracyLog *)&v8 description];
  id v5 = [(SGMIMetricsAggregatedAccuracyLog *)self dictionaryRepresentation];
  __int16 v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasIgnorablePredictedAsIgnorable
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasIgnorablePredictedAsIgnorable:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)setIgnorablePredictedAsIgnorable:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_ignorablePredictedAsIgnorable = a3;
}

- (BOOL)hasIgnorablePredictedAsNeutral
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasIgnorablePredictedAsNeutral:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)setIgnorablePredictedAsNeutral:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_ignorablePredictedAsNeutral = a3;
}

- (BOOL)hasIgnorablePredictedAsSalient
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasIgnorablePredictedAsSalient:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)setIgnorablePredictedAsSalient:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_ignorablePredictedAsSalient = a3;
}

- (BOOL)hasNeutralPredictedAsIgnorable
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasNeutralPredictedAsIgnorable:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)setNeutralPredictedAsIgnorable:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_neutralPredictedAsIgnorable = a3;
}

- (BOOL)hasNeutralPredictedAsNeutral
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasNeutralPredictedAsNeutral:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)setNeutralPredictedAsNeutral:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_neutralPredictedAsNeutral = a3;
}

- (BOOL)hasNeutralPredictedAsSalient
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasNeutralPredictedAsSalient:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)setNeutralPredictedAsSalient:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_neutralPredictedAsSalient = a3;
}

- (BOOL)hasSalientPredictedAsIgnorable
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasSalientPredictedAsIgnorable:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)setSalientPredictedAsIgnorable:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_salientPredictedAsIgnorable = a3;
}

- (BOOL)hasSalientPredictedAsNeutral
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasSalientPredictedAsNeutral:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)setSalientPredictedAsNeutral:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_salientPredictedAsNeutral = a3;
}

- (BOOL)hasSalientPredictedAsSalient
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasSalientPredictedAsSalient:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)setSalientPredictedAsSalient:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_salientPredictedAsSalient = a3;
}

@end