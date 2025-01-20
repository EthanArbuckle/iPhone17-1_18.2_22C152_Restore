@interface GEOPDFactoid
+ (BOOL)factoidPairAvailableForPlaceData:(id)a3;
+ (id)factoidsForPlaceData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDFactoid)init;
- (GEOPDFactoid)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)bestLocalizedPlaceName;
- (id)color;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)icon;
- (id)jsonRepresentation;
- (id)placeId;
- (id)placeNames;
- (id)text;
- (id)title;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (uint64_t)entryType;
- (uint64_t)unit;
- (unint64_t)hash;
- (void)_addNoFlagsPlaceName:(uint64_t)a1;
- (void)_readColor;
- (void)_readIcon;
- (void)_readPlaceId;
- (void)_readPlaceNames;
- (void)_readText;
- (void)_readTitle;
- (void)addPlaceName:(uint64_t)a1;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDFactoid

+ (BOOL)factoidPairAvailableForPlaceData:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__GEOPDFactoid_PlaceDataExtras__factoidPairAvailableForPlaceData___block_invoke;
  v6[3] = &unk_1E53E16F0;
  v6[4] = &v7;
  [v3 enumerateValidComponentValuesOfType:23 usingBlock:v6];
  BOOL v4 = *((_DWORD *)v8 + 6) > 1u;
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __66__GEOPDFactoid_PlaceDataExtras__factoidPairAvailableForPlaceData___block_invoke(uint64_t result, uint64_t a2, BOOL *a3)
{
  if (a2)
  {
    if (*(void *)(a2 + 232)) {
      *a3 = ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) > 1u;
    }
  }
  return result;
}

+ (id)factoidsForPlaceData:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  v5 = [v3 array];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__GEOPDFactoid_PlaceDataExtras__factoidsForPlaceData___block_invoke;
  v10[3] = &unk_1E53E1940;
  id v11 = v5;
  id v6 = v5;
  [v4 enumerateValidComponentValuesOfType:23 usingBlock:v10];

  if ([v6 count]) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  return v8;
}

void __54__GEOPDFactoid_PlaceDataExtras__factoidsForPlaceData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 && *((void *)v3 + 29))
  {
    id v4 = *(void **)(a1 + 32);
    id v6 = v3;
    v5 = -[GEOPDComponentValue factoid]((id *)v3);
    [v4 addObject:v5];

    id v3 = v6;
  }
}

- (id)bestLocalizedPlaceName
{
  v2 = -[GEOPDFactoid placeNames]((id *)&self->super.super.isa);
  id v3 = +[GEOLocalizedString bestStringForCurrentLocale:v2 fallbackToFirstAvailable:1];

  return v3;
}

- (void)clearUnknownFields:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 112) |= 0x10u;
    *(_WORD *)(a1 + 112) |= 0x1000u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    v2 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    -[GEOPDFactoid readAll:](a1, 0);
    [*(id *)(a1 + 48) clearUnknownFields:1];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v3 = *(id *)(a1 + 56);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v7++), "clearUnknownFields:", 1, (void)v10);
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }

    uint64_t v8 = *(void *)(a1 + 24);
    if (v8)
    {
      uint64_t v9 = *(void **)(v8 + 8);
      *(void *)(v8 + 8) = 0;
    }
  }
}

- (GEOPDFactoid)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDFactoid;
  v2 = [(GEOPDFactoid *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = v2;
  }

  return v3;
}

- (GEOPDFactoid)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDFactoid;
  id v3 = [(GEOPDFactoid *)&v7 initWithData:a3];
  uint64_t v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (void)_readTitle
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 112) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDFactoidReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTitle_tags_5128);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (id)title
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDFactoid _readTitle]((uint64_t)a1);
    a1 = (id *)v2[10];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readText
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 112) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDFactoidReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readText_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (id)text
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDFactoid _readText]((uint64_t)a1);
    a1 = (id *)v2[9];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readIcon
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 112) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDFactoidReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIcon_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (id)icon
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDFactoid _readIcon]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (uint64_t)unit
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    __int16 v2 = *(_WORD *)(v1 + 112);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 96));
    if ((v2 & 4) != 0) {
      return *(unsigned int *)(v1 + 104);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)_readPlaceId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 112) & 0x80) == 0)
    {
      __int16 v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDFactoidReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceId_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (id)placeId
{
  if (a1)
  {
    __int16 v2 = a1;
    -[GEOPDFactoid _readPlaceId]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readPlaceNames
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 112) & 0x100) == 0)
    {
      __int16 v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDFactoidReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceNames_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (id)placeNames
{
  if (a1)
  {
    __int16 v2 = a1;
    -[GEOPDFactoid _readPlaceNames]((uint64_t)a1);
    a1 = (id *)v2[7];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addPlaceName:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDFactoid _readPlaceNames](a1);
    -[GEOPDFactoid _addNoFlagsPlaceName:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 112) |= 0x100u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    *(_WORD *)(a1 + 112) |= 0x1000u;
  }
}

