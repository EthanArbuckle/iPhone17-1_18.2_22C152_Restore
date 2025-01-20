@interface GEOPBTransitStop
+ (BOOL)isValid:(id)a3;
+ (Class)zoomNameType;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasHallIndex;
- (BOOL)hasLatLng;
- (BOOL)hasMuid;
- (BOOL)hasNameDisplayString;
- (BOOL)hasStopIndex;
- (BOOL)hasStyleAttributes;
- (BOOL)hasTimezone;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLatLng)latLng;
- (GEOPBTransitStop)init;
- (GEOPBTransitStop)initWithData:(id)a3;
- (GEOPBTransitStop)initWithDictionary:(id)a3;
- (GEOPBTransitStop)initWithJSON:(id)a3;
- (GEOStyleAttributes)styleAttributes;
- (NSMutableArray)zoomNames;
- (NSString)description;
- (NSString)nameDisplayString;
- (NSString)timezone;
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
- (unsigned)stopIndex;
- (void)_addNoFlagsZoomName:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readLatLng;
- (void)_readNameDisplayString;
- (void)_readStyleAttributes;
- (void)_readTimezone;
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
- (void)setHasStopIndex:(BOOL)a3;
- (void)setLatLng:(id)a3;
- (void)setMuid:(unint64_t)a3;
- (void)setNameDisplayString:(id)a3;
- (void)setStopIndex:(unsigned int)a3;
- (void)setStyleAttributes:(id)a3;
- (void)setTimezone:(id)a3;
- (void)setZoomNames:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPBTransitStop

- (GEOPBTransitStop)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPBTransitStop;
  v2 = [(GEOPBTransitStop *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPBTransitStop)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPBTransitStop;
  v3 = [(GEOPBTransitStop *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unsigned)stopIndex
{
  return self->_stopIndex;
}

- (void)setStopIndex:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x204u;
  self->_stopIndex = a3;
}

- (void)setHasStopIndex:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 516;
  }
  else {
    __int16 v3 = 512;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasStopIndex
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (unint64_t)muid
{
  return self->_muid;
}

- (void)setMuid:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x201u;
  self->_muid = a3;
}

- (void)setHasMuid:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x200;
}

- (BOOL)hasMuid
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readLatLng
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitStopReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLatLng_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasLatLng
{
  return self->_latLng != 0;
}

- (GEOLatLng)latLng
{
  -[GEOPBTransitStop _readLatLng]((uint64_t)self);
  latLng = self->_latLng;

  return latLng;
}

- (void)setLatLng:(id)a3
{
  *(_WORD *)&self->_flags |= 0x210u;
  objc_storeStrong((id *)&self->_latLng, a3);
}

- (void)_readTimezone
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitStopReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTimezone_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasTimezone
{
  return self->_timezone != 0;
}

- (NSString)timezone
{
  -[GEOPBTransitStop _readTimezone]((uint64_t)self);
  timezone = self->_timezone;

  return timezone;
}

- (void)setTimezone:(id)a3
{
  *(_WORD *)&self->_flags |= 0x280u;
  objc_storeStrong((id *)&self->_timezone, a3);
}

- (void)_readStyleAttributes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitStopReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStyleAttributes_tags_1035);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasStyleAttributes
{
  return self->_styleAttributes != 0;
}

- (GEOStyleAttributes)styleAttributes
{
  -[GEOPBTransitStop _readStyleAttributes]((uint64_t)self);
  styleAttributes = self->_styleAttributes;

  return styleAttributes;
}

- (void)setStyleAttributes:(id)a3
{
  *(_WORD *)&self->_flags |= 0x240u;
  objc_storeStrong((id *)&self->_styleAttributes, a3);
}

- (unsigned)hallIndex
{
  return self->_hallIndex;
}

- (void)setHallIndex:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x202u;
  self->_hallIndex = a3;
}

- (void)setHasHallIndex:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 514;
  }
  else {
    __int16 v3 = 512;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasHallIndex
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (void)_readZoomNames
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitStopReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readZoomNames_tags_1036);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)zoomNames
{
  -[GEOPBTransitStop _readZoomNames]((uint64_t)self);
  zoomNames = self->_zoomNames;

  return zoomNames;
}

- (void)setZoomNames:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  zoomNames = self->_zoomNames;
  self->_zoomNames = v4;
}

- (void)clearZoomNames
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  zoomNames = self->_zoomNames;

  [(NSMutableArray *)zoomNames removeAllObjects];
}

