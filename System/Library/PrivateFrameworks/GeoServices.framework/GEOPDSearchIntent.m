@interface GEOPDSearchIntent
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchIntent)init;
- (GEOPDSearchIntent)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_initWithDictionary:(unsigned int)a3 isJSON:;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)result;
- (unint64_t)hash;
- (void)_addNoFlagsLanguageCode:(uint64_t)a1;
- (void)_readBusinessIntent;
- (void)_readGeoIntent;
- (void)_readLanguageCodes;
- (void)_readLocationIntent;
- (void)_readSearchFilterIntent;
- (void)addLanguageCode:(os_unfair_lock_s *)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchIntent

- (GEOPDSearchIntent)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchIntent;
  v2 = [(GEOPDSearchIntent *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchIntent)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchIntent;
  v3 = [(GEOPDSearchIntent *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readBusinessIntent
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(unsigned char *)(a1 + 148) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBusinessIntent_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (void)_readGeoIntent
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(unsigned char *)(a1 + 149) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readGeoIntent_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (void)_readLocationIntent
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(unsigned char *)(a1 + 149) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocationIntent_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (void)_readSearchFilterIntent
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(unsigned char *)(a1 + 149) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchFilterIntent_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (void)_readLanguageCodes
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
  if ((*(unsigned char *)(a1 + 149) & 4) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDSearchIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLanguageCodes_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
}

- (void)addLanguageCode:(os_unfair_lock_s *)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDSearchIntent _readLanguageCodes]((uint64_t)a1);
    -[GEOPDSearchIntent _addNoFlagsLanguageCode:]((uint64_t)a1, v3);

    os_unfair_lock_lock_with_options();
    a1[37]._os_unfair_lock_opaque |= 0x400u;
    os_unfair_lock_unlock(a1 + 34);
    a1[37]._os_unfair_lock_opaque |= 0x10000u;
  }
}

