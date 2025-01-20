@interface SGMIMetricsAggregatedAccuracyLogs
- (BOOL)hasActiveAggregatedAccuracyLogForThePastFourWeeks;
- (BOOL)hasActiveAggregatedAccuracyLogSinceModelInitialization;
- (BOOL)hasActiveTrialMetadata;
- (BOOL)hasBackgroundAggregatedAccuracyLogForThePastFourWeeks;
- (BOOL)hasBackgroundAggregatedAccuracyLogSinceModelInitialization;
- (BOOL)hasBackgroundTrialMetadata;
- (BOOL)hasHoursSinceReference;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (SGMIMetricsAggregatedAccuracyLog)activeAggregatedAccuracyLogForThePastFourWeeks;
- (SGMIMetricsAggregatedAccuracyLog)activeAggregatedAccuracyLogSinceModelInitialization;
- (SGMIMetricsAggregatedAccuracyLog)backgroundAggregatedAccuracyLogForThePastFourWeeks;
- (SGMIMetricsAggregatedAccuracyLog)backgroundAggregatedAccuracyLogSinceModelInitialization;
- (SGMIMetricsTrialMetadata)activeTrialMetadata;
- (SGMIMetricsTrialMetadata)backgroundTrialMetadata;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)hoursSinceReference;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActiveAggregatedAccuracyLogForThePastFourWeeks:(id)a3;
- (void)setActiveAggregatedAccuracyLogSinceModelInitialization:(id)a3;
- (void)setActiveTrialMetadata:(id)a3;
- (void)setBackgroundAggregatedAccuracyLogForThePastFourWeeks:(id)a3;
- (void)setBackgroundAggregatedAccuracyLogSinceModelInitialization:(id)a3;
- (void)setBackgroundTrialMetadata:(id)a3;
- (void)setHasHoursSinceReference:(BOOL)a3;
- (void)setHoursSinceReference:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SGMIMetricsAggregatedAccuracyLogs

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundTrialMetadata, 0);
  objc_storeStrong((id *)&self->_backgroundAggregatedAccuracyLogSinceModelInitialization, 0);
  objc_storeStrong((id *)&self->_backgroundAggregatedAccuracyLogForThePastFourWeeks, 0);
  objc_storeStrong((id *)&self->_activeTrialMetadata, 0);
  objc_storeStrong((id *)&self->_activeAggregatedAccuracyLogSinceModelInitialization, 0);
  objc_storeStrong((id *)&self->_activeAggregatedAccuracyLogForThePastFourWeeks, 0);
}

- (void)setBackgroundAggregatedAccuracyLogSinceModelInitialization:(id)a3
{
}

- (SGMIMetricsAggregatedAccuracyLog)backgroundAggregatedAccuracyLogSinceModelInitialization
{
  return self->_backgroundAggregatedAccuracyLogSinceModelInitialization;
}

- (void)setBackgroundAggregatedAccuracyLogForThePastFourWeeks:(id)a3
{
}

- (SGMIMetricsAggregatedAccuracyLog)backgroundAggregatedAccuracyLogForThePastFourWeeks
{
  return self->_backgroundAggregatedAccuracyLogForThePastFourWeeks;
}

- (void)setBackgroundTrialMetadata:(id)a3
{
}

- (SGMIMetricsTrialMetadata)backgroundTrialMetadata
{
  return self->_backgroundTrialMetadata;
}

- (void)setActiveAggregatedAccuracyLogSinceModelInitialization:(id)a3
{
}

- (SGMIMetricsAggregatedAccuracyLog)activeAggregatedAccuracyLogSinceModelInitialization
{
  return self->_activeAggregatedAccuracyLogSinceModelInitialization;
}

- (void)setActiveAggregatedAccuracyLogForThePastFourWeeks:(id)a3
{
}

- (SGMIMetricsAggregatedAccuracyLog)activeAggregatedAccuracyLogForThePastFourWeeks
{
  return self->_activeAggregatedAccuracyLogForThePastFourWeeks;
}

- (void)setActiveTrialMetadata:(id)a3
{
}

- (SGMIMetricsTrialMetadata)activeTrialMetadata
{
  return self->_activeTrialMetadata;
}