- (void)_addNoFlagsPlaceName:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = *(void **)(a1 + 56);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v5;

      uint64_t v4 = *(void **)(a1 + 56);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (uint64_t)entryType
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    __int16 v2 = *(_WORD *)(v1 + 112);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 96));
    if ((v2 & 2) != 0) {
      return *(unsigned int *)(v1 + 100);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)_readColor
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 112) & 0x20) == 0)
    {
      __int16 v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDFactoidReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readColor_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (id)color
{
  if (a1)
  {
    __int16 v2 = a1;
    -[GEOPDFactoid _readColor]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDFactoid;
  uint64_t v4 = [(GEOPDFactoid *)&v8 description];
  id v5 = [(GEOPDFactoid *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDFactoid _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDFactoid readAll:](a1, 1);
    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = -[GEOPDFactoid title]((id *)a1);
    if (v5) {
      [v4 setObject:v5 forKey:@"title"];
    }

    objc_super v6 = -[GEOPDFactoid text]((id *)a1);
    if (v6) {
      [v4 setObject:v6 forKey:@"text"];
    }

    if (*(_WORD *)(a1 + 112))
    {
      id v7 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
      [v4 setObject:v7 forKey:@"number"];
    }
    objc_super v8 = -[GEOPDFactoid icon]((id *)a1);
    if (v8) {
      [v4 setObject:v8 forKey:@"icon"];
    }

    if ((*(_WORD *)(a1 + 112) & 4) != 0)
    {
      uint64_t v9 = *(int *)(a1 + 104);
      if (v9 >= 9)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 104));
        long long v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        long long v10 = off_1E53E39E0[v9];
      }
      [v4 setObject:v10 forKey:@"unit"];
    }
    long long v11 = -[GEOPDFactoid placeId]((id *)a1);
    long long v12 = v11;
    if (v11)
    {
      if (a2)
      {
        long long v13 = [v11 jsonRepresentation];
        v14 = @"placeId";
      }
      else
      {
        long long v13 = [v11 dictionaryRepresentation];
        v14 = @"place_id";
      }
      [v4 setObject:v13 forKey:v14];
    }
    if ([*(id *)(a1 + 56) count])
    {
      uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v16 = *(id *)(a1 + 56);
      uint64_t v17 = [v16 countByEnumeratingWithState:&v45 objects:v49 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v46;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v46 != v18) {
              objc_enumerationMutation(v16);
            }
            v20 = *(void **)(*((void *)&v45 + 1) + 8 * i);
            if (a2) {
              [v20 jsonRepresentation];
            }
            else {
            v21 = [v20 dictionaryRepresentation];
            }
            [v15 addObject:v21];
          }
          uint64_t v17 = [v16 countByEnumeratingWithState:&v45 objects:v49 count:16];
        }
        while (v17);
      }

      if (a2) {
        v22 = @"placeName";
      }
      else {
        v22 = @"place_name";
      }
      [v4 setObject:v15 forKey:v22];
    }
    __int16 v23 = *(_WORD *)(a1 + 112);
    if ((v23 & 2) != 0)
    {
      uint64_t v24 = *(int *)(a1 + 100);
      if (v24 >= 6)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 100));
        v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v25 = off_1E53E3A28[v24];
      }
      if (a2) {
        v26 = @"entryType";
      }
      else {
        v26 = @"entry_type";
      }
      [v4 setObject:v25 forKey:v26];

      __int16 v23 = *(_WORD *)(a1 + 112);
    }
    if ((v23 & 8) != 0)
    {
      v27 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 108)];
      if (a2) {
        v28 = @"canBeDisplayedInPlaceSummary";
      }
      else {
        v28 = @"can_be_displayed_in_place_summary";
      }
      [v4 setObject:v27 forKey:v28];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 112) & 0x200) == 0)
    {
      v29 = *(void **)(a1 + 8);
      if (v29)
      {
        id v30 = v29;
        objc_sync_enter(v30);
        GEOPDFactoidReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSymbolColor_tags);
        objc_sync_exit(v30);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    id v31 = *(id *)(a1 + 64);
    if (v31)
    {
      if (a2) {
        v32 = @"symbolColor";
      }
      else {
        v32 = @"symbol_color";
      }
      [v4 setObject:v31 forKey:v32];
    }

    v33 = -[GEOPDFactoid color]((id *)a1);
    v34 = v33;
    if (v33)
    {
      if (a2) {
        [v33 jsonRepresentation];
      }
      else {
      v35 = [v33 dictionaryRepresentation];
      }
      [v4 setObject:v35 forKey:@"color"];
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
        v43[2] = __42__GEOPDFactoid__dictionaryRepresentation___block_invoke;
        v43[3] = &unk_1E53D8860;
        id v40 = v39;
        id v44 = v40;
        [v38 enumerateKeysAndObjectsUsingBlock:v43];
        id v41 = v40;
      }
      else
      {
        id v41 = v37;
      }
      [v4 setObject:v41 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDFactoid _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    uint64_t v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_5169_0;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_5170_0;
      }
      GEOPDFactoidReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDFactoidCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

void __42__GEOPDFactoid__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = [a1 init];
  if (v6)
  {
    id v7 = [v5 objectForKeyedSubscript:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v8 = (void *)[v7 copy];
      id v9 = v8;
      *(_WORD *)(v6 + 112) |= 0x800u;
      *(_WORD *)(v6 + 112) |= 0x1000u;
      objc_storeStrong((id *)(v6 + 80), v8);
    }
    id v10 = [v5 objectForKeyedSubscript:@"text"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v11 = (void *)[v10 copy];
      id v12 = v11;
      *(_WORD *)(v6 + 112) |= 0x400u;
      *(_WORD *)(v6 + 112) |= 0x1000u;
      objc_storeStrong((id *)(v6 + 72), v11);
    }
    long long v13 = [v5 objectForKeyedSubscript:@"number"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v13 doubleValue];
      *(_WORD *)(v6 + 112) |= 0x1000u;
      *(_WORD *)(v6 + 112) |= 1u;
      *(void *)(v6 + 40) = v14;
    }

    uint64_t v15 = [v5 objectForKeyedSubscript:@"icon"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v16 = (void *)[v15 copy];
      id v17 = v16;
      *(_WORD *)(v6 + 112) |= 0x40u;
      *(_WORD *)(v6 + 112) |= 0x1000u;
      objc_storeStrong((id *)(v6 + 32), v16);
    }
    uint64_t v18 = [v5 objectForKeyedSubscript:@"unit"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v19 = v18;
      if ([v19 isEqualToString:@"UNIT_TYPE_NONE"])
      {
        int v20 = 0;
      }
      else if ([v19 isEqualToString:@"UNIT_TYPE_COUNT"])
      {
        int v20 = 1;
      }
      else if ([v19 isEqualToString:@"UNIT_TYPE_METERS"])
      {
        int v20 = 2;
      }
      else if ([v19 isEqualToString:@"UNIT_TYPE_SQUARE_METERS"])
      {
        int v20 = 3;
      }
      else if ([v19 isEqualToString:@"UNIT_TYPE_CUBIC_METERS"])
      {
        int v20 = 4;
      }
      else if ([v19 isEqualToString:@"UNIT_TYPE_KILOMETERS"])
      {
        int v20 = 5;
      }
      else if ([v19 isEqualToString:@"UNIT_TYPE_SQUARE_KILOMETERS"])
      {
        int v20 = 6;
      }
      else if ([v19 isEqualToString:@"UNIT_TYPE_CUBIC_KILOMETERS"])
      {
        int v20 = 7;
      }
      else if ([v19 isEqualToString:@"UNIT_TYPE_MILLISECONDS"])
      {
        int v20 = 8;
      }
      else
      {
        int v20 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_34;
      }
      int v20 = [v18 intValue];
    }
    *(_WORD *)(v6 + 112) |= 0x1000u;
    *(_WORD *)(v6 + 112) |= 4u;
    *(_DWORD *)(v6 + 104) = v20;
LABEL_34:

    if (a3) {
      v21 = @"placeId";
    }
    else {
      v21 = @"place_id";
    }
    v22 = [v5 objectForKeyedSubscript:v21];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      __int16 v23 = [GEOPDMapsIdentifier alloc];
      if (a3) {
        uint64_t v24 = [(GEOPDMapsIdentifier *)v23 initWithJSON:v22];
      }
      else {
        uint64_t v24 = [(GEOPDMapsIdentifier *)v23 initWithDictionary:v22];
      }
      v25 = v24;
      v26 = v24;
      *(_WORD *)(v6 + 112) |= 0x80u;
      *(_WORD *)(v6 + 112) |= 0x1000u;
      objc_storeStrong((id *)(v6 + 48), v25);
    }
    if (a3) {
      v27 = @"placeName";
    }
    else {
      v27 = @"place_name";
    }
    v28 = [v5 objectForKeyedSubscript:v27];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v57 = v5;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id v29 = v28;
      uint64_t v30 = [v29 countByEnumeratingWithState:&v58 objects:v62 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v59;
        do
        {
          for (uint64_t i = 0; i != v31; ++i)
          {
            if (*(void *)v59 != v32) {
              objc_enumerationMutation(v29);
            }
            uint64_t v34 = *(void *)(*((void *)&v58 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v35 = [GEOLocalizedString alloc];
              if (a3) {
                v36 = [(GEOLocalizedString *)v35 initWithJSON:v34];
              }
              else {
                v36 = [(GEOLocalizedString *)v35 initWithDictionary:v34];
              }
              v37 = v36;
              -[GEOPDFactoid addPlaceName:](v6, v36);
            }
          }
          uint64_t v31 = [v29 countByEnumeratingWithState:&v58 objects:v62 count:16];
        }
        while (v31);
      }

      id v5 = v57;
    }

    if (a3) {
      v38 = @"entryType";
    }
    else {
      v38 = @"entry_type";
    }
    v39 = [v5 objectForKeyedSubscript:v38];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v40 = v39;
      if ([v40 isEqualToString:@"UNKNOWN"])
      {
        int v41 = 0;
      }
      else if ([v40 isEqualToString:@"NUM_PORTS"])
      {
        int v41 = 1;
      }
      else if ([v40 isEqualToString:@"HIKING_DIFFICULTY"])
      {
        int v41 = 2;
      }
      else if ([v40 isEqualToString:@"HIKING_POINT_TO_POINT"])
      {
        int v41 = 3;
      }
      else if ([v40 isEqualToString:@"HIKING_LENGTH"])
      {
        int v41 = 4;
      }
      else if ([v40 isEqualToString:@"ELEVATION"])
      {
        int v41 = 5;
      }
      else
      {
        int v41 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_80;
      }
      int v41 = [v39 intValue];
    }
    *(_WORD *)(v6 + 112) |= 0x1000u;
    *(_WORD *)(v6 + 112) |= 2u;
    *(_DWORD *)(v6 + 100) = v41;