- (void)_addNoFlagsLanguageCode:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 80);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 80);
      *(void *)(a1 + 80) = v5;

      v4 = *(void **)(a1 + 80);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchIntent;
  v4 = [(GEOPDSearchIntent *)&v8 description];
  id v5 = [(GEOPDSearchIntent *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchIntent _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDSearchIntent readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ((*(unsigned char *)(a1 + 148) & 2) != 0)
    {
      uint64_t v5 = *(int *)(a1 + 144);
      if (v5 >= 0xE)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 144));
        objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v6 = off_1E53E2A28[v5];
      }
      if (a2) {
        id v7 = @"intentType";
      }
      else {
        id v7 = @"intent_type";
      }
      [v4 setObject:v6 forKey:v7];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(unsigned char *)(a1 + 148) & 0x10) == 0)
    {
      objc_super v8 = *(void **)(a1 + 8);
      if (v8)
      {
        id v9 = v8;
        objc_sync_enter(v9);
        GEOPDSearchIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCategoryIntent_tags);
        objc_sync_exit(v9);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
    id v10 = *(id *)(a1 + 32);
    v11 = v10;
    if (v10)
    {
      if (a2)
      {
        v12 = [v10 jsonRepresentation];
        v13 = @"categoryIntent";
      }
      else
      {
        v12 = [v10 dictionaryRepresentation];
        v13 = @"category_intent";
      }
      [v4 setObject:v12 forKey:v13];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(unsigned char *)(a1 + 148) & 0x20) == 0)
    {
      v14 = *(void **)(a1 + 8);
      if (v14)
      {
        id v15 = v14;
        objc_sync_enter(v15);
        GEOPDSearchIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readChainIntent_tags);
        objc_sync_exit(v15);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
    id v16 = *(id *)(a1 + 40);
    v17 = v16;
    if (v16)
    {
      if (a2)
      {
        v18 = [v16 jsonRepresentation];
        v19 = @"chainIntent";
      }
      else
      {
        v18 = [v16 dictionaryRepresentation];
        v19 = @"chain_intent";
      }
      [v4 setObject:v18 forKey:v19];
    }
    -[GEOPDSearchIntent _readBusinessIntent](a1);
    id v20 = *(id *)(a1 + 24);
    v21 = v20;
    if (v20)
    {
      if (a2)
      {
        v22 = [v20 jsonRepresentation];
        v23 = @"businessIntent";
      }
      else
      {
        v22 = [v20 dictionaryRepresentation];
        v23 = @"business_intent";
      }
      [v4 setObject:v22 forKey:v23];
    }
    -[GEOPDSearchIntent _readGeoIntent](a1);
    id v24 = *(id *)(a1 + 64);
    v25 = v24;
    if (v24)
    {
      if (a2)
      {
        v26 = [v24 jsonRepresentation];
        v27 = @"geoIntent";
      }
      else
      {
        v26 = [v24 dictionaryRepresentation];
        v27 = @"geo_intent";
      }
      [v4 setObject:v26 forKey:v27];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(unsigned char *)(a1 + 149) & 0x20) == 0)
    {
      v28 = *(void **)(a1 + 8);
      if (v28)
      {
        id v29 = v28;
        objc_sync_enter(v29);
        GEOPDSearchIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readProximityIntent_tags);
        objc_sync_exit(v29);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
    id v30 = *(id *)(a1 + 104);
    v31 = v30;
    if (v30)
    {
      if (a2)
      {
        v32 = [v30 jsonRepresentation];
        v33 = @"proximityIntent";
      }
      else
      {
        v32 = [v30 dictionaryRepresentation];
        v33 = @"proximity_intent";
      }
      [v4 setObject:v32 forKey:v33];
    }
    -[GEOPDSearchIntent _readLocationIntent](a1);
    id v34 = *(id *)(a1 + 88);
    v35 = v34;
    if (v34)
    {
      if (a2)
      {
        v36 = [v34 jsonRepresentation];
        v37 = @"locationIntent";
      }
      else
      {
        v36 = [v34 dictionaryRepresentation];
        v37 = @"location_intent";
      }
      [v4 setObject:v36 forKey:v37];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(unsigned char *)(a1 + 148) & 4) == 0)
    {
      v38 = *(void **)(a1 + 8);
      if (v38)
      {
        id v39 = v38;
        objc_sync_enter(v39);
        GEOPDSearchIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAttributeIntent_tags);
        objc_sync_exit(v39);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
    id v40 = *(id *)(a1 + 16);
    v41 = v40;
    if (v40)
    {
      if (a2)
      {
        v42 = [v40 jsonRepresentation];
        v43 = @"attributeIntent";
      }
      else
      {
        v42 = [v40 dictionaryRepresentation];
        v43 = @"attribute_intent";
      }
      [v4 setObject:v42 forKey:v43];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(unsigned char *)(a1 + 148) & 0x40) == 0)
    {
      v44 = *(void **)(a1 + 8);
      if (v44)
      {
        id v45 = v44;
        objc_sync_enter(v45);
        GEOPDSearchIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readClientResolvedIntent_tags);
        objc_sync_exit(v45);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
    id v46 = *(id *)(a1 + 48);
    v47 = v46;
    if (v46)
    {
      if (a2)
      {
        v48 = [v46 jsonRepresentation];
        v49 = @"clientResolvedIntent";
      }
      else
      {
        v48 = [v46 dictionaryRepresentation];
        v49 = @"client_resolved_intent";
      }
      [v4 setObject:v48 forKey:v49];
    }
    -[GEOPDSearchIntent _readSearchFilterIntent](a1);
    id v50 = *(id *)(a1 + 112);
    v51 = v50;
    if (v50)
    {
      if (a2)
      {
        v52 = [v50 jsonRepresentation];
        v53 = @"searchFilterIntent";
      }
      else
      {
        v52 = [v50 dictionaryRepresentation];
        v53 = @"search_filter_intent";
      }
      [v4 setObject:v52 forKey:v53];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(unsigned char *)(a1 + 148) & 0x80) == 0)
    {
      v54 = *(void **)(a1 + 8);
      if (v54)
      {
        id v55 = v54;
        objc_sync_enter(v55);
        GEOPDSearchIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDirectionIntent_tags_1);
        objc_sync_exit(v55);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
    id v56 = *(id *)(a1 + 56);
    v57 = v56;
    if (v56)
    {
      if (a2)
      {
        v58 = [v56 jsonRepresentation];
        v59 = @"directionIntent";
      }
      else
      {
        v58 = [v56 dictionaryRepresentation];
        v59 = @"direction_intent";
      }
      [v4 setObject:v58 forKey:v59];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(unsigned char *)(a1 + 149) & 0x80) == 0)
    {
      v60 = *(void **)(a1 + 8);
      if (v60)
      {
        id v61 = v60;
        objc_sync_enter(v61);
        GEOPDSearchIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransitIntent_tags);
        objc_sync_exit(v61);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
    id v62 = *(id *)(a1 + 120);
    v63 = v62;
    if (v62)
    {
      if (a2)
      {
        v64 = [v62 jsonRepresentation];
        v65 = @"transitIntent";
      }
      else
      {
        v64 = [v62 dictionaryRepresentation];
        v65 = @"transit_intent";
      }
      [v4 setObject:v64 forKey:v65];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(unsigned char *)(a1 + 149) & 0x10) == 0)
    {
      v66 = *(void **)(a1 + 8);
      if (v66)
      {
        id v67 = v66;
        objc_sync_enter(v67);
        GEOPDSearchIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPhoneNumberIntent_tags);
        objc_sync_exit(v67);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
    id v68 = *(id *)(a1 + 96);
    v69 = v68;
    if (v68)
    {
      if (a2)
      {
        v70 = [v68 jsonRepresentation];
        v71 = @"phoneNumberIntent";
      }
      else
      {
        v70 = [v68 dictionaryRepresentation];
        v71 = @"phone_number_intent";
      }
      [v4 setObject:v70 forKey:v71];
    }
    if (*(unsigned char *)(a1 + 148))
    {
      v72 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 140)];
      if (a2) {
        v73 = @"intentSpanIndex";
      }
      else {
        v73 = @"intent_span_index";
      }
      [v4 setObject:v72 forKey:v73];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(unsigned char *)(a1 + 149) & 2) == 0)
    {
      v74 = *(void **)(a1 + 8);
      if (v74)
      {
        id v75 = v74;
        objc_sync_enter(v75);
        GEOPDSearchIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readKeywordIntent_tags);
        objc_sync_exit(v75);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
    id v76 = *(id *)(a1 + 72);
    v77 = v76;
    if (v76)
    {
      if (a2)
      {
        v78 = [v76 jsonRepresentation];
        v79 = @"keywordIntent";
      }
      else
      {
        v78 = [v76 dictionaryRepresentation];
        v79 = @"keyword_intent";
      }
      [v4 setObject:v78 forKey:v79];
    }
    if (*(void *)(a1 + 80))
    {
      -[GEOPDSearchIntent _readLanguageCodes](a1);
      id v80 = *(id *)(a1 + 80);
      if (a2) {
        v81 = @"languageCode";
      }
      else {
        v81 = @"language_code";
      }
      [v4 setObject:v80 forKey:v81];
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
  return -[GEOPDSearchIntent _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_993;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_994;
      }
      GEOPDSearchIntentReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDSearchIntentCallReadAllRecursiveWithoutSynchronized((uint64_t *)a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (id)_initWithDictionary:(unsigned int)a3 isJSON:
{
  uint64_t v590 = *MEMORY[0x1E4F143B8];
  id v502 = a2;
  id v4 = (id)[a1 init];

  id v512 = v4;
  if (!v4) {
    goto LABEL_817;
  }
  if (a3) {
    id v5 = @"intentType";
  }
  else {
    id v5 = @"intent_type";
  }
  objc_super v6 = [v502 objectForKeyedSubscript:v5];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if ([v7 isEqualToString:@"INTENT_TYPE_UNKNOWN"])
    {
      int v8 = 0;
    }
    else if ([v7 isEqualToString:@"INTENT_TYPE_CATEGORY"])
    {
      int v8 = 1;
    }
    else if ([v7 isEqualToString:@"INTENT_TYPE_CHAIN"])
    {
      int v8 = 2;
    }
    else if ([v7 isEqualToString:@"INTENT_TYPE_BUSINESS"])
    {
      int v8 = 3;
    }
    else if ([v7 isEqualToString:@"INTENT_TYPE_GEO"])
    {
      int v8 = 4;
    }
    else if ([v7 isEqualToString:@"INTENT_TYPE_PROXIMITY"])
    {
      int v8 = 5;
    }
    else if ([v7 isEqualToString:@"INTENT_TYPE_LOCATION"])
    {
      int v8 = 6;
    }
    else if ([v7 isEqualToString:@"INTENT_TYPE_ATTRIBUTE"])
    {
      int v8 = 7;
    }
    else if ([v7 isEqualToString:@"INTENT_TYPE_CLIENT_RESOLVED"])
    {
      int v8 = 8;
    }
    else if ([v7 isEqualToString:@"INTENT_TYPE_SEARCH_FILTER"])
    {
      int v8 = 9;
    }
    else if ([v7 isEqualToString:@"INTENT_TYPE_DIRECTION_INTENT"])
    {
      int v8 = 10;
    }
    else if ([v7 isEqualToString:@"INTENT_TYPE_TRANSIT"])
    {
      int v8 = 11;
    }
    else if ([v7 isEqualToString:@"INTENT_TYPE_PHONE_NUMBER"])
    {
      int v8 = 12;
    }
    else if ([v7 isEqualToString:@"INTENT_TYPE_KEYWORD"])
    {
      int v8 = 13;
    }
    else
    {
      int v8 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_39;
    }
    int v8 = [v6 intValue];
  }
  *((_DWORD *)v512 + 37) |= 0x10000u;
  *((_DWORD *)v512 + 37) |= 2u;
  *((_DWORD *)v512 + 36) = v8;
LABEL_39:

  if (a3) {
    id v9 = @"categoryIntent";
  }
  else {
    id v9 = @"category_intent";
  }
  v500 = [v502 objectForKeyedSubscript:v9];
  objc_opt_class();
  id v10 = v500;
  if (objc_opt_isKindOfClass())
  {
    v11 = [GEOPDSearchCategoryIntent alloc];
    if (v11)
    {
      v12 = v11;
      id v13 = v500;
      uint64_t v513 = [(GEOPDSearchCategoryIntent *)v12 init];
      if (v513)
      {
        v501 = v13;
        v14 = [v13 objectForKeyedSubscript:@"trigger"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v15 = (void *)[v14 copy];
          id v16 = v15;
          *(_WORD *)(v513 + 140) |= 0x800u;
          *(_WORD *)(v513 + 140) |= 0x1000u;
          objc_storeStrong((id *)(v513 + 120), v15);
        }
        if (a3) {
          v17 = @"categoryId";
        }
        else {
          v17 = @"category_id";
        }
        v505 = v17;
        v18 = objc_msgSend(v501, "objectForKeyedSubscript:");
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v555 = 0u;
          long long v556 = 0u;
          long long v553 = 0u;
          long long v554 = 0u;
          id v19 = v18;
          uint64_t v20 = [v19 countByEnumeratingWithState:&v553 objects:v588 count:16];
          if (v20)
          {
            uint64_t v21 = *(void *)v554;
            do
            {
              for (uint64_t i = 0; i != v20; ++i)
              {
                if (*(void *)v554 != v21) {
                  objc_enumerationMutation(v19);
                }
                v23 = *(void **)(*((void *)&v553 + 1) + 8 * i);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v24 = (void *)[v23 copy];
                  -[GEOPDSearchCategoryIntent addCategoryId:](v513, v24);
                }
              }
              uint64_t v20 = [v19 countByEnumeratingWithState:&v553 objects:v588 count:16];
            }
            while (v20);
          }
        }
        if (a3) {
          v25 = @"tokenSet";
        }
        else {
          v25 = @"token_set";
        }
        v26 = [v501 objectForKeyedSubscript:v25];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v27 = [GEOPDSearchTokenSet alloc];
          if (v27) {
            v28 = (void *)-[GEOPDSearchTokenSet _initWithDictionary:isJSON:](v27, v26, a3);
          }
          else {
            v28 = 0;
          }
          id v29 = v28;
          *(_WORD *)(v513 + 140) |= 0x400u;
          *(_WORD *)(v513 + 140) |= 0x1000u;
          objc_storeStrong((id *)(v513 + 112), v28);
        }
        if (a3) {
          id v30 = @"canonicalName";
        }
        else {
          id v30 = @"canonical_name";
        }
        v31 = [v501 objectForKeyedSubscript:v30];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v551 = 0u;
          long long v552 = 0u;
          long long v549 = 0u;
          long long v550 = 0u;
          id v32 = v31;
          uint64_t v33 = [v32 countByEnumeratingWithState:&v549 objects:&v584 count:16];
          if (v33)
          {
            uint64_t v34 = *(void *)v550;
            do
            {
              for (uint64_t j = 0; j != v33; ++j)
              {
                if (*(void *)v550 != v34) {
                  objc_enumerationMutation(v32);
                }
                v36 = *(void **)(*((void *)&v549 + 1) + 8 * j);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v37 = (void *)[v36 copy];
                  -[GEOPDSearchCategoryIntent addCanonicalName:](v513, v37);
                }
              }
              uint64_t v33 = [v32 countByEnumeratingWithState:&v549 objects:&v584 count:16];
            }
            while (v33);
          }
        }
        if (a3) {
          v38 = @"featureMap";
        }
        else {
          v38 = @"feature_map";
        }
        id v39 = [v501 objectForKeyedSubscript:v38];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v547 = 0u;
          long long v548 = 0u;
          long long v545 = 0u;
          long long v546 = 0u;
          id v40 = v39;
          uint64_t v41 = [v40 countByEnumeratingWithState:&v545 objects:&v580 count:16];
          if (v41)
          {
            uint64_t v42 = *(void *)v546;
            do
            {
              uint64_t v43 = 0;
              do
              {
                if (*(void *)v546 != v42) {
                  objc_enumerationMutation(v40);
                }
                v44 = *(void **)(*((void *)&v545 + 1) + 8 * v43);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v45 = [GEOPDSearchKeyValueDoublePair alloc];
                  if (v45) {
                    id v46 = (void *)-[GEOPDSearchKeyValueDoublePair _initWithDictionary:isJSON:]((uint64_t)v45, v44);
                  }
                  else {
                    id v46 = 0;
                  }
                  -[GEOPDSearchCategoryIntent addFeatureMap:](v513, v46);
                }
                ++v43;
              }
              while (v41 != v43);
              uint64_t v47 = [v40 countByEnumeratingWithState:&v545 objects:&v580 count:16];
              uint64_t v41 = v47;
            }
            while (v47);
          }
        }
        if (a3) {
          v48 = @"expandedCategoryId";
        }
        else {
          v48 = @"expanded_category_id";
        }
        v49 = [v501 objectForKeyedSubscript:v48];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v543 = 0u;
          long long v544 = 0u;
          long long v541 = 0u;
          long long v542 = 0u;
          id v50 = v49;
          uint64_t v51 = [v50 countByEnumeratingWithState:&v541 objects:v579 count:16];
          if (v51)
          {
            uint64_t v52 = *(void *)v542;
            do
            {
              for (uint64_t k = 0; k != v51; ++k)
              {
                if (*(void *)v542 != v52) {
                  objc_enumerationMutation(v50);
                }
                v54 = *(void **)(*((void *)&v541 + 1) + 8 * k);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v55 = (void *)[v54 copy];
                  -[GEOPDSearchCategoryIntent addExpandedCategoryId:](v513, v55);
                }
              }
              uint64_t v51 = [v50 countByEnumeratingWithState:&v541 objects:v579 count:16];
            }
            while (v51);
          }
        }
        if (a3) {
          id v56 = @"negativeCategory";
        }
        else {
          id v56 = @"negative_category";
        }
        v57 = [v501 objectForKeyedSubscript:v56];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v539 = 0u;
          long long v540 = 0u;
          long long v537 = 0u;
          long long v538 = 0u;
          id v58 = v57;
          uint64_t v59 = [v58 countByEnumeratingWithState:&v537 objects:v578 count:16];
          if (v59)
          {
            uint64_t v60 = *(void *)v538;
            do
            {
              for (uint64_t m = 0; m != v59; ++m)
              {
                if (*(void *)v538 != v60) {
                  objc_enumerationMutation(v58);
                }
                id v62 = *(void **)(*((void *)&v537 + 1) + 8 * m);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v63 = (void *)[v62 copy];
                  -[GEOPDSearchCategoryIntent addNegativeCategory:](v513, v63);
                }
              }
              uint64_t v59 = [v58 countByEnumeratingWithState:&v537 objects:v578 count:16];
            }
            while (v59);
          }
        }
        if (a3) {
          v64 = @"modernToLegacyIdMapping";
        }
        else {
          v64 = @"modern_to_legacy_id_mapping";
        }
        v65 = [v501 objectForKeyedSubscript:v64];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v535 = 0u;
          long long v536 = 0u;
          long long v533 = 0u;
          long long v534 = 0u;
          id v66 = v65;
          uint64_t v67 = [v66 countByEnumeratingWithState:&v533 objects:&v574 count:16];
          if (v67)
          {
            uint64_t v68 = *(void *)v534;
            do
            {
              uint64_t v69 = 0;
              do
              {
                if (*(void *)v534 != v68) {
                  objc_enumerationMutation(v66);
                }
                v70 = *(void **)(*((void *)&v533 + 1) + 8 * v69);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v71 = [GEOPDSearchKeyValuePair alloc];
                  if (v71) {
                    v72 = (void *)-[GEOPDSearchKeyValuePair _initWithDictionary:isJSON:]((uint64_t)v71, v70);
                  }
                  else {
                    v72 = 0;
                  }
                  -[GEOPDSearchCategoryIntent addModernToLegacyIdMapping:](v513, v72);
                }
                ++v69;
              }
              while (v67 != v69);
              uint64_t v73 = [v66 countByEnumeratingWithState:&v533 objects:&v574 count:16];
              uint64_t v67 = v73;
            }
            while (v73);
          }
        }
        if (a3) {
          v74 = @"keywordMuid";
        }
        else {
          v74 = @"keyword_muid";
        }
        id v75 = [v501 objectForKeyedSubscript:v74];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v531 = 0u;
          long long v532 = 0u;
          long long v529 = 0u;
          long long v530 = 0u;
          id v76 = v75;
          uint64_t v77 = [v76 countByEnumeratingWithState:&v529 objects:&v570 count:16];
          if (v77)
          {
            uint64_t v78 = *(void *)v530;
            do
            {
              for (uint64_t n = 0; n != v77; ++n)
              {
                if (*(void *)v530 != v78) {
                  objc_enumerationMutation(v76);
                }
                id v80 = *(void **)(*((void *)&v529 + 1) + 8 * n);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  [v80 unsignedLongLongValue];
                  v81 = (os_unfair_lock_s *)v513;
                  os_unfair_lock_lock((os_unfair_lock_t)(v513 + 136));
                  if ((*(_WORD *)(v513 + 140) & 1) == 0)
                  {
                    v82 = *(void **)(v513 + 8);
                    if (v82)
                    {
                      id v83 = v82;
                      objc_sync_enter(v83);
                      GEOPDSearchCategoryIntentReadSpecified(v513, *(void *)(v513 + 8), (int *)&_readKeywordMuids_tags_389);
                      objc_sync_exit(v83);

                      v81 = (os_unfair_lock_s *)v513;
                    }
                  }
                  os_unfair_lock_unlock(v81 + 34);
                  PBRepeatedUInt64Add();
                  os_unfair_lock_lock_with_options();
                  *(_WORD *)(v513 + 140) |= 1u;
                  os_unfair_lock_unlock((os_unfair_lock_t)(v513 + 136));
                  *(_WORD *)(v513 + 140) |= 0x1000u;
                }
              }
              uint64_t v77 = [v76 countByEnumeratingWithState:&v529 objects:&v570 count:16];
            }
            while (v77);
          }
        }
        if (a3) {
          v84 = @"legacyCategoryId";
        }
        else {
          v84 = @"legacy_category_id";
        }
        v85 = [v501 objectForKeyedSubscript:v84];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v527 = 0u;
          long long v528 = 0u;
          long long v525 = 0u;
          long long v526 = 0u;
          id v86 = v85;
          uint64_t v87 = [v86 countByEnumeratingWithState:&v525 objects:&v566 count:16];
          if (v87)
          {
            uint64_t v88 = *(void *)v526;
            do
            {
              for (iuint64_t i = 0; ii != v87; ++ii)
              {
                if (*(void *)v526 != v88) {
                  objc_enumerationMutation(v86);
                }
                v90 = *(void **)(*((void *)&v525 + 1) + 8 * ii);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v91 = (void *)[v90 copy];
                  -[GEOPDSearchCategoryIntent addLegacyCategoryId:](v513, v91);
                }
              }
              uint64_t v87 = [v86 countByEnumeratingWithState:&v525 objects:&v566 count:16];
            }
            while (v87);
          }
        }
        if (a3) {
          v92 = @"categoryMappings";
        }
        else {
          v92 = @"category_mappings";
        }
        v499 = [v501 objectForKeyedSubscript:v92];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v523 = 0u;
          long long v524 = 0u;
          long long v521 = 0u;
          long long v522 = 0u;
          obuint64_t j = v499;
          uint64_t v509 = [obj countByEnumeratingWithState:&v521 objects:&v562 count:16];
          if (v509)
          {
            uint64_t v507 = *(void *)v522;
            if (a3) {
              v93 = @"densityScore";
            }
            else {
              v93 = @"density_score";
            }
            v94 = @"related_categories";
            if (a3) {
              v94 = @"relatedCategories";
            }
            v503 = v94;
            v504 = v93;
            do
            {
              uint64_t v95 = 0;
              do
              {
                if (*(void *)v522 != v507) {
                  objc_enumerationMutation(obj);
                }
                v96 = *(void **)(*((void *)&v521 + 1) + 8 * v95);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v97 = [GEOPDSearchCategoryMapping alloc];
                  if (v97)
                  {
                    id v98 = v96;
                    uint64_t v99 = [(GEOPDSearchCategoryMapping *)v97 init];
                    if (v99)
                    {
                      v100 = [v98 objectForKeyedSubscript:v505];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        v101 = (void *)[v100 copy];
                        id v102 = v101;
                        *(unsigned char *)(v99 + 52) |= 2u;
                        *(unsigned char *)(v99 + 52) |= 8u;
                        objc_storeStrong((id *)(v99 + 16), v101);
                      }
                      v103 = [v98 objectForKeyedSubscript:v504];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        uint64_t v104 = [v103 longLongValue];
                        *(unsigned char *)(v99 + 52) |= 8u;
                        *(unsigned char *)(v99 + 52) |= 1u;
                        *(void *)(v99 + 24) = v104;
                      }

                      v105 = [v98 objectForKeyedSubscript:v503];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        long long v559 = 0u;
                        long long v560 = 0u;
                        long long v557 = 0u;
                        long long v558 = 0u;
                        id v106 = v105;
                        uint64_t v107 = [v106 countByEnumeratingWithState:&v557 objects:v589 count:16];
                        if (v107)
                        {
                          uint64_t v108 = *(void *)v558;
                          do
                          {
                            uint64_t v109 = 0;
                            do
                            {
                              if (*(void *)v558 != v108) {
                                objc_enumerationMutation(v106);
                              }
                              v110 = *(void **)(*((void *)&v557 + 1) + 8 * v109);
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                v111 = [GEOPDSearchRelatedCategory alloc];
                                if (v111) {
                                  v112 = (void *)-[GEOPDSearchRelatedCategory _initWithDictionary:isJSON:](v111, v110, a3);
                                }
                                else {
                                  v112 = 0;
                                }
                                -[GEOPDSearchCategoryMapping addRelatedCategories:](v99, v112);
                              }
                              ++v109;
                            }
                            while (v107 != v109);
                            uint64_t v113 = [v106 countByEnumeratingWithState:&v557 objects:v589 count:16];
                            uint64_t v107 = v113;
                          }
                          while (v113);
                        }
                      }
                    }
                  }
                  else
                  {
                    uint64_t v99 = 0;
                  }
                  -[GEOPDSearchCategoryIntent addCategoryMappings:](v513, (void *)v99);
                }
                ++v95;
              }
              while (v95 != v509);
              uint64_t v114 = [obj countByEnumeratingWithState:&v521 objects:&v562 count:16];
              uint64_t v509 = v114;
            }
            while (v114);
          }
        }
        if (a3) {
          v115 = @"keywordMapping";
        }
        else {
          v115 = @"keyword_mapping";
        }
        v116 = [v501 objectForKeyedSubscript:v115];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v559 = 0u;
          long long v560 = 0u;
          long long v557 = 0u;
          long long v558 = 0u;
          id v117 = v116;
          uint64_t v118 = [v117 countByEnumeratingWithState:&v557 objects:v589 count:16];
          if (v118)
          {
            uint64_t v119 = *(void *)v558;
            do
            {
              uint64_t v120 = 0;
              do
              {
                if (*(void *)v558 != v119) {
                  objc_enumerationMutation(v117);
                }
                v121 = *(void **)(*((void *)&v557 + 1) + 8 * v120);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v122 = [GEOPDSearchKeywordMapping alloc];
                  if (v122) {
                    v123 = (void *)-[GEOPDSearchKeywordMapping _initWithDictionary:isJSON:](v122, v121, a3);
                  }
                  else {
                    v123 = 0;
                  }
                  -[GEOPDSearchCategoryIntent addKeywordMapping:](v513, v123);
                }
                ++v120;
              }
              while (v118 != v120);
              uint64_t v124 = [v117 countByEnumeratingWithState:&v557 objects:v589 count:16];
              uint64_t v118 = v124;
            }
            while (v124);
          }
        }
        id v13 = v501;
      }
    }
    else
    {
      uint64_t v513 = 0;
    }
    id v125 = (id)v513;
    *((_DWORD *)v512 + 37) |= 0x10u;
    *((_DWORD *)v512 + 37) |= 0x10000u;
    objc_storeStrong((id *)v512 + 4, (id)v513);

    id v10 = v500;
  }

  if (a3) {
    v126 = @"chainIntent";
  }
  else {
    v126 = @"chain_intent";
  }
  v514 = [v502 objectForKeyedSubscript:v126];
  objc_opt_class();
  v127 = v514;
  if (objc_opt_isKindOfClass())
  {
    v128 = [GEOPDSearchChainIntent alloc];
    if (v128)
    {
      v129 = v128;
      id v130 = v514;
      uint64_t v131 = [(GEOPDSearchChainIntent *)v129 init];
      if (v131)
      {
        v132 = v130;
        v133 = [v130 objectForKeyedSubscript:@"trigger"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v134 = (void *)[v133 copy];
          id v135 = v134;
          *(_WORD *)(v131 + 136) |= 0x2000u;
          *(_WORD *)(v131 + 136) |= 0x4000u;
          objc_storeStrong((id *)(v131 + 112), v134);
        }
        if (a3) {
          v136 = @"chainId";
        }
        else {
          v136 = @"chain_id";
        }
        v137 = [v132 objectForKeyedSubscript:v136];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v138 = (void *)[v137 copy];
          id v139 = v138;
          *(_WORD *)(v131 + 136) |= 0x80u;
          *(_WORD *)(v131 + 136) |= 0x4000u;
          objc_storeStrong((id *)(v131 + 64), v138);
        }
        if (a3) {
          v140 = @"geminiBrand";
        }
        else {
          v140 = @"gemini_brand";
        }
        v141 = [v132 objectForKeyedSubscript:v140];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v142 = (void *)[v141 copy];
          id v143 = v142;
          *(_WORD *)(v131 + 136) |= 0x200u;
          *(_WORD *)(v131 + 136) |= 0x4000u;
          objc_storeStrong((id *)(v131 + 80), v142);
        }
        if (a3) {
          v144 = @"tokenSet";
        }
        else {
          v144 = @"token_set";
        }
        v145 = [v132 objectForKeyedSubscript:v144];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v146 = [GEOPDSearchTokenSet alloc];
          if (v146) {
            v147 = (void *)-[GEOPDSearchTokenSet _initWithDictionary:isJSON:](v146, v145, a3);
          }
          else {
            v147 = 0;
          }
          id v148 = v147;
          *(_WORD *)(v131 + 136) |= 0x1000u;
          *(_WORD *)(v131 + 136) |= 0x4000u;
          objc_storeStrong((id *)(v131 + 104), v147);
        }
        v149 = [v132 objectForKeyedSubscript:@"isLocalChain"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v150 = [v149 BOOLValue];
          *(_WORD *)(v131 + 136) |= 0x4000u;
          *(_WORD *)(v131 + 136) |= 4u;
          *(unsigned char *)(v131 + 133) = v150;
        }

        v151 = [v132 objectForKeyedSubscript:@"isChainInSameCountry"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v152 = [v151 BOOLValue];
          *(_WORD *)(v131 + 136) |= 0x4000u;
          *(_WORD *)(v131 + 136) |= 2u;
          *(unsigned char *)(v131 + 132) = v152;
        }

        if (a3) {
          v153 = @"brandMuid";
        }
        else {
          v153 = @"brand_muid";
        }
        v154 = [v132 objectForKeyedSubscript:v153];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v155 = [v154 unsignedLongLongValue];
          *(_WORD *)(v131 + 136) |= 0x4000u;
          *(_WORD *)(v131 + 136) |= 1u;
          *(void *)(v131 + 40) = v155;
        }

        if (a3) {
          v156 = @"isFromBrandProfile";
        }
        else {
          v156 = @"is_from_brand_profile";
        }
        v157 = [v132 objectForKeyedSubscript:v156];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v158 = [v157 BOOLValue];
          *(_WORD *)(v131 + 136) |= 0x4000u;
          *(_WORD *)(v131 + 136) |= 8u;
          *(unsigned char *)(v131 + 134) = v158;
        }

        if (a3) {
          v159 = @"categoryId";
        }
        else {
          v159 = @"category_id";
        }
        v160 = [v132 objectForKeyedSubscript:v159];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v577 = 0u;
          long long v576 = 0u;
          long long v575 = 0u;
          long long v574 = 0u;
          id v161 = v160;
          uint64_t v162 = [v161 countByEnumeratingWithState:&v574 objects:v589 count:16];
          if (v162)
          {
            uint64_t v163 = *(void *)v575;
            do
            {
              for (juint64_t j = 0; jj != v162; ++jj)
              {
                if (*(void *)v575 != v163) {
                  objc_enumerationMutation(v161);
                }
                v165 = *(void **)(*((void *)&v574 + 1) + 8 * jj);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v166 = (void *)[v165 copy];
                  -[GEOPDSearchChainIntent addCategoryId:](v131, v166);
                }
              }
              uint64_t v162 = [v161 countByEnumeratingWithState:&v574 objects:v589 count:16];
            }
            while (v162);
          }
        }
        if (a3) {
          v167 = @"featureMap";
        }
        else {
          v167 = @"feature_map";
        }
        v168 = [v132 objectForKeyedSubscript:v167];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v573 = 0u;
          long long v572 = 0u;
          long long v571 = 0u;
          long long v570 = 0u;
          id v169 = v168;
          uint64_t v170 = [v169 countByEnumeratingWithState:&v570 objects:v588 count:16];
          if (v170)
          {
            uint64_t v171 = *(void *)v571;
            do
            {
              uint64_t v172 = 0;
              do
              {
                if (*(void *)v571 != v171) {
                  objc_enumerationMutation(v169);
                }
                v173 = *(void **)(*((void *)&v570 + 1) + 8 * v172);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v174 = [GEOPDSearchKeyValueDoublePair alloc];
                  if (v174) {
                    v175 = (void *)-[GEOPDSearchKeyValueDoublePair _initWithDictionary:isJSON:]((uint64_t)v174, v173);
                  }
                  else {
                    v175 = 0;
                  }
                  -[GEOPDSearchChainIntent addFeatureMap:](v131, v175);
                }
                ++v172;
              }
              while (v170 != v172);
              uint64_t v176 = [v169 countByEnumeratingWithState:&v570 objects:v588 count:16];
              uint64_t v170 = v176;
            }
            while (v176);
          }
        }
        if (a3) {
          v177 = @"brandMuids";
        }
        else {
          v177 = @"brand_muids";
        }
        v510 = [v132 objectForKeyedSubscript:v177];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v569 = 0u;
          long long v568 = 0u;
          long long v567 = 0u;
          long long v566 = 0u;
          id v178 = v510;
          uint64_t v179 = [v178 countByEnumeratingWithState:&v566 objects:&v584 count:16];
          if (v179)
          {
            uint64_t v180 = *(void *)v567;
            do
            {
              for (kuint64_t k = 0; kk != v179; ++kk)
              {
                if (*(void *)v567 != v180) {
                  objc_enumerationMutation(v178);
                }
                v182 = *(void **)(*((void *)&v566 + 1) + 8 * kk);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  [v182 unsignedLongLongValue];
                  os_unfair_lock_lock((os_unfair_lock_t)(v131 + 128));
                  if ((*(_WORD *)(v131 + 136) & 0x10) == 0)
                  {
                    v183 = *(void **)(v131 + 8);
                    if (v183)
                    {
                      id v184 = v183;
                      objc_sync_enter(v184);
                      GEOPDSearchChainIntentReadSpecified(v131, *(void *)(v131 + 8), (int *)&_readBrandMuids_tags);
                      objc_sync_exit(v184);
                    }
                  }
                  os_unfair_lock_unlock((os_unfair_lock_t)(v131 + 128));
                  PBRepeatedUInt64Add();
                  os_unfair_lock_lock_with_options();
                  *(_WORD *)(v131 + 136) |= 0x10u;
                  os_unfair_lock_unlock((os_unfair_lock_t)(v131 + 128));
                  *(_WORD *)(v131 + 136) |= 0x4000u;
                }
              }
              uint64_t v179 = [v178 countByEnumeratingWithState:&v566 objects:&v584 count:16];
            }
            while (v179);
          }
        }
        if (a3) {
          v185 = @"relatedBrand";
        }
        else {
          v185 = @"related_brand";
        }
        v186 = [v132 objectForKeyedSubscript:v185];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v564 = 0u;
          long long v565 = 0u;
          long long v562 = 0u;
          long long v563 = 0u;
          id v187 = v186;
          uint64_t v188 = [v187 countByEnumeratingWithState:&v562 objects:&v580 count:16];
          if (v188)
          {
            uint64_t v189 = *(void *)v563;
            do
            {
              uint64_t v190 = 0;
              do
              {
                if (*(void *)v563 != v189) {
                  objc_enumerationMutation(v187);
                }
                v191 = *(void **)(*((void *)&v562 + 1) + 8 * v190);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v192 = [GEOPDSearchBrandRelationship alloc];
                  if (v192) {
                    v193 = (void *)-[GEOPDSearchBrandRelationship _initWithDictionary:isJSON:]((uint64_t)v192, v191, a3);
                  }
                  else {
                    v193 = 0;
                  }
                  -[GEOPDSearchChainIntent addRelatedBrand:](v131, v193);
                }
                ++v190;
              }
              while (v188 != v190);
              uint64_t v194 = [v187 countByEnumeratingWithState:&v562 objects:&v580 count:16];
              uint64_t v188 = v194;
            }
            while (v194);
          }
        }
        if (a3) {
          v195 = @"brandRelationshipInfo";
        }
        else {
          v195 = @"brand_relationship_info";
        }
        v196 = [v132 objectForKeyedSubscript:v195];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v559 = 0u;
          long long v560 = 0u;
          long long v557 = 0u;
          long long v558 = 0u;
          id v197 = v196;
          uint64_t v198 = [v197 countByEnumeratingWithState:&v557 objects:v579 count:16];
          if (v198)
          {
            uint64_t v199 = *(void *)v558;
            do
            {
              uint64_t v200 = 0;
              do
              {
                if (*(void *)v558 != v199) {
                  objc_enumerationMutation(v197);
                }
                v201 = *(void **)(*((void *)&v557 + 1) + 8 * v200);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v202 = [GEOPDSearchChainInfo alloc];
                  if (v202) {
                    v203 = (void *)-[GEOPDSearchChainInfo _initWithDictionary:isJSON:](v202, v201, a3);
                  }
                  else {
                    v203 = 0;
                  }
                  -[GEOPDSearchChainIntent addBrandRelationshipInfo:](v131, v203);
                }
                ++v200;
              }
              while (v198 != v200);
              uint64_t v204 = [v197 countByEnumeratingWithState:&v557 objects:v579 count:16];
              uint64_t v198 = v204;
            }
            while (v204);
          }
        }
        if (a3) {
          v205 = @"prefCategoryId";
        }
        else {
          v205 = @"pref_category_id";
        }
        v206 = [v132 objectForKeyedSubscript:v205];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v555 = 0u;
          long long v556 = 0u;
          long long v553 = 0u;
          long long v554 = 0u;
          id v207 = v206;
          uint64_t v208 = [v207 countByEnumeratingWithState:&v553 objects:v578 count:16];
          if (v208)
          {
            uint64_t v209 = *(void *)v554;
            do
            {
              for (muint64_t m = 0; mm != v208; ++mm)
              {
                if (*(void *)v554 != v209) {
                  objc_enumerationMutation(v207);
                }
                v211 = *(void **)(*((void *)&v553 + 1) + 8 * mm);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v212 = (void *)[v211 copy];
                  -[GEOPDSearchChainIntent addPrefCategoryId:](v131, v212);
                }
              }
              uint64_t v208 = [v207 countByEnumeratingWithState:&v553 objects:v578 count:16];
            }
            while (v208);
          }
        }
        id v130 = v132;
      }
    }
    else
    {
      uint64_t v131 = 0;
    }
    id v213 = (id)v131;
    *((_DWORD *)v512 + 37) |= 0x20u;
    *((_DWORD *)v512 + 37) |= 0x10000u;
    objc_storeStrong((id *)v512 + 5, (id)v131);

    v127 = v514;
  }

  if (a3) {
    v214 = @"businessIntent";
  }
  else {
    v214 = @"business_intent";
  }
  v515 = [v502 objectForKeyedSubscript:v214];
  objc_opt_class();
  v215 = v515;
  if (objc_opt_isKindOfClass())
  {
    v216 = [GEOPDSearchBusinessIntent alloc];
    if (!v216)
    {
      uint64_t v219 = 0;
      goto LABEL_457;
    }
    v217 = v216;
    id v218 = v515;
    uint64_t v219 = [(GEOPDSearchBusinessIntent *)v217 init];
    if (!v219)
    {
LABEL_456:

LABEL_457:
      id v258 = (id)v219;
      *((_DWORD *)v512 + 37) |= 8u;
      *((_DWORD *)v512 + 37) |= 0x10000u;
      objc_storeStrong((id *)v512 + 3, (id)v219);

      v215 = v515;
      goto LABEL_458;
    }
    v511 = v218;
    v220 = [v218 objectForKeyedSubscript:@"name"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v221 = (void *)[v220 copy];
      id v222 = v221;
      *(unsigned char *)(v219 + 96) |= 0x20u;
      *(unsigned char *)(v219 + 96) |= 0x80u;
      objc_storeStrong((id *)(v219 + 64), v221);
    }
    if (a3) {
      v223 = @"tokenSet";
    }
    else {
      v223 = @"token_set";
    }
    v224 = [v511 objectForKeyedSubscript:v223];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v225 = [GEOPDSearchTokenSet alloc];
      if (v225) {
        v226 = (void *)-[GEOPDSearchTokenSet _initWithDictionary:isJSON:](v225, v224, a3);
      }
      else {
        v226 = 0;
      }
      id v227 = v226;
      *(unsigned char *)(v219 + 96) |= 0x40u;
      *(unsigned char *)(v219 + 96) |= 0x80u;
      objc_storeStrong((id *)(v219 + 72), v226);
    }
    if (a3) {
      v228 = @"businessId";
    }
    else {
      v228 = @"business_id";
    }
    v229 = [v511 objectForKeyedSubscript:v228];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v230 = [v229 unsignedLongLongValue];
      *(unsigned char *)(v219 + 96) |= 0x80u;
      *(unsigned char *)(v219 + 96) |= 1u;
      *(void *)(v219 + 40) = v230;
    }

    v231 = [v511 objectForKeyedSubscript:@"center"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v232 = [GEOLatLng alloc];
      if (a3) {
        v233 = [(GEOLatLng *)v232 initWithJSON:v231];
      }
      else {
        v233 = [(GEOLatLng *)v232 initWithDictionary:v231];
      }
      v234 = v233;
      v235 = v233;
      *(unsigned char *)(v219 + 96) |= 8u;
      *(unsigned char *)(v219 + 96) |= 0x80u;
      objc_storeStrong((id *)(v219 + 48), v234);
    }
    v236 = [v511 objectForKeyedSubscript:@"businessType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v237 = v236;
      if ([v237 isEqualToString:@"DEFAULT"])
      {
        int v238 = 0;
      }
      else if ([v237 isEqualToString:@"LOCAL_NAVIGATIONAL"])
      {
        int v238 = 1;
      }
      else if ([v237 isEqualToString:@"GLOBAL_NAVIGATIONAL"])
      {
        int v238 = 2;
      }
      else
      {
        int v238 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_420:

        if (a3) {
          v239 = @"keywordMuid";
        }
        else {
          v239 = @"keyword_muid";
        }
        v508 = [v511 objectForKeyedSubscript:v239];
        objc_opt_class();
        v240 = v508;
        if (objc_opt_isKindOfClass())
        {
          long long v587 = 0u;
          long long v586 = 0u;
          long long v585 = 0u;
          long long v584 = 0u;
          id v241 = v508;
          uint64_t v242 = [v241 countByEnumeratingWithState:&v584 objects:v589 count:16];
          if (v242)
          {
            uint64_t v243 = *(void *)v585;
            do
            {
              for (nuint64_t n = 0; nn != v242; ++nn)
              {
                if (*(void *)v585 != v243) {
                  objc_enumerationMutation(v241);
                }
                v245 = *(void **)(*((void *)&v584 + 1) + 8 * nn);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  [v245 unsignedLongLongValue];
                  os_unfair_lock_lock((os_unfair_lock_t)(v219 + 88));
                  if ((*(unsigned char *)(v219 + 96) & 4) == 0)
                  {
                    v246 = *(void **)(v219 + 8);
                    if (v246)
                    {
                      id v247 = v246;
                      objc_sync_enter(v247);
                      GEOPDSearchBusinessIntentReadSpecified(v219, *(void *)(v219 + 8), (int *)&_readKeywordMuids_tags);
                      objc_sync_exit(v247);
                    }
                  }
                  os_unfair_lock_unlock((os_unfair_lock_t)(v219 + 88));
                  PBRepeatedUInt64Add();
                  os_unfair_lock_lock_with_options();
                  *(unsigned char *)(v219 + 96) |= 4u;
                  os_unfair_lock_unlock((os_unfair_lock_t)(v219 + 88));
                  *(unsigned char *)(v219 + 96) |= 0x80u;
                }
              }
              uint64_t v242 = [v241 countByEnumeratingWithState:&v584 objects:v589 count:16];
            }
            while (v242);
          }

          v240 = v508;
        }

        if (a3) {
          v248 = @"keywordMapping";
        }
        else {
          v248 = @"keyword_mapping";
        }
        v249 = [v511 objectForKeyedSubscript:v248];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v583 = 0u;
          long long v582 = 0u;
          long long v581 = 0u;
          long long v580 = 0u;
          id v250 = v249;
          uint64_t v251 = [v250 countByEnumeratingWithState:&v580 objects:v588 count:16];
          if (v251)
          {
            uint64_t v252 = *(void *)v581;
            do
            {
              uint64_t v253 = 0;
              do
              {
                if (*(void *)v581 != v252) {
                  objc_enumerationMutation(v250);
                }
                v254 = *(void **)(*((void *)&v580 + 1) + 8 * v253);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v255 = [GEOPDSearchKeywordMapping alloc];
                  if (v255) {
                    v256 = (void *)-[GEOPDSearchKeywordMapping _initWithDictionary:isJSON:](v255, v254, a3);
                  }
                  else {
                    v256 = 0;
                  }
                  -[GEOPDSearchBusinessIntent addKeywordMapping:](v219, v256);
                }
                ++v253;
              }
              while (v251 != v253);
              uint64_t v257 = [v250 countByEnumeratingWithState:&v580 objects:v588 count:16];
              uint64_t v251 = v257;
            }
            while (v257);
          }
        }
        id v218 = v511;
        goto LABEL_456;
      }
      int v238 = [v236 intValue];
    }
    *(unsigned char *)(v219 + 96) |= 0x80u;
    *(unsigned char *)(v219 + 96) |= 2u;
    *(_DWORD *)(v219 + 92) = v238;
    goto LABEL_420;
  }
