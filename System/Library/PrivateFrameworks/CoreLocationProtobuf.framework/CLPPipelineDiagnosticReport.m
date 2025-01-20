@interface CLPPipelineDiagnosticReport
- (BOOL)hasPfYieldStatusBeforeCalculatePose;
- (BOOL)hasPrbCoarseIndoorSaysIndoor;
- (BOOL)hasPrbGpsSaysIndoor;
- (BOOL)hasPrbInjectionGainRetryLimitOk;
- (BOOL)hasPrbInjectionOccupancyRetryLimitOk;
- (BOOL)hasPrbInlierEstimate;
- (BOOL)hasPrbLocalizerIoWrapperSaysWifiOk;
- (BOOL)hasPrbOnFloorsEstimate;
- (BOOL)hasPrbParticleFilterSaysYield;
- (BOOL)hasPrbPipelinedSaysYield;
- (BOOL)hasPrbWifiSaysIndoor;
- (BOOL)hasYieldStatusBeforeCalculatePose;
- (BOOL)hasYieldType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)prbCoarseIndoorSaysIndoor;
- (double)prbGpsSaysIndoor;
- (double)prbInjectionGainRetryLimitOk;
- (double)prbInjectionOccupancyRetryLimitOk;
- (double)prbInlierEstimate;
- (double)prbLocalizerIoWrapperSaysWifiOk;
- (double)prbOnFloorEstimateAtIndex:(unint64_t)a3;
- (double)prbOnFloorEstimates;
- (double)prbOnFloorsEstimate;
- (double)prbParticleFilterSaysYield;
- (double)prbPipelinedSaysYield;
- (double)prbWifiSaysIndoor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)pfYieldStatusBeforeCalculatePoseAsString:(int)a3;
- (id)yieldStatusBeforeCalculatePoseAsString:(int)a3;
- (id)yieldTypeAsString:(int)a3;
- (int)StringAsPfYieldStatusBeforeCalculatePose:(id)a3;
- (int)StringAsYieldStatusBeforeCalculatePose:(id)a3;
- (int)StringAsYieldType:(id)a3;
- (int)pfYieldStatusBeforeCalculatePose;
- (int)yieldStatusBeforeCalculatePose;
- (int)yieldType;
- (unint64_t)hash;
- (unint64_t)prbOnFloorEstimatesCount;
- (void)addPrbOnFloorEstimate:(double)a3;
- (void)clearPrbOnFloorEstimates;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasPfYieldStatusBeforeCalculatePose:(BOOL)a3;
- (void)setHasPrbCoarseIndoorSaysIndoor:(BOOL)a3;
- (void)setHasPrbGpsSaysIndoor:(BOOL)a3;
- (void)setHasPrbInjectionGainRetryLimitOk:(BOOL)a3;
- (void)setHasPrbInjectionOccupancyRetryLimitOk:(BOOL)a3;
- (void)setHasPrbInlierEstimate:(BOOL)a3;
- (void)setHasPrbLocalizerIoWrapperSaysWifiOk:(BOOL)a3;
- (void)setHasPrbOnFloorsEstimate:(BOOL)a3;
- (void)setHasPrbParticleFilterSaysYield:(BOOL)a3;
- (void)setHasPrbPipelinedSaysYield:(BOOL)a3;
- (void)setHasPrbWifiSaysIndoor:(BOOL)a3;
- (void)setHasYieldStatusBeforeCalculatePose:(BOOL)a3;
- (void)setHasYieldType:(BOOL)a3;
- (void)setPfYieldStatusBeforeCalculatePose:(int)a3;
- (void)setPrbCoarseIndoorSaysIndoor:(double)a3;
- (void)setPrbGpsSaysIndoor:(double)a3;
- (void)setPrbInjectionGainRetryLimitOk:(double)a3;
- (void)setPrbInjectionOccupancyRetryLimitOk:(double)a3;
- (void)setPrbInlierEstimate:(double)a3;
- (void)setPrbLocalizerIoWrapperSaysWifiOk:(double)a3;
- (void)setPrbOnFloorEstimates:(double *)a3 count:(unint64_t)a4;
- (void)setPrbOnFloorsEstimate:(double)a3;
- (void)setPrbParticleFilterSaysYield:(double)a3;
- (void)setPrbPipelinedSaysYield:(double)a3;
- (void)setPrbWifiSaysIndoor:(double)a3;
- (void)setYieldStatusBeforeCalculatePose:(int)a3;
- (void)setYieldType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPPipelineDiagnosticReport

- (void)dealloc
{
  PBRepeatedDoubleClear();
  v3.receiver = self;
  v3.super_class = (Class)CLPPipelineDiagnosticReport;
  [(CLPPipelineDiagnosticReport *)&v3 dealloc];
}

