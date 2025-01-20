@interface GEOPDSearchGeoDecoration
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchGeoDecoration)init;
- (GEOPDSearchGeoDecoration)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (unint64_t)hash;
- (void)_addNoFlagsAlternative:(uint64_t)a1;
- (void)_readAlternatives;
- (void)addAlternative:(os_unfair_lock_s *)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchGeoDecoration

- (GEOPDSearchGeoDecoration)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchGeoDecoration;
  v2 = [(GEOPDSearchGeoDecoration *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchGeoDecoration)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchGeoDecoration;
  v3 = [(GEOPDSearchGeoDecoration *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readAlternatives
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  if ((*(unsigned char *)(a1 + 73) & 0x10) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDSearchGeoDecorationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAlternatives_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
}

- (void)addAlternative:(os_unfair_lock_s *)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDSearchGeoDecoration _readAlternatives]((uint64_t)a1);
    -[GEOPDSearchGeoDecoration _addNoFlagsAlternative:]((uint64_t)a1, v3);

    os_unfair_lock_lock_with_options();
    a1[18]._os_unfair_lock_opaque |= 0x1000u;
    os_unfair_lock_unlock(a1 + 14);
    a1[18]._os_unfair_lock_opaque |= 0x10000u;
  }
}

- (void)_addNoFlagsAlternative:(uint64_t)a1
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
  v8.super_class = (Class)GEOPDSearchGeoDecoration;
  v4 = [(GEOPDSearchGeoDecoration *)&v8 description];
  id v5 = [(GEOPDSearchGeoDecoration *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchGeoDecoration _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_52;
  }
  -[GEOPDSearchGeoDecoration readAll:](a1, 1);
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  if ((*(unsigned char *)(a1 + 73) & 0x20) == 0)
  {
    id v5 = *(void **)(a1 + 8);
    if (v5)
    {
      id v6 = v5;
      objc_sync_enter(v6);
      GEOPDSearchGeoDecorationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCanonicalForm_tags);
      objc_sync_exit(v6);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  id v7 = *(id *)(a1 + 24);
  if (v7)
  {
    if (a2) {
      objc_super v8 = @"canonicalForm";
    }
    else {
      objc_super v8 = @"canonical_form";
    }
    [v4 setObject:v7 forKey:v8];
  }

  int v9 = *(_DWORD *)(a1 + 72);
  if ((v9 & 0x200) != 0)
  {
    v27 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 69)];
    if (a2) {
      v28 = @"isStopWord";
    }
    else {
      v28 = @"is_stop_word";
    }
    [v4 setObject:v27 forKey:v28];

    int v9 = *(_DWORD *)(a1 + 72);
    if ((v9 & 1) == 0)
    {
LABEL_12:
      if ((v9 & 4) == 0) {
        goto LABEL_13;
      }
      goto LABEL_63;
    }
  }
  else if ((v9 & 1) == 0)
  {
    goto LABEL_12;
  }
  v29 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 60)];
  if (a2) {
    v30 = @"isArticle";
  }
  else {
    v30 = @"is_article";
  }
  [v4 setObject:v29 forKey:v30];

  int v9 = *(_DWORD *)(a1 + 72);
  if ((v9 & 4) == 0)
  {
LABEL_13:
    if ((v9 & 0x800) == 0) {
      goto LABEL_14;
    }
    goto LABEL_67;
  }
LABEL_63:
  v31 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 62)];
  if (a2) {
    v32 = @"isDirection";
  }
  else {
    v32 = @"is_direction";
  }
  [v4 setObject:v31 forKey:v32];

  int v9 = *(_DWORD *)(a1 + 72);
  if ((v9 & 0x800) == 0)
  {
LABEL_14:
    if ((v9 & 0x400) == 0) {
      goto LABEL_15;
    }
    goto LABEL_71;
  }
LABEL_67:
  v33 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 71)];
  if (a2) {
    v34 = @"isType";
  }
  else {
    v34 = @"is_type";
  }
  [v4 setObject:v33 forKey:v34];

  int v9 = *(_DWORD *)(a1 + 72);
  if ((v9 & 0x400) == 0)
  {
LABEL_15:
    if ((v9 & 8) == 0) {
      goto LABEL_16;
    }
    goto LABEL_75;
  }