LABEL_458:

  if (a3) {
    v259 = @"geoIntent";
  }
  else {
    v259 = @"geo_intent";
  }
  v260 = [v502 objectForKeyedSubscript:v259];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v261 = [GEOPDSearchGeoIntent alloc];
    if (v261)
    {
      v262 = v261;
      id v263 = v260;
      uint64_t v264 = [(GEOPDSearchGeoIntent *)v262 init];
      if (v264)
      {
        v265 = [v263 objectForKeyedSubscript:@"name"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v266 = (void *)[v265 copy];
          id v267 = v266;
          *(_WORD *)(v264 + 112) |= 0x200u;
          *(_WORD *)(v264 + 112) |= 0x800u;
          objc_storeStrong((id *)(v264 + 80), v266);
        }
        if (a3) {
          v268 = @"tokenSet";
        }
        else {
          v268 = @"token_set";
        }
        v269 = [v263 objectForKeyedSubscript:v268];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v270 = [GEOPDSearchTokenSet alloc];
          if (v270) {
            v271 = (void *)-[GEOPDSearchTokenSet _initWithDictionary:isJSON:](v270, v269, a3);
          }
          else {
            v271 = 0;
          }
          id v272 = v271;
          *(_WORD *)(v264 + 112) |= 0x400u;
          *(_WORD *)(v264 + 112) |= 0x800u;
          objc_storeStrong((id *)(v264 + 88), v271);
        }
        if (a3) {
          v273 = @"geoId";
        }
        else {
          v273 = @"geo_id";
        }
        v274 = [v263 objectForKeyedSubscript:v273];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v275 = [v274 longLongValue];
          *(_WORD *)(v264 + 112) |= 0x800u;
          *(_WORD *)(v264 + 112) |= 1u;
          *(void *)(v264 + 64) = v275;
        }

        if (a3) {
          v276 = @"geoTypeId";
        }
        else {
          v276 = @"geo_type_id";
        }
        v277 = [v263 objectForKeyedSubscript:v276];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v278 = [v277 intValue];
          *(_WORD *)(v264 + 112) |= 0x800u;
          *(_WORD *)(v264 + 112) |= 2u;
          *(_DWORD *)(v264 + 108) = v278;
        }

        if (a3) {
          v279 = @"countryCode";
        }
        else {
          v279 = @"country_code";
        }
        v280 = [v263 objectForKeyedSubscript:v279];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v281 = (void *)[v280 copy];
          id v282 = v281;
          *(_WORD *)(v264 + 112) |= 0x10u;
          *(_WORD *)(v264 + 112) |= 0x800u;
          objc_storeStrong((id *)(v264 + 32), v281);
        }
        v283 = [v263 objectForKeyedSubscript:@"center"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v284 = [GEOLatLng alloc];
          if (a3) {
            v285 = [(GEOLatLng *)v284 initWithJSON:v283];
          }
          else {
            v285 = [(GEOLatLng *)v284 initWithDictionary:v283];
          }
          v286 = v285;
          v287 = v285;
          *(_WORD *)(v264 + 112) |= 8u;
          *(_WORD *)(v264 + 112) |= 0x800u;
          objc_storeStrong((id *)(v264 + 24), v286);
        }
        if (a3) {
          v288 = @"mapRegion";
        }
        else {
          v288 = @"map_region";
        }
        v289 = [v263 objectForKeyedSubscript:v288];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v290 = [GEOMapRegion alloc];
          if (a3) {
            v291 = [(GEOMapRegion *)v290 initWithJSON:v289];
          }
          else {
            v291 = [(GEOMapRegion *)v290 initWithDictionary:v289];
          }
          v292 = v291;
          v293 = v291;
          *(_WORD *)(v264 + 112) |= 0x100u;
          *(_WORD *)(v264 + 112) |= 0x800u;
          objc_storeStrong((id *)(v264 + 72), v292);
        }
        if (a3) {
          v294 = @"doorNumber";
        }
        else {
          v294 = @"door_number";
        }
        v295 = [v263 objectForKeyedSubscript:v294];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v296 = (void *)[v295 copy];
          id v297 = v296;
          *(_WORD *)(v264 + 112) |= 0x80u;
          *(_WORD *)(v264 + 112) |= 0x800u;
          objc_storeStrong((id *)(v264 + 56), v296);
        }
        if (a3) {
          v298 = @"displayName";
        }
        else {
          v298 = @"display_name";
        }
        v299 = [v263 objectForKeyedSubscript:v298];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v300 = (void *)[v299 copy];
          id v301 = v300;
          *(_WORD *)(v264 + 112) |= 0x40u;
          *(_WORD *)(v264 + 112) |= 0x800u;
          objc_storeStrong((id *)(v264 + 48), v300);
        }
        if (a3) {
          v302 = @"displayMapRegion";
        }
        else {
          v302 = @"display_map_region";
        }
        v303 = [v263 objectForKeyedSubscript:v302];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v304 = [GEOMapRegion alloc];
          if (a3) {
            v305 = [(GEOMapRegion *)v304 initWithJSON:v303];
          }
          else {
            v305 = [(GEOMapRegion *)v304 initWithDictionary:v303];
          }
          v306 = v305;
          v307 = v305;
          *(_WORD *)(v264 + 112) |= 0x20u;
          *(_WORD *)(v264 + 112) |= 0x800u;
          objc_storeStrong((id *)(v264 + 40), v306);
        }
        v308 = [v263 objectForKeyedSubscript:@"address"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v309 = [GEOStructuredAddress alloc];
          if (a3) {
            v310 = [(GEOStructuredAddress *)v309 initWithJSON:v308];
          }
          else {
            v310 = [(GEOStructuredAddress *)v309 initWithDictionary:v308];
          }
          v311 = v310;
          v312 = v310;
          *(_WORD *)(v264 + 112) |= 4u;
          *(_WORD *)(v264 + 112) |= 0x800u;
          objc_storeStrong((id *)(v264 + 16), v311);
        }
      }
    }
    else
    {
      uint64_t v264 = 0;
    }
    id v313 = (id)v264;
    *((_DWORD *)v512 + 37) |= 0x100u;
    *((_DWORD *)v512 + 37) |= 0x10000u;
    objc_storeStrong((id *)v512 + 8, (id)v264);
  }
  if (a3) {
    v314 = @"proximityIntent";
  }
  else {
    v314 = @"proximity_intent";
  }
  v315 = [v502 objectForKeyedSubscript:v314];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v316 = [GEOPDSearchProximityIntent alloc];
    if (v316)
    {
      v317 = v316;
      id v318 = v315;
      uint64_t v319 = [(GEOPDSearchProximityIntent *)v317 init];
      if (v319)
      {
        v320 = [v318 objectForKeyedSubscript:@"name"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v321 = (void *)[v320 copy];
          id v322 = v321;
          *(unsigned char *)(v319 + 44) |= 1u;
          *(unsigned char *)(v319 + 44) |= 4u;
          objc_storeStrong((id *)(v319 + 16), v321);
        }
        if (a3) {
          v323 = @"tokenSet";
        }
        else {
          v323 = @"token_set";
        }
        v324 = [v318 objectForKeyedSubscript:v323];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v325 = [GEOPDSearchTokenSet alloc];
          if (v325) {
            v326 = (void *)-[GEOPDSearchTokenSet _initWithDictionary:isJSON:](v325, v324, a3);
          }
          else {
            v326 = 0;
          }
          id v327 = v326;
          *(unsigned char *)(v319 + 44) |= 2u;
          *(unsigned char *)(v319 + 44) |= 4u;
          objc_storeStrong((id *)(v319 + 24), v326);
        }
      }
    }
    else
    {
      uint64_t v319 = 0;
    }
    id v328 = (id)v319;
    *((_DWORD *)v512 + 37) |= 0x2000u;
    *((_DWORD *)v512 + 37) |= 0x10000u;
    objc_storeStrong((id *)v512 + 13, (id)v319);
  }
  if (a3) {
    v329 = @"locationIntent";
  }
  else {
    v329 = @"location_intent";
  }
  v330 = [v502 objectForKeyedSubscript:v329];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v331 = [GEOPDSearchLocationIntent alloc];
    if (!v331)
    {
      uint64_t v334 = 0;
      goto LABEL_611;
    }
    v332 = v331;
    id v333 = v330;
    uint64_t v334 = [(GEOPDSearchLocationIntent *)v332 init];
    if (!v334)
    {
LABEL_610:

LABEL_611:
      id v368 = (id)v334;
      *((_DWORD *)v512 + 37) |= 0x800u;
      *((_DWORD *)v512 + 37) |= 0x10000u;
      objc_storeStrong((id *)v512 + 11, (id)v334);

      goto LABEL_612;
    }
    if (a3) {
      v335 = @"mapRegion";
    }
    else {
      v335 = @"map_region";
    }
    v336 = [v333 objectForKeyedSubscript:v335];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v337 = [GEOMapRegion alloc];
      if (a3) {
        v338 = [(GEOMapRegion *)v337 initWithJSON:v336];
      }
      else {
        v338 = [(GEOMapRegion *)v337 initWithDictionary:v336];
      }
      v339 = v338;
      v340 = v338;
      *(_WORD *)(v334 + 76) |= 0x80u;
      *(_WORD *)(v334 + 76) |= 0x100u;
      objc_storeStrong((id *)(v334 + 40), v339);
    }
    v341 = [v333 objectForKeyedSubscript:@"center"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v342 = [GEOLatLng alloc];
      if (a3) {
        v343 = [(GEOLatLng *)v342 initWithJSON:v341];
      }
      else {
        v343 = [(GEOLatLng *)v342 initWithDictionary:v341];
      }
      v344 = v343;
      v345 = v343;
      *(_WORD *)(v334 + 76) |= 0x20u;
      *(_WORD *)(v334 + 76) |= 0x100u;
      objc_storeStrong((id *)(v334 + 16), v344);
    }
    if (a3) {
      v346 = @"locationType";
    }
    else {
      v346 = @"location_type";
    }
    v347 = [v333 objectForKeyedSubscript:v346];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v348 = v347;
      if ([v348 isEqualToString:@"UNKNOWN"])
      {
        int v349 = 0;
      }
      else if ([v348 isEqualToString:@"MAP_REGION"])
      {
        int v349 = 1;
      }
      else if ([v348 isEqualToString:@"CENTER"])
      {
        int v349 = 2;
      }
      else if ([v348 isEqualToString:@"NEARBY_VENUE"])
      {
        int v349 = 3;
      }
      else
      {
        int v349 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_581:

        if (a3) {
          v350 = @"distanceInKm";
        }
        else {
          v350 = @"distance_in_km";
        }
        v351 = [v333 objectForKeyedSubscript:v350];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v351 doubleValue];
          *(_WORD *)(v334 + 76) |= 0x100u;
          *(_WORD *)(v334 + 76) |= 1u;
          *(void *)(v334 + 32) = v352;
        }

        if (a3) {
          v353 = @"isDerivedFromGeoIntent";
        }
        else {
          v353 = @"is_derived_from_geo_intent";
        }
        v354 = [v333 objectForKeyedSubscript:v353];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v355 = [v354 BOOLValue];
          *(_WORD *)(v334 + 76) |= 0x100u;
          *(_WORD *)(v334 + 76) |= 8u;
          *(unsigned char *)(v334 + 72) = v355;
        }

        if (a3) {
          v356 = @"venueId";
        }
        else {
          v356 = @"venue_id";
        }
        v357 = [v333 objectForKeyedSubscript:v356];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v358 = [v357 unsignedLongLongValue];
          *(_WORD *)(v334 + 76) |= 0x100u;
          *(_WORD *)(v334 + 76) |= 2u;
          *(void *)(v334 + 48) = v358;
        }

        if (a3) {
          v359 = @"isDerivedFromPoiIntent";
        }
        else {
          v359 = @"is_derived_from_poi_intent";
        }
        v360 = [v333 objectForKeyedSubscript:v359];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v361 = [v360 BOOLValue];
          *(_WORD *)(v334 + 76) |= 0x100u;
          *(_WORD *)(v334 + 76) |= 0x10u;
          *(unsigned char *)(v334 + 73) = v361;
        }

        if (a3) {
          v362 = @"displayMapRegion";
        }
        else {
          v362 = @"display_map_region";
        }
        v363 = [v333 objectForKeyedSubscript:v362];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v364 = [GEOMapRegion alloc];
          if (a3) {
            v365 = [(GEOMapRegion *)v364 initWithJSON:v363];
          }
          else {
            v365 = [(GEOMapRegion *)v364 initWithDictionary:v363];
          }
          v366 = v365;
          v367 = v365;
          *(_WORD *)(v334 + 76) |= 0x40u;
          *(_WORD *)(v334 + 76) |= 0x100u;
          objc_storeStrong((id *)(v334 + 24), v366);
        }
        goto LABEL_610;
      }
      int v349 = [v347 intValue];
    }
    *(_WORD *)(v334 + 76) |= 0x100u;
    *(_WORD *)(v334 + 76) |= 4u;
    *(_DWORD *)(v334 + 68) = v349;
    goto LABEL_581;
  }
