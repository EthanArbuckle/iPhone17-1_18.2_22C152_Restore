@interface AudioQuality
- (BOOL)hasNumEnqdSilencePkt;
- (BOOL)hasNumEnqdSpeechPkt;
- (BOOL)hasNumLostPkt;
- (BOOL)hasNumMissedSpeechPkt;
- (BOOL)hasNumPlayedSpeechPkt;
- (BOOL)hasNumRecvdSilencePkt;
- (BOOL)hasNumRecvdSpeechPkt;
- (BOOL)hasNumSpeechQempty;
- (BOOL)hasNumUflwSilencePkt;
- (BOOL)hasNumUflwSpeechPkt;
- (BOOL)hasRecordType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)recordType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)delayCntsCount;
- (unint64_t)hash;
- (unsigned)delayCntAtIndex:(unint64_t)a3;
- (unsigned)delayCnts;
- (unsigned)numEnqdSilencePkt;
- (unsigned)numEnqdSpeechPkt;
- (unsigned)numLostPkt;
- (unsigned)numMissedSpeechPkt;
- (unsigned)numPlayedSpeechPkt;
- (unsigned)numRecvdSilencePkt;
- (unsigned)numRecvdSpeechPkt;
- (unsigned)numSpeechQempty;
- (unsigned)numUflwSilencePkt;
- (unsigned)numUflwSpeechPkt;
- (void)addDelayCnt:(unsigned int)a3;
- (void)clearDelayCnts;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setDelayCnts:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setHasNumEnqdSilencePkt:(BOOL)a3;
- (void)setHasNumEnqdSpeechPkt:(BOOL)a3;
- (void)setHasNumLostPkt:(BOOL)a3;
- (void)setHasNumMissedSpeechPkt:(BOOL)a3;
- (void)setHasNumPlayedSpeechPkt:(BOOL)a3;
- (void)setHasNumRecvdSilencePkt:(BOOL)a3;
- (void)setHasNumRecvdSpeechPkt:(BOOL)a3;
- (void)setHasNumSpeechQempty:(BOOL)a3;
- (void)setHasNumUflwSilencePkt:(BOOL)a3;
- (void)setHasNumUflwSpeechPkt:(BOOL)a3;
- (void)setNumEnqdSilencePkt:(unsigned int)a3;
- (void)setNumEnqdSpeechPkt:(unsigned int)a3;
- (void)setNumLostPkt:(unsigned int)a3;
- (void)setNumMissedSpeechPkt:(unsigned int)a3;
- (void)setNumPlayedSpeechPkt:(unsigned int)a3;
- (void)setNumRecvdSilencePkt:(unsigned int)a3;
- (void)setNumRecvdSpeechPkt:(unsigned int)a3;
- (void)setNumSpeechQempty:(unsigned int)a3;
- (void)setNumUflwSilencePkt:(unsigned int)a3;
- (void)setNumUflwSpeechPkt:(unsigned int)a3;
- (void)setRecordType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AudioQuality

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AudioQuality;
  [(AudioQuality *)&v3 dealloc];
}

- (BOOL)hasRecordType
{
  return self->_recordType != 0;
}

- (void)setNumRecvdSpeechPkt:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_numRecvdSpeechPkt = a3;
}

- (void)setHasNumRecvdSpeechPkt:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasNumRecvdSpeechPkt
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setNumRecvdSilencePkt:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_numRecvdSilencePkt = a3;
}

- (void)setHasNumRecvdSilencePkt:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasNumRecvdSilencePkt
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setNumLostPkt:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_numLostPkt = a3;
}

- (void)setHasNumLostPkt:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasNumLostPkt
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setNumUflwSpeechPkt:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_numUflwSpeechPkt = a3;
}

- (void)setHasNumUflwSpeechPkt:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasNumUflwSpeechPkt
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setNumUflwSilencePkt:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_numUflwSilencePkt = a3;
}

- (void)setHasNumUflwSilencePkt:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasNumUflwSilencePkt
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setNumEnqdSpeechPkt:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_numEnqdSpeechPkt = a3;
}

- (void)setHasNumEnqdSpeechPkt:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasNumEnqdSpeechPkt
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setNumEnqdSilencePkt:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_numEnqdSilencePkt = a3;
}

- (void)setHasNumEnqdSilencePkt:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasNumEnqdSilencePkt
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setNumPlayedSpeechPkt:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_numPlayedSpeechPkt = a3;
}

- (void)setHasNumPlayedSpeechPkt:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasNumPlayedSpeechPkt
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setNumMissedSpeechPkt:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_numMissedSpeechPkt = a3;
}

