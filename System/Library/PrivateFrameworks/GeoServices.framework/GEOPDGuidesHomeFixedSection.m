@interface GEOPDGuidesHomeFixedSection
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDGuidesHomeFixedSection)init;
- (GEOPDGuidesHomeFixedSection)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)browseByInterestFilters;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)featuredGuideIds;
- (id)filteredGuideIds;
- (id)jsonRepresentation;
- (id)name;
- (uint64_t)_initWithDictionary:(uint64_t)a3 isJSON:;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)a1;
- (uint64_t)sectionType;
- (unint64_t)hash;
- (void)_addNoFlagsBrowseByInterestFilter:(uint64_t)a1;
- (void)_addNoFlagsFeaturedGuideId:(uint64_t)a1;
- (void)_addNoFlagsFilteredGuideId:(uint64_t)a1;
- (void)_readBrowseByInterestFilters;
- (void)_readFeaturedGuideIds;
- (void)_readFilteredGuideIds;
- (void)_readName;
- (void)addBrowseByInterestFilter:(uint64_t)a1;
- (void)addFeaturedGuideId:(uint64_t)a1;
- (void)addFilteredGuideId:(uint64_t)a1;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)mergeFrom:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setName:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDGuidesHomeFixedSection

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDGuidesHomeFixedSection readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 72))
    {
      uint64_t v5 = *(int *)(a1 + 68);
      if (v5 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 68));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E53DCAE0[v5];
      }
      if (a2) {
        v7 = @"sectionType";
      }
      else {
        v7 = @"section_type";
      }
      [v4 setObject:v6 forKey:v7];
    }
    v8 = -[GEOPDGuidesHomeFixedSection name]((id *)a1);
    if (v8) {
      [v4 setObject:v8 forKey:@"name"];
    }

    if ([*(id *)(a1 + 32) count])
    {
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v10 = *(id *)(a1 + 32);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v53 objects:v59 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v54;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v54 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v53 + 1) + 8 * i);
            if (a2) {
              [v15 jsonRepresentation];
            }
            else {
            v16 = [v15 dictionaryRepresentation];
            }
            [v9 addObject:v16];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v53 objects:v59 count:16];
        }
        while (v12);
      }

      if (a2) {
        v17 = @"featuredGuideId";
      }
      else {
        v17 = @"featured_guide_id";
      }
      [v4 setObject:v9 forKey:v17];
    }
    if ([*(id *)(a1 + 24) count])
    {
      v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v19 = *(id *)(a1 + 24);
      uint64_t v20 = [v19 countByEnumeratingWithState:&v49 objects:v58 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v50;
        do
        {
          for (uint64_t j = 0; j != v21; ++j)
          {
            if (*(void *)v50 != v22) {
              objc_enumerationMutation(v19);
            }
            v24 = *(void **)(*((void *)&v49 + 1) + 8 * j);
            if (a2) {
              [v24 jsonRepresentation];
            }
            else {
            v25 = [v24 dictionaryRepresentation];
            }
            [v18 addObject:v25];
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v49 objects:v58 count:16];
        }
        while (v21);
      }

      if (a2) {
        v26 = @"browseByInterestFilter";
      }
      else {
        v26 = @"browse_by_interest_filter";
      }
      [v4 setObject:v18 forKey:v26];
    }
    if ([*(id *)(a1 + 40) count])
    {
      v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v28 = *(id *)(a1 + 40);
      uint64_t v29 = [v28 countByEnumeratingWithState:&v45 objects:v57 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v46;
        do
        {
          for (uint64_t k = 0; k != v30; ++k)
          {
            if (*(void *)v46 != v31) {
              objc_enumerationMutation(v28);
            }
            v33 = *(void **)(*((void *)&v45 + 1) + 8 * k);
            if (a2) {
              [v33 jsonRepresentation];
            }
            else {
            v34 = [v33 dictionaryRepresentation];
            }
            [v27 addObject:v34];
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v45 objects:v57 count:16];
        }
        while (v30);
      }

      if (a2) {
        v35 = @"filteredGuideId";
      }
      else {
        v35 = @"filtered_guide_id";
      }
      [v4 setObject:v27 forKey:v35];
    }
    v36 = *(void **)(a1 + 16);
    if (v36)
    {
      v37 = [v36 dictionaryRepresentation];
      v38 = v37;
      if (a2)
      {
        v39 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v37, "count"));
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __57__GEOPDGuidesHomeFixedSection__dictionaryRepresentation___block_invoke;
        v43[3] = &unk_1E53D8860;
        id v40 = v39;
        id v44 = v40;
        [v38 enumerateKeysAndObjectsUsingBlock:v43];
        id v41 = v40;

        v38 = v41;
      }
      [v4 setObject:v38 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (GEOPDGuidesHomeFixedSection)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDGuidesHomeFixedSection;
  v2 = [(GEOPDGuidesHomeFixedSection *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDGuidesHomeFixedSection)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDGuidesHomeFixedSection;
  v3 = [(GEOPDGuidesHomeFixedSection *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (uint64_t)sectionType
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    char v2 = *(unsigned char *)(v1 + 72);
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

- (void)_readName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 0x20) == 0)
    {
      char v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDGuidesHomeFixedSectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readName_tags_3086);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)name
{
  if (a1)
  {
    char v2 = a1;
    -[GEOPDGuidesHomeFixedSection _readName]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setName:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 72) |= 0x20u;
  *(unsigned char *)(a1 + 72) |= 0x40u;
  objc_storeStrong((id *)(a1 + 48), a2);
}

- (void)_readFeaturedGuideIds
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 8) == 0)
    {
      char v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDGuidesHomeFixedSectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFeaturedGuideIds_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)featuredGuideIds
{
  if (a1)
  {
    char v2 = a1;
    -[GEOPDGuidesHomeFixedSection _readFeaturedGuideIds]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addFeaturedGuideId:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDGuidesHomeFixedSection _readFeaturedGuideIds](a1);
    -[GEOPDGuidesHomeFixedSection _addNoFlagsFeaturedGuideId:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 72) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(unsigned char *)(a1 + 72) |= 0x40u;
  }
}

