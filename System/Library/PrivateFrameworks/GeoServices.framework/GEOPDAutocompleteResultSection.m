@interface GEOPDAutocompleteResultSection
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDAutocompleteResultSection)init;
- (GEOPDAutocompleteResultSection)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)entries;
- (id)jsonRepresentation;
- (id)name;
- (uint64_t)excludedClientResultTypeAtIndex:(uint64_t)result;
- (uint64_t)includedClientResultTypeAtIndex:(uint64_t)result;
- (unint64_t)hash;
- (void)_addNoFlagsEntries:(uint64_t)a1;
- (void)_readEntries;
- (void)_readExcludedClientResultTypes;
- (void)_readIncludedClientResultTypes;
- (void)_readName;
- (void)addEntries:(uint64_t)a1;
- (void)dealloc;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDAutocompleteResultSection

- (GEOPDAutocompleteResultSection)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDAutocompleteResultSection;
  v2 = [(GEOPDAutocompleteResultSection *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDAutocompleteResultSection)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDAutocompleteResultSection;
  v3 = [(GEOPDAutocompleteResultSection *)&v7 initWithData:a3];
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
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDAutocompleteResultSection;
  [(GEOPDAutocompleteResultSection *)&v3 dealloc];
}

- (void)_readName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 144) & 0x2000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteResultSectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readName_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (id)name
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDAutocompleteResultSection _readName]((uint64_t)a1);
    a1 = (id *)v2[13];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readEntries
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 144) & 0x1000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteResultSectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEntries_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (id)entries
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDAutocompleteResultSection _readEntries]((uint64_t)a1);
    a1 = (id *)v2[12];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addEntries:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDAutocompleteResultSection _readEntries](a1);
    -[GEOPDAutocompleteResultSection _addNoFlagsEntries:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 144) |= 0x1000u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
    *(_WORD *)(a1 + 144) |= 0x4000u;
  }
}

- (void)_addNoFlagsEntries:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 96);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 96);
      *(void *)(a1 + 96) = v5;

      v4 = *(void **)(a1 + 96);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readIncludedClientResultTypes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 144) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteResultSectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIncludedClientResultTypes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (uint64_t)includedClientResultTypeAtIndex:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPDAutocompleteResultSection _readIncludedClientResultTypes](result);
    unint64_t v4 = *(void *)(v3 + 80);
    if (v4 <= a2)
    {
      id v5 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v6 = *MEMORY[0x1E4F1C4A8];
      id v7 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a2, v4);
      v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];
      [v8 raise];
    }
    return *(unsigned int *)(*(void *)(v3 + 72) + 4 * a2);
  }
  return result;
}

