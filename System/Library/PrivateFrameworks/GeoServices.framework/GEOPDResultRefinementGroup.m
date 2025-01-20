@interface GEOPDResultRefinementGroup
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDResultRefinementGroup)init;
- (GEOPDResultRefinementGroup)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)refinementSessionState;
- (id)resultRefinementBar;
- (id)resultRefinementView;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)result;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readRefinementSessionState;
- (void)_readResultRefinementBar;
- (void)_readResultRefinementView;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)mergeFrom:(void *)a1;
- (void)readAll:(uint64_t)a1;
- (void)setRefinementSessionState:(uint64_t)a1;
- (void)setResultRefinementBar:(uint64_t)a1;
- (void)setResultRefinementView:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDResultRefinementGroup

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        v6 = @"resultRefinementBar";
      }
      else {
        v6 = @"result_refinement_bar";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v8 = [GEOPDResultRefinementBar alloc];
        if (v8)
        {
          id v9 = v7;
          v8 = [(GEOPDResultRefinementBar *)v8 init];
          if (v8)
          {
            if (a3) {
              v10 = @"resultRefinement";
            }
            else {
              v10 = @"result_refinement";
            }
            v11 = [v9 objectForKeyedSubscript:v10];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v43 = v9;
              v45 = a1;
              id v47 = v5;
              long long v51 = 0u;
              long long v52 = 0u;
              long long v49 = 0u;
              long long v50 = 0u;
              v41 = v11;
              id v12 = v11;
              uint64_t v13 = [v12 countByEnumeratingWithState:&v49 objects:v53 count:16];
              if (v13)
              {
                uint64_t v14 = v13;
                uint64_t v15 = *(void *)v50;
                do
                {
                  uint64_t v16 = 0;
                  do
                  {
                    if (*(void *)v50 != v15) {
                      objc_enumerationMutation(v12);
                    }
                    v17 = *(void **)(*((void *)&v49 + 1) + 8 * v16);
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v18 = [GEOPDResultRefinement alloc];
                      if (v18) {
                        v19 = (void *)-[GEOPDResultRefinement _initWithDictionary:isJSON:](v18, v17, a3);
                      }
                      else {
                        v19 = 0;
                      }
                      -[GEOPDResultRefinementBar addResultRefinement:]((uint64_t)v8, v19);
                    }
                    ++v16;
                  }
                  while (v14 != v16);
                  uint64_t v20 = [v12 countByEnumeratingWithState:&v49 objects:v53 count:16];
                  uint64_t v14 = v20;
                }
                while (v20);
              }

              a1 = v45;
              v11 = v41;
              id v9 = v43;
            }
          }
        }
        -[GEOPDResultRefinementGroup setResultRefinementBar:]((uint64_t)a1, v8);
      }
      if (a3) {
        v21 = @"resultRefinementView";
      }
      else {
        v21 = @"result_refinement_view";
      }
      v22 = objc_msgSend(v5, "objectForKeyedSubscript:", v21, v41, v43, v45, v47, (void)v49);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v23 = [GEOPDResultRefinementView alloc];
        if (v23)
        {
          id v24 = v22;
          v23 = [(GEOPDResultRefinementView *)v23 init];
          if (v23)
          {
            v25 = [v24 objectForKeyedSubscript:@"section"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v44 = v24;
              v46 = a1;
              id v48 = v5;
              long long v51 = 0u;
              long long v52 = 0u;
              long long v49 = 0u;
              long long v50 = 0u;
              v42 = v25;
              id v26 = v25;
              uint64_t v27 = [v26 countByEnumeratingWithState:&v49 objects:v53 count:16];
              if (v27)
              {
                uint64_t v28 = v27;
                uint64_t v29 = *(void *)v50;
                do
                {
                  uint64_t v30 = 0;
                  do
                  {
                    if (*(void *)v50 != v29) {
                      objc_enumerationMutation(v26);
                    }
                    v31 = *(void **)(*((void *)&v49 + 1) + 8 * v30);
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v32 = [GEOPDResultRefinementSection alloc];
                      if (v32) {
                        v33 = (void *)-[GEOPDResultRefinementSection _initWithDictionary:isJSON:](v32, v31, a3);
                      }
                      else {
                        v33 = 0;
                      }
                      -[GEOPDResultRefinementView addSection:]((uint64_t)v23, v33);
                    }
                    ++v30;
                  }
                  while (v28 != v30);
                  uint64_t v34 = [v26 countByEnumeratingWithState:&v49 objects:v53 count:16];
                  uint64_t v28 = v34;
                }
                while (v34);
              }

              a1 = v46;
              v25 = v42;
              id v24 = v44;
            }
          }
        }
        -[GEOPDResultRefinementGroup setResultRefinementView:]((uint64_t)a1, v23);
      }
      if (a3) {
        v35 = @"refinementSessionState";
      }
      else {
        v35 = @"refinement_session_state";
      }
      v36 = objc_msgSend(v5, "objectForKeyedSubscript:", v35, v42, v44, v46, v48);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v37 = [GEOPDRefinementSessionState alloc];
        if (a3) {
          v38 = [(GEOPDRefinementSessionState *)v37 initWithJSON:v36];
        }
        else {
          v38 = [(GEOPDRefinementSessionState *)v37 initWithDictionary:v36];
        }
        v39 = v38;
        -[GEOPDResultRefinementGroup setRefinementSessionState:]((uint64_t)a1, v38);
      }
    }
  }

  return a1;
}