- (void)setHasNumMissedSpeechPkt:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasNumMissedSpeechPkt
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setNumSpeechQempty:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_numSpeechQempty = a3;
}

- (void)setHasNumSpeechQempty:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasNumSpeechQempty
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (unint64_t)delayCntsCount
{
  return self->_delayCnts.count;
}

- (unsigned)delayCnts
{
  return self->_delayCnts.list;
}

- (void)clearDelayCnts
{
}

- (void)addDelayCnt:(unsigned int)a3
{
}

- (unsigned)delayCntAtIndex:(unint64_t)a3
{
  p_delayCnts = &self->_delayCnts;
  unint64_t count = self->_delayCnts.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_delayCnts->list[a3];
}

- (void)setDelayCnts:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)AudioQuality;
  __int16 v3 = [(AudioQuality *)&v7 description];
  v4 = [(AudioQuality *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  recordType = self->_recordType;
  if (recordType) {
    [v3 setObject:recordType forKey:@"record_type"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    v10 = +[NSNumber numberWithUnsignedInt:self->_numRecvdSpeechPkt];
    [v4 setObject:v10 forKey:@"num_recvd_speech_pkt"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_19;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_5;
  }
  v11 = +[NSNumber numberWithUnsignedInt:self->_numRecvdSilencePkt];
  [v4 setObject:v11 forKey:@"num_recvd_silence_pkt"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  v12 = +[NSNumber numberWithUnsignedInt:self->_numLostPkt];
  [v4 setObject:v12 forKey:@"num_lost_pkt"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  v13 = +[NSNumber numberWithUnsignedInt:self->_numUflwSpeechPkt];
  [v4 setObject:v13 forKey:@"num_uflw_speech_pkt"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  v14 = +[NSNumber numberWithUnsignedInt:self->_numUflwSilencePkt];
  [v4 setObject:v14 forKey:@"num_uflw_silence_pkt"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  v15 = +[NSNumber numberWithUnsignedInt:self->_numEnqdSpeechPkt];
  [v4 setObject:v15 forKey:@"num_enqd_speech_pkt"];

  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  v16 = +[NSNumber numberWithUnsignedInt:self->_numEnqdSilencePkt];
  [v4 setObject:v16 forKey:@"num_enqd_silence_pkt"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_11:
    if ((has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_25;
  }
LABEL_24:
  v17 = +[NSNumber numberWithUnsignedInt:self->_numPlayedSpeechPkt];
  [v4 setObject:v17 forKey:@"num_played_speech_pkt"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_12:
    if ((has & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_25:
  v18 = +[NSNumber numberWithUnsignedInt:self->_numMissedSpeechPkt];
  [v4 setObject:v18 forKey:@"num_missed_speech_pkt"];

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_13:
    objc_super v7 = +[NSNumber numberWithUnsignedInt:self->_numSpeechQempty];
    [v4 setObject:v7 forKey:@"num_speech_qempty"];
  }
LABEL_14:
  v8 = PBRepeatedUInt32NSArray();
  [v4 setObject:v8 forKey:@"delay_cnt"];

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000B0228((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (self->_recordType)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v8;
    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_22;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  id v4 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  id v4 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  id v4 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  id v4 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  id v4 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_11:
    if ((has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  id v4 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_12:
    if ((has & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  id v4 = v8;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_13:
    PBDataWriterWriteUint32Field();
    id v4 = v8;
  }
LABEL_14:
  p_delayCnts = &self->_delayCnts;
  if (p_delayCnts->count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v8;
      ++v7;
    }
    while (v7 < p_delayCnts->count);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (self->_recordType)
  {
    [v4 setRecordType:];
    id v4 = v9;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    *((_DWORD *)v4 + 14) = self->_numRecvdSpeechPkt;
    *((_WORD *)v4 + 40) |= 0x40u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_23;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v4 + 13) = self->_numRecvdSilencePkt;
  *((_WORD *)v4 + 40) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)v4 + 10) = self->_numLostPkt;
  *((_WORD *)v4 + 40) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v4 + 17) = self->_numUflwSpeechPkt;
  *((_WORD *)v4 + 40) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)v4 + 16) = self->_numUflwSilencePkt;
  *((_WORD *)v4 + 40) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)v4 + 9) = self->_numEnqdSpeechPkt;
  *((_WORD *)v4 + 40) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)v4 + 8) = self->_numEnqdSilencePkt;
  *((_WORD *)v4 + 40) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_11:
    if ((has & 8) == 0) {
      goto LABEL_12;
    }
LABEL_29:
    *((_DWORD *)v4 + 11) = self->_numMissedSpeechPkt;
    *((_WORD *)v4 + 40) |= 8u;
    if ((*(_WORD *)&self->_has & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_28:
  *((_DWORD *)v4 + 12) = self->_numPlayedSpeechPkt;
  *((_WORD *)v4 + 40) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_29;
  }
LABEL_12:
  if ((has & 0x80) != 0)
  {
LABEL_13:
    *((_DWORD *)v4 + 15) = self->_numSpeechQempty;
    *((_WORD *)v4 + 40) |= 0x80u;
  }
LABEL_14:
  if ([(AudioQuality *)self delayCntsCount])
  {
    [v9 clearDelayCnts];
    unint64_t v6 = [(AudioQuality *)self delayCntsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [v9 addDelayCnt:[self delayCntAtIndex:i]];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSString *)self->_recordType copyWithZone:a3];
  unint64_t v7 = (void *)v5[9];
  v5[9] = v6;

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    *((_DWORD *)v5 + 14) = self->_numRecvdSpeechPkt;
    *((_WORD *)v5 + 40) |= 0x40u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 13) = self->_numRecvdSilencePkt;
  *((_WORD *)v5 + 40) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)v5 + 10) = self->_numLostPkt;
  *((_WORD *)v5 + 40) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)v5 + 17) = self->_numUflwSpeechPkt;
  *((_WORD *)v5 + 40) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)v5 + 16) = self->_numUflwSilencePkt;
  *((_WORD *)v5 + 40) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)v5 + 9) = self->_numEnqdSpeechPkt;
  *((_WORD *)v5 + 40) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)v5 + 8) = self->_numEnqdSilencePkt;
  *((_WORD *)v5 + 40) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
