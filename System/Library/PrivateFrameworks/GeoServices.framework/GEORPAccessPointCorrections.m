@interface GEORPAccessPointCorrections
+ (BOOL)isValid:(id)a3;
+ (Class)addedType;
+ (Class)editedType;
+ (Class)removedType;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPAccessPointCorrections)init;
- (GEORPAccessPointCorrections)initWithData:(id)a3;
- (GEORPAccessPointCorrections)initWithDictionary:(id)a3;
- (GEORPAccessPointCorrections)initWithJSON:(id)a3;
- (NSMutableArray)addeds;
- (NSMutableArray)editeds;
- (NSMutableArray)removeds;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)addedAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)editedAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)removedAtIndex:(unint64_t)a3;
- (unint64_t)addedsCount;
- (unint64_t)editedsCount;
- (unint64_t)hash;
- (unint64_t)removedsCount;
- (void)_addNoFlagsAdded:(uint64_t)a1;
- (void)_addNoFlagsEdited:(uint64_t)a1;
- (void)_addNoFlagsRemoved:(uint64_t)a1;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readAddeds;
- (void)_readEditeds;
- (void)_readRemoveds;
- (void)addAdded:(id)a3;
- (void)addEdited:(id)a3;
- (void)addRemoved:(id)a3;
- (void)clearAddeds;
- (void)clearEditeds;
- (void)clearRemoveds;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAddeds:(id)a3;
- (void)setEditeds:(id)a3;
- (void)setRemoveds:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPAccessPointCorrections

- (GEORPAccessPointCorrections)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPAccessPointCorrections;
  v2 = [(GEORPAccessPointCorrections *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPAccessPointCorrections)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPAccessPointCorrections;
  v3 = [(GEORPAccessPointCorrections *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readAddeds
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPAccessPointCorrectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddeds_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)addeds
{
  -[GEORPAccessPointCorrections _readAddeds]((uint64_t)self);
  addeds = self->_addeds;

  return addeds;
}

- (void)setAddeds:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  addeds = self->_addeds;
  self->_addeds = v4;
}

- (void)clearAddeds
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  addeds = self->_addeds;

  [(NSMutableArray *)addeds removeAllObjects];
}

- (void)addAdded:(id)a3
{
  id v4 = a3;
  -[GEORPAccessPointCorrections _readAddeds]((uint64_t)self);
  -[GEORPAccessPointCorrections _addNoFlagsAdded:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsAdded:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 24);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v5;

      id v4 = *(void **)(a1 + 24);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)addedsCount
{
  -[GEORPAccessPointCorrections _readAddeds]((uint64_t)self);
  addeds = self->_addeds;

  return [(NSMutableArray *)addeds count];
}

- (id)addedAtIndex:(unint64_t)a3
{
  -[GEORPAccessPointCorrections _readAddeds]((uint64_t)self);
  addeds = self->_addeds;

  return (id)[(NSMutableArray *)addeds objectAtIndex:a3];
}

+ (Class)addedType
{
  return (Class)objc_opt_class();
}

- (void)_readRemoveds
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPAccessPointCorrectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRemoveds_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)removeds
{
  -[GEORPAccessPointCorrections _readRemoveds]((uint64_t)self);
  removeds = self->_removeds;

  return removeds;
}

- (void)setRemoveds:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  removeds = self->_removeds;
  self->_removeds = v4;
}

- (void)clearRemoveds
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  removeds = self->_removeds;

  [(NSMutableArray *)removeds removeAllObjects];
}

- (void)addRemoved:(id)a3
{
  id v4 = a3;
  -[GEORPAccessPointCorrections _readRemoveds]((uint64_t)self);
  -[GEORPAccessPointCorrections _addNoFlagsRemoved:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsRemoved:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 40);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v5;

      id v4 = *(void **)(a1 + 40);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)removedsCount
{
  -[GEORPAccessPointCorrections _readRemoveds]((uint64_t)self);
  removeds = self->_removeds;

  return [(NSMutableArray *)removeds count];
}

- (id)removedAtIndex:(unint64_t)a3
{
  -[GEORPAccessPointCorrections _readRemoveds]((uint64_t)self);
  removeds = self->_removeds;

  return (id)[(NSMutableArray *)removeds objectAtIndex:a3];
}

+ (Class)removedType
{
  return (Class)objc_opt_class();
}

