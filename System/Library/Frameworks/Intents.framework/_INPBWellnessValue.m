@interface _INPBWellnessValue
+ (BOOL)supportsSecureCoding;
- (BOOL)hasOrdinalValue;
- (BOOL)hasPbDoubleValue;
- (BOOL)hasValueMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBDouble)pbDoubleValue;
- (_INPBInteger)ordinalValue;
- (_INPBValueMetadata)valueMetadata;
- (_INPBWellnessValue)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setOrdinalValue:(id)a3;
- (void)setPbDoubleValue:(id)a3;
- (void)setValueMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBWellnessValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueMetadata, 0);
  objc_storeStrong((id *)&self->_ordinalValue, 0);

  objc_storeStrong((id *)&self->_pbDoubleValue, 0);
}

- (_INPBValueMetadata)valueMetadata
{
  return self->_valueMetadata;
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
  v4 = [(_INPBWellnessValue *)self pbDoubleValue];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"doubleValue"];

  v6 = [(_INPBWellnessValue *)self ordinalValue];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"ordinalValue"];

  v8 = [(_INPBWellnessValue *)self valueMetadata];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"valueMetadata"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBDouble *)self->_pbDoubleValue hash];
  unint64_t v4 = [(_INPBInteger *)self->_ordinalValue hash] ^ v3;
  return v4 ^ [(_INPBValueMetadata *)self->_valueMetadata hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(_INPBWellnessValue *)self pbDoubleValue];
  v6 = [v4 pbDoubleValue];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_INPBWellnessValue *)self pbDoubleValue];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBWellnessValue *)self pbDoubleValue];
    v10 = [v4 pbDoubleValue];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBWellnessValue *)self ordinalValue];
  v6 = [v4 ordinalValue];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_INPBWellnessValue *)self ordinalValue];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBWellnessValue *)self ordinalValue];
    v15 = [v4 ordinalValue];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBWellnessValue *)self valueMetadata];
  v6 = [v4 valueMetadata];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(_INPBWellnessValue *)self valueMetadata];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(_INPBWellnessValue *)self valueMetadata];
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
  v5 = [+[_INPBWellnessValue allocWithZone:](_INPBWellnessValue, "allocWithZone:") init];
  id v6 = [(_INPBDouble *)self->_pbDoubleValue copyWithZone:a3];
  [(_INPBWellnessValue *)v5 setPbDoubleValue:v6];

  id v7 = [(_INPBInteger *)self->_ordinalValue copyWithZone:a3];
  [(_INPBWellnessValue *)v5 setOrdinalValue:v7];

  id v8 = [(_INPBValueMetadata *)self->_valueMetadata copyWithZone:a3];
  [(_INPBWellnessValue *)v5 setValueMetadata:v8];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBWellnessValue *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBWellnessValue)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBWellnessValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBWellnessValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBWellnessValue *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  id v4 = [(_INPBWellnessValue *)self pbDoubleValue];

  if (v4)
  {
    v5 = [(_INPBWellnessValue *)self pbDoubleValue];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBWellnessValue *)self ordinalValue];

  if (v6)
  {
    uint64_t v7 = [(_INPBWellnessValue *)self ordinalValue];
    PBDataWriterWriteSubmessage();
  }
  id v8 = [(_INPBWellnessValue *)self valueMetadata];

  if (v8)
  {
    v9 = [(_INPBWellnessValue *)self valueMetadata];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBWellnessValueReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasValueMetadata
{
  return self->_valueMetadata != 0;
}

- (void)setValueMetadata:(id)a3
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