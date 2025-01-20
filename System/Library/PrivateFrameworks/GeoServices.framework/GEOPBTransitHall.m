@interface GEOPBTransitHall
+ (BOOL)isValid:(id)a3;
+ (Class)zoomNameType;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasHallIndex;
- (BOOL)hasLocation;
- (BOOL)hasMuid;
- (BOOL)hasNameDisplayString;
- (BOOL)hasStationIndex;
- (BOOL)hasStyleAttributes;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLatLng)location;
- (GEOPBTransitHall)init;
- (GEOPBTransitHall)initWithData:(id)a3;
- (GEOPBTransitHall)initWithDictionary:(id)a3;
- (GEOPBTransitHall)initWithJSON:(id)a3;
- (GEOStyleAttributes)styleAttributes;
- (NSMutableArray)zoomNames;
- (NSString)description;
- (NSString)nameDisplayString;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)bestName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)identifier;
- (id)jsonRepresentation;
- (id)zoomNameAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)muid;
- (unint64_t)zoomNamesCount;
- (unsigned)hallIndex;
- (unsigned)stationIndex;
- (void)_addNoFlagsZoomName:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readLocation;
- (void)_readNameDisplayString;
- (void)_readStyleAttributes;
- (void)_readZoomNames;
- (void)addZoomName:(id)a3;
- (void)clearUnknownFields:(BOOL)a3;
- (void)clearZoomNames;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHallIndex:(unsigned int)a3;
- (void)setHasHallIndex:(BOOL)a3;
- (void)setHasMuid:(BOOL)a3;
- (void)setHasStationIndex:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setMuid:(unint64_t)a3;
- (void)setNameDisplayString:(id)a3;
- (void)setStationIndex:(unsigned int)a3;
- (void)setStyleAttributes:(id)a3;
- (void)setZoomNames:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPBTransitHall

- (void)mergeFrom:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  __int16 v5 = *((_WORD *)v4 + 42);
  if ((v5 & 2) != 0)
  {
    self->_hallIndex = *((_DWORD *)v4 + 19);
    *(_WORD *)&self->_flags |= 2u;
    __int16 v5 = *((_WORD *)v4 + 42);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v5 & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_muid = *((void *)v4 + 4);
  *(_WORD *)&self->_flags |= 1u;
  if ((*((_WORD *)v4 + 42) & 4) != 0)
  {
LABEL_4:
    self->_stationIndex = *((_DWORD *)v4 + 20);
    *(_WORD *)&self->_flags |= 4u;
  }
LABEL_5:
  location = self->_location;
  uint64_t v7 = *((void *)v4 + 3);
  if (location)
  {
    if (v7) {
      -[GEOLatLng mergeFrom:](location, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[GEOPBTransitHall setLocation:](self, "setLocation:");
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = *((id *)v4 + 7);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        -[GEOPBTransitHall addZoomName:](self, "addZoomName:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  styleAttributes = self->_styleAttributes;
  uint64_t v14 = *((void *)v4 + 6);
  if (styleAttributes)
  {
    if (v14) {
      -[GEOStyleAttributes mergeFrom:](styleAttributes, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[GEOPBTransitHall setStyleAttributes:](self, "setStyleAttributes:");
  }
  if (*((void *)v4 + 5)) {
    -[GEOPBTransitHall setNameDisplayString:](self, "setNameDisplayString:");
  }
}

- (BOOL)hasStyleAttributes
{
  return self->_styleAttributes != 0;
}

- (void)_readStyleAttributes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitHallReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStyleAttributes_tags_214);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_25;
  }
  [(GEOPBTransitHall *)self readAll:1];
  [v4 readAll:1];
  __int16 flags = (__int16)self->_flags;
  __int16 v6 = *((_WORD *)v4 + 42);
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_hallIndex != *((_DWORD *)v4 + 19)) {
      goto LABEL_25;
    }
  }
  else if ((v6 & 2) != 0)
  {
LABEL_25:
    char v11 = 0;
    goto LABEL_26;
  }
  if (flags)
  {
    if ((v6 & 1) == 0 || self->_muid != *((void *)v4 + 4)) {
      goto LABEL_25;
    }
  }
  else if (v6)
  {
    goto LABEL_25;
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_stationIndex != *((_DWORD *)v4 + 20)) {
      goto LABEL_25;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_25;
  }
  location = self->_location;
  if ((unint64_t)location | *((void *)v4 + 3) && !-[GEOLatLng isEqual:](location, "isEqual:")) {
    goto LABEL_25;
  }
  zoomNames = self->_zoomNames;
  if ((unint64_t)zoomNames | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](zoomNames, "isEqual:")) {
      goto LABEL_25;
    }
  }
  styleAttributes = self->_styleAttributes;
  if ((unint64_t)styleAttributes | *((void *)v4 + 6))
  {
    if (!-[GEOStyleAttributes isEqual:](styleAttributes, "isEqual:")) {
      goto LABEL_25;
    }
  }
  nameDisplayString = self->_nameDisplayString;
  if ((unint64_t)nameDisplayString | *((void *)v4 + 5)) {
    char v11 = -[NSString isEqual:](nameDisplayString, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_26:

  return v11;
}

- (void)_readLocation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitHallReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocation_tags_213);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (GEOPBTransitHall)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPBTransitHall;
  v2 = [(GEOPBTransitHall *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOPBTransitHall)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPBTransitHall;
  id v3 = [(GEOPBTransitHall *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    __int16 v5 = v3;
  }

  return v4;
}

- (unsigned)hallIndex
{
  return self->_hallIndex;
}

- (void)setHallIndex:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x102u;
  self->_hallIndex = a3;
}

