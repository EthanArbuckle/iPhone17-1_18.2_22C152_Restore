@interface GEORevealedPlaceCardModule
+ (BOOL)isValid:(id)a3;
+ (id)moduleWithType:(int)a3;
- (BOOL)hasHours;
- (BOOL)hasInfos;
- (BOOL)hasPhotos;
- (BOOL)hasShowcase;
- (BOOL)hasTitle;
- (BOOL)hasType;
- (BOOL)hasUnifiedActionRow;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORevealedPlaceCardModule)init;
- (GEORevealedPlaceCardModule)initWithData:(id)a3;
- (GEORevealedPlaceCardModule)initWithDictionary:(id)a3;
- (GEORevealedPlaceCardModule)initWithJSON:(id)a3;
- (GEORevealedPlaceCardModuleTypeHours)hours;
- (GEORevealedPlaceCardModuleTypeInfos)infos;
- (GEORevealedPlaceCardModuleTypePhotos)photos;
- (GEORevealedPlaceCardModuleTypeShowcase)showcase;
- (GEORevealedPlaceCardModuleTypeTitle)title;
- (GEORevealedPlaceCardModuleTypeUnifiedActionRow)unifiedActionRow;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readHours;
- (void)_readInfos;
- (void)_readPhotos;
- (void)_readShowcase;
- (void)_readTitle;
- (void)_readUnifiedActionRow;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setHours:(id)a3;
- (void)setInfos:(id)a3;
- (void)setPhotos:(id)a3;
- (void)setShowcase:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(int)a3;
- (void)setUnifiedActionRow:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORevealedPlaceCardModule

+ (id)moduleWithType:(int)a3
{
  v4 = objc_alloc_init(GEORevealedPlaceCardModule);
  [(GEORevealedPlaceCardModule *)v4 setType:GEOPDPlaceDataLayoutConfigurationFromGEOModuleType(a3)];

  return v4;
}

- (GEORevealedPlaceCardModule)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORevealedPlaceCardModule;
  v2 = [(GEORevealedPlaceCardModule *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORevealedPlaceCardModule)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORevealedPlaceCardModule;
  v3 = [(GEORevealedPlaceCardModule *)&v7 initWithData:a3];
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
  if (flags) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x81u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)typeAsString:(int)a3
{
  if a3 < 0x2F && ((0x7FFFFFFFDFFFuLL >> a3))
  {
    v3 = off_1E53F8A08[a3];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
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

- (void)_readTitle
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORevealedPlaceCardModuleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTitle_tags_7);
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

- (GEORevealedPlaceCardModuleTypeTitle)title
{
  -[GEORevealedPlaceCardModule _readTitle]((uint64_t)self);
  title = self->_title;

  return title;
}

- (void)setTitle:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_title, a3);
}

- (void)_readUnifiedActionRow
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORevealedPlaceCardModuleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUnifiedActionRow_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasUnifiedActionRow
{
  return self->_unifiedActionRow != 0;
}

- (GEORevealedPlaceCardModuleTypeUnifiedActionRow)unifiedActionRow
{
  -[GEORevealedPlaceCardModule _readUnifiedActionRow]((uint64_t)self);
  unifiedActionRow = self->_unifiedActionRow;

  return unifiedActionRow;
}

- (void)setUnifiedActionRow:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_unifiedActionRow, a3);
}

- (void)_readPhotos
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORevealedPlaceCardModuleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPhotos_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasPhotos
{
  return self->_photos != 0;
}

- (GEORevealedPlaceCardModuleTypePhotos)photos
{
  -[GEORevealedPlaceCardModule _readPhotos]((uint64_t)self);
  photos = self->_photos;

  return photos;
}

- (void)setPhotos:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x88u;
  objc_storeStrong((id *)&self->_photos, a3);
}

- (void)_readShowcase
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORevealedPlaceCardModuleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readShowcase_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasShowcase
{
  return self->_showcase != 0;
}

