@interface GEORPPoiEnrichmentUpdate
+ (BOOL)isValid:(id)a3;
+ (Class)imageIdType;
+ (Class)imageUpdateType;
- (BOOL)hasAction;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasPlace;
- (BOOL)hasPlaceContext;
- (BOOL)hasScorecard;
- (BOOL)hasScorecardUpdate;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDPlace)place;
- (GEORPPoiEnrichmentPlaceContext)placeContext;
- (GEORPPoiEnrichmentUpdate)init;
- (GEORPPoiEnrichmentUpdate)initWithData:(id)a3;
- (GEORPPoiEnrichmentUpdate)initWithDictionary:(id)a3;
- (GEORPPoiEnrichmentUpdate)initWithJSON:(id)a3;
- (GEORPScorecard)scorecard;
- (GEORPScorecardUpdate)scorecardUpdate;
- (NSMutableArray)imageIds;
- (NSMutableArray)imageUpdates;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)actionAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)imageIdAtIndex:(unint64_t)a3;
- (id)imageUpdateAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (int)StringAsAction:(id)a3;
- (int)action;
- (unint64_t)hash;
- (unint64_t)imageIdsCount;
- (unint64_t)imageUpdatesCount;
- (void)_addNoFlagsImageId:(uint64_t)a1;
- (void)_addNoFlagsImageUpdate:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readImageIds;
- (void)_readImageUpdates;
- (void)_readPlace;
- (void)_readPlaceContext;
- (void)_readScorecard;
- (void)_readScorecardUpdate;
- (void)addImageId:(id)a3;
- (void)addImageUpdate:(id)a3;
- (void)clearImageIds;
- (void)clearImageUpdates;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAction:(int)a3;
- (void)setHasAction:(BOOL)a3;
- (void)setImageIds:(id)a3;
- (void)setImageUpdates:(id)a3;
- (void)setPlace:(id)a3;
- (void)setPlaceContext:(id)a3;
- (void)setScorecard:(id)a3;
- (void)setScorecardUpdate:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPPoiEnrichmentUpdate

- (GEORPPoiEnrichmentUpdate)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPPoiEnrichmentUpdate;
  v2 = [(GEORPPoiEnrichmentUpdate *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPPoiEnrichmentUpdate)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPPoiEnrichmentUpdate;
  v3 = [(GEORPPoiEnrichmentUpdate *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)action
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_action;
  }
  else {
    return 0;
  }
}

- (void)setAction:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x81u;
  self->_action = a3;
}

- (void)setHasAction:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasAction
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)actionAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53DF1B8[a3];
  }

  return v3;
}

- (int)StringAsAction:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"POI_ENRICHMENT_UPDATE_ACTION_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"POI_ENRICHMENT_UPDATE_ACTION_ADD"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"POI_ENRICHMENT_UPDATE_ACTION_REMOVE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"POI_ENRICHMENT_UPDATE_ACTION_UNMODIFIED"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readPlace
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
        GEORPPoiEnrichmentUpdateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlace_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasPlace
{
  return self->_place != 0;
}

- (GEOPDPlace)place
{
  -[GEORPPoiEnrichmentUpdate _readPlace]((uint64_t)self);
  place = self->_place;

  return place;
}

- (void)setPlace:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_place, a3);
}

- (void)_readImageIds
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
        GEORPPoiEnrichmentUpdateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readImageIds_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)imageIds
{
  -[GEORPPoiEnrichmentUpdate _readImageIds]((uint64_t)self);
  imageIds = self->_imageIds;

  return imageIds;
}

- (void)setImageIds:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  imageIds = self->_imageIds;
  self->_imageIds = v4;
}

- (void)clearImageIds
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  imageIds = self->_imageIds;

  [(NSMutableArray *)imageIds removeAllObjects];
}