- (void)_addNoFlagsFeaturedGuideId:(uint64_t)a1
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

- (void)_readBrowseByInterestFilters
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 4) == 0)
    {
      char v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDGuidesHomeFixedSectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBrowseByInterestFilters_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)browseByInterestFilters
{
  if (a1)
  {
    char v2 = a1;
    -[GEOPDGuidesHomeFixedSection _readBrowseByInterestFilters]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addBrowseByInterestFilter:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDGuidesHomeFixedSection _readBrowseByInterestFilters](a1);
    -[GEOPDGuidesHomeFixedSection _addNoFlagsBrowseByInterestFilter:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 72) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(unsigned char *)(a1 + 72) |= 0x40u;
  }
}

- (void)_addNoFlagsBrowseByInterestFilter:(uint64_t)a1
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

- (void)_readFilteredGuideIds
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 0x10) == 0)
    {
      char v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDGuidesHomeFixedSectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFilteredGuideIds_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)filteredGuideIds
{
  if (a1)
  {
    char v2 = a1;
    -[GEOPDGuidesHomeFixedSection _readFilteredGuideIds]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addFilteredGuideId:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDGuidesHomeFixedSection _readFilteredGuideIds](a1);
    -[GEOPDGuidesHomeFixedSection _addNoFlagsFilteredGuideId:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 72) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(unsigned char *)(a1 + 72) |= 0x40u;
  }
}

