@interface GEOPDContainedPlace
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDContainedPlace)init;
- (GEOPDContainedPlace)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)childPlaces;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)parentPlace;
- (id)siblingPlaces;
- (unint64_t)hash;
- (void)_addNoFlagsChildPlace:(uint64_t)a1;
- (void)_addNoFlagsSiblingPlace:(uint64_t)a1;
- (void)_readChildPlaces;
- (void)_readParentPlace;
- (void)_readSiblingPlaces;
- (void)addChildPlace:(uint64_t)a1;
- (void)addSiblingPlace:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDContainedPlace

- (GEOPDContainedPlace)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDContainedPlace;
  v2 = [(GEOPDContainedPlace *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDContainedPlace)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDContainedPlace;
  v3 = [(GEOPDContainedPlace *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readParentPlace
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDContainedPlaceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readParentPlace_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)parentPlace
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDContainedPlace _readParentPlace]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readChildPlaces
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDContainedPlaceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readChildPlaces_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)childPlaces
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDContainedPlace _readChildPlaces]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addChildPlace:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDContainedPlace _readChildPlaces](a1);
    -[GEOPDContainedPlace _addNoFlagsChildPlace:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 68) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(unsigned char *)(a1 + 68) |= 0x20u;
  }
}

- (void)_addNoFlagsChildPlace:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v5;

      v4 = *(void **)(a1 + 24);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readSiblingPlaces
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDContainedPlaceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSiblingPlaces_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)siblingPlaces
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDContainedPlace _readSiblingPlaces]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addSiblingPlace:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDContainedPlace _readSiblingPlaces](a1);
    -[GEOPDContainedPlace _addNoFlagsSiblingPlace:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 68) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(unsigned char *)(a1 + 68) |= 0x20u;
  }
}

- (void)_addNoFlagsSiblingPlace:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 48);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;

      v4 = *(void **)(a1 + 48);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDContainedPlace;
  v4 = [(GEOPDContainedPlace *)&v8 description];
  id v5 = [(GEOPDContainedPlace *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDContainedPlace _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDContainedPlace readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = -[GEOPDContainedPlace parentPlace]((id *)a1);
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        id v7 = [v5 jsonRepresentation];
        objc_super v8 = @"parentPlace";
      }
      else
      {
        id v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"parent_place";
      }
      [v4 setObject:v7 forKey:v8];
    }
    if ([*(id *)(a1 + 24) count])
    {
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v10 = *(id *)(a1 + 24);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v42 objects:v47 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v43;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v43 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v42 + 1) + 8 * i);
            if (a2) {
              [v15 jsonRepresentation];
            }
            else {
            v16 = [v15 dictionaryRepresentation];
            }
            [v9 addObject:v16];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v42 objects:v47 count:16];
        }
        while (v12);
      }

      if (a2) {
        v17 = @"childPlace";
      }
      else {
        v17 = @"child_place";
      }
      [v4 setObject:v9 forKey:v17];
    }
    if (*(unsigned char *)(a1 + 68))
    {
      v18 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 32)];
      if (a2) {
        v19 = @"featureId";
      }
      else {
        v19 = @"feature_id";
      }
      [v4 setObject:v18 forKey:v19];
    }
    if ([*(id *)(a1 + 48) count])
    {
      v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v21 = *(id *)(a1 + 48);
      uint64_t v22 = [v21 countByEnumeratingWithState:&v38 objects:v46 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v39;
        do
        {
          for (uint64_t j = 0; j != v23; ++j)
          {
            if (*(void *)v39 != v24) {
              objc_enumerationMutation(v21);
            }
            v26 = *(void **)(*((void *)&v38 + 1) + 8 * j);
            if (a2) {
              [v26 jsonRepresentation];
            }
            else {
            v27 = [v26 dictionaryRepresentation];
            }
            [v20 addObject:v27];
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v38 objects:v46 count:16];
        }
        while (v23);
      }

      if (a2) {
        v28 = @"siblingPlace";
      }
      else {
        v28 = @"sibling_place";
      }
      [v4 setObject:v20 forKey:v28];
    }
    v29 = *(void **)(a1 + 16);
    if (v29)
    {
      v30 = [v29 dictionaryRepresentation];
      v31 = v30;
      if (a2)
      {
        v32 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v30, "count"));
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __49__GEOPDContainedPlace__dictionaryRepresentation___block_invoke;
        v36[3] = &unk_1E53D8860;
        id v33 = v32;
        id v37 = v33;
        [v31 enumerateKeysAndObjectsUsingBlock:v36];
        id v34 = v33;

        v31 = v34;
      }
      [v4 setObject:v31 forKey:@"Unknown Fields"];
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
  return -[GEOPDContainedPlace _dictionaryRepresentation:]((uint64_t)self, 1);
}

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
        objc_super v6 = (int *)&readAll__recursiveTag_3483;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_3484;
      }
      GEOPDContainedPlaceReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDContainedPlaceCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __49__GEOPDContainedPlace__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
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
  return GEOPDContainedPlaceReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader) {
    goto LABEL_29;
  }
  os_unfair_lock_assert_owner(&self->_readerLock);
  char flags = (char)self->_flags;
  if ((flags & 0x20) != 0) {
    goto LABEL_29;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if (GEOPDLinkedPlaceIsDirty((uint64_t)self->_parentPlace)) {
      goto LABEL_29;
    }
    char flags = (char)self->_flags;
  }
  if ((flags & 0x14) == 0)
  {
    if ((flags & 4) != 0)
    {
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v7 = self->_childPlaces;
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v36 objects:v43 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v37;
LABEL_10:
        uint64_t v10 = 0;
        while (1)
        {
          if (*(void *)v37 != v9) {
            objc_enumerationMutation(v7);
          }
          if (GEOPDLinkedPlaceIsDirty(*(void *)(*((void *)&v36 + 1) + 8 * v10))) {
            goto LABEL_28;
          }
          if (v8 == ++v10)
          {
            uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v36 objects:v43 count:16];
            if (v8) {
              goto LABEL_10;
            }
            break;
          }
        }
      }

      char flags = (char)self->_flags;
    }
    if ((flags & 0x10) != 0)
    {
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v7 = self->_siblingPlaces;
      uint64_t v11 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v32 objects:v42 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v33;
LABEL_20:
        uint64_t v13 = 0;
        while (1)
        {
          if (*(void *)v33 != v12) {
            objc_enumerationMutation(v7);
          }
          if (GEOPDLinkedPlaceIsDirty(*(void *)(*((void *)&v32 + 1) + 8 * v13))) {
            break;
          }
          if (v11 == ++v13)
          {
            uint64_t v11 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v32 objects:v42 count:16];
            if (v11) {
              goto LABEL_20;
            }
            goto LABEL_26;
          }
        }
