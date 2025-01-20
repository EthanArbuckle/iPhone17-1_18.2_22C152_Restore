@interface GEOPlaceCardModule
+ (BOOL)isValid:(id)a3;
- (BOOL)hasMetadata;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPlaceCardModule)init;
- (GEOPlaceCardModule)initWithData:(id)a3;
- (GEOPlaceCardModule)initWithDictionary:(id)a3;
- (GEOPlaceCardModule)initWithJSON:(id)a3;
- (NSString)metadata;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)contentsAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)typeAsString:(int)a3;
- (int)StringAsContents:(id)a3;
- (int)StringAsType:(id)a3;
- (int)contentAtIndex:(unint64_t)a3;
- (int)contents;
- (int)type;
- (unint64_t)contentsCount;
- (unint64_t)hash;
- (void)_readContents;
- (void)_readMetadata;
- (void)addContent:(int)a3;
- (void)clearContents;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setContents:(int *)a3 count:(unint64_t)a4;
- (void)setHasType:(BOOL)a3;
- (void)setMetadata:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPlaceCardModule

- (void)addContent:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (void)_readContents
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceCardModuleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readContents_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (int)StringAsContents:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"BUTTON_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"BUTTON_TYPE_ADD_TO_GUIDES"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"BUTTON_TYPE_REPORT_AN_ISSUE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"BUTTON_TYPE_SHARE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"BUTTON_TYPE_CALL"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"BUTTON_TYPE_MESSAGE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"BUTTON_TYPE_WEBSITE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"BUTTON_TYPE_QUICK_LINK"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"BUTTON_TYPE_GROUP"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"BUTTON_TYPE_DIRECTIONS"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"BUTTON_TYPE_FLYOVER"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"BUTTON_TYPE_DOWNLOAD"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"BUTTON_TYPE_ADD_PHOTOS"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"BUTTON_TYPE_ADD_TO_FAVORITES"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"BUTTON_TYPE_SAVE_TO_LIBRARY"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"BUTTON_TYPE_ADD_A_NOTE"])
  {
    int v4 = 15;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (GEOPlaceCardModule)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPlaceCardModule;
  v2 = [(GEOPlaceCardModule *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    int v4 = v2;
  }

  return v3;
}

- (GEOPlaceCardModule)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPlaceCardModule;
  id v3 = [(GEOPlaceCardModule *)&v7 initWithData:a3];
  int v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPlaceCardModule;
  [(GEOPlaceCardModule *)&v3 dealloc];
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
  *(unsigned char *)&self->_flags |= 9u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 8;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)typeAsString:(int)a3
{
  if a3 < 0x2F && ((0x7FFFFFFFDFFFuLL >> a3))
  {
    objc_super v3 = off_1E53F8A08[a3];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    objc_super v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
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

- (unint64_t)contentsCount
{
  return self->_contents.count;
}

- (int)contents
{
  return self->_contents.list;
}

- (void)clearContents
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;

  PBRepeatedInt32Clear();
}

- (int)contentAtIndex:(unint64_t)a3
{
  -[GEOPlaceCardModule _readContents]((uint64_t)self);
  p_contents = &self->_contents;
  unint64_t count = self->_contents.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_contents->list[a3];
}

- (void)setContents:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;

  MEMORY[0x1F4147390](&self->_contents, a3, a4);
}

- (id)contentsAsString:(int)a3
{
  if (a3 >= 0x10)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53F8960[a3];
  }

  return v3;
}

- (void)_readMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceCardModuleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMetadata_tags_4);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
}

- (NSString)metadata
{
  -[GEOPlaceCardModule _readMetadata]((uint64_t)self);
  metadata = self->_metadata;

  return metadata;
}

