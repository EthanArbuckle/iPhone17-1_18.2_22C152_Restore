@interface GEORPResolution
+ (BOOL)isValid:(id)a3;
+ (Class)localizedChangeListType;
+ (Class)updatedPlaceType;
- (BOOL)hasDisplayRegion;
- (BOOL)hasDisplayStyle;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasLocalizedAlertText;
- (BOOL)hasLocalizedDescription;
- (BOOL)hasResolutionDate;
- (BOOL)hasTransitLineMuid;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOMapRegion)displayRegion;
- (GEORPResolution)init;
- (GEORPResolution)initWithData:(id)a3;
- (GEORPResolution)initWithDictionary:(id)a3;
- (GEORPResolution)initWithJSON:(id)a3;
- (NSMutableArray)localizedChangeLists;
- (NSMutableArray)updatedPlaces;
- (NSString)localizedAlertText;
- (NSString)localizedDescription;
- (double)resolutionDate;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)displayStyleAsString:(int)a3;
- (id)jsonRepresentation;
- (id)localizedChangeListAtIndex:(unint64_t)a3;
- (id)updatedPlaceAtIndex:(unint64_t)a3;
- (int)StringAsDisplayStyle:(id)a3;
- (int)displayStyle;
- (unint64_t)hash;
- (unint64_t)localizedChangeListsCount;
- (unint64_t)transitLineMuid;
- (unint64_t)updatedPlacesCount;
- (void)_addNoFlagsLocalizedChangeList:(uint64_t)a1;
- (void)_addNoFlagsUpdatedPlace:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readDisplayRegion;
- (void)_readLocalizedAlertText;
- (void)_readLocalizedChangeLists;
- (void)_readLocalizedDescription;
- (void)_readUpdatedPlaces;
- (void)addLocalizedChangeList:(id)a3;
- (void)addUpdatedPlace:(id)a3;
- (void)clearLocalizedChangeLists;
- (void)clearUpdatedPlaces;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setDisplayRegion:(id)a3;
- (void)setDisplayStyle:(int)a3;
- (void)setHasDisplayStyle:(BOOL)a3;
- (void)setHasResolutionDate:(BOOL)a3;
- (void)setHasTransitLineMuid:(BOOL)a3;
- (void)setLocalizedAlertText:(id)a3;
- (void)setLocalizedChangeLists:(id)a3;
- (void)setLocalizedDescription:(id)a3;
- (void)setResolutionDate:(double)a3;
- (void)setTransitLineMuid:(unint64_t)a3;
- (void)setUpdatedPlaces:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPResolution

- (GEORPResolution)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPResolution;
  v2 = [(GEORPResolution *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPResolution)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPResolution;
  v3 = [(GEORPResolution *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (double)resolutionDate
{
  return self->_resolutionDate;
}

- (void)setResolutionDate:(double)a3
{
  *(_WORD *)&self->_flags |= 0x101u;
  self->_resolutionDate = a3;
}

- (void)setHasResolutionDate:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x100;
}

- (BOOL)hasResolutionDate
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readDisplayRegion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPResolutionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayRegion_tags_3073);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasDisplayRegion
{
  return self->_displayRegion != 0;
}

- (GEOMapRegion)displayRegion
{
  -[GEORPResolution _readDisplayRegion]((uint64_t)self);
  displayRegion = self->_displayRegion;

  return displayRegion;
}

- (void)setDisplayRegion:(id)a3
{
  *(_WORD *)&self->_flags |= 0x108u;
  objc_storeStrong((id *)&self->_displayRegion, a3);
}

- (void)_readLocalizedChangeLists
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPResolutionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocalizedChangeLists_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)localizedChangeLists
{
  -[GEORPResolution _readLocalizedChangeLists]((uint64_t)self);
  localizedChangeLists = self->_localizedChangeLists;

  return localizedChangeLists;
}

- (void)setLocalizedChangeLists:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  localizedChangeLists = self->_localizedChangeLists;
  self->_localizedChangeLists = v4;
}

- (void)clearLocalizedChangeLists
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  localizedChangeLists = self->_localizedChangeLists;

  [(NSMutableArray *)localizedChangeLists removeAllObjects];
}

