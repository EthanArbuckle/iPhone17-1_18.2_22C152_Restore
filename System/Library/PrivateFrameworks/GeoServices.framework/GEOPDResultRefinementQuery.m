@interface GEOPDResultRefinementQuery
+ (BOOL)isValid:(id)a3;
+ (Class)refinementSectionType;
+ (Class)refinementType;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasRefinementSessionState;
- (BOOL)hasResultRefinementOriginType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDRefinementSessionState)refinementSessionState;
- (GEOPDResultRefinementQuery)init;
- (GEOPDResultRefinementQuery)initWithData:(id)a3;
- (GEOPDResultRefinementQuery)initWithDictionary:(id)a3;
- (GEOPDResultRefinementQuery)initWithJSON:(id)a3;
- (NSMutableArray)refinementSections;
- (NSMutableArray)refinements;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)refinementAtIndex:(unint64_t)a3;
- (id)refinementSectionAtIndex:(unint64_t)a3;
- (id)resultRefinementOriginTypeAsString:(int)a3;
- (int)StringAsResultRefinementOriginType:(id)a3;
- (int)resultRefinementOriginType;
- (unint64_t)hash;
- (unint64_t)refinementSectionsCount;
- (unint64_t)refinementsCount;
- (void)_addNoFlagsRefinement:(uint64_t)a1;
- (void)_addNoFlagsRefinementSection:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readRefinementSections;
- (void)_readRefinementSessionState;
- (void)_readRefinements;
- (void)addRefinement:(id)a3;
- (void)addRefinementSection:(id)a3;
- (void)clearRefinementSections;
- (void)clearRefinements;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHasResultRefinementOriginType:(BOOL)a3;
- (void)setRefinementSections:(id)a3;
- (void)setRefinementSessionState:(id)a3;
- (void)setRefinements:(id)a3;
- (void)setResultRefinementOriginType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDResultRefinementQuery

- (unint64_t)refinementSectionsCount
{
  -[GEOPDResultRefinementQuery _readRefinementSections]((uint64_t)self);
  refinementSections = self->_refinementSections;

  return [(NSMutableArray *)refinementSections count];
}

- (void)_readRefinementSections
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultRefinementQueryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRefinementSections_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refinements, 0);
  objc_storeStrong((id *)&self->_refinementSessionState, 0);
  objc_storeStrong((id *)&self->_refinementSections, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDResultRefinementQueryReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_22;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDResultRefinementQuery *)self readAll:0];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v9 = self->_refinements;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = (void *)[*(id *)(*((void *)&v27 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addRefinement:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v10);
  }

  id v14 = [(GEOPDRefinementSessionState *)self->_refinementSessionState copyWithZone:a3];
  v15 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v14;

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v16 = self->_refinementSections;
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
        [(id)v5 addRefinementSection:v20];
      }
      uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v17);
  }

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 60) = self->_resultRefinementOriginType;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
  v21 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v21;