- (void)_readExcludedClientResultTypes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 144) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteResultSectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readExcludedClientResultTypes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (uint64_t)excludedClientResultTypeAtIndex:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPDAutocompleteResultSection _readExcludedClientResultTypes](result);
    unint64_t v4 = *(void *)(v3 + 56);
    if (v4 <= a2)
    {
      id v5 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v6 = *MEMORY[0x1E4F1C4A8];
      id v7 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a2, v4);
      v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];
      [v8 raise];
    }
    return *(unsigned int *)(*(void *)(v3 + 48) + 4 * a2);
  }
  return result;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDAutocompleteResultSection;
  unint64_t v4 = [(GEOPDAutocompleteResultSection *)&v8 description];
  id v5 = [(GEOPDAutocompleteResultSection *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAutocompleteResultSection _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v46 = 0;
    goto LABEL_77;
  }
  -[GEOPDAutocompleteResultSection readAll:](a1, 1);
  unint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(_WORD *)(a1 + 144) & 8) != 0)
  {
    uint64_t v5 = *(int *)(a1 + 136);
    if (v5 >= 0xA)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 136));
      uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v6 = off_1E53DC760[v5];
    }
    [v4 setObject:v6 forKey:@"type"];
  }
  id v7 = -[GEOPDAutocompleteResultSection name]((id *)a1);
  if (v7) {
    [v4 setObject:v7 forKey:@"name"];
  }

  if ([*(id *)(a1 + 96) count])
  {
    objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 96), "count"));
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v9 = *(id *)(a1 + 96);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v61 objects:v65 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v62;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v62 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v61 + 1) + 8 * i);
          if (a2) {
            [v14 jsonRepresentation];
          }
          else {
          v15 = [v14 dictionaryRepresentation];
          }
          [v8 addObject:v15];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v61 objects:v65 count:16];
      }
      while (v11);
    }

    [v4 setObject:v8 forKey:@"entries"];
  }
  __int16 v16 = *(_WORD *)(a1 + 144);
  if ((v16 & 4) != 0)
  {
    uint64_t v17 = *(int *)(a1 + 132);
    if (v17 >= 0xA)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 132));
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = off_1E53DC7B0[v17];
    }
    if (a2) {
      v19 = @"suggestionType";
    }
    else {
      v19 = @"suggestion_type";
    }
    [v4 setObject:v18 forKey:v19];

    __int16 v16 = *(_WORD *)(a1 + 144);
  }
  if ((v16 & 2) != 0)
  {
    v48 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 128)];
    if (a2) {
      v49 = @"numVisibleResults";
    }
    else {
      v49 = @"num_visible_results";
    }
    [v4 setObject:v48 forKey:v49];

    __int16 v16 = *(_WORD *)(a1 + 144);
    if ((v16 & 0x80) == 0)
    {
LABEL_31:
      if ((v16 & 0x20) == 0) {
        goto LABEL_32;
      }
      goto LABEL_88;
    }
  }
  else if ((v16 & 0x80) == 0)
  {
    goto LABEL_31;
  }
  v50 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 143)];
  if (a2) {
    v51 = @"shouldInterleaveClientResults";
  }
  else {
    v51 = @"should_interleave_client_results";
  }
  [v4 setObject:v50 forKey:v51];

  __int16 v16 = *(_WORD *)(a1 + 144);
  if ((v16 & 0x20) == 0)
  {
LABEL_32:
    if ((v16 & 0x10) == 0) {
      goto LABEL_33;
    }
    goto LABEL_92;
  }
LABEL_88:
  v52 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 141)];
  if (a2) {
    v53 = @"enforceServerResultsOrder";
  }
  else {
    v53 = @"enforce_server_results_order";
  }
  [v4 setObject:v52 forKey:v53];

  __int16 v16 = *(_WORD *)(a1 + 144);
  if ((v16 & 0x10) == 0)
  {
LABEL_33:
    if ((v16 & 1) == 0) {
      goto LABEL_34;
    }
LABEL_96:
    uint64_t v56 = *(int *)(a1 + 124);
    if (v56 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 124));
      v57 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v57 = off_1E53DC800[v56];
    }
    if (a2) {
      v58 = @"contentType";
    }
    else {
      v58 = @"content_type";
    }
    [v4 setObject:v57 forKey:v58];

    if ((*(_WORD *)(a1 + 144) & 0x40) == 0) {
      goto LABEL_39;
    }
    goto LABEL_35;
  }
LABEL_92:
  v54 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 140)];
  if (a2) {
    v55 = @"enableMapsSuggestServerReranking";
  }
  else {
    v55 = @"enable_maps_suggest_server_reranking";
  }
  [v4 setObject:v54 forKey:v55];

  __int16 v16 = *(_WORD *)(a1 + 144);
  if (v16) {
    goto LABEL_96;
  }
LABEL_34:
  if ((v16 & 0x40) != 0)
  {
LABEL_35:
    v20 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 142)];
    if (a2) {
      v21 = @"isSectionForClientOnlyResults";
    }
    else {
      v21 = @"is_section_for_client_only_results";
    }
    [v4 setObject:v20 forKey:v21];
  }
