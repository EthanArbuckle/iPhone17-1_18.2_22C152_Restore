@interface CellularLteRsrpRsrqSinrHist
- (BOOL)hasDuration;
- (BOOL)hasMinRsrpDbm;
- (BOOL)hasMinRsrqDb;
- (BOOL)hasMinSinrDbx2;
- (BOOL)hasNumSubs;
- (BOOL)hasPlmn;
- (BOOL)hasPsPref;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)plmn;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)minRsrpDbm;
- (int)minRsrqDb;
- (int)minSinrDbx2;
- (unint64_t)hash;
- (unint64_t)rsrp0sCount;
- (unint64_t)rsrp1sCount;
- (unint64_t)rsrp2sCount;
- (unint64_t)rsrp3sCount;
- (unint64_t)rsrq0sCount;
- (unint64_t)rsrq1sCount;
- (unint64_t)rsrq2sCount;
- (unint64_t)rsrq3sCount;
- (unint64_t)sinr0sCount;
- (unint64_t)sinr1sCount;
- (unint64_t)sinr2sCount;
- (unint64_t)sinr3sCount;
- (unint64_t)timestamp;
- (unsigned)duration;
- (unsigned)numSubs;
- (unsigned)psPref;
- (unsigned)rsrp0AtIndex:(unint64_t)a3;
- (unsigned)rsrp0s;
- (unsigned)rsrp1AtIndex:(unint64_t)a3;
- (unsigned)rsrp1s;
- (unsigned)rsrp2AtIndex:(unint64_t)a3;
- (unsigned)rsrp2s;
- (unsigned)rsrp3AtIndex:(unint64_t)a3;
- (unsigned)rsrp3s;
- (unsigned)rsrq0AtIndex:(unint64_t)a3;
- (unsigned)rsrq0s;
- (unsigned)rsrq1AtIndex:(unint64_t)a3;
- (unsigned)rsrq1s;
- (unsigned)rsrq2AtIndex:(unint64_t)a3;
- (unsigned)rsrq2s;
- (unsigned)rsrq3AtIndex:(unint64_t)a3;
- (unsigned)rsrq3s;
- (unsigned)sinr0AtIndex:(unint64_t)a3;
- (unsigned)sinr0s;
- (unsigned)sinr1AtIndex:(unint64_t)a3;
- (unsigned)sinr1s;
- (unsigned)sinr2AtIndex:(unint64_t)a3;
- (unsigned)sinr2s;
- (unsigned)sinr3AtIndex:(unint64_t)a3;
- (unsigned)sinr3s;
- (unsigned)subsId;
- (void)addRsrp0:(unsigned int)a3;
- (void)addRsrp1:(unsigned int)a3;
- (void)addRsrp2:(unsigned int)a3;
- (void)addRsrp3:(unsigned int)a3;
- (void)addRsrq0:(unsigned int)a3;
- (void)addRsrq1:(unsigned int)a3;
- (void)addRsrq2:(unsigned int)a3;
- (void)addRsrq3:(unsigned int)a3;
- (void)addSinr0:(unsigned int)a3;
- (void)addSinr1:(unsigned int)a3;
- (void)addSinr2:(unsigned int)a3;
- (void)addSinr3:(unsigned int)a3;
- (void)clearRsrp0s;
- (void)clearRsrp1s;
- (void)clearRsrp2s;
- (void)clearRsrp3s;
- (void)clearRsrq0s;
- (void)clearRsrq1s;
- (void)clearRsrq2s;
- (void)clearRsrq3s;
- (void)clearSinr0s;
- (void)clearSinr1s;
- (void)clearSinr2s;
- (void)clearSinr3s;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setDuration:(unsigned int)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasMinRsrpDbm:(BOOL)a3;
- (void)setHasMinRsrqDb:(BOOL)a3;
- (void)setHasMinSinrDbx2:(BOOL)a3;
- (void)setHasNumSubs:(BOOL)a3;
- (void)setHasPsPref:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setMinRsrpDbm:(int)a3;
- (void)setMinRsrqDb:(int)a3;
- (void)setMinSinrDbx2:(int)a3;
- (void)setNumSubs:(unsigned int)a3;
- (void)setPlmn:(id)a3;
- (void)setPsPref:(unsigned int)a3;
- (void)setRsrp0s:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setRsrp1s:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setRsrp2s:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setRsrp3s:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setRsrq0s:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setRsrq1s:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setRsrq2s:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setRsrq3s:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setSinr0s:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setSinr1s:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setSinr2s:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setSinr3s:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation CellularLteRsrpRsrqSinrHist

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)CellularLteRsrpRsrqSinrHist;
  [(CellularLteRsrpRsrqSinrHist *)&v3 dealloc];
}

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

