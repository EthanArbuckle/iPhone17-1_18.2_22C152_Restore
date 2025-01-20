@interface HKCodableHealthRecordsSharableViewModel
+ (Class)allRecordsType;
- (BOOL)hasCategory;
- (BOOL)hasConceptIdentifier;
- (BOOL)hasEduContent;
- (BOOL)hasIsPinned;
- (BOOL)hasLatestRecord;
- (BOOL)hasLatestSupportedVersion;
- (BOOL)hasLocalizedEducationContent;
- (BOOL)hasMinimumSupportedVersion;
- (BOOL)hasPreferredName;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPinned;
- (BOOL)readFrom:(id)a3;
- (HKCodableHealthRecordsEduContent)eduContent;
- (HKCodableHealthRecordsIndividualRecord)latestRecord;
- (HKCodableHealthRecordsLocalizedEducationContent)localizedEducationContent;
- (NSMutableArray)allRecords;
- (NSString)conceptIdentifier;
- (NSString)preferredName;
- (id)allRecordsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)category;
- (int64_t)latestSupportedVersion;
- (int64_t)minimumSupportedVersion;
- (unint64_t)allRecordsCount;
- (unint64_t)hash;
- (void)addAllRecords:(id)a3;
- (void)clearAllRecords;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAllRecords:(id)a3;
- (void)setCategory:(int64_t)a3;
- (void)setConceptIdentifier:(id)a3;
- (void)setEduContent:(id)a3;
- (void)setHasCategory:(BOOL)a3;
- (void)setHasIsPinned:(BOOL)a3;
- (void)setHasLatestSupportedVersion:(BOOL)a3;
- (void)setHasMinimumSupportedVersion:(BOOL)a3;
- (void)setIsPinned:(BOOL)a3;
- (void)setLatestRecord:(id)a3;
- (void)setLatestSupportedVersion:(int64_t)a3;
- (void)setLocalizedEducationContent:(id)a3;
- (void)setMinimumSupportedVersion:(int64_t)a3;
- (void)setPreferredName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableHealthRecordsSharableViewModel

- (BOOL)hasConceptIdentifier
{
  return self->_conceptIdentifier != 0;
}

- (void)setCategory:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_category = a3;
}

- (void)setHasCategory:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCategory
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasPreferredName
{
  return self->_preferredName != 0;
}

- (BOOL)hasEduContent
{
  return self->_eduContent != 0;
}

- (void)setIsPinned:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_isPinned = a3;
}

- (void)setHasIsPinned:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsPinned
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasLocalizedEducationContent
{
  return self->_localizedEducationContent != 0;
}

- (BOOL)hasLatestRecord
{
  return self->_latestRecord != 0;
}

- (void)clearAllRecords
{
}

- (void)addAllRecords:(id)a3
{
  id v4 = a3;
  allRecords = self->_allRecords;
  id v8 = v4;
  if (!allRecords)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_allRecords;
    self->_allRecords = v6;

    id v4 = v8;
    allRecords = self->_allRecords;
  }
  [(NSMutableArray *)allRecords addObject:v4];
}

- (unint64_t)allRecordsCount
{
  return [(NSMutableArray *)self->_allRecords count];
}

- (id)allRecordsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_allRecords objectAtIndex:a3];
}

+ (Class)allRecordsType
{
  return (Class)objc_opt_class();
}

- (void)setLatestSupportedVersion:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_latestSupportedVersion = a3;
}

- (void)setHasLatestSupportedVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLatestSupportedVersion
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setMinimumSupportedVersion:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_minimumSupportedVersion = a3;
}