- (void)addImageId:(id)a3
{
  id v4 = a3;
  -[GEORPPoiEnrichmentUpdate _readImageIds]((uint64_t)self);
  -[GEORPPoiEnrichmentUpdate _addNoFlagsImageId:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsImageId:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 16);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v5;

      id v4 = *(void **)(a1 + 16);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)imageIdsCount
{
  -[GEORPPoiEnrichmentUpdate _readImageIds]((uint64_t)self);
  imageIds = self->_imageIds;

  return [(NSMutableArray *)imageIds count];
}

- (id)imageIdAtIndex:(unint64_t)a3
{
  -[GEORPPoiEnrichmentUpdate _readImageIds]((uint64_t)self);
  imageIds = self->_imageIds;

  return (id)[(NSMutableArray *)imageIds objectAtIndex:a3];
}

+ (Class)imageIdType
{
  return (Class)objc_opt_class();
}

- (void)_readScorecard
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
        GEORPPoiEnrichmentUpdateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readScorecard_tags_309);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasScorecard
{
  return self->_scorecard != 0;
}

- (GEORPScorecard)scorecard
{
  -[GEORPPoiEnrichmentUpdate _readScorecard]((uint64_t)self);
  scorecard = self->_scorecard;

  return scorecard;
}

- (void)setScorecard:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_scorecard, a3);
}

- (void)_readImageUpdates
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
        GEORPPoiEnrichmentUpdateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readImageUpdates_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)imageUpdates
{
  -[GEORPPoiEnrichmentUpdate _readImageUpdates]((uint64_t)self);
  imageUpdates = self->_imageUpdates;

  return imageUpdates;
}

- (void)setImageUpdates:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  imageUpdates = self->_imageUpdates;
  self->_imageUpdates = v4;
}

- (void)clearImageUpdates
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  imageUpdates = self->_imageUpdates;

  [(NSMutableArray *)imageUpdates removeAllObjects];
}

- (void)addImageUpdate:(id)a3
{
  id v4 = a3;
  -[GEORPPoiEnrichmentUpdate _readImageUpdates]((uint64_t)self);
  -[GEORPPoiEnrichmentUpdate _addNoFlagsImageUpdate:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsImageUpdate:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 24);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v5;

      id v4 = *(void **)(a1 + 24);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)imageUpdatesCount
{
  -[GEORPPoiEnrichmentUpdate _readImageUpdates]((uint64_t)self);
  imageUpdates = self->_imageUpdates;

  return [(NSMutableArray *)imageUpdates count];
}

- (id)imageUpdateAtIndex:(unint64_t)a3
{
  -[GEORPPoiEnrichmentUpdate _readImageUpdates]((uint64_t)self);
  imageUpdates = self->_imageUpdates;

  return (id)[(NSMutableArray *)imageUpdates objectAtIndex:a3];
}

+ (Class)imageUpdateType
{
  return (Class)objc_opt_class();
}

- (void)_readScorecardUpdate
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
        GEORPPoiEnrichmentUpdateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readScorecardUpdate_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasScorecardUpdate
{
  return self->_scorecardUpdate != 0;
}

- (GEORPScorecardUpdate)scorecardUpdate
{
  -[GEORPPoiEnrichmentUpdate _readScorecardUpdate]((uint64_t)self);
  scorecardUpdate = self->_scorecardUpdate;

  return scorecardUpdate;
}

- (void)setScorecardUpdate:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_scorecardUpdate, a3);
}

- (void)_readPlaceContext
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
        GEORPPoiEnrichmentUpdateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceContext_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasPlaceContext
{
  return self->_placeContext != 0;
}

- (GEORPPoiEnrichmentPlaceContext)placeContext
{
  -[GEORPPoiEnrichmentUpdate _readPlaceContext]((uint64_t)self);
  placeContext = self->_placeContext;

  return placeContext;
}

