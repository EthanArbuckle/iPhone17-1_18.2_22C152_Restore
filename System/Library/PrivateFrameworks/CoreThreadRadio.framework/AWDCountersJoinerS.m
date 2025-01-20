@interface AWDCountersJoinerS
- (BOOL)hasJoinAttempts;
- (BOOL)hasJoinSuccessRate;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)joinSuccessRate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)attachFailLatencyHistogramsCount;
- (unint64_t)attachLatencyHistogramsCount;
- (unint64_t)hash;
- (unint64_t)joinerFailLatencyHistogramsCount;
- (unint64_t)joinerLatencyHistogramsCount;
- (unsigned)attachFailLatencyHistogramAtIndex:(unint64_t)a3;
- (unsigned)attachFailLatencyHistograms;
- (unsigned)attachLatencyHistogramAtIndex:(unint64_t)a3;
- (unsigned)attachLatencyHistograms;
- (unsigned)joinAttempts;
- (unsigned)joinerFailLatencyHistogramAtIndex:(unint64_t)a3;
- (unsigned)joinerFailLatencyHistograms;
- (unsigned)joinerLatencyHistogramAtIndex:(unint64_t)a3;
- (unsigned)joinerLatencyHistograms;
- (void)addAttachFailLatencyHistogram:(unsigned int)a3;
- (void)addAttachLatencyHistogram:(unsigned int)a3;
- (void)addJoinerFailLatencyHistogram:(unsigned int)a3;
- (void)addJoinerLatencyHistogram:(unsigned int)a3;
- (void)clearAttachFailLatencyHistograms;
- (void)clearAttachLatencyHistograms;
- (void)clearJoinerFailLatencyHistograms;
- (void)clearJoinerLatencyHistograms;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAttachFailLatencyHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setAttachLatencyHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setHasJoinAttempts:(BOOL)a3;
- (void)setHasJoinSuccessRate:(BOOL)a3;
- (void)setJoinAttempts:(unsigned int)a3;
- (void)setJoinSuccessRate:(float)a3;
- (void)setJoinerFailLatencyHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setJoinerLatencyHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation AWDCountersJoinerS

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDCountersJoinerS;
  [(AWDCountersJoinerS *)&v3 dealloc];
}

- (void)setJoinSuccessRate:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_joinSuccessRate = a3;
}

- (void)setHasJoinSuccessRate:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasJoinSuccessRate
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setJoinAttempts:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_joinAttempts = a3;
}

- (void)setHasJoinAttempts:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasJoinAttempts
{
  return *(unsigned char *)&self->_has & 1;
}

- (unint64_t)attachLatencyHistogramsCount
{
  return self->_attachLatencyHistograms.count;
}

- (unsigned)attachLatencyHistograms
{
  return self->_attachLatencyHistograms.list;
}

- (void)clearAttachLatencyHistograms
{
}

- (void)addAttachLatencyHistogram:(unsigned int)a3
{
}

- (unsigned)attachLatencyHistogramAtIndex:(unint64_t)a3
{
  p_attachLatencyHistograms = &self->_attachLatencyHistograms;
  unint64_t count = self->_attachLatencyHistograms.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_attachLatencyHistograms->list[a3];
}

- (void)setAttachLatencyHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)joinerLatencyHistogramsCount
{
  return self->_joinerLatencyHistograms.count;
}

- (unsigned)joinerLatencyHistograms
{
  return self->_joinerLatencyHistograms.list;
}

- (void)clearJoinerLatencyHistograms
{
}

- (void)addJoinerLatencyHistogram:(unsigned int)a3
{
}

- (unsigned)joinerLatencyHistogramAtIndex:(unint64_t)a3
{
  p_joinerLatencyHistograms = &self->_joinerLatencyHistograms;
  unint64_t count = self->_joinerLatencyHistograms.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_joinerLatencyHistograms->list[a3];
}

- (void)setJoinerLatencyHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)attachFailLatencyHistogramsCount
{
  return self->_attachFailLatencyHistograms.count;
}

- (unsigned)attachFailLatencyHistograms
{
  return self->_attachFailLatencyHistograms.list;
}

- (void)clearAttachFailLatencyHistograms
{
}

- (void)addAttachFailLatencyHistogram:(unsigned int)a3
{
}

- (unsigned)attachFailLatencyHistogramAtIndex:(unint64_t)a3
{
  p_attachFailLatencyHistograms = &self->_attachFailLatencyHistograms;
  unint64_t count = self->_attachFailLatencyHistograms.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_attachFailLatencyHistograms->list[a3];
}

- (void)setAttachFailLatencyHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)joinerFailLatencyHistogramsCount
{
  return self->_joinerFailLatencyHistograms.count;
}

- (unsigned)joinerFailLatencyHistograms
{
  return self->_joinerFailLatencyHistograms.list;
}