LABEL_22:

  return (id)v5;
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  -[GEOPDResultRefinementQuery _readRefinements]((uint64_t)self);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = self->_refinements;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v20 != v8) {
        objc_enumerationMutation(v5);
      }
      if (-[GEOPDResultRefinement hasGreenTeaWithValue:](*(void *)(*((void *)&v19 + 1) + 8 * v9), v3)) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    -[GEOPDResultRefinementQuery _readRefinementSections]((uint64_t)self);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v5 = self->_refinementSections;
    uint64_t v10 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v23 count:16];
    if (!v10)
    {
LABEL_17:

      -[GEOPDResultRefinementQuery _readRefinementSessionState]((uint64_t)self);
      return -[GEOPDRefinementSessionState hasGreenTeaWithValue:](self->_refinementSessionState, "hasGreenTeaWithValue:", v3, (void)v15);
    }
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
LABEL_11:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v16 != v12) {
        objc_enumerationMutation(v5);
      }
      if (-[GEOPDResultRefinementSection hasGreenTeaWithValue:](*(void *)(*((void *)&v15 + 1) + 8 * v13), v3)) {
        break;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v11) {
          goto LABEL_11;
        }
        goto LABEL_17;
      }
    }
  }

  return 1;
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDResultRefinementQueryIsDirty((uint64_t)self) & 1) == 0)
  {
    id v14 = self->_reader;
    objc_sync_enter(v14);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    long long v15 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v15];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v14);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPDResultRefinementQuery *)self readAll:0];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v6 = self->_refinements;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v21;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v7);
    }

    if (self->_refinementSessionState) {
      PBDataWriterWriteSubmessage();
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v10 = self->_refinementSections;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v17;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v11);
    }

    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v16);
  }
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      uint64_t v6 = [v5 objectForKeyedSubscript:@"refinement"];
      objc_opt_class();
      id v37 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v7 = v6;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v42 objects:v47 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v43;
          do
          {
            uint64_t v11 = 0;
            do
            {
              if (*(void *)v43 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void **)(*((void *)&v42 + 1) + 8 * v11);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v13 = [GEOPDResultRefinement alloc];
                if (v13) {
                  id v14 = (void *)-[GEOPDResultRefinement _initWithDictionary:isJSON:](v13, v12, a3);
                }
                else {
                  id v14 = 0;
                }
                [a1 addRefinement:v14];
              }
              ++v11;
            }
            while (v9 != v11);
            uint64_t v15 = [v7 countByEnumeratingWithState:&v42 objects:v47 count:16];
            uint64_t v9 = v15;
          }
          while (v15);
        }

        id v5 = v37;
      }

      if (a3) {
        long long v16 = @"refinementSessionState";
      }
      else {
        long long v16 = @"refinement_session_state";
      }
      long long v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v18 = [GEOPDRefinementSessionState alloc];
        if (a3) {
          uint64_t v19 = [(GEOPDRefinementSessionState *)v18 initWithJSON:v17];
        }
        else {
          uint64_t v19 = [(GEOPDRefinementSessionState *)v18 initWithDictionary:v17];
        }
        long long v20 = (void *)v19;
        [a1 setRefinementSessionState:v19];
      }
      if (a3) {
        long long v21 = @"refinementSection";
      }
      else {
        long long v21 = @"refinement_section";
      }
      long long v22 = [v5 objectForKeyedSubscript:v21];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v23 = v22;
        uint64_t v24 = [v23 countByEnumeratingWithState:&v38 objects:v46 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v39;
          do
          {
            uint64_t v27 = 0;
            do
            {
              if (*(void *)v39 != v26) {
                objc_enumerationMutation(v23);
              }
              long long v28 = *(void **)(*((void *)&v38 + 1) + 8 * v27);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v29 = [GEOPDResultRefinementSection alloc];
                if (v29) {
                  long long v30 = (void *)-[GEOPDResultRefinementSection _initWithDictionary:isJSON:](v29, v28, a3);
                }
                else {
                  long long v30 = 0;
                }
                [a1 addRefinementSection:v30];
              }
              ++v27;
            }
            while (v25 != v27);
            uint64_t v31 = [v23 countByEnumeratingWithState:&v38 objects:v46 count:16];
            uint64_t v25 = v31;
          }
          while (v31);
        }

        id v5 = v37;
      }

      if (a3) {
        v32 = @"resultRefinementOriginType";
      }
      else {
        v32 = @"result_refinement_origin_type";
      }
      uint64_t v33 = [v5 objectForKeyedSubscript:v32];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v34 = v33;
        if ([v34 isEqualToString:@"RESULT_REFINEMENT_ORIGIN_TYPE_UNKNOWN"])
        {
          uint64_t v35 = 0;
        }
        else if ([v34 isEqualToString:@"RESULT_REFINEMENT_ORIGIN_TYPE_FILTER_BAR"])
        {
          uint64_t v35 = 1;
        }
        else if ([v34 isEqualToString:@"RESULT_REFINEMENT_ORIGIN_TYPE_FILTER_VIEW"])
        {
          uint64_t v35 = 2;
        }
        else if ([v34 isEqualToString:@"RESULT_REFINEMENT_ORIGIN_TYPE_AUTOCOMPLETE"])
        {
          uint64_t v35 = 3;
        }
        else
        {
          uint64_t v35 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_61:

          goto LABEL_62;
        }
        uint64_t v35 = [v33 intValue];
      }
      [a1 setResultRefinementOriginType:v35];
      goto LABEL_61;
    }
  }
