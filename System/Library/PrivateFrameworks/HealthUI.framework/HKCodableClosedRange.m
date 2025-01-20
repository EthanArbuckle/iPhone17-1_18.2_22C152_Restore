@interface HKCodableClosedRange
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)lowerBound;
- (double)upperBound;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setLowerBound:(double)a3;
- (void)setUpperBound:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableClosedRange

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableClosedRange;
  v4 = [(HKCodableClosedRange *)&v8 description];
  v5 = [(HKCodableClosedRange *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [NSNumber numberWithDouble:self->_lowerBound];
  [v3 setObject:v4 forKey:@"lowerBound"];

  v5 = [NSNumber numberWithDouble:self->_upperBound];
  [v3 setObject:v5 forKey:@"upperBound"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableClosedRangeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteDoubleField();
}

- (void)copyTo:(id)a3
{
  *((void *)a3 + 1) = *(void *)&self->_lowerBound;
  *((void *)a3 + 2) = *(void *)&self->_upperBound;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((void *)result + 1) = *(void *)&self->_lowerBound;
  *((void *)result + 2) = *(void *)&self->_upperBound;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (double *)a3;
  BOOL v5 = [v4 isMemberOfClass:objc_opt_class()]
    && self->_lowerBound == v4[1]
    && self->_upperBound == v4[2];

  return v5;
}

- (unint64_t)hash
{
  double lowerBound = self->_lowerBound;
  double v4 = -lowerBound;
  if (lowerBound >= 0.0) {
    double v4 = self->_lowerBound;
  }
  long double v5 = floor(v4 + 0.5);
  double v6 = (v4 - v5) * 1.84467441e19;
  double v7 = fmod(v5, 1.84467441e19);
  unint64_t v8 = 2654435761u * (unint64_t)v7;
  unint64_t v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0) {
    unint64_t v9 = 2654435761u * (unint64_t)v7;
  }
  unint64_t v10 = v8 - (unint64_t)fabs(v6);
  if (v6 < 0.0) {
    unint64_t v11 = v10;
  }
  else {
    unint64_t v11 = v9;
  }
  double upperBound = self->_upperBound;
  double v13 = -upperBound;
  if (upperBound >= 0.0) {
    double v13 = self->_upperBound;
  }
  long double v14 = floor(v13 + 0.5);
  double v15 = (v13 - v14) * 1.84467441e19;
  unint64_t v16 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
  unint64_t v17 = v16 + (unint64_t)v15;
  double v18 = fabs(v15);
  if (v15 <= 0.0) {
    unint64_t v17 = v16;
  }
  unint64_t v19 = v16 - (unint64_t)v18;
  if (v15 >= 0.0) {
    unint64_t v19 = v17;
  }
  return v19 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  self->_double lowerBound = *((double *)a3 + 1);
  self->_double upperBound = *((double *)a3 + 2);
}

- (double)lowerBound
{
  return self->_lowerBound;
}

- (void)setLowerBound:(double)a3
{
  self->_double lowerBound = a3;
}

- (double)upperBound
{
  return self->_upperBound;
}

- (void)setUpperBound:(double)a3
{
  self->_double upperBound = a3;
}

@end