- (void)setHasHallIndex:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 258;
  }
  else {
    __int16 v3 = 256;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasHallIndex
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (unint64_t)muid
{
  return self->_muid;
}

- (void)setMuid:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x101u;
  self->_muid = a3;
}

- (void)setHasMuid:(BOOL)a3
{
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x100;
}

- (BOOL)hasMuid
{
  return *(_WORD *)&self->_flags & 1;
}

- (unsigned)stationIndex
{
  return self->_stationIndex;
}

- (void)setStationIndex:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x104u;
  self->_stationIndex = a3;
}

- (void)setHasStationIndex:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 260;
  }
  else {
    __int16 v3 = 256;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasStationIndex
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (GEOLatLng)location
{
  -[GEOPBTransitHall _readLocation]((uint64_t)self);
  location = self->_location;

  return location;
}

- (void)setLocation:(id)a3
{
  *(_WORD *)&self->_flags |= 0x110u;
  objc_storeStrong((id *)&self->_location, a3);
}

- (void)_readZoomNames
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitHallReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readZoomNames_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)zoomNames
{
  -[GEOPBTransitHall _readZoomNames]((uint64_t)self);
  zoomNames = self->_zoomNames;

  return zoomNames;
}

- (void)setZoomNames:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  zoomNames = self->_zoomNames;
  self->_zoomNames = v4;
}

- (void)clearZoomNames
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  zoomNames = self->_zoomNames;

  [(NSMutableArray *)zoomNames removeAllObjects];
}

- (void)addZoomName:(id)a3
{
  id v4 = a3;
  -[GEOPBTransitHall _readZoomNames]((uint64_t)self);
  -[GEOPBTransitHall _addNoFlagsZoomName:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
}

- (void)_addNoFlagsZoomName:(uint64_t)a1
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

- (unint64_t)zoomNamesCount
{
  -[GEOPBTransitHall _readZoomNames]((uint64_t)self);
  zoomNames = self->_zoomNames;

  return [(NSMutableArray *)zoomNames count];
}

- (id)zoomNameAtIndex:(unint64_t)a3
{
  -[GEOPBTransitHall _readZoomNames]((uint64_t)self);
  zoomNames = self->_zoomNames;

  return (id)[(NSMutableArray *)zoomNames objectAtIndex:a3];
}

+ (Class)zoomNameType
{
  return (Class)objc_opt_class();
}

- (GEOStyleAttributes)styleAttributes
{
  -[GEOPBTransitHall _readStyleAttributes]((uint64_t)self);
  styleAttributes = self->_styleAttributes;

  return styleAttributes;
}

- (void)setStyleAttributes:(id)a3
{
  *(_WORD *)&self->_flags |= 0x140u;
  objc_storeStrong((id *)&self->_styleAttributes, a3);
}

- (void)_readNameDisplayString
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitHallReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNameDisplayString_tags_215);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasNameDisplayString
{
  return self->_nameDisplayString != 0;
}

