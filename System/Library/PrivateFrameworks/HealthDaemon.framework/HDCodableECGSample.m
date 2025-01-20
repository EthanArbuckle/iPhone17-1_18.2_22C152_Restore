@interface HDCodableECGSample
- (BOOL)applyToObject:(id)a3;
- (BOOL)hasAverageHeartRateInBPM;
- (BOOL)hasPrivateClassification;
- (BOOL)hasSample;
- (BOOL)hasSymptomsStatus;
- (BOOL)hasVoltagePayload;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableSample)sample;
- (NSData)voltagePayload;
- (NSString)description;
- (double)averageHeartRateInBPM;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int64_t)privateClassification;
- (int64_t)symptomsStatus;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAverageHeartRateInBPM:(double)a3;
- (void)setHasAverageHeartRateInBPM:(BOOL)a3;
- (void)setHasPrivateClassification:(BOOL)a3;
- (void)setHasSymptomsStatus:(BOOL)a3;
- (void)setPrivateClassification:(int64_t)a3;
- (void)setSample:(id)a3;
- (void)setSymptomsStatus:(int64_t)a3;
- (void)setVoltagePayload:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableECGSample

- (BOOL)applyToObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([(HDCodableECGSample *)self sample],
        v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 applyToObject:v4],
        v5,
        v6))
  {
    v7 = [(HDCodableECGSample *)self voltagePayload];
    [v4 _setPayload:v7];

    objc_msgSend(v4, "_setPrivateClassification:", -[HDCodableECGSample privateClassification](self, "privateClassification"));
    objc_msgSend(v4, "_setSymptomsStatus:", -[HDCodableECGSample symptomsStatus](self, "symptomsStatus"));
    if (*(unsigned char *)&self->_has)
    {
      v8 = (void *)MEMORY[0x1E4F2B370];
      [(HDCodableECGSample *)self averageHeartRateInBPM];
      v9 = objc_msgSend(v8, "_quantityWithBeatsPerMinute:");
      [v4 _setAverageHeartRate:v9];
    }
    BOOL v10 = 1;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)hasSample
{
  return self->_sample != 0;
}

- (void)setPrivateClassification:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_privateClassification = a3;
}

- (void)setHasPrivateClassification:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPrivateClassification
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAverageHeartRateInBPM:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_averageHeartRateInBPM = a3;
}

- (void)setHasAverageHeartRateInBPM:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAverageHeartRateInBPM
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasVoltagePayload
{
  return self->_voltagePayload != 0;
}

- (void)setSymptomsStatus:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_symptomsStatus = a3;
}

- (void)setHasSymptomsStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSymptomsStatus
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (NSString)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableECGSample;
  id v4 = [(HDCodableECGSample *)&v8 description];
  v5 = [(HDCodableECGSample *)self dictionaryRepresentation];
  int v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  sample = self->_sample;
  if (sample)
  {
    v5 = [(HDCodableSample *)sample dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"sample"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v7 = [NSNumber numberWithLongLong:self->_privateClassification];
    [v3 setObject:v7 forKey:@"privateClassification"];

    char has = (char)self->_has;
  }
  if (has)
  {
    objc_super v8 = [NSNumber numberWithDouble:self->_averageHeartRateInBPM];
    [v3 setObject:v8 forKey:@"averageHeartRateInBPM"];
  }
  voltagePayload = self->_voltagePayload;
  if (voltagePayload) {
    [v3 setObject:voltagePayload forKey:@"voltagePayload"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    BOOL v10 = [NSNumber numberWithLongLong:self->_symptomsStatus];
    [v3 setObject:v10 forKey:@"symptomsStatus"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableECGSampleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_sample)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
  if (self->_voltagePayload)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_sample)
  {
    objc_msgSend(v4, "setSample:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)v4 + 2) = self->_privateClassification;
    *((unsigned char *)v4 + 48) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_averageHeartRateInBPM;
    *((unsigned char *)v4 + 48) |= 1u;
  }
  if (self->_voltagePayload)
  {
    objc_msgSend(v6, "setVoltagePayload:");
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((void *)v4 + 3) = self->_symptomsStatus;
    *((unsigned char *)v4 + 48) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HDCodableSample *)self->_sample copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_privateClassification;
    *(unsigned char *)(v5 + 48) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(double *)(v5 + 8) = self->_averageHeartRateInBPM;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  uint64_t v9 = [(NSData *)self->_voltagePayload copyWithZone:a3];
  BOOL v10 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v9;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_symptomsStatus;
    *(unsigned char *)(v5 + 48) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  sample = self->_sample;
  if ((unint64_t)sample | *((void *)v4 + 4))
  {
    if (!-[HDCodableSample isEqual:](sample, "isEqual:")) {
      goto LABEL_21;
    }
  }
  char has = (char)self->_has;
  char v7 = *((unsigned char *)v4 + 48);
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_privateClassification != *((void *)v4 + 2)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
    goto LABEL_21;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_averageHeartRateInBPM != *((double *)v4 + 1)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
    goto LABEL_21;
  }
  voltagePayload = self->_voltagePayload;
  if ((unint64_t)voltagePayload | *((void *)v4 + 5))
  {
    if (!-[NSData isEqual:](voltagePayload, "isEqual:"))
    {
LABEL_21:
      BOOL v9 = 0;
      goto LABEL_22;
    }
    char has = (char)self->_has;
    char v7 = *((unsigned char *)v4 + 48);
  }
  BOOL v9 = (v7 & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_symptomsStatus != *((void *)v4 + 3)) {
      goto LABEL_21;
    }
    BOOL v9 = 1;
  }
LABEL_22:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HDCodableSample *)self->_sample hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_privateClassification;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v9 = 0;
    goto LABEL_11;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double averageHeartRateInBPM = self->_averageHeartRateInBPM;
  double v6 = -averageHeartRateInBPM;
  if (averageHeartRateInBPM >= 0.0) {
    double v6 = self->_averageHeartRateInBPM;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_11:
  uint64_t v10 = [(NSData *)self->_voltagePayload hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v11 = 2654435761 * self->_symptomsStatus;
  }
  else {
    uint64_t v11 = 0;
  }
  return v4 ^ v3 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  sample = self->_sample;
  uint64_t v6 = *((void *)v4 + 4);
  id v8 = v4;
  if (sample)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[HDCodableSample mergeFrom:](sample, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[HDCodableECGSample setSample:](self, "setSample:");
  }
  id v4 = v8;
LABEL_7:
  char v7 = *((unsigned char *)v4 + 48);
  if ((v7 & 2) != 0)
  {
    self->_privateClassification = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v7 = *((unsigned char *)v4 + 48);
  }
  if (v7)
  {
    self->_double averageHeartRateInBPM = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 5))
  {
    -[HDCodableECGSample setVoltagePayload:](self, "setVoltagePayload:");
    id v4 = v8;
  }
  if ((*((unsigned char *)v4 + 48) & 4) != 0)
  {
    self->_symptomsStatus = *((void *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
  }
}

- (HDCodableSample)sample
{
  return self->_sample;
}

- (void)setSample:(id)a3
{
}

- (int64_t)privateClassification
{
  return self->_privateClassification;
}

- (double)averageHeartRateInBPM
{
  return self->_averageHeartRateInBPM;
}

- (NSData)voltagePayload
{
  return self->_voltagePayload;
}

- (void)setVoltagePayload:(id)a3
{
}

- (int64_t)symptomsStatus
{
  return self->_symptomsStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voltagePayload, 0);

  objc_storeStrong((id *)&self->_sample, 0);
}

@end