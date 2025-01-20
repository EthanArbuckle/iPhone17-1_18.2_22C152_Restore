@interface BPSPBApproxPercentileDigest
- (BOOL)hasBufferMultiplier;
- (BOOL)hasCentroidCount;
- (BOOL)hasMax;
- (BOOL)hasMin;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)centroidMeans;
- (float)centroidMeansAtIndex:(unint64_t)a3;
- (float)max;
- (float)min;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)centroidMeansCount;
- (unint64_t)centroidWeightsCount;
- (unint64_t)hash;
- (unsigned)bufferMultiplier;
- (unsigned)centroidCount;
- (unsigned)centroidWeights;
- (unsigned)centroidWeightsAtIndex:(unint64_t)a3;
- (void)addCentroidMeans:(float)a3;
- (void)addCentroidWeights:(unsigned int)a3;
- (void)clearCentroidMeans;
- (void)clearCentroidWeights;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBufferMultiplier:(unsigned int)a3;
- (void)setCentroidCount:(unsigned int)a3;
- (void)setCentroidMeans:(float *)a3 count:(unint64_t)a4;
- (void)setCentroidWeights:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setHasBufferMultiplier:(BOOL)a3;
- (void)setHasCentroidCount:(BOOL)a3;
- (void)setHasMax:(BOOL)a3;
- (void)setHasMin:(BOOL)a3;
- (void)setMax:(float)a3;
- (void)setMin:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation BPSPBApproxPercentileDigest

- (void)dealloc
{
  PBRepeatedFloatClear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)BPSPBApproxPercentileDigest;
  [(BPSPBApproxPercentileDigest *)&v3 dealloc];
}

- (void)setMin:(float)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_min = a3;
}

- (void)setHasMin:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMin
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setMax:(float)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_max = a3;
}

- (void)setHasMax:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMax
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setCentroidCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_centroidCount = a3;
}

- (void)setHasCentroidCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCentroidCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setBufferMultiplier:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_bufferMultiplier = a3;
}

- (void)setHasBufferMultiplier:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBufferMultiplier
{
  return *(unsigned char *)&self->_has & 1;
}

- (unint64_t)centroidMeansCount
{
  return self->_centroidMeans.count;
}

- (float)centroidMeans
{
  return self->_centroidMeans.list;
}

- (void)clearCentroidMeans
{
}

- (void)addCentroidMeans:(float)a3
{
}

- (float)centroidMeansAtIndex:(unint64_t)a3
{
  p_centroidMeans = &self->_centroidMeans;
  unint64_t count = self->_centroidMeans.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_centroidMeans->list[a3];
}

- (void)setCentroidMeans:(float *)a3 count:(unint64_t)a4
{
}

- (unint64_t)centroidWeightsCount
{
  return self->_centroidWeights.count;
}

- (unsigned)centroidWeights
{
  return self->_centroidWeights.list;
}

- (void)clearCentroidWeights
{
}

- (void)addCentroidWeights:(unsigned int)a3
{
}

- (unsigned)centroidWeightsAtIndex:(unint64_t)a3
{
  p_centroidWeights = &self->_centroidWeights;
  unint64_t count = self->_centroidWeights.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_centroidWeights->list[a3];
}

