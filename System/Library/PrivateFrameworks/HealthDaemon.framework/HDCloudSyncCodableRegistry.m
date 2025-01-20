@interface HDCloudSyncCodableRegistry
+ (Class)disabledOwnerIdentifiersType;
+ (Class)disabledSyncIdentitiesType;
+ (Class)storesType;
- (BOOL)deleted;
- (BOOL)hasDeleted;
- (BOOL)hasDisplayFirstName;
- (BOOL)hasDisplayLastName;
- (BOOL)hasDisplayNameModificationDate;
- (BOOL)hasOwnerProfileIdentifier;
- (BOOL)hasSharedProfileIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCloudSyncCodableProfileIdentifier)ownerProfileIdentifier;
- (HDCloudSyncCodableProfileIdentifier)sharedProfileIdentifier;
- (NSMutableArray)disabledOwnerIdentifiers;
- (NSMutableArray)disabledSyncIdentities;
- (NSMutableArray)stores;
- (NSString)displayFirstName;
- (NSString)displayLastName;
- (double)displayNameModificationDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)disabledOwnerIdentifiersAtIndex:(unint64_t)a3;
- (id)disabledSyncIdentitiesAtIndex:(unint64_t)a3;
- (id)storesAtIndex:(unint64_t)a3;
- (unint64_t)disabledOwnerIdentifiersCount;
- (unint64_t)disabledSyncIdentitiesCount;
- (unint64_t)hash;
- (unint64_t)storesCount;
- (void)addDisabledOwnerIdentifiers:(id)a3;
- (void)addDisabledSyncIdentities:(id)a3;
- (void)addStores:(id)a3;
- (void)clearDisabledOwnerIdentifiers;
- (void)clearDisabledSyncIdentities;
- (void)clearStores;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDeleted:(BOOL)a3;
- (void)setDisabledOwnerIdentifiers:(id)a3;
- (void)setDisabledSyncIdentities:(id)a3;
- (void)setDisplayFirstName:(id)a3;
- (void)setDisplayLastName:(id)a3;
- (void)setDisplayNameModificationDate:(double)a3;
- (void)setHasDeleted:(BOOL)a3;
- (void)setHasDisplayNameModificationDate:(BOOL)a3;
- (void)setOwnerProfileIdentifier:(id)a3;
- (void)setSharedProfileIdentifier:(id)a3;
- (void)setStores:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCloudSyncCodableRegistry

- (void)clearDisabledOwnerIdentifiers
{
}

- (void)addDisabledOwnerIdentifiers:(id)a3
{
  id v4 = a3;
  disabledOwnerIdentifiers = self->_disabledOwnerIdentifiers;
  id v8 = v4;
  if (!disabledOwnerIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_disabledOwnerIdentifiers;
    self->_disabledOwnerIdentifiers = v6;

    id v4 = v8;
    disabledOwnerIdentifiers = self->_disabledOwnerIdentifiers;
  }
  [(NSMutableArray *)disabledOwnerIdentifiers addObject:v4];
}

- (unint64_t)disabledOwnerIdentifiersCount
{
  return [(NSMutableArray *)self->_disabledOwnerIdentifiers count];
}

- (id)disabledOwnerIdentifiersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_disabledOwnerIdentifiers objectAtIndex:a3];
}

+ (Class)disabledOwnerIdentifiersType
{
  return (Class)objc_opt_class();
}

- (void)clearStores
{
}

- (void)addStores:(id)a3
{
  id v4 = a3;
  stores = self->_stores;
  id v8 = v4;
  if (!stores)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_stores;
    self->_stores = v6;

    id v4 = v8;
    stores = self->_stores;
  }
  [(NSMutableArray *)stores addObject:v4];
}

- (unint64_t)storesCount
{
  return [(NSMutableArray *)self->_stores count];
}

- (id)storesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_stores objectAtIndex:a3];
}

+ (Class)storesType
{
  return (Class)objc_opt_class();
}

- (void)clearDisabledSyncIdentities
{
}