LABEL_71:
  v35 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 70)];
  if (a2) {
    v36 = @"isTitle";
  }
  else {
    v36 = @"is_title";
  }
  [v4 setObject:v35 forKey:v36];

  int v9 = *(_DWORD *)(a1 + 72);
  if ((v9 & 8) == 0)
  {
LABEL_16:
    if ((v9 & 2) == 0) {
      goto LABEL_21;
    }
    goto LABEL_17;
  }
LABEL_75:
  v37 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 63)];
  if (a2) {
    v38 = @"isDropped";
  }
  else {
    v38 = @"is_dropped";
  }
  [v4 setObject:v37 forKey:v38];

  if ((*(_DWORD *)(a1 + 72) & 2) != 0)
  {
LABEL_17:
    v10 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 61)];
    if (a2) {
      v11 = @"isCardinal";
    }
    else {
      v11 = @"is_cardinal";
    }
    [v4 setObject:v10 forKey:v11];
  }
LABEL_21:
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  if ((*(unsigned char *)(a1 + 73) & 0x40) == 0)
  {
    v12 = *(void **)(a1 + 8);
    if (v12)
    {
      id v13 = v12;
      objc_sync_enter(v13);
      GEOPDSearchGeoDecorationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCardinalWord_tags);
      objc_sync_exit(v13);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  id v14 = *(id *)(a1 + 32);
  if (v14)
  {
    if (a2) {
      v15 = @"cardinalWord";
    }
    else {
      v15 = @"cardinal_word";
    }
    [v4 setObject:v14 forKey:v15];
  }

  if ((*(unsigned char *)(a1 + 72) & 0x80) != 0)
  {
    v16 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 67)];
    if (a2) {
      v17 = @"isOrdinal";
    }
    else {
      v17 = @"is_ordinal";
    }
    [v4 setObject:v16 forKey:v17];
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  if ((*(unsigned char *)(a1 + 73) & 0x80) == 0)
  {
    v18 = *(void **)(a1 + 8);
    if (v18)
    {
      id v19 = v18;
      objc_sync_enter(v19);
      GEOPDSearchGeoDecorationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOrdinalWord_tags);
      objc_sync_exit(v19);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  id v20 = *(id *)(a1 + 40);
  if (v20)
  {
    if (a2) {
      v21 = @"ordinalWord";
    }
    else {
      v21 = @"ordinal_word";
    }
    [v4 setObject:v20 forKey:v21];
  }

  int v22 = *(_DWORD *)(a1 + 72);
  if ((v22 & 0x40) != 0)
  {
    v39 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 66)];
    if (a2) {
      v40 = @"isMultiTokenType";
    }
    else {
      v40 = @"is_multi_token_type";
    }
    [v4 setObject:v39 forKey:v40];

    int v22 = *(_DWORD *)(a1 + 72);
    if ((v22 & 0x10) == 0)
    {
LABEL_44:
      if ((v22 & 0x20) == 0) {
        goto LABEL_45;
      }
      goto LABEL_88;
    }
  }
  else if ((v22 & 0x10) == 0)
  {
    goto LABEL_44;
  }
  v41 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 64)];
  if (a2) {
    v42 = @"isMultiTokenDirection";
  }
  else {
    v42 = @"is_multi_token_direction";
  }
  [v4 setObject:v41 forKey:v42];

  int v22 = *(_DWORD *)(a1 + 72);
  if ((v22 & 0x20) == 0)
  {
LABEL_45:
    if ((v22 & 0x100) == 0) {
      goto LABEL_50;
    }
    goto LABEL_46;
  }
LABEL_88:
  v43 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 65)];
  if (a2) {
    v44 = @"isMultiTokenTitle";
  }
  else {
    v44 = @"is_multi_token_title";
  }
  [v4 setObject:v43 forKey:v44];

  if ((*(_DWORD *)(a1 + 72) & 0x100) != 0)
  {
LABEL_46:
    v23 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 68)];
    if (a2) {
      v24 = @"isPersonalName";
    }
    else {
      v24 = @"is_personal_name";
    }
    [v4 setObject:v23 forKey:v24];
  }
