@interface GEOPDSearchBrowseCategorySuggestionParameters
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchBrowseCategorySuggestionParameters)init;
- (GEOPDSearchBrowseCategorySuggestionParameters)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)result;
- (uint64_t)setEngineTypes:(uint64_t)a3 count:;
- (unint64_t)hash;
- (void)_addNoFlagsInputCategory:(uint64_t)a1;
- (void)_readEngineTypes;
- (void)_readInputCategorys;
- (void)_readSearchOriginationInfo;
- (void)_readViewportInfo;
- (void)addEngineType:(uint64_t)a1;
- (void)addInputCategory:(uint64_t)a1;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)dealloc;
- (void)mergeFrom:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setEvChargingParameters:(uint64_t)a1;
- (void)setSearchOriginationInfo:(uint64_t)a1;
- (void)setVenueFilter:(uint64_t)a1;
- (void)setViewportInfo:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchBrowseCategorySuggestionParameters

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        v6 = (int *)&readAll__recursiveTag_6660;
      }
      else {
        v6 = (int *)&readAll__nonRecursiveTag_6661;
      }
      GEOPDSearchBrowseCategorySuggestionParametersReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDSearchBrowseCategorySuggestionParametersCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (GEOPDSearchBrowseCategorySuggestionParameters)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchBrowseCategorySuggestionParameters;
  v2 = [(GEOPDSearchBrowseCategorySuggestionParameters *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_90;
  }
  -[GEOPDSearchBrowseCategorySuggestionParameters readAll:](a1, 1);
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  -[GEOPDSearchBrowseCategorySuggestionParameters _readViewportInfo](a1);
  id v5 = *(id *)(a1 + 88);
  objc_super v6 = v5;
  if (v5)
  {
    if (a2)
    {
      v7 = [v5 jsonRepresentation];
      v8 = @"viewportInfo";
    }
    else
    {
      v7 = [v5 dictionaryRepresentation];
      v8 = @"viewport_info";
    }
    [v4 setObject:v7 forKey:v8];
  }
  __int16 v9 = *(_WORD *)(a1 + 124);
  if (v9)
  {
    v10 = [NSNumber numberWithDouble:*(double *)(a1 + 64)];
    if (a2) {
      v11 = @"requestLocalTimestamp";
    }
    else {
      v11 = @"request_local_timestamp";
    }
    [v4 setObject:v10 forKey:v11];

    __int16 v9 = *(_WORD *)(a1 + 124);
    if ((v9 & 2) == 0)
    {
LABEL_9:
      if ((v9 & 0x10) == 0) {
        goto LABEL_10;
      }
      goto LABEL_20;
    }
  }
  else if ((v9 & 2) == 0)
  {
    goto LABEL_9;
  }
  v12 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 108)];
  if (a2) {
    v13 = @"minimumNumberOfCategories";
  }
  else {
    v13 = @"minimum_number_of_categories";
  }
  [v4 setObject:v12 forKey:v13];

  __int16 v9 = *(_WORD *)(a1 + 124);
  if ((v9 & 0x10) == 0)
  {
LABEL_10:
    if ((v9 & 8) == 0) {
      goto LABEL_31;
    }
    goto LABEL_24;
  }
LABEL_20:
  v14 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 120)];
  if (a2) {
    v15 = @"isCarplayRequest";
  }
  else {
    v15 = @"is_carplay_request";
  }
  [v4 setObject:v14 forKey:v15];

  if ((*(_WORD *)(a1 + 124) & 8) != 0)
  {
LABEL_24:
    uint64_t v16 = *(int *)(a1 + 116);
    if (v16 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 116));
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = off_1E53DCEF8[v16];
    }
    if (a2) {
      v18 = @"suggestionType";
    }
    else {
      v18 = @"suggestion_type";
    }
    [v4 setObject:v17 forKey:v18];
  }
LABEL_31:
  if (*(void *)(a1 + 32))
  {
    v19 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    v20 = (void *)(a1 + 24);
    if (*(void *)(a1 + 32))
    {
      unint64_t v21 = 0;
      do
      {
        uint64_t v22 = *(int *)(*v20 + 4 * v21);
        if (v22 >= 5)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v22);
          v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v23 = off_1E53DCF10[v22];
        }
        [v19 addObject:v23];

        ++v21;
        v20 = (void *)(a1 + 24);
      }
      while (v21 < *(void *)(a1 + 32));
    }
    if (a2) {
      v24 = @"engineType";
    }
    else {
      v24 = @"engine_type";
    }
    [v4 setObject:v19 forKey:v24];
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
  if ((*(_WORD *)(a1 + 124) & 0x2000) == 0)
  {
    v25 = *(void **)(a1 + 8);
    if (v25)
    {
      id v26 = v25;
      objc_sync_enter(v26);
      GEOPDSearchBrowseCategorySuggestionParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readVenueFilter_tags);
      objc_sync_exit(v26);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  id v27 = *(id *)(a1 + 80);
  v28 = v27;
  if (v27)
  {
    if (a2)
    {
      v29 = [v27 jsonRepresentation];
      v30 = @"venueFilter";
    }
    else
    {
      v29 = [v27 dictionaryRepresentation];
      v30 = @"venue_filter";
    }
    [v4 setObject:v29 forKey:v30];
  }
  __int16 v31 = *(_WORD *)(a1 + 124);
  if ((v31 & 0x40) != 0)
  {
    v40 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 122)];
    if (a2) {
      v41 = @"isFromNoQueryState";
    }
    else {
      v41 = @"is_from_no_query_state";
    }
    [v4 setObject:v40 forKey:v41];

    __int16 v31 = *(_WORD *)(a1 + 124);
    if ((v31 & 0x20) == 0)
    {
LABEL_52:
      if ((v31 & 4) == 0) {
        goto LABEL_53;
      }
LABEL_72:
      uint64_t v44 = *(int *)(a1 + 112);
      if (v44 >= 6)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 112));
        v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v45 = off_1E53DD198[v44];
      }
      if (a2) {
        v59 = @"preferredTransportType";
      }
      else {
        v59 = @"preferred_transport_type";
      }
      [v4 setObject:v45 forKey:v59];

      if ((*(_WORD *)(a1 + 124) & 0x80) == 0) {
        goto LABEL_58;
      }
      goto LABEL_54;
    }
  }
  else if ((v31 & 0x20) == 0)
  {
    goto LABEL_52;
  }
  v42 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 121)];
  if (a2) {
    v43 = @"isFlatCategoryListRequest";
  }
  else {
    v43 = @"is_flat_category_list_request";
  }
  [v4 setObject:v42 forKey:v43];

  __int16 v31 = *(_WORD *)(a1 + 124);
  if ((v31 & 4) != 0) {
    goto LABEL_72;
  }
