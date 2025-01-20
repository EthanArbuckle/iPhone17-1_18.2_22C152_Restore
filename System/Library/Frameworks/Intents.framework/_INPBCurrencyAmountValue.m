@interface _INPBCurrencyAmountValue
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAmount;
- (BOOL)hasCurrencyCode;
- (BOOL)hasValueMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)currencyCode;
- (_INPBCurrencyAmountValue)initWithCoder:(id)a3;
- (_INPBDecimalNumberValue)amount;
- (_INPBValueMetadata)valueMetadata;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAmount:(id)a3;
- (void)setCurrencyCode:(id)a3;
- (void)setValueMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBCurrencyAmountValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueMetadata, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);

  objc_storeStrong((id *)&self->_amount, 0);
}

- (_INPBValueMetadata)valueMetadata
{
  return self->_valueMetadata;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (_INPBDecimalNumberValue)amount
{
  return self->_amount;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBCurrencyAmountValue *)self amount];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"amount"];

  if (self->_currencyCode)
  {
    v6 = [(_INPBCurrencyAmountValue *)self currencyCode];
    v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"currencyCode"];
  }
  v8 = [(_INPBCurrencyAmountValue *)self valueMetadata];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"valueMetadata"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBDecimalNumberValue *)self->_amount hash];
  NSUInteger v4 = [(NSString *)self->_currencyCode hash] ^ v3;
  return v4 ^ [(_INPBValueMetadata *)self->_valueMetadata hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(_INPBCurrencyAmountValue *)self amount];
  v6 = [v4 amount];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_INPBCurrencyAmountValue *)self amount];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBCurrencyAmountValue *)self amount];
    v10 = [v4 amount];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBCurrencyAmountValue *)self currencyCode];
  v6 = [v4 currencyCode];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_INPBCurrencyAmountValue *)self currencyCode];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBCurrencyAmountValue *)self currencyCode];
    v15 = [v4 currencyCode];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBCurrencyAmountValue *)self valueMetadata];
  v6 = [v4 valueMetadata];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(_INPBCurrencyAmountValue *)self valueMetadata];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(_INPBCurrencyAmountValue *)self valueMetadata];
    v20 = [v4 valueMetadata];
    char v21 = [v19 isEqual:v20];

    if (v21) {
      goto LABEL_20;
    }
  }
  else
  {
LABEL_16:
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBCurrencyAmountValue allocWithZone:](_INPBCurrencyAmountValue, "allocWithZone:") init];
  id v6 = [(_INPBDecimalNumberValue *)self->_amount copyWithZone:a3];
  [(_INPBCurrencyAmountValue *)v5 setAmount:v6];

  uint64_t v7 = (void *)[(NSString *)self->_currencyCode copyWithZone:a3];
  [(_INPBCurrencyAmountValue *)v5 setCurrencyCode:v7];

  id v8 = [(_INPBValueMetadata *)self->_valueMetadata copyWithZone:a3];
  [(_INPBCurrencyAmountValue *)v5 setValueMetadata:v8];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBCurrencyAmountValue *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBCurrencyAmountValue)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBCurrencyAmountValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBCurrencyAmountValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBCurrencyAmountValue *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  id v4 = [(_INPBCurrencyAmountValue *)self amount];

  if (v4)
  {
    v5 = [(_INPBCurrencyAmountValue *)self amount];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBCurrencyAmountValue *)self currencyCode];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = [(_INPBCurrencyAmountValue *)self valueMetadata];

  if (v7)
  {
    id v8 = [(_INPBCurrencyAmountValue *)self valueMetadata];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBCurrencyAmountValueReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasValueMetadata
{
  return self->_valueMetadata != 0;
}

- (void)setValueMetadata:(id)a3
{
}

- (BOOL)hasCurrencyCode
{
  return self->_currencyCode != 0;
}

- (void)setCurrencyCode:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  currencyCode = self->_currencyCode;
  self->_currencyCode = v4;

  MEMORY[0x1F41817F8](v4, currencyCode);
}

- (BOOL)hasAmount
{
  return self->_amount != 0;
}

- (void)setAmount:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end