@interface GEORPDisplayDetails
+ (BOOL)isValid:(id)a3;
+ (Class)placeType;
- (BOOL)hasBody;
- (BOOL)hasDisplayRegion;
- (BOOL)hasDisplayStyle;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasMapType;
- (BOOL)hasOutreachLink;
- (BOOL)hasTitle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLocalizedString)body;
- (GEOLocalizedString)title;
- (GEOMapRegion)displayRegion;
- (GEORPDisplayDetails)init;
- (GEORPDisplayDetails)initWithData:(id)a3;
- (GEORPDisplayDetails)initWithDictionary:(id)a3;
- (GEORPDisplayDetails)initWithJSON:(id)a3;
- (GEOTextLink)outreachLink;
- (NSMutableArray)places;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)displayStyleAsString:(int)a3;
- (id)jsonRepresentation;
- (id)mapTypeAsString:(int)a3;
- (id)placeAtIndex:(unint64_t)a3;
- (int)StringAsDisplayStyle:(id)a3;
- (int)StringAsMapType:(id)a3;
- (int)displayStyle;
- (int)mapType;
- (unint64_t)hash;
- (unint64_t)placesCount;
- (void)_addNoFlagsPlace:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readBody;
- (void)_readDisplayRegion;
- (void)_readOutreachLink;
- (void)_readPlaces;
- (void)_readTitle;
- (void)addPlace:(id)a3;
- (void)clearPlaces;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setBody:(id)a3;
- (void)setDisplayRegion:(id)a3;
- (void)setDisplayStyle:(int)a3;
- (void)setHasDisplayStyle:(BOOL)a3;
- (void)setHasMapType:(BOOL)a3;
- (void)setMapType:(int)a3;
- (void)setOutreachLink:(id)a3;
- (void)setPlaces:(id)a3;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPDisplayDetails

- (GEORPDisplayDetails)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPDisplayDetails;
  v2 = [(GEORPDisplayDetails *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPDisplayDetails)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPDisplayDetails;
  v3 = [(GEORPDisplayDetails *)&v7 initWithData:a3];
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
  if (flags) {
    return self->_displayStyle;
  }
  else {
    return 0;
  }
}

- (void)setDisplayStyle:(int)a3
{
  *(_WORD *)&self->_flags |= 0x101u;
  self->_displayStyle = a3;
}

- (void)setHasDisplayStyle:(BOOL)a3
{
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x100;
}

- (BOOL)hasDisplayStyle
{
  return *(_WORD *)&self->_flags & 1;
}

- (id)displayStyleAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53F66F8[a3];
  }

  return v3;
}

- (int)StringAsDisplayStyle:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"RAP_RESPONSE_DISPLAY_STYLE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"RAP_RESPONSE_DISPLAY_STYLE_SHOW_REGION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"RAP_RESPONSE_DISPLAY_STYLE_SHOW_SINGLE_PIN"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readTitle
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
        GEORPDisplayDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTitle_tags_6);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (GEOLocalizedString)title
{
  -[GEORPDisplayDetails _readTitle]((uint64_t)self);
  title = self->_title;

  return title;
}

- (void)setTitle:(id)a3
{
  *(_WORD *)&self->_flags |= 0x180u;
  objc_storeStrong((id *)&self->_title, a3);
}

- (void)_readBody
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPDisplayDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBody_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasBody
{
  return self->_body != 0;
}

- (GEOLocalizedString)body
{
  -[GEORPDisplayDetails _readBody]((uint64_t)self);
  body = self->_body;

  return body;
}

- (void)setBody:(id)a3
{
  *(_WORD *)&self->_flags |= 0x108u;
  objc_storeStrong((id *)&self->_body, a3);
}

- (void)_readDisplayRegion
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
        GEORPDisplayDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayRegion_tags_5);
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
  -[GEORPDisplayDetails _readDisplayRegion]((uint64_t)self);
  displayRegion = self->_displayRegion;

  return displayRegion;
}

- (void)setDisplayRegion:(id)a3
{
  *(_WORD *)&self->_flags |= 0x110u;
  objc_storeStrong((id *)&self->_displayRegion, a3);
}

- (int)mapType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0) {
    return self->_mapType;
  }
  else {
    return 0;
  }
}

- (void)setMapType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x102u;
  self->_mapType = a3;
}

- (void)setHasMapType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 258;
  }
  else {
    __int16 v3 = 256;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasMapType
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
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
    __int16 v3 = off_1E53F6710[a3];
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

- (void)_readPlaces
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
        GEORPDisplayDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaces_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)places
{
  -[GEORPDisplayDetails _readPlaces]((uint64_t)self);
  places = self->_places;

  return places;
}

