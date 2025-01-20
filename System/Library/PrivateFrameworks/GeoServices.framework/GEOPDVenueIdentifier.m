@interface GEOPDVenueIdentifier
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDVenueIdentifier)init;
- (GEOPDVenueIdentifier)initWithData:(id)a3;
- (GEOPDVenueIdentifier)initWithIdentifier:(id)a3;
- (GEOPDVenueIdentifier)initWithVenueID:(unint64_t)a3 featureID:(unint64_t)a4 businessID:(unint64_t)a5;
- (GEOPDVenueIdentifier)initWithVenueID:(unint64_t)a3 featureID:(unint64_t)a4 businessID:(unint64_t)a5 componentIdentifier:(id)a6;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (uint64_t)sectionIdAtIndex:(uint64_t)result;
- (unint64_t)hash;
- (void)_readContainedBys;
- (void)_readSectionIds;
- (void)addContainedBy:(uint64_t)a1;
- (void)addSectionId:(uint64_t)a1;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)dealloc;
- (void)mergeFrom:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDVenueIdentifier

- (GEOPDVenueIdentifier)initWithVenueID:(unint64_t)a3 featureID:(unint64_t)a4 businessID:(unint64_t)a5
{
  result = [(GEOPDVenueIdentifier *)self init];
  if (a3 && result)
  {
    *(_WORD *)&result->_flags |= 0x1000u;
    *(_WORD *)&result->_flags |= 0x80u;
    result->_venueId = a3;
    *(_WORD *)&result->_flags |= 0x1000u;
    *(_WORD *)&result->_flags |= 0x80u;
  }
  if (a4 && result)
  {
    *(_WORD *)&result->_flags |= 0x1000u;
    *(_WORD *)&result->_flags |= 2u;
    result->_featureId = a4;
    *(_WORD *)&result->_flags |= 0x1000u;
    *(_WORD *)&result->_flags |= 2u;
  }
  if (a5)
  {
    if (result)
    {
      *(_WORD *)&result->_flags |= 0x1000u;
      *(_WORD *)&result->_flags |= 8u;
      result->_geminiId = a5;
      *(_WORD *)&result->_flags |= 0x1000u;
      *(_WORD *)&result->_flags |= 8u;
    }
  }
  return result;
}

- (GEOPDVenueIdentifier)initWithVenueID:(unint64_t)a3 featureID:(unint64_t)a4 businessID:(unint64_t)a5 componentIdentifier:(id)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  v11 = [(GEOPDVenueIdentifier *)self initWithVenueID:a3 featureID:a4 businessID:a5];
  uint64_t v12 = (uint64_t)v11;
  if (v10 && v11)
  {
    uint64_t v13 = [v10 buildingID];
    *(_WORD *)(v12 + 152) |= 0x1000u;
    *(_WORD *)(v12 + 152) |= 1u;
    *(void *)(v12 + 72) = v13;
    __int16 v14 = [v10 _hasBuildingID];
    *(_WORD *)(v12 + 152) |= 0x1000u;
    *(_WORD *)(v12 + 152) = *(_WORD *)(v12 + 152) & 0xFFFE | v14;
    v15 = [v10 floorInfo];
    uint64_t v16 = [v15 levelID];
    *(_WORD *)(v12 + 152) |= 0x1000u;
    *(_WORD *)(v12 + 152) |= 0x10u;
    *(void *)(v12 + 104) = v16;

    v17 = [v10 floorInfo];
    *(_WORD *)(v12 + 152) |= 0x1000u;
    *(_WORD *)(v12 + 152) = *(_WORD *)(v12 + 152) & 0xFFEF | (16 * (v17 != 0));

    v18 = [v10 floorInfo];
    int v19 = [v18 ordinal];
    *(_WORD *)(v12 + 152) |= 0x1000u;
    *(_WORD *)(v12 + 152) |= 0x100u;
    *(_DWORD *)(v12 + 148) = v19;

    v20 = [v10 floorInfo];
    *(_WORD *)(v12 + 152) |= 0x1000u;
    *(_WORD *)(v12 + 152) = *(_WORD *)(v12 + 152) & 0xFEFF | ((v20 != 0) << 8);

    uint64_t v21 = [v10 unitID];
    *(_WORD *)(v12 + 152) |= 0x1000u;
    *(_WORD *)(v12 + 152) |= 0x20u;
    *(void *)(v12 + 112) = v21;
    int v22 = [v10 _hasUnitID];
    *(_WORD *)(v12 + 152) |= 0x1000u;
    if (v22) {
      __int16 v23 = 32;
    }
    else {
      __int16 v23 = 0;
    }
    *(_WORD *)(v12 + 152) = *(_WORD *)(v12 + 152) & 0xFFDF | v23;
    uint64_t v24 = [v10 fixtureID];
    *(_WORD *)(v12 + 152) |= 0x1000u;
    *(_WORD *)(v12 + 152) |= 4u;
    *(void *)(v12 + 88) = v24;
    int v25 = [v10 _hasFixtureID];
    *(_WORD *)(v12 + 152) |= 0x1000u;
    if (v25) {
      __int16 v26 = 4;
    }
    else {
      __int16 v26 = 0;
    }
    *(_WORD *)(v12 + 152) = *(_WORD *)(v12 + 152) & 0xFFFB | v26;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v27 = objc_msgSend(v10, "sectionIDs", 0);
    uint64_t v28 = [v27 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v34 != v30) {
            objc_enumerationMutation(v27);
          }
          [*(id *)(*((void *)&v33 + 1) + 8 * i) unsignedLongLongValue];
          -[GEOPDVenueIdentifier addSectionId:](v12);
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v29);
    }
  }
  return (GEOPDVenueIdentifier *)v12;
}