LABEL_53:
  if ((v31 & 0x80) != 0)
  {
LABEL_54:
    v32 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 123)];
    if (a2) {
      v33 = @"isWidgetRequest";
    }
    else {
      v33 = @"is_widget_request";
    }
    [v4 setObject:v32 forKey:v33];
  }
LABEL_58:
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
  if ((*(_WORD *)(a1 + 124) & 0x400) == 0)
  {
    v34 = *(void **)(a1 + 8);
    if (v34)
    {
      id v35 = v34;
      objc_sync_enter(v35);
      GEOPDSearchBrowseCategorySuggestionParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEvChargingParameters_tags_6610);
      objc_sync_exit(v35);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  id v36 = *(id *)(a1 + 48);
  v37 = v36;
  if (v36)
  {
    if (a2)
    {
      v38 = [v36 jsonRepresentation];
      v39 = @"evChargingParameters";
    }
    else
    {
      v38 = [v36 dictionaryRepresentation];
      v39 = @"ev_charging_parameters";
    }
    [v4 setObject:v38 forKey:v39];
  }
  -[GEOPDSearchBrowseCategorySuggestionParameters _readSearchOriginationInfo](a1);
  id v46 = *(id *)(a1 + 72);
  v47 = v46;
  if (v46)
  {
    if (a2)
    {
      v48 = [v46 jsonRepresentation];
      v49 = @"searchOriginationInfo";
    }
    else
    {
      v48 = [v46 dictionaryRepresentation];
      v49 = @"search_origination_info";
    }
    [v4 setObject:v48 forKey:v49];
  }
  if (*(void *)(a1 + 56))
  {
    -[GEOPDSearchBrowseCategorySuggestionParameters _readInputCategorys](a1);
    id v50 = *(id *)(a1 + 56);
    if (a2) {
      v51 = @"inputCategory";
    }
    else {
      v51 = @"input_category";
    }
    [v4 setObject:v50 forKey:v51];
  }
  v52 = *(void **)(a1 + 16);
  if (v52)
  {
    v53 = [v52 dictionaryRepresentation];
    v54 = v53;
    if (a2)
    {
      v55 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v53, "count"));
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __75__GEOPDSearchBrowseCategorySuggestionParameters__dictionaryRepresentation___block_invoke;
      v60[3] = &unk_1E53D8860;
      id v56 = v55;
      id v61 = v56;
      [v54 enumerateKeysAndObjectsUsingBlock:v60];
      id v57 = v56;

      v54 = v57;
    }
    [v4 setObject:v54 forKey:@"Unknown Fields"];
  }
LABEL_90:

  return v4;
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPDSearchBrowseCategorySuggestionParameters _readSearchOriginationInfo](result);
    if (-[GEOPDSearchOriginationInfo hasGreenTeaWithValue:](*(void *)(v3 + 72), a2))
    {
      return 1;
    }
    else
    {
      -[GEOPDSearchBrowseCategorySuggestionParameters _readViewportInfo](v3);
      v4 = *(void **)(v3 + 88);
      return [v4 hasGreenTeaWithValue:a2];
    }
  }
  return result;
}