- (void)addZoomName:(id)a3
{
  id v4 = a3;
  -[GEOPBTransitStop _readZoomNames]((uint64_t)self);
  -[GEOPBTransitStop _addNoFlagsZoomName:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
}

- (void)_addNoFlagsZoomName:(uint64_t)a1
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

- (unint64_t)zoomNamesCount
{
  -[GEOPBTransitStop _readZoomNames]((uint64_t)self);
  zoomNames = self->_zoomNames;

  return [(NSMutableArray *)zoomNames count];
}

- (id)zoomNameAtIndex:(unint64_t)a3
{
  -[GEOPBTransitStop _readZoomNames]((uint64_t)self);
  zoomNames = self->_zoomNames;

  return (id)[(NSMutableArray *)zoomNames objectAtIndex:a3];
}

+ (Class)zoomNameType
{
  return (Class)objc_opt_class();
}

- (void)_readNameDisplayString
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitStopReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNameDisplayString_tags_1037);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasNameDisplayString
{
  return self->_nameDisplayString != 0;
}

- (NSString)nameDisplayString
{
  -[GEOPBTransitStop _readNameDisplayString]((uint64_t)self);
  nameDisplayString = self->_nameDisplayString;

  return nameDisplayString;
}

- (void)setNameDisplayString:(id)a3
{
  *(_WORD *)&self->_flags |= 0x220u;
  objc_storeStrong((id *)&self->_nameDisplayString, a3);
}

