@interface GEOPDAttribution
+ (id)attributionForAnnotatedItemList:(id)a3 placeData:(id)a4;
+ (id)attributionForPlaceDataEncyclopedia:(id)a3;
+ (id)attributionForPlaceDataEntity:(id)a3;
+ (id)attributionForPlaceDataRestaurantReservationLink:(id)a3;
+ (id)attributionForPlaceDataReview:(id)a3;
+ (id)componentLevelAttributionForPlaceDataPhotos:(id)a3;
- (BOOL)_isYelp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDAttribution)init;
- (GEOPDAttribution)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)attributionUrls;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)externalItemId;
- (id)jsonRepresentation;
- (id)vendorId;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (unint64_t)hash;
- (void)_addNoFlagsAttributionUrl:(uint64_t)a1;
- (void)_readAttributionUrls;
- (void)_readExternalItemId;
- (void)_readVendorId;
- (void)addAttributionUrl:(uint64_t)a1;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)mergeFrom:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setActionUrlComponent:(uint64_t)a1;
- (void)setExternalComponentId:(uint64_t)a1;
- (void)setExternalItemId:(uint64_t)a1;
- (void)setVendorId:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDAttribution

- (id)vendorId
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDAttribution _readVendorId]((uint64_t)a1);
    a1 = (id *)v2[7];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readVendorId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAttributionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readVendorId_tags_599);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (void)_addNoFlagsAttributionUrl:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      v4 = *(void **)(a1 + 32);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (GEOPDAttribution)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDAttribution;
  v2 = [(GEOPDAttribution *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (id)externalItemId
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDAttribution _readExternalItemId]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readExternalItemId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAttributionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readExternalItemId_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)attributionUrls
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDAttribution _readAttributionUrls]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readAttributionUrls
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAttributionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAttributionUrls_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

+ (id)componentLevelAttributionForPlaceDataPhotos:(id)a3
{
  id v3 = a3;
  v4 = +[GEOPDPlace attributionForPlaceData:v3 type:26];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = +[GEOPDPlace attributionForPlaceData:v3 type:8];
  }
  id v7 = v6;

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorId, 0);
  objc_storeStrong((id *)&self->_externalItemId, 0);
  objc_storeStrong((id *)&self->_externalComponentId, 0);
  objc_storeStrong((id *)&self->_attributionUrls, 0);
  objc_storeStrong((id *)&self->_actionUrlComponent, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_624;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_625;
      }
      GEOPDAttributionReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)_isYelp
{
  v2 = -[GEOPDAttribution vendorId]((id *)&self->super.super.isa);
  BOOL v3 = [v2 rangeOfString:@"yelp"] != 0x7FFFFFFFFFFFFFFFLL;

  return v3;
}

+ (id)attributionForPlaceDataReview:(id)a3
{
  id v3 = a3;
  v4 = +[GEOPDPlace attributionForPlaceData:v3 type:7];
  if (!v4)
  {
    v4 = +[GEOPDPlace attributionForPlaceData:v3 type:6];
  }

  return v4;
}

+ (id)attributionForPlaceDataEntity:(id)a3
{
  return +[GEOPDPlace attributionForPlaceData:a3 type:1];
}

+ (id)attributionForPlaceDataEncyclopedia:(id)a3
{
  return +[GEOPDPlace attributionForPlaceData:a3 type:22];
}

+ (id)attributionForPlaceDataRestaurantReservationLink:(id)a3
{
  return +[GEOPDPlace attributionForPlaceData:a3 type:33];
}

+ (id)attributionForAnnotatedItemList:(id)a3 placeData:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__37;
  v17 = __Block_byref_object_dispose__37;
  id v18 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __79__GEOPDAttribution_PlaceDataExtras__attributionForAnnotatedItemList_placeData___block_invoke;
  v10[3] = &unk_1E53E18A8;
  id v7 = v5;
  id v11 = v7;
  v12 = &v13;
  [v6 enumerateComponentOfType:57 enumerationOptions:1 usingBlock:v10];
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v8;
}

void __79__GEOPDAttribution_PlaceDataExtras__attributionForAnnotatedItemList_placeData___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = -[GEOPDComponent values](v5);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = -[GEOPDComponentValue annotatedItemList](*(id **)(*((void *)&v16 + 1) + 8 * v10));
        int v12 = objc_msgSend(v11, "isEqual:", *(void *)(a1 + 32), (void)v16);

        if (v12)
        {
          uint64_t v13 = -[GEOPDComponent attribution](v5);
          uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
          uint64_t v15 = *(void **)(v14 + 40);
          *(void *)(v14 + 40) = v13;

          *a3 = 1;
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
}

- (GEOPDAttribution)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDAttribution;
  id v3 = [(GEOPDAttribution *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)setVendorId:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 76) |= 0x20u;
  *(unsigned char *)(a1 + 76) |= 0x40u;
  objc_storeStrong((id *)(a1 + 56), a2);
}

