@interface _INPBPaymentAmountValue
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAmountType;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBCurrencyAmountValue)value;
- (_INPBPaymentAmountValue)initWithCoder:(id)a3;
- (id)amountTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int)StringAsAmountType:(id)a3;
- (int)amountType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAmountType:(int)a3;
- (void)setHasAmountType:(BOOL)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBPaymentAmountValue

- (void).cxx_destruct
{
}

- (_INPBCurrencyAmountValue)value
{
  return self->_value;
}

- (int)amountType
{
  return self->_amountType;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBPaymentAmountValue *)self hasAmountType])
  {
    uint64_t v4 = [(_INPBPaymentAmountValue *)self amountType];
    if ((v4 - 1) >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E551A440[(v4 - 1)];
    }
    [v3 setObject:v5 forKeyedSubscript:@"amountType"];
  }
  v6 = [(_INPBPaymentAmountValue *)self value];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"value"];

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBPaymentAmountValue *)self hasAmountType]) {
    uint64_t v3 = 2654435761 * self->_amountType;
  }
  else {
    uint64_t v3 = 0;
  }
  return [(_INPBCurrencyAmountValue *)self->_value hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    int v5 = [(_INPBPaymentAmountValue *)self hasAmountType];
    if (v5 == [v4 hasAmountType])
    {
      if (![(_INPBPaymentAmountValue *)self hasAmountType]
        || ![v4 hasAmountType]
        || (int amountType = self->_amountType, amountType == [v4 amountType]))
      {
        v7 = [(_INPBPaymentAmountValue *)self value];
        v8 = [v4 value];
        v9 = v8;
        if ((v7 == 0) != (v8 != 0))
        {
          uint64_t v10 = [(_INPBPaymentAmountValue *)self value];
          if (!v10)
          {

LABEL_14:
            BOOL v15 = 1;
            goto LABEL_12;
          }
          v11 = (void *)v10;
          v12 = [(_INPBPaymentAmountValue *)self value];
          v13 = [v4 value];
          char v14 = [v12 isEqual:v13];

          if (v14) {
            goto LABEL_14;
          }
        }
        else
        {
        }
      }
    }
  }
  BOOL v15 = 0;
LABEL_12:

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBPaymentAmountValue allocWithZone:](_INPBPaymentAmountValue, "allocWithZone:") init];
  if ([(_INPBPaymentAmountValue *)self hasAmountType]) {
    [(_INPBPaymentAmountValue *)v5 setAmountType:[(_INPBPaymentAmountValue *)self amountType]];
  }
  id v6 = [(_INPBCurrencyAmountValue *)self->_value copyWithZone:a3];
  [(_INPBPaymentAmountValue *)v5 setValue:v6];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBPaymentAmountValue *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBPaymentAmountValue)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBPaymentAmountValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBPaymentAmountValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBPaymentAmountValue *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  if ([(_INPBPaymentAmountValue *)self hasAmountType]) {
    PBDataWriterWriteInt32Field();
  }
  id v4 = [(_INPBPaymentAmountValue *)self value];

  int v5 = v7;
  if (v4)
  {
    id v6 = [(_INPBPaymentAmountValue *)self value];
    PBDataWriterWriteSubmessage();

    int v5 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBPaymentAmountValueReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (void)setValue:(id)a3
{
}

- (int)StringAsAmountType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"MINIMUM_DUE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"AMOUNT_DUE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CURRENT_BALANCE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"MAXIMUM_TRANSFER_AMOUNT"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"MINIMUM_TRANSFER_AMOUNT"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"STATEMENT_BALANCE"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)amountTypeAsString:(int)a3
{
  if ((a3 - 1) >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E551A440[a3 - 1];
  }

  return v3;
}

- (void)setHasAmountType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAmountType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAmountType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int amountType = a3;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end