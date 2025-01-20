@interface GEOPDPlaceLookupParameters
+ (Class)identifierType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDPlaceLookupParameters)init;
- (GEOPDPlaceLookupParameters)initWithData:(id)a3;
- (GEOPDPlaceLookupParameters)initWithIdentifiers:(id)a3 resultProviderID:(int)a4;
- (NSMutableArray)identifiers;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)identifierAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unint64_t)identifiersCount;
- (void)_addNoFlagsIdentifier:(uint64_t)a1;
- (void)_readIdentifiers;
- (void)_readMuids;
- (void)addIdentifier:(id)a3;
- (void)addMuid:(uint64_t)a1;
- (void)clearIdentifiers;
- (void)dealloc;
- (void)readAll:(uint64_t)a1;
- (void)setIdentifiers:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDPlaceLookupParameters

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        v6 = (int *)&readAll__recursiveTag_5092;
      }
      else {
        v6 = (int *)&readAll__nonRecursiveTag_5093;
      }
      GEOPDPlaceLookupParametersReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDPlaceLookupParametersCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (GEOPDPlaceLookupParameters)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDPlaceLookupParameters;
  v2 = [(GEOPDPlaceLookupParameters *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDPlaceLookupParameters)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDPlaceLookupParameters;
  v3 = [(GEOPDPlaceLookupParameters *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDPlaceLookupParameters;
  [(GEOPDPlaceLookupParameters *)&v3 dealloc];
}

- (void)_readMuids
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceLookupParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMuids_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (void)addMuid:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDPlaceLookupParameters _readMuids](a1);
    PBRepeatedUInt64Add();
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 76) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(unsigned char *)(a1 + 76) |= 0x20u;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDPlaceLookupParameters;
  v4 = [(GEOPDPlaceLookupParameters *)&v8 description];
  id v5 = [(GEOPDPlaceLookupParameters *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlaceLookupParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDPlaceLookupParameters readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 76))
    {
      id v5 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 68)];
      if (a2) {
        objc_super v6 = @"resultProviderId";
      }
      else {
        objc_super v6 = @"result_provider_id";
      }
      [v4 setObject:v5 forKey:v6];
    }
    if (*(void *)(a1 + 32))
    {
      objc_super v7 = PBRepeatedUInt64NSArray();
      [v4 setObject:v7 forKey:@"muid"];
    }
    if ((*(unsigned char *)(a1 + 76) & 2) != 0)
    {
      objc_super v8 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 72)];
      if (a2) {
        v9 = @"enablePartialClientization";
      }
      else {
        v9 = @"enable_partial_clientization";
      }
      [v4 setObject:v8 forKey:v9];
    }
    if ([*(id *)(a1 + 48) count])
    {
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v11 = *(id *)(a1 + 48);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v28 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            if (a2) {
              [v16 jsonRepresentation];
            }
            else {
            v17 = [v16 dictionaryRepresentation];
            }
            [v10 addObject:v17];
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v13);
      }

      [v4 setObject:v10 forKey:@"identifier"];
    }
    v18 = *(void **)(a1 + 16);
    if (v18)
    {
      v19 = [v18 dictionaryRepresentation];
      v20 = v19;
      if (a2)
      {
        v21 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v19, "count"));
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __56__GEOPDPlaceLookupParameters__dictionaryRepresentation___block_invoke;
        v25[3] = &unk_1E53D8860;
        id v22 = v21;
        id v26 = v22;
        [v20 enumerateKeysAndObjectsUsingBlock:v25];
        id v23 = v22;

        v20 = v23;
      }
      [v4 setObject:v20 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDPlaceLookupParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __56__GEOPDPlaceLookupParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlaceLookupParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x38) == 0))
  {
    id v11 = self->_reader;
    objc_sync_enter(v11);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v12 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v12];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v11);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDPlaceLookupParameters readAll:]((uint64_t)self, 0);
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_muids.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteUint64Field();
        ++v6;
      }
      while (v6 < self->_muids.count);
    }
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      PBDataWriterWriteBOOLField();
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    objc_super v7 = self->_identifiers;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v7);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v13);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDPlaceLookupParametersReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_17;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDPlaceLookupParameters readAll:]((uint64_t)self, 0);
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 68) = self->_resultProviderId;
    *(unsigned char *)(v5 + 76) |= 1u;
  }
  PBRepeatedUInt64Copy();
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 72) = self->_enablePartialClientization;
    *(unsigned char *)(v5 + 76) |= 2u;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v9 = self->_identifiers;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v9);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "copyWithZone:", a3, (void)v16);
        [(id)v5 addIdentifier:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  long long v14 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v14;
LABEL_17:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  -[GEOPDPlaceLookupParameters readAll:]((uint64_t)self, 1);
  -[GEOPDPlaceLookupParameters readAll:]((uint64_t)v4, 1);
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 76) & 1) == 0 || self->_resultProviderId != *((_DWORD *)v4 + 17)) {
      goto LABEL_12;
    }
  }
  else if (*((unsigned char *)v4 + 76))
  {
    goto LABEL_12;
  }
  if (!PBRepeatedUInt64IsEqual()) {
    goto LABEL_12;
  }
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    if ((*((unsigned char *)v4 + 76) & 2) == 0) {
      goto LABEL_18;
    }