LABEL_39:
  if (*(void *)(a1 + 32))
  {
    v22 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    v23 = (void *)(a1 + 24);
    if (*(void *)(a1 + 32))
    {
      unint64_t v24 = 0;
      do
      {
        uint64_t v25 = *(int *)(*v23 + 4 * v24);
        if (v25 >= 0xF)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v25);
          v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v26 = off_1E53DC820[v25];
        }
        [v22 addObject:v26];

        ++v24;
        v23 = (void *)(a1 + 24);
      }
      while (v24 < *(void *)(a1 + 32));
    }
    if (a2) {
      v27 = @"allowedTypeClientOnlySection";
    }
    else {
      v27 = @"allowed_type_client_only_section";
    }
    [v4 setObject:v22 forKey:v27];
  }
  if (*(void *)(a1 + 80))
  {
    v28 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    v29 = (void *)(a1 + 72);
    if (*(void *)(a1 + 80))
    {
      unint64_t v30 = 0;
      do
      {
        uint64_t v31 = *(int *)(*v29 + 4 * v30);
        if (v31 >= 0xF)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v31);
          v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v32 = off_1E53DC820[v31];
        }
        [v28 addObject:v32];

        ++v30;
        v29 = (void *)(a1 + 72);
      }
      while (v30 < *(void *)(a1 + 80));
    }
    if (a2) {
      v33 = @"includedClientResultType";
    }
    else {
      v33 = @"included_client_result_type";
    }
    [v4 setObject:v28 forKey:v33];
  }
  if (*(void *)(a1 + 56))
  {
    v34 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    v35 = (void *)(a1 + 48);
    if (*(void *)(a1 + 56))
    {
      unint64_t v36 = 0;
      do
      {
        uint64_t v37 = *(int *)(*v35 + 4 * v36);
        if (v37 >= 0xF)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v37);
          v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v38 = off_1E53DC820[v37];
        }
        [v34 addObject:v38];

        ++v36;
        v35 = (void *)(a1 + 48);
      }
      while (v36 < *(void *)(a1 + 56));
    }
    if (a2) {
      v39 = @"excludedClientResultType";
    }
    else {
      v39 = @"excluded_client_result_type";
    }
    [v4 setObject:v34 forKey:v39];
  }
  v40 = *(void **)(a1 + 16);
  if (v40)
  {
    v41 = [v40 dictionaryRepresentation];
    v42 = v41;
    if (a2)
    {
      v43 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v41, "count"));
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __60__GEOPDAutocompleteResultSection__dictionaryRepresentation___block_invoke;
      v59[3] = &unk_1E53D8860;
      id v44 = v43;
      id v60 = v44;
      [v42 enumerateKeysAndObjectsUsingBlock:v59];
      id v45 = v44;

      v42 = v45;
    }
    [v4 setObject:v42 forKey:@"Unknown Fields"];
  }
  id v46 = v4;

LABEL_77:

  return v46;
}

- (id)jsonRepresentation
{
  return -[GEOPDAutocompleteResultSection _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    unint64_t v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        uint64_t v6 = (int *)&readAll__recursiveTag_1725_0;
      }
      else {
        uint64_t v6 = (int *)&readAll__nonRecursiveTag_1726_0;
      }
      GEOPDAutocompleteResultSectionReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDAutocompleteResultSectionCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

void __60__GEOPDAutocompleteResultSection__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
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
  return GEOPDAutocompleteResultSectionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x7E00) == 0))
  {
    v14 = self->_reader;
    objc_sync_enter(v14);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v15 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v15];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v14);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDAutocompleteResultSection readAll:]((uint64_t)self, 0);
    if ((*(_WORD *)&self->_flags & 8) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_name) {
      PBDataWriterWriteStringField();
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v6 = self->_entries;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }

    __int16 flags = (__int16)self->_flags;
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteInt32Field();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 0x80) != 0)
    {
      PBDataWriterWriteBOOLField();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 0x20) != 0)
    {
      PBDataWriterWriteBOOLField();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 0x10) != 0)
    {
      PBDataWriterWriteBOOLField();
      __int16 flags = (__int16)self->_flags;
    }
    if (flags)
    {
      PBDataWriterWriteInt32Field();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 0x40) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_allowedTypeClientOnlySections.count)
    {
      unint64_t v11 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v11;
      }
      while (v11 < self->_allowedTypeClientOnlySections.count);
    }
    if (self->_includedClientResultTypes.count)
    {
      unint64_t v12 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v12;
      }
      while (v12 < self->_includedClientResultTypes.count);
    }
    if (self->_excludedClientResultTypes.count)
    {
      unint64_t v13 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v13;
      }
      while (v13 < self->_excludedClientResultTypes.count);
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v16);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDAutocompleteResultSection readAll:]((uint64_t)self, 0);
    if ((*(_WORD *)&self->_flags & 8) != 0)
    {
      *(_DWORD *)(v5 + 136) = self->_type;
      *(_WORD *)(v5 + 144) |= 8u;
    }
    uint64_t v9 = [(NSString *)self->_name copyWithZone:a3];
    id v10 = *(void **)(v5 + 104);
    *(void *)(v5 + 104) = v9;

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    unint64_t v11 = self->_entries;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v11);
          }
          v15 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "copyWithZone:", a3, (void)v19);
          -[GEOPDAutocompleteResultSection addEntries:](v5, v15);
        }
        uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v12);
    }

    __int16 flags = (__int16)self->_flags;
    if ((flags & 4) != 0)
    {
      *(_DWORD *)(v5 + 132) = self->_suggestionType;
      *(_WORD *)(v5 + 144) |= 4u;
      __int16 flags = (__int16)self->_flags;
      if ((flags & 2) == 0)
      {
LABEL_16:
        if ((flags & 0x80) == 0) {
          goto LABEL_17;
        }
        goto LABEL_26;
      }
    }
    else if ((flags & 2) == 0)
    {
      goto LABEL_16;
    }
    *(_DWORD *)(v5 + 128) = self->_numVisibleResults;
    *(_WORD *)(v5 + 144) |= 2u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x80) == 0)
    {
LABEL_17:
      if ((flags & 0x20) == 0) {
        goto LABEL_18;
      }
      goto LABEL_27;
    }
