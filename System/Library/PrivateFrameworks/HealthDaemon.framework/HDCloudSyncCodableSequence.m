@interface HDCloudSyncCodableSequence
+ (Class)includedChildSyncIdentitiesType;
+ (Class)includedStoreIdentifiersType;
+ (Class)includedSyncIdentitiesType;
+ (Class)unfrozenChangeRecordNamesType;
- (BOOL)active;
- (BOOL)hasActive;
- (BOOL)hasAnchorMap;
- (BOOL)hasChangeIndex;
- (BOOL)hasChildRecordCount;
- (BOOL)hasEpoch;
- (BOOL)hasFrozenAnchorMap;
- (BOOL)hasProtocolVersion;
- (BOOL)hasSlot;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableSyncAnchorRangeMap)anchorMap;
- (HDCodableSyncAnchorRangeMap)frozenAnchorMap;
- (NSMutableArray)includedChildSyncIdentities;
- (NSMutableArray)includedStoreIdentifiers;
- (NSMutableArray)includedSyncIdentities;
- (NSMutableArray)unfrozenChangeRecordNames;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)includedChildSyncIdentitiesAtIndex:(unint64_t)a3;
- (id)includedStoreIdentifiersAtIndex:(unint64_t)a3;
- (id)includedSyncIdentitiesAtIndex:(unint64_t)a3;
- (id)slotAsString:(int)a3;
- (id)unfrozenChangeRecordNamesAtIndex:(unint64_t)a3;
- (int)StringAsSlot:(id)a3;
- (int)slot;
- (int64_t)changeIndex;
- (int64_t)childRecordCount;
- (int64_t)epoch;
- (int64_t)protocolVersion;
- (unint64_t)hash;
- (unint64_t)includedChildSyncIdentitiesCount;
- (unint64_t)includedStoreIdentifiersCount;
- (unint64_t)includedSyncIdentitiesCount;
- (unint64_t)unfrozenChangeRecordNamesCount;
- (void)addIncludedChildSyncIdentities:(id)a3;
- (void)addIncludedStoreIdentifiers:(id)a3;
- (void)addIncludedSyncIdentities:(id)a3;
- (void)addUnfrozenChangeRecordNames:(id)a3;
- (void)clearIncludedChildSyncIdentities;
- (void)clearIncludedStoreIdentifiers;
- (void)clearIncludedSyncIdentities;
- (void)clearUnfrozenChangeRecordNames;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setAnchorMap:(id)a3;
- (void)setChangeIndex:(int64_t)a3;
- (void)setChildRecordCount:(int64_t)a3;
- (void)setEpoch:(int64_t)a3;
- (void)setFrozenAnchorMap:(id)a3;
- (void)setHasActive:(BOOL)a3;
- (void)setHasChangeIndex:(BOOL)a3;
- (void)setHasChildRecordCount:(BOOL)a3;
- (void)setHasEpoch:(BOOL)a3;
- (void)setHasProtocolVersion:(BOOL)a3;
- (void)setHasSlot:(BOOL)a3;
- (void)setIncludedChildSyncIdentities:(id)a3;
- (void)setIncludedStoreIdentifiers:(id)a3;
- (void)setIncludedSyncIdentities:(id)a3;
- (void)setProtocolVersion:(int64_t)a3;
- (void)setSlot:(int)a3;
- (void)setUnfrozenChangeRecordNames:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCloudSyncCodableSequence

- (int)slot
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_slot;
  }
  else {
    return 1;
  }
}

- (void)setSlot:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_slot = a3;
}

- (void)setHasSlot:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSlot
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)slotAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E6300108[a3 - 1];
  }

  return v3;
}

- (int)StringAsSlot:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"A"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"B"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Tombstone"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (void)setActive:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_active = a3;
}

- (void)setHasActive:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasActive
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setEpoch:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_epoch = a3;
}

- (void)setHasEpoch:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEpoch
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)clearIncludedStoreIdentifiers
{
}

