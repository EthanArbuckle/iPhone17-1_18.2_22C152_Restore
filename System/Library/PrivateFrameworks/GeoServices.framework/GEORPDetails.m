@interface GEORPDetails
+ (BOOL)isValid:(id)a3;
+ (Class)placeType;
- (BOOL)hasButton;
- (BOOL)hasDirectionsType;
- (BOOL)hasDisplayRegion;
- (BOOL)hasDisplayStyle;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasLabel;
- (BOOL)hasLocalizedDescription;
- (BOOL)hasLocalizedTitle;
- (BOOL)hasMapType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOMapRegion)displayRegion;
- (GEORPButton)button;
- (GEORPDetails)init;
- (GEORPDetails)initWithData:(id)a3;
- (GEORPDetails)initWithDictionary:(id)a3;
- (GEORPDetails)initWithJSON:(id)a3;
- (GEORPUpdatedLabel)label;
- (NSMutableArray)places;
- (NSString)localizedDescription;
- (NSString)localizedTitle;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)directionsTypeAsString:(int)a3;
- (id)displayStyleAsString:(int)a3;
- (id)jsonRepresentation;
- (id)mapTypeAsString:(int)a3;
- (id)placeAtIndex:(unint64_t)a3;
- (int)StringAsDirectionsType:(id)a3;
- (int)StringAsDisplayStyle:(id)a3;
- (int)StringAsMapType:(id)a3;
- (int)directionsType;
- (int)displayStyle;
- (int)mapType;
- (unint64_t)hash;
- (unint64_t)placesCount;
- (void)_addNoFlagsPlace:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readButton;
- (void)_readDisplayRegion;
- (void)_readLabel;
- (void)_readLocalizedDescription;
- (void)_readLocalizedTitle;
- (void)_readPlaces;
- (void)addPlace:(id)a3;
- (void)clearPlaces;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setButton:(id)a3;
- (void)setDirectionsType:(int)a3;
- (void)setDisplayRegion:(id)a3;
- (void)setDisplayStyle:(int)a3;
- (void)setHasDirectionsType:(BOOL)a3;
- (void)setHasDisplayStyle:(BOOL)a3;
- (void)setHasMapType:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setLocalizedDescription:(id)a3;
- (void)setLocalizedTitle:(id)a3;
- (void)setMapType:(int)a3;
- (void)setPlaces:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPDetails

- (GEORPDetails)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPDetails;
  v2 = [(GEORPDetails *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPDetails)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPDetails;
  v3 = [(GEORPDetails *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)displayStyle
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0) {
    return self->_displayStyle;
  }
  else {
    return 1;
  }
}

- (void)setDisplayStyle:(int)a3
{
  *(_WORD *)&self->_flags |= 0x202u;
  self->_displayStyle = a3;
}

- (void)setHasDisplayStyle:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 514;
  }
  else {
    __int16 v3 = 512;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasDisplayStyle
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (id)displayStyleAsString:(int)a3
{
  int v3 = a3 - 1;
  if (a3 - 1) < 6 && ((0x3Bu >> v3))
  {
    v4 = off_1E53E6A30[v3];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (int)StringAsDisplayStyle:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SHOW_REGION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SHOW_SINGLE_PIN"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SHOW_MAP_LABEL"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SHOW_DIRECTIONS"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"SHOW_DESCRIPTION_ONLY"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (void)_readLocalizedTitle
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 88) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocalizedTitle_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasLocalizedTitle
{
  return self->_localizedTitle != 0;
}

- (NSString)localizedTitle
{
  -[GEORPDetails _readLocalizedTitle]((uint64_t)self);
  localizedTitle = self->_localizedTitle;

  return localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
  *(_WORD *)&self->_flags |= 0x280u;
  objc_storeStrong((id *)&self->_localizedTitle, a3);
}

- (void)_readLocalizedDescription
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 88) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocalizedDescription_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasLocalizedDescription
{
  return self->_localizedDescription != 0;
}

- (NSString)localizedDescription
{
  -[GEORPDetails _readLocalizedDescription]((uint64_t)self);
  localizedDescription = self->_localizedDescription;

  return localizedDescription;
}

- (void)setLocalizedDescription:(id)a3
{
  *(_WORD *)&self->_flags |= 0x240u;
  objc_storeStrong((id *)&self->_localizedDescription, a3);
}

- (void)_readDisplayRegion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 88) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayRegion_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasDisplayRegion
{
  return self->_displayRegion != 0;
}

