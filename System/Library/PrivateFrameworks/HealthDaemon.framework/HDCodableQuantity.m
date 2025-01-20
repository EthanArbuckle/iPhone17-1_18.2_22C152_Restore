@interface HDCodableQuantity
- (BOOL)hasUnitString;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)unitString;
- (double)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasValue:(BOOL)a3;
- (void)setUnitString:(id)a3;
- (void)setValue:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableQuantity

- (void)setUnitString:(id)a3
{
}

- (void)setValue:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_value = a3;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_unitString)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void).cxx_destruct
{
}

- (void)setHasValue:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasValue
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasUnitString
{
  return self->_unitString != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableQuantity;
  id v4 = [(HDCodableQuantity *)&v8 description];
  id v5 = [(HDCodableQuantity *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithDouble:self->_value];
    [v3 setObject:v4 forKey:@"value"];
  }
  unitString = self->_unitString;
  if (unitString) {
    [v3 setObject:unitString forKey:@"unitString"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableQuantityReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = *(void *)&self->_value;
    *((unsigned char *)v4 + 24) |= 1u;
  }
  if (self->_unitString)
  {
    id v5 = v4;
    objc_msgSend(v4, "setUnitString:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_value;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_unitString copyWithZone:a3];
  objc_super v8 = (void *)v6[2];
  v6[2] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_value != *((double *)v4 + 1)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  unitString = self->_unitString;
  if ((unint64_t)unitString | *((void *)v4 + 2)) {
    char v6 = -[NSString isEqual:](unitString, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    double value = self->_value;
    double v5 = -value;
    if (value >= 0.0) {
      double v5 = self->_value;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    unint64_t v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v3 += (unint64_t)v7;
      }
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  return [(NSString *)self->_unitString hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = (double *)a3;
  if ((_BYTE)v4[3])
  {
    self->_double value = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2))
  {
    double v5 = v4;
    -[HDCodableQuantity setUnitString:](self, "setUnitString:");
    id v4 = v5;
  }
}

- (double)value
{
  return self->_value;
}

- (NSString)unitString
{
  return self->_unitString;
}

@end