@interface INRideFareLineItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (INRideFareLineItem)initWithCoder:(id)a3;
- (INRideFareLineItem)initWithTitle:(NSString *)title price:(NSDecimalNumber *)price currencyCode:(NSString *)currencyCode;
- (NSDecimalNumber)price;
- (NSString)currencyCode;
- (NSString)description;
- (NSString)title;
- (id)_dictionaryRepresentation;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INRideFareLineItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_price, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (NSDecimalNumber)price
{
  return self->_price;
}

- (NSString)title
{
  return self->_title;
}

- (id)_dictionaryRepresentation
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v11[0] = @"title";
  title = self->_title;
  v4 = title;
  if (!title)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[0] = v4;
  v11[1] = @"price";
  price = self->_price;
  v6 = price;
  if (!price)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v6;
  v11[2] = @"currencyCode";
  currencyCode = self->_currencyCode;
  v8 = currencyCode;
  if (!currencyCode)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  if (currencyCode)
  {
    if (price) {
      goto LABEL_9;
    }
LABEL_14:

    if (title) {
      goto LABEL_10;
    }
    goto LABEL_15;
  }

  if (!price) {
    goto LABEL_14;
  }
LABEL_9:
  if (title) {
    goto LABEL_10;
  }
LABEL_15:

LABEL_10:

  return v9;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INRideFareLineItem;
  v6 = [(INRideFareLineItem *)&v11 description];
  v7 = [(INRideFareLineItem *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INRideFareLineItem *)self descriptionAtIndent:0];
}

- (void)encodeWithCoder:(id)a3
{
  title = self->_title;
  id v5 = a3;
  [v5 encodeObject:title forKey:@"title"];
  [v5 encodeObject:self->_price forKey:@"price"];
  [v5 encodeObject:self->_currencyCode forKey:@"currencyCode"];
}

- (INRideFareLineItem)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"price"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currencyCode"];

  v8 = [(INRideFareLineItem *)self initWithTitle:v5 price:v6 currencyCode:v7];
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    title = self->_title;
    BOOL v9 = 0;
    if (title == (NSString *)v5[1] || -[NSString isEqual:](title, "isEqual:"))
    {
      price = self->_price;
      if (price == (NSDecimalNumber *)v5[2] || -[NSDecimalNumber isEqual:](price, "isEqual:"))
      {
        currencyCode = self->_currencyCode;
        if (currencyCode == (NSString *)v5[3] || -[NSString isEqual:](currencyCode, "isEqual:")) {
          BOOL v9 = 1;
        }
      }
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_title hash];
  uint64_t v4 = [(NSDecimalNumber *)self->_price hash] ^ v3;
  return v4 ^ [(NSString *)self->_currencyCode hash];
}

- (INRideFareLineItem)initWithTitle:(NSString *)title price:(NSDecimalNumber *)price currencyCode:(NSString *)currencyCode
{
  v8 = title;
  BOOL v9 = price;
  v10 = currencyCode;
  v19.receiver = self;
  v19.super_class = (Class)INRideFareLineItem;
  objc_super v11 = [(INRideFareLineItem *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [(NSString *)v8 copy];
    v13 = v11->_title;
    v11->_title = (NSString *)v12;

    uint64_t v14 = [(NSDecimalNumber *)v9 copy];
    v15 = v11->_price;
    v11->_price = (NSDecimalNumber *)v14;

    uint64_t v16 = [(NSString *)v10 copy];
    v17 = v11->_currencyCode;
    v11->_currencyCode = (NSString *)v16;
  }
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end