- (int)yieldType
{
  if ((*(_WORD *)&self->_has & 0x1000) != 0) {
    return self->_yieldType;
  }
  else {
    return 0;
  }
}

- (void)setYieldType:(int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_yieldType = a3;
}

- (void)setHasYieldType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasYieldType
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (id)yieldTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E6C36048[a3];
  }

  return v3;
}

- (int)StringAsYieldType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"YieldTypeUnknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"YieldTypePrimary"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"YieldTypeAuxilary"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"YieldTypeDeadReckoning"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setPrbPipelinedSaysYield:(double)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_prbPipelinedSaysYield = a3;
}

- (void)setHasPrbPipelinedSaysYield:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasPrbPipelinedSaysYield
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setPrbCoarseIndoorSaysIndoor:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_prbCoarseIndoorSaysIndoor = a3;
}

- (void)setHasPrbCoarseIndoorSaysIndoor:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasPrbCoarseIndoorSaysIndoor
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setPrbWifiSaysIndoor:(double)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_prbWifiSaysIndoor = a3;
}

- (void)setHasPrbWifiSaysIndoor:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasPrbWifiSaysIndoor
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setPrbGpsSaysIndoor:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_prbGpsSaysIndoor = a3;
}

- (void)setHasPrbGpsSaysIndoor:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasPrbGpsSaysIndoor
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setPrbParticleFilterSaysYield:(double)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_prbParticleFilterSaysYield = a3;
}

- (void)setHasPrbParticleFilterSaysYield:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasPrbParticleFilterSaysYield
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setPrbOnFloorsEstimate:(double)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_prbOnFloorsEstimate = a3;
}

- (void)setHasPrbOnFloorsEstimate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasPrbOnFloorsEstimate
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (unint64_t)prbOnFloorEstimatesCount
{
  return self->_prbOnFloorEstimates.count;
}

- (double)prbOnFloorEstimates
{
  return self->_prbOnFloorEstimates.list;
}

- (void)clearPrbOnFloorEstimates
{
}

- (void)addPrbOnFloorEstimate:(double)a3
{
}

- (double)prbOnFloorEstimateAtIndex:(unint64_t)a3
{
  p_prbOnFloorEstimates = &self->_prbOnFloorEstimates;
  unint64_t count = self->_prbOnFloorEstimates.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_prbOnFloorEstimates->list[a3];
}

- (void)setPrbOnFloorEstimates:(double *)a3 count:(unint64_t)a4
{
}

- (void)setPrbInlierEstimate:(double)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_prbInlierEstimate = a3;
}

- (void)setHasPrbInlierEstimate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasPrbInlierEstimate
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setPrbLocalizerIoWrapperSaysWifiOk:(double)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_prbLocalizerIoWrapperSaysWifiOk = a3;
}

- (void)setHasPrbLocalizerIoWrapperSaysWifiOk:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasPrbLocalizerIoWrapperSaysWifiOk
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setPrbInjectionOccupancyRetryLimitOk:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_prbInjectionOccupancyRetryLimitOk = a3;
}

- (void)setHasPrbInjectionOccupancyRetryLimitOk:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasPrbInjectionOccupancyRetryLimitOk
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setPrbInjectionGainRetryLimitOk:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_prbInjectionGainRetryLimitOk = a3;
}

- (void)setHasPrbInjectionGainRetryLimitOk:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasPrbInjectionGainRetryLimitOk
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (int)pfYieldStatusBeforeCalculatePose
{
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
    return self->_pfYieldStatusBeforeCalculatePose;
  }
  else {
    return 0;
  }
}

- (void)setPfYieldStatusBeforeCalculatePose:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_pfYieldStatusBeforeCalculatePose = a3;
}

- (void)setHasPfYieldStatusBeforeCalculatePose:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasPfYieldStatusBeforeCalculatePose
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (id)pfYieldStatusBeforeCalculatePoseAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E6C36068[a3];
  }

  return v3;
}

- (int)StringAsPfYieldStatusBeforeCalculatePose:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"YieldStatusUnknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"YieldStatusOK"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"YieldStatusLow"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"YieldStatusOffmap"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"YieldStatusNone"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)yieldStatusBeforeCalculatePose
{
  if ((*(_WORD *)&self->_has & 0x800) != 0) {
    return self->_yieldStatusBeforeCalculatePose;
  }
  else {
    return 0;
  }
}

- (void)setYieldStatusBeforeCalculatePose:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_yieldStatusBeforeCalculatePose = a3;
}

- (void)setHasYieldStatusBeforeCalculatePose:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasYieldStatusBeforeCalculatePose
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (id)yieldStatusBeforeCalculatePoseAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E6C36068[a3];
  }

  return v3;
}

