@interface HKCodableSampleChartData
- (BOOL)hasDataType;
- (BOOL)hasEndDate;
- (BOOL)hasInt64Value;
- (BOOL)hasMetadataDictionary;
- (BOOL)hasQuantity;
- (BOOL)hasStartDate;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HKCodableMetadataDictionary)metadataDictionary;
- (HKCodableQuantity)quantity;
- (double)endDate;
- (double)startDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)dataType;
- (int64_t)int64Value;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDataType:(int64_t)a3;
- (void)setEndDate:(double)a3;
- (void)setHasDataType:(BOOL)a3;
- (void)setHasEndDate:(BOOL)a3;
- (void)setHasInt64Value:(BOOL)a3;
- (void)setHasStartDate:(BOOL)a3;
- (void)setInt64Value:(int64_t)a3;
- (void)setMetadataDictionary:(id)a3;
- (void)setQuantity:(id)a3;
- (void)setStartDate:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableSampleChartData

- (void)setDataType:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_dataType = a3;
}

- (void)setHasDataType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDataType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setInt64Value:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int64Value = a3;
}

- (void)setHasInt64Value:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasInt64Value
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setStartDate:(double)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_startDate = a3;
}

- (void)setHasStartDate:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasStartDate
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setEndDate:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_endDate = a3;
}

- (void)setHasEndDate:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEndDate
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasMetadataDictionary
{
  return self->_metadataDictionary != 0;
}

- (BOOL)hasQuantity
{
  return self->_quantity != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableSampleChartData;
  v4 = [(HKCodableSampleChartData *)&v8 description];
  v5 = [(HKCodableSampleChartData *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v11 = [NSNumber numberWithLongLong:self->_dataType];
    [v3 setObject:v11 forKey:@"dataType"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v12 = [NSNumber numberWithLongLong:self->_int64Value];
  [v3 setObject:v12 forKey:@"int64Value"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_15:
  v13 = [NSNumber numberWithDouble:self->_startDate];
  [v3 setObject:v13 forKey:@"startDate"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_5:
    v5 = [NSNumber numberWithDouble:self->_endDate];
    [v3 setObject:v5 forKey:@"endDate"];
  }
LABEL_6:
  metadataDictionary = self->_metadataDictionary;
  if (metadataDictionary)
  {
    v7 = [(HKCodableMetadataDictionary *)metadataDictionary dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"metadataDictionary"];
  }
  quantity = self->_quantity;
  if (quantity)
  {
    v9 = [(HKCodableQuantity *)quantity dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"quantity"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSampleChartDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_15:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_5:
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
LABEL_6:
  if (self->_metadataDictionary)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_quantity)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = self->_dataType;
    *((unsigned char *)v4 + 56) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[3] = self->_int64Value;
  *((unsigned char *)v4 + 56) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_15:
  v4[4] = *(void *)&self->_startDate;
  *((unsigned char *)v4 + 56) |= 8u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_5:
    v4[2] = *(void *)&self->_endDate;
    *((unsigned char *)v4 + 56) |= 2u;
  }
LABEL_6:
  id v6 = v4;
  if (self->_metadataDictionary)
  {
    objc_msgSend(v4, "setMetadataDictionary:");
    id v4 = v6;
  }
  if (self->_quantity)
  {
    objc_msgSend(v6, "setQuantity:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = (void *)v5;
  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_dataType;
    *(unsigned char *)(v5 + 56) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(double *)(v5 + 32) = self->_startDate;
      *(unsigned char *)(v5 + 56) |= 8u;
      if ((*(unsigned char *)&self->_has & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 24) = self->_int64Value;
  *(unsigned char *)(v5 + 56) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if ((has & 2) != 0)
  {
LABEL_5:
    *(double *)(v5 + 16) = self->_endDate;
    *(unsigned char *)(v5 + 56) |= 2u;
  }
LABEL_6:
  id v8 = [(HKCodableMetadataDictionary *)self->_metadataDictionary copyWithZone:a3];
  v9 = (void *)v6[5];
  v6[5] = v8;

  id v10 = [(HKCodableQuantity *)self->_quantity copyWithZone:a3];
  v11 = (void *)v6[6];
  v6[6] = v10;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_dataType != *((void *)v4 + 1)) {
      goto LABEL_26;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_26:
    char v7 = 0;
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 4) == 0 || self->_int64Value != *((void *)v4 + 3)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 4) != 0)
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 8) == 0 || self->_startDate != *((double *)v4 + 4)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 8) != 0)
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_endDate != *((double *)v4 + 2)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
    goto LABEL_26;
  }
  metadataDictionary = self->_metadataDictionary;
  if ((unint64_t)metadataDictionary | *((void *)v4 + 5)
    && !-[HKCodableMetadataDictionary isEqual:](metadataDictionary, "isEqual:"))
  {
    goto LABEL_26;
  }
  quantity = self->_quantity;
  if ((unint64_t)quantity | *((void *)v4 + 6)) {
    char v7 = -[HKCodableQuantity isEqual:](quantity, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_27:

  return v7;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_4;
    }
LABEL_10:
    unint64_t v10 = 0;
    goto LABEL_13;
  }
  uint64_t v4 = 2654435761 * self->_dataType;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_9;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_int64Value;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_10;
  }