- (void)_readEditeds
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPAccessPointCorrectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEditeds_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)editeds
{
  -[GEORPAccessPointCorrections _readEditeds]((uint64_t)self);
  editeds = self->_editeds;

  return editeds;
}

- (void)setEditeds:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  editeds = self->_editeds;
  self->_editeds = v4;
}

- (void)clearEditeds
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  editeds = self->_editeds;

  [(NSMutableArray *)editeds removeAllObjects];
}

- (void)addEdited:(id)a3
{
  id v4 = a3;
  -[GEORPAccessPointCorrections _readEditeds]((uint64_t)self);
  -[GEORPAccessPointCorrections _addNoFlagsEdited:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsEdited:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      id v4 = *(void **)(a1 + 32);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)editedsCount
{
  -[GEORPAccessPointCorrections _readEditeds]((uint64_t)self);
  editeds = self->_editeds;

  return [(NSMutableArray *)editeds count];
}

- (id)editedAtIndex:(unint64_t)a3
{
  -[GEORPAccessPointCorrections _readEditeds]((uint64_t)self);
  editeds = self->_editeds;

  return (id)[(NSMutableArray *)editeds objectAtIndex:a3];
}

+ (Class)editedType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPAccessPointCorrections;
  id v4 = [(GEORPAccessPointCorrections *)&v8 description];
  id v5 = [(GEORPAccessPointCorrections *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPAccessPointCorrections _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 24) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v6 = *(id *)(a1 + 24);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v46 objects:v52 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v47;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v47 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v46 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v46 objects:v52 count:16];
        }
        while (v8);
      }

      [v4 setObject:v5 forKey:@"added"];
    }
    if ([*(id *)(a1 + 40) count])
    {
      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v14 = *(id *)(a1 + 40);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v42 objects:v51 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v43;
        do
        {
          for (uint64_t j = 0; j != v16; ++j)
          {
            if (*(void *)v43 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = *(void **)(*((void *)&v42 + 1) + 8 * j);
            if (a2) {
              [v19 jsonRepresentation];
            }
            else {
            v20 = [v19 dictionaryRepresentation];
            }
            [v13 addObject:v20];
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v42 objects:v51 count:16];
        }
        while (v16);
      }

      [v4 setObject:v13 forKey:@"removed"];
    }
    if ([*(id *)(a1 + 32) count])
    {
      v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v22 = *(id *)(a1 + 32);
      uint64_t v23 = [v22 countByEnumeratingWithState:&v38 objects:v50 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v39;
        do
        {
          for (uint64_t k = 0; k != v24; ++k)
          {
            if (*(void *)v39 != v25) {
              objc_enumerationMutation(v22);
            }
            v27 = *(void **)(*((void *)&v38 + 1) + 8 * k);
            if (a2) {
              [v27 jsonRepresentation];
            }
            else {
            v28 = [v27 dictionaryRepresentation];
            }
            [v21 addObject:v28];
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v38 objects:v50 count:16];
        }
        while (v24);
      }

      [v4 setObject:v21 forKey:@"edited"];
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
        v36[2] = __57__GEORPAccessPointCorrections__dictionaryRepresentation___block_invoke;
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
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPAccessPointCorrections _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __57__GEORPAccessPointCorrections__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    uint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEORPAccessPointCorrections)initWithDictionary:(id)a3
{
  return (GEORPAccessPointCorrections *)-[GEORPAccessPointCorrections _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      id v6 = [v5 objectForKeyedSubscript:@"added"];
      objc_opt_class();
      id v37 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        id v7 = v6;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v46 objects:v52 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v47;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v47 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void *)(*((void *)&v46 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v13 = [GEORoadAccessPoint alloc];
                if (a3) {
                  uint64_t v14 = [(GEORoadAccessPoint *)v13 initWithJSON:v12];
                }
                else {
                  uint64_t v14 = [(GEORoadAccessPoint *)v13 initWithDictionary:v12];
                }
                uint64_t v15 = (void *)v14;
                [a1 addAdded:v14];
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v46 objects:v52 count:16];
          }
          while (v9);
        }

        id v5 = v37;
      }

      uint64_t v16 = [v5 objectForKeyedSubscript:@"removed"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v17 = v16;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v42 objects:v51 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v43;
          do
          {
            for (uint64_t j = 0; j != v19; ++j)
            {
              if (*(void *)v43 != v20) {
                objc_enumerationMutation(v17);
              }
              uint64_t v22 = *(void *)(*((void *)&v42 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v23 = [GEORoadAccessPoint alloc];
                if (a3) {
                  uint64_t v24 = [(GEORoadAccessPoint *)v23 initWithJSON:v22];
                }
                else {
                  uint64_t v24 = [(GEORoadAccessPoint *)v23 initWithDictionary:v22];
                }
                uint64_t v25 = (void *)v24;
                [a1 addRemoved:v24];
              }
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v42 objects:v51 count:16];
          }
          while (v19);
        }

        id v5 = v37;
      }

      v26 = [v5 objectForKeyedSubscript:@"edited"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v27 = v26;
        uint64_t v28 = [v27 countByEnumeratingWithState:&v38 objects:v50 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v39;
          do
          {
            for (uint64_t k = 0; k != v29; ++k)
            {
              if (*(void *)v39 != v30) {
                objc_enumerationMutation(v27);
              }
              uint64_t v32 = *(void *)(*((void *)&v38 + 1) + 8 * k);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v33 = [GEORPEditedAccessPoint alloc];
                if (a3) {
                  uint64_t v34 = [(GEORPEditedAccessPoint *)v33 initWithJSON:v32];
                }
                else {
                  uint64_t v34 = [(GEORPEditedAccessPoint *)v33 initWithDictionary:v32];
                }
                v35 = (void *)v34;
                [a1 addEdited:v34];
              }
            }
            uint64_t v29 = [v27 countByEnumeratingWithState:&v38 objects:v50 count:16];
          }
          while (v29);
        }

        id v5 = v37;
      }
    }
  }

  return a1;
}