LABEL_50:
  if (*(void *)(a1 + 16))
  {
    -[GEOPDSearchGeoDecoration _readAlternatives](a1);
    id v25 = *(id *)(a1 + 16);
    [v4 setObject:v25 forKey:@"alternative"];
  }
LABEL_52:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchGeoDecoration _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_758;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_759;
      }
      GEOPDSearchGeoDecorationReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = [a1 init];
  if (v6)
  {
    if (a3) {
      id v7 = @"canonicalForm";
    }
    else {
      id v7 = @"canonical_form";
    }
    objc_super v8 = [v5 objectForKeyedSubscript:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v9 = (void *)[v8 copy];
      id v10 = v9;
      *(_DWORD *)(v6 + 72) |= 0x2000u;
      *(_DWORD *)(v6 + 72) |= 0x10000u;
      objc_storeStrong((id *)(v6 + 24), v9);
    }
    if (a3) {
      v11 = @"isStopWord";
    }
    else {
      v11 = @"is_stop_word";
    }
    v12 = [v5 objectForKeyedSubscript:v11];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v13 = [v12 BOOLValue];
      *(_DWORD *)(v6 + 72) |= 0x10000u;
      *(_DWORD *)(v6 + 72) |= 0x200u;
      *(unsigned char *)(v6 + 69) = v13;
    }

    if (a3) {
      id v14 = @"isArticle";
    }
    else {
      id v14 = @"is_article";
    }
    v15 = [v5 objectForKeyedSubscript:v14];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v16 = [v15 BOOLValue];
      *(_DWORD *)(v6 + 72) |= 0x10000u;
      *(_DWORD *)(v6 + 72) |= 1u;
      *(unsigned char *)(v6 + 60) = v16;
    }

    if (a3) {
      v17 = @"isDirection";
    }
    else {
      v17 = @"is_direction";
    }
    v18 = [v5 objectForKeyedSubscript:v17];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v19 = [v18 BOOLValue];
      *(_DWORD *)(v6 + 72) |= 0x10000u;
      *(_DWORD *)(v6 + 72) |= 4u;
      *(unsigned char *)(v6 + 62) = v19;
    }

    if (a3) {
      id v20 = @"isType";
    }
    else {
      id v20 = @"is_type";
    }
    v21 = [v5 objectForKeyedSubscript:v20];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v22 = [v21 BOOLValue];
      *(_DWORD *)(v6 + 72) |= 0x10000u;
      *(_DWORD *)(v6 + 72) |= 0x800u;
      *(unsigned char *)(v6 + 71) = v22;
    }

    if (a3) {
      v23 = @"isTitle";
    }
    else {
      v23 = @"is_title";
    }
    v24 = [v5 objectForKeyedSubscript:v23];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v25 = [v24 BOOLValue];
      *(_DWORD *)(v6 + 72) |= 0x10000u;
      *(_DWORD *)(v6 + 72) |= 0x400u;
      *(unsigned char *)(v6 + 70) = v25;
    }

    if (a3) {
      v26 = @"isDropped";
    }
    else {
      v26 = @"is_dropped";
    }
    v27 = [v5 objectForKeyedSubscript:v26];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v28 = [v27 BOOLValue];
      *(_DWORD *)(v6 + 72) |= 0x10000u;
      *(_DWORD *)(v6 + 72) |= 8u;
      *(unsigned char *)(v6 + 63) = v28;
    }

    if (a3) {
      v29 = @"isCardinal";
    }
    else {
      v29 = @"is_cardinal";
    }
    v30 = [v5 objectForKeyedSubscript:v29];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v31 = [v30 BOOLValue];
      *(_DWORD *)(v6 + 72) |= 0x10000u;
      *(_DWORD *)(v6 + 72) |= 2u;
      *(unsigned char *)(v6 + 61) = v31;
    }

    if (a3) {
      v32 = @"cardinalWord";
    }
    else {
      v32 = @"cardinal_word";
    }
    v33 = [v5 objectForKeyedSubscript:v32];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v34 = (void *)[v33 copy];
      id v35 = v34;
      *(_DWORD *)(v6 + 72) |= 0x4000u;
      *(_DWORD *)(v6 + 72) |= 0x10000u;
      objc_storeStrong((id *)(v6 + 32), v34);
    }
    if (a3) {
      v36 = @"isOrdinal";
    }
    else {
      v36 = @"is_ordinal";
    }
    v37 = [v5 objectForKeyedSubscript:v36];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v38 = [v37 BOOLValue];
      *(_DWORD *)(v6 + 72) |= 0x10000u;
      *(_DWORD *)(v6 + 72) |= 0x80u;
      *(unsigned char *)(v6 + 67) = v38;
    }

    if (a3) {
      v39 = @"ordinalWord";
    }
    else {
      v39 = @"ordinal_word";
    }
    v40 = [v5 objectForKeyedSubscript:v39];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v41 = (void *)[v40 copy];
      id v42 = v41;
      *(_DWORD *)(v6 + 72) |= 0x8000u;
      *(_DWORD *)(v6 + 72) |= 0x10000u;
      objc_storeStrong((id *)(v6 + 40), v41);
    }
    if (a3) {
      v43 = @"isMultiTokenType";
    }
    else {
      v43 = @"is_multi_token_type";
    }
    v44 = [v5 objectForKeyedSubscript:v43];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v45 = [v44 BOOLValue];
      *(_DWORD *)(v6 + 72) |= 0x10000u;
      *(_DWORD *)(v6 + 72) |= 0x40u;
      *(unsigned char *)(v6 + 66) = v45;
    }

    if (a3) {
      v46 = @"isMultiTokenDirection";
    }
    else {
      v46 = @"is_multi_token_direction";
    }
    v47 = [v5 objectForKeyedSubscript:v46];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v48 = [v47 BOOLValue];
      *(_DWORD *)(v6 + 72) |= 0x10000u;
      *(_DWORD *)(v6 + 72) |= 0x10u;
      *(unsigned char *)(v6 + 64) = v48;
    }

    if (a3) {
      v49 = @"isMultiTokenTitle";
    }
    else {
      v49 = @"is_multi_token_title";
    }
    v50 = [v5 objectForKeyedSubscript:v49];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v51 = [v50 BOOLValue];
      *(_DWORD *)(v6 + 72) |= 0x10000u;
      *(_DWORD *)(v6 + 72) |= 0x20u;
      *(unsigned char *)(v6 + 65) = v51;
    }

    if (a3) {
      v52 = @"isPersonalName";
    }
    else {
      v52 = @"is_personal_name";
    }
    v53 = [v5 objectForKeyedSubscript:v52];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v54 = [v53 BOOLValue];
      *(_DWORD *)(v6 + 72) |= 0x10000u;
      *(_DWORD *)(v6 + 72) |= 0x100u;
      *(unsigned char *)(v6 + 68) = v54;
    }

    v55 = [v5 objectForKeyedSubscript:@"alternative"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      id v56 = v55;
      uint64_t v57 = [v56 countByEnumeratingWithState:&v64 objects:v68 count:16];
      if (v57)
      {
        uint64_t v58 = v57;
        uint64_t v59 = *(void *)v65;
        do
        {
          uint64_t v60 = 0;
          do
          {
            if (*(void *)v65 != v59) {
              objc_enumerationMutation(v56);
            }
            v61 = *(void **)(*((void *)&v64 + 1) + 8 * v60);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v62 = objc_msgSend(v61, "copy", (void)v64);
              -[GEOPDSearchGeoDecoration addAlternative:]((os_unfair_lock_s *)v6, v62);
            }
            ++v60;
          }
          while (v58 != v60);
          uint64_t v58 = [v56 countByEnumeratingWithState:&v64 objects:v68 count:16];
        }
        while (v58);
      }
    }
  }

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchGeoDecorationReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_DWORD *)&self->_flags & 0x1F000) == 0)
    {
      v12 = self->_reader;
      objc_sync_enter(v12);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      char v13 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v4 writeData:v13];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v12);
      goto LABEL_44;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchGeoDecoration readAll:]((uint64_t)self, 0);
  if (self->_canonicalForm) {
    PBDataWriterWriteStringField();
  }
  $419EF5E8D35E0A6D374E5D517AED3A72 flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    PBDataWriterWriteBOOLField();
    $419EF5E8D35E0A6D374E5D517AED3A72 flags = self->_flags;
    if ((*(unsigned char *)&flags & 1) == 0)
    {
LABEL_7:
      if ((*(unsigned char *)&flags & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_34;
    }
  }
  else if ((*(unsigned char *)&flags & 1) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteBOOLField();
  $419EF5E8D35E0A6D374E5D517AED3A72 flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&flags & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteBOOLField();
  $419EF5E8D35E0A6D374E5D517AED3A72 flags = self->_flags;
  if ((*(_WORD *)&flags & 0x800) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&flags & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteBOOLField();
  $419EF5E8D35E0A6D374E5D517AED3A72 flags = self->_flags;
  if ((*(_WORD *)&flags & 0x400) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&flags & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteBOOLField();
  $419EF5E8D35E0A6D374E5D517AED3A72 flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&flags & 2) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_37:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_flags & 2) != 0) {
LABEL_12:
  }
    PBDataWriterWriteBOOLField();
LABEL_13:
  if (self->_cardinalWord) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_flags & 0x80) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_ordinalWord) {
    PBDataWriterWriteStringField();
  }
  $419EF5E8D35E0A6D374E5D517AED3A72 v7 = self->_flags;
  if ((*(unsigned char *)&v7 & 0x40) != 0)
  {
    PBDataWriterWriteBOOLField();
    $419EF5E8D35E0A6D374E5D517AED3A72 v7 = self->_flags;
    if ((*(unsigned char *)&v7 & 0x10) == 0)
    {
LABEL_21:
      if ((*(unsigned char *)&v7 & 0x20) == 0) {
        goto LABEL_22;
      }
LABEL_41:
      PBDataWriterWriteBOOLField();
      if ((*(_DWORD *)&self->_flags & 0x100) == 0) {
        goto LABEL_24;
      }
      goto LABEL_23;
    }
  }
  else if ((*(unsigned char *)&v7 & 0x10) == 0)
  {
    goto LABEL_21;
  }
  PBDataWriterWriteBOOLField();
  $419EF5E8D35E0A6D374E5D517AED3A72 v7 = self->_flags;
  if ((*(unsigned char *)&v7 & 0x20) != 0) {
    goto LABEL_41;
  }
