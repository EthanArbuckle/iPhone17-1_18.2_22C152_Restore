@interface HDCodableScoredAssessment
- (BOOL)applyToObject:(id)a3;
- (BOOL)hasAnswers;
- (BOOL)hasRisk;
- (BOOL)hasSample;
- (BOOL)hasScore;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableSample)sample;
- (NSData)answers;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int64_t)risk;
- (int64_t)score;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAnswers:(id)a3;
- (void)setHasRisk:(BOOL)a3;
- (void)setHasScore:(BOOL)a3;
- (void)setRisk:(int64_t)a3;
- (void)setSample:(id)a3;
- (void)setScore:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableScoredAssessment

- (BOOL)hasSample
{
  return self->_sample != 0;
}

- (void)setScore:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_score = a3;
}

- (void)setHasScore:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasScore
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasAnswers
{
  return self->_answers != 0;
}

- (void)setRisk:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_risk = a3;
}

- (void)setHasRisk:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRisk
{
  return *(unsigned char *)&self->_has & 1;
}

- (NSString)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableScoredAssessment;
  v4 = [(HDCodableScoredAssessment *)&v8 description];
  v5 = [(HDCodableScoredAssessment *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

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
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v6 = [NSNumber numberWithLongLong:self->_score];
    [v3 setObject:v6 forKey:@"score"];
  }
  answers = self->_answers;
  if (answers) {
    [v3 setObject:answers forKey:@"answers"];
  }
  if (*(unsigned char *)&self->_has)
  {
    objc_super v8 = [NSNumber numberWithLongLong:self->_risk];
    [v3 setObject:v8 forKey:@"risk"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableScoredAssessmentReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_sample)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
  if (self->_answers)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_sample)
  {
    objc_msgSend(v4, "setSample:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((void *)v4 + 2) = self->_score;
    *((unsigned char *)v4 + 40) |= 2u;
  }
  if (self->_answers)
  {
    objc_msgSend(v5, "setAnswers:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_risk;
    *((unsigned char *)v4 + 40) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HDCodableSample *)self->_sample copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_score;
    *(unsigned char *)(v5 + 40) |= 2u;
  }
  uint64_t v8 = [(NSData *)self->_answers copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_risk;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  sample = self->_sample;
  if ((unint64_t)sample | *((void *)v4 + 4))
  {
    if (!-[HDCodableSample isEqual:](sample, "isEqual:")) {
      goto LABEL_16;
    }
  }
  char has = (char)self->_has;
  char v7 = *((unsigned char *)v4 + 40);
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_score != *((void *)v4 + 2)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_16;
  }
  answers = self->_answers;
  if ((unint64_t)answers | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](answers, "isEqual:"))
    {
LABEL_16:
      BOOL v9 = 0;
      goto LABEL_17;
    }
    char has = (char)self->_has;
    char v7 = *((unsigned char *)v4 + 40);
  }
  BOOL v9 = (v7 & 1) == 0;
  if (has)
  {
    if ((v7 & 1) == 0 || self->_risk != *((void *)v4 + 1)) {
      goto LABEL_16;
    }
    BOOL v9 = 1;
  }
LABEL_17:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HDCodableSample *)self->_sample hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v4 = 2654435761 * self->_score;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = [(NSData *)self->_answers hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_risk;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  sample = self->_sample;
  uint64_t v6 = v4[4];
  char v7 = v4;
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
    -[HDCodableScoredAssessment setSample:](self, "setSample:");
  }
  uint64_t v4 = v7;
LABEL_7:
  if ((v4[5] & 2) != 0)
  {
    self->_score = v4[2];
    *(unsigned char *)&self->_has |= 2u;
  }
  if (v4[3])
  {
    -[HDCodableScoredAssessment setAnswers:](self, "setAnswers:");
    uint64_t v4 = v7;
  }
  if (v4[5])
  {
    self->_risk = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (HDCodableSample)sample
{
  return self->_sample;
}

- (void)setSample:(id)a3
{
}

- (int64_t)score
{
  return self->_score;
}

- (NSData)answers
{
  return self->_answers;
}

- (void)setAnswers:(id)a3
{
}

- (int64_t)risk
{
  return self->_risk;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sample, 0);

  objc_storeStrong((id *)&self->_answers, 0);
}

- (BOOL)applyToObject:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_1F187D498]
    && ([(HDCodableScoredAssessment *)self sample],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 applyToObject:v4],
        v5,
        v6))
  {
    objc_msgSend(v4, "_setScore:", -[HDCodableScoredAssessment score](self, "score"));
    char v7 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v8 = objc_opt_class();
    BOOL v9 = [(HDCodableScoredAssessment *)self answers];
    id v15 = 0;
    v10 = [v7 unarchivedArrayOfObjectsOfClass:v8 fromData:v9 error:&v15];
    id v11 = v15;

    BOOL v12 = v10 != 0;
    if (v10)
    {
      [v4 _setAnswers:v10];
      objc_msgSend(v4, "_setRisk:", -[HDCodableScoredAssessment risk](self, "risk"));
    }
    else if (v11)
    {
      _HKInitializeLogging();
      v13 = *MEMORY[0x1E4F29F68];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F68], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v11;
        _os_log_error_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_ERROR, "Error unarchiving answers: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

@end