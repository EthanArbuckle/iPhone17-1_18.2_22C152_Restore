@interface HKCodableSummaryVisionPrescriptionValue
- (BOOL)hasHasImage;
- (BOOL)hasImage;
- (BOOL)hasLeftEyeSphere;
- (BOOL)hasPrescriptionType;
- (BOOL)hasRightEyeSphere;
- (BOOL)hasTimestampData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HKCodablePrescriptionType)prescriptionType;
- (HKCodableQuantity)leftEyeSphere;
- (HKCodableQuantity)rightEyeSphere;
- (double)timestampData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasHasImage:(BOOL)a3;
- (void)setHasImage:(BOOL)a3;
- (void)setHasTimestampData:(BOOL)a3;
- (void)setLeftEyeSphere:(id)a3;
- (void)setPrescriptionType:(id)a3;
- (void)setRightEyeSphere:(id)a3;
- (void)setTimestampData:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableSummaryVisionPrescriptionValue

- (void)setTimestampData:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestampData = a3;
}

- (void)setHasTimestampData:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestampData
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasPrescriptionType
{
  return self->_prescriptionType != 0;
}

- (void)setHasImage:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_hasImage = a3;
}

- (void)setHasHasImage:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasHasImage
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasLeftEyeSphere
{
  return self->_leftEyeSphere != 0;
}

- (BOOL)hasRightEyeSphere
{
  return self->_rightEyeSphere != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableSummaryVisionPrescriptionValue;
  v4 = [(HKCodableSummaryVisionPrescriptionValue *)&v8 description];
  v5 = [(HKCodableSummaryVisionPrescriptionValue *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithDouble:self->_timestampData];
    [v3 setObject:v4 forKey:@"timestampData"];
  }
  prescriptionType = self->_prescriptionType;
  if (prescriptionType)
  {
    v6 = [(HKCodablePrescriptionType *)prescriptionType dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"prescriptionType"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v7 = [NSNumber numberWithBool:self->_hasImage];
    [v3 setObject:v7 forKey:@"hasImage"];
  }
  leftEyeSphere = self->_leftEyeSphere;
  if (leftEyeSphere)
  {
    v9 = [(HKCodableQuantity *)leftEyeSphere dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"leftEyeSphere"];
  }
  rightEyeSphere = self->_rightEyeSphere;
  if (rightEyeSphere)
  {
    v11 = [(HKCodableQuantity *)rightEyeSphere dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"rightEyeSphere"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSummaryVisionPrescriptionValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_prescriptionType)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_leftEyeSphere)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_rightEyeSphere)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = *(void *)&self->_timestampData;
    *((unsigned char *)v4 + 44) |= 1u;
  }
  id v5 = v4;
  if (self->_prescriptionType)
  {
    objc_msgSend(v4, "setPrescriptionType:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((unsigned char *)v4 + 40) = self->_hasImage;
    *((unsigned char *)v4 + 44) |= 2u;
  }
  if (self->_leftEyeSphere)
  {
    objc_msgSend(v5, "setLeftEyeSphere:");
    id v4 = v5;
  }
  if (self->_rightEyeSphere)
  {
    objc_msgSend(v5, "setRightEyeSphere:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_timestampData;
    *(unsigned char *)(v5 + 44) |= 1u;
  }
  id v7 = [(HKCodablePrescriptionType *)self->_prescriptionType copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v7;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v6 + 40) = self->_hasImage;
    *(unsigned char *)(v6 + 44) |= 2u;
  }
  id v9 = [(HKCodableQuantity *)self->_leftEyeSphere copyWithZone:a3];
  v10 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v9;

  id v11 = [(HKCodableQuantity *)self->_rightEyeSphere copyWithZone:a3];
  v12 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v11;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_timestampData != *((double *)v4 + 1)) {
      goto LABEL_22;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_22;
  }
  prescriptionType = self->_prescriptionType;
  if ((unint64_t)prescriptionType | *((void *)v4 + 3))
  {
    if (!-[HKCodablePrescriptionType isEqual:](prescriptionType, "isEqual:")) {
      goto LABEL_22;
    }
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) != 0)
    {
      if (self->_hasImage)
      {
        if (!*((unsigned char *)v4 + 40)) {
          goto LABEL_22;
        }
        goto LABEL_18;
      }
      if (!*((unsigned char *)v4 + 40)) {
        goto LABEL_18;
      }
    }