- (void)setCentroidWeights:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BPSPBApproxPercentileDigest;
  v4 = [(BPSPBApproxPercentileDigest *)&v8 description];
  v5 = [(BPSPBApproxPercentileDigest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(float *)&double v4 = self->_min;
    v10 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v10 forKey:@"min"];

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
  *(float *)&double v4 = self->_max;
  v11 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v11 forKey:@"max"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v12 = [NSNumber numberWithUnsignedInt:self->_centroidCount];
  [v3 setObject:v12 forKey:@"centroidCount"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_5:
    v6 = [NSNumber numberWithUnsignedInt:self->_bufferMultiplier];
    [v3 setObject:v6 forKey:@"bufferMultiplier"];
  }
LABEL_6:
  uint64_t v7 = PBRepeatedFloatNSArray();
  [v3 setObject:v7 forKey:@"centroidMeans"];

  objc_super v8 = PBRepeatedUInt32NSArray();
  [v3 setObject:v8 forKey:@"centroidWeights"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BPSPBApproxPercentileDigestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteFloatField();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  if (*(unsigned char *)&self->_has) {
LABEL_5:
  }
    PBDataWriterWriteUint32Field();
LABEL_6:
  if (self->_centroidMeans.count)
  {
    PBDataWriterPlaceMark();
    if (self->_centroidMeans.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteFloatField();
        ++v6;
      }
      while (v6 < self->_centroidMeans.count);
    }
    PBDataWriterRecallMark();
  }
  p_centroidWeights = &self->_centroidWeights;
  if (p_centroidWeights->count)
  {
    PBDataWriterPlaceMark();
    if (p_centroidWeights->count)
    {
      unint64_t v8 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v8;
      }
      while (v8 < p_centroidWeights->count);
    }
    PBDataWriterRecallMark();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[17] = LODWORD(self->_min);
    *((unsigned char *)v4 + 72) |= 8u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
LABEL_19:
      v4[15] = self->_centroidCount;
      *((unsigned char *)v4 + 72) |= 2u;
      if ((*(unsigned char *)&self->_has & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[16] = LODWORD(self->_max);
  *((unsigned char *)v4 + 72) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_19;
  }
LABEL_4:
  if (has)
  {
LABEL_5:
    v4[14] = self->_bufferMultiplier;
    *((unsigned char *)v4 + 72) |= 1u;
  }
LABEL_6:
  id v12 = v4;
  if ([(BPSPBApproxPercentileDigest *)self centroidMeansCount])
  {
    [v12 clearCentroidMeans];
    unint64_t v6 = [(BPSPBApproxPercentileDigest *)self centroidMeansCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        [(BPSPBApproxPercentileDigest *)self centroidMeansAtIndex:i];
        objc_msgSend(v12, "addCentroidMeans:");
      }
    }
  }
  if ([(BPSPBApproxPercentileDigest *)self centroidWeightsCount])
  {
    [v12 clearCentroidWeights];
    unint64_t v9 = [(BPSPBApproxPercentileDigest *)self centroidWeightsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
        objc_msgSend(v12, "addCentroidWeights:", -[BPSPBApproxPercentileDigest centroidWeightsAtIndex:](self, "centroidWeightsAtIndex:", j));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(float *)(v4 + 68) = self->_min;
    *(unsigned char *)(v4 + 72) |= 8u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(_DWORD *)(v4 + 60) = self->_centroidCount;
      *(unsigned char *)(v4 + 72) |= 2u;
      if ((*(unsigned char *)&self->_has & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(float *)(v4 + 64) = self->_max;
  *(unsigned char *)(v4 + 72) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if (has)
  {
LABEL_5:
    *(_DWORD *)(v4 + 56) = self->_bufferMultiplier;
    *(unsigned char *)(v4 + 72) |= 1u;
  }
LABEL_6:
  PBRepeatedFloatCopy();
  PBRepeatedUInt32Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 8) == 0 || self->_min != *((float *)v4 + 17)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 8) != 0)
  {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 4) == 0 || self->_max != *((float *)v4 + 16)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 4) != 0)
  {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 2) == 0 || self->_centroidCount != *((_DWORD *)v4 + 15)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 2) != 0)
  {
    goto LABEL_24;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 72) & 1) == 0 || self->_bufferMultiplier != *((_DWORD *)v4 + 14)) {
      goto LABEL_24;
    }
  }
  else if (*((unsigned char *)v4 + 72))
  {
    goto LABEL_24;
  }
  if (!PBRepeatedFloatIsEqual())
  {
LABEL_24:
    char IsEqual = 0;
    goto LABEL_25;
  }
  char IsEqual = PBRepeatedUInt32IsEqual();
LABEL_25:

  return IsEqual;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    float min = self->_min;
    float v6 = -min;
    if (min >= 0.0) {
      float v6 = self->_min;
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
  if ((has & 4) != 0)
  {
    float max = self->_max;
    float v11 = -max;
    if (max >= 0.0) {
      float v11 = self->_max;
    }
    float v12 = floorf(v11 + 0.5);
    float v13 = (float)(v11 - v12) * 1.8447e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmodf(v12, 1.8447e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabsf(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((has & 2) != 0)
  {
    uint64_t v14 = 2654435761 * self->_centroidCount;
    if (has) {
      goto LABEL_19;
    }
LABEL_21:
    uint64_t v15 = 0;
    goto LABEL_22;
  }
  uint64_t v14 = 0;
  if ((has & 1) == 0) {
    goto LABEL_21;
  }
LABEL_19:
  uint64_t v15 = 2654435761 * self->_bufferMultiplier;
LABEL_22:
  uint64_t v16 = v9 ^ v4 ^ v14 ^ v15 ^ PBRepeatedFloatHash();
  return v16 ^ PBRepeatedUInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 72);
  if ((v5 & 8) != 0)
  {
    self->_float min = *((float *)v4 + 17);
    *(unsigned char *)&self->_has |= 8u;
    char v5 = *((unsigned char *)v4 + 72);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_float max = *((float *)v4 + 16);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 72);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_17:
  self->_centroidCount = *((_DWORD *)v4 + 15);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)v4 + 72))
  {
LABEL_5:
    self->_bufferMultiplier = *((_DWORD *)v4 + 14);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_6:
  id v12 = v4;
  uint64_t v6 = [v4 centroidMeansCount];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
    {
      [v12 centroidMeansAtIndex:i];
      -[BPSPBApproxPercentileDigest addCentroidMeans:](self, "addCentroidMeans:");
    }
  }
  uint64_t v9 = [v12 centroidWeightsCount];
  if (v9)
  {
    uint64_t v10 = v9;
    for (uint64_t j = 0; j != v10; ++j)
      -[BPSPBApproxPercentileDigest addCentroidWeights:](self, "addCentroidWeights:", [v12 centroidWeightsAtIndex:j]);
  }
}

- (float)min
{
  return self->_min;
}

- (float)max
{
  return self->_max;
}

- (unsigned)centroidCount
{
  return self->_centroidCount;
}

- (unsigned)bufferMultiplier
{
  return self->_bufferMultiplier;
}

@end