- (void)clearJoinerFailLatencyHistograms
{
}

- (void)addJoinerFailLatencyHistogram:(unsigned int)a3
{
}

- (unsigned)joinerFailLatencyHistogramAtIndex:(unint64_t)a3
{
  p_joinerFailLatencyHistograms = &self->_joinerFailLatencyHistograms;
  unint64_t count = self->_joinerFailLatencyHistograms.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_joinerFailLatencyHistograms->list[a3];
}

- (void)setJoinerFailLatencyHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)AWDCountersJoinerS;
  char v3 = [(AWDCountersJoinerS *)&v7 description];
  v4 = [(AWDCountersJoinerS *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(float *)&double v4 = self->_joinSuccessRate;
    v6 = +[NSNumber numberWithFloat:v4];
    [v3 setObject:v6 forKey:@"join_success_rate"];

    char has = (char)self->_has;
  }
  if (has)
  {
    objc_super v7 = +[NSNumber numberWithUnsignedInt:self->_joinAttempts];
    [v3 setObject:v7 forKey:@"join_attempts"];
  }
  v8 = PBRepeatedUInt32NSArray();
  [v3 setObject:v8 forKey:@"attach_latency_histogram"];

  v9 = PBRepeatedUInt32NSArray();
  [v3 setObject:v9 forKey:@"joiner_latency_histogram"];

  v10 = PBRepeatedUInt32NSArray();
  [v3 setObject:v10 forKey:@"attach_fail_latency_histogram"];

  v11 = PBRepeatedUInt32NSArray();
  [v3 setObject:v11 forKey:@"joiner_fail_latency_histogram"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCountersJoinerSReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v11 = v4;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    id v4 = v11;
    if ((*(unsigned char *)&self->_has & 1) == 0)
    {
LABEL_3:
      p_attachLatencyHistograms = &self->_attachLatencyHistograms;
      if (!self->_attachLatencyHistograms.count) {
        goto LABEL_9;
      }
      goto LABEL_7;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v11;
  p_attachLatencyHistograms = &self->_attachLatencyHistograms;
  if (!self->_attachLatencyHistograms.count) {
    goto LABEL_9;
  }
LABEL_7:
  unint64_t v6 = 0;
  do
  {
    PBDataWriterWriteUint32Field();
    id v4 = v11;
    ++v6;
  }
  while (v6 < p_attachLatencyHistograms->count);
LABEL_9:
  if (self->_joinerLatencyHistograms.count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v11;
      ++v7;
    }
    while (v7 < self->_joinerLatencyHistograms.count);
  }
  if (self->_attachFailLatencyHistograms.count)
  {
    unint64_t v8 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v11;
      ++v8;
    }
    while (v8 < self->_attachFailLatencyHistograms.count);
  }
  p_joinerFailLatencyHistograms = &self->_joinerFailLatencyHistograms;
  if (p_joinerFailLatencyHistograms->count)
  {
    unint64_t v10 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v11;
      ++v10;
    }
    while (v10 < p_joinerFailLatencyHistograms->count);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    v4[26] = self->_joinAttempts;
    *((unsigned char *)v4 + 112) |= 1u;
    id v17 = v4;
    if (![(AWDCountersJoinerS *)self attachLatencyHistogramsCount]) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  v4[27] = LODWORD(self->_joinSuccessRate);
  *((unsigned char *)v4 + 112) |= 2u;
  if (*(unsigned char *)&self->_has) {
    goto LABEL_6;
  }
LABEL_3:
  id v17 = v4;
  if (![(AWDCountersJoinerS *)self attachLatencyHistogramsCount]) {
    goto LABEL_10;
  }
LABEL_7:
  [v17 clearAttachLatencyHistograms];
  unint64_t v5 = [(AWDCountersJoinerS *)self attachLatencyHistogramsCount];
  if (v5)
  {
    unint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      objc_msgSend(v17, "addAttachLatencyHistogram:", -[AWDCountersJoinerS attachLatencyHistogramAtIndex:](self, "attachLatencyHistogramAtIndex:", i));
  }
LABEL_10:
  if ([(AWDCountersJoinerS *)self joinerLatencyHistogramsCount])
  {
    [v17 clearJoinerLatencyHistograms];
    unint64_t v8 = [(AWDCountersJoinerS *)self joinerLatencyHistogramsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
        objc_msgSend(v17, "addJoinerLatencyHistogram:", -[AWDCountersJoinerS joinerLatencyHistogramAtIndex:](self, "joinerLatencyHistogramAtIndex:", j));
    }
  }
  if ([(AWDCountersJoinerS *)self attachFailLatencyHistogramsCount])
  {
    [v17 clearAttachFailLatencyHistograms];
    unint64_t v11 = [(AWDCountersJoinerS *)self attachFailLatencyHistogramsCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t k = 0; k != v12; ++k)
        objc_msgSend(v17, "addAttachFailLatencyHistogram:", -[AWDCountersJoinerS attachFailLatencyHistogramAtIndex:](self, "attachFailLatencyHistogramAtIndex:", k));
    }
  }
  if ([(AWDCountersJoinerS *)self joinerFailLatencyHistogramsCount])
  {
    [v17 clearJoinerFailLatencyHistograms];
    unint64_t v14 = [(AWDCountersJoinerS *)self joinerFailLatencyHistogramsCount];
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t m = 0; m != v15; ++m)
        objc_msgSend(v17, "addJoinerFailLatencyHistogram:", -[AWDCountersJoinerS joinerFailLatencyHistogramAtIndex:](self, "joinerFailLatencyHistogramAtIndex:", m));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v5 = v4;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 27) = LODWORD(self->_joinSuccessRate);
    *((unsigned char *)v4 + 112) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v4 + 26) = self->_joinAttempts;
    *((unsigned char *)v4 + 112) |= 1u;
  }
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 112) & 2) == 0 || self->_joinSuccessRate != *((float *)v4 + 27)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 112) & 2) != 0)
  {
    goto LABEL_16;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 112) & 1) == 0 || self->_joinAttempts != *((_DWORD *)v4 + 26)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 112))
  {
    goto LABEL_16;
  }
  if (PBRepeatedUInt32IsEqual()
    && PBRepeatedUInt32IsEqual()
    && PBRepeatedUInt32IsEqual())
  {
    char IsEqual = PBRepeatedUInt32IsEqual();

    return IsEqual;
  }