- (void)addLocalizedChangeList:(id)a3
{
  id v4 = a3;
  -[GEORPResolution _readLocalizedChangeLists]((uint64_t)self);
  -[GEORPResolution _addNoFlagsLocalizedChangeList:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
}

- (void)_addNoFlagsLocalizedChangeList:(uint64_t)a1
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

- (unint64_t)localizedChangeListsCount
{
  -[GEORPResolution _readLocalizedChangeLists]((uint64_t)self);
  localizedChangeLists = self->_localizedChangeLists;

  return [(NSMutableArray *)localizedChangeLists count];
}

- (id)localizedChangeListAtIndex:(unint64_t)a3
{
  -[GEORPResolution _readLocalizedChangeLists]((uint64_t)self);
  localizedChangeLists = self->_localizedChangeLists;

  return (id)[(NSMutableArray *)localizedChangeLists objectAtIndex:a3];
}

+ (Class)localizedChangeListType
{
  return (Class)objc_opt_class();
}

- (void)_readUpdatedPlaces
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPResolutionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUpdatedPlaces_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)updatedPlaces
{
  -[GEORPResolution _readUpdatedPlaces]((uint64_t)self);
  updatedPlaces = self->_updatedPlaces;

  return updatedPlaces;
}

- (void)setUpdatedPlaces:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  updatedPlaces = self->_updatedPlaces;
  self->_updatedPlaces = v4;
}

- (void)clearUpdatedPlaces
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  updatedPlaces = self->_updatedPlaces;

  [(NSMutableArray *)updatedPlaces removeAllObjects];
}

- (void)addUpdatedPlace:(id)a3
{
  id v4 = a3;
  -[GEORPResolution _readUpdatedPlaces]((uint64_t)self);
  -[GEORPResolution _addNoFlagsUpdatedPlace:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
}

- (void)_addNoFlagsUpdatedPlace:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 64);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v5;

      id v4 = *(void **)(a1 + 64);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)updatedPlacesCount
{
  -[GEORPResolution _readUpdatedPlaces]((uint64_t)self);
  updatedPlaces = self->_updatedPlaces;

  return [(NSMutableArray *)updatedPlaces count];
}

- (id)updatedPlaceAtIndex:(unint64_t)a3
{
  -[GEORPResolution _readUpdatedPlaces]((uint64_t)self);
  updatedPlaces = self->_updatedPlaces;

  return (id)[(NSMutableArray *)updatedPlaces objectAtIndex:a3];
}

+ (Class)updatedPlaceType
{
  return (Class)objc_opt_class();
}

- (unint64_t)transitLineMuid
{
  return self->_transitLineMuid;
}

- (void)setTransitLineMuid:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x102u;
  self->_transitLineMuid = a3;
}

- (void)setHasTransitLineMuid:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 258;
  }
  else {
    __int16 v3 = 256;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasTransitLineMuid
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (void)_readLocalizedDescription
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPResolutionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocalizedDescription_tags_3074);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasLocalizedDescription
{
  return self->_localizedDescription != 0;
}

- (NSString)localizedDescription
{
  -[GEORPResolution _readLocalizedDescription]((uint64_t)self);
  localizedDescription = self->_localizedDescription;

  return localizedDescription;
}

- (void)setLocalizedDescription:(id)a3
{
  *(_WORD *)&self->_flags |= 0x140u;
  objc_storeStrong((id *)&self->_localizedDescription, a3);
}

- (void)_readLocalizedAlertText
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPResolutionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocalizedAlertText_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasLocalizedAlertText
{
  return self->_localizedAlertText != 0;
}

- (NSString)localizedAlertText
{
  -[GEORPResolution _readLocalizedAlertText]((uint64_t)self);
  localizedAlertText = self->_localizedAlertText;

  return localizedAlertText;
}

- (void)setLocalizedAlertText:(id)a3
{
  *(_WORD *)&self->_flags |= 0x110u;
  objc_storeStrong((id *)&self->_localizedAlertText, a3);
}

- (int)displayStyle
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 4) != 0) {
    return self->_displayStyle;
  }
  else {
    return 0;
  }
}

- (void)setDisplayStyle:(int)a3
{
  *(_WORD *)&self->_flags |= 0x104u;
  self->_displayStyle = a3;
}

- (void)setHasDisplayStyle:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 260;
  }
  else {
    __int16 v3 = 256;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasDisplayStyle
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (id)displayStyleAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E53E6E58[a3];
  }

  return v3;
}

