@interface HDCodableOntologyLocalizedEducationContent
+ (Class)sectionsType;
- (BOOL)deleted;
- (BOOL)hasDeleted;
- (BOOL)hasTimestamp;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)sections;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)sectionsAtIndex:(unint64_t)a3;
- (int64_t)version;
- (unint64_t)hash;
- (unint64_t)sectionsCount;
- (void)addSections:(id)a3;
- (void)clearSections;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDeleted:(BOOL)a3;
- (void)setHasDeleted:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setSections:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)setVersion:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableOntologyLocalizedEducationContent

- (void)clearSections
{
}

- (void)addSections:(id)a3
{
  id v4 = a3;
  sections = self->_sections;
  id v8 = v4;
  if (!sections)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_sections;
    self->_sections = v6;

    id v4 = v8;
    sections = self->_sections;
  }
  [(NSMutableArray *)sections addObject:v4];
}

- (unint64_t)sectionsCount
{
  return [(NSMutableArray *)self->_sections count];
}

- (id)sectionsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_sections objectAtIndex:a3];
}

+ (Class)sectionsType
{
  return (Class)objc_opt_class();
}

- (void)setVersion:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasVersion
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDeleted:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_deleted = a3;
}

- (void)setHasDeleted:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDeleted
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableOntologyLocalizedEducationContent;
  id v4 = [(HDCodableOntologyLocalizedEducationContent *)&v8 description];
  v5 = [(HDCodableOntologyLocalizedEducationContent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSMutableArray *)self->_sections count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_sections, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v5 = self->_sections;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (void)v16);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"sections"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v14 = [NSNumber numberWithLongLong:self->_version];
    [v3 setObject:v14 forKey:@"version"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_12:
      if ((has & 4) == 0) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_12;
  }
  v15 = objc_msgSend(NSNumber, "numberWithDouble:", self->_timestamp, (void)v16);
  [v3 setObject:v15 forKey:@"timestamp"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_13:
    v12 = objc_msgSend(NSNumber, "numberWithBool:", self->_deleted, (void)v16);
    [v3 setObject:v12 forKey:@"deleted"];
  }
LABEL_14:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableOntologyLocalizedEducationContentReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = self->_sections;
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
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_10;
    }
LABEL_14:
    PBDataWriterWriteDoubleField();
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  PBDataWriterWriteInt64Field();
  char has = (char)self->_has;
  if (has) {
    goto LABEL_14;
  }
LABEL_10:
  if ((has & 4) != 0) {
LABEL_11:
  }
    PBDataWriterWriteBOOLField();
LABEL_12:
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  if ([(HDCodableOntologyLocalizedEducationContent *)self sectionsCount])
  {
    [v9 clearSections];
    unint64_t v4 = [(HDCodableOntologyLocalizedEducationContent *)self sectionsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(HDCodableOntologyLocalizedEducationContent *)self sectionsAtIndex:i];
        [v9 addSections:v7];
      }
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)v9 + 2) = self->_version;
    *((unsigned char *)v9 + 36) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_7;
  }
  *((void *)v9 + 1) = *(void *)&self->_timestamp;
  *((unsigned char *)v9 + 36) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_8:
    *((unsigned char *)v9 + 32) = self->_deleted;
    *((unsigned char *)v9 + 36) |= 4u;
  }
LABEL_9:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = self->_sections;
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
        [(id)v5 addSections:v11];
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_10;
    }
LABEL_14:
    *(double *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 36) |= 1u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return (id)v5;
    }
    goto LABEL_11;
  }
  *(void *)(v5 + 16) = self->_version;
  *(unsigned char *)(v5 + 36) |= 2u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_14;
  }
LABEL_10:
  if ((has & 4) != 0)
  {
LABEL_11:
    *(unsigned char *)(v5 + 32) = self->_deleted;
    *(unsigned char *)(v5 + 36) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  sections = self->_sections;
  if ((unint64_t)sections | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](sections, "isEqual:")) {
      goto LABEL_16;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_version != *((void *)v4 + 2)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_16;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_timestamp != *((double *)v4 + 1)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_16;
  }
  BOOL v6 = (*((unsigned char *)v4 + 36) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) == 0)
    {
LABEL_16:
      BOOL v6 = 0;
      goto LABEL_17;
    }
    if (self->_deleted)
    {
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_16;
      }
    }
    else if (*((unsigned char *)v4 + 32))
    {
      goto LABEL_16;
    }
    BOOL v6 = 1;
  }
LABEL_17:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_sections hash];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t v5 = 2654435761 * self->_version;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v10 = 0;
    goto LABEL_11;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double timestamp = self->_timestamp;
  double v7 = -timestamp;
  if (timestamp >= 0.0) {
    double v7 = self->_timestamp;
  }
  long double v8 = floor(v7 + 0.5);
  double v9 = (v7 - v8) * 1.84467441e19;
  unint64_t v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0) {
      v10 += (unint64_t)v9;
    }
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
LABEL_11:
  if ((has & 4) != 0) {
    uint64_t v11 = 2654435761 * self->_deleted;
  }
  else {
    uint64_t v11 = 0;
  }
  return v5 ^ v3 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = *((id *)v4 + 3);
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
        -[HDCodableOntologyLocalizedEducationContent addSections:](self, "addSections:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  char v10 = *((unsigned char *)v4 + 36);
  if ((v10 & 2) == 0)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0) {
      goto LABEL_10;
    }
LABEL_14:
    self->_double timestamp = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    if ((*((unsigned char *)v4 + 36) & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  self->_version = *((void *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v10 = *((unsigned char *)v4 + 36);
  if (v10) {
    goto LABEL_14;
  }
LABEL_10:
  if ((v10 & 4) != 0)
  {
LABEL_11:
    self->_deleted = *((unsigned char *)v4 + 32);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_12:
}

- (NSMutableArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
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