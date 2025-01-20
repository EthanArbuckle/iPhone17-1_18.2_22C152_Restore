@interface HKCodableSummaryTrendValue
+ (Class)dataPresencePointsType;
- (BOOL)hasAnalysisData;
- (BOOL)hasCoveredDateRangeRawValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)analysisData;
- (NSMutableArray)dataPresencePoints;
- (NSString)coveredDateRangeRawValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dataPresencePointsAtIndex:(unint64_t)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)dataPresencePointsCount;
- (unint64_t)hash;
- (void)addDataPresencePoints:(id)a3;
- (void)clearDataPresencePoints;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAnalysisData:(id)a3;
- (void)setCoveredDateRangeRawValue:(id)a3;
- (void)setDataPresencePoints:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableSummaryTrendValue

- (BOOL)hasAnalysisData
{
  return self->_analysisData != 0;
}

- (BOOL)hasCoveredDateRangeRawValue
{
  return self->_coveredDateRangeRawValue != 0;
}

- (void)clearDataPresencePoints
{
}

- (void)addDataPresencePoints:(id)a3
{
  id v4 = a3;
  dataPresencePoints = self->_dataPresencePoints;
  id v8 = v4;
  if (!dataPresencePoints)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_dataPresencePoints;
    self->_dataPresencePoints = v6;

    id v4 = v8;
    dataPresencePoints = self->_dataPresencePoints;
  }
  [(NSMutableArray *)dataPresencePoints addObject:v4];
}

- (unint64_t)dataPresencePointsCount
{
  return [(NSMutableArray *)self->_dataPresencePoints count];
}

- (id)dataPresencePointsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_dataPresencePoints objectAtIndex:a3];
}

+ (Class)dataPresencePointsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableSummaryTrendValue;
  id v4 = [(HKCodableSummaryTrendValue *)&v8 description];
  v5 = [(HKCodableSummaryTrendValue *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  analysisData = self->_analysisData;
  if (analysisData) {
    [v3 setObject:analysisData forKey:@"analysisData"];
  }
  coveredDateRangeRawValue = self->_coveredDateRangeRawValue;
  if (coveredDateRangeRawValue) {
    [v4 setObject:coveredDateRangeRawValue forKey:@"coveredDateRangeRawValue"];
  }
  if ([(NSMutableArray *)self->_dataPresencePoints count])
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_dataPresencePoints, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    objc_super v8 = self->_dataPresencePoints;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (void)v15);
          [v7 addObject:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }

    [v4 setObject:v7 forKey:@"dataPresencePoints"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSummaryTrendValueReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_analysisData) {
    PBDataWriterWriteDataField();
  }
  if (self->_coveredDateRangeRawValue) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_dataPresencePoints;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_analysisData) {
    objc_msgSend(v8, "setAnalysisData:");
  }
  if (self->_coveredDateRangeRawValue) {
    objc_msgSend(v8, "setCoveredDateRangeRawValue:");
  }
  if ([(HKCodableSummaryTrendValue *)self dataPresencePointsCount])
  {
    [v8 clearDataPresencePoints];
    unint64_t v4 = [(HKCodableSummaryTrendValue *)self dataPresencePointsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(HKCodableSummaryTrendValue *)self dataPresencePointsAtIndex:i];
        [v8 addDataPresencePoints:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_analysisData copyWithZone:a3];
  uint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_coveredDateRangeRawValue copyWithZone:a3];
  uint64_t v9 = (void *)v5[2];
  v5[2] = v8;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v10 = self->_dataPresencePoints;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v14), "copyWithZone:", a3, (void)v17);
        [v5 addDataPresencePoints:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((analysisData = self->_analysisData, !((unint64_t)analysisData | v4[1]))
     || -[NSData isEqual:](analysisData, "isEqual:"))
    && ((coveredDateRangeRawValue = self->_coveredDateRangeRawValue,
         !((unint64_t)coveredDateRangeRawValue | v4[2]))
     || -[NSString isEqual:](coveredDateRangeRawValue, "isEqual:")))
  {
    dataPresencePoints = self->_dataPresencePoints;
    if ((unint64_t)dataPresencePoints | v4[3]) {
      char v8 = -[NSMutableArray isEqual:](dataPresencePoints, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_analysisData hash];
  NSUInteger v4 = [(NSString *)self->_coveredDateRangeRawValue hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_dataPresencePoints hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 1)) {
    -[HKCodableSummaryTrendValue setAnalysisData:](self, "setAnalysisData:");
  }
  if (*((void *)v4 + 2)) {
    -[HKCodableSummaryTrendValue setCoveredDateRangeRawValue:](self, "setCoveredDateRangeRawValue:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 3);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[HKCodableSummaryTrendValue addDataPresencePoints:](self, "addDataPresencePoints:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSData)analysisData
{
  return self->_analysisData;
}

- (void)setAnalysisData:(id)a3
{
}

- (NSString)coveredDateRangeRawValue
{
  return self->_coveredDateRangeRawValue;
}

- (void)setCoveredDateRangeRawValue:(id)a3
{
}

- (NSMutableArray)dataPresencePoints
{
  return self->_dataPresencePoints;
}

- (void)setDataPresencePoints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataPresencePoints, 0);
  objc_storeStrong((id *)&self->_coveredDateRangeRawValue, 0);
  objc_storeStrong((id *)&self->_analysisData, 0);
}

@end