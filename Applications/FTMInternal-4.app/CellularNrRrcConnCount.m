@interface CellularNrRrcConnCount
- (BOOL)hasDurationSeconds;
- (BOOL)hasNumSubs;
- (BOOL)hasPlmn;
- (BOOL)hasPsPref;
- (BOOL)hasRrcConnDrbEstComp;
- (BOOL)hasRrcConnReestComp;
- (BOOL)hasRrcConnSetupComp;
- (BOOL)hasRrcResumeComp;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)plmn;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)rrcConnReestReqsCount;
- (unint64_t)rrcConnRejectsCount;
- (unint64_t)rrcConnRelsCount;
- (unint64_t)rrcConnRlfsCount;
- (unint64_t)rrcConnSetupReqsCount;
- (unint64_t)rrcResumeReqsCount;
- (unint64_t)timestamp;
- (unsigned)durationSeconds;
- (unsigned)numSubs;
- (unsigned)psPref;
- (unsigned)rrcConnDrbEstComp;
- (unsigned)rrcConnReestComp;
- (unsigned)rrcConnReestReqAtIndex:(unint64_t)a3;
- (unsigned)rrcConnReestReqs;
- (unsigned)rrcConnRejectAtIndex:(unint64_t)a3;
- (unsigned)rrcConnRejects;
- (unsigned)rrcConnRelAtIndex:(unint64_t)a3;
- (unsigned)rrcConnRels;
- (unsigned)rrcConnRlfAtIndex:(unint64_t)a3;
- (unsigned)rrcConnRlfs;
- (unsigned)rrcConnSetupComp;
- (unsigned)rrcConnSetupReqAtIndex:(unint64_t)a3;
- (unsigned)rrcConnSetupReqs;
- (unsigned)rrcResumeComp;
- (unsigned)rrcResumeReqAtIndex:(unint64_t)a3;
- (unsigned)rrcResumeReqs;
- (unsigned)subsId;
- (void)addRrcConnReestReq:(unsigned int)a3;
- (void)addRrcConnReject:(unsigned int)a3;
- (void)addRrcConnRel:(unsigned int)a3;
- (void)addRrcConnRlf:(unsigned int)a3;
- (void)addRrcConnSetupReq:(unsigned int)a3;
- (void)addRrcResumeReq:(unsigned int)a3;
- (void)clearRrcConnReestReqs;
- (void)clearRrcConnRejects;
- (void)clearRrcConnRels;
- (void)clearRrcConnRlfs;
- (void)clearRrcConnSetupReqs;
- (void)clearRrcResumeReqs;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setDurationSeconds:(unsigned int)a3;
- (void)setHasDurationSeconds:(BOOL)a3;
- (void)setHasNumSubs:(BOOL)a3;
- (void)setHasPsPref:(BOOL)a3;
- (void)setHasRrcConnDrbEstComp:(BOOL)a3;
- (void)setHasRrcConnReestComp:(BOOL)a3;
- (void)setHasRrcConnSetupComp:(BOOL)a3;
- (void)setHasRrcResumeComp:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setNumSubs:(unsigned int)a3;
- (void)setPlmn:(id)a3;
- (void)setPsPref:(unsigned int)a3;
- (void)setRrcConnDrbEstComp:(unsigned int)a3;
- (void)setRrcConnReestComp:(unsigned int)a3;
- (void)setRrcConnReestReqs:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setRrcConnRejects:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setRrcConnRels:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setRrcConnRlfs:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setRrcConnSetupComp:(unsigned int)a3;
- (void)setRrcConnSetupReqs:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setRrcResumeComp:(unsigned int)a3;
- (void)setRrcResumeReqs:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation CellularNrRrcConnCount

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)CellularNrRrcConnCount;
  [(CellularNrRrcConnCount *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setDurationSeconds:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_durationSeconds = a3;
}

- (void)setHasDurationSeconds:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasDurationSeconds
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (unint64_t)rrcConnSetupReqsCount
{
  return self->_rrcConnSetupReqs.count;
}

- (unsigned)rrcConnSetupReqs
{
  return self->_rrcConnSetupReqs.list;
}

- (void)clearRrcConnSetupReqs
{
}

- (void)addRrcConnSetupReq:(unsigned int)a3
{
}

- (unsigned)rrcConnSetupReqAtIndex:(unint64_t)a3
{
  p_rrcConnSetupReqs = &self->_rrcConnSetupReqs;
  unint64_t count = self->_rrcConnSetupReqs.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_rrcConnSetupReqs->list[a3];
}

- (void)setRrcConnSetupReqs:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)setRrcConnSetupComp:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_rrcConnSetupComp = a3;
}