- (void)addIncludedStoreIdentifiers:(id)a3
{
  id v4 = a3;
  includedStoreIdentifiers = self->_includedStoreIdentifiers;
  id v8 = v4;
  if (!includedStoreIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_includedStoreIdentifiers;
    self->_includedStoreIdentifiers = v6;

    id v4 = v8;
    includedStoreIdentifiers = self->_includedStoreIdentifiers;
  }
  [(NSMutableArray *)includedStoreIdentifiers addObject:v4];
}

- (unint64_t)includedStoreIdentifiersCount
{
  return [(NSMutableArray *)self->_includedStoreIdentifiers count];
}

- (id)includedStoreIdentifiersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_includedStoreIdentifiers objectAtIndex:a3];
}

+ (Class)includedStoreIdentifiersType
{
  return (Class)objc_opt_class();
}

- (void)clearIncludedSyncIdentities
{
}

- (void)addIncludedSyncIdentities:(id)a3
{
  id v4 = a3;
  includedSyncIdentities = self->_includedSyncIdentities;
  id v8 = v4;
  if (!includedSyncIdentities)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_includedSyncIdentities;
    self->_includedSyncIdentities = v6;

    id v4 = v8;
    includedSyncIdentities = self->_includedSyncIdentities;
  }
  [(NSMutableArray *)includedSyncIdentities addObject:v4];
}

- (unint64_t)includedSyncIdentitiesCount
{
  return [(NSMutableArray *)self->_includedSyncIdentities count];
}

- (id)includedSyncIdentitiesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_includedSyncIdentities objectAtIndex:a3];
}

+ (Class)includedSyncIdentitiesType
{
  return (Class)objc_opt_class();
}

- (void)clearIncludedChildSyncIdentities
{
}

- (void)addIncludedChildSyncIdentities:(id)a3
{
  id v4 = a3;
  includedChildSyncIdentities = self->_includedChildSyncIdentities;
  id v8 = v4;
  if (!includedChildSyncIdentities)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_includedChildSyncIdentities;
    self->_includedChildSyncIdentities = v6;

    id v4 = v8;
    includedChildSyncIdentities = self->_includedChildSyncIdentities;
  }
  [(NSMutableArray *)includedChildSyncIdentities addObject:v4];
}

- (unint64_t)includedChildSyncIdentitiesCount
{
  return [(NSMutableArray *)self->_includedChildSyncIdentities count];
}

- (id)includedChildSyncIdentitiesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_includedChildSyncIdentities objectAtIndex:a3];
}

+ (Class)includedChildSyncIdentitiesType
{
  return (Class)objc_opt_class();
}

- (void)setProtocolVersion:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_protocolVersion = a3;
}

- (void)setHasProtocolVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasProtocolVersion
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasAnchorMap
{
  return self->_anchorMap != 0;
}

- (BOOL)hasFrozenAnchorMap
{
  return self->_frozenAnchorMap != 0;
}

- (void)setChangeIndex:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_changeIndex = a3;
}

- (void)setHasChangeIndex:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasChangeIndex
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setChildRecordCount:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_childRecordCount = a3;
}

- (void)setHasChildRecordCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasChildRecordCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)clearUnfrozenChangeRecordNames
{
}

- (void)addUnfrozenChangeRecordNames:(id)a3
{
  id v4 = a3;
  unfrozenChangeRecordNames = self->_unfrozenChangeRecordNames;
  id v8 = v4;
  if (!unfrozenChangeRecordNames)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_unfrozenChangeRecordNames;
    self->_unfrozenChangeRecordNames = v6;

    id v4 = v8;
    unfrozenChangeRecordNames = self->_unfrozenChangeRecordNames;
  }
  [(NSMutableArray *)unfrozenChangeRecordNames addObject:v4];
}

- (unint64_t)unfrozenChangeRecordNamesCount
{
  return [(NSMutableArray *)self->_unfrozenChangeRecordNames count];
}

- (id)unfrozenChangeRecordNamesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_unfrozenChangeRecordNames objectAtIndex:a3];
}

+ (Class)unfrozenChangeRecordNamesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCloudSyncCodableSequence;
  id v4 = [(HDCloudSyncCodableSequence *)&v8 description];
  v5 = [(HDCloudSyncCodableSequence *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    unsigned int v5 = self->_slot - 1;
    if (v5 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_slot);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E6300108[v5];
    }
    [v3 setObject:v6 forKey:@"slot"];

    char has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    v7 = [NSNumber numberWithBool:self->_active];
    [v3 setObject:v7 forKey:@"active"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    objc_super v8 = [NSNumber numberWithLongLong:self->_epoch];
    [v3 setObject:v8 forKey:@"epoch"];
  }
  includedStoreIdentifiers = self->_includedStoreIdentifiers;
  if (includedStoreIdentifiers) {
    [v3 setObject:includedStoreIdentifiers forKey:@"includedStoreIdentifiers"];
  }
  if ([(NSMutableArray *)self->_includedSyncIdentities count])
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_includedSyncIdentities, "count"));
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v11 = self->_includedSyncIdentities;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v39 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [*(id *)(*((void *)&v38 + 1) + 8 * i) dictionaryRepresentation];
          [v10 addObject:v16];
        }
        uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v38 objects:v43 count:16];
      }
      while (v13);
    }

    [v3 setObject:v10 forKey:@"includedSyncIdentities"];
  }
  if ([(NSMutableArray *)self->_includedChildSyncIdentities count])
  {
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_includedChildSyncIdentities, "count"));
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v18 = self->_includedChildSyncIdentities;
    uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v35;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v35 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = [*(id *)(*((void *)&v34 + 1) + 8 * j) dictionaryRepresentation];
          [v17 addObject:v23];
        }
        uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v20);
    }

    [v3 setObject:v17 forKey:@"includedChildSyncIdentities"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v24 = [NSNumber numberWithLongLong:self->_protocolVersion];
    [v3 setObject:v24 forKey:@"protocolVersion"];
  }
  anchorMap = self->_anchorMap;
  if (anchorMap)
  {
    v26 = [(HDCodableSyncAnchorRangeMap *)anchorMap dictionaryRepresentation];
    [v3 setObject:v26 forKey:@"anchorMap"];
  }
  frozenAnchorMap = self->_frozenAnchorMap;
  if (frozenAnchorMap)
  {
    v28 = [(HDCodableSyncAnchorRangeMap *)frozenAnchorMap dictionaryRepresentation];
    [v3 setObject:v28 forKey:@"frozenAnchorMap"];
  }
  char v29 = (char)self->_has;
  if (v29)
  {
    v30 = [NSNumber numberWithLongLong:self->_changeIndex];
    [v3 setObject:v30 forKey:@"changeIndex"];

    char v29 = (char)self->_has;
  }
  if ((v29 & 2) != 0)
  {
    v31 = [NSNumber numberWithLongLong:self->_childRecordCount];
    [v3 setObject:v31 forKey:@"childRecordCount"];
  }
  unfrozenChangeRecordNames = self->_unfrozenChangeRecordNames;
  if (unfrozenChangeRecordNames) {
    [v3 setObject:unfrozenChangeRecordNames forKey:@"unfrozenChangeRecordNames"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCloudSyncCodableSequenceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_4:
  }
    PBDataWriterWriteInt64Field();
LABEL_5:
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v6 = self->_includedStoreIdentifiers;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v39 objects:v46 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v40 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteDataField();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v39 objects:v46 count:16];
    }
    while (v8);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v11 = self->_includedSyncIdentities;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v35 objects:v45 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v36 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v35 objects:v45 count:16];
    }
    while (v13);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v16 = self->_includedChildSyncIdentities;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v31 objects:v44 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v32;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v32 != v19) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v31 objects:v44 count:16];
    }
    while (v18);
  }

  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_anchorMap) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_frozenAnchorMap) {
    PBDataWriterWriteSubmessage();
  }
  char v21 = (char)self->_has;
  if (v21)
  {
    PBDataWriterWriteInt64Field();
    char v21 = (char)self->_has;
  }
  if ((v21 & 2) != 0) {
    PBDataWriterWriteInt64Field();
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v22 = self->_unfrozenChangeRecordNames;
  uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v27 objects:v43 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v28;
    do
    {
      for (uint64_t m = 0; m != v24; ++m)
      {
        if (*(void *)v28 != v25) {
          objc_enumerationMutation(v22);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v27 objects:v43 count:16];
    }
    while (v24);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
    if ((*(unsigned char *)&self->_has & 0x20) == 0) {
      goto LABEL_3;
    }
LABEL_35:
    v4[96] = self->_active;
    v4[100] |= 0x20u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *((_DWORD *)v4 + 20) = self->_slot;
  v4[100] |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x20) != 0) {
    goto LABEL_35;
  }
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *((void *)v4 + 3) = self->_epoch;
    v4[100] |= 4u;
  }