- (void)setMetadata:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPlaceCardModule;
  int v4 = [(GEOPlaceCardModule *)&v8 description];
  v5 = [(GEOPlaceCardModule *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v2 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 64))
    {
      unsigned int v3 = *(_DWORD *)(a1 + 60);
      if (v3 < 0x2F && ((0x7FFFFFFFDFFFuLL >> v3) & 1) != 0)
      {
        int v4 = off_1E53F8A08[v3];
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 60));
        int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      [v2 setObject:v4 forKey:@"type"];
    }
    if (*(void *)(a1 + 24))
    {
      v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      objc_super v6 = (void *)(a1 + 16);
      if (*(void *)(a1 + 24))
      {
        unint64_t v7 = 0;
        do
        {
          uint64_t v8 = *(int *)(*v6 + 4 * v7);
          if (v8 >= 0x10)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
            v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v9 = off_1E53F8960[v8];
          }
          [v5 addObject:v9];

          ++v7;
          objc_super v6 = (void *)(a1 + 16);
        }
        while (v7 < *(void *)(a1 + 24));
      }
      [v2 setObject:v5 forKey:@"content"];
    }
    v10 = [(id)a1 metadata];
    if (v10) {
      [v2 setObject:v10 forKey:@"metadata"];
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (GEOPlaceCardModule)initWithDictionary:(id)a3
{
  return (GEOPlaceCardModule *)-[GEOAPPlaceCardModule _initWithDictionary:isJSON:](self, a3);
}

- (GEOPlaceCardModule)initWithJSON:(id)a3
{
  return (GEOPlaceCardModule *)-[GEOAPPlaceCardModule _initWithDictionary:isJSON:](self, a3);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_10611;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_10612;
    }
    GEOPlaceCardModuleReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPlaceCardModuleIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPlaceCardModuleReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(unsigned char *)&self->_flags & 0xE) == 0)
    {
      unint64_t v7 = self->_reader;
      objc_sync_enter(v7);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      uint64_t v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v9 writeData:v8];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v7);
      goto LABEL_11;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPlaceCardModule *)self readAll:0];
  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteInt32Field();
  }
  v5 = v9;
  if (self->_contents.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      v5 = v9;
      ++v6;
    }
    while (v6 < self->_contents.count);
  }
  if (self->_metadata)
  {
    PBDataWriterWriteStringField();
LABEL_11:
    v5 = v9;
  }
}

- (void)copyTo:(id)a3
{
  unint64_t v7 = (id *)a3;
  [(GEOPlaceCardModule *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v7 + 1, self->_reader);
  *((_DWORD *)v7 + 12) = self->_readerMarkPos;
  *((_DWORD *)v7 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v7 + 15) = self->_type;
    *((unsigned char *)v7 + 64) |= 1u;
  }
  if ([(GEOPlaceCardModule *)self contentsCount])
  {
    [v7 clearContents];
    unint64_t v4 = [(GEOPlaceCardModule *)self contentsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v7, "addContent:", -[GEOPlaceCardModule contentAtIndex:](self, "contentAtIndex:", i));
    }
  }
  if (self->_metadata) {
    objc_msgSend(v7, "setMetadata:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 8) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPlaceCardModuleReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPlaceCardModule *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 60) = self->_type;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
  PBRepeatedInt32Copy();
  uint64_t v9 = [(NSString *)self->_metadata copyWithZone:a3];
  id v8 = *(id *)(v5 + 40);
  *(void *)(v5 + 40) = v9;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  [(GEOPlaceCardModule *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_type != *((_DWORD *)v4 + 15)) {
      goto LABEL_10;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
    goto LABEL_10;
  }
  if (!PBRepeatedInt32IsEqual())
  {
LABEL_10:
    char v6 = 0;
    goto LABEL_11;
  }
  metadata = self->_metadata;
  if ((unint64_t)metadata | *((void *)v4 + 5)) {
    char v6 = -[NSString isEqual:](metadata, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_11:

  return v6;
}

- (unint64_t)hash
{
  [(GEOPlaceCardModule *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_type;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = PBRepeatedInt32Hash() ^ v3;
  return v4 ^ [(NSString *)self->_metadata hash];
}

- (void)mergeFrom:(id)a3
{
  id v8 = (int *)a3;
  [v8 readAll:0];
  if (v8[16])
  {
    self->_type = v8[15];
    *(unsigned char *)&self->_flags |= 1u;
  }
  uint64_t v4 = [v8 contentsCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
      -[GEOPlaceCardModule addContent:](self, "addContent:", [v8 contentAtIndex:i]);
  }
  unint64_t v7 = v8;
  if (*((void *)v8 + 5))
  {
    -[GEOPlaceCardModule setMetadata:](self, "setMetadata:");
    unint64_t v7 = v8;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end