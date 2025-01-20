@interface HKCodableChartQuantityDataSourceQueryData
- (BOOL)hasStatisticsCollection;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HKCodableStatisticsCollection)statisticsCollection;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setStatisticsCollection:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableChartQuantityDataSourceQueryData

- (BOOL)hasStatisticsCollection
{
  return self->_statisticsCollection != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableChartQuantityDataSourceQueryData;
  v4 = [(HKCodableChartQuantityDataSourceQueryData *)&v8 description];
  v5 = [(HKCodableChartQuantityDataSourceQueryData *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  statisticsCollection = self->_statisticsCollection;
  if (statisticsCollection)
  {
    v5 = [(HKCodableStatisticsCollection *)statisticsCollection dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"statisticsCollection"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableChartQuantityDataSourceQueryDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_statisticsCollection) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  statisticsCollection = self->_statisticsCollection;
  if (statisticsCollection) {
    [a3 setStatisticsCollection:statisticsCollection];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HKCodableStatisticsCollection *)self->_statisticsCollection copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    statisticsCollection = self->_statisticsCollection;
    if ((unint64_t)statisticsCollection | v4[1]) {
      char v6 = -[HKCodableStatisticsCollection isEqual:](statisticsCollection, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(HKCodableStatisticsCollection *)self->_statisticsCollection hash];
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  statisticsCollection = self->_statisticsCollection;
  uint64_t v6 = v4[1];
  if (statisticsCollection)
  {
    if (v6) {
      -[HKCodableStatisticsCollection mergeFrom:](statisticsCollection, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[HKCodableChartQuantityDataSourceQueryData setStatisticsCollection:](self, "setStatisticsCollection:");
  }
  MEMORY[0x1F41817F8]();
}

- (HKCodableStatisticsCollection)statisticsCollection
{
  return self->_statisticsCollection;
}

- (void)setStatisticsCollection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end