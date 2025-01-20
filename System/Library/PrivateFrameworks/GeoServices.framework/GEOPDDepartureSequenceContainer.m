@interface GEOPDDepartureSequenceContainer
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDDepartureSequenceContainer)init;
- (GEOPDDepartureSequenceContainer)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)displayName;
- (id)jsonRepresentation;
- (id)labels;
- (uint64_t)departureSequenceIndexAtIndex:(uint64_t)result;
- (unint64_t)hash;
- (void)_addNoFlagsLabel:(uint64_t)a1;
- (void)_readDepartureSequenceIndexs;
- (void)_readDisplayName;
- (void)_readLabels;
- (void)addLabel:(uint64_t)a1;
- (void)dealloc;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDDepartureSequenceContainer

- (GEOPDDepartureSequenceContainer)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDDepartureSequenceContainer;
  v2 = [(GEOPDDepartureSequenceContainer *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDDepartureSequenceContainer)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDDepartureSequenceContainer;
  v3 = [(GEOPDDepartureSequenceContainer *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDDepartureSequenceContainer;
  [(GEOPDDepartureSequenceContainer *)&v3 dealloc];
}

- (void)_readDepartureSequenceIndexs
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDDepartureSequenceContainerReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDepartureSequenceIndexs_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (uint64_t)departureSequenceIndexAtIndex:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPDDepartureSequenceContainer _readDepartureSequenceIndexs](result);
    unint64_t v4 = *(void *)(v3 + 32);
    if (v4 <= a2)
    {
      v5 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v6 = *MEMORY[0x1E4F1C4A8];
      objc_super v7 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a2, v4);
      v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];
      [v8 raise];
    }
    return *(void *)(*(void *)(v3 + 24) + 8 * a2);
  }
  return result;
}

- (void)_readLabels
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDDepartureSequenceContainerReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLabels_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)labels
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDDepartureSequenceContainer _readLabels]((uint64_t)a1);
    a1 = (id *)v2[7];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addLabel:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDDepartureSequenceContainer _readLabels](a1);
    -[GEOPDDepartureSequenceContainer _addNoFlagsLabel:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 80) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    *(unsigned char *)(a1 + 80) |= 0x20u;
  }
}

- (void)_addNoFlagsLabel:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    unint64_t v4 = *(void **)(a1 + 56);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v5;

      unint64_t v4 = *(void **)(a1 + 56);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readDisplayName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDDepartureSequenceContainerReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayName_tags_4003);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)displayName
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDDepartureSequenceContainer _readDisplayName]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDDepartureSequenceContainer;
  unint64_t v4 = [(GEOPDDepartureSequenceContainer *)&v8 description];
  id v5 = [(GEOPDDepartureSequenceContainer *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDDepartureSequenceContainer _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDDepartureSequenceContainer readAll:](a1, 1);
    unint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(void *)(a1 + 32))
    {
      id v5 = PBRepeatedUInt64NSArray();
      if (a2) {
        uint64_t v6 = @"departureSequenceIndex";
      }
      else {
        uint64_t v6 = @"departure_sequence_index";
      }
      [v4 setObject:v5 forKey:v6];
    }
    if ([*(id *)(a1 + 56) count])
    {
      id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v8 = *(id *)(a1 + 56);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v29 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            if (a2) {
              [v13 jsonRepresentation];
            }
            else {
            v14 = [v13 dictionaryRepresentation];
            }
            [v7 addObject:v14];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v10);
      }

      [v4 setObject:v7 forKey:@"label"];
    }
    if (*(unsigned char *)(a1 + 80))
    {
      v15 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 76)];
      if (a2) {
        v16 = @"isSignificant";
      }
      else {
        v16 = @"is_significant";
      }
      [v4 setObject:v15 forKey:v16];
    }
    v17 = -[GEOPDDepartureSequenceContainer displayName]((id *)a1);
    if (v17)
    {
      if (a2) {
        v18 = @"displayName";
      }
      else {
        v18 = @"display_name";
      }
      [v4 setObject:v17 forKey:v18];
    }

    v19 = *(void **)(a1 + 16);
    if (v19)
    {
      v20 = [v19 dictionaryRepresentation];
      v21 = v20;
      if (a2)
      {
        v22 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v20, "count"));
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __61__GEOPDDepartureSequenceContainer__dictionaryRepresentation___block_invoke;
        v26[3] = &unk_1E53D8860;
        id v23 = v22;
        id v27 = v23;
        [v21 enumerateKeysAndObjectsUsingBlock:v26];
        id v24 = v23;

        v21 = v24;
      }
      [v4 setObject:v21 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDDepartureSequenceContainer _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    unint64_t v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        uint64_t v6 = (int *)&readAll__recursiveTag_4019;
      }
      else {
        uint64_t v6 = (int *)&readAll__nonRecursiveTag_4020;
      }
      GEOPDDepartureSequenceContainerReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDDepartureSequenceContainerCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

void __61__GEOPDDepartureSequenceContainer__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    id v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    id v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDDepartureSequenceContainerReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x3C) == 0))
  {
    uint64_t v11 = self->_reader;
    objc_sync_enter(v11);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v12 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v12];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v11);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDDepartureSequenceContainer readAll:]((uint64_t)self, 0);
    if (self->_departureSequenceIndexs.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteUint64Field();
        ++v6;
      }
      while (v6 < self->_departureSequenceIndexs.count);
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = self->_labels;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v7);
          }
          PBDataWriterWriteSubmessage();
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_displayName) {
      PBDataWriterWriteStringField();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v13);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDDepartureSequenceContainerReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_15;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDDepartureSequenceContainer readAll:]((uint64_t)self, 0);
  PBRepeatedUInt64Copy();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v9 = self->_labels;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v9);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (void)v18);
        -[GEOPDDepartureSequenceContainer addLabel:](v5, v13);
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  if (*(unsigned char *)&self->_flags)
  {
    *(unsigned char *)(v5 + 76) = self->_isSignificant;
    *(unsigned char *)(v5 + 80) |= 1u;
  }
  uint64_t v14 = -[NSString copyWithZone:](self->_displayName, "copyWithZone:", a3, (void)v18);
  long long v15 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v14;

  long long v16 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v16;
LABEL_15:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  -[GEOPDDepartureSequenceContainer readAll:]((uint64_t)self, 1);
  -[GEOPDDepartureSequenceContainer readAll:]((uint64_t)v4, 1);
  if (!PBRepeatedUInt64IsEqual()) {
    goto LABEL_9;
  }
  labels = self->_labels;
  if ((unint64_t)labels | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](labels, "isEqual:")) {
      goto LABEL_9;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if (*((unsigned char *)v4 + 80))
    {
      if (self->_isSignificant)
      {
        if (*((unsigned char *)v4 + 76)) {
          goto LABEL_15;
        }
      }
      else if (!*((unsigned char *)v4 + 76))
      {
        goto LABEL_15;
      }
    }
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  if (*((unsigned char *)v4 + 80)) {
    goto LABEL_9;
  }
LABEL_15:
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((void *)v4 + 6)) {
    char v6 = -[NSString isEqual:](displayName, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  -[GEOPDDepartureSequenceContainer readAll:]((uint64_t)self, 1);
  uint64_t v3 = PBRepeatedUInt64Hash();
  uint64_t v4 = [(NSMutableArray *)self->_labels hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v5 = 2654435761 * self->_isSignificant;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ [(NSString *)self->_displayName hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end