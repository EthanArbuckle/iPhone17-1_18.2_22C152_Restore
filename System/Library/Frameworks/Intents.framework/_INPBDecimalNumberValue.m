@interface _INPBDecimalNumberValue
+ (BOOL)supportsSecureCoding;
- (BOOL)hasExponent;
- (BOOL)hasIsNegative;
- (BOOL)hasMantissa;
- (BOOL)hasValueMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNegative;
- (BOOL)readFrom:(id)a3;
- (_INPBDecimalNumberValue)initWithCoder:(id)a3;
- (_INPBValueMetadata)valueMetadata;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int)exponent;
- (unint64_t)hash;
- (unint64_t)mantissa;
- (void)encodeWithCoder:(id)a3;
- (void)setExponent:(int)a3;
- (void)setHasExponent:(BOOL)a3;
- (void)setHasIsNegative:(BOOL)a3;
- (void)setHasMantissa:(BOOL)a3;
- (void)setIsNegative:(BOOL)a3;
- (void)setMantissa:(unint64_t)a3;
- (void)setValueMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBDecimalNumberValue

- (void).cxx_destruct
{
}

- (_INPBValueMetadata)valueMetadata
{
  return self->_valueMetadata;
}

- (unint64_t)mantissa
{
  return self->_mantissa;
}

- (BOOL)isNegative
{
  return self->_isNegative;
}

- (int)exponent
{
  return self->_exponent;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBDecimalNumberValue *)self hasExponent])
  {
    v4 = objc_msgSend(NSNumber, "numberWithInt:", -[_INPBDecimalNumberValue exponent](self, "exponent"));
    [v3 setObject:v4 forKeyedSubscript:@"exponent"];
  }
  if ([(_INPBDecimalNumberValue *)self hasIsNegative])
  {
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBDecimalNumberValue isNegative](self, "isNegative"));
    [v3 setObject:v5 forKeyedSubscript:@"is_negative"];
  }
  if ([(_INPBDecimalNumberValue *)self hasMantissa])
  {
    v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[_INPBDecimalNumberValue mantissa](self, "mantissa"));
    [v3 setObject:v6 forKeyedSubscript:@"mantissa"];
  }
  v7 = [(_INPBDecimalNumberValue *)self valueMetadata];
  v8 = [v7 dictionaryRepresentation];
  [v3 setObject:v8 forKeyedSubscript:@"valueMetadata"];

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBDecimalNumberValue *)self hasExponent]) {
    uint64_t v3 = 2654435761 * self->_exponent;
  }
  else {
    uint64_t v3 = 0;
  }
  if ([(_INPBDecimalNumberValue *)self hasIsNegative]) {
    uint64_t v4 = 2654435761 * self->_isNegative;
  }
  else {
    uint64_t v4 = 0;
  }
  if ([(_INPBDecimalNumberValue *)self hasMantissa]) {
    unint64_t v5 = 2654435761u * self->_mantissa;
  }
  else {
    unint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ [(_INPBValueMetadata *)self->_valueMetadata hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    int v5 = [(_INPBDecimalNumberValue *)self hasExponent];
    if (v5 == [v4 hasExponent])
    {
      if (![(_INPBDecimalNumberValue *)self hasExponent]
        || ![v4 hasExponent]
        || (int exponent = self->_exponent, exponent == [v4 exponent]))
      {
        int v7 = [(_INPBDecimalNumberValue *)self hasIsNegative];
        if (v7 == [v4 hasIsNegative])
        {
          if (![(_INPBDecimalNumberValue *)self hasIsNegative]
            || ![v4 hasIsNegative]
            || (int isNegative = self->_isNegative, isNegative == [v4 isNegative]))
          {
            int v9 = [(_INPBDecimalNumberValue *)self hasMantissa];
            if (v9 == [v4 hasMantissa])
            {
              if (![(_INPBDecimalNumberValue *)self hasMantissa]
                || ![v4 hasMantissa]
                || (unint64_t mantissa = self->_mantissa, mantissa == [v4 mantissa]))
              {
                v11 = [(_INPBDecimalNumberValue *)self valueMetadata];
                v12 = [v4 valueMetadata];
                v13 = v12;
                if ((v11 == 0) != (v12 != 0))
                {
                  uint64_t v14 = [(_INPBDecimalNumberValue *)self valueMetadata];
                  if (!v14)
                  {

LABEL_22:
                    BOOL v19 = 1;
                    goto LABEL_20;
                  }
                  v15 = (void *)v14;
                  v16 = [(_INPBDecimalNumberValue *)self valueMetadata];
                  v17 = [v4 valueMetadata];
                  char v18 = [v16 isEqual:v17];

                  if (v18) {
                    goto LABEL_22;
                  }
                }
                else
                {
                }
              }
            }
          }
        }
      }
    }
  }
  BOOL v19 = 0;
LABEL_20:

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBDecimalNumberValue allocWithZone:](_INPBDecimalNumberValue, "allocWithZone:") init];
  if ([(_INPBDecimalNumberValue *)self hasExponent]) {
    [(_INPBDecimalNumberValue *)v5 setExponent:[(_INPBDecimalNumberValue *)self exponent]];
  }
  if ([(_INPBDecimalNumberValue *)self hasIsNegative]) {
    [(_INPBDecimalNumberValue *)v5 setIsNegative:[(_INPBDecimalNumberValue *)self isNegative]];
  }
  if ([(_INPBDecimalNumberValue *)self hasMantissa]) {
    [(_INPBDecimalNumberValue *)v5 setMantissa:[(_INPBDecimalNumberValue *)self mantissa]];
  }
  id v6 = [(_INPBValueMetadata *)self->_valueMetadata copyWithZone:a3];
  [(_INPBDecimalNumberValue *)v5 setValueMetadata:v6];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBDecimalNumberValue *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBDecimalNumberValue)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBDecimalNumberValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBDecimalNumberValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBDecimalNumberValue *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  if ([(_INPBDecimalNumberValue *)self hasExponent]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBDecimalNumberValue *)self hasIsNegative]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_INPBDecimalNumberValue *)self hasMantissa]) {
    PBDataWriterWriteUint64Field();
  }
  id v4 = [(_INPBDecimalNumberValue *)self valueMetadata];

  int v5 = v7;
  if (v4)
  {
    id v6 = [(_INPBDecimalNumberValue *)self valueMetadata];
    PBDataWriterWriteSubmessage();

    int v5 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBDecimalNumberValueReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasValueMetadata
{
  return self->_valueMetadata != 0;
}

- (void)setValueMetadata:(id)a3
{
}

- (void)setHasMantissa:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMantissa
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setMantissa:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unint64_t mantissa = a3;
}

- (void)setHasIsNegative:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsNegative
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsNegative:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int isNegative = a3;
}

- (void)setHasExponent:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasExponent
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setExponent:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int exponent = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end