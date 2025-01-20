@interface GEOPDResultRefinementMultiSelect
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDResultRefinementMultiSelect)init;
- (GEOPDResultRefinementMultiSelect)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)displayName;
- (id)displayNameForMultiSelected;
- (id)jsonRepresentation;
- (id)multiSelectIdentifier;
- (id)multiSelects;
- (uint64_t)clauseType;
- (unint64_t)hash;
- (void)_addNoFlagsMultiSelect:(uint64_t)a1;
- (void)_readDisplayName;
- (void)_readDisplayNameForMultiSelected;
- (void)_readMultiSelectIdentifier;
- (void)_readMultiSelects;
- (void)addMultiSelect:(uint64_t)a1;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setDisplayName:(uint64_t)a1;
- (void)setDisplayNameForMultiSelected:(uint64_t)a1;
- (void)setMultiSelectIdentifier:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDResultRefinementMultiSelect

- (void)clearUnknownFields:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 80) |= 8u;
    *(_WORD *)(a1 + 80) |= 0x100u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDResultRefinementMultiSelect readAll:](a1, 0);
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      id v5 = *(id *)(a1 + 48);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v11;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v11 != v8) {
              objc_enumerationMutation(v5);
            }
            -[GEOPDResultRefinementMultiSelectElement clearUnknownFields:](*(void *)(*((void *)&v10 + 1) + 8 * v9++), 1);
          }
          while (v7 != v9);
          uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        }
        while (v7);
      }
    }
  }
}

- (GEOPDResultRefinementMultiSelect)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDResultRefinementMultiSelect;
  v2 = [(GEOPDResultRefinementMultiSelect *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDResultRefinementMultiSelect)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDResultRefinementMultiSelect;
  v3 = [(GEOPDResultRefinementMultiSelect *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)_readDisplayName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 80) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultRefinementMultiSelectReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayName_tags_801);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)displayName
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDResultRefinementMultiSelect _readDisplayName]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setDisplayName:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 80) |= 0x20u;
    *(_WORD *)(a1 + 80) |= 0x100u;
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (void)_readMultiSelects
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 80) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultRefinementMultiSelectReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMultiSelects_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)multiSelects
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDResultRefinementMultiSelect _readMultiSelects]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addMultiSelect:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDResultRefinementMultiSelect _readMultiSelects](a1);
    -[GEOPDResultRefinementMultiSelect _addNoFlagsMultiSelect:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 80) |= 0x80u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(_WORD *)(a1 + 80) |= 0x100u;
  }
}

- (void)_addNoFlagsMultiSelect:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 48);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;

      id v4 = *(void **)(a1 + 48);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (uint64_t)clauseType
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    __int16 v2 = *(_WORD *)(v1 + 80);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 64));
    if (v2) {
      return *(unsigned int *)(v1 + 68);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)_readDisplayNameForMultiSelected
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 80) & 0x10) == 0)
    {
      __int16 v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultRefinementMultiSelectReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayNameForMultiSelected_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)displayNameForMultiSelected
{
  if (a1)
  {
    __int16 v2 = a1;
    -[GEOPDResultRefinementMultiSelect _readDisplayNameForMultiSelected]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setDisplayNameForMultiSelected:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 80) |= 0x10u;
    *(_WORD *)(a1 + 80) |= 0x100u;
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void)_readMultiSelectIdentifier
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 80) & 0x40) == 0)
    {
      __int16 v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultRefinementMultiSelectReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMultiSelectIdentifier_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)multiSelectIdentifier
{
  if (a1)
  {
    __int16 v2 = a1;
    -[GEOPDResultRefinementMultiSelect _readMultiSelectIdentifier]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setMultiSelectIdentifier:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 80) |= 0x40u;
    *(_WORD *)(a1 + 80) |= 0x100u;
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDResultRefinementMultiSelect;
  id v4 = [(GEOPDResultRefinementMultiSelect *)&v8 description];
  id v5 = [(GEOPDResultRefinementMultiSelect *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDResultRefinementMultiSelect _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_43;
  }
  -[GEOPDResultRefinementMultiSelect readAll:](a1, 1);
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = -[GEOPDResultRefinementMultiSelect displayName]((id *)a1);
  if (v5)
  {
    if (a2) {
      objc_super v6 = @"displayName";
    }
    else {
      objc_super v6 = @"display_name";
    }
    [v4 setObject:v5 forKey:v6];
  }

  if ([*(id *)(a1 + 48) count])
  {
    id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v8 = *(id *)(a1 + 48);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v38 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          if (a2) {
            [v13 jsonRepresentation];
          }
          else {
          v14 = [v13 dictionaryRepresentation];
          }
          [v7 addObject:v14];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v10);
    }

    if (a2) {
      uint64_t v15 = @"multiSelect";
    }
    else {
      uint64_t v15 = @"multi_select";
    }
    [v4 setObject:v7 forKey:v15];
  }
  __int16 v16 = *(_WORD *)(a1 + 80);
  if ((v16 & 2) == 0)
  {
    if ((v16 & 1) == 0) {
      goto LABEL_24;
    }
LABEL_50:
    int v32 = *(_DWORD *)(a1 + 68);
    if (v32)
    {
      if (v32 == 1)
      {
        v33 = @"RESULT_REFINEMENT_MULTI_SELECT_CLAUSE_TYPE_ALL";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 68));
        v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v33 = @"RESULT_REFINEMENT_MULTI_SELECT_CLAUSE_TYPE_ANY";
    }
    if (a2) {
      v34 = @"clauseType";
    }
    else {
      v34 = @"clause_type";
    }
    [v4 setObject:v33 forKey:v34];

    if ((*(_WORD *)(a1 + 80) & 4) == 0) {
      goto LABEL_29;
    }
    goto LABEL_25;
  }
  v30 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 72)];
  if (a2) {
    v31 = @"maxNumSelectElements";
  }
  else {
    v31 = @"max_num_select_elements";
  }
  [v4 setObject:v30 forKey:v31];

  __int16 v16 = *(_WORD *)(a1 + 80);
  if (v16) {
    goto LABEL_50;
  }