- (NSString)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPBTransitStop;
  id v4 = [(GEOPBTransitStop *)&v8 description];
  id v5 = [(GEOPBTransitStop *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBTransitStop _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    __int16 v5 = *(_WORD *)(a1 + 92);
    if ((v5 & 4) != 0)
    {
      objc_super v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 88)];
      if (a2) {
        id v7 = @"stopIndex";
      }
      else {
        id v7 = @"stop_index";
      }
      [v4 setObject:v6 forKey:v7];

      __int16 v5 = *(_WORD *)(a1 + 92);
    }
    if (v5)
    {
      objc_super v8 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 32)];
      [v4 setObject:v8 forKey:@"muid"];
    }
    v9 = [(id)a1 latLng];
    v10 = v9;
    if (v9)
    {
      if (a2)
      {
        v11 = [v9 jsonRepresentation];
        v12 = @"latLng";
      }
      else
      {
        v11 = [v9 dictionaryRepresentation];
        v12 = @"lat_lng";
      }
      [v4 setObject:v11 forKey:v12];
    }
    v13 = [(id)a1 timezone];
    if (v13) {
      [v4 setObject:v13 forKey:@"timezone"];
    }

    v14 = [(id)a1 styleAttributes];
    v15 = v14;
    if (v14)
    {
      if (a2)
      {
        v16 = [v14 jsonRepresentation];
        v17 = @"styleAttributes";
      }
      else
      {
        v16 = [v14 dictionaryRepresentation];
        v17 = @"style_attributes";
      }
      [v4 setObject:v16 forKey:v17];
    }
    if ((*(_WORD *)(a1 + 92) & 2) != 0)
    {
      v18 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 84)];
      if (a2) {
        v19 = @"hallIndex";
      }
      else {
        v19 = @"hall_index";
      }
      [v4 setObject:v18 forKey:v19];
    }
    if ([*(id *)(a1 + 64) count])
    {
      v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v21 = *(id *)(a1 + 64);
      uint64_t v22 = [v21 countByEnumeratingWithState:&v40 objects:v44 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v41 != v24) {
              objc_enumerationMutation(v21);
            }
            v26 = *(void **)(*((void *)&v40 + 1) + 8 * i);
            if (a2) {
              [v26 jsonRepresentation];
            }
            else {
            v27 = [v26 dictionaryRepresentation];
            }
            [v20 addObject:v27];
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v40 objects:v44 count:16];
        }
        while (v23);
      }

      if (a2) {
        v28 = @"zoomName";
      }
      else {
        v28 = @"zoom_name";
      }
      [v4 setObject:v20 forKey:v28];
    }
    v29 = [(id)a1 nameDisplayString];
    if (v29)
    {
      if (a2) {
        v30 = @"nameDisplayString";
      }
      else {
        v30 = @"name_display_string";
      }
      [v4 setObject:v29 forKey:v30];
    }

    v31 = *(void **)(a1 + 16);
    if (v31)
    {
      v32 = [v31 dictionaryRepresentation];
      v33 = v32;
      if (a2)
      {
        v34 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v32, "count"));
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __46__GEOPBTransitStop__dictionaryRepresentation___block_invoke;
        v38[3] = &unk_1E53D8860;
        id v35 = v34;
        id v39 = v35;
        [v33 enumerateKeysAndObjectsUsingBlock:v38];
        id v36 = v35;

        v33 = v36;
      }
      [v4 setObject:v33 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPBTransitStop _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEOPBTransitStop__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPBTransitStop)initWithDictionary:(id)a3
{
  return (GEOPBTransitStop *)-[GEOPBTransitStop _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"stopIndex";
      }
      else {
        objc_super v6 = @"stop_index";
      }
      id v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setStopIndex:", objc_msgSend(v7, "unsignedIntValue"));
      }

      objc_super v8 = [v5 objectForKeyedSubscript:@"muid"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setMuid:", objc_msgSend(v8, "unsignedLongLongValue"));
      }

      if (a3) {
        v9 = @"latLng";
      }
      else {
        v9 = @"lat_lng";
      }
      id v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = [GEOLatLng alloc];
        if (a3) {
          uint64_t v12 = [(GEOLatLng *)v11 initWithJSON:v10];
        }
        else {
          uint64_t v12 = [(GEOLatLng *)v11 initWithDictionary:v10];
        }
        v13 = (void *)v12;
        [a1 setLatLng:v12];
      }
      v14 = [v5 objectForKeyedSubscript:@"timezone"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v15 = (void *)[v14 copy];
        [a1 setTimezone:v15];
      }
      if (a3) {
        v16 = @"styleAttributes";
      }
      else {
        v16 = @"style_attributes";
      }
      v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v18 = [GEOStyleAttributes alloc];
        if (a3) {
          uint64_t v19 = [(GEOStyleAttributes *)v18 initWithJSON:v17];
        }
        else {
          uint64_t v19 = [(GEOStyleAttributes *)v18 initWithDictionary:v17];
        }
        v20 = (void *)v19;
        [a1 setStyleAttributes:v19];
      }
      if (a3) {
        id v21 = @"hallIndex";
      }
      else {
        id v21 = @"hall_index";
      }
      uint64_t v22 = [v5 objectForKeyedSubscript:v21];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setHallIndex:", objc_msgSend(v22, "unsignedIntValue"));
      }

      if (a3) {
        uint64_t v23 = @"zoomName";
      }
      else {
        uint64_t v23 = @"zoom_name";
      }
      uint64_t v24 = [v5 objectForKeyedSubscript:v23];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        v38 = v24;
        id v25 = v24;
        uint64_t v26 = [v25 countByEnumeratingWithState:&v39 objects:v43 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v40;
          do
          {
            for (uint64_t i = 0; i != v27; ++i)
            {
              if (*(void *)v40 != v28) {
                objc_enumerationMutation(v25);
              }
              uint64_t v30 = *(void *)(*((void *)&v39 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v31 = [GEOPBTransitZoomRangeString alloc];
                if (a3) {
                  uint64_t v32 = [(GEOPBTransitZoomRangeString *)v31 initWithJSON:v30];
                }
                else {
                  uint64_t v32 = [(GEOPBTransitZoomRangeString *)v31 initWithDictionary:v30];
                }
                v33 = (void *)v32;
                [a1 addZoomName:v32];
              }
            }
            uint64_t v27 = [v25 countByEnumeratingWithState:&v39 objects:v43 count:16];
          }
          while (v27);
        }

        uint64_t v24 = v38;
      }

      if (a3) {
        v34 = @"nameDisplayString";
      }
      else {
        v34 = @"name_display_string";
      }
      id v35 = [v5 objectForKeyedSubscript:v34];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v36 = (void *)[v35 copy];
        [a1 setNameDisplayString:v36];
      }
    }
  }

  return a1;
}