- (void)_addNoFlagsFilteredGuideId:(uint64_t)a1
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

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDGuidesHomeFixedSection;
  id v4 = [(GEOPDGuidesHomeFixedSection *)&v8 description];
  id v5 = [(GEOPDGuidesHomeFixedSection *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDGuidesHomeFixedSection _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)jsonRepresentation
{
  return -[GEOPDGuidesHomeFixedSection _dictionaryRepresentation:]((uint64_t)self, 1);
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
        objc_super v6 = (int *)&readAll__recursiveTag_3112;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_3113;
      }
      GEOPDGuidesHomeFixedSectionReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDGuidesHomeFixedSectionCallReadAllRecursiveWithoutSynchronized((id *)a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __57__GEOPDGuidesHomeFixedSection__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (uint64_t)_initWithDictionary:(uint64_t)a3 isJSON:
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = [a1 init];
  if (!v6) {
    goto LABEL_74;
  }
  if (a3) {
    id v7 = @"sectionType";
  }
  else {
    id v7 = @"section_type";
  }
  objc_super v8 = [v5 objectForKeyedSubscript:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
    if ([v9 isEqualToString:@"GUIDES_HOME_FIXED_SECTION_TYPE_UNKNOWN"])
    {
      int v10 = 0;
    }
    else if ([v9 isEqualToString:@"GUIDES_HOME_FIXED_SECTION_TYPE_FEATURED_GUIDES"])
    {
      int v10 = 1;
    }
    else if ([v9 isEqualToString:@"GUIDES_HOME_FIXED_SECTION_TYPE_FILTERS"])
    {
      int v10 = 2;
    }
    else if ([v9 isEqualToString:@"GUIDES_HOME_FIXED_SECTION_TYPE_FILTERED_GUIDES"])
    {
      int v10 = 3;
    }
    else
    {
      int v10 = 0;
    }

    goto LABEL_18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v10 = [v8 intValue];
LABEL_18:
    *(unsigned char *)(v6 + 72) |= 0x40u;
    *(unsigned char *)(v6 + 72) |= 1u;
    *(_DWORD *)(v6 + 68) = v10;
  }

  uint64_t v11 = [v5 objectForKeyedSubscript:@"name"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = (void *)[v11 copy];
    -[GEOPDGuidesHomeFixedSection setName:](v6, v12);
  }
  if (a3) {
    uint64_t v13 = @"featuredGuideId";
  }
  else {
    uint64_t v13 = @"featured_guide_id";
  }
  v14 = [v5 objectForKeyedSubscript:v13];
  objc_opt_class();
  id v47 = v5;
  if (objc_opt_isKindOfClass())
  {
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v15 = v14;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v56 objects:v62 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v57 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v56 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v21 = [GEOPDMapsIdentifier alloc];
            if (a3) {
              uint64_t v22 = [(GEOPDMapsIdentifier *)v21 initWithJSON:v20];
            }
            else {
              uint64_t v22 = [(GEOPDMapsIdentifier *)v21 initWithDictionary:v20];
            }
            v23 = v22;
            -[GEOPDGuidesHomeFixedSection addFeaturedGuideId:](v6, v22);
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v56 objects:v62 count:16];
      }
      while (v17);
    }

    id v5 = v47;
  }

  if (a3) {
    v24 = @"browseByInterestFilter";
  }
  else {
    v24 = @"browse_by_interest_filter";
  }
  v25 = [v5 objectForKeyedSubscript:v24];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v26 = v25;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v52 objects:v61 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v53;
      do
      {
        uint64_t v30 = 0;
        do
        {
          if (*(void *)v53 != v29) {
            objc_enumerationMutation(v26);
          }
          uint64_t v31 = *(void **)(*((void *)&v52 + 1) + 8 * v30);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v32 = [GEOPDGuidesHomeResultFilter alloc];
            if (v32) {
              v33 = (void *)-[GEOPDGuidesHomeResultFilter _initWithDictionary:isJSON:](v32, v31, a3);
            }
            else {
              v33 = 0;
            }
            -[GEOPDGuidesHomeFixedSection addBrowseByInterestFilter:](v6, v33);
          }
          ++v30;
        }
        while (v28 != v30);
        uint64_t v34 = [v26 countByEnumeratingWithState:&v52 objects:v61 count:16];
        uint64_t v28 = v34;
      }
      while (v34);
    }

    id v5 = v47;
  }

  if (a3) {
    v35 = @"filteredGuideId";
  }
  else {
    v35 = @"filtered_guide_id";
  }
  v36 = [v5 objectForKeyedSubscript:v35];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v37 = v36;
    uint64_t v38 = [v37 countByEnumeratingWithState:&v48 objects:v60 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v49;
      do
      {
        for (uint64_t j = 0; j != v39; ++j)
        {
          if (*(void *)v49 != v40) {
            objc_enumerationMutation(v37);
          }
          uint64_t v42 = *(void *)(*((void *)&v48 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v43 = [GEOPDMapsIdentifier alloc];
            if (a3) {
              id v44 = [(GEOPDMapsIdentifier *)v43 initWithJSON:v42];
            }
            else {
              id v44 = [(GEOPDMapsIdentifier *)v43 initWithDictionary:v42];
            }
            long long v45 = v44;
            -[GEOPDGuidesHomeFixedSection addFilteredGuideId:](v6, v44);
          }
        }
        uint64_t v39 = [v37 countByEnumeratingWithState:&v48 objects:v60 count:16];
      }
      while (v39);
    }

    id v5 = v47;
  }