LABEL_5:
  id v24 = v4;
  if ([(HDCloudSyncCodableSequence *)self includedStoreIdentifiersCount])
  {
    [v24 clearIncludedStoreIdentifiers];
    unint64_t v6 = [(HDCloudSyncCodableSequence *)self includedStoreIdentifiersCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(HDCloudSyncCodableSequence *)self includedStoreIdentifiersAtIndex:i];
        [v24 addIncludedStoreIdentifiers:v9];
      }
    }
  }
  if ([(HDCloudSyncCodableSequence *)self includedSyncIdentitiesCount])
  {
    [v24 clearIncludedSyncIdentities];
    unint64_t v10 = [(HDCloudSyncCodableSequence *)self includedSyncIdentitiesCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
      {
        uint64_t v13 = [(HDCloudSyncCodableSequence *)self includedSyncIdentitiesAtIndex:j];
        [v24 addIncludedSyncIdentities:v13];
      }
    }
  }
  if ([(HDCloudSyncCodableSequence *)self includedChildSyncIdentitiesCount])
  {
    [v24 clearIncludedChildSyncIdentities];
    unint64_t v14 = [(HDCloudSyncCodableSequence *)self includedChildSyncIdentitiesCount];
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t k = 0; k != v15; ++k)
      {
        uint64_t v17 = [(HDCloudSyncCodableSequence *)self includedChildSyncIdentitiesAtIndex:k];
        [v24 addIncludedChildSyncIdentities:v17];
      }
    }
  }
  uint64_t v18 = v24;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((void *)v24 + 4) = self->_protocolVersion;
    *((unsigned char *)v24 + 100) |= 8u;
  }
  if (self->_anchorMap)
  {
    objc_msgSend(v24, "setAnchorMap:");
    uint64_t v18 = v24;
  }
  if (self->_frozenAnchorMap)
  {
    objc_msgSend(v24, "setFrozenAnchorMap:");
    uint64_t v18 = v24;
  }
  char v19 = (char)self->_has;
  if (v19)
  {
    v18[1] = self->_changeIndex;
    *((unsigned char *)v18 + 100) |= 1u;
    char v19 = (char)self->_has;
  }
  if ((v19 & 2) != 0)
  {
    v18[2] = self->_childRecordCount;
    *((unsigned char *)v18 + 100) |= 2u;
  }
  if ([(HDCloudSyncCodableSequence *)self unfrozenChangeRecordNamesCount])
  {
    [v24 clearUnfrozenChangeRecordNames];
    unint64_t v20 = [(HDCloudSyncCodableSequence *)self unfrozenChangeRecordNamesCount];
    if (v20)
    {
      unint64_t v21 = v20;
      for (uint64_t m = 0; m != v21; ++m)
      {
        uint64_t v23 = [(HDCloudSyncCodableSequence *)self unfrozenChangeRecordNamesAtIndex:m];
        [v24 addUnfrozenChangeRecordNames:v23];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_slot;
    *(unsigned char *)(v5 + 100) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *(unsigned char *)(v5 + 96) = self->_active;
  *(unsigned char *)(v5 + 100) |= 0x20u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    *(void *)(v5 + 24) = self->_epoch;
    *(unsigned char *)(v5 + 100) |= 4u;
  }
LABEL_5:
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v8 = self->_includedStoreIdentifiers;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v50 objects:v57 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v51 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = (void *)[*(id *)(*((void *)&v50 + 1) + 8 * i) copyWithZone:a3];
        [(id)v6 addIncludedStoreIdentifiers:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v50 objects:v57 count:16];
    }
    while (v10);
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  unint64_t v14 = self->_includedSyncIdentities;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v46 objects:v56 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v47;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v47 != v17) {
          objc_enumerationMutation(v14);
        }
        char v19 = (void *)[*(id *)(*((void *)&v46 + 1) + 8 * j) copyWithZone:a3];
        [(id)v6 addIncludedSyncIdentities:v19];
      }
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v46 objects:v56 count:16];
    }
    while (v16);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  unint64_t v20 = self->_includedChildSyncIdentities;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v42 objects:v55 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v43;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v43 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = (void *)[*(id *)(*((void *)&v42 + 1) + 8 * k) copyWithZone:a3];
        [(id)v6 addIncludedChildSyncIdentities:v25];
      }
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v42 objects:v55 count:16];
    }
    while (v22);
  }

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(void *)(v6 + 32) = self->_protocolVersion;
    *(unsigned char *)(v6 + 100) |= 8u;
  }
  id v26 = [(HDCodableSyncAnchorRangeMap *)self->_anchorMap copyWithZone:a3];
  long long v27 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v26;

  id v28 = [(HDCodableSyncAnchorRangeMap *)self->_frozenAnchorMap copyWithZone:a3];
  long long v29 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v28;

  char v30 = (char)self->_has;
  if (v30)
  {
    *(void *)(v6 + 8) = self->_changeIndex;
    *(unsigned char *)(v6 + 100) |= 1u;
    char v30 = (char)self->_has;
  }
  if ((v30 & 2) != 0)
  {
    *(void *)(v6 + 16) = self->_childRecordCount;
    *(unsigned char *)(v6 + 100) |= 2u;
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v31 = self->_unfrozenChangeRecordNames;
  uint64_t v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v38 objects:v54 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v39;
    do
    {
      for (uint64_t m = 0; m != v33; ++m)
      {
        if (*(void *)v39 != v34) {
          objc_enumerationMutation(v31);
        }
        long long v36 = objc_msgSend(*(id *)(*((void *)&v38 + 1) + 8 * m), "copyWithZone:", a3, (void)v38);
        [(id)v6 addUnfrozenChangeRecordNames:v36];
      }
      uint64_t v33 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v38 objects:v54 count:16];
    }
    while (v33);
  }

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_47;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 100) & 0x10) == 0 || self->_slot != *((_DWORD *)v4 + 20)) {
      goto LABEL_47;
    }
  }
  else if ((*((unsigned char *)v4 + 100) & 0x10) != 0)
  {
    goto LABEL_47;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 100) & 0x20) != 0)
    {
      if (self->_active)
      {
        if (!*((unsigned char *)v4 + 96)) {
          goto LABEL_47;
        }
        goto LABEL_15;
      }
      if (!*((unsigned char *)v4 + 96)) {
        goto LABEL_15;
      }
    }
