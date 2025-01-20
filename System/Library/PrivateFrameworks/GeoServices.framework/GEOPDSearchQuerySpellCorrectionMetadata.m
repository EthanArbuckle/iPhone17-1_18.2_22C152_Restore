@interface GEOPDSearchQuerySpellCorrectionMetadata
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchQuerySpellCorrectionMetadata)init;
- (GEOPDSearchQuerySpellCorrectionMetadata)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_addNoFlagsAllSpellSuggestions:(uint64_t)a1;
- (void)_addNoFlagsAllTokenCandidates:(uint64_t)a1;
- (void)_addNoFlagsTokenCandidate:(uint64_t)a1;
- (void)addAllSpellSuggestions:(uint64_t)a1;
- (void)addAllTokenCandidates:(uint64_t)a1;
- (void)addTokenCandidate:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchQuerySpellCorrectionMetadata

- (GEOPDSearchQuerySpellCorrectionMetadata)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchQuerySpellCorrectionMetadata;
  v2 = [(GEOPDSearchQuerySpellCorrectionMetadata *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchQuerySpellCorrectionMetadata)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchQuerySpellCorrectionMetadata;
  v3 = [(GEOPDSearchQuerySpellCorrectionMetadata *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)addTokenCandidate:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 100) & 0x4000) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchQuerySpellCorrectionMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTokenCandidates_tags);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    -[GEOPDSearchQuerySpellCorrectionMetadata _addNoFlagsTokenCandidate:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 100) |= 0x4000u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    *(_WORD *)(a1 + 100) |= 0x8000u;
  }
}

- (void)_addNoFlagsTokenCandidate:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 56);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v5;

      v4 = *(void **)(a1 + 56);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)addAllTokenCandidates:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 100) & 0x1000) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchQuerySpellCorrectionMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAllTokenCandidates_tags);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    -[GEOPDSearchQuerySpellCorrectionMetadata _addNoFlagsAllTokenCandidates:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 100) |= 0x1000u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    *(_WORD *)(a1 + 100) |= 0x8000u;
  }
}

- (void)_addNoFlagsAllTokenCandidates:(uint64_t)a1
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

- (void)addAllSpellSuggestions:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 100) & 0x800) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchQuerySpellCorrectionMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAllSpellSuggestions_tags);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    -[GEOPDSearchQuerySpellCorrectionMetadata _addNoFlagsAllSpellSuggestions:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 100) |= 0x800u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    *(_WORD *)(a1 + 100) |= 0x8000u;
  }
}

