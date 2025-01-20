@interface GEORPCuratedCollectionContext
+ (BOOL)isValid:(id)a3;
+ (Class)imageInfoType;
- (BOOL)hasCuratedCollectionMuid;
- (BOOL)hasOriginalDescription;
- (BOOL)hasOriginalName;
- (BOOL)hasOriginalUrl;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPCuratedCollectionContext)init;
- (GEORPCuratedCollectionContext)initWithData:(id)a3;
- (GEORPCuratedCollectionContext)initWithDictionary:(id)a3;
- (GEORPCuratedCollectionContext)initWithJSON:(id)a3;
- (NSMutableArray)imageInfos;
- (NSString)originalDescription;
- (NSString)originalName;
- (NSString)originalUrl;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)imageInfoAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (unint64_t)curatedCollectionMuid;
- (unint64_t)hash;
- (unint64_t)imageInfosCount;
- (unint64_t)placeEntityMuidAtIndex:(unint64_t)a3;
- (unint64_t)placeEntityMuids;
- (unint64_t)placeEntityMuidsCount;
- (void)_addNoFlagsImageInfo:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readImageInfos;
- (void)_readOriginalDescription;
- (void)_readOriginalName;
- (void)_readOriginalUrl;
- (void)_readPlaceEntityMuids;
- (void)addImageInfo:(id)a3;
- (void)addPlaceEntityMuid:(unint64_t)a3;
- (void)clearImageInfos;
- (void)clearPlaceEntityMuids;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCuratedCollectionMuid:(unint64_t)a3;
- (void)setHasCuratedCollectionMuid:(BOOL)a3;
- (void)setImageInfos:(id)a3;
- (void)setOriginalDescription:(id)a3;
- (void)setOriginalName:(id)a3;
- (void)setOriginalUrl:(id)a3;
- (void)setPlaceEntityMuids:(unint64_t *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation GEORPCuratedCollectionContext

- (GEORPCuratedCollectionContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPCuratedCollectionContext;
  v2 = [(GEORPCuratedCollectionContext *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPCuratedCollectionContext)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPCuratedCollectionContext;
  v3 = [(GEORPCuratedCollectionContext *)&v7 initWithData:a3];
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
  v3.super_class = (Class)GEORPCuratedCollectionContext;
  [(GEORPCuratedCollectionContext *)&v3 dealloc];
}

- (unint64_t)curatedCollectionMuid
{
  return self->_curatedCollectionMuid;
}

- (void)setCuratedCollectionMuid:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 0x81u;
  self->_curatedCollectionMuid = a3;
}

- (void)setHasCuratedCollectionMuid:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasCuratedCollectionMuid
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_readPlaceEntityMuids
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(unsigned char *)(a1 + 100) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPCuratedCollectionContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceEntityMuids_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (unint64_t)placeEntityMuidsCount
{
  return self->_placeEntityMuids.count;
}

- (unint64_t)placeEntityMuids
{
  return self->_placeEntityMuids.list;
}

- (void)clearPlaceEntityMuids
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;

  PBRepeatedUInt64Clear();
}

- (void)addPlaceEntityMuid:(unint64_t)a3
{
  if (self) {
    PBRepeatedUInt64Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
}

- (unint64_t)placeEntityMuidAtIndex:(unint64_t)a3
{
  -[GEORPCuratedCollectionContext _readPlaceEntityMuids]((uint64_t)self);
  p_placeEntityMuids = &self->_placeEntityMuids;
  unint64_t count = self->_placeEntityMuids.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_placeEntityMuids->list[a3];
}

- (void)setPlaceEntityMuids:(unint64_t *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;

  MEMORY[0x1F4147438](&self->_placeEntityMuids, a3, a4);
}

- (void)_readOriginalName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(unsigned char *)(a1 + 100) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPCuratedCollectionContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOriginalName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasOriginalName
{
  return self->_originalName != 0;
}

- (NSString)originalName
{
  -[GEORPCuratedCollectionContext _readOriginalName]((uint64_t)self);
  originalName = self->_originalName;

  return originalName;
}

- (void)setOriginalName:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_originalName, a3);
}

- (void)_readOriginalUrl
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(unsigned char *)(a1 + 100) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPCuratedCollectionContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOriginalUrl_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasOriginalUrl
{
  return self->_originalUrl != 0;
}

- (NSString)originalUrl
{
  -[GEORPCuratedCollectionContext _readOriginalUrl]((uint64_t)self);
  originalUrl = self->_originalUrl;

  return originalUrl;
}

- (void)setOriginalUrl:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_originalUrl, a3);
}

