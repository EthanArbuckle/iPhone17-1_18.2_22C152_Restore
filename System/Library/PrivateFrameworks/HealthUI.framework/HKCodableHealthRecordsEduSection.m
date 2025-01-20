@interface HKCodableHealthRecordsEduSection
+ (Class)sectionAttributionsType;
+ (Class)sectionCitationsType;
+ (Class)sectionLocaleIdentifiersType;
+ (Class)sectionValidRegionCodesType;
- (BOOL)hasSectionLocalizedContent;
- (BOOL)hasSectionType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)sectionAttributions;
- (NSMutableArray)sectionCitations;
- (NSMutableArray)sectionLocaleIdentifiers;
- (NSMutableArray)sectionValidRegionCodes;
- (NSString)sectionLocalizedContent;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)sectionAttributionsAtIndex:(unint64_t)a3;
- (id)sectionCitationsAtIndex:(unint64_t)a3;
- (id)sectionLocaleIdentifiersAtIndex:(unint64_t)a3;
- (id)sectionValidRegionCodesAtIndex:(unint64_t)a3;
- (int64_t)sectionType;
- (unint64_t)hash;
- (unint64_t)sectionAttributionsCount;
- (unint64_t)sectionCitationsCount;
- (unint64_t)sectionLocaleIdentifiersCount;
- (unint64_t)sectionValidRegionCodesCount;
- (void)addSectionAttributions:(id)a3;
- (void)addSectionCitations:(id)a3;
- (void)addSectionLocaleIdentifiers:(id)a3;
- (void)addSectionValidRegionCodes:(id)a3;
- (void)clearSectionAttributions;
- (void)clearSectionCitations;
- (void)clearSectionLocaleIdentifiers;
- (void)clearSectionValidRegionCodes;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasSectionType:(BOOL)a3;
- (void)setSectionAttributions:(id)a3;
- (void)setSectionCitations:(id)a3;
- (void)setSectionLocaleIdentifiers:(id)a3;
- (void)setSectionLocalizedContent:(id)a3;
- (void)setSectionType:(int64_t)a3;
- (void)setSectionValidRegionCodes:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableHealthRecordsEduSection

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

- (BOOL)hasSectionLocalizedContent
{
  return self->_sectionLocalizedContent != 0;
}

- (void)clearSectionLocaleIdentifiers
{
}

- (void)addSectionLocaleIdentifiers:(id)a3
{
  id v4 = a3;
  sectionLocaleIdentifiers = self->_sectionLocaleIdentifiers;
  id v8 = v4;
  if (!sectionLocaleIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_sectionLocaleIdentifiers;
    self->_sectionLocaleIdentifiers = v6;

    id v4 = v8;
    sectionLocaleIdentifiers = self->_sectionLocaleIdentifiers;
  }
  [(NSMutableArray *)sectionLocaleIdentifiers addObject:v4];
}

- (unint64_t)sectionLocaleIdentifiersCount
{
  return [(NSMutableArray *)self->_sectionLocaleIdentifiers count];
}

- (id)sectionLocaleIdentifiersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_sectionLocaleIdentifiers objectAtIndex:a3];
}

+ (Class)sectionLocaleIdentifiersType
{
  return (Class)objc_opt_class();
}

- (void)clearSectionValidRegionCodes
{
}

- (void)addSectionValidRegionCodes:(id)a3
{
  id v4 = a3;
  sectionValidRegionCodes = self->_sectionValidRegionCodes;
  id v8 = v4;
  if (!sectionValidRegionCodes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_sectionValidRegionCodes;
    self->_sectionValidRegionCodes = v6;

    id v4 = v8;
    sectionValidRegionCodes = self->_sectionValidRegionCodes;
  }
  [(NSMutableArray *)sectionValidRegionCodes addObject:v4];
}

- (unint64_t)sectionValidRegionCodesCount
{
  return [(NSMutableArray *)self->_sectionValidRegionCodes count];
}