- (GEOPDResultRefinementGroup)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDResultRefinementGroup;
  v2 = [(GEOPDResultRefinementGroup *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDResultRefinementGroup)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDResultRefinementGroup;
  v3 = [(GEOPDResultRefinementGroup *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)_readResultRefinementBar
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
        GEOPDResultRefinementGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readResultRefinementBar_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)resultRefinementBar
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDResultRefinementGroup _readResultRefinementBar]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setResultRefinementBar:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 60) |= 4u;
    *(unsigned char *)(a1 + 60) |= 0x10u;
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (void)_readResultRefinementView
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
        GEOPDResultRefinementGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readResultRefinementView_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)resultRefinementView
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDResultRefinementGroup _readResultRefinementView]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setResultRefinementView:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 60) |= 8u;
    *(unsigned char *)(a1 + 60) |= 0x10u;
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

- (void)_readRefinementSessionState
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
        GEOPDResultRefinementGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRefinementSessionState_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)refinementSessionState
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDResultRefinementGroup _readRefinementSessionState]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setRefinementSessionState:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 60) |= 2u;
    *(unsigned char *)(a1 + 60) |= 0x10u;
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDResultRefinementGroup;
  id v4 = [(GEOPDResultRefinementGroup *)&v8 description];
  id v5 = [(GEOPDResultRefinementGroup *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDResultRefinementGroup _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDResultRefinementGroup readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = -[GEOPDResultRefinementGroup resultRefinementBar]((id *)a1);
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 jsonRepresentation];
        objc_super v8 = @"resultRefinementBar";
      }
      else
      {
        objc_super v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"result_refinement_bar";
      }
      [v4 setObject:v7 forKey:v8];
    }
    id v9 = -[GEOPDResultRefinementGroup resultRefinementView]((id *)a1);
    v10 = v9;
    if (v9)
    {
      if (a2)
      {
        v11 = [v9 jsonRepresentation];
        id v12 = @"resultRefinementView";
      }
      else
      {
        v11 = [v9 dictionaryRepresentation];
        id v12 = @"result_refinement_view";
      }
      [v4 setObject:v11 forKey:v12];
    }
    uint64_t v13 = -[GEOPDResultRefinementGroup refinementSessionState]((id *)a1);
    uint64_t v14 = v13;
    if (v13)
    {
      if (a2)
      {
        uint64_t v15 = [v13 jsonRepresentation];
        uint64_t v16 = @"refinementSessionState";
      }
      else
      {
        uint64_t v15 = [v13 dictionaryRepresentation];
        uint64_t v16 = @"refinement_session_state";
      }
      [v4 setObject:v15 forKey:v16];
    }
    v17 = *(void **)(a1 + 16);
    if (v17)
    {
      v18 = [v17 dictionaryRepresentation];
      v19 = v18;
      if (a2)
      {
        uint64_t v20 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v18, "count"));
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __56__GEOPDResultRefinementGroup__dictionaryRepresentation___block_invoke;
        v24[3] = &unk_1E53D8860;
        id v21 = v20;
        id v25 = v21;
        [v19 enumerateKeysAndObjectsUsingBlock:v24];
        id v22 = v21;

        v19 = v22;
      }
      [v4 setObject:v19 forKey:@"Unknown Fields"];
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
  return -[GEOPDResultRefinementGroup _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_506;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_507;
      }
      GEOPDResultRefinementGroupReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      [*(id *)(a1 + 24) readAll:1];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