- (GEOPDVenueIdentifier)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [v4 componentIdentifiers];
  uint64_t v6 = [v5 count];

  uint64_t v7 = [v4 venueID];
  uint64_t v8 = [v4 featureID];
  uint64_t v9 = [v4 businessID];
  if (v6)
  {
    id v10 = [v4 componentIdentifiers];

    v11 = [v10 firstObject];
    uint64_t v12 = [(GEOPDVenueIdentifier *)self initWithVenueID:v7 featureID:v8 businessID:v9 componentIdentifier:v11];
  }
  else
  {

    uint64_t v12 = [(GEOPDVenueIdentifier *)self initWithVenueID:v7 featureID:v8 businessID:v9];
  }

  return v12;
}

- (GEOPDVenueIdentifier)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDVenueIdentifier;
  v2 = [(GEOPDVenueIdentifier *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOPDVenueIdentifier)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDVenueIdentifier;
  v3 = [(GEOPDVenueIdentifier *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedUInt64Clear();
  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDVenueIdentifier;
  [(GEOPDVenueIdentifier *)&v3 dealloc];
}

- (void)_readSectionIds
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_WORD *)(a1 + 152) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDVenueIdentifierReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSectionIds_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (void)addSectionId:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDVenueIdentifier _readSectionIds](a1);
    PBRepeatedUInt64Add();
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 152) |= 0x800u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
    *(_WORD *)(a1 + 152) |= 0x1000u;
  }
}

- (uint64_t)sectionIdAtIndex:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPDVenueIdentifier _readSectionIds](result);
    unint64_t v4 = *(void *)(v3 + 56);
    if (v4 <= a2)
    {
      v5 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v6 = *MEMORY[0x1E4F1C4A8];
      objc_super v7 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a2, v4);
      uint64_t v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];
      [v8 raise];
    }
    return *(void *)(*(void *)(v3 + 48) + 8 * a2);
  }
  return result;
}