LABEL_12:
    char v5 = 0;
    goto LABEL_13;
  }
  if ((*((unsigned char *)v4 + 76) & 2) == 0) {
    goto LABEL_12;
  }
  if (!self->_enablePartialClientization)
  {
    if (!*((unsigned char *)v4 + 72)) {
      goto LABEL_18;
    }
    goto LABEL_12;
  }
  if (!*((unsigned char *)v4 + 72)) {
    goto LABEL_12;
  }
LABEL_18:
  identifiers = self->_identifiers;
  if ((unint64_t)identifiers | *((void *)v4 + 6)) {
    char v5 = -[NSMutableArray isEqual:](identifiers, "isEqual:");
  }
  else {
    char v5 = 1;
  }
LABEL_13:

  return v5;
}

- (unint64_t)hash
{
  -[GEOPDPlaceLookupParameters readAll:]((uint64_t)self, 1);
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_resultProviderId;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = PBRepeatedUInt64Hash();
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_enablePartialClientization;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ [(NSMutableArray *)self->_identifiers hash];
}

- (void)_readIdentifiers
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceLookupParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIdentifiers_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)identifiers
{
  -[GEOPDPlaceLookupParameters _readIdentifiers]((uint64_t)self);
  identifiers = self->_identifiers;

  return identifiers;
}

- (void)setIdentifiers:(id)a3
{
  uint64_t v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  identifiers = self->_identifiers;
  self->_identifiers = v4;
}

- (void)clearIdentifiers
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  identifiers = self->_identifiers;

  [(NSMutableArray *)identifiers removeAllObjects];
}

- (void)addIdentifier:(id)a3
{
  id v4 = a3;
  -[GEOPDPlaceLookupParameters _readIdentifiers]((uint64_t)self);
  -[GEOPDPlaceLookupParameters _addNoFlagsIdentifier:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsIdentifier:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 48);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      unint64_t v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;

      id v4 = *(void **)(a1 + 48);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)identifiersCount
{
  -[GEOPDPlaceLookupParameters _readIdentifiers]((uint64_t)self);
  identifiers = self->_identifiers;

  return [(NSMutableArray *)identifiers count];
}

- (id)identifierAtIndex:(unint64_t)a3
{
  -[GEOPDPlaceLookupParameters _readIdentifiers]((uint64_t)self);
  identifiers = self->_identifiers;

  return (id)[(NSMutableArray *)identifiers objectAtIndex:a3];
}

+ (Class)identifierType
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOPDPlaceLookupParameters)initWithIdentifiers:(id)a3 resultProviderID:(int)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)GEOPDPlaceLookupParameters;
  id v7 = [(GEOPDPlaceLookupParameters *)&v20 init];
  if (v7)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v12), "muid", (void)v16);
          -[GEOPDPlaceLookupParameters addMuid:]((uint64_t)v7);
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v10);
    }

    if (a4
      || (+[GEOMapService sharedService],
          long long v13 = objc_claimAutoreleasedReturnValue(),
          a4 = [v13 localSearchProviderID],
          v13,
          a4))
    {
      *(unsigned char *)&v7->_flags |= 0x20u;
      *(unsigned char *)&v7->_flags |= 1u;
      v7->_resultProviderId = a4;
    }
    long long v14 = v7;
  }

  return v7;
}

@end