- (void)_addNoFlagsAllSpellSuggestions:(uint64_t)a1
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
  v8.super_class = (Class)GEOPDSearchQuerySpellCorrectionMetadata;
  v4 = [(GEOPDSearchQuerySpellCorrectionMetadata *)&v8 description];
  id v5 = [(GEOPDSearchQuerySpellCorrectionMetadata *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchQuerySpellCorrectionMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDSearchQuerySpellCorrectionMetadata readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 100) & 0x2000) == 0)
    {
      id v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOPDSearchQuerySpellCorrectionMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSpellSuggestion_tags);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    id v7 = *(id *)(a1 + 48);
    objc_super v8 = v7;
    if (v7)
    {
      if (a2)
      {
        v9 = [v7 jsonRepresentation];
        v10 = @"spellSuggestion";
      }
      else
      {
        v9 = [v7 dictionaryRepresentation];
        v10 = @"spell_suggestion";
      }
      [v4 setObject:v9 forKey:v10];
    }
    __int16 v11 = *(_WORD *)(a1 + 100);
    if ((v11 & 0x200) != 0)
    {
      v12 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 95)];
      if (a2) {
        v13 = @"isFromPoiSearchSpeller";
      }
      else {
        v13 = @"is_from_poi_search_speller";
      }
      [v4 setObject:v12 forKey:v13];

      __int16 v11 = *(_WORD *)(a1 + 100);
    }
    if ((v11 & 0x10) != 0)
    {
      unsigned int v14 = *(_DWORD *)(a1 + 84) - 1;
      if (v14 >= 6)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 84));
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = off_1E53E2898[v14];
      }
      if (a2) {
        v16 = @"resultStatus";
      }
      else {
        v16 = @"result_status";
      }
      [v4 setObject:v15 forKey:v16];

      __int16 v11 = *(_WORD *)(a1 + 100);
    }
    if (v11)
    {
      v17 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 32)];
      if (a2) {
        v18 = @"decileId";
      }
      else {
        v18 = @"decile_id";
      }
      [v4 setObject:v17 forKey:v18];

      __int16 v11 = *(_WORD *)(a1 + 100);
    }
    if ((v11 & 0x400) != 0)
    {
      v19 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 96)];
      if (a2) {
        v20 = @"isSpellCorrectionSameAsOrgQuery";
      }
      else {
        v20 = @"is_spell_correction_same_as_org_query";
      }
      [v4 setObject:v19 forKey:v20];
    }
    if ([*(id *)(a1 + 56) count])
    {
      v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
      long long v67 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      id v22 = *(id *)(a1 + 56);
      uint64_t v23 = [v22 countByEnumeratingWithState:&v67 objects:v73 count:16];
      if (v23)
      {
        uint64_t v24 = *(void *)v68;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v68 != v24) {
              objc_enumerationMutation(v22);
            }
            v26 = *(void **)(*((void *)&v67 + 1) + 8 * i);
            if (a2) {
              [v26 jsonRepresentation];
            }
            else {
            v27 = [v26 dictionaryRepresentation];
            }
            [v21 addObject:v27];
          }
          uint64_t v23 = [v22 countByEnumeratingWithState:&v67 objects:v73 count:16];
        }
        while (v23);
      }

      if (a2) {
        v28 = @"tokenCandidate";
      }
      else {
        v28 = @"token_candidate";
      }
      [v4 setObject:v21 forKey:v28];
    }
    __int16 v29 = *(_WORD *)(a1 + 100);
    if ((v29 & 2) != 0)
    {
      v30 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
      if (a2) {
        v31 = @"misspellScore";
      }
      else {
        v31 = @"misspell_score";
      }
      [v4 setObject:v30 forKey:v31];

      __int16 v29 = *(_WORD *)(a1 + 100);
    }
    if ((v29 & 0x100) != 0)
    {
      v32 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 94)];
      if (a2) {
        v33 = @"isConfidentSpellCorrection";
      }
      else {
        v33 = @"is_confident_spell_correction";
      }
      [v4 setObject:v32 forKey:v33];
    }
    if ([*(id *)(a1 + 24) count])
    {
      v34 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      id v35 = *(id *)(a1 + 24);
      uint64_t v36 = [v35 countByEnumeratingWithState:&v63 objects:v72 count:16];
      if (v36)
      {
        uint64_t v37 = *(void *)v64;
        do
        {
          for (uint64_t j = 0; j != v36; ++j)
          {
            if (*(void *)v64 != v37) {
              objc_enumerationMutation(v35);
            }
            v39 = *(void **)(*((void *)&v63 + 1) + 8 * j);
            if (a2) {
              [v39 jsonRepresentation];
            }
            else {
            v40 = [v39 dictionaryRepresentation];
            }
            [v34 addObject:v40];
          }
          uint64_t v36 = [v35 countByEnumeratingWithState:&v63 objects:v72 count:16];
        }
        while (v36);
      }

      if (a2) {
        v41 = @"allTokenCandidates";
      }
      else {
        v41 = @"all_token_candidates";
      }
      [v4 setObject:v34 forKey:v41];
    }
    if ([*(id *)(a1 + 16) count])
    {
      v42 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      id v43 = *(id *)(a1 + 16);
      uint64_t v44 = [v43 countByEnumeratingWithState:&v59 objects:v71 count:16];
      if (v44)
      {
        uint64_t v45 = *(void *)v60;
        do
        {
          for (uint64_t k = 0; k != v44; ++k)
          {
            if (*(void *)v60 != v45) {
              objc_enumerationMutation(v43);
            }
            v47 = *(void **)(*((void *)&v59 + 1) + 8 * k);
            if (a2) {
              [v47 jsonRepresentation];
            }
            else {
            v48 = [v47 dictionaryRepresentation];
            }
            [v42 addObject:v48];
          }
          uint64_t v44 = [v43 countByEnumeratingWithState:&v59 objects:v71 count:16];
        }
        while (v44);
      }

      if (a2) {
        v49 = @"allSpellSuggestions";
      }
      else {
        v49 = @"all_spell_suggestions";
      }
      [v4 setObject:v42 forKey:v49];
    }
    __int16 v50 = *(_WORD *)(a1 + 100);
    if ((v50 & 0x20) != 0)
    {
      uint64_t v51 = *(int *)(a1 + 88);
      if (v51 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 88));
        v52 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v52 = off_1E53E28C8[v51];
      }
      if (a2) {
        v53 = @"spellerRankerModelType";
      }
      else {
        v53 = @"speller_ranker_model_type";
      }
      [v4 setObject:v52 forKey:v53];

      __int16 v50 = *(_WORD *)(a1 + 100);
    }
    if ((v50 & 0x40) != 0)
    {
      v54 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 92)];
      [v4 setObject:v54 forKey:@"isFromDLCacheModel"];

      __int16 v50 = *(_WORD *)(a1 + 100);
    }
    if ((v50 & 0x80) != 0)
    {
      v55 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 93)];
      [v4 setObject:v55 forKey:@"isFromDLRuntimeModel"];

      __int16 v50 = *(_WORD *)(a1 + 100);
    }
    if ((v50 & 4) != 0)
    {
      v56 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 76)];
      [v4 setObject:v56 forKey:@"modelNumberMajor"];

      __int16 v50 = *(_WORD *)(a1 + 100);
    }
    if ((v50 & 8) != 0)
    {
      v57 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 80)];
      [v4 setObject:v57 forKey:@"modelNumberMinor"];
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
  return -[GEOPDSearchQuerySpellCorrectionMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_2033;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_2034;
      }
      GEOPDSearchQuerySpellCorrectionMetadataReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDSearchQuerySpellCorrectionMetadataCallReadAllRecursiveWithoutSynchronized((id *)a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchQuerySpellCorrectionMetadataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if (*(_WORD *)&self->_flags <= 0x7FFu)
    {
      v21 = self->_reader;
      objc_sync_enter(v21);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      id v22 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v4 writeData:v22];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v21);
      goto LABEL_50;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchQuerySpellCorrectionMetadata readAll:]((uint64_t)self, 0);
  if (self->_spellSuggestion) {
    PBDataWriterWriteSubmessage();
  }
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x200) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_7:
      if ((flags & 1) == 0) {
        goto LABEL_8;
      }
