@interface _INPBColor
+ (BOOL)supportsSecureCoding;
- (BOOL)hasBlue;
- (BOOL)hasGreen;
- (BOOL)hasRed;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBColor)initWithCoder:(id)a3;
- (double)blue;
- (double)green;
- (double)red;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBlue:(double)a3;
- (void)setGreen:(double)a3;
- (void)setHasBlue:(BOOL)a3;
- (void)setHasGreen:(BOOL)a3;
- (void)setHasRed:(BOOL)a3;
- (void)setRed:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBColor

- (double)red
{
  return self->_red;
}

- (double)green
{
  return self->_green;
}

- (double)blue
{
  return self->_blue;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBColor *)self hasBlue])
  {
    v4 = NSNumber;
    [(_INPBColor *)self blue];
    v5 = objc_msgSend(v4, "numberWithDouble:");
    [v3 setObject:v5 forKeyedSubscript:@"blue"];
  }
  if ([(_INPBColor *)self hasGreen])
  {
    v6 = NSNumber;
    [(_INPBColor *)self green];
    v7 = objc_msgSend(v6, "numberWithDouble:");
    [v3 setObject:v7 forKeyedSubscript:@"green"];
  }
  if ([(_INPBColor *)self hasRed])
  {
    v8 = NSNumber;
    [(_INPBColor *)self red];
    v9 = objc_msgSend(v8, "numberWithDouble:");
    [v3 setObject:v9 forKeyedSubscript:@"red"];
  }

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBColor *)self hasBlue])
  {
    double blue = self->_blue;
    double v4 = -blue;
    if (blue >= 0.0) {
      double v4 = self->_blue;
    }
    long double v5 = floor(v4 + 0.5);
    double v6 = (v4 - v5) * 1.84467441e19;
    unint64_t v7 = 2654435761u * (unint64_t)fmod(v5, 1.84467441e19);
    if (v6 >= 0.0)
    {
      if (v6 > 0.0) {
        v7 += (unint64_t)v6;
      }
    }
    else
    {
      v7 -= (unint64_t)fabs(v6);
    }
  }
  else
  {
    unint64_t v7 = 0;
  }
  if ([(_INPBColor *)self hasGreen])
  {
    double green = self->_green;
    double v9 = -green;
    if (green >= 0.0) {
      double v9 = self->_green;
    }
    long double v10 = floor(v9 + 0.5);
    double v11 = (v9 - v10) * 1.84467441e19;
    unint64_t v12 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0) {
        v12 += (unint64_t)v11;
      }
    }
    else
    {
      v12 -= (unint64_t)fabs(v11);
    }
  }
  else
  {
    unint64_t v12 = 0;
  }
  if ([(_INPBColor *)self hasRed])
  {
    double red = self->_red;
    double v14 = -red;
    if (red >= 0.0) {
      double v14 = self->_red;
    }
    long double v15 = floor(v14 + 0.5);
    double v16 = (v14 - v15) * 1.84467441e19;
    unint64_t v17 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0) {
        v17 += (unint64_t)v16;
      }
    }
    else
    {
      v17 -= (unint64_t)fabs(v16);
    }
  }
  else
  {
    unint64_t v17 = 0;
  }
  return v12 ^ v7 ^ v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  int v5 = [(_INPBColor *)self hasBlue];
  if (v5 != [v4 hasBlue]) {
    goto LABEL_11;
  }
  if ([(_INPBColor *)self hasBlue])
  {
    if ([v4 hasBlue])
    {
      double blue = self->_blue;
      [v4 blue];
      if (blue != v7) {
        goto LABEL_11;
      }
    }
  }
  if ((int v8 = -[_INPBColor hasGreen](self, "hasGreen"), v8 == [v4 hasGreen])
    && (![(_INPBColor *)self hasGreen]
     || ![v4 hasGreen]
     || (double green = self->_green, [v4 green], green == v10))
    && (int v11 = -[_INPBColor hasRed](self, "hasRed"), v11 == [v4 hasRed])
    && (![(_INPBColor *)self hasRed]
     || ![v4 hasRed]
     || (double red = self->_red, [v4 red], red == v15)))
  {
    BOOL v12 = 1;
  }
  else
  {
LABEL_11:
    BOOL v12 = 0;
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[_INPBColor allocWithZone:a3] init];
  if ([(_INPBColor *)self hasBlue])
  {
    [(_INPBColor *)self blue];
    -[_INPBColor setBlue:](v4, "setBlue:");
  }
  if ([(_INPBColor *)self hasGreen])
  {
    [(_INPBColor *)self green];
    -[_INPBColor setGreen:](v4, "setGreen:");
  }
  if ([(_INPBColor *)self hasRed])
  {
    [(_INPBColor *)self red];
    -[_INPBColor setRed:](v4, "setRed:");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBColor *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBColor)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBColor *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        int v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBColor *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBColor *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ([(_INPBColor *)self hasBlue]) {
    PBDataWriterWriteDoubleField();
  }
  if ([(_INPBColor *)self hasGreen]) {
    PBDataWriterWriteDoubleField();
  }
  if ([(_INPBColor *)self hasRed]) {
    PBDataWriterWriteDoubleField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBColorReadFrom(self, (uint64_t)a3);
}

- (void)setHasRed:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRed
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setRed:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_double red = a3;
}

- (void)setHasGreen:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasGreen
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setGreen:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_double green = a3;
}

- (void)setHasBlue:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBlue
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setBlue:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double blue = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end