- (unsigned)hoursSinceReference
{
  return self->_hoursSinceReference;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (*((unsigned char *)v4 + 60))
  {
    self->_hoursSinceReference = *((_DWORD *)v4 + 14);
    *(unsigned char *)&self->_has |= 1u;
  }
  activeTrialMetadata = self->_activeTrialMetadata;
  uint64_t v7 = v5[3];
  v18 = v5;
  if (activeTrialMetadata)
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[SGMIMetricsTrialMetadata mergeFrom:](activeTrialMetadata, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[SGMIMetricsAggregatedAccuracyLogs setActiveTrialMetadata:](self, "setActiveTrialMetadata:");
  }
  v5 = v18;
LABEL_9:
  activeAggregatedAccuracyLogForThePastFourWeeks = self->_activeAggregatedAccuracyLogForThePastFourWeeks;
  uint64_t v9 = v5[1];
  if (activeAggregatedAccuracyLogForThePastFourWeeks)
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[SGMIMetricsAggregatedAccuracyLog mergeFrom:](activeAggregatedAccuracyLogForThePastFourWeeks, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[SGMIMetricsAggregatedAccuracyLogs setActiveAggregatedAccuracyLogForThePastFourWeeks:](self, "setActiveAggregatedAccuracyLogForThePastFourWeeks:");
  }
  v5 = v18;
LABEL_15:
  activeAggregatedAccuracyLogSinceModelInitialization = self->_activeAggregatedAccuracyLogSinceModelInitialization;
  uint64_t v11 = v5[2];
  if (activeAggregatedAccuracyLogSinceModelInitialization)
  {
    if (!v11) {
      goto LABEL_21;
    }
    -[SGMIMetricsAggregatedAccuracyLog mergeFrom:](activeAggregatedAccuracyLogSinceModelInitialization, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_21;
    }
    -[SGMIMetricsAggregatedAccuracyLogs setActiveAggregatedAccuracyLogSinceModelInitialization:](self, "setActiveAggregatedAccuracyLogSinceModelInitialization:");
  }
  v5 = v18;
LABEL_21:
  backgroundTrialMetadata = self->_backgroundTrialMetadata;
  uint64_t v13 = v5[6];
  if (backgroundTrialMetadata)
  {
    if (!v13) {
      goto LABEL_27;
    }
    -[SGMIMetricsTrialMetadata mergeFrom:](backgroundTrialMetadata, "mergeFrom:");
  }
  else
  {
    if (!v13) {
      goto LABEL_27;
    }
    -[SGMIMetricsAggregatedAccuracyLogs setBackgroundTrialMetadata:](self, "setBackgroundTrialMetadata:");
  }
  v5 = v18;
LABEL_27:
  backgroundAggregatedAccuracyLogForThePastFourWeeks = self->_backgroundAggregatedAccuracyLogForThePastFourWeeks;
  uint64_t v15 = v5[4];
  if (backgroundAggregatedAccuracyLogForThePastFourWeeks)
  {
    if (!v15) {
      goto LABEL_33;
    }
    -[SGMIMetricsAggregatedAccuracyLog mergeFrom:](backgroundAggregatedAccuracyLogForThePastFourWeeks, "mergeFrom:");
  }
  else
  {
    if (!v15) {
      goto LABEL_33;
    }
    -[SGMIMetricsAggregatedAccuracyLogs setBackgroundAggregatedAccuracyLogForThePastFourWeeks:](self, "setBackgroundAggregatedAccuracyLogForThePastFourWeeks:");
  }
  v5 = v18;
LABEL_33:
  backgroundAggregatedAccuracyLogSinceModelInitialization = self->_backgroundAggregatedAccuracyLogSinceModelInitialization;
  uint64_t v17 = v5[5];
  if (backgroundAggregatedAccuracyLogSinceModelInitialization)
  {
    if (v17) {
      -[SGMIMetricsAggregatedAccuracyLog mergeFrom:](backgroundAggregatedAccuracyLogSinceModelInitialization, "mergeFrom:");
    }
  }
  else if (v17)
  {
    -[SGMIMetricsAggregatedAccuracyLogs setBackgroundAggregatedAccuracyLogSinceModelInitialization:](self, "setBackgroundAggregatedAccuracyLogSinceModelInitialization:");
  }
  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_hoursSinceReference;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(SGMIMetricsTrialMetadata *)self->_activeTrialMetadata hash] ^ v3;
  unint64_t v5 = [(SGMIMetricsAggregatedAccuracyLog *)self->_activeAggregatedAccuracyLogForThePastFourWeeks hash];
  unint64_t v6 = v4 ^ v5 ^ [(SGMIMetricsAggregatedAccuracyLog *)self->_activeAggregatedAccuracyLogSinceModelInitialization hash];
  unint64_t v7 = [(SGMIMetricsTrialMetadata *)self->_backgroundTrialMetadata hash];
  unint64_t v8 = v7 ^ [(SGMIMetricsAggregatedAccuracyLog *)self->_backgroundAggregatedAccuracyLogForThePastFourWeeks hash];
  return v6 ^ v8 ^ [(SGMIMetricsAggregatedAccuracyLog *)self->_backgroundAggregatedAccuracyLogSinceModelInitialization hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_hoursSinceReference != *((_DWORD *)v4 + 14)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
LABEL_19:
    char v11 = 0;
    goto LABEL_20;
  }
  activeTrialMetadata = self->_activeTrialMetadata;
  if ((unint64_t)activeTrialMetadata | *((void *)v4 + 3)
    && !-[SGMIMetricsTrialMetadata isEqual:](activeTrialMetadata, "isEqual:"))
  {
    goto LABEL_19;
  }
  activeAggregatedAccuracyLogForThePastFourWeeks = self->_activeAggregatedAccuracyLogForThePastFourWeeks;
  if ((unint64_t)activeAggregatedAccuracyLogForThePastFourWeeks | *((void *)v4 + 1))
  {
    if (!-[SGMIMetricsAggregatedAccuracyLog isEqual:](activeAggregatedAccuracyLogForThePastFourWeeks, "isEqual:")) {
      goto LABEL_19;
    }
  }
  activeAggregatedAccuracyLogSinceModelInitialization = self->_activeAggregatedAccuracyLogSinceModelInitialization;
  if ((unint64_t)activeAggregatedAccuracyLogSinceModelInitialization | *((void *)v4 + 2))
  {
    if (!-[SGMIMetricsAggregatedAccuracyLog isEqual:](activeAggregatedAccuracyLogSinceModelInitialization, "isEqual:")) {
      goto LABEL_19;
    }
  }
  backgroundTrialMetadata = self->_backgroundTrialMetadata;
  if ((unint64_t)backgroundTrialMetadata | *((void *)v4 + 6))
  {
    if (!-[SGMIMetricsTrialMetadata isEqual:](backgroundTrialMetadata, "isEqual:")) {
      goto LABEL_19;
    }
  }
  backgroundAggregatedAccuracyLogForThePastFourWeeks = self->_backgroundAggregatedAccuracyLogForThePastFourWeeks;
  if ((unint64_t)backgroundAggregatedAccuracyLogForThePastFourWeeks | *((void *)v4 + 4))
  {
    if (!-[SGMIMetricsAggregatedAccuracyLog isEqual:](backgroundAggregatedAccuracyLogForThePastFourWeeks, "isEqual:")) {
      goto LABEL_19;
    }
  }
  backgroundAggregatedAccuracyLogSinceModelInitialization = self->_backgroundAggregatedAccuracyLogSinceModelInitialization;
  if ((unint64_t)backgroundAggregatedAccuracyLogSinceModelInitialization | *((void *)v4 + 5)) {
    char v11 = -[SGMIMetricsAggregatedAccuracyLog isEqual:](backgroundAggregatedAccuracyLogSinceModelInitialization, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_20:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 56) = self->_hoursSinceReference;
    *(unsigned char *)(v5 + 60) |= 1u;
  }
  id v7 = [(SGMIMetricsTrialMetadata *)self->_activeTrialMetadata copyWithZone:a3];
  unint64_t v8 = (void *)v6[3];
  v6[3] = v7;

  id v9 = [(SGMIMetricsAggregatedAccuracyLog *)self->_activeAggregatedAccuracyLogForThePastFourWeeks copyWithZone:a3];
  v10 = (void *)v6[1];
  v6[1] = v9;

  id v11 = [(SGMIMetricsAggregatedAccuracyLog *)self->_activeAggregatedAccuracyLogSinceModelInitialization copyWithZone:a3];
  v12 = (void *)v6[2];
  v6[2] = v11;

  id v13 = [(SGMIMetricsTrialMetadata *)self->_backgroundTrialMetadata copyWithZone:a3];
  v14 = (void *)v6[6];
  v6[6] = v13;

  id v15 = [(SGMIMetricsAggregatedAccuracyLog *)self->_backgroundAggregatedAccuracyLogForThePastFourWeeks copyWithZone:a3];
  v16 = (void *)v6[4];
  v6[4] = v15;

  id v17 = [(SGMIMetricsAggregatedAccuracyLog *)self->_backgroundAggregatedAccuracyLogSinceModelInitialization copyWithZone:a3];
  v18 = (void *)v6[5];
  v6[5] = v17;

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[14] = self->_hoursSinceReference;
    *((unsigned char *)v4 + 60) |= 1u;
  }
  uint64_t v5 = v4;
  if (self->_activeTrialMetadata)
  {
    objc_msgSend(v4, "setActiveTrialMetadata:");
    id v4 = v5;
  }
  if (self->_activeAggregatedAccuracyLogForThePastFourWeeks)
  {
    objc_msgSend(v5, "setActiveAggregatedAccuracyLogForThePastFourWeeks:");
    id v4 = v5;
  }
  if (self->_activeAggregatedAccuracyLogSinceModelInitialization)
  {
    objc_msgSend(v5, "setActiveAggregatedAccuracyLogSinceModelInitialization:");
    id v4 = v5;
  }
  if (self->_backgroundTrialMetadata)
  {
    objc_msgSend(v5, "setBackgroundTrialMetadata:");
    id v4 = v5;
  }
  if (self->_backgroundAggregatedAccuracyLogForThePastFourWeeks)
  {
    objc_msgSend(v5, "setBackgroundAggregatedAccuracyLogForThePastFourWeeks:");
    id v4 = v5;
  }
  if (self->_backgroundAggregatedAccuracyLogSinceModelInitialization)
  {
    objc_msgSend(v5, "setBackgroundAggregatedAccuracyLogSinceModelInitialization:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_activeTrialMetadata)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_activeAggregatedAccuracyLogForThePastFourWeeks)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_activeAggregatedAccuracyLogSinceModelInitialization)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_backgroundTrialMetadata)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_backgroundAggregatedAccuracyLogForThePastFourWeeks)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_backgroundAggregatedAccuracyLogSinceModelInitialization)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SGMIMetricsAggregatedAccuracyLogsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithUnsignedInt:self->_hoursSinceReference];
    [v3 setObject:v4 forKey:@"hoursSinceReference"];
  }
  activeTrialMetadata = self->_activeTrialMetadata;
  if (activeTrialMetadata)
  {
    unint64_t v6 = [(SGMIMetricsTrialMetadata *)activeTrialMetadata dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"activeTrialMetadata"];
  }
  activeAggregatedAccuracyLogForThePastFourWeeks = self->_activeAggregatedAccuracyLogForThePastFourWeeks;
  if (activeAggregatedAccuracyLogForThePastFourWeeks)
  {
    unint64_t v8 = [(SGMIMetricsAggregatedAccuracyLog *)activeAggregatedAccuracyLogForThePastFourWeeks dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"activeAggregatedAccuracyLogForThePastFourWeeks"];
  }
  activeAggregatedAccuracyLogSinceModelInitialization = self->_activeAggregatedAccuracyLogSinceModelInitialization;
  if (activeAggregatedAccuracyLogSinceModelInitialization)
  {
    v10 = [(SGMIMetricsAggregatedAccuracyLog *)activeAggregatedAccuracyLogSinceModelInitialization dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"activeAggregatedAccuracyLogSinceModelInitialization"];
  }
  backgroundTrialMetadata = self->_backgroundTrialMetadata;
  if (backgroundTrialMetadata)
  {
    v12 = [(SGMIMetricsTrialMetadata *)backgroundTrialMetadata dictionaryRepresentation];
    [v3 setObject:v12 forKey:@"backgroundTrialMetadata"];
  }
  backgroundAggregatedAccuracyLogForThePastFourWeeks = self->_backgroundAggregatedAccuracyLogForThePastFourWeeks;
  if (backgroundAggregatedAccuracyLogForThePastFourWeeks)
  {
    v14 = [(SGMIMetricsAggregatedAccuracyLog *)backgroundAggregatedAccuracyLogForThePastFourWeeks dictionaryRepresentation];
    [v3 setObject:v14 forKey:@"backgroundAggregatedAccuracyLogForThePastFourWeeks"];
  }
  backgroundAggregatedAccuracyLogSinceModelInitialization = self->_backgroundAggregatedAccuracyLogSinceModelInitialization;
  if (backgroundAggregatedAccuracyLogSinceModelInitialization)
  {
    v16 = [(SGMIMetricsAggregatedAccuracyLog *)backgroundAggregatedAccuracyLogSinceModelInitialization dictionaryRepresentation];
    [v3 setObject:v16 forKey:@"backgroundAggregatedAccuracyLogSinceModelInitialization"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SGMIMetricsAggregatedAccuracyLogs;
  id v4 = [(SGMIMetricsAggregatedAccuracyLogs *)&v8 description];
  id v5 = [(SGMIMetricsAggregatedAccuracyLogs *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasBackgroundAggregatedAccuracyLogSinceModelInitialization
{
  return self->_backgroundAggregatedAccuracyLogSinceModelInitialization != 0;
}

- (BOOL)hasBackgroundAggregatedAccuracyLogForThePastFourWeeks
{
  return self->_backgroundAggregatedAccuracyLogForThePastFourWeeks != 0;
}

- (BOOL)hasBackgroundTrialMetadata
{
  return self->_backgroundTrialMetadata != 0;
}

- (BOOL)hasActiveAggregatedAccuracyLogSinceModelInitialization
{
  return self->_activeAggregatedAccuracyLogSinceModelInitialization != 0;
}

- (BOOL)hasActiveAggregatedAccuracyLogForThePastFourWeeks
{
  return self->_activeAggregatedAccuracyLogForThePastFourWeeks != 0;
}

- (BOOL)hasActiveTrialMetadata
{
  return self->_activeTrialMetadata != 0;
}

- (BOOL)hasHoursSinceReference
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasHoursSinceReference:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setHoursSinceReference:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_hoursSinceReference = a3;
}

@end