@interface HKCodableHealthRecordsLocalizedEducationContentSection
+ (Class)sectionAttributionsType;
+ (Class)sectionCitationsType;
+ (Class)sectionValidRegionCodesType;
- (BOOL)hasSectionLocaleIdentifier;
- (BOOL)hasSectionLocalizedContent;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)sectionAttributions;
- (NSMutableArray)sectionCitations;
- (NSMutableArray)sectionValidRegionCodes;
- (NSString)sectionLocaleIdentifier;
- (NSString)sectionLocalizedContent;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)sectionAttributionsAtIndex:(unint64_t)a3;
- (id)sectionCitationsAtIndex:(unint64_t)a3;
- (id)sectionValidRegionCodesAtIndex:(unint64_t)a3;
- (int64_t)type;
- (unint64_t)hash;
- (unint64_t)sectionAttributionsCount;
- (unint64_t)sectionCitationsCount;
- (unint64_t)sectionValidRegionCodesCount;
- (void)addSectionAttributions:(id)a3;
- (void)addSectionCitations:(id)a3;
- (void)addSectionValidRegionCodes:(id)a3;
- (void)clearSectionAttributions;
- (void)clearSectionCitations;
- (void)clearSectionValidRegionCodes;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setSectionAttributions:(id)a3;
- (void)setSectionCitations:(id)a3;
- (void)setSectionLocaleIdentifier:(id)a3;
- (void)setSectionLocalizedContent:(id)a3;
- (void)setSectionValidRegionCodes:(id)a3;
- (void)setType:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableHealthRecordsLocalizedEducationContentSection

- (void)setType:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasSectionLocalizedContent
{
  return self->_sectionLocalizedContent != 0;
}