- (void)setHasMinimumSupportedVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMinimumSupportedVersion
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableHealthRecordsSharableViewModel;
  id v4 = [(HKCodableHealthRecordsSharableViewModel *)&v8 description];
  v5 = [(HKCodableHealthRecordsSharableViewModel *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  conceptIdentifier = self->_conceptIdentifier;
  if (conceptIdentifier) {
    [v3 setObject:conceptIdentifier forKey:@"conceptIdentifier"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithLongLong:self->_category];
    [v4 setObject:v6 forKey:@"category"];
  }
  preferredName = self->_preferredName;
  if (preferredName) {
    [v4 setObject:preferredName forKey:@"preferredName"];
  }
  eduContent = self->_eduContent;
  if (eduContent)
  {
    v9 = [(HKCodableHealthRecordsEduContent *)eduContent dictionaryRepresentation];
    [v4 setObject:v9 forKey:@"eduContent"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v10 = [NSNumber numberWithBool:self->_isPinned];
    [v4 setObject:v10 forKey:@"isPinned"];
  }
  localizedEducationContent = self->_localizedEducationContent;
  if (localizedEducationContent)
  {
    v12 = [(HKCodableHealthRecordsLocalizedEducationContent *)localizedEducationContent dictionaryRepresentation];
    [v4 setObject:v12 forKey:@"localizedEducationContent"];
  }
  latestRecord = self->_latestRecord;
  if (latestRecord)
  {
    v14 = [(HKCodableHealthRecordsIndividualRecord *)latestRecord dictionaryRepresentation];
    [v4 setObject:v14 forKey:@"latestRecord"];
  }
  if ([(NSMutableArray *)self->_allRecords count])
  {
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_allRecords, "count"));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v16 = self->_allRecords;
    uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v27 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * i), "dictionaryRepresentation", (void)v26);
          [v15 addObject:v21];
        }
        uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v18);
    }

    [v4 setObject:v15 forKey:@"allRecords"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v23 = [NSNumber numberWithLongLong:self->_latestSupportedVersion];
    [v4 setObject:v23 forKey:@"latestSupportedVersion"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v24 = [NSNumber numberWithLongLong:self->_minimumSupportedVersion];
    [v4 setObject:v24 forKey:@"minimumSupportedVersion"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableHealthRecordsSharableViewModelReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_conceptIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_preferredName) {
    PBDataWriterWriteStringField();
  }
  if (self->_eduContent) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_latestRecord) {
    PBDataWriterWriteSubmessage();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5 = self->_allRecords;
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
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_localizedEducationContent) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v11 = v4;
  if (self->_conceptIdentifier)
  {
    objc_msgSend(v4, "setConceptIdentifier:");
    id v4 = v11;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_category;
    *((unsigned char *)v4 + 84) |= 1u;
  }
  if (self->_preferredName)
  {
    objc_msgSend(v11, "setPreferredName:");
    id v4 = v11;
  }
  if (self->_eduContent)
  {
    objc_msgSend(v11, "setEduContent:");
    id v4 = v11;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((unsigned char *)v4 + 80) = self->_isPinned;
    *((unsigned char *)v4 + 84) |= 8u;
  }
  if (self->_latestRecord) {
    objc_msgSend(v11, "setLatestRecord:");
  }
  if ([(HKCodableHealthRecordsSharableViewModel *)self allRecordsCount])
  {
    [v11 clearAllRecords];
    unint64_t v5 = [(HKCodableHealthRecordsSharableViewModel *)self allRecordsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(HKCodableHealthRecordsSharableViewModel *)self allRecordsAtIndex:i];
        [v11 addAllRecords:v8];
      }
    }
  }
  char has = (char)self->_has;
  v10 = v11;
  if ((has & 2) != 0)
  {
    *((void *)v11 + 2) = self->_latestSupportedVersion;
    *((unsigned char *)v11 + 84) |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((void *)v11 + 3) = self->_minimumSupportedVersion;
    *((unsigned char *)v11 + 84) |= 4u;
  }
  if (self->_localizedEducationContent)
  {
    objc_msgSend(v11, "setLocalizedEducationContent:");
    v10 = v11;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_conceptIdentifier copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_category;
    *(unsigned char *)(v5 + 84) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_preferredName copyWithZone:a3];
  v9 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v8;

  id v10 = [(HKCodableHealthRecordsEduContent *)self->_eduContent copyWithZone:a3];
  id v11 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v10;

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(unsigned char *)(v5 + 80) = self->_isPinned;
    *(unsigned char *)(v5 + 84) |= 8u;
  }
  id v12 = [(HKCodableHealthRecordsIndividualRecord *)self->_latestRecord copyWithZone:a3];
  long long v13 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v12;

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v14 = self->_allRecords;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "copyWithZone:", a3, (void)v24);
        [(id)v5 addAllRecords:v19];
      }
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v16);
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_latestSupportedVersion;
    *(unsigned char *)(v5 + 84) |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_minimumSupportedVersion;
    *(unsigned char *)(v5 + 84) |= 4u;
  }
  id v21 = -[HKCodableHealthRecordsLocalizedEducationContent copyWithZone:](self->_localizedEducationContent, "copyWithZone:", a3, (void)v24);
  v22 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v21;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_37;
  }
  conceptIdentifier = self->_conceptIdentifier;
  if ((unint64_t)conceptIdentifier | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](conceptIdentifier, "isEqual:")) {
      goto LABEL_37;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 84) & 1) == 0 || self->_category != *((void *)v4 + 1)) {
      goto LABEL_37;
    }
  }
  else if (*((unsigned char *)v4 + 84))
  {
    goto LABEL_37;
  }
  preferredName = self->_preferredName;
  if ((unint64_t)preferredName | *((void *)v4 + 9)
    && !-[NSString isEqual:](preferredName, "isEqual:"))
  {
    goto LABEL_37;
  }
  eduContent = self->_eduContent;
  if ((unint64_t)eduContent | *((void *)v4 + 6))
  {
    if (!-[HKCodableHealthRecordsEduContent isEqual:](eduContent, "isEqual:")) {
      goto LABEL_37;
    }
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 84) & 8) != 0)
    {
      if (self->_isPinned)
      {
        if (!*((unsigned char *)v4 + 80)) {
          goto LABEL_37;
        }
        goto LABEL_21;
      }
      if (!*((unsigned char *)v4 + 80)) {
        goto LABEL_21;
      }
    }
