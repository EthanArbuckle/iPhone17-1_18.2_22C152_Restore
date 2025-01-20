@interface GEORPGroundViewFeedbackContext
+ (BOOL)isValid:(id)a3;
+ (Class)onscreenImageResourceType;
+ (Class)visibleFeatureHandleType;
- (BOOL)hasImageId;
- (BOOL)hasImdataId;
- (BOOL)hasMetadataTileBuildId;
- (BOOL)hasViewState;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDMuninViewState)viewState;
- (GEORPGroundViewFeedbackContext)init;
- (GEORPGroundViewFeedbackContext)initWithData:(id)a3;
- (GEORPGroundViewFeedbackContext)initWithDictionary:(id)a3;
- (GEORPGroundViewFeedbackContext)initWithJSON:(id)a3;
- (NSMutableArray)onscreenImageResources;
- (NSMutableArray)visibleFeatureHandles;
- (NSString)imageId;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)onscreenImageResourceAtIndex:(unint64_t)a3;
- (id)visibleFeatureHandleAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)imdataId;
- (unint64_t)onscreenImageResourcesCount;
- (unint64_t)visibleFeatureHandlesCount;
- (unint64_t)visiblePlaceMuidAtIndex:(unint64_t)a3;
- (unint64_t)visiblePlaceMuids;
- (unint64_t)visiblePlaceMuidsCount;
- (unsigned)metadataTileBuildId;
- (void)_addNoFlagsOnscreenImageResource:(uint64_t)a1;
- (void)_addNoFlagsVisibleFeatureHandle:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readImageId;
- (void)_readOnscreenImageResources;
- (void)_readViewState;
- (void)_readVisibleFeatureHandles;
- (void)_readVisiblePlaceMuids;
- (void)addOnscreenImageResource:(id)a3;
- (void)addVisibleFeatureHandle:(id)a3;
- (void)addVisiblePlaceMuid:(unint64_t)a3;
- (void)clearOnscreenImageResources;
- (void)clearUnknownFields:(BOOL)a3;
- (void)clearVisibleFeatureHandles;
- (void)clearVisiblePlaceMuids;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHasImdataId:(BOOL)a3;
- (void)setHasMetadataTileBuildId:(BOOL)a3;
- (void)setImageId:(id)a3;
- (void)setImdataId:(unint64_t)a3;
- (void)setMetadataTileBuildId:(unsigned int)a3;
- (void)setOnscreenImageResources:(id)a3;
- (void)setViewState:(id)a3;
- (void)setVisibleFeatureHandles:(id)a3;
- (void)setVisiblePlaceMuids:(unint64_t *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation GEORPGroundViewFeedbackContext

- (GEORPGroundViewFeedbackContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPGroundViewFeedbackContext;
  v2 = [(GEORPGroundViewFeedbackContext *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPGroundViewFeedbackContext)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPGroundViewFeedbackContext;
  v3 = [(GEORPGroundViewFeedbackContext *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEORPGroundViewFeedbackContext;
  [(GEORPGroundViewFeedbackContext *)&v3 dealloc];
}

- (void)_readViewState
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPGroundViewFeedbackContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readViewState_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasViewState
{
  return self->_viewState != 0;
}

- (GEOPDMuninViewState)viewState
{
  -[GEORPGroundViewFeedbackContext _readViewState]((uint64_t)self);
  viewState = self->_viewState;

  return viewState;
}

- (void)setViewState:(id)a3
{
  *(_WORD *)&self->_flags |= 0x140u;
  objc_storeStrong((id *)&self->_viewState, a3);
}

- (unsigned)metadataTileBuildId
{
  return self->_metadataTileBuildId;
}

- (void)setMetadataTileBuildId:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x102u;
  self->_metadataTileBuildId = a3;
}

- (void)setHasMetadataTileBuildId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 258;
  }
  else {
    __int16 v3 = 256;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasMetadataTileBuildId
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (void)_readOnscreenImageResources
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPGroundViewFeedbackContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOnscreenImageResources_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (NSMutableArray)onscreenImageResources
{
  -[GEORPGroundViewFeedbackContext _readOnscreenImageResources]((uint64_t)self);
  onscreenImageResources = self->_onscreenImageResources;

  return onscreenImageResources;
}

- (void)setOnscreenImageResources:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  onscreenImageResources = self->_onscreenImageResources;
  self->_onscreenImageResources = v4;
}

- (void)clearOnscreenImageResources
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  onscreenImageResources = self->_onscreenImageResources;

  [(NSMutableArray *)onscreenImageResources removeAllObjects];
}

- (void)addOnscreenImageResource:(id)a3
{
  id v4 = a3;
  -[GEORPGroundViewFeedbackContext _readOnscreenImageResources]((uint64_t)self);
  -[GEORPGroundViewFeedbackContext _addNoFlagsOnscreenImageResource:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
}

- (void)_addNoFlagsOnscreenImageResource:(uint64_t)a1
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

- (unint64_t)onscreenImageResourcesCount
{
  -[GEORPGroundViewFeedbackContext _readOnscreenImageResources]((uint64_t)self);
  onscreenImageResources = self->_onscreenImageResources;

  return [(NSMutableArray *)onscreenImageResources count];
}

- (id)onscreenImageResourceAtIndex:(unint64_t)a3
{
  -[GEORPGroundViewFeedbackContext _readOnscreenImageResources]((uint64_t)self);
  onscreenImageResources = self->_onscreenImageResources;

  return (id)[(NSMutableArray *)onscreenImageResources objectAtIndex:a3];
}

+ (Class)onscreenImageResourceType
{
  return (Class)objc_opt_class();
}

- (void)_readVisiblePlaceMuids
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPGroundViewFeedbackContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readVisiblePlaceMuids_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (unint64_t)visiblePlaceMuidsCount
{
  return self->_visiblePlaceMuids.count;
}

- (unint64_t)visiblePlaceMuids
{
  return self->_visiblePlaceMuids.list;
}

- (void)clearVisiblePlaceMuids
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;

  PBRepeatedUInt64Clear();
}

- (void)addVisiblePlaceMuid:(unint64_t)a3
{
  if (self) {
    PBRepeatedUInt64Add();
  }
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
}

- (unint64_t)visiblePlaceMuidAtIndex:(unint64_t)a3
{
  -[GEORPGroundViewFeedbackContext _readVisiblePlaceMuids]((uint64_t)self);
  p_visiblePlaceMuids = &self->_visiblePlaceMuids;
  unint64_t count = self->_visiblePlaceMuids.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_visiblePlaceMuids->list[a3];
}

- (void)setVisiblePlaceMuids:(unint64_t *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;

  MEMORY[0x1F4147438](&self->_visiblePlaceMuids, a3, a4);
}

- (unint64_t)imdataId
{
  return self->_imdataId;
}

- (void)setImdataId:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x101u;
  self->_imdataId = a3;
}

