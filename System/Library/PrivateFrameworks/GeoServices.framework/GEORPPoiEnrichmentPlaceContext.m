@interface GEORPPoiEnrichmentPlaceContext
+ (BOOL)isValid:(id)a3;
+ (Class)entityNameType;
+ (Class)localizedAddressType;
+ (id)buildPlaceContextWithPlaceData:(id)a3;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasMapsCategoryId;
- (BOOL)hasPlaceCenter;
- (BOOL)hasPlaceId;
- (BOOL)hasWalletCategoryId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLatLng)placeCenter;
- (GEOPDMapsIdentifier)placeId;
- (GEORPPoiEnrichmentPlaceContext)init;
- (GEORPPoiEnrichmentPlaceContext)initWithData:(id)a3;
- (GEORPPoiEnrichmentPlaceContext)initWithDictionary:(id)a3;
- (GEORPPoiEnrichmentPlaceContext)initWithJSON:(id)a3;
- (NSMutableArray)entityNames;
- (NSMutableArray)localizedAddress;
- (NSString)mapsCategoryId;
- (NSString)walletCategoryId;
- (id)_dictionaryRepresentation:(id *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)entityNameAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)localizedAddressAtIndex:(unint64_t)a3;
- (unint64_t)entityNamesCount;
- (unint64_t)hash;
- (unint64_t)localizedAddressCount;
- (unint64_t)muid;
- (void)_addNoFlagsEntityName:(uint64_t)a1;
- (void)_addNoFlagsLocalizedAddress:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readEntityNames;
- (void)_readLocalizedAddress;
- (void)_readMapsCategoryId;
- (void)_readPlaceCenter;
- (void)_readPlaceId;
- (void)_readWalletCategoryId;
- (void)addEntityName:(id)a3;
- (void)addLocalizedAddress:(id)a3;
- (void)clearEntityNames;
- (void)clearLocalizedAddress;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setEntityNames:(id)a3;
- (void)setLocalizedAddress:(id)a3;
- (void)setMapsCategoryId:(id)a3;
- (void)setPlaceCenter:(id)a3;
- (void)setPlaceId:(id)a3;
- (void)setWalletCategoryId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPPoiEnrichmentPlaceContext

- (GEORPPoiEnrichmentPlaceContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPPoiEnrichmentPlaceContext;
  v2 = [(GEORPPoiEnrichmentPlaceContext *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPPoiEnrichmentPlaceContext)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPPoiEnrichmentPlaceContext;
  v3 = [(GEORPPoiEnrichmentPlaceContext *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readPlaceId
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
        GEORPPoiEnrichmentPlaceContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceId_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasPlaceId
{
  return self->_placeId != 0;
}

- (GEOPDMapsIdentifier)placeId
{
  -[GEORPPoiEnrichmentPlaceContext _readPlaceId]((uint64_t)self);
  placeId = self->_placeId;

  return placeId;
}

- (void)setPlaceId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_placeId, a3);
}

- (void)_readEntityNames
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPPoiEnrichmentPlaceContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEntityNames_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)entityNames
{
  -[GEORPPoiEnrichmentPlaceContext _readEntityNames]((uint64_t)self);
  entityNames = self->_entityNames;

  return entityNames;
}

- (void)setEntityNames:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  entityNames = self->_entityNames;
  self->_entityNames = v4;
}

- (void)clearEntityNames
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  entityNames = self->_entityNames;

  [(NSMutableArray *)entityNames removeAllObjects];
}

- (void)addEntityName:(id)a3
{
  id v4 = a3;
  -[GEORPPoiEnrichmentPlaceContext _readEntityNames]((uint64_t)self);
  -[GEORPPoiEnrichmentPlaceContext _addNoFlagsEntityName:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
}

- (void)_addNoFlagsEntityName:(uint64_t)a1
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

- (unint64_t)entityNamesCount
{
  -[GEORPPoiEnrichmentPlaceContext _readEntityNames]((uint64_t)self);
  entityNames = self->_entityNames;

  return [(NSMutableArray *)entityNames count];
}

- (id)entityNameAtIndex:(unint64_t)a3
{
  -[GEORPPoiEnrichmentPlaceContext _readEntityNames]((uint64_t)self);
  entityNames = self->_entityNames;

  return (id)[(NSMutableArray *)entityNames objectAtIndex:a3];
}

+ (Class)entityNameType
{
  return (Class)objc_opt_class();
}

- (void)_readMapsCategoryId
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
        GEORPPoiEnrichmentPlaceContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapsCategoryId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasMapsCategoryId
{
  return self->_mapsCategoryId != 0;
}

- (NSString)mapsCategoryId
{
  -[GEORPPoiEnrichmentPlaceContext _readMapsCategoryId]((uint64_t)self);
  mapsCategoryId = self->_mapsCategoryId;

  return mapsCategoryId;
}

- (void)setMapsCategoryId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x44u;
  objc_storeStrong((id *)&self->_mapsCategoryId, a3);
}