LABEL_80:

    if (a3) {
      v42 = @"canBeDisplayedInPlaceSummary";
    }
    else {
      v42 = @"can_be_displayed_in_place_summary";
    }
    v43 = [v5 objectForKeyedSubscript:v42];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v44 = [v43 BOOLValue];
      *(_WORD *)(v6 + 112) |= 0x1000u;
      *(_WORD *)(v6 + 112) |= 8u;
      *(unsigned char *)(v6 + 108) = v44;
    }

    if (a3) {
      long long v45 = @"symbolColor";
    }
    else {
      long long v45 = @"symbol_color";
    }
    long long v46 = [v5 objectForKeyedSubscript:v45];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v47 = (void *)[v46 copy];
      id v48 = v47;
      *(_WORD *)(v6 + 112) |= 0x200u;
      *(_WORD *)(v6 + 112) |= 0x1000u;
      objc_storeStrong((id *)(v6 + 64), v47);
    }
    v49 = [v5 objectForKeyedSubscript:@"color"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_114;
    }
    uint64_t v50 = [GEOPDColor alloc];
    if (!v50)
    {
LABEL_113:
      v55 = v50;
      *(_WORD *)(v6 + 112) |= 0x20u;
      *(_WORD *)(v6 + 112) |= 0x1000u;
      objc_storeStrong((id *)(v6 + 24), v50);

LABEL_114:
      goto LABEL_115;
    }
    id v51 = v49;
    uint64_t v50 = [(GEOPDColor *)v50 init];
    if (!v50)
    {
LABEL_112:

      goto LABEL_113;
    }
    v52 = [v51 objectForKeyedSubscript:@"systemColor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v53 = v52;
      if ([v53 isEqualToString:@"DEFAULT"])
      {
        int v54 = 0;
      }
      else if ([v53 isEqualToString:@"CYAN"])
      {
        int v54 = 1;
      }
      else if ([v53 isEqualToString:@"GREEN"])
      {
        int v54 = 2;
      }
      else if ([v53 isEqualToString:@"MAPS_HIKING_DIFFICULTY_EASY"])
      {
        int v54 = 3;
      }
      else if ([v53 isEqualToString:@"MAPS_HIKING_DIFFICULTY_MEDIUM"])
      {
        int v54 = 4;
      }
      else if ([v53 isEqualToString:@"MAPS_HIKING_DIFFICULTY_HARD"])
      {
        int v54 = 5;
      }
      else
      {
        int v54 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_111:

        goto LABEL_112;
      }
      int v54 = [v52 intValue];
    }
    *(unsigned char *)&v50->_flags |= 1u;
    v50->_systemColor = v54;
    goto LABEL_111;
  }