- (NSString)nameDisplayString
{
  -[GEOPBTransitHall _readNameDisplayString]((uint64_t)self);
  nameDisplayString = self->_nameDisplayString;

  return nameDisplayString;
}

- (void)setNameDisplayString:(id)a3
{
  *(_WORD *)&self->_flags |= 0x120u;
  objc_storeStrong((id *)&self->_nameDisplayString, a3);
}

- (NSString)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPBTransitHall;
  id v4 = [(GEOPBTransitHall *)&v8 description];
  id v5 = [(GEOPBTransitHall *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBTransitHall _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_49;
  }
  [(id)a1 readAll:1];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 v5 = *(_WORD *)(a1 + 84);
  if ((v5 & 2) == 0)
  {
    if ((v5 & 1) == 0) {
      goto LABEL_4;
    }
LABEL_16:
    v12 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 32)];
    [v4 setObject:v12 forKey:@"muid"];

    if ((*(_WORD *)(a1 + 84) & 4) != 0) {
      goto LABEL_5;
    }
    goto LABEL_9;
  }
  uint64_t v10 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 76)];
  if (a2) {
    char v11 = @"hallIndex";
  }
  else {
    char v11 = @"hall_index";
  }
  [v4 setObject:v10 forKey:v11];

  __int16 v5 = *(_WORD *)(a1 + 84);
  if (v5) {
    goto LABEL_16;
  }
LABEL_4:
  if ((v5 & 4) != 0)
  {
LABEL_5:
    objc_super v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 80)];
    if (a2) {
      id v7 = @"stationIndex";
    }
    else {
      id v7 = @"station_index";
    }
    [v4 setObject:v6 forKey:v7];
  }
LABEL_9:
  objc_super v8 = [(id)a1 location];
  uint64_t v9 = v8;
  if (v8)
  {
    if (a2) {
      [v8 jsonRepresentation];
    }
    else {
    v13 = [v8 dictionaryRepresentation];
    }
    [v4 setObject:v13 forKey:@"location"];
  }
  if ([*(id *)(a1 + 56) count])
  {
    uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v15 = *(id *)(a1 + 56);
    uint64_t v16 = [v15 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v39 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          if (a2) {
            [v20 jsonRepresentation];
          }
          else {
          v21 = [v20 dictionaryRepresentation];
          }
          [v14 addObject:v21];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v17);
    }

    if (a2) {
      v22 = @"zoomName";
    }
    else {
      v22 = @"zoom_name";
    }
    [v4 setObject:v14 forKey:v22];
  }
  v23 = [(id)a1 styleAttributes];
  v24 = v23;
  if (v23)
  {
    if (a2)
    {
      v25 = [v23 jsonRepresentation];
      v26 = @"styleAttributes";
    }
    else
    {
      v25 = [v23 dictionaryRepresentation];
      v26 = @"style_attributes";
    }
    [v4 setObject:v25 forKey:v26];
  }
  v27 = [(id)a1 nameDisplayString];
  if (v27)
  {
    if (a2) {
      v28 = @"nameDisplayString";
    }
    else {
      v28 = @"name_display_string";
    }
    [v4 setObject:v27 forKey:v28];
  }

  v29 = *(void **)(a1 + 16);
  if (v29)
  {
    v30 = [v29 dictionaryRepresentation];
    v31 = v30;
    if (a2)
    {
      v32 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v30, "count"));
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __46__GEOPBTransitHall__dictionaryRepresentation___block_invoke;
      v36[3] = &unk_1E53D8860;
      id v33 = v32;
      id v37 = v33;
      [v31 enumerateKeysAndObjectsUsingBlock:v36];
      id v34 = v33;

      v31 = v34;
    }
    [v4 setObject:v31 forKey:@"Unknown Fields"];
  }