- (void)setHasImdataId:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x100;
}

- (BOOL)hasImdataId
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readImageId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPGroundViewFeedbackContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readImageId_tags_2602);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasImageId
{
  return self->_imageId != 0;
}

- (NSString)imageId
{
  -[GEORPGroundViewFeedbackContext _readImageId]((uint64_t)self);
  imageId = self->_imageId;

  return imageId;
}

- (void)setImageId:(id)a3
{
  *(_WORD *)&self->_flags |= 0x110u;
  objc_storeStrong((id *)&self->_imageId, a3);
}

- (void)_readVisibleFeatureHandles
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPGroundViewFeedbackContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readVisibleFeatureHandles_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (NSMutableArray)visibleFeatureHandles
{
  -[GEORPGroundViewFeedbackContext _readVisibleFeatureHandles]((uint64_t)self);
  visibleFeatureHandles = self->_visibleFeatureHandles;

  return visibleFeatureHandles;
}

- (void)setVisibleFeatureHandles:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  visibleFeatureHandles = self->_visibleFeatureHandles;
  self->_visibleFeatureHandles = v4;
}

- (void)clearVisibleFeatureHandles
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  visibleFeatureHandles = self->_visibleFeatureHandles;

  [(NSMutableArray *)visibleFeatureHandles removeAllObjects];
}