LABEL_22:
  if ((*(_WORD *)&v7 & 0x100) != 0) {
LABEL_23:
  }
    PBDataWriterWriteBOOLField();
LABEL_24:
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  objc_super v8 = self->_alternatives;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

LABEL_44:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    $419EF5E8D35E0A6D374E5D517AED3A72 v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 2) & 1) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDSearchGeoDecorationReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_super v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_27;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchGeoDecoration readAll:]((uint64_t)self, 0);
  uint64_t v9 = [(NSString *)self->_canonicalForm copyWithZone:a3];
  uint64_t v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  $419EF5E8D35E0A6D374E5D517AED3A72 flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    *(unsigned char *)(v5 + 69) = self->_isStopWord;
    *(_DWORD *)(v5 + 72) |= 0x200u;
    $419EF5E8D35E0A6D374E5D517AED3A72 flags = self->_flags;
    if ((*(unsigned char *)&flags & 1) == 0)
    {
LABEL_7:
      if ((*(unsigned char *)&flags & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_30;
    }
  }
  else if ((*(unsigned char *)&flags & 1) == 0)
  {
    goto LABEL_7;
  }
  *(unsigned char *)(v5 + 60) = self->_isArticle;
  *(_DWORD *)(v5 + 72) |= 1u;
  $419EF5E8D35E0A6D374E5D517AED3A72 flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&flags & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_31;
  }