LABEL_74:
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDGuidesHomeFixedSectionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x7C) == 0))
  {
    uint64_t v18 = self->_reader;
    objc_sync_enter(v18);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v19 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v19];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v18);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDGuidesHomeFixedSection readAll:]((uint64_t)self, 0);
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_name) {
      PBDataWriterWriteStringField();
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v6 = self->_featuredGuideIds;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v29;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v29 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v7);
    }

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    int v10 = self->_browseByInterestFilters;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v25;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
      }
      while (v11);
    }

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v14 = self->_filteredGuideIds;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v20 objects:v32 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v21;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v14);
          }
          PBDataWriterWriteSubmessage();
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v20 objects:v32 count:16];
      }
      while (v15);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v20);
  }
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)a1
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  -[GEOPDGuidesHomeFixedSection _readFeaturedGuideIds](a1);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
LABEL_4:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v20 != v7) {
        objc_enumerationMutation(v4);
      }
      if ([*(id *)(*((void *)&v19 + 1) + 8 * v8) hasGreenTeaWithValue:a2]) {
        goto LABEL_19;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
        if (v6) {
          goto LABEL_4;
        }
        break;
      }
    }
  }

  -[GEOPDGuidesHomeFixedSection _readFilteredGuideIds](a1);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = *(id *)(a1 + 40);
  uint64_t v9 = [v4 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
LABEL_12:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v16 != v11) {
        objc_enumerationMutation(v4);
      }
      if (objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "hasGreenTeaWithValue:", a2, (void)v15)) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v4 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v10) {
          goto LABEL_12;
        }
        goto LABEL_18;
      }
    }
LABEL_19:
    uint64_t v13 = 1;
    goto LABEL_20;
  }
LABEL_18:
  uint64_t v13 = 0;
LABEL_20:

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x40) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDGuidesHomeFixedSectionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_29;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDGuidesHomeFixedSection readAll:]((uint64_t)self, 0);
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 68) = self->_sectionType;
    *(unsigned char *)(v5 + 72) |= 1u;
  }
  uint64_t v9 = [(NSString *)self->_name copyWithZone:a3];
  uint64_t v10 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v9;

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v11 = self->_featuredGuideIds;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v37 != v13) {
          objc_enumerationMutation(v11);
        }
        long long v15 = (void *)[*(id *)(*((void *)&v36 + 1) + 8 * i) copyWithZone:a3];
        -[GEOPDGuidesHomeFixedSection addFeaturedGuideId:](v5, v15);
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v12);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v16 = self->_browseByInterestFilters;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v33 != v18) {
          objc_enumerationMutation(v16);
        }
        long long v20 = (void *)[*(id *)(*((void *)&v32 + 1) + 8 * j) copyWithZone:a3];
        -[GEOPDGuidesHomeFixedSection addBrowseByInterestFilter:](v5, v20);
      }
      uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v32 objects:v41 count:16];
    }
    while (v17);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v21 = self->_filteredGuideIds;
  uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v28 objects:v40 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v29;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v29 != v23) {
          objc_enumerationMutation(v21);
        }
        uint64_t v25 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * k), "copyWithZone:", a3, (void)v28);
        -[GEOPDGuidesHomeFixedSection addFilteredGuideId:](v5, v25);
      }
      uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v28 objects:v40 count:16];
    }
    while (v22);
  }

  long long v26 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v26;