- (void)setDuration:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDuration
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setMinRsrpDbm:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_minRsrpDbm = a3;
}

- (void)setHasMinRsrpDbm:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMinRsrpDbm
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (unint64_t)rsrp0sCount
{
  return self->_rsrp0s.count;
}

- (unsigned)rsrp0s
{
  return self->_rsrp0s.list;
}

- (void)clearRsrp0s
{
}

- (void)addRsrp0:(unsigned int)a3
{
}

- (unsigned)rsrp0AtIndex:(unint64_t)a3
{
  p_rsrp0s = &self->_rsrp0s;
  unint64_t count = self->_rsrp0s.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_rsrp0s->list[a3];
}

- (void)setRsrp0s:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)rsrp1sCount
{
  return self->_rsrp1s.count;
}

- (unsigned)rsrp1s
{
  return self->_rsrp1s.list;
}

- (void)clearRsrp1s
{
}

- (void)addRsrp1:(unsigned int)a3
{
}

- (unsigned)rsrp1AtIndex:(unint64_t)a3
{
  p_rsrp1s = &self->_rsrp1s;
  unint64_t count = self->_rsrp1s.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_rsrp1s->list[a3];
}

- (void)setRsrp1s:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)setMinRsrqDb:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_minRsrqDb = a3;
}

- (void)setHasMinRsrqDb:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMinRsrqDb
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (unint64_t)rsrq0sCount
{
  return self->_rsrq0s.count;
}

- (unsigned)rsrq0s
{
  return self->_rsrq0s.list;
}

- (void)clearRsrq0s
{
}

- (void)addRsrq0:(unsigned int)a3
{
}

- (unsigned)rsrq0AtIndex:(unint64_t)a3
{
  p_rsrq0s = &self->_rsrq0s;
  unint64_t count = self->_rsrq0s.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_rsrq0s->list[a3];
}

- (void)setRsrq0s:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)rsrq1sCount
{
  return self->_rsrq1s.count;
}

- (unsigned)rsrq1s
{
  return self->_rsrq1s.list;
}

- (void)clearRsrq1s
{
}

- (void)addRsrq1:(unsigned int)a3
{
}

- (unsigned)rsrq1AtIndex:(unint64_t)a3
{
  p_rsrq1s = &self->_rsrq1s;
  unint64_t count = self->_rsrq1s.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_rsrq1s->list[a3];
}

- (void)setRsrq1s:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)setMinSinrDbx2:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_minSinrDbx2 = a3;
}

- (void)setHasMinSinrDbx2:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasMinSinrDbx2
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (unint64_t)sinr0sCount
{
  return self->_sinr0s.count;
}

- (unsigned)sinr0s
{
  return self->_sinr0s.list;
}

- (void)clearSinr0s
{
}

- (void)addSinr0:(unsigned int)a3
{
}

- (unsigned)sinr0AtIndex:(unint64_t)a3
{
  p_sinr0s = &self->_sinr0s;
  unint64_t count = self->_sinr0s.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_sinr0s->list[a3];
}

- (void)setSinr0s:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)sinr1sCount
{
  return self->_sinr1s.count;
}

- (unsigned)sinr1s
{
  return self->_sinr1s.list;
}

- (void)clearSinr1s
{
}

- (void)addSinr1:(unsigned int)a3
{
}

- (unsigned)sinr1AtIndex:(unint64_t)a3
{
  p_sinr1s = &self->_sinr1s;
  unint64_t count = self->_sinr1s.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_sinr1s->list[a3];
}

- (void)setSinr1s:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)setSubsId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasSubsId
{
  return *(unsigned char *)&self->_has >> 7;
}

- (unint64_t)rsrp2sCount
{
  return self->_rsrp2s.count;
}

- (unsigned)rsrp2s
{
  return self->_rsrp2s.list;
}

- (void)clearRsrp2s
{
}

- (void)addRsrp2:(unsigned int)a3
{
}

- (unsigned)rsrp2AtIndex:(unint64_t)a3
{
  p_rsrp2s = &self->_rsrp2s;
  unint64_t count = self->_rsrp2s.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_rsrp2s->list[a3];
}

- (void)setRsrp2s:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)rsrp3sCount
{
  return self->_rsrp3s.count;
}

- (unsigned)rsrp3s
{
  return self->_rsrp3s.list;
}

- (void)clearRsrp3s
{
}

