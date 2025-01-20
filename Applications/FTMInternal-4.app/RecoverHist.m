@interface RecoverHist
- (BOOL)hasRecoverCount;
- (BOOL)hasRecoverDurationEnum;
- (BOOL)hasRecoverDurationEnum2;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)recoverDurationEnumAsString:(int)a3;
- (int)StringAsRecoverDurationEnum:(id)a3;
- (int)recoverDurationEnum;
- (unint64_t)hash;
- (unint64_t)recoverCountStateBreaksCount;
- (unsigned)recoverCount;
- (unsigned)recoverCountStateBreakAtIndex:(unint64_t)a3;
- (unsigned)recoverCountStateBreaks;
- (unsigned)recoverDurationEnum2;
- (void)addRecoverCountStateBreak:(unsigned int)a3;
- (void)clearRecoverCountStateBreaks;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasRecoverCount:(BOOL)a3;
- (void)setHasRecoverDurationEnum2:(BOOL)a3;
- (void)setHasRecoverDurationEnum:(BOOL)a3;
- (void)setRecoverCount:(unsigned int)a3;
- (void)setRecoverCountStateBreaks:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setRecoverDurationEnum2:(unsigned int)a3;
- (void)setRecoverDurationEnum:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation RecoverHist

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)RecoverHist;
  [(RecoverHist *)&v3 dealloc];
}

- (int)recoverDurationEnum
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_recoverDurationEnum;
  }
  else {
    return 0;
  }
}

- (void)setRecoverDurationEnum:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_recoverDurationEnum = a3;
}

- (void)setHasRecoverDurationEnum:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRecoverDurationEnum
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)recoverDurationEnumAsString:(int)a3
{
  if (a3 >= 6)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = *(&off_100287838 + a3);
  }

  return v3;
}

- (int)StringAsRecoverDurationEnum:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LT_5S"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"GE_5S_LT_20S"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"GE_20S_LT_5M"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"GE_5M_LT_15M"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"GE_15M_LT_30M"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"GE_30M"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setRecoverCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_recoverCount = a3;
}

- (void)setHasRecoverCount:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRecoverCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (unint64_t)recoverCountStateBreaksCount
{
  return self->_recoverCountStateBreaks.count;
}

- (unsigned)recoverCountStateBreaks
{
  return self->_recoverCountStateBreaks.list;
}

- (void)clearRecoverCountStateBreaks
{
}

- (void)addRecoverCountStateBreak:(unsigned int)a3
{
}

- (unsigned)recoverCountStateBreakAtIndex:(unint64_t)a3
{
  p_recoverCountStateBreaks = &self->_recoverCountStateBreaks;
  unint64_t count = self->_recoverCountStateBreaks.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_recoverCountStateBreaks->list[a3];
}

- (void)setRecoverCountStateBreaks:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)setRecoverDurationEnum2:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_recoverDurationEnum2 = a3;
}

- (void)setHasRecoverDurationEnum2:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRecoverDurationEnum2
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)RecoverHist;
  char v3 = [(RecoverHist *)&v7 description];
  int v4 = [(RecoverHist *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t recoverDurationEnum = self->_recoverDurationEnum;
    if (recoverDurationEnum >= 6)
    {
      v6 = +[NSString stringWithFormat:@"(unknown: %i)", self->_recoverDurationEnum];
    }
    else
    {
      v6 = *(&off_100287838 + recoverDurationEnum);
    }
    [v3 setObject:v6 forKey:@"recover_duration_enum"];

    char has = (char)self->_has;
  }
  if (has)
  {
    objc_super v7 = +[NSNumber numberWithUnsignedInt:self->_recoverCount];
    [v3 setObject:v7 forKey:@"recover_count"];
  }
  v8 = PBRepeatedUInt32NSArray();
  [v3 setObject:v8 forKey:@"recover_count_state_break"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v9 = +[NSNumber numberWithUnsignedInt:self->_recoverDurationEnum2];
    [v3 setObject:v9 forKey:@"recover_duration_enum_2"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000BAAE0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v7 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v7;
  }
  if (self->_recoverCountStateBreaks.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v7;
      ++v6;
    }
    while (v6 < self->_recoverCountStateBreaks.count);
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[9] = self->_recoverDurationEnum;
    *((unsigned char *)v4 + 44) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[8] = self->_recoverCount;
    *((unsigned char *)v4 + 44) |= 1u;
  }
  id v9 = v4;
  if ([(RecoverHist *)self recoverCountStateBreaksCount])
  {
    [v9 clearRecoverCountStateBreaks];
    unint64_t v6 = [(RecoverHist *)self recoverCountStateBreaksCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [v9 addRecoverCountStateBreak:[self recoverCountStateBreakAtIndex:i]];
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v9 + 10) = self->_recoverDurationEnum2;
    *((unsigned char *)v9 + 44) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[objc_opt_class() allocWithZone:a3] init];
  v5 = v4;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[9] = self->_recoverDurationEnum;
    *((unsigned char *)v4 + 44) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[8] = self->_recoverCount;
    *((unsigned char *)v4 + 44) |= 1u;
  }
  PBRepeatedUInt32Copy();
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v5[10] = self->_recoverDurationEnum2;
    *((unsigned char *)v5 + 44) |= 4u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0 || self->_recoverDurationEnum != *((_DWORD *)v4 + 9)) {
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
    goto LABEL_17;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_recoverCount != *((_DWORD *)v4 + 8)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_17;
  }
  if (!PBRepeatedUInt32IsEqual())
  {
LABEL_17:
    BOOL v5 = 0;
    goto LABEL_18;
  }
  BOOL v5 = (*((unsigned char *)v4 + 44) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 4) == 0 || self->_recoverDurationEnum2 != *((_DWORD *)v4 + 10)) {
      goto LABEL_17;
    }
    BOOL v5 = 1;
  }
LABEL_18:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_recoverDurationEnum;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_has)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_recoverCount;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  uint64_t v5 = PBRepeatedUInt32Hash();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v6 = 2654435761 * self->_recoverDurationEnum2;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 2) != 0)
  {
    self->_uint64_t recoverDurationEnum = *((_DWORD *)v4 + 9);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 44);
  }
  if (v5)
  {
    self->_recoverCount = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 1u;
  }
  id v9 = (unsigned int *)v4;
  uint64_t v6 = (char *)[v4 recoverCountStateBreaksCount];
  if (v6)
  {
    unint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
      -[RecoverHist addRecoverCountStateBreak:](self, "addRecoverCountStateBreak:", [v9 recoverCountStateBreakAtIndex:i]);
  }
  if ((v9[11] & 4) != 0)
  {
    self->_recoverDurationEnum2 = v9[10];
    *(unsigned char *)&self->_has |= 4u;
  }
}

- (unsigned)recoverCount
{
  return self->_recoverCount;
}

- (unsigned)recoverDurationEnum2
{
  return self->_recoverDurationEnum2;
}

@end