LABEL_47:
      PBDataWriterWriteUint64Field();
      if ((*(_WORD *)&self->_flags & 0x400) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  else if ((flags & 0x10) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  __int16 flags = (__int16)self->_flags;
  if (flags) {
    goto LABEL_47;
  }
LABEL_8:
  if ((flags & 0x400) != 0) {
LABEL_9:
  }
    PBDataWriterWriteBOOLField();
LABEL_10:
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v7 = self->_tokenCandidates;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v8);
  }

  __int16 v11 = (__int16)self->_flags;
  if ((v11 & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    __int16 v11 = (__int16)self->_flags;
  }
  if ((v11 & 0x100) != 0) {
    PBDataWriterWriteBOOLField();
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v12 = self->_allTokenCandidates;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v13);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v16 = self->_allSpellSuggestions;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v35 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v24;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v35 count:16];
    }
    while (v17);
  }

  __int16 v20 = (__int16)self->_flags;
  if ((v20 & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 v20 = (__int16)self->_flags;
  }
  if ((v20 & 0x40) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 v20 = (__int16)self->_flags;
  }
  if ((v20 & 0x80) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 v20 = (__int16)self->_flags;
  }
  if ((v20 & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 v20 = (__int16)self->_flags;
  }
  if ((v20 & 8) != 0) {
    PBDataWriterWriteUint32Field();
  }
LABEL_50:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchQuerySpellCorrectionMetadata readAll:]((uint64_t)self, 0);
    id v9 = [(GEOPDSearchSpellSuggestion *)self->_spellSuggestion copyWithZone:a3];
    v10 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v9;

    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x200) != 0)
    {
      *(unsigned char *)(v5 + 95) = self->_isFromPoiSearchSpeller;
      *(_WORD *)(v5 + 100) |= 0x200u;
      __int16 flags = (__int16)self->_flags;
      if ((flags & 0x10) == 0)
      {
LABEL_7:
        if ((flags & 1) == 0) {
          goto LABEL_8;
        }
        goto LABEL_44;
      }
    }
    else if ((flags & 0x10) == 0)
    {
      goto LABEL_7;
    }
    *(_DWORD *)(v5 + 84) = self->_resultStatus;
    *(_WORD *)(v5 + 100) |= 0x10u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_8:
      if ((flags & 0x400) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
LABEL_44:
    *(void *)(v5 + 32) = self->_decileId;
    *(_WORD *)(v5 + 100) |= 1u;
    if ((*(_WORD *)&self->_flags & 0x400) == 0)
    {
LABEL_10:
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      v12 = self->_tokenCandidates;
      uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v38 objects:v44 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v39;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v39 != v14) {
              objc_enumerationMutation(v12);
            }
            v16 = (void *)[*(id *)(*((void *)&v38 + 1) + 8 * i) copyWithZone:a3];
            -[GEOPDSearchQuerySpellCorrectionMetadata addTokenCandidate:](v5, v16);
          }
          uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v38 objects:v44 count:16];
        }
        while (v13);
      }

      __int16 v17 = (__int16)self->_flags;
      if ((v17 & 2) != 0)
      {
        *(double *)(v5 + 40) = self->_misspellScore;
        *(_WORD *)(v5 + 100) |= 2u;
        __int16 v17 = (__int16)self->_flags;
      }
      if ((v17 & 0x100) != 0)
      {
        *(unsigned char *)(v5 + 94) = self->_isConfidentSpellCorrection;
        *(_WORD *)(v5 + 100) |= 0x100u;
      }
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      uint64_t v18 = self->_allTokenCandidates;
      uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v34 objects:v43 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v35;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v35 != v20) {
              objc_enumerationMutation(v18);
            }
            id v22 = (void *)[*(id *)(*((void *)&v34 + 1) + 8 * j) copyWithZone:a3];
            -[GEOPDSearchQuerySpellCorrectionMetadata addAllTokenCandidates:](v5, v22);
          }
          uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v34 objects:v43 count:16];
        }
        while (v19);
      }

      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v23 = self->_allSpellSuggestions;
      uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v30 objects:v42 count:16];
      if (v24)
      {
        uint64_t v25 = *(void *)v31;
        do
        {
          for (uint64_t k = 0; k != v24; ++k)
          {
            if (*(void *)v31 != v25) {
              objc_enumerationMutation(v23);
            }
            long long v27 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * k), "copyWithZone:", a3, (void)v30);
            -[GEOPDSearchQuerySpellCorrectionMetadata addAllSpellSuggestions:](v5, v27);
          }
          uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v30 objects:v42 count:16];
        }
        while (v24);
      }

      __int16 v28 = (__int16)self->_flags;
      if ((v28 & 0x20) != 0)
      {
        *(_DWORD *)(v5 + 88) = self->_spellerRankerModelType;
        *(_WORD *)(v5 + 100) |= 0x20u;
        __int16 v28 = (__int16)self->_flags;
        if ((v28 & 0x40) == 0)
        {
LABEL_37:
          if ((v28 & 0x80) == 0) {
            goto LABEL_38;
          }
          goto LABEL_48;
        }
      }
      else if ((v28 & 0x40) == 0)
      {
        goto LABEL_37;
      }
      *(unsigned char *)(v5 + 92) = self->_isFromDLCacheModel;
      *(_WORD *)(v5 + 100) |= 0x40u;
      __int16 v28 = (__int16)self->_flags;
      if ((v28 & 0x80) == 0)
      {
LABEL_38:
        if ((v28 & 4) == 0) {
          goto LABEL_39;
        }
        goto LABEL_49;
      }