void __56__GEOPDResultRefinementGroup__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    id v9 = [v10 description];
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
  return GEOPDResultRefinementGroupReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEOPDResultRefinementGroupIsDirty((uint64_t)self))
  {
    objc_super v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDResultRefinementGroup readAll:]((uint64_t)self, 0);
    if (self->_resultRefinementBar) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_resultRefinementView)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_refinementSessionState)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPDResultRefinementGroup _readRefinementSessionState](result);
    if ([*(id *)(v3 + 24) hasGreenTeaWithValue:a2]) {
      return 1;
    }
    -[GEOPDResultRefinementGroup _readResultRefinementBar](v3);
    if (-[GEOPDResultRefinementBar hasGreenTeaWithValue:](*(void *)(v3 + 32), a2))
    {
      return 1;
    }
    else
    {
      -[GEOPDResultRefinementGroup _readResultRefinementView](v3);
      uint64_t v4 = *(void *)(v3 + 40);
      return -[GEOPDResultRefinementView hasGreenTeaWithValue:](v4, a2);
    }
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  objc_super v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDResultRefinementGroup readAll:]((uint64_t)self, 0);
    id v8 = [(GEOPDResultRefinementBar *)self->_resultRefinementBar copyWithZone:a3];
    id v9 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v8;

    id v10 = [(GEOPDResultRefinementView *)self->_resultRefinementView copyWithZone:a3];
    v11 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v10;

    id v12 = [(GEOPDRefinementSessionState *)self->_refinementSessionState copyWithZone:a3];
    uint64_t v13 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v12;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDResultRefinementGroupReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPDResultRefinementGroup readAll:]((uint64_t)self, 1),
         -[GEOPDResultRefinementGroup readAll:]((uint64_t)v4, 1),
         resultRefinementBar = self->_resultRefinementBar,
         !((unint64_t)resultRefinementBar | v4[4]))
     || -[GEOPDResultRefinementBar isEqual:](resultRefinementBar, "isEqual:"))
    && ((resultRefinementView = self->_resultRefinementView, !((unint64_t)resultRefinementView | v4[5]))
     || -[GEOPDResultRefinementView isEqual:](resultRefinementView, "isEqual:")))
  {
    refinementSessionState = self->_refinementSessionState;
    if ((unint64_t)refinementSessionState | v4[3]) {
      char v8 = -[GEOPDRefinementSessionState isEqual:](refinementSessionState, "isEqual:");
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
  -[GEOPDResultRefinementGroup readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOPDResultRefinementBar *)self->_resultRefinementBar hash];
  unint64_t v4 = [(GEOPDResultRefinementView *)self->_resultRefinementView hash] ^ v3;
  return v4 ^ [(GEOPDRefinementSessionState *)self->_refinementSessionState hash];
}

- (void)mergeFrom:(void *)a1
{
  id v9 = a2;
  if (a1)
  {
    -[GEOPDResultRefinementGroup readAll:]((uint64_t)v9, 0);
    uint64_t v3 = a1[4];
    unint64_t v4 = (void *)*((void *)v9 + 4);
    if (v3)
    {
      if (v4) {
        -[GEOPDResultRefinementBar mergeFrom:](v3, (uint64_t)v4);
      }
    }
    else if (v4)
    {
      -[GEOPDResultRefinementGroup setResultRefinementBar:]((uint64_t)a1, v4);
    }
    uint64_t v5 = a1[5];
    objc_super v6 = (void *)*((void *)v9 + 5);
    if (v5)
    {
      if (v6) {
        -[GEOPDResultRefinementView mergeFrom:](v5, (uint64_t)v6);
      }
    }
    else if (v6)
    {
      -[GEOPDResultRefinementGroup setResultRefinementView:]((uint64_t)a1, v6);
    }
    objc_super v7 = (void *)a1[3];
    uint64_t v8 = *((void *)v9 + 3);
    if (v7)
    {
      if (v8) {
        objc_msgSend(v7, "mergeFrom:");
      }
    }
    else if (v8)
    {
      -[GEOPDResultRefinementGroup setRefinementSessionState:]((uint64_t)a1, *((void **)v9 + 3));
    }
  }
}

- (void)clearUnknownFields:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 60) |= 1u;
    *(unsigned char *)(a1 + 60) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    unint64_t v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDResultRefinementGroup readAll:](a1, 0);
      -[GEOPDResultRefinementBar clearUnknownFields:](*(void *)(a1 + 32), 1);
      -[GEOPDResultRefinementView clearUnknownFields:](*(void *)(a1 + 40), 1);
      uint64_t v5 = *(void **)(a1 + 24);
      [v5 clearUnknownFields:1];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultRefinementView, 0);
  objc_storeStrong((id *)&self->_resultRefinementBar, 0);
  objc_storeStrong((id *)&self->_refinementSessionState, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end