- (void)_readContainedBys
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_WORD *)(a1 + 152) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDVenueIdentifierReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readContainedBys_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (void)addContainedBy:(uint64_t)a1
{
  *(_WORD *)(a1 + 152) |= 0x400u;
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  *(_WORD *)(a1 + 152) |= 0x1000u;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDVenueIdentifier;
  unint64_t v4 = [(GEOPDVenueIdentifier *)&v8 description];
  v5 = [(GEOPDVenueIdentifier *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDVenueIdentifier _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    unint64_t v4 = 0;
    goto LABEL_41;
  }
  -[GEOPDVenueIdentifier readAll:](a1, 1);
  unint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 v5 = *(_WORD *)(a1 + 152);
  if ((v5 & 0x80) != 0)
  {
    v27 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 128)];
    if (a2) {
      uint64_t v28 = @"venueId";
    }
    else {
      uint64_t v28 = @"venue_id";
    }
    [v4 setObject:v27 forKey:v28];

    __int16 v5 = *(_WORD *)(a1 + 152);
    if ((v5 & 1) == 0)
    {
LABEL_4:
      if ((v5 & 0x10) == 0) {
        goto LABEL_9;
      }
      goto LABEL_5;
    }
  }
  else if ((v5 & 1) == 0)
  {
    goto LABEL_4;
  }
  uint64_t v29 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 72)];
  if (a2) {
    uint64_t v30 = @"buildingId";
  }
  else {
    uint64_t v30 = @"building_id";
  }
  [v4 setObject:v29 forKey:v30];

  if ((*(_WORD *)(a1 + 152) & 0x10) != 0)
  {
LABEL_5:
    uint64_t v6 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 104)];
    if (a2) {
      objc_super v7 = @"levelId";
    }
    else {
      objc_super v7 = @"level_id";
    }
    [v4 setObject:v6 forKey:v7];
  }
LABEL_9:
  if (*(void *)(a1 + 56))
  {
    objc_super v8 = PBRepeatedUInt64NSArray();
    if (a2) {
      uint64_t v9 = @"sectionId";
    }
    else {
      uint64_t v9 = @"section_id";
    }
    [v4 setObject:v8 forKey:v9];
  }
  __int16 v10 = *(_WORD *)(a1 + 152);
  if ((v10 & 0x20) != 0)
  {
    v31 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 112)];
    if (a2) {
      v32 = @"unitId";
    }
    else {
      v32 = @"unit_id";
    }
    [v4 setObject:v31 forKey:v32];

    __int16 v10 = *(_WORD *)(a1 + 152);
    if ((v10 & 4) == 0)
    {
LABEL_16:
      if ((v10 & 0x100) == 0) {
        goto LABEL_17;
      }
LABEL_61:
      long long v35 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 148)];
      if (a2) {
        long long v36 = @"levelOrdinal";
      }
      else {
        long long v36 = @"level_ordinal";
      }
      [v4 setObject:v35 forKey:v36];

      if ((*(_WORD *)(a1 + 152) & 2) == 0) {
        goto LABEL_22;
      }
      goto LABEL_18;
    }
  }
  else if ((v10 & 4) == 0)
  {
    goto LABEL_16;
  }
  long long v33 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 88)];
  if (a2) {
    long long v34 = @"fixtureId";
  }
  else {
    long long v34 = @"fixture_id";
  }
  [v4 setObject:v33 forKey:v34];

  __int16 v10 = *(_WORD *)(a1 + 152);
  if ((v10 & 0x100) != 0) {
    goto LABEL_61;
  }
LABEL_17:
  if ((v10 & 2) != 0)
  {
LABEL_18:
    v11 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 80)];
    if (a2) {
      uint64_t v12 = @"featureId";
    }
    else {
      uint64_t v12 = @"feature_id";
    }
    [v4 setObject:v11 forKey:v12];
  }
LABEL_22:
  if (*(void *)(a1 + 32))
  {
    uint64_t v13 = PBRepeatedUInt64NSArray();
    if (a2) {
      __int16 v14 = @"containedBy";
    }
    else {
      __int16 v14 = @"contained_by";
    }
    [v4 setObject:v13 forKey:v14];
  }
  __int16 v15 = *(_WORD *)(a1 + 152);
  if ((v15 & 8) != 0)
  {
    uint64_t v16 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 96)];
    if (a2) {
      v17 = @"geminiId";
    }
    else {
      v17 = @"gemini_id";
    }
    [v4 setObject:v16 forKey:v17];

    __int16 v15 = *(_WORD *)(a1 + 152);
  }
  if ((v15 & 0x40) != 0)
  {
    v18 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 120)];
    if (a2) {
      int v19 = @"venueGeminiId";
    }
    else {
      int v19 = @"venue_gemini_id";
    }
    [v4 setObject:v18 forKey:v19];
  }
  v20 = *(void **)(a1 + 16);
  if (v20)
  {
    uint64_t v21 = [v20 dictionaryRepresentation];
    int v22 = v21;
    if (a2)
    {
      __int16 v23 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v21, "count"));
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __50__GEOPDVenueIdentifier__dictionaryRepresentation___block_invoke;
      v37[3] = &unk_1E53D8860;
      id v24 = v23;
      id v38 = v24;
      [v22 enumerateKeysAndObjectsUsingBlock:v37];
      id v25 = v24;

      int v22 = v25;
    }
    [v4 setObject:v22 forKey:@"Unknown Fields"];
  }