LABEL_115:

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDFactoidReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x1FE0) == 0))
  {
    long long v11 = self->_reader;
    objc_sync_enter(v11);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v12 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v12];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v11);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDFactoid readAll:]((uint64_t)self, 0);
    if (self->_title) {
      PBDataWriterWriteStringField();
    }
    if (self->_text) {
      PBDataWriterWriteStringField();
    }
    if (*(_WORD *)&self->_flags) {
      PBDataWriterWriteDoubleField();
    }
    if (self->_icon) {
      PBDataWriterWriteStringField();
    }
    if ((*(_WORD *)&self->_flags & 4) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_placeId) {
      PBDataWriterWriteSubmessage();
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v6 = self->_placeNames;
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
      PBDataWriterWriteInt32Field();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 8) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_symbolColor) {
      PBDataWriterWriteStringField();
    }
    if (self->_color) {
      PBDataWriterWriteSubmessage();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v13);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x1000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDFactoidReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_21;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDFactoid readAll:]((uint64_t)self, 0);
  uint64_t v9 = [(NSString *)self->_title copyWithZone:a3];
  id v10 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v9;

  uint64_t v11 = [(NSString *)self->_text copyWithZone:a3];
  id v12 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v11;

  if (*(_WORD *)&self->_flags)
  {
    *(double *)(v5 + 40) = self->_number;
    *(_WORD *)(v5 + 112) |= 1u;
  }
  uint64_t v13 = [(NSString *)self->_icon copyWithZone:a3];
  long long v14 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v13;

  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 104) = self->_unit;
    *(_WORD *)(v5 + 112) |= 4u;
  }
  id v15 = [(GEOPDMapsIdentifier *)self->_placeId copyWithZone:a3];
  long long v16 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v15;

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v17 = self->_placeNames;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v30 != v19) {
          objc_enumerationMutation(v17);
        }
        v21 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * i), "copyWithZone:", a3, (void)v29);
        -[GEOPDFactoid addPlaceName:](v5, v21);
      }
      uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v18);
  }

  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 100) = self->_entryType;
    *(_WORD *)(v5 + 112) |= 2u;
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 8) != 0)
  {
    *(unsigned char *)(v5 + 108) = self->_canBeDisplayedInPlaceSummary;
    *(_WORD *)(v5 + 112) |= 8u;
  }
  uint64_t v23 = -[NSString copyWithZone:](self->_symbolColor, "copyWithZone:", a3, (void)v29);
  uint64_t v24 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v23;

  id v25 = [(GEOPDColor *)self->_color copyWithZone:a3];
  v26 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v25;

  v27 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v27;
