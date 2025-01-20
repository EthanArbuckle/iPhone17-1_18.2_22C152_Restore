@interface _INPBPriceRangeValue
+ (BOOL)supportsSecureCoding;
- (BOOL)hasCurrencyCode;
- (BOOL)hasMaximumPrice;
- (BOOL)hasMinimumPrice;
- (BOOL)hasValueMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)currencyCode;
- (_INPBDecimalNumberValue)maximumPrice;
- (_INPBDecimalNumberValue)minimumPrice;
- (_INPBPriceRangeValue)initWithCoder:(id)a3;
- (_INPBValueMetadata)valueMetadata;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCurrencyCode:(id)a3;
- (void)setMaximumPrice:(id)a3;
- (void)setMinimumPrice:(id)a3;
- (void)setValueMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBPriceRangeValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueMetadata, 0);
  objc_storeStrong((id *)&self->_minimumPrice, 0);
  objc_storeStrong((id *)&self->_maximumPrice, 0);

  objc_storeStrong((id *)&self->_currencyCode, 0);
}

- (_INPBValueMetadata)valueMetadata
{
  return self->_valueMetadata;
}

- (_INPBDecimalNumberValue)minimumPrice
{
  return self->_minimumPrice;
}

- (_INPBDecimalNumberValue)maximumPrice
{
  return self->_maximumPrice;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_currencyCode)
  {
    v4 = [(_INPBPriceRangeValue *)self currencyCode];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"currencyCode"];
  }
  v6 = [(_INPBPriceRangeValue *)self maximumPrice];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"maximumPrice"];

  v8 = [(_INPBPriceRangeValue *)self minimumPrice];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"minimumPrice"];

  v10 = [(_INPBPriceRangeValue *)self valueMetadata];
  v11 = [v10 dictionaryRepresentation];
  [v3 setObject:v11 forKeyedSubscript:@"valueMetadata"];

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_currencyCode hash];
  unint64_t v4 = [(_INPBDecimalNumberValue *)self->_maximumPrice hash] ^ v3;
  unint64_t v5 = [(_INPBDecimalNumberValue *)self->_minimumPrice hash];
  return v4 ^ v5 ^ [(_INPBValueMetadata *)self->_valueMetadata hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  unint64_t v5 = [(_INPBPriceRangeValue *)self currencyCode];
  v6 = [v4 currencyCode];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(_INPBPriceRangeValue *)self currencyCode];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBPriceRangeValue *)self currencyCode];
    v10 = [v4 currencyCode];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBPriceRangeValue *)self maximumPrice];
  v6 = [v4 maximumPrice];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(_INPBPriceRangeValue *)self maximumPrice];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBPriceRangeValue *)self maximumPrice];
    v15 = [v4 maximumPrice];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBPriceRangeValue *)self minimumPrice];
  v6 = [v4 minimumPrice];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v17 = [(_INPBPriceRangeValue *)self minimumPrice];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_INPBPriceRangeValue *)self minimumPrice];
    v20 = [v4 minimumPrice];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBPriceRangeValue *)self valueMetadata];
  v6 = [v4 valueMetadata];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v22 = [(_INPBPriceRangeValue *)self valueMetadata];
    if (!v22)
    {

LABEL_25:
      BOOL v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    v24 = [(_INPBPriceRangeValue *)self valueMetadata];
    v25 = [v4 valueMetadata];
    char v26 = [v24 isEqual:v25];

    if (v26) {
      goto LABEL_25;
    }
  }
  else
  {
LABEL_21:
  }
LABEL_22:
  BOOL v27 = 0;
LABEL_23:

  return v27;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[_INPBPriceRangeValue allocWithZone:](_INPBPriceRangeValue, "allocWithZone:") init];
  v6 = (void *)[(NSString *)self->_currencyCode copyWithZone:a3];
  [(_INPBPriceRangeValue *)v5 setCurrencyCode:v6];

  id v7 = [(_INPBDecimalNumberValue *)self->_maximumPrice copyWithZone:a3];
  [(_INPBPriceRangeValue *)v5 setMaximumPrice:v7];

  id v8 = [(_INPBDecimalNumberValue *)self->_minimumPrice copyWithZone:a3];
  [(_INPBPriceRangeValue *)v5 setMinimumPrice:v8];

  id v9 = [(_INPBValueMetadata *)self->_valueMetadata copyWithZone:a3];
  [(_INPBPriceRangeValue *)v5 setValueMetadata:v9];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBPriceRangeValue *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBPriceRangeValue)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBPriceRangeValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBPriceRangeValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBPriceRangeValue *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v11 = a3;
  id v4 = [(_INPBPriceRangeValue *)self currencyCode];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  unint64_t v5 = [(_INPBPriceRangeValue *)self maximumPrice];

  if (v5)
  {
    id v6 = [(_INPBPriceRangeValue *)self maximumPrice];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(_INPBPriceRangeValue *)self minimumPrice];

  if (v7)
  {
    id v8 = [(_INPBPriceRangeValue *)self minimumPrice];
    PBDataWriterWriteSubmessage();
  }
  id v9 = [(_INPBPriceRangeValue *)self valueMetadata];

  if (v9)
  {
    v10 = [(_INPBPriceRangeValue *)self valueMetadata];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBPriceRangeValueReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasValueMetadata
{
  return self->_valueMetadata != 0;
}

- (void)setValueMetadata:(id)a3
{
}

- (BOOL)hasMinimumPrice
{
  return self->_minimumPrice != 0;
}

- (void)setMinimumPrice:(id)a3
{
}

- (BOOL)hasMaximumPrice
{
  return self->_maximumPrice != 0;
}

- (void)setMaximumPrice:(id)a3
{
}

- (BOOL)hasCurrencyCode
{
  return self->_currencyCode != 0;
}

- (void)setCurrencyCode:(id)a3
{
  self->_currencyCode = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end