LABEL_41:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDVenueIdentifier _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    unint64_t v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        uint64_t v6 = (int *)&readAll__recursiveTag_67;
      }
      else {
        uint64_t v6 = (int *)&readAll__nonRecursiveTag_67;
      }
      GEOPDVenueIdentifierReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

void __50__GEOPDVenueIdentifier__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
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
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = [(id)a1 init];
    if (a1)
    {
      if (a3) {
        uint64_t v6 = @"venueId";
      }
      else {
        uint64_t v6 = @"venue_id";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v8 = [v7 unsignedLongLongValue];
        *(_WORD *)(a1 + 152) |= 0x1000u;
        *(_WORD *)(a1 + 152) |= 0x80u;
        *(void *)(a1 + 128) = v8;
      }

      if (a3) {
        uint64_t v9 = @"buildingId";
      }
      else {
        uint64_t v9 = @"building_id";
      }
      id v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v11 = [v10 unsignedLongLongValue];
        *(_WORD *)(a1 + 152) |= 0x1000u;
        *(_WORD *)(a1 + 152) |= 1u;
        *(void *)(a1 + 72) = v11;
      }

      if (a3) {
        uint64_t v12 = @"levelId";
      }
      else {
        uint64_t v12 = @"level_id";
      }
      uint64_t v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v14 = [v13 unsignedLongLongValue];
        *(_WORD *)(a1 + 152) |= 0x1000u;
        *(_WORD *)(a1 + 152) |= 0x10u;
        *(void *)(a1 + 104) = v14;
      }

      if (a3) {
        __int16 v15 = @"sectionId";
      }
      else {
        __int16 v15 = @"section_id";
      }
      uint64_t v16 = [v5 objectForKeyedSubscript:v15];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        id v17 = v16;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v54 objects:v59 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v55;
          do
          {
            uint64_t v21 = 0;
            do
            {
              if (*(void *)v55 != v20) {
                objc_enumerationMutation(v17);
              }
              int v22 = *(void **)(*((void *)&v54 + 1) + 8 * v21);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v22 unsignedLongLongValue];
                -[GEOPDVenueIdentifier addSectionId:](a1);
              }
              ++v21;
            }
            while (v19 != v21);
            uint64_t v19 = [v17 countByEnumeratingWithState:&v54 objects:v59 count:16];
          }
          while (v19);
        }
      }
      if (a3) {
        __int16 v23 = @"unitId";
      }
      else {
        __int16 v23 = @"unit_id";
      }
      id v24 = [v5 objectForKeyedSubscript:v23];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v25 = [v24 unsignedLongLongValue];
        *(_WORD *)(a1 + 152) |= 0x1000u;
        *(_WORD *)(a1 + 152) |= 0x20u;
        *(void *)(a1 + 112) = v25;
      }

      if (a3) {
        __int16 v26 = @"fixtureId";
      }
      else {
        __int16 v26 = @"fixture_id";
      }
      v27 = [v5 objectForKeyedSubscript:v26];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v28 = [v27 unsignedLongLongValue];
        *(_WORD *)(a1 + 152) |= 0x1000u;
        *(_WORD *)(a1 + 152) |= 4u;
        *(void *)(a1 + 88) = v28;
      }

      if (a3) {
        uint64_t v29 = @"levelOrdinal";
      }
      else {
        uint64_t v29 = @"level_ordinal";
      }
      uint64_t v30 = [v5 objectForKeyedSubscript:v29];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v31 = [v30 intValue];
        *(_WORD *)(a1 + 152) |= 0x1000u;
        *(_WORD *)(a1 + 152) |= 0x100u;
        *(_DWORD *)(a1 + 148) = v31;
      }

      if (a3) {
        v32 = @"featureId";
      }
      else {
        v32 = @"feature_id";
      }
      long long v33 = [v5 objectForKeyedSubscript:v32];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v34 = [v33 unsignedLongLongValue];
        *(_WORD *)(a1 + 152) |= 0x1000u;
        *(_WORD *)(a1 + 152) |= 2u;
        *(void *)(a1 + 80) = v34;
      }

      if (a3) {
        long long v35 = @"containedBy";
      }
      else {
        long long v35 = @"contained_by";
      }
      long long v36 = [v5 objectForKeyedSubscript:v35];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        id v37 = v36;
        uint64_t v38 = [v37 countByEnumeratingWithState:&v50 objects:v58 count:16];
        if (v38)
        {
          uint64_t v39 = v38;
          uint64_t v40 = *(void *)v51;
          do
          {
            uint64_t v41 = 0;
            do
            {
              if (*(void *)v51 != v40) {
                objc_enumerationMutation(v37);
              }
              v42 = *(void **)(*((void *)&v50 + 1) + 8 * v41);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                objc_msgSend(v42, "unsignedLongLongValue", (void)v50);
                -[GEOPDVenueIdentifier addContainedBy:](a1);
              }
              ++v41;
            }
            while (v39 != v41);
            uint64_t v39 = [v37 countByEnumeratingWithState:&v50 objects:v58 count:16];
          }
          while (v39);
        }
      }
      if (a3) {
        v43 = @"geminiId";
      }
      else {
        v43 = @"gemini_id";
      }
      v44 = objc_msgSend(v5, "objectForKeyedSubscript:", v43, (void)v50);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v45 = [v44 unsignedLongLongValue];
        *(_WORD *)(a1 + 152) |= 0x1000u;
        *(_WORD *)(a1 + 152) |= 8u;
        *(void *)(a1 + 96) = v45;
      }

      if (a3) {
        v46 = @"venueGeminiId";
      }
      else {
        v46 = @"venue_gemini_id";
      }
      v47 = [v5 objectForKeyedSubscript:v46];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v48 = [v47 unsignedLongLongValue];
        *(_WORD *)(a1 + 152) |= 0x1000u;
        *(_WORD *)(a1 + 152) |= 0x40u;
        *(void *)(a1 + 120) = v48;
      }
    }
  }

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDVenueIdentifierReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v13 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 0x1C00) == 0)
    {
      uint64_t v11 = self->_reader;
      objc_sync_enter(v11);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      uint64_t v12 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v13 writeData:v12];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v11);
      goto LABEL_30;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDVenueIdentifier readAll:]((uint64_t)self, 0);
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x80) != 0)
  {
    PBDataWriterWriteUint64Field();
    __int16 flags = (__int16)self->_flags;
  }
  id v6 = v13;
  if (flags)
  {
    PBDataWriterWriteUint64Field();
    id v6 = v13;
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 0x10) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v6 = v13;
  }
  if (self->_sectionIds.count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      id v6 = v13;
      ++v7;
    }
    while (v7 < self->_sectionIds.count);
  }
  __int16 v8 = (__int16)self->_flags;
  if ((v8 & 0x20) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v6 = v13;
    __int16 v8 = (__int16)self->_flags;
    if ((v8 & 4) == 0)
    {
LABEL_14:
      if ((v8 & 0x100) == 0) {
        goto LABEL_15;
      }
LABEL_27:
      PBDataWriterWriteInt32Field();
      id v6 = v13;
      if ((*(_WORD *)&self->_flags & 2) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  else if ((v8 & 4) == 0)
  {
    goto LABEL_14;
  }
  PBDataWriterWriteUint64Field();
  id v6 = v13;
  __int16 v8 = (__int16)self->_flags;
  if ((v8 & 0x100) != 0) {
    goto LABEL_27;
  }
LABEL_15:
  if ((v8 & 2) != 0)
  {
LABEL_16:
    PBDataWriterWriteUint64Field();
    id v6 = v13;
  }
LABEL_17:
  if (self->_containedBys.count)
  {
    unint64_t v9 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      id v6 = v13;
      ++v9;
    }
    while (v9 < self->_containedBys.count);
  }
  __int16 v10 = (__int16)self->_flags;
  if ((v10 & 8) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v6 = v13;
    __int16 v10 = (__int16)self->_flags;
  }
  if ((v10 & 0x40) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v6 = v13;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v6];
LABEL_30:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v6 = reader;
    objc_sync_enter(v6);
    if ((*(_WORD *)&self->_flags & 0x1000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDVenueIdentifierReadAllFrom(v4, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v7 = (id)v4;
      objc_sync_exit(v6);

      goto LABEL_19;
    }
    objc_sync_exit(v6);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDVenueIdentifier readAll:]((uint64_t)self, 0);
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x80) != 0)
  {
    *(void *)(v4 + 128) = self->_venueId;
    *(_WORD *)(v4 + 152) |= 0x80u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_7:
      if ((flags & 0x10) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((flags & 1) == 0)
  {
    goto LABEL_7;
  }
  *(void *)(v4 + 72) = self->_buildingId;
  *(_WORD *)(v4 + 152) |= 1u;
  if ((*(_WORD *)&self->_flags & 0x10) != 0)
  {
LABEL_8:
    *(void *)(v4 + 104) = self->_levelId;
    *(_WORD *)(v4 + 152) |= 0x10u;
  }
LABEL_9:
  PBRepeatedUInt64Copy();
  __int16 v9 = (__int16)self->_flags;
  if ((v9 & 0x20) != 0)
  {
    *(void *)(v4 + 112) = self->_unitId;
    *(_WORD *)(v4 + 152) |= 0x20u;
    __int16 v9 = (__int16)self->_flags;
    if ((v9 & 4) == 0)
    {
LABEL_11:
      if ((v9 & 0x100) == 0) {
        goto LABEL_12;
      }
LABEL_25:
      *(_DWORD *)(v4 + 148) = self->_levelOrdinal;
      *(_WORD *)(v4 + 152) |= 0x100u;
      if ((*(_WORD *)&self->_flags & 2) == 0) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  else if ((v9 & 4) == 0)
  {
    goto LABEL_11;
  }
  *(void *)(v4 + 88) = self->_fixtureId;
  *(_WORD *)(v4 + 152) |= 4u;
  __int16 v9 = (__int16)self->_flags;
  if ((v9 & 0x100) != 0) {
    goto LABEL_25;
  }
LABEL_12:
  if ((v9 & 2) != 0)
  {
LABEL_13:
    *(void *)(v4 + 80) = self->_featureId;
    *(_WORD *)(v4 + 152) |= 2u;
  }
LABEL_14:
  PBRepeatedUInt64Copy();
  __int16 v10 = (__int16)self->_flags;
  if ((v10 & 8) != 0)
  {
    *(void *)(v4 + 96) = self->_geminiId;
    *(_WORD *)(v4 + 152) |= 8u;
    __int16 v10 = (__int16)self->_flags;
  }
  if ((v10 & 0x40) != 0)
  {
    *(void *)(v4 + 120) = self->_venueGeminiId;
    *(_WORD *)(v4 + 152) |= 0x40u;
  }
  uint64_t v11 = self->_unknownFields;
  id v7 = *(id *)(v4 + 16);
  *(void *)(v4 + 16) = v11;
LABEL_19:

  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_49;
  }
  -[GEOPDVenueIdentifier readAll:]((uint64_t)self, 1);
  -[GEOPDVenueIdentifier readAll:]((uint64_t)v4, 1);
  __int16 flags = (__int16)self->_flags;
  __int16 v6 = *((_WORD *)v4 + 76);
  if ((flags & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_venueId != *((void *)v4 + 16)) {
      goto LABEL_49;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_49;
  }
  if (flags)
  {
    if ((v6 & 1) == 0 || self->_buildingId != *((void *)v4 + 9)) {
      goto LABEL_49;
    }
  }
  else if (v6)
  {
    goto LABEL_49;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_levelId != *((void *)v4 + 13)) {
      goto LABEL_49;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_49;
  }
  if (!PBRepeatedUInt64IsEqual()) {
    goto LABEL_49;
  }
  __int16 v7 = (__int16)self->_flags;
  __int16 v8 = *((_WORD *)v4 + 76);
  if ((v7 & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_unitId != *((void *)v4 + 14)) {
      goto LABEL_49;
    }
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_49;
  }
  if ((v7 & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_fixtureId != *((void *)v4 + 11)) {
      goto LABEL_49;
    }
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_49;
  }
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 76) & 0x100) == 0 || self->_levelOrdinal != *((_DWORD *)v4 + 37)) {
      goto LABEL_49;
    }
  }
  else if ((*((_WORD *)v4 + 76) & 0x100) != 0)
  {
    goto LABEL_49;
  }
  if ((v7 & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_featureId != *((void *)v4 + 10)) {
      goto LABEL_49;
    }
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_49;
  }
  if (!PBRepeatedUInt64IsEqual())
  {
LABEL_49:
    BOOL v11 = 0;
    goto LABEL_50;
  }
  __int16 v9 = (__int16)self->_flags;
  __int16 v10 = *((_WORD *)v4 + 76);
  if ((v9 & 8) != 0)
  {
    if ((v10 & 8) == 0 || self->_geminiId != *((void *)v4 + 12)) {
      goto LABEL_49;
    }
  }
  else if ((v10 & 8) != 0)
  {
    goto LABEL_49;
  }
  if ((v9 & 0x40) != 0)
  {
    if ((v10 & 0x40) == 0 || self->_venueGeminiId != *((void *)v4 + 15)) {
      goto LABEL_49;
    }
    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = (v10 & 0x40) == 0;
  }
LABEL_50:

  return v11;
}