LABEL_21:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_40;
  }
  -[GEOPDFactoid readAll:]((uint64_t)self, 1);
  -[GEOPDFactoid readAll:]((uint64_t)v4, 1);
  title = self->_title;
  if ((unint64_t)title | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](title, "isEqual:")) {
      goto LABEL_40;
    }
  }
  text = self->_text;
  if ((unint64_t)text | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](text, "isEqual:")) {
      goto LABEL_40;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v8 = *((_WORD *)v4 + 56);
  if (flags)
  {
    if ((v8 & 1) == 0 || self->_number != *((double *)v4 + 5)) {
      goto LABEL_40;
    }
  }
  else if (v8)
  {
    goto LABEL_40;
  }
  icon = self->_icon;
  if ((unint64_t)icon | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](icon, "isEqual:")) {
      goto LABEL_40;
    }
    __int16 flags = (__int16)self->_flags;
    __int16 v8 = *((_WORD *)v4 + 56);
  }
  if ((flags & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_unit != *((_DWORD *)v4 + 26)) {
      goto LABEL_40;
    }
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_40;
  }
  placeId = self->_placeId;
  if ((unint64_t)placeId | *((void *)v4 + 6) && !-[GEOPDMapsIdentifier isEqual:](placeId, "isEqual:")) {
    goto LABEL_40;
  }
  placeNames = self->_placeNames;
  if ((unint64_t)placeNames | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](placeNames, "isEqual:")) {
      goto LABEL_40;
    }
  }
  __int16 v12 = (__int16)self->_flags;
  __int16 v13 = *((_WORD *)v4 + 56);
  if ((v12 & 2) != 0)
  {
    if ((v13 & 2) == 0 || self->_entryType != *((_DWORD *)v4 + 25)) {
      goto LABEL_40;
    }
  }
  else if ((v13 & 2) != 0)
  {
    goto LABEL_40;
  }
  if ((v12 & 8) != 0)
  {
    if ((v13 & 8) != 0)
    {
      if (self->_canBeDisplayedInPlaceSummary)
      {
        if (!*((unsigned char *)v4 + 108)) {
          goto LABEL_40;
        }
        goto LABEL_36;
      }
      if (!*((unsigned char *)v4 + 108)) {
        goto LABEL_36;
      }
    }
LABEL_40:
    char v16 = 0;
    goto LABEL_41;
  }
  if ((v13 & 8) != 0) {
    goto LABEL_40;
  }
