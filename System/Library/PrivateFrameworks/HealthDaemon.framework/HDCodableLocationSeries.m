@interface HDCodableLocationSeries
+ (Class)locationDataType;
- (BOOL)applyToObject:(id)a3;
- (BOOL)final;
- (BOOL)frozen;
- (BOOL)hasContinuationUUID;
- (BOOL)hasFinal;
- (BOOL)hasFrozen;
- (BOOL)hasSample;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableSample)sample;
- (NSData)continuationUUID;
- (NSMutableArray)locationDatas;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)locationDataAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)locationDatasCount;
- (void)addLocationData:(id)a3;
- (void)clearLocationDatas;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContinuationUUID:(id)a3;
- (void)setFinal:(BOOL)a3;
- (void)setFrozen:(BOOL)a3;
- (void)setHasFinal:(BOOL)a3;
- (void)setHasFrozen:(BOOL)a3;
- (void)setLocationDatas:(id)a3;
- (void)setSample:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableLocationSeries

- (BOOL)applyToObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([(HDCodableLocationSeries *)self sample],
        v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 applyToObject:v4],
        v5,
        v6))
  {
    objc_msgSend(v4, "_setFrozen:", -[HDCodableLocationSeries frozen](self, "frozen"));
    [v4 _setCodableWorkoutRoute:self];
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)hasSample
{
  return self->_sample != 0;
}

- (void)setFrozen:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_frozen = a3;
}

- (void)setHasFrozen:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFrozen
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasContinuationUUID
{
  return self->_continuationUUID != 0;
}

- (void)setFinal:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_final = a3;
}

- (void)setHasFinal:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFinal
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearLocationDatas
{
}

- (void)addLocationData:(id)a3
{
  id v4 = a3;
  locationDatas = self->_locationDatas;
  id v8 = v4;
  if (!locationDatas)
  {
    int v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    BOOL v7 = self->_locationDatas;
    self->_locationDatas = v6;

    id v4 = v8;
    locationDatas = self->_locationDatas;
  }
  [(NSMutableArray *)locationDatas addObject:v4];
}

- (unint64_t)locationDatasCount
{
  return [(NSMutableArray *)self->_locationDatas count];
}

- (id)locationDataAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_locationDatas objectAtIndex:a3];
}

+ (Class)locationDataType
{
  return (Class)objc_opt_class();
}

- (NSString)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableLocationSeries;
  id v4 = [(HDCodableLocationSeries *)&v8 description];
  v5 = [(HDCodableLocationSeries *)self dictionaryRepresentation];
  int v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  sample = self->_sample;
  if (sample)
  {
    v5 = [(HDCodableSample *)sample dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"sample"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    int v6 = [NSNumber numberWithBool:self->_frozen];
    [v3 setObject:v6 forKey:@"frozen"];
  }
  continuationUUID = self->_continuationUUID;
  if (continuationUUID) {
    [v3 setObject:continuationUUID forKey:@"continuationUUID"];
  }
  if (*(unsigned char *)&self->_has)
  {
    objc_super v8 = [NSNumber numberWithBool:self->_final];
    [v3 setObject:v8 forKey:@"final"];
  }
  if ([(NSMutableArray *)self->_locationDatas count])
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_locationDatas, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v10 = self->_locationDatas;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (void)v17);
          [v9 addObject:v15];
        }
        uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }

    [v3 setObject:v9 forKey:@"locationData"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableLocationSeriesReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_sample) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_continuationUUID) {
    PBDataWriterWriteDataField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_locationDatas;
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
  uint64_t v9 = v4;
  if (self->_sample)
  {
    objc_msgSend(v4, "setSample:");
    id v4 = v9;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[33] = self->_frozen;
    v4[36] |= 2u;
  }
  if (self->_continuationUUID)
  {
    objc_msgSend(v9, "setContinuationUUID:");
    id v4 = v9;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[32] = self->_final;
    v4[36] |= 1u;
  }
  if ([(HDCodableLocationSeries *)self locationDatasCount])
  {
    [v9 clearLocationDatas];
    unint64_t v5 = [(HDCodableLocationSeries *)self locationDatasCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(HDCodableLocationSeries *)self locationDataAtIndex:i];
        [v9 addLocationData:v8];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HDCodableSample *)self->_sample copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v5 + 33) = self->_frozen;
    *(unsigned char *)(v5 + 36) |= 2u;
  }
  uint64_t v8 = [(NSData *)self->_continuationUUID copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 32) = self->_final;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v10 = self->_locationDatas;
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
        [(id)v5 addLocationData:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  sample = self->_sample;
  if ((unint64_t)sample | *((void *)v4 + 3))
  {
    if (!-[HDCodableSample isEqual:](sample, "isEqual:")) {
      goto LABEL_19;
    }
  }
  char has = (char)self->_has;
  char v7 = *((unsigned char *)v4 + 36);
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0) {
      goto LABEL_19;
    }
    if (self->_frozen)
    {
      if (!*((unsigned char *)v4 + 33)) {
        goto LABEL_19;
      }
    }
    else if (*((unsigned char *)v4 + 33))
    {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_19;
  }
  continuationUUID = self->_continuationUUID;
  if ((unint64_t)continuationUUID | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](continuationUUID, "isEqual:")) {
      goto LABEL_19;
    }
    char has = (char)self->_has;
    char v7 = *((unsigned char *)v4 + 36);
  }
  if ((has & 1) == 0)
  {
    if ((v7 & 1) == 0) {
      goto LABEL_25;
    }
LABEL_19:
    char v9 = 0;
    goto LABEL_20;
  }
  if ((v7 & 1) == 0) {
    goto LABEL_19;
  }
  if (!self->_final)
  {
    if (!*((unsigned char *)v4 + 32)) {
      goto LABEL_25;
    }
    goto LABEL_19;
  }
  if (!*((unsigned char *)v4 + 32)) {
    goto LABEL_19;
  }
LABEL_25:
  locationDatas = self->_locationDatas;
  if ((unint64_t)locationDatas | *((void *)v4 + 2)) {
    char v9 = -[NSMutableArray isEqual:](locationDatas, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_20:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HDCodableSample *)self->_sample hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v4 = 2654435761 * self->_frozen;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = [(NSData *)self->_continuationUUID hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_final;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ [(NSMutableArray *)self->_locationDatas hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  sample = self->_sample;
  uint64_t v6 = *((void *)v4 + 3);
  if (sample)
  {
    if (v6) {
      -[HDCodableSample mergeFrom:](sample, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[HDCodableLocationSeries setSample:](self, "setSample:");
  }
  if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    self->_frozen = *((unsigned char *)v4 + 33);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 1)) {
    -[HDCodableLocationSeries setContinuationUUID:](self, "setContinuationUUID:");
  }
  if (*((unsigned char *)v4 + 36))
  {
    self->_final = *((unsigned char *)v4 + 32);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v4 + 2);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[HDCodableLocationSeries addLocationData:](self, "addLocationData:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (HDCodableSample)sample
{
  return self->_sample;
}

- (void)setSample:(id)a3
{
}

- (BOOL)frozen
{
  return self->_frozen;
}

- (NSData)continuationUUID
{
  return self->_continuationUUID;
}

- (void)setContinuationUUID:(id)a3
{
}

- (BOOL)final
{
  return self->_final;
}

- (NSMutableArray)locationDatas
{
  return self->_locationDatas;
}

- (void)setLocationDatas:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sample, 0);
  objc_storeStrong((id *)&self->_locationDatas, 0);

  objc_storeStrong((id *)&self->_continuationUUID, 0);
}

@end