- (void)_readWalletCategoryId
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
        GEORPPoiEnrichmentPlaceContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWalletCategoryId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasWalletCategoryId
{
  return self->_walletCategoryId != 0;
}

- (NSString)walletCategoryId
{
  -[GEORPPoiEnrichmentPlaceContext _readWalletCategoryId]((uint64_t)self);
  walletCategoryId = self->_walletCategoryId;

  return walletCategoryId;
}

- (void)setWalletCategoryId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_walletCategoryId, a3);
}

- (void)_readLocalizedAddress
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPPoiEnrichmentPlaceContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocalizedAddress_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)localizedAddress
{
  -[GEORPPoiEnrichmentPlaceContext _readLocalizedAddress]((uint64_t)self);
  localizedAddress = self->_localizedAddress;

  return localizedAddress;
}

- (void)setLocalizedAddress:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  localizedAddress = self->_localizedAddress;
  self->_localizedAddress = v4;
}

- (void)clearLocalizedAddress
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  localizedAddress = self->_localizedAddress;

  [(NSMutableArray *)localizedAddress removeAllObjects];
}

- (void)addLocalizedAddress:(id)a3
{
  id v4 = a3;
  -[GEORPPoiEnrichmentPlaceContext _readLocalizedAddress]((uint64_t)self);
  -[GEORPPoiEnrichmentPlaceContext _addNoFlagsLocalizedAddress:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
}

- (void)_addNoFlagsLocalizedAddress:(uint64_t)a1
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

- (unint64_t)localizedAddressCount
{
  -[GEORPPoiEnrichmentPlaceContext _readLocalizedAddress]((uint64_t)self);
  localizedAddress = self->_localizedAddress;

  return [(NSMutableArray *)localizedAddress count];
}

- (id)localizedAddressAtIndex:(unint64_t)a3
{
  -[GEORPPoiEnrichmentPlaceContext _readLocalizedAddress]((uint64_t)self);
  localizedAddress = self->_localizedAddress;

  return (id)[(NSMutableArray *)localizedAddress objectAtIndex:a3];
}

+ (Class)localizedAddressType
{
  return (Class)objc_opt_class();
}

- (void)_readPlaceCenter
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPPoiEnrichmentPlaceContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceCenter_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasPlaceCenter
{
  return self->_placeCenter != 0;
}

- (GEOLatLng)placeCenter
{
  -[GEORPPoiEnrichmentPlaceContext _readPlaceCenter]((uint64_t)self);
  placeCenter = self->_placeCenter;

  return placeCenter;
}

- (void)setPlaceCenter:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x48u;
  objc_storeStrong((id *)&self->_placeCenter, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPPoiEnrichmentPlaceContext;
  id v4 = [(GEORPPoiEnrichmentPlaceContext *)&v8 description];
  id v5 = [(GEORPPoiEnrichmentPlaceContext *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPPoiEnrichmentPlaceContext _dictionaryRepresentation:]((id *)&self->super.super.isa, 0);
}

- (id)_dictionaryRepresentation:(id *)a1
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [a1 placeId];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        id v7 = [v5 jsonRepresentation];
        objc_super v8 = @"placeId";
      }
      else
      {
        id v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"place_id";
      }
      [v4 setObject:v7 forKey:v8];
    }
    if ([a1[2] count])
    {
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[2], "count"));
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v10 = a1[2];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v40 objects:v45 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v41 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v40 + 1) + 8 * i);
            if (a2) {
              [v15 jsonRepresentation];
            }
            else {
            v16 = [v15 dictionaryRepresentation];
            }
            [v9 addObject:v16];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v40 objects:v45 count:16];
        }
        while (v12);
      }

      if (a2) {
        v17 = @"entityName";
      }
      else {
        v17 = @"entity_name";
      }
      [v4 setObject:v9 forKey:v17];
    }
    v18 = [a1 mapsCategoryId];
    if (v18)
    {
      if (a2) {
        v19 = @"mapsCategoryId";
      }
      else {
        v19 = @"maps_category_id";
      }
      [v4 setObject:v18 forKey:v19];
    }

    v20 = [a1 walletCategoryId];
    if (v20)
    {
      if (a2) {
        v21 = @"walletCategoryId";
      }
      else {
        v21 = @"wallet_category_id";
      }
      [v4 setObject:v20 forKey:v21];
    }

    if ([a1[3] count])
    {
      v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[3], "count"));
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v23 = a1[3];
      uint64_t v24 = [v23 countByEnumeratingWithState:&v36 objects:v44 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v37;
        do
        {
          for (uint64_t j = 0; j != v25; ++j)
          {
            if (*(void *)v37 != v26) {
              objc_enumerationMutation(v23);
            }
            v28 = *(void **)(*((void *)&v36 + 1) + 8 * j);
            if (a2) {
              [v28 jsonRepresentation];
            }
            else {
            v29 = objc_msgSend(v28, "dictionaryRepresentation", (void)v36);
            }
            objc_msgSend(v22, "addObject:", v29, (void)v36);
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v36 objects:v44 count:16];
        }
        while (v25);
      }

      if (a2) {
        v30 = @"localizedAddress";
      }
      else {
        v30 = @"localized_address";
      }
      objc_msgSend(v4, "setObject:forKey:", v22, v30, (void)v36);
    }
    v31 = [a1 placeCenter];
    v32 = v31;
    if (v31)
    {
      if (a2)
      {
        v33 = [v31 jsonRepresentation];
        v34 = @"placeCenter";
      }
      else
      {
        v33 = [v31 dictionaryRepresentation];
        v34 = @"place_center";
      }
      [v4 setObject:v33 forKey:v34];
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
  return -[GEORPPoiEnrichmentPlaceContext _dictionaryRepresentation:]((id *)&self->super.super.isa, 1);
}