- (int)StringAsDisplayStyle:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SHOW_ALL"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NONE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SHOW_REGION"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SHOW_SINGLE_PIN"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SHOW_PLACE_CARD"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SHOW_TRANSIT_LINE"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPResolution;
  int v4 = [(GEORPResolution *)&v8 description];
  id v5 = [(GEORPResolution *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPResolution _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(_WORD *)(a1 + 88))
    {
      id v5 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
      if (a2) {
        objc_super v6 = @"resolutionDate";
      }
      else {
        objc_super v6 = @"resolution_date";
      }
      [v4 setObject:v5 forKey:v6];
    }
    id v7 = [(id)a1 displayRegion];
    objc_super v8 = v7;
    if (v7)
    {
      if (a2)
      {
        v9 = [v7 jsonRepresentation];
        v10 = @"displayRegion";
      }
      else
      {
        v9 = [v7 dictionaryRepresentation];
        v10 = @"display_region";
      }
      [v4 setObject:v9 forKey:v10];
    }
    if (*(void *)(a1 + 32))
    {
      v11 = [(id)a1 localizedChangeLists];
      if (a2) {
        v12 = @"localizedChangeList";
      }
      else {
        v12 = @"localized_change_list";
      }
      [v4 setObject:v11 forKey:v12];
    }
    if ([*(id *)(a1 + 64) count])
    {
      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v14 = *(id *)(a1 + 64);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v33 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            if (a2) {
              [v19 jsonRepresentation];
            }
            else {
            v20 = [v19 dictionaryRepresentation];
            }
            [v13 addObject:v20];
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v32 objects:v36 count:16];
        }
        while (v16);
      }

      if (a2) {
        v21 = @"updatedPlace";
      }
      else {
        v21 = @"updated_place";
      }
      [v4 setObject:v13 forKey:v21];
    }
    if ((*(_WORD *)(a1 + 88) & 2) != 0)
    {
      v22 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 56)];
      if (a2) {
        v23 = @"transitLineMuid";
      }
      else {
        v23 = @"transit_line_muid";
      }
      [v4 setObject:v22 forKey:v23];
    }
    v24 = [(id)a1 localizedDescription];
    if (v24)
    {
      if (a2) {
        v25 = @"localizedDescription";
      }
      else {
        v25 = @"localized_description";
      }
      [v4 setObject:v24 forKey:v25];
    }

    v26 = [(id)a1 localizedAlertText];
    if (v26)
    {
      if (a2) {
        v27 = @"localizedAlertText";
      }
      else {
        v27 = @"localized_alert_text";
      }
      [v4 setObject:v26 forKey:v27];
    }

    if ((*(_WORD *)(a1 + 88) & 4) != 0)
    {
      uint64_t v28 = *(int *)(a1 + 84);
      if (v28 >= 6)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 84));
        v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v29 = off_1E53E6E58[v28];
      }
      if (a2) {
        v30 = @"displayStyle";
      }
      else {
        v30 = @"display_style";
      }
      [v4 setObject:v29 forKey:v30];
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPResolution _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPResolution)initWithDictionary:(id)a3
{
  return (GEORPResolution *)-[GEORPResolution _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"resolutionDate";
      }
      else {
        objc_super v6 = @"resolution_date";
      }
      id v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v7 doubleValue];
        objc_msgSend(a1, "setResolutionDate:");
      }

      if (a3) {
        objc_super v8 = @"displayRegion";
      }
      else {
        objc_super v8 = @"display_region";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v10 = [GEOMapRegion alloc];
        if (a3) {
          uint64_t v11 = [(GEOMapRegion *)v10 initWithJSON:v9];
        }
        else {
          uint64_t v11 = [(GEOMapRegion *)v10 initWithDictionary:v9];
        }
        v12 = (void *)v11;
        [a1 setDisplayRegion:v11];
      }
      if (a3) {
        v13 = @"localizedChangeList";
      }
      else {
        v13 = @"localized_change_list";
      }
      id v14 = [v5 objectForKeyedSubscript:v13];
      objc_opt_class();
      id v47 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        id v15 = v14;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v52 objects:v57 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v53;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v53 != v18) {
                objc_enumerationMutation(v15);
              }
              v20 = *(void **)(*((void *)&v52 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v21 = (void *)[v20 copy];
                [a1 addLocalizedChangeList:v21];
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v52 objects:v57 count:16];
          }
          while (v17);
        }

        id v5 = v47;
      }

      if (a3) {
        v22 = @"updatedPlace";
      }
      else {
        v22 = @"updated_place";
      }
      v23 = [v5 objectForKeyedSubscript:v22];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        v46 = v23;
        id v24 = v23;
        uint64_t v25 = [v24 countByEnumeratingWithState:&v48 objects:v56 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v49;
          do
          {
            for (uint64_t j = 0; j != v26; ++j)
            {
              if (*(void *)v49 != v27) {
                objc_enumerationMutation(v24);
              }
              uint64_t v29 = *(void *)(*((void *)&v48 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v30 = [GEOPDPlace alloc];
                if (a3) {
                  uint64_t v31 = [(GEOPDPlace *)v30 initWithJSON:v29];
                }
                else {
                  uint64_t v31 = [(GEOPDPlace *)v30 initWithDictionary:v29];
                }
                long long v32 = (void *)v31;
                objc_msgSend(a1, "addUpdatedPlace:", v31, v46);
              }
            }
            uint64_t v26 = [v24 countByEnumeratingWithState:&v48 objects:v56 count:16];
          }
          while (v26);
        }

        v23 = v46;
        id v5 = v47;
      }

      if (a3) {
        long long v33 = @"transitLineMuid";
      }
      else {
        long long v33 = @"transit_line_muid";
      }
      long long v34 = objc_msgSend(v5, "objectForKeyedSubscript:", v33, v46);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setTransitLineMuid:", objc_msgSend(v34, "unsignedLongLongValue"));
      }

      if (a3) {
        long long v35 = @"localizedDescription";
      }
      else {
        long long v35 = @"localized_description";
      }
      v36 = [v5 objectForKeyedSubscript:v35];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v37 = (void *)[v36 copy];
        [a1 setLocalizedDescription:v37];
      }
      if (a3) {
        v38 = @"localizedAlertText";
      }
      else {
        v38 = @"localized_alert_text";
      }
      v39 = [v5 objectForKeyedSubscript:v38];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v40 = (void *)[v39 copy];
        [a1 setLocalizedAlertText:v40];
      }
      if (a3) {
        v41 = @"displayStyle";
      }
      else {
        v41 = @"display_style";
      }
      v42 = [v5 objectForKeyedSubscript:v41];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v43 = v42;
        if ([v43 isEqualToString:@"SHOW_ALL"])
        {
          uint64_t v44 = 0;
        }
        else if ([v43 isEqualToString:@"NONE"])
        {
          uint64_t v44 = 1;
        }
        else if ([v43 isEqualToString:@"SHOW_REGION"])
        {
          uint64_t v44 = 2;
        }
        else if ([v43 isEqualToString:@"SHOW_SINGLE_PIN"])
        {
          uint64_t v44 = 3;
        }
        else if ([v43 isEqualToString:@"SHOW_PLACE_CARD"])
        {
          uint64_t v44 = 4;
        }
        else if ([v43 isEqualToString:@"SHOW_TRANSIT_LINE"])
        {
          uint64_t v44 = 5;
        }
        else
        {
          uint64_t v44 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_83:

          goto LABEL_84;
        }
        uint64_t v44 = [v42 intValue];
      }
      [a1 setDisplayStyle:v44];
      goto LABEL_83;
    }
  }