LABEL_26:
    *(unsigned char *)(v5 + 143) = self->_shouldInterleaveClientResults;
    *(_WORD *)(v5 + 144) |= 0x80u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_18:
      if ((flags & 0x10) == 0) {
        goto LABEL_19;
      }
      goto LABEL_28;
    }
LABEL_27:
    *(unsigned char *)(v5 + 141) = self->_enforceServerResultsOrder;
    *(_WORD *)(v5 + 144) |= 0x20u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_19:
      if ((flags & 1) == 0) {
        goto LABEL_20;
      }
      goto LABEL_29;
    }
LABEL_28:
    *(unsigned char *)(v5 + 140) = self->_enableMapsSuggestServerReranking;
    *(_WORD *)(v5 + 144) |= 0x10u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_20:
      if ((flags & 0x40) == 0)
      {
LABEL_22:
        PBRepeatedInt32Copy();
        PBRepeatedInt32Copy();
        PBRepeatedInt32Copy();
        long long v17 = self->_unknownFields;
        id v8 = *(id *)(v5 + 16);
        *(void *)(v5 + 16) = v17;
        goto LABEL_23;
      }
LABEL_21:
      *(unsigned char *)(v5 + 142) = self->_isSectionForClientOnlyResults;
      *(_WORD *)(v5 + 144) |= 0x40u;
      goto LABEL_22;
    }
LABEL_29:
    *(_DWORD *)(v5 + 124) = self->_contentType;
    *(_WORD *)(v5 + 144) |= 1u;
    if ((*(_WORD *)&self->_flags & 0x40) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  uint64_t v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x4000) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDAutocompleteResultSectionReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_23:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_61;
  }
  -[GEOPDAutocompleteResultSection readAll:]((uint64_t)self, 1);
  -[GEOPDAutocompleteResultSection readAll:]((uint64_t)v4, 1);
  __int16 v5 = *((_WORD *)v4 + 72);
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    if ((v5 & 8) == 0 || self->_type != *((_DWORD *)v4 + 34)) {
      goto LABEL_61;
    }
  }
  else if ((v5 & 8) != 0)
  {
    goto LABEL_61;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 13) && !-[NSString isEqual:](name, "isEqual:")) {
    goto LABEL_61;
  }
  entries = self->_entries;
  if ((unint64_t)entries | *((void *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](entries, "isEqual:")) {
      goto LABEL_61;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v9 = *((_WORD *)v4 + 72);
  if ((flags & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_suggestionType != *((_DWORD *)v4 + 33)) {
      goto LABEL_61;
    }
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_61;
  }
  if ((flags & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_numVisibleResults != *((_DWORD *)v4 + 32)) {
      goto LABEL_61;
    }
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_61;
  }
  if ((flags & 0x80) != 0)
  {
    if ((v9 & 0x80) == 0) {
      goto LABEL_61;
    }
    if (self->_shouldInterleaveClientResults)
    {
      if (!*((unsigned char *)v4 + 143)) {
        goto LABEL_61;
      }
    }
    else if (*((unsigned char *)v4 + 143))
    {
      goto LABEL_61;
    }
  }
  else if ((v9 & 0x80) != 0)
  {
    goto LABEL_61;
  }
  if ((flags & 0x20) != 0)
  {
    if ((v9 & 0x20) == 0) {
      goto LABEL_61;
    }
    if (self->_enforceServerResultsOrder)
    {
      if (!*((unsigned char *)v4 + 141)) {
        goto LABEL_61;
      }
    }
    else if (*((unsigned char *)v4 + 141))
    {
      goto LABEL_61;
    }
  }
  else if ((v9 & 0x20) != 0)
  {
    goto LABEL_61;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v9 & 0x10) == 0) {
      goto LABEL_61;
    }
    if (self->_enableMapsSuggestServerReranking)
    {
      if (!*((unsigned char *)v4 + 140)) {
        goto LABEL_61;
      }
    }
    else if (*((unsigned char *)v4 + 140))
    {
      goto LABEL_61;
    }
  }
  else if ((v9 & 0x10) != 0)
  {
    goto LABEL_61;
  }
  if (flags)
  {
    if ((v9 & 1) == 0 || self->_contentType != *((_DWORD *)v4 + 31)) {
      goto LABEL_61;
    }
  }
  else if (v9)
  {
    goto LABEL_61;
  }
  if ((flags & 0x40) != 0)
  {
    if ((v9 & 0x40) != 0)
    {
      if (self->_isSectionForClientOnlyResults)
      {
        if (!*((unsigned char *)v4 + 142)) {
          goto LABEL_61;
        }
        goto LABEL_58;
      }
      if (!*((unsigned char *)v4 + 142)) {
        goto LABEL_58;
      }
    }
LABEL_61:
    char IsEqual = 0;
    goto LABEL_62;
  }
  if ((v9 & 0x40) != 0) {
    goto LABEL_61;
  }