- (void)setPlaceContext:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x88u;
  objc_storeStrong((id *)&self->_placeContext, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPPoiEnrichmentUpdate;
  id v4 = [(GEORPPoiEnrichmentUpdate *)&v8 description];
  id v5 = [(GEORPPoiEnrichmentUpdate *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPPoiEnrichmentUpdate _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 80))
    {
      uint64_t v5 = *(int *)(a1 + 76);
      if (v5 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 76));
        objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v6 = off_1E53DF1B8[v5];
      }
      [v4 setObject:v6 forKey:@"action"];
    }
    id v7 = [(id)a1 place];
    objc_super v8 = v7;
    if (v7)
    {
      if (a2) {
        [v7 jsonRepresentation];
      }
      else {
      v9 = [v7 dictionaryRepresentation];
      }
      [v4 setObject:v9 forKey:@"place"];
    }
    if (*(void *)(a1 + 16))
    {
      v10 = [(id)a1 imageIds];
      if (a2) {
        v11 = @"imageId";
      }
      else {
        v11 = @"image_id";
      }
      [v4 setObject:v10 forKey:v11];
    }
    v12 = [(id)a1 scorecard];
    v13 = v12;
    if (v12)
    {
      if (a2) {
        [v12 jsonRepresentation];
      }
      else {
      v14 = [v12 dictionaryRepresentation];
      }
      [v4 setObject:v14 forKey:@"scorecard"];
    }
    if ([*(id *)(a1 + 24) count])
    {
      v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v16 = *(id *)(a1 + 24);
      uint64_t v17 = [v16 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v34 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            if (a2) {
              [v21 jsonRepresentation];
            }
            else {
            v22 = [v21 dictionaryRepresentation];
            }
            [v15 addObject:v22];
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v33 objects:v37 count:16];
        }
        while (v18);
      }

      if (a2) {
        v23 = @"imageUpdate";
      }
      else {
        v23 = @"image_update";
      }
      [v4 setObject:v15 forKey:v23];
    }
    v24 = [(id)a1 scorecardUpdate];
    v25 = v24;
    if (v24)
    {
      if (a2)
      {
        v26 = [v24 jsonRepresentation];
        v27 = @"scorecardUpdate";
      }
      else
      {
        v26 = [v24 dictionaryRepresentation];
        v27 = @"scorecard_update";
      }
      [v4 setObject:v26 forKey:v27];
    }
    v28 = [(id)a1 placeContext];
    v29 = v28;
    if (v28)
    {
      if (a2)
      {
        v30 = [v28 jsonRepresentation];
        v31 = @"placeContext";
      }
      else
      {
        v30 = [v28 dictionaryRepresentation];
        v31 = @"place_context";
      }
      [v4 setObject:v30 forKey:v31];
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
  return -[GEORPPoiEnrichmentUpdate _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPPoiEnrichmentUpdate)initWithDictionary:(id)a3
{
  return (GEORPPoiEnrichmentUpdate *)-[GEORPPoiEnrichmentUpdate _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_75;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_75;
  }
  objc_super v6 = [v5 objectForKeyedSubscript:@"action"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if ([v7 isEqualToString:@"POI_ENRICHMENT_UPDATE_ACTION_UNKNOWN"])
    {
      uint64_t v8 = 0;
    }
    else if ([v7 isEqualToString:@"POI_ENRICHMENT_UPDATE_ACTION_ADD"])
    {
      uint64_t v8 = 1;
    }
    else if ([v7 isEqualToString:@"POI_ENRICHMENT_UPDATE_ACTION_REMOVE"])
    {
      uint64_t v8 = 2;
    }
    else if ([v7 isEqualToString:@"POI_ENRICHMENT_UPDATE_ACTION_UNMODIFIED"])
    {
      uint64_t v8 = 3;
    }
    else
    {
      uint64_t v8 = 0;
    }

    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v6 intValue];
LABEL_16:
    [a1 setAction:v8];
  }

  v9 = [v5 objectForKeyedSubscript:@"place"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = [GEOPDPlace alloc];
    if (a3) {
      uint64_t v11 = [(GEOPDPlace *)v10 initWithJSON:v9];
    }
    else {
      uint64_t v11 = [(GEOPDPlace *)v10 initWithDictionary:v9];
    }
    v12 = (void *)v11;
    [a1 setPlace:v11];
  }
  if (a3) {
    v13 = @"imageId";
  }
  else {
    v13 = @"image_id";
  }
  v14 = [v5 objectForKeyedSubscript:v13];
  objc_opt_class();
  id v48 = v5;
  if (objc_opt_isKindOfClass())
  {
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v15 = v14;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v53 objects:v58 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v54 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v21 = (void *)[v20 copy];
            [a1 addImageId:v21];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v53 objects:v58 count:16];
      }
      while (v17);
    }

    id v5 = v48;
  }

  v22 = [v5 objectForKeyedSubscript:@"scorecard"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v23 = [GEORPScorecard alloc];
    if (a3) {
      uint64_t v24 = [(GEORPScorecard *)v23 initWithJSON:v22];
    }
    else {
      uint64_t v24 = [(GEORPScorecard *)v23 initWithDictionary:v22];
    }
    v25 = (void *)v24;
    [a1 setScorecard:v24];
  }
  if (a3) {
    v26 = @"imageUpdate";
  }
  else {
    v26 = @"image_update";
  }
  v27 = [v5 objectForKeyedSubscript:v26];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v28 = v27;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v49 objects:v57 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v50;
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v50 != v31) {
            objc_enumerationMutation(v28);
          }
          uint64_t v33 = *(void *)(*((void *)&v49 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v34 = [GEORPImageUpdate alloc];
            if (a3) {
              uint64_t v35 = [(GEORPImageUpdate *)v34 initWithJSON:v33];
            }
            else {
              uint64_t v35 = [(GEORPImageUpdate *)v34 initWithDictionary:v33];
            }
            long long v36 = (void *)v35;
            [a1 addImageUpdate:v35];
          }
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v49 objects:v57 count:16];
      }
      while (v30);
    }

    id v5 = v48;
  }

  if (a3) {
    v37 = @"scorecardUpdate";
  }
  else {
    v37 = @"scorecard_update";
  }
  uint64_t v38 = [v5 objectForKeyedSubscript:v37];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v39 = [GEORPScorecardUpdate alloc];
    if (a3) {
      uint64_t v40 = [(GEORPScorecardUpdate *)v39 initWithJSON:v38];
    }
    else {
      uint64_t v40 = [(GEORPScorecardUpdate *)v39 initWithDictionary:v38];
    }
    v41 = (void *)v40;
    [a1 setScorecardUpdate:v40];
  }
  if (a3) {
    v42 = @"placeContext";
  }
  else {
    v42 = @"place_context";
  }
  v43 = [v5 objectForKeyedSubscript:v42];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v44 = [GEORPPoiEnrichmentPlaceContext alloc];
    if (a3) {
      uint64_t v45 = [(GEORPPoiEnrichmentPlaceContext *)v44 initWithJSON:v43];
    }
    else {
      uint64_t v45 = [(GEORPPoiEnrichmentPlaceContext *)v44 initWithDictionary:v43];
    }
    v46 = (void *)v45;
    [a1 setPlaceContext:v45];
  }