- (void)addDisabledSyncIdentities:(id)a3
{
  id v4 = a3;
  disabledSyncIdentities = self->_disabledSyncIdentities;
  id v8 = v4;
  if (!disabledSyncIdentities)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_disabledSyncIdentities;
    self->_disabledSyncIdentities = v6;

    id v4 = v8;
    disabledSyncIdentities = self->_disabledSyncIdentities;
  }
  [(NSMutableArray *)disabledSyncIdentities addObject:v4];
}

- (unint64_t)disabledSyncIdentitiesCount
{
  return [(NSMutableArray *)self->_disabledSyncIdentities count];
}

- (id)disabledSyncIdentitiesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_disabledSyncIdentities objectAtIndex:a3];
}

+ (Class)disabledSyncIdentitiesType
{
  return (Class)objc_opt_class();
}

- (void)setDeleted:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_deleted = a3;
}

- (void)setHasDeleted:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDeleted
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasDisplayFirstName
{
  return self->_displayFirstName != 0;
}

- (void)setDisplayNameModificationDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_displayNameModificationDate = a3;
}

- (void)setHasDisplayNameModificationDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDisplayNameModificationDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasDisplayLastName
{
  return self->_displayLastName != 0;
}

- (BOOL)hasOwnerProfileIdentifier
{
  return self->_ownerProfileIdentifier != 0;
}