- (void)setPlaces:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  places = self->_places;
  self->_places = v4;
}

- (void)clearPlaces
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  places = self->_places;

  [(NSMutableArray *)places removeAllObjects];
}

- (void)addPlace:(id)a3
{
  id v4 = a3;
  -[GEORPDisplayDetails _readPlaces]((uint64_t)self);
  -[GEORPDisplayDetails _addNoFlagsPlace:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
}

- (void)_addNoFlagsPlace:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 48);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;

      id v4 = *(void **)(a1 + 48);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)placesCount
{
  -[GEORPDisplayDetails _readPlaces]((uint64_t)self);
  places = self->_places;

  return [(NSMutableArray *)places count];
}

- (id)placeAtIndex:(unint64_t)a3
{
  -[GEORPDisplayDetails _readPlaces]((uint64_t)self);
  places = self->_places;

  return (id)[(NSMutableArray *)places objectAtIndex:a3];
}

+ (Class)placeType
{
  return (Class)objc_opt_class();
}

- (void)_readOutreachLink
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
        GEORPDisplayDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOutreachLink_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasOutreachLink
{
  return self->_outreachLink != 0;
}

- (GEOTextLink)outreachLink
{
  -[GEORPDisplayDetails _readOutreachLink]((uint64_t)self);
  outreachLink = self->_outreachLink;

  return outreachLink;
}