LABEL_612:

  if (a3) {
    v369 = @"attributeIntent";
  }
  else {
    v369 = @"attribute_intent";
  }
  v370 = [v502 objectForKeyedSubscript:v369];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v371 = [GEOPDSearchAttributeIntent alloc];
    if (v371)
    {
      v372 = v371;
      id v373 = v370;
      uint64_t v374 = [(GEOPDSearchAttributeIntent *)v372 init];
      if (v374)
      {
        v375 = [v373 objectForKeyedSubscript:@"name"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v376 = (void *)[v375 copy];
          id v377 = v376;
          *(unsigned char *)(v374 + 72) |= 8u;
          *(unsigned char *)(v374 + 72) |= 0x40u;
          objc_storeStrong((id *)(v374 + 32), v376);
        }
        if (a3) {
          v378 = @"attributeId";
        }
        else {
          v378 = @"attribute_id";
        }
        v379 = [v373 objectForKeyedSubscript:v378];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v380 = (void *)[v379 copy];
          id v381 = v380;
          *(unsigned char *)(v374 + 72) |= 2u;
          *(unsigned char *)(v374 + 72) |= 0x40u;
          objc_storeStrong((id *)(v374 + 16), v380);
        }
        if (a3) {
          v382 = @"tokenSet";
        }
        else {
          v382 = @"token_set";
        }
        v383 = [v373 objectForKeyedSubscript:v382];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v384 = [GEOPDSearchTokenSet alloc];
          if (v384) {
            v385 = (void *)-[GEOPDSearchTokenSet _initWithDictionary:isJSON:](v384, v383, a3);
          }
          else {
            v385 = 0;
          }
          id v386 = v385;
          *(unsigned char *)(v374 + 72) |= 0x20u;
          *(unsigned char *)(v374 + 72) |= 0x40u;
          objc_storeStrong((id *)(v374 + 48), v385);
        }
        if (a3) {
          v387 = @"attributeValue";
        }
        else {
          v387 = @"attribute_value";
        }
        v388 = [v373 objectForKeyedSubscript:v387];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v389 = (void *)[v388 copy];
          id v390 = v389;
          *(unsigned char *)(v374 + 72) |= 4u;
          *(unsigned char *)(v374 + 72) |= 0x40u;
          objc_storeStrong((id *)(v374 + 24), v389);
        }
        if (a3) {
          v391 = @"isOptionalAttribute";
        }
        else {
          v391 = @"is_optional_attribute";
        }
        v392 = [v373 objectForKeyedSubscript:v391];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v393 = [v392 BOOLValue];
          *(unsigned char *)(v374 + 72) |= 0x40u;
          *(unsigned char *)(v374 + 72) |= 1u;
          *(unsigned char *)(v374 + 68) = v393;
        }

        if (a3) {
          v394 = @"structuredAttribute";
        }
        else {
          v394 = @"structured_attribute";
        }
        v395 = [v373 objectForKeyedSubscript:v394];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v396 = [GEOPDSearchStructuredAttribute alloc];
          if (v396) {
            v397 = (void *)-[GEOPDSearchStructuredAttribute _initWithDictionary:isJSON:](v396, v395, a3);
          }
          else {
            v397 = 0;
          }
          id v398 = v397;
          *(unsigned char *)(v374 + 72) |= 0x10u;
          *(unsigned char *)(v374 + 72) |= 0x40u;
          objc_storeStrong((id *)(v374 + 40), v397);
        }
      }
    }
    else
    {
      uint64_t v374 = 0;
    }
    id v399 = (id)v374;
    *((_DWORD *)v512 + 37) |= 4u;
    *((_DWORD *)v512 + 37) |= 0x10000u;
    objc_storeStrong((id *)v512 + 2, (id)v374);
  }
  if (a3) {
    v400 = @"clientResolvedIntent";
  }
  else {
    v400 = @"client_resolved_intent";
  }
  v401 = [v502 objectForKeyedSubscript:v400];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v402 = [GEOPDSearchClientResolvedIntent alloc];
    if (!v402)
    {
      uint64_t v405 = 0;
      goto LABEL_685;
    }
    v403 = v402;
    id v404 = v401;
    uint64_t v405 = [(GEOPDSearchClientResolvedIntent *)v403 init];
    if (!v405)
    {
LABEL_684:

LABEL_685:
      id v413 = (id)v405;
      *((_DWORD *)v512 + 37) |= 0x40u;
      *((_DWORD *)v512 + 37) |= 0x10000u;
      objc_storeStrong((id *)v512 + 6, (id)v405);

      goto LABEL_686;
    }
    v406 = [v404 objectForKeyedSubscript:@"name"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v407 = (void *)[v406 copy];
      id v408 = v407;
      objc_storeStrong((id *)(v405 + 8), v407);
    }
    if (a3) {
      v409 = @"resolvedItemType";
    }
    else {
      v409 = @"resolved_item_type";
    }
    v410 = [v404 objectForKeyedSubscript:v409];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v411 = v410;
      if ([v411 isEqualToString:@"RESOLVED_ITEM_TYPE_UNKNOWN"])
      {
        int v412 = 0;
      }
      else if ([v411 isEqualToString:@"RESOLVED_ITEM_TYPE_HOME"])
      {
        int v412 = 1;
      }
      else if ([v411 isEqualToString:@"RESOLVED_ITEM_TYPE_WORK"])
      {
        int v412 = 2;
      }
      else if ([v411 isEqualToString:@"RESOLVED_ITEM_TYPE_PARKED_CAR"])
      {
        int v412 = 3;
      }
      else if ([v411 isEqualToString:@"RESOLVED_ITEM_TYPE_CURRENT_LOCATION"])
      {
        int v412 = 4;
      }
      else if ([v411 isEqualToString:@"RESOLVED_ITEM_TYPE_SERVER"])
      {
        int v412 = 5;
      }
      else if ([v411 isEqualToString:@"RESOLVED_ITEM_TYPE_SCHOOL"])
      {
        int v412 = 6;
      }
      else
      {
        int v412 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_683:

        goto LABEL_684;
      }
      int v412 = [v410 intValue];
    }
    *(unsigned char *)(v405 + 20) |= 1u;
    *(_DWORD *)(v405 + 16) = v412;
    goto LABEL_683;
  }
