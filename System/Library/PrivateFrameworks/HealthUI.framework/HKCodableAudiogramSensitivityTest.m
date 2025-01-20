@interface HKCodableAudiogramSensitivityTest
- (BOOL)hasClampingRange;
- (BOOL)hasMasked;
- (BOOL)hasSensitivity;
- (BOOL)hasSide;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)masked;
- (BOOL)readFrom:(id)a3;
- (HKCodableAudiogramSensitivityPointClampingRange)clampingRange;
- (HKCodableQuantity)sensitivity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)side;
- (int64_t)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setClampingRange:(id)a3;
- (void)setHasMasked:(BOOL)a3;
- (void)setHasSide:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setMasked:(BOOL)a3;
- (void)setSensitivity:(id)a3;
- (void)setSide:(int64_t)a3;
- (void)setType:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableAudiogramSensitivityTest

- (BOOL)hasSensitivity
{
  return self->_sensitivity != 0;
}

- (void)setType:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setMasked:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_masked = a3;
}

- (void)setHasMasked:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMasked
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSide:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_side = a3;
}

- (void)setHasSide:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSide
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasClampingRange
{
  return self->_clampingRange != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableAudiogramSensitivityTest;
  v4 = [(HKCodableAudiogramSensitivityTest *)&v8 description];
  v5 = [(HKCodableAudiogramSensitivityTest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  sensitivity = self->_sensitivity;
  if (sensitivity)
  {
    v5 = [(HKCodableQuantity *)sensitivity dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"sensitivity"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v11 = [NSNumber numberWithLongLong:self->_type];
    [v3 setObject:v11 forKey:@"type"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  v12 = [NSNumber numberWithBool:self->_masked];
  [v3 setObject:v12 forKey:@"masked"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_6:
    v7 = [NSNumber numberWithLongLong:self->_side];
    [v3 setObject:v7 forKey:@"side"];
  }
LABEL_7:
  clampingRange = self->_clampingRange;
  if (clampingRange)
  {
    v9 = [(HKCodableAudiogramSensitivityPointClampingRange *)clampingRange dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"clampingRange"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableAudiogramSensitivityTestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_sensitivity)
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
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if (*(unsigned char *)&self->_has)
  {
LABEL_6:
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
LABEL_7:
  if (self->_clampingRange)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_sensitivity)
  {
    objc_msgSend(v4, "setSensitivity:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)v4 + 2) = self->_type;
    *((unsigned char *)v4 + 44) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  *((unsigned char *)v4 + 40) = self->_masked;
  *((unsigned char *)v4 + 44) |= 4u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_6:
    *((void *)v4 + 1) = self->_side;
    *((unsigned char *)v4 + 44) |= 1u;
  }
LABEL_7:
  if (self->_clampingRange)
  {
    objc_msgSend(v6, "setClampingRange:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HKCodableQuantity *)self->_sensitivity copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(unsigned char *)(v5 + 40) = self->_masked;
    *(unsigned char *)(v5 + 44) |= 4u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(void *)(v5 + 16) = self->_type;
  *(unsigned char *)(v5 + 44) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if (has)
  {
LABEL_4:
    *(void *)(v5 + 8) = self->_side;
    *(unsigned char *)(v5 + 44) |= 1u;
  }
LABEL_5:
  id v9 = [(HKCodableAudiogramSensitivityPointClampingRange *)self->_clampingRange copyWithZone:a3];
  v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  sensitivity = self->_sensitivity;
  if ((unint64_t)sensitivity | *((void *)v4 + 4))
  {
    if (!-[HKCodableQuantity isEqual:](sensitivity, "isEqual:")) {
      goto LABEL_24;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0 || self->_type != *((void *)v4 + 2)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 4) != 0)
    {
      if (self->_masked)
      {
        if (!*((unsigned char *)v4 + 40)) {
          goto LABEL_24;
        }
        goto LABEL_17;
      }
      if (!*((unsigned char *)v4 + 40)) {
        goto LABEL_17;
      }
    }
LABEL_24:
    char v7 = 0;
    goto LABEL_25;
  }
  if ((*((unsigned char *)v4 + 44) & 4) != 0) {
    goto LABEL_24;
  }
LABEL_17:
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_side != *((void *)v4 + 1)) {
      goto LABEL_24;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_24;
  }
  clampingRange = self->_clampingRange;
  if ((unint64_t)clampingRange | *((void *)v4 + 3)) {
    char v7 = -[HKCodableAudiogramSensitivityPointClampingRange isEqual:](clampingRange, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_25:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HKCodableQuantity *)self->_sensitivity hash];
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v5 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ [(HKCodableAudiogramSensitivityPointClampingRange *)self->_clampingRange hash];
  }
  uint64_t v4 = 2654435761 * self->_type;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_masked;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_side;
  return v4 ^ v3 ^ v5 ^ v6 ^ [(HKCodableAudiogramSensitivityPointClampingRange *)self->_clampingRange hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  sensitivity = self->_sensitivity;
  uint64_t v6 = *((void *)v4 + 4);
  id v10 = v4;
  if (sensitivity)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[HKCodableQuantity mergeFrom:](sensitivity, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[HKCodableAudiogramSensitivityTest setSensitivity:](self, "setSensitivity:");
  }
  id v4 = v10;
LABEL_7:
  char v7 = *((unsigned char *)v4 + 44);
  if ((v7 & 2) != 0)
  {
    self->_type = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v7 = *((unsigned char *)v4 + 44);
    if ((v7 & 4) == 0)
    {
LABEL_9:
      if ((v7 & 1) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 4) == 0)
  {
    goto LABEL_9;
  }
  self->_masked = *((unsigned char *)v4 + 40);
  *(unsigned char *)&self->_has |= 4u;
  if (*((unsigned char *)v4 + 44))
  {
LABEL_10:
    self->_side = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_11:
  clampingRange = self->_clampingRange;
  uint64_t v9 = *((void *)v4 + 3);
  if (clampingRange)
  {
    if (!v9) {
      goto LABEL_20;
    }
    clampingRange = (HKCodableAudiogramSensitivityPointClampingRange *)-[HKCodableAudiogramSensitivityPointClampingRange mergeFrom:](clampingRange, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_20;
    }
    clampingRange = (HKCodableAudiogramSensitivityPointClampingRange *)-[HKCodableAudiogramSensitivityTest setClampingRange:](self, "setClampingRange:");
  }
  id v4 = v10;
LABEL_20:
  MEMORY[0x1F41817F8](clampingRange, v4);
}

- (HKCodableQuantity)sensitivity
{
  return self->_sensitivity;
}

- (void)setSensitivity:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)masked
{
  return self->_masked;
}

- (int64_t)side
{
  return self->_side;
}

- (HKCodableAudiogramSensitivityPointClampingRange)clampingRange
{
  return self->_clampingRange;
}

- (void)setClampingRange:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sensitivity, 0);
  objc_storeStrong((id *)&self->_clampingRange, 0);
}

@end