- (GEOPBTransitStop)initWithJSON:(id)a3
{
  return (GEOPBTransitStop *)-[GEOPBTransitStop _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_1053;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_1054;
    }
    GEOPBTransitStopReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOPBTransitStopCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPBTransitStopIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPBTransitStopReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x3F0) == 0))
  {
    v11 = self->_reader;
    objc_sync_enter(v11);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v12 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v12];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v11);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPBTransitStop *)self readAll:0];
    __int16 flags = (__int16)self->_flags;
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteUint32Field();
      __int16 flags = (__int16)self->_flags;
    }
    if (flags) {
      PBDataWriterWriteUint64Field();
    }
    if (self->_latLng) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_timezone) {
      PBDataWriterWriteStringField();
    }
    if (self->_styleAttributes) {
      PBDataWriterWriteSubmessage();
    }
    if ((*(_WORD *)&self->_flags & 2) != 0) {
      PBDataWriterWriteUint32Field();
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

    if (self->_nameDisplayString) {
      PBDataWriterWriteStringField();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v13);
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOPBTransitStop _readLatLng]((uint64_t)self);
  latLng = self->_latLng;

  return [(GEOLatLng *)latLng hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  id v10 = (id *)a3;
  [(GEOPBTransitStop *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v10 + 1, self->_reader);
  *((_DWORD *)v10 + 18) = self->_readerMarkPos;
  *((_DWORD *)v10 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  id v4 = v10;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    *((_DWORD *)v10 + 22) = self->_stopIndex;
    *((_WORD *)v10 + 46) |= 4u;
    __int16 flags = (__int16)self->_flags;
  }
  if (flags)
  {
    v10[4] = self->_muid;
    *((_WORD *)v10 + 46) |= 1u;
  }
  if (self->_latLng)
  {
    objc_msgSend(v10, "setLatLng:");
    id v4 = v10;
  }
  if (self->_timezone)
  {
    objc_msgSend(v10, "setTimezone:");
    id v4 = v10;
  }
  if (self->_styleAttributes)
  {
    objc_msgSend(v10, "setStyleAttributes:");
    id v4 = v10;
  }
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v4 + 21) = self->_hallIndex;
    *((_WORD *)v4 + 46) |= 2u;
  }
  if ([(GEOPBTransitStop *)self zoomNamesCount])
  {
    [v10 clearZoomNames];
    unint64_t v6 = [(GEOPBTransitStop *)self zoomNamesCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(GEOPBTransitStop *)self zoomNameAtIndex:i];
        [v10 addZoomName:v9];
      }
    }
  }
  if (self->_nameDisplayString) {
    objc_msgSend(v10, "setNameDisplayString:");
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
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x200) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPBTransitStopReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_19;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPBTransitStop *)self readAll:0];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 88) = self->_stopIndex;
    *(_WORD *)(v5 + 92) |= 4u;
    __int16 flags = (__int16)self->_flags;
  }
  if (flags)
  {
    *(void *)(v5 + 32) = self->_muid;
    *(_WORD *)(v5 + 92) |= 1u;
  }
  id v10 = [(GEOLatLng *)self->_latLng copyWithZone:a3];
  v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  uint64_t v12 = [(NSString *)self->_timezone copyWithZone:a3];
  long long v13 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v12;

  id v14 = [(GEOStyleAttributes *)self->_styleAttributes copyWithZone:a3];
  long long v15 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v14;

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 84) = self->_hallIndex;
    *(_WORD *)(v5 + 92) |= 2u;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v16 = self->_zoomNames;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(v16);
        }
        v20 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * i), "copyWithZone:", a3, (void)v25);
        [(id)v5 addZoomName:v20];
      }
      uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v17);
  }

  uint64_t v21 = [(NSString *)self->_nameDisplayString copyWithZone:a3];
  uint64_t v22 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v21;

  uint64_t v23 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v23;
LABEL_19:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  [(GEOPBTransitStop *)self readAll:1];
  [v4 readAll:1];
  __int16 flags = (__int16)self->_flags;
  __int16 v6 = *((_WORD *)v4 + 46);
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_stopIndex != *((_DWORD *)v4 + 22)) {
      goto LABEL_27;
    }
  }
  else if ((v6 & 4) != 0)
  {
LABEL_27:
    char v13 = 0;
    goto LABEL_28;
  }
  if (flags)
  {
    if ((v6 & 1) == 0 || self->_muid != *((void *)v4 + 4)) {
      goto LABEL_27;
    }
  }
  else if (v6)
  {
    goto LABEL_27;
  }
  latLng = self->_latLng;
  if ((unint64_t)latLng | *((void *)v4 + 3) && !-[GEOLatLng isEqual:](latLng, "isEqual:")) {
    goto LABEL_27;
  }
  timezone = self->_timezone;
  if ((unint64_t)timezone | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](timezone, "isEqual:")) {
      goto LABEL_27;
    }
  }
  styleAttributes = self->_styleAttributes;
  if ((unint64_t)styleAttributes | *((void *)v4 + 6))
  {
    if (!-[GEOStyleAttributes isEqual:](styleAttributes, "isEqual:")) {
      goto LABEL_27;
    }
  }
  __int16 v10 = *((_WORD *)v4 + 46);
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_hallIndex != *((_DWORD *)v4 + 21)) {
      goto LABEL_27;
    }
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_27;
  }
  zoomNames = self->_zoomNames;
  if ((unint64_t)zoomNames | *((void *)v4 + 8)
    && !-[NSMutableArray isEqual:](zoomNames, "isEqual:"))
  {
    goto LABEL_27;
  }
  nameDisplayString = self->_nameDisplayString;
  if ((unint64_t)nameDisplayString | *((void *)v4 + 5)) {
    char v13 = -[NSString isEqual:](nameDisplayString, "isEqual:");
  }
  else {
    char v13 = 1;
  }
