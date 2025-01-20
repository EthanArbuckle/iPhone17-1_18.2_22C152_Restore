@interface HKCodableSummaryWalkingSteadinessValue
- (BOOL)hasClassificationRawValue;
- (BOOL)hasLevelViewDataConfiguration;
- (BOOL)hasQuantity;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HKCodableLevelViewDataConfiguration)levelViewDataConfiguration;
- (HKCodableSummaryQuantityValue)quantity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)classificationRawValue;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setClassificationRawValue:(int64_t)a3;
- (void)setHasClassificationRawValue:(BOOL)a3;
- (void)setLevelViewDataConfiguration:(id)a3;
- (void)setQuantity:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableSummaryWalkingSteadinessValue

- (BOOL)hasQuantity
{
  return self->_quantity != 0;
}

- (void)setClassificationRawValue:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_classificationRawValue = a3;
}

- (void)setHasClassificationRawValue:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasClassificationRawValue
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasLevelViewDataConfiguration
{
  return self->_levelViewDataConfiguration != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableSummaryWalkingSteadinessValue;
  v4 = [(HKCodableSummaryWalkingSteadinessValue *)&v8 description];
  v5 = [(HKCodableSummaryWalkingSteadinessValue *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  quantity = self->_quantity;
  if (quantity)
  {
    v5 = [(HKCodableSummaryQuantityValue *)quantity dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"quantity"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithLongLong:self->_classificationRawValue];
    [v3 setObject:v6 forKey:@"classificationRawValue"];
  }
  levelViewDataConfiguration = self->_levelViewDataConfiguration;
  if (levelViewDataConfiguration)
  {
    objc_super v8 = [(HKCodableLevelViewDataConfiguration *)levelViewDataConfiguration dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"levelViewDataConfiguration"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSummaryWalkingSteadinessValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_quantity)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
  if (self->_levelViewDataConfiguration)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_quantity)
  {
    objc_msgSend(v4, "setQuantity:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_classificationRawValue;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  if (self->_levelViewDataConfiguration)
  {
    objc_msgSend(v5, "setLevelViewDataConfiguration:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HKCodableSummaryQuantityValue *)self->_quantity copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_classificationRawValue;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  id v8 = [(HKCodableLevelViewDataConfiguration *)self->_levelViewDataConfiguration copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  quantity = self->_quantity;
  if ((unint64_t)quantity | *((void *)v4 + 3))
  {
    if (!-[HKCodableSummaryQuantityValue isEqual:](quantity, "isEqual:")) {
      goto LABEL_11;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_classificationRawValue != *((void *)v4 + 1)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  levelViewDataConfiguration = self->_levelViewDataConfiguration;
  if ((unint64_t)levelViewDataConfiguration | *((void *)v4 + 2)) {
    char v7 = -[HKCodableLevelViewDataConfiguration isEqual:](levelViewDataConfiguration, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HKCodableSummaryQuantityValue *)self->_quantity hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_classificationRawValue;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(HKCodableLevelViewDataConfiguration *)self->_levelViewDataConfiguration hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  quantity = self->_quantity;
  uint64_t v6 = v4[3];
  v9 = v4;
  if (quantity)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[HKCodableSummaryQuantityValue mergeFrom:](quantity, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[HKCodableSummaryWalkingSteadinessValue setQuantity:](self, "setQuantity:");
  }
  uint64_t v4 = v9;
LABEL_7:
  if (v4[4])
  {
    self->_classificationRawValue = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  levelViewDataConfiguration = self->_levelViewDataConfiguration;
  uint64_t v8 = v4[2];
  if (levelViewDataConfiguration)
  {
    if (!v8) {
      goto LABEL_15;
    }
    levelViewDataConfiguration = (HKCodableLevelViewDataConfiguration *)-[HKCodableLevelViewDataConfiguration mergeFrom:](levelViewDataConfiguration, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_15;
    }
    levelViewDataConfiguration = (HKCodableLevelViewDataConfiguration *)-[HKCodableSummaryWalkingSteadinessValue setLevelViewDataConfiguration:](self, "setLevelViewDataConfiguration:");
  }
  uint64_t v4 = v9;
LABEL_15:
  MEMORY[0x1F41817F8](levelViewDataConfiguration, v4);
}

- (HKCodableSummaryQuantityValue)quantity
{
  return self->_quantity;
}

- (void)setQuantity:(id)a3
{
}

- (int64_t)classificationRawValue
{
  return self->_classificationRawValue;
}

- (HKCodableLevelViewDataConfiguration)levelViewDataConfiguration
{
  return self->_levelViewDataConfiguration;
}

- (void)setLevelViewDataConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quantity, 0);
  objc_storeStrong((id *)&self->_levelViewDataConfiguration, 0);
}

@end