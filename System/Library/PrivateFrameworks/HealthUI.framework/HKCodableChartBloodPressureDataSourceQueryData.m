@interface HKCodableChartBloodPressureDataSourceQueryData
- (BOOL)hasDiastolicStatisticsCollection;
- (BOOL)hasSystolicStatisticsCollection;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HKCodableStatisticsCollection)diastolicStatisticsCollection;
- (HKCodableStatisticsCollection)systolicStatisticsCollection;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDiastolicStatisticsCollection:(id)a3;
- (void)setSystolicStatisticsCollection:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableChartBloodPressureDataSourceQueryData

- (BOOL)hasSystolicStatisticsCollection
{
  return self->_systolicStatisticsCollection != 0;
}

- (BOOL)hasDiastolicStatisticsCollection
{
  return self->_diastolicStatisticsCollection != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableChartBloodPressureDataSourceQueryData;
  v4 = [(HKCodableChartBloodPressureDataSourceQueryData *)&v8 description];
  v5 = [(HKCodableChartBloodPressureDataSourceQueryData *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  systolicStatisticsCollection = self->_systolicStatisticsCollection;
  if (systolicStatisticsCollection)
  {
    v5 = [(HKCodableStatisticsCollection *)systolicStatisticsCollection dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"systolicStatisticsCollection"];
  }
  diastolicStatisticsCollection = self->_diastolicStatisticsCollection;
  if (diastolicStatisticsCollection)
  {
    v7 = [(HKCodableStatisticsCollection *)diastolicStatisticsCollection dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"diastolicStatisticsCollection"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableChartBloodPressureDataSourceQueryDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_systolicStatisticsCollection)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_diastolicStatisticsCollection)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_systolicStatisticsCollection)
  {
    objc_msgSend(v4, "setSystolicStatisticsCollection:");
    id v4 = v5;
  }
  if (self->_diastolicStatisticsCollection)
  {
    objc_msgSend(v5, "setDiastolicStatisticsCollection:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HKCodableStatisticsCollection *)self->_systolicStatisticsCollection copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(HKCodableStatisticsCollection *)self->_diastolicStatisticsCollection copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((systolicStatisticsCollection = self->_systolicStatisticsCollection,
         !((unint64_t)systolicStatisticsCollection | v4[2]))
     || -[HKCodableStatisticsCollection isEqual:](systolicStatisticsCollection, "isEqual:")))
  {
    diastolicStatisticsCollection = self->_diastolicStatisticsCollection;
    if ((unint64_t)diastolicStatisticsCollection | v4[1]) {
      char v7 = -[HKCodableStatisticsCollection isEqual:](diastolicStatisticsCollection, "isEqual:");
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
  unint64_t v3 = [(HKCodableStatisticsCollection *)self->_systolicStatisticsCollection hash];
  return [(HKCodableStatisticsCollection *)self->_diastolicStatisticsCollection hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  systolicStatisticsCollection = self->_systolicStatisticsCollection;
  uint64_t v6 = v4[2];
  v9 = v4;
  if (systolicStatisticsCollection)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[HKCodableStatisticsCollection mergeFrom:](systolicStatisticsCollection, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[HKCodableChartBloodPressureDataSourceQueryData setSystolicStatisticsCollection:](self, "setSystolicStatisticsCollection:");
  }
  id v4 = v9;
LABEL_7:
  diastolicStatisticsCollection = self->_diastolicStatisticsCollection;
  uint64_t v8 = v4[1];
  if (diastolicStatisticsCollection)
  {
    if (!v8) {
      goto LABEL_13;
    }
    diastolicStatisticsCollection = (HKCodableStatisticsCollection *)-[HKCodableStatisticsCollection mergeFrom:](diastolicStatisticsCollection, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    diastolicStatisticsCollection = (HKCodableStatisticsCollection *)-[HKCodableChartBloodPressureDataSourceQueryData setDiastolicStatisticsCollection:](self, "setDiastolicStatisticsCollection:");
  }
  id v4 = v9;
LABEL_13:
  MEMORY[0x1F41817F8](diastolicStatisticsCollection, v4);
}

- (HKCodableStatisticsCollection)systolicStatisticsCollection
{
  return self->_systolicStatisticsCollection;
}

- (void)setSystolicStatisticsCollection:(id)a3
{
}

- (HKCodableStatisticsCollection)diastolicStatisticsCollection
{
  return self->_diastolicStatisticsCollection;
}

- (void)setDiastolicStatisticsCollection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systolicStatisticsCollection, 0);
  objc_storeStrong((id *)&self->_diastolicStatisticsCollection, 0);
}

@end