- (void)setOutreachLink:(id)a3
{
  *(_WORD *)&self->_flags |= 0x120u;
  objc_storeStrong((id *)&self->_outreachLink, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPDisplayDetails;
  id v4 = [(GEORPDisplayDetails *)&v8 description];
  id v5 = [(GEORPDisplayDetails *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPDisplayDetails _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(_WORD *)(a1 + 84))
    {
      uint64_t v5 = *(int *)(a1 + 76);
      if (v5 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 76));
        objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v6 = off_1E53F66F8[v5];
      }
      if (a2) {
        id v7 = @"displayStyle";
      }
      else {
        id v7 = @"display_style";
      }
      [v4 setObject:v6 forKey:v7];
    }
    objc_super v8 = [(id)a1 title];
    v9 = v8;
    if (v8)
    {
      if (a2) {
        [v8 jsonRepresentation];
      }
      else {
      v10 = [v8 dictionaryRepresentation];
      }
      [v4 setObject:v10 forKey:@"title"];
    }
    v11 = [(id)a1 body];
    v12 = v11;
    if (v11)
    {
      if (a2) {
        [v11 jsonRepresentation];
      }
      else {
      v13 = [v11 dictionaryRepresentation];
      }
      [v4 setObject:v13 forKey:@"body"];
    }
    v14 = [(id)a1 displayRegion];
    v15 = v14;
    if (v14)
    {
      if (a2)
      {
        v16 = [v14 jsonRepresentation];
        v17 = @"displayRegion";
      }
      else
      {
        v16 = [v14 dictionaryRepresentation];
        v17 = @"display_region";
      }
      [v4 setObject:v16 forKey:v17];
    }
    if ((*(_WORD *)(a1 + 84) & 2) != 0)
    {
      uint64_t v18 = *(int *)(a1 + 80);
      if (v18 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 80));
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v19 = off_1E53F6710[v18];
      }
      if (a2) {
        v20 = @"mapType";
      }
      else {
        v20 = @"map_type";
      }
      [v4 setObject:v19 forKey:v20];
    }
    if ([*(id *)(a1 + 48) count])
    {
      v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v22 = *(id *)(a1 + 48);
      uint64_t v23 = [v22 countByEnumeratingWithState:&v42 objects:v46 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v43;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v43 != v25) {
              objc_enumerationMutation(v22);
            }
            v27 = *(void **)(*((void *)&v42 + 1) + 8 * i);
            if (a2) {
              [v27 jsonRepresentation];
            }
            else {
            v28 = [v27 dictionaryRepresentation];
            }
            [v21 addObject:v28];
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v42 objects:v46 count:16];
        }
        while (v24);
      }

      [v4 setObject:v21 forKey:@"place"];
    }
    v29 = [(id)a1 outreachLink];
    v30 = v29;
    if (v29)
    {
      if (a2)
      {
        v31 = [v29 jsonRepresentation];
        v32 = @"outreachLink";
      }
      else
      {
        v31 = [v29 dictionaryRepresentation];
        v32 = @"outreach_link";
      }
      [v4 setObject:v31 forKey:v32];
    }
    v33 = *(void **)(a1 + 16);
    if (v33)
    {
      v34 = [v33 dictionaryRepresentation];
      v35 = v34;
      if (a2)
      {
        v36 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v34, "count"));
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __49__GEORPDisplayDetails__dictionaryRepresentation___block_invoke;
        v40[3] = &unk_1E53D8860;
        id v37 = v36;
        id v41 = v37;
        [v35 enumerateKeysAndObjectsUsingBlock:v40];
        id v38 = v37;

        v35 = v38;
      }
      [v4 setObject:v35 forKey:@"Unknown Fields"];
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
  return -[GEORPDisplayDetails _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __49__GEORPDisplayDetails__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPDisplayDetails)initWithDictionary:(id)a3
{
  return (GEORPDisplayDetails *)-[GEORPDisplayDetails _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_78;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_78;
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
    if ([v8 isEqualToString:@"RAP_RESPONSE_DISPLAY_STYLE_UNKNOWN"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"RAP_RESPONSE_DISPLAY_STYLE_SHOW_REGION"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"RAP_RESPONSE_DISPLAY_STYLE_SHOW_SINGLE_PIN"])
    {
      uint64_t v9 = 2;
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_18;
    }
    uint64_t v9 = [v7 intValue];
  }
  [a1 setDisplayStyle:v9];
LABEL_18:

  id v10 = [v5 objectForKeyedSubscript:@"title"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11 = [GEOLocalizedString alloc];
    if (a3) {
      uint64_t v12 = [(GEOLocalizedString *)v11 initWithJSON:v10];
    }
    else {
      uint64_t v12 = [(GEOLocalizedString *)v11 initWithDictionary:v10];
    }
    v13 = (void *)v12;
    [a1 setTitle:v12];
  }
  v14 = [v5 objectForKeyedSubscript:@"body"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v15 = [GEOLocalizedString alloc];
    if (a3) {
      uint64_t v16 = [(GEOLocalizedString *)v15 initWithJSON:v14];
    }
    else {
      uint64_t v16 = [(GEOLocalizedString *)v15 initWithDictionary:v14];
    }
    v17 = (void *)v16;
    [a1 setBody:v16];
  }
  if (a3) {
    uint64_t v18 = @"displayRegion";
  }
  else {
    uint64_t v18 = @"display_region";
  }
  v19 = [v5 objectForKeyedSubscript:v18];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v20 = [GEOMapRegion alloc];
    if (a3) {
      uint64_t v21 = [(GEOMapRegion *)v20 initWithJSON:v19];
    }
    else {
      uint64_t v21 = [(GEOMapRegion *)v20 initWithDictionary:v19];
    }
    id v22 = (void *)v21;
    [a1 setDisplayRegion:v21];
  }
  if (a3) {
    uint64_t v23 = @"mapType";
  }
  else {
    uint64_t v23 = @"map_type";
  }
  uint64_t v24 = [v5 objectForKeyedSubscript:v23];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v25 = v24;
    if ([v25 isEqualToString:@"MAP_TYPE_NONE"])
    {
      uint64_t v26 = 0;
    }
    else if ([v25 isEqualToString:@"MAP_TYPE_STANDARD"])
    {
      uint64_t v26 = 1;
    }
    else if ([v25 isEqualToString:@"MAP_TYPE_SATELLITE"])
    {
      uint64_t v26 = 2;
    }
    else if ([v25 isEqualToString:@"MAP_TYPE_HYBRID"])
    {
      uint64_t v26 = 3;
    }
    else if ([v25 isEqualToString:@"MAP_TYPE_TRANSIT"])
    {
      uint64_t v26 = 4;
    }
    else
    {
      uint64_t v26 = 0;
    }

    goto LABEL_54;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v26 = [v24 intValue];