- (void)mergeFrom:(uint64_t)a1
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  -[GEOPDSearchBrowseCategorySuggestionParameters readAll:]((uint64_t)v3, 0);
  v4 = *(void **)(a1 + 88);
  uint64_t v5 = *((void *)v3 + 11);
  if (v4)
  {
    if (v5) {
      objc_msgSend(v4, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEOPDSearchBrowseCategorySuggestionParameters setViewportInfo:](a1, *((void **)v3 + 11));
  }
  __int16 v6 = *((_WORD *)v3 + 62);
  if (v6)
  {
    *(void *)(a1 + 64) = *((void *)v3 + 8);
    *(_WORD *)(a1 + 124) |= 1u;
    __int16 v6 = *((_WORD *)v3 + 62);
    if ((v6 & 2) == 0)
    {
LABEL_8:
      if ((v6 & 0x10) == 0) {
        goto LABEL_9;
      }
      goto LABEL_21;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_8;
  }
  *(_DWORD *)(a1 + 108) = *((_DWORD *)v3 + 27);
  *(_WORD *)(a1 + 124) |= 2u;
  __int16 v6 = *((_WORD *)v3 + 62);
  if ((v6 & 0x10) == 0)
  {
LABEL_9:
    if ((v6 & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_21:
  *(unsigned char *)(a1 + 120) = *((unsigned char *)v3 + 120);
  *(_WORD *)(a1 + 124) |= 0x10u;
  if ((*((_WORD *)v3 + 62) & 8) != 0)
  {
LABEL_10:
    *(_DWORD *)(a1 + 116) = *((_DWORD *)v3 + 29);
    *(_WORD *)(a1 + 124) |= 8u;
  }
LABEL_11:
  -[GEOPDSearchBrowseCategorySuggestionParameters _readEngineTypes]((uint64_t)v3);
  uint64_t v7 = *((void *)v3 + 4);
  if (v7)
  {
    unint64_t v8 = 0;
    uint64_t v9 = *MEMORY[0x1E4F1C4A8];
    do
    {
      -[GEOPDSearchBrowseCategorySuggestionParameters _readEngineTypes]((uint64_t)v3);
      unint64_t v10 = *((void *)v3 + 4);
      if (v10 <= v8)
      {
        v11 = (void *)MEMORY[0x1E4F1CA00];
        v12 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", v8, v10);
        v13 = [v11 exceptionWithName:v9 reason:v12 userInfo:0];
        [v13 raise];
      }
      -[GEOPDSearchBrowseCategorySuggestionParameters addEngineType:](a1);
      ++v8;
    }
    while (v7 != v8);
  }
  uint64_t v14 = *(void *)(a1 + 80);
  v15 = (void *)*((void *)v3 + 10);
  if (v14)
  {
    if (v15) {
      -[GEOPDVenueIdentifier mergeFrom:](v14, v15);
    }
  }
  else if (v15)
  {
    -[GEOPDSearchBrowseCategorySuggestionParameters setVenueFilter:](a1, v15);
  }
  __int16 v16 = *((_WORD *)v3 + 62);
  if ((v16 & 0x40) != 0)
  {
    *(unsigned char *)(a1 + 122) = *((unsigned char *)v3 + 122);
    *(_WORD *)(a1 + 124) |= 0x40u;
    __int16 v16 = *((_WORD *)v3 + 62);
    if ((v16 & 0x20) == 0)
    {
LABEL_27:
      if ((v16 & 4) == 0) {
        goto LABEL_28;
      }
      goto LABEL_35;
    }
  }
  else if ((v16 & 0x20) == 0)
  {
    goto LABEL_27;
  }
  *(unsigned char *)(a1 + 121) = *((unsigned char *)v3 + 121);
  *(_WORD *)(a1 + 124) |= 0x20u;
  __int16 v16 = *((_WORD *)v3 + 62);
  if ((v16 & 4) == 0)
  {
LABEL_28:
    if ((v16 & 0x80) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_35:
  *(_DWORD *)(a1 + 112) = *((_DWORD *)v3 + 28);
  *(_WORD *)(a1 + 124) |= 4u;
  if ((*((_WORD *)v3 + 62) & 0x80) != 0)
  {
LABEL_29:
    *(unsigned char *)(a1 + 123) = *((unsigned char *)v3 + 123);
    *(_WORD *)(a1 + 124) |= 0x80u;
  }
LABEL_30:
  uint64_t v17 = *(void *)(a1 + 48);
  v18 = (void *)*((void *)v3 + 6);
  if (v17)
  {
    if (v18) {
      -[GEOPDSSearchEvChargingParameters mergeFrom:](v17, v18);
    }
  }
  else if (v18)
  {
    -[GEOPDSearchBrowseCategorySuggestionParameters setEvChargingParameters:](a1, v18);
  }
  uint64_t v19 = *(void *)(a1 + 72);
  v20 = (void *)*((void *)v3 + 9);
  if (v19)
  {
    if (v20) {
      -[GEOPDSearchOriginationInfo mergeFrom:](v19, v20);
    }
  }
  else if (v20)
  {
    -[GEOPDSearchBrowseCategorySuggestionParameters setSearchOriginationInfo:](a1, v20);
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v21 = *((id *)v3 + 7);
  uint64_t v22 = [v21 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v27 != v24) {
          objc_enumerationMutation(v21);
        }
        -[GEOPDSearchBrowseCategorySuggestionParameters addInputCategory:](a1, *(void **)(*((void *)&v26 + 1) + 8 * i));
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v23);
  }
}

- (void)clearUnknownFields:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 124) |= 0x100u;
    *(_WORD *)(a1 + 124) |= 0x8000u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
    v2 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    -[GEOPDSearchBrowseCategorySuggestionParameters readAll:](a1, 0);
    [*(id *)(a1 + 88) clearUnknownFields:1];
    -[GEOPDVenueIdentifier clearUnknownFields:](*(void *)(a1 + 80), 1);
    -[GEOPDSSearchEvChargingParameters clearUnknownFields:](*(void *)(a1 + 48), 1);
    uint64_t v3 = *(void *)(a1 + 72);
    -[GEOPDSearchOriginationInfo clearUnknownFields:](v3, 1);
  }
}

- (GEOPDSearchBrowseCategorySuggestionParameters)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchBrowseCategorySuggestionParameters;
  uint64_t v3 = [(GEOPDSearchBrowseCategorySuggestionParameters *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDSearchBrowseCategorySuggestionParameters;
  [(GEOPDSearchBrowseCategorySuggestionParameters *)&v3 dealloc];
}

- (void)_readViewportInfo
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
  if ((*(_WORD *)(a1 + 124) & 0x4000) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDSearchBrowseCategorySuggestionParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readViewportInfo_tags_6609);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
}

- (void)setViewportInfo:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 124) |= 0x4000u;
    *(_WORD *)(a1 + 124) |= 0x8000u;
    objc_storeStrong((id *)(a1 + 88), a2);
  }
}

