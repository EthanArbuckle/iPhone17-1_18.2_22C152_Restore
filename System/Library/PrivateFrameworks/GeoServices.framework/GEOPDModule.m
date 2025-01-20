@interface GEOPDModule
+ (BOOL)isValid:(id)a3;
- (BOOL)hasModuleConfigurationIndex;
- (BOOL)hasModuleDebugDescription;
- (BOOL)hasOptions;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDModule)init;
- (GEOPDModule)initWithData:(id)a3;
- (GEOPDModule)initWithDictionary:(id)a3;
- (GEOPDModule)initWithJSON:(id)a3;
- (GEOPDModuleOptions)options;
- (NSString)moduleDebugDescription;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)moduleConfigurationIndex;
- (int)type;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readModuleDebugDescription;
- (void)_readOptions;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHasModuleConfigurationIndex:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setModuleConfigurationIndex:(int)a3;
- (void)setModuleDebugDescription:(id)a3;
- (void)setOptions:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDModule

- (GEOPDModule)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDModule;
  v2 = [(GEOPDModule *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDModule)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDModule;
  v3 = [(GEOPDModule *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)type
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x22u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 34;
  }
  else {
    char v3 = 32;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)typeAsString:(int)a3
{
  if a3 < 0x2F && ((0x7FFFFFFFDFFFuLL >> a3))
  {
    char v3 = off_1E53E3C90[a3];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"MODULE_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_TITLE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_BUTTONS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_INLINE_MAP"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_PHOTOS"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_INFOS"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_TRANSIT_DEPARTURE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_TRANSIT_ATTRIBUTION"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_ENCYCLOPEDIC"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_HOURS"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_BUSINESS_INFOS"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_REVIEWS"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_ACTIONS_ROW"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_RESERVATIONS"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_OFFICIAL_APPS"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_VENUE_BROWSE"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_VENUE_INFO"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_INFO_PARENT"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_ANNOTATED_LIST"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_ANNOTATED_PICTURE"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_MESSAGE"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_MESSAGE_HOURS"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_ACTION_FOOTER"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_ATTRIBUTION"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_WEB_CONTENT"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_RELATED_PLACE_LIST"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_SERVICE_HOURS"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_QUICK_LINKS"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_COLLECTIONS"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_PLACE_BROWSE_CATEGORIES"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_MINI_PLACE_BROWSE_CATEGORIES"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_CURATED_COLLECTIONS"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_PLACE_QUESTIONNAIRE"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_APPLE_RATINGS"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_PLACE_RIBBON"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_REVIEW_AND_RATING"])
  {
    int v4 = 36;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_ABOUT"])
  {
    int v4 = 37;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_TEMPLATE_PLACE"])
  {
    int v4 = 38;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_TRANSIT_LABELS"])
  {
    int v4 = 39;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_PLACECARD_ENRICHMENT"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_UNIFIED_ACTION_ROW"])
  {
    int v4 = 41;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_QUESTIONNAIRE_SUGGESTION"])
  {
    int v4 = 42;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_EV_CHARGER"])
  {
    int v4 = 43;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_HIKING_ASSOCIATION"])
  {
    int v4 = 44;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_NOTE"])
  {
    int v4 = 45;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_HIKE_SUGGESTION"])
  {
    int v4 = 46;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readOptions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 60) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDModuleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOptions_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasOptions
{
  return self->_options != 0;
}

- (GEOPDModuleOptions)options
{
  -[GEOPDModule _readOptions]((uint64_t)self);
  options = self->_options;

  return options;
}

- (void)setOptions:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_options, a3);
}

- (void)_readModuleDebugDescription
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDModuleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readModuleDebugDescription_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasModuleDebugDescription
{
  return self->_moduleDebugDescription != 0;
}

- (NSString)moduleDebugDescription
{
  -[GEOPDModule _readModuleDebugDescription]((uint64_t)self);
  moduleDebugDescription = self->_moduleDebugDescription;

  return moduleDebugDescription;
}

- (void)setModuleDebugDescription:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_moduleDebugDescription, a3);
}

- (int)moduleConfigurationIndex
{
  return self->_moduleConfigurationIndex;
}

- (void)setModuleConfigurationIndex:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x21u;
  self->_moduleConfigurationIndex = a3;
}

- (void)setHasModuleConfigurationIndex:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasModuleConfigurationIndex
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDModule;
  int v4 = [(GEOPDModule *)&v8 description];
  v5 = [(GEOPDModule *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDModule _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ((*(unsigned char *)(a1 + 60) & 2) != 0)
    {
      unsigned int v5 = *(_DWORD *)(a1 + 56);
      if (v5 < 0x2F && ((0x7FFFFFFFDFFFuLL >> v5) & 1) != 0)
      {
        objc_super v6 = off_1E53E3C90[v5];
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 56));
        objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      [v4 setObject:v6 forKey:@"type"];
    }
    objc_super v7 = [(id)a1 options];
    objc_super v8 = v7;
    if (v7)
    {
      if (a2) {
        [v7 jsonRepresentation];
      }
      else {
      v9 = [v7 dictionaryRepresentation];
      }
      [v4 setObject:v9 forKey:@"options"];
    }
    v10 = [(id)a1 moduleDebugDescription];
    if (v10)
    {
      if (a2) {
        v11 = @"debugDescription";
      }
      else {
        v11 = @"debug_description";
      }
      [v4 setObject:v10 forKey:v11];
    }

    if (*(unsigned char *)(a1 + 60))
    {
      v12 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 52)];
      if (a2) {
        v13 = @"moduleConfigurationIndex";
      }
      else {
        v13 = @"module_configuration_index";
      }
      [v4 setObject:v12 forKey:v13];
    }
    v14 = *(void **)(a1 + 16);
    if (v14)
    {
      v15 = [v14 dictionaryRepresentation];
      v16 = v15;
      if (a2)
      {
        v17 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __41__GEOPDModule__dictionaryRepresentation___block_invoke;
        v21[3] = &unk_1E53D8860;
        id v18 = v17;
        id v22 = v18;
        [v16 enumerateKeysAndObjectsUsingBlock:v21];
        id v19 = v18;

        v16 = v19;
      }
      [v4 setObject:v16 forKey:@"Unknown Fields"];
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
  return -[GEOPDModule _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __41__GEOPDModule__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
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

- (GEOPDModule)initWithDictionary:(id)a3
{
  return (GEOPDModule *)-[GEOPDModule _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_117;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_117;
  }
  objc_super v6 = [v5 objectForKeyedSubscript:@"type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if ([v7 isEqualToString:@"MODULE_TYPE_UNKNOWN"])
    {
      uint64_t v8 = 0;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_TITLE"])
    {
      uint64_t v8 = 1;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_BUTTONS"])
    {
      uint64_t v8 = 2;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_INLINE_MAP"])
    {
      uint64_t v8 = 3;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_PHOTOS"])
    {
      uint64_t v8 = 4;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_INFOS"])
    {
      uint64_t v8 = 5;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_TRANSIT_DEPARTURE"])
    {
      uint64_t v8 = 6;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_TRANSIT_ATTRIBUTION"])
    {
      uint64_t v8 = 7;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_ENCYCLOPEDIC"])
    {
      uint64_t v8 = 8;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_HOURS"])
    {
      uint64_t v8 = 9;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_BUSINESS_INFOS"])
    {
      uint64_t v8 = 10;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_REVIEWS"])
    {
      uint64_t v8 = 11;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_ACTIONS_ROW"])
    {
      uint64_t v8 = 12;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_RESERVATIONS"])
    {
      uint64_t v8 = 14;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_OFFICIAL_APPS"])
    {
      uint64_t v8 = 15;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_VENUE_BROWSE"])
    {
      uint64_t v8 = 16;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_VENUE_INFO"])
    {
      uint64_t v8 = 17;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_INFO_PARENT"])
    {
      uint64_t v8 = 18;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_ANNOTATED_LIST"])
    {
      uint64_t v8 = 19;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_ANNOTATED_PICTURE"])
    {
      uint64_t v8 = 20;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_MESSAGE"])
    {
      uint64_t v8 = 21;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_MESSAGE_HOURS"])
    {
      uint64_t v8 = 22;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_ACTION_FOOTER"])
    {
      uint64_t v8 = 23;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_ATTRIBUTION"])
    {
      uint64_t v8 = 24;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_WEB_CONTENT"])
    {
      uint64_t v8 = 25;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_RELATED_PLACE_LIST"])
    {
      uint64_t v8 = 26;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_SERVICE_HOURS"])
    {
      uint64_t v8 = 27;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_QUICK_LINKS"])
    {
      uint64_t v8 = 28;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_COLLECTIONS"])
    {
      uint64_t v8 = 29;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_PLACE_BROWSE_CATEGORIES"])
    {
      uint64_t v8 = 30;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_MINI_PLACE_BROWSE_CATEGORIES"])
    {
      uint64_t v8 = 31;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_CURATED_COLLECTIONS"])
    {
      uint64_t v8 = 32;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_PLACE_QUESTIONNAIRE"])
    {
      uint64_t v8 = 33;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_APPLE_RATINGS"])
    {
      uint64_t v8 = 34;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_PLACE_RIBBON"])
    {
      uint64_t v8 = 35;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_REVIEW_AND_RATING"])
    {
      uint64_t v8 = 36;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_ABOUT"])
    {
      uint64_t v8 = 37;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_TEMPLATE_PLACE"])
    {
      uint64_t v8 = 38;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_TRANSIT_LABELS"])
    {
      uint64_t v8 = 39;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_PLACECARD_ENRICHMENT"])
    {
      uint64_t v8 = 40;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_UNIFIED_ACTION_ROW"])
    {
      uint64_t v8 = 41;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_QUESTIONNAIRE_SUGGESTION"])
    {
      uint64_t v8 = 42;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_EV_CHARGER"])
    {
      uint64_t v8 = 43;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_HIKING_ASSOCIATION"])
    {
      uint64_t v8 = 44;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_NOTE"])
    {
      uint64_t v8 = 45;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_HIKE_SUGGESTION"])
    {
      uint64_t v8 = 46;
    }
    else
    {
      uint64_t v8 = 0;
    }

    goto LABEL_100;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v6 intValue];
LABEL_100:
    [a1 setType:v8];
  }

  v9 = [v5 objectForKeyedSubscript:@"options"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = [GEOPDModuleOptions alloc];
    if (a3) {
      uint64_t v11 = [(GEOPDModuleOptions *)v10 initWithJSON:v9];
    }
    else {
      uint64_t v11 = [(GEOPDModuleOptions *)v10 initWithDictionary:v9];
    }
    v12 = (void *)v11;
    [a1 setOptions:v11];
  }
  if (a3) {
    v13 = @"debugDescription";
  }
  else {
    v13 = @"debug_description";
  }
  v14 = [v5 objectForKeyedSubscript:v13];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v15 = (void *)[v14 copy];
    [a1 setModuleDebugDescription:v15];
  }
  if (a3) {
    v16 = @"moduleConfigurationIndex";
  }
  else {
    v16 = @"module_configuration_index";
  }
  v17 = [v5 objectForKeyedSubscript:v16];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setModuleConfigurationIndex:", objc_msgSend(v17, "intValue"));
  }

LABEL_117:
  return a1;
}

- (GEOPDModule)initWithJSON:(id)a3
{
  return (GEOPDModule *)-[GEOPDModule _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_6503;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_6504;
    }
    GEOPDModuleReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEOPDModuleOptions *)self->_options readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDModuleIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDModuleReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x38) == 0))
  {
    objc_super v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPDModule *)self readAll:0];
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      PBDataWriterWriteInt32Field();
    }
    id v5 = v8;
    if (self->_options)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_moduleDebugDescription)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (*(unsigned char *)&self->_flags)
    {
      PBDataWriterWriteInt32Field();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)copyTo:(id)a3
{
  int v4 = (id *)a3;
  [(GEOPDModule *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 10) = self->_readerMarkPos;
  *((_DWORD *)v4 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v4 + 14) = self->_type;
    *((unsigned char *)v4 + 60) |= 2u;
  }
  if (self->_options) {
    objc_msgSend(v4, "setOptions:");
  }
  if (self->_moduleDebugDescription) {
    objc_msgSend(v4, "setModuleDebugDescription:");
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v4 + 13) = self->_moduleConfigurationIndex;
    *((unsigned char *)v4 + 60) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDModuleReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDModule *)self readAll:0];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_type;
    *(unsigned char *)(v5 + 60) |= 2u;
  }
  id v9 = [(GEOPDModuleOptions *)self->_options copyWithZone:a3];
  id v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  uint64_t v11 = [(NSString *)self->_moduleDebugDescription copyWithZone:a3];
  v12 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v11;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 52) = self->_moduleConfigurationIndex;
    *(unsigned char *)(v5 + 60) |= 1u;
  }
  v13 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v13;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  [(GEOPDModule *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_type != *((_DWORD *)v4 + 14)) {
      goto LABEL_15;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
LABEL_15:
    BOOL v7 = 0;
    goto LABEL_16;
  }
  options = self->_options;
  if ((unint64_t)options | *((void *)v4 + 4) && !-[GEOPDModuleOptions isEqual:](options, "isEqual:")) {
    goto LABEL_15;
  }
  moduleDebugDescription = self->_moduleDebugDescription;
  if ((unint64_t)moduleDebugDescription | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](moduleDebugDescription, "isEqual:")) {
      goto LABEL_15;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 60) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_moduleConfigurationIndex != *((_DWORD *)v4 + 13)) {
      goto LABEL_15;
    }
    BOOL v7 = 1;
  }
LABEL_16:

  return v7;
}

- (unint64_t)hash
{
  [(GEOPDModule *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_type;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(GEOPDModuleOptions *)self->_options hash];
  NSUInteger v5 = [(NSString *)self->_moduleDebugDescription hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v6 = 2654435761 * self->_moduleConfigurationIndex;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  BOOL v7 = (int *)a3;
  [v7 readAll:0];
  unint64_t v4 = v7;
  if ((v7[15] & 2) != 0)
  {
    self->_type = v7[14];
    *(unsigned char *)&self->_flags |= 2u;
  }
  options = self->_options;
  uint64_t v6 = *((void *)v7 + 4);
  if (options)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOPDModuleOptions mergeFrom:](options, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOPDModule setOptions:](self, "setOptions:");
  }
  unint64_t v4 = v7;
LABEL_9:
  if (*((void *)v4 + 3))
  {
    -[GEOPDModule setModuleDebugDescription:](self, "setModuleDebugDescription:");
    unint64_t v4 = v7;
  }
  if (v4[15])
  {
    self->_moduleConfigurationIndex = v4[13];
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      NSUInteger v5 = reader;
      objc_sync_enter(v5);
      GEOPDModuleReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_6508);
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
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x24u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPDModule *)self readAll:0];
    options = self->_options;
    [(GEOPDModuleOptions *)options clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_moduleDebugDescription, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end