LABEL_686:

  if (a3) {
    v414 = @"searchFilterIntent";
  }
  else {
    v414 = @"search_filter_intent";
  }
  v415 = [v502 objectForKeyedSubscript:v414];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v416 = [GEOPDSearchSearchFilterIntent alloc];
    if (v416)
    {
      id v417 = v415;
      v416 = [(GEOPDSearchSearchFilterIntent *)v416 init];
      if (v416)
      {
        if (a3) {
          v418 = @"searchFilter";
        }
        else {
          v418 = @"search_filter";
        }
        v419 = [v417 objectForKeyedSubscript:v418];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v420 = [GEOPDSSearchFilter alloc];
          if (v420) {
            v421 = (void *)-[GEOPDSSearchFilter _initWithDictionary:isJSON:](v420, v419, a3);
          }
          else {
            v421 = 0;
          }
          id v422 = v421;
          objc_storeStrong((id *)&v416->_searchFilter, v421);
        }
      }
    }
    v423 = v416;
    *((_DWORD *)v512 + 37) |= 0x4000u;
    *((_DWORD *)v512 + 37) |= 0x10000u;
    objc_storeStrong((id *)v512 + 14, v416);
  }
  if (a3) {
    v424 = @"directionIntent";
  }
  else {
    v424 = @"direction_intent";
  }
  v425 = [v502 objectForKeyedSubscript:v424];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v426 = [GEOPDSearchDirectionIntent alloc];
    if (v426)
    {
      id v427 = v425;
      v426 = [(GEOPDSearchDirectionIntent *)v426 init];
      if (v426)
      {
        v428 = [v427 objectForKeyedSubscript:v424];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v429 = [GEOPDDirectionIntent alloc];
          if (v429) {
            v430 = (void *)-[GEOPDDirectionIntent _initWithDictionary:isJSON:]((uint64_t)v429, v428, a3);
          }
          else {
            v430 = 0;
          }
          id v431 = v430;
          objc_storeStrong((id *)&v426->_directionIntent, v430);
        }
      }
    }
    v432 = v426;
    *((_DWORD *)v512 + 37) |= 0x80u;
    *((_DWORD *)v512 + 37) |= 0x10000u;
    objc_storeStrong((id *)v512 + 7, v426);
  }
  if (a3) {
    v433 = @"transitIntent";
  }
  else {
    v433 = @"transit_intent";
  }
  v434 = [v502 objectForKeyedSubscript:v433];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_753;
  }
  v435 = [GEOPDSearchTransitIntent alloc];
  if (v435)
  {
    id v436 = v434;
    v435 = [(GEOPDSearchTransitIntent *)v435 init];
    if (!v435)
    {
LABEL_751:

      goto LABEL_752;
    }
    v437 = [v436 objectForKeyedSubscript:@"name"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v438 = (void *)[v437 copy];
      id v439 = v438;
      *(unsigned char *)&v435->_flags |= 4u;
      *(unsigned char *)&v435->_flags |= 0x10u;
      objc_storeStrong((id *)&v435->_name, v438);
    }
    if (a3) {
      v440 = @"tokenSet";
    }
    else {
      v440 = @"token_set";
    }
    v441 = [v436 objectForKeyedSubscript:v440];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v442 = [GEOPDSearchTokenSet alloc];
      if (v442) {
        v443 = (void *)-[GEOPDSearchTokenSet _initWithDictionary:isJSON:](v442, v441, a3);
      }
      else {
        v443 = 0;
      }
      id v444 = v443;
      *(unsigned char *)&v435->_flags |= 8u;
      *(unsigned char *)&v435->_flags |= 0x10u;
      objc_storeStrong((id *)&v435->_tokenSet, v443);
    }
    if (a3) {
      v445 = @"transitId";
    }
    else {
      v445 = @"transit_id";
    }
    v446 = [v436 objectForKeyedSubscript:v445];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v447 = [v446 unsignedLongLongValue];
      *(unsigned char *)&v435->_flags |= 0x10u;
      *(unsigned char *)&v435->_flags |= 1u;
      v435->_transitId = v447;
    }

    if (a3) {
      v448 = @"transitType";
    }
    else {
      v448 = @"transit_type";
    }
    v449 = [v436 objectForKeyedSubscript:v448];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v450 = v449;
      if ([v450 isEqualToString:@"TRANSIT_NONE"])
      {
        int v451 = 0;
      }
      else if ([v450 isEqualToString:@"TRANSIT_SYSTEM"])
      {
        int v451 = 1;
      }
      else if ([v450 isEqualToString:@"TRANSIT_BRAND"])
      {
        int v451 = 2;
      }
      else
      {
        int v451 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_750:

        goto LABEL_751;
      }
      int v451 = [v449 intValue];
    }
    *(unsigned char *)&v435->_flags |= 0x10u;
    *(unsigned char *)&v435->_flags |= 2u;
    v435->_transitType = v451;
    goto LABEL_750;
  }
