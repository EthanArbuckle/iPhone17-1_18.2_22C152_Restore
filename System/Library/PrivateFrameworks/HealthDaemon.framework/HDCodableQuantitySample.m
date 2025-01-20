@interface HDCodableQuantitySample
+ (Class)quantitySeriesDataType;
- (BOOL)applyToObject:(id)a3;
- (BOOL)final;
- (BOOL)frozen;
- (BOOL)hasCount;
- (BOOL)hasFinal;
- (BOOL)hasFrozen;
- (BOOL)hasMax;
- (BOOL)hasMin;
- (BOOL)hasMostRecent;
- (BOOL)hasMostRecentDate;
- (BOOL)hasMostRecentDuration;
- (BOOL)hasOriginalUnitString;
- (BOOL)hasSample;
- (BOOL)hasValueInCanonicalUnit;
- (BOOL)hasValueInOriginalUnit;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSeries;
- (BOOL)readFrom:(id)a3;
- (HDCodableSample)sample;
- (NSMutableArray)quantitySeriesDatas;
- (NSString)description;
- (NSString)originalUnitString;
- (double)max;
- (double)min;
- (double)mostRecent;
- (double)mostRecentDate;
- (double)mostRecentDuration;
- (double)valueInCanonicalUnit;
- (double)valueInOriginalUnit;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)quantitySeriesDataAtIndex:(unint64_t)a3;
- (int64_t)count;
- (unint64_t)hash;
- (unint64_t)quantitySeriesDatasCount;
- (void)addQuantitySeriesData:(id)a3;
- (void)clearQuantitySeriesDatas;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCount:(int64_t)a3;
- (void)setFinal:(BOOL)a3;
- (void)setFrozen:(BOOL)a3;
- (void)setHasCount:(BOOL)a3;
- (void)setHasFinal:(BOOL)a3;
- (void)setHasFrozen:(BOOL)a3;
- (void)setHasMax:(BOOL)a3;
- (void)setHasMin:(BOOL)a3;
- (void)setHasMostRecent:(BOOL)a3;
- (void)setHasMostRecentDate:(BOOL)a3;
- (void)setHasMostRecentDuration:(BOOL)a3;
- (void)setHasValueInCanonicalUnit:(BOOL)a3;
- (void)setHasValueInOriginalUnit:(BOOL)a3;
- (void)setMax:(double)a3;
- (void)setMin:(double)a3;
- (void)setMostRecent:(double)a3;
- (void)setMostRecentDate:(double)a3;
- (void)setMostRecentDuration:(double)a3;
- (void)setOriginalUnitString:(id)a3;
- (void)setQuantitySeriesDatas:(id)a3;
- (void)setSample:(id)a3;
- (void)setValueInCanonicalUnit:(double)a3;
- (void)setValueInOriginalUnit:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableQuantitySample

- (void)setSample:(id)a3
{
}

- (void)setOriginalUnitString:(id)a3
{
}

- (void)setValueInOriginalUnit:(double)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_valueInOriginalUnit = a3;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_sample) {
    PBDataWriterWriteSubmessage();
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteDoubleField();
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x80) != 0) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_originalUnitString) {
    PBDataWriterWriteStringField();
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x200) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 1) == 0)
    {
LABEL_11:
      if ((v6 & 0x100) == 0) {
        goto LABEL_12;
      }
      goto LABEL_29;
    }
  }
  else if ((v6 & 1) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteInt64Field();
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x100) == 0)
  {
LABEL_12:
    if ((v6 & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteBOOLField();
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 4) == 0)
  {
LABEL_13:
    if ((v6 & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteDoubleField();
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 2) == 0)
  {
LABEL_14:
    if ((v6 & 8) == 0) {
      goto LABEL_15;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteDoubleField();
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 8) == 0)
  {
LABEL_15:
    if ((v6 & 0x10) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_32:
  PBDataWriterWriteDoubleField();
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
LABEL_16:
  }
    PBDataWriterWriteDoubleField();
LABEL_17:
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v7 = self->_quantitySeriesDatas;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    PBDataWriterWriteDoubleField();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sample, 0);
  objc_storeStrong((id *)&self->_quantitySeriesDatas, 0);

  objc_storeStrong((id *)&self->_originalUnitString, 0);
}

- (void)setValueInCanonicalUnit:(double)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_valueInCanonicalUnit = a3;
}