- (GEOMapRegion)displayRegion
{
  -[GEORPDetails _readDisplayRegion]((uint64_t)self);
  displayRegion = self->_displayRegion;

  return displayRegion;
}

- (void)setDisplayRegion:(id)a3
{
  *(_WORD *)&self->_flags |= 0x210u;
  objc_storeStrong((id *)&self->_displayRegion, a3);
}

- (void)_readPlaces
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 88) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaces_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)places
{
  -[GEORPDetails _readPlaces]((uint64_t)self);
  places = self->_places;

  return places;
}

- (void)setPlaces:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  places = self->_places;
  self->_places = v4;
}

- (void)clearPlaces
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  places = self->_places;

  [(NSMutableArray *)places removeAllObjects];
}

- (void)addPlace:(id)a3
{
  id v4 = a3;
  -[GEORPDetails _readPlaces]((uint64_t)self);
  -[GEORPDetails _addNoFlagsPlace:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
}

- (void)_addNoFlagsPlace:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 56);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v5;

      id v4 = *(void **)(a1 + 56);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)placesCount
{
  -[GEORPDetails _readPlaces]((uint64_t)self);
  places = self->_places;

  return [(NSMutableArray *)places count];
}

- (id)placeAtIndex:(unint64_t)a3
{
  -[GEORPDetails _readPlaces]((uint64_t)self);
  places = self->_places;

  return (id)[(NSMutableArray *)places objectAtIndex:a3];
}

+ (Class)placeType
{
  return (Class)objc_opt_class();
}

- (void)_readLabel
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 88) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLabel_tags_3);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (GEORPUpdatedLabel)label
{
  -[GEORPDetails _readLabel]((uint64_t)self);
  label = self->_label;

  return label;
}

- (void)setLabel:(id)a3
{
  *(_WORD *)&self->_flags |= 0x220u;
  objc_storeStrong((id *)&self->_label, a3);
}

- (int)directionsType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_directionsType;
  }
  else {
    return 0;
  }
}

- (void)setDirectionsType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x201u;
  self->_directionsType = a3;
}

- (void)setHasDirectionsType:(BOOL)a3
{
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x200;
}

- (BOOL)hasDirectionsType
{
  return *(_WORD *)&self->_flags & 1;
}

- (id)directionsTypeAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53E6A60[a3];
  }

  return v3;
}

- (int)StringAsDirectionsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AUTOMOBILE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TRANSIT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WALKING"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"BICYCLE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"UNKNOWN_TRANSPORT_TYPE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FERRY"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"RIDESHARE"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)mapType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 4) != 0) {
    return self->_mapType;
  }
  else {
    return 0;
  }
}

- (void)setMapType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x204u;
  self->_mapType = a3;
}

- (void)setHasMapType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 516;
  }
  else {
    __int16 v3 = 512;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasMapType
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (id)mapTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E53E6A98[a3];
  }

  return v3;
}

- (int)StringAsMapType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"MAP_TYPE_NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MAP_TYPE_STANDARD"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MAP_TYPE_SATELLITE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MAP_TYPE_HYBRID"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"MAP_TYPE_TRANSIT"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readButton
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 88) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readButton_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasButton
{
  return self->_button != 0;
}

- (GEORPButton)button
{
  -[GEORPDetails _readButton]((uint64_t)self);
  button = self->_button;

  return button;
}