LABEL_75:

  return a1;
}

- (GEORPPoiEnrichmentUpdate)initWithJSON:(id)a3
{
  return (GEORPPoiEnrichmentUpdate *)-[GEORPPoiEnrichmentUpdate _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_335;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_336;
    }
    GEORPPoiEnrichmentUpdateReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORPPoiEnrichmentUpdateCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPPoiEnrichmentUpdateIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPPoiEnrichmentUpdateReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPPoiEnrichmentUpdateIsDirty((uint64_t)self) & 1) == 0)
  {
    v14 = self->_reader;
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
    [(GEORPPoiEnrichmentUpdate *)self readAll:0];
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_place) {
      PBDataWriterWriteSubmessage();
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    objc_super v6 = self->_imageIds;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v21;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteStringField();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v7);
    }

    if (self->_scorecard) {
      PBDataWriterWriteSubmessage();
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v10 = self->_imageUpdates;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v17;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v11);
    }

    if (self->_scorecardUpdate) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_placeContext) {
      PBDataWriterWriteSubmessage();
    }
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  -[GEORPPoiEnrichmentUpdate _readImageUpdates]((uint64_t)self);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_imageUpdates;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9), "hasGreenTeaWithValue:", v3, (void)v11))
        {

          return 1;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  -[GEORPPoiEnrichmentUpdate _readPlace]((uint64_t)self);
  if ([(GEOPDPlace *)self->_place hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPPoiEnrichmentUpdate _readPlaceContext]((uint64_t)self);
  return [(GEORPPoiEnrichmentPlaceContext *)self->_placeContext hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  long long v13 = (id *)a3;
  [(GEORPPoiEnrichmentUpdate *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v13 + 1, self->_reader);
  *((_DWORD *)v13 + 16) = self->_readerMarkPos;
  *((_DWORD *)v13 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v13 + 19) = self->_action;
    *((unsigned char *)v13 + 80) |= 1u;
  }
  if (self->_place) {
    objc_msgSend(v13, "setPlace:");
  }
  if ([(GEORPPoiEnrichmentUpdate *)self imageIdsCount])
  {
    [v13 clearImageIds];
    unint64_t v4 = [(GEORPPoiEnrichmentUpdate *)self imageIdsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEORPPoiEnrichmentUpdate *)self imageIdAtIndex:i];
        [v13 addImageId:v7];
      }
    }
  }
  if (self->_scorecard) {
    objc_msgSend(v13, "setScorecard:");
  }
  if ([(GEORPPoiEnrichmentUpdate *)self imageUpdatesCount])
  {
    [v13 clearImageUpdates];
    unint64_t v8 = [(GEORPPoiEnrichmentUpdate *)self imageUpdatesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        long long v11 = [(GEORPPoiEnrichmentUpdate *)self imageUpdateAtIndex:j];
        [v13 addImageUpdate:v11];
      }
    }
  }
  if (self->_scorecardUpdate) {
    objc_msgSend(v13, "setScorecardUpdate:");
  }
  long long v12 = v13;
  if (self->_placeContext)
  {
    objc_msgSend(v13, "setPlaceContext:");
    long long v12 = v13;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORPPoiEnrichmentUpdateReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_22;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPPoiEnrichmentUpdate *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 76) = self->_action;
    *(unsigned char *)(v5 + 80) |= 1u;
  }
  id v9 = [(GEOPDPlace *)self->_place copyWithZone:a3];
  v10 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v9;

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v11 = self->_imageIds;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v32 != v13) {
          objc_enumerationMutation(v11);
        }
        id v15 = (void *)[*(id *)(*((void *)&v31 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addImageId:v15];
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v12);
  }

  id v16 = [(GEORPScorecard *)self->_scorecard copyWithZone:a3];
  long long v17 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v16;

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v18 = self->_imageUpdates;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(v18);
        }
        long long v22 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * j), "copyWithZone:", a3, (void)v27);
        [(id)v5 addImageUpdate:v22];
      }
      uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v19);
  }

  id v23 = [(GEORPScorecardUpdate *)self->_scorecardUpdate copyWithZone:a3];
  uint64_t v24 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v23;

  id v25 = [(GEORPPoiEnrichmentPlaceContext *)self->_placeContext copyWithZone:a3];
  id v8 = *(id *)(v5 + 32);
  *(void *)(v5 + 32) = v25;