LABEL_37:
    char v11 = 0;
    goto LABEL_38;
  }
  if ((*((unsigned char *)v4 + 84) & 8) != 0) {
    goto LABEL_37;
  }
LABEL_21:
  latestRecord = self->_latestRecord;
  if ((unint64_t)latestRecord | *((void *)v4 + 7)
    && !-[HKCodableHealthRecordsIndividualRecord isEqual:](latestRecord, "isEqual:"))
  {
    goto LABEL_37;
  }
  allRecords = self->_allRecords;
  if ((unint64_t)allRecords | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](allRecords, "isEqual:")) {
      goto LABEL_37;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 84) & 2) == 0 || self->_latestSupportedVersion != *((void *)v4 + 2)) {
      goto LABEL_37;
    }
  }
  else if ((*((unsigned char *)v4 + 84) & 2) != 0)
  {
    goto LABEL_37;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 84) & 4) == 0 || self->_minimumSupportedVersion != *((void *)v4 + 3)) {
      goto LABEL_37;
    }
  }
  else if ((*((unsigned char *)v4 + 84) & 4) != 0)
  {
    goto LABEL_37;
  }
  localizedEducationContent = self->_localizedEducationContent;
  if ((unint64_t)localizedEducationContent | *((void *)v4 + 8)) {
    char v11 = -[HKCodableHealthRecordsLocalizedEducationContent isEqual:](localizedEducationContent, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_38:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_conceptIdentifier hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_category;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = [(NSString *)self->_preferredName hash];
  unint64_t v6 = [(HKCodableHealthRecordsEduContent *)self->_eduContent hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v7 = 2654435761 * self->_isPinned;
  }
  else {
    uint64_t v7 = 0;
  }
  unint64_t v8 = [(HKCodableHealthRecordsIndividualRecord *)self->_latestRecord hash];
  uint64_t v9 = [(NSMutableArray *)self->_allRecords hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v10 = 2654435761 * self->_latestSupportedVersion;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_9;
    }
LABEL_11:
    uint64_t v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ [(HKCodableHealthRecordsLocalizedEducationContent *)self->_localizedEducationContent hash];
  }
  uint64_t v10 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_11;
  }
