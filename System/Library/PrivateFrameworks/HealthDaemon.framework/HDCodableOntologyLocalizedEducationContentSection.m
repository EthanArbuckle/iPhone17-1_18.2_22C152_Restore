@interface HDCodableOntologyLocalizedEducationContentSection
+ (Class)sectionDataType;
- (BOOL)hasSectionType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)sectionDatas;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)sectionDataAtIndex:(unint64_t)a3;
- (int64_t)sectionType;
- (unint64_t)hash;
- (unint64_t)sectionDatasCount;
- (void)addSectionData:(id)a3;
- (void)clearSectionDatas;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasSectionType:(BOOL)a3;
- (void)setSectionDatas:(id)a3;
- (void)setSectionType:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableOntologyLocalizedEducationContentSection

- (void)setSectionType:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_sectionType = a3;
}

- (void)setHasSectionType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSectionType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearSectionDatas
{
}

- (void)addSectionData:(id)a3
{
  id v4 = a3;
  sectionDatas = self->_sectionDatas;
  id v8 = v4;
  if (!sectionDatas)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_sectionDatas;
    self->_sectionDatas = v6;

    id v4 = v8;
    sectionDatas = self->_sectionDatas;
  }
  [(NSMutableArray *)sectionDatas addObject:v4];
}

- (unint64_t)sectionDatasCount
{
  return [(NSMutableArray *)self->_sectionDatas count];
}

- (id)sectionDataAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_sectionDatas objectAtIndex:a3];
}

+ (Class)sectionDataType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableOntologyLocalizedEducationContentSection;
  id v4 = [(HDCodableOntologyLocalizedEducationContentSection *)&v8 description];
  v5 = [(HDCodableOntologyLocalizedEducationContentSection *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithLongLong:self->_sectionType];
    [v3 setObject:v4 forKey:@"sectionType"];
  }
  if ([(NSMutableArray *)self->_sectionDatas count])
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_sectionDatas, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v6 = self->_sectionDatas;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "dictionaryRepresentation", (void)v13);
          [v5 addObject:v11];
        }
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    [v3 setObject:v5 forKey:@"sectionData"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableOntologyLocalizedEducationContentSectionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_sectionDatas;
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
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_sectionType;
    *((unsigned char *)v4 + 24) |= 1u;
  }
  id v9 = v4;
  if ([(HDCodableOntologyLocalizedEducationContentSection *)self sectionDatasCount])
  {
    [v9 clearSectionDatas];
    unint64_t v5 = [(HDCodableOntologyLocalizedEducationContentSection *)self sectionDatasCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(HDCodableOntologyLocalizedEducationContentSection *)self sectionDataAtIndex:i];
        [v9 addSectionData:v8];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_sectionType;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = self->_sectionDatas;
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
        [v6 addSectionData:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_sectionType != *((void *)v4 + 1)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  sectionDatas = self->_sectionDatas;
  if ((unint64_t)sectionDatas | *((void *)v4 + 2)) {
    char v6 = -[NSMutableArray isEqual:](sectionDatas, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_sectionType;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSMutableArray *)self->_sectionDatas hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (*((unsigned char *)v4 + 24))
  {
    self->_sectionType = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v4 + 2);
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
        -[HDCodableOntologyLocalizedEducationContentSection addSectionData:](self, "addSectionData:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (int64_t)sectionType
{
  return self->_sectionType;
}

- (NSMutableArray)sectionDatas
{
  return self->_sectionDatas;
}

- (void)setSectionDatas:(id)a3
{
}

- (void).cxx_destruct
{
}

@end