- (GEORPPoiEnrichmentPlaceContext)initWithDictionary:(id)a3
{
  return (GEORPPoiEnrichmentPlaceContext *)-[GEORPPoiEnrichmentPlaceContext _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"placeId";
      }
      else {
        objc_super v6 = @"place_id";
      }
      id v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOPDMapsIdentifier alloc];
        if (a3) {
          uint64_t v9 = [(GEOPDMapsIdentifier *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOPDMapsIdentifier *)v8 initWithDictionary:v7];
        }
        id v10 = (void *)v9;
        [a1 setPlaceId:v9];
      }
      if (a3) {
        uint64_t v11 = @"entityName";
      }
      else {
        uint64_t v11 = @"entity_name";
      }
      uint64_t v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      id v45 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        id v13 = v12;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v50 objects:v55 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v51;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v51 != v16) {
                objc_enumerationMutation(v13);
              }
              uint64_t v18 = *(void *)(*((void *)&v50 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v19 = [GEOLocalizedString alloc];
                if (a3) {
                  uint64_t v20 = [(GEOLocalizedString *)v19 initWithJSON:v18];
                }
                else {
                  uint64_t v20 = [(GEOLocalizedString *)v19 initWithDictionary:v18];
                }
                v21 = (void *)v20;
                [a1 addEntityName:v20];
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v50 objects:v55 count:16];
          }
          while (v15);
        }

        id v5 = v45;
      }

      if (a3) {
        v22 = @"mapsCategoryId";
      }
      else {
        v22 = @"maps_category_id";
      }
      id v23 = [v5 objectForKeyedSubscript:v22];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v24 = (void *)[v23 copy];
        [a1 setMapsCategoryId:v24];
      }
      if (a3) {
        uint64_t v25 = @"walletCategoryId";
      }
      else {
        uint64_t v25 = @"wallet_category_id";
      }
      uint64_t v26 = [v5 objectForKeyedSubscript:v25];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v27 = (void *)[v26 copy];
        [a1 setWalletCategoryId:v27];
      }
      if (a3) {
        v28 = @"localizedAddress";
      }
      else {
        v28 = @"localized_address";
      }
      v29 = [v5 objectForKeyedSubscript:v28];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        id v30 = v29;
        uint64_t v31 = [v30 countByEnumeratingWithState:&v46 objects:v54 count:16];
        if (v31)
        {
          uint64_t v32 = v31;
          uint64_t v33 = *(void *)v47;
          do
          {
            uint64_t v34 = 0;
            do
            {
              if (*(void *)v47 != v33) {
                objc_enumerationMutation(v30);
              }
              v35 = *(void **)(*((void *)&v46 + 1) + 8 * v34);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v36 = [GEOPDLocalizedAddress alloc];
                if (v36) {
                  long long v37 = -[GEOPDLocalizedAddress _initWithDictionary:isJSON:](v36, v35, a3);
                }
                else {
                  long long v37 = 0;
                }
                [a1 addLocalizedAddress:v37];
              }
              ++v34;
            }
            while (v32 != v34);
            uint64_t v38 = [v30 countByEnumeratingWithState:&v46 objects:v54 count:16];
            uint64_t v32 = v38;
          }
          while (v38);
        }

        id v5 = v45;
      }

      if (a3) {
        long long v39 = @"placeCenter";
      }
      else {
        long long v39 = @"place_center";
      }
      long long v40 = [v5 objectForKeyedSubscript:v39];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v41 = [GEOLatLng alloc];
        if (a3) {
          uint64_t v42 = [(GEOLatLng *)v41 initWithJSON:v40];
        }
        else {
          uint64_t v42 = [(GEOLatLng *)v41 initWithDictionary:v40];
        }
        long long v43 = (void *)v42;
        [a1 setPlaceCenter:v42];
      }
    }
  }

  return a1;
}