LABEL_24:
  if ((v16 & 4) != 0)
  {
LABEL_25:
    v17 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 76)];
    if (a2) {
      v18 = @"showEqualWidthButtonsOnFilterView";
    }
    else {
      v18 = @"show_equal_width_buttons_on_filter_view";
    }
    [v4 setObject:v17 forKey:v18];
  }
LABEL_29:
  v19 = -[GEOPDResultRefinementMultiSelect displayNameForMultiSelected]((id *)a1);
  if (v19)
  {
    if (a2) {
      v20 = @"displayNameForMultiSelected";
    }
    else {
      v20 = @"display_name_for_multi_selected";
    }
    [v4 setObject:v19 forKey:v20];
  }

  v21 = -[GEOPDResultRefinementMultiSelect multiSelectIdentifier]((id *)a1);
  if (v21)
  {
    if (a2) {
      v22 = @"multiSelectIdentifier";
    }
    else {
      v22 = @"multi_select_identifier";
    }
    [v4 setObject:v21 forKey:v22];
  }

  v23 = *(void **)(a1 + 16);
  if (v23)
  {
    v24 = [v23 dictionaryRepresentation];
    v25 = v24;
    if (a2)
    {
      v26 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v24, "count"));
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __62__GEOPDResultRefinementMultiSelect__dictionaryRepresentation___block_invoke;
      v35[3] = &unk_1E53D8860;
      id v27 = v26;
      id v36 = v27;
      [v25 enumerateKeysAndObjectsUsingBlock:v35];
      id v28 = v27;

      v25 = v28;
    }
    [v4 setObject:v25 forKey:@"Unknown Fields"];
  }