- (void)_readOriginalDescription
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(unsigned char *)(a1 + 100) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPCuratedCollectionContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOriginalDescription_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasOriginalDescription
{
  return self->_originalDescription != 0;
}

- (NSString)originalDescription
{
  -[GEORPCuratedCollectionContext _readOriginalDescription]((uint64_t)self);
  originalDescription = self->_originalDescription;

  return originalDescription;
}

- (void)setOriginalDescription:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_originalDescription, a3);
}

- (void)_readImageInfos
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(unsigned char *)(a1 + 100) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPCuratedCollectionContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readImageInfos_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (NSMutableArray)imageInfos
{
  -[GEORPCuratedCollectionContext _readImageInfos]((uint64_t)self);
  imageInfos = self->_imageInfos;

  return imageInfos;
}

- (void)setImageInfos:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  imageInfos = self->_imageInfos;
  self->_imageInfos = v4;
}

- (void)clearImageInfos
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  imageInfos = self->_imageInfos;

  [(NSMutableArray *)imageInfos removeAllObjects];
}

- (void)addImageInfo:(id)a3
{
  id v4 = a3;
  -[GEORPCuratedCollectionContext _readImageInfos]((uint64_t)self);
  -[GEORPCuratedCollectionContext _addNoFlagsImageInfo:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsImageInfo:(uint64_t)a1
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

- (unint64_t)imageInfosCount
{
  -[GEORPCuratedCollectionContext _readImageInfos]((uint64_t)self);
  imageInfos = self->_imageInfos;

  return [(NSMutableArray *)imageInfos count];
}

- (id)imageInfoAtIndex:(unint64_t)a3
{
  -[GEORPCuratedCollectionContext _readImageInfos]((uint64_t)self);
  imageInfos = self->_imageInfos;

  return (id)[(NSMutableArray *)imageInfos objectAtIndex:a3];
}

+ (Class)imageInfoType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPCuratedCollectionContext;
  id v4 = [(GEORPCuratedCollectionContext *)&v8 description];
  id v5 = [(GEORPCuratedCollectionContext *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPCuratedCollectionContext _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 100))
    {
      id v5 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 48)];
      if (a2) {
        objc_super v6 = @"curatedCollectionMuid";
      }
      else {
        objc_super v6 = @"curated_collection_muid";
      }
      [v4 setObject:v5 forKey:v6];
    }
    if (*(void *)(a1 + 32))
    {
      id v7 = PBRepeatedUInt64NSArray();
      if (a2) {
        objc_super v8 = @"placeEntityMuid";
      }
      else {
        objc_super v8 = @"place_entity_muid";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = [(id)a1 originalName];
    if (v9)
    {
      if (a2) {
        v10 = @"originalName";
      }
      else {
        v10 = @"original_name";
      }
      [v4 setObject:v9 forKey:v10];
    }

    v11 = [(id)a1 originalUrl];
    if (v11)
    {
      if (a2) {
        v12 = @"originalUrl";
      }
      else {
        v12 = @"original_url";
      }
      [v4 setObject:v11 forKey:v12];
    }

    v13 = [(id)a1 originalDescription];
    if (v13)
    {
      if (a2) {
        v14 = @"originalDescription";
      }
      else {
        v14 = @"original_description";
      }
      [v4 setObject:v13 forKey:v14];
    }

    if ([*(id *)(a1 + 56) count])
    {
      v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v16 = *(id *)(a1 + 56);
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
        v23 = @"imageInfo";
      }
      else {
        v23 = @"image_info";
      }
      [v4 setObject:v15 forKey:v23];
    }
    v24 = *(void **)(a1 + 16);
    if (v24)
    {
      v25 = [v24 dictionaryRepresentation];
      v26 = v25;
      if (a2)
      {
        v27 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v25, "count"));
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __59__GEORPCuratedCollectionContext__dictionaryRepresentation___block_invoke;
        v31[3] = &unk_1E53D8860;
        id v28 = v27;
        id v32 = v28;
        [v26 enumerateKeysAndObjectsUsingBlock:v31];
        id v29 = v28;

        v26 = v29;
      }
      [v4 setObject:v26 forKey:@"Unknown Fields"];
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
  return -[GEORPCuratedCollectionContext _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __59__GEORPCuratedCollectionContext__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPCuratedCollectionContext)initWithDictionary:(id)a3
{
  return (GEORPCuratedCollectionContext *)-[GEORPCuratedCollectionContext _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"curatedCollectionMuid";
      }
      else {
        objc_super v6 = @"curated_collection_muid";
      }
      id v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setCuratedCollectionMuid:", objc_msgSend(v7, "unsignedLongLongValue"));
      }

      if (a3) {
        objc_super v8 = @"placeEntityMuid";
      }
      else {
        objc_super v8 = @"place_entity_muid";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v42 objects:v47 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v43;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v43 != v13) {
                objc_enumerationMutation(v10);
              }
              v15 = *(void **)(*((void *)&v42 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(a1, "addPlaceEntityMuid:", objc_msgSend(v15, "unsignedLongLongValue"));
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v42 objects:v47 count:16];
          }
          while (v12);
        }
      }
      if (a3) {
        id v16 = @"originalName";
      }
      else {
        id v16 = @"original_name";
      }
      uint64_t v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v18 = (void *)[v17 copy];
        [a1 setOriginalName:v18];
      }
      if (a3) {
        uint64_t v19 = @"originalUrl";
      }
      else {
        uint64_t v19 = @"original_url";
      }
      v20 = [v5 objectForKeyedSubscript:v19];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v21 = (void *)[v20 copy];
        [a1 setOriginalUrl:v21];
      }
      if (a3) {
        v22 = @"originalDescription";
      }
      else {
        v22 = @"original_description";
      }
      v23 = [v5 objectForKeyedSubscript:v22];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v24 = (void *)[v23 copy];
        [a1 setOriginalDescription:v24];
      }
      if (a3) {
        v25 = @"imageInfo";
      }
      else {
        v25 = @"image_info";
      }
      v26 = [v5 objectForKeyedSubscript:v25];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v37 = v5;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v27 = v26;
        uint64_t v28 = [v27 countByEnumeratingWithState:&v38 objects:v46 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v39;
          do
          {
            for (uint64_t j = 0; j != v29; ++j)
            {
              if (*(void *)v39 != v30) {
                objc_enumerationMutation(v27);
              }
              uint64_t v32 = *(void *)(*((void *)&v38 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v33 = [GEORPFeedbackClientImageInfo alloc];
                if (a3) {
                  uint64_t v34 = [(GEORPFeedbackClientImageInfo *)v33 initWithJSON:v32];
                }
                else {
                  uint64_t v34 = [(GEORPFeedbackClientImageInfo *)v33 initWithDictionary:v32];
                }
                long long v35 = (void *)v34;
                [a1 addImageInfo:v34];
              }
            }
            uint64_t v29 = [v27 countByEnumeratingWithState:&v38 objects:v46 count:16];
          }
          while (v29);
        }

        id v5 = v37;
      }
    }
  }

  return a1;
}