- (void)addVisibleFeatureHandle:(id)a3
{
  id v4 = a3;
  -[GEORPGroundViewFeedbackContext _readVisibleFeatureHandles]((uint64_t)self);
  -[GEORPGroundViewFeedbackContext _addNoFlagsVisibleFeatureHandle:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
}

- (void)_addNoFlagsVisibleFeatureHandle:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 80);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 80);
      *(void *)(a1 + 80) = v5;

      id v4 = *(void **)(a1 + 80);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)visibleFeatureHandlesCount
{
  -[GEORPGroundViewFeedbackContext _readVisibleFeatureHandles]((uint64_t)self);
  visibleFeatureHandles = self->_visibleFeatureHandles;

  return [(NSMutableArray *)visibleFeatureHandles count];
}

- (id)visibleFeatureHandleAtIndex:(unint64_t)a3
{
  -[GEORPGroundViewFeedbackContext _readVisibleFeatureHandles]((uint64_t)self);
  visibleFeatureHandles = self->_visibleFeatureHandles;

  return (id)[(NSMutableArray *)visibleFeatureHandles objectAtIndex:a3];
}

+ (Class)visibleFeatureHandleType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPGroundViewFeedbackContext;
  id v4 = [(GEORPGroundViewFeedbackContext *)&v8 description];
  id v5 = [(GEORPGroundViewFeedbackContext *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPGroundViewFeedbackContext _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [(id)a1 viewState];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        id v7 = [v5 jsonRepresentation];
        objc_super v8 = @"viewState";
      }
      else
      {
        id v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"view_state";
      }
      [v4 setObject:v7 forKey:v8];
    }
    if ((*(_WORD *)(a1 + 104) & 2) != 0)
    {
      v9 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 100)];
      if (a2) {
        v10 = @"metadataTileBuildId";
      }
      else {
        v10 = @"metadata_tile_build_id";
      }
      [v4 setObject:v9 forKey:v10];
    }
    if ([*(id *)(a1 + 64) count])
    {
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v12 = *(id *)(a1 + 64);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v48 objects:v53 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v49;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v49 != v15) {
              objc_enumerationMutation(v12);
            }
            v17 = *(void **)(*((void *)&v48 + 1) + 8 * i);
            if (a2) {
              [v17 jsonRepresentation];
            }
            else {
            v18 = [v17 dictionaryRepresentation];
            }
            [v11 addObject:v18];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v48 objects:v53 count:16];
        }
        while (v14);
      }

      if (a2) {
        v19 = @"onscreenImageResource";
      }
      else {
        v19 = @"onscreen_image_resource";
      }
      [v4 setObject:v11 forKey:v19];
    }
    if (*(void *)(a1 + 32))
    {
      v20 = PBRepeatedUInt64NSArray();
      if (a2) {
        v21 = @"visiblePlaceMuid";
      }
      else {
        v21 = @"visible_place_muid";
      }
      [v4 setObject:v20 forKey:v21];
    }
    if (*(_WORD *)(a1 + 104))
    {
      v22 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 56)];
      if (a2) {
        v23 = @"imdataId";
      }
      else {
        v23 = @"imdata_id";
      }
      [v4 setObject:v22 forKey:v23];
    }
    v24 = [(id)a1 imageId];
    if (v24)
    {
      if (a2) {
        v25 = @"imageId";
      }
      else {
        v25 = @"image_id";
      }
      [v4 setObject:v24 forKey:v25];
    }

    if ([*(id *)(a1 + 80) count])
    {
      v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 80), "count"));
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v27 = *(id *)(a1 + 80);
      uint64_t v28 = [v27 countByEnumeratingWithState:&v44 objects:v52 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v45;
        do
        {
          for (uint64_t j = 0; j != v29; ++j)
          {
            if (*(void *)v45 != v30) {
              objc_enumerationMutation(v27);
            }
            v32 = *(void **)(*((void *)&v44 + 1) + 8 * j);
            if (a2) {
              [v32 jsonRepresentation];
            }
            else {
            v33 = [v32 dictionaryRepresentation];
            }
            [v26 addObject:v33];
          }
          uint64_t v29 = [v27 countByEnumeratingWithState:&v44 objects:v52 count:16];
        }
        while (v29);
      }

      if (a2) {
        v34 = @"visibleFeatureHandle";
      }
      else {
        v34 = @"visible_feature_handle";
      }
      [v4 setObject:v26 forKey:v34];
    }
    v35 = *(void **)(a1 + 16);
    if (v35)
    {
      v36 = [v35 dictionaryRepresentation];
      v37 = v36;
      if (a2)
      {
        v38 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v36, "count"));
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __60__GEORPGroundViewFeedbackContext__dictionaryRepresentation___block_invoke;
        v42[3] = &unk_1E53D8860;
        id v39 = v38;
        id v43 = v39;
        [v37 enumerateKeysAndObjectsUsingBlock:v42];
        id v40 = v39;

        v37 = v40;
      }
      [v4 setObject:v37 forKey:@"Unknown Fields"];
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
  return -[GEORPGroundViewFeedbackContext _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __60__GEORPGroundViewFeedbackContext__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPGroundViewFeedbackContext)initWithDictionary:(id)a3
{
  return (GEORPGroundViewFeedbackContext *)-[GEORPGroundViewFeedbackContext _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"viewState";
      }
      else {
        objc_super v6 = @"view_state";
      }
      id v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOPDMuninViewState alloc];
        if (a3) {
          uint64_t v9 = [(GEOPDMuninViewState *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOPDMuninViewState *)v8 initWithDictionary:v7];
        }
        id v10 = (void *)v9;
        [a1 setViewState:v9];
      }
      if (a3) {
        v11 = @"metadataTileBuildId";
      }
      else {
        v11 = @"metadata_tile_build_id";
      }
      id v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setMetadataTileBuildId:", objc_msgSend(v12, "unsignedIntValue"));
      }

      if (a3) {
        uint64_t v13 = @"onscreenImageResource";
      }
      else {
        uint64_t v13 = @"onscreen_image_resource";
      }
      uint64_t v14 = [v5 objectForKeyedSubscript:v13];
      objc_opt_class();
      id v50 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v61 = 0u;
        long long v62 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v49 = v14;
        id v15 = v14;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v59 objects:v65 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v60;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v60 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = *(void *)(*((void *)&v59 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v21 = [GEORPGroundViewImageResource alloc];
                if (a3) {
                  uint64_t v22 = [(GEORPGroundViewImageResource *)v21 initWithJSON:v20];
                }
                else {
                  uint64_t v22 = [(GEORPGroundViewImageResource *)v21 initWithDictionary:v20];
                }
                v23 = (void *)v22;
                objc_msgSend(a1, "addOnscreenImageResource:", v22, v49);
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v59 objects:v65 count:16];
          }
          while (v17);
        }

        uint64_t v14 = v49;
      }

      if (a3) {
        v24 = @"visiblePlaceMuid";
      }
      else {
        v24 = @"visible_place_muid";
      }
      v25 = objc_msgSend(v5, "objectForKeyedSubscript:", v24, v49);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        id v26 = v25;
        uint64_t v27 = [v26 countByEnumeratingWithState:&v55 objects:v64 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = *(void *)v56;
          do
          {
            for (uint64_t j = 0; j != v28; ++j)
            {
              if (*(void *)v56 != v29) {
                objc_enumerationMutation(v26);
              }
              v31 = *(void **)(*((void *)&v55 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(a1, "addVisiblePlaceMuid:", objc_msgSend(v31, "unsignedLongLongValue"));
              }
            }
            uint64_t v28 = [v26 countByEnumeratingWithState:&v55 objects:v64 count:16];
          }
          while (v28);
        }

        id v5 = v50;
      }

      if (a3) {
        v32 = @"imdataId";
      }
      else {
        v32 = @"imdata_id";
      }
      v33 = [v5 objectForKeyedSubscript:v32];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setImdataId:", objc_msgSend(v33, "unsignedLongLongValue"));
      }

      if (a3) {
        v34 = @"imageId";
      }
      else {
        v34 = @"image_id";
      }
      v35 = [v5 objectForKeyedSubscript:v34];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v36 = (void *)[v35 copy];
        [a1 setImageId:v36];
      }
      if (a3) {
        v37 = @"visibleFeatureHandle";
      }
      else {
        v37 = @"visible_feature_handle";
      }
      v38 = [v5 objectForKeyedSubscript:v37];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        id v39 = v38;
        uint64_t v40 = [v39 countByEnumeratingWithState:&v51 objects:v63 count:16];
        if (v40)
        {
          uint64_t v41 = v40;
          uint64_t v42 = *(void *)v52;
          do
          {
            for (uint64_t k = 0; k != v41; ++k)
            {
              if (*(void *)v52 != v42) {
                objc_enumerationMutation(v39);
              }
              uint64_t v44 = *(void *)(*((void *)&v51 + 1) + 8 * k);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v45 = [GEORPFeatureHandle alloc];
                if (a3) {
                  uint64_t v46 = [(GEORPFeatureHandle *)v45 initWithJSON:v44];
                }
                else {
                  uint64_t v46 = [(GEORPFeatureHandle *)v45 initWithDictionary:v44];
                }
                long long v47 = (void *)v46;
                [a1 addVisibleFeatureHandle:v46];
              }
            }
            uint64_t v41 = [v39 countByEnumeratingWithState:&v51 objects:v63 count:16];
          }
          while (v41);
        }

        id v5 = v50;
      }
    }
  }

  return a1;
}