- (void)_readEngineTypes
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
  if ((*(_WORD *)(a1 + 124) & 0x200) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDSearchBrowseCategorySuggestionParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEngineTypes_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
}

- (void)addEngineType:(uint64_t)a1
{
  *(_WORD *)(a1 + 124) |= 0x200u;
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  *(_WORD *)(a1 + 124) |= 0x8000u;
}

- (uint64_t)setEngineTypes:(uint64_t)a3 count:
{
  if (result)
  {
    uint64_t v5 = result;
    os_unfair_lock_lock_with_options();
    *(_WORD *)(v5 + 124) |= 0x200u;
    os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 104));
    *(_WORD *)(v5 + 124) |= 0x8000u;
    return MEMORY[0x1F4147390](v5 + 24, a2, a3);
  }
  return result;
}

- (void)setVenueFilter:(uint64_t)a1
{
  id v4 = a2;
  *(_WORD *)(a1 + 124) |= 0x2000u;
  *(_WORD *)(a1 + 124) |= 0x8000u;
  objc_storeStrong((id *)(a1 + 80), a2);
}

- (void)setEvChargingParameters:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 124) |= 0x400u;
    *(_WORD *)(a1 + 124) |= 0x8000u;
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

- (void)_readSearchOriginationInfo
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
  if ((*(_WORD *)(a1 + 124) & 0x1000) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDSearchBrowseCategorySuggestionParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchOriginationInfo_tags_6611);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
}

- (void)setSearchOriginationInfo:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 124) |= 0x1000u;
    *(_WORD *)(a1 + 124) |= 0x8000u;
    objc_storeStrong((id *)(a1 + 72), a2);
  }
}

- (void)_readInputCategorys
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
  if ((*(_WORD *)(a1 + 124) & 0x800) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDSearchBrowseCategorySuggestionParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readInputCategorys_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
}

- (void)addInputCategory:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDSearchBrowseCategorySuggestionParameters _readInputCategorys](a1);
    -[GEOPDSearchBrowseCategorySuggestionParameters _addNoFlagsInputCategory:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 124) |= 0x800u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
    *(_WORD *)(a1 + 124) |= 0x8000u;
  }
}

- (void)_addNoFlagsInputCategory:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 56);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      __int16 v6 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v5;

      id v4 = *(void **)(a1 + 56);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchBrowseCategorySuggestionParameters;
  id v4 = [(GEOPDSearchBrowseCategorySuggestionParameters *)&v8 description];
  id v5 = [(GEOPDSearchBrowseCategorySuggestionParameters *)self dictionaryRepresentation];
  __int16 v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchBrowseCategorySuggestionParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchBrowseCategorySuggestionParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __75__GEOPDSearchBrowseCategorySuggestionParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = [a1 init];
  if (!v6) {
    goto LABEL_135;
  }
  if (a3) {
    id v7 = @"viewportInfo";
  }
  else {
    id v7 = @"viewport_info";
  }
  objc_super v8 = [v5 objectForKeyedSubscript:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [GEOPDViewportInfo alloc];
    if (a3) {
      id v10 = [(GEOPDViewportInfo *)v9 initWithJSON:v8];
    }
    else {
      id v10 = [(GEOPDViewportInfo *)v9 initWithDictionary:v8];
    }
    v11 = v10;
    -[GEOPDSearchBrowseCategorySuggestionParameters setViewportInfo:](v6, v10);
  }
  if (a3) {
    v12 = @"requestLocalTimestamp";
  }
  else {
    v12 = @"request_local_timestamp";
  }
  v13 = [v5 objectForKeyedSubscript:v12];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v13 doubleValue];
    *(_WORD *)(v6 + 124) |= 0x8000u;
    *(_WORD *)(v6 + 124) |= 1u;
    *(void *)(v6 + 64) = v14;
  }

  if (a3) {
    v15 = @"minimumNumberOfCategories";
  }
  else {
    v15 = @"minimum_number_of_categories";
  }
  __int16 v16 = [v5 objectForKeyedSubscript:v15];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v17 = [v16 intValue];
    *(_WORD *)(v6 + 124) |= 0x8000u;
    *(_WORD *)(v6 + 124) |= 2u;
    *(_DWORD *)(v6 + 108) = v17;
  }

  if (a3) {
    v18 = @"isCarplayRequest";
  }
  else {
    v18 = @"is_carplay_request";
  }
  uint64_t v19 = [v5 objectForKeyedSubscript:v18];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v20 = [v19 BOOLValue];
    *(_WORD *)(v6 + 124) |= 0x8000u;
    *(_WORD *)(v6 + 124) |= 0x10u;
    *(unsigned char *)(v6 + 120) = v20;
  }

  if (a3) {
    id v21 = @"suggestionType";
  }
  else {
    id v21 = @"suggestion_type";
  }
  uint64_t v22 = [v5 objectForKeyedSubscript:v21];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v23 = v22;
    if ([v23 isEqualToString:@"SEARCH_BROWSE_CATEGORY_SUGGESTION_TYPE_UNKNOWN"])
    {
      int v24 = 0;
    }
    else if ([v23 isEqualToString:@"SEARCH_BROWSE_CATEGORY_SUGGESTION_TYPE_DEFAULT"])
    {
      int v24 = 1;
    }
    else if ([v23 isEqualToString:@"SEARCH_BROWSE_CATEGORY_SUGGESTION_TYPE_NAV"])
    {
      int v24 = 2;
    }
    else
    {
      int v24 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_40;
    }
    int v24 = [v22 intValue];
  }
  *(_WORD *)(v6 + 124) |= 0x8000u;
  *(_WORD *)(v6 + 124) |= 8u;
  *(_DWORD *)(v6 + 116) = v24;