- (BOOL)applyToObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(HDCodableQuantitySample *)self sample];
    if (![v5 applyToObject:v4])
    {
      BOOL v10 = 0;
LABEL_33:

      goto LABEL_34;
    }
    __int16 v6 = [v4 quantityType];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v10 = 0;
LABEL_32:

      goto LABEL_33;
    }
    v7 = (void *)MEMORY[0x1E4F2B370];
    if ((*(_WORD *)&self->_has & 0x40) != 0)
    {
      uint64_t v8 = [v6 canonicalUnit];
      uint64_t v9 = &OBJC_IVAR___HDCodableQuantitySample__valueInCanonicalUnit;
    }
    else
    {
      uint64_t v8 = [MEMORY[0x1E4F2B618] unitFromString:self->_originalUnitString];
      uint64_t v9 = &OBJC_IVAR___HDCodableQuantitySample__valueInOriginalUnit;
    }
    v11 = [v7 quantityWithUnit:v8 doubleValue:*(double *)((char *)&self->super.super.isa + *v9)];

    BOOL v10 = v11 != 0;
    if (!v11)
    {
LABEL_31:

      goto LABEL_32;
    }
    [v4 _setQuantity:v11];
    BOOL v12 = (*(_WORD *)&self->_has & 0x200) == 0 || self->_frozen;
    [v4 _setFrozen:v12];
    if (*(_WORD *)&self->_has) {
      [v4 _setCount:self->_count];
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_29:
      if (self->_quantitySeriesDatas) {
        [v4 _setCodableQuantitySample:self];
      }
      goto LABEL_31;
    }
    id v13 = v4;
    long long v14 = [v13 quantity];
    long long v15 = [v14 _unit];

    __int16 has = (__int16)self->_has;
    if ((has & 4) != 0)
    {
      uint64_t v17 = [MEMORY[0x1E4F2B370] quantityWithUnit:v15 doubleValue:self->_min];
      [v13 _setMinimumQuantity:v17];

      __int16 has = (__int16)self->_has;
      if ((has & 2) == 0)
      {
LABEL_19:
        if ((has & 8) == 0) {
          goto LABEL_20;
        }
        goto LABEL_24;
      }
    }
    else if ((has & 2) == 0)
    {
      goto LABEL_19;
    }
    v18 = [MEMORY[0x1E4F2B370] quantityWithUnit:v15 doubleValue:self->_max];
    [v13 _setMaximumQuantity:v18];

    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_20:
      if ((has & 0x10) == 0) {
        goto LABEL_28;
      }
      goto LABEL_25;
    }
LABEL_24:
    v19 = [MEMORY[0x1E4F2B370] quantityWithUnit:v15 doubleValue:self->_mostRecent];
    [v13 _setMostRecentQuantity:v19];

    if ((*(_WORD *)&self->_has & 0x10) == 0)
    {
LABEL_28:

      goto LABEL_29;
    }
LABEL_25:
    v20 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->_mostRecentDate];
    double mostRecentDuration = 0.0;
    if ((*(_WORD *)&self->_has & 0x20) != 0) {
      double mostRecentDuration = self->_mostRecentDuration;
    }
    v22 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v20 duration:mostRecentDuration];
    [v13 _setMostRecentQuantityDateInterval:v22];

    goto LABEL_28;
  }
  BOOL v10 = 0;
LABEL_34:

  return v10;
}