LABEL_21:
    *((_DWORD *)v5 + 11) = self->_numMissedSpeechPkt;
    *((_WORD *)v5 + 40) |= 8u;
    if ((*(_WORD *)&self->_has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_20:
  *((_DWORD *)v5 + 12) = self->_numPlayedSpeechPkt;
  *((_WORD *)v5 + 40) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_21;
  }
LABEL_10:
  if ((has & 0x80) != 0)
  {
LABEL_11:
    *((_DWORD *)v5 + 15) = self->_numSpeechQempty;
    *((_WORD *)v5 + 40) |= 0x80u;
  }
LABEL_12:
  PBRepeatedUInt32Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_55;
  }
  recordType = self->_recordType;
  if ((unint64_t)recordType | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](recordType, "isEqual:")) {
      goto LABEL_55;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v7 = *((_WORD *)v4 + 40);
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_numRecvdSpeechPkt != *((_DWORD *)v4 + 14)) {
      goto LABEL_55;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
LABEL_55:
    char IsEqual = 0;
    goto LABEL_56;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_numRecvdSilencePkt != *((_DWORD *)v4 + 13)) {
      goto LABEL_55;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_55;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_numLostPkt != *((_DWORD *)v4 + 10)) {
      goto LABEL_55;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_55;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 40) & 0x200) == 0 || self->_numUflwSpeechPkt != *((_DWORD *)v4 + 17)) {
      goto LABEL_55;
    }
  }
  else if ((*((_WORD *)v4 + 40) & 0x200) != 0)
  {
    goto LABEL_55;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 40) & 0x100) == 0 || self->_numUflwSilencePkt != *((_DWORD *)v4 + 16)) {
      goto LABEL_55;
    }
  }
  else if ((*((_WORD *)v4 + 40) & 0x100) != 0)
  {
    goto LABEL_55;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_numEnqdSpeechPkt != *((_DWORD *)v4 + 9)) {
      goto LABEL_55;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_55;
  }
  if (has)
  {
    if ((v7 & 1) == 0 || self->_numEnqdSilencePkt != *((_DWORD *)v4 + 8)) {
      goto LABEL_55;
    }
  }
  else if (v7)
  {
    goto LABEL_55;
  }
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_numPlayedSpeechPkt != *((_DWORD *)v4 + 12)) {
      goto LABEL_55;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_55;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_numMissedSpeechPkt != *((_DWORD *)v4 + 11)) {
      goto LABEL_55;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_55;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_numSpeechQempty != *((_DWORD *)v4 + 15)) {
      goto LABEL_55;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_55;
  }
  char IsEqual = PBRepeatedUInt32IsEqual();
