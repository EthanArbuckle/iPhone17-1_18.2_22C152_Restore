@interface HKCodableNotificationDataSourceQueryData
+ (Class)samplesType;
- (BOOL)hasCount;
- (BOOL)hasDataType;
- (BOOL)hasLatestSupportedVersion;
- (BOOL)hasMinimumSupportedVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)samples;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)samplesAtIndex:(unint64_t)a3;
- (int64_t)count;
- (int64_t)dataType;
- (int64_t)latestSupportedVersion;
- (int64_t)minimumSupportedVersion;
- (unint64_t)hash;
- (unint64_t)samplesCount;
- (void)addSamples:(id)a3;
- (void)clearSamples;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCount:(int64_t)a3;
- (void)setDataType:(int64_t)a3;
- (void)setHasCount:(BOOL)a3;
- (void)setHasDataType:(BOOL)a3;
- (void)setHasLatestSupportedVersion:(BOOL)a3;
- (void)setHasMinimumSupportedVersion:(BOOL)a3;
- (void)setLatestSupportedVersion:(int64_t)a3;
- (void)setMinimumSupportedVersion:(int64_t)a3;
- (void)setSamples:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableNotificationDataSourceQueryData

- (void)setDataType:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_dataType = a3;
}

- (void)setHasDataType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDataType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setCount:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_count = a3;
}

- (void)setHasCount:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCount
{
  return *(unsigned char *)&self->_has & 1;
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

- (void)setLatestSupportedVersion:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_latestSupportedVersion = a3;
}

- (void)setHasLatestSupportedVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLatestSupportedVersion
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setMinimumSupportedVersion:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_minimumSupportedVersion = a3;
}

- (void)setHasMinimumSupportedVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMinimumSupportedVersion
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableNotificationDataSourceQueryData;
  id v4 = [(HKCodableNotificationDataSourceQueryData *)&v8 description];
  v5 = [(HKCodableNotificationDataSourceQueryData *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = [NSNumber numberWithLongLong:self->_dataType];
    [v3 setObject:v5 forKey:@"dataType"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v6 = [NSNumber numberWithLongLong:self->_count];
    [v3 setObject:v6 forKey:@"count"];
  }
  if ([(NSMutableArray *)self->_samples count])
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_samples, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    objc_super v8 = self->_samples;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (void)v18);
          [v7 addObject:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKey:@"samples"];
  }
  char v14 = (char)self->_has;
  if ((v14 & 4) != 0)
  {
    v15 = [NSNumber numberWithLongLong:self->_latestSupportedVersion];
    [v3 setObject:v15 forKey:@"latestSupportedVersion"];

    char v14 = (char)self->_has;
  }
  if ((v14 & 8) != 0)
  {
    v16 = [NSNumber numberWithLongLong:self->_minimumSupportedVersion];
    [v3 setObject:v16 forKey:@"minimumSupportedVersion"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableNotificationDataSourceQueryDataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteInt64Field();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v6 = self->_samples;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  char v11 = (char)self->_has;
  if ((v11 & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    char v11 = (char)self->_has;
  }
  if ((v11 & 8) != 0) {
    PBDataWriterWriteInt64Field();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = self->_dataType;
    *((unsigned char *)v4 + 48) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[1] = self->_count;
    *((unsigned char *)v4 + 48) |= 1u;
  }
  id v11 = v4;
  if ([(HKCodableNotificationDataSourceQueryData *)self samplesCount])
  {
    [v11 clearSamples];
    unint64_t v6 = [(HKCodableNotificationDataSourceQueryData *)self samplesCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(HKCodableNotificationDataSourceQueryData *)self samplesAtIndex:i];
        [v11 addSamples:v9];
      }
    }
  }
  char v10 = (char)self->_has;
  if ((v10 & 4) != 0)
  {
    *((void *)v11 + 3) = self->_latestSupportedVersion;
    *((unsigned char *)v11 + 48) |= 4u;
    char v10 = (char)self->_has;
  }
  if ((v10 & 8) != 0)
  {
    *((void *)v11 + 4) = self->_minimumSupportedVersion;
    *((unsigned char *)v11 + 48) |= 8u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_dataType;
    *(unsigned char *)(v5 + 48) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(void *)(v5 + 8) = self->_count;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = self->_samples;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "copyWithZone:", a3, (void)v16);
        [(id)v6 addSamples:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  char v14 = (char)self->_has;
  if ((v14 & 4) != 0)
  {
    *(void *)(v6 + 24) = self->_latestSupportedVersion;
    *(unsigned char *)(v6 + 48) |= 4u;
    char v14 = (char)self->_has;
  }
  if ((v14 & 8) != 0)
  {
    *(void *)(v6 + 32) = self->_minimumSupportedVersion;
    *(unsigned char *)(v6 + 48) |= 8u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_dataType != *((void *)v4 + 2)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
    goto LABEL_24;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_count != *((void *)v4 + 1)) {
      goto LABEL_24;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
    goto LABEL_24;
  }
  samples = self->_samples;
  if ((unint64_t)samples | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](samples, "isEqual:"))
    {
LABEL_24:
      BOOL v7 = 0;
      goto LABEL_25;
    }
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 4) == 0 || self->_latestSupportedVersion != *((void *)v4 + 3)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 4) != 0)
  {
    goto LABEL_24;
  }
  BOOL v7 = (*((unsigned char *)v4 + 48) & 8) == 0;
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 8) == 0 || self->_minimumSupportedVersion != *((void *)v4 + 4)) {
      goto LABEL_24;
    }
    BOOL v7 = 1;
  }
LABEL_25:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_dataType;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_has)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_count;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  uint64_t v5 = [(NSMutableArray *)self->_samples hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v6 = 2654435761 * self->_latestSupportedVersion;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_8;
    }
LABEL_10:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v6 ^ v7 ^ v5;
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_10;
  }
LABEL_8:
  uint64_t v7 = 2654435761 * self->_minimumSupportedVersion;
  return v4 ^ v3 ^ v6 ^ v7 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  char v6 = *((unsigned char *)v4 + 48);
  if ((v6 & 2) != 0)
  {
    self->_dataType = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v6 = *((unsigned char *)v4 + 48);
  }
  if (v6)
  {
    self->_count = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = *((id *)v4 + 5);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        -[HKCodableNotificationDataSourceQueryData addSamples:](self, "addSamples:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  char v12 = *((unsigned char *)v5 + 48);
  if ((v12 & 4) != 0)
  {
    self->_latestSupportedVersion = *((void *)v5 + 3);
    *(unsigned char *)&self->_has |= 4u;
    char v12 = *((unsigned char *)v5 + 48);
  }
  if ((v12 & 8) != 0)
  {
    self->_minimumSupportedVersion = *((void *)v5 + 4);
    *(unsigned char *)&self->_has |= 8u;
  }
}

- (int64_t)dataType
{
  return self->_dataType;
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

- (int64_t)latestSupportedVersion
{
  return self->_latestSupportedVersion;
}

- (int64_t)minimumSupportedVersion
{
  return self->_minimumSupportedVersion;
}

- (void).cxx_destruct
{
}

@end