LABEL_62:

  return a1;
}

- (void)_addNoFlagsRefinementSection:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 24);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v5;

      id v4 = *(void **)(a1 + 24);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (GEOPDResultRefinementQuery)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDResultRefinementQuery;
  v2 = [(GEOPDResultRefinementQuery *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOPDResultRefinementQuery)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDResultRefinementQuery;
  id v3 = [(GEOPDResultRefinementQuery *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)_readRefinements
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultRefinementQueryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRefinements_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)refinements
{
  -[GEOPDResultRefinementQuery _readRefinements]((uint64_t)self);
  refinements = self->_refinements;

  return refinements;
}

- (void)setRefinements:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  refinements = self->_refinements;
  self->_refinements = v4;
}

- (void)clearRefinements
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  refinements = self->_refinements;

  [(NSMutableArray *)refinements removeAllObjects];
}

- (void)addRefinement:(id)a3
{
  id v4 = a3;
  -[GEOPDResultRefinementQuery _readRefinements]((uint64_t)self);
  -[GEOPDResultRefinementQuery _addNoFlagsRefinement:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsRefinement:(uint64_t)a1
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

- (unint64_t)refinementsCount
{
  -[GEOPDResultRefinementQuery _readRefinements]((uint64_t)self);
  refinements = self->_refinements;

  return [(NSMutableArray *)refinements count];
}

- (id)refinementAtIndex:(unint64_t)a3
{
  -[GEOPDResultRefinementQuery _readRefinements]((uint64_t)self);
  refinements = self->_refinements;

  return (id)[(NSMutableArray *)refinements objectAtIndex:a3];
}

+ (Class)refinementType
{
  return (Class)objc_opt_class();
}

- (void)_readRefinementSessionState
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultRefinementQueryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRefinementSessionState_tags_926);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasRefinementSessionState
{
  return self->_refinementSessionState != 0;
}

- (GEOPDRefinementSessionState)refinementSessionState
{
  -[GEOPDResultRefinementQuery _readRefinementSessionState]((uint64_t)self);
  refinementSessionState = self->_refinementSessionState;

  return refinementSessionState;
}

- (void)setRefinementSessionState:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_refinementSessionState, a3);
}

- (NSMutableArray)refinementSections
{
  -[GEOPDResultRefinementQuery _readRefinementSections]((uint64_t)self);
  refinementSections = self->_refinementSections;

  return refinementSections;
}

- (void)setRefinementSections:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  refinementSections = self->_refinementSections;
  self->_refinementSections = v4;
}

- (void)clearRefinementSections
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  refinementSections = self->_refinementSections;

  [(NSMutableArray *)refinementSections removeAllObjects];
}

- (void)addRefinementSection:(id)a3
{
  id v4 = a3;
  -[GEOPDResultRefinementQuery _readRefinementSections]((uint64_t)self);
  -[GEOPDResultRefinementQuery _addNoFlagsRefinementSection:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (id)refinementSectionAtIndex:(unint64_t)a3
{
  -[GEOPDResultRefinementQuery _readRefinementSections]((uint64_t)self);
  refinementSections = self->_refinementSections;

  return (id)[(NSMutableArray *)refinementSections objectAtIndex:a3];
}

+ (Class)refinementSectionType
{
  return (Class)objc_opt_class();
}

- (int)resultRefinementOriginType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_resultRefinementOriginType;
  }
  else {
    return 0;
  }
}

- (void)setResultRefinementOriginType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x21u;
  self->_resultRefinementOriginType = a3;
}

- (void)setHasResultRefinementOriginType:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasResultRefinementOriginType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)resultRefinementOriginTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53E5CD8[a3];
  }

  return v3;
}