LABEL_84:

  return a1;
}

- (GEORPResolution)initWithJSON:(id)a3
{
  return (GEORPResolution *)-[GEORPResolution _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_3105;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_3106;
    }
    GEORPResolutionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORPResolutionCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPResolutionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPResolutionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x1F8) == 0))
  {
    id v14 = self->_reader;
    objc_sync_enter(v14);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v15 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v15];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v14);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPResolution *)self readAll:0];
    if (*(_WORD *)&self->_flags) {
      PBDataWriterWriteDoubleField();
    }
    if (self->_displayRegion) {
      PBDataWriterWriteSubmessage();
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    objc_super v6 = self->_localizedChangeLists;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v7);
    }

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v10 = self->_updatedPlaces;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v11);
    }

    if ((*(_WORD *)&self->_flags & 2) != 0) {
      PBDataWriterWriteUint64Field();
    }
    if (self->_localizedDescription) {
      PBDataWriterWriteStringField();
    }
    if (self->_localizedAlertText) {
      PBDataWriterWriteStringField();
    }
    if ((*(_WORD *)&self->_flags & 4) != 0) {
      PBDataWriterWriteInt32Field();
    }
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  -[GEORPResolution _readDisplayRegion]((uint64_t)self);
  if ([(GEOMapRegion *)self->_displayRegion hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPResolution _readUpdatedPlaces]((uint64_t)self);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  objc_super v6 = self->_updatedPlaces;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (void)v12))
        {
          BOOL v5 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v5 = 0;
LABEL_13:

  return v5;
}