- (int)StringAsYieldStatusBeforeCalculatePose:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"YieldStatusUnknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"YieldStatusOK"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"YieldStatusLow"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"YieldStatusOffmap"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"YieldStatusNone"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPPipelineDiagnosticReport;
  int v4 = [(CLPPipelineDiagnosticReport *)&v8 description];
  v5 = [(CLPPipelineDiagnosticReport *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
  {
    uint64_t yieldType = self->_yieldType;
    if (yieldType >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_yieldType);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E6C36048[yieldType];
    }
    [v3 setObject:v6 forKey:@"yieldType"];

    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x100) != 0)
  {
    v10 = [NSNumber numberWithDouble:self->_prbPipelinedSaysYield];
    [v3 setObject:v10 forKey:@"prbPipelinedSaysYield"];

    __int16 has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_8:
      if ((has & 0x200) == 0) {
        goto LABEL_9;
      }
      goto LABEL_22;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_8;
  }
  v11 = [NSNumber numberWithDouble:self->_prbCoarseIndoorSaysIndoor];
  [v3 setObject:v11 forKey:@"prbCoarseIndoorSaysIndoor"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  v12 = [NSNumber numberWithDouble:self->_prbWifiSaysIndoor];
  [v3 setObject:v12 forKey:@"prbWifiSaysIndoor"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  v13 = [NSNumber numberWithDouble:self->_prbGpsSaysIndoor];
  [v3 setObject:v13 forKey:@"prbGpsSaysIndoor"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_24:
  v14 = [NSNumber numberWithDouble:self->_prbParticleFilterSaysYield];
  [v3 setObject:v14 forKey:@"prbParticleFilterSaysYield"];

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_12:
    uint64_t v7 = [NSNumber numberWithDouble:self->_prbOnFloorsEstimate];
    [v3 setObject:v7 forKey:@"prbOnFloorsEstimate"];
  }
LABEL_13:
  objc_super v8 = PBRepeatedDoubleNSArray();
  [v3 setObject:v8 forKey:@"prbOnFloorEstimate"];

  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x10) != 0)
  {
    v15 = [NSNumber numberWithDouble:self->_prbInlierEstimate];
    [v3 setObject:v15 forKey:@"prbInlierEstimate"];

    __int16 v9 = (__int16)self->_has;
    if ((v9 & 0x20) == 0)
    {
LABEL_15:
      if ((v9 & 8) == 0) {
        goto LABEL_16;
      }
      goto LABEL_28;
    }
  }
  else if ((v9 & 0x20) == 0)
  {
    goto LABEL_15;
  }
  v16 = [NSNumber numberWithDouble:self->_prbLocalizerIoWrapperSaysWifiOk];
  [v3 setObject:v16 forKey:@"prbLocalizerIoWrapperSaysWifiOk"];

  __int16 v9 = (__int16)self->_has;
  if ((v9 & 8) == 0)
  {
LABEL_16:
    if ((v9 & 4) == 0) {
      goto LABEL_17;
    }
    goto LABEL_29;
  }
LABEL_28:
  v17 = [NSNumber numberWithDouble:self->_prbInjectionOccupancyRetryLimitOk];
  [v3 setObject:v17 forKey:@"prbInjectionOccupancyRetryLimitOk"];

  __int16 v9 = (__int16)self->_has;
  if ((v9 & 4) == 0)
  {
LABEL_17:
    if ((v9 & 0x400) == 0) {
      goto LABEL_18;
    }
LABEL_30:
    uint64_t pfYieldStatusBeforeCalculatePose = self->_pfYieldStatusBeforeCalculatePose;
    if (pfYieldStatusBeforeCalculatePose >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_pfYieldStatusBeforeCalculatePose);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = off_1E6C36068[pfYieldStatusBeforeCalculatePose];
    }
    [v3 setObject:v20 forKey:@"pfYieldStatusBeforeCalculatePose"];

    if ((*(_WORD *)&self->_has & 0x800) == 0) {
      goto LABEL_38;
    }
    goto LABEL_34;
  }
LABEL_29:
  v18 = [NSNumber numberWithDouble:self->_prbInjectionGainRetryLimitOk];
  [v3 setObject:v18 forKey:@"prbInjectionGainRetryLimitOk"];

  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x400) != 0) {
    goto LABEL_30;
  }
LABEL_18:
  if ((v9 & 0x800) != 0)
  {
LABEL_34:
    uint64_t yieldStatusBeforeCalculatePose = self->_yieldStatusBeforeCalculatePose;
    if (yieldStatusBeforeCalculatePose >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_yieldStatusBeforeCalculatePose);
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = off_1E6C36068[yieldStatusBeforeCalculatePose];
    }
    [v3 setObject:v22 forKey:@"yieldStatusBeforeCalculatePose"];
  }