LABEL_54:
    [a1 setMapType:v26];
  }

  v27 = [v5 objectForKeyedSubscript:@"place"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v43 = v5;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v28 = v27;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v44 objects:v48 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v45 != v31) {
            objc_enumerationMutation(v28);
          }
          uint64_t v33 = *(void *)(*((void *)&v44 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v34 = [GEOPDPlace alloc];
            if (a3) {
              uint64_t v35 = [(GEOPDPlace *)v34 initWithJSON:v33];
            }
            else {
              uint64_t v35 = [(GEOPDPlace *)v34 initWithDictionary:v33];
            }
            v36 = (void *)v35;
            [a1 addPlace:v35];
          }
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v44 objects:v48 count:16];
      }
      while (v30);
    }

    id v5 = v43;
  }

  if (a3) {
    id v37 = @"outreachLink";
  }
  else {
    id v37 = @"outreach_link";
  }
  id v38 = [v5 objectForKeyedSubscript:v37];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v39 = [GEOTextLink alloc];
    if (a3) {
      uint64_t v40 = [(GEOTextLink *)v39 initWithJSON:v38];
    }
    else {
      uint64_t v40 = [(GEOTextLink *)v39 initWithDictionary:v38];
    }
    id v41 = (void *)v40;
    [a1 setOutreachLink:v40];
  }
LABEL_78:

  return a1;
}

- (GEORPDisplayDetails)initWithJSON:(id)a3
{
  return (GEORPDisplayDetails *)-[GEORPDisplayDetails _initWithDictionary:isJSON:](self, a3, 1);
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
      id v8 = (int *)&readAll__recursiveTag_85;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_85;
    }
    GEORPDisplayDetailsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORPDisplayDetailsCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPDisplayDetailsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPDisplayDetailsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPDisplayDetailsIsDirty((uint64_t)self) & 1) == 0)
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
    [(GEORPDisplayDetails *)self readAll:0];
    if (*(_WORD *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_title) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_body) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_displayRegion) {
      PBDataWriterWriteSubmessage();
    }
    if ((*(_WORD *)&self->_flags & 2) != 0) {
      PBDataWriterWriteInt32Field();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v6 = self->_places;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    if (self->_outreachLink) {
      PBDataWriterWriteSubmessage();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  -[GEORPDisplayDetails _readDisplayRegion]((uint64_t)self);
  if ([(GEOMapRegion *)self->_displayRegion hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPDisplayDetails _readPlaces]((uint64_t)self);
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
  uint64_t v8 = (id *)a3;
  [(GEORPDisplayDetails *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 16) = self->_readerMarkPos;
  *((_DWORD *)v8 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (*(_WORD *)&self->_flags)
  {
    *((_DWORD *)v8 + 19) = self->_displayStyle;
    *((_WORD *)v8 + 42) |= 1u;
  }
  if (self->_title) {
    objc_msgSend(v8, "setTitle:");
  }
  if (self->_body) {
    objc_msgSend(v8, "setBody:");
  }
  if (self->_displayRegion) {
    objc_msgSend(v8, "setDisplayRegion:");
  }
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v8 + 20) = self->_mapType;
    *((_WORD *)v8 + 42) |= 2u;
  }
  if ([(GEORPDisplayDetails *)self placesCount])
  {
    [v8 clearPlaces];
    unint64_t v4 = [(GEORPDisplayDetails *)self placesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEORPDisplayDetails *)self placeAtIndex:i];
        [v8 addPlace:v7];
      }
    }
  }
  if (self->_outreachLink) {
    objc_msgSend(v8, "setOutreachLink:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
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
      GEORPDisplayDetailsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_17;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPDisplayDetails *)self readAll:0];
  if (*(_WORD *)&self->_flags)
  {
    *(_DWORD *)(v5 + 76) = self->_displayStyle;
    *(_WORD *)(v5 + 84) |= 1u;
  }
  id v9 = [(GEOLocalizedString *)self->_title copyWithZone:a3];
  id v10 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v9;

  id v11 = [(GEOLocalizedString *)self->_body copyWithZone:a3];
  long long v12 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v11;

  id v13 = [(GEOMapRegion *)self->_displayRegion copyWithZone:a3];
  long long v14 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v13;

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_mapType;
    *(_WORD *)(v5 + 84) |= 2u;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v15 = self->_places;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v15);
        }
        v19 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "copyWithZone:", a3, (void)v24);
        [(id)v5 addPlace:v19];
      }
      uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v16);
  }

  id v20 = [(GEOTextLink *)self->_outreachLink copyWithZone:a3];
  uint64_t v21 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v20;

  id v22 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v22;