LABEL_40:

  if (a3) {
    v25 = @"engineType";
  }
  else {
    v25 = @"engine_type";
  }
  long long v26 = [v5 objectForKeyedSubscript:v25];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v70 = v5;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    v69 = v26;
    id v27 = v26;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v75 objects:v80 count:16];
    if (!v28) {
      goto LABEL_62;
    }
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v76;
    while (1)
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v76 != v30) {
          objc_enumerationMutation(v27);
        }
        v32 = *(void **)(*((void *)&v75 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v33 = v32;
          if (([v33 isEqualToString:@"CAR_ENGINE_TYPE_UNKNOWN"] & 1) == 0
            && ([v33 isEqualToString:@"CAR_ENGINE_TYPE_GASOLINE"] & 1) == 0
            && ([v33 isEqualToString:@"CAR_ENGINE_TYPE_DIESEL"] & 1) == 0
            && ([v33 isEqualToString:@"CAR_ENGINE_TYPE_ELECTRIC"] & 1) == 0)
          {
            [v33 isEqualToString:@"CAR_ENGINE_TYPE_CNG"];
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          [v32 intValue];
        }
        -[GEOPDSearchBrowseCategorySuggestionParameters addEngineType:](v6);
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v75 objects:v80 count:16];
      if (!v29)
      {
LABEL_62:

        id v5 = v70;
        long long v26 = v69;
        break;
      }
    }
  }

  if (a3) {
    v34 = @"venueFilter";
  }
  else {
    v34 = @"venue_filter";
  }
  id v35 = [v5 objectForKeyedSubscript:v34];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v36 = [GEOPDVenueIdentifier alloc];
    if (v36) {
      v37 = (void *)-[GEOPDVenueIdentifier _initWithDictionary:isJSON:]((uint64_t)v36, v35, a3);
    }
    else {
      v37 = 0;
    }
    -[GEOPDSearchBrowseCategorySuggestionParameters setVenueFilter:](v6, v37);
  }
  if (a3) {
    v38 = @"isFromNoQueryState";
  }
  else {
    v38 = @"is_from_no_query_state";
  }
  v39 = [v5 objectForKeyedSubscript:v38];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v40 = [v39 BOOLValue];
    *(_WORD *)(v6 + 124) |= 0x8000u;
    *(_WORD *)(v6 + 124) |= 0x40u;
    *(unsigned char *)(v6 + 122) = v40;
  }

  if (a3) {
    v41 = @"isFlatCategoryListRequest";
  }
  else {
    v41 = @"is_flat_category_list_request";
  }
  v42 = [v5 objectForKeyedSubscript:v41];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v43 = [v42 BOOLValue];
    *(_WORD *)(v6 + 124) |= 0x8000u;
    *(_WORD *)(v6 + 124) |= 0x20u;
    *(unsigned char *)(v6 + 121) = v43;
  }

  if (a3) {
    uint64_t v44 = @"preferredTransportType";
  }
  else {
    uint64_t v44 = @"preferred_transport_type";
  }
  v45 = [v5 objectForKeyedSubscript:v44];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v46 = v45;
    if ([v46 isEqualToString:@"PREFERRED_TRANSPORT_TYPE_NONE"])
    {
      int v47 = 0;
    }
    else if ([v46 isEqualToString:@"PREFERRED_TRANSPORT_TYPE_DRIVING"])
    {
      int v47 = 1;
    }
    else if ([v46 isEqualToString:@"PREFERRED_TRANSPORT_TYPE_WALKING"])
    {
      int v47 = 2;
    }
    else if ([v46 isEqualToString:@"PREFERRED_TRANSPORT_TYPE_TRANSIT"])
    {
      int v47 = 3;
    }
    else if ([v46 isEqualToString:@"PREFERRED_TRANSPORT_TYPE_RIDESHARE"])
    {
      int v47 = 4;
    }
    else if ([v46 isEqualToString:@"PREFERRED_TRANSPORT_TYPE_CYCLING"])
    {
      int v47 = 5;
    }
    else
    {
      int v47 = 0;
    }

    goto LABEL_100;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v47 = [v45 intValue];