LABEL_28:

  return v13;
}

- (unint64_t)hash
{
  [(GEOPBTransitStop *)self readAll:1];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    uint64_t v4 = 2654435761 * self->_stopIndex;
    if (flags) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if (flags)
    {
LABEL_3:
      unint64_t v5 = 2654435761u * self->_muid;
      goto LABEL_6;
    }
  }
  unint64_t v5 = 0;
LABEL_6:
  unint64_t v6 = [(GEOLatLng *)self->_latLng hash];
  NSUInteger v7 = [(NSString *)self->_timezone hash];
  unint64_t v8 = [(GEOStyleAttributes *)self->_styleAttributes hash];
  if ((*(_WORD *)&self->_flags & 2) != 0) {
    uint64_t v9 = 2654435761 * self->_hallIndex;
  }
  else {
    uint64_t v9 = 0;
  }
  unint64_t v10 = v5 ^ v4 ^ v6 ^ v7 ^ v8;
  uint64_t v11 = v9 ^ [(NSMutableArray *)self->_zoomNames hash];
  return v10 ^ v11 ^ [(NSString *)self->_nameDisplayString hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  __int16 v5 = *((_WORD *)v4 + 46);
  if ((v5 & 4) != 0)
  {
    self->_stopIndex = *((_DWORD *)v4 + 22);
    *(_WORD *)&self->_flags |= 4u;
    __int16 v5 = *((_WORD *)v4 + 46);
  }
  if (v5)
  {
    self->_muid = *((void *)v4 + 4);
    *(_WORD *)&self->_flags |= 1u;
  }
  latLng = self->_latLng;
  uint64_t v7 = *((void *)v4 + 3);
  if (latLng)
  {
    if (v7) {
      -[GEOLatLng mergeFrom:](latLng, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[GEOPBTransitStop setLatLng:](self, "setLatLng:");
  }
  if (*((void *)v4 + 7)) {
    -[GEOPBTransitStop setTimezone:](self, "setTimezone:");
  }
  styleAttributes = self->_styleAttributes;
  uint64_t v9 = *((void *)v4 + 6);
  if (styleAttributes)
  {
    if (v9) {
      -[GEOStyleAttributes mergeFrom:](styleAttributes, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[GEOPBTransitStop setStyleAttributes:](self, "setStyleAttributes:");
  }
  if ((*((_WORD *)v4 + 46) & 2) != 0)
  {
    self->_hallIndex = *((_DWORD *)v4 + 21);
    *(_WORD *)&self->_flags |= 2u;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = *((id *)v4 + 8);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[GEOPBTransitStop addZoomName:](self, "addZoomName:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }

  if (*((void *)v4 + 5)) {
    -[GEOPBTransitStop setNameDisplayString:](self, "setNameDisplayString:");
  }
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
      __int16 v5 = reader;
      objc_sync_enter(v5);
      GEOPBTransitStopReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1058);
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
  *(_WORD *)&self->_flags |= 0x208u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPBTransitStop *)self readAll:0];
    [(GEOLatLng *)self->_latLng clearUnknownFields:1];
    [(GEOStyleAttributes *)self->_styleAttributes clearUnknownFields:1];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = self->_zoomNames;
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
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoomNames, 0);
  objc_storeStrong((id *)&self->_timezone, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_nameDisplayString, 0);
  objc_storeStrong((id *)&self->_latLng, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (id)bestName
{
  return [(GEOPBTransitStop *)self bestNameWithLocale:0];
}

- (id)identifier
{
  if ([(GEOPBTransitStop *)self hasLatLng])
  {
    BOOL v3 = [(GEOPBTransitStop *)self latLng];
    [v3 coordinate];
    double v5 = v4;
    double v7 = v6;
  }
  else
  {
    double v7 = -180.0;
    double v5 = -180.0;
  }
  uint64_t v8 = -[GEOMapItemIdentifier initWithMUID:resultProviderID:coordinate:]([GEOMapItemIdentifier alloc], "initWithMUID:resultProviderID:coordinate:", [(GEOPBTransitStop *)self muid], 0, v5, v7);

  return v8;
}

@end