LABEL_58:
  if (!PBRepeatedInt32IsEqual() || !PBRepeatedInt32IsEqual()) {
    goto LABEL_61;
  }
  char IsEqual = PBRepeatedInt32IsEqual();
LABEL_62:

  return IsEqual;
}

- (unint64_t)hash
{
  -[GEOPDAutocompleteResultSection readAll:]((uint64_t)self, 1);
  if ((*(_WORD *)&self->_flags & 8) != 0) {
    uint64_t v3 = 2654435761 * self->_type;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_name hash];
  uint64_t v5 = [(NSMutableArray *)self->_entries hash];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    uint64_t v7 = 2654435761 * self->_suggestionType;
    if ((flags & 2) != 0)
    {
LABEL_6:
      uint64_t v8 = 2654435761 * self->_numVisibleResults;
      if ((flags & 0x80) != 0) {
        goto LABEL_7;
      }
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v7 = 0;
    if ((flags & 2) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v8 = 0;
  if ((flags & 0x80) != 0)
  {
LABEL_7:
    uint64_t v9 = 2654435761 * self->_shouldInterleaveClientResults;
    if ((flags & 0x20) != 0) {
      goto LABEL_8;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v9 = 0;
  if ((flags & 0x20) != 0)
  {
LABEL_8:
    uint64_t v10 = 2654435761 * self->_enforceServerResultsOrder;
    if ((flags & 0x10) != 0) {
      goto LABEL_9;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v10 = 0;
  if ((flags & 0x10) != 0)
  {
LABEL_9:
    uint64_t v11 = 2654435761 * self->_enableMapsSuggestServerReranking;
    if (flags) {
      goto LABEL_10;
    }
LABEL_17:
    uint64_t v12 = 0;
    if ((flags & 0x40) != 0) {
      goto LABEL_11;
    }
LABEL_18:
    uint64_t v13 = 0;
    goto LABEL_19;
  }
LABEL_16:
  uint64_t v11 = 0;
  if ((flags & 1) == 0) {
    goto LABEL_17;
  }
LABEL_10:
  uint64_t v12 = 2654435761 * self->_contentType;
  if ((flags & 0x40) == 0) {
    goto LABEL_18;
  }
LABEL_11:
  uint64_t v13 = 2654435761 * self->_isSectionForClientOnlyResults;
LABEL_19:
  NSUInteger v14 = v4 ^ v3 ^ v5 ^ v7;
  uint64_t v15 = v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ PBRepeatedInt32Hash();
  uint64_t v16 = v15 ^ PBRepeatedInt32Hash();
  return v14 ^ v16 ^ PBRepeatedInt32Hash();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end