- (void)setButton:(id)a3
{
  *(_WORD *)&self->_flags |= 0x208u;
  objc_storeStrong((id *)&self->_button, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPDetails;
  int v4 = [(GEORPDetails *)&v8 description];
  id v5 = [(GEORPDetails *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPDetails _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ((*(_WORD *)(a1 + 88) & 2) != 0)
    {
      unsigned int v5 = *(_DWORD *)(a1 + 80) - 1;
      if (v5 < 6 && ((0x3Bu >> v5) & 1) != 0)
      {
        objc_super v6 = off_1E53E6A30[v5];
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 80));
        objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      if (a2) {
        id v7 = @"displayStyle";
      }
      else {
        id v7 = @"display_style";
      }
      [v4 setObject:v6 forKey:v7];
    }
    objc_super v8 = [(id)a1 localizedTitle];
    if (v8)
    {
      if (a2) {
        v9 = @"localizedTitle";
      }
      else {
        v9 = @"localized_title";
      }
      [v4 setObject:v8 forKey:v9];
    }

    v10 = [(id)a1 localizedDescription];
    if (v10)
    {
      if (a2) {
        v11 = @"localizedDescription";
      }
      else {
        v11 = @"localized_description";
      }
      [v4 setObject:v10 forKey:v11];
    }

    v12 = [(id)a1 displayRegion];
    v13 = v12;
    if (v12)
    {
      if (a2)
      {
        v14 = [v12 jsonRepresentation];
        v15 = @"displayRegion";
      }
      else
      {
        v14 = [v12 dictionaryRepresentation];
        v15 = @"display_region";
      }
      [v4 setObject:v14 forKey:v15];
    }
    if ([*(id *)(a1 + 56) count])
    {
      v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v17 = *(id *)(a1 + 56);
      uint64_t v18 = [v17 countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v39;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v39 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            if (a2) {
              [v22 jsonRepresentation];
            }
            else {
            v23 = [v22 dictionaryRepresentation];
            }
            [v16 addObject:v23];
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v38 objects:v42 count:16];
        }
        while (v19);
      }

      [v4 setObject:v16 forKey:@"place"];
    }
    v24 = [(id)a1 label];
    v25 = v24;
    if (v24)
    {
      if (a2) {
        [v24 jsonRepresentation];
      }
      else {
      v26 = [v24 dictionaryRepresentation];
      }
      [v4 setObject:v26 forKey:@"label"];
    }
    __int16 v27 = *(_WORD *)(a1 + 88);
    if (v27)
    {
      uint64_t v28 = *(int *)(a1 + 76);
      if (v28 >= 7)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 76));
        v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v29 = off_1E53E6A60[v28];
      }
      if (a2) {
        v30 = @"directionsType";
      }
      else {
        v30 = @"directions_type";
      }
      [v4 setObject:v29 forKey:v30];

      __int16 v27 = *(_WORD *)(a1 + 88);
    }
    if ((v27 & 4) != 0)
    {
      uint64_t v31 = *(int *)(a1 + 84);
      if (v31 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 84));
        v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v32 = off_1E53E6A98[v31];
      }
      if (a2) {
        v33 = @"mapType";
      }
      else {
        v33 = @"map_type";
      }
      [v4 setObject:v32 forKey:v33];
    }
    v34 = [(id)a1 button];
    v35 = v34;
    if (v34)
    {
      if (a2) {
        [v34 jsonRepresentation];
      }
      else {
      v36 = [v34 dictionaryRepresentation];
      }
      [v4 setObject:v36 forKey:@"button"];
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
  return -[GEORPDetails _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPDetails)initWithDictionary:(id)a3
{
  return (GEORPDetails *)-[GEORPDetails _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_107;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_107;
  }
  if (a3) {
    objc_super v6 = @"displayStyle";
  }
  else {
    objc_super v6 = @"display_style";
  }
  id v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"SHOW_REGION"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"SHOW_SINGLE_PIN"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"SHOW_MAP_LABEL"])
    {
      uint64_t v9 = 4;
    }
    else if ([v8 isEqualToString:@"SHOW_DIRECTIONS"])
    {
      uint64_t v9 = 5;
    }
    else if ([v8 isEqualToString:@"SHOW_DESCRIPTION_ONLY"])
    {
      uint64_t v9 = 6;
    }
    else
    {
      uint64_t v9 = 1;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_22;
    }
    uint64_t v9 = [v7 intValue];
  }
  [a1 setDisplayStyle:v9];