LABEL_100:
    *(_WORD *)(v6 + 124) |= 0x8000u;
    *(_WORD *)(v6 + 124) |= 4u;
    *(_DWORD *)(v6 + 112) = v47;
  }

  if (a3) {
    v48 = @"isWidgetRequest";
  }
  else {
    v48 = @"is_widget_request";
  }
  v49 = [v5 objectForKeyedSubscript:v48];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v50 = [v49 BOOLValue];
    *(_WORD *)(v6 + 124) |= 0x8000u;
    *(_WORD *)(v6 + 124) |= 0x80u;
    *(unsigned char *)(v6 + 123) = v50;
  }

  if (a3) {
    v51 = @"evChargingParameters";
  }
  else {
    v51 = @"ev_charging_parameters";
  }
  v52 = [v5 objectForKeyedSubscript:v51];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v53 = [GEOPDSSearchEvChargingParameters alloc];
    if (v53) {
      v54 = -[GEOPDSSearchEvChargingParameters _initWithDictionary:isJSON:](v53, v52, a3);
    }
    else {
      v54 = 0;
    }
    -[GEOPDSearchBrowseCategorySuggestionParameters setEvChargingParameters:](v6, v54);
  }
  if (a3) {
    v55 = @"searchOriginationInfo";
  }
  else {
    v55 = @"search_origination_info";
  }
  id v56 = [v5 objectForKeyedSubscript:v55];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v57 = [GEOPDSearchOriginationInfo alloc];
    if (v57) {
      v58 = (void *)-[GEOPDSearchOriginationInfo _initWithDictionary:isJSON:]((uint64_t)v57, v56, a3);
    }
    else {
      v58 = 0;
    }
    -[GEOPDSearchBrowseCategorySuggestionParameters setSearchOriginationInfo:](v6, v58);
  }
  if (a3) {
    v59 = @"inputCategory";
  }
  else {
    v59 = @"input_category";
  }
  v60 = [v5 objectForKeyedSubscript:v59];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v61 = v60;
    uint64_t v62 = [v61 countByEnumeratingWithState:&v71 objects:v79 count:16];
    if (v62)
    {
      uint64_t v63 = v62;
      uint64_t v64 = *(void *)v72;
      do
      {
        for (uint64_t j = 0; j != v63; ++j)
        {
          if (*(void *)v72 != v64) {
            objc_enumerationMutation(v61);
          }
          v66 = *(void **)(*((void *)&v71 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v67 = (void *)[v66 copy];
            -[GEOPDSearchBrowseCategorySuggestionParameters addInputCategory:](v6, v67);
          }
        }
        uint64_t v63 = [v61 countByEnumeratingWithState:&v71 objects:v79 count:16];
      }
      while (v63);
    }
  }