LABEL_17:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  [(GEORPDisplayDetails *)self readAll:1];
  [v4 readAll:1];
  __int16 v5 = *((_WORD *)v4 + 42);
  if (*(_WORD *)&self->_flags)
  {
    if ((v5 & 1) == 0 || self->_displayStyle != *((_DWORD *)v4 + 19)) {
      goto LABEL_22;
    }
  }
  else if (v5)
  {
LABEL_22:
    char v12 = 0;
    goto LABEL_23;
  }
  title = self->_title;
  if ((unint64_t)title | *((void *)v4 + 7) && !-[GEOLocalizedString isEqual:](title, "isEqual:")) {
    goto LABEL_22;
  }
  body = self->_body;
  if ((unint64_t)body | *((void *)v4 + 3))
  {
    if (!-[GEOLocalizedString isEqual:](body, "isEqual:")) {
      goto LABEL_22;
    }
  }
  displayRegion = self->_displayRegion;
  if ((unint64_t)displayRegion | *((void *)v4 + 4))
  {
    if (!-[GEOMapRegion isEqual:](displayRegion, "isEqual:")) {
      goto LABEL_22;
    }
  }
  __int16 v9 = *((_WORD *)v4 + 42);
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_mapType != *((_DWORD *)v4 + 20)) {
      goto LABEL_22;
    }
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_22;
  }
  places = self->_places;
  if ((unint64_t)places | *((void *)v4 + 6) && !-[NSMutableArray isEqual:](places, "isEqual:")) {
    goto LABEL_22;
  }
  outreachLink = self->_outreachLink;
  if ((unint64_t)outreachLink | *((void *)v4 + 5)) {
    char v12 = -[GEOTextLink isEqual:](outreachLink, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_23:

  return v12;
}

- (unint64_t)hash
{
  [(GEORPDisplayDetails *)self readAll:1];
  if (*(_WORD *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_displayStyle;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(GEOLocalizedString *)self->_title hash];
  unint64_t v5 = [(GEOLocalizedString *)self->_body hash];
  unint64_t v6 = [(GEOMapRegion *)self->_displayRegion hash];
  if ((*(_WORD *)&self->_flags & 2) != 0) {
    uint64_t v7 = 2654435761 * self->_mapType;
  }
  else {
    uint64_t v7 = 0;
  }
  unint64_t v8 = v4 ^ v3 ^ v5 ^ v6;
  uint64_t v9 = v7 ^ [(NSMutableArray *)self->_places hash];
  return v8 ^ v9 ^ [(GEOTextLink *)self->_outreachLink hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((_WORD *)v4 + 42))
  {
    self->_displayStyle = *((_DWORD *)v4 + 19);
    *(_WORD *)&self->_flags |= 1u;
  }
  title = self->_title;
  uint64_t v6 = *((void *)v4 + 7);
  if (title)
  {
    if (v6) {
      -[GEOLocalizedString mergeFrom:](title, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEORPDisplayDetails setTitle:](self, "setTitle:");
  }
  body = self->_body;
  uint64_t v8 = *((void *)v4 + 3);
  if (body)
  {
    if (v8) {
      -[GEOLocalizedString mergeFrom:](body, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[GEORPDisplayDetails setBody:](self, "setBody:");
  }
  displayRegion = self->_displayRegion;
  uint64_t v10 = *((void *)v4 + 4);
  if (displayRegion)
  {
    if (v10) {
      -[GEOMapRegion mergeFrom:](displayRegion, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[GEORPDisplayDetails setDisplayRegion:](self, "setDisplayRegion:");
  }
  if ((*((_WORD *)v4 + 42) & 2) != 0)
  {
    self->_mapType = *((_DWORD *)v4 + 20);
    *(_WORD *)&self->_flags |= 2u;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = *((id *)v4 + 6);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        -[GEORPDisplayDetails addPlace:](self, "addPlace:", *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  outreachLink = self->_outreachLink;
  uint64_t v17 = *((void *)v4 + 5);
  if (outreachLink)
  {
    if (v17) {
      -[GEOTextLink mergeFrom:](outreachLink, "mergeFrom:");
    }
  }
  else if (v17)
  {
    -[GEORPDisplayDetails setOutreachLink:](self, "setOutreachLink:");
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      unint64_t v5 = reader;
      objc_sync_enter(v5);
      GEORPDisplayDetailsReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_18);
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
  *(_WORD *)&self->_flags |= 0x104u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORPDisplayDetails *)self readAll:0];
    [(GEOLocalizedString *)self->_title clearUnknownFields:1];
    [(GEOLocalizedString *)self->_body clearUnknownFields:1];
    [(GEOMapRegion *)self->_displayRegion clearUnknownFields:1];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = self->_places;
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

    [(GEOTextLink *)self->_outreachLink clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_places, 0);
  objc_storeStrong((id *)&self->_outreachLink, 0);
  objc_storeStrong((id *)&self->_displayRegion, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end