LABEL_752:
  v452 = v435;
  *((_DWORD *)v512 + 37) |= 0x8000u;
  *((_DWORD *)v512 + 37) |= 0x10000u;
  objc_storeStrong((id *)v512 + 15, v435);

LABEL_753:
  if (a3) {
    v453 = @"phoneNumberIntent";
  }
  else {
    v453 = @"phone_number_intent";
  }
  v454 = [v502 objectForKeyedSubscript:v453];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v455 = [GEOPDSearchPhoneNumberIntent alloc];
    if (v455)
    {
      v456 = v455;
      id v457 = v454;
      uint64_t v458 = [(GEOPDSearchPhoneNumberIntent *)v456 init];
      if (v458)
      {
        if (a3) {
          v459 = @"phoneNumber";
        }
        else {
          v459 = @"phone_number";
        }
        v460 = [v457 objectForKeyedSubscript:v459];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v461 = (void *)[v460 copy];
          id v462 = v461;
          *(unsigned char *)(v458 + 44) |= 1u;
          *(unsigned char *)(v458 + 44) |= 4u;
          objc_storeStrong((id *)(v458 + 16), v461);
        }
        if (a3) {
          v463 = @"tokenSet";
        }
        else {
          v463 = @"token_set";
        }
        v464 = [v457 objectForKeyedSubscript:v463];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v465 = [GEOPDSearchTokenSet alloc];
          if (v465) {
            v466 = (void *)-[GEOPDSearchTokenSet _initWithDictionary:isJSON:](v465, v464, a3);
          }
          else {
            v466 = 0;
          }
          id v467 = v466;
          *(unsigned char *)(v458 + 44) |= 2u;
          *(unsigned char *)(v458 + 44) |= 4u;
          objc_storeStrong((id *)(v458 + 24), v466);
        }
      }
    }
    else
    {
      uint64_t v458 = 0;
    }
    id v468 = (id)v458;
    *((_DWORD *)v512 + 37) |= 0x1000u;
    *((_DWORD *)v512 + 37) |= 0x10000u;
    objc_storeStrong((id *)v512 + 12, (id)v458);
  }
  if (a3) {
    v469 = @"intentSpanIndex";
  }
  else {
    v469 = @"intent_span_index";
  }
  v470 = [v502 objectForKeyedSubscript:v469];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v471 = [v470 unsignedIntValue];
    *((_DWORD *)v512 + 37) |= 0x10000u;
    *((_DWORD *)v512 + 37) |= 1u;
    *((_DWORD *)v512 + 35) = v471;
  }

  if (a3) {
    v472 = @"keywordIntent";
  }
  else {
    v472 = @"keyword_intent";
  }
  v473 = [v502 objectForKeyedSubscript:v472];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v474 = [GEOPDSearchKeywordIntent alloc];
    if (v474)
    {
      v475 = v474;
      id v476 = v473;
      uint64_t v477 = [(GEOPDSearchKeywordIntent *)v475 init];
      if (v477)
      {
        v478 = [v476 objectForKeyedSubscript:@"keyword"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v479 = (void *)[v478 copy];
          id v480 = v479;
          *(unsigned char *)(v477 + 48) |= 2u;
          *(unsigned char *)(v477 + 48) |= 8u;
          objc_storeStrong((id *)(v477 + 16), v479);
        }
        if (a3) {
          v481 = @"tokenSet";
        }
        else {
          v481 = @"token_set";
        }
        v482 = [v476 objectForKeyedSubscript:v481];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v483 = [GEOPDSearchTokenSet alloc];
          if (v483) {
            v484 = (void *)-[GEOPDSearchTokenSet _initWithDictionary:isJSON:](v483, v482, a3);
          }
          else {
            v484 = 0;
          }
          id v485 = v484;
          *(unsigned char *)(v477 + 48) |= 4u;
          *(unsigned char *)(v477 + 48) |= 8u;
          objc_storeStrong((id *)(v477 + 24), v484);
        }
        if (a3) {
          v486 = @"isOptionalKeyword";
        }
        else {
          v486 = @"is_optional_keyword";
        }
        v487 = [v476 objectForKeyedSubscript:v486];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v488 = [v487 BOOLValue];
          *(unsigned char *)(v477 + 48) |= 8u;
          *(unsigned char *)(v477 + 48) |= 1u;
          *(unsigned char *)(v477 + 44) = v488;
        }
      }
    }
    else
    {
      uint64_t v477 = 0;
    }
    id v489 = (id)v477;
    *((_DWORD *)v512 + 37) |= 0x200u;
    *((_DWORD *)v512 + 37) |= 0x10000u;
    objc_storeStrong((id *)v512 + 9, (id)v477);
  }
  if (a3) {
    v490 = @"languageCode";
  }
  else {
    v490 = @"language_code";
  }
  v491 = [v502 objectForKeyedSubscript:v490];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v519 = 0u;
    long long v520 = 0u;
    long long v517 = 0u;
    long long v518 = 0u;
    id v492 = v491;
    uint64_t v493 = [v492 countByEnumeratingWithState:&v517 objects:v561 count:16];
    if (v493)
    {
      uint64_t v494 = *(void *)v518;
      do
      {
        for (uint64_t i1 = 0; i1 != v493; ++i1)
        {
          if (*(void *)v518 != v494) {
            objc_enumerationMutation(v492);
          }
          v496 = *(void **)(*((void *)&v517 + 1) + 8 * i1);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v497 = (void *)[v496 copy];
            -[GEOPDSearchIntent addLanguageCode:]((os_unfair_lock_s *)v512, v497);
          }
        }
        uint64_t v493 = [v492 countByEnumeratingWithState:&v517 objects:v561 count:16];
      }
      while (v493);
    }
  }