- (GEORPCuratedCollectionContext)initWithJSON:(id)a3
{
  return (GEORPCuratedCollectionContext *)-[GEORPCuratedCollectionContext _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_511;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_512;
    }
    GEORPCuratedCollectionContextReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORPCuratedCollectionContextCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPCuratedCollectionContextIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPCuratedCollectionContextReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(unsigned char *)&self->_flags <= 3u))
  {
    uint64_t v11 = self->_reader;
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
    [(GEORPCuratedCollectionContext *)self readAll:0];
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteUint64Field();
    }
    if (self->_placeEntityMuids.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteUint64Field();
        ++v6;
      }
      while (v6 < self->_placeEntityMuids.count);
    }
    if (self->_originalName) {
      PBDataWriterWriteStringField();
    }
    if (self->_originalUrl) {
      PBDataWriterWriteStringField();
    }
    if (self->_originalDescription) {
      PBDataWriterWriteStringField();
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = self->_imageInfos;
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

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v13);
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v11 = (id *)a3;
  [(GEORPCuratedCollectionContext *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v11 + 1, self->_reader);
  *((_DWORD *)v11 + 22) = self->_readerMarkPos;
  *((_DWORD *)v11 + 23) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (*(unsigned char *)&self->_flags)
  {
    v11[6] = self->_curatedCollectionMuid;
    *((unsigned char *)v11 + 100) |= 1u;
  }
  if ([(GEORPCuratedCollectionContext *)self placeEntityMuidsCount])
  {
    [v11 clearPlaceEntityMuids];
    unint64_t v4 = [(GEORPCuratedCollectionContext *)self placeEntityMuidsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v11, "addPlaceEntityMuid:", -[GEORPCuratedCollectionContext placeEntityMuidAtIndex:](self, "placeEntityMuidAtIndex:", i));
    }
  }
  if (self->_originalName) {
    objc_msgSend(v11, "setOriginalName:");
  }
  if (self->_originalUrl) {
    objc_msgSend(v11, "setOriginalUrl:");
  }
  if (self->_originalDescription) {
    objc_msgSend(v11, "setOriginalDescription:");
  }
  if ([(GEORPCuratedCollectionContext *)self imageInfosCount])
  {
    [v11 clearImageInfos];
    unint64_t v7 = [(GEORPCuratedCollectionContext *)self imageInfosCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t j = 0; j != v8; ++j)
      {
        id v10 = [(GEORPCuratedCollectionContext *)self imageInfoAtIndex:j];
        [v11 addImageInfo:v10];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORPCuratedCollectionContextReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_15;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPCuratedCollectionContext *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    *(void *)(v5 + 48) = self->_curatedCollectionMuid;
    *(unsigned char *)(v5 + 100) |= 1u;
  }
  PBRepeatedUInt64Copy();
  uint64_t v9 = [(NSString *)self->_originalName copyWithZone:a3];
  id v10 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v9;

  uint64_t v11 = [(NSString *)self->_originalUrl copyWithZone:a3];
  uint64_t v12 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v11;

  uint64_t v13 = [(NSString *)self->_originalDescription copyWithZone:a3];
  long long v14 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v13;

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v15 = self->_imageInfos;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v15);
        }
        uint64_t v19 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "copyWithZone:", a3, (void)v22);
        [(id)v5 addImageInfo:v19];
      }
      uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v16);
  }

  v20 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v20;