- (HDCodableSample)sample
{
  return self->_sample;
}

- (BOOL)hasSample
{
  return self->_sample != 0;
}

- (void)setHasValueInCanonicalUnit:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasValueInCanonicalUnit
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasValueInOriginalUnit:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasValueInOriginalUnit
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (BOOL)hasOriginalUnitString
{
  return self->_originalUnitString != 0;
}

- (void)setFrozen:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_frozen = a3;
}

- (void)setHasFrozen:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasFrozen
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setCount:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_count = a3;
}

- (void)setHasCount:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasCount
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setFinal:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_final = a3;
}

- (void)setHasFinal:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasFinal
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setMin:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_min = a3;
}

- (void)setHasMin:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasMin
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setMax:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_max = a3;
}

- (void)setHasMax:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasMax
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setMostRecent:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_mostRecent = a3;
}

- (void)setHasMostRecent:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasMostRecent
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setMostRecentDate:(double)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_mostRecentDate = a3;
}

- (void)setHasMostRecentDate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasMostRecentDate
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)clearQuantitySeriesDatas
{
}

- (void)addQuantitySeriesData:(id)a3
{
  id v4 = a3;
  quantitySeriesDatas = self->_quantitySeriesDatas;
  id v8 = v4;
  if (!quantitySeriesDatas)
  {
    __int16 v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_quantitySeriesDatas;
    self->_quantitySeriesDatas = v6;

    id v4 = v8;
    quantitySeriesDatas = self->_quantitySeriesDatas;
  }
  [(NSMutableArray *)quantitySeriesDatas addObject:v4];
}

- (unint64_t)quantitySeriesDatasCount
{
  return [(NSMutableArray *)self->_quantitySeriesDatas count];
}

- (id)quantitySeriesDataAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_quantitySeriesDatas objectAtIndex:a3];
}

+ (Class)quantitySeriesDataType
{
  return (Class)objc_opt_class();
}

- (void)setMostRecentDuration:(double)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_double mostRecentDuration = a3;
}