- (BOOL)hasSharedProfileIdentifier
{
  return self->_sharedProfileIdentifier != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCloudSyncCodableRegistry;
  id v4 = [(HDCloudSyncCodableRegistry *)&v8 description];
  v5 = [(HDCloudSyncCodableRegistry *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  disabledOwnerIdentifiers = self->_disabledOwnerIdentifiers;
  if (disabledOwnerIdentifiers) {
    [v3 setObject:disabledOwnerIdentifiers forKey:@"disabledOwnerIdentifiers"];
  }
  if ([(NSMutableArray *)self->_stores count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_stores, "count"));
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v7 = self->_stores;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v34 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v33 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v9);
    }

    [v4 setObject:v6 forKey:@"stores"];
  }
  if ([(NSMutableArray *)self->_disabledSyncIdentities count])
  {
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_disabledSyncIdentities, "count"));
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v14 = self->_disabledSyncIdentities;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v30 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * j), "dictionaryRepresentation", (void)v29);
          [v13 addObject:v19];
        }
        uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v16);
    }

    [v4 setObject:v13 forKey:@"disabledSyncIdentities"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v20 = [NSNumber numberWithBool:self->_deleted];
    [v4 setObject:v20 forKey:@"deleted"];
  }
  displayFirstName = self->_displayFirstName;
  if (displayFirstName) {
    [v4 setObject:displayFirstName forKey:@"displayFirstName"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v22 = [NSNumber numberWithDouble:self->_displayNameModificationDate];
    [v4 setObject:v22 forKey:@"displayNameModificationDate"];
  }
  displayLastName = self->_displayLastName;
  if (displayLastName) {
    [v4 setObject:displayLastName forKey:@"displayLastName"];
  }
  ownerProfileIdentifier = self->_ownerProfileIdentifier;
  if (ownerProfileIdentifier)
  {
    v25 = [(HDCloudSyncCodableProfileIdentifier *)ownerProfileIdentifier dictionaryRepresentation];
    [v4 setObject:v25 forKey:@"ownerProfileIdentifier"];
  }
  sharedProfileIdentifier = self->_sharedProfileIdentifier;
  if (sharedProfileIdentifier)
  {
    v27 = [(HDCloudSyncCodableProfileIdentifier *)sharedProfileIdentifier dictionaryRepresentation];
    [v4 setObject:v27 forKey:@"sharedProfileIdentifier"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCloudSyncCodableRegistryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v5 = self->_disabledOwnerIdentifiers;
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
  uint64_t v10 = self->_stores;
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
        PBDataWriterWriteSubmessage();
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
  uint64_t v15 = self->_disabledSyncIdentities;
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
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_displayFirstName) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_displayLastName) {
    PBDataWriterWriteStringField();
  }
  if (self->_ownerProfileIdentifier) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_sharedProfileIdentifier) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v17 = a3;
  if ([(HDCloudSyncCodableRegistry *)self disabledOwnerIdentifiersCount])
  {
    [v17 clearDisabledOwnerIdentifiers];
    unint64_t v4 = [(HDCloudSyncCodableRegistry *)self disabledOwnerIdentifiersCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(HDCloudSyncCodableRegistry *)self disabledOwnerIdentifiersAtIndex:i];
        [v17 addDisabledOwnerIdentifiers:v7];
      }
    }
  }
  if ([(HDCloudSyncCodableRegistry *)self storesCount])
  {
    [v17 clearStores];
    unint64_t v8 = [(HDCloudSyncCodableRegistry *)self storesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(HDCloudSyncCodableRegistry *)self storesAtIndex:j];
        [v17 addStores:v11];
      }
    }
  }
  if ([(HDCloudSyncCodableRegistry *)self disabledSyncIdentitiesCount])
  {
    [v17 clearDisabledSyncIdentities];
    unint64_t v12 = [(HDCloudSyncCodableRegistry *)self disabledSyncIdentitiesCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(HDCloudSyncCodableRegistry *)self disabledSyncIdentitiesAtIndex:k];
        [v17 addDisabledSyncIdentities:v15];
      }
    }
  }
  uint64_t v16 = v17;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v17[72] = self->_deleted;
    v17[76] |= 2u;
  }
  if (self->_displayFirstName)
  {
    objc_msgSend(v17, "setDisplayFirstName:");
    uint64_t v16 = v17;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v16 + 1) = *(void *)&self->_displayNameModificationDate;
    v16[76] |= 1u;
  }
  if (self->_displayLastName)
  {
    objc_msgSend(v17, "setDisplayLastName:");
    uint64_t v16 = v17;
  }
  if (self->_ownerProfileIdentifier)
  {
    objc_msgSend(v17, "setOwnerProfileIdentifier:");
    uint64_t v16 = v17;
  }
  if (self->_sharedProfileIdentifier)
  {
    objc_msgSend(v17, "setSharedProfileIdentifier:");
    uint64_t v16 = v17;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v6 = self->_disabledOwnerIdentifiers;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v42;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v42 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v41 + 1) + 8 * v10) copyWithZone:a3];
        [(id)v5 addDisabledOwnerIdentifiers:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v8);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  unint64_t v12 = self->_stores;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v37 objects:v46 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v38;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v38 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = (void *)[*(id *)(*((void *)&v37 + 1) + 8 * v16) copyWithZone:a3];
        [(id)v5 addStores:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v37 objects:v46 count:16];
    }
    while (v14);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v18 = self->_disabledSyncIdentities;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v33 objects:v45 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v34;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v34 != v21) {
          objc_enumerationMutation(v18);
        }
        long long v23 = objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * v22), "copyWithZone:", a3, (void)v33);
        [(id)v5 addDisabledSyncIdentities:v23];

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v33 objects:v45 count:16];
    }
    while (v20);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v5 + 72) = self->_deleted;
    *(unsigned char *)(v5 + 76) |= 2u;
  }
  uint64_t v24 = -[NSString copyWithZone:](self->_displayFirstName, "copyWithZone:", a3, (void)v33);
  long long v25 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v24;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_displayNameModificationDate;
    *(unsigned char *)(v5 + 76) |= 1u;
  }
  uint64_t v26 = [(NSString *)self->_displayLastName copyWithZone:a3];
  long long v27 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v26;

  id v28 = [(HDCloudSyncCodableProfileIdentifier *)self->_ownerProfileIdentifier copyWithZone:a3];
  long long v29 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v28;

  id v30 = [(HDCloudSyncCodableProfileIdentifier *)self->_sharedProfileIdentifier copyWithZone:a3];
  long long v31 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v30;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_30;
  }
  disabledOwnerIdentifiers = self->_disabledOwnerIdentifiers;
  if ((unint64_t)disabledOwnerIdentifiers | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](disabledOwnerIdentifiers, "isEqual:")) {
      goto LABEL_30;
    }
  }
  stores = self->_stores;
  if ((unint64_t)stores | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](stores, "isEqual:")) {
      goto LABEL_30;
    }
  }
  disabledSyncIdentities = self->_disabledSyncIdentities;
  if ((unint64_t)disabledSyncIdentities | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](disabledSyncIdentities, "isEqual:")) {
      goto LABEL_30;
    }
  }
  char has = (char)self->_has;
  char v9 = *((unsigned char *)v4 + 76);
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 2) == 0) {
      goto LABEL_30;
    }
    if (self->_deleted)
    {
      if (!*((unsigned char *)v4 + 72)) {
        goto LABEL_30;
      }
    }
    else if (*((unsigned char *)v4 + 72))
    {
      goto LABEL_30;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 2) != 0)
  {
    goto LABEL_30;
  }
  displayFirstName = self->_displayFirstName;
  if (!((unint64_t)displayFirstName | *((void *)v4 + 4))) {
    goto LABEL_19;
  }
  if (!-[NSString isEqual:](displayFirstName, "isEqual:"))
  {
LABEL_30:
    char v14 = 0;
    goto LABEL_31;
  }
  char has = (char)self->_has;
  char v9 = *((unsigned char *)v4 + 76);