- (void)setHasRrcConnSetupComp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasRrcConnSetupComp
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (unint64_t)rrcConnRejectsCount
{
  return self->_rrcConnRejects.count;
}

- (unsigned)rrcConnRejects
{
  return self->_rrcConnRejects.list;
}

- (void)clearRrcConnRejects
{
}

- (void)addRrcConnReject:(unsigned int)a3
{
}

- (unsigned)rrcConnRejectAtIndex:(unint64_t)a3
{
  p_rrcConnRejects = &self->_rrcConnRejects;
  unint64_t count = self->_rrcConnRejects.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_rrcConnRejects->list[a3];
}

- (void)setRrcConnRejects:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)rrcConnRlfsCount
{
  return self->_rrcConnRlfs.count;
}

- (unsigned)rrcConnRlfs
{
  return self->_rrcConnRlfs.list;
}

- (void)clearRrcConnRlfs
{
}

- (void)addRrcConnRlf:(unsigned int)a3
{
}

- (unsigned)rrcConnRlfAtIndex:(unint64_t)a3
{
  p_rrcConnRlfs = &self->_rrcConnRlfs;
  unint64_t count = self->_rrcConnRlfs.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_rrcConnRlfs->list[a3];
}

- (void)setRrcConnRlfs:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)rrcConnReestReqsCount
{
  return self->_rrcConnReestReqs.count;
}

- (unsigned)rrcConnReestReqs
{
  return self->_rrcConnReestReqs.list;
}

- (void)clearRrcConnReestReqs
{
}

- (void)addRrcConnReestReq:(unsigned int)a3
{
}

- (unsigned)rrcConnReestReqAtIndex:(unint64_t)a3
{
  p_rrcConnReestReqs = &self->_rrcConnReestReqs;
  unint64_t count = self->_rrcConnReestReqs.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_rrcConnReestReqs->list[a3];
}

- (void)setRrcConnReestReqs:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)setRrcConnDrbEstComp:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_rrcConnDrbEstComp = a3;
}

- (void)setHasRrcConnDrbEstComp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasRrcConnDrbEstComp
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (unint64_t)rrcConnRelsCount
{
  return self->_rrcConnRels.count;
}

- (unsigned)rrcConnRels
{
  return self->_rrcConnRels.list;
}

- (void)clearRrcConnRels
{
}

- (void)addRrcConnRel:(unsigned int)a3
{
}

- (unsigned)rrcConnRelAtIndex:(unint64_t)a3
{
  p_rrcConnRels = &self->_rrcConnRels;
  unint64_t count = self->_rrcConnRels.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_rrcConnRels->list[a3];
}

- (void)setRrcConnRels:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)setNumSubs:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasNumSubs
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (BOOL)hasPlmn
{
  return self->_plmn != 0;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSubsId
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setPsPref:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasPsPref
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (unint64_t)rrcResumeReqsCount
{
  return self->_rrcResumeReqs.count;
}

- (unsigned)rrcResumeReqs
{
  return self->_rrcResumeReqs.list;
}

- (void)clearRrcResumeReqs
{
}

- (void)addRrcResumeReq:(unsigned int)a3
{
}

- (unsigned)rrcResumeReqAtIndex:(unint64_t)a3
{
  p_rrcResumeReqs = &self->_rrcResumeReqs;
  unint64_t count = self->_rrcResumeReqs.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_rrcResumeReqs->list[a3];
}

- (void)setRrcResumeReqs:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)setRrcResumeComp:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_rrcResumeComp = a3;
}