LABEL_30:
  *(unsigned char *)(v5 + 62) = self->_isDirection;
  *(_DWORD *)(v5 + 72) |= 4u;
  $419EF5E8D35E0A6D374E5D517AED3A72 flags = self->_flags;
  if ((*(_WORD *)&flags & 0x800) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&flags & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_32;
  }
LABEL_31:
  *(unsigned char *)(v5 + 71) = self->_isType;
  *(_DWORD *)(v5 + 72) |= 0x800u;
  $419EF5E8D35E0A6D374E5D517AED3A72 flags = self->_flags;
  if ((*(_WORD *)&flags & 0x400) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&flags & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_33;
  }
LABEL_32:
  *(unsigned char *)(v5 + 70) = self->_isTitle;
  *(_DWORD *)(v5 + 72) |= 0x400u;
  $419EF5E8D35E0A6D374E5D517AED3A72 flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&flags & 2) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_33:
  *(unsigned char *)(v5 + 63) = self->_isDropped;
  *(_DWORD *)(v5 + 72) |= 8u;
  if ((*(_DWORD *)&self->_flags & 2) != 0)
  {
LABEL_12:
    *(unsigned char *)(v5 + 61) = self->_isCardinal;
    *(_DWORD *)(v5 + 72) |= 2u;
  }
