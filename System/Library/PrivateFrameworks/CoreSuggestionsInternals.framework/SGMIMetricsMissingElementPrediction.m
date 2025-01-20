@interface SGMIMetricsMissingElementPrediction
- (BOOL)foundMatchingElement;
- (BOOL)hasFoundMatchingElement;
- (BOOL)hasPredictedMissingElementScore;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)predictedMissingElementScore;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFoundMatchingElement:(BOOL)a3;
- (void)setHasFoundMatchingElement:(BOOL)a3;
- (void)setHasPredictedMissingElementScore:(BOOL)a3;
- (void)setPredictedMissingElementScore:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation SGMIMetricsMissingElementPrediction

- (BOOL)foundMatchingElement
{
  return self->_foundMatchingElement;
}

- (float)predictedMissingElementScore
{
  return self->_predictedMissingElementScore;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 16);
  if (v5)
  {
    self->_predictedMissingElementScore = *((float *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 16);
  }
  if ((v5 & 2) != 0)
  {
    self->_foundMatchingElement = *((unsigned char *)v4 + 12);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has)
  {
    float predictedMissingElementScore = self->_predictedMissingElementScore;
    float v6 = -predictedMissingElementScore;
    if (predictedMissingElementScore >= 0.0) {
      float v6 = self->_predictedMissingElementScore;
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
  if ((has & 2) != 0) {
    uint64_t v9 = 2654435761 * self->_foundMatchingElement;
  }
  else {
    uint64_t v9 = 0;
  }
  return v9 ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 16) & 1) == 0 || self->_predictedMissingElementScore != *((float *)v4 + 2)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 16))
  {
    goto LABEL_9;
  }
  BOOL v5 = (*((unsigned char *)v4 + 16) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 2) == 0)
    {
LABEL_9:
      BOOL v5 = 0;
      goto LABEL_10;
    }
    if (self->_foundMatchingElement)
    {
      if (!*((unsigned char *)v4 + 12)) {
        goto LABEL_9;
      }
    }
    else if (*((unsigned char *)v4 + 12))
    {
      goto LABEL_9;
    }
    BOOL v5 = 1;
  }
LABEL_10:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)result + 2) = LODWORD(self->_predictedMissingElementScore);
    *((unsigned char *)result + 16) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)result + 12) = self->_foundMatchingElement;
    *((unsigned char *)result + 16) |= 2u;
  }
  return result;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[2] = LODWORD(self->_predictedMissingElementScore);
    *((unsigned char *)v4 + 16) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)v4 + 12) = self->_foundMatchingElement;
    *((unsigned char *)v4 + 16) |= 2u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteFloatField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SGMIMetricsMissingElementPredictionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    *(float *)&double v4 = self->_predictedMissingElementScore;
    id v6 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v6 forKey:@"predictedMissingElementScore"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    float v7 = [NSNumber numberWithBool:self->_foundMatchingElement];
    [v3 setObject:v7 forKey:@"foundMatchingElement"];
  }
  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SGMIMetricsMissingElementPrediction;
  double v4 = [(SGMIMetricsMissingElementPrediction *)&v8 description];
  BOOL v5 = [(SGMIMetricsMissingElementPrediction *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasFoundMatchingElement
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasFoundMatchingElement:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setFoundMatchingElement:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_foundMatchingElement = a3;
}

- (BOOL)hasPredictedMissingElementScore
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasPredictedMissingElementScore:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setPredictedMissingElementScore:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_float predictedMissingElementScore = a3;
}

@end