LABEL_56:

  return IsEqual;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_recordType hash];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    uint64_t v5 = 2654435761 * self->_numRecvdSpeechPkt;
    if ((has & 0x20) != 0)
    {
LABEL_3:
      uint64_t v6 = 2654435761 * self->_numRecvdSilencePkt;
      if ((has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((has & 0x20) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v6 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    uint64_t v7 = 2654435761 * self->_numLostPkt;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v7 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_5:
    uint64_t v8 = 2654435761 * self->_numUflwSpeechPkt;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v8 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_6:
    uint64_t v9 = 2654435761 * self->_numUflwSilencePkt;
    if ((has & 2) != 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v9 = 0;
  if ((has & 2) != 0)
  {
LABEL_7:
    uint64_t v10 = 2654435761 * self->_numEnqdSpeechPkt;
    if (has) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v10 = 0;
  if (has)
  {
LABEL_8:
    uint64_t v11 = 2654435761 * self->_numEnqdSilencePkt;
    if ((has & 0x10) != 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v11 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_9:
    uint64_t v12 = 2654435761 * self->_numPlayedSpeechPkt;
    if ((has & 8) != 0) {
      goto LABEL_10;
    }
LABEL_20:
    uint64_t v13 = 0;
    if ((has & 0x80) != 0) {
      goto LABEL_11;
    }
LABEL_21:
    uint64_t v14 = 0;
    return v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ PBRepeatedUInt32Hash();
  }
LABEL_19:
  uint64_t v12 = 0;
  if ((has & 8) == 0) {
    goto LABEL_20;
  }
LABEL_10:
  uint64_t v13 = 2654435761 * self->_numMissedSpeechPkt;
  if ((has & 0x80) == 0) {
    goto LABEL_21;
  }
LABEL_11:
  uint64_t v14 = 2654435761 * self->_numSpeechQempty;
  return v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ PBRepeatedUInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  id v4 = (unsigned int *)a3;
  uint64_t v9 = v4;
  if (*((void *)v4 + 9))
  {
    -[AudioQuality setRecordType:](self, "setRecordType:");
    id v4 = v9;
  }
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x40) != 0)
  {
    self->_numRecvdSpeechPkt = v4[14];
    *(_WORD *)&self->_has |= 0x40u;
    __int16 v5 = *((_WORD *)v4 + 40);
    if ((v5 & 0x20) == 0)
    {
LABEL_5:
      if ((v5 & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_22;
    }
  }
  else if ((v5 & 0x20) == 0)
  {
    goto LABEL_5;
  }
  self->_numRecvdSilencePkt = v4[13];
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v5 & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_numLostPkt = v4[10];
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x200) == 0)
  {
LABEL_7:
    if ((v5 & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_numUflwSpeechPkt = v4[17];
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x100) == 0)
  {
LABEL_8:
    if ((v5 & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_numUflwSilencePkt = v4[16];
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 2) == 0)
  {
LABEL_9:
    if ((v5 & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_numEnqdSpeechPkt = v4[9];
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 1) == 0)
  {
LABEL_10:
    if ((v5 & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_numEnqdSilencePkt = v4[8];
  *(_WORD *)&self->_has |= 1u;
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x10) == 0)
  {
LABEL_11:
    if ((v5 & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_numPlayedSpeechPkt = v4[12];
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 8) == 0)
  {
LABEL_12:
    if ((v5 & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_28:
  self->_numMissedSpeechPkt = v4[11];
  *(_WORD *)&self->_has |= 8u;
  if ((v4[20] & 0x80) != 0)
  {
LABEL_13:
    self->_numSpeechQempty = v4[15];
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_14:
  uint64_t v6 = (char *)[v4 delayCntsCount];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
      -[AudioQuality addDelayCnt:](self, "addDelayCnt:", [v9 delayCntAtIndex:i]);
  }
}

- (NSString)recordType
{
  return self->_recordType;
}

- (void)setRecordType:(id)a3
{
}

- (unsigned)numRecvdSpeechPkt
{
  return self->_numRecvdSpeechPkt;
}

- (unsigned)numRecvdSilencePkt
{
  return self->_numRecvdSilencePkt;
}

- (unsigned)numLostPkt
{
  return self->_numLostPkt;
}

- (unsigned)numUflwSpeechPkt
{
  return self->_numUflwSpeechPkt;
}

- (unsigned)numUflwSilencePkt
{
  return self->_numUflwSilencePkt;
}

- (unsigned)numEnqdSpeechPkt
{
  return self->_numEnqdSpeechPkt;
}

- (unsigned)numEnqdSilencePkt
{
  return self->_numEnqdSilencePkt;
}

- (unsigned)numPlayedSpeechPkt
{
  return self->_numPlayedSpeechPkt;
}

- (unsigned)numMissedSpeechPkt
{
  return self->_numMissedSpeechPkt;
}

- (unsigned)numSpeechQempty
{
  return self->_numSpeechQempty;
}

- (void).cxx_destruct
{
}

@end