LABEL_13:
  uint64_t v12 = [(NSString *)self->_cardinalWord copyWithZone:a3];
  char v13 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v12;

  if ((*(unsigned char *)&self->_flags & 0x80) != 0)
  {
    *(unsigned char *)(v5 + 67) = self->_isOrdinal;
    *(_DWORD *)(v5 + 72) |= 0x80u;
  }
  uint64_t v14 = [(NSString *)self->_ordinalWord copyWithZone:a3];
  long long v15 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v14;

  $419EF5E8D35E0A6D374E5D517AED3A72 v16 = self->_flags;
  if ((*(unsigned char *)&v16 & 0x40) != 0)
  {
    *(unsigned char *)(v5 + 66) = self->_isMultiTokenType;
    *(_DWORD *)(v5 + 72) |= 0x40u;
    $419EF5E8D35E0A6D374E5D517AED3A72 v16 = self->_flags;
    if ((*(unsigned char *)&v16 & 0x10) == 0)
    {
LABEL_17:
      if ((*(unsigned char *)&v16 & 0x20) == 0) {
        goto LABEL_18;
      }
      goto LABEL_37;
    }
  }
  else if ((*(unsigned char *)&v16 & 0x10) == 0)
  {
    goto LABEL_17;
  }
  *(unsigned char *)(v5 + 64) = self->_isMultiTokenDirection;
  *(_DWORD *)(v5 + 72) |= 0x10u;
  $419EF5E8D35E0A6D374E5D517AED3A72 v16 = self->_flags;
  if ((*(unsigned char *)&v16 & 0x20) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v16 & 0x100) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_37:
  *(unsigned char *)(v5 + 65) = self->_isMultiTokenTitle;
  *(_DWORD *)(v5 + 72) |= 0x20u;
  if ((*(_DWORD *)&self->_flags & 0x100) != 0)
  {
LABEL_19:
    *(unsigned char *)(v5 + 68) = self->_isPersonalName;
    *(_DWORD *)(v5 + 72) |= 0x100u;
  }
LABEL_20:
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  objc_super v8 = self->_alternatives;
  uint64_t v17 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v8);
        }
        id v20 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "copyWithZone:", a3, (void)v22);
        -[GEOPDSearchGeoDecoration addAlternative:]((os_unfair_lock_s *)v5, v20);
      }
      uint64_t v17 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v17);
  }