LABEL_22:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  [(GEORPPoiEnrichmentUpdate *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 80) & 1) == 0 || self->_action != *((_DWORD *)v4 + 19)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 80))
  {
LABEL_19:
    char v11 = 0;
    goto LABEL_20;
  }
  place = self->_place;
  if ((unint64_t)place | *((void *)v4 + 5) && !-[GEOPDPlace isEqual:](place, "isEqual:")) {
    goto LABEL_19;
  }
  imageIds = self->_imageIds;
  if ((unint64_t)imageIds | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](imageIds, "isEqual:")) {
      goto LABEL_19;
    }
  }
  scorecard = self->_scorecard;
  if ((unint64_t)scorecard | *((void *)v4 + 7))
  {
    if (!-[GEORPScorecard isEqual:](scorecard, "isEqual:")) {
      goto LABEL_19;
    }
  }
  imageUpdates = self->_imageUpdates;
  if ((unint64_t)imageUpdates | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](imageUpdates, "isEqual:")) {
      goto LABEL_19;
    }
  }
  scorecardUpdate = self->_scorecardUpdate;
  if ((unint64_t)scorecardUpdate | *((void *)v4 + 6))
  {
    if (!-[GEORPScorecardUpdate isEqual:](scorecardUpdate, "isEqual:")) {
      goto LABEL_19;
    }
  }
  placeContext = self->_placeContext;
  if ((unint64_t)placeContext | *((void *)v4 + 4)) {
    char v11 = -[GEORPPoiEnrichmentPlaceContext isEqual:](placeContext, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_20:

  return v11;
}

- (unint64_t)hash
{
  [(GEORPPoiEnrichmentUpdate *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_action;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(GEOPDPlace *)self->_place hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_imageIds hash];
  unint64_t v6 = v4 ^ v5 ^ [(GEORPScorecard *)self->_scorecard hash];
  uint64_t v7 = [(NSMutableArray *)self->_imageUpdates hash];
  unint64_t v8 = v7 ^ [(GEORPScorecardUpdate *)self->_scorecardUpdate hash];
  return v6 ^ v8 ^ [(GEORPPoiEnrichmentPlaceContext *)self->_placeContext hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((unsigned char *)v4 + 80))
  {
    self->_action = *((_DWORD *)v4 + 19);
    *(unsigned char *)&self->_flags |= 1u;
  }
  place = self->_place;
  uint64_t v6 = *((void *)v4 + 5);
  if (place)
  {
    if (v6) {
      -[GEOPDPlace mergeFrom:](place, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEORPPoiEnrichmentUpdate setPlace:](self, "setPlace:");
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v7 = *((id *)v4 + 2);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v7);
        }
        [(GEORPPoiEnrichmentUpdate *)self addImageId:*(void *)(*((void *)&v27 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v9);
  }

  scorecard = self->_scorecard;
  uint64_t v13 = *((void *)v4 + 7);
  if (scorecard)
  {
    if (v13) {
      -[GEORPScorecard mergeFrom:](scorecard, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[GEORPPoiEnrichmentUpdate setScorecard:](self, "setScorecard:");
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v14 = *((id *)v4 + 3);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        -[GEORPPoiEnrichmentUpdate addImageUpdate:](self, "addImageUpdate:", *(void *)(*((void *)&v23 + 1) + 8 * j), (void)v23);
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v16);
  }

  scorecardUpdate = self->_scorecardUpdate;
  uint64_t v20 = *((void *)v4 + 6);
  if (scorecardUpdate)
  {
    if (v20) {
      -[GEORPScorecardUpdate mergeFrom:](scorecardUpdate, "mergeFrom:");
    }
  }
  else if (v20)
  {
    -[GEORPPoiEnrichmentUpdate setScorecardUpdate:](self, "setScorecardUpdate:");
  }
  placeContext = self->_placeContext;
  uint64_t v22 = *((void *)v4 + 4);
  if (placeContext)
  {
    if (v22) {
      -[GEORPPoiEnrichmentPlaceContext mergeFrom:](placeContext, "mergeFrom:");
    }
  }
  else if (v22)
  {
    -[GEORPPoiEnrichmentUpdate setPlaceContext:](self, "setPlaceContext:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scorecard, 0);
  objc_storeStrong((id *)&self->_scorecardUpdate, 0);
  objc_storeStrong((id *)&self->_place, 0);
  objc_storeStrong((id *)&self->_placeContext, 0);
  objc_storeStrong((id *)&self->_imageUpdates, 0);
  objc_storeStrong((id *)&self->_imageIds, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end