- (void)copyTo:(id)a3
{
  long long v13 = (id *)a3;
  [(GEORPResolution *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v13 + 1, self->_reader);
  *((_DWORD *)v13 + 18) = self->_readerMarkPos;
  *((_DWORD *)v13 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (*(_WORD *)&self->_flags)
  {
    v13[6] = *(id *)&self->_resolutionDate;
    *((_WORD *)v13 + 44) |= 1u;
  }
  if (self->_displayRegion) {
    objc_msgSend(v13, "setDisplayRegion:");
  }
  if ([(GEORPResolution *)self localizedChangeListsCount])
  {
    [v13 clearLocalizedChangeLists];
    unint64_t v4 = [(GEORPResolution *)self localizedChangeListsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEORPResolution *)self localizedChangeListAtIndex:i];
        [v13 addLocalizedChangeList:v7];
      }
    }
  }
  if ([(GEORPResolution *)self updatedPlacesCount])
  {
    [v13 clearUpdatedPlaces];
    unint64_t v8 = [(GEORPResolution *)self updatedPlacesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEORPResolution *)self updatedPlaceAtIndex:j];
        [v13 addUpdatedPlace:v11];
      }
    }
  }
  long long v12 = v13;
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    v13[7] = self->_transitLineMuid;
    *((_WORD *)v13 + 44) |= 2u;
  }
  if (self->_localizedDescription)
  {
    objc_msgSend(v13, "setLocalizedDescription:");
    long long v12 = v13;
  }
  if (self->_localizedAlertText)
  {
    objc_msgSend(v13, "setLocalizedAlertText:");
    long long v12 = v13;
  }
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *((_DWORD *)v12 + 21) = self->_displayStyle;
    *((_WORD *)v12 + 44) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x100) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORPResolutionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPResolution *)self readAll:0];
  if (*(_WORD *)&self->_flags)
  {
    *(double *)(v5 + 48) = self->_resolutionDate;
    *(_WORD *)(v5 + 88) |= 1u;
  }
  id v9 = [(GEOMapRegion *)self->_displayRegion copyWithZone:a3];
  v10 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v9;

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v11 = self->_localizedChangeLists;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v31 != v13) {
          objc_enumerationMutation(v11);
        }
        long long v15 = (void *)[*(id *)(*((void *)&v30 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addLocalizedChangeList:v15];
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v12);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v16 = self->_updatedPlaces;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(v16);
        }
        long long v20 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * j), "copyWithZone:", a3, (void)v26);
        [(id)v5 addUpdatedPlace:v20];
      }
      uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v17);
  }

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(void *)(v5 + 56) = self->_transitLineMuid;
    *(_WORD *)(v5 + 88) |= 2u;
  }
  uint64_t v21 = -[NSString copyWithZone:](self->_localizedDescription, "copyWithZone:", a3, (void)v26);
  long long v22 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v21;

  uint64_t v23 = [(NSString *)self->_localizedAlertText copyWithZone:a3];
  id v24 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v23;

  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 84) = self->_displayStyle;
    *(_WORD *)(v5 + 88) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  [(GEORPResolution *)self readAll:1];
  [v4 readAll:1];
  __int16 v5 = *((_WORD *)v4 + 44);
  if (*(_WORD *)&self->_flags)
  {
    if ((v5 & 1) == 0 || self->_resolutionDate != *((double *)v4 + 6)) {
      goto LABEL_26;
    }
  }
  else if (v5)
  {
LABEL_26:
    BOOL v13 = 0;
    goto LABEL_27;
  }
  displayRegion = self->_displayRegion;
  if ((unint64_t)displayRegion | *((void *)v4 + 2) && !-[GEOMapRegion isEqual:](displayRegion, "isEqual:")) {
    goto LABEL_26;
  }
  localizedChangeLists = self->_localizedChangeLists;
  if ((unint64_t)localizedChangeLists | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](localizedChangeLists, "isEqual:")) {
      goto LABEL_26;
    }
  }
  updatedPlaces = self->_updatedPlaces;
  if ((unint64_t)updatedPlaces | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](updatedPlaces, "isEqual:")) {
      goto LABEL_26;
    }
  }
  __int16 v9 = *((_WORD *)v4 + 44);
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_transitLineMuid != *((void *)v4 + 7)) {
      goto LABEL_26;
    }
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_26;
  }
  localizedDescription = self->_localizedDescription;
  if ((unint64_t)localizedDescription | *((void *)v4 + 5)
    && !-[NSString isEqual:](localizedDescription, "isEqual:"))
  {
    goto LABEL_26;
  }
  localizedAlertText = self->_localizedAlertText;
  if ((unint64_t)localizedAlertText | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](localizedAlertText, "isEqual:")) {
      goto LABEL_26;
    }
  }
  __int16 v12 = *((_WORD *)v4 + 44);
  BOOL v13 = (v12 & 4) == 0;
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    if ((v12 & 4) == 0 || self->_displayStyle != *((_DWORD *)v4 + 21)) {
      goto LABEL_26;
    }
    BOOL v13 = 1;
  }
