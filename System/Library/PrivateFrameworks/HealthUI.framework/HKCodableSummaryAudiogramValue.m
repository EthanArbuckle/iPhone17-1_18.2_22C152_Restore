@interface HKCodableSummaryAudiogramValue
+ (Class)sensitivityPointsType;
- (BOOL)hasAverageLeftEarSensitivity;
- (BOOL)hasAverageRightEarSensitivity;
- (BOOL)hasMaximumSensitivity;
- (BOOL)hasMinimumSensitivity;
- (BOOL)hasTimestampData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HKCodableQuantity)averageLeftEarSensitivity;
- (HKCodableQuantity)averageRightEarSensitivity;
- (HKCodableQuantity)maximumSensitivity;
- (HKCodableQuantity)minimumSensitivity;
- (NSMutableArray)sensitivityPoints;
- (double)timestampData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)sensitivityPointsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)sensitivityPointsCount;
- (void)addSensitivityPoints:(id)a3;
- (void)clearSensitivityPoints;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAverageLeftEarSensitivity:(id)a3;
- (void)setAverageRightEarSensitivity:(id)a3;
- (void)setHasTimestampData:(BOOL)a3;
- (void)setMaximumSensitivity:(id)a3;
- (void)setMinimumSensitivity:(id)a3;
- (void)setSensitivityPoints:(id)a3;
- (void)setTimestampData:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableSummaryAudiogramValue

- (BOOL)hasAverageLeftEarSensitivity
{
  return self->_averageLeftEarSensitivity != 0;
}

- (BOOL)hasAverageRightEarSensitivity
{
  return self->_averageRightEarSensitivity != 0;
}

- (BOOL)hasMinimumSensitivity
{
  return self->_minimumSensitivity != 0;
}

- (BOOL)hasMaximumSensitivity
{
  return self->_maximumSensitivity != 0;
}

- (void)setTimestampData:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestampData = a3;
}

- (void)setHasTimestampData:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestampData
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearSensitivityPoints
{
}

- (void)addSensitivityPoints:(id)a3
{
  id v4 = a3;
  sensitivityPoints = self->_sensitivityPoints;
  id v8 = v4;
  if (!sensitivityPoints)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_sensitivityPoints;
    self->_sensitivityPoints = v6;

    id v4 = v8;
    sensitivityPoints = self->_sensitivityPoints;
  }
  [(NSMutableArray *)sensitivityPoints addObject:v4];
}

- (unint64_t)sensitivityPointsCount
{
  return [(NSMutableArray *)self->_sensitivityPoints count];
}

- (id)sensitivityPointsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_sensitivityPoints objectAtIndex:a3];
}

