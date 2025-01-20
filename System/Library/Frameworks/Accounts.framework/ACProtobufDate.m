@interface ACProtobufDate
- (ACProtobufDate)initWithDate:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSDate)date;
- (double)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDate:(id)a3;
- (void)setValue:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation ACProtobufDate

- (ACProtobufDate)initWithDate:(id)a3
{
  id v4 = a3;
  if (v4 && (self = [(ACProtobufDate *)self init]) != 0)
  {
    [v4 timeIntervalSinceReferenceDate];
    -[ACProtobufDate setValue:](self, "setValue:");
    self = self;
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setDate:(id)a3
{
  [a3 timeIntervalSinceReferenceDate];

  -[ACProtobufDate setValue:](self, "setValue:");
}

- (NSDate)date
{
  id v3 = objc_alloc(MEMORY[0x1E4F1C9C8]);
  [(ACProtobufDate *)self value];
  id v4 = objc_msgSend(v3, "initWithTimeIntervalSinceReferenceDate:");

  return (NSDate *)v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ACProtobufDate;
  id v4 = [(ACProtobufDate *)&v8 description];
  v5 = [(ACProtobufDate *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [NSNumber numberWithDouble:self->_value];
  [v3 setObject:v4 forKey:@"value"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ACProtobufDateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
}

- (void)copyTo:(id)a3
{
  *((void *)a3 + 1) = *(void *)&self->_value;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((void *)result + 1) = *(void *)&self->_value;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (double *)a3;
  if ([v4 isMemberOfClass:objc_opt_class()]) {
    BOOL v5 = self->_value == v4[1];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  double value = self->_value;
  double v3 = -value;
  if (value >= 0.0) {
    double v3 = self->_value;
  }
  long double v4 = floor(v3 + 0.5);
  double v5 = (v3 - v4) * 1.84467441e19;
  double v6 = fmod(v4, 1.84467441e19);
  unint64_t v7 = 2654435761u * (unint64_t)v6;
  unint64_t v8 = v7 + (unint64_t)v5;
  if (v5 <= 0.0) {
    unint64_t v8 = 2654435761u * (unint64_t)v6;
  }
  unint64_t v9 = v7 - (unint64_t)fabs(v5);
  if (v5 < 0.0) {
    return v9;
  }
  else {
    return v8;
  }
}

- (void)mergeFrom:(id)a3
{
  self->_double value = *((double *)a3 + 1);
}

- (double)value
{
  return self->_value;
}

- (void)setValue:(double)a3
{
  self->_double value = a3;
}

@end