- (int)StringAsResultRefinementOriginType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"RESULT_REFINEMENT_ORIGIN_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"RESULT_REFINEMENT_ORIGIN_TYPE_FILTER_BAR"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"RESULT_REFINEMENT_ORIGIN_TYPE_FILTER_VIEW"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"RESULT_REFINEMENT_ORIGIN_TYPE_AUTOCOMPLETE"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDResultRefinementQuery;
  int v4 = [(GEOPDResultRefinementQuery *)&v8 description];
  id v5 = [(GEOPDResultRefinementQuery *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDResultRefinementQuery _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 40) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v6 = *(id *)(a1 + 40);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v42 objects:v47 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v43;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v43 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void **)(*((void *)&v42 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            uint64_t v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v42 objects:v47 count:16];
        }
        while (v8);
      }

      [v4 setObject:v5 forKey:@"refinement"];
    }
    uint64_t v13 = [(id)a1 refinementSessionState];
    id v14 = v13;
    if (v13)
    {
      if (a2)
      {
        uint64_t v15 = [v13 jsonRepresentation];
        long long v16 = @"refinementSessionState";
      }
      else
      {
        uint64_t v15 = [v13 dictionaryRepresentation];
        long long v16 = @"refinement_session_state";
      }
      [v4 setObject:v15 forKey:v16];
    }
    if ([*(id *)(a1 + 24) count])
    {
      long long v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v18 = *(id *)(a1 + 24);
      uint64_t v19 = [v18 countByEnumeratingWithState:&v38 objects:v46 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v39;
        do
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v39 != v21) {
              objc_enumerationMutation(v18);
            }
            id v23 = *(void **)(*((void *)&v38 + 1) + 8 * j);
            if (a2) {
              [v23 jsonRepresentation];
            }
            else {
            uint64_t v24 = [v23 dictionaryRepresentation];
            }
            [v17 addObject:v24];
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v38 objects:v46 count:16];
        }
        while (v20);
      }

      if (a2) {
        uint64_t v25 = @"refinementSection";
      }
      else {
        uint64_t v25 = @"refinement_section";
      }
      [v4 setObject:v17 forKey:v25];
    }
    if (*(unsigned char *)(a1 + 64))
    {
      uint64_t v26 = *(int *)(a1 + 60);
      if (v26 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 60));
        uint64_t v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v27 = off_1E53E5CD8[v26];
      }
      if (a2) {
        long long v28 = @"resultRefinementOriginType";
      }
      else {
        long long v28 = @"result_refinement_origin_type";
      }
      [v4 setObject:v27 forKey:v28];
    }
    long long v29 = *(void **)(a1 + 16);
    if (v29)
    {
      long long v30 = [v29 dictionaryRepresentation];
      uint64_t v31 = v30;
      if (a2)
      {
        v32 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v30, "count"));
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __56__GEOPDResultRefinementQuery__dictionaryRepresentation___block_invoke;
        v36[3] = &unk_1E53D8860;
        id v33 = v32;
        id v37 = v33;
        [v31 enumerateKeysAndObjectsUsingBlock:v36];
        id v34 = v33;

        uint64_t v31 = v34;
      }
      [v4 setObject:v31 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDResultRefinementQuery _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __56__GEOPDResultRefinementQuery__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDResultRefinementQuery)initWithDictionary:(id)a3
{
  return (GEOPDResultRefinementQuery *)-[GEOPDResultRefinementQuery _initWithDictionary:isJSON:](self, a3, 0);
}

- (GEOPDResultRefinementQuery)initWithJSON:(id)a3
{
  return (GEOPDResultRefinementQuery *)-[GEOPDResultRefinementQuery _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_943;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_944;
    }
    GEOPDResultRefinementQueryReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOPDResultRefinementQueryCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDResultRefinementQueryIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDResultRefinementQueryReadAllFrom((uint64_t)self, a3, 0);
}