LABEL_27:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_102;
  }
  -[GEOPDSearchGeoDecoration readAll:]((uint64_t)self, 1);
  -[GEOPDSearchGeoDecoration readAll:]((uint64_t)v4, 1);
  canonicalForm = self->_canonicalForm;
  if ((unint64_t)canonicalForm | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](canonicalForm, "isEqual:")) {
      goto LABEL_102;
    }
  }
  $419EF5E8D35E0A6D374E5D517AED3A72 flags = self->_flags;
  int v7 = *((_DWORD *)v4 + 18);
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0) {
      goto LABEL_102;
    }
    if (self->_isStopWord)
    {
      if (!*((unsigned char *)v4 + 69)) {
        goto LABEL_102;
      }
    }
    else if (*((unsigned char *)v4 + 69))
    {
      goto LABEL_102;
    }
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_102;
  }
  if (*(unsigned char *)&flags)
  {
    if ((v7 & 1) == 0) {
      goto LABEL_102;
    }
    if (self->_isArticle)
    {
      if (!*((unsigned char *)v4 + 60)) {
        goto LABEL_102;
      }
    }
    else if (*((unsigned char *)v4 + 60))
    {
      goto LABEL_102;
    }
  }
  else if (v7)
  {
    goto LABEL_102;
  }
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    if ((v7 & 4) == 0) {
      goto LABEL_102;
    }
    if (self->_isDirection)
    {
      if (!*((unsigned char *)v4 + 62)) {
        goto LABEL_102;
      }
    }
    else if (*((unsigned char *)v4 + 62))
    {
      goto LABEL_102;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
    if ((v7 & 0x800) == 0) {
      goto LABEL_102;
    }
    if (self->_isType)
    {
      if (!*((unsigned char *)v4 + 71)) {
        goto LABEL_102;
      }
    }
    else if (*((unsigned char *)v4 + 71))
    {
      goto LABEL_102;
    }
  }
  else if ((v7 & 0x800) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0) {
      goto LABEL_102;
    }
    if (self->_isTitle)
    {
      if (!*((unsigned char *)v4 + 70)) {
        goto LABEL_102;
      }
    }
    else if (*((unsigned char *)v4 + 70))
    {
      goto LABEL_102;
    }
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_102;
  }
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    if ((v7 & 8) == 0) {
      goto LABEL_102;
    }
    if (self->_isDropped)
    {
      if (!*((unsigned char *)v4 + 63)) {
        goto LABEL_102;
      }
    }
    else if (*((unsigned char *)v4 + 63))
    {
      goto LABEL_102;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_102;
  }
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    if ((v7 & 2) == 0) {
      goto LABEL_102;
    }
    if (self->_isCardinal)
    {
      if (!*((unsigned char *)v4 + 61)) {
        goto LABEL_102;
      }
    }
    else if (*((unsigned char *)v4 + 61))
    {
      goto LABEL_102;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_102;
  }
  cardinalWord = self->_cardinalWord;
  if ((unint64_t)cardinalWord | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](cardinalWord, "isEqual:")) {
      goto LABEL_102;
    }
    $419EF5E8D35E0A6D374E5D517AED3A72 flags = self->_flags;
    int v7 = *((_DWORD *)v4 + 18);
  }
  if ((*(unsigned char *)&flags & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0) {
      goto LABEL_102;
    }
    if (self->_isOrdinal)
    {
      if (!*((unsigned char *)v4 + 67)) {
        goto LABEL_102;
      }
    }
    else if (*((unsigned char *)v4 + 67))
    {
      goto LABEL_102;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_102;
  }
  ordinalWord = self->_ordinalWord;
  if ((unint64_t)ordinalWord | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](ordinalWord, "isEqual:")) {
      goto LABEL_102;
    }
    $419EF5E8D35E0A6D374E5D517AED3A72 flags = self->_flags;
    int v7 = *((_DWORD *)v4 + 18);
  }
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0) {
      goto LABEL_102;
    }
    if (self->_isMultiTokenType)
    {
      if (!*((unsigned char *)v4 + 66)) {
        goto LABEL_102;
      }
    }
    else if (*((unsigned char *)v4 + 66))
    {
      goto LABEL_102;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_102;
  }
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0) {
      goto LABEL_102;
    }
    if (self->_isMultiTokenDirection)
    {
      if (!*((unsigned char *)v4 + 64)) {
        goto LABEL_102;
      }
    }
    else if (*((unsigned char *)v4 + 64))
    {
      goto LABEL_102;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_102;
  }
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0) {
      goto LABEL_102;
    }
    if (self->_isMultiTokenTitle)
    {
      if (!*((unsigned char *)v4 + 65)) {
        goto LABEL_102;
      }
    }
    else if (*((unsigned char *)v4 + 65))
    {
      goto LABEL_102;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&flags & 0x100) == 0)
  {
    if ((v7 & 0x100) == 0) {
      goto LABEL_108;
    }
LABEL_102:
    char v10 = 0;
    goto LABEL_103;
  }
  if ((v7 & 0x100) == 0) {
    goto LABEL_102;
  }
  if (!self->_isPersonalName)
  {
    if (!*((unsigned char *)v4 + 68)) {
      goto LABEL_108;
    }
    goto LABEL_102;
  }
  if (!*((unsigned char *)v4 + 68)) {
    goto LABEL_102;
  }