LABEL_4:
  double startDate = self->_startDate;
  double v7 = -startDate;
  if (startDate >= 0.0) {
    double v7 = self->_startDate;
  }
  long double v8 = floor(v7 + 0.5);
  double v9 = (v7 - v8) * 1.84467441e19;
  unint64_t v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0) {
      v10 += (unint64_t)v9;
    }
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
LABEL_13:
  if ((has & 2) != 0)
  {
    double endDate = self->_endDate;
    double v13 = -endDate;
    if (endDate >= 0.0) {
      double v13 = self->_endDate;
    }
    long double v14 = floor(v13 + 0.5);
    double v15 = (v13 - v14) * 1.84467441e19;
    unint64_t v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0) {
        v11 += (unint64_t)v15;
      }
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
  unint64_t v16 = v5 ^ v4 ^ v10 ^ v11 ^ [(HKCodableMetadataDictionary *)self->_metadataDictionary hash];
  return v16 ^ [(HKCodableQuantity *)self->_quantity hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  char v6 = *((unsigned char *)v4 + 56);
  if (v6)
  {
    self->_dataType = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v6 = *((unsigned char *)v4 + 56);
    if ((v6 & 4) == 0)
    {
LABEL_3:
      if ((v6 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_int64Value = *((void *)v4 + 3);
  *(unsigned char *)&self->_has |= 4u;
  char v6 = *((unsigned char *)v4 + 56);
  if ((v6 & 8) == 0)
  {
LABEL_4:
    if ((v6 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  self->_double startDate = *((double *)v4 + 4);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
LABEL_5:
    self->_double endDate = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_6:
  metadataDictionary = self->_metadataDictionary;
  uint64_t v8 = v5[5];
  unint64_t v11 = v5;
  if (metadataDictionary)
  {
    if (!v8) {
      goto LABEL_16;
    }
    -[HKCodableMetadataDictionary mergeFrom:](metadataDictionary, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_16;
    }
    -[HKCodableSampleChartData setMetadataDictionary:](self, "setMetadataDictionary:");
  }
  uint64_t v5 = v11;
LABEL_16:
  quantity = self->_quantity;
  uint64_t v10 = v5[6];
  if (quantity)
  {
    if (!v10) {
      goto LABEL_22;
    }
    quantity = (HKCodableQuantity *)-[HKCodableQuantity mergeFrom:](quantity, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_22;
    }
    quantity = (HKCodableQuantity *)-[HKCodableSampleChartData setQuantity:](self, "setQuantity:");
  }
  uint64_t v5 = v11;
LABEL_22:
  MEMORY[0x1F41817F8](quantity, v5);
}

- (int64_t)dataType
{
  return self->_dataType;
}

- (int64_t)int64Value
{
  return self->_int64Value;
}

- (double)startDate
{
  return self->_startDate;
}

- (double)endDate
{
  return self->_endDate;
}

- (HKCodableMetadataDictionary)metadataDictionary
{
  return self->_metadataDictionary;
}

- (void)setMetadataDictionary:(id)a3
{
}

- (HKCodableQuantity)quantity
{
  return self->_quantity;
}

- (void)setQuantity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quantity, 0);
  objc_storeStrong((id *)&self->_metadataDictionary, 0);
}

@end