LABEL_38:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPPipelineDiagnosticReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_27:
  PBDataWriterWriteDoubleField();
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
LABEL_8:
  }
    PBDataWriterWriteDoubleField();
LABEL_9:
  if (self->_prbOnFloorEstimates.count)
  {
    PBDataWriterPlaceMark();
    if (self->_prbOnFloorEstimates.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteDoubleField();
        ++v6;
      }
      while (v6 < self->_prbOnFloorEstimates.count);
    }
    PBDataWriterRecallMark();
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x10) != 0)
  {
    PBDataWriterWriteDoubleField();
    __int16 v7 = (__int16)self->_has;
    if ((v7 & 0x20) == 0)
    {
LABEL_16:
      if ((v7 & 8) == 0) {
        goto LABEL_17;
      }
      goto LABEL_31;
    }
  }
  else if ((v7 & 0x20) == 0)
  {
    goto LABEL_16;
  }
  PBDataWriterWriteDoubleField();
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 8) == 0)
  {
LABEL_17:
    if ((v7 & 4) == 0) {
      goto LABEL_18;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteDoubleField();
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 4) == 0)
  {
LABEL_18:
    if ((v7 & 0x400) == 0) {
      goto LABEL_19;
    }
LABEL_33:
    PBDataWriterWriteInt32Field();
    if ((*(_WORD *)&self->_has & 0x800) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_32:
  PBDataWriterWriteDoubleField();
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x400) != 0) {
    goto LABEL_33;
  }
LABEL_19:
  if ((v7 & 0x800) != 0) {
LABEL_20:
  }
    PBDataWriterWriteInt32Field();
LABEL_21:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
  {
    v4[30] = self->_yieldType;
    *((_WORD *)v4 + 62) |= 0x1000u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_25;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  *((void *)v4 + 12) = *(void *)&self->_prbPipelinedSaysYield;
  *((_WORD *)v4 + 62) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((void *)v4 + 4) = *(void *)&self->_prbCoarseIndoorSaysIndoor;
  *((_WORD *)v4 + 62) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((void *)v4 + 13) = *(void *)&self->_prbWifiSaysIndoor;
  *((_WORD *)v4 + 62) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0) {
      goto LABEL_7;
    }
LABEL_28:
    *((void *)v4 + 11) = *(void *)&self->_prbParticleFilterSaysYield;
    *((_WORD *)v4 + 62) |= 0x80u;
    if ((*(_WORD *)&self->_has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_27:
  *((void *)v4 + 5) = *(void *)&self->_prbGpsSaysIndoor;
  *((_WORD *)v4 + 62) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) != 0) {
    goto LABEL_28;
  }
LABEL_7:
  if ((has & 0x40) != 0)
  {
LABEL_8:
    *((void *)v4 + 10) = *(void *)&self->_prbOnFloorsEstimate;
    *((_WORD *)v4 + 62) |= 0x40u;
  }
LABEL_9:
  id v10 = v4;
  if ([(CLPPipelineDiagnosticReport *)self prbOnFloorEstimatesCount])
  {
    [v10 clearPrbOnFloorEstimates];
    unint64_t v6 = [(CLPPipelineDiagnosticReport *)self prbOnFloorEstimatesCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        [(CLPPipelineDiagnosticReport *)self prbOnFloorEstimateAtIndex:i];
        objc_msgSend(v10, "addPrbOnFloorEstimate:");
      }
    }
  }
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x10) != 0)
  {
    *((void *)v10 + 8) = *(void *)&self->_prbInlierEstimate;
    *((_WORD *)v10 + 62) |= 0x10u;
    __int16 v9 = (__int16)self->_has;
    if ((v9 & 0x20) == 0)
    {
LABEL_15:
      if ((v9 & 8) == 0) {
        goto LABEL_16;
      }
      goto LABEL_32;
    }
  }
  else if ((v9 & 0x20) == 0)
  {
    goto LABEL_15;
  }
  *((void *)v10 + 9) = *(void *)&self->_prbLocalizerIoWrapperSaysWifiOk;
  *((_WORD *)v10 + 62) |= 0x20u;
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 8) == 0)
  {
LABEL_16:
    if ((v9 & 4) == 0) {
      goto LABEL_17;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((void *)v10 + 7) = *(void *)&self->_prbInjectionOccupancyRetryLimitOk;
  *((_WORD *)v10 + 62) |= 8u;
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 4) == 0)
  {
LABEL_17:
    if ((v9 & 0x400) == 0) {
      goto LABEL_18;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((void *)v10 + 6) = *(void *)&self->_prbInjectionGainRetryLimitOk;
  *((_WORD *)v10 + 62) |= 4u;
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x400) == 0)
  {
LABEL_18:
    if ((v9 & 0x800) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_34:
  *((_DWORD *)v10 + 28) = self->_pfYieldStatusBeforeCalculatePose;
  *((_WORD *)v10 + 62) |= 0x400u;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_19:
    *((_DWORD *)v10 + 29) = self->_yieldStatusBeforeCalculatePose;
    *((_WORD *)v10 + 62) |= 0x800u;
  }
LABEL_20:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = v4;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
  {
    *(_DWORD *)(v4 + 120) = self->_yieldType;
    *(_WORD *)(v4 + 124) |= 0x1000u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v4 + 96) = self->_prbPipelinedSaysYield;
  *(_WORD *)(v4 + 124) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  *(double *)(v4 + 32) = self->_prbCoarseIndoorSaysIndoor;
  *(_WORD *)(v4 + 124) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  *(double *)(v4 + 104) = self->_prbWifiSaysIndoor;
  *(_WORD *)(v4 + 124) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  *(double *)(v4 + 40) = self->_prbGpsSaysIndoor;
  *(_WORD *)(v4 + 124) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_22:
  *(double *)(v4 + 88) = self->_prbParticleFilterSaysYield;
  *(_WORD *)(v4 + 124) |= 0x80u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_8:
    *(double *)(v4 + 80) = self->_prbOnFloorsEstimate;
    *(_WORD *)(v4 + 124) |= 0x40u;
  }