- (GEORPPoiEnrichmentPlaceContext)initWithJSON:(id)a3
{
  return (GEORPPoiEnrichmentPlaceContext *)-[GEORPPoiEnrichmentPlaceContext _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_251_0;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_252_0;
    }
    GEORPPoiEnrichmentPlaceContextReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORPPoiEnrichmentPlaceContextCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPPoiEnrichmentPlaceContextIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPPoiEnrichmentPlaceContextReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPPoiEnrichmentPlaceContextIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v14 = self->_reader;
    objc_sync_enter(v14);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v15 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v15];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v14);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPPoiEnrichmentPlaceContext *)self readAll:0];
    if (self->_placeId) {
      PBDataWriterWriteSubmessage();
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    objc_super v6 = self->_entityNames;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v7);
    }

    if (self->_mapsCategoryId) {
      PBDataWriterWriteStringField();
    }
    if (self->_walletCategoryId) {
      PBDataWriterWriteStringField();
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v10 = self->_localizedAddress;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v11);
    }

    if (self->_placeCenter) {
      PBDataWriterWriteSubmessage();
    }
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEORPPoiEnrichmentPlaceContext _readPlaceCenter]((uint64_t)self);
  if ([(GEOLatLng *)self->_placeCenter hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPPoiEnrichmentPlaceContext _readPlaceId]((uint64_t)self);
  placeId = self->_placeId;

  return [(GEOPDMapsIdentifier *)placeId hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  uint64_t v12 = (id *)a3;
  [(GEORPPoiEnrichmentPlaceContext *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 16) = self->_readerMarkPos;
  *((_DWORD *)v12 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_placeId) {
    objc_msgSend(v12, "setPlaceId:");
  }
  if ([(GEORPPoiEnrichmentPlaceContext *)self entityNamesCount])
  {
    [v12 clearEntityNames];
    unint64_t v4 = [(GEORPPoiEnrichmentPlaceContext *)self entityNamesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEORPPoiEnrichmentPlaceContext *)self entityNameAtIndex:i];
        [v12 addEntityName:v7];
      }
    }
  }
  if (self->_mapsCategoryId) {
    objc_msgSend(v12, "setMapsCategoryId:");
  }
  if (self->_walletCategoryId) {
    objc_msgSend(v12, "setWalletCategoryId:");
  }
  if ([(GEORPPoiEnrichmentPlaceContext *)self localizedAddressCount])
  {
    [v12 clearLocalizedAddress];
    unint64_t v8 = [(GEORPPoiEnrichmentPlaceContext *)self localizedAddressCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEORPPoiEnrichmentPlaceContext *)self localizedAddressAtIndex:j];
        [v12 addLocalizedAddress:v11];
      }
    }
  }
  if (self->_placeCenter) {
    objc_msgSend(v12, "setPlaceCenter:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
      GEORPPoiEnrichmentPlaceContextReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPPoiEnrichmentPlaceContext *)self readAll:0];
  id v8 = [(GEOPDMapsIdentifier *)self->_placeId copyWithZone:a3];
  unint64_t v9 = (void *)v5[6];
  v5[6] = v8;

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v10 = self->_entityNames;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = (void *)[*(id *)(*((void *)&v31 + 1) + 8 * i) copyWithZone:a3];
        [v5 addEntityName:v14];
      }
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v11);
  }

  uint64_t v15 = [(NSString *)self->_mapsCategoryId copyWithZone:a3];
  long long v16 = (void *)v5[4];
  v5[4] = v15;

  uint64_t v17 = [(NSString *)self->_walletCategoryId copyWithZone:a3];
  long long v18 = (void *)v5[7];
  v5[7] = v17;

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v19 = self->_localizedAddress;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(v19);
        }
        long long v23 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * j), "copyWithZone:", a3, (void)v27);
        [v5 addLocalizedAddress:v23];
      }
      uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v20);
  }

  id v24 = [(GEOLatLng *)self->_placeCenter copyWithZone:a3];
  uint64_t v25 = (void *)v5[5];
  v5[5] = v24;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEORPPoiEnrichmentPlaceContext *)self readAll:1],
         [v4 readAll:1],
         placeId = self->_placeId,
         !((unint64_t)placeId | v4[6]))
     || -[GEOPDMapsIdentifier isEqual:](placeId, "isEqual:"))
    && ((entityNames = self->_entityNames, !((unint64_t)entityNames | v4[2]))
     || -[NSMutableArray isEqual:](entityNames, "isEqual:"))
    && ((mapsCategoryId = self->_mapsCategoryId, !((unint64_t)mapsCategoryId | v4[4]))
     || -[NSString isEqual:](mapsCategoryId, "isEqual:"))
    && ((walletCategoryId = self->_walletCategoryId, !((unint64_t)walletCategoryId | v4[7]))
     || -[NSString isEqual:](walletCategoryId, "isEqual:"))
    && ((localizedAddress = self->_localizedAddress, !((unint64_t)localizedAddress | v4[3]))
     || -[NSMutableArray isEqual:](localizedAddress, "isEqual:")))
  {
    placeCenter = self->_placeCenter;
    if ((unint64_t)placeCenter | v4[5]) {
      char v11 = -[GEOLatLng isEqual:](placeCenter, "isEqual:");
    }
    else {
      char v11 = 1;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  [(GEORPPoiEnrichmentPlaceContext *)self readAll:1];
  unint64_t v3 = [(GEOPDMapsIdentifier *)self->_placeId hash];
  uint64_t v4 = [(NSMutableArray *)self->_entityNames hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_mapsCategoryId hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_walletCategoryId hash];
  uint64_t v7 = [(NSMutableArray *)self->_localizedAddress hash];
  return v6 ^ v7 ^ [(GEOLatLng *)self->_placeCenter hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)a3;
  [v4 readAll:0];
  placeId = self->_placeId;
  id v6 = v4[6];
  if (placeId)
  {
    if (v6) {
      -[GEOPDMapsIdentifier mergeFrom:](placeId, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEORPPoiEnrichmentPlaceContext setPlaceId:](self, "setPlaceId:");
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = v4[2];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        [(GEORPPoiEnrichmentPlaceContext *)self addEntityName:*(void *)(*((void *)&v23 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v9);
  }

  if (v4[4]) {
    -[GEORPPoiEnrichmentPlaceContext setMapsCategoryId:](self, "setMapsCategoryId:");
  }
  if (v4[7]) {
    -[GEORPPoiEnrichmentPlaceContext setWalletCategoryId:](self, "setWalletCategoryId:");
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = v4[3];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        -[GEORPPoiEnrichmentPlaceContext addLocalizedAddress:](self, "addLocalizedAddress:", *(void *)(*((void *)&v19 + 1) + 8 * j), (void)v19);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }

  placeCenter = self->_placeCenter;
  id v18 = v4[5];
  if (placeCenter)
  {
    if (v18) {
      -[GEOLatLng mergeFrom:](placeCenter, "mergeFrom:");
    }
  }
  else if (v18)
  {
    -[GEORPPoiEnrichmentPlaceContext setPlaceCenter:](self, "setPlaceCenter:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walletCategoryId, 0);
  objc_storeStrong((id *)&self->_placeId, 0);
  objc_storeStrong((id *)&self->_placeCenter, 0);
  objc_storeStrong((id *)&self->_mapsCategoryId, 0);
  objc_storeStrong((id *)&self->_localizedAddress, 0);
  objc_storeStrong((id *)&self->_entityNames, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

+ (id)buildPlaceContextWithPlaceData:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = objc_alloc_init(GEORPPoiEnrichmentPlaceContext);
    NSUInteger v5 = +[GEOPDEntity entityForPlaceData:v3];
    id v6 = [v3 mapsId];
    [(GEORPPoiEnrichmentPlaceContext *)v4 setPlaceId:v6];

    id v7 = [v5 names];
    [(GEORPPoiEnrichmentPlaceContext *)v4 setEntityNames:v7];

    uint64_t v8 = [v5 mapsCategoryId];
    [(GEORPPoiEnrichmentPlaceContext *)v4 setMapsCategoryId:v8];

    uint64_t v9 = [v5 walletCategoryId];
    [(GEORPPoiEnrichmentPlaceContext *)v4 setWalletCategoryId:v9];

    uint64_t v10 = +[GEOPDPlaceInfo placeInfoForPlaceData:v3];
    char v11 = -[GEOPDPlaceInfo center](v10);
    [(GEORPPoiEnrichmentPlaceContext *)v4 setPlaceCenter:v11];

    id v12 = +[GEOAddressObject addressObjectForPlaceData:v3];
    if (v12)
    {
      uint64_t v13 = objc_alloc_init(GEOPDLocalizedAddress);
      uint64_t v14 = [v12 address];
      -[GEOPDLocalizedAddress setAddress:]((uint64_t)v13, v14);

      uint64_t v15 = [v12 displayLanguage];
      -[GEOPDLocalizedAddress setLanguage:]((uint64_t)v13, v15);

      [(GEORPPoiEnrichmentPlaceContext *)v4 addLocalizedAddress:v13];
    }
    else
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __83__GEORPPoiEnrichmentPlaceContext_GEORPProtoExtras__buildPlaceContextWithPlaceData___block_invoke;
      v17[3] = &unk_1E53E1880;
      id v18 = v4;
      [v3 enumerateValidComponentWithValuesOfType:5 usingBlock:v17];
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: placeData != ((void *)0)", buf, 2u);
    }
    uint64_t v4 = 0;
  }

  return v4;
}

void __83__GEORPPoiEnrichmentPlaceContext_GEORPProtoExtras__buildPlaceContextWithPlaceData___block_invoke(uint64_t a1, id *a2, unsigned char *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  NSUInteger v5 = -[GEOPDComponent values](a2);
  id v6 = [v5 firstObject];

  if (v6)
  {
    id v7 = (id *)v6[7];
    if (v7)
    {
      uint64_t v8 = v7;
      -[GEOPDAddress _readLocalizedAddress]((uint64_t)v7);
      uint64_t v9 = [v8[3] count];

      if (v9)
      {
        long long v18 = 0u;
        long long v19 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        uint64_t v10 = (id *)v6[7];
        char v11 = -[GEOPDAddress localizedAddress](v10);

        uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v17;
          do
          {
            uint64_t v15 = 0;
            do
            {
              if (*(void *)v17 != v14) {
                objc_enumerationMutation(v11);
              }
              objc_msgSend(*(id *)(a1 + 32), "addLocalizedAddress:", *(void *)(*((void *)&v16 + 1) + 8 * v15++), (void)v16);
            }
            while (v13 != v15);
            uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
          }
          while (v13);
        }

        *a3 = 1;
      }
    }
  }
}

- (unint64_t)muid
{
  v2 = [(GEORPPoiEnrichmentPlaceContext *)self placeId];
  id v3 = [v2 shardedId];
  unint64_t v4 = [v3 muid];

  return v4;
}

@end