LABEL_817:

  return v512;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchIntentReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDSearchIntentIsDirty((uint64_t)self) & 1) == 0)
  {
    id v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchIntent readAll:]((uint64_t)self, 0);
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_categoryIntent) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_chainIntent) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_businessIntent) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_geoIntent) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_proximityIntent) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_locationIntent) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_attributeIntent) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_clientResolvedIntent) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_searchFilterIntent) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_directionIntent) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_transitIntent) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_phoneNumberIntent) {
      PBDataWriterWriteSubmessage();
    }
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_keywordIntent) {
      PBDataWriterWriteSubmessage();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v6 = self->_languageCodes;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteStringField();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  if (result)
  {
    id v3 = (uint64_t *)result;
    -[GEOPDSearchIntent _readBusinessIntent](result);
    uint64_t v4 = v3[3];
    result = 1;
    if (!v4
      || (-[GEOPDSearchBusinessIntent _readCenter](v3[3]),
          ([*(id *)(v4 + 48) hasGreenTeaWithValue:a2] & 1) == 0))
    {
      -[GEOPDSearchIntent _readGeoIntent]((uint64_t)v3);
      if ((-[GEOPDSearchGeoIntent hasGreenTeaWithValue:](v3[8], a2) & 1) == 0)
      {
        -[GEOPDSearchIntent _readLocationIntent]((uint64_t)v3);
        if ((-[GEOPDSearchLocationIntent hasGreenTeaWithValue:](v3[11], a2) & 1) == 0)
        {
          -[GEOPDSearchIntent _readSearchFilterIntent]((uint64_t)v3);
          uint64_t v5 = v3[14];
          if (!v5 || (-[GEOPDSSearchFilter hasGreenTeaWithValue:](*(void *)(v5 + 8), a2) & 1) == 0) {
            return 0;
          }
        }
      }
    }
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 2) & 1) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDSearchIntentReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      uint64_t v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_16;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchIntent readAll:]((uint64_t)self, 0);
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 144) = self->_intentType;
    *(_DWORD *)(v5 + 148) |= 2u;
  }
  id v9 = [(GEOPDSearchCategoryIntent *)self->_categoryIntent copyWithZone:a3];
  id v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  id v11 = [(GEOPDSearchChainIntent *)self->_chainIntent copyWithZone:a3];
  long long v12 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v11;

  id v13 = [(GEOPDSearchBusinessIntent *)self->_businessIntent copyWithZone:a3];
  long long v14 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v13;

  id v15 = [(GEOPDSearchGeoIntent *)self->_geoIntent copyWithZone:a3];
  id v16 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v15;

  id v17 = [(GEOPDSearchProximityIntent *)self->_proximityIntent copyWithZone:a3];
  v18 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v17;

  id v19 = [(GEOPDSearchLocationIntent *)self->_locationIntent copyWithZone:a3];
  uint64_t v20 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v19;

  id v21 = [(GEOPDSearchAttributeIntent *)self->_attributeIntent copyWithZone:a3];
  v22 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v21;

  id v23 = [(GEOPDSearchClientResolvedIntent *)self->_clientResolvedIntent copyWithZone:a3];
  id v24 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v23;

  id v25 = [(GEOPDSearchSearchFilterIntent *)self->_searchFilterIntent copyWithZone:a3];
  v26 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v25;

  id v27 = [(GEOPDSearchDirectionIntent *)self->_directionIntent copyWithZone:a3];
  v28 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v27;

  id v29 = [(GEOPDSearchTransitIntent *)self->_transitIntent copyWithZone:a3];
  id v30 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v29;

  id v31 = [(GEOPDSearchPhoneNumberIntent *)self->_phoneNumberIntent copyWithZone:a3];
  id v32 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v31;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 140) = self->_intentSpanIndex;
    *(_DWORD *)(v5 + 148) |= 1u;
  }
  id v33 = [(GEOPDSearchKeywordIntent *)self->_keywordIntent copyWithZone:a3];
  uint64_t v34 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v33;

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v8 = self->_languageCodes;
  uint64_t v35 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v35)
  {
    uint64_t v36 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v41 != v36) {
          objc_enumerationMutation(v8);
        }
        v38 = objc_msgSend(*(id *)(*((void *)&v40 + 1) + 8 * i), "copyWithZone:", a3, (void)v40);
        -[GEOPDSearchIntent addLanguageCode:]((os_unfair_lock_s *)v5, v38);
      }
      uint64_t v35 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v35);
  }