LABEL_19:
  if (has)
  {
    if ((v9 & 1) == 0 || self->_displayNameModificationDate != *((double *)v4 + 1)) {
      goto LABEL_30;
    }
  }
  else if (v9)
  {
    goto LABEL_30;
  }
  displayLastName = self->_displayLastName;
  if ((unint64_t)displayLastName | *((void *)v4 + 5)
    && !-[NSString isEqual:](displayLastName, "isEqual:"))
  {
    goto LABEL_30;
  }
  ownerProfileIdentifier = self->_ownerProfileIdentifier;
  if ((unint64_t)ownerProfileIdentifier | *((void *)v4 + 6))
  {
    if (!-[HDCloudSyncCodableProfileIdentifier isEqual:](ownerProfileIdentifier, "isEqual:")) {
      goto LABEL_30;
    }
  }
  sharedProfileIdentifier = self->_sharedProfileIdentifier;
  if ((unint64_t)sharedProfileIdentifier | *((void *)v4 + 7)) {
    char v14 = -[HDCloudSyncCodableProfileIdentifier isEqual:](sharedProfileIdentifier, "isEqual:");
  }
  else {
    char v14 = 1;
  }
LABEL_31:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_disabledOwnerIdentifiers hash];
  uint64_t v4 = [(NSMutableArray *)self->_stores hash];
  uint64_t v5 = [(NSMutableArray *)self->_disabledSyncIdentities hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_deleted;
  }
  else {
    uint64_t v6 = 0;
  }
  NSUInteger v7 = [(NSString *)self->_displayFirstName hash];
  if (*(unsigned char *)&self->_has)
  {
    double displayNameModificationDate = self->_displayNameModificationDate;
    double v10 = -displayNameModificationDate;
    if (displayNameModificationDate >= 0.0) {
      double v10 = self->_displayNameModificationDate;
    }
    long double v11 = floor(v10 + 0.5);
    double v12 = (v10 - v11) * 1.84467441e19;
    unint64_t v8 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
    if (v12 >= 0.0)
    {
      if (v12 > 0.0) {
        v8 += (unint64_t)v12;
      }
    }
    else
    {
      v8 -= (unint64_t)fabs(v12);
    }
  }
  else
  {
    unint64_t v8 = 0;
  }
  NSUInteger v13 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(NSString *)self->_displayLastName hash];
  unint64_t v14 = [(HDCloudSyncCodableProfileIdentifier *)self->_ownerProfileIdentifier hash];
  return v13 ^ v14 ^ [(HDCloudSyncCodableProfileIdentifier *)self->_sharedProfileIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v5 = *((id *)v4 + 2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(v5);
        }
        [(HDCloudSyncCodableRegistry *)self addDisabledOwnerIdentifiers:*(void *)(*((void *)&v32 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v7);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v10 = *((id *)v4 + 8);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(v10);
        }
        [(HDCloudSyncCodableRegistry *)self addStores:*(void *)(*((void *)&v28 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v37 count:16];
    }
    while (v12);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v15 = *((id *)v4 + 3);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v36 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v25;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(v15);
        }
        -[HDCloudSyncCodableRegistry addDisabledSyncIdentities:](self, "addDisabledSyncIdentities:", *(void *)(*((void *)&v24 + 1) + 8 * k), (void)v24);
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v36 count:16];
    }
    while (v17);
  }

  if ((*((unsigned char *)v4 + 76) & 2) != 0)
  {
    self->_deleted = *((unsigned char *)v4 + 72);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 4)) {
    -[HDCloudSyncCodableRegistry setDisplayFirstName:](self, "setDisplayFirstName:");
  }
  if (*((unsigned char *)v4 + 76))
  {
    self->_double displayNameModificationDate = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 5)) {
    -[HDCloudSyncCodableRegistry setDisplayLastName:](self, "setDisplayLastName:");
  }
  ownerProfileIdentifier = self->_ownerProfileIdentifier;
  uint64_t v21 = *((void *)v4 + 6);
  if (ownerProfileIdentifier)
  {
    if (v21) {
      -[HDCloudSyncCodableProfileIdentifier mergeFrom:](ownerProfileIdentifier, "mergeFrom:");
    }
  }
  else if (v21)
  {
    -[HDCloudSyncCodableRegistry setOwnerProfileIdentifier:](self, "setOwnerProfileIdentifier:");
  }
  sharedProfileIdentifier = self->_sharedProfileIdentifier;
  uint64_t v23 = *((void *)v4 + 7);
  if (sharedProfileIdentifier)
  {
    if (v23) {
      -[HDCloudSyncCodableProfileIdentifier mergeFrom:](sharedProfileIdentifier, "mergeFrom:");
    }
  }
  else if (v23)
  {
    -[HDCloudSyncCodableRegistry setSharedProfileIdentifier:](self, "setSharedProfileIdentifier:");
  }
}