LABEL_28:

        goto LABEL_29;
      }
LABEL_26:
    }
    v14 = self->_reader;
    objc_sync_enter(v14);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v15 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v15];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v14);
    goto LABEL_48;
  }
LABEL_29:
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDContainedPlace readAll:]((uint64_t)self, 0);
  if (self->_parentPlace) {
    PBDataWriterWriteSubmessage();
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v16 = self->_childPlaces;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v28 objects:v41 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v29 != v18) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v28 objects:v41 count:16];
    }
    while (v17);
  }

  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteUint64Field();
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v20 = self->_siblingPlaces;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v24 objects:v40 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v25 != v22) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v24 objects:v40 count:16];
    }
    while (v21);
  }

  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v24);
LABEL_48:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
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
      GEOPDContainedPlaceReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_22;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDContainedPlace readAll:]((uint64_t)self, 0);
  id v9 = [(GEOPDLinkedPlace *)self->_parentPlace copyWithZone:a3];
  uint64_t v10 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v9;

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v11 = self->_childPlaces;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v11);
        }
        v15 = (void *)[*(id *)(*((void *)&v27 + 1) + 8 * i) copyWithZone:a3];
        -[GEOPDContainedPlace addChildPlace:](v5, v15);
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v12);
  }

  if (*(unsigned char *)&self->_flags)
  {
    *(void *)(v5 + 32) = self->_featureId;
    *(unsigned char *)(v5 + 68) |= 1u;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v16 = self->_siblingPlaces;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v16);
        }
        v20 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * j), "copyWithZone:", a3, (void)v23);
        -[GEOPDContainedPlace addSiblingPlace:](v5, v20);
      }
      uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v17);
  }

  uint64_t v21 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v21;
LABEL_22:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  -[GEOPDContainedPlace readAll:]((uint64_t)self, 1);
  -[GEOPDContainedPlace readAll:]((uint64_t)v4, 1);
  parentPlace = self->_parentPlace;
  if ((unint64_t)parentPlace | *((void *)v4 + 5))
  {
    if (!-[GEOPDLinkedPlace isEqual:](parentPlace, "isEqual:")) {
      goto LABEL_13;
    }
  }
  childPlaces = self->_childPlaces;
  if ((unint64_t)childPlaces | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](childPlaces, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_featureId != *((void *)v4 + 4)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  siblingPlaces = self->_siblingPlaces;
  if ((unint64_t)siblingPlaces | *((void *)v4 + 6)) {
    char v8 = -[NSMutableArray isEqual:](siblingPlaces, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  -[GEOPDContainedPlace readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOPDLinkedPlace *)self->_parentPlace hash];
  uint64_t v4 = [(NSMutableArray *)self->_childPlaces hash];
  if (*(unsigned char *)&self->_flags) {
    unint64_t v5 = 2654435761u * self->_featureId;
  }
  else {
    unint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ [(NSMutableArray *)self->_siblingPlaces hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siblingPlaces, 0);
  objc_storeStrong((id *)&self->_parentPlace, 0);
  objc_storeStrong((id *)&self->_childPlaces, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end