@interface GEOPDSearchTokenCandidates
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchTokenCandidates)init;
- (GEOPDSearchTokenCandidates)initWithData:(id)a3;
- (_BYTE)_initWithDictionary:(int)a3 isJSON:;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_addNoFlagsCandidates:(uint64_t)a1;
- (void)addCandidates:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchTokenCandidates

- (GEOPDSearchTokenCandidates)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchTokenCandidates;
  v2 = [(GEOPDSearchTokenCandidates *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchTokenCandidates)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchTokenCandidates;
  v3 = [(GEOPDSearchTokenCandidates *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)addCandidates:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 48) & 4) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchTokenCandidatesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCandidates_tags_1);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    -[GEOPDSearchTokenCandidates _addNoFlagsCandidates:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 48) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    *(unsigned char *)(a1 + 48) |= 0x10u;
  }
}

- (void)_addNoFlagsCandidates:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 16);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v5;

      v4 = *(void **)(a1 + 16);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchTokenCandidates;
  v4 = [(GEOPDSearchTokenCandidates *)&v8 description];
  id v5 = [(GEOPDSearchTokenCandidates *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchTokenCandidates _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDSearchTokenCandidates readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 48) & 8) == 0)
    {
      id v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOPDSearchTokenCandidatesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readToken_tags_3);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    id v7 = *(id *)(a1 + 24);
    objc_super v8 = v7;
    if (v7)
    {
      if (a2) {
        [v7 jsonRepresentation];
      }
      else {
      v9 = [v7 dictionaryRepresentation];
      }
      [v4 setObject:v9 forKey:@"token"];
    }
    char v10 = *(unsigned char *)(a1 + 48);
    if (v10)
    {
      v11 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 44)];
      if (a2) {
        v12 = @"isMerged";
      }
      else {
        v12 = @"is_merged";
      }
      [v4 setObject:v11 forKey:v12];

      char v10 = *(unsigned char *)(a1 + 48);
    }
    if ((v10 & 2) != 0)
    {
      v13 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 45)];
      if (a2) {
        v14 = @"isSplit";
      }
      else {
        v14 = @"is_split";
      }
      [v4 setObject:v13 forKey:v14];
    }
    if ([*(id *)(a1 + 16) count])
    {
      v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v16 = *(id *)(a1 + 16);
      uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v24 != v18) {
              objc_enumerationMutation(v16);
            }
            v20 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            if (a2) {
              [v20 jsonRepresentation];
            }
            else {
            v21 = objc_msgSend(v20, "dictionaryRepresentation", (void)v23);
            }
            objc_msgSend(v15, "addObject:", v21, (void)v23);
          }
          uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v17);
      }

      [v4 setObject:v15 forKey:@"candidates"];
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
  return -[GEOPDSearchTokenCandidates _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_430;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_431;
      }
      GEOPDSearchTokenCandidatesReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDSearchTokenCandidatesCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (_BYTE)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    id v6 = (unsigned char *)[a1 init];
    if (v6)
    {
      id v7 = [v5 objectForKeyedSubscript:@"token"];
      unint64_t v8 = 0x1E4F1C000uLL;
      objc_opt_class();
      v45 = v6;
      if (objc_opt_isKindOfClass())
      {
        v9 = [GEOPDSearchTokenSet alloc];
        if (v9) {
          char v10 = (void *)-[GEOPDSearchTokenSet _initWithDictionary:isJSON:](v9, v7, a3);
        }
        else {
          char v10 = 0;
        }
        id v11 = v10;
        v45[48] |= 8u;
        v45[48] |= 0x10u;
        v12 = v10;
        id v6 = v45;
        objc_storeStrong((id *)v45 + 3, v12);
      }
      if (a3) {
        v13 = @"isMerged";
      }
      else {
        v13 = @"is_merged";
      }
      v14 = [v5 objectForKeyedSubscript:v13];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char v15 = [v14 BOOLValue];
        v6[48] |= 0x10u;
        v6[48] |= 1u;
        v6[44] = v15;
      }

      if (a3) {
        id v16 = @"isSplit";
      }
      else {
        id v16 = @"is_split";
      }
      uint64_t v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char v18 = [v17 BOOLValue];
        v6[48] |= 0x10u;
        v6[48] |= 2u;
        v6[45] = v18;
      }

      v19 = [v5 objectForKeyedSubscript:@"candidates"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v43 = v19;
        id v44 = v5;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id v20 = v19;
        uint64_t v21 = [v20 countByEnumeratingWithState:&v47 objects:v51 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          p_cache = GEOPDSearchBusinessIntent.cache;
          uint64_t v24 = *(void *)v48;
          do
          {
            uint64_t v25 = 0;
            uint64_t v46 = v22;
            do
            {
              if (*(void *)v48 != v24) {
                objc_enumerationMutation(v20);
              }
              long long v26 = *(void **)(*((void *)&v47 + 1) + 8 * v25);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v27 = objc_alloc((Class)(p_cache + 448));
                if (v27)
                {
                  uint64_t v28 = v27;
                  id v29 = v26;
                  uint64_t v30 = [v28 init];
                  if (v30)
                  {
                    v31 = [v29 objectForKeyedSubscript:@"candidate"];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      uint64_t v32 = v24;
                      id v33 = v20;
                      unint64_t v34 = v8;
                      v35 = p_cache;
                      v36 = (void *)[v31 copy];
                      id v37 = v36;
                      v38 = v36;
                      p_cache = v35;
                      unint64_t v8 = v34;
                      id v20 = v33;
                      uint64_t v24 = v32;
                      objc_storeStrong((id *)(v30 + 8), v38);

                      id v6 = v45;
                    }

                    v39 = [v29 objectForKeyedSubscript:@"score"];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      [v39 doubleValue];
                      *(unsigned char *)(v30 + 24) |= 1u;
                      *(void *)(v30 + 16) = v40;
                    }
                  }
                  uint64_t v22 = v46;
                }
                else
                {
                  uint64_t v30 = 0;
                }
                -[GEOPDSearchTokenCandidates addCandidates:]((uint64_t)v6, (void *)v30);
              }
              ++v25;
            }
            while (v22 != v25);
            uint64_t v41 = [v20 countByEnumeratingWithState:&v47 objects:v51 count:16];
            uint64_t v22 = v41;
          }
          while (v41);
        }

        v19 = v43;
        id v5 = v44;
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchTokenCandidatesReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader) {
    goto LABEL_8;
  }
  os_unfair_lock_assert_owner(&self->_readerLock);
  char flags = (char)self->_flags;
  if ((flags & 0x10) != 0) {
    goto LABEL_8;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if (GEOPDSearchTokenSetIsDirty((uint64_t)self->_token)) {
      goto LABEL_8;
    }
    char flags = (char)self->_flags;
  }
  if ((flags & 4) == 0)
  {
    id v7 = self->_reader;
    objc_sync_enter(v7);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    unint64_t v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v8];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
    goto LABEL_22;
  }