LABEL_48:
      *(unsigned char *)(v5 + 93) = self->_isFromDLRuntimeModel;
      *(_WORD *)(v5 + 100) |= 0x80u;
      __int16 v28 = (__int16)self->_flags;
      if ((v28 & 4) == 0)
      {
LABEL_39:
        if ((v28 & 8) == 0) {
          return (id)v5;
        }
LABEL_40:
        *(_DWORD *)(v5 + 80) = self->_modelNumberMinor;
        *(_WORD *)(v5 + 100) |= 8u;
        return (id)v5;
      }
LABEL_49:
      *(_DWORD *)(v5 + 76) = self->_modelNumberMajor;
      *(_WORD *)(v5 + 100) |= 4u;
      if ((*(_WORD *)&self->_flags & 8) == 0) {
        return (id)v5;
      }
      goto LABEL_40;
    }
LABEL_9:
    *(unsigned char *)(v5 + 96) = self->_isSpellCorrectionSameAsOrgQuery;
    *(_WORD *)(v5 + 100) |= 0x400u;
    goto LABEL_10;
  }
  id v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x80000000) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDSearchQuerySpellCorrectionMetadataReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_81;
  }
  -[GEOPDSearchQuerySpellCorrectionMetadata readAll:]((uint64_t)self, 1);
  -[GEOPDSearchQuerySpellCorrectionMetadata readAll:]((uint64_t)v4, 1);
  spellSuggestion = self->_spellSuggestion;
  if ((unint64_t)spellSuggestion | *((void *)v4 + 6))
  {
    if (!-[GEOPDSearchSpellSuggestion isEqual:](spellSuggestion, "isEqual:")) {
      goto LABEL_81;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v7 = *((_WORD *)v4 + 50);
  if ((flags & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 50) & 0x200) == 0) {
      goto LABEL_81;
    }
    if (self->_isFromPoiSearchSpeller)
    {
      if (!*((unsigned char *)v4 + 95)) {
        goto LABEL_81;
      }
    }
    else if (*((unsigned char *)v4 + 95))
    {
      goto LABEL_81;
    }
  }
  else if ((*((_WORD *)v4 + 50) & 0x200) != 0)
  {
    goto LABEL_81;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_resultStatus != *((_DWORD *)v4 + 21)) {
      goto LABEL_81;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_81;
  }
  if (flags)
  {
    if ((v7 & 1) == 0 || self->_decileId != *((void *)v4 + 4)) {
      goto LABEL_81;
    }
  }
  else if (v7)
  {
    goto LABEL_81;
  }
  if ((*(_WORD *)&self->_flags & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 50) & 0x400) == 0) {
      goto LABEL_81;
    }
    if (self->_isSpellCorrectionSameAsOrgQuery)
    {
      if (!*((unsigned char *)v4 + 96)) {
        goto LABEL_81;
      }
    }
    else if (*((unsigned char *)v4 + 96))
    {
      goto LABEL_81;
    }
  }
  else if ((*((_WORD *)v4 + 50) & 0x400) != 0)
  {
    goto LABEL_81;
  }
  tokenCandidates = self->_tokenCandidates;
  if ((unint64_t)tokenCandidates | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](tokenCandidates, "isEqual:")) {
      goto LABEL_81;
    }
    __int16 flags = (__int16)self->_flags;
    __int16 v7 = *((_WORD *)v4 + 50);
  }
  if ((flags & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_misspellScore != *((double *)v4 + 5)) {
      goto LABEL_81;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_81;
  }
  if ((flags & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0) {
      goto LABEL_81;
    }
    if (self->_isConfidentSpellCorrection)
    {
      if (!*((unsigned char *)v4 + 94)) {
        goto LABEL_81;
      }
    }
    else if (*((unsigned char *)v4 + 94))
    {
      goto LABEL_81;
    }
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_81;
  }
  allTokenCandidates = self->_allTokenCandidates;
  if ((unint64_t)allTokenCandidates | *((void *)v4 + 3)
    && !-[NSMutableArray isEqual:](allTokenCandidates, "isEqual:"))
  {
    goto LABEL_81;
  }
  allSpellSuggestions = self->_allSpellSuggestions;
  if ((unint64_t)allSpellSuggestions | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](allSpellSuggestions, "isEqual:")) {
      goto LABEL_81;
    }
  }
  __int16 v11 = (__int16)self->_flags;
  __int16 v12 = *((_WORD *)v4 + 50);
  if ((v11 & 0x20) != 0)
  {
    if ((v12 & 0x20) == 0 || self->_spellerRankerModelType != *((_DWORD *)v4 + 22)) {
      goto LABEL_81;
    }
  }
  else if ((v12 & 0x20) != 0)
  {
    goto LABEL_81;
  }
  if ((v11 & 0x40) != 0)
  {
    if ((v12 & 0x40) == 0) {
      goto LABEL_81;
    }
    if (self->_isFromDLCacheModel)
    {
      if (!*((unsigned char *)v4 + 92)) {
        goto LABEL_81;
      }
    }
    else if (*((unsigned char *)v4 + 92))
    {
      goto LABEL_81;
    }
  }
  else if ((v12 & 0x40) != 0)
  {
    goto LABEL_81;
  }
  if ((v11 & 0x80) != 0)
  {
    if ((v12 & 0x80) != 0)
    {
      if (self->_isFromDLRuntimeModel)
      {
        if (!*((unsigned char *)v4 + 93)) {
          goto LABEL_81;
        }
        goto LABEL_71;
      }
      if (!*((unsigned char *)v4 + 93)) {
        goto LABEL_71;
      }
    }
LABEL_81:
    BOOL v13 = 0;
    goto LABEL_82;
  }
  if ((v12 & 0x80) != 0) {
    goto LABEL_81;
  }