LABEL_9:
  uint64_t v11 = 2654435761 * self->_minimumSupportedVersion;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ [(HKCodableHealthRecordsLocalizedEducationContent *)self->_localizedEducationContent hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 5)) {
    -[HKCodableHealthRecordsSharableViewModel setConceptIdentifier:](self, "setConceptIdentifier:");
  }
  if (*((unsigned char *)v4 + 84))
  {
    self->_category = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 9)) {
    -[HKCodableHealthRecordsSharableViewModel setPreferredName:](self, "setPreferredName:");
  }
  eduContent = self->_eduContent;
  uint64_t v6 = *((void *)v4 + 6);
  if (eduContent)
  {
    if (v6) {
      -[HKCodableHealthRecordsEduContent mergeFrom:](eduContent, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[HKCodableHealthRecordsSharableViewModel setEduContent:](self, "setEduContent:");
  }
  if ((*((unsigned char *)v4 + 84) & 8) != 0)
  {
    self->_isPinned = *((unsigned char *)v4 + 80);
    *(unsigned char *)&self->_has |= 8u;
  }
  latestRecord = self->_latestRecord;
  uint64_t v8 = *((void *)v4 + 7);
  if (latestRecord)
  {
    if (v8) {
      -[HKCodableHealthRecordsIndividualRecord mergeFrom:](latestRecord, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[HKCodableHealthRecordsSharableViewModel setLatestRecord:](self, "setLatestRecord:");
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = *((id *)v4 + 4);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        -[HKCodableHealthRecordsSharableViewModel addAllRecords:](self, "addAllRecords:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  char v14 = *((unsigned char *)v4 + 84);
  if ((v14 & 2) != 0)
  {
    self->_latestSupportedVersion = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v14 = *((unsigned char *)v4 + 84);
  }
  if ((v14 & 4) != 0)
  {
    self->_minimumSupportedVersion = *((void *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
  }
  localizedEducationContent = self->_localizedEducationContent;
  uint64_t v16 = *((void *)v4 + 8);
  if (localizedEducationContent)
  {
    if (v16) {
      -[HKCodableHealthRecordsLocalizedEducationContent mergeFrom:](localizedEducationContent, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[HKCodableHealthRecordsSharableViewModel setLocalizedEducationContent:](self, "setLocalizedEducationContent:");
  }
}

- (NSString)conceptIdentifier
{
  return self->_conceptIdentifier;
}

- (void)setConceptIdentifier:(id)a3
{
}

- (int64_t)category
{
  return self->_category;
}

- (NSString)preferredName
{
  return self->_preferredName;
}

- (void)setPreferredName:(id)a3
{
}

- (HKCodableHealthRecordsEduContent)eduContent
{
  return self->_eduContent;
}

- (void)setEduContent:(id)a3
{
}

- (BOOL)isPinned
{
  return self->_isPinned;
}

- (HKCodableHealthRecordsLocalizedEducationContent)localizedEducationContent
{
  return self->_localizedEducationContent;
}

- (void)setLocalizedEducationContent:(id)a3
{
}

- (HKCodableHealthRecordsIndividualRecord)latestRecord
{
  return self->_latestRecord;
}

- (void)setLatestRecord:(id)a3
{
}

- (NSMutableArray)allRecords
{
  return self->_allRecords;
}

- (void)setAllRecords:(id)a3
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
  objc_storeStrong((id *)&self->_preferredName, 0);
  objc_storeStrong((id *)&self->_localizedEducationContent, 0);
  objc_storeStrong((id *)&self->_latestRecord, 0);
  objc_storeStrong((id *)&self->_eduContent, 0);
  objc_storeStrong((id *)&self->_conceptIdentifier, 0);
  objc_storeStrong((id *)&self->_allRecords, 0);
}

@end