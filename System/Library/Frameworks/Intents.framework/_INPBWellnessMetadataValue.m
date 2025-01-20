@interface _INPBWellnessMetadataValue
+ (BOOL)supportsSecureCoding;
- (BOOL)hasOrdinalValue;
- (BOOL)hasPbDoubleValue;
- (BOOL)hasPbStringValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBDouble)pbDoubleValue;
- (_INPBInteger)ordinalValue;
- (_INPBString)pbStringValue;
- (_INPBWellnessMetadataValue)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setOrdinalValue:(id)a3;
- (void)setPbDoubleValue:(id)a3;
- (void)setPbStringValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBWellnessMetadataValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pbStringValue, 0);
  objc_storeStrong((id *)&self->_ordinalValue, 0);

  objc_storeStrong((id *)&self->_pbDoubleValue, 0);
}

- (_INPBString)pbStringValue
{
  return self->_pbStringValue;
}

- (_INPBInteger)ordinalValue
{
  return self->_ordinalValue;
}

- (_INPBDouble)pbDoubleValue
{
  return self->_pbDoubleValue;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBWellnessMetadataValue *)self pbDoubleValue];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"doubleValue"];

  v6 = [(_INPBWellnessMetadataValue *)self ordinalValue];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"ordinalValue"];

  v8 = [(_INPBWellnessMetadataValue *)self pbStringValue];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"stringValue"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBDouble *)self->_pbDoubleValue hash];
  unint64_t v4 = [(_INPBInteger *)self->_ordinalValue hash] ^ v3;
  return v4 ^ [(_INPBString *)self->_pbStringValue hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(_INPBWellnessMetadataValue *)self pbDoubleValue];
  v6 = [v4 pbDoubleValue];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_INPBWellnessMetadataValue *)self pbDoubleValue];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBWellnessMetadataValue *)self pbDoubleValue];
    v10 = [v4 pbDoubleValue];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBWellnessMetadataValue *)self ordinalValue];
  v6 = [v4 ordinalValue];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_INPBWellnessMetadataValue *)self ordinalValue];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBWellnessMetadataValue *)self ordinalValue];
    v15 = [v4 ordinalValue];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBWellnessMetadataValue *)self pbStringValue];
  v6 = [v4 pbStringValue];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(_INPBWellnessMetadataValue *)self pbStringValue];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(_INPBWellnessMetadataValue *)self pbStringValue];
    v20 = [v4 pbStringValue];
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
  v5 = [+[_INPBWellnessMetadataValue allocWithZone:](_INPBWellnessMetadataValue, "allocWithZone:") init];
  id v6 = [(_INPBDouble *)self->_pbDoubleValue copyWithZone:a3];
  [(_INPBWellnessMetadataValue *)v5 setPbDoubleValue:v6];

  id v7 = [(_INPBInteger *)self->_ordinalValue copyWithZone:a3];
  [(_INPBWellnessMetadataValue *)v5 setOrdinalValue:v7];

  id v8 = [(_INPBString *)self->_pbStringValue copyWithZone:a3];
  [(_INPBWellnessMetadataValue *)v5 setPbStringValue:v8];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBWellnessMetadataValue *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBWellnessMetadataValue)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBWellnessMetadataValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBWellnessMetadataValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBWellnessMetadataValue *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  id v4 = [(_INPBWellnessMetadataValue *)self pbDoubleValue];

  if (v4)
  {
    v5 = [(_INPBWellnessMetadataValue *)self pbDoubleValue];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBWellnessMetadataValue *)self ordinalValue];

  if (v6)
  {
    uint64_t v7 = [(_INPBWellnessMetadataValue *)self ordinalValue];
    PBDataWriterWriteSubmessage();
  }
  id v8 = [(_INPBWellnessMetadataValue *)self pbStringValue];

  if (v8)
  {
    v9 = [(_INPBWellnessMetadataValue *)self pbStringValue];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBWellnessMetadataValueReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasPbStringValue
{
  return self->_pbStringValue != 0;
}

- (void)setPbStringValue:(id)a3
{
}

- (BOOL)hasOrdinalValue
{
  return self->_ordinalValue != 0;
}

- (void)setOrdinalValue:(id)a3
{
}

- (BOOL)hasPbDoubleValue
{
  return self->_pbDoubleValue != 0;
}

- (void)setPbDoubleValue:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end