- (GEORPGroundViewFeedbackContext)initWithJSON:(id)a3
{
  return (GEORPGroundViewFeedbackContext *)-[GEORPGroundViewFeedbackContext _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_2641;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_2642;
    }
    GEORPGroundViewFeedbackContextReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORPGroundViewFeedbackContextCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPGroundViewFeedbackContextIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPGroundViewFeedbackContextReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPGroundViewFeedbackContextIsDirty((uint64_t)self) & 1) == 0)
  {
    id v15 = self->_reader;
    objc_sync_enter(v15);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v16 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v16];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v15);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPGroundViewFeedbackContext *)self readAll:0];
    if (self->_viewState) {
      PBDataWriterWriteSubmessage();
    }
    if ((*(_WORD *)&self->_flags & 2) != 0) {
      PBDataWriterWriteUint32Field();
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    objc_super v6 = self->_onscreenImageResources;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v7);
    }

    if (self->_visiblePlaceMuids.count)
    {
      unint64_t v10 = 0;
      do
      {
        PBDataWriterWriteUint64Field();
        ++v10;
      }
      while (v10 < self->_visiblePlaceMuids.count);
    }
    if (*(_WORD *)&self->_flags) {
      PBDataWriterWriteUint64Field();
    }
    if (self->_imageId) {
      PBDataWriterWriteStringField();
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v11 = self->_visibleFeatureHandles;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v11);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v12);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v17);
  }
}