- (void)addRsrp3:(unsigned int)a3
{
}

- (unsigned)rsrp3AtIndex:(unint64_t)a3
{
  p_rsrp3s = &self->_rsrp3s;
  unint64_t count = self->_rsrp3s.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_rsrp3s->list[a3];
}

- (void)setRsrp3s:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)rsrq2sCount
{
  return self->_rsrq2s.count;
}

- (unsigned)rsrq2s
{
  return self->_rsrq2s.list;
}

- (void)clearRsrq2s
{
}

- (void)addRsrq2:(unsigned int)a3
{
}

- (unsigned)rsrq2AtIndex:(unint64_t)a3
{
  p_rsrq2s = &self->_rsrq2s;
  unint64_t count = self->_rsrq2s.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_rsrq2s->list[a3];
}

- (void)setRsrq2s:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)rsrq3sCount
{
  return self->_rsrq3s.count;
}

- (unsigned)rsrq3s
{
  return self->_rsrq3s.list;
}

- (void)clearRsrq3s
{
}

- (void)addRsrq3:(unsigned int)a3
{
}

- (unsigned)rsrq3AtIndex:(unint64_t)a3
{
  p_rsrq3s = &self->_rsrq3s;
  unint64_t count = self->_rsrq3s.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_rsrq3s->list[a3];
}

- (void)setRsrq3s:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)sinr2sCount
{
  return self->_sinr2s.count;
}

- (unsigned)sinr2s
{
  return self->_sinr2s.list;
}

- (void)clearSinr2s
{
}

- (void)addSinr2:(unsigned int)a3
{
}

- (unsigned)sinr2AtIndex:(unint64_t)a3
{
  p_sinr2s = &self->_sinr2s;
  unint64_t count = self->_sinr2s.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_sinr2s->list[a3];
}

- (void)setSinr2s:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)sinr3sCount
{
  return self->_sinr3s.count;
}

- (unsigned)sinr3s
{
  return self->_sinr3s.list;
}

- (void)clearSinr3s
{
}

- (void)addSinr3:(unsigned int)a3
{
}

- (unsigned)sinr3AtIndex:(unint64_t)a3
{
  p_sinr3s = &self->_sinr3s;
  unint64_t count = self->_sinr3s.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_sinr3s->list[a3];
}

