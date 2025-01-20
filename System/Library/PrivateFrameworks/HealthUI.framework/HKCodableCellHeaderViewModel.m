@interface HKCodableCellHeaderViewModel
- (BOOL)forceDayGranularity;
- (BOOL)hasDetailDate;
- (BOOL)hasDetailText;
- (BOOL)hasDetailsVisibility;
- (BOOL)hasForceDayGranularity;
- (BOOL)hasForegroundColor;
- (BOOL)hasSystemImageName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HKCodableColorRepresentation)foregroundColor;
- (NSString)detailText;
- (NSString)systemImageName;
- (NSString)titleText;
- (double)detailDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)detailsVisibility;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDetailDate:(double)a3;
- (void)setDetailText:(id)a3;
- (void)setDetailsVisibility:(int64_t)a3;
- (void)setForceDayGranularity:(BOOL)a3;
- (void)setForegroundColor:(id)a3;
- (void)setHasDetailDate:(BOOL)a3;
- (void)setHasDetailsVisibility:(BOOL)a3;
- (void)setHasForceDayGranularity:(BOOL)a3;
- (void)setSystemImageName:(id)a3;
- (void)setTitleText:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableCellHeaderViewModel

- (BOOL)hasSystemImageName
{
  return self->_systemImageName != 0;
}

- (BOOL)hasForegroundColor
{
  return self->_foregroundColor != 0;
}

- (void)setDetailDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_detailDate = a3;
}

- (void)setHasDetailDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDetailDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setForceDayGranularity:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_forceDayGranularity = a3;
}

- (void)setHasForceDayGranularity:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasForceDayGranularity
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasDetailText
{
  return self->_detailText != 0;
}

- (void)setDetailsVisibility:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_detailsVisibility = a3;
}

