@interface HDCodableMedicationChartSeries
- (BOOL)hasMonthData;
- (BOOL)hasSixMonthsData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)monthData;
- (NSData)sixMonthsData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setMonthData:(id)a3;
- (void)setSixMonthsData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableMedicationChartSeries

- (void)setSixMonthsData:(id)a3
{
}

- (void)setMonthData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sixMonthsData, 0);
  objc_storeStrong((id *)&self->_monthData, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_monthData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_sixMonthsData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (BOOL)hasMonthData
{
  return self->_monthData != 0;
}

- (BOOL)hasSixMonthsData
{
  return self->_sixMonthsData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableMedicationChartSeries;
  id v4 = [(HDCodableMedicationChartSeries *)&v8 description];
  id v5 = [(HDCodableMedicationChartSeries *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  monthData = self->_monthData;
  if (monthData) {
    [v3 setObject:monthData forKey:@"monthData"];
  }
  sixMonthsData = self->_sixMonthsData;
  if (sixMonthsData) {
    [v4 setObject:sixMonthsData forKey:@"sixMonthsData"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableMedicationChartSeriesReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_monthData)
  {
    objc_msgSend(v4, "setMonthData:");
    id v4 = v5;
  }
  if (self->_sixMonthsData)
  {
    objc_msgSend(v5, "setSixMonthsData:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_monthData copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSData *)self->_sixMonthsData copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((monthData = self->_monthData, !((unint64_t)monthData | v4[1]))
     || -[NSData isEqual:](monthData, "isEqual:")))
  {
    sixMonthsData = self->_sixMonthsData;
    if ((unint64_t)sixMonthsData | v4[2]) {
      char v7 = -[NSData isEqual:](sixMonthsData, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_monthData hash];
  return [(NSData *)self->_sixMonthsData hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[1])
  {
    -[HDCodableMedicationChartSeries setMonthData:](self, "setMonthData:");
    id v4 = v5;
  }
  if (v4[2])
  {
    -[HDCodableMedicationChartSeries setSixMonthsData:](self, "setSixMonthsData:");
    id v4 = v5;
  }
}

- (NSData)monthData
{
  return self->_monthData;
}

- (NSData)sixMonthsData
{
  return self->_sixMonthsData;
}

@end