LABEL_27:

  return v13;
}

- (unint64_t)hash
{
  [(GEORPResolution *)self readAll:1];
  if (*(_WORD *)&self->_flags)
  {
    double resolutionDate = self->_resolutionDate;
    double v5 = -resolutionDate;
    if (resolutionDate >= 0.0) {
      double v5 = self->_resolutionDate;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    unint64_t v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v3 += (unint64_t)v7;
      }
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  unint64_t v8 = [(GEOMapRegion *)self->_displayRegion hash];
  uint64_t v9 = [(NSMutableArray *)self->_localizedChangeLists hash];
  uint64_t v10 = [(NSMutableArray *)self->_updatedPlaces hash];
  if ((*(_WORD *)&self->_flags & 2) != 0) {
    unint64_t v11 = 2654435761u * self->_transitLineMuid;
  }
  else {
    unint64_t v11 = 0;
  }
  NSUInteger v12 = [(NSString *)self->_localizedDescription hash];
  NSUInteger v13 = [(NSString *)self->_localizedAlertText hash];
  if ((*(_WORD *)&self->_flags & 4) != 0) {
    uint64_t v14 = 2654435761 * self->_displayStyle;
  }
  else {
    uint64_t v14 = 0;
  }
  return v8 ^ v3 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((_WORD *)v4 + 44))
  {
    self->_double resolutionDate = *((double *)v4 + 6);
    *(_WORD *)&self->_flags |= 1u;
  }
  displayRegion = self->_displayRegion;
  uint64_t v6 = *((void *)v4 + 2);
  if (displayRegion)
  {
    if (v6) {
      -[GEOMapRegion mergeFrom:](displayRegion, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEORPResolution setDisplayRegion:](self, "setDisplayRegion:");
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = *((id *)v4 + 4);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        [(GEORPResolution *)self addLocalizedChangeList:*(void *)(*((void *)&v21 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v9);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = *((id *)v4 + 8);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        -[GEORPResolution addUpdatedPlace:](self, "addUpdatedPlace:", *(void *)(*((void *)&v17 + 1) + 8 * j), (void)v17);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }

  if ((*((_WORD *)v4 + 44) & 2) != 0)
  {
    self->_transitLineMuid = *((void *)v4 + 7);
    *(_WORD *)&self->_flags |= 2u;
  }
  if (*((void *)v4 + 5)) {
    -[GEORPResolution setLocalizedDescription:](self, "setLocalizedDescription:");
  }
  if (*((void *)v4 + 3)) {
    -[GEORPResolution setLocalizedAlertText:](self, "setLocalizedAlertText:");
  }
  if ((*((_WORD *)v4 + 44) & 4) != 0)
  {
    self->_displayStyle = *((_DWORD *)v4 + 21);
    *(_WORD *)&self->_flags |= 4u;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedPlaces, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_localizedChangeLists, 0);
  objc_storeStrong((id *)&self->_localizedAlertText, 0);
  objc_storeStrong((id *)&self->_displayRegion, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end