- (void)setSinr3s:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)setNumSubs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasNumSubs
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setPsPref:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasPsPref
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (BOOL)hasPlmn
{
  return self->_plmn != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CellularLteRsrpRsrqSinrHist;
  char v3 = [(CellularLteRsrpRsrqSinrHist *)&v7 description];
  v4 = [(CellularLteRsrpRsrqSinrHist *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v26 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v26 forKey:@"timestamp"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v27 = +[NSNumber numberWithUnsignedInt:self->_duration];
  [v3 setObject:v27 forKey:@"duration"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    v5 = +[NSNumber numberWithInt:self->_minRsrpDbm];
    [v3 setObject:v5 forKey:@"min_rsrp_dbm"];
  }
LABEL_5:
  v6 = PBRepeatedUInt32NSArray();
  [v3 setObject:v6 forKey:@"rsrp0"];

  objc_super v7 = PBRepeatedUInt32NSArray();
  [v3 setObject:v7 forKey:@"rsrp1"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v8 = +[NSNumber numberWithInt:self->_minRsrqDb];
    [v3 setObject:v8 forKey:@"min_rsrq_db"];
  }
  v9 = PBRepeatedUInt32NSArray();
  [v3 setObject:v9 forKey:@"rsrq0"];

  v10 = PBRepeatedUInt32NSArray();
  [v3 setObject:v10 forKey:@"rsrq1"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    v11 = +[NSNumber numberWithInt:self->_minSinrDbx2];
    [v3 setObject:v11 forKey:@"min_sinr_dbx2"];
  }
  v12 = PBRepeatedUInt32NSArray();
  [v3 setObject:v12 forKey:@"sinr0"];

  v13 = PBRepeatedUInt32NSArray();
  [v3 setObject:v13 forKey:@"sinr1"];

  if ((*(unsigned char *)&self->_has & 0x80000000) != 0)
  {
    v14 = +[NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v14 forKey:@"subs_id"];
  }
  v15 = PBRepeatedUInt32NSArray();
  [v3 setObject:v15 forKey:@"rsrp2"];

  v16 = PBRepeatedUInt32NSArray();
  [v3 setObject:v16 forKey:@"rsrp3"];

  v17 = PBRepeatedUInt32NSArray();
  [v3 setObject:v17 forKey:@"rsrq2"];

  v18 = PBRepeatedUInt32NSArray();
  [v3 setObject:v18 forKey:@"rsrq3"];

  v19 = PBRepeatedUInt32NSArray();
  [v3 setObject:v19 forKey:@"sinr2"];

  v20 = PBRepeatedUInt32NSArray();
  [v3 setObject:v20 forKey:@"sinr3"];

  char v21 = (char)self->_has;
  if ((v21 & 0x20) != 0)
  {
    v22 = +[NSNumber numberWithUnsignedInt:self->_numSubs];
    [v3 setObject:v22 forKey:@"num_subs"];

    char v21 = (char)self->_has;
  }
  if ((v21 & 0x40) != 0)
  {
    v23 = +[NSNumber numberWithUnsignedInt:self->_psPref];
    [v3 setObject:v23 forKey:@"ps_pref"];
  }
  plmn = self->_plmn;
  if (plmn) {
    [v3 setObject:plmn forKey:@"plmn"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000F88BC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_4:
  }
    PBDataWriterWriteSint32Field();
LABEL_5:
  if (self->_rsrp0s.count)
  {
    PBDataWriterPlaceMark();
    if (self->_rsrp0s.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v6;
      }
      while (v6 < self->_rsrp0s.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_rsrp1s.count)
  {
    PBDataWriterPlaceMark();
    if (self->_rsrp1s.count)
    {
      unint64_t v7 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v7;
      }
      while (v7 < self->_rsrp1s.count);
    }
    PBDataWriterRecallMark();
  }
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteSint32Field();
  }
  if (self->_rsrq0s.count)
  {
    PBDataWriterPlaceMark();
    if (self->_rsrq0s.count)
    {
      unint64_t v8 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v8;
      }
      while (v8 < self->_rsrq0s.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_rsrq1s.count)
  {
    PBDataWriterPlaceMark();
    if (self->_rsrq1s.count)
    {
      unint64_t v9 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v9;
      }
      while (v9 < self->_rsrq1s.count);
    }
    PBDataWriterRecallMark();
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteSint32Field();
  }
  if (self->_sinr0s.count)
  {
    PBDataWriterPlaceMark();
    if (self->_sinr0s.count)
    {
      unint64_t v10 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v10;
      }
      while (v10 < self->_sinr0s.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_sinr1s.count)
  {
    PBDataWriterPlaceMark();
    if (self->_sinr1s.count)
    {
      unint64_t v11 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v11;
      }
      while (v11 < self->_sinr1s.count);
    }
    PBDataWriterRecallMark();
  }
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_rsrp2s.count)
  {
    PBDataWriterPlaceMark();
    if (self->_rsrp2s.count)
    {
      unint64_t v12 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v12;
      }
      while (v12 < self->_rsrp2s.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_rsrp3s.count)
  {
    PBDataWriterPlaceMark();
    if (self->_rsrp3s.count)
    {
      unint64_t v13 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v13;
      }
      while (v13 < self->_rsrp3s.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_rsrq2s.count)
  {
    PBDataWriterPlaceMark();
    if (self->_rsrq2s.count)
    {
      unint64_t v14 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v14;
      }
      while (v14 < self->_rsrq2s.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_rsrq3s.count)
  {
    PBDataWriterPlaceMark();
    if (self->_rsrq3s.count)
    {
      unint64_t v15 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v15;
      }
      while (v15 < self->_rsrq3s.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_sinr2s.count)
  {
    PBDataWriterPlaceMark();
    if (self->_sinr2s.count)
    {
      unint64_t v16 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v16;
      }
      while (v16 < self->_sinr2s.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_sinr3s.count)
  {
    PBDataWriterPlaceMark();
    if (self->_sinr3s.count)
    {
      unint64_t v17 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v17;
      }
      while (v17 < self->_sinr3s.count);
    }
    PBDataWriterRecallMark();
  }
  char v18 = (char)self->_has;
  if ((v18 & 0x20) != 0)
  {
    PBDataWriterWriteUint32Field();
    char v18 = (char)self->_has;
  }
  if ((v18 & 0x40) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_plmn) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_69:
    v4[76] = self->_duration;
    *((unsigned char *)v4 + 344) |= 2u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *((void *)v4 + 37) = self->_timestamp;
  *((unsigned char *)v4 + 344) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_69;
  }
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    v4[77] = self->_minRsrpDbm;
    *((unsigned char *)v4 + 344) |= 4u;
  }
LABEL_5:
  id v44 = v4;
  if ([(CellularLteRsrpRsrqSinrHist *)self rsrp0sCount])
  {
    [v44 clearRsrp0s];
    unint64_t v6 = [(CellularLteRsrpRsrqSinrHist *)self rsrp0sCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [v44 addRsrp0:[self rsrp0AtIndex:i]];
    }
  }
  if ([(CellularLteRsrpRsrqSinrHist *)self rsrp1sCount])
  {
    [v44 clearRsrp1s];
    unint64_t v9 = [(CellularLteRsrpRsrqSinrHist *)self rsrp1sCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
        [v44 addRsrp1:[self rsrp1AtIndex:j]];
    }
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((_DWORD *)v44 + 78) = self->_minRsrqDb;
    *((unsigned char *)v44 + 344) |= 8u;
  }
  if ([(CellularLteRsrpRsrqSinrHist *)self rsrq0sCount])
  {
    [v44 clearRsrq0s];
    unint64_t v12 = [(CellularLteRsrpRsrqSinrHist *)self rsrq0sCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
        [v44 addRsrq0:[self rsrq0AtIndex:k]];
    }
  }
  if ([(CellularLteRsrpRsrqSinrHist *)self rsrq1sCount])
  {
    [v44 clearRsrq1s];
    unint64_t v15 = [(CellularLteRsrpRsrqSinrHist *)self rsrq1sCount];
    if (v15)
    {
      unint64_t v16 = v15;
      for (uint64_t m = 0; m != v16; ++m)
        [v44 addRsrq1:[self rsrq1AtIndex:m]];
    }
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *((_DWORD *)v44 + 79) = self->_minSinrDbx2;
    *((unsigned char *)v44 + 344) |= 0x10u;
  }
  if ([(CellularLteRsrpRsrqSinrHist *)self sinr0sCount])
  {
    [v44 clearSinr0s];
    unint64_t v18 = [(CellularLteRsrpRsrqSinrHist *)self sinr0sCount];
    if (v18)
    {
      unint64_t v19 = v18;
      for (uint64_t n = 0; n != v19; ++n)
        [v44 addSinr0:[self sinr0AtIndex:n]];
    }
  }
  if ([(CellularLteRsrpRsrqSinrHist *)self sinr1sCount])
  {
    [v44 clearSinr1s];
    unint64_t v21 = [(CellularLteRsrpRsrqSinrHist *)self sinr1sCount];
    if (v21)
    {
      unint64_t v22 = v21;
      for (iuint64_t i = 0; ii != v22; ++ii)
        [v44 addSinr1:[self sinr1AtIndex:ii]];
    }
  }
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0)
  {
    *((_DWORD *)v44 + 85) = self->_subsId;
    *((unsigned char *)v44 + 344) |= 0x80u;
  }
  if ([(CellularLteRsrpRsrqSinrHist *)self rsrp2sCount])
  {
    [v44 clearRsrp2s];
    unint64_t v24 = [(CellularLteRsrpRsrqSinrHist *)self rsrp2sCount];
    if (v24)
    {
      unint64_t v25 = v24;
      for (juint64_t j = 0; jj != v25; ++jj)
        [v44 addRsrp2:[self rsrp2AtIndex:jj]];
    }
  }
  if ([(CellularLteRsrpRsrqSinrHist *)self rsrp3sCount])
  {
    [v44 clearRsrp3s];
    unint64_t v27 = [(CellularLteRsrpRsrqSinrHist *)self rsrp3sCount];
    if (v27)
    {
      unint64_t v28 = v27;
      for (kuint64_t k = 0; kk != v28; ++kk)
        [v44 addRsrp3:[self rsrp3AtIndex:kk]];
    }
  }
  if ([(CellularLteRsrpRsrqSinrHist *)self rsrq2sCount])
  {
    [v44 clearRsrq2s];
    unint64_t v30 = [(CellularLteRsrpRsrqSinrHist *)self rsrq2sCount];
    if (v30)
    {
      unint64_t v31 = v30;
      for (muint64_t m = 0; mm != v31; ++mm)
        [v44 addRsrq2:[self rsrq2AtIndex:mm]];
    }
  }
  if ([(CellularLteRsrpRsrqSinrHist *)self rsrq3sCount])
  {
    [v44 clearRsrq3s];
    unint64_t v33 = [(CellularLteRsrpRsrqSinrHist *)self rsrq3sCount];
    if (v33)
    {
      unint64_t v34 = v33;
      for (nuint64_t n = 0; nn != v34; ++nn)
        [v44 addRsrq3:[self rsrq3AtIndex:nn]];
    }
  }
  if ([(CellularLteRsrpRsrqSinrHist *)self sinr2sCount])
  {
    [v44 clearSinr2s];
    unint64_t v36 = [(CellularLteRsrpRsrqSinrHist *)self sinr2sCount];
    if (v36)
    {
      unint64_t v37 = v36;
      for (uint64_t i1 = 0; i1 != v37; ++i1)
        [v44 addSinr2:[self sinr2AtIndex:i1]];
    }
  }
  if ([(CellularLteRsrpRsrqSinrHist *)self sinr3sCount])
  {
    [v44 clearSinr3s];
    unint64_t v39 = [(CellularLteRsrpRsrqSinrHist *)self sinr3sCount];
    if (v39)
    {
      unint64_t v40 = v39;
      for (uint64_t i2 = 0; i2 != v40; ++i2)
        [v44 addSinr3:[self sinr3AtIndex:i2]];
    }
  }
  char v42 = (char)self->_has;
  v43 = v44;
  if ((v42 & 0x20) != 0)
  {
    *((_DWORD *)v44 + 80) = self->_numSubs;
    *((unsigned char *)v44 + 344) |= 0x20u;
    char v42 = (char)self->_has;
  }
  if ((v42 & 0x40) != 0)
  {
    *((_DWORD *)v44 + 84) = self->_psPref;
    *((unsigned char *)v44 + 344) |= 0x40u;
  }
  if (self->_plmn)
  {
    [v44 setPlmn];
    v43 = v44;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [[objc_opt_class() allocWithZone:a3] init];
  unint64_t v6 = v5;
  char has = (char)self->_has;
  if (has)
  {
    v5[37] = self->_timestamp;
    *((unsigned char *)v5 + 344) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 76) = self->_duration;
  *((unsigned char *)v5 + 344) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    *((_DWORD *)v5 + 77) = self->_minRsrpDbm;
    *((unsigned char *)v5 + 344) |= 4u;
  }
LABEL_5:
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v6[78] = self->_minRsrqDb;
    *((unsigned char *)v6 + 344) |= 8u;
  }
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    v6[79] = self->_minSinrDbx2;
    *((unsigned char *)v6 + 344) |= 0x10u;
  }
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0)
  {
    v6[85] = self->_subsId;
    *((unsigned char *)v6 + 344) |= 0x80u;
  }
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  char v8 = (char)self->_has;
  if ((v8 & 0x20) != 0)
  {
    v6[80] = self->_numSubs;
    *((unsigned char *)v6 + 344) |= 0x20u;
    char v8 = (char)self->_has;
  }
  if ((v8 & 0x40) != 0)
  {
    v6[84] = self->_psPref;
    *((unsigned char *)v6 + 344) |= 0x40u;
  }
  id v9 = [(NSData *)self->_plmn copyWithZone:a3];
  unint64_t v10 = (void *)*((void *)v6 + 41);
  *((void *)v6 + 41) = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (char *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_46;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[344] & 1) == 0 || self->_timestamp != *((void *)v4 + 37)) {
      goto LABEL_46;
    }
  }
  else if (v4[344])
  {
    goto LABEL_46;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v4[344] & 2) == 0 || self->_duration != *((_DWORD *)v4 + 76)) {
      goto LABEL_46;
    }
  }
  else if ((v4[344] & 2) != 0)
  {
    goto LABEL_46;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((v4[344] & 4) == 0 || self->_minRsrpDbm != *((_DWORD *)v4 + 77)) {
      goto LABEL_46;
    }
  }
  else if ((v4[344] & 4) != 0)
  {
    goto LABEL_46;
  }
  if (!PBRepeatedUInt32IsEqual() || !PBRepeatedUInt32IsEqual()) {
    goto LABEL_46;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((v4[344] & 8) == 0 || self->_minRsrqDb != *((_DWORD *)v4 + 78)) {
      goto LABEL_46;
    }
  }
  else if ((v4[344] & 8) != 0)
  {
    goto LABEL_46;
  }
  if (!PBRepeatedUInt32IsEqual() || !PBRepeatedUInt32IsEqual()) {
    goto LABEL_46;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((v4[344] & 0x10) == 0 || self->_minSinrDbx2 != *((_DWORD *)v4 + 79)) {
      goto LABEL_46;
    }
  }
  else if ((v4[344] & 0x10) != 0)
  {
    goto LABEL_46;
  }
  if (!PBRepeatedUInt32IsEqual() || !PBRepeatedUInt32IsEqual()) {
    goto LABEL_46;
  }
  int v5 = v4[344];
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0)
  {
    if ((v5 & 0x80000000) == 0 || self->_subsId != *((_DWORD *)v4 + 85)) {
      goto LABEL_46;
    }
  }
  else if (v5 < 0)
  {
    goto LABEL_46;
  }
  if (!PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual())
  {
    goto LABEL_46;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((v4[344] & 0x20) == 0 || self->_numSubs != *((_DWORD *)v4 + 80)) {
      goto LABEL_46;
    }
  }
  else if ((v4[344] & 0x20) != 0)
  {
    goto LABEL_46;
  }
  if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    if ((v4[344] & 0x40) == 0) {
      goto LABEL_55;
    }