LABEL_15:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  [(GEORPCuratedCollectionContext *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 100) & 1) == 0 || self->_curatedCollectionMuid != *((void *)v4 + 6)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 100))
  {
LABEL_16:
    char v9 = 0;
    goto LABEL_17;
  }
  if (!PBRepeatedUInt64IsEqual()) {
    goto LABEL_16;
  }
  originalName = self->_originalName;
  if ((unint64_t)originalName | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](originalName, "isEqual:")) {
      goto LABEL_16;
    }
  }
  originalUrl = self->_originalUrl;
  if ((unint64_t)originalUrl | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](originalUrl, "isEqual:")) {
      goto LABEL_16;
    }
  }
  originalDescription = self->_originalDescription;
  if ((unint64_t)originalDescription | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](originalDescription, "isEqual:")) {
      goto LABEL_16;
    }
  }
  imageInfos = self->_imageInfos;
  if ((unint64_t)imageInfos | *((void *)v4 + 7)) {
    char v9 = -[NSMutableArray isEqual:](imageInfos, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_17:

  return v9;
}

- (unint64_t)hash
{
  [(GEORPCuratedCollectionContext *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    unint64_t v3 = 2654435761u * self->_curatedCollectionMuid;
  }
  else {
    unint64_t v3 = 0;
  }
  uint64_t v4 = PBRepeatedUInt64Hash() ^ v3;
  NSUInteger v5 = v4 ^ [(NSString *)self->_originalName hash];
  NSUInteger v6 = [(NSString *)self->_originalUrl hash];
  NSUInteger v7 = v5 ^ v6 ^ [(NSString *)self->_originalDescription hash];
  return v7 ^ [(NSMutableArray *)self->_imageInfos hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((unsigned char *)v4 + 100))
  {
    self->_curatedCollectionMuid = *((void *)v4 + 6);
    *(unsigned char *)&self->_flags |= 1u;
  }
  uint64_t v5 = [v4 placeEntityMuidsCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[GEORPCuratedCollectionContext addPlaceEntityMuid:](self, "addPlaceEntityMuid:", [v4 placeEntityMuidAtIndex:i]);
  }
  if (*((void *)v4 + 9)) {
    -[GEORPCuratedCollectionContext setOriginalName:](self, "setOriginalName:");
  }
  if (*((void *)v4 + 10)) {
    -[GEORPCuratedCollectionContext setOriginalUrl:](self, "setOriginalUrl:");
  }
  if (*((void *)v4 + 8)) {
    -[GEORPCuratedCollectionContext setOriginalDescription:](self, "setOriginalDescription:");
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = *((id *)v4 + 7);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (uint64_t j = 0; j != v10; ++j)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        -[GEORPCuratedCollectionContext addImageInfo:](self, "addImageInfo:", *(void *)(*((void *)&v13 + 1) + 8 * j), (void)v13);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEORPCuratedCollectionContextReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_516);
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
  *(unsigned char *)&self->_flags |= 0x82u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORPCuratedCollectionContext *)self readAll:0];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    NSUInteger v7 = self->_imageInfos;
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
  objc_storeStrong((id *)&self->_originalUrl, 0);
  objc_storeStrong((id *)&self->_originalName, 0);
  objc_storeStrong((id *)&self->_originalDescription, 0);
  objc_storeStrong((id *)&self->_imageInfos, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end