LABEL_49:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPBTransitHall _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEOPBTransitHall__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPBTransitHall)initWithDictionary:(id)a3
{
  return (GEOPBTransitHall *)-[GEOPBTransitHall _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"hallIndex";
      }
      else {
        objc_super v6 = @"hall_index";
      }
      id v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setHallIndex:", objc_msgSend(v7, "unsignedIntValue"));
      }

      objc_super v8 = [v5 objectForKeyedSubscript:@"muid"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setMuid:", objc_msgSend(v8, "unsignedLongLongValue"));
      }

      if (a3) {
        uint64_t v9 = @"stationIndex";
      }
      else {
        uint64_t v9 = @"station_index";
      }
      id v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setStationIndex:", objc_msgSend(v10, "unsignedIntValue"));
      }

      char v11 = [v5 objectForKeyedSubscript:@"location"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v12 = [GEOLatLng alloc];
        if (a3) {
          uint64_t v13 = [(GEOLatLng *)v12 initWithJSON:v11];
        }
        else {
          uint64_t v13 = [(GEOLatLng *)v12 initWithDictionary:v11];
        }
        uint64_t v14 = (void *)v13;
        [a1 setLocation:v13];
      }
      if (a3) {
        id v15 = @"zoomName";
      }
      else {
        id v15 = @"zoom_name";
      }
      uint64_t v16 = [v5 objectForKeyedSubscript:v15];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        v35 = v16;
        id v17 = v16;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v36 objects:v40 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v37;
          do
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v37 != v20) {
                objc_enumerationMutation(v17);
              }
              uint64_t v22 = *(void *)(*((void *)&v36 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v23 = [GEOPBTransitZoomRangeString alloc];
                if (a3) {
                  uint64_t v24 = [(GEOPBTransitZoomRangeString *)v23 initWithJSON:v22];
                }
                else {
                  uint64_t v24 = [(GEOPBTransitZoomRangeString *)v23 initWithDictionary:v22];
                }
                v25 = (void *)v24;
                [a1 addZoomName:v24];
              }
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v36 objects:v40 count:16];
          }
          while (v19);
        }

        uint64_t v16 = v35;
      }

      if (a3) {
        v26 = @"styleAttributes";
      }
      else {
        v26 = @"style_attributes";
      }
      v27 = [v5 objectForKeyedSubscript:v26];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v28 = [GEOStyleAttributes alloc];
        if (a3) {
          uint64_t v29 = [(GEOStyleAttributes *)v28 initWithJSON:v27];
        }
        else {
          uint64_t v29 = [(GEOStyleAttributes *)v28 initWithDictionary:v27];
        }
        v30 = (void *)v29;
        [a1 setStyleAttributes:v29];
      }
      if (a3) {
        v31 = @"nameDisplayString";
      }
      else {
        v31 = @"name_display_string";
      }
      v32 = [v5 objectForKeyedSubscript:v31];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v33 = (void *)[v32 copy];
        [a1 setNameDisplayString:v33];
      }
    }
  }

  return a1;
}

- (GEOPBTransitHall)initWithJSON:(id)a3
{
  return (GEOPBTransitHall *)-[GEOPBTransitHall _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_228_0;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_229_0;
    }
    GEOPBTransitHallReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOPBTransitHallCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPBTransitHallIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPBTransitHallReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 0x1F0) == 0)
    {
      char v11 = self->_reader;
      objc_sync_enter(v11);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      v12 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v4 writeData:v12];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v11);
      goto LABEL_25;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPBTransitHall *)self readAll:0];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((flags & 1) == 0) {
      goto LABEL_5;
    }
LABEL_22:
    PBDataWriterWriteUint64Field();
    if ((*(_WORD *)&self->_flags & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  PBDataWriterWriteUint32Field();
  __int16 flags = (__int16)self->_flags;
  if (flags) {
    goto LABEL_22;
  }
LABEL_5:
  if ((flags & 4) != 0) {
LABEL_6:
  }
    PBDataWriterWriteUint32Field();
LABEL_7:
  if (self->_location) {
    PBDataWriterWriteSubmessage();
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = self->_zoomNames;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  if (self->_styleAttributes) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_nameDisplayString) {
    PBDataWriterWriteStringField();
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v13);
LABEL_25:
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOPBTransitHall _readLocation]((uint64_t)self);
  location = self->_location;

  return [(GEOLatLng *)location hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  id v10 = (id *)a3;
  [(GEOPBTransitHall *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v10 + 1, self->_reader);
  *((_DWORD *)v10 + 16) = self->_readerMarkPos;
  *((_DWORD *)v10 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v10 + 19) = self->_hallIndex;
    *((_WORD *)v10 + 42) |= 2u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((flags & 1) == 0)
  {
    goto LABEL_3;
  }
  v10[4] = self->_muid;
  *((_WORD *)v10 + 42) |= 1u;
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
LABEL_4:
    *((_DWORD *)v10 + 20) = self->_stationIndex;
    *((_WORD *)v10 + 42) |= 4u;
  }
LABEL_5:
  if (self->_location) {
    objc_msgSend(v10, "setLocation:");
  }
  if ([(GEOPBTransitHall *)self zoomNamesCount])
  {
    [v10 clearZoomNames];
    unint64_t v5 = [(GEOPBTransitHall *)self zoomNamesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(GEOPBTransitHall *)self zoomNameAtIndex:i];
        [v10 addZoomName:v8];
      }
    }
  }
  if (self->_styleAttributes) {
    objc_msgSend(v10, "setStyleAttributes:");
  }
  uint64_t v9 = v10;
  if (self->_nameDisplayString)
  {
    objc_msgSend(v10, "setNameDisplayString:");
    uint64_t v9 = v10;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x100) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPBTransitHallReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_17;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPBTransitHall *)self readAll:0];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((flags & 1) == 0) {
      goto LABEL_7;
    }