LABEL_46:
    unsigned __int8 v6 = 0;
    goto LABEL_47;
  }
  if ((v4[344] & 0x40) == 0 || self->_psPref != *((_DWORD *)v4 + 84)) {
    goto LABEL_46;
  }
LABEL_55:
  plmuint64_t n = self->_plmn;
  if ((unint64_t)plmn | *((void *)v4 + 41)) {
    unsigned __int8 v6 = -[NSData isEqual:](plmn, "isEqual:");
  }
  else {
    unsigned __int8 v6 = 1;
  }
LABEL_47:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_duration;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  uint64_t v24 = v4;
  unint64_t v25 = v3;
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v19 = 2654435761 * self->_minRsrpDbm;
  }
  else {
    uint64_t v19 = 0;
  }
  uint64_t v23 = PBRepeatedUInt32Hash();
  uint64_t v22 = PBRepeatedUInt32Hash();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v18 = 2654435761 * self->_minRsrqDb;
  }
  else {
    uint64_t v18 = 0;
  }
  uint64_t v21 = PBRepeatedUInt32Hash();
  uint64_t v20 = PBRepeatedUInt32Hash();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v17 = 2654435761 * self->_minSinrDbx2;
  }
  else {
    uint64_t v17 = 0;
  }
  uint64_t v5 = PBRepeatedUInt32Hash();
  uint64_t v6 = PBRepeatedUInt32Hash();
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0) {
    uint64_t v7 = 2654435761 * self->_subsId;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = PBRepeatedUInt32Hash();
  uint64_t v9 = PBRepeatedUInt32Hash();
  uint64_t v10 = PBRepeatedUInt32Hash();
  uint64_t v11 = PBRepeatedUInt32Hash();
  uint64_t v12 = PBRepeatedUInt32Hash();
  uint64_t v13 = PBRepeatedUInt32Hash();
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    uint64_t v14 = 2654435761 * self->_numSubs;
  }
  else {
    uint64_t v14 = 0;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    uint64_t v15 = 2654435761 * self->_psPref;
  }
  else {
    uint64_t v15 = 0;
  }
  return v24 ^ v25 ^ v19 ^ v23 ^ v22 ^ v18 ^ v21 ^ v20 ^ v17 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ (unint64_t)[(NSData *)self->_plmn hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (char *)a3;
  char v5 = v4[344];
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 37);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = v4[344];
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v4[344] & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_duratiouint64_t n = *((_DWORD *)v4 + 76);
  *(unsigned char *)&self->_has |= 2u;
  if ((v4[344] & 4) != 0)
  {
LABEL_4:
    self->_minRsrpDbuint64_t m = *((_DWORD *)v4 + 77);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_5:
  id v44 = v4;
  uint64_t v6 = (char *)[v4 rsrp0sCount];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
      -[CellularLteRsrpRsrqSinrHist addRsrp0:](self, "addRsrp0:", [v44 rsrp0AtIndex:i]);
  }
  uint64_t v9 = (char *)[v44 rsrp1sCount];
  if (v9)
  {
    uint64_t v10 = v9;
    for (uint64_t j = 0; j != v10; ++j)
      -[CellularLteRsrpRsrqSinrHist addRsrp1:](self, "addRsrp1:", [v44 rsrp1AtIndex:j]);
  }
  if ((v44[344] & 8) != 0)
  {
    self->_minRsrqDb = *((_DWORD *)v44 + 78);
    *(unsigned char *)&self->_has |= 8u;
  }
  uint64_t v12 = (char *)[v44 rsrq0sCount];
  if (v12)
  {
    uint64_t v13 = v12;
    for (uint64_t k = 0; k != v13; ++k)
      -[CellularLteRsrpRsrqSinrHist addRsrq0:](self, "addRsrq0:", [v44 rsrq0AtIndex:k]);
  }
  uint64_t v15 = (char *)[v44 rsrq1sCount];
  if (v15)
  {
    unint64_t v16 = v15;
    for (uint64_t m = 0; m != v16; ++m)
      -[CellularLteRsrpRsrqSinrHist addRsrq1:](self, "addRsrq1:", [v44 rsrq1AtIndex:m]);
  }
  if ((v44[344] & 0x10) != 0)
  {
    self->_minSinrDbx2 = *((_DWORD *)v44 + 79);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  uint64_t v18 = (char *)[v44 sinr0sCount];
  if (v18)
  {
    uint64_t v19 = v18;
    for (uint64_t n = 0; n != v19; ++n)
      -[CellularLteRsrpRsrqSinrHist addSinr0:](self, "addSinr0:", [v44 sinr0AtIndex:n]);
  }
  uint64_t v21 = (char *)[v44 sinr1sCount];
  if (v21)
  {
    uint64_t v22 = v21;
    for (iuint64_t i = 0; ii != v22; ++ii)
      -[CellularLteRsrpRsrqSinrHist addSinr1:](self, "addSinr1:", [v44 sinr1AtIndex:ii]);
  }
  if (v44[344] < 0)
  {
    self->_subsId = *((_DWORD *)v44 + 85);
    *(unsigned char *)&self->_has |= 0x80u;
  }
  uint64_t v24 = (char *)[v44 rsrp2sCount];
  if (v24)
  {
    unint64_t v25 = v24;
    for (juint64_t j = 0; jj != v25; ++jj)
      -[CellularLteRsrpRsrqSinrHist addRsrp2:](self, "addRsrp2:", [v44 rsrp2AtIndex:jj]);
  }
  unint64_t v27 = (char *)[v44 rsrp3sCount];
  if (v27)
  {
    unint64_t v28 = v27;
    for (kuint64_t k = 0; kk != v28; ++kk)
      -[CellularLteRsrpRsrqSinrHist addRsrp3:](self, "addRsrp3:", [v44 rsrp3AtIndex:kk]);
  }
  unint64_t v30 = (char *)[v44 rsrq2sCount];
  if (v30)
  {
    unint64_t v31 = v30;
    for (muint64_t m = 0; mm != v31; ++mm)
      -[CellularLteRsrpRsrqSinrHist addRsrq2:](self, "addRsrq2:", [v44 rsrq2AtIndex:mm]);
  }
  unint64_t v33 = (char *)[v44 rsrq3sCount];
  if (v33)
  {
    unint64_t v34 = v33;
    for (nuint64_t n = 0; nn != v34; ++nn)
      -[CellularLteRsrpRsrqSinrHist addRsrq3:](self, "addRsrq3:", [v44 rsrq3AtIndex:nn]);
  }
  unint64_t v36 = (char *)[v44 sinr2sCount];
  if (v36)
  {
    unint64_t v37 = v36;
    for (uint64_t i1 = 0; i1 != v37; ++i1)
      -[CellularLteRsrpRsrqSinrHist addSinr2:](self, "addSinr2:", [v44 sinr2AtIndex:i1]);
  }
  unint64_t v39 = (char *)[v44 sinr3sCount];
  if (v39)
  {
    unint64_t v40 = v39;
    for (uint64_t i2 = 0; i2 != v40; ++i2)
      -[CellularLteRsrpRsrqSinrHist addSinr3:](self, "addSinr3:", [v44 sinr3AtIndex:i2]);
  }
  char v42 = v44;
  char v43 = v44[344];
  if ((v43 & 0x20) != 0)
  {
    self->_numSubs = *((_DWORD *)v44 + 80);
    *(unsigned char *)&self->_has |= 0x20u;
    char v43 = v44[344];
  }
  if ((v43 & 0x40) != 0)
  {
    self->_psPref = *((_DWORD *)v44 + 84);
    *(unsigned char *)&self->_has |= 0x40u;
  }
  if (*((void *)v44 + 41))
  {
    -[CellularLteRsrpRsrqSinrHist setPlmn:](self, "setPlmn:");
    char v42 = v44;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)duration
{
  return self->_duration;
}

- (int)minRsrpDbm
{
  return self->_minRsrpDbm;
}

- (int)minRsrqDb
{
  return self->_minRsrqDb;
}

- (int)minSinrDbx2
{
  return self->_minSinrDbx2;
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (unsigned)numSubs
{
  return self->_numSubs;
}

- (unsigned)psPref
{
  return self->_psPref;
}

- (NSData)plmn
{
  return self->_plmn;
}

- (void)setPlmn:(id)a3
{
}

- (void).cxx_destruct
{
}

@end