- (GEORPAccessPointCorrections)initWithJSON:(id)a3
{
  return (GEORPAccessPointCorrections *)-[GEORPAccessPointCorrections _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_10;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_10;
    }
    GEORPAccessPointCorrectionsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORPAccessPointCorrectionsCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPAccessPointCorrectionsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPAccessPointCorrectionsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPAccessPointCorrectionsIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v18 = self->_reader;
    objc_sync_enter(v18);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v19 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v19];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v18);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPAccessPointCorrections *)self readAll:0];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v6 = self->_addeds;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v29 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v7);
    }

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v10 = self->_removeds;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
      }
      while (v11);
    }

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v14 = self->_editeds;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v20 objects:v32 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v21;
      do
      {
        for (uint64_t k = 0; k != v15; ++k)
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v14);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v20 objects:v32 count:16];
      }
      while (v15);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v20);
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  -[GEORPAccessPointCorrections _readAddeds]((uint64_t)self);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = self->_addeds;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v29 != v8) {
        objc_enumerationMutation(v5);
      }
      if ([*(id *)(*((void *)&v28 + 1) + 8 * v9) hasGreenTeaWithValue:v3]) {
        goto LABEL_26;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  -[GEORPAccessPointCorrections _readEditeds]((uint64_t)self);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = self->_editeds;
  uint64_t v10 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v25;
LABEL_11:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v25 != v12) {
        objc_enumerationMutation(v5);
      }
      if ([*(id *)(*((void *)&v24 + 1) + 8 * v13) hasGreenTeaWithValue:v3]) {
        goto LABEL_26;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v24 objects:v33 count:16];
        if (v11) {
          goto LABEL_11;
        }
        break;
      }
    }
  }

  -[GEORPAccessPointCorrections _readRemoveds]((uint64_t)self);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = self->_removeds;
  uint64_t v14 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
LABEL_19:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v21 != v16) {
        objc_enumerationMutation(v5);
      }
      if (objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v17), "hasGreenTeaWithValue:", v3, (void)v20)) {
        break;
      }
      if (v15 == ++v17)
      {
        uint64_t v15 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v32 count:16];
        if (v15) {
          goto LABEL_19;
        }
        goto LABEL_25;
      }
    }
LABEL_26:
    BOOL v18 = 1;
    goto LABEL_27;
  }
LABEL_25:
  BOOL v18 = 0;
LABEL_27:

  return v18;
}