- (void)setHasMostRecentDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasMostRecentDuration
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (NSString)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableQuantitySample;
  id v4 = [(HDCodableQuantitySample *)&v8 description];
  v5 = [(HDCodableQuantitySample *)self dictionaryRepresentation];
  __int16 v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  __int16 v3 = [MEMORY[0x1E4F1CA60] dictionary];
  sample = self->_sample;
  if (sample)
  {
    v5 = [(HDCodableSample *)sample dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"sample"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    v7 = [NSNumber numberWithDouble:self->_valueInCanonicalUnit];
    [v3 setObject:v7 forKey:@"valueInCanonicalUnit"];

    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x80) != 0)
  {
    objc_super v8 = [NSNumber numberWithDouble:self->_valueInOriginalUnit];
    [v3 setObject:v8 forKey:@"valueInOriginalUnit"];
  }
  originalUnitString = self->_originalUnitString;
  if (originalUnitString) {
    [v3 setObject:originalUnitString forKey:@"originalUnitString"];
  }
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x200) != 0)
  {
    v21 = [NSNumber numberWithBool:self->_frozen];
    [v3 setObject:v21 forKey:@"frozen"];

    __int16 v10 = (__int16)self->_has;
    if ((v10 & 1) == 0)
    {
LABEL_11:
      if ((v10 & 0x100) == 0) {
        goto LABEL_12;
      }
      goto LABEL_33;
    }
  }
  else if ((v10 & 1) == 0)
  {
    goto LABEL_11;
  }
  v22 = [NSNumber numberWithLongLong:self->_count];
  [v3 setObject:v22 forKey:@"count"];

  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x100) == 0)
  {
LABEL_12:
    if ((v10 & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_34;
  }
LABEL_33:
  v23 = [NSNumber numberWithBool:self->_final];
  [v3 setObject:v23 forKey:@"final"];

  __int16 v10 = (__int16)self->_has;
  if ((v10 & 4) == 0)
  {
LABEL_13:
    if ((v10 & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_35;
  }
LABEL_34:
  v24 = [NSNumber numberWithDouble:self->_min];
  [v3 setObject:v24 forKey:@"min"];

  __int16 v10 = (__int16)self->_has;
  if ((v10 & 2) == 0)
  {
LABEL_14:
    if ((v10 & 8) == 0) {
      goto LABEL_15;
    }
    goto LABEL_36;
  }
LABEL_35:
  v25 = [NSNumber numberWithDouble:self->_max];
  [v3 setObject:v25 forKey:@"max"];

  __int16 v10 = (__int16)self->_has;
  if ((v10 & 8) == 0)
  {
LABEL_15:
    if ((v10 & 0x10) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_36:
  v26 = [NSNumber numberWithDouble:self->_mostRecent];
  [v3 setObject:v26 forKey:@"mostRecent"];

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_16:
    v11 = [NSNumber numberWithDouble:self->_mostRecentDate];
    [v3 setObject:v11 forKey:@"mostRecentDate"];
  }
LABEL_17:
  if ([(NSMutableArray *)self->_quantitySeriesDatas count])
  {
    BOOL v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_quantitySeriesDatas, "count"));
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v13 = self->_quantitySeriesDatas;
    uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v28 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * i), "dictionaryRepresentation", (void)v27);
          [v12 addObject:v18];
        }
        uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v15);
    }

    [v3 setObject:v12 forKey:@"quantitySeriesData"];
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    v19 = [NSNumber numberWithDouble:self->_mostRecentDuration];
    [v3 setObject:v19 forKey:@"mostRecentDuration"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableQuantitySampleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v11 = v4;
  if (self->_sample)
  {
    objc_msgSend(v4, "setSample:");
    id v4 = v11;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    *((void *)v4 + 7) = *(void *)&self->_valueInCanonicalUnit;
    *((_WORD *)v4 + 50) |= 0x40u;
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x80) != 0)
  {
    *((void *)v4 + 8) = *(void *)&self->_valueInOriginalUnit;
    *((_WORD *)v4 + 50) |= 0x80u;
  }
  if (self->_originalUnitString)
  {
    objc_msgSend(v11, "setOriginalUnitString:");
    id v4 = v11;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x200) != 0)
  {
    *((unsigned char *)v4 + 97) = self->_frozen;
    *((_WORD *)v4 + 50) |= 0x200u;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 1) == 0)
    {
LABEL_11:
      if ((v6 & 0x100) == 0) {
        goto LABEL_12;
      }
      goto LABEL_28;
    }
  }
  else if ((v6 & 1) == 0)
  {
    goto LABEL_11;
  }
  *((void *)v4 + 1) = self->_count;
  *((_WORD *)v4 + 50) |= 1u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x100) == 0)
  {
LABEL_12:
    if ((v6 & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((unsigned char *)v4 + 96) = self->_final;
  *((_WORD *)v4 + 50) |= 0x100u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 4) == 0)
  {
LABEL_13:
    if ((v6 & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((void *)v4 + 3) = *(void *)&self->_min;
  *((_WORD *)v4 + 50) |= 4u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 2) == 0)
  {
LABEL_14:
    if ((v6 & 8) == 0) {
      goto LABEL_15;
    }
LABEL_31:
    *((void *)v4 + 4) = *(void *)&self->_mostRecent;
    *((_WORD *)v4 + 50) |= 8u;
    if ((*(_WORD *)&self->_has & 0x10) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_30:
  *((void *)v4 + 2) = *(void *)&self->_max;
  *((_WORD *)v4 + 50) |= 2u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 8) != 0) {
    goto LABEL_31;
  }
LABEL_15:
  if ((v6 & 0x10) != 0)
  {
LABEL_16:
    *((void *)v4 + 5) = *(void *)&self->_mostRecentDate;
    *((_WORD *)v4 + 50) |= 0x10u;
  }
LABEL_17:
  if ([(HDCodableQuantitySample *)self quantitySeriesDatasCount])
  {
    [v11 clearQuantitySeriesDatas];
    unint64_t v7 = [(HDCodableQuantitySample *)self quantitySeriesDatasCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t i = 0; i != v8; ++i)
      {
        __int16 v10 = [(HDCodableQuantitySample *)self quantitySeriesDataAtIndex:i];
        [v11 addQuantitySeriesData:v10];
      }
    }
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *((void *)v11 + 6) = *(void *)&self->_mostRecentDuration;
    *((_WORD *)v11 + 50) |= 0x20u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HDCodableSample *)self->_sample copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v6;

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    *(double *)(v5 + 56) = self->_valueInCanonicalUnit;
    *(_WORD *)(v5 + 100) |= 0x40u;
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x80) != 0)
  {
    *(double *)(v5 + 64) = self->_valueInOriginalUnit;
    *(_WORD *)(v5 + 100) |= 0x80u;
  }
  uint64_t v9 = [(NSString *)self->_originalUnitString copyWithZone:a3];
  __int16 v10 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v9;

  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x200) != 0)
  {
    *(unsigned char *)(v5 + 97) = self->_frozen;
    *(_WORD *)(v5 + 100) |= 0x200u;
    __int16 v11 = (__int16)self->_has;
    if ((v11 & 1) == 0)
    {
LABEL_7:
      if ((v11 & 0x100) == 0) {
        goto LABEL_8;
      }
      goto LABEL_25;
    }
  }
  else if ((v11 & 1) == 0)
  {
    goto LABEL_7;
  }
  *(void *)(v5 + 8) = self->_count;
  *(_WORD *)(v5 + 100) |= 1u;
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x100) == 0)
  {
LABEL_8:
    if ((v11 & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
LABEL_25:
  *(unsigned char *)(v5 + 96) = self->_final;
  *(_WORD *)(v5 + 100) |= 0x100u;
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 4) == 0)
  {
LABEL_9:
    if ((v11 & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_27;
  }
LABEL_26:
  *(double *)(v5 + 24) = self->_min;
  *(_WORD *)(v5 + 100) |= 4u;
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 2) == 0)
  {
LABEL_10:
    if ((v11 & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_28;
  }
LABEL_27:
  *(double *)(v5 + 16) = self->_max;
  *(_WORD *)(v5 + 100) |= 2u;
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 8) == 0)
  {
LABEL_11:
    if ((v11 & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_28:
  *(double *)(v5 + 32) = self->_mostRecent;
  *(_WORD *)(v5 + 100) |= 8u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_12:
    *(double *)(v5 + 40) = self->_mostRecentDate;
    *(_WORD *)(v5 + 100) |= 0x10u;
  }
LABEL_13:
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  BOOL v12 = self->_quantitySeriesDatas;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "copyWithZone:", a3, (void)v19);
        [(id)v5 addQuantitySeriesData:v17];
      }
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *(double *)(v5 + 48) = self->_mostRecentDuration;
    *(_WORD *)(v5 + 100) |= 0x20u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_66;
  }
  sample = self->_sample;
  if ((unint64_t)sample | *((void *)v4 + 11))
  {
    if (!-[HDCodableSample isEqual:](sample, "isEqual:")) {
      goto LABEL_66;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v7 = *((_WORD *)v4 + 50);
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_valueInCanonicalUnit != *((double *)v4 + 7)) {
      goto LABEL_66;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_66;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_valueInOriginalUnit != *((double *)v4 + 8)) {
      goto LABEL_66;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_66;
  }
  originalUnitString = self->_originalUnitString;
  if ((unint64_t)originalUnitString | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](originalUnitString, "isEqual:")) {
      goto LABEL_66;
    }
    __int16 has = (__int16)self->_has;
    __int16 v7 = *((_WORD *)v4 + 50);
  }
  if ((has & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0) {
      goto LABEL_66;
    }
    if (self->_frozen)
    {
      if (!*((unsigned char *)v4 + 97)) {
        goto LABEL_66;
      }
    }
    else if (*((unsigned char *)v4 + 97))
    {
      goto LABEL_66;
    }
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_66;
  }
  if (has)
  {
    if ((v7 & 1) == 0 || self->_count != *((void *)v4 + 1)) {
      goto LABEL_66;
    }
  }
  else if (v7)
  {
    goto LABEL_66;
  }
  if ((has & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0) {
      goto LABEL_66;
    }
    if (self->_final)
    {
      if (!*((unsigned char *)v4 + 96)) {
        goto LABEL_66;
      }
    }
    else if (*((unsigned char *)v4 + 96))
    {
      goto LABEL_66;
    }
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_66;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_min != *((double *)v4 + 3)) {
      goto LABEL_66;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_66;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_max != *((double *)v4 + 2)) {
      goto LABEL_66;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_66;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_mostRecent != *((double *)v4 + 4)) {
      goto LABEL_66;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_66;
  }
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_mostRecentDate != *((double *)v4 + 5)) {
      goto LABEL_66;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_66;
  }
  quantitySeriesDatas = self->_quantitySeriesDatas;
  if ((unint64_t)quantitySeriesDatas | *((void *)v4 + 10))
  {
    if (-[NSMutableArray isEqual:](quantitySeriesDatas, "isEqual:"))
    {
      __int16 has = (__int16)self->_has;
      __int16 v7 = *((_WORD *)v4 + 50);
      goto LABEL_61;
    }
LABEL_66:
    BOOL v10 = 0;
    goto LABEL_67;
  }