LABEL_9:
  PBRepeatedDoubleCopy();
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x10) != 0)
  {
    *(double *)(v5 + 64) = self->_prbInlierEstimate;
    *(_WORD *)(v5 + 124) |= 0x10u;
    __int16 v7 = (__int16)self->_has;
    if ((v7 & 0x20) == 0)
    {
LABEL_11:
      if ((v7 & 8) == 0) {
        goto LABEL_12;
      }
      goto LABEL_26;
    }
  }
  else if ((v7 & 0x20) == 0)
  {
    goto LABEL_11;
  }
  *(double *)(v5 + 72) = self->_prbLocalizerIoWrapperSaysWifiOk;
  *(_WORD *)(v5 + 124) |= 0x20u;
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 8) == 0)
  {
LABEL_12:
    if ((v7 & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_27;
  }
LABEL_26:
  *(double *)(v5 + 56) = self->_prbInjectionOccupancyRetryLimitOk;
  *(_WORD *)(v5 + 124) |= 8u;
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 4) == 0)
  {
LABEL_13:
    if ((v7 & 0x400) == 0) {
      goto LABEL_14;
    }
LABEL_28:
    *(_DWORD *)(v5 + 112) = self->_pfYieldStatusBeforeCalculatePose;
    *(_WORD *)(v5 + 124) |= 0x400u;
    if ((*(_WORD *)&self->_has & 0x800) == 0) {
      return (id)v5;
    }
    goto LABEL_15;
  }
LABEL_27:
  *(double *)(v5 + 48) = self->_prbInjectionGainRetryLimitOk;
  *(_WORD *)(v5 + 124) |= 4u;
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x400) != 0) {
    goto LABEL_28;
  }