LABEL_47:
    char v11 = 0;
    goto LABEL_48;
  }
  if ((*((unsigned char *)v4 + 100) & 0x20) != 0) {
    goto LABEL_47;
  }
LABEL_15:
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 100) & 4) == 0 || self->_epoch != *((void *)v4 + 3)) {
      goto LABEL_47;
    }
  }
  else if ((*((unsigned char *)v4 + 100) & 4) != 0)
  {
    goto LABEL_47;
  }
  includedStoreIdentifiers = self->_includedStoreIdentifiers;
  if ((unint64_t)includedStoreIdentifiers | *((void *)v4 + 8)
    && !-[NSMutableArray isEqual:](includedStoreIdentifiers, "isEqual:"))
  {
    goto LABEL_47;
  }
  includedSyncIdentities = self->_includedSyncIdentities;
  if ((unint64_t)includedSyncIdentities | *((void *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](includedSyncIdentities, "isEqual:")) {
      goto LABEL_47;
    }
  }
  includedChildSyncIdentities = self->_includedChildSyncIdentities;
  if ((unint64_t)includedChildSyncIdentities | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](includedChildSyncIdentities, "isEqual:")) {
      goto LABEL_47;
    }
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 100) & 8) == 0 || self->_protocolVersion != *((void *)v4 + 4)) {
      goto LABEL_47;
    }
  }
  else if ((*((unsigned char *)v4 + 100) & 8) != 0)
  {
    goto LABEL_47;
  }
  anchorMap = self->_anchorMap;
  if ((unint64_t)anchorMap | *((void *)v4 + 5)
    && !-[HDCodableSyncAnchorRangeMap isEqual:](anchorMap, "isEqual:"))
  {
    goto LABEL_47;
  }
  frozenAnchorMap = self->_frozenAnchorMap;
  if ((unint64_t)frozenAnchorMap | *((void *)v4 + 6))
  {
    if (!-[HDCodableSyncAnchorRangeMap isEqual:](frozenAnchorMap, "isEqual:")) {
      goto LABEL_47;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 100) & 1) == 0 || self->_changeIndex != *((void *)v4 + 1)) {
      goto LABEL_47;
    }
  }
  else if (*((unsigned char *)v4 + 100))
  {
    goto LABEL_47;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 100) & 2) == 0 || self->_childRecordCount != *((void *)v4 + 2)) {
      goto LABEL_47;
    }
  }
  else if ((*((unsigned char *)v4 + 100) & 2) != 0)
  {
    goto LABEL_47;
  }
  unfrozenChangeRecordNames = self->_unfrozenChangeRecordNames;
  if ((unint64_t)unfrozenChangeRecordNames | *((void *)v4 + 11)) {
    char v11 = -[NSMutableArray isEqual:](unfrozenChangeRecordNames, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_48:

  return v11;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    uint64_t v14 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v14 = 2654435761 * self->_slot;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_active;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_epoch;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v4 = 0;
LABEL_8:
  uint64_t v5 = [(NSMutableArray *)self->_includedStoreIdentifiers hash];
  uint64_t v6 = [(NSMutableArray *)self->_includedSyncIdentities hash];
  uint64_t v7 = [(NSMutableArray *)self->_includedChildSyncIdentities hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v8 = 2654435761 * self->_protocolVersion;
  }
  else {
    uint64_t v8 = 0;
  }
  unint64_t v9 = [(HDCodableSyncAnchorRangeMap *)self->_anchorMap hash];
  unint64_t v10 = [(HDCodableSyncAnchorRangeMap *)self->_frozenAnchorMap hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v11 = 2654435761 * self->_changeIndex;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_13;
    }
LABEL_15:
    uint64_t v12 = 0;
    return v3 ^ v14 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ [(NSMutableArray *)self->_unfrozenChangeRecordNames hash];
  }
  uint64_t v11 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_15;
  }