- (void)setHasRrcResumeComp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasRrcResumeComp
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setRrcConnReestComp:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_rrcConnReestComp = a3;
}

- (void)setHasRrcConnReestComp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasRrcConnReestComp
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CellularNrRrcConnCount;
  __int16 v3 = [(CellularNrRrcConnCount *)&v7 description];
  v4 = [(CellularNrRrcConnCount *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = +[NSMutableDictionary dictionary];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v5 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v5 forKey:@"timestamp"];

    __int16 has = (__int16)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = +[NSNumber numberWithUnsignedInt:self->_durationSeconds];
    [v3 setObject:v6 forKey:@"duration_seconds"];
  }
  objc_super v7 = PBRepeatedUInt32NSArray();
  [v3 setObject:v7 forKey:@"rrc_conn_setup_req"];

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    v8 = +[NSNumber numberWithUnsignedInt:self->_rrcConnSetupComp];
    [v3 setObject:v8 forKey:@"rrc_conn_setup_comp"];
  }
  v9 = PBRepeatedUInt32NSArray();
  [v3 setObject:v9 forKey:@"rrc_conn_reject"];

  v10 = PBRepeatedUInt32NSArray();
  [v3 setObject:v10 forKey:@"rrc_conn_rlf"];

  v11 = PBRepeatedUInt32NSArray();
  [v3 setObject:v11 forKey:@"rrc_conn_reest_req"];

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    v12 = +[NSNumber numberWithUnsignedInt:self->_rrcConnDrbEstComp];
    [v3 setObject:v12 forKey:@"rrc_conn_drb_est_comp"];
  }
  v13 = PBRepeatedUInt32NSArray();
  [v3 setObject:v13 forKey:@"rrc_conn_rel"];

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    v14 = +[NSNumber numberWithUnsignedInt:self->_numSubs];
    [v3 setObject:v14 forKey:@"num_subs"];
  }
  plmn = self->_plmn;
  if (plmn) {
    [v3 setObject:plmn forKey:@"plmn"];
  }
  __int16 v16 = (__int16)self->_has;
  if ((v16 & 0x100) != 0)
  {
    v17 = +[NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v17 forKey:@"subs_id"];

    __int16 v16 = (__int16)self->_has;
  }
  if ((v16 & 8) != 0)
  {
    v18 = +[NSNumber numberWithUnsignedInt:self->_psPref];
    [v3 setObject:v18 forKey:@"ps_pref"];
  }
  v19 = PBRepeatedUInt32NSArray();
  [v3 setObject:v19 forKey:@"rrc_resume_req"];

  __int16 v20 = (__int16)self->_has;
  if ((v20 & 0x80) != 0)
  {
    v21 = +[NSNumber numberWithUnsignedInt:self->_rrcResumeComp];
    [v3 setObject:v21 forKey:@"rrc_resume_comp"];

    __int16 v20 = (__int16)self->_has;
  }
  if ((v20 & 0x20) != 0)
  {
    v22 = +[NSNumber numberWithUnsignedInt:self->_rrcConnReestComp];
    [v3 setObject:v22 forKey:@"rrc_conn_reest_comp"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000CD900((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  id v14 = v4;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v14;
    __int16 has = (__int16)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v14;
  }
  if (self->_rrcConnSetupReqs.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v14;
      ++v6;
    }
    while (v6 < self->_rrcConnSetupReqs.count);
  }
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v14;
  }
  if (self->_rrcConnRejects.count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v14;
      ++v7;
    }
    while (v7 < self->_rrcConnRejects.count);
  }
  if (self->_rrcConnRlfs.count)
  {
    unint64_t v8 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v14;
      ++v8;
    }
    while (v8 < self->_rrcConnRlfs.count);
  }
  if (self->_rrcConnReestReqs.count)
  {
    unint64_t v9 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v14;
      ++v9;
    }
    while (v9 < self->_rrcConnReestReqs.count);
  }
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v14;
  }
  if (self->_rrcConnRels.count)
  {
    unint64_t v10 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v14;
      ++v10;
    }
    while (v10 < self->_rrcConnRels.count);
  }
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v14;
  }
  if (self->_plmn)
  {
    PBDataWriterWriteDataField();
    id v4 = v14;
  }
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x100) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v14;
    __int16 v11 = (__int16)self->_has;
  }
  if ((v11 & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v14;
  }
  if (self->_rrcResumeReqs.count)
  {
    unint64_t v12 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v14;
      ++v12;
    }
    while (v12 < self->_rrcResumeReqs.count);
  }
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x80) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v14;
    __int16 v13 = (__int16)self->_has;
  }
  if ((v13 & 0x20) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v14;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v4[19] = self->_timestamp;
    *((_WORD *)v4 + 100) |= 1u;
    __int16 has = (__int16)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 40) = self->_durationSeconds;
    *((_WORD *)v4 + 100) |= 2u;
  }
  id v27 = v4;
  if ([(CellularNrRrcConnCount *)self rrcConnSetupReqsCount])
  {
    [v27 clearRrcConnSetupReqs];
    unint64_t v6 = [(CellularNrRrcConnCount *)self rrcConnSetupReqsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [v27 addRrcConnSetupReq:[self rrcConnSetupReqAtIndex:i]];
    }
  }
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    *((_DWORD *)v27 + 47) = self->_rrcConnSetupComp;
    *((_WORD *)v27 + 100) |= 0x40u;
  }
  if ([(CellularNrRrcConnCount *)self rrcConnRejectsCount])
  {
    [v27 clearRrcConnRejects];
    unint64_t v9 = [(CellularNrRrcConnCount *)self rrcConnRejectsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
        [v27 addRrcConnReject:[self rrcConnRejectAtIndex:j]];
    }
  }
  if ([(CellularNrRrcConnCount *)self rrcConnRlfsCount])
  {
    [v27 clearRrcConnRlfs];
    unint64_t v12 = [(CellularNrRrcConnCount *)self rrcConnRlfsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
        [v27 addRrcConnRlf:[self rrcConnRlfAtIndex:k]];
    }
  }
  if ([(CellularNrRrcConnCount *)self rrcConnReestReqsCount])
  {
    [v27 clearRrcConnReestReqs];
    unint64_t v15 = [(CellularNrRrcConnCount *)self rrcConnReestReqsCount];
    if (v15)
    {
      unint64_t v16 = v15;
      for (uint64_t m = 0; m != v16; ++m)
        [v27 addRrcConnReestReq:[self rrcConnReestReqAtIndex:m]];
    }
  }
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    *((_DWORD *)v27 + 45) = self->_rrcConnDrbEstComp;
    *((_WORD *)v27 + 100) |= 0x10u;
  }
  if ([(CellularNrRrcConnCount *)self rrcConnRelsCount])
  {
    [v27 clearRrcConnRels];
    unint64_t v18 = [(CellularNrRrcConnCount *)self rrcConnRelsCount];
    if (v18)
    {
      unint64_t v19 = v18;
      for (uint64_t n = 0; n != v19; ++n)
        [v27 addRrcConnRel:[self rrcConnRelAtIndex:n]];
    }
  }
  v21 = v27;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v27 + 41) = self->_numSubs;
    *((_WORD *)v27 + 100) |= 4u;
  }
  if (self->_plmn)
  {
    [v27 setPlmn:];
    v21 = v27;
  }
  __int16 v22 = (__int16)self->_has;
  if ((v22 & 0x100) != 0)
  {
    v21[49] = self->_subsId;
    *((_WORD *)v21 + 100) |= 0x100u;
    __int16 v22 = (__int16)self->_has;
  }
  if ((v22 & 8) != 0)
  {
    v21[44] = self->_psPref;
    *((_WORD *)v21 + 100) |= 8u;
  }
  if ([(CellularNrRrcConnCount *)self rrcResumeReqsCount])
  {
    [v27 clearRrcResumeReqs];
    unint64_t v23 = [(CellularNrRrcConnCount *)self rrcResumeReqsCount];
    if (v23)
    {
      unint64_t v24 = v23;
      for (iuint64_t i = 0; ii != v24; ++ii)
        [v27 addRrcResumeReq:[self rrcResumeReqAtIndex:ii]];
    }
  }
  __int16 v26 = (__int16)self->_has;
  if ((v26 & 0x80) != 0)
  {
    *((_DWORD *)v27 + 48) = self->_rrcResumeComp;
    *((_WORD *)v27 + 100) |= 0x80u;
    __int16 v26 = (__int16)self->_has;
  }
  if ((v26 & 0x20) != 0)
  {
    *((_DWORD *)v27 + 46) = self->_rrcConnReestComp;
    *((_WORD *)v27 + 100) |= 0x20u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [[objc_opt_class() allocWithZone:a3] init];
  unint64_t v6 = v5;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v5[19] = self->_timestamp;
    *((_WORD *)v5 + 100) |= 1u;
    __int16 has = (__int16)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 40) = self->_durationSeconds;
    *((_WORD *)v5 + 100) |= 2u;
  }
  PBRepeatedUInt32Copy();
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    v6[47] = self->_rrcConnSetupComp;
    *((_WORD *)v6 + 100) |= 0x40u;
  }
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    v6[45] = self->_rrcConnDrbEstComp;
    *((_WORD *)v6 + 100) |= 0x10u;
  }
  PBRepeatedUInt32Copy();
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    v6[41] = self->_numSubs;
    *((_WORD *)v6 + 100) |= 4u;
  }
  id v8 = [(NSData *)self->_plmn copyWithZone:a3];
  unint64_t v9 = (void *)*((void *)v6 + 21);
  *((void *)v6 + 21) = v8;

  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x100) != 0)
  {
    v6[49] = self->_subsId;
    *((_WORD *)v6 + 100) |= 0x100u;
    __int16 v10 = (__int16)self->_has;
  }
  if ((v10 & 8) != 0)
  {
    v6[44] = self->_psPref;
    *((_WORD *)v6 + 100) |= 8u;
  }
  PBRepeatedUInt32Copy();
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x80) != 0)
  {
    v6[48] = self->_rrcResumeComp;
    *((_WORD *)v6 + 100) |= 0x80u;
    __int16 v11 = (__int16)self->_has;
  }
  if ((v11 & 0x20) != 0)
  {
    v6[46] = self->_rrcConnReestComp;
    *((_WORD *)v6 + 100) |= 0x20u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_56;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 100);
  if (has)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((void *)v4 + 19)) {
      goto LABEL_56;
    }
  }
  else if (v6)
  {
    goto LABEL_56;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_durationSeconds != *((_DWORD *)v4 + 40)) {
      goto LABEL_56;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_56;
  }
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_56;
  }
  __int16 v7 = *((_WORD *)v4 + 100);
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_rrcConnSetupComp != *((_DWORD *)v4 + 47)) {
      goto LABEL_56;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_56;
  }
  if (!PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual())
  {
    goto LABEL_56;
  }
  __int16 v8 = *((_WORD *)v4 + 100);
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_rrcConnDrbEstComp != *((_DWORD *)v4 + 45)) {
      goto LABEL_56;
    }
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_56;
  }
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_56;
  }
  __int16 v9 = (__int16)self->_has;
  __int16 v10 = *((_WORD *)v4 + 100);
  if ((v9 & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_numSubs != *((_DWORD *)v4 + 41)) {
      goto LABEL_56;
    }
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_56;
  }
  plmuint64_t n = self->_plmn;
  if ((unint64_t)plmn | *((void *)v4 + 21))
  {
    if (!-[NSData isEqual:](plmn, "isEqual:")) {
      goto LABEL_56;
    }
    __int16 v9 = (__int16)self->_has;
  }
  __int16 v12 = *((_WORD *)v4 + 100);
  if ((v9 & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 100) & 0x100) == 0 || self->_subsId != *((_DWORD *)v4 + 49)) {
      goto LABEL_56;
    }
  }
  else if ((*((_WORD *)v4 + 100) & 0x100) != 0)
  {
    goto LABEL_56;
  }
  if ((v9 & 8) != 0)
  {
    if ((v12 & 8) == 0 || self->_psPref != *((_DWORD *)v4 + 44)) {
      goto LABEL_56;
    }
  }
  else if ((v12 & 8) != 0)
  {
    goto LABEL_56;
  }
  if (!PBRepeatedUInt32IsEqual())
  {
LABEL_56:
    BOOL v15 = 0;
    goto LABEL_57;
  }
  __int16 v13 = (__int16)self->_has;
  __int16 v14 = *((_WORD *)v4 + 100);
  if ((v13 & 0x80) != 0)
  {
    if ((v14 & 0x80) == 0 || self->_rrcResumeComp != *((_DWORD *)v4 + 48)) {
      goto LABEL_56;
    }
  }
  else if ((v14 & 0x80) != 0)
  {
    goto LABEL_56;
  }
  if ((v13 & 0x20) != 0)
  {
    if ((v14 & 0x20) == 0 || self->_rrcConnReestComp != *((_DWORD *)v4 + 46)) {
      goto LABEL_56;
    }
    BOOL v15 = 1;
  }
  else
  {
    BOOL v15 = (v14 & 0x20) == 0;
  }