- (void)setHasDetailsVisibility:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDetailsVisibility
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableCellHeaderViewModel;
  v4 = [(HKCodableCellHeaderViewModel *)&v8 description];
  v5 = [(HKCodableCellHeaderViewModel *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  titleText = self->_titleText;
  if (titleText) {
    [v3 setObject:titleText forKey:@"titleText"];
  }
  systemImageName = self->_systemImageName;
  if (systemImageName) {
    [v4 setObject:systemImageName forKey:@"systemImageName"];
  }
  foregroundColor = self->_foregroundColor;
  if (foregroundColor)
  {
    objc_super v8 = [(HKCodableColorRepresentation *)foregroundColor dictionaryRepresentation];
    [v4 setObject:v8 forKey:@"foregroundColor"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v10 = [NSNumber numberWithDouble:self->_detailDate];
    [v4 setObject:v10 forKey:@"detailDate"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v11 = [NSNumber numberWithBool:self->_forceDayGranularity];
    [v4 setObject:v11 forKey:@"forceDayGranularity"];
  }
  detailText = self->_detailText;
  if (detailText) {
    [v4 setObject:detailText forKey:@"detailText"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v13 = [NSNumber numberWithLongLong:self->_detailsVisibility];
    [v4 setObject:v13 forKey:@"detailsVisibility"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableCellHeaderViewModelReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_titleText) {
    -[HKCodableCellHeaderViewModel writeTo:]();
  }
  id v7 = v4;
  PBDataWriterWriteStringField();
  if (self->_systemImageName) {
    PBDataWriterWriteStringField();
  }
  if (self->_foregroundColor) {
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  v6 = v7;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    v6 = v7;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    v6 = v7;
  }
  if (self->_detailText)
  {
    PBDataWriterWriteStringField();
    v6 = v7;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    v6 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v6 = a3;
  [v6 setTitleText:self->_titleText];
  if (self->_systemImageName) {
    objc_msgSend(v6, "setSystemImageName:");
  }
  if (self->_foregroundColor) {
    objc_msgSend(v6, "setForegroundColor:");
  }
  char has = (char)self->_has;
  v5 = v6;
  if (has)
  {
    *((void *)v6 + 1) = *(void *)&self->_detailDate;
    *((unsigned char *)v6 + 60) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((unsigned char *)v6 + 56) = self->_forceDayGranularity;
    *((unsigned char *)v6 + 60) |= 4u;
  }
  if (self->_detailText)
  {
    objc_msgSend(v6, "setDetailText:");
    v5 = v6;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v5[2] = self->_detailsVisibility;
    *((unsigned char *)v5 + 60) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_titleText copyWithZone:a3];
  id v7 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v6;

  uint64_t v8 = [(NSString *)self->_systemImageName copyWithZone:a3];
  v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  id v10 = [(HKCodableColorRepresentation *)self->_foregroundColor copyWithZone:a3];
  v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  char has = (char)self->_has;
  if (has)
  {
    *(double *)(v5 + 8) = self->_detailDate;
    *(unsigned char *)(v5 + 60) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(unsigned char *)(v5 + 56) = self->_forceDayGranularity;
    *(unsigned char *)(v5 + 60) |= 4u;
  }
  uint64_t v13 = [(NSString *)self->_detailText copyWithZone:a3];
  v14 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v13;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_detailsVisibility;
    *(unsigned char *)(v5 + 60) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  titleText = self->_titleText;
  if ((unint64_t)titleText | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](titleText, "isEqual:")) {
      goto LABEL_28;
    }
  }
  systemImageName = self->_systemImageName;
  if ((unint64_t)systemImageName | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](systemImageName, "isEqual:")) {
      goto LABEL_28;
    }
  }
  foregroundColor = self->_foregroundColor;
  if ((unint64_t)foregroundColor | *((void *)v4 + 4))
  {
    if (!-[HKCodableColorRepresentation isEqual:](foregroundColor, "isEqual:")) {
      goto LABEL_28;
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_detailDate != *((double *)v4 + 1)) {
      goto LABEL_28;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
    goto LABEL_28;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 4) == 0) {
      goto LABEL_28;
    }
    if (self->_forceDayGranularity)
    {
      if (!*((unsigned char *)v4 + 56)) {
        goto LABEL_28;
      }
    }
    else if (*((unsigned char *)v4 + 56))
    {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 4) != 0)
  {
    goto LABEL_28;
  }
  detailText = self->_detailText;
  if (!((unint64_t)detailText | *((void *)v4 + 3))) {
    goto LABEL_24;
  }
  if (!-[NSString isEqual:](detailText, "isEqual:"))
  {
LABEL_28:
    BOOL v10 = 0;
    goto LABEL_29;
  }
  char has = (char)self->_has;
LABEL_24:
  BOOL v10 = (*((unsigned char *)v4 + 60) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_detailsVisibility != *((void *)v4 + 2)) {
      goto LABEL_28;
    }
    BOOL v10 = 1;
  }
LABEL_29:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_titleText hash];
  NSUInteger v4 = [(NSString *)self->_systemImageName hash];
  unint64_t v5 = [(HKCodableColorRepresentation *)self->_foregroundColor hash];
  char has = (char)self->_has;
  if (has)
  {
    double detailDate = self->_detailDate;
    double v9 = -detailDate;
    if (detailDate >= 0.0) {
      double v9 = self->_detailDate;
    }
    long double v10 = floor(v9 + 0.5);
    double v11 = (v9 - v10) * 1.84467441e19;
    unint64_t v7 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0) {
        v7 += (unint64_t)v11;
      }
    }
    else
    {
      v7 -= (unint64_t)fabs(v11);
    }
  }
  else
  {
    unint64_t v7 = 0;
  }
  if ((has & 4) != 0) {
    uint64_t v12 = 2654435761 * self->_forceDayGranularity;
  }
  else {
    uint64_t v12 = 0;
  }
  NSUInteger v13 = [(NSString *)self->_detailText hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v14 = 2654435761 * self->_detailsVisibility;
  }
  else {
    uint64_t v14 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v7 ^ v12 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (*((void *)v4 + 6))
  {
    -[HKCodableCellHeaderViewModel setTitleText:](self, "setTitleText:");
    id v4 = v8;
  }
  if (*((void *)v4 + 5))
  {
    -[HKCodableCellHeaderViewModel setSystemImageName:](self, "setSystemImageName:");
    id v4 = v8;
  }
  foregroundColor = self->_foregroundColor;
  uint64_t v6 = *((void *)v4 + 4);
  if (foregroundColor)
  {
    if (!v6) {
      goto LABEL_11;
    }
    foregroundColor = (HKCodableColorRepresentation *)-[HKCodableColorRepresentation mergeFrom:](foregroundColor, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_11;
    }
    foregroundColor = (HKCodableColorRepresentation *)-[HKCodableCellHeaderViewModel setForegroundColor:](self, "setForegroundColor:");
  }
  id v4 = v8;
LABEL_11:
  char v7 = *((unsigned char *)v4 + 60);
  if (v7)
  {
    self->_double detailDate = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v7 = *((unsigned char *)v4 + 60);
  }
  if ((v7 & 4) != 0)
  {
    self->_forceDayGranularity = *((unsigned char *)v4 + 56);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 3))
  {
    foregroundColor = (HKCodableColorRepresentation *)-[HKCodableCellHeaderViewModel setDetailText:](self, "setDetailText:");
    id v4 = v8;
  }
  if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
    self->_detailsVisibility = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  MEMORY[0x1F41817F8](foregroundColor, v4);
}

- (NSString)titleText
{
  return self->_titleText;
}

- (void)setTitleText:(id)a3
{
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (void)setSystemImageName:(id)a3
{
}

- (HKCodableColorRepresentation)foregroundColor
{
  return self->_foregroundColor;
}

- (void)setForegroundColor:(id)a3
{
}

- (double)detailDate
{
  return self->_detailDate;
}

- (BOOL)forceDayGranularity
{
  return self->_forceDayGranularity;
}

- (NSString)detailText
{
  return self->_detailText;
}

- (void)setDetailText:(id)a3
{
}

- (int64_t)detailsVisibility
{
  return self->_detailsVisibility;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[HKCodableCellHeaderViewModel writeTo:]", "HKCodableCellHeaderViewModel.m", 203, "nil != self->_titleText");
}

@end