- (NSMutableArray)disabledOwnerIdentifiers
{
  return self->_disabledOwnerIdentifiers;
}

- (void)setDisabledOwnerIdentifiers:(id)a3
{
}

- (NSMutableArray)stores
{
  return self->_stores;
}

- (void)setStores:(id)a3
{
}

- (NSMutableArray)disabledSyncIdentities
{
  return self->_disabledSyncIdentities;
}

- (void)setDisabledSyncIdentities:(id)a3
{
}

- (BOOL)deleted
{
  return self->_deleted;
}

- (NSString)displayFirstName
{
  return self->_displayFirstName;
}

- (void)setDisplayFirstName:(id)a3
{
}

- (double)displayNameModificationDate
{
  return self->_displayNameModificationDate;
}

- (NSString)displayLastName
{
  return self->_displayLastName;
}

- (void)setDisplayLastName:(id)a3
{
}

- (HDCloudSyncCodableProfileIdentifier)ownerProfileIdentifier
{
  return self->_ownerProfileIdentifier;
}

- (void)setOwnerProfileIdentifier:(id)a3
{
}

- (HDCloudSyncCodableProfileIdentifier)sharedProfileIdentifier
{
  return self->_sharedProfileIdentifier;
}

- (void)setSharedProfileIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stores, 0);
  objc_storeStrong((id *)&self->_sharedProfileIdentifier, 0);
  objc_storeStrong((id *)&self->_ownerProfileIdentifier, 0);
  objc_storeStrong((id *)&self->_displayLastName, 0);
  objc_storeStrong((id *)&self->_displayFirstName, 0);
  objc_storeStrong((id *)&self->_disabledSyncIdentities, 0);

  objc_storeStrong((id *)&self->_disabledOwnerIdentifiers, 0);
}

@end