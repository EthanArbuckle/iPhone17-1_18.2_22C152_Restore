@interface HDCodableSectionData
+ (Class)stringValuesType;
- (BOOL)deleted;
- (BOOL)hasDeleted;
- (BOOL)hasSectionDataType;
- (BOOL)hasTimestamp;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)stringValues;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)stringValuesAtIndex:(unint64_t)a3;
- (int64_t)sectionDataType;
- (int64_t)version;
- (unint64_t)hash;
- (unint64_t)stringValuesCount;
- (void)addStringValues:(id)a3;
- (void)clearStringValues;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDeleted:(BOOL)a3;
- (void)setHasDeleted:(BOOL)a3;
- (void)setHasSectionDataType:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setSectionDataType:(int64_t)a3;
- (void)setStringValues:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)setVersion:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableSectionData

- (void)clearStringValues
{
}

- (void)addStringValues:(id)a3
{
  id v4 = a3;
  stringValues = self->_stringValues;
  id v8 = v4;
  if (!stringValues)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_stringValues;
    self->_stringValues = v6;

    id v4 = v8;
    stringValues = self->_stringValues;
  }
  [(NSMutableArray *)stringValues addObject:v4];
}

- (unint64_t)stringValuesCount
{
  return [(NSMutableArray *)self->_stringValues count];
}

- (id)stringValuesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_stringValues objectAtIndex:a3];
}

+ (Class)stringValuesType
{
  return (Class)objc_opt_class();
}

- (void)setSectionDataType:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_sectionDataType = a3;
}

- (void)setHasSectionDataType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSectionDataType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setVersion:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasVersion
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDeleted:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_deleted = a3;
}

- (void)setHasDeleted:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDeleted
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableSectionData;
  id v4 = [(HDCodableSectionData *)&v8 description];
  v5 = [(HDCodableSectionData *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  stringValues = self->_stringValues;
  if (stringValues) {
    [v3 setObject:stringValues forKey:@"stringValues"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v9 = [NSNumber numberWithLongLong:self->_sectionDataType];
    [v4 setObject:v9 forKey:@"sectionDataType"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  v10 = [NSNumber numberWithLongLong:self->_version];
  [v4 setObject:v10 forKey:@"version"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_13:
  v11 = [NSNumber numberWithDouble:self->_timestamp];
  [v4 setObject:v11 forKey:@"timestamp"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_7:
    v7 = [NSNumber numberWithBool:self->_deleted];
    [v4 setObject:v7 forKey:@"deleted"];
  }
LABEL_8:

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableSectionDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = self->_stringValues;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt64Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_10:
      if ((has & 2) == 0) {
        goto LABEL_11;
      }
LABEL_16:
      PBDataWriterWriteDoubleField();
      if ((*(unsigned char *)&self->_has & 8) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_10;
  }
  PBDataWriterWriteInt64Field();
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_16;
  }
LABEL_11:
  if ((has & 8) != 0) {
LABEL_12:
  }
    PBDataWriterWriteBOOLField();
LABEL_13:
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  if ([(HDCodableSectionData *)self stringValuesCount])
  {
    [v9 clearStringValues];
    unint64_t v4 = [(HDCodableSectionData *)self stringValuesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(HDCodableSectionData *)self stringValuesAtIndex:i];
        [v9 addStringValues:v7];
      }
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v9 + 1) = self->_sectionDataType;
    *((unsigned char *)v9 + 44) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 2) == 0) {
        goto LABEL_8;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  *((void *)v9 + 3) = self->_version;
  *((unsigned char *)v9 + 44) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_15:
  *((void *)v9 + 2) = *(void *)&self->_timestamp;
  *((unsigned char *)v9 + 44) |= 2u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_9:
    *((unsigned char *)v9 + 40) = self->_deleted;
    *((unsigned char *)v9 + 44) |= 8u;
  }
LABEL_10:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = self->_stringValues;
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
        long long v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "copyWithZone:", a3, (void)v14);
        [(id)v5 addStringValues:v11];
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_sectionDataType;
    *(unsigned char *)(v5 + 44) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_10:
      if ((has & 2) == 0) {
        goto LABEL_11;
      }
LABEL_16:
      *(double *)(v5 + 16) = self->_timestamp;
      *(unsigned char *)(v5 + 44) |= 2u;
      if ((*(unsigned char *)&self->_has & 8) == 0) {
        return (id)v5;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_10;
  }
  *(void *)(v5 + 24) = self->_version;
  *(unsigned char *)(v5 + 44) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_16;
  }