LABEL_71:
  if ((v11 & 4) != 0)
  {
    if ((v12 & 4) == 0 || self->_modelNumberMajor != *((_DWORD *)v4 + 19)) {
      goto LABEL_81;
    }
  }
  else if ((v12 & 4) != 0)
  {
    goto LABEL_81;
  }
  if ((v11 & 8) != 0)
  {
    if ((v12 & 8) == 0 || self->_modelNumberMinor != *((_DWORD *)v4 + 20)) {
      goto LABEL_81;
    }
    BOOL v13 = 1;
  }
  else
  {
    BOOL v13 = (v12 & 8) == 0;
  }
LABEL_82:

  return v13;
}

- (unint64_t)hash
{
  -[GEOPDSearchQuerySpellCorrectionMetadata readAll:]((uint64_t)self, 1);
  unint64_t v25 = [(GEOPDSearchSpellSuggestion *)self->_spellSuggestion hash];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x200) != 0)
  {
    uint64_t v24 = 2654435761 * self->_isFromPoiSearchSpeller;
    if ((flags & 0x10) != 0)
    {
LABEL_3:
      uint64_t v23 = 2654435761 * self->_resultStatus;
      if (flags) {
        goto LABEL_4;
      }
LABEL_8:
      unint64_t v4 = 0;
      if ((*(_WORD *)&self->_flags & 0x400) != 0) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v24 = 0;
    if ((flags & 0x10) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v23 = 0;
  if ((flags & 1) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  unint64_t v4 = 2654435761u * self->_decileId;
  if ((*(_WORD *)&self->_flags & 0x400) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_isSpellCorrectionSameAsOrgQuery;
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v5 = 0;
LABEL_10:
  uint64_t v6 = [(NSMutableArray *)self->_tokenCandidates hash];
  __int16 v7 = (__int16)self->_flags;
  if ((v7 & 2) != 0)
  {
    double misspellScore = self->_misspellScore;
    double v10 = -misspellScore;
    if (misspellScore >= 0.0) {
      double v10 = self->_misspellScore;
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
  if ((v7 & 0x100) != 0) {
    uint64_t v13 = 2654435761 * self->_isConfidentSpellCorrection;
  }
  else {
    uint64_t v13 = 0;
  }
  uint64_t v14 = [(NSMutableArray *)self->_allTokenCandidates hash];
  uint64_t v15 = [(NSMutableArray *)self->_allSpellSuggestions hash];
  __int16 v16 = (__int16)self->_flags;
  if ((v16 & 0x20) != 0)
  {
    uint64_t v17 = 2654435761 * self->_spellerRankerModelType;
    if ((v16 & 0x40) != 0)
    {
LABEL_23:
      uint64_t v18 = 2654435761 * self->_isFromDLCacheModel;
      if ((v16 & 0x80) != 0) {
        goto LABEL_24;
      }
      goto LABEL_29;
    }
  }
  else
  {
    uint64_t v17 = 0;
    if ((v16 & 0x40) != 0) {
      goto LABEL_23;
    }
  }
  uint64_t v18 = 0;
  if ((v16 & 0x80) != 0)
  {
LABEL_24:
    uint64_t v19 = 2654435761 * self->_isFromDLRuntimeModel;
    if ((v16 & 4) != 0) {
      goto LABEL_25;
    }
LABEL_30:
    uint64_t v20 = 0;
    if ((v16 & 8) != 0) {
      goto LABEL_26;
    }
LABEL_31:
    uint64_t v21 = 0;
    return v24 ^ v25 ^ v23 ^ v4 ^ v5 ^ v6 ^ v8 ^ v13 ^ v14 ^ v15 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21;
  }
LABEL_29:
  uint64_t v19 = 0;
  if ((v16 & 4) == 0) {
    goto LABEL_30;
  }
LABEL_25:
  uint64_t v20 = 2654435761 * self->_modelNumberMajor;
  if ((v16 & 8) == 0) {
    goto LABEL_31;
  }
LABEL_26:
  uint64_t v21 = 2654435761 * self->_modelNumberMinor;
  return v24 ^ v25 ^ v23 ^ v4 ^ v5 ^ v6 ^ v8 ^ v13 ^ v14 ^ v15 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenCandidates, 0);
  objc_storeStrong((id *)&self->_spellSuggestion, 0);
  objc_storeStrong((id *)&self->_allTokenCandidates, 0);
  objc_storeStrong((id *)&self->_allSpellSuggestions, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end