LABEL_36:
  symbolColor = self->_symbolColor;
  if ((unint64_t)symbolColor | *((void *)v4 + 8)
    && !-[NSString isEqual:](symbolColor, "isEqual:"))
  {
    goto LABEL_40;
  }
  color = self->_color;
  if ((unint64_t)color | *((void *)v4 + 3)) {
    char v16 = -[GEOPDColor isEqual:](color, "isEqual:");
  }
  else {
    char v16 = 1;
  }
LABEL_41:

  return v16;
}

- (unint64_t)hash
{
  -[GEOPDFactoid readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_title hash];
  NSUInteger v4 = [(NSString *)self->_text hash];
  if (*(_WORD *)&self->_flags)
  {
    double number = self->_number;
    double v7 = -number;
    if (number >= 0.0) {
      double v7 = self->_number;
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
  NSUInteger v10 = [(NSString *)self->_icon hash];
  if ((*(_WORD *)&self->_flags & 4) != 0) {
    uint64_t v11 = 2654435761 * self->_unit;
  }
  else {
    uint64_t v11 = 0;
  }
  unint64_t v12 = [(GEOPDMapsIdentifier *)self->_placeId hash];
  uint64_t v13 = [(NSMutableArray *)self->_placeNames hash];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    uint64_t v15 = 2654435761 * self->_entryType;
    if ((flags & 8) != 0) {
      goto LABEL_14;
    }
LABEL_16:
    uint64_t v16 = 0;
    goto LABEL_17;
  }
  uint64_t v15 = 0;
  if ((flags & 8) == 0) {
    goto LABEL_16;
  }
LABEL_14:
  uint64_t v16 = 2654435761 * self->_canBeDisplayedInPlaceSummary;
LABEL_17:
  NSUInteger v17 = v4 ^ v3 ^ v5 ^ v10 ^ v11 ^ v12 ^ v13;
  NSUInteger v18 = v15 ^ v16 ^ [(NSString *)self->_symbolColor hash];
  return v17 ^ v18 ^ [(GEOPDColor *)self->_color hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_symbolColor, 0);
  objc_storeStrong((id *)&self->_placeNames, 0);
  objc_storeStrong((id *)&self->_placeId, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end