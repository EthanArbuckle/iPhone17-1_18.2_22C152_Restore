@interface HKCodableSummaryTrendChartViewModel
- (BOOL)hasBaselineDateInterval;
- (BOOL)hasBaselineQuantity;
- (BOOL)hasChangeDateInterval;
- (BOOL)hasChangeQuantity;
- (BOOL)hasChangeTypeRawValue;
- (BOOL)hasChartString;
- (BOOL)hasCoveredTimeScopeRawValue;
- (BOOL)hasObjectTypeIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HKCodableDateInterval)baselineDateInterval;
- (HKCodableDateInterval)changeDateInterval;
- (HKCodableQuantity)baselineQuantity;
- (HKCodableQuantity)changeQuantity;
- (NSString)changeTypeRawValue;
- (NSString)chartString;
- (NSString)objectTypeIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)coveredTimeScopeRawValue;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBaselineDateInterval:(id)a3;
- (void)setBaselineQuantity:(id)a3;
- (void)setChangeDateInterval:(id)a3;
- (void)setChangeQuantity:(id)a3;
- (void)setChangeTypeRawValue:(id)a3;
- (void)setChartString:(id)a3;
- (void)setCoveredTimeScopeRawValue:(int64_t)a3;
- (void)setHasCoveredTimeScopeRawValue:(BOOL)a3;
- (void)setObjectTypeIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableSummaryTrendChartViewModel

- (BOOL)hasChartString
{
  return self->_chartString != 0;
}

- (BOOL)hasChangeTypeRawValue
{
  return self->_changeTypeRawValue != 0;
}

- (BOOL)hasObjectTypeIdentifier
{
  return self->_objectTypeIdentifier != 0;
}

- (void)setCoveredTimeScopeRawValue:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_coveredTimeScopeRawValue = a3;
}

- (void)setHasCoveredTimeScopeRawValue:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCoveredTimeScopeRawValue
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasBaselineDateInterval
{
  return self->_baselineDateInterval != 0;
}

- (BOOL)hasBaselineQuantity
{
  return self->_baselineQuantity != 0;
}

- (BOOL)hasChangeDateInterval
{
  return self->_changeDateInterval != 0;
}