- (void)copyTo:(id)a3
{
  uint64_t v16 = (id *)a3;
  [(GEORPAccessPointCorrections *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v16 + 1, self->_reader);
  *((_DWORD *)v16 + 12) = self->_readerMarkPos;
  *((_DWORD *)v16 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEORPAccessPointCorrections *)self addedsCount])
  {
    [v16 clearAddeds];
    unint64_t v4 = [(GEORPAccessPointCorrections *)self addedsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEORPAccessPointCorrections *)self addedAtIndex:i];
        [v16 addAdded:v7];
      }
    }
  }
  if ([(GEORPAccessPointCorrections *)self removedsCount])
  {
    [v16 clearRemoveds];
    unint64_t v8 = [(GEORPAccessPointCorrections *)self removedsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEORPAccessPointCorrections *)self removedAtIndex:j];
        [v16 addRemoved:v11];
      }
    }
  }
  if ([(GEORPAccessPointCorrections *)self editedsCount])
  {
    [v16 clearEditeds];
    unint64_t v12 = [(GEORPAccessPointCorrections *)self editedsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(GEORPAccessPointCorrections *)self editedAtIndex:k];
        [v16 addEdited:v15];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORPAccessPointCorrectionsReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPAccessPointCorrections *)self readAll:0];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  unint64_t v8 = self->_addeds;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(v8);
        }
        unint64_t v12 = (void *)[*(id *)(*((void *)&v32 + 1) + 8 * i) copyWithZone:a3];
        [v5 addAdded:v12];
      }
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v9);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  unint64_t v13 = self->_removeds;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = (void *)[*(id *)(*((void *)&v28 + 1) + 8 * j) copyWithZone:a3];
        [v5 addRemoved:v17];
      }
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v28 objects:v37 count:16];
    }
    while (v14);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  BOOL v18 = self->_editeds;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v24 objects:v36 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v25;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v25 != v20) {
          objc_enumerationMutation(v18);
        }
        long long v22 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * k), "copyWithZone:", a3, (void)v24);
        [v5 addEdited:v22];
      }
      uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v24 objects:v36 count:16];
    }
    while (v19);
  }

  objc_storeStrong(v5 + 2, self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEORPAccessPointCorrections *)self readAll:1],
         [v4 readAll:1],
         addeds = self->_addeds,
         !((unint64_t)addeds | v4[3]))
     || -[NSMutableArray isEqual:](addeds, "isEqual:"))
    && ((removeds = self->_removeds, !((unint64_t)removeds | v4[5]))
     || -[NSMutableArray isEqual:](removeds, "isEqual:")))
  {
    editeds = self->_editeds;
    if ((unint64_t)editeds | v4[4]) {
      char v8 = -[NSMutableArray isEqual:](editeds, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  [(GEORPAccessPointCorrections *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_addeds hash];
  uint64_t v4 = [(NSMutableArray *)self->_removeds hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_editeds hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)a3;
  [v4 readAll:0];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = v4[3];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
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
        [(GEORPAccessPointCorrections *)self addAdded:*(void *)(*((void *)&v28 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = v4[5];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
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
        [(GEORPAccessPointCorrections *)self addRemoved:*(void *)(*((void *)&v24 + 1) + 8 * v14++)];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v15 = v4[4];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
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
        -[GEORPAccessPointCorrections addEdited:](self, "addEdited:", *(void *)(*((void *)&v20 + 1) + 8 * v19++), (void)v20);
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      id v5 = reader;
      objc_sync_enter(v5);
      GEORPAccessPointCorrectionsReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1);
      objc_sync_exit(v5);
    }
  }
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;

  return unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x11u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORPAccessPointCorrections *)self readAll:0];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v7 = self->_addeds;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v31;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v31 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v30 + 1) + 8 * v11++) clearUnknownFields:1];
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v9);
    }

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v12 = self->_removeds;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v26 objects:v35 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v27;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v27 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v26 + 1) + 8 * v16++) clearUnknownFields:1];
        }
        while (v14 != v16);
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v26 objects:v35 count:16];
      }
      while (v14);
    }

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v17 = self->_editeds;
    uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v22 objects:v34 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v23;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v23 != v20) {
            objc_enumerationMutation(v17);
          }
          objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * v21++), "clearUnknownFields:", 1, (void)v22);
        }
        while (v19 != v21);
        uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v22 objects:v34 count:16];
      }
      while (v19);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removeds, 0);
  objc_storeStrong((id *)&self->_editeds, 0);
  objc_storeStrong((id *)&self->_addeds, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end