LABEL_135:

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchBrowseCategorySuggestionParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDSearchBrowseCategorySuggestionParametersIsDirty((uint64_t)self) & 1) == 0)
  {
    v13 = self->_reader;
    objc_sync_enter(v13);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v14 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v14];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v13);
    goto LABEL_41;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchBrowseCategorySuggestionParameters readAll:]((uint64_t)self, 0);
  if (self->_viewportInfo) {
    PBDataWriterWriteSubmessage();
  }
  __int16 flags = (__int16)self->_flags;
  if (flags)
  {
    PBDataWriterWriteDoubleField();
    __int16 flags = (__int16)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_7:
      if ((flags & 0x10) == 0) {
        goto LABEL_8;
      }
      goto LABEL_34;
    }
  }
  else if ((flags & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_8:
    if ((flags & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_34:
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_flags & 8) != 0) {
LABEL_9:
  }
    PBDataWriterWriteInt32Field();
LABEL_10:
  if (self->_engineTypes.count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v7;
    }
    while (v7 < self->_engineTypes.count);
  }
  if (self->_venueFilter) {
    PBDataWriterWriteSubmessage();
  }
  __int16 v8 = (__int16)self->_flags;
  if ((v8 & 0x40) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 v8 = (__int16)self->_flags;
    if ((v8 & 0x20) == 0)
    {
LABEL_17:
      if ((v8 & 4) == 0) {
        goto LABEL_18;
      }
LABEL_38:
      PBDataWriterWriteInt32Field();
      if ((*(_WORD *)&self->_flags & 0x80) == 0) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
  }
  else if ((v8 & 0x20) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteBOOLField();
  __int16 v8 = (__int16)self->_flags;
  if ((v8 & 4) != 0) {
    goto LABEL_38;
  }
LABEL_18:
  if ((v8 & 0x80) != 0) {
LABEL_19:
  }
    PBDataWriterWriteBOOLField();
LABEL_20:
  if (self->_evChargingParameters) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_searchOriginationInfo) {
    PBDataWriterWriteSubmessage();
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v9 = self->_inputCategorys;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v9);
        }
        PBDataWriterWriteStringField();
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v15);
LABEL_41:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDSearchBrowseCategorySuggestionParametersReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_23;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchBrowseCategorySuggestionParameters readAll:]((uint64_t)self, 0);
  id v9 = [(GEOPDViewportInfo *)self->_viewportInfo copyWithZone:a3];
  uint64_t v10 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v9;

  __int16 flags = (__int16)self->_flags;
  if (flags)
  {
    *(double *)(v5 + 64) = self->_requestLocalTimestamp;
    *(_WORD *)(v5 + 124) |= 1u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_7:
      if ((flags & 0x10) == 0) {
        goto LABEL_8;
      }
      goto LABEL_26;
    }
  }
  else if ((flags & 2) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v5 + 108) = self->_minimumNumberOfCategories;
  *(_WORD *)(v5 + 124) |= 2u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_8:
    if ((flags & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_26:
  *(unsigned char *)(v5 + 120) = self->_isCarplayRequest;
  *(_WORD *)(v5 + 124) |= 0x10u;
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
LABEL_9:
    *(_DWORD *)(v5 + 116) = self->_suggestionType;
    *(_WORD *)(v5 + 124) |= 8u;
  }
LABEL_10:
  PBRepeatedInt32Copy();
  id v12 = [(GEOPDVenueIdentifier *)self->_venueFilter copyWithZone:a3];
  v13 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v12;

  __int16 v14 = (__int16)self->_flags;
  if ((v14 & 0x40) != 0)
  {
    *(unsigned char *)(v5 + 122) = self->_isFromNoQueryState;
    *(_WORD *)(v5 + 124) |= 0x40u;
    __int16 v14 = (__int16)self->_flags;
    if ((v14 & 0x20) == 0)
    {
LABEL_12:
      if ((v14 & 4) == 0) {
        goto LABEL_13;
      }
LABEL_30:
      *(_DWORD *)(v5 + 112) = self->_preferredTransportType;
      *(_WORD *)(v5 + 124) |= 4u;
      if ((*(_WORD *)&self->_flags & 0x80) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((v14 & 0x20) == 0)
  {
    goto LABEL_12;
  }
  *(unsigned char *)(v5 + 121) = self->_isFlatCategoryListRequest;
  *(_WORD *)(v5 + 124) |= 0x20u;
  __int16 v14 = (__int16)self->_flags;
  if ((v14 & 4) != 0) {
    goto LABEL_30;
  }
LABEL_13:
  if ((v14 & 0x80) != 0)
  {
LABEL_14:
    *(unsigned char *)(v5 + 123) = self->_isWidgetRequest;
    *(_WORD *)(v5 + 124) |= 0x80u;
  }
LABEL_15:
  id v15 = [(GEOPDSSearchEvChargingParameters *)self->_evChargingParameters copyWithZone:a3];
  long long v16 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v15;

  id v17 = [(GEOPDSearchOriginationInfo *)self->_searchOriginationInfo copyWithZone:a3];
  long long v18 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v17;

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v19 = self->_inputCategorys;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v19);
        }
        id v23 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * i), "copyWithZone:", a3, (void)v26);
        -[GEOPDSearchBrowseCategorySuggestionParameters addInputCategory:](v5, v23);
      }
      uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v20);
  }

  int v24 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v24;