LABEL_22:

  if (a3) {
    v10 = @"localizedTitle";
  }
  else {
    v10 = @"localized_title";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12 = (void *)[v11 copy];
    [a1 setLocalizedTitle:v12];
  }
  if (a3) {
    v13 = @"localizedDescription";
  }
  else {
    v13 = @"localized_description";
  }
  v14 = [v5 objectForKeyedSubscript:v13];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v15 = (void *)[v14 copy];
    [a1 setLocalizedDescription:v15];
  }
  if (a3) {
    v16 = @"displayRegion";
  }
  else {
    v16 = @"display_region";
  }
  id v17 = [v5 objectForKeyedSubscript:v16];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v18 = [GEOMapRegion alloc];
    if (a3) {
      uint64_t v19 = [(GEOMapRegion *)v18 initWithJSON:v17];
    }
    else {
      uint64_t v19 = [(GEOMapRegion *)v18 initWithDictionary:v17];
    }
    uint64_t v20 = (void *)v19;
    [a1 setDisplayRegion:v19];
  }
  v21 = [v5 objectForKeyedSubscript:@"place"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v48 = v5;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v22 = v21;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v49 objects:v53 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v50 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = *(void *)(*((void *)&v49 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v28 = [GEOPDPlace alloc];
            if (a3) {
              uint64_t v29 = [(GEOPDPlace *)v28 initWithJSON:v27];
            }
            else {
              uint64_t v29 = [(GEOPDPlace *)v28 initWithDictionary:v27];
            }
            v30 = (void *)v29;
            [a1 addPlace:v29];
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v49 objects:v53 count:16];
      }
      while (v24);
    }

    id v5 = v48;
  }

  uint64_t v31 = [v5 objectForKeyedSubscript:@"label"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v32 = [GEORPUpdatedLabel alloc];
    if (a3) {
      uint64_t v33 = [(GEORPUpdatedLabel *)v32 initWithJSON:v31];
    }
    else {
      uint64_t v33 = [(GEORPUpdatedLabel *)v32 initWithDictionary:v31];
    }
    v34 = (void *)v33;
    [a1 setLabel:v33];
  }
  if (a3) {
    v35 = @"directionsType";
  }
  else {
    v35 = @"directions_type";
  }
  v36 = [v5 objectForKeyedSubscript:v35];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v37 = v36;
    if ([v37 isEqualToString:@"AUTOMOBILE"])
    {
      uint64_t v38 = 0;
    }
    else if ([v37 isEqualToString:@"TRANSIT"])
    {
      uint64_t v38 = 1;
    }
    else if ([v37 isEqualToString:@"WALKING"])
    {
      uint64_t v38 = 2;
    }
    else if ([v37 isEqualToString:@"BICYCLE"])
    {
      uint64_t v38 = 3;
    }
    else if ([v37 isEqualToString:@"UNKNOWN_TRANSPORT_TYPE"])
    {
      uint64_t v38 = 4;
    }
    else if ([v37 isEqualToString:@"FERRY"])
    {
      uint64_t v38 = 5;
    }
    else if ([v37 isEqualToString:@"RIDESHARE"])
    {
      uint64_t v38 = 6;
    }
    else
    {
      uint64_t v38 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_82;
    }
    uint64_t v38 = [v36 intValue];
  }
  [a1 setDirectionsType:v38];
LABEL_82:

  if (a3) {
    long long v39 = @"mapType";
  }
  else {
    long long v39 = @"map_type";
  }
  long long v40 = [v5 objectForKeyedSubscript:v39];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v41 = v40;
    if ([v41 isEqualToString:@"MAP_TYPE_NONE"])
    {
      uint64_t v42 = 0;
    }
    else if ([v41 isEqualToString:@"MAP_TYPE_STANDARD"])
    {
      uint64_t v42 = 1;
    }
    else if ([v41 isEqualToString:@"MAP_TYPE_SATELLITE"])
    {
      uint64_t v42 = 2;
    }
    else if ([v41 isEqualToString:@"MAP_TYPE_HYBRID"])
    {
      uint64_t v42 = 3;
    }
    else if ([v41 isEqualToString:@"MAP_TYPE_TRANSIT"])
    {
      uint64_t v42 = 4;
    }
    else
    {
      uint64_t v42 = 0;
    }

    goto LABEL_100;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v42 = [v40 intValue];
LABEL_100:
    [a1 setMapType:v42];
  }

  uint64_t v43 = [v5 objectForKeyedSubscript:@"button"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v44 = [GEORPButton alloc];
    if (a3) {
      uint64_t v45 = [(GEORPButton *)v44 initWithJSON:v43];
    }
    else {
      uint64_t v45 = [(GEORPButton *)v44 initWithDictionary:v43];
    }
    v46 = (void *)v45;
    [a1 setButton:v45];
  }
LABEL_107:

  return a1;
}

