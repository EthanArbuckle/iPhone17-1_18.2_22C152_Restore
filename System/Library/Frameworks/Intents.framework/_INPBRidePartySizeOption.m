@interface _INPBRidePartySizeOption
+ (BOOL)supportsSecureCoding;
- (BOOL)hasPartySizeRange;
- (BOOL)hasPriceRange;
- (BOOL)hasSizeDescription;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)sizeDescription;
- (_INPBPriceRangeValue)priceRange;
- (_INPBRangeValue)partySizeRange;
- (_INPBRidePartySizeOption)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setPartySizeRange:(id)a3;
- (void)setPriceRange:(id)a3;
- (void)setSizeDescription:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBRidePartySizeOption

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeDescription, 0);
  objc_storeStrong((id *)&self->_priceRange, 0);

  objc_storeStrong((id *)&self->_partySizeRange, 0);
}

- (NSString)sizeDescription
{
  return self->_sizeDescription;
}

- (_INPBPriceRangeValue)priceRange
{
  return self->_priceRange;
}

- (_INPBRangeValue)partySizeRange
{
  return self->_partySizeRange;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBRidePartySizeOption *)self partySizeRange];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"partySizeRange"];

  v6 = [(_INPBRidePartySizeOption *)self priceRange];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"priceRange"];

  if (self->_sizeDescription)
  {
    v8 = [(_INPBRidePartySizeOption *)self sizeDescription];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"sizeDescription"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBRangeValue *)self->_partySizeRange hash];
  unint64_t v4 = [(_INPBPriceRangeValue *)self->_priceRange hash] ^ v3;
  return v4 ^ [(NSString *)self->_sizeDescription hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(_INPBRidePartySizeOption *)self partySizeRange];
  v6 = [v4 partySizeRange];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_INPBRidePartySizeOption *)self partySizeRange];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBRidePartySizeOption *)self partySizeRange];
    v10 = [v4 partySizeRange];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBRidePartySizeOption *)self priceRange];
  v6 = [v4 priceRange];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_INPBRidePartySizeOption *)self priceRange];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBRidePartySizeOption *)self priceRange];
    v15 = [v4 priceRange];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBRidePartySizeOption *)self sizeDescription];
  v6 = [v4 sizeDescription];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(_INPBRidePartySizeOption *)self sizeDescription];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(_INPBRidePartySizeOption *)self sizeDescription];
    v20 = [v4 sizeDescription];
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
  v5 = [+[_INPBRidePartySizeOption allocWithZone:](_INPBRidePartySizeOption, "allocWithZone:") init];
  id v6 = [(_INPBRangeValue *)self->_partySizeRange copyWithZone:a3];
  [(_INPBRidePartySizeOption *)v5 setPartySizeRange:v6];

  id v7 = [(_INPBPriceRangeValue *)self->_priceRange copyWithZone:a3];
  [(_INPBRidePartySizeOption *)v5 setPriceRange:v7];

  v8 = (void *)[(NSString *)self->_sizeDescription copyWithZone:a3];
  [(_INPBRidePartySizeOption *)v5 setSizeDescription:v8];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBRidePartySizeOption *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBRidePartySizeOption)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBRidePartySizeOption *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBRidePartySizeOption *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBRidePartySizeOption *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  id v4 = [(_INPBRidePartySizeOption *)self partySizeRange];

  if (v4)
  {
    v5 = [(_INPBRidePartySizeOption *)self partySizeRange];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBRidePartySizeOption *)self priceRange];

  if (v6)
  {
    uint64_t v7 = [(_INPBRidePartySizeOption *)self priceRange];
    PBDataWriterWriteSubmessage();
  }
  v8 = [(_INPBRidePartySizeOption *)self sizeDescription];

  v9 = v10;
  if (v8)
  {
    PBDataWriterWriteStringField();
    v9 = v10;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBRidePartySizeOptionReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasSizeDescription
{
  return self->_sizeDescription != 0;
}

- (void)setSizeDescription:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  sizeDescription = self->_sizeDescription;
  self->_sizeDescription = v4;

  MEMORY[0x1F41817F8](v4, sizeDescription);
}

- (BOOL)hasPriceRange
{
  return self->_priceRange != 0;
}

- (void)setPriceRange:(id)a3
{
}

- (BOOL)hasPartySizeRange
{
  return self->_partySizeRange != 0;
}

- (void)setPartySizeRange:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end