- (void)copyTo:(id)a3
{
  id v15 = (id *)a3;
  [(GEORPGroundViewFeedbackContext *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v15 + 1, self->_reader);
  *((_DWORD *)v15 + 22) = self->_readerMarkPos;
  *((_DWORD *)v15 + 23) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_viewState) {
    objc_msgSend(v15, "setViewState:");
  }
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v15 + 25) = self->_metadataTileBuildId;
    *((_WORD *)v15 + 52) |= 2u;
  }
  if ([(GEORPGroundViewFeedbackContext *)self onscreenImageResourcesCount])
  {
    [v15 clearOnscreenImageResources];
    unint64_t v4 = [(GEORPGroundViewFeedbackContext *)self onscreenImageResourcesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEORPGroundViewFeedbackContext *)self onscreenImageResourceAtIndex:i];
        [v15 addOnscreenImageResource:v7];
      }
    }
  }
  if ([(GEORPGroundViewFeedbackContext *)self visiblePlaceMuidsCount])
  {
    [v15 clearVisiblePlaceMuids];
    unint64_t v8 = [(GEORPGroundViewFeedbackContext *)self visiblePlaceMuidsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
        objc_msgSend(v15, "addVisiblePlaceMuid:", -[GEORPGroundViewFeedbackContext visiblePlaceMuidAtIndex:](self, "visiblePlaceMuidAtIndex:", j));
    }
  }
  if (*(_WORD *)&self->_flags)
  {
    v15[7] = self->_imdataId;
    *((_WORD *)v15 + 52) |= 1u;
  }
  if (self->_imageId) {
    objc_msgSend(v15, "setImageId:");
  }
  if ([(GEORPGroundViewFeedbackContext *)self visibleFeatureHandlesCount])
  {
    [v15 clearVisibleFeatureHandles];
    unint64_t v11 = [(GEORPGroundViewFeedbackContext *)self visibleFeatureHandlesCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t k = 0; k != v12; ++k)
      {
        uint64_t v14 = [(GEORPGroundViewFeedbackContext *)self visibleFeatureHandleAtIndex:k];
        [v15 addVisibleFeatureHandle:v14];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
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
      GEORPGroundViewFeedbackContextReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_24;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPGroundViewFeedbackContext *)self readAll:0];
  id v9 = [(GEOPDMuninViewState *)self->_viewState copyWithZone:a3];
  unint64_t v10 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v9;

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 100) = self->_metadataTileBuildId;
    *(_WORD *)(v5 + 104) |= 2u;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  unint64_t v11 = self->_onscreenImageResources;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(v11);
        }
        id v15 = (void *)[*(id *)(*((void *)&v29 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addOnscreenImageResource:v15];
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v12);
  }

  PBRepeatedUInt64Copy();
  if (*(_WORD *)&self->_flags)
  {
    *(void *)(v5 + 56) = self->_imdataId;
    *(_WORD *)(v5 + 104) |= 1u;
  }
  uint64_t v16 = [(NSString *)self->_imageId copyWithZone:a3];
  long long v17 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v16;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v18 = self->_visibleFeatureHandles;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(v18);
        }
        long long v22 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * j), "copyWithZone:", a3, (void)v25);
        [(id)v5 addVisibleFeatureHandle:v22];
      }
      uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v19);
  }

  long long v23 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v23;