- (GEORPDetails)initWithJSON:(id)a3
{
  return (GEORPDetails *)-[GEORPDetails _initWithDictionary:isJSON:](self, a3, 1);
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
      id v8 = (int *)&readAll__recursiveTag_693;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_694;
    }
    GEORPDetailsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORPDetailsCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPDetailsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPDetailsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPDetailsIsDirty((uint64_t)self) & 1) == 0)
  {
    v11 = self->_reader;
    objc_sync_enter(v11);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v12 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v12];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v11);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPDetails *)self readAll:0];
    if ((*(_WORD *)&self->_flags & 2) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_localizedTitle) {
      PBDataWriterWriteStringField();
    }
    if (self->_localizedDescription) {
      PBDataWriterWriteStringField();
    }
    if (self->_displayRegion) {
      PBDataWriterWriteSubmessage();
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    objc_super v6 = self->_places;
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

    if (self->_label) {
      PBDataWriterWriteSubmessage();
    }
    __int16 flags = (__int16)self->_flags;
    if (flags)
    {
      PBDataWriterWriteInt32Field();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 4) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_button) {
      PBDataWriterWriteSubmessage();
    }
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  -[GEORPDetails _readDisplayRegion]((uint64_t)self);
  if ([(GEOMapRegion *)self->_displayRegion hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPDetails _readLabel]((uint64_t)self);
  if ([(GEORPUpdatedLabel *)self->_label hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPDetails _readPlaces]((uint64_t)self);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  objc_super v6 = self->_places;
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
          goto LABEL_14;
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
LABEL_14:

  return v5;
}

- (void)copyTo:(id)a3
{
  v10 = (id *)a3;
  [(GEORPDetails *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v10 + 1, self->_reader);
  *((_DWORD *)v10 + 16) = self->_readerMarkPos;
  *((_DWORD *)v10 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v10 + 20) = self->_displayStyle;
    *((_WORD *)v10 + 44) |= 2u;
  }
  if (self->_localizedTitle) {
    objc_msgSend(v10, "setLocalizedTitle:");
  }
  if (self->_localizedDescription) {
    objc_msgSend(v10, "setLocalizedDescription:");
  }
  if (self->_displayRegion) {
    objc_msgSend(v10, "setDisplayRegion:");
  }
  if ([(GEORPDetails *)self placesCount])
  {
    [v10 clearPlaces];
    unint64_t v4 = [(GEORPDetails *)self placesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEORPDetails *)self placeAtIndex:i];
        [v10 addPlace:v7];
      }
    }
  }
  if (self->_label) {
    objc_msgSend(v10, "setLabel:");
  }
  __int16 flags = (__int16)self->_flags;
  uint64_t v9 = v10;
  if (flags)
  {
    *((_DWORD *)v10 + 19) = self->_directionsType;
    *((_WORD *)v10 + 44) |= 1u;
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *((_DWORD *)v10 + 21) = self->_mapType;
    *((_WORD *)v10 + 44) |= 4u;
  }
  if (self->_button)
  {
    objc_msgSend(v10, "setButton:");
    uint64_t v9 = v10;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x200) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORPDetailsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_19;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPDetails *)self readAll:0];
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_displayStyle;
    *(_WORD *)(v5 + 88) |= 2u;
  }
  uint64_t v9 = [(NSString *)self->_localizedTitle copyWithZone:a3];
  v10 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v9;

  uint64_t v11 = [(NSString *)self->_localizedDescription copyWithZone:a3];
  long long v12 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v11;

  id v13 = [(GEOMapRegion *)self->_displayRegion copyWithZone:a3];
  long long v14 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v13;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v15 = self->_places;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v15);
        }
        uint64_t v19 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * i), "copyWithZone:", a3, (void)v25);
        [(id)v5 addPlace:v19];
      }
      uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v16);
  }

  id v20 = [(GEORPUpdatedLabel *)self->_label copyWithZone:a3];
  v21 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v20;

  __int16 flags = (__int16)self->_flags;
  if (flags)
  {
    *(_DWORD *)(v5 + 76) = self->_directionsType;
    *(_WORD *)(v5 + 88) |= 1u;
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 84) = self->_mapType;
    *(_WORD *)(v5 + 88) |= 4u;
  }
  id v23 = -[GEORPButton copyWithZone:](self->_button, "copyWithZone:", a3, (void)v25);
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v23;
LABEL_19:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_29;
  }
  [(GEORPDetails *)self readAll:1];
  [v4 readAll:1];
  __int16 v5 = *((_WORD *)v4 + 44);
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    if ((v5 & 2) == 0 || self->_displayStyle != *((_DWORD *)v4 + 20)) {
      goto LABEL_29;
    }
  }
  else if ((v5 & 2) != 0)
  {
LABEL_29:
    char v14 = 0;
    goto LABEL_30;
  }
  localizedTitle = self->_localizedTitle;
  if ((unint64_t)localizedTitle | *((void *)v4 + 6)
    && !-[NSString isEqual:](localizedTitle, "isEqual:"))
  {
    goto LABEL_29;
  }
  localizedDescription = self->_localizedDescription;
  if ((unint64_t)localizedDescription | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](localizedDescription, "isEqual:")) {
      goto LABEL_29;
    }
  }
  displayRegion = self->_displayRegion;
  if ((unint64_t)displayRegion | *((void *)v4 + 3))
  {
    if (!-[GEOMapRegion isEqual:](displayRegion, "isEqual:")) {
      goto LABEL_29;
    }
  }
  places = self->_places;
  if ((unint64_t)places | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](places, "isEqual:")) {
      goto LABEL_29;
    }
  }
  label = self->_label;
  if ((unint64_t)label | *((void *)v4 + 4))
  {
    if (!-[GEORPUpdatedLabel isEqual:](label, "isEqual:")) {
      goto LABEL_29;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v12 = *((_WORD *)v4 + 44);
  if (flags)
  {
    if ((v12 & 1) == 0 || self->_directionsType != *((_DWORD *)v4 + 19)) {
      goto LABEL_29;
    }
  }
  else if (v12)
  {
    goto LABEL_29;
  }
  if ((flags & 4) != 0)
  {
    if ((v12 & 4) == 0 || self->_mapType != *((_DWORD *)v4 + 21)) {
      goto LABEL_29;
    }
  }
  else if ((v12 & 4) != 0)
  {
    goto LABEL_29;
  }
  button = self->_button;
  if ((unint64_t)button | *((void *)v4 + 2)) {
    char v14 = -[GEORPButton isEqual:](button, "isEqual:");
  }
  else {
    char v14 = 1;
  }
LABEL_30:

  return v14;
}

- (unint64_t)hash
{
  [(GEORPDetails *)self readAll:1];
  if ((*(_WORD *)&self->_flags & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_displayStyle;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_localizedTitle hash];
  NSUInteger v5 = [(NSString *)self->_localizedDescription hash];
  unint64_t v6 = [(GEOMapRegion *)self->_displayRegion hash];
  uint64_t v7 = [(NSMutableArray *)self->_places hash];
  unint64_t v8 = [(GEORPUpdatedLabel *)self->_label hash];
  __int16 flags = (__int16)self->_flags;
  if (flags)
  {
    uint64_t v10 = 2654435761 * self->_directionsType;
    if ((flags & 4) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ [(GEORPButton *)self->_button hash];
  }
  uint64_t v10 = 0;
  if ((flags & 4) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v11 = 2654435761 * self->_mapType;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ [(GEORPButton *)self->_button hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if ((*((_WORD *)v4 + 44) & 2) != 0)
  {
    self->_displayStyle = *((_DWORD *)v4 + 20);
    *(_WORD *)&self->_flags |= 2u;
  }
  if (*((void *)v4 + 6)) {
    -[GEORPDetails setLocalizedTitle:](self, "setLocalizedTitle:");
  }
  if (*((void *)v4 + 5)) {
    -[GEORPDetails setLocalizedDescription:](self, "setLocalizedDescription:");
  }
  displayRegion = self->_displayRegion;
  uint64_t v6 = *((void *)v4 + 3);
  if (displayRegion)
  {
    if (v6) {
      -[GEOMapRegion mergeFrom:](displayRegion, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEORPDetails setDisplayRegion:](self, "setDisplayRegion:");
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = *((id *)v4 + 7);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        -[GEORPDetails addPlace:](self, "addPlace:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  label = self->_label;
  uint64_t v13 = *((void *)v4 + 4);
  if (label)
  {
    if (v13) {
      -[GEORPUpdatedLabel mergeFrom:](label, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[GEORPDetails setLabel:](self, "setLabel:");
  }
  __int16 v14 = *((_WORD *)v4 + 44);
  if (v14)
  {
    self->_directionsType = *((_DWORD *)v4 + 19);
    *(_WORD *)&self->_flags |= 1u;
    __int16 v14 = *((_WORD *)v4 + 44);
  }
  if ((v14 & 4) != 0)
  {
    self->_mapType = *((_DWORD *)v4 + 21);
    *(_WORD *)&self->_flags |= 4u;
  }
  button = self->_button;
  uint64_t v16 = *((void *)v4 + 2);
  if (button)
  {
    if (v16) {
      -[GEORPButton mergeFrom:](button, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[GEORPDetails setButton:](self, "setButton:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_places, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_displayRegion, 0);
  objc_storeStrong((id *)&self->_button, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end