- (void)copyTo:(id)a3
{
  uint64_t v12 = (id *)a3;
  [(GEOPDResultRefinementQuery *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 12) = self->_readerMarkPos;
  *((_DWORD *)v12 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOPDResultRefinementQuery *)self refinementsCount])
  {
    [v12 clearRefinements];
    unint64_t v4 = [(GEOPDResultRefinementQuery *)self refinementsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOPDResultRefinementQuery *)self refinementAtIndex:i];
        [v12 addRefinement:v7];
      }
    }
  }
  if (self->_refinementSessionState) {
    objc_msgSend(v12, "setRefinementSessionState:");
  }
  if ([(GEOPDResultRefinementQuery *)self refinementSectionsCount])
  {
    [v12 clearRefinementSections];
    unint64_t v8 = [(GEOPDResultRefinementQuery *)self refinementSectionsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEOPDResultRefinementQuery *)self refinementSectionAtIndex:j];
        [v12 addRefinementSection:v11];
      }
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v12 + 15) = self->_resultRefinementOriginType;
    *((unsigned char *)v12 + 64) |= 1u;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  [(GEOPDResultRefinementQuery *)self readAll:1];
  [v4 readAll:1];
  refinements = self->_refinements;
  if ((unint64_t)refinements | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](refinements, "isEqual:")) {
      goto LABEL_12;
    }
  }
  refinementSessionState = self->_refinementSessionState;
  if ((unint64_t)refinementSessionState | *((void *)v4 + 4))
  {
    if (!-[GEOPDRefinementSessionState isEqual:](refinementSessionState, "isEqual:")) {
      goto LABEL_12;
    }
  }
  refinementSections = self->_refinementSections;
  if ((unint64_t)refinementSections | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](refinementSections, "isEqual:")) {
      goto LABEL_12;
    }
  }
  BOOL v8 = (*((unsigned char *)v4 + 64) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 64) & 1) != 0 && self->_resultRefinementOriginType == *((_DWORD *)v4 + 15))
    {
      BOOL v8 = 1;
      goto LABEL_13;
    }
LABEL_12:
    BOOL v8 = 0;
  }
LABEL_13:

  return v8;
}

- (unint64_t)hash
{
  [(GEOPDResultRefinementQuery *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_refinements hash];
  unint64_t v4 = [(GEOPDRefinementSessionState *)self->_refinementSessionState hash];
  uint64_t v5 = [(NSMutableArray *)self->_refinementSections hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v6 = 2654435761 * self->_resultRefinementOriginType;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = *((id *)v4 + 5);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOPDResultRefinementQuery *)self addRefinement:*(void *)(*((void *)&v21 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }

  refinementSessionState = self->_refinementSessionState;
  uint64_t v11 = *((void *)v4 + 4);
  if (refinementSessionState)
  {
    if (v11) {
      -[GEOPDRefinementSessionState mergeFrom:](refinementSessionState, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[GEOPDResultRefinementQuery setRefinementSessionState:](self, "setRefinementSessionState:");
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = *((id *)v4 + 3);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        -[GEOPDResultRefinementQuery addRefinementSection:](self, "addRefinementSection:", *(void *)(*((void *)&v17 + 1) + 8 * j), (void)v17);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }

  if (*((unsigned char *)v4 + 64))
  {
    self->_resultRefinementOriginType = *((_DWORD *)v4 + 15);
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      id v5 = reader;
      objc_sync_enter(v5);
      GEOPDResultRefinementQueryReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_948);
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
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x22u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPDResultRefinementQuery *)self readAll:0];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v7 = self->_refinements;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          -[GEOPDResultRefinement clearUnknownFields:](*(void *)(*((void *)&v21 + 1) + 8 * v11++), 1);
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v9);
    }

    [(GEOPDRefinementSessionState *)self->_refinementSessionState clearUnknownFields:1];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v12 = self->_refinementSections;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v18;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v12);
          }
          -[GEOPDResultRefinementSection clearUnknownFields:](*(void *)(*((void *)&v17 + 1) + 8 * v16++), 1);
        }
        while (v14 != v16);
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v14);
    }
  }
}

@end