LABEL_11:
  if ((has & 8) != 0)
  {
LABEL_12:
    *(unsigned char *)(v5 + 40) = self->_deleted;
    *(unsigned char *)(v5 + 44) |= 8u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  stringValues = self->_stringValues;
  if ((unint64_t)stringValues | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](stringValues, "isEqual:")) {
      goto LABEL_21;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_sectionDataType != *((void *)v4 + 1)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 4) == 0 || self->_version != *((void *)v4 + 3)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 4) != 0)
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0 || self->_timestamp != *((double *)v4 + 2)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
    goto LABEL_21;
  }
  BOOL v6 = (*((unsigned char *)v4 + 44) & 8) == 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 8) == 0)
    {
LABEL_21:
      BOOL v6 = 0;
      goto LABEL_22;
    }
    if (self->_deleted)
    {
      if (!*((unsigned char *)v4 + 40)) {
        goto LABEL_21;
      }
    }
    else if (*((unsigned char *)v4 + 40))
    {
      goto LABEL_21;
    }
    BOOL v6 = 1;
  }
LABEL_22:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_stringValues hash];
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_4;
    }
LABEL_10:
    unint64_t v11 = 0;
    goto LABEL_13;
  }
  uint64_t v5 = 2654435761 * self->_sectionDataType;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_9;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_version;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_10;
  }
LABEL_4:
  double timestamp = self->_timestamp;
  double v8 = -timestamp;
  if (timestamp >= 0.0) {
    double v8 = self->_timestamp;
  }
  long double v9 = floor(v8 + 0.5);
  double v10 = (v8 - v9) * 1.84467441e19;
  unint64_t v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0) {
      v11 += (unint64_t)v10;
    }
  }
  else
  {
    v11 -= (unint64_t)fabs(v10);
  }
LABEL_13:
  if ((has & 8) != 0) {
    uint64_t v12 = 2654435761 * self->_deleted;
  }
  else {
    uint64_t v12 = 0;
  }
  return v5 ^ v3 ^ v6 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = *((id *)v4 + 4);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        -[HDCodableSectionData addStringValues:](self, "addStringValues:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  char v10 = *((unsigned char *)v4 + 44);
  if (v10)
  {
    self->_sectionDataType = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v10 = *((unsigned char *)v4 + 44);
    if ((v10 & 4) == 0)
    {
LABEL_10:
      if ((v10 & 2) == 0) {
        goto LABEL_11;
      }
LABEL_16:
      self->_double timestamp = *((double *)v4 + 2);
      *(unsigned char *)&self->_has |= 2u;
      if ((*((unsigned char *)v4 + 44) & 8) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 4) == 0)
  {
    goto LABEL_10;
  }
  self->_version = *((void *)v4 + 3);
  *(unsigned char *)&self->_has |= 4u;
  char v10 = *((unsigned char *)v4 + 44);
  if ((v10 & 2) != 0) {
    goto LABEL_16;
  }
LABEL_11:
  if ((v10 & 8) != 0)
  {
LABEL_12:
    self->_deleted = *((unsigned char *)v4 + 40);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_13:
}

- (NSMutableArray)stringValues
{
  return self->_stringValues;
}

- (void)setStringValues:(id)a3
{
}

- (int64_t)sectionDataType
{
  return self->_sectionDataType;
}

- (int64_t)version
{
  return self->_version;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (BOOL)deleted
{
  return self->_deleted;
}

- (void).cxx_destruct
{
}

@end