LABEL_16:

  return 0;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    float joinSuccessRate = self->_joinSuccessRate;
    float v6 = -joinSuccessRate;
    if (joinSuccessRate >= 0.0) {
      float v6 = self->_joinSuccessRate;
    }
    float v7 = floorf(v6 + 0.5);
    float v8 = (float)(v6 - v7) * 1.8447e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmodf(v7, 1.8447e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabsf(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if (has) {
    uint64_t v9 = 2654435761 * self->_joinAttempts;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = v9 ^ v4 ^ PBRepeatedUInt32Hash();
  uint64_t v11 = PBRepeatedUInt32Hash();
  uint64_t v12 = v10 ^ v11 ^ PBRepeatedUInt32Hash();
  return v12 ^ PBRepeatedUInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if ((*((unsigned char *)v4 + 112) & 2) != 0)
  {
    self->_float joinSuccessRate = *((float *)v4 + 27);
    *(unsigned char *)&self->_has |= 2u;
    if ((*((unsigned char *)v4 + 112) & 1) == 0)
    {
LABEL_3:
      id v17 = v4;
      unint64_t v5 = (char *)[v4 attachLatencyHistogramsCount];
      if (!v5) {
        goto LABEL_9;
      }
      goto LABEL_7;
    }
  }
  else if ((*((unsigned char *)v4 + 112) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_joinAttempts = *((_DWORD *)v4 + 26);
  *(unsigned char *)&self->_has |= 1u;
  id v17 = v4;
  unint64_t v5 = (char *)[v4 attachLatencyHistogramsCount];
  if (!v5) {
    goto LABEL_9;
  }
LABEL_7:
  float v6 = v5;
  for (uint64_t i = 0; i != v6; ++i)
    -[AWDCountersJoinerS addAttachLatencyHistogram:](self, "addAttachLatencyHistogram:", [v17 attachLatencyHistogramAtIndex:i]);
LABEL_9:
  float v8 = (char *)[v17 joinerLatencyHistogramsCount];
  if (v8)
  {
    uint64_t v9 = v8;
    for (uint64_t j = 0; j != v9; ++j)
      -[AWDCountersJoinerS addJoinerLatencyHistogram:](self, "addJoinerLatencyHistogram:", [v17 joinerLatencyHistogramAtIndex:j]);
  }
  uint64_t v11 = (char *)[v17 attachFailLatencyHistogramsCount];
  if (v11)
  {
    uint64_t v12 = v11;
    for (uint64_t k = 0; k != v12; ++k)
      -[AWDCountersJoinerS addAttachFailLatencyHistogram:](self, "addAttachFailLatencyHistogram:", [v17 attachFailLatencyHistogramAtIndex:k]);
  }
  unint64_t v14 = (char *)[v17 joinerFailLatencyHistogramsCount];
  if (v14)
  {
    unint64_t v15 = v14;
    for (uint64_t m = 0; m != v15; ++m)
      -[AWDCountersJoinerS addJoinerFailLatencyHistogram:](self, "addJoinerFailLatencyHistogram:", [v17 joinerFailLatencyHistogramAtIndex:m]);
  }
}

- (float)joinSuccessRate
{
  return self->_joinSuccessRate;
}

- (unsigned)joinAttempts
{
  return self->_joinAttempts;
}

@end