LABEL_22:
    char v9 = 0;
    goto LABEL_23;
  }
  if ((*((unsigned char *)v4 + 44) & 2) != 0) {
    goto LABEL_22;
  }
LABEL_18:
  leftEyeSphere = self->_leftEyeSphere;
  if ((unint64_t)leftEyeSphere | *((void *)v4 + 2)
    && !-[HKCodableQuantity isEqual:](leftEyeSphere, "isEqual:"))
  {
    goto LABEL_22;
  }
  rightEyeSphere = self->_rightEyeSphere;
  if ((unint64_t)rightEyeSphere | *((void *)v4 + 4)) {
    char v9 = -[HKCodableQuantity isEqual:](rightEyeSphere, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_23:

  return v9;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    double timestampData = self->_timestampData;
    double v5 = -timestampData;
    if (timestampData >= 0.0) {
      double v5 = self->_timestampData;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    unint64_t v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v3 += (unint64_t)v7;
      }
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  unint64_t v8 = [(HKCodablePrescriptionType *)self->_prescriptionType hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v9 = 2654435761 * self->_hasImage;
  }
  else {
    uint64_t v9 = 0;
  }
  unint64_t v10 = v8 ^ v3 ^ v9 ^ [(HKCodableQuantity *)self->_leftEyeSphere hash];
  return v10 ^ [(HKCodableQuantity *)self->_rightEyeSphere hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = (double *)a3;
  double v5 = v4;
  if (*((unsigned char *)v4 + 44))
  {
    self->_double timestampData = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  prescriptionType = self->_prescriptionType;
  uint64_t v7 = *((void *)v5 + 3);
  v12 = v5;
  if (prescriptionType)
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[HKCodablePrescriptionType mergeFrom:](prescriptionType, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[HKCodableSummaryVisionPrescriptionValue setPrescriptionType:](self, "setPrescriptionType:");
  }
  double v5 = v12;
LABEL_9:
  if ((*((unsigned char *)v5 + 44) & 2) != 0)
  {
    self->_hasImage = *((unsigned char *)v5 + 40);
    *(unsigned char *)&self->_has |= 2u;
  }
  leftEyeSphere = self->_leftEyeSphere;
  uint64_t v9 = *((void *)v5 + 2);
  if (leftEyeSphere)
  {
    if (!v9) {
      goto LABEL_17;
    }
    -[HKCodableQuantity mergeFrom:](leftEyeSphere, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_17;
    }
    -[HKCodableSummaryVisionPrescriptionValue setLeftEyeSphere:](self, "setLeftEyeSphere:");
  }
  double v5 = v12;
LABEL_17:
  rightEyeSphere = self->_rightEyeSphere;
  uint64_t v11 = *((void *)v5 + 4);
  if (rightEyeSphere)
  {
    if (!v11) {
      goto LABEL_23;
    }
    rightEyeSphere = (HKCodableQuantity *)-[HKCodableQuantity mergeFrom:](rightEyeSphere, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_23;
    }
    rightEyeSphere = (HKCodableQuantity *)-[HKCodableSummaryVisionPrescriptionValue setRightEyeSphere:](self, "setRightEyeSphere:");
  }
  double v5 = v12;
LABEL_23:
  MEMORY[0x1F41817F8](rightEyeSphere, v5);
}

- (double)timestampData
{
  return self->_timestampData;
}

- (HKCodablePrescriptionType)prescriptionType
{
  return self->_prescriptionType;
}

- (void)setPrescriptionType:(id)a3
{
}

- (BOOL)hasImage
{
  return self->_hasImage;
}

- (HKCodableQuantity)leftEyeSphere
{
  return self->_leftEyeSphere;
}

- (void)setLeftEyeSphere:(id)a3
{
}

- (HKCodableQuantity)rightEyeSphere
{
  return self->_rightEyeSphere;
}

- (void)setRightEyeSphere:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightEyeSphere, 0);
  objc_storeStrong((id *)&self->_prescriptionType, 0);
  objc_storeStrong((id *)&self->_leftEyeSphere, 0);
}

@end