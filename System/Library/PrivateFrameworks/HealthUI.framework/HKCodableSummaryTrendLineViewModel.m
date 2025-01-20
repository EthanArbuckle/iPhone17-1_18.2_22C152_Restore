@interface HKCodableSummaryTrendLineViewModel
- (BOOL)hasAverage;
- (BOOL)hasDateInterval;
- (BOOL)hasLineLabel;
- (BOOL)hasXAxisLabel;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HKCodableDateInterval)dateInterval;
- (NSString)lineLabel;
- (NSString)xAxisLabel;
- (double)average;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAverage:(double)a3;
- (void)setDateInterval:(id)a3;
- (void)setHasAverage:(BOOL)a3;
- (void)setLineLabel:(id)a3;
- (void)setXAxisLabel:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableSummaryTrendLineViewModel

- (BOOL)hasDateInterval
{
  return self->_dateInterval != 0;
}

- (void)setAverage:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_average = a3;
}

- (void)setHasAverage:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAverage
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasXAxisLabel
{
  return self->_xAxisLabel != 0;
}

- (BOOL)hasLineLabel
{
  return self->_lineLabel != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableSummaryTrendLineViewModel;
  v4 = [(HKCodableSummaryTrendLineViewModel *)&v8 description];
  v5 = [(HKCodableSummaryTrendLineViewModel *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  dateInterval = self->_dateInterval;
  if (dateInterval)
  {
    v5 = [(HKCodableDateInterval *)dateInterval dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"dateInterval"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithDouble:self->_average];
    [v3 setObject:v6 forKey:@"average"];
  }
  xAxisLabel = self->_xAxisLabel;
  if (xAxisLabel) {
    [v3 setObject:xAxisLabel forKey:@"xAxisLabel"];
  }
  lineLabel = self->_lineLabel;
  if (lineLabel) {
    [v3 setObject:lineLabel forKey:@"lineLabel"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSummaryTrendLineViewModelReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_dateInterval)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_xAxisLabel)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_lineLabel)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_dateInterval)
  {
    objc_msgSend(v4, "setDateInterval:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_average;
    *((unsigned char *)v4 + 40) |= 1u;
  }
  if (self->_xAxisLabel)
  {
    objc_msgSend(v5, "setXAxisLabel:");
    id v4 = v5;
  }
  if (self->_lineLabel)
  {
    objc_msgSend(v5, "setLineLabel:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HKCodableDateInterval *)self->_dateInterval copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_average;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_xAxisLabel copyWithZone:a3];
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  uint64_t v10 = [(NSString *)self->_lineLabel copyWithZone:a3];
  v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  dateInterval = self->_dateInterval;
  if ((unint64_t)dateInterval | *((void *)v4 + 2))
  {
    if (!-[HKCodableDateInterval isEqual:](dateInterval, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_average != *((double *)v4 + 1)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  xAxisLabel = self->_xAxisLabel;
  if ((unint64_t)xAxisLabel | *((void *)v4 + 4) && !-[NSString isEqual:](xAxisLabel, "isEqual:")) {
    goto LABEL_13;
  }
  lineLabel = self->_lineLabel;
  if ((unint64_t)lineLabel | *((void *)v4 + 3)) {
    char v8 = -[NSString isEqual:](lineLabel, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HKCodableDateInterval *)self->_dateInterval hash];
  if (*(unsigned char *)&self->_has)
  {
    double average = self->_average;
    double v6 = -average;
    if (average >= 0.0) {
      double v6 = self->_average;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  unint64_t v9 = v4 ^ v3;
  NSUInteger v10 = [(NSString *)self->_xAxisLabel hash];
  return v9 ^ v10 ^ [(NSString *)self->_lineLabel hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  dateInterval = self->_dateInterval;
  uint64_t v6 = *((void *)v4 + 2);
  id v7 = v4;
  if (dateInterval)
  {
    if (!v6) {
      goto LABEL_7;
    }
    dateInterval = (HKCodableDateInterval *)-[HKCodableDateInterval mergeFrom:](dateInterval, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    dateInterval = (HKCodableDateInterval *)-[HKCodableSummaryTrendLineViewModel setDateInterval:](self, "setDateInterval:");
  }
  id v4 = v7;
LABEL_7:
  if (*((unsigned char *)v4 + 40))
  {
    self->_double average = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 4))
  {
    dateInterval = (HKCodableDateInterval *)-[HKCodableSummaryTrendLineViewModel setXAxisLabel:](self, "setXAxisLabel:");
    id v4 = v7;
  }
  if (*((void *)v4 + 3))
  {
    dateInterval = (HKCodableDateInterval *)-[HKCodableSummaryTrendLineViewModel setLineLabel:](self, "setLineLabel:");
    id v4 = v7;
  }
  MEMORY[0x1F41817F8](dateInterval, v4);
}

- (HKCodableDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setDateInterval:(id)a3
{
}

- (double)average
{
  return self->_average;
}

- (NSString)xAxisLabel
{
  return self->_xAxisLabel;
}

- (void)setXAxisLabel:(id)a3
{
}

- (NSString)lineLabel
{
  return self->_lineLabel;
}

- (void)setLineLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xAxisLabel, 0);
  objc_storeStrong((id *)&self->_lineLabel, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end