LABEL_23:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_65;
  }
  -[GEOPDSearchBrowseCategorySuggestionParameters readAll:]((uint64_t)self, 1);
  -[GEOPDSearchBrowseCategorySuggestionParameters readAll:]((uint64_t)v4, 1);
  viewportInfo = self->_viewportInfo;
  if ((unint64_t)viewportInfo | *((void *)v4 + 11))
  {
    if (!-[GEOPDViewportInfo isEqual:](viewportInfo, "isEqual:")) {
      goto LABEL_65;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v7 = *((_WORD *)v4 + 62);
  if (flags)
  {
    if ((v7 & 1) == 0 || self->_requestLocalTimestamp != *((double *)v4 + 8)) {
      goto LABEL_65;
    }
  }
  else if (v7)
  {
    goto LABEL_65;
  }
  if ((flags & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_minimumNumberOfCategories != *((_DWORD *)v4 + 27)) {
      goto LABEL_65;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_65;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0) {
      goto LABEL_65;
    }
    if (self->_isCarplayRequest)
    {
      if (!*((unsigned char *)v4 + 120)) {
        goto LABEL_65;
      }
    }
    else if (*((unsigned char *)v4 + 120))
    {
      goto LABEL_65;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_65;
  }
  if ((flags & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_suggestionType != *((_DWORD *)v4 + 29)) {
      goto LABEL_65;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_65;
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_65;
  }
  venueFilter = self->_venueFilter;
  if ((unint64_t)venueFilter | *((void *)v4 + 10))
  {
    if (!-[GEOPDVenueIdentifier isEqual:](venueFilter, "isEqual:")) {
      goto LABEL_65;
    }
  }
  __int16 v9 = (__int16)self->_flags;
  __int16 v10 = *((_WORD *)v4 + 62);
  if ((v9 & 0x40) != 0)
  {
    if ((v10 & 0x40) == 0) {
      goto LABEL_65;
    }
    if (self->_isFromNoQueryState)
    {
      if (!*((unsigned char *)v4 + 122)) {
        goto LABEL_65;
      }
    }
    else if (*((unsigned char *)v4 + 122))
    {
      goto LABEL_65;
    }
  }
  else if ((v10 & 0x40) != 0)
  {
    goto LABEL_65;
  }
  if ((v9 & 0x20) != 0)
  {
    if ((v10 & 0x20) == 0) {
      goto LABEL_65;
    }
    if (self->_isFlatCategoryListRequest)
    {
      if (!*((unsigned char *)v4 + 121)) {
        goto LABEL_65;
      }
    }
    else if (*((unsigned char *)v4 + 121))
    {
      goto LABEL_65;
    }
  }
  else if ((v10 & 0x20) != 0)
  {
    goto LABEL_65;
  }
  if ((v9 & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_preferredTransportType != *((_DWORD *)v4 + 28)) {
      goto LABEL_65;
    }
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_65;
  }
  if ((v9 & 0x80) != 0)
  {
    if ((v10 & 0x80) != 0)
    {
      if (self->_isWidgetRequest)
      {
        if (!*((unsigned char *)v4 + 123)) {
          goto LABEL_65;
        }
        goto LABEL_59;
      }
      if (!*((unsigned char *)v4 + 123)) {
        goto LABEL_59;
      }
    }
LABEL_65:
    char v14 = 0;
    goto LABEL_66;
  }
  if ((v10 & 0x80) != 0) {
    goto LABEL_65;
  }
LABEL_59:
  evChargingParameters = self->_evChargingParameters;
  if ((unint64_t)evChargingParameters | *((void *)v4 + 6)
    && !-[GEOPDSSearchEvChargingParameters isEqual:](evChargingParameters, "isEqual:"))
  {
    goto LABEL_65;
  }
  searchOriginationInfo = self->_searchOriginationInfo;
  if ((unint64_t)searchOriginationInfo | *((void *)v4 + 9))
  {
    if (!-[GEOPDSearchOriginationInfo isEqual:](searchOriginationInfo, "isEqual:")) {
      goto LABEL_65;
    }
  }
  inputCategorys = self->_inputCategorys;
  if ((unint64_t)inputCategorys | *((void *)v4 + 7)) {
    char v14 = -[NSMutableArray isEqual:](inputCategorys, "isEqual:");
  }
  else {
    char v14 = 1;
  }
LABEL_66:

  return v14;
}

- (unint64_t)hash
{
  -[GEOPDSearchBrowseCategorySuggestionParameters readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOPDViewportInfo *)self->_viewportInfo hash];
  __int16 flags = (__int16)self->_flags;
  if (flags)
  {
    double requestLocalTimestamp = self->_requestLocalTimestamp;
    double v7 = -requestLocalTimestamp;
    if (requestLocalTimestamp >= 0.0) {
      double v7 = self->_requestLocalTimestamp;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  if ((flags & 2) == 0)
  {
    uint64_t v10 = 0;
    if ((flags & 0x10) != 0) {
      goto LABEL_11;
    }
LABEL_14:
    uint64_t v11 = 0;
    if ((flags & 8) != 0) {
      goto LABEL_12;
    }
    goto LABEL_15;
  }
  uint64_t v10 = 2654435761 * self->_minimumNumberOfCategories;
  if ((flags & 0x10) == 0) {
    goto LABEL_14;
  }
LABEL_11:
  uint64_t v11 = 2654435761 * self->_isCarplayRequest;
  if ((flags & 8) != 0)
  {
LABEL_12:
    uint64_t v12 = 2654435761 * self->_suggestionType;
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v12 = 0;
LABEL_16:
  uint64_t v13 = PBRepeatedInt32Hash();
  unint64_t v14 = [(GEOPDVenueIdentifier *)self->_venueFilter hash];
  __int16 v15 = (__int16)self->_flags;
  if ((v15 & 0x40) != 0)
  {
    uint64_t v16 = 2654435761 * self->_isFromNoQueryState;
    if ((v15 & 0x20) != 0)
    {
LABEL_18:
      uint64_t v17 = 2654435761 * self->_isFlatCategoryListRequest;
      if ((v15 & 4) != 0) {
        goto LABEL_19;
      }
LABEL_23:
      uint64_t v18 = 0;
      if ((v15 & 0x80) != 0) {
        goto LABEL_20;
      }
LABEL_24:
      uint64_t v19 = 0;
      goto LABEL_25;
    }
  }
  else
  {
    uint64_t v16 = 0;
    if ((v15 & 0x20) != 0) {
      goto LABEL_18;
    }
  }
  uint64_t v17 = 0;
  if ((v15 & 4) == 0) {
    goto LABEL_23;
  }
LABEL_19:
  uint64_t v18 = 2654435761 * self->_preferredTransportType;
  if ((v15 & 0x80) == 0) {
    goto LABEL_24;
  }
LABEL_20:
  uint64_t v19 = 2654435761 * self->_isWidgetRequest;
LABEL_25:
  unint64_t v20 = v5 ^ v3 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
  unint64_t v21 = v16 ^ v17 ^ v18 ^ v19 ^ [(GEOPDSSearchEvChargingParameters *)self->_evChargingParameters hash];
  unint64_t v22 = v20 ^ v21 ^ [(GEOPDSearchOriginationInfo *)self->_searchOriginationInfo hash];
  return v22 ^ [(NSMutableArray *)self->_inputCategorys hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewportInfo, 0);
  objc_storeStrong((id *)&self->_venueFilter, 0);
  objc_storeStrong((id *)&self->_searchOriginationInfo, 0);
  objc_storeStrong((id *)&self->_inputCategorys, 0);
  objc_storeStrong((id *)&self->_evChargingParameters, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end