LABEL_8:
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchTokenCandidates readAll:]((uint64_t)self, 0);
  if (self->_token) {
    PBDataWriterWriteSubmessage();
  }
  char v9 = (char)self->_flags;
  if (v9)
  {
    PBDataWriterWriteBOOLField();
    char v9 = (char)self->_flags;
  }
  if ((v9 & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  char v10 = self->_candidates;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }

LABEL_22:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDSearchTokenCandidatesReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      unint64_t v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_16;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchTokenCandidates readAll:]((uint64_t)self, 0);
  id v9 = [(GEOPDSearchTokenSet *)self->_token copyWithZone:a3];
  char v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  char flags = (char)self->_flags;
  if (flags)
  {
    *(unsigned char *)(v5 + 44) = self->_isMerged;
    *(unsigned char *)(v5 + 48) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 45) = self->_isSplit;
    *(unsigned char *)(v5 + 48) |= 2u;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  unint64_t v8 = self->_candidates;
  uint64_t v12 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v8);
        }
        long long v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "copyWithZone:", a3, (void)v17);
        -[GEOPDSearchTokenCandidates addCandidates:](v5, v15);
      }
      uint64_t v12 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }
LABEL_16:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  -[GEOPDSearchTokenCandidates readAll:]((uint64_t)self, 1);
  -[GEOPDSearchTokenCandidates readAll:]((uint64_t)v4, 1);
  token = self->_token;
  if ((unint64_t)token | *((void *)v4 + 3))
  {
    if (!-[GEOPDSearchTokenSet isEqual:](token, "isEqual:")) {
      goto LABEL_16;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0) {
      goto LABEL_16;
    }
    if (self->_isMerged)
    {
      if (!*((unsigned char *)v4 + 44)) {
        goto LABEL_16;
      }
    }
    else if (*((unsigned char *)v4 + 44))
    {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
    goto LABEL_16;
  }
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0) {
      goto LABEL_22;
    }
LABEL_16:
    char v6 = 0;
    goto LABEL_17;
  }
  if ((*((unsigned char *)v4 + 48) & 2) == 0) {
    goto LABEL_16;
  }
  if (!self->_isSplit)
  {
    if (!*((unsigned char *)v4 + 45)) {
      goto LABEL_22;
    }
    goto LABEL_16;
  }
  if (!*((unsigned char *)v4 + 45)) {
    goto LABEL_16;
  }
LABEL_22:
  candidates = self->_candidates;
  if ((unint64_t)candidates | *((void *)v4 + 2)) {
    char v6 = -[NSMutableArray isEqual:](candidates, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_17:

  return v6;
}

- (unint64_t)hash
{
  -[GEOPDSearchTokenCandidates readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOPDSearchTokenSet *)self->_token hash];
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v4 = 2654435761 * self->_isMerged;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5 ^ [(NSMutableArray *)self->_candidates hash];
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_isSplit;
  return v4 ^ v3 ^ v5 ^ [(NSMutableArray *)self->_candidates hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_candidates, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end