@interface _INPBBalanceAmountValue
+ (BOOL)supportsSecureCoding;
- (BOOL)hasCurrencyAmount;
- (BOOL)hasCustomAmount;
- (BOOL)hasType;
- (BOOL)hasValueMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBBalanceAmountValue)initWithCoder:(id)a3;
- (_INPBCurrencyAmountValue)currencyAmount;
- (_INPBDecimalNumberValue)customAmount;
- (_INPBValueMetadata)valueMetadata;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCurrencyAmount:(id)a3;
- (void)setCustomAmount:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setType:(int)a3;
- (void)setValueMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBBalanceAmountValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueMetadata, 0);
  objc_storeStrong((id *)&self->_customAmount, 0);

  objc_storeStrong((id *)&self->_currencyAmount, 0);
}

- (_INPBValueMetadata)valueMetadata
{
  return self->_valueMetadata;
}

- (int)type
{
  return self->_type;
}

- (_INPBDecimalNumberValue)customAmount
{
  return self->_customAmount;
}

- (_INPBCurrencyAmountValue)currencyAmount
{
  return self->_currencyAmount;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBBalanceAmountValue *)self currencyAmount];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"currencyAmount"];

  v6 = [(_INPBBalanceAmountValue *)self customAmount];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"customAmount"];

  if ([(_INPBBalanceAmountValue *)self hasType])
  {
    uint64_t v8 = [(_INPBBalanceAmountValue *)self type];
    if ((v8 - 1) >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E5519730[(v8 - 1)];
    }
    [v3 setObject:v9 forKeyedSubscript:@"type"];
  }
  v10 = [(_INPBBalanceAmountValue *)self valueMetadata];
  v11 = [v10 dictionaryRepresentation];
  [v3 setObject:v11 forKeyedSubscript:@"valueMetadata"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBCurrencyAmountValue *)self->_currencyAmount hash];
  unint64_t v4 = [(_INPBDecimalNumberValue *)self->_customAmount hash];
  if ([(_INPBBalanceAmountValue *)self hasType]) {
    uint64_t v5 = 2654435761 * self->_type;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ [(_INPBValueMetadata *)self->_valueMetadata hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  uint64_t v5 = [(_INPBBalanceAmountValue *)self currencyAmount];
  v6 = [v4 currencyAmount];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_20;
  }
  uint64_t v7 = [(_INPBBalanceAmountValue *)self currencyAmount];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v9 = [(_INPBBalanceAmountValue *)self currencyAmount];
    v10 = [v4 currencyAmount];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_21;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBBalanceAmountValue *)self customAmount];
  v6 = [v4 customAmount];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_20;
  }
  uint64_t v12 = [(_INPBBalanceAmountValue *)self customAmount];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBBalanceAmountValue *)self customAmount];
    v15 = [v4 customAmount];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_21;
    }
  }
  else
  {
  }
  int v17 = [(_INPBBalanceAmountValue *)self hasType];
  if (v17 != [v4 hasType]) {
    goto LABEL_21;
  }
  if ([(_INPBBalanceAmountValue *)self hasType])
  {
    if ([v4 hasType])
    {
      int type = self->_type;
      if (type != [v4 type]) {
        goto LABEL_21;
      }
    }
  }
  uint64_t v5 = [(_INPBBalanceAmountValue *)self valueMetadata];
  v6 = [v4 valueMetadata];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v19 = [(_INPBBalanceAmountValue *)self valueMetadata];
    if (!v19)
    {

LABEL_24:
      BOOL v24 = 1;
      goto LABEL_22;
    }
    v20 = (void *)v19;
    v21 = [(_INPBBalanceAmountValue *)self valueMetadata];
    v22 = [v4 valueMetadata];
    char v23 = [v21 isEqual:v22];

    if (v23) {
      goto LABEL_24;
    }
  }
  else
  {
LABEL_20:
  }
LABEL_21:
  BOOL v24 = 0;
LABEL_22:

  return v24;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[_INPBBalanceAmountValue allocWithZone:](_INPBBalanceAmountValue, "allocWithZone:") init];
  id v6 = [(_INPBCurrencyAmountValue *)self->_currencyAmount copyWithZone:a3];
  [(_INPBBalanceAmountValue *)v5 setCurrencyAmount:v6];

  id v7 = [(_INPBDecimalNumberValue *)self->_customAmount copyWithZone:a3];
  [(_INPBBalanceAmountValue *)v5 setCustomAmount:v7];

  if ([(_INPBBalanceAmountValue *)self hasType]) {
    [(_INPBBalanceAmountValue *)v5 setType:[(_INPBBalanceAmountValue *)self type]];
  }
  id v8 = [(_INPBValueMetadata *)self->_valueMetadata copyWithZone:a3];
  [(_INPBBalanceAmountValue *)v5 setValueMetadata:v8];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBBalanceAmountValue *)self data];
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBBalanceAmountValue)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBBalanceAmountValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBBalanceAmountValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBBalanceAmountValue *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v11 = a3;
  id v4 = [(_INPBBalanceAmountValue *)self currencyAmount];

  if (v4)
  {
    uint64_t v5 = [(_INPBBalanceAmountValue *)self currencyAmount];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBBalanceAmountValue *)self customAmount];

  if (v6)
  {
    uint64_t v7 = [(_INPBBalanceAmountValue *)self customAmount];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBBalanceAmountValue *)self hasType]) {
    PBDataWriterWriteInt32Field();
  }
  id v8 = [(_INPBBalanceAmountValue *)self valueMetadata];

  v9 = v11;
  if (v8)
  {
    v10 = [(_INPBBalanceAmountValue *)self valueMetadata];
    PBDataWriterWriteSubmessage();

    v9 = v11;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBBalanceAmountValueReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasValueMetadata
{
  return self->_valueMetadata != 0;
}

- (void)setValueMetadata:(id)a3
{
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"MONEY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"POINTS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MILES"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)typeAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5519730[a3 - 1];
  }

  return v3;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int type = a3;
  }
}

- (BOOL)hasCustomAmount
{
  return self->_customAmount != 0;
}

- (void)setCustomAmount:(id)a3
{
}

- (BOOL)hasCurrencyAmount
{
  return self->_currencyAmount != 0;
}

- (void)setCurrencyAmount:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end