LABEL_13:
  uint64_t v12 = 2654435761 * self->_childRecordCount;
  return v3 ^ v14 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ [(NSMutableArray *)self->_unfrozenChangeRecordNames hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  char v6 = *((unsigned char *)v4 + 100);
  if ((v6 & 0x10) != 0)
  {
    self->_slot = *((_DWORD *)v4 + 20);
    *(unsigned char *)&self->_has |= 0x10u;
    char v6 = *((unsigned char *)v4 + 100);
    if ((v6 & 0x20) == 0)
    {
LABEL_3:
      if ((v6 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 100) & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_active = *((unsigned char *)v4 + 96);
  *(unsigned char *)&self->_has |= 0x20u;
  if ((*((unsigned char *)v4 + 100) & 4) != 0)
  {
LABEL_4:
    self->_epoch = *((void *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_5:
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v7 = *((id *)v4 + 8);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v44 objects:v51 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v45 != v10) {
          objc_enumerationMutation(v7);
        }
        [(HDCloudSyncCodableSequence *)self addIncludedStoreIdentifiers:*(void *)(*((void *)&v44 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v44 objects:v51 count:16];
    }
    while (v9);
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v12 = *((id *)v5 + 9);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v40 objects:v50 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v41;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v41 != v15) {
          objc_enumerationMutation(v12);
        }
        [(HDCloudSyncCodableSequence *)self addIncludedSyncIdentities:*(void *)(*((void *)&v40 + 1) + 8 * j)];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v40 objects:v50 count:16];
    }
    while (v14);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v17 = *((id *)v5 + 7);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v36 objects:v49 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v37;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v37 != v20) {
          objc_enumerationMutation(v17);
        }
        [(HDCloudSyncCodableSequence *)self addIncludedChildSyncIdentities:*(void *)(*((void *)&v36 + 1) + 8 * k)];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v36 objects:v49 count:16];
    }
    while (v19);
  }

  if ((*((unsigned char *)v5 + 100) & 8) != 0)
  {
    self->_protocolVersion = *((void *)v5 + 4);
    *(unsigned char *)&self->_has |= 8u;
  }
  anchorMap = self->_anchorMap;
  uint64_t v23 = *((void *)v5 + 5);
  if (anchorMap)
  {
    if (v23) {
      -[HDCodableSyncAnchorRangeMap mergeFrom:](anchorMap, "mergeFrom:");
    }
  }
  else if (v23)
  {
    -[HDCloudSyncCodableSequence setAnchorMap:](self, "setAnchorMap:");
  }
  frozenAnchorMap = self->_frozenAnchorMap;
  uint64_t v25 = *((void *)v5 + 6);
  if (frozenAnchorMap)
  {
    if (v25) {
      -[HDCodableSyncAnchorRangeMap mergeFrom:](frozenAnchorMap, "mergeFrom:");
    }
  }
  else if (v25)
  {
    -[HDCloudSyncCodableSequence setFrozenAnchorMap:](self, "setFrozenAnchorMap:");
  }
  char v26 = *((unsigned char *)v5 + 100);
  if (v26)
  {
    self->_changeIndex = *((void *)v5 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v26 = *((unsigned char *)v5 + 100);
  }
  if ((v26 & 2) != 0)
  {
    self->_childRecordCount = *((void *)v5 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v27 = *((id *)v5 + 11);
  uint64_t v28 = [v27 countByEnumeratingWithState:&v32 objects:v48 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v33;
    do
    {
      for (uint64_t m = 0; m != v29; ++m)
      {
        if (*(void *)v33 != v30) {
          objc_enumerationMutation(v27);
        }
        -[HDCloudSyncCodableSequence addUnfrozenChangeRecordNames:](self, "addUnfrozenChangeRecordNames:", *(void *)(*((void *)&v32 + 1) + 8 * m), (void)v32);
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v32 objects:v48 count:16];
    }
    while (v29);
  }
}

- (BOOL)active
{
  return self->_active;
}

- (int64_t)epoch
{
  return self->_epoch;
}

- (NSMutableArray)includedStoreIdentifiers
{
  return self->_includedStoreIdentifiers;
}

- (void)setIncludedStoreIdentifiers:(id)a3
{
}

- (NSMutableArray)includedSyncIdentities
{
  return self->_includedSyncIdentities;
}

- (void)setIncludedSyncIdentities:(id)a3
{
}

- (NSMutableArray)includedChildSyncIdentities
{
  return self->_includedChildSyncIdentities;
}

- (void)setIncludedChildSyncIdentities:(id)a3
{
}

- (int64_t)protocolVersion
{
  return self->_protocolVersion;
}

- (HDCodableSyncAnchorRangeMap)anchorMap
{
  return self->_anchorMap;
}

- (void)setAnchorMap:(id)a3
{
}

- (HDCodableSyncAnchorRangeMap)frozenAnchorMap
{
  return self->_frozenAnchorMap;
}

- (void)setFrozenAnchorMap:(id)a3
{
}

- (int64_t)changeIndex
{
  return self->_changeIndex;
}

- (int64_t)childRecordCount
{
  return self->_childRecordCount;
}

- (NSMutableArray)unfrozenChangeRecordNames
{
  return self->_unfrozenChangeRecordNames;
}

- (void)setUnfrozenChangeRecordNames:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unfrozenChangeRecordNames, 0);
  objc_storeStrong((id *)&self->_includedSyncIdentities, 0);
  objc_storeStrong((id *)&self->_includedStoreIdentifiers, 0);
  objc_storeStrong((id *)&self->_includedChildSyncIdentities, 0);
  objc_storeStrong((id *)&self->_frozenAnchorMap, 0);

  objc_storeStrong((id *)&self->_anchorMap, 0);
}

@end