LABEL_29:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  -[GEOPDGuidesHomeFixedSection readAll:]((uint64_t)self, 1);
  -[GEOPDGuidesHomeFixedSection readAll:]((uint64_t)v4, 1);
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 72) & 1) == 0 || self->_sectionType != *((_DWORD *)v4 + 17)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 72))
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 6) && !-[NSString isEqual:](name, "isEqual:")) {
    goto LABEL_15;
  }
  featuredGuideIds = self->_featuredGuideIds;
  if ((unint64_t)featuredGuideIds | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](featuredGuideIds, "isEqual:")) {
      goto LABEL_15;
    }
  }
  browseByInterestFilters = self->_browseByInterestFilters;
  if ((unint64_t)browseByInterestFilters | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](browseByInterestFilters, "isEqual:")) {
      goto LABEL_15;
    }
  }
  filteredGuideIds = self->_filteredGuideIds;
  if ((unint64_t)filteredGuideIds | *((void *)v4 + 5)) {
    char v9 = -[NSMutableArray isEqual:](filteredGuideIds, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  -[GEOPDGuidesHomeFixedSection readAll:]((uint64_t)self, 1);
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_sectionType;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_name hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_featuredGuideIds hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_browseByInterestFilters hash];
  return v6 ^ [(NSMutableArray *)self->_filteredGuideIds hash];
}

- (void)mergeFrom:(uint64_t)a1
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  -[GEOPDGuidesHomeFixedSection readAll:]((uint64_t)v3, 0);
  if (*((unsigned char *)v3 + 72))
  {
    *(_DWORD *)(a1 + 68) = *((_DWORD *)v3 + 17);
    *(unsigned char *)(a1 + 72) |= 1u;
  }
  NSUInteger v4 = (void *)*((void *)v3 + 6);
  if (v4) {
    -[GEOPDGuidesHomeFixedSection setName:](a1, v4);
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = *((id *)v3 + 4);
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
        -[GEOPDGuidesHomeFixedSection addFeaturedGuideId:](a1, *(void **)(*((void *)&v28 + 1) + 8 * v9++));
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
  id v10 = *((id *)v3 + 3);
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
        -[GEOPDGuidesHomeFixedSection addBrowseByInterestFilter:](a1, *(void **)(*((void *)&v24 + 1) + 8 * v14++));
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
  id v15 = *((id *)v3 + 5);
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
        -[GEOPDGuidesHomeFixedSection addFilteredGuideId:](a1, *(void **)(*((void *)&v20 + 1) + 8 * v19++));
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }
}

- (void)clearUnknownFields:(uint64_t)a1
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 72) |= 2u;
    *(unsigned char *)(a1 + 72) |= 0x40u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    char v2 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    -[GEOPDGuidesHomeFixedSection readAll:](a1, 0);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v3 = *(id *)(a1 + 32);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v27;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v27 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v26 + 1) + 8 * v7++) clearUnknownFields:1];
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v26 objects:v32 count:16];
      }
      while (v5);
    }

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v8 = *(id *)(a1 + 24);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v31 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v23;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v8);
          }
          -[GEOPDGuidesHomeResultFilter clearUnknownFields:](*(void *)(*((void *)&v22 + 1) + 8 * v12++));
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v31 count:16];
      }
      while (v10);
    }

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v13 = *(id *)(a1 + 40);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v30 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v19;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v19 != v16) {
            objc_enumerationMutation(v13);
          }
          objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v17++), "clearUnknownFields:", 1, (void)v18);
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v30 count:16];
      }
      while (v15);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_filteredGuideIds, 0);
  objc_storeStrong((id *)&self->_featuredGuideIds, 0);
  objc_storeStrong((id *)&self->_browseByInterestFilters, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end