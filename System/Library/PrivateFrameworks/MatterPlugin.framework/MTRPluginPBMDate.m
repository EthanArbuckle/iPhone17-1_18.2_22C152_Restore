@interface MTRPluginPBMDate
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MTRPluginPBMDate)initWithDate:(id)a3;
- (NSDate)date;
- (double)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDate:(id)a3;
- (void)setHasValue:(BOOL)a3;
- (void)setValue:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation MTRPluginPBMDate

- (void)setValue:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_value = a3;
}

- (void)setHasValue:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasValue
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MTRPluginPBMDate;
  v4 = [(MTRPluginPBMDate *)&v8 description];
  v5 = [(MTRPluginPBMDate *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithDouble:self->_value];
    [v3 setObject:v4 forKey:@"value"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MTRPluginPBMDateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = *(void *)&self->_value;
    *((unsigned char *)a3 + 16) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (*(unsigned char *)&self->_has)
  {
    *((void *)result + 1) = *(void *)&self->_value;
    *((unsigned char *)result + 16) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  BOOL v5 = (*((unsigned char *)v4 + 16) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 16) & 1) != 0 && self->_value == *((double *)v4 + 1))
    {
      BOOL v5 = 1;
      goto LABEL_7;
    }
LABEL_6:
    BOOL v5 = 0;
  }
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    return 0;
  }
  double value = self->_value;
  double v4 = -value;
  if (value >= 0.0) {
    double v4 = self->_value;
  }
  long double v5 = floor(v4 + 0.5);
  double v6 = (v4 - v5) * 1.84467441e19;
  unint64_t result = 2654435761u * (unint64_t)fmod(v5, 1.84467441e19);
  if (v6 >= 0.0)
  {
    if (v6 > 0.0) {
      result += (unint64_t)v6;
    }
  }
  else
  {
    result -= (unint64_t)fabs(v6);
  }
  return result;
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 16))
  {
    self->_double value = *((double *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (double)value
{
  return self->_value;
}

- (MTRPluginPBMDate)initWithDate:(id)a3
{
  id v4 = a3;
  if (v4 && (self = [(MTRPluginPBMDate *)self init]) != 0)
  {
    [v4 timeIntervalSinceReferenceDate];
    -[MTRPluginPBMDate setValue:](self, "setValue:");
    self = self;
    long double v5 = self;
  }
  else
  {
    long double v5 = 0;
  }

  return v5;
}

- (void)setDate:(id)a3
{
  [a3 timeIntervalSinceReferenceDate];
  -[MTRPluginPBMDate setValue:](self, "setValue:");
}

- (NSDate)date
{
  id v3 = objc_alloc(MEMORY[0x263EFF910]);
  [(MTRPluginPBMDate *)self value];
  id v4 = objc_msgSend(v3, "initWithTimeIntervalSinceReferenceDate:");
  return (NSDate *)v4;
}

@end