LABEL_14:
  if ((v7 & 0x800) != 0)
  {
LABEL_15:
    *(_DWORD *)(v5 + 116) = self->_yieldStatusBeforeCalculatePose;
    *(_WORD *)(v5 + 124) |= 0x800u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_68;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 62);
  if ((has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 62) & 0x1000) == 0 || self->_yieldType != *((_DWORD *)v4 + 30)) {
      goto LABEL_68;
    }
  }
  else if ((*((_WORD *)v4 + 62) & 0x1000) != 0)
  {
    goto LABEL_68;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 62) & 0x100) == 0 || self->_prbPipelinedSaysYield != *((double *)v4 + 12)) {
      goto LABEL_68;
    }
  }
  else if ((*((_WORD *)v4 + 62) & 0x100) != 0)
  {
    goto LABEL_68;
  }
  if (has)
  {
    if ((v6 & 1) == 0 || self->_prbCoarseIndoorSaysIndoor != *((double *)v4 + 4)) {
      goto LABEL_68;
    }
  }
  else if (v6)
  {
    goto LABEL_68;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 62) & 0x200) == 0 || self->_prbWifiSaysIndoor != *((double *)v4 + 13)) {
      goto LABEL_68;
    }
  }
  else if ((*((_WORD *)v4 + 62) & 0x200) != 0)
  {
    goto LABEL_68;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_prbGpsSaysIndoor != *((double *)v4 + 5)) {
      goto LABEL_68;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_68;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_prbParticleFilterSaysYield != *((double *)v4 + 11)) {
      goto LABEL_68;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_68;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_prbOnFloorsEstimate != *((double *)v4 + 10)) {
      goto LABEL_68;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_68;
  }
  if (!PBRepeatedDoubleIsEqual())
  {
LABEL_68:
    BOOL v9 = 0;
    goto LABEL_69;
  }
  __int16 v7 = (__int16)self->_has;
  __int16 v8 = *((_WORD *)v4 + 62);
  if ((v7 & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_prbInlierEstimate != *((double *)v4 + 8)) {
      goto LABEL_68;
    }
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_68;
  }
  if ((v7 & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_prbLocalizerIoWrapperSaysWifiOk != *((double *)v4 + 9)) {
      goto LABEL_68;
    }
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_68;
  }
  if ((v7 & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_prbInjectionOccupancyRetryLimitOk != *((double *)v4 + 7)) {
      goto LABEL_68;
    }
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_68;
  }
  if ((v7 & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_prbInjectionGainRetryLimitOk != *((double *)v4 + 6)) {
      goto LABEL_68;
    }
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_68;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 62) & 0x400) == 0 || self->_pfYieldStatusBeforeCalculatePose != *((_DWORD *)v4 + 28)) {
      goto LABEL_68;
    }
  }
  else if ((*((_WORD *)v4 + 62) & 0x400) != 0)
  {
    goto LABEL_68;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 62) & 0x800) == 0 || self->_yieldStatusBeforeCalculatePose != *((_DWORD *)v4 + 29)) {
      goto LABEL_68;
    }
    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = (v8 & 0x800) == 0;
  }
