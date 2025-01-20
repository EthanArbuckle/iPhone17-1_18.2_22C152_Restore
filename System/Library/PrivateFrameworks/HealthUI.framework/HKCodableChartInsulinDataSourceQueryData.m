@interface HKCodableChartInsulinDataSourceQueryData
+ (Class)basalInsulinValuesType;
+ (Class)totalInsulinValuesType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)basalInsulinValues;
- (NSMutableArray)totalInsulinValues;
- (id)basalInsulinValuesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)totalInsulinValuesAtIndex:(unint64_t)a3;
- (unint64_t)basalInsulinValuesCount;
- (unint64_t)hash;
- (unint64_t)totalInsulinValuesCount;
- (void)addBasalInsulinValues:(id)a3;
- (void)addTotalInsulinValues:(id)a3;
- (void)clearBasalInsulinValues;
- (void)clearTotalInsulinValues;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBasalInsulinValues:(id)a3;
- (void)setTotalInsulinValues:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableChartInsulinDataSourceQueryData

- (void)clearBasalInsulinValues
{
}

- (void)addBasalInsulinValues:(id)a3
{
  id v4 = a3;
  basalInsulinValues = self->_basalInsulinValues;
  id v8 = v4;
  if (!basalInsulinValues)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_basalInsulinValues;
    self->_basalInsulinValues = v6;

    id v4 = v8;
    basalInsulinValues = self->_basalInsulinValues;
  }
  [(NSMutableArray *)basalInsulinValues addObject:v4];
}

- (unint64_t)basalInsulinValuesCount
{
  return [(NSMutableArray *)self->_basalInsulinValues count];
}

- (id)basalInsulinValuesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_basalInsulinValues objectAtIndex:a3];
}

+ (Class)basalInsulinValuesType
{
  return (Class)objc_opt_class();
}

- (void)clearTotalInsulinValues
{
}

- (void)addTotalInsulinValues:(id)a3
{
  id v4 = a3;
  totalInsulinValues = self->_totalInsulinValues;
  id v8 = v4;
  if (!totalInsulinValues)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_totalInsulinValues;
    self->_totalInsulinValues = v6;

    id v4 = v8;
    totalInsulinValues = self->_totalInsulinValues;
  }
  [(NSMutableArray *)totalInsulinValues addObject:v4];
}

- (unint64_t)totalInsulinValuesCount
{
  return [(NSMutableArray *)self->_totalInsulinValues count];
}

- (id)totalInsulinValuesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_totalInsulinValues objectAtIndex:a3];
}

+ (Class)totalInsulinValuesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableChartInsulinDataSourceQueryData;
  id v4 = [(HKCodableChartInsulinDataSourceQueryData *)&v8 description];
  v5 = [(HKCodableChartInsulinDataSourceQueryData *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSMutableArray *)self->_basalInsulinValues count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_basalInsulinValues, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v5 = self->_basalInsulinValues;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v24 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v23 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"basalInsulinValues"];
  }
  if ([(NSMutableArray *)self->_totalInsulinValues count])
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_totalInsulinValues, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v12 = self->_totalInsulinValues;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * j), "dictionaryRepresentation", (void)v19);
          [v11 addObject:v17];
        }
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKey:@"totalInsulinValues"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableChartInsulinDataSourceQueryDataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = self->_basalInsulinValues;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = self->_totalInsulinValues;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)copyTo:(id)a3
{
  id v12 = a3;
  if ([(HKCodableChartInsulinDataSourceQueryData *)self basalInsulinValuesCount])
  {
    [v12 clearBasalInsulinValues];
    unint64_t v4 = [(HKCodableChartInsulinDataSourceQueryData *)self basalInsulinValuesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(HKCodableChartInsulinDataSourceQueryData *)self basalInsulinValuesAtIndex:i];
        [v12 addBasalInsulinValues:v7];
      }
    }
  }
  if ([(HKCodableChartInsulinDataSourceQueryData *)self totalInsulinValuesCount])
  {
    [v12 clearTotalInsulinValues];
    unint64_t v8 = [(HKCodableChartInsulinDataSourceQueryData *)self totalInsulinValuesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(HKCodableChartInsulinDataSourceQueryData *)self totalInsulinValuesAtIndex:j];
        [v12 addTotalInsulinValues:v11];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v6 = self->_basalInsulinValues;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v23 + 1) + 8 * v10) copyWithZone:a3];
        [v5 addBasalInsulinValues:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v8);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = self->_totalInsulinValues;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v16), "copyWithZone:", a3, (void)v19);
        [v5 addTotalInsulinValues:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((basalInsulinValues = self->_basalInsulinValues, !((unint64_t)basalInsulinValues | v4[1]))
     || -[NSMutableArray isEqual:](basalInsulinValues, "isEqual:")))
  {
    totalInsulinValues = self->_totalInsulinValues;
    if ((unint64_t)totalInsulinValues | v4[2]) {
      char v7 = -[NSMutableArray isEqual:](totalInsulinValues, "isEqual:");
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
  uint64_t v3 = [(NSMutableArray *)self->_basalInsulinValues hash];
  return [(NSMutableArray *)self->_totalInsulinValues hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (id *)a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v4[1];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(HKCodableChartInsulinDataSourceQueryData *)self addBasalInsulinValues:*(void *)(*((void *)&v19 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v4[2];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[HKCodableChartInsulinDataSourceQueryData addTotalInsulinValues:](self, "addTotalInsulinValues:", *(void *)(*((void *)&v15 + 1) + 8 * v14++), (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (NSMutableArray)basalInsulinValues
{
  return self->_basalInsulinValues;
}

- (void)setBasalInsulinValues:(id)a3
{
}

- (NSMutableArray)totalInsulinValues
{
  return self->_totalInsulinValues;
}

- (void)setTotalInsulinValues:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalInsulinValues, 0);
  objc_storeStrong((id *)&self->_basalInsulinValues, 0);
}

@end