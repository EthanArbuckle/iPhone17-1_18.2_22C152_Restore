@interface CLPPressure
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)std;
- (double)timestamp;
- (double)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setStd:(double)a3;
- (void)setTimestamp:(double)a3;
- (void)setValue:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPPressure

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPPressure;
  v4 = [(CLPPressure *)&v8 description];
  v5 = [(CLPPressure *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [NSNumber numberWithDouble:self->_timestamp];
  [v3 setObject:v4 forKey:@"timestamp"];

  v5 = [NSNumber numberWithDouble:self->_value];
  [v3 setObject:v5 forKey:@"value"];

  v6 = [NSNumber numberWithDouble:self->_std];
  [v3 setObject:v6 forKey:@"std"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPPressureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteDoubleField();
}

- (void)copyTo:(id)a3
{
  *((void *)a3 + 2) = *(void *)&self->_timestamp;
  *((void *)a3 + 3) = *(void *)&self->_value;
  *((void *)a3 + 1) = *(void *)&self->_std;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((void *)result + 2) = *(void *)&self->_timestamp;
  *((void *)result + 3) = *(void *)&self->_value;
  *((void *)result + 1) = *(void *)&self->_std;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (double *)a3;
  BOOL v5 = [v4 isMemberOfClass:objc_opt_class()]
    && self->_timestamp == v4[2]
    && self->_value == v4[3]
    && self->_std == v4[1];

  return v5;
}

- (unint64_t)hash
{
  double timestamp = self->_timestamp;
  double v4 = -timestamp;
  if (timestamp >= 0.0) {
    double v4 = self->_timestamp;
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
  double value = self->_value;
  double v13 = -value;
  if (value >= 0.0) {
    double v13 = self->_value;
  }
  long double v14 = floor(v13 + 0.5);
  double v15 = (v13 - v14) * 1.84467441e19;
  double v16 = fmod(v14, 1.84467441e19);
  unint64_t v17 = 2654435761u * (unint64_t)v16;
  unint64_t v18 = v17 + (unint64_t)v15;
  if (v15 <= 0.0) {
    unint64_t v18 = 2654435761u * (unint64_t)v16;
  }
  unint64_t v19 = v17 - (unint64_t)fabs(v15);
  if (v15 < 0.0) {
    unint64_t v20 = v19;
  }
  else {
    unint64_t v20 = v18;
  }
  double std = self->_std;
  double v22 = -std;
  if (std >= 0.0) {
    double v22 = self->_std;
  }
  long double v23 = floor(v22 + 0.5);
  double v24 = (v22 - v23) * 1.84467441e19;
  double v25 = fmod(v23, 1.84467441e19);
  unint64_t v26 = 2654435761u * (unint64_t)v25;
  unint64_t v27 = v26 + (unint64_t)v24;
  if (v24 <= 0.0) {
    unint64_t v27 = 2654435761u * (unint64_t)v25;
  }
  unint64_t v28 = v26 - (unint64_t)fabs(v24);
  if (v24 >= 0.0) {
    unint64_t v28 = v27;
  }
  return v20 ^ v11 ^ v28;
}

- (void)mergeFrom:(id)a3
{
  self->_double timestamp = *((double *)a3 + 2);
  self->_double value = *((double *)a3 + 3);
  self->_double std = *((double *)a3 + 1);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_double timestamp = a3;
}

- (double)value
{
  return self->_value;
}

- (void)setValue:(double)a3
{
  self->_double value = a3;
}

- (double)std
{
  return self->_std;
}

- (void)setStd:(double)a3
{
  self->_double std = a3;
}

@end