LABEL_69:

  return v9;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
  {
    uint64_t v62 = 2654435761 * self->_yieldType;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v8 = 0;
    goto LABEL_11;
  }
  uint64_t v62 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double prbPipelinedSaysYield = self->_prbPipelinedSaysYield;
  double v5 = -prbPipelinedSaysYield;
  if (prbPipelinedSaysYield >= 0.0) {
    double v5 = self->_prbPipelinedSaysYield;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      v8 += (unint64_t)v7;
    }
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_11:
  if (has)
  {
    double prbCoarseIndoorSaysIndoor = self->_prbCoarseIndoorSaysIndoor;
    double v11 = -prbCoarseIndoorSaysIndoor;
    if (prbCoarseIndoorSaysIndoor >= 0.0) {
      double v11 = self->_prbCoarseIndoorSaysIndoor;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((has & 0x200) != 0)
  {
    double prbWifiSaysIndoor = self->_prbWifiSaysIndoor;
    double v16 = -prbWifiSaysIndoor;
    if (prbWifiSaysIndoor >= 0.0) {
      double v16 = self->_prbWifiSaysIndoor;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  if ((has & 2) != 0)
  {
    double prbGpsSaysIndoor = self->_prbGpsSaysIndoor;
    double v21 = -prbGpsSaysIndoor;
    if (prbGpsSaysIndoor >= 0.0) {
      double v21 = self->_prbGpsSaysIndoor;
    }
    long double v22 = floor(v21 + 0.5);
    double v23 = (v21 - v22) * 1.84467441e19;
    unint64_t v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v19 += (unint64_t)v23;
      }
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }
  if ((has & 0x80) != 0)
  {
    double prbParticleFilterSaysYield = self->_prbParticleFilterSaysYield;
    double v26 = -prbParticleFilterSaysYield;
    if (prbParticleFilterSaysYield >= 0.0) {
      double v26 = self->_prbParticleFilterSaysYield;
    }
    long double v27 = floor(v26 + 0.5);
    double v28 = (v26 - v27) * 1.84467441e19;
    unint64_t v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0) {
        v24 += (unint64_t)v28;
      }
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    unint64_t v24 = 0;
  }
  unint64_t v61 = v8;
  if ((has & 0x40) != 0)
  {
    double prbOnFloorsEstimate = self->_prbOnFloorsEstimate;
    double v31 = -prbOnFloorsEstimate;
    if (prbOnFloorsEstimate >= 0.0) {
      double v31 = self->_prbOnFloorsEstimate;
    }
    long double v32 = floor(v31 + 0.5);
    double v33 = (v31 - v32) * 1.84467441e19;
    unint64_t v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0) {
        v29 += (unint64_t)v33;
      }
    }
    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }
  else
  {
    unint64_t v29 = 0;
  }
  unint64_t v60 = v14;
  uint64_t v59 = PBRepeatedDoubleHash();
  __int16 v34 = (__int16)self->_has;
  if ((v34 & 0x10) != 0)
  {
    double prbInlierEstimate = self->_prbInlierEstimate;
    double v37 = -prbInlierEstimate;
    if (prbInlierEstimate >= 0.0) {
      double v37 = self->_prbInlierEstimate;
    }
    long double v38 = floor(v37 + 0.5);
    double v39 = (v37 - v38) * 1.84467441e19;
    unint64_t v35 = 2654435761u * (unint64_t)fmod(v38, 1.84467441e19);
    if (v39 >= 0.0)
    {
      if (v39 > 0.0) {
        v35 += (unint64_t)v39;
      }
    }
    else
    {
      v35 -= (unint64_t)fabs(v39);
    }
  }
  else
  {
    unint64_t v35 = 0;
  }
  if ((v34 & 0x20) != 0)
  {
    double prbLocalizerIoWrapperSaysWifiOk = self->_prbLocalizerIoWrapperSaysWifiOk;
    double v42 = -prbLocalizerIoWrapperSaysWifiOk;
    if (prbLocalizerIoWrapperSaysWifiOk >= 0.0) {
      double v42 = self->_prbLocalizerIoWrapperSaysWifiOk;
    }
    long double v43 = floor(v42 + 0.5);
    double v44 = (v42 - v43) * 1.84467441e19;
    unint64_t v40 = 2654435761u * (unint64_t)fmod(v43, 1.84467441e19);
    if (v44 >= 0.0)
    {
      if (v44 > 0.0) {
        v40 += (unint64_t)v44;
      }
    }
    else
    {
      v40 -= (unint64_t)fabs(v44);
    }
  }
  else
  {
    unint64_t v40 = 0;
  }
  unint64_t v45 = v19;
  if ((v34 & 8) != 0)
  {
    double prbInjectionOccupancyRetryLimitOk = self->_prbInjectionOccupancyRetryLimitOk;
    double v48 = -prbInjectionOccupancyRetryLimitOk;
    if (prbInjectionOccupancyRetryLimitOk >= 0.0) {
      double v48 = self->_prbInjectionOccupancyRetryLimitOk;
    }
    long double v49 = floor(v48 + 0.5);
    double v50 = (v48 - v49) * 1.84467441e19;
    unint64_t v46 = 2654435761u * (unint64_t)fmod(v49, 1.84467441e19);
    if (v50 >= 0.0)
    {
      if (v50 > 0.0) {
        v46 += (unint64_t)v50;
      }
    }
    else
    {
      v46 -= (unint64_t)fabs(v50);
    }
  }
  else
  {
    unint64_t v46 = 0;
  }
  if ((v34 & 4) != 0)
  {
    double prbInjectionGainRetryLimitOk = self->_prbInjectionGainRetryLimitOk;
    double v53 = -prbInjectionGainRetryLimitOk;
    if (prbInjectionGainRetryLimitOk >= 0.0) {
      double v53 = self->_prbInjectionGainRetryLimitOk;
    }
    long double v54 = floor(v53 + 0.5);
    double v55 = (v53 - v54) * 1.84467441e19;
    unint64_t v51 = 2654435761u * (unint64_t)fmod(v54, 1.84467441e19);
    if (v55 >= 0.0)
    {
      if (v55 > 0.0) {
        v51 += (unint64_t)v55;
      }
    }
    else
    {
      v51 -= (unint64_t)fabs(v55);
    }
  }
  else
  {
    unint64_t v51 = 0;
  }
  if ((v34 & 0x400) != 0)
  {
    uint64_t v56 = 2654435761 * self->_pfYieldStatusBeforeCalculatePose;
    if ((v34 & 0x800) != 0) {
      goto LABEL_85;
    }
LABEL_87:
    uint64_t v57 = 0;
    return v61 ^ v62 ^ v9 ^ v60 ^ v45 ^ v24 ^ v29 ^ v35 ^ v40 ^ v46 ^ v51 ^ v59 ^ v56 ^ v57;
  }
  uint64_t v56 = 0;
  if ((v34 & 0x800) == 0) {
    goto LABEL_87;
  }
