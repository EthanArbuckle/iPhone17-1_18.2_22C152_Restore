@interface HKCodableElectrocardiogramDataSourceQueryData
+ (Class)samplesType;
- (BOOL)hasActiveAlgorithmVersionRawValue;
- (BOOL)hasCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)samples;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)samplesAtIndex:(unint64_t)a3;
- (int64_t)activeAlgorithmVersionRawValue;
- (int64_t)count;
- (unint64_t)hash;
- (unint64_t)samplesCount;
- (void)addSamples:(id)a3;
- (void)clearSamples;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActiveAlgorithmVersionRawValue:(int64_t)a3;
- (void)setCount:(int64_t)a3;
- (void)setHasActiveAlgorithmVersionRawValue:(BOOL)a3;
- (void)setHasCount:(BOOL)a3;
- (void)setSamples:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableElectrocardiogramDataSourceQueryData

- (void)setCount:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_count = a3;
}

- (void)setHasCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)clearSamples
{
}

- (void)addSamples:(id)a3
{
  id v4 = a3;
  samples = self->_samples;
  id v8 = v4;
  if (!samples)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_samples;
    self->_samples = v6;

    id v4 = v8;
    samples = self->_samples;
  }
  [(NSMutableArray *)samples addObject:v4];
}

- (unint64_t)samplesCount
{
  return [(NSMutableArray *)self->_samples count];
}

- (id)samplesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_samples objectAtIndex:a3];
}

+ (Class)samplesType
{
  return (Class)objc_opt_class();
}

- (void)setActiveAlgorithmVersionRawValue:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_activeAlgorithmVersionRawValue = a3;
}

- (void)setHasActiveAlgorithmVersionRawValue:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasActiveAlgorithmVersionRawValue
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableElectrocardiogramDataSourceQueryData;
  id v4 = [(HKCodableElectrocardiogramDataSourceQueryData *)&v8 description];
  v5 = [(HKCodableElectrocardiogramDataSourceQueryData *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    id v4 = [NSNumber numberWithLongLong:self->_count];
    [v3 setObject:v4 forKey:@"count"];
  }
  if ([(NSMutableArray *)self->_samples count])
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_samples, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v6 = self->_samples;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (void)v14);
          [v5 addObject:v11];
        }
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    [v3 setObject:v5 forKey:@"samples"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v12 = [NSNumber numberWithLongLong:self->_activeAlgorithmVersionRawValue];
    [v3 setObject:v12 forKey:@"activeAlgorithmVersionRawValue"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableElectrocardiogramDataSourceQueryDataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt64Field();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_samples;
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

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[2] = self->_count;
    *((unsigned char *)v4 + 32) |= 2u;
  }
  id v9 = v4;
  if ([(HKCodableElectrocardiogramDataSourceQueryData *)self samplesCount])
  {
    [v9 clearSamples];
    unint64_t v5 = [(HKCodableElectrocardiogramDataSourceQueryData *)self samplesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(HKCodableElectrocardiogramDataSourceQueryData *)self samplesAtIndex:i];
        [v9 addSamples:v8];
      }
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v9 + 1) = self->_activeAlgorithmVersionRawValue;
    *((unsigned char *)v9 + 32) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_count;
    *(unsigned char *)(v5 + 32) |= 2u;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = self->_samples;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11), "copyWithZone:", a3, (void)v14);
        [(id)v6 addSamples:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v6 + 8) = self->_activeAlgorithmVersionRawValue;
    *(unsigned char *)(v6 + 32) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_count != *((void *)v4 + 2)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    goto LABEL_14;
  }
  samples = self->_samples;
  if ((unint64_t)samples | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](samples, "isEqual:"))
    {
LABEL_14:
      BOOL v7 = 0;
      goto LABEL_15;
    }
    char has = (char)self->_has;
  }
  BOOL v7 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_activeAlgorithmVersionRawValue != *((void *)v4 + 1)) {
      goto LABEL_14;
    }
    BOOL v7 = 1;
  }
LABEL_15:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_count;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_samples hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_activeAlgorithmVersionRawValue;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    self->_count = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v4 + 3);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[HKCodableElectrocardiogramDataSourceQueryData addSamples:](self, "addSamples:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if (v5[4])
  {
    self->_activeAlgorithmVersionRawValue = v5[1];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (int64_t)count
{
  return self->_count;
}

- (NSMutableArray)samples
{
  return self->_samples;
}

- (void)setSamples:(id)a3
{
}

- (int64_t)activeAlgorithmVersionRawValue
{
  return self->_activeAlgorithmVersionRawValue;
}

- (void).cxx_destruct
{
}

@end