LABEL_43:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDResultRefinementMultiSelect _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_833;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_834;
      }
      GEOPDResultRefinementMultiSelectReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDResultRefinementMultiSelectCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __62__GEOPDResultRefinementMultiSelect__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDResultRefinementMultiSelectReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x1F0) == 0))
  {
    uint64_t v11 = self->_reader;
    objc_sync_enter(v11);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    long long v12 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v12];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v11);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDResultRefinementMultiSelect readAll:]((uint64_t)self, 0);
    if (self->_displayName) {
      PBDataWriterWriteStringField();
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    objc_super v6 = self->_multiSelects;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    __int16 flags = (__int16)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteUint32Field();
      __int16 flags = (__int16)self->_flags;
    }
    if (flags)
    {
      PBDataWriterWriteInt32Field();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 4) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_displayNameForMultiSelected) {
      PBDataWriterWriteStringField();
    }
    if (self->_multiSelectIdentifier) {
      PBDataWriterWriteStringField();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v13);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDResultRefinementMultiSelect readAll:]((uint64_t)self, 0);
    uint64_t v9 = [(NSString *)self->_displayName copyWithZone:a3];
    id v10 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v9;

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v11 = self->_multiSelects;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v11);
          }
          long long v15 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "copyWithZone:", a3, (void)v23);
          -[GEOPDResultRefinementMultiSelect addMultiSelect:](v5, v15);
        }
        uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v12);
    }

    __int16 flags = (__int16)self->_flags;
    if ((flags & 2) != 0)
    {
      *(_DWORD *)(v5 + 72) = self->_maxNumSelectElements;
      *(_WORD *)(v5 + 80) |= 2u;
      __int16 flags = (__int16)self->_flags;
      if ((flags & 1) == 0)
      {
LABEL_14:
        if ((flags & 4) == 0)
        {
LABEL_16:
          uint64_t v17 = -[NSString copyWithZone:](self->_displayNameForMultiSelected, "copyWithZone:", a3, (void)v23);
          uint64_t v18 = *(void **)(v5 + 24);
          *(void *)(v5 + 24) = v17;

          uint64_t v19 = [(NSString *)self->_multiSelectIdentifier copyWithZone:a3];
          v20 = *(void **)(v5 + 40);
          *(void *)(v5 + 40) = v19;

          v21 = self->_unknownFields;
          id v8 = *(id *)(v5 + 16);
          *(void *)(v5 + 16) = v21;
          goto LABEL_17;
        }
LABEL_15:
        *(unsigned char *)(v5 + 76) = self->_showEqualWidthButtonsOnFilterView;
        *(_WORD *)(v5 + 80) |= 4u;
        goto LABEL_16;
      }
    }
    else if ((flags & 1) == 0)
    {
      goto LABEL_14;
    }
    *(_DWORD *)(v5 + 68) = self->_clauseType;
    *(_WORD *)(v5 + 80) |= 1u;
    if ((*(_WORD *)&self->_flags & 4) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  uint64_t v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDResultRefinementMultiSelectReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_17:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  -[GEOPDResultRefinementMultiSelect readAll:]((uint64_t)self, 1);
  -[GEOPDResultRefinementMultiSelect readAll:]((uint64_t)v4, 1);
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:")) {
      goto LABEL_28;
    }
  }
  multiSelects = self->_multiSelects;
  if ((unint64_t)multiSelects | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](multiSelects, "isEqual:")) {
      goto LABEL_28;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v8 = *((_WORD *)v4 + 40);
  if ((flags & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_maxNumSelectElements != *((_DWORD *)v4 + 18)) {
      goto LABEL_28;
    }
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_28;
  }
  if (flags)
  {
    if ((v8 & 1) == 0 || self->_clauseType != *((_DWORD *)v4 + 17)) {
      goto LABEL_28;
    }
  }
  else if (v8)
  {
    goto LABEL_28;
  }
  if ((flags & 4) != 0)
  {
    if ((v8 & 4) != 0)
    {
      if (self->_showEqualWidthButtonsOnFilterView)
      {
        if (!*((unsigned char *)v4 + 76)) {
          goto LABEL_28;
        }
        goto LABEL_24;
      }
      if (!*((unsigned char *)v4 + 76)) {
        goto LABEL_24;
      }
    }
LABEL_28:
    char v11 = 0;
    goto LABEL_29;
  }
  if ((v8 & 4) != 0) {
    goto LABEL_28;
  }
LABEL_24:
  displayNameForMultiSelected = self->_displayNameForMultiSelected;
  if ((unint64_t)displayNameForMultiSelected | *((void *)v4 + 3)
    && !-[NSString isEqual:](displayNameForMultiSelected, "isEqual:"))
  {
    goto LABEL_28;
  }
  multiSelectIdentifier = self->_multiSelectIdentifier;
  if ((unint64_t)multiSelectIdentifier | *((void *)v4 + 5)) {
    char v11 = -[NSString isEqual:](multiSelectIdentifier, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_29:

  return v11;
}

- (unint64_t)hash
{
  -[GEOPDResultRefinementMultiSelect readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_displayName hash];
  uint64_t v4 = [(NSMutableArray *)self->_multiSelects hash];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
    uint64_t v6 = 0;
    if (flags) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v7 = 0;
    if ((flags & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v8 = 0;
    goto LABEL_8;
  }
  uint64_t v6 = 2654435761 * self->_maxNumSelectElements;
  if ((flags & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v7 = 2654435761 * self->_clauseType;
  if ((flags & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v8 = 2654435761 * self->_showEqualWidthButtonsOnFilterView;
LABEL_8:
  NSUInteger v9 = v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ [(NSString *)self->_displayNameForMultiSelected hash];
  return v9 ^ [(NSString *)self->_multiSelectIdentifier hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiSelects, 0);
  objc_storeStrong((id *)&self->_multiSelectIdentifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_displayNameForMultiSelected, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end