LABEL_57:

  return v15;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    unint64_t v23 = 2654435761u * self->_timestamp;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v23 = 0;
    if ((has & 2) != 0)
    {
LABEL_3:
      uint64_t v22 = 2654435761 * self->_durationSeconds;
      goto LABEL_6;
    }
  }
  uint64_t v22 = 0;
LABEL_6:
  uint64_t v21 = PBRepeatedUInt32Hash();
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    uint64_t v20 = 2654435761 * self->_rrcConnSetupComp;
  }
  else {
    uint64_t v20 = 0;
  }
  uint64_t v19 = PBRepeatedUInt32Hash();
  uint64_t v17 = PBRepeatedUInt32Hash();
  uint64_t v4 = PBRepeatedUInt32Hash();
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    uint64_t v5 = 2654435761 * self->_rrcConnDrbEstComp;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = PBRepeatedUInt32Hash();
  if ((*(_WORD *)&self->_has & 4) != 0) {
    uint64_t v7 = 2654435761 * self->_numSubs;
  }
  else {
    uint64_t v7 = 0;
  }
  unint64_t v8 = (unint64_t)[(NSData *)self->_plmn hash];
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x100) != 0)
  {
    uint64_t v10 = 2654435761 * self->_subsId;
    if ((v9 & 8) != 0) {
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v10 = 0;
    if ((v9 & 8) != 0)
    {
LABEL_17:
      uint64_t v11 = 2654435761 * self->_psPref;
      goto LABEL_20;
    }
  }
  uint64_t v11 = 0;
LABEL_20:
  uint64_t v12 = PBRepeatedUInt32Hash();
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x80) != 0)
  {
    uint64_t v14 = 2654435761 * self->_rrcResumeComp;
    if ((v13 & 0x20) != 0) {
      goto LABEL_22;
    }
LABEL_24:
    uint64_t v15 = 0;
    return v22 ^ v23 ^ v20 ^ v21 ^ v19 ^ v18 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15;
  }
  uint64_t v14 = 0;
  if ((v13 & 0x20) == 0) {
    goto LABEL_24;
  }