- (BOOL)hasChangeQuantity
{
  return self->_changeQuantity != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableSummaryTrendChartViewModel;
  v4 = [(HKCodableSummaryTrendChartViewModel *)&v8 description];
  v5 = [(HKCodableSummaryTrendChartViewModel *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  chartString = self->_chartString;
  if (chartString) {
    [v3 setObject:chartString forKey:@"chartString"];
  }
  changeTypeRawValue = self->_changeTypeRawValue;
  if (changeTypeRawValue) {
    [v4 setObject:changeTypeRawValue forKey:@"changeTypeRawValue"];
  }
  objectTypeIdentifier = self->_objectTypeIdentifier;
  if (objectTypeIdentifier) {
    [v4 setObject:objectTypeIdentifier forKey:@"objectTypeIdentifier"];
  }
  if (*(unsigned char *)&self->_has)
  {
    objc_super v8 = [NSNumber numberWithLongLong:self->_coveredTimeScopeRawValue];
    [v4 setObject:v8 forKey:@"coveredTimeScopeRawValue"];
  }
  baselineDateInterval = self->_baselineDateInterval;
  if (baselineDateInterval)
  {
    v10 = [(HKCodableDateInterval *)baselineDateInterval dictionaryRepresentation];
    [v4 setObject:v10 forKey:@"baselineDateInterval"];
  }
  baselineQuantity = self->_baselineQuantity;
  if (baselineQuantity)
  {
    v12 = [(HKCodableQuantity *)baselineQuantity dictionaryRepresentation];
    [v4 setObject:v12 forKey:@"baselineQuantity"];
  }
  changeDateInterval = self->_changeDateInterval;
  if (changeDateInterval)
  {
    v14 = [(HKCodableDateInterval *)changeDateInterval dictionaryRepresentation];
    [v4 setObject:v14 forKey:@"changeDateInterval"];
  }
  changeQuantity = self->_changeQuantity;
  if (changeQuantity)
  {
    v16 = [(HKCodableQuantity *)changeQuantity dictionaryRepresentation];
    [v4 setObject:v16 forKey:@"changeQuantity"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSummaryTrendChartViewModelReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_chartString)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_changeTypeRawValue)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_objectTypeIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
  if (self->_baselineDateInterval)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_baselineQuantity)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_changeDateInterval)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_changeQuantity)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_chartString)
  {
    objc_msgSend(v4, "setChartString:");
    id v4 = v5;
  }
  if (self->_changeTypeRawValue)
  {
    objc_msgSend(v5, "setChangeTypeRawValue:");
    id v4 = v5;
  }
  if (self->_objectTypeIdentifier)
  {
    objc_msgSend(v5, "setObjectTypeIdentifier:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_coveredTimeScopeRawValue;
    *((unsigned char *)v4 + 72) |= 1u;
  }
  if (self->_baselineDateInterval)
  {
    objc_msgSend(v5, "setBaselineDateInterval:");
    id v4 = v5;
  }
  if (self->_baselineQuantity)
  {
    objc_msgSend(v5, "setBaselineQuantity:");
    id v4 = v5;
  }
  if (self->_changeDateInterval)
  {
    objc_msgSend(v5, "setChangeDateInterval:");
    id v4 = v5;
  }
  if (self->_changeQuantity)
  {
    objc_msgSend(v5, "setChangeQuantity:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_chartString copyWithZone:a3];
  v7 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v6;

  uint64_t v8 = [(NSString *)self->_changeTypeRawValue copyWithZone:a3];
  v9 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v8;

  uint64_t v10 = [(NSString *)self->_objectTypeIdentifier copyWithZone:a3];
  v11 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v10;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_coveredTimeScopeRawValue;
    *(unsigned char *)(v5 + 72) |= 1u;
  }
  id v12 = [(HKCodableDateInterval *)self->_baselineDateInterval copyWithZone:a3];
  v13 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v12;

  id v14 = [(HKCodableQuantity *)self->_baselineQuantity copyWithZone:a3];
  v15 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v14;

  id v16 = [(HKCodableDateInterval *)self->_changeDateInterval copyWithZone:a3];
  v17 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v16;

  id v18 = [(HKCodableQuantity *)self->_changeQuantity copyWithZone:a3];
  v19 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v18;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  chartString = self->_chartString;
  if ((unint64_t)chartString | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](chartString, "isEqual:")) {
      goto LABEL_21;
    }
  }
  changeTypeRawValue = self->_changeTypeRawValue;
  if ((unint64_t)changeTypeRawValue | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](changeTypeRawValue, "isEqual:")) {
      goto LABEL_21;
    }
  }
  objectTypeIdentifier = self->_objectTypeIdentifier;
  if ((unint64_t)objectTypeIdentifier | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](objectTypeIdentifier, "isEqual:")) {
      goto LABEL_21;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 72) & 1) == 0 || self->_coveredTimeScopeRawValue != *((void *)v4 + 1)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 72))
  {
LABEL_21:
    char v12 = 0;
    goto LABEL_22;
  }
  baselineDateInterval = self->_baselineDateInterval;
  if ((unint64_t)baselineDateInterval | *((void *)v4 + 2)
    && !-[HKCodableDateInterval isEqual:](baselineDateInterval, "isEqual:"))
  {
    goto LABEL_21;
  }
  baselineQuantity = self->_baselineQuantity;
  if ((unint64_t)baselineQuantity | *((void *)v4 + 3))
  {
    if (!-[HKCodableQuantity isEqual:](baselineQuantity, "isEqual:")) {
      goto LABEL_21;
    }
  }
  changeDateInterval = self->_changeDateInterval;
  if ((unint64_t)changeDateInterval | *((void *)v4 + 4))
  {
    if (!-[HKCodableDateInterval isEqual:](changeDateInterval, "isEqual:")) {
      goto LABEL_21;
    }
  }
  changeQuantity = self->_changeQuantity;
  if ((unint64_t)changeQuantity | *((void *)v4 + 5)) {
    char v12 = -[HKCodableQuantity isEqual:](changeQuantity, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_22:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_chartString hash];
  NSUInteger v4 = [(NSString *)self->_changeTypeRawValue hash];
  NSUInteger v5 = [(NSString *)self->_objectTypeIdentifier hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_coveredTimeScopeRawValue;
  }
  else {
    uint64_t v6 = 0;
  }
  NSUInteger v7 = v4 ^ v3 ^ v5 ^ v6;
  unint64_t v8 = [(HKCodableDateInterval *)self->_baselineDateInterval hash];
  unint64_t v9 = v8 ^ [(HKCodableQuantity *)self->_baselineQuantity hash];
  unint64_t v10 = v7 ^ v9 ^ [(HKCodableDateInterval *)self->_changeDateInterval hash];
  return v10 ^ [(HKCodableQuantity *)self->_changeQuantity hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  v13 = v4;
  if (v4[7])
  {
    -[HKCodableSummaryTrendChartViewModel setChartString:](self, "setChartString:");
    NSUInteger v4 = v13;
  }
  if (v4[6])
  {
    -[HKCodableSummaryTrendChartViewModel setChangeTypeRawValue:](self, "setChangeTypeRawValue:");
    NSUInteger v4 = v13;
  }
  if (v4[8])
  {
    -[HKCodableSummaryTrendChartViewModel setObjectTypeIdentifier:](self, "setObjectTypeIdentifier:");
    NSUInteger v4 = v13;
  }
  if (v4[9])
  {
    self->_coveredTimeScopeRawValue = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  baselineDateInterval = self->_baselineDateInterval;
  uint64_t v6 = v4[2];
  if (baselineDateInterval)
  {
    if (!v6) {
      goto LABEL_15;
    }
    -[HKCodableDateInterval mergeFrom:](baselineDateInterval, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_15;
    }
    -[HKCodableSummaryTrendChartViewModel setBaselineDateInterval:](self, "setBaselineDateInterval:");
  }
  NSUInteger v4 = v13;
LABEL_15:
  baselineQuantity = self->_baselineQuantity;
  uint64_t v8 = v4[3];
  if (baselineQuantity)
  {
    if (!v8) {
      goto LABEL_21;
    }
    -[HKCodableQuantity mergeFrom:](baselineQuantity, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_21;
    }
    -[HKCodableSummaryTrendChartViewModel setBaselineQuantity:](self, "setBaselineQuantity:");
  }
  NSUInteger v4 = v13;
LABEL_21:
  changeDateInterval = self->_changeDateInterval;
  uint64_t v10 = v4[4];
  if (changeDateInterval)
  {
    if (!v10) {
      goto LABEL_27;
    }
    -[HKCodableDateInterval mergeFrom:](changeDateInterval, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_27;
    }
    -[HKCodableSummaryTrendChartViewModel setChangeDateInterval:](self, "setChangeDateInterval:");
  }
  NSUInteger v4 = v13;
LABEL_27:
  changeQuantity = self->_changeQuantity;
  uint64_t v12 = v4[5];
  if (changeQuantity)
  {
    if (!v12) {
      goto LABEL_33;
    }
    changeQuantity = (HKCodableQuantity *)-[HKCodableQuantity mergeFrom:](changeQuantity, "mergeFrom:");
  }
  else
  {
    if (!v12) {
      goto LABEL_33;
    }
    changeQuantity = (HKCodableQuantity *)-[HKCodableSummaryTrendChartViewModel setChangeQuantity:](self, "setChangeQuantity:");
  }
  NSUInteger v4 = v13;
LABEL_33:
  MEMORY[0x1F41817F8](changeQuantity, v4);
}

- (NSString)chartString
{
  return self->_chartString;
}

- (void)setChartString:(id)a3
{
}

- (NSString)changeTypeRawValue
{
  return self->_changeTypeRawValue;
}

- (void)setChangeTypeRawValue:(id)a3
{
}

- (NSString)objectTypeIdentifier
{
  return self->_objectTypeIdentifier;
}

- (void)setObjectTypeIdentifier:(id)a3
{
}

- (int64_t)coveredTimeScopeRawValue
{
  return self->_coveredTimeScopeRawValue;
}

- (HKCodableDateInterval)baselineDateInterval
{
  return self->_baselineDateInterval;
}

- (void)setBaselineDateInterval:(id)a3
{
}

- (HKCodableQuantity)baselineQuantity
{
  return self->_baselineQuantity;
}

- (void)setBaselineQuantity:(id)a3
{
}

- (HKCodableDateInterval)changeDateInterval
{
  return self->_changeDateInterval;
}

- (void)setChangeDateInterval:(id)a3
{
}

- (HKCodableQuantity)changeQuantity
{
  return self->_changeQuantity;
}

- (void)setChangeQuantity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_chartString, 0);
  objc_storeStrong((id *)&self->_changeTypeRawValue, 0);
  objc_storeStrong((id *)&self->_changeQuantity, 0);
  objc_storeStrong((id *)&self->_changeDateInterval, 0);
  objc_storeStrong((id *)&self->_baselineQuantity, 0);
  objc_storeStrong((id *)&self->_baselineDateInterval, 0);
}

@end