- (id)sectionValidRegionCodesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_sectionValidRegionCodes objectAtIndex:a3];
}

+ (Class)sectionValidRegionCodesType
{
  return (Class)objc_opt_class();
}

- (void)clearSectionAttributions
{
}

- (void)addSectionAttributions:(id)a3
{
  id v4 = a3;
  sectionAttributions = self->_sectionAttributions;
  id v8 = v4;
  if (!sectionAttributions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_sectionAttributions;
    self->_sectionAttributions = v6;

    id v4 = v8;
    sectionAttributions = self->_sectionAttributions;
  }
  [(NSMutableArray *)sectionAttributions addObject:v4];
}

- (unint64_t)sectionAttributionsCount
{
  return [(NSMutableArray *)self->_sectionAttributions count];
}

- (id)sectionAttributionsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_sectionAttributions objectAtIndex:a3];
}

+ (Class)sectionAttributionsType
{
  return (Class)objc_opt_class();
}

- (void)clearSectionCitations
{
}

- (void)addSectionCitations:(id)a3
{
  id v4 = a3;
  sectionCitations = self->_sectionCitations;
  id v8 = v4;
  if (!sectionCitations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_sectionCitations;
    self->_sectionCitations = v6;

    id v4 = v8;
    sectionCitations = self->_sectionCitations;
  }
  [(NSMutableArray *)sectionCitations addObject:v4];
}

- (unint64_t)sectionCitationsCount
{
  return [(NSMutableArray *)self->_sectionCitations count];
}

- (id)sectionCitationsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_sectionCitations objectAtIndex:a3];
}