LABEL_24:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  [(GEORPGroundViewFeedbackContext *)self readAll:1];
  [v4 readAll:1];
  viewState = self->_viewState;
  if ((unint64_t)viewState | *((void *)v4 + 9))
  {
    if (!-[GEOPDMuninViewState isEqual:](viewState, "isEqual:")) {
      goto LABEL_21;
    }
  }
  __int16 v6 = *((_WORD *)v4 + 52);
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_metadataTileBuildId != *((_DWORD *)v4 + 25)) {
      goto LABEL_21;
    }
  }
  else if ((v6 & 2) != 0)
  {
LABEL_21:
    char v11 = 0;
    goto LABEL_22;
  }
  onscreenImageResources = self->_onscreenImageResources;
  if ((unint64_t)onscreenImageResources | *((void *)v4 + 8)
    && !-[NSMutableArray isEqual:](onscreenImageResources, "isEqual:")
    || !PBRepeatedUInt64IsEqual())
  {
    goto LABEL_21;
  }
  __int16 v8 = *((_WORD *)v4 + 52);
  if (*(_WORD *)&self->_flags)
  {
    if ((v8 & 1) == 0 || self->_imdataId != *((void *)v4 + 7)) {
      goto LABEL_21;
    }
  }
  else if (v8)
  {
    goto LABEL_21;
  }
  imageId = self->_imageId;
  if ((unint64_t)imageId | *((void *)v4 + 6) && !-[NSString isEqual:](imageId, "isEqual:")) {
    goto LABEL_21;
  }
  visibleFeatureHandles = self->_visibleFeatureHandles;
  if ((unint64_t)visibleFeatureHandles | *((void *)v4 + 10)) {
    char v11 = -[NSMutableArray isEqual:](visibleFeatureHandles, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_22:

  return v11;
}

- (unint64_t)hash
{
  [(GEORPGroundViewFeedbackContext *)self readAll:1];
  unint64_t v3 = [(GEOPDMuninViewState *)self->_viewState hash];
  if ((*(_WORD *)&self->_flags & 2) != 0) {
    uint64_t v4 = 2654435761 * self->_metadataTileBuildId;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = [(NSMutableArray *)self->_onscreenImageResources hash];
  uint64_t v6 = PBRepeatedUInt64Hash();
  if (*(_WORD *)&self->_flags) {
    unint64_t v7 = 2654435761u * self->_imdataId;
  }
  else {
    unint64_t v7 = 0;
  }
  unint64_t v8 = v4 ^ v3 ^ v5 ^ v6;
  NSUInteger v9 = v7 ^ [(NSString *)self->_imageId hash];
  return v8 ^ v9 ^ [(NSMutableArray *)self->_visibleFeatureHandles hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  viewState = self->_viewState;
  uint64_t v6 = *((void *)v4 + 9);
  if (viewState)
  {
    if (v6) {
      -[GEOPDMuninViewState mergeFrom:](viewState, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEORPGroundViewFeedbackContext setViewState:](self, "setViewState:");
  }
  if ((*((_WORD *)v4 + 52) & 2) != 0)
  {
    self->_metadataTileBuildId = *((_DWORD *)v4 + 25);
    *(_WORD *)&self->_flags |= 2u;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = *((id *)v4 + 8);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        [(GEORPGroundViewFeedbackContext *)self addOnscreenImageResource:*(void *)(*((void *)&v24 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v9);
  }

  uint64_t v12 = [v4 visiblePlaceMuidsCount];
  if (v12)
  {
    uint64_t v13 = v12;
    for (uint64_t j = 0; j != v13; ++j)
      -[GEORPGroundViewFeedbackContext addVisiblePlaceMuid:](self, "addVisiblePlaceMuid:", [v4 visiblePlaceMuidAtIndex:j]);
  }
  if (*((_WORD *)v4 + 52))
  {
    self->_imdataId = *((void *)v4 + 7);
    *(_WORD *)&self->_flags |= 1u;
  }
  if (*((void *)v4 + 6)) {
    -[GEORPGroundViewFeedbackContext setImageId:](self, "setImageId:");
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v15 = *((id *)v4 + 10);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        -[GEORPGroundViewFeedbackContext addVisibleFeatureHandle:](self, "addVisibleFeatureHandle:", *(void *)(*((void *)&v20 + 1) + 8 * k), (void)v20);
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v17);
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEORPGroundViewFeedbackContextReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_2646);
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
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x104u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORPGroundViewFeedbackContext *)self readAll:0];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = self->_onscreenImageResources;
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
  objc_storeStrong((id *)&self->_visibleFeatureHandles, 0);
  objc_storeStrong((id *)&self->_viewState, 0);
  objc_storeStrong((id *)&self->_onscreenImageResources, 0);
  objc_storeStrong((id *)&self->_imageId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end