LABEL_16:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_40;
  }
  -[GEOPDSearchIntent readAll:]((uint64_t)self, 1);
  -[GEOPDSearchIntent readAll:]((uint64_t)v4, 1);
  int v5 = *((_DWORD *)v4 + 37);
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((v5 & 2) == 0 || self->_intentType != *((_DWORD *)v4 + 36)) {
      goto LABEL_40;
    }
  }
  else if ((v5 & 2) != 0)
  {
LABEL_40:
    char v21 = 0;
    goto LABEL_41;
  }
  categoryIntent = self->_categoryIntent;
  if ((unint64_t)categoryIntent | *((void *)v4 + 4)
    && !-[GEOPDSearchCategoryIntent isEqual:](categoryIntent, "isEqual:"))
  {
    goto LABEL_40;
  }
  chainIntent = self->_chainIntent;
  if ((unint64_t)chainIntent | *((void *)v4 + 5))
  {
    if (!-[GEOPDSearchChainIntent isEqual:](chainIntent, "isEqual:")) {
      goto LABEL_40;
    }
  }
  businessIntent = self->_businessIntent;
  if ((unint64_t)businessIntent | *((void *)v4 + 3))
  {
    if (!-[GEOPDSearchBusinessIntent isEqual:](businessIntent, "isEqual:")) {
      goto LABEL_40;
    }
  }
  geoIntent = self->_geoIntent;
  if ((unint64_t)geoIntent | *((void *)v4 + 8))
  {
    if (!-[GEOPDSearchGeoIntent isEqual:](geoIntent, "isEqual:")) {
      goto LABEL_40;
    }
  }
  proximityIntent = self->_proximityIntent;
  if ((unint64_t)proximityIntent | *((void *)v4 + 13))
  {
    if (!-[GEOPDSearchProximityIntent isEqual:](proximityIntent, "isEqual:")) {
      goto LABEL_40;
    }
  }
  locationIntent = self->_locationIntent;
  if ((unint64_t)locationIntent | *((void *)v4 + 11))
  {
    if (!-[GEOPDSearchLocationIntent isEqual:](locationIntent, "isEqual:")) {
      goto LABEL_40;
    }
  }
  attributeIntent = self->_attributeIntent;
  if ((unint64_t)attributeIntent | *((void *)v4 + 2))
  {
    if (!-[GEOPDSearchAttributeIntent isEqual:](attributeIntent, "isEqual:")) {
      goto LABEL_40;
    }
  }
  clientResolvedIntent = self->_clientResolvedIntent;
  if ((unint64_t)clientResolvedIntent | *((void *)v4 + 6))
  {
    if (!-[GEOPDSearchClientResolvedIntent isEqual:](clientResolvedIntent, "isEqual:")) {
      goto LABEL_40;
    }
  }
  searchFilterIntent = self->_searchFilterIntent;
  if ((unint64_t)searchFilterIntent | *((void *)v4 + 14))
  {
    if (!-[GEOPDSearchSearchFilterIntent isEqual:](searchFilterIntent, "isEqual:")) {
      goto LABEL_40;
    }
  }
  directionIntent = self->_directionIntent;
  if ((unint64_t)directionIntent | *((void *)v4 + 7))
  {
    if (!-[GEOPDSearchDirectionIntent isEqual:](directionIntent, "isEqual:")) {
      goto LABEL_40;
    }
  }
  transitIntent = self->_transitIntent;
  if ((unint64_t)transitIntent | *((void *)v4 + 15))
  {
    if (!-[GEOPDSearchTransitIntent isEqual:](transitIntent, "isEqual:")) {
      goto LABEL_40;
    }
  }
  phoneNumberIntent = self->_phoneNumberIntent;
  if ((unint64_t)phoneNumberIntent | *((void *)v4 + 12))
  {
    if (!-[GEOPDSearchPhoneNumberIntent isEqual:](phoneNumberIntent, "isEqual:")) {
      goto LABEL_40;
    }
  }
  int v18 = *((_DWORD *)v4 + 37);
  if (*(unsigned char *)&self->_flags)
  {
    if ((v18 & 1) == 0 || self->_intentSpanIndex != *((_DWORD *)v4 + 35)) {
      goto LABEL_40;
    }
  }
  else if (v18)
  {
    goto LABEL_40;
  }
  keywordIntent = self->_keywordIntent;
  if ((unint64_t)keywordIntent | *((void *)v4 + 9)
    && !-[GEOPDSearchKeywordIntent isEqual:](keywordIntent, "isEqual:"))
  {
    goto LABEL_40;
  }
  languageCodes = self->_languageCodes;
  if ((unint64_t)languageCodes | *((void *)v4 + 10)) {
    char v21 = -[NSMutableArray isEqual:](languageCodes, "isEqual:");
  }
  else {
    char v21 = 1;
  }
LABEL_41:

  return v21;
}

- (unint64_t)hash
{
  -[GEOPDSearchIntent readAll:]((uint64_t)self, 1);
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v18 = 2654435761 * self->_intentType;
  }
  else {
    uint64_t v18 = 0;
  }
  unint64_t v17 = [(GEOPDSearchCategoryIntent *)self->_categoryIntent hash];
  unint64_t v16 = [(GEOPDSearchChainIntent *)self->_chainIntent hash];
  unint64_t v15 = [(GEOPDSearchBusinessIntent *)self->_businessIntent hash];
  unint64_t v14 = [(GEOPDSearchGeoIntent *)self->_geoIntent hash];
  unint64_t v3 = [(GEOPDSearchProximityIntent *)self->_proximityIntent hash];
  unint64_t v4 = [(GEOPDSearchLocationIntent *)self->_locationIntent hash];
  unint64_t v5 = [(GEOPDSearchAttributeIntent *)self->_attributeIntent hash];
  unint64_t v6 = [(GEOPDSearchClientResolvedIntent *)self->_clientResolvedIntent hash];
  unint64_t v7 = [(GEOPDSearchSearchFilterIntent *)self->_searchFilterIntent hash];
  unint64_t v8 = [(GEOPDSearchDirectionIntent *)self->_directionIntent hash];
  unint64_t v9 = [(GEOPDSearchTransitIntent *)self->_transitIntent hash];
  unint64_t v10 = [(GEOPDSearchPhoneNumberIntent *)self->_phoneNumberIntent hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v11 = 2654435761 * self->_intentSpanIndex;
  }
  else {
    uint64_t v11 = 0;
  }
  unint64_t v12 = v9 ^ v10 ^ v11 ^ [(GEOPDSearchKeywordIntent *)self->_keywordIntent hash];
  return v17 ^ v18 ^ v16 ^ v15 ^ v14 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v12 ^ [(NSMutableArray *)self->_languageCodes hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitIntent, 0);
  objc_storeStrong((id *)&self->_searchFilterIntent, 0);
  objc_storeStrong((id *)&self->_proximityIntent, 0);
  objc_storeStrong((id *)&self->_phoneNumberIntent, 0);
  objc_storeStrong((id *)&self->_locationIntent, 0);
  objc_storeStrong((id *)&self->_languageCodes, 0);
  objc_storeStrong((id *)&self->_keywordIntent, 0);
  objc_storeStrong((id *)&self->_geoIntent, 0);
  objc_storeStrong((id *)&self->_directionIntent, 0);
  objc_storeStrong((id *)&self->_clientResolvedIntent, 0);
  objc_storeStrong((id *)&self->_chainIntent, 0);
  objc_storeStrong((id *)&self->_categoryIntent, 0);
  objc_storeStrong((id *)&self->_businessIntent, 0);
  objc_storeStrong((id *)&self->_attributeIntent, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end