LABEL_108:
  alternatives = self->_alternatives;
  if ((unint64_t)alternatives | *((void *)v4 + 2)) {
    char v10 = -[NSMutableArray isEqual:](alternatives, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_103:

  return v10;
}

- (unint64_t)hash
{
  -[GEOPDSearchGeoDecoration readAll:]((uint64_t)self, 1);
  NSUInteger v20 = [(NSString *)self->_canonicalForm hash];
  $419EF5E8D35E0A6D374E5D517AED3A72 flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    uint64_t v19 = 2654435761 * self->_isStopWord;
    if (*(unsigned char *)&flags)
    {
LABEL_3:
      uint64_t v18 = 2654435761 * self->_isArticle;
      if ((*(unsigned char *)&flags & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v19 = 0;
    if (*(unsigned char *)&flags) {
      goto LABEL_3;
    }
  }
  uint64_t v18 = 0;
  if ((*(unsigned char *)&flags & 4) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_isDirection;
    if ((*(_WORD *)&flags & 0x800) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v4 = 0;
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_isType;
    if ((*(_WORD *)&flags & 0x400) != 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v5 = 0;
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
LABEL_6:
    uint64_t v6 = 2654435761 * self->_isTitle;
    if ((*(unsigned char *)&flags & 8) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    uint64_t v7 = 0;
    if ((*(unsigned char *)&flags & 2) != 0) {
      goto LABEL_8;
    }
    goto LABEL_15;
  }
LABEL_13:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&flags & 8) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_isDropped;
  if ((*(unsigned char *)&flags & 2) != 0)
  {
LABEL_8:
    uint64_t v8 = 2654435761 * self->_isCardinal;
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v8 = 0;
LABEL_16:
  NSUInteger v9 = [(NSString *)self->_cardinalWord hash];
  if ((*(unsigned char *)&self->_flags & 0x80) != 0) {
    uint64_t v10 = 2654435761 * self->_isOrdinal;
  }
  else {
    uint64_t v10 = 0;
  }
  NSUInteger v11 = [(NSString *)self->_ordinalWord hash];
  $419EF5E8D35E0A6D374E5D517AED3A72 v12 = self->_flags;
  if ((*(unsigned char *)&v12 & 0x40) != 0)
  {
    uint64_t v13 = 2654435761 * self->_isMultiTokenType;
    if ((*(unsigned char *)&v12 & 0x10) != 0)
    {
LABEL_21:
      uint64_t v14 = 2654435761 * self->_isMultiTokenDirection;
      if ((*(unsigned char *)&v12 & 0x20) != 0) {
        goto LABEL_22;
      }
LABEL_26:
      uint64_t v15 = 0;
      if ((*(_WORD *)&v12 & 0x100) != 0) {
        goto LABEL_23;
      }
LABEL_27:
      uint64_t v16 = 0;
      return v19 ^ v20 ^ v18 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16 ^ [(NSMutableArray *)self->_alternatives hash];
    }
  }
  else
  {
    uint64_t v13 = 0;
    if ((*(unsigned char *)&v12 & 0x10) != 0) {
      goto LABEL_21;
    }
  }
  uint64_t v14 = 0;
  if ((*(unsigned char *)&v12 & 0x20) == 0) {
    goto LABEL_26;
  }
LABEL_22:
  uint64_t v15 = 2654435761 * self->_isMultiTokenTitle;
  if ((*(_WORD *)&v12 & 0x100) == 0) {
    goto LABEL_27;
  }
LABEL_23:
  uint64_t v16 = 2654435761 * self->_isPersonalName;
  return v19 ^ v20 ^ v18 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16 ^ [(NSMutableArray *)self->_alternatives hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ordinalWord, 0);
  objc_storeStrong((id *)&self->_cardinalWord, 0);
  objc_storeStrong((id *)&self->_canonicalForm, 0);
  objc_storeStrong((id *)&self->_alternatives, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end