LABEL_22:
  uint64_t v15 = 2654435761 * self->_rrcConnReestComp;
  return v22 ^ v23 ^ v20 ^ v21 ^ v19 ^ v18 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 100);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 19);
    *(_WORD *)&self->_has |= 1u;
    __int16 v5 = *((_WORD *)v4 + 100);
  }
  if ((v5 & 2) != 0)
  {
    self->_durationSeconds = *((_DWORD *)v4 + 40);
    *(_WORD *)&self->_has |= 2u;
  }
  id v27 = (unsigned int *)v4;
  uint64_t v6 = (char *)[v4 rrcConnSetupReqsCount];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
      -[CellularNrRrcConnCount addRrcConnSetupReq:](self, "addRrcConnSetupReq:", [v27 rrcConnSetupReqAtIndex:i]);
  }
  if ((v27[50] & 0x40) != 0)
  {
    self->_rrcConnSetupComp = v27[47];
    *(_WORD *)&self->_has |= 0x40u;
  }
  __int16 v9 = (char *)[v27 rrcConnRejectsCount];
  if (v9)
  {
    uint64_t v10 = v9;
    for (uint64_t j = 0; j != v10; ++j)
      -[CellularNrRrcConnCount addRrcConnReject:](self, "addRrcConnReject:", [v27 rrcConnRejectAtIndex:j]);
  }
  uint64_t v12 = (char *)[v27 rrcConnRlfsCount];
  if (v12)
  {
    __int16 v13 = v12;
    for (uint64_t k = 0; k != v13; ++k)
      -[CellularNrRrcConnCount addRrcConnRlf:](self, "addRrcConnRlf:", [v27 rrcConnRlfAtIndex:k]);
  }
  uint64_t v15 = (char *)[v27 rrcConnReestReqsCount];
  if (v15)
  {
    unint64_t v16 = v15;
    for (uint64_t m = 0; m != v16; ++m)
      -[CellularNrRrcConnCount addRrcConnReestReq:](self, "addRrcConnReestReq:", [v27 rrcConnReestReqAtIndex:m]);
  }
  if ((v27[50] & 0x10) != 0)
  {
    self->_rrcConnDrbEstComp = v27[45];
    *(_WORD *)&self->_has |= 0x10u;
  }
  uint64_t v18 = (char *)[v27 rrcConnRelsCount];
  if (v18)
  {
    uint64_t v19 = v18;
    for (uint64_t n = 0; n != v19; ++n)
      -[CellularNrRrcConnCount addRrcConnRel:](self, "addRrcConnRel:", [v27 rrcConnRelAtIndex:n]);
  }
  uint64_t v21 = v27;
  if ((v27[50] & 4) != 0)
  {
    self->_numSubs = v27[41];
    *(_WORD *)&self->_has |= 4u;
  }
  if (*((void *)v27 + 21))
  {
    -[CellularNrRrcConnCount setPlmn:](self, "setPlmn:");
    uint64_t v21 = v27;
  }
  __int16 v22 = *((_WORD *)v21 + 100);
  if ((v22 & 0x100) != 0)
  {
    self->_subsId = v21[49];
    *(_WORD *)&self->_has |= 0x100u;
    __int16 v22 = *((_WORD *)v21 + 100);
  }
  if ((v22 & 8) != 0)
  {
    self->_psPref = v21[44];
    *(_WORD *)&self->_has |= 8u;
  }
  unint64_t v23 = (char *)[v21 rrcResumeReqsCount];
  if (v23)
  {
    unint64_t v24 = v23;
    for (iuint64_t i = 0; ii != v24; ++ii)
      -[CellularNrRrcConnCount addRrcResumeReq:](self, "addRrcResumeReq:", [v27 rrcResumeReqAtIndex:ii]);
  }
  __int16 v26 = *((_WORD *)v27 + 100);
  if ((v26 & 0x80) != 0)
  {
    self->_rrcResumeComp = v27[48];
    *(_WORD *)&self->_has |= 0x80u;
    __int16 v26 = *((_WORD *)v27 + 100);
  }
  if ((v26 & 0x20) != 0)
  {
    self->_rrcConnReestComp = v27[46];
    *(_WORD *)&self->_has |= 0x20u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)durationSeconds
{
  return self->_durationSeconds;
}

- (unsigned)rrcConnSetupComp
{
  return self->_rrcConnSetupComp;
}

- (unsigned)rrcConnDrbEstComp
{
  return self->_rrcConnDrbEstComp;
}

- (unsigned)numSubs
{
  return self->_numSubs;
}

- (NSData)plmn
{
  return self->_plmn;
}

- (void)setPlmn:(id)a3
{
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (unsigned)psPref
{
  return self->_psPref;
}

- (unsigned)rrcResumeComp
{
  return self->_rrcResumeComp;
}

- (unsigned)rrcConnReestComp
{
  return self->_rrcConnReestComp;
}

- (void).cxx_destruct
{
}

@end