- (unint64_t)hash
{
  -[GEOPDVenueIdentifier readAll:]((uint64_t)self, 1);
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x80) == 0)
  {
    unint64_t v17 = 0;
    if (flags) {
      goto LABEL_3;
    }
LABEL_6:
    unint64_t v4 = 0;
    if ((flags & 0x10) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  unint64_t v17 = 2654435761u * self->_venueId;
  if ((flags & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  unint64_t v4 = 2654435761u * self->_buildingId;
  if ((flags & 0x10) != 0)
  {
LABEL_4:
    unint64_t v5 = 2654435761u * self->_levelId;
    goto LABEL_8;
  }
LABEL_7:
  unint64_t v5 = 0;
LABEL_8:
  uint64_t v6 = PBRepeatedUInt64Hash();
  __int16 v7 = (__int16)self->_flags;
  if ((v7 & 0x20) != 0)
  {
    unint64_t v8 = 2654435761u * self->_unitId;
    if ((v7 & 4) != 0)
    {
LABEL_10:
      unint64_t v9 = 2654435761u * self->_fixtureId;
      if ((*(_WORD *)&self->_flags & 0x100) != 0) {
        goto LABEL_11;
      }
LABEL_15:
      uint64_t v10 = 0;
      if ((v7 & 2) != 0) {
        goto LABEL_12;
      }
      goto LABEL_16;
    }
  }
  else
  {
    unint64_t v8 = 0;
    if ((v7 & 4) != 0) {
      goto LABEL_10;
    }
  }
  unint64_t v9 = 0;
  if ((*(_WORD *)&self->_flags & 0x100) == 0) {
    goto LABEL_15;
  }
LABEL_11:
  uint64_t v10 = 2654435761 * self->_levelOrdinal;
  if ((v7 & 2) != 0)
  {
LABEL_12:
    unint64_t v11 = 2654435761u * self->_featureId;
    goto LABEL_17;
  }
LABEL_16:
  unint64_t v11 = 0;
LABEL_17:
  uint64_t v12 = PBRepeatedUInt64Hash();
  __int16 v13 = (__int16)self->_flags;
  if ((v13 & 8) != 0)
  {
    unint64_t v14 = 2654435761u * self->_geminiId;
    if ((v13 & 0x40) != 0) {
      goto LABEL_19;
    }
LABEL_21:
    unint64_t v15 = 0;
    return v4 ^ v17 ^ v5 ^ v8 ^ v9 ^ v10 ^ v11 ^ v6 ^ v12 ^ v14 ^ v15;
  }
  unint64_t v14 = 0;
  if ((v13 & 0x40) == 0) {
    goto LABEL_21;
  }
LABEL_19:
  unint64_t v15 = 2654435761u * self->_venueGeminiId;
  return v4 ^ v17 ^ v5 ^ v8 ^ v9 ^ v10 ^ v11 ^ v6 ^ v12 ^ v14 ^ v15;
}

- (void)mergeFrom:(uint64_t)a1
{
  id v3 = a2;
  if (!a1) {
    goto LABEL_23;
  }
  unint64_t v17 = v3;
  -[GEOPDVenueIdentifier readAll:]((uint64_t)v3, 0);
  __int16 v4 = v17[76];
  if ((v4 & 0x80) != 0)
  {
    *(void *)(a1 + 128) = *((void *)v17 + 16);
    *(_WORD *)(a1 + 152) |= 0x80u;
    __int16 v4 = v17[76];
    if ((v4 & 1) == 0)
    {
LABEL_4:
      if ((v4 & 0x10) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((v4 & 1) == 0)
  {
    goto LABEL_4;
  }
  *(void *)(a1 + 72) = *((void *)v17 + 9);
  *(_WORD *)(a1 + 152) |= 1u;
  if ((v17[76] & 0x10) != 0)
  {
LABEL_5:
    *(void *)(a1 + 104) = *((void *)v17 + 13);
    *(_WORD *)(a1 + 152) |= 0x10u;
  }
LABEL_6:
  -[GEOPDVenueIdentifier _readSectionIds]((uint64_t)v17);
  unint64_t v5 = v17;
  uint64_t v6 = *((void *)v17 + 7);
  if (v6)
  {
    for (unint64_t i = 0; i != v6; ++i)
    {
      -[GEOPDVenueIdentifier sectionIdAtIndex:]((uint64_t)v17, i);
      -[GEOPDVenueIdentifier addSectionId:](a1);
      unint64_t v5 = v17;
    }
  }
  __int16 v8 = v5[76];
  if ((v8 & 0x20) != 0)
  {
    *(void *)(a1 + 112) = *((void *)v5 + 14);
    *(_WORD *)(a1 + 152) |= 0x20u;
    __int16 v8 = v5[76];
    if ((v8 & 4) == 0)
    {
LABEL_11:
      if ((v8 & 0x100) == 0) {
        goto LABEL_12;
      }
LABEL_31:
      *(_DWORD *)(a1 + 148) = *((_DWORD *)v5 + 37);
      *(_WORD *)(a1 + 152) |= 0x100u;
      if ((v5[76] & 2) == 0) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  else if ((v8 & 4) == 0)
  {
    goto LABEL_11;
  }
  *(void *)(a1 + 88) = *((void *)v5 + 11);
  *(_WORD *)(a1 + 152) |= 4u;
  __int16 v8 = v5[76];
  if ((v8 & 0x100) != 0) {
    goto LABEL_31;
  }
LABEL_12:
  if ((v8 & 2) != 0)
  {
LABEL_13:
    *(void *)(a1 + 80) = *((void *)v5 + 10);
    *(_WORD *)(a1 + 152) |= 2u;
  }
LABEL_14:
  -[GEOPDVenueIdentifier _readContainedBys]((uint64_t)v17);
  id v3 = v17;
  uint64_t v9 = *((void *)v17 + 4);
  if (v9)
  {
    unint64_t v10 = 0;
    uint64_t v11 = *MEMORY[0x1E4F1C4A8];
    do
    {
      -[GEOPDVenueIdentifier _readContainedBys]((uint64_t)v3);
      unint64_t v12 = *((void *)v17 + 4);
      if (v12 <= v10)
      {
        __int16 v13 = (void *)MEMORY[0x1E4F1CA00];
        unint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", v10, v12);
        unint64_t v15 = [v13 exceptionWithName:v11 reason:v14 userInfo:0];
        [v15 raise];
      }
      -[GEOPDVenueIdentifier addContainedBy:](a1);
      ++v10;
      id v3 = v17;
    }
    while (v9 != v10);
  }
  __int16 v16 = v3[76];
  if ((v16 & 8) != 0)
  {
    *(void *)(a1 + 96) = *((void *)v3 + 12);
    *(_WORD *)(a1 + 152) |= 8u;
    __int16 v16 = v3[76];
  }
  if ((v16 & 0x40) != 0)
  {
    *(void *)(a1 + 120) = *((void *)v3 + 15);
    *(_WORD *)(a1 + 152) |= 0x40u;
  }
LABEL_23:
}

- (void)clearUnknownFields:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 152) |= 0x200u;
    *(_WORD *)(a1 + 152) |= 0x1000u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
    __int16 v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDVenueIdentifier readAll:](a1, 0);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end