LABEL_85:
  uint64_t v57 = 2654435761 * self->_yieldStatusBeforeCalculatePose;
  return v61 ^ v62 ^ v9 ^ v60 ^ v45 ^ v24 ^ v29 ^ v35 ^ v40 ^ v46 ^ v51 ^ v59 ^ v56 ^ v57;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 62);
  if ((v5 & 0x1000) != 0)
  {
    self->_uint64_t yieldType = *((_DWORD *)v4 + 30);
    *(_WORD *)&self->_has |= 0x1000u;
    __int16 v5 = *((_WORD *)v4 + 62);
    if ((v5 & 0x100) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((*((_WORD *)v4 + 62) & 0x100) == 0)
  {
    goto LABEL_3;
  }
  self->_double prbPipelinedSaysYield = *((double *)v4 + 12);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)v4 + 62);
  if ((v5 & 1) == 0)
  {
LABEL_4:
    if ((v5 & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_double prbCoarseIndoorSaysIndoor = *((double *)v4 + 4);
  *(_WORD *)&self->_has |= 1u;
  __int16 v5 = *((_WORD *)v4 + 62);
  if ((v5 & 0x200) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_double prbWifiSaysIndoor = *((double *)v4 + 13);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v5 = *((_WORD *)v4 + 62);
  if ((v5 & 2) == 0)
  {
LABEL_6:
    if ((v5 & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_double prbGpsSaysIndoor = *((double *)v4 + 5);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)v4 + 62);
  if ((v5 & 0x80) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_27:
  self->_double prbParticleFilterSaysYield = *((double *)v4 + 11);
  *(_WORD *)&self->_has |= 0x80u;
  if ((*((_WORD *)v4 + 62) & 0x40) != 0)
  {
LABEL_8:
    self->_double prbOnFloorsEstimate = *((double *)v4 + 10);
    *(_WORD *)&self->_has |= 0x40u;
  }
LABEL_9:
  id v10 = v4;
  uint64_t v6 = [v4 prbOnFloorEstimatesCount];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
    {
      [v10 prbOnFloorEstimateAtIndex:i];
      -[CLPPipelineDiagnosticReport addPrbOnFloorEstimate:](self, "addPrbOnFloorEstimate:");
    }
  }
  __int16 v9 = *((_WORD *)v10 + 62);
  if ((v9 & 0x10) != 0)
  {
    self->_double prbInlierEstimate = *((double *)v10 + 8);
    *(_WORD *)&self->_has |= 0x10u;
    __int16 v9 = *((_WORD *)v10 + 62);
    if ((v9 & 0x20) == 0)
    {
LABEL_14:
      if ((v9 & 8) == 0) {
        goto LABEL_15;
      }
      goto LABEL_31;
    }
  }
  else if ((v9 & 0x20) == 0)
  {
    goto LABEL_14;
  }
  self->_double prbLocalizerIoWrapperSaysWifiOk = *((double *)v10 + 9);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v9 = *((_WORD *)v10 + 62);
  if ((v9 & 8) == 0)
  {
LABEL_15:
    if ((v9 & 4) == 0) {
      goto LABEL_16;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_double prbInjectionOccupancyRetryLimitOk = *((double *)v10 + 7);
  *(_WORD *)&self->_has |= 8u;
  __int16 v9 = *((_WORD *)v10 + 62);
  if ((v9 & 4) == 0)
  {
LABEL_16:
    if ((v9 & 0x400) == 0) {
      goto LABEL_17;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_double prbInjectionGainRetryLimitOk = *((double *)v10 + 6);
  *(_WORD *)&self->_has |= 4u;
  __int16 v9 = *((_WORD *)v10 + 62);
  if ((v9 & 0x400) == 0)
  {
LABEL_17:
    if ((v9 & 0x800) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_33:
  self->_uint64_t pfYieldStatusBeforeCalculatePose = *((_DWORD *)v10 + 28);
  *(_WORD *)&self->_has |= 0x400u;
  if ((*((_WORD *)v10 + 62) & 0x800) != 0)
  {
LABEL_18:
    self->_uint64_t yieldStatusBeforeCalculatePose = *((_DWORD *)v10 + 29);
    *(_WORD *)&self->_has |= 0x800u;
  }
LABEL_19:
}

- (double)prbPipelinedSaysYield
{
  return self->_prbPipelinedSaysYield;
}

- (double)prbCoarseIndoorSaysIndoor
{
  return self->_prbCoarseIndoorSaysIndoor;
}

- (double)prbWifiSaysIndoor
{
  return self->_prbWifiSaysIndoor;
}

- (double)prbGpsSaysIndoor
{
  return self->_prbGpsSaysIndoor;
}

- (double)prbParticleFilterSaysYield
{
  return self->_prbParticleFilterSaysYield;
}

- (double)prbOnFloorsEstimate
{
  return self->_prbOnFloorsEstimate;
}

- (double)prbInlierEstimate
{
  return self->_prbInlierEstimate;
}

- (double)prbLocalizerIoWrapperSaysWifiOk
{
  return self->_prbLocalizerIoWrapperSaysWifiOk;
}

- (double)prbInjectionOccupancyRetryLimitOk
{
  return self->_prbInjectionOccupancyRetryLimitOk;
}

- (double)prbInjectionGainRetryLimitOk
{
  return self->_prbInjectionGainRetryLimitOk;
}

@end