- (GEORevealedPlaceCardModuleTypeShowcase)showcase
{
  -[GEORevealedPlaceCardModule _readShowcase]((uint64_t)self);
  showcase = self->_showcase;

  return showcase;
}

- (void)setShowcase:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_showcase, a3);
}

- (void)_readHours
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORevealedPlaceCardModuleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readHours_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasHours
{
  return self->_hours != 0;
}

- (GEORevealedPlaceCardModuleTypeHours)hours
{
  -[GEORevealedPlaceCardModule _readHours]((uint64_t)self);
  hours = self->_hours;

  return hours;
}

- (void)setHours:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x82u;
  objc_storeStrong((id *)&self->_hours, a3);
}

- (void)_readInfos
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORevealedPlaceCardModuleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readInfos_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasInfos
{
  return self->_infos != 0;
}

- (GEORevealedPlaceCardModuleTypeInfos)infos
{
  -[GEORevealedPlaceCardModule _readInfos]((uint64_t)self);
  infos = self->_infos;

  return infos;
}

- (void)setInfos:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x84u;
  objc_storeStrong((id *)&self->_infos, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORevealedPlaceCardModule;
  int v4 = [(GEORevealedPlaceCardModule *)&v8 description];
  v5 = [(GEORevealedPlaceCardModule *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORevealedPlaceCardModule _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 80))
    {
      unsigned int v5 = *(_DWORD *)(a1 + 76);
      if (v5 < 0x2F && ((0x7FFFFFFFDFFFuLL >> v5) & 1) != 0)
      {
        objc_super v6 = off_1E53F8A08[v5];
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 76));
        objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      [v4 setObject:v6 forKey:@"type"];
    }
    objc_super v7 = [(id)a1 title];
    objc_super v8 = v7;
    if (v7)
    {
      if (a2) {
        [v7 jsonRepresentation];
      }
      else {
      v9 = [v7 dictionaryRepresentation];
      }
      [v4 setObject:v9 forKey:@"title"];
    }
    v10 = [(id)a1 unifiedActionRow];
    v11 = v10;
    if (v10)
    {
      if (a2)
      {
        v12 = [v10 jsonRepresentation];
        v13 = @"unifiedActionRow";
      }
      else
      {
        v12 = [v10 dictionaryRepresentation];
        v13 = @"unified_action_row";
      }
      [v4 setObject:v12 forKey:v13];
    }
    v14 = [(id)a1 photos];
    v15 = v14;
    if (v14)
    {
      if (a2) {
        [v14 jsonRepresentation];
      }
      else {
      v16 = [v14 dictionaryRepresentation];
      }
      [v4 setObject:v16 forKey:@"photos"];
    }
    v17 = [(id)a1 showcase];
    v18 = v17;
    if (v17)
    {
      if (a2) {
        [v17 jsonRepresentation];
      }
      else {
      v19 = [v17 dictionaryRepresentation];
      }
      [v4 setObject:v19 forKey:@"showcase"];
    }
    v20 = [(id)a1 hours];
    v21 = v20;
    if (v20)
    {
      if (a2) {
        [v20 jsonRepresentation];
      }
      else {
      v22 = [v20 dictionaryRepresentation];
      }
      [v4 setObject:v22 forKey:@"hours"];
    }
    v23 = [(id)a1 infos];
    v24 = v23;
    if (v23)
    {
      if (a2) {
        [v23 jsonRepresentation];
      }
      else {
      v25 = [v23 dictionaryRepresentation];
      }
      [v4 setObject:v25 forKey:@"infos"];
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
  return -[GEORevealedPlaceCardModule _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORevealedPlaceCardModule)initWithDictionary:(id)a3
{
  return (GEORevealedPlaceCardModule *)-[GEORevealedPlaceCardModule _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_135;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_135;
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

  v9 = [v5 objectForKeyedSubscript:@"title"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = [GEORevealedPlaceCardModuleTypeTitle alloc];
    if (a3) {
      uint64_t v11 = [(GEORevealedPlaceCardModuleTypeTitle *)v10 initWithJSON:v9];
    }
    else {
      uint64_t v11 = [(GEORevealedPlaceCardModuleTypeTitle *)v10 initWithDictionary:v9];
    }
    v12 = (void *)v11;
    [a1 setTitle:v11];
  }
  if (a3) {
    v13 = @"unifiedActionRow";
  }
  else {
    v13 = @"unified_action_row";
  }
  v14 = [v5 objectForKeyedSubscript:v13];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v15 = [GEORevealedPlaceCardModuleTypeUnifiedActionRow alloc];
    if (a3) {
      uint64_t v16 = [(GEORevealedPlaceCardModuleTypeUnifiedActionRow *)v15 initWithJSON:v14];
    }
    else {
      uint64_t v16 = [(GEORevealedPlaceCardModuleTypeUnifiedActionRow *)v15 initWithDictionary:v14];
    }
    v17 = (void *)v16;
    [a1 setUnifiedActionRow:v16];
  }
  v18 = [v5 objectForKeyedSubscript:@"photos"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v19 = [GEORevealedPlaceCardModuleTypePhotos alloc];
    if (a3) {
      uint64_t v20 = [(GEORevealedPlaceCardModuleTypePhotos *)v19 initWithJSON:v18];
    }
    else {
      uint64_t v20 = [(GEORevealedPlaceCardModuleTypePhotos *)v19 initWithDictionary:v18];
    }
    v21 = (void *)v20;
    [a1 setPhotos:v20];
  }
  v22 = [v5 objectForKeyedSubscript:@"showcase"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v23 = [GEORevealedPlaceCardModuleTypeShowcase alloc];
    if (a3) {
      uint64_t v24 = [(GEORevealedPlaceCardModuleTypeShowcase *)v23 initWithJSON:v22];
    }
    else {
      uint64_t v24 = [(GEORevealedPlaceCardModuleTypeShowcase *)v23 initWithDictionary:v22];
    }
    v25 = (void *)v24;
    [a1 setShowcase:v24];
  }
  v26 = [v5 objectForKeyedSubscript:@"hours"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v27 = [GEORevealedPlaceCardModuleTypeHours alloc];
    if (a3) {
      uint64_t v28 = [(GEORevealedPlaceCardModuleTypeHours *)v27 initWithJSON:v26];
    }
    else {
      uint64_t v28 = [(GEORevealedPlaceCardModuleTypeHours *)v27 initWithDictionary:v26];
    }
    v29 = (void *)v28;
    [a1 setHours:v28];
  }
  v30 = [v5 objectForKeyedSubscript:@"infos"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v31 = [GEORevealedPlaceCardModuleTypeInfos alloc];
    if (a3) {
      uint64_t v32 = [(GEORevealedPlaceCardModuleTypeInfos *)v31 initWithJSON:v30];
    }
    else {
      uint64_t v32 = [(GEORevealedPlaceCardModuleTypeInfos *)v31 initWithDictionary:v30];
    }
    v33 = (void *)v32;
    [a1 setInfos:v32];
  }
LABEL_135:

  return a1;
}

- (GEORevealedPlaceCardModule)initWithJSON:(id)a3
{
  return (GEORevealedPlaceCardModule *)-[GEORevealedPlaceCardModule _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_10777;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_10778;
    }
    GEORevealedPlaceCardModuleReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORevealedPlaceCardModuleCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORevealedPlaceCardModuleIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORevealedPlaceCardModuleReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORevealedPlaceCardModuleIsDirty((uint64_t)self) & 1) == 0)
  {
    id v5 = self->_reader;
    objc_sync_enter(v5);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v6 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v7 writeData:v6];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v5);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORevealedPlaceCardModule *)self readAll:0];
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_title) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_unifiedActionRow) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_photos) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_showcase) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_hours) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_infos) {
      PBDataWriterWriteSubmessage();
    }
  }
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEORevealedPlaceCardModule *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 16) = self->_readerMarkPos;
  *((_DWORD *)v5 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  int v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v5 + 19) = self->_type;
    *((unsigned char *)v5 + 80) |= 1u;
  }
  if (self->_title)
  {
    objc_msgSend(v5, "setTitle:");
    int v4 = v5;
  }
  if (self->_unifiedActionRow)
  {
    objc_msgSend(v5, "setUnifiedActionRow:");
    int v4 = v5;
  }
  if (self->_photos)
  {
    objc_msgSend(v5, "setPhotos:");
    int v4 = v5;
  }
  if (self->_showcase)
  {
    objc_msgSend(v5, "setShowcase:");
    int v4 = v5;
  }
  if (self->_hours)
  {
    objc_msgSend(v5, "setHours:");
    int v4 = v5;
  }
  if (self->_infos)
  {
    objc_msgSend(v5, "setInfos:");
    int v4 = v5;
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
    if ((*(unsigned char *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORevealedPlaceCardModuleReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORevealedPlaceCardModule *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 76) = self->_type;
    *(unsigned char *)(v5 + 80) |= 1u;
  }
  id v9 = [(GEORevealedPlaceCardModuleTypeTitle *)self->_title copyWithZone:a3];
  v10 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v9;

  id v11 = [(GEORevealedPlaceCardModuleTypeUnifiedActionRow *)self->_unifiedActionRow copyWithZone:a3];
  v12 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v11;

  id v13 = [(GEORevealedPlaceCardModuleTypePhotos *)self->_photos copyWithZone:a3];
  v14 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v13;

  id v15 = [(GEORevealedPlaceCardModuleTypeShowcase *)self->_showcase copyWithZone:a3];
  uint64_t v16 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v15;

  id v17 = [(GEORevealedPlaceCardModuleTypeHours *)self->_hours copyWithZone:a3];
  v18 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v17;

  id v19 = [(GEORevealedPlaceCardModuleTypeInfos *)self->_infos copyWithZone:a3];
  id v8 = *(id *)(v5 + 24);
  *(void *)(v5 + 24) = v19;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  [(GEORevealedPlaceCardModule *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 80) & 1) == 0 || self->_type != *((_DWORD *)v4 + 19)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 80))
  {
LABEL_19:
    char v11 = 0;
    goto LABEL_20;
  }
  title = self->_title;
  if ((unint64_t)title | *((void *)v4 + 6)
    && !-[GEORevealedPlaceCardModuleTypeTitle isEqual:](title, "isEqual:"))
  {
    goto LABEL_19;
  }
  unifiedActionRow = self->_unifiedActionRow;
  if ((unint64_t)unifiedActionRow | *((void *)v4 + 7))
  {
    if (!-[GEORevealedPlaceCardModuleTypeUnifiedActionRow isEqual:](unifiedActionRow, "isEqual:")) {
      goto LABEL_19;
    }
  }
  photos = self->_photos;
  if ((unint64_t)photos | *((void *)v4 + 4))
  {
    if (!-[GEORevealedPlaceCardModuleTypePhotos isEqual:](photos, "isEqual:")) {
      goto LABEL_19;
    }
  }
  showcase = self->_showcase;
  if ((unint64_t)showcase | *((void *)v4 + 5))
  {
    if (!-[GEORevealedPlaceCardModuleTypeShowcase isEqual:](showcase, "isEqual:")) {
      goto LABEL_19;
    }
  }
  hours = self->_hours;
  if ((unint64_t)hours | *((void *)v4 + 2))
  {
    if (!-[GEORevealedPlaceCardModuleTypeHours isEqual:](hours, "isEqual:")) {
      goto LABEL_19;
    }
  }
  infos = self->_infos;
  if ((unint64_t)infos | *((void *)v4 + 3)) {
    char v11 = -[GEORevealedPlaceCardModuleTypeInfos isEqual:](infos, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_20:

  return v11;
}

- (unint64_t)hash
{
  [(GEORevealedPlaceCardModule *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_type;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(GEORevealedPlaceCardModuleTypeTitle *)self->_title hash] ^ v3;
  unint64_t v5 = [(GEORevealedPlaceCardModuleTypeUnifiedActionRow *)self->_unifiedActionRow hash];
  unint64_t v6 = v4 ^ v5 ^ [(GEORevealedPlaceCardModuleTypePhotos *)self->_photos hash];
  unint64_t v7 = [(GEORevealedPlaceCardModuleTypeShowcase *)self->_showcase hash];
  unint64_t v8 = v7 ^ [(GEORevealedPlaceCardModuleTypeHours *)self->_hours hash];
  return v6 ^ v8 ^ [(GEORevealedPlaceCardModuleTypeInfos *)self->_infos hash];
}

- (void)mergeFrom:(id)a3
{
  id v17 = (int *)a3;
  [v17 readAll:0];
  unint64_t v4 = v17;
  if (v17[20])
  {
    self->_type = v17[19];
    *(unsigned char *)&self->_flags |= 1u;
  }
  title = self->_title;
  uint64_t v6 = *((void *)v17 + 6);
  if (title)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEORevealedPlaceCardModuleTypeTitle mergeFrom:](title, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEORevealedPlaceCardModule setTitle:](self, "setTitle:");
  }
  unint64_t v4 = v17;
LABEL_9:
  unifiedActionRow = self->_unifiedActionRow;
  uint64_t v8 = *((void *)v4 + 7);
  if (unifiedActionRow)
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[GEORevealedPlaceCardModuleTypeUnifiedActionRow mergeFrom:](unifiedActionRow, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[GEORevealedPlaceCardModule setUnifiedActionRow:](self, "setUnifiedActionRow:");
  }
  unint64_t v4 = v17;
LABEL_15:
  photos = self->_photos;
  uint64_t v10 = *((void *)v4 + 4);
  if (photos)
  {
    if (!v10) {
      goto LABEL_21;
    }
    -[GEORevealedPlaceCardModuleTypePhotos mergeFrom:](photos, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_21;
    }
    -[GEORevealedPlaceCardModule setPhotos:](self, "setPhotos:");
  }
  unint64_t v4 = v17;
LABEL_21:
  showcase = self->_showcase;
  uint64_t v12 = *((void *)v4 + 5);
  if (showcase)
  {
    if (!v12) {
      goto LABEL_27;
    }
    -[GEORevealedPlaceCardModuleTypeShowcase mergeFrom:](showcase, "mergeFrom:");
  }
  else
  {
    if (!v12) {
      goto LABEL_27;
    }
    -[GEORevealedPlaceCardModule setShowcase:](self, "setShowcase:");
  }
  unint64_t v4 = v17;
LABEL_27:
  hours = self->_hours;
  uint64_t v14 = *((void *)v4 + 2);
  if (hours)
  {
    if (!v14) {
      goto LABEL_33;
    }
    -[GEORevealedPlaceCardModuleTypeHours mergeFrom:](hours, "mergeFrom:");
  }
  else
  {
    if (!v14) {
      goto LABEL_33;
    }
    -[GEORevealedPlaceCardModule setHours:](self, "setHours:");
  }
  unint64_t v4 = v17;
LABEL_33:
  infos = self->_infos;
  uint64_t v16 = *((void *)v4 + 3);
  if (infos)
  {
    if (!v16) {
      goto LABEL_39;
    }
    -[GEORevealedPlaceCardModuleTypeInfos mergeFrom:](infos, "mergeFrom:");
  }
  else
  {
    if (!v16) {
      goto LABEL_39;
    }
    -[GEORevealedPlaceCardModule setInfos:](self, "setInfos:");
  }
  unint64_t v4 = v17;
LABEL_39:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unifiedActionRow, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_showcase, 0);
  objc_storeStrong((id *)&self->_photos, 0);
  objc_storeStrong((id *)&self->_infos, 0);
  objc_storeStrong((id *)&self->_hours, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end