LABEL_61:
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_mostRecentDuration != *((double *)v4 + 6)) {
      goto LABEL_66;
    }
    BOOL v10 = 1;
  }
  else
  {
    BOOL v10 = (v7 & 0x20) == 0;
  }
LABEL_67:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v47 = [(HDCodableSample *)self->_sample hash];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    double valueInCanonicalUnit = self->_valueInCanonicalUnit;
    double v6 = -valueInCanonicalUnit;
    if (valueInCanonicalUnit >= 0.0) {
      double v6 = self->_valueInCanonicalUnit;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  unint64_t v46 = v4;
  if ((has & 0x80) != 0)
  {
    double valueInOriginalUnit = self->_valueInOriginalUnit;
    double v11 = -valueInOriginalUnit;
    if (valueInOriginalUnit >= 0.0) {
      double v11 = self->_valueInOriginalUnit;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  NSUInteger v45 = [(NSString *)self->_originalUnitString hash];
  __int16 v14 = (__int16)self->_has;
  if ((v14 & 0x200) != 0)
  {
    uint64_t v44 = 2654435761 * self->_frozen;
    if (v14)
    {
LABEL_19:
      uint64_t v43 = 2654435761 * self->_count;
      if ((*(_WORD *)&self->_has & 0x100) != 0) {
        goto LABEL_20;
      }
LABEL_27:
      uint64_t v15 = 0;
      if ((v14 & 4) != 0) {
        goto LABEL_21;
      }
LABEL_28:
      unint64_t v20 = 0;
      goto LABEL_31;
    }
  }
  else
  {
    uint64_t v44 = 0;
    if (v14) {
      goto LABEL_19;
    }
  }
  uint64_t v43 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    goto LABEL_27;
  }
LABEL_20:
  uint64_t v15 = 2654435761 * self->_final;
  if ((v14 & 4) == 0) {
    goto LABEL_28;
  }
LABEL_21:
  double min = self->_min;
  double v17 = -min;
  if (min >= 0.0) {
    double v17 = self->_min;
  }
  long double v18 = floor(v17 + 0.5);
  double v19 = (v17 - v18) * 1.84467441e19;
  unint64_t v20 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
  if (v19 >= 0.0)
  {
    if (v19 > 0.0) {
      v20 += (unint64_t)v19;
    }
  }
  else
  {
    v20 -= (unint64_t)fabs(v19);
  }
LABEL_31:
  if ((v14 & 2) != 0)
  {
    double max = self->_max;
    double v23 = -max;
    if (max >= 0.0) {
      double v23 = self->_max;
    }
    long double v24 = floor(v23 + 0.5);
    double v25 = (v23 - v24) * 1.84467441e19;
    unint64_t v21 = 2654435761u * (unint64_t)fmod(v24, 1.84467441e19);
    if (v25 >= 0.0)
    {
      if (v25 > 0.0) {
        v21 += (unint64_t)v25;
      }
    }
    else
    {
      v21 -= (unint64_t)fabs(v25);
    }
  }
  else
  {
    unint64_t v21 = 0;
  }
  if ((v14 & 8) != 0)
  {
    double mostRecent = self->_mostRecent;
    double v28 = -mostRecent;
    if (mostRecent >= 0.0) {
      double v28 = self->_mostRecent;
    }
    long double v29 = floor(v28 + 0.5);
    double v30 = (v28 - v29) * 1.84467441e19;
    unint64_t v26 = 2654435761u * (unint64_t)fmod(v29, 1.84467441e19);
    if (v30 >= 0.0)
    {
      if (v30 > 0.0) {
        v26 += (unint64_t)v30;
      }
    }
    else
    {
      v26 -= (unint64_t)fabs(v30);
    }
  }
  else
  {
    unint64_t v26 = 0;
  }
  if ((v14 & 0x10) != 0)
  {
    double mostRecentDate = self->_mostRecentDate;
    double v33 = -mostRecentDate;
    if (mostRecentDate >= 0.0) {
      double v33 = self->_mostRecentDate;
    }
    long double v34 = floor(v33 + 0.5);
    double v35 = (v33 - v34) * 1.84467441e19;
    unint64_t v31 = 2654435761u * (unint64_t)fmod(v34, 1.84467441e19);
    if (v35 >= 0.0)
    {
      if (v35 > 0.0) {
        v31 += (unint64_t)v35;
      }
    }
    else
    {
      v31 -= (unint64_t)fabs(v35);
    }
  }
  else
  {
    unint64_t v31 = 0;
  }
  uint64_t v36 = [(NSMutableArray *)self->_quantitySeriesDatas hash];
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    double mostRecentDuration = self->_mostRecentDuration;
    double v39 = -mostRecentDuration;
    if (mostRecentDuration >= 0.0) {
      double v39 = self->_mostRecentDuration;
    }
    long double v40 = floor(v39 + 0.5);
    double v41 = (v39 - v40) * 1.84467441e19;
    unint64_t v37 = 2654435761u * (unint64_t)fmod(v40, 1.84467441e19);
    if (v41 >= 0.0)
    {
      if (v41 > 0.0) {
        v37 += (unint64_t)v41;
      }
    }
    else
    {
      v37 -= (unint64_t)fabs(v41);
    }
  }
  else
  {
    unint64_t v37 = 0;
  }
  return v46 ^ v47 ^ v9 ^ v45 ^ v44 ^ v43 ^ v15 ^ v20 ^ v21 ^ v26 ^ v31 ^ v36 ^ v37;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  sample = self->_sample;
  uint64_t v6 = *((void *)v4 + 11);
  if (sample)
  {
    if (v6) {
      -[HDCodableSample mergeFrom:](sample, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[HDCodableQuantitySample setSample:](self, "setSample:");
  }
  __int16 v7 = *((_WORD *)v4 + 50);
  if ((v7 & 0x40) != 0)
  {
    self->_double valueInCanonicalUnit = *((double *)v4 + 7);
    *(_WORD *)&self->_has |= 0x40u;
    __int16 v7 = *((_WORD *)v4 + 50);
  }
  if ((v7 & 0x80) != 0)
  {
    self->_double valueInOriginalUnit = *((double *)v4 + 8);
    *(_WORD *)&self->_has |= 0x80u;
  }
  if (*((void *)v4 + 9)) {
    -[HDCodableQuantitySample setOriginalUnitString:](self, "setOriginalUnitString:");
  }
  __int16 v8 = *((_WORD *)v4 + 50);
  if ((v8 & 0x200) != 0)
  {
    self->_frozen = *((unsigned char *)v4 + 97);
    *(_WORD *)&self->_has |= 0x200u;
    __int16 v8 = *((_WORD *)v4 + 50);
    if ((v8 & 1) == 0)
    {
LABEL_14:
      if ((v8 & 0x100) == 0) {
        goto LABEL_15;
      }
      goto LABEL_32;
    }
  }
  else if ((v8 & 1) == 0)
  {
    goto LABEL_14;
  }
  self->_count = *((void *)v4 + 1);
  *(_WORD *)&self->_has |= 1u;
  __int16 v8 = *((_WORD *)v4 + 50);
  if ((v8 & 0x100) == 0)
  {
LABEL_15:
    if ((v8 & 4) == 0) {
      goto LABEL_16;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_final = *((unsigned char *)v4 + 96);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v8 = *((_WORD *)v4 + 50);
  if ((v8 & 4) == 0)
  {
LABEL_16:
    if ((v8 & 2) == 0) {
      goto LABEL_17;
    }
    goto LABEL_34;
  }
LABEL_33:
  self->_double min = *((double *)v4 + 3);
  *(_WORD *)&self->_has |= 4u;
  __int16 v8 = *((_WORD *)v4 + 50);
  if ((v8 & 2) == 0)
  {
LABEL_17:
    if ((v8 & 8) == 0) {
      goto LABEL_18;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_double max = *((double *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  __int16 v8 = *((_WORD *)v4 + 50);
  if ((v8 & 8) == 0)
  {
LABEL_18:
    if ((v8 & 0x10) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_35:
  self->_double mostRecent = *((double *)v4 + 4);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)v4 + 50) & 0x10) != 0)
  {
LABEL_19:
    self->_double mostRecentDate = *((double *)v4 + 5);
    *(_WORD *)&self->_has |= 0x10u;
  }
LABEL_20:
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = *((id *)v4 + 10);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        -[HDCodableQuantitySample addQuantitySeriesData:](self, "addQuantitySeriesData:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }

  if ((*((_WORD *)v4 + 50) & 0x20) != 0)
  {
    self->_double mostRecentDuration = *((double *)v4 + 6);
    *(_WORD *)&self->_has |= 0x20u;
  }
}

- (double)valueInCanonicalUnit
{
  return self->_valueInCanonicalUnit;
}

- (double)valueInOriginalUnit
{
  return self->_valueInOriginalUnit;
}

- (NSString)originalUnitString
{
  return self->_originalUnitString;
}

- (BOOL)frozen
{
  return self->_frozen;
}

- (int64_t)count
{
  return self->_count;
}

- (BOOL)final
{
  return self->_final;
}

- (double)min
{
  return self->_min;
}

- (double)max
{
  return self->_max;
}

- (double)mostRecent
{
  return self->_mostRecent;
}

- (double)mostRecentDate
{
  return self->_mostRecentDate;
}

- (NSMutableArray)quantitySeriesDatas
{
  return self->_quantitySeriesDatas;
}

- (void)setQuantitySeriesDatas:(id)a3
{
}

- (double)mostRecentDuration
{
  return self->_mostRecentDuration;
}

- (BOOL)isSeries
{
  return !self->_frozen || self->_count > 1 || self->_quantitySeriesDatas != 0;
}

@end