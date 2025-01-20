@interface INRidePartySizeOption
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (INPriceRange)priceRange;
- (INRidePartySizeOption)initWithCoder:(id)a3;
- (INRidePartySizeOption)initWithPartySizeRange:(NSRange)partySizeRange sizeDescription:(NSString *)sizeDescription priceRange:(INPriceRange *)priceRange;
- (NSRange)partySizeRange;
- (NSString)description;
- (NSString)sizeDescription;
- (id)_dictionaryRepresentation;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INRidePartySizeOption

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_priceRange, 0);

  objc_storeStrong((id *)&self->_sizeDescription, 0);
}

- (INPriceRange)priceRange
{
  return self->_priceRange;
}

- (NSString)sizeDescription
{
  return self->_sizeDescription;
}

- (NSRange)partySizeRange
{
  NSUInteger length = self->_partySizeRange.length;
  NSUInteger location = self->_partySizeRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (id)_dictionaryRepresentation
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v11[0] = @"partySizeRange";
  v14.NSUInteger location = [(INRidePartySizeOption *)self partySizeRange];
  v3 = NSStringFromRange(v14);
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[0] = v4;
  v11[1] = @"sizeDescription";
  sizeDescription = self->_sizeDescription;
  v6 = sizeDescription;
  if (!sizeDescription)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v6;
  v11[2] = @"priceRange";
  priceRange = self->_priceRange;
  v8 = priceRange;
  if (!priceRange)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  if (priceRange)
  {
    if (sizeDescription) {
      goto LABEL_9;
    }
LABEL_14:

    if (v3) {
      goto LABEL_10;
    }
    goto LABEL_15;
  }

  if (!sizeDescription) {
    goto LABEL_14;
  }
LABEL_9:
  if (v3) {
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
  v11.super_class = (Class)INRidePartySizeOption;
  v6 = [(INRidePartySizeOption *)&v11 description];
  v7 = [(INRidePartySizeOption *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INRidePartySizeOption *)self descriptionAtIndent:0];
}

- (void)encodeWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F29238];
  id v5 = a3;
  uint64_t v6 = [(INRidePartySizeOption *)self partySizeRange];
  v8 = objc_msgSend(v4, "valueWithRange:", v6, v7);
  [v5 encodeObject:v8 forKey:@"partySizeRange"];

  v9 = [(INRidePartySizeOption *)self sizeDescription];
  [v5 encodeObject:v9 forKey:@"sizeDescription"];

  id v10 = [(INRidePartySizeOption *)self priceRange];
  [v5 encodeObject:v10 forKey:@"priceRange"];
}

- (INRidePartySizeOption)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"partySizeRange"];
  uint64_t v6 = [v5 rangeValue];
  uint64_t v8 = v7;

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sizeDescription"];
  id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"priceRange"];

  objc_super v11 = -[INRidePartySizeOption initWithPartySizeRange:sizeDescription:priceRange:](self, "initWithPartySizeRange:sizeDescription:priceRange:", v6, v8, v9, v10);
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = v5;
    BOOL v9 = 0;
    if (self->_partySizeRange.length == v5[4] && self->_partySizeRange.location == v5[3])
    {
      sizeDescription = self->_sizeDescription;
      if (sizeDescription == (NSString *)v6[1] || -[NSString isEqual:](sizeDescription, "isEqual:"))
      {
        priceRange = self->_priceRange;
        if (priceRange == (INPriceRange *)v6[2] || -[INPriceRange isEqual:](priceRange, "isEqual:")) {
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
  NSUInteger v3 = self->_partySizeRange.location ^ self->_partySizeRange.length;
  NSUInteger v4 = v3 ^ [(NSString *)self->_sizeDescription hash];
  return v4 ^ [(INPriceRange *)self->_priceRange hash];
}

- (INRidePartySizeOption)initWithPartySizeRange:(NSRange)partySizeRange sizeDescription:(NSString *)sizeDescription priceRange:(INPriceRange *)priceRange
{
  NSUInteger length = partySizeRange.length;
  NSUInteger location = partySizeRange.location;
  BOOL v9 = sizeDescription;
  id v10 = priceRange;
  v18.receiver = self;
  v18.super_class = (Class)INRidePartySizeOption;
  objc_super v11 = [(INRidePartySizeOption *)&v18 init];
  v12 = v11;
  if (v11)
  {
    v11->_partySizeRange.NSUInteger location = location;
    v11->_partySizeRange.NSUInteger length = length;
    uint64_t v13 = [(NSString *)v9 copy];
    NSRange v14 = v12->_sizeDescription;
    v12->_sizeDescription = (NSString *)v13;

    uint64_t v15 = [(INPriceRange *)v10 copy];
    v16 = v12->_priceRange;
    v12->_priceRange = (INPriceRange *)v15;
  }
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end