+ (Class)sensitivityPointsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableSummaryAudiogramValue;
  id v4 = [(HKCodableSummaryAudiogramValue *)&v8 description];
  v5 = [(HKCodableSummaryAudiogramValue *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  averageLeftEarSensitivity = self->_averageLeftEarSensitivity;
  if (averageLeftEarSensitivity)
  {
    v5 = [(HKCodableQuantity *)averageLeftEarSensitivity dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"averageLeftEarSensitivity"];
  }
  averageRightEarSensitivity = self->_averageRightEarSensitivity;
  if (averageRightEarSensitivity)
  {
    v7 = [(HKCodableQuantity *)averageRightEarSensitivity dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"averageRightEarSensitivity"];
  }
  minimumSensitivity = self->_minimumSensitivity;
  if (minimumSensitivity)
  {
    v9 = [(HKCodableQuantity *)minimumSensitivity dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"minimumSensitivity"];
  }
  maximumSensitivity = self->_maximumSensitivity;
  if (maximumSensitivity)
  {
    v11 = [(HKCodableQuantity *)maximumSensitivity dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"maximumSensitivity"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v12 = [NSNumber numberWithDouble:self->_timestampData];
    [v3 setObject:v12 forKey:@"timestampData"];
  }
  if ([(NSMutableArray *)self->_sensitivityPoints count])
  {
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_sensitivityPoints, "count"));
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v14 = self->_sensitivityPoints;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "dictionaryRepresentation", (void)v21);
          [v13 addObject:v19];
        }
        uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v16);
    }

    [v3 setObject:v13 forKey:@"sensitivityPoints"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSummaryAudiogramValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_averageLeftEarSensitivity) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_averageRightEarSensitivity) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_minimumSensitivity) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_maximumSensitivity) {
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_sensitivityPoints;
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
  id v4 = a3;
  id v9 = v4;
  if (self->_averageLeftEarSensitivity)
  {
    objc_msgSend(v4, "setAverageLeftEarSensitivity:");
    id v4 = v9;
  }
  if (self->_averageRightEarSensitivity)
  {
    objc_msgSend(v9, "setAverageRightEarSensitivity:");
    id v4 = v9;
  }
  if (self->_minimumSensitivity)
  {
    objc_msgSend(v9, "setMinimumSensitivity:");
    id v4 = v9;
  }
  if (self->_maximumSensitivity)
  {
    objc_msgSend(v9, "setMaximumSensitivity:");
    id v4 = v9;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_timestampData;
    *((unsigned char *)v4 + 56) |= 1u;
  }
  if ([(HKCodableSummaryAudiogramValue *)self sensitivityPointsCount])
  {
    [v9 clearSensitivityPoints];
    unint64_t v5 = [(HKCodableSummaryAudiogramValue *)self sensitivityPointsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(HKCodableSummaryAudiogramValue *)self sensitivityPointsAtIndex:i];
        [v9 addSensitivityPoints:v8];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HKCodableQuantity *)self->_averageLeftEarSensitivity copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  id v8 = [(HKCodableQuantity *)self->_averageRightEarSensitivity copyWithZone:a3];
  id v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  id v10 = [(HKCodableQuantity *)self->_minimumSensitivity copyWithZone:a3];
  long long v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  id v12 = [(HKCodableQuantity *)self->_maximumSensitivity copyWithZone:a3];
  long long v13 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v12;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_timestampData;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v14 = self->_sensitivityPoints;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v18), "copyWithZone:", a3, (void)v21);
        [(id)v5 addSensitivityPoints:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v16);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  averageLeftEarSensitivity = self->_averageLeftEarSensitivity;
  if ((unint64_t)averageLeftEarSensitivity | *((void *)v4 + 2))
  {
    if (!-[HKCodableQuantity isEqual:](averageLeftEarSensitivity, "isEqual:")) {
      goto LABEL_17;
    }
  }
  averageRightEarSensitivity = self->_averageRightEarSensitivity;
  if ((unint64_t)averageRightEarSensitivity | *((void *)v4 + 3))
  {
    if (!-[HKCodableQuantity isEqual:](averageRightEarSensitivity, "isEqual:")) {
      goto LABEL_17;
    }
  }
  minimumSensitivity = self->_minimumSensitivity;
  if ((unint64_t)minimumSensitivity | *((void *)v4 + 5))
  {
    if (!-[HKCodableQuantity isEqual:](minimumSensitivity, "isEqual:")) {
      goto LABEL_17;
    }
  }
  maximumSensitivity = self->_maximumSensitivity;
  if ((unint64_t)maximumSensitivity | *((void *)v4 + 4))
  {
    if (!-[HKCodableQuantity isEqual:](maximumSensitivity, "isEqual:")) {
      goto LABEL_17;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_timestampData != *((double *)v4 + 1)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_17:
    char v10 = 0;
    goto LABEL_18;
  }
  sensitivityPoints = self->_sensitivityPoints;
  if ((unint64_t)sensitivityPoints | *((void *)v4 + 6)) {
    char v10 = -[NSMutableArray isEqual:](sensitivityPoints, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HKCodableQuantity *)self->_averageLeftEarSensitivity hash];
  unint64_t v4 = [(HKCodableQuantity *)self->_averageRightEarSensitivity hash];
  unint64_t v5 = [(HKCodableQuantity *)self->_minimumSensitivity hash];
  unint64_t v6 = [(HKCodableQuantity *)self->_maximumSensitivity hash];
  if (*(unsigned char *)&self->_has)
  {
    double timestampData = self->_timestampData;
    double v9 = -timestampData;
    if (timestampData >= 0.0) {
      double v9 = self->_timestampData;
    }
    long double v10 = floor(v9 + 0.5);
    double v11 = (v9 - v10) * 1.84467441e19;
    unint64_t v7 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0) {
        v7 += (unint64_t)v11;
      }
    }
    else
    {
      v7 -= (unint64_t)fabs(v11);
    }
  }
  else
  {
    unint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(NSMutableArray *)self->_sensitivityPoints hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  averageLeftEarSensitivity = self->_averageLeftEarSensitivity;
  uint64_t v6 = *((void *)v4 + 2);
  if (averageLeftEarSensitivity)
  {
    if (v6) {
      -[HKCodableQuantity mergeFrom:](averageLeftEarSensitivity, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[HKCodableSummaryAudiogramValue setAverageLeftEarSensitivity:](self, "setAverageLeftEarSensitivity:");
  }
  averageRightEarSensitivity = self->_averageRightEarSensitivity;
  uint64_t v8 = *((void *)v4 + 3);
  if (averageRightEarSensitivity)
  {
    if (v8) {
      -[HKCodableQuantity mergeFrom:](averageRightEarSensitivity, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[HKCodableSummaryAudiogramValue setAverageRightEarSensitivity:](self, "setAverageRightEarSensitivity:");
  }
  minimumSensitivity = self->_minimumSensitivity;
  uint64_t v10 = *((void *)v4 + 5);
  if (minimumSensitivity)
  {
    if (v10) {
      -[HKCodableQuantity mergeFrom:](minimumSensitivity, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[HKCodableSummaryAudiogramValue setMinimumSensitivity:](self, "setMinimumSensitivity:");
  }
  maximumSensitivity = self->_maximumSensitivity;
  uint64_t v12 = *((void *)v4 + 4);
  if (maximumSensitivity)
  {
    if (v12) {
      -[HKCodableQuantity mergeFrom:](maximumSensitivity, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[HKCodableSummaryAudiogramValue setMaximumSensitivity:](self, "setMaximumSensitivity:");
  }
  if (*((unsigned char *)v4 + 56))
  {
    self->_double timestampData = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v13 = *((id *)v4 + 6);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        -[HKCodableSummaryAudiogramValue addSensitivityPoints:](self, "addSensitivityPoints:", *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18);
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v15);
  }
}

- (HKCodableQuantity)averageLeftEarSensitivity
{
  return self->_averageLeftEarSensitivity;
}

- (void)setAverageLeftEarSensitivity:(id)a3
{
}

- (HKCodableQuantity)averageRightEarSensitivity
{
  return self->_averageRightEarSensitivity;
}

- (void)setAverageRightEarSensitivity:(id)a3
{
}

- (HKCodableQuantity)minimumSensitivity
{
  return self->_minimumSensitivity;
}

- (void)setMinimumSensitivity:(id)a3
{
}

- (HKCodableQuantity)maximumSensitivity
{
  return self->_maximumSensitivity;
}

- (void)setMaximumSensitivity:(id)a3
{
}

- (double)timestampData
{
  return self->_timestampData;
}

- (NSMutableArray)sensitivityPoints
{
  return self->_sensitivityPoints;
}

- (void)setSensitivityPoints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sensitivityPoints, 0);
  objc_storeStrong((id *)&self->_minimumSensitivity, 0);
  objc_storeStrong((id *)&self->_maximumSensitivity, 0);
  objc_storeStrong((id *)&self->_averageRightEarSensitivity, 0);
  objc_storeStrong((id *)&self->_averageLeftEarSensitivity, 0);
}

@end