@interface HKCodableAFibBurdenValue
- (BOOL)hasDayIndexRange;
- (BOOL)hasValue;
- (BOOL)hasValueClamped;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)valueClamped;
- (HKCodableDayIndexRange)dayIndexRange;
- (HKCodableQuantity)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDayIndexRange:(id)a3;
- (void)setHasValueClamped:(BOOL)a3;
- (void)setValue:(id)a3;
- (void)setValueClamped:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableAFibBurdenValue

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (BOOL)hasDayIndexRange
{
  return self->_dayIndexRange != 0;
}

- (void)setValueClamped:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_valueClamped = a3;
}

- (void)setHasValueClamped:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasValueClamped
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableAFibBurdenValue;
  v4 = [(HKCodableAFibBurdenValue *)&v8 description];
  v5 = [(HKCodableAFibBurdenValue *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  value = self->_value;
  if (value)
  {
    v5 = [(HKCodableQuantity *)value dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"value"];
  }
  dayIndexRange = self->_dayIndexRange;
  if (dayIndexRange)
  {
    v7 = [(HKCodableDayIndexRange *)dayIndexRange dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"dayIndexRange"];
  }
  if (*(unsigned char *)&self->_has)
  {
    objc_super v8 = [NSNumber numberWithBool:self->_valueClamped];
    [v3 setObject:v8 forKey:@"valueClamped"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableAFibBurdenValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_value)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_dayIndexRange)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_value)
  {
    objc_msgSend(v4, "setValue:");
    id v4 = v5;
  }
  if (self->_dayIndexRange)
  {
    objc_msgSend(v5, "setDayIndexRange:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[24] = self->_valueClamped;
    v4[28] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HKCodableQuantity *)self->_value copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  id v8 = [(HKCodableDayIndexRange *)self->_dayIndexRange copyWithZone:a3];
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 24) = self->_valueClamped;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  value = self->_value;
  if ((unint64_t)value | *((void *)v4 + 2))
  {
    if (!-[HKCodableQuantity isEqual:](value, "isEqual:")) {
      goto LABEL_8;
    }
  }
  dayIndexRange = self->_dayIndexRange;
  if ((unint64_t)dayIndexRange | *((void *)v4 + 1))
  {
    if (!-[HKCodableDayIndexRange isEqual:](dayIndexRange, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0)
    {
LABEL_8:
      BOOL v7 = 0;
      goto LABEL_9;
    }
    if (self->_valueClamped)
    {
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_8;
      }
    }
    else if (*((unsigned char *)v4 + 24))
    {
      goto LABEL_8;
    }
    BOOL v7 = 1;
  }
LABEL_9:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HKCodableQuantity *)self->_value hash];
  unint64_t v4 = [(HKCodableDayIndexRange *)self->_dayIndexRange hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_valueClamped;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  value = self->_value;
  uint64_t v6 = *((void *)v4 + 2);
  id v9 = v4;
  if (value)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[HKCodableQuantity mergeFrom:](value, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[HKCodableAFibBurdenValue setValue:](self, "setValue:");
  }
  id v4 = v9;
LABEL_7:
  dayIndexRange = self->_dayIndexRange;
  uint64_t v8 = *((void *)v4 + 1);
  if (dayIndexRange)
  {
    if (!v8) {
      goto LABEL_13;
    }
    dayIndexRange = (HKCodableDayIndexRange *)-[HKCodableDayIndexRange mergeFrom:](dayIndexRange, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    dayIndexRange = (HKCodableDayIndexRange *)-[HKCodableAFibBurdenValue setDayIndexRange:](self, "setDayIndexRange:");
  }
  id v4 = v9;
LABEL_13:
  if (*((unsigned char *)v4 + 28))
  {
    self->_valueClamped = *((unsigned char *)v4 + 24);
    *(unsigned char *)&self->_has |= 1u;
  }
  MEMORY[0x1F41817F8](dayIndexRange, v4);
}

- (HKCodableQuantity)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (HKCodableDayIndexRange)dayIndexRange
{
  return self->_dayIndexRange;
}

- (void)setDayIndexRange:(id)a3
{
}

- (BOOL)valueClamped
{
  return self->_valueClamped;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_dayIndexRange, 0);
}

@end