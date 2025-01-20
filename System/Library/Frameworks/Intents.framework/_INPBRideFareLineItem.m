@interface _INPBRideFareLineItem
+ (BOOL)supportsSecureCoding;
- (BOOL)hasCurrencyCode;
- (BOOL)hasPrice;
- (BOOL)hasTitle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)currencyCode;
- (NSString)title;
- (_INPBDecimalNumberValue)price;
- (_INPBRideFareLineItem)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCurrencyCode:(id)a3;
- (void)setPrice:(id)a3;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBRideFareLineItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_price, 0);

  objc_storeStrong((id *)&self->_currencyCode, 0);
}

- (NSString)title
{
  return self->_title;
}

- (_INPBDecimalNumberValue)price
{
  return self->_price;
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
    v4 = [(_INPBRideFareLineItem *)self currencyCode];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"currencyCode"];
  }
  v6 = [(_INPBRideFareLineItem *)self price];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"price"];

  if (self->_title)
  {
    v8 = [(_INPBRideFareLineItem *)self title];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"title"];
  }

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_currencyCode hash];
  unint64_t v4 = [(_INPBDecimalNumberValue *)self->_price hash] ^ v3;
  return v4 ^ [(NSString *)self->_title hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(_INPBRideFareLineItem *)self currencyCode];
  v6 = [v4 currencyCode];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_INPBRideFareLineItem *)self currencyCode];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBRideFareLineItem *)self currencyCode];
    v10 = [v4 currencyCode];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBRideFareLineItem *)self price];
  v6 = [v4 price];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_INPBRideFareLineItem *)self price];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBRideFareLineItem *)self price];
    v15 = [v4 price];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBRideFareLineItem *)self title];
  v6 = [v4 title];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(_INPBRideFareLineItem *)self title];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(_INPBRideFareLineItem *)self title];
    v20 = [v4 title];
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
  v5 = [+[_INPBRideFareLineItem allocWithZone:](_INPBRideFareLineItem, "allocWithZone:") init];
  v6 = (void *)[(NSString *)self->_currencyCode copyWithZone:a3];
  [(_INPBRideFareLineItem *)v5 setCurrencyCode:v6];

  id v7 = [(_INPBDecimalNumberValue *)self->_price copyWithZone:a3];
  [(_INPBRideFareLineItem *)v5 setPrice:v7];

  v8 = (void *)[(NSString *)self->_title copyWithZone:a3];
  [(_INPBRideFareLineItem *)v5 setTitle:v8];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBRideFareLineItem *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBRideFareLineItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBRideFareLineItem *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBRideFareLineItem *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBRideFareLineItem *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  id v4 = [(_INPBRideFareLineItem *)self currencyCode];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  v5 = [(_INPBRideFareLineItem *)self price];

  if (v5)
  {
    id v6 = [(_INPBRideFareLineItem *)self price];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(_INPBRideFareLineItem *)self title];

  v8 = v9;
  if (v7)
  {
    PBDataWriterWriteStringField();
    v8 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBRideFareLineItemReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (void)setTitle:(id)a3
{
  self->_title = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasPrice
{
  return self->_price != 0;
}

- (void)setPrice:(id)a3
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