LABEL_19:
    *(void *)(v5 + 32) = self->_muid;
    *(_WORD *)(v5 + 84) |= 1u;
    if ((*(_WORD *)&self->_flags & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  *(_DWORD *)(v5 + 76) = self->_hallIndex;
  *(_WORD *)(v5 + 84) |= 2u;
  __int16 flags = (__int16)self->_flags;
  if (flags) {
    goto LABEL_19;
  }
LABEL_7:
  if ((flags & 4) != 0)
  {
LABEL_8:
    *(_DWORD *)(v5 + 80) = self->_stationIndex;
    *(_WORD *)(v5 + 84) |= 4u;
  }
LABEL_9:
  id v10 = [(GEOLatLng *)self->_location copyWithZone:a3];
  char v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v12 = self->_zoomNames;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v12);
        }
        long long v16 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "copyWithZone:", a3, (void)v23);
        [(id)v5 addZoomName:v16];
      }
      uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v13);
  }

  id v17 = [(GEOStyleAttributes *)self->_styleAttributes copyWithZone:a3];
  uint64_t v18 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v17;

  uint64_t v19 = [(NSString *)self->_nameDisplayString copyWithZone:a3];
  uint64_t v20 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v19;

  v21 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v21;
LABEL_17:

  return (id)v5;
}

- (unint64_t)hash
{
  [(GEOPBTransitHall *)self readAll:1];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
    uint64_t v4 = 0;
    if (flags) {
      goto LABEL_3;
    }
LABEL_6:
    unint64_t v5 = 0;
    if ((flags & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v6 = 0;
    goto LABEL_8;
  }
  uint64_t v4 = 2654435761 * self->_hallIndex;
  if ((flags & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  unint64_t v5 = 2654435761u * self->_muid;
  if ((flags & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_stationIndex;
LABEL_8:
  unint64_t v7 = v5 ^ v4 ^ v6 ^ [(GEOLatLng *)self->_location hash];
  uint64_t v8 = [(NSMutableArray *)self->_zoomNames hash];
  unint64_t v9 = v7 ^ v8 ^ [(GEOStyleAttributes *)self->_styleAttributes hash];
  return v9 ^ [(NSString *)self->_nameDisplayString hash];
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 8) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      unint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOPBTransitHallReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_233);
      objc_sync_exit(v5);
    }
  }
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;

  return unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x108u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPBTransitHall *)self readAll:0];
    [(GEOLatLng *)self->_location clearUnknownFields:1];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    unint64_t v7 = self->_zoomNames;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "clearUnknownFields:", 1, (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }

    [(GEOStyleAttributes *)self->_styleAttributes clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoomNames, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_nameDisplayString, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (id)bestName
{
  return [(GEOPBTransitHall *)self bestNameWithLocale:0];
}

- (id)identifier
{
  if ([(GEOPBTransitHall *)self hasLocation])
  {
    BOOL v3 = [(GEOPBTransitHall *)self location];
    [v3 coordinate];
    double v5 = v4;
    double v7 = v6;
  }
  else
  {
    double v7 = -180.0;
    double v5 = -180.0;
  }
  uint64_t v8 = -[GEOMapItemIdentifier initWithMUID:resultProviderID:coordinate:]([GEOMapItemIdentifier alloc], "initWithMUID:resultProviderID:coordinate:", [(GEOPBTransitHall *)self muid], 0, v5, v7);

  return v8;
}

@end