+ (Class)sectionCitationsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableHealthRecordsEduSection;
  id v4 = [(HKCodableHealthRecordsEduSection *)&v8 description];
  v5 = [(HKCodableHealthRecordsEduSection *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithLongLong:self->_sectionType];
    [v3 setObject:v4 forKey:@"sectionType"];
  }
  sectionLocalizedContent = self->_sectionLocalizedContent;
  if (sectionLocalizedContent) {
    [v3 setObject:sectionLocalizedContent forKey:@"sectionLocalizedContent"];
  }
  sectionLocaleIdentifiers = self->_sectionLocaleIdentifiers;
  if (sectionLocaleIdentifiers) {
    [v3 setObject:sectionLocaleIdentifiers forKey:@"sectionLocaleIdentifiers"];
  }
  sectionValidRegionCodes = self->_sectionValidRegionCodes;
  if (sectionValidRegionCodes) {
    [v3 setObject:sectionValidRegionCodes forKey:@"sectionValidRegionCodes"];
  }
  sectionAttributions = self->_sectionAttributions;
  if (sectionAttributions) {
    [v3 setObject:sectionAttributions forKey:@"sectionAttributions"];
  }
  sectionCitations = self->_sectionCitations;
  if (sectionCitations) {
    [v3 setObject:sectionCitations forKey:@"sectionCitations"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableHealthRecordsEduSectionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_sectionLocalizedContent) {
    PBDataWriterWriteStringField();
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v5 = self->_sectionLocaleIdentifiers;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v38;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v7);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v10 = self->_sectionValidRegionCodes;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v34;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v12);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v15 = self->_sectionAttributions;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v30;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteStringField();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
    }
    while (v17);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v20 = self->_sectionCitations;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v26;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteStringField();
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
    }
    while (v22);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_sectionType;
    *((unsigned char *)v4 + 56) |= 1u;
  }
  id v21 = v4;
  if (self->_sectionLocalizedContent) {
    objc_msgSend(v4, "setSectionLocalizedContent:");
  }
  if ([(HKCodableHealthRecordsEduSection *)self sectionLocaleIdentifiersCount])
  {
    [v21 clearSectionLocaleIdentifiers];
    unint64_t v5 = [(HKCodableHealthRecordsEduSection *)self sectionLocaleIdentifiersCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(HKCodableHealthRecordsEduSection *)self sectionLocaleIdentifiersAtIndex:i];
        [v21 addSectionLocaleIdentifiers:v8];
      }
    }
  }
  if ([(HKCodableHealthRecordsEduSection *)self sectionValidRegionCodesCount])
  {
    [v21 clearSectionValidRegionCodes];
    unint64_t v9 = [(HKCodableHealthRecordsEduSection *)self sectionValidRegionCodesCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(HKCodableHealthRecordsEduSection *)self sectionValidRegionCodesAtIndex:j];
        [v21 addSectionValidRegionCodes:v12];
      }
    }
  }
  if ([(HKCodableHealthRecordsEduSection *)self sectionAttributionsCount])
  {
    [v21 clearSectionAttributions];
    unint64_t v13 = [(HKCodableHealthRecordsEduSection *)self sectionAttributionsCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
      {
        uint64_t v16 = [(HKCodableHealthRecordsEduSection *)self sectionAttributionsAtIndex:k];
        [v21 addSectionAttributions:v16];
      }
    }
  }
  if ([(HKCodableHealthRecordsEduSection *)self sectionCitationsCount])
  {
    [v21 clearSectionCitations];
    unint64_t v17 = [(HKCodableHealthRecordsEduSection *)self sectionCitationsCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t m = 0; m != v18; ++m)
      {
        v20 = [(HKCodableHealthRecordsEduSection *)self sectionCitationsAtIndex:m];
        [v21 addSectionCitations:v20];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_sectionType;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_sectionLocalizedContent copyWithZone:a3];
  uint64_t v8 = (void *)v6[5];
  v6[5] = v7;

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  unint64_t v9 = self->_sectionLocaleIdentifiers;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v46 objects:v53 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v47;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v47 != v12) {
          objc_enumerationMutation(v9);
        }
        unint64_t v14 = (void *)[*(id *)(*((void *)&v46 + 1) + 8 * v13) copyWithZone:a3];
        [v6 addSectionLocaleIdentifiers:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v46 objects:v53 count:16];
    }
    while (v11);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v15 = self->_sectionValidRegionCodes;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v42 objects:v52 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v43;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v43 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = (void *)[*(id *)(*((void *)&v42 + 1) + 8 * v19) copyWithZone:a3];
        [v6 addSectionValidRegionCodes:v20];

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v42 objects:v52 count:16];
    }
    while (v17);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v21 = self->_sectionAttributions;
  uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v38 objects:v51 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v39;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v39 != v24) {
          objc_enumerationMutation(v21);
        }
        long long v26 = (void *)[*(id *)(*((void *)&v38 + 1) + 8 * v25) copyWithZone:a3];
        [v6 addSectionAttributions:v26];

        ++v25;
      }
      while (v23 != v25);
      uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v38 objects:v51 count:16];
    }
    while (v23);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v27 = self->_sectionCitations;
  uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v34 objects:v50 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v35;
    do
    {
      uint64_t v31 = 0;
      do
      {
        if (*(void *)v35 != v30) {
          objc_enumerationMutation(v27);
        }
        long long v32 = objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * v31), "copyWithZone:", a3, (void)v34);
        [v6 addSectionCitations:v32];

        ++v31;
      }
      while (v29 != v31);
      uint64_t v29 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v34 objects:v50 count:16];
    }
    while (v29);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_sectionType != *((void *)v4 + 1)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_17:
    char v10 = 0;
    goto LABEL_18;
  }
  sectionLocalizedContent = self->_sectionLocalizedContent;
  if ((unint64_t)sectionLocalizedContent | *((void *)v4 + 5)
    && !-[NSString isEqual:](sectionLocalizedContent, "isEqual:"))
  {
    goto LABEL_17;
  }
  sectionLocaleIdentifiers = self->_sectionLocaleIdentifiers;
  if ((unint64_t)sectionLocaleIdentifiers | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](sectionLocaleIdentifiers, "isEqual:")) {
      goto LABEL_17;
    }
  }
  sectionValidRegionCodes = self->_sectionValidRegionCodes;
  if ((unint64_t)sectionValidRegionCodes | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](sectionValidRegionCodes, "isEqual:")) {
      goto LABEL_17;
    }
  }
  sectionAttributions = self->_sectionAttributions;
  if ((unint64_t)sectionAttributions | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](sectionAttributions, "isEqual:")) {
      goto LABEL_17;
    }
  }
  sectionCitations = self->_sectionCitations;
  if ((unint64_t)sectionCitations | *((void *)v4 + 3)) {
    char v10 = -[NSMutableArray isEqual:](sectionCitations, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_sectionType;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_sectionLocalizedContent hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_sectionLocaleIdentifiers hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_sectionValidRegionCodes hash];
  uint64_t v7 = [(NSMutableArray *)self->_sectionAttributions hash];
  return v6 ^ v7 ^ [(NSMutableArray *)self->_sectionCitations hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (id *)v4;
  if (*((unsigned char *)v4 + 56))
  {
    self->_sectionType = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 5)) {
    -[HKCodableHealthRecordsEduSection setSectionLocalizedContent:](self, "setSectionLocalizedContent:");
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v6 = v5[4];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v38 objects:v45 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v39 != v9) {
          objc_enumerationMutation(v6);
        }
        [(HKCodableHealthRecordsEduSection *)self addSectionLocaleIdentifiers:*(void *)(*((void *)&v38 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v38 objects:v45 count:16];
    }
    while (v8);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v11 = v5[6];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v34 objects:v44 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v35 != v14) {
          objc_enumerationMutation(v11);
        }
        [(HKCodableHealthRecordsEduSection *)self addSectionValidRegionCodes:*(void *)(*((void *)&v34 + 1) + 8 * j)];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v34 objects:v44 count:16];
    }
    while (v13);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v16 = v5[2];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v43 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v31;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v31 != v19) {
          objc_enumerationMutation(v16);
        }
        [(HKCodableHealthRecordsEduSection *)self addSectionAttributions:*(void *)(*((void *)&v30 + 1) + 8 * k)];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v43 count:16];
    }
    while (v18);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v21 = v5[3];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v26 objects:v42 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v27;
    do
    {
      for (uint64_t m = 0; m != v23; ++m)
      {
        if (*(void *)v27 != v24) {
          objc_enumerationMutation(v21);
        }
        -[HKCodableHealthRecordsEduSection addSectionCitations:](self, "addSectionCitations:", *(void *)(*((void *)&v26 + 1) + 8 * m), (void)v26);
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v26 objects:v42 count:16];
    }
    while (v23);
  }
}

- (int64_t)sectionType
{
  return self->_sectionType;
}

- (NSString)sectionLocalizedContent
{
  return self->_sectionLocalizedContent;
}

- (void)setSectionLocalizedContent:(id)a3
{
}

- (NSMutableArray)sectionLocaleIdentifiers
{
  return self->_sectionLocaleIdentifiers;
}

- (void)setSectionLocaleIdentifiers:(id)a3
{
}

- (NSMutableArray)sectionValidRegionCodes
{
  return self->_sectionValidRegionCodes;
}

- (void)setSectionValidRegionCodes:(id)a3
{
}

- (NSMutableArray)sectionAttributions
{
  return self->_sectionAttributions;
}

- (void)setSectionAttributions:(id)a3
{
}

- (NSMutableArray)sectionCitations
{
  return self->_sectionCitations;
}

- (void)setSectionCitations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionValidRegionCodes, 0);
  objc_storeStrong((id *)&self->_sectionLocalizedContent, 0);
  objc_storeStrong((id *)&self->_sectionLocaleIdentifiers, 0);
  objc_storeStrong((id *)&self->_sectionCitations, 0);
  objc_storeStrong((id *)&self->_sectionAttributions, 0);
}

@end