- (void)setExternalItemId:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 76) |= 0x10u;
  *(unsigned char *)(a1 + 76) |= 0x40u;
  objc_storeStrong((id *)(a1 + 48), a2);
}

- (void)setExternalComponentId:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 76) |= 8u;
  *(unsigned char *)(a1 + 76) |= 0x40u;
  objc_storeStrong((id *)(a1 + 40), a2);
}

- (void)addAttributionUrl:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDAttribution _readAttributionUrls](a1);
    -[GEOPDAttribution _addNoFlagsAttributionUrl:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 76) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    *(unsigned char *)(a1 + 76) |= 0x40u;
  }
}

- (void)setActionUrlComponent:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 76) |= 2u;
  *(unsigned char *)(a1 + 76) |= 0x40u;
  objc_storeStrong((id *)(a1 + 24), a2);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDAttribution;
  id v4 = [(GEOPDAttribution *)&v8 description];
  id v5 = [(GEOPDAttribution *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAttribution _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDAttribution readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = -[GEOPDAttribution vendorId]((id *)a1);
    if (v5)
    {
      if (a2) {
        id v6 = @"vendorId";
      }
      else {
        id v6 = @"vendor_id";
      }
      [v4 setObject:v5 forKey:v6];
    }

    objc_super v7 = -[GEOPDAttribution externalItemId]((id *)a1);
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"externalItemId";
      }
      else {
        objc_super v8 = @"external_item_id";
      }
      [v4 setObject:v7 forKey:v8];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 8) == 0)
    {
      uint64_t v9 = *(void **)(a1 + 8);
      if (v9)
      {
        id v10 = v9;
        objc_sync_enter(v10);
        GEOPDAttributionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readExternalComponentId_tags);
        objc_sync_exit(v10);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    id v11 = *(id *)(a1 + 40);
    if (v11)
    {
      if (a2) {
        int v12 = @"externalComponentId";
      }
      else {
        int v12 = @"external_component_id";
      }
      [v4 setObject:v11 forKey:v12];
    }

    if (*(void *)(a1 + 32))
    {
      uint64_t v13 = -[GEOPDAttribution attributionUrls]((id *)a1);
      if (a2) {
        uint64_t v14 = @"attributionUrl";
      }
      else {
        uint64_t v14 = @"attribution_url";
      }
      [v4 setObject:v13 forKey:v14];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 2) == 0)
    {
      uint64_t v15 = *(void **)(a1 + 8);
      if (v15)
      {
        id v16 = v15;
        objc_sync_enter(v16);
        GEOPDAttributionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readActionUrlComponent_tags);
        objc_sync_exit(v16);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    id v17 = *(id *)(a1 + 24);
    if (v17)
    {
      if (a2) {
        long long v18 = @"actionUrlComponent";
      }
      else {
        long long v18 = @"action_url_component";
      }
      [v4 setObject:v17 forKey:v18];
    }

    long long v19 = *(void **)(a1 + 16);
    if (v19)
    {
      v20 = [v19 dictionaryRepresentation];
      uint64_t v21 = v20;
      if (a2)
      {
        v22 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v20, "count"));
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __46__GEOPDAttribution__dictionaryRepresentation___block_invoke;
        v26[3] = &unk_1E53D8860;
        id v23 = v22;
        id v27 = v23;
        [v21 enumerateKeysAndObjectsUsingBlock:v26];
        id v24 = v23;

        uint64_t v21 = v24;
      }
      [v4 setObject:v21 forKey:@"Unknown Fields"];
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
  return -[GEOPDAttribution _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEOPDAttribution__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
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

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = [a1 init];
  if (v6)
  {
    if (a3) {
      objc_super v7 = @"vendorId";
    }
    else {
      objc_super v7 = @"vendor_id";
    }
    objc_super v8 = [v5 objectForKeyedSubscript:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = (void *)[v8 copy];
      -[GEOPDAttribution setVendorId:](v6, v9);
    }
    if (a3) {
      id v10 = @"externalItemId";
    }
    else {
      id v10 = @"external_item_id";
    }
    id v11 = [v5 objectForKeyedSubscript:v10];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v12 = (void *)[v11 copy];
      -[GEOPDAttribution setExternalItemId:](v6, v12);
    }
    if (a3) {
      uint64_t v13 = @"externalComponentId";
    }
    else {
      uint64_t v13 = @"external_component_id";
    }
    uint64_t v14 = [v5 objectForKeyedSubscript:v13];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = (void *)[v14 copy];
      -[GEOPDAttribution setExternalComponentId:](v6, v15);
    }
    if (a3) {
      id v16 = @"attributionUrl";
    }
    else {
      id v16 = @"attribution_url";
    }
    id v17 = [v5 objectForKeyedSubscript:v16];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v18 = v17;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v30;
        do
        {
          uint64_t v22 = 0;
          do
          {
            if (*(void *)v30 != v21) {
              objc_enumerationMutation(v18);
            }
            id v23 = *(void **)(*((void *)&v29 + 1) + 8 * v22);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v24 = objc_msgSend(v23, "copy", (void)v29);
              -[GEOPDAttribution addAttributionUrl:](v6, v24);
            }
            ++v22;
          }
          while (v20 != v22);
          uint64_t v20 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
        }
        while (v20);
      }
    }
    if (a3) {
      v25 = @"actionUrlComponent";
    }
    else {
      v25 = @"action_url_component";
    }
    v26 = objc_msgSend(v5, "objectForKeyedSubscript:", v25, (void)v29);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v27 = (void *)[v26 copy];
      -[GEOPDAttribution setActionUrlComponent:](v6, v27);
    }
  }

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDAttributionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x7E) == 0))
  {
    id v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDAttribution readAll:]((uint64_t)self, 0);
    if (self->_vendorId) {
      PBDataWriterWriteStringField();
    }
    if (self->_externalItemId) {
      PBDataWriterWriteStringField();
    }
    if (self->_externalComponentId) {
      PBDataWriterWriteStringField();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v6 = self->_attributionUrls;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteStringField();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    if (self->_actionUrlComponent) {
      PBDataWriterWriteStringField();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
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
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x40) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDAttributionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDAttribution readAll:]((uint64_t)self, 0);
  uint64_t v8 = [(NSString *)self->_vendorId copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v8;

  uint64_t v10 = [(NSString *)self->_externalItemId copyWithZone:a3];
  id v11 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v10;

  uint64_t v12 = [(NSString *)self->_externalComponentId copyWithZone:a3];
  long long v13 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v12;

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v14 = self->_attributionUrls;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v23;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v14);
        }
        id v18 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * v17), "copyWithZone:", a3, (void)v22);
        -[GEOPDAttribution addAttributionUrl:](v5, v18);

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v15);
  }

  uint64_t v19 = [(NSString *)self->_actionUrlComponent copyWithZone:a3];
  uint64_t v20 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v19;

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPDAttribution readAll:]((uint64_t)self, 1),
         -[GEOPDAttribution readAll:]((uint64_t)v4, 1),
         vendorId = self->_vendorId,
         !((unint64_t)vendorId | v4[7]))
     || -[NSString isEqual:](vendorId, "isEqual:"))
    && ((externalItemId = self->_externalItemId, !((unint64_t)externalItemId | v4[6]))
     || -[NSString isEqual:](externalItemId, "isEqual:"))
    && ((externalComponentId = self->_externalComponentId, !((unint64_t)externalComponentId | v4[5]))
     || -[NSString isEqual:](externalComponentId, "isEqual:"))
    && ((attributionUrls = self->_attributionUrls, !((unint64_t)attributionUrls | v4[4]))
     || -[NSMutableArray isEqual:](attributionUrls, "isEqual:")))
  {
    actionUrlComponent = self->_actionUrlComponent;
    if ((unint64_t)actionUrlComponent | v4[3]) {
      char v10 = -[NSString isEqual:](actionUrlComponent, "isEqual:");
    }
    else {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  -[GEOPDAttribution readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_vendorId hash];
  NSUInteger v4 = [(NSString *)self->_externalItemId hash] ^ v3;
  NSUInteger v5 = v4 ^ [(NSString *)self->_externalComponentId hash];
  uint64_t v6 = [(NSMutableArray *)self->_attributionUrls hash];
  return v5 ^ v6 ^ [(NSString *)self->_actionUrlComponent hash];
}

- (void)mergeFrom:(uint64_t)a1
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    -[GEOPDAttribution readAll:]((uint64_t)v3, 0);
    NSUInteger v5 = (void *)*((void *)v4 + 7);
    if (v5) {
      -[GEOPDAttribution setVendorId:](a1, v5);
    }
    uint64_t v6 = (void *)*((void *)v4 + 6);
    if (v6) {
      -[GEOPDAttribution setExternalItemId:](a1, v6);
    }
    uint64_t v7 = (void *)*((void *)v4 + 5);
    if (v7) {
      -[GEOPDAttribution setExternalComponentId:](a1, v7);
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = *((id *)v4 + 4);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          -[GEOPDAttribution addAttributionUrl:](a1, *(void **)(*((void *)&v14 + 1) + 8 * v12++));
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }

    long long v13 = (void *)*((void *)v4 + 3);
    if (v13) {
      -[GEOPDAttribution setActionUrlComponent:](a1, v13);
    }
  }
}

- (void)clearUnknownFields:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 76) |= 1u;
    *(unsigned char *)(a1 + 76) |= 0x40u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    id v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDAttribution readAll:](a1, 0);
    }
  }
}

@end