- (BOOL)hasSectionLocaleIdentifier
{
  return self->_sectionLocaleIdentifier != 0;
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
  v8.super_class = (Class)HKCodableHealthRecordsLocalizedEducationContentSection;
  id v4 = [(HKCodableHealthRecordsLocalizedEducationContentSection *)&v8 description];
  v5 = [(HKCodableHealthRecordsLocalizedEducationContentSection *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithLongLong:self->_type];
    [v3 setObject:v4 forKey:@"type"];
  }
  sectionLocalizedContent = self->_sectionLocalizedContent;
  if (sectionLocalizedContent) {
    [v3 setObject:sectionLocalizedContent forKey:@"sectionLocalizedContent"];
  }
  sectionLocaleIdentifier = self->_sectionLocaleIdentifier;
  if (sectionLocaleIdentifier) {
    [v3 setObject:sectionLocaleIdentifier forKey:@"sectionLocaleIdentifier"];
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
  return HKCodableHealthRecordsLocalizedEducationContentSectionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_sectionLocalizedContent) {
    PBDataWriterWriteStringField();
  }
  if (self->_sectionLocaleIdentifier) {
    PBDataWriterWriteStringField();
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v5 = self->_sectionValidRegionCodes;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v10 = self->_sectionAttributions;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v15 = self->_sectionCitations;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteStringField();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_type;
    *((unsigned char *)v4 + 56) |= 1u;
  }
  id v17 = v4;
  if (self->_sectionLocalizedContent) {
    objc_msgSend(v4, "setSectionLocalizedContent:");
  }
  if (self->_sectionLocaleIdentifier) {
    objc_msgSend(v17, "setSectionLocaleIdentifier:");
  }
  if ([(HKCodableHealthRecordsLocalizedEducationContentSection *)self sectionValidRegionCodesCount])
  {
    [v17 clearSectionValidRegionCodes];
    unint64_t v5 = [(HKCodableHealthRecordsLocalizedEducationContentSection *)self sectionValidRegionCodesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(HKCodableHealthRecordsLocalizedEducationContentSection *)self sectionValidRegionCodesAtIndex:i];
        [v17 addSectionValidRegionCodes:v8];
      }
    }
  }
  if ([(HKCodableHealthRecordsLocalizedEducationContentSection *)self sectionAttributionsCount])
  {
    [v17 clearSectionAttributions];
    unint64_t v9 = [(HKCodableHealthRecordsLocalizedEducationContentSection *)self sectionAttributionsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(HKCodableHealthRecordsLocalizedEducationContentSection *)self sectionAttributionsAtIndex:j];
        [v17 addSectionAttributions:v12];
      }
    }
  }
  if ([(HKCodableHealthRecordsLocalizedEducationContentSection *)self sectionCitationsCount])
  {
    [v17 clearSectionCitations];
    unint64_t v13 = [(HKCodableHealthRecordsLocalizedEducationContentSection *)self sectionCitationsCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
      {
        uint64_t v16 = [(HKCodableHealthRecordsLocalizedEducationContentSection *)self sectionCitationsAtIndex:k];
        [v17 addSectionCitations:v16];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_type;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_sectionLocalizedContent copyWithZone:a3];
  uint64_t v8 = (void *)v6[5];
  v6[5] = v7;

  uint64_t v9 = [(NSString *)self->_sectionLocaleIdentifier copyWithZone:a3];
  unint64_t v10 = (void *)v6[4];
  v6[4] = v9;

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v11 = self->_sectionValidRegionCodes;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v39;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v39 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = (void *)[*(id *)(*((void *)&v38 + 1) + 8 * v15) copyWithZone:a3];
        [v6 addSectionValidRegionCodes:v16];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v38 objects:v44 count:16];
    }
    while (v13);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v17 = self->_sectionAttributions;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v35;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v35 != v20) {
          objc_enumerationMutation(v17);
        }
        long long v22 = (void *)[*(id *)(*((void *)&v34 + 1) + 8 * v21) copyWithZone:a3];
        [v6 addSectionAttributions:v22];

        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v34 objects:v43 count:16];
    }
    while (v19);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v23 = self->_sectionCitations;
  uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v30 objects:v42 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v31;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v31 != v26) {
          objc_enumerationMutation(v23);
        }
        long long v28 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * v27), "copyWithZone:", a3, (void)v30);
        [v6 addSectionCitations:v28];

        ++v27;
      }
      while (v25 != v27);
      uint64_t v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v30 objects:v42 count:16];
    }
    while (v25);
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
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_type != *((void *)v4 + 1)) {
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
  sectionLocaleIdentifier = self->_sectionLocaleIdentifier;
  if ((unint64_t)sectionLocaleIdentifier | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](sectionLocaleIdentifier, "isEqual:")) {
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
    uint64_t v3 = 2654435761 * self->_type;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_sectionLocalizedContent hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_sectionLocaleIdentifier hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_sectionValidRegionCodes hash];
  uint64_t v7 = [(NSMutableArray *)self->_sectionAttributions hash];
  return v6 ^ v7 ^ [(NSMutableArray *)self->_sectionCitations hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  NSUInteger v4 = a3;
  id v5 = v4;
  if (v4[7])
  {
    self->_type = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (v4[5]) {
    -[HKCodableHealthRecordsLocalizedEducationContentSection setSectionLocalizedContent:](self, "setSectionLocalizedContent:");
  }
  if (*((void *)v5 + 4)) {
    -[HKCodableHealthRecordsLocalizedEducationContentSection setSectionLocaleIdentifier:](self, "setSectionLocaleIdentifier:");
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = *((id *)v5 + 6);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v6);
        }
        [(HKCodableHealthRecordsLocalizedEducationContentSection *)self addSectionValidRegionCodes:*(void *)(*((void *)&v29 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v8);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = *((id *)v5 + 2);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        [(HKCodableHealthRecordsLocalizedEducationContentSection *)self addSectionAttributions:*(void *)(*((void *)&v25 + 1) + 8 * j)];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v13);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v16 = *((id *)v5 + 3);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        -[HKCodableHealthRecordsLocalizedEducationContentSection addSectionCitations:](self, "addSectionCitations:", *(void *)(*((void *)&v21 + 1) + 8 * k), (void)v21);
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v18);
  }
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)sectionLocalizedContent
{
  return self->_sectionLocalizedContent;
}

- (void)setSectionLocalizedContent:(id)a3
{
}

- (NSString)sectionLocaleIdentifier
{
  return self->_sectionLocaleIdentifier;
}

- (void)setSectionLocaleIdentifier:(id)a3
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
  objc_storeStrong((id *)&self->_sectionLocaleIdentifier, 0);
  objc_